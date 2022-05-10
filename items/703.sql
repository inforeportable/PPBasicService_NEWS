SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '703';
SET @activity_cost = '10';
SET @ppset = '1b1230,1b1231,1b1232,1b1233,1b1234,1b1235';

-- update vn

UPDATE pp_special
SET pp_special.entry_datetime =
       concat((concat('25', left(pp_special.vn, 2)) - 543),
              '-',
              mid(pp_special.vn, 3, 2),
              '-',
              mid(pp_special.vn, 5, 2),
              ' ',
              time(pp_special.entry_datetime));

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)
-- startrun

SELECT person.cid,
       person.pname,
       person.fname,
       person.lname,
       cast(@activity_code AS CHAR)               AS activity_code,
       cast(@activity_cost AS CHAR)               AS activity_cost,
       max(date_format(ovst.vstdate, '%Y-%m-%d')) AS date_serv,
       @h_sub                                     AS h_sub
FROM person
     LEFT OUTER JOIN ovst ON person.patient_hn = ovst.hn
     LEFT OUTER JOIN opdscreen ON ovst.vn = opdscreen.vn
     LEFT OUTER JOIN pp_special ON ovst.vn = pp_special.vn
     LEFT OUTER JOIN pp_special_type
        ON pp_special.pp_special_type_id =
              pp_special_type.pp_special_type_id
WHERE     ovst.vstdate BETWEEN @start_date AND @stop_date
      AND timestampdiff(YEAR, person.birthdate, ovst.vstdate) >= 60
      AND person.house_regist_type_id IN (1, 3)
      AND person.nationality = 99
      AND (   (person.death <> 'y' AND person.discharge_date IS NULL)
           OR person.death_date < ovst.vstdate)
      AND person.sex IN (1, 2)
      AND find_in_set(pp_special_type.pp_special_code, @ppset)
GROUP BY person.cid;
-- Fix [2022-05-10 09:13:28]