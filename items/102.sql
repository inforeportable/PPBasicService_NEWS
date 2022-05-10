SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code := '102';
SET @activity_cost := '200';
SET @icd10set = concat('z3', '%');

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT person.cid,
       person.pname,
       person.fname,
       person.lname,
       cast(@activity_code AS CHAR) AS activity_code,
       cast(@activity_cost AS CHAR) AS activity_cost,
       date_format(person_anc_service.anc_service_date, '%Y-%m-%d')
          AS date_serv,
       @h_sub                       AS h_sub
FROM person_anc_service
     INNER JOIN person_anc
        ON person_anc.person_anc_id = person_anc_service.person_anc_id
     INNER JOIN person ON person.person_id = person_anc.person_id
     INNER JOIN ovstdiag ON person_anc_service.vn = ovstdiag.vn
WHERE     person_anc_service.anc_service_date BETWEEN @start_date
                                                  AND @stop_date
      AND datediff(person_anc_service.anc_service_date, person_anc.lmp) BETWEEN (  7
                                                                                 * 4)
                                                                            AND (  7
                                                                                 * 12)
      AND datediff(person_anc.anc_register_date, person_anc.lmp) BETWEEN (  7
                                                                          * 4)
                                                                     AND (  7
                                                                          * 12)
      AND person.sex = 2
      AND person.house_regist_type_id IN (1, 3)
      AND person_anc_service.anc_service_type_id = 1
      AND ovstdiag.icd10 LIKE @icd10set
      AND person_anc.anc_register_date IS NOT NULL
GROUP BY person_anc_service.person_anc_id;
-- Fix [2022-05-10 08:35:18]