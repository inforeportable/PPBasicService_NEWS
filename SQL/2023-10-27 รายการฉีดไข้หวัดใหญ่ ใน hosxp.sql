-- ปรับปรุงเมื่อ 2023-10-27 
-- ข้อมูลการให้บริการ ฉีดวัคซีนไข้หวัดใหญ่ ตามช่วงวันที่ ในระบบ hosxp 
-- สามารถเปลี่ยนช่วงวันที่ได้
-- เลือกเฉพาะ ที่มีการ วินิจฉัย Z251 หรือ รหัสวัคซีน 815 อย่างใดอย่างหนึ่ง เท่านั้น

SELECT
    cast(ovst.vstdate AS CHAR) AS vstdate,
    ovst.vn,
    person.cid,
    person.pname,
    person.fname,
    person.lname,
    person.sex,
    person.birthdate,
    TIMESTAMPDIFF(
        YEAR,
        person.birthdate,
        ovst.vstdate
    ) AS current_age,
    group_concat(DISTINCT ovstdiag.icd10) AS list_diag,
    group_concat(
        DISTINCT person_vaccine.export_vaccine_code
    ) AS list_export_vaccine_code,
    group_concat(
        DISTINCT person_vaccine.vaccine_name
    ) AS list_vaccine_name,
    group_concat(
        DISTINCT ovst_vaccine.vaccine_lot_no
    ) AS list_vaccine_lot_no,
    village.village_moo,
    village.village_name,
    house.address,
    house.road,
    person.hometel,
    person.home_phone,
    person.worktel,
    person.mobile_phone
FROM
    ovst
LEFT OUTER JOIN opdscreen ON ovst.vn = opdscreen.vn
LEFT OUTER JOIN ovstdiag ON ovst.vn = ovstdiag.vn
LEFT OUTER JOIN ovst_vaccine ON ovst.vn = ovst_vaccine.vn
LEFT OUTER JOIN person_vaccine ON ovst_vaccine.person_vaccine_id = person_vaccine.person_vaccine_id
LEFT OUTER JOIN person ON ovst.hn = person.patient_hn
LEFT OUTER JOIN village ON person.village_id = village.village_id
LEFT OUTER JOIN house ON person.house_id = house.house_id
WHERE
    (
        ovstdiag.icd10 REGEXP 'Z251'
        OR person_vaccine.export_vaccine_code = '815'
    )
AND (
    ovst.vstdate BETWEEN '2022-10-01'
    AND '2023-09-30'
)
GROUP BY
    ovst.vn
ORDER BY
    ovst.vstdate
