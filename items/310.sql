SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '310';
SET @activity_cost = '40';
SET @lab_hct =
       (SELECT lab_items_name
        FROM lab_items
        WHERE provis_labcode = '0621201');
SET @commu_set = '1H301';

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT person.cid,
       person.pname,
       person.fname,
       person.lname,
       cast(@activity_code AS CHAR)      AS activity_code,
       cast(@activity_cost AS CHAR)      AS activity_cost,
       cast(lab_head.order_date AS CHAR) AS date_serv,
       cast(@h_sub AS CHAR)              AS h_sub
FROM lab_order
     INNER JOIN lab_head
        ON lab_order.lab_order_number = lab_head.lab_order_number
     INNER JOIN person ON lab_head.hn = person.patient_hn
WHERE     find_in_set(lab_order.lab_items_name_ref, @lab_hct)
      AND lab_head.order_date BETWEEN @start_date AND @stop_date
      AND (   timestampdiff(MONTH, person.birthdate, lab_head.order_date) BETWEEN 6
                                                                              AND 60
           OR timestampdiff(YEAR, person.birthdate, lab_head.order_date) BETWEEN 0
                                                                             AND 5)
      AND lab_order.lab_order_result IS NOT NULL
      AND person.sex IN (1, 2)
      AND person.nationality = 99
      AND person.discharge_date IS NULL
      AND person.death <> 'y'
GROUP BY person.cid
ORDER BY lab_head.order_date, person.cid;
-- Fix [2022-05-10 08:54:11]