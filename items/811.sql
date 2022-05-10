SELECT p.cid,
       cprename.prename,
       p.name,
       p.lname,
       '811'                           AS activity_code,
       '50'                            AS activity_cost,
       cast(date(n.DATE_SERV) AS char) AS date_serv,
       h.hoscode                       AS h_sub
FROM t_dmscreen_lasty    s
     INNER JOIN t_person_cid p
        ON     s.cid = p.cid
           AND p.check_typearea IN (1, 3)
           AND p.nation IN (99)
           AND p.discharge IN (9)
           AND (   (s.BSTEST IN (1, 3) AND s.BSLEVEL BETWEEN 100 AND 125)
                OR (s.BSTEST IN (2, 4) AND s.BSLEVEL BETWEEN 140 AND 199))
           AND s.age_y >= 35
     INNER JOIN chospital h
        ON     p.check_hosp = h.hoscode
           AND h.hoscode IN ('08322',
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
                             '77645')
     LEFT JOIN t_dmscreen_yearnow n
        ON     s.cid = n.cid
           AND n.DATE_SERV BETWEEN '2021-10-01' AND '2022-09-30'
     INNER JOIN cprename ON p.PRENAME = cprename.id_prename
WHERE n.cid IS NOT NULL AND n.BSLEVEL >= 50 ;
-- Fix [2022-05-10 09:33:05]