SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code := '212';
SET @activity_cost := '40';
SET @water_iron_set =
       '100497414002040330581606,100497414000800830582799,202030120087180130581617,202030120087180130581487,100489000000810330581267,100489000000950130581267,100489000000950730581109,100488000008634230481506,100488000001280130881602,100488000004203121781144,100488000001280130481618';

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT cid,
       pname,
       fname,
       lname,
       activity_code,
       activity_cost,
       date_serv,
       h_sub
FROM (SELECT person.cid,
             person.pname,
             person.fname,
             person.lname,
             cast(@activity_code AS CHAR)                  AS activity_code,
             cast(@activity_cost AS CHAR)                  AS activity_cost,
             date_format(opitemrece.vstdate, '%Y-%m-%d')   AS date_serv,
             @h_sub                                        AS h_sub,
             drugitems.did
      FROM opitemrece
           INNER JOIN person ON opitemrece.hn = person.patient_hn
           LEFT OUTER JOIN village
              ON person.village_id = village.village_id
           LEFT OUTER JOIN house ON person.house_id = house.house_id
           INNER JOIN drugitems ON opitemrece.icode = drugitems.icode
           INNER JOIN ovstdiag ON opitemrece.vn = ovstdiag.vn
      WHERE     person.sex IN (1, 2)
            AND person.death <> 'y'
            AND opitemrece.vstdate BETWEEN @start_date AND @stop_date
            AND timestampdiff(YEAR, person.birthdate, opitemrece.vstdate) BETWEEN 0
                                                                              AND 5
            AND person.nationality = 99
      GROUP BY person.cid
      HAVING sum(
                CASE
                   WHEN (FIND_IN_SET(LEFT(drugitems.did, 24),
                                     @water_iron_set) >= 1)
                   THEN
                      1
                   ELSE
                      0
                END) >= 1
      ORDER BY opitemrece.vstdate) AS temp_212;
      -- Fix [2022-05-10 08:44:28]