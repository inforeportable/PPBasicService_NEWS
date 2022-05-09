SET @start_date = date('2021-10-01');
SET @stop_date = date('2022-03-31');
SET @h_sub = (SELECT hospitalcode FROM opdconfig);
SET @activity_code = '701';
SET @activity_cost = '100';
SET @2q = '1b0280,1b0281';
SET @9q = '1b0282,1b0283,1b0284,1b0285';
SET @st5 = '1b0286,1b0287';
SET @8q = '1b0270,1b0271,1b0272,1b0273';
SET @accident = '1b1200,1b1201,1b1202';
SET @amt = '1b1220,1b1221,1b1223';
SET @mmset2002 = '1b1224,1b1225,1b1226';
SET @cvd = '1b1230,1b1231,1b1232,1b1233,1b1234,1b1235';
SET @eye_min = '1b1240,1b1241,1b1242';
SET @eye_max = '1b1243,1b1244,1b1245';
SET @eye_mirror = '1b1250,1b1251,1b1252';
SET @eye_stone = '1b1253,1b1254,1b1255';
SET @eye_retina = '1b1256,1b1257,1b1258';
SET @mouth = '1b1260,1b1261';
SET @knee = '1b1270,1b1271,1b1272';
-- set @ltc                 = '1b1273,1b1274,1b1275' ;
SET @adl = '1b1280,1b1281,1b1282';
-- set @blader         = '1b1284,1b1285' ;
SET @smoke = '1b501,1b502,1b503,1b504,1b505,1b506,1b51,1b52';
SET @breast = '1b0030,1b0031,1b0032,1b0033,1b0034,1b0035,1b0036,1b0037';
SET @sumscore = 6;

-- <process> INSERT IGNORE INTO pbs_items_list (cid,pname,fname,lname,activity_code,activity_cost,date_serv,h_sub)

SELECT cid,
       pname,
       fname,
       lname,
       activity_code,
       activity_cost,
       date_serv,
       h_sub
