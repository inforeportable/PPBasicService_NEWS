SELECT
    cprename.prename,
    p. NAME,
    p.lname,
    '813' AS activity_code,
    '50' AS activity_cost,
    cast(t.lab_date AS CHAR) AS date_serv,
    '10679' AS hospcode
FROM
    t_dm_follow AS t
INNER JOIN t_person_cid p ON t.hospcode = p.check_hosp
AND t.cid = p.cid
INNER JOIN cprename ON p.PRENAME = cprename.id_prename
WHERE
    t.date_screen BETWEEN '2021-10-01'
AND '2022-09-30'
AND t.labfu = 1
AND t.hospcode IN (
    '08322',
    '08323',
    '08324',
    '08325',
    '08326',
    '08327',
    '08328',
    '08329',
    '08330',
    '08331',
    '08332',
    '08333',
    '08334',
    '08335',
    '08336',
    '08337',
    '08338',
    '08339',
    '08340',
    '08341',
    '08342',
    '08343',
    '08344',
    '08345',
    '08346',
    '08347',
    '08348',
    '08349',
    '08350',
    '08351',
    '08357',
    '08358',
    '08405',
    '08440',
    '08441',
    '10679',
    '14870',
    '23916',
    '77508',
    '77645'
)
ORDER BY
    t.hospcode ;
-- Fix [2022-05-10 09:34:05]