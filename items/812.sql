SELECT p.cid,
       cprename.prename,
       p.name,
       p.lname,
       '812'     AS activity_code,
       '50'      AS activity_cost,
       IF(date(t.home_date) BETWEEN '2021-10-01' AND '2022-09-30',
          cast(date(t.home_date) AS char),
          cast(date(t.hosp_date) AS char))
          AS date_serv,
       h.hoscode AS h_sub
FROM t_ht_follow    t
     INNER JOIN chospital h ON t.hospcode = h.hoscode
     INNER JOIN t_person_cid p
        ON t.hospcode = p.check_hosp AND t.cid = p.cid
     INNER JOIN cprename ON p.PRENAME = cprename.id_prename
WHERE     p.check_typearea IN (1, 3)
      AND p.NATION IN (99)
      AND p.DISCHARGE IN (9)
      AND t.date_screen BETWEEN '2021-10-01' AND '2022-09-30'
      AND (   t.home_date BETWEEN '2021-10-01' AND '2022-09-30'
           OR t.hosp_date BETWEEN '2021-10-01' AND '2022-09-30')
      AND (t.home_bp = 1 OR t.hosp_bp = 1)
      -- AND t.home_date IS NOT NULL
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
GROUP BY h.hoscode, p.cid
ORDER BY h.hoscode ;
-- Fix [2022-05-10 09:33:36]