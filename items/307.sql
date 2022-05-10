SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '307';
SET @activity_cost = '15';
SET @export_vaccine = '011';

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT person.cid,
       person.pname,
       person.fname,
       person.lname,
       cast(@activity_code AS CHAR) AS activity_code,
       cast(@activity_cost AS CHAR) AS activity_cost,
       date_format(village_student_vaccine.vaccine_date, '%Y-%m-%d')
          AS date_serv,
       @h_sub                       AS h_sub
FROM village_student_vaccine
     INNER JOIN village_student_vaccine_list
        ON village_student_vaccine.village_student_vaccine_id =
              village_student_vaccine_list.village_student_vaccine_id
     INNER JOIN student_vaccine
        ON village_student_vaccine_list.student_vaccine_id =
              student_vaccine.student_vaccine_id
     INNER JOIN village_student
        ON village_student_vaccine.village_student_id =
              village_student.village_student_id
     INNER JOIN person ON village_student.person_id = person.person_id
WHERE     village_student_vaccine.vaccine_date BETWEEN @start_date
                                                   AND @stop_date
      AND QUARTER(village_student_vaccine.vaccine_date) BETWEEN 1 AND 4
      AND find_in_set(student_vaccine.export_vaccine_code, @export_vaccine)
      AND person.nationality = 99
      AND person.sex IN (1, 2)
GROUP BY person.cid;
-- Fix [2022-05-10 08:52:29]