SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '202';
SET @activity_cost = '15';
SET @curr = NULL;
SET @prev = NULL;
SET @rank = 0;

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT cid,
       pname,
       fname,
       lname,
       activity_code,
       activity_cost,
       date_serv,
       h_sub
FROM ((SELECT tt_epi.cid,
              tt_epi.pname,
              tt_epi.fname,
              tt_epi.lname,
              tt_epi.activity_code,
              tt_epi.activity_cost,
              tt_epi.date_serv,
              tt_epi.h_sub,
              tt_epi.current_age,
              tt_epi.quarter_year
       FROM (SELECT *,
                    @prev := @curr                               AS prev,
                    @curr := concat(t_epi.cid, t_epi.quarter_year)
                       AS curr,
                    @rank := IF(@prev = @curr, @rank + 1, 1)     AS rank
             FROM (SELECT person.cid,
                          person.pname,
                          person.fname,
                          person.lname,
                          cast(@activity_code AS CHAR)       AS activity_code,
                          cast(@activity_cost AS CHAR)       AS activity_cost,
                          date_format(
                             person_epi_nutrition.nutrition_date,
                             '%Y-%m-%d')
                             AS date_serv,
                          @h_sub                             AS h_sub,
                          timestampdiff(
                             YEAR,
                             person.birthdate,
                             person_epi_nutrition.nutrition_date)
                             AS current_age,
                          QUARTER(person_epi_nutrition.nutrition_date)
                             AS quarter_year
                   FROM person_epi_nutrition
                        INNER JOIN person_epi
                           ON person_epi_nutrition.person_epi_id =
                                 person_epi.person_epi_id
                        INNER JOIN person
                           ON person_epi.person_id = person.person_id
                   WHERE     person_epi_nutrition.nutrition_date BETWEEN @start_date
                                                                     AND @stop_date
                         AND person.nationality = 99
                         AND person.death <> 'y'
                         AND timestampdiff(
                                YEAR,
                                person.birthdate,
                                person_epi_nutrition.nutrition_date) BETWEEN 0
                                                                         AND 5
                         AND person_epi_nutrition.body_weight > 0
                         AND person_epi_nutrition.height > 0
                   GROUP BY person_epi_nutrition.person_epi_nutrition_id
                   ORDER BY person.cid ASC,
                            person_epi_nutrition.nutrition_date)
                  AS t_epi) AS tt_epi
       WHERE tt_epi.rank = 1)
      UNION ALL
      (SELECT tt_wbc.cid,
              tt_wbc.pname,
              tt_wbc.fname,
              tt_wbc.lname,
              tt_wbc.activity_code,
              tt_wbc.activity_cost,
              tt_wbc.date_serv,
              tt_wbc.h_sub,
              tt_wbc.current_age,
              tt_wbc.quarter_year
       FROM (SELECT *,
                    @prev := @curr                               AS prev,
                    @curr := concat(t_wbc.cid, t_wbc.quarter_year)
                       AS curr,
                    @rank := IF(@prev = @curr, @rank + 1, 1)     AS rank
             FROM (SELECT person.cid,
                          person.pname,
                          person.fname,
                          person.lname,
                          cast(@activity_code AS CHAR)       AS activity_code,
                          cast(@activity_cost AS CHAR)       AS activity_cost,
                          date_format(
                             person_wbc_nutrition.nutrition_date,
                             '%Y-%m-%d')
                             AS date_serv,
                          @h_sub                             AS h_sub,
                          timestampdiff(
                             YEAR,
                             person.birthdate,
                             person_wbc_nutrition.nutrition_date)
                             AS current_age,
                          QUARTER(person_wbc_nutrition.nutrition_date)
                             AS quarter_year
                   FROM person_wbc_nutrition
                        INNER JOIN person_wbc
                           ON person_wbc_nutrition.person_wbc_id =
                                 person_wbc.person_wbc_id
                        INNER JOIN person
                           ON person_wbc.person_id = person.person_id
                   WHERE     person_wbc_nutrition.nutrition_date BETWEEN @start_date
                                                                     AND @stop_date
                         AND person.nationality = 99
                         AND person.death <> 'y'
                         AND timestampdiff(
                                YEAR,
                                person.birthdate,
                                person_wbc_nutrition.nutrition_date) BETWEEN 0
                                                                         AND 5
                         AND person_wbc_nutrition.body_weight > 0
                         AND person_wbc_nutrition.height > 0
                   GROUP BY person_wbc_nutrition.person_wbc_nutrition_id
                   ORDER BY person.cid ASC,
                            person_wbc_nutrition.nutrition_date)
                  AS t_wbc) AS tt_wbc
       WHERE tt_wbc.rank = 1)
      UNION ALL
      (SELECT tt_person.cid,
              tt_person.pname,
              tt_person.fname,
              tt_person.lname,
              tt_person.activity_code,
              tt_person.activity_cost,
              tt_person.date_serv,
              tt_person.h_sub,
              tt_person.current_age,
              tt_person.quarter_year
       FROM (SELECT *,
                    @prev := @curr                               AS prev,
                    @curr := concat(t_person.cid, t_person.quarter_year)
                       AS curr,
                    @rank := IF(@prev = @curr, @rank + 1, 1)     AS rank
             FROM (SELECT person.cid,
                          person.pname,
                          person.fname,
                          person.lname,
                          cast(@activity_code AS CHAR)       AS activity_code,
                          cast(@activity_cost AS CHAR)       AS activity_cost,
                          date_format(opdscreen.vstdate, '%Y-%m-%d')
                             AS date_serv,
                          @h_sub                             AS h_sub,
                          timestampdiff(YEAR,
                                        person.birthdate,
                                        opdscreen.vstdate)
                             AS current_age,
                          QUARTER(opdscreen.vstdate)         AS quarter_year
                   FROM opdscreen
                        INNER JOIN person
                           ON opdscreen.hn = person.patient_hn
                   WHERE     opdscreen.vstdate BETWEEN @start_date
                                                   AND @stop_date
                         AND person.nationality = 99
                         AND person.death <> 'y'
                         AND timestampdiff(YEAR,
                                           person.birthdate,
                                           opdscreen.vstdate) BETWEEN 0
                                                                  AND 5
                         AND person.house_regist_type_id IN (1, 3)
                         AND (   opdscreen.height IS NOT NULL
                              OR opdscreen.height <> 0)
                         AND (   opdscreen.bw IS NOT NULL
                              OR opdscreen.height <> 0)
                   GROUP BY person.cid, opdscreen.vstdate
                   ORDER BY person.cid ASC, opdscreen.vstdate ASC)
                  AS t_person) AS tt_person
       WHERE tt_person.rank = 1)) AS a;
-- Fix [2022-05-10 08:38:33]