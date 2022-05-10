SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '201';
SET @activity_cost = '50';
SET @ppset =
       '1b200,1b201,1b202,1b203,1b204,1b205,1b209,1b210,1b211,1b212,1b213,1b214,1b215,1b219,1b220,1b221,1b222,1b223,1b224,1b225,1b229,1b230,1b231,1b232,1b233,1b234,1b235,1b239,1b240,1b241,1b242,1b243,1b244,1b245,1b249,1b260,1b261,1b262';

UPDATE pp_special
SET pp_special.entry_datetime =
       concat((concat('25', LEFT(pp_special.vn, 2)) - 543),
              '-',
              mid(pp_special.vn, 3, 2),
              '-',
              mid(pp_special.vn, 5, 2),
              ' ',
              time(pp_special.entry_datetime))
WHERE concat('25', LEFT(pp_special.vn, 2)) <>
         (LEFT(pp_special.entry_datetime, 4) + 543);

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT cid,
       pname,
       fname,
       lname,
       activity_code,
       activity_cost,
       date_serv,
       h_sub
FROM (-- startrun
      SELECT person.cid,
             person.pname,
             person.fname,
             person.lname,
             @activity_code                               AS activity_code,
             @activity_cost                               AS activity_cost,
             max(date_format(ovst.vstdate, '%Y-%m-%d'))   AS date_serv,
             @h_sub                                       AS h_sub,
             IF(sum(
                   CASE
                      WHEN find_in_set(pp_special_type.pp_special_code,
                                       @ppset)
                      THEN
                         1
                      ELSE
                         0
                   END) >= 1,
                'y',
                'n')
                AS screen_dspm,
             max(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code,
                                    @ppset)
                   THEN
                      pp_special_type_name
                   ELSE
                      NULL
                END)
                AS screen_dspm_result,
             timestampdiff(MONTH, person.birthdate, ovst.vstdate)
                AS current_age,
             village.village_moo,
             village.village_name
      FROM ovst
           INNER JOIN pp_special ON ovst.vn = pp_special.vn
           INNER JOIN pp_special_type
              ON pp_special.pp_special_type_id =
                    pp_special_type.pp_special_type_id
           INNER JOIN person ON ovst.hn = person.patient_hn
           INNER JOIN ovstdiag ON ovst.vn = ovstdiag.vn
           INNER JOIN village ON person.village_id = village.village_id
      WHERE     ovst.vstdate BETWEEN @start_date AND @stop_date
            AND person.nationality = 99
            AND person.death <> 'y'
            AND timestampdiff(MONTH, person.birthdate, ovst.vstdate) IN
                   (9,
                    18,
                    30,
                    42,
                    60)
      GROUP BY person.cid, ovst.vstdate
      HAVING (IF(sum(
                    CASE
                       WHEN find_in_set(pp_special_type.pp_special_code,
                                        @ppset)
                       THEN
                          1
                       ELSE
                          0
                    END) >= 1,
                 1,
                 0)) >= 1
      ORDER BY ovst.vstdate, person.cid) AS a;
-- Fix [2022-05-10 08:37:55]