SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code := '301';
SET @activity_cost := '70';

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT person.cid,
       person.pname,
       person.fname,
       person.lname,
       cast(@activity_code AS CHAR) AS activity_code,
       cast(@activity_cost AS CHAR) AS activity_cost,
       date_format(village_student_screen.screen_date, '%Y-%m-%d')
          AS date_serv,
       @h_sub                       AS h_sub
FROM village_student_screen
     INNER JOIN village_student
        ON village_student_screen.village_student_id =
              village_student.village_student_id
     INNER JOIN village_school_class
        ON village_student.village_school_class_id =
              village_school_class.village_school_class_id
     INNER JOIN person ON village_student.person_id = person.person_id
WHERE     village_student_screen.screen_date BETWEEN @start_date
                                                 AND @stop_date
      AND person.sex IN (1, 2)
      AND person.nationality = 99
      AND QUARTER(village_student_screen.screen_date) IN (4,1)
      AND TIMESTAMPDIFF(YEAR,
                        person.birthdate,
                        village_student_screen.screen_date) BETWEEN 6
                                                                AND 13
      AND village_student_screen.body_weight IS NOT NULL
      AND village_student_screen.height IS NOT NULL
      AND village_student_screen.ear_check_normal IS NOT NULL
      AND village_student_screen.eye_check_normal IS NOT NULL
GROUP BY village_student.person_id;
-- Fix [2022-05-10 08:46:50]