FROM (SELECT person.cid,
             person.pname,
             person.fname,
             person.lname,
             cast(@activity_code AS char)      AS activity_code,
             cast(@activity_cost AS char)      AS activity_cost,
             cast(max(ovst.vstdate) AS char)   AS date_serv,
             cast(@h_sub AS char)              AS h_sub,
             ovst.hn,
             cast(max(ovst.vn) AS char)        AS vn,
             person.birthdate,
             -- round(datediff(max(ovst.vstdate), person.birthdate) / 365.25)
             TIMESTAMPDIFF(Year, person.birthdate, max(ovst.vstdate))
                AS current_age,
             -- metal group
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code, @2q)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS 2q,
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code, @9q)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS 9q,
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code, @st5)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS st5,
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code, @8q)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS 8q,
             -- acident
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code,
                                    @accident)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS accident,
             -- brain remember
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code, @amt)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS amt,
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code,
                                    @mmset2002)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS mmset2002,
             -- cvd
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code, @cvd)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS cvd,
             -- eye group
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code,
                                    @eye_min)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS eye_min,
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code,
                                    @eye_max)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS eye_max,
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code,
                                    @eye_mirror)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS eye_mirror,
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code,
                                    @eye_stone)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS eye_stone,
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code,
                                    @eye_retina)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS eye_retina,
             -- mouth
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code,
                                    @mouth)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS mouth,
             -- knee
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code, @knee)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS knee,
             -- ltc
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code, @ltc)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS ltc,
             -- adl
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code, @adl)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS adl,
             -- blader
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code,
                                    @blader)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS blader,
             -- smoke
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code,
                                    @smoke)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS smoke,
             -- cancer group
             sum(
                CASE
                   WHEN find_in_set(pp_special_type.pp_special_code,
                                    @breast)
                   THEN
                      1
                   ELSE
                      0
                END)
                AS breast,
             (                                                -- 1 metal group
              ( CASE
                   WHEN (  sum(
                              CASE
                                 WHEN find_in_set(
                                         pp_special_type.pp_special_code,
                                         @2q)
                                 THEN
                                    1
                                 ELSE
                                    0
                              END)
                         + sum(
                              CASE
                                 WHEN find_in_set(
                                         pp_special_type.pp_special_code,
                                         @9q)
                                 THEN
                                    1
                                 ELSE
                                    0
                              END)
                         + sum(
                              CASE
                                 WHEN find_in_set(
                                         pp_special_type.pp_special_code,
                                         @st5)
                                 THEN
                                    1
                                 ELSE
                                    0
                              END)
                         + sum(
                              CASE
                                 WHEN find_in_set(
                                         pp_special_type.pp_special_code,
                                         @8q)
                                 THEN
                                    1
                                 ELSE
                                    0
                              END)) >= 1
                   THEN
                      1
                   ELSE
                      0
                END)
              +                                                   -- 2 acident
               (CASE
                   WHEN (sum(
                            CASE
                               WHEN find_in_set(
                                       pp_special_type.pp_special_code,
                                       @accident)
                               THEN
                                  1
                               ELSE
                                  0
                            END)) >= 1
                   THEN
                      1
                   ELSE
                      0
                END)
              +                                            -- 3 brain remember
               (CASE
                   WHEN (  sum(
                              CASE
                                 WHEN find_in_set(
                                         pp_special_type.pp_special_code,
                                         @amt)
                                 THEN
                                    1
                                 ELSE
                                    0
                              END)
                         + sum(
                              CASE
                                 WHEN find_in_set(
                                         pp_special_type.pp_special_code,
                                         @mmset2002)
                                 THEN
                                    1
                                 ELSE
                                    0
                              END)) >= 1
                   THEN
                      1
                   ELSE
                      0
                END)
              +                                                 -- 4 eye group
               (CASE
                   WHEN (  sum(
                              CASE
                                 WHEN find_in_set(
                                         pp_special_type.pp_special_code,
                                         @eye_min)
                                 THEN
                                    1
                                 ELSE
                                    0
                              END)
                         + sum(
                              CASE
                                 WHEN find_in_set(
                                         pp_special_type.pp_special_code,
                                         @eye_max)
                                 THEN
                                    1
                                 ELSE
                                    0
                              END)
                         + sum(
                              CASE
                                 WHEN find_in_set(
                                         pp_special_type.pp_special_code,
                                         @eye_mirror)
                                 THEN
                                    1
                                 ELSE
                                    0
                              END)
                         + sum(
                              CASE
                                 WHEN find_in_set(
                                         pp_special_type.pp_special_code,
                                         @eye_stone)
                                 THEN
                                    1
                                 ELSE
                                    0
                              END)
                         + sum(
                              CASE
                                 WHEN find_in_set(
                                         pp_special_type.pp_special_code,
                                         @eye_retina)
                                 THEN
                                    1
                                 ELSE
                                    0
                              END)) >= 1
                   THEN
                      1
                   ELSE
                      0
                END)
              +                                                     -- 5 mouth
               (CASE
                   WHEN (sum(
                            CASE
                               WHEN find_in_set(
                                       pp_special_type.pp_special_code,
                                       @mouth)
                               THEN
                                  1
                               ELSE
                                  0
                            END)) >= 1
                   THEN
                      1
                   ELSE
                      0
                END)
              +                                                      -- 6 knee
               (CASE
                   WHEN (sum(
                            CASE
                               WHEN find_in_set(
                                       pp_special_type.pp_special_code,
                                       @knee)
                               THEN
                                  1
                               ELSE
                                  0
                            END)) >= 1
                   THEN
                      1
                   ELSE
                      0
                END)
              +                                                       -- 7 ltc
               (CASE
                   WHEN (sum(
                            CASE
                               WHEN find_in_set(
                                       pp_special_type.pp_special_code,
                                       @ltc)
                               THEN
                                  1
                               ELSE
                                  0
                            END)) >= 1
                   THEN
                      1
                   ELSE
                      0
                END)
              +                                                    -- 8 blader
               (CASE
                   WHEN (sum(
                            CASE
                               WHEN find_in_set(
                                       pp_special_type.pp_special_code,
                                       @blader)
                               THEN
                                  1
                               ELSE
                                  0
                            END)) >= 1
                   THEN
                      1
                   ELSE
                      0
                END))
                AS sum_score_in_case
      FROM ovst
           LEFT OUTER JOIN opdscreen ON ovst.vn = opdscreen.vn
           LEFT OUTER JOIN pp_special ON ovst.vn = pp_special.vn
           INNER JOIN pp_special_type
              ON pp_special.pp_special_type_id =
                    pp_special_type.pp_special_type_id
           INNER JOIN person ON ovst.hn = person.patient_hn
      WHERE     ovst.vstdate BETWEEN @start_date AND @stop_date
            AND person.nationality = 99
            AND person.sex IN (1, 2)
            AND (person.death <> 'y'
            AND person.discharge_date IS NULL) OR (person.death = 'y' and person.discharge_date > ovst.vstdate and ovst.vstdate BETWEEN @start_date AND @stop_date )
            AND person.house_regist_type_id IN (1, 3)
      GROUP BY person.cid
      HAVING     timestampdiff(year, person.birthdate, max(ovst.vstdate)) >=
                    60
             AND                                            -- start sum value
                (                                             -- 1 metal group
                 ( CASE
                      WHEN (  sum(
                                 CASE
                                    WHEN find_in_set(
                                            pp_special_type.pp_special_code,
                                            @2q)
                                    THEN
                                       1
                                    ELSE
                                       0
                                 END)
                            + sum(
                                 CASE
                                    WHEN find_in_set(
                                            pp_special_type.pp_special_code,
                                            @9q)
                                    THEN
                                       1
                                    ELSE
                                       0
                                 END)
                            + sum(
                                 CASE
                                    WHEN find_in_set(
                                            pp_special_type.pp_special_code,
                                            @st5)
                                    THEN
                                       1
                                    ELSE
                                       0
                                 END)
                            + sum(
                                 CASE
                                    WHEN find_in_set(
                                            pp_special_type.pp_special_code,
                                            @8q)
                                    THEN
                                       1
                                    ELSE
                                       0
                                 END)) >= 1
                      THEN
                         1
                      ELSE
                         0
                   END)
                 +                                                -- 2 acident
                  (CASE
                      WHEN (sum(
                               CASE
                                  WHEN find_in_set(
                                          pp_special_type.pp_special_code,
                                          @accident)
                                  THEN
                                     1
                                  ELSE
                                     0
                               END)) >= 1
                      THEN
                         1
                      ELSE
                         0
                   END)
                 +                                         -- 3 brain remember
                  (CASE
                      WHEN (  sum(
                                 CASE
                                    WHEN find_in_set(
                                            pp_special_type.pp_special_code,
                                            @amt)
                                    THEN
                                       1
                                    ELSE
                                       0
                                 END)
                            + sum(
                                 CASE
                                    WHEN find_in_set(
                                            pp_special_type.pp_special_code,
                                            @mmset2002)
                                    THEN
                                       1
                                    ELSE
                                       0
                                 END)) >= 1
                      THEN
                         1
                      ELSE
                         0
                   END)
                 +                                              -- 4 eye group
                  (CASE
                      WHEN (  sum(
                                 CASE
                                    WHEN find_in_set(
                                            pp_special_type.pp_special_code,
                                            @eye_min)
                                    THEN
                                       1
                                    ELSE
                                       0
                                 END)
                            + sum(
                                 CASE
                                    WHEN find_in_set(
                                            pp_special_type.pp_special_code,
                                            @eye_max)
                                    THEN
                                       1
                                    ELSE
                                       0
                                 END)
                            + sum(
                                 CASE
                                    WHEN find_in_set(
                                            pp_special_type.pp_special_code,
                                            @eye_mirror)
                                    THEN
                                       1
                                    ELSE
                                       0
                                 END)
                            + sum(
                                 CASE
                                    WHEN find_in_set(
                                            pp_special_type.pp_special_code,
                                            @eye_stone)
                                    THEN
                                       1
                                    ELSE
                                       0
                                 END)
                            + sum(
                                 CASE
                                    WHEN find_in_set(
                                            pp_special_type.pp_special_code,
                                            @eye_retina)
                                    THEN
                                       1
                                    ELSE
                                       0
                                 END)) >= 1
                      THEN
                         1
                      ELSE
                         0
                   END)
                 +                                                  -- 5 mouth
                  (CASE
                      WHEN (sum(
                               CASE
                                  WHEN find_in_set(
                                          pp_special_type.pp_special_code,
                                          @mouth)
                                  THEN
                                     1
                                  ELSE
                                     0
                               END)) >= 1
                      THEN
                         1
                      ELSE
                         0
                   END)
                 +                                                   -- 6 knee
                  (CASE
                      WHEN (sum(
                               CASE
                                  WHEN find_in_set(
                                          pp_special_type.pp_special_code,
                                          @knee)
                                  THEN
                                     1
                                  ELSE
                                     0
                               END)) >= 1
                      THEN
                         1
                      ELSE
                         0
                   END)                             -- เอาออก เพราะ hdc ไม่เอา
                                                                          -- +
                                                                   -- -- 7 ltc
                                                                 -- (case when
                                                                          -- (
 -- sum(case when find_in_set(pp_special_type.pp_special_code,@ltc) then 1 else 0 end)
                                                  -- ) >= 1 then 1 else 0 end)

                                                    -- เอาออก เพราะ hdc ไม่เอา
                                                                          -- +
                                                                -- -- 8 blader
                                                                 -- (case when
                                                                          -- (
 -- sum(case when find_in_set(pp_special_type.pp_special_code,@blader) then 1 else 0 end)
                                                  -- ) >= 1 then 1 else 0 end)
                                                                            --
                 ) >= @sumscore
      -- stop sum value

      ORDER BY ovst.hn, ovst.vn) AS temp_701;
