SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '621';
SET @activity_cost = '150';
SET @icd10set = 'z124,z014';
SET @ppset = '1b30,1b40';

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
             cast(@activity_code AS CHAR)                 AS activity_code,
             cast(@activity_cost AS CHAR)                 AS activity_cost,
             max(date_format(ovst.vstdate, '%Y-%m-%d'))   AS date_serv,
             @h_sub                                       AS h_sub,
             IF(sum(
                   CASE
                      WHEN find_in_set(pp_special_type.pp_special_code,
                                       @ppset)
                      THEN
                         1
                      ELSE
                         0
                   END) >= 1,
                'y',
                'n')
                AS screen_brest,
             max(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code,
                                    @ppset)
                   THEN
                      pp_special_type_name
                   ELSE
                      NULL
                END)
                AS screen_brest_result,
             timestampdiff(YEAR, person.birthdate, ovst.vstdate)
                AS current_age,
             village.village_moo,
             village.village_name
      FROM ovst
           INNER JOIN pp_special ON ovst.vn = pp_special.vn
           INNER JOIN pp_special_type
              ON pp_special.pp_special_type_id =
                    pp_special_type.pp_special_type_id
           INNER JOIN person ON ovst.hn = person.patient_hn
           INNER JOIN ovstdiag ON ovst.vn = ovstdiag.vn
           INNER JOIN village ON person.village_id = village.village_id
      WHERE     ovst.vstdate BETWEEN @start_date AND @stop_date
            AND person.sex = 2
            AND person.nationality = 99
            AND person.house_regist_type_id IN (1,2,3,4)
            AND person.death <> 'y'
            AND person.death_date IS NULL
            AND timestampdiff(YEAR, person.birthdate, ovst.vstdate) BETWEEN 30
                                                                        AND 70
      GROUP BY person.cid
      HAVING     (IF(sum(
                        CASE
                           WHEN find_in_set(
                                   pp_special_type.pp_special_code,
                                   @ppset)
                           THEN
                              1
                           ELSE
                              0
                        END) >= 1,
                     1,
                     0)) >= 1
             AND (IF(sum(
                        CASE
                           WHEN find_in_set(LEFT(ovstdiag.icd10, 4),
                                            @icd10set)
                           THEN
                              1
                           ELSE
                              0
                        END) >= 1,
                     1,
                     0)) >= 1
      ORDER BY ovst.vstdate, person.cid) AS temp_621
GROUP BY temp_621.cid
ORDER BY temp_621.date_serv;
-- Fix [2022-05-10 09:06:04]