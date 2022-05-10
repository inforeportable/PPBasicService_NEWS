SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '302';
SET @activity_cost = '30';
SET @lab_hct =
       (SELECT lab_items_name
        FROM lab_items
        WHERE provis_labcode = '0621201');
SET @commu_set = '1H301';

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT t.cid,
       t.pname,
       t.fname,
       t.lname,
       t.activity_code,
       t.activity_cost,
       min(t.date_serv) AS date_serv,
       t.h_sub
FROM (--         (
      --             SELECT
      --                 person.cid,
      --                 person.pname,
      --                 person.fname,
      --                 person.lname,
      --                 cast(@activity_code AS CHAR) AS activity_code,
      --                 cast(@activity_cost AS CHAR) AS activity_cost,
      --                 date_format(
      --                     village_student_screen.screen_date,
      --                     '%Y-%m-%d'
      --                 ) AS date_serv,
      --                 @h_sub AS h_sub
      --             FROM
      --                 village_student_screen
      --             INNER JOIN village_student ON village_student_screen.village_student_id = village_student.village_student_id
      --             INNER JOIN village_school_class ON village_student.village_school_class_id = village_school_class.village_school_class_id
      --             INNER JOIN person ON village_student.person_id = person.person_id
      --             WHERE
      --                 village_student_screen.screen_date BETWEEN @start_date
      --             AND @stop_date
      --             AND person.sex IN (1, 2)
      --             AND person.nationality = 99
      --             AND village_student_screen.student_hct_result_id IS NOT NULL
      --             AND village_student_screen.student_hct_result_value IS NOT NULL
      --             AND QUARTER (
      --                 village_student_screen.screen_date
      --             ) BETWEEN 1
      --             AND 34
      --             AND (
      --                 (
      --                     village_school_class.village_school_class_name LIKE '%1%'
      --                     AND village_school_class.village_school_class_name LIKE '%ประถม%'
      --                 )
      --                 OR (
      --                     village_school_class.village_school_class_name LIKE '%1%'
      --                     AND village_school_class.village_school_class_name LIKE '%มัธยม%'
      --                 )
      --             )
      --             GROUP BY
      --                 village_student.person_id
      --         )
      --         UNION ALL
      (SELECT person.cid,
              person.pname,
              person.fname,
              person.lname,
              cast(@activity_code AS CHAR)            AS activity_code,
              cast(@activity_cost AS CHAR)            AS activity_cost,
              date_format(ovst.vstdate, '%Y-%m-%d')   AS date_serv,
              @h_sub                                  AS h_sub
       FROM ovst
            INNER JOIN person ON ovst.hn = person.patient_hn
            INNER JOIN village_student
               ON person.person_id = village_student.person_id
            INNER JOIN village_school_class
               ON village_student.village_school_class_id =
                     village_school_class.village_school_class_id
            -- LEFT OUTER JOIN ovst_community_service on ovst.vn = ovst_community_service.vn
            -- LEFT OUTER JOIN ovst_community_service_type on ovst_community_service.ovst_community_service_type_id = ovst_community_service_type.ovst_community_service_type_id
            INNER JOIN lab_head ON ovst.vn = lab_head.vn
            INNER JOIN lab_order
               ON lab_head.lab_order_number = lab_order.lab_order_number
       WHERE     ovst.vstdate BETWEEN @start_date AND @stop_date
             AND person.sex IN (1, 2)
             AND person.nationality = 99
             AND QUARTER(ovst.vstdate) BETWEEN 1 AND 4
             AND (   (    village_school_class.village_school_class_name LIKE
                             '%1%'
                      AND village_school_class.village_school_class_name LIKE
                             '%ประถม%')
                  OR (    village_school_class.village_school_class_name LIKE
                             '%1%'
                      AND village_school_class.village_school_class_name LIKE
                             '%มัธยม%'))
             AND (    lab_order.lab_items_name_ref = @lab_hct
                  AND lab_order.lab_order_result > 0.00)
       -- AND ovst_community_service_type.ovst_community_service_type_code = @commu_set
       GROUP BY person.person_id)) AS t
GROUP BY t.cid;
-- Fix [2022-05-10 08:47:37]