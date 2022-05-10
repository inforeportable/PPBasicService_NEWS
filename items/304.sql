set @start_date  = date('2021-10-10') ;
set @stop_date  = date('2022-03-31') ;
set @h_sub = (select  hospitalcode from opdconfig);
set @activity_code = '304';
set @activity_cost = '50';
set @hidhua = concat('%','ชื่อยาหรือรายการหิดเหา','%');

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT *
FROM ((SELECT person.cid,
              person.pname,
              person.fname,
              person.lname,
              cast(@activity_code AS CHAR)                  AS activity_code,
              cast(@activity_cost AS CHAR)                  AS activity_cost,
              date_format(opitemrece.vstdate, '%Y-%m-%d')   AS date_serv,
              @h_sub                                        AS h_sub
       FROM opitemrece
            INNER JOIN drugitems ON opitemrece.icode = drugitems.icode
            INNER JOIN person ON opitemrece.hn = person.patient_hn
            INNER JOIN village_student
               ON person.person_id = village_student.person_id
            INNER JOIN village_student_screen
               ON     village_student.village_student_id =
                         village_student_screen.village_student_id
                  AND village_student_screen.screen_date BETWEEN @start_date
                                                             AND @stop_date
       WHERE     opitemrece.vstdate BETWEEN @start_date AND @stop_date
             AND drugitems.`name` LIKE @hidhua
       GROUP BY person.cid)
      UNION ALL
      (SELECT person.cid,
              person.pname,
              person.fname,
              person.lname,
              cast(@activity_code AS CHAR)                  AS activity_code,
              cast(@activity_cost AS CHAR)                  AS activity_cost,
              date_format(opitemrece.vstdate, '%Y-%m-%d')   AS date_serv,
              @h_sub                                        AS h_sub
       FROM opitemrece
            INNER JOIN nondrugitems
               ON opitemrece.icode = nondrugitems.icode
            INNER JOIN person ON opitemrece.hn = person.patient_hn
            INNER JOIN village_student
               ON person.person_id = village_student.person_id
            INNER JOIN village_student_screen
               ON     village_student.village_student_id =
                         village_student_screen.village_student_id
                  AND village_student_screen.screen_date BETWEEN @start_date
                                                             AND @stop_date
       WHERE     opitemrece.vstdate BETWEEN @start_date AND @stop_date
             AND nondrugitems.`name` LIKE @hidhua
       GROUP BY person.cid)) AS temp_304
GROUP BY temp_304.cid;
-- Fix [2022-05-10 08:49:45]