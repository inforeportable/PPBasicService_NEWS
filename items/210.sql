SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '210';
SET @activity_cost = '140';
SET @icd10 = 'Z114';
SET @provis_labcode_set = '';

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT person.cid,
       person.pname,
       person.fname,
       person.lname,
       cast(@activity_code AS CHAR)               AS activity_code,
       cast(@activity_cost AS CHAR)               AS activity_cost,
       max(date_format(ovst.vstdate, '%Y-%m-%d')) AS date_serv,
       @h_sub                                     AS h_sub
FROM ovst
     INNER JOIN ovstdiag ON ovst.vn = ovstdiag.vn
     INNER JOIN person ON ovst.hn = person.patient_hn
     INNER JOIN lab_head ON ovst.vn = lab_head.vn
     INNER JOIN lab_order
        ON lab_head.lab_order_number = lab_order.lab_order_number
     INNER JOIN lab_items
        ON lab_order.lab_items_code = lab_items.lab_items_code
WHERE     ovst.vstdate BETWEEN @start_date AND @stop_date
      AND ovstdiag.icd10 = @icd10
      AND TIMESTAMPDIFF(MONTH, person.birthdate, ovst.vstdate) BETWEEN 9
                                                                   AND 15
      AND FIND_IN_SET(lab_items.provis_labcode, @provis_labcode_set) >= 1
GROUP BY person.cid;
-- Fix [2022-05-10 08:43:39]