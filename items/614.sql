SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '614';
SET @activity_cost = '150';
SET @paraname = concat('ชื่อยาหรือรายการที่ต้องการ');
SET @icd10set = concat('z3', '%');

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
              @h_sub                                        AS h_sub,
              village.village_moo,
              village.village_name,
              house.address,
              house.road,
              nondrugitems.icode,
              nondrugitems.NAME                             AS paraname,
              ovstdiag.icd10                                AS diagcode
       FROM opitemrece
            INNER JOIN person ON opitemrece.hn = person.patient_hn
            LEFT OUTER JOIN village
               ON person.village_id = village.village_id
            LEFT OUTER JOIN house ON person.house_id = house.house_id
            INNER JOIN nondrugitems
               ON opitemrece.icode = nondrugitems.icode
            INNER JOIN ovstdiag ON opitemrece.vn = ovstdiag.vn
       WHERE     person.sex = 2
             AND find_in_set(nondrugitems.NAME, @paraname)
             AND opitemrece.vstdate BETWEEN @start_date AND @stop_date
             AND ovstdiag.icd10 LIKE @icd10set
             AND person.death <> 'y'
             AND person.death_date IS NULL
             AND person.nationality = 99
             AND TIMESTAMPDIFF(YEAR, person.birthdate, ovstdiag.vstdate) >
                    20
       GROUP BY person.cid, opitemrece.vstdate
       ORDER BY opitemrece.vstdate)
      UNION ALL
      (SELECT person.cid,
              person.pname,
              person.fname,
              person.lname,
              cast(@activity_code AS CHAR)                  AS activity_code,
              cast(@activity_cost AS CHAR)                  AS activity_cost,
              date_format(opitemrece.vstdate, '%Y-%m-%d')   AS date_serv,
              @h_sub                                        AS h_sub,
              village.village_moo,
              village.village_name,
              house.address,
              house.road,
              drugitems.icode,
              drugitems.NAME                                AS paraname,
              ovstdiag.icd10                                AS diagcode
       FROM opitemrece
            INNER JOIN person ON opitemrece.hn = person.patient_hn
            LEFT OUTER JOIN village
               ON person.village_id = village.village_id
            LEFT OUTER JOIN house ON person.house_id = house.house_id
            INNER JOIN drugitems ON opitemrece.icode = drugitems.icode
            INNER JOIN ovstdiag ON opitemrece.vn = ovstdiag.vn
       WHERE     person.sex = 2
             AND find_in_set(drugitems.NAME, @paraname)
             AND opitemrece.vstdate BETWEEN @start_date AND @stop_date
             AND ovstdiag.icd10 LIKE @icd10set
             AND person.death <> 'y'
             AND person.death_date IS NULL
             AND person.nationality = 99
             AND TIMESTAMPDIFF(YEAR, person.birthdate, ovstdiag.vstdate) >
                    20
       GROUP BY person.cid, opitemrece.vn
       ORDER BY opitemrece.vstdate)) AS temp_614;
-- Fix [2022-05-10 09:03:37]