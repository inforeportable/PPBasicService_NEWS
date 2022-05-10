SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '110';
SET @activity_cost = '150';
SET @icd10set = concat('z014', '%');
SET @ppset = '1b14,1b140,1b141,1b142,1b143,1b144,1b149';

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT person.cid,
       person.pname,
       person.fname,
       person.lname,
       cast(@activity_code AS CHAR)                            AS activity_code,
       cast(@activity_cost AS CHAR)                            AS activity_cost,
       date_format(person_anc_preg_care.care_date, '%Y-%m-%d') AS date_serv,
       @h_sub                                                  AS h_sub
FROM person_anc_preg_care
     INNER JOIN person_anc
        ON person_anc_preg_care.person_anc_id = person_anc.person_anc_id
     INNER JOIN person ON person_anc.person_id = person.person_id
     LEFT OUTER JOIN ovstdiag ON person_anc_preg_care.vn = ovstdiag.vn
     LEFT OUTER JOIN pp_special ON person_anc_preg_care.vn = pp_special.vn
     LEFT OUTER JOIN pp_special_type
        ON pp_special.pp_special_type_id =
              pp_special_type.pp_special_type_id
WHERE     person_anc_preg_care.care_date BETWEEN @start_date AND @stop_date
      AND person_anc.labor_date < person_anc_preg_care.care_date
      AND person_anc_preg_care.real_preg_care = 'y'
      AND person_anc_preg_care.bps IS NOT NULL
      AND person_anc_preg_care.bpd IS NOT NULL
      AND person_anc_preg_care.nipple_normal IS NOT NULL
      AND person.sex = 2
      AND person.nationality = 99
GROUP BY person.cid
HAVING     (IF(
               sum(
                  CASE WHEN ovstdiag.icd10 LIKE @icd10set THEN 1 ELSE 0 END) >=
                  1,
               1,
               0)) >= 1
       AND (IF(sum(
                  CASE
                     WHEN find_in_set(pp_special_type.pp_special_code,
                                      @ppset)
                     THEN
                        1
                     ELSE
                        0
                  END) >= 1,
               1,
               0)) >= 1;
-- Fix [2022-05-10 08:36:23]