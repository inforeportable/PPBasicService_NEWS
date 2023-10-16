SELECT
    cast(v.hospitalcode as char) as hospitalcode,
    cast(o.vstdate as char) as vstdate,
    cast(o.vn as char) as vn,
    cast(o.hn as char) as hn,
    cast(pa.cid as char) as cid,
    cast(pa.pname as char) as pname,
    cast(pa.fname as char) as fname,
    cast(pa.lname as char) as lname,
    cast(et.nhso_eligible_type_name as char) as nhso_eligible_type_name,
    cast(d.NAME  as char) as eligible_check_staff,
    cast(o.oqueue as char) as oqueue,
    cast(vpt.auth_code as char) as auth_code,
    cast(k2.department as char)  AS main_department_name,
    cast(ov.ovst_vaccine_id as char) as ovst_vaccine_id,
    cast(d2.NAME  as char) as claim_staff,
    cast(d3.NAME  as char) as pay_check_staff,
    cast(pv.vaccine_name as char) as vaccine_name,
    cast(ove.ovst_vaccine_eligible_id as char) as ove_ovst_vaccine_eligible_id,
    cast(ove.eligible_status as char) as ove_eligible_status,
    cast(ove.eligible_note as char) as ove_eligible_note,
    cast(ove.eligible_check_datetime as char) as ove_eligible_check_datetime,
    cast(ove.eligible_check_status_code as char) as ove_eligible_check_status_code,
    cast(ove.eligible_check_staff as char) as ove_eligible_check_staff,
    cast(ove.claim_status_code as char) as ove_claim_status_code,
    cast(ove.claim_status as char) as ove_claim_status,
    cast(ove.claim_note as char) as ove_claim_note,
    cast(ove.claim_transaction_uid as char) as ove_claim_transaction_uid,
    cast(ove.claim_staff as char) as ove_claim_staff,
    cast(ove.claim_datetime as char) as ove_claim_datetime,
    cast(ove.claim_nhso_pay_status as char) as ove_claim_nhso_pay_status,
    cast(ove.claim_nhso_pay_check_datetime as char) as ove_claim_nhso_pay_check_datetime,
    cast(ove.claim_nhso_pay_check_staff as char) as ove_claim_nhso_pay_check_staff,
    cast(ove.mohpromt_did_status as char) as ove_mohpromt_did_status,
    cast(ove.mohpromt_did_check_datetime as char) as ove_mohpromt_did_check_datetime,
    cast(ove.ovst_vaccine_id as char) as ove_ovst_vaccine_id,
    cast(ove.ovst_nhso_eligible_id as char) as ove_ovst_nhso_eligible_id,
    cast(ove.ref_key_code as char) as ove_ref_key_code,
    cast(oe.ovst_nhso_eligible_id as char) as oe_ovst_nhso_eligible_id,
    cast(oe.vn as char) as oe_vn,
    cast(oe.nhso_eligible_type_id as char) as oe_nhso_eligible_type_id,
    cast(oe.eligible_status as char) as oe_eligible_status,
    cast(oe.eligible_note as char) as oe_eligible_note,
    cast(oe.eligible_check_datetime as char) as oe_eligible_check_datetime,
    cast(oe.eligible_check_status_code as char) as oe_eligible_check_status_code,
    cast(oe.eligible_check_staff as char) as oe_eligible_check_staff,
    cast(oe.claim_status_code as char) as oe_claim_status_code,
    cast(oe.claim_status as char) as oe_claim_status,
    cast(oe.claim_note as char) as oe_claim_note,
    cast(oe.claim_transaction_uid as char) as oe_claim_transaction_uid,
    cast(oe.claim_verify_url as char) as oe_claim_verify_url,
    cast(oe.claim_staff as char) as oe_claim_staff,
    cast(oe.claim_datetime as char) as oe_claim_datetime,
    cast(oe.claim_nhso_pay_status as char) as oe_claim_nhso_pay_status,
    cast(oe.claim_lab as char) as oe_claim_lab,
    cast(oe.claim_icd10 as char) as oe_claim_icd10,
    cast(oe.claim_nhso_pay_check_datetime as char) as oe_claim_nhso_pay_check_datetime,
    cast(oe.claim_nhso_pay_check_staff as char) as oe_claim_nhso_pay_check_staff,
    cast(oe.mohpromt_did_status as char) as oe_mohpromt_did_status,
    cast(oe.mohpromt_did_check_datetime as char) as oe_mohpromt_did_check_datetime
FROM
    ovst_nhso_eligible oe
    INNER JOIN ovst_vaccine_eligible ove ON ove.ovst_nhso_eligible_id = oe.ovst_nhso_eligible_id
    INNER JOIN ovst o ON o.vn = oe.vn
    INNER JOIN patient pa ON pa.hn = o.hn
    INNER JOIN ovst_vaccine ov ON ov.ovst_vaccine_id = ove.ovst_vaccine_id
    INNER JOIN person_vaccine pv ON pv.person_vaccine_id = ov.person_vaccine_id
    LEFT OUTER JOIN visit_pttype vpt ON vpt.vn = oe.vn
    AND vpt.auth_code <> ""
    LEFT OUTER JOIN ovst_seq oq ON oq.vn = o.vn
    LEFT OUTER JOIN kskdepartment k2 ON k2.depcode = o.main_dep
    LEFT JOIN nhso_eligible_type et ON et.nhso_eligible_type_id = oe.nhso_eligible_type_id
    LEFT JOIN doctor d ON d.CODE = oe.eligible_check_staff
    LEFT JOIN doctor d2 ON d2.CODE = oe.claim_staff
    LEFT JOIN doctor d3 ON d3.CODE = oe.claim_nhso_pay_check_staff,
    (
        select
            opdconfig.hospitalcode
        FROM
            opdconfig
    ) AS v
WHERE
    et.nhso_eligible_type_id IN (3, 4)
    AND ove.ovst_vaccine_id > 0
    AND o.vstdate BETWEEN "2022-10-01" AND DATE(NOW())
ORDER BY
    o.vn
