SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code := '101';
SET @activity_cost := '60';
SET @preg_name = concat('%', 'preg' '%');
SET @icd10set = 'z320,z321';
-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)
SELECT cid,
pname,
fname,
lname,
activity_code,
activity_cost,
date_serv,
h_sub
FROM ((SELECT person.cid,
        person.pname,
        person.fname,
        person.lname,
        cast(@activity_code AS CHAR)                  AS activity_code,
        cast(@activity_cost AS CHAR)                  AS activity_cost,
        date_format(opitemrece.vstdate, '%Y-%m-%d')   AS date_serv,
        @h_sub                                        AS h_sub
        FROM opitemrece
        INNER JOIN person ON opitemrece.hn = person.patient_hn
        LEFT OUTER JOIN village
        ON person.village_id = village.village_id
        LEFT OUTER JOIN house ON person.house_id = house.house_id
        LEFT OUTER JOIN nondrugitems
        ON opitemrece.icode = nondrugitems.icode
        LEFT OUTER JOIN ovstdiag ON opitemrece.vn = ovstdiag.vn
        WHERE     person.sex = 2
        AND person.death <> 'y'
        AND (   nondrugitems.NAME LIKE @preg_name
        AND find_in_set(ovstdiag.icd10, @icd10set))
        AND opitemrece.vstdate BETWEEN @start_date AND @stop_date
        AND person.nationality = 99
        GROUP BY person.cid
    ORDER BY opitemrece.vstdate)
    UNION ALL
    (SELECT person.cid,
        person.pname,
        person.fname,
        person.lname,
        cast(@activity_code AS CHAR)                  AS activity_code,
        cast(@activity_cost AS CHAR)                  AS activity_cost,
        date_format(opitemrece.vstdate, '%Y-%m-%d')   AS date_serv,
        @h_sub                                        AS h_sub
        FROM opitemrece
        INNER JOIN person ON opitemrece.hn = person.patient_hn
        LEFT OUTER JOIN village
        ON person.village_id = village.village_id
        LEFT OUTER JOIN house ON person.house_id = house.house_id
        LEFT OUTER JOIN drugitems
        ON opitemrece.icode = drugitems.icode
        LEFT OUTER JOIN ovstdiag ON opitemrece.vn = ovstdiag.vn
        WHERE     person.sex = 2
        AND person.death <> 'y'
        AND (   drugitems.NAME LIKE @preg_name
        AND find_in_set(ovstdiag.icd10, @icd10set))
        AND opitemrece.vstdate BETWEEN @start_date AND @stop_date
        AND person.nationality = 99
        GROUP BY person.cid
ORDER BY opitemrece.vstdate)) AS temp_101
GROUP BY cid, activity_code, date_serv;
-- Fix [2022-05-10 08:34:23]