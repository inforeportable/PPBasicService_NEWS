SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '603';
SET @activity_cost = '10';

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT
smoking.cid,
smoking.pname,
smoking.fname,
smoking.lname,
smoking.activity_code,
smoking.activity_cost,
smoking.date_serv,
smoking.h_sub
FROM
(
SELECT
    person.cid,
    person.pname,
    person.fname,
    person.lname,
    @activity_code AS activity_code,
    @activity_cost AS activity_cost,
    cast( min(date(ovst.vstdate)) as char) AS date_serv,
    @h_sub AS h_sub,
group_concat(DISTINCT pp_special_type.pp_special_code) as list_pp,
max(CASE WHEN pp_special_type.pp_special_code BETWEEN '1B501' AND '1B503' THEN 1 ELSE 0 END ) AS ch1,
max(CASE WHEN pp_special_type.pp_special_code BETWEEN '1B504' AND '1B506' THEN 1 ELSE 0 END ) AS ch2,
max(CASE WHEN pp_special_type.pp_special_code BETWEEN '1B530' AND '1B532' THEN 1 ELSE 0 END ) AS ch3
FROM
    ovst
LEFT OUTER JOIN pp_special ON ovst.vn = pp_special.vn
LEFT OUTER JOIN pp_special_type ON pp_special.pp_special_type_id = pp_special_type.pp_special_type_id
LEFT OUTER JOIN person ON ovst.hn = person.patient_hn
WHERE
    ovst.vstdate BETWEEN @start_date
AND @stop_date
AND timestampdiff(
    YEAR,
    person.birthdate,
    ovst.vstdate
) BETWEEN 35
AND 59
AND person.house_regist_type_id IN (1, 3)
AND pp_special_type.pp_special_code LIKE '1b5%'
AND person.sex IN (1, 2)
AND person.death <> 'y'
AND person.death_date IS NULL
AND person.nationality = 99
GROUP BY
person.cid
) AS smoking
WHERE 
ch1 = 1
AND
ch2 = 1
AND
ch3 = 1 ;
-- Fix [2022-05-10 08:58:00]