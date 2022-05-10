SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '801';
SET @activity_cost = '50';
SET @bdg_year = '2565';

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT person.cid,
       person.pname,
       person.fname,
       person.lname,
       cast(@activity_code AS char) AS activity_code,
       cast(@activity_cost AS char) AS activity_cost,
       date_format(
          min(date(person_dmht_screen_summary.last_screen_datetime)),
          '%Y-%m-%d')
          AS date_serv,
       @h_sub                       AS h_sub
FROM person_dmht_risk_screen_head
     INNER JOIN person_dmht_nhso_screen
        ON person_dmht_risk_screen_head.person_dmht_screen_summary_id =
              person_dmht_nhso_screen.person_dmht_screen_summary_id
     INNER JOIN person_dmht_screen_summary
        ON person_dmht_risk_screen_head.person_dmht_screen_summary_id =
              person_dmht_screen_summary.person_dmht_screen_summary_id
     INNER JOIN person
        ON person_dmht_screen_summary.person_id = person.person_id
WHERE     person_dmht_screen_summary.last_screen_datetime BETWEEN @start_date
                                                              AND @stop_date
      AND person_dmht_nhso_screen.present_drinking_alcohol IS NOT NULL
      AND person_dmht_nhso_screen.present_smoking IS NOT NULL
      AND person_dmht_risk_screen_head.body_height IS NOT NULL
      AND person_dmht_risk_screen_head.body_weight IS NOT NULL
      AND person_dmht_risk_screen_head.waist IS NOT NULL
      AND person_dmht_risk_screen_head.last_bps IS NOT NULL
      AND person_dmht_risk_screen_head.last_bpd IS NOT NULL
      AND timestampdiff(year,
                        person.birthdate,
                        person_dmht_screen_summary.last_screen_datetime) >=
             35
      AND person.house_regist_type_id IN (1, 3)
      AND person.sex IN (1, 2)
      AND person.death <> 'y'
      AND person.death_date IS NULL
      AND person.nationality = 99
      AND person_dmht_screen_summary.bdg_year = @bdg_year
      AND (   person_dmht_risk_screen_head.bmi >= 25
           OR person_dmht_risk_screen_head.last_bps >= 140
           OR person_dmht_risk_screen_head.last_bpd >= 90
           OR person_dmht_risk_screen_head.last_fgc >= 140
           OR person_dmht_risk_screen_head.last_fpg >= 140
           OR person_dmht_risk_screen_head.last_fgc_no_food_limit >= 140
           OR (person.sex = 1 AND person_dmht_risk_screen_head.waist >= 90)
           OR (person.sex = 2 AND person_dmht_risk_screen_head.waist >= 80)
           OR person_dmht_nhso_screen.family_parent_dm_disease = 'y'
           OR person_dmht_nhso_screen.family_relate_dm_disease = 'y'
           OR person_dmht_nhso_screen.history_deliver_over_4kg = 'y'
           OR person_dmht_nhso_screen.history_lipid_disease = 'y')
      AND person.cid NOT IN
             (SELECT cid
              FROM (-- person_chronic
                    SELECT cid,
                           max(
                              CASE
                                 WHEN left(person_chronic.icd10, 3) BETWEEN 'e10'
                                                                        AND 'e14'
                                 THEN
                                    1
                                 ELSE
                                    0
                              END)
                              AS dm,
                           max(
                              CASE
                                 WHEN left(person_chronic.icd10, 3) BETWEEN 'i10'
                                                                        AND 'i15'
                                 THEN
                                    1
                                 ELSE
                                    0
                              END)
                              AS ht
                    FROM person
                         LEFT OUTER JOIN person_chronic
                            ON person.person_id =
                                  person_chronic.person_id
                    GROUP BY person.cid
                    HAVING     max(
                                  CASE
                                     WHEN left(person_chronic.icd10, 3) BETWEEN 'e10'
                                                                            AND 'e14'
                                     THEN
                                        1
                                     ELSE
                                        0
                                  END) = 1
                           AND max(
                                  CASE
                                     WHEN left(person_chronic.icd10, 3) BETWEEN 'i10'
                                                                            AND 'i15'
                                     THEN
                                        1
                                     ELSE
                                        0
                                  END) = 1
                           AND length(person.cid) = 13
                    UNION ALL
                    -- clinicmember
                    SELECT person.cid,
                           max(
                              CASE
                                 WHEN clinicmember.clinic = '001' THEN 1
                                 ELSE 0
                              END)
                              AS dm,
                           max(
                              CASE
                                 WHEN clinicmember.clinic = '002' THEN 1
                                 ELSE 0
                              END)
                              AS ht
                    FROM person
                         LEFT OUTER JOIN clinicmember
                            ON person.patient_hn = clinicmember.hn
                    GROUP BY person.cid
                    HAVING     max(
                                  CASE
                                     WHEN clinicmember.clinic = '001'
                                     THEN
                                        1
                                     ELSE
                                        0
                                  END) = 1
                           AND max(
                                  CASE
                                     WHEN clinicmember.clinic = '002'
                                     THEN
                                        1
                                     ELSE
                                        0
                                  END) = 1
                           AND length(person.cid) = 13
                    UNION ALL
                    -- ovstdiag
                    SELECT person.cid,
                           max(
                              CASE
                                 WHEN left(ovstdiag.icd10, 3) BETWEEN 'e10'
                                                                  AND 'e14'
                                 THEN
                                    1
                                 ELSE
                                    0
                              END)
                              AS dm,
                           max(
                              CASE
                                 WHEN left(ovstdiag.icd10, 3) BETWEEN 'i10'
                                                                  AND 'i15'
                                 THEN
                                    1
                                 ELSE
                                    0
                              END)
                              AS ht
                    FROM person
                         LEFT OUTER JOIN ovstdiag
                            ON person.patient_hn = ovstdiag.hn
                    GROUP BY person.cid
                    HAVING     max(
                                  CASE
                                     WHEN left(ovstdiag.icd10, 3) BETWEEN 'e10'
                                                                      AND 'e14'
                                     THEN
                                        1
                                     ELSE
                                        0
                                  END) = 1
                           AND max(
                                  CASE
                                     WHEN left(ovstdiag.icd10, 3) BETWEEN 'i10'
                                                                      AND 'i15'
                                     THEN
                                        1
                                     ELSE
                                        0
                                  END) = 1
                           AND length(person.cid) = 13) AS all_chronic
              GROUP BY all_chronic.cid)
GROUP BY person.cid;
-- Fix [2022-05-10 09:16:54]