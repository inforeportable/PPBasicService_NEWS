SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '503';
SET @activity_cost = '60';
SET @lab_name_cho =
       (SELECT lab_items_name
        FROM lab_items
        WHERE provis_labcode = '0541602');
SET @lab_name_tri =
       (SELECT lab_items_name
        FROM lab_items
        WHERE provis_labcode = '0546602');
SET @lab_name_hdl =
       (SELECT lab_items_name
        FROM lab_items
        WHERE provis_labcode = '0541202');
SET @lab_name_ldl =
       (SELECT lab_items_name
        FROM lab_items
        WHERE provis_labcode = '0541402');

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT person.cid,
       person.pname,
       person.fname,
       person.lname,
       cast(@activity_code AS CHAR)      AS activity_code,
       cast(@activity_cost AS CHAR)      AS activity_cost,
       cast(lab_head.order_date AS CHAR) AS date_serv,
       cast(@h_sub AS CHAR)              AS h_sub
FROM lab_order
     INNER JOIN lab_head
        ON lab_order.lab_order_number = lab_head.lab_order_number
     INNER JOIN person ON lab_head.hn = person.patient_hn
     INNER JOIN opdscreen ON lab_head.vn = opdscreen.vn
WHERE     lab_head.order_date BETWEEN @start_date AND @stop_date
      AND timestampdiff(YEAR, person.birthdate, lab_head.order_date) BETWEEN 25
                                                                         AND 34
      AND lab_order.lab_order_result IS NOT NULL
      AND person.sex IN (1, 2)
      AND person.nationality = 99
      AND person.discharge_date IS NULL
      AND person.death <> 'y'
      AND round(opdscreen.bw / power((opdscreen.height / 100), 2), 2) > 25
GROUP BY person.cid
HAVING     SUM(
              CASE
                 WHEN find_in_set(lab_order.lab_items_name_ref,
                                  @lab_name_cho) >= 1
                 THEN
                    1
                 ELSE
                    0
              END) >= 1
       AND SUM(
              CASE
                 WHEN find_in_set(lab_order.lab_items_name_ref,
                                  @lab_name_tri) >= 1
                 THEN
                    1
                 ELSE
                    0
              END) >= 1
       AND SUM(
              CASE
                 WHEN find_in_set(lab_order.lab_items_name_ref,
                                  @lab_name_hdl) >= 1
                 THEN
                    1
                 ELSE
                    0
              END) >= 1
       AND SUM(
              CASE
                 WHEN find_in_set(lab_order.lab_items_name_ref,
                                  @lab_name_ldl) >= 1
                 THEN
                    1
                 ELSE
                    0
              END) >= 1
ORDER BY lab_head.order_date, person.cid;
-- Fix [2022-05-10 08:55:13]