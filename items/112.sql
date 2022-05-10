SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '112';
SET @activity_cost = '70';

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT cid,
       pname,
       fname,
       lname,
       activity_code,
       activity_cost,
       date_serv,
       h_sub
FROM (SELECT cid,
             pname,
             fname,
             lname,
             activity_code,
             activity_cost,
             date_serv,
             h_sub,
             preg_care_group,
             @prev := @curr                             AS p,
             @curr := concat(cid, preg_care_group)      AS c,
             @rank := IF(@curr = @prev, @rank + 1, 1)   AS r
      FROM (SELECT cast(person.cid AS CHAR)         AS cid,
                   person.pname,
                   person.fname,
                   person.lname,
                   cast(@activity_code AS CHAR)     AS activity_code,
                   cast(@activity_cost AS CHAR)     AS activity_cost,
                   date_format(person_anc_preg_care.care_date,
                               '%Y-%m-%d')
                      AS date_serv,
                   @h_sub                           AS h_sub,
                   person_anc.labor_date,
                   CASE
                      WHEN timestampdiff(DAY,
                                         person_anc.labor_date,
                                         person_anc_preg_care.care_date) BETWEEN 1
                                                                             AND 7
                      THEN
                         '1'
                      WHEN timestampdiff(DAY,
                                         person_anc.labor_date,
                                         person_anc_preg_care.care_date) BETWEEN 8
                                                                             AND 15
                      THEN
                         '2'
                      WHEN timestampdiff(DAY,
                                         person_anc.labor_date,
                                         person_anc_preg_care.care_date) BETWEEN 16
                                                                             AND 42
                      THEN
                         '3'
                      ELSE
                         NULL
                   END
                      preg_care_group
            FROM ovst
                 INNER JOIN person_anc_preg_care
                    ON ovst.vn = person_anc_preg_care.vn
                 INNER JOIN person_anc
                    ON person_anc_preg_care.person_anc_id =
                          person_anc.person_anc_id
                 INNER JOIN person ON ovst.hn = person.patient_hn
            WHERE     person.sex = 2
                  AND person.nationality = 99
                  AND person_anc.labor_date <
                         person_anc_preg_care.care_date
                  AND person_anc_preg_care.care_date BETWEEN @start_date
                                                         AND @stop_date
                  AND person_anc_preg_care.real_preg_care = 'y'
                  AND person_anc_preg_care.nipple_normal IS NOT NULL 
-- AND person_anc_preg_care.uterus_level_normal IS NOT NULL
-- AND person_anc_preg_care.lochia_normal IS NOT NULL
                  AND person_anc_preg_care.bps IS NOT NULL
                  AND person_anc_preg_care.bpd IS NOT NULL 
-- AND person_anc_preg_care.albumin_level IS NOT NULL
-- AND person_anc_preg_care.sugar_level IS NOT NULL
            GROUP BY person.cid, person_anc_preg_care.care_date
            ORDER BY person.cid, person_anc_preg_care.care_date) AS a,
           (SELECT @curr = 0, @prev = 0, @rank = 1) AS vr
      WHERE a.preg_care_group IS NOT NULL) AS b
WHERE b.r = 1;
-- Fix [2022-05-10 08:37:14]