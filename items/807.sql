SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '807';
SET @activity_cost = '100';
SET @commuset = '1a11,1a12,1a14,1a18';

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT person.cid,
       person.pname,
       person.fname,
       person.lname,
       cast(@activity_code AS char) AS activity_code,
       cast(@activity_cost AS char) AS activity_cost,
       cast(ovst.vstdate AS char)   AS date_serv,
       cast(@h_sub AS char)         AS h_sub
-- ,
--     opdscreen.cc,
--     group_concat(distinct er_oper_code. name) as proced,
--     group_concat(
--         distinct ovst_community_service_type.ovst_community_service_type_code
--     ) as commu_code,
--     group_concat(
--         distinct ovst_community_service_type.ovst_community_service_type_name
--     ) as commu_name
FROM ovst
     LEFT OUTER JOIN ovst_community_service
        ON ovst.vn = ovst_community_service.vn
     LEFT OUTER JOIN ovst_community_service_type
        ON ovst_community_service.ovst_community_service_type_id =
              ovst_community_service_type.ovst_community_service_type_id
     LEFT OUTER JOIN opdscreen ON ovst.vn = opdscreen.vn
     LEFT OUTER JOIN doctor_operation ON ovst.vn = doctor_operation.vn
     LEFT OUTER JOIN er_oper_code
        ON doctor_operation.er_oper_code = er_oper_code.er_oper_code
     LEFT OUTER JOIN person ON ovst.hn = person.patient_hn
WHERE     ovst.vstdate BETWEEN @start_date AND @stop_date
      AND LEFT(Trim(opdscreen.cc), 3) = @activity_code
GROUP BY ovst.hn, ovst.vstdate
HAVING sum(
          CASE
             WHEN find_in_set(
                     ovst_community_service_type.ovst_community_service_type_code,
                     @commuset) >= 1
             THEN
                1
             ELSE
                0
          END) >= 1
ORDER BY ovst.hn, ovst.vstdate;
-- Fix [2022-05-10 09:19:31]