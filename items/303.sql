SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '303';
SET @activity_cost = '15';
SET @ferrous =
       '202030120137819920381422,100488000004203120381169,100489000004320121881267,100489000004320121881267,100488000004203121781674,100488000004203120381442,100488000004203120381013,100488000004203121781144,100488000004203120381053,100488000004203120381144,100488000004203120381271,100488000004203120381341,100488000004203120381626,100488000004203121881626,100488000004203121781144,100488000004203121881442,100488000004203121881553,100489000004192121881506,100489000004320120381122,100489000004320120381506,100489000004203120381555,100489000004203120381084,100489000004203120381144,100489000004203120381619,100489000004203120381477,100489000004203120381544,100489000004203120381546';

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
            AND timestampdiff(YEAR, person.birthdate, opitemrece.vstdate) BETWEEN 6
                                                                              AND 13
            AND person.nationality = 99
      GROUP BY person.cid
      HAVING sum(
                CASE
                   WHEN (FIND_IN_SET(LEFT(drugitems.did, 24), @ferrous) >=
                            1)
                   THEN
                      1
                   ELSE
                      0
                END) >= 1
      ORDER BY opitemrece.vstdate) AS temp_303;
-- Fix [2022-05-10 08:48:00]