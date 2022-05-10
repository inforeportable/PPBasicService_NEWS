SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '616';
SET @activity_cost = '2000';
SET @icd10 = 'Z302';

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
WHERE     ovst.vstdate BETWEEN @start_date AND @stop_date
      AND ovstdiag.icd10 = @icd10
      AND person.sex = 2
GROUP BY person.cid;
-- Fix [2022-05-10 09:04:23]