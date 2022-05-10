SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '213';
SET @activity_cost = '10';

SET @ppset =
'1b200|1b201|1b202|1b203|1b204|1b205|1b209|1b210|1b211|1b212|1b213|1b214|1b215|1b219|1b220|1b221|1b222|1b223|1b224|1b225|1b229|1b230|1b231|1b232|1b233|1b234|1b235|1b239|1b240|1b241|1b242|1b243|1b244|1b245|1b249|1b260|1b261|1b262';
SET @ppset_dis =
'1B201|1B211|1B221|1B231|1B241|1B261' ;
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

SELECT
    dspm.cid,
    dspm.pname,
    dspm.fname,
    dspm.lname,
    @activity_code AS activity_code,
    @activity_cost AS activity_cost,
    cast(dspm.vstdate AS CHAR) AS date_serv,cast(@h_sub as char) as h_sub
FROM
    (
        SELECT
            q1.*, TIMESTAMPDIFF(DAY, q1.min_date, q2.vstdate),
            q2.vstdate
        FROM
            (
                SELECT
                    person.cid,
                    person.pname,
                    person.fname,
                    person.lname,
                    ovst.hn,
                    min(date(ovst.vstdate)) AS min_date,
                    GROUP_CONCAT(
                        DISTINCT pp_special_type.pp_special_code
                        ORDER BY
                            pp_special_type.pp_special_code
                    ) AS list_pp
                FROM
                    ovst
                INNER JOIN pp_special ON ovst.vn = pp_special.vn
                INNER JOIN pp_special_type ON pp_special.pp_special_type_id = pp_special_type.pp_special_type_id
                INNER JOIN person ON ovst.hn = person.patient_hn
                WHERE
                    ovst.vstdate BETWEEN @start_date
                AND @stop_date
                AND TIMESTAMPDIFF(
                    MONTH,
                    person.birthdate,
                    ovst.vstdate
                ) IN (9, 18, 30, 42, 60)
                AND pp_special_type.pp_special_code REGEXP @ppset_dis
                GROUP BY
                    person.cid
            ) AS q1
        INNER JOIN (
            SELECT
                ovst.hn,
                ovst.vstdate,
                pp_special_type.pp_special_code
            FROM
                pp_special
            INNER JOIN pp_special_type ON pp_special.pp_special_type_id = pp_special_type.pp_special_type_id
            INNER JOIN ovst ON ovst.vn = pp_special.vn
            WHERE
                pp_special_type.pp_special_code REGEXP @ppset
            GROUP BY
                ovst.hn,
                ovst.vstdate
        ) AS q2 ON q1.hn = q2.hn
        AND TIMESTAMPDIFF(DAY, q1.min_date, q2.vstdate) BETWEEN 8
        AND 30
    ) AS dspm;
    -- Fix [2022-05-10 08:45:07]