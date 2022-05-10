SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '805';
SET @activity_cost = '20';
SET @diag_code = 'z133';
SET @ppset =
       '1b0260,1b0261,1b0262,1b0263,1b0282,1b0283,1b0284,1b0285,1b0270,1b0271,1b0272,1b0273';

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT person.cid,
       person.pname,
       person.fname,
       person.lname,
       cast(@activity_code AS CHAR)   AS activity_code,
       cast(@activity_cost AS CHAR)   AS activity_cost,
       cast(ovstdiag.vstdate AS CHAR) AS date_serv,
       cast(@h_sub AS CHAR)           AS h_sub
FROM ovstdiag
     INNER JOIN person ON ovstdiag.hn = person.patient_hn
     INNER JOIN depression_screen ON ovstdiag.vn = depression_screen.vn
     INNER JOIN pp_special ON ovstdiag.vn = pp_special.vn
     INNER JOIN pp_special_type
        ON pp_special.pp_special_type_id =
              pp_special_type.pp_special_type_id
WHERE     ovstdiag.vstdate BETWEEN @start_date AND @stop_date
      AND ovstdiag.icd10 = @diag_code
      AND person.nationality = 99
      AND person.death <> 'y'
      AND person.discharge_date IS NULL
      AND person.house_regist_type_id IN (1, 3)
      AND (   depression_screen.feel_boring_2_week IN ('y', 'n')
           OR depression_screen.feel_depression_2_week IN ('y', 'n'))
      AND person.death_date IS NULL
GROUP BY person.cid
HAVING sum(
          CASE
             WHEN find_in_set(pp_special_type.pp_special_code, @ppset)
             THEN
                1
             ELSE
                0
          END) >= 1
ORDER BY ovstdiag.vstdate, person.cid;
-- Fix [2022-05-10 09:18:15]