SET @start_date = date('2020-04-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code := '204';
SET @activity_cost := '15';
SET @export_vaccine := '401';

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT person.cid,
       person.pname,
       person.fname,
       person.lname,
       cast(@activity_code AS CHAR)                             AS activity_code,
       cast(@activity_cost AS CHAR)                             AS activity_cost,
       date_format(person_wbc_service.service_date, '%Y-%m-%d') AS date_serv,
       @h_sub                                                   AS h_sub
FROM person_wbc_vaccine_detail
     LEFT OUTER JOIN wbc_vaccine
        ON person_wbc_vaccine_detail.wbc_vaccine_id =
              wbc_vaccine.wbc_vaccine_id
     LEFT OUTER JOIN person_wbc_service
        ON person_wbc_vaccine_detail.person_wbc_service_id =
              person_wbc_service.person_wbc_service_id
     LEFT OUTER JOIN person_wbc
        ON person_wbc_service.person_wbc_id = person_wbc.person_wbc_id
     LEFT OUTER JOIN person ON person_wbc.person_id = person.person_id
WHERE     wbc_vaccine.export_vaccine_code = @export_vaccine
      AND person_wbc_service.service_date BETWEEN @start_date AND @stop_date
      AND person.nationality = 99
      AND person.sex IN (1, 2)
GROUP BY person.cid, person_wbc_service.service_date
ORDER BY person_wbc_service.service_date, person.cid;
-- Fix [2022-05-10 08:40:31]