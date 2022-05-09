SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '804';
SET @activity_cost = '10';
SET @diag_code = 'z133';

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
WHERE     ovstdiag.vstdate BETWEEN @start_date AND @stop_date
      AND ovstdiag.icd10 = @diag_code
      AND person.nationality = 99
AND ((person.death <> 'y'
AND person.discharge_date IS NULL) OR (person.death = 'y' AND person.discharge_date > ovstdiag.vstdate and ovstdiag.vstdate BETWEEN @start_date AND @stop_date))
AND person.house_regist_type_id IN (1, 3)
AND (   depression_screen.feel_boring_2_week IN ('y', 'n')
           OR depression_screen.feel_depression_2_week IN ('y', 'n')
           OR depression_screen.no_depression IN ('y', 'n'))

GROUP BY person.cid
ORDER BY ovstdiag.vstdate, person.cid;

-- Fix [2022-05-09 15:08:45]
