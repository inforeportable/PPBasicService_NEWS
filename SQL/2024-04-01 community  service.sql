DROP TABLE IF EXISTS ovst_community_service_type_master ;
CREATE TABLE ovst_community_service_type_master LIKE ovst_community_service_type;
SET @id := 0 ;
INSERT IGNORE INTO ovst_community_service_type_master(
ovst_community_service_type_id,
ovst_community_service_type_name,
ovst_community_service_type_code
)
VALUES
-- community_service 2024-04-01
(@id :=@id+1,'1A000 เยี่ยมผู้ป่วยโรคความดันโลหิตสูง','1A000'),
(@id :=@id+1,'1A001 เยี่ยมผู้ป่วยโรคเบาหวาน','1A001'),
(@id :=@id+1,'1A002 เยี่ยมผู้ป่วยโรคมะเร็ง','1A002'),
(@id :=@id+1,'1A003 เยี่ยมผู้ป่วยโรคระบบทางเดินหายใจ','1A003'),
(@id :=@id+1,'1A004 เยี่ยมผู้ป่วยโรคสมองเสื่อม','1A004'),
(@id :=@id+1,'1A005 เยี่ยมผู้ป่วยโรคหลอดเลือดสมอง','1A005'),
(@id :=@id+1,'1A008 เยี่ยมผู้ป่วยโรคเรื้อรังอื่น ๆ','1A008'),
(@id :=@id+1,'1A009 เยี่ยมผู้ป่วยโรคเรื้อรังที่ไม่ระบุรายละเอียด','1A009'),
(@id :=@id+1,'1A010 เยี่ยมผู้ป่วยโรคไข้เลือดออก','1A010'),
(@id :=@id+1,'1A011 เยี่ยมผู้ป่วยโรคอุจจาระร่วง','1A011'),
(@id :=@id+1,'1A012 เยี่ยมผู้ป่วยโรคไข้หวัดใหญ่ 2009','1A012'),
(@id :=@id+1,'1A013 เยี่ยมผู้ป่วยโรคไข้หวัดใหญ่อื่นๆ หรือไม่ระบุรายละเอียด','1A013'),
(@id :=@id+1,'1A014 เยี่ยมผู้ป่วยโรควัณโรค','1A014'),
(@id :=@id+1,'1A015 เยี่ยมผู้ป่วย/ผู้สัมผัสโรคติดต่อทางเพศสัมพันธ์','1A015'),
(@id :=@id+1,'1A016 เยี่ยมผู้ป่วยโรคเอดส์','1A016'),
(@id :=@id+1,'1A018 เยี่ยมผู้ป่วยโรคติดต่ออื่น ๆ','1A018'),
(@id :=@id+1,'1A019 เยี่ยมผู้ป่วยโรคติดต่อที่ไม่ระบุรายละเอียด','1A019'),
(@id :=@id+1,'1A020 เยี่ยมผู้ป่วยโรคจิต','1A020'),
(@id :=@id+1,'1A021 เยี่ยมผู้ป่วยโรควิตกกังวล','1A021'),
(@id :=@id+1,'1A022 เยี่ยมผู้ป่วยโรคซึมเศร้า','1A022'),
(@id :=@id+1,'1A023 เยี่ยมผู้ป่วยโรคปัญญาอ่อน','1A023'),
(@id :=@id+1,'1A024 เยี่ยมผู้ป่วยโรคลมชัก','1A024'),
(@id :=@id+1,'1A025 เยี่ยมผู้พยายามฆ่าตัวตาย','1A025'),
(@id :=@id+1,'1A028 เยี่ยมผู้ป่วยโรคจิตและปัญหาสุขภาพจิตอื่นๆ','1A028'),
(@id :=@id+1,'1A029 เยี่ยมผู้ป่วยโรคจิตและปัญหาสุขภาพจิต ไม่ระบุรายละเอียด','1A029'),
(@id :=@id+1,'1A030 เยี่ยมผู้ป่วยที่ได้รับบาดเจ็บจากอุบัติเหตุ','1A030'),
(@id :=@id+1,'1A031 เยี่ยมผู้ป่วยที่ได้รับบาดเจ็บจากการถูกทำร้ายโดยคน','1A031'),
(@id :=@id+1,'1A032 เยี่ยมผู้ป่วยที่ได้รับบาดเจ็บจากการถูกทำร้ายโดยสัตว์','1A032'),
(@id :=@id+1,'1A038 เยี่ยมผู้ป่วยที่ได้รับบาดเจ็บจากสาเหตุภายนอกอื่น ๆ','1A038'),
(@id :=@id+1,'1A039 เยี่ยมผู้ป่วยที่ได้รับบาดเจ็บจากสาเหตุภายนอกที่ไม่ระบุรายละเอียด','1A039'),
(@id :=@id+1,'1A10 เยี่ยมผู้ป่วยหลังผ่าตัด','1A10'),
(@id :=@id+1,'1A11 เยี่ยมผู้ป่วยที่มีใบติดตามจากโรงพยาบาล','1A11'),
(@id :=@id+1,'1A12 เยี่ยมผู้ป่วยที่ต้องการดูแลอย่างต่อเนื่องจากโรงพยาบาล','1A12'),
(@id :=@id+1,'1A13 เยี่ยมติดตามผู้ป่วยขาดนัด','1A13'),
(@id :=@id+1,'1A14 เยี่ยมผู้ป่วยหลังจากรับ/ส่งต่อ (refer) จากโรงพยาบาล','1A14'),
(@id :=@id+1,'1A18 เยี่ยมผู้ป่วยหลังได้รับการรักษาอื่นๆ','1A18'),
(@id :=@id+1,'1A19 เยี่ยมผู้ป่วยหลังได้รับการรักษา ไม่ระบุรายละเอียด','1A19'),
(@id :=@id+1,'1A200 เยี่ยมหญิงตั้งครรภ์แรก','1A200'),
(@id :=@id+1,'1A201 เยี่ยมหญิงตั้งครรภ์น้ำหนักน้อยกว่าเกณฑ์','1A201'),
(@id :=@id+1,'1A202 เยี่ยมหญิงตั้งครรภ์ที่มีภาวะเสี่ยง','1A202'),
(@id :=@id+1,'1A203 เยี่ยมหญิงตั้งครรภ์ที่แยกทางกับสามี','1A203'),
(@id :=@id+1,'1A208 เยี่ยมหญิงตั้งครรภ์กิจกรรมอื่นๆ','1A208'),
(@id :=@id+1,'1A209 เยี่ยมหญิงตั้งครรภ์ ไม่ระบุรายละเอียด','1A209'),
(@id :=@id+1,'1A210 เยี่ยมหญิงหลังคลอด ครั้งที่ 1 (1-2 สัปดาห์) ที่ไม่มีภาวะผิดปกติ','1A210'),
(@id :=@id+1,'1A211 เยี่ยมหญิงหลังคลอด ครั้งที่ 1 (1-2 สัปดาห์) ที่มีภาวะผิดปกติ','1A211'),
(@id :=@id+1,'1A212 เยี่ยมหญิงหลังคลอด ครั้งที่ 1 (1-2 สัปดาห์) ไม่ระบุรายละเอียด','1A212'),
(@id :=@id+1,'1A213 เยี่ยมหญิงหลังคลอด ครั้งที่ 2 (4-6 สัปดาห์) ที่ไม่มีภาวะผิดปกติ','1A213'),
(@id :=@id+1,'1A214 เยี่ยมหญิงหลังคลอด ครั้งที่ 2 (4-6 สัปดาห์) ที่มีภาวะผิดปกติ','1A214'),
(@id :=@id+1,'1A215 เยี่ยมหญิงหลังคลอด ครั้งที่ 2 (4-6 สัปดาห์) ไม่ระบุรายละเอียด','1A215'),
(@id :=@id+1,'1A216 เยี่ยมหญิงหลังคลอด ครั้งอื่น ที่ไม่มีภาวะผิดปกติ','1A216'),
(@id :=@id+1,'1A217 เยี่ยมหญิงหลังคลอด ครั้งอื่น ที่มีภาวะผิดปกติ','1A217'),
(@id :=@id+1,'1A218 เยี่ยมหญิงหลังคลอด ครั้งอื่น ไม่ระบุรายละเอียด','1A218'),
(@id :=@id+1,'1A219 เยี่ยมหญิงหลังคลอด ไม่ระบุรายละเอียด','1A219'),
(@id :=@id+1,'1A220 เยี่ยมทารกแรกเกิด ครั้งที่ 1 (1-2 สัปดาห์) ที่ไม่มีภาวะผิดปกติ','1A220'),
(@id :=@id+1,'1A221 เยี่ยมทารกแรกเกิด ครั้งที่ 1 (1-2 สัปดาห์) ที่มีภาวะผิดปกติ','1A221'),
(@id :=@id+1,'1A222 เยี่ยมทารกแรกเกิด ครั้งที่ 1 (1-2 สัปดาห์) ไม่ระบุรายละเอียด','1A222'),
(@id :=@id+1,'1A223 เยี่ยมทารกแรกเกิด ครั้งที่ 2 (4-6 สัปดาห์)','1A223'),
(@id :=@id+1,'1A224 เยี่ยมทารกแรกเกิด ครั้งที่ 2 (4-6 สัปดาห์) ที่มีภาวะผิดปกติ','1A224'),
(@id :=@id+1,'1A225 เยี่ยมทารกแรกเกิด ครั้งที่ 2 (4-6 สัปดาห์) ไม่ระบุรายละเอียด','1A225'),
(@id :=@id+1,'1A226 เยี่ยมทารกแรกเกิด ครั้งอื่น ที่ไม่มีภาวะผิดปกติ','1A226'),
(@id :=@id+1,'1A227 เยี่ยมทารกแรกเกิด ครั้งอื่น ที่มีภาวะผิดปกติ','1A227'),
(@id :=@id+1,'1A228 เยี่ยมทารกแรกเกิด ครั้งอื่น ไม่ระบุรายละเอียด','1A228'),
(@id :=@id+1,'1A229 เยี่ยมทารกแรกเกิด ไม่ระบุรายละเอียด','1A229'),
(@id :=@id+1,'1A30 เยี่ยมผู้พิการทางการมองเห็น','1A30'),
(@id :=@id+1,'1A31 เยี่ยมผู้พิการทางการได้ยินหรือสื่อความหมาย','1A31'),
(@id :=@id+1,'1A32 เยี่ยมผู้พิการทางการเคลื่อนไหวหรือทางร่างกาย','1A32'),
(@id :=@id+1,'1A33 เยี่ยมผู้พิการทางจิตใจหรือพฤติกรรม หรือออทิสติก','1A33'),
(@id :=@id+1,'1A34 เยี่ยมผู้พิการทางสติปัญญา','1A34'),
(@id :=@id+1,'1A35 เยี่ยมผู้พิการทางการเรียนรู้','1A35'),
(@id :=@id+1,'1A39 เยี่ยมผู้ที่ความพิการยังไม่ได้รับการวินิจฉัยยืนยัน','1A39'),
(@id :=@id+1,'1A400 เยี่ยมเด็กอายุ 0 – 5 ปี ขาดอาหาร','1A400'),
(@id :=@id+1,'1A401 เยี่ยมเด็กอายุ 0 – 5 ปี อ้วน','1A401'),
(@id :=@id+1,'1A402 เยี่ยมเด็กอายุ 0 – 5 ปี กลุ่มเสี่ยง(ค่อนข้างเตี้ย ค่อนข้างผอม น้ำหนักค่อนข้างน้อย ท้วม)','1A402'),
(@id :=@id+1,'1A403 เยี่ยมเด็กอายุ 0 – 5 ปี ที่มีการเจริญเติบโตดีแต่แนวโน้มการเจริญเติบโตไม่ดี','1A403'),
(@id :=@id+1,'1A404 เยี่ยมเด็กอายุ 0 – 5 ปี เพื่อติดตามพัฒนาการเด็กที่บกพร่อง / พัฒนาการไม่สมวัย','1A404'),
(@id :=@id+1,'1A405 เยี่ยมเด็กอายุ 0 – 5 ปี เพื่อติดตามเด็กที่มีโรคประจำตัว/ โรคร้ายแรง/ โรคที่ต้องเฝ้าระวัง','1A405'),
(@id :=@id+1,'1A406 เยี่ยมเด็กอายุ 0 – 5 ปี เพื่อติดตามเด็กให้ได้รับวัคซีนครบตามเกณฑ์/ เด็กขาดการรับวัคซีนตามนัด','1A406'),
(@id :=@id+1,'1A407 เยี่ยมเด็กอายุ 0 – 5 ปี เพื่อแนะนำผู้ปกครอง เรื่อง การแปรงฟันที่ถูกต้อง ด้วยยาสีฟันผสมฟลูออไรด์','1A407'),
(@id :=@id+1,'1A408 เยี่ยมเด็กอายุ 0 – 5 ปี กิจกรรมการให้บริการอื่น','1A408'),
(@id :=@id+1,'1A409 เยี่ยมเด็กอายุ 0 – 5 ปี ไม่ระบุกิจกรรม','1A409'),
(@id :=@id+1,'1A410 เยี่ยมเด็กอายุ 6 - 18 ปี ขาดอาหาร','1A410'),
(@id :=@id+1,'1A411 เยี่ยมเด็กอายุ 6 - 18 ปี อ้วน','1A411'),
(@id :=@id+1,'1A412 เยี่ยมเด็กอายุ 6 - 18 ปี อยู่ในกลุ่มเสี่ยง (ค่อนข้างเตี้ย ค่อนข้างผอม น้ำหนักค่อนข้างน้อย ท้วม)','1A412'),
(@id :=@id+1,'1A413 เยี่ยมเด็กอายุ 6 - 18 ปี ที่มีการเจริญเติบโตดีแต่แนวโน้มการเจริญเติบโตไม่ดี','1A413'),
(@id :=@id+1,'1A418 เยี่ยมเด็กอายุ 6 - 18 ปี กลุ่มอื่น','1A418'),
(@id :=@id+1,'1A419 เยี่ยมเด็กอายุ 6 – 18 ปี ไม่ระบุรายละเอียด','1A419'),
(@id :=@id+1,'1A420 เยี่ยมกลุ่มวัยแรงงานเพื่อติดตามภาวะเสี่ยงในการทำงาน ด้านการเกษตร','1A420'),
(@id :=@id+1,'1A421 เยี่ยมกลุ่มวัยแรงงานเพื่อติดตามภาวะเสี่ยงในการทำงาน ในโรงงานอุตสาหกรรม','1A421'),
(@id :=@id+1,'1A422 เยี่ยมกลุ่มวัยแรงงานเพื่อติดตามภาวะเสี่ยงในการทำงานด้านอุตสาหกรรมในครัวเรือน','1A422'),
(@id :=@id+1,'1A428 เยี่ยมกลุ่มวัยแรงงานเพื่อติดตามภาวะเสี่ยงในการทำงานด้านอื่น ๆ','1A428'),
(@id :=@id+1,'1A429 เยี่ยมกลุ่มวัยแรงงาน ไม่ระบุรายละเอียด','1A429'),
(@id :=@id+1,'1A430 เยี่ยมผู้สูงอายุที่อยู่เพียงลำพัง','1A430'),
(@id :=@id+1,'1A431 เยี่ยมผู้สูงอายุที่ไม่อยู่เพียงลำพัง','1A431'),
(@id :=@id+1,'1A439 เยี่ยมผู้สูงอายุ ไม่ระบุรายละเอียด','1A439'),
(@id :=@id+1,'1A50 เยี่ยมผู้ประสบภัยพิบัติทางธรรมชาติ','1A50'),
(@id :=@id+1,'1A51 เยี่ยมผู้ประสบภัยพิบัติที่เกิดจากไฟ','1A51'),
(@id :=@id+1,'1A52 เยี่ยมผู้ประสบภัยพิบัติทางสงคราม','1A52'),
(@id :=@id+1,'1A53 เยี่ยมและเยียวยาผู้ประสบภัยพิบัติจากการเข้าแทรกแซงตามกฎหมาย','1A53'),
(@id :=@id+1,'1A54 เยี่ยมและเยียวยาผู้ประสบภัยพิบัติจากการก่อการร้าย/จลาจล','1A54'),
(@id :=@id+1,'1A58 เยี่ยมและเยียวยาผู้ประสบภัยพิบัติอื่น ๆ','1A58'),
(@id :=@id+1,'1A59 เยี่ยมและเยียวยาผู้ประสบภัยพิบัติที่ไม่ระบุรายละเอียด','1A59'),
(@id :=@id+1,'1A90 เยี่ยมบ้านประชาชนสุขภาพดีเพื่อกิจกรรมการให้บริการเฉพาะเรื่อง','1A90'),
(@id :=@id+1,'1A99 เยี่ยมบ้านประชาชนสุขภาพดีทั่วไป','1A99'),
(@id :=@id+1,'1B000 การตรวจคัดกรองความเสี่ยง / โรคเบาหวาน','1B000'),
(@id :=@id+1,'1B001 การตรวจคัดกรองความเสี่ยง / โรคความดันโลหิตสูง','1B001'),
(@id :=@id+1,'1B002 การตรวจคัดกรองความเสี่ยง / โรคหัวใจและหลอดเลือด','1B002'),
(@id :=@id+1,'1B003 การตรวจคัดกรองความเสี่ยง / โรคมะเร็งเต้านม','1B003'),
(@id :=@id+1,'1B004 การตรวจคัดกรองความเสี่ยง / โรคมะเร็งปากมดลูก','1B004'),
(@id :=@id+1,'1B005 การตรวจคัดกรองความเสี่ยง / โรคธาลาสซีเมีย','1B005'),
(@id :=@id+1,'1B008 การตรวจคัดกรองความเสี่ยง / โรคเรื้อรัง อื่นๆ','1B008'),
(@id :=@id+1,'1B009 การตรวจคัดกรองความเสี่ยง ไม่ระบุรายละเอียด','1B009'),
(@id :=@id+1,'1B01 การตรวจคัดกรองความเสี่ยง / โรคติดต่อ','1B01'),
(@id :=@id+1,'1B020 การตรวจคัดกรองโรคจิต','1B020'),
(@id :=@id+1,'1B021 การตรวจคัดกรองโรคซึมเศร้า','1B021'),
(@id :=@id+1,'1B022 การตรวจคัดกรองโรคออทิสติก ในเด็กอายุ 0 – 6 ปี','1B022'),
(@id :=@id+1,'1B023 การตรวจคัดกรองภาวะเครียด','1B023'),
(@id :=@id+1,'1B024 ดัชนีชี้วัดสุขภาพจิตคนไทย','1B024'),
(@id :=@id+1,'1B025 ดัชนีชี้วัดความสุขคนไทย','1B025'),
(@id :=@id+1,'1B028 การตรวจคัดกรองความเสี่ยง / โรคทางจิตเวช อื่น ๆ','1B028'),
(@id :=@id+1,'1B029 การตรวจคัดกรองความเสี่ยง ไม่ระบุรายละเอียด','1B029'),
(@id :=@id+1,'1B100 การตรวจคัดกรองเพื่อค้นหาเด็กพิการทางกายและทางจิต','1B100'),
(@id :=@id+1,'1B101 การตรวจคัดกรองเพื่อค้นหาเด็กพัฒนาการช้า','1B101'),
(@id :=@id+1,'1B102 การตรวจคัดกรองเพื่อค้นหาเด็กกระดูกสันหลังคด','1B102'),
(@id :=@id+1,'1B103 การตรวจคัดกรองเพื่อค้นหาเด็กอ้วนที่มีกิจกรรมทางกายต่ำ','1B103'),
(@id :=@id+1,'1B108 การตรวจคัดกรองความเสี่ยง / เฝ้าระวัง ในเด็ก อื่น ๆ','1B108'),
(@id :=@id+1,'1B109 การตรวจคัดกรองความเสี่ยง / เฝ้าระวัง ในเด็ก ไม่ระบุรายละเอียด','1B109'),
(@id :=@id+1,'1B110 การตรวจคัดกรองเพื่อค้นหาผู้ที่อาจมีภาวะเสี่ยงต่อการบาดเจ็บจากการทำงาน','1B110'),
(@id :=@id+1,'1B111 การตรวจคัดกรองเพื่อค้นหาคนทำงานที่มีกิจกรรมทางกายต่ำ','1B111'),
(@id :=@id+1,'1B112 การตรวจคัดกรองเพื่อติดตามโรคทางจิต','1B112'),
(@id :=@id+1,'1B129 การตรวจคัดกรองความเสี่ยง / เฝ้าระวังในผู้สูงอายุ ไม่ระบุรายละเอียด','1B129'),
(@id :=@id+1,'1C00 การปรับเปลี่ยนพฤติกรรมเพื่อการเลิกสุรา','1C00'),
(@id :=@id+1,'1C01 การปรับเปลี่ยนพฤติกรรมเพื่อการเลิกบุหรี่','1C01'),
(@id :=@id+1,'1C02 การปรับเปลี่ยนพฤติกรรมเพื่อการเลิกยาเสพติด','1C02'),
(@id :=@id+1,'1C10 การฝึกทักษะการออกกำลังกาย','1C10'),
(@id :=@id+1,'1C11 การฝึกทักษะการออกกำลังกายเพื่อการฟื้นฟูสภาพ','1C11'),
(@id :=@id+1,'1C20 การติดตามพฤติกรรมเสี่ยงในการบริโภคของกลุ่มวัยแรงงาน','1C20'),
(@id :=@id+1,'1C3 การปรับเปลี่ยนพฤติกรรมความเสี่ยงโรคความดันโลหิตสูง','1C3'),
(@id :=@id+1,'1C4 การปรับเปลี่ยนพฤติกรรมความเสี่ยงโรคเบาหวาน','1C4'),
(@id :=@id+1,'1D00 ทาฟลูออไรด์ในเด็กอายุ 0-2 ปี','1D00'),
(@id :=@id+1,'1D01 แจกแปรงสีฟันในเด็กอายุ 18 เดือน','1D01'),
(@id :=@id+1,'1D02 ให้ทันตสุขศึกษาหญิงตั้งครรภ์','1D02'),
(@id :=@id+1,'1D03 สอน/แนะนำ ให้ผู้ดูแลหรือผู้พิการ แปรงฟัน ถูกวิธี ตามสภาพของตัวผู้พิการด้วยยาสีฟันผสมฟลูออไรด์','1D03'),
(@id :=@id+1,'1D04 สอน/แนะนำ ให้ผู้ดูแลหรือผู้สูงอายุ แปรงฟัน ถูกวิธี ตามสภาพของตัวผู้สูงอายุด้วยยาสีฟันผสมฟลูออไรด์','1D04'),
(@id :=@id+1,'1D05 ฝึกแปรงฟันด้วยยาสีฟันผสมฟลูออไรด์โดยผู้ปกครองแปรงให้เด็กเป็นรายคน','1D05'),
(@id :=@id+1,'1D08 การให้บริการทันตสาธารณสุขอื่น ๆ','1D08'),
(@id :=@id+1,'1D09 การให้บริการทันตสาธารณสุข ไม่ระบุรายละเอียด','1D09'),
(@id :=@id+1,'1D10 ตรวจรอยโรคฟันผุในเด็กอายุ 3-5 ปี','1D10'),
(@id :=@id+1,'1D11 ตรวจความสะอาดช่องปากในเด็กอายุ 3-5 ปี','1D11'),
(@id :=@id+1,'1D12 ตรวจรอยโรคฟันผุหญิงตั้งครรภ์','1D12'),
(@id :=@id+1,'1D13 ตรวจสภาพเหงือกหญิงตั้งครรภ์','1D13'),
(@id :=@id+1,'1D18 ตรวจสุขภาพช่องปากอื่น ๆ','1D18'),
(@id :=@id+1,'1D19 ตรวจสุขภาพช่องปาก ไม่ระบุรายละเอียด','1D19'),
(@id :=@id+1,'1D20 การตรวจ และคัดกรองรอยโรคก่อมะเร็งในช่องปาก','1D20'),
(@id :=@id+1,'1D21 การตรวจรอยโรคมะเร็งในช่องปาก','1D21'),
(@id :=@id+1,'1D28 การตรวจ และคัดกรองมะเร็งช่องปากอื่น ๆ','1D28'),
(@id :=@id+1,'1E00 การเฝ้าระวังโภชนาการในหญิงตั้งครรภ์','1E00'),
(@id :=@id+1,'1E01 การประเมินสารไอโอดีนในหญิงตั้งครรภ์','1E01'),
(@id :=@id+1,'1E10 การเฝ้าระวังการเจริญเติบโตของเด็กในกลุ่มอายุ 0-5 ปี','1E10'),
(@id :=@id+1,'1E11 การตรวจคัดกรองภาวะอ้วนในประชาชนอายุ 15 ปีขึ้นไป โดยการวัดเส้นรอบเอว หรือประเมินค่าดัชนีมวลกาย','1E11'),
(@id :=@id+1,'1E12 การตรวจคัดกรองภาวะอ้วนในประชาชนอายุ 15 ปีขึ้นไป ที่มีภาวะอ้วนลงพุง (โดยการวัดเส้นรอบเอว)','1E12'),
(@id :=@id+1,'1E13 การตรวจคัดกรองภาวะอ้วนในประชาชนอายุ 15 ปีขึ้นไป ที่มีภาวะอ้วน (ประเมินค่าดัชนีมวลกาย)','1E13'),
(@id :=@id+1,'1E18 กิจกรรมโภชนาการเฉพาะเรื่อง / เฉพาะกลุ่มอื่น ๆ','1E18'),
(@id :=@id+1,'1F00 การให้บริการปรึกษาทางด้านสุขภาพจิตทางโทรศัพท์','1F00'),
(@id :=@id+1,'1F08 การให้บริการปรึกษาทางด้านจิตเวชอื่น ๆ','1F08'),
(@id :=@id+1,'1F09 การให้บริการปรึกษาทางด้านจิตเวช ไม่ระบุรายละเอียด','1F09'),
(@id :=@id+1,'1F10 การให้บริการปรึกษา/ให้ความรู้ ผู้ที่ติดสุราเพื่อลด/เลิกสุรา','1F10'),
(@id :=@id+1,'1F11 การให้บริการปรึกษา/ให้ความรู้ ผู้ที่ติดบุหรี่เพื่อลด/เลิกบุหรี่','1F11'),
(@id :=@id+1,'1F12 การให้บริการปรึกษา/ให้ความรู้ ผู้ที่ติดยาเสพติดเพื่อลด/เลิกยาเสพติด','1F12'),
(@id :=@id+1,'1F18 การให้บริการปรึกษา/ให้ความรู้ ทางด้านสารเสพติดอื่นๆ','1F18'),
(@id :=@id+1,'1F19 การให้บริการปรึกษา/ให้ความรู้ ทางด้านสารเสพติด ไม่ระบุรายละเอียด','1F19'),
(@id :=@id+1,'1F20 การให้บริการปรึกษา/ให้ความรู้ เรื่องเพศสัมพันธ์','1F20'),
(@id :=@id+1,'1F21 การให้บริการปรึกษาเรื่องปัญหาครอบครัว','1F21'),
(@id :=@id+1,'1F28 การให้บริการปรึกษาในวัยรุ่นเรื่องสุขภาพอื่น ๆ','1F28'),
(@id :=@id+1,'1F29 การให้บริการปรึกษาในวัยรุ่น ไม่ระบุรายละเอียด','1F29'),
(@id :=@id+1,'1F8 การให้บริการติดตาม/ให้คำปรึกษา/ให้ความรู้และแนะนำทางด้านสุขภาพอื่น','1F8'),
(@id :=@id+1,'1G00 การให้บริการกิจกรรมกายภาพบำบัด','1G00'),
(@id :=@id+1,'1G01 การให้บริการผู้ป่วยร่วมกับหน่วยงานอื่น / สหวิชาชีพ','1G01'),
(@id :=@id+1,'1G08 การให้บริการอื่นที่ระบุรายละเอียดแก่ผู้ป่วยในชุมชน','1G08'),
(@id :=@id+1,'1G09 การให้บริการผู้ป่วยในชุมชน ไม่ระบุรายละเอียด','1G09'),
(@id :=@id+1,'1G10 การให้คำแนะนำญาติที่ดูแลผู้ป่วยใส่สายให้อาหาร (NG tube)','1G10'),
(@id :=@id+1,'1G11 การให้คำแนะนำญาติที่ดูแลผู้ป่วยใส่ท่อหลอดลม คอ และการดูดเสมหะ','1G11'),
(@id :=@id+1,'1G12 การให้คำแนะนำญาติที่ดูแลผู้ป่วยใส่สายสวนปัสสาวะ','1G12'),
(@id :=@id+1,'1G13 การให้คำแนะนำญาติที่ดูแลผู้ป่วยที่มียาฉีด เช่น อินซูลิน ฯลฯ','1G13'),
(@id :=@id+1,'1G14 การให้คำแนะนำญาติที่ดูแลผู้ป่วยที่มีบาดแผล','1G14'),
(@id :=@id+1,'1G18 การให้คำแนะนำญาติที่ดูแลผู้ป่วยอื่น ๆ','1G18'),
(@id :=@id+1,'1G19 การให้คำแนะนำญาติที่ดูแลผู้ป่วย ไม่ระบุรายละเอียด','1G19'),
(@id :=@id+1,'1H000 ตรวจสุขภาพช่องปากในนักเรียน','1H000'),
(@id :=@id+1,'1H001 ตรวจรอยโรคฟันผุในนักเรียน','1H001'),
(@id :=@id+1,'1H010 การให้บริการ เคลือบหลุมร่องฟัน (sealant) ในนักเรียน','1H010'),
(@id :=@id+1,'1H020 การให้บริการ ฟลูออไรค์เฉพาะที่ ในนักเรียน','1H020'),
(@id :=@id+1,'1H030 ตรวจการยึดติดไม่สมบูรณ์ของสารเคลือบหลุมร่องฟัน ในนักเรียน','1H030'),
(@id :=@id+1,'1H031 ตรวจการยึดติดของสารเคลือบหลุมร่องฟัน ในนักเรียน พบติดสมบูรณ์','1H031'),
(@id :=@id+1,'1H040 ตรวจเหงือกตามระบบเฝ้าระวังทันตสุขภาพ ในนักเรียน','1H040'),
(@id :=@id+1,'1H041 ตรวจเหงือกตามระบบเฝ้าระวังทันตสุขภาพ ในนักเรียนชั้นมัธยมศึกษา (อายุ 13-18 ปี)','1H041'),
(@id :=@id+1,'1H050 ตรวจฟันผุตามระบบเฝ้าระวังทันตสุขภาพ ในนักเรียน','1H050'),
(@id :=@id+1,'1H051 ตรวจฟันผุตามระบบเฝ้าระวังทันตสุขภาพ ในนักเรียนชั้นมัธยมศึกษา (อายุ 13-18 ปี)','1H051'),
(@id :=@id+1,'1H060 ตรวจฟันตกกระตามระบบเฝ้าระวังทันตสุขภาพ ในนักเรียนพบฟันตกกระและรักษา','1H060'),
(@id :=@id+1,'1H061 ตรวจฟันตกกระตามระบบเฝ้าระวังทันตสุขภาพ ในนักเรียน-พบฟันตกกระและไม่ได้รักษา','1H061'),
(@id :=@id+1,'1H070 ตรวจสุขภาพช่องปากตามเกณฑ์โรงเรียนส่งเสริมสุขภาพในนักเรียนชั้นประถมศึกษา (อายุ 6-12 ปี)','1H070'),
(@id :=@id+1,'1H071 ตรวจสุขภาพช่องปากตามเกณฑ์โรงเรียนส่งเสริมสุขภาพในนักเรียนชั้นมัธยมศึกษา (อายุ 13-18 ปี)','1H071'),
(@id :=@id+1,'1H08 การให้บริการสุขภาพช่องปากอื่น ๆ','1H08'),
(@id :=@id+1,'1H080 การขัดและทำความสะอาดฟัน','1H080'),
(@id :=@id+1,'1H10 ติดตามภาวะทางจิตในกลุ่มวัยเรียนอายุ 6 - 18 ปี และเด็กวัยรุ่น','1H10'),
(@id :=@id+1,'1H18 การให้บริการทางด้านจิตเวชอื่น ๆ','1H18'),
(@id :=@id+1,'1H19 การให้บริการด้านจิตเวช ไม่ระบุรายละเอียด','1H19'),
(@id :=@id+1,'1H200 ตรวจหูในนักเรียนชั้นประถมศึกษา','1H200'),
(@id :=@id+1,'1H201 ตรวจหูในนักเรียนชั้นมัธยมศึกษา','1H201'),
(@id :=@id+1,'1H202 แก้ไขโรคของหูในนักเรียนชั้นประถมศึกษา','1H202'),
(@id :=@id+1,'1H203 แก้ไขโรคของหูในนักเรียนชั้นมัธยมศึกษา','1H203'),
(@id :=@id+1,'1H204 ตรวจการได้ยินในนักเรียนชั้นประถมศึกษา','1H204'),
(@id :=@id+1,'1H205 ตรวจการได้ยินในนักเรียนชั้นมัธยมศึกษา','1H205'),
(@id :=@id+1,'1H206 แก้ไขอาการผิดปกติของการได้ยินในนักเรียนชั้นประถมศึกษา','1H206'),
(@id :=@id+1,'1H207 แก้ไขอาการผิดปกติของการได้ยินในนักเรียนชั้นมัธยมศึกษา','1H207'),
(@id :=@id+1,'1H2080 การตรวจคัดกรองการได้ยิน ปกติทั้ง 2 ข้าง','1H2080'),
(@id :=@id+1,'1H2081 การตรวจคัดกรองการได้ยินผิดปกติทั้ง 2 ข้างหรือข้างใดข้างหนึ่ง ได้รับการรักษา','1H2081'),
(@id :=@id+1,'1H2082 การตรวจคัดกรองการได้ยินผิดปกติทั้ง 2 ข้างหรือข้างใดข้างหนึ่ง ได้รับการส่งต่อ','1H2082'),
(@id :=@id+1,'1H2083 การตรวจคัดกรองการได้ยินผิดปกติทั้ง 2 ข้างหรือข้างใดข้างหนึ่ง ไม่ได้ส่งต่อและรักษา','1H2083'),
(@id :=@id+1,'1H210 ตรวจตาในนักเรียนชั้นประถมศึกษา','1H210'),
(@id :=@id+1,'1H211 ตรวจตาในนักเรียนชั้นมัธยมศึกษา','1H211'),
(@id :=@id+1,'1H212 แก้ไขโรคตาในนักเรียนชั้นประถมศึกษา','1H212'),
(@id :=@id+1,'1H213 แก้ไขโรคตาในนักเรียนชั้นมัธยมศึกษา','1H213'),
(@id :=@id+1,'1H214 ตรวจสายตาในนักเรียนชั้นประถมศึกษา','1H214'),
(@id :=@id+1,'1H215 ตรวจสายตาในนักเรียนชั้นมัธยมศึกษา','1H215'),
(@id :=@id+1,'1H216 แก้ไขอาการสายตาผิดปกติในนักเรียนชั้นประถมศึกษา','1H216'),
(@id :=@id+1,'1H217 แก้ไขอาการสายตาผิดปกติในนักเรียนชั้นมัธยมศึกษา','1H217'),
(@id :=@id+1,'1H2180 การตรวจคัดกรองสายตา ต าซ้าย ค่า VA20/20 ฟุต (6/6 เมตร)','1H2180'),
(@id :=@id+1,'1H2181 การตรวจคัดกรองสายตา ตาช้าย ค่า VA20/30 ฟุต (6/9 เมตร)','1H2181'),
(@id :=@id+1,'1H2182 การตรวจคัคกร องสายตา ตาซ้าย ค่า VA20/40 ฟูต (6/12 เมตร)','1H2182'),
(@id :=@id+1,'1H2183 การตรวจคัดกรองสายตา ตาขวา ค่า VA20/20 ฟุต (6/6 เมตร)','1H2183'),
(@id :=@id+1,'1H2184 การตรวจตัดกรองสายตา ตาขวา ค่า YA20/30 ฟุต (6/9 เมตร)','1H2184'),
(@id :=@id+1,'1H2185 การตรวจคัดกรองสายตา ตาขวา ค่า VA20/40 ฟุต (6/12 เมตร)','1H2185'),
(@id :=@id+1,'1H2186 การตรวจกัดกรองสายตา ผิดปกติทั้ง 2 ข้างหรือข้างใดข้างหนึ่ง (VA 2 20/50) ได้รับการรักษา','1H2186'),
(@id :=@id+1,'1H2187 การตรวจกัดกรองสายตา ผิดปกติทั้ง 2 ข้างหรือข้างใดข้างหนึ่ง (VA Z 20/50) ได้รับการส่งต่อ','1H2187'),
(@id :=@id+1,'1H2188 การตรวจคัดกรองสาบตา ผิดปกติทั้ง 2 ข้างหรือข้างใดข้างหนึ่ง (VA Z 20/50) ไม่ได้ส่งต่อและรักษา','1H2188'),
(@id :=@id+1,'1H281 นักเรียนที่ได้รับการตรวจเหาและได้รับการแก้ไข','1H281'),
(@id :=@id+1,'1H2810 นักเรียนได้รับการตรวจและไม่พบเหา','1H2810'),
(@id :=@id+1,'1H2811 นักเรียนได้รับการตรวพบเหาและได้รับการแก้ไข','1H2811'),
(@id :=@id+1,'1H2812 นักเรียนได้รับการตรวจพบเหา ไม่ได้รับการแก้ไข','1H2812'),
(@id :=@id+1,'1H288 นักเรียนที่ได้รับการตรวจสุขภาพประจำปีอื่น ๆ','1H288'),
(@id :=@id+1,'1H2190 การตรวจคัดกรองสายตา ตาช้าย ค่า VA20/50 ฟุต (6/1 8 เมตร)','1H2190'),
(@id :=@id+1,'1H2191 การตรวจกัดกร องสายตา ตาซ้าย ค่า V A20/70 ฟุต (6/24 เมตร)','1H2191'),
(@id :=@id+1,'1H2192 การตรวจคัดกรองสายตา ตาซ้าย ค่า VA20/100 ฟุต (6/36 เมตร)','1H2192'),
(@id :=@id+1,'1H2193 การตรวจคัดกรองสายตา ตาซ้าย ดำ V A20/200 ฟุต (6160 เมตร)','1H2193'),
(@id :=@id+1,'1H2194 การตรวจคัดกรองสายตา ตาขวา ค่า VA20/50 ฟุต (6/18 เมตร)','1H2194'),
(@id :=@id+1,'1H2195 การตรวจคัดกรองสายตา ตาขวา คำ VA20/70 ฟุต (6/24 เมตร)','1H2195'),
(@id :=@id+1,'1H2196 การตรวจตัดกรองสายตา ตาขวา ก่า VA20/100 ฟุต (6/36 เมตร)','1H2196'),
(@id :=@id+1,'1H2197 การตรวจคัดกรองสายตา ตาขวา ก่า VA20/200 ฟุต (6/60 เมตร)','1H2197'),
(@id :=@id+1,'1H300 นักเรียนได้รับการเฝ้าระวังการเจริญเติบโต','1H300'),
(@id :=@id+1,'1H301 นักเรียนได้รับการตรวจภาวะโลหิตจาง','1H301'),
(@id :=@id+1,'1H3010 ตรวจคัดกรองระดับความเข้มข้นของเม็ดเลือดแดง (HB) หรือปริมาณเม็ดเลือดแดงอัดแน่น (HCT) พบปกติ','1H3010'),
(@id :=@id+1,'1H3011 ตรวจคัดกรองระดับความเข้มข้นของเม็ดเลือดแดง (HB) หรือปริมาณเม็ดเลือดแดงอัดแน่น (HCT) พบผิดปกติ และได้ยาเสริมธาตุเหล็กเพื่อรักษา','1H3011'),
(@id :=@id+1,'1H3012 ติดตามผลการตรวจคัดกรองระดับความเข้มข้นของเม็ดเลือดแดง (HB) หรือปริมาณเม็ดเลือดแดงอัดแน่น (HCT) หลังรับประทานยา 1 เดือน ผลปกติ','1H3012'),
(@id :=@id+1,'1H3013 ติดตามผลการตรวจคัดกรองระดับความเข้มข้นของเม็ดเลือดแดง (HB) หรือปริมาณเม็ดเลือดแดงอัดแน่น (HCT) หลังรับประทานยา 1 เดือน ผลผิดปกติและส่งต่อ','1H3013'),
(@id :=@id+1,'1H302 นักเรียนได้รับการตรวจคอพอก','1H302'),
(@id :=@id+1,'1H3030 นักเรียนได้รับการตรวจกัดกรองเด็กอ้วนกลุ่มเสี่ยง Obesity Sign ไม่พบ Obosity Sign พบ Obesity Sign 1 -2 ข้อ','1H3030'),
(@id :=@id+1,'1H3031 นักเรียนได้รับการตรวจคัดกรองเด็กอ้ว่นกลุ่มเสี่ยง พบ Obesity Sign 3 ใน 5 ข้อ ส่งต่อรักษา','1H3031'),
(@id :=@id+1,'1H3032 นักเรียนได้รับการตรวจกัดกรองเด็กอ้วนกลุ่มเสี่ยง พบ Obesity Sign 3 ใน 5 ข้อ ไม่ได้ส่งต่อรักษา','1H3032'),
(@id :=@id+1,'1H308 นักเรียนได้รับการเฝ้าระวังการเจริญเติบโตอื่น ๆ','1H308'),
(@id :=@id+1,'1I00 ผู้ป่วยได้รับการนวดเพื่อการรักษาที่บ้าน','1I00'),
(@id :=@id+1,'1I01 การบริการนวดเพื่อการส่งเสริมสุขภาพที่บ้าน','1I01'),
(@id :=@id+1,'1I02 ผู้ป่วยได้รับการประคบสมุนไพรเพื่อการรักษาที่บ้าน','1I02'),
(@id :=@id+1,'1I020 การบริการประคบสมุนไพรเพื่อการส่งเสริมสุขภาพที่บ้าน','1I020'),
(@id :=@id+1,'1I03 ผู้ป่วยได้รับการอบสมุนไพรเพื่อการรักษาที่บ้าน','1I03'),
(@id :=@id+1,'1I04 การบริการอบสมุนไพรเพื่อการส่งเสริมสุขภาพที่บ้าน','1I04'),
(@id :=@id+1,'1I05 การบริการหญิงหลังคลอดด้วยการอบสมุนไพรที่บ้าน','1I05'),
(@id :=@id+1,'1I050 การบริการหญิงหลังคลอดด้วยการอาบสมุนไพรที่บ้าน','1I050'),
(@id :=@id+1,'1I051 การบริการหญิงหลังคลอดด้วยการประคบสมุนไพรที่บ้าน','1I051'),
(@id :=@id+1,'1I052 การบริการหญิงหลังคลอดด้วยการนวดที่บ้าน','1I052'),
(@id :=@id+1,'1I053 การบริการหญิงหลังคลอดด้วยการนวดเต้านมที่บ้าน','1I053'),
(@id :=@id+1,'1I058 การบริการหญิงหลังคลอดด้วยวิธีอื่น ที่บ้าน','1I058'),
(@id :=@id+1,'1I06 การบริการหญิงหลังคลอดด้วยการทับหม้อเกลือที่บ้าน','1I06'),
(@id :=@id+1,'1I060 การบริการหญิงหลังคลอดด้วยการนั่งถ่านที่บ้าน','1I060'),
(@id :=@id+1,'1I07 การให้คำแนะนำ การสอน สาธิตด้านการแพทย์แผนไทย','1I07'),
(@id :=@id+1,'1I070 การให้คำแนะนำ การสอน สาธิตการบริหารร่างกายด้วยมณีเวชที่บ้าน','1I070'),
(@id :=@id+1,'1I071 การให้คำแนะนำ หญิงหลังคลอด และการบริบาลทารกด้านการแพทย์แผนไทยที่บ้าน','1I071'),
(@id :=@id+1,'1I08 การให้บริการการแพทย์แผนไทยอื่นๆ ที่บ้าน','1I08'),
(@id :=@id+1,'1I080 การให้บริการพอกยาสมุนไพร ที่บ้าน','1I080'),
(@id :=@id+1,'1I081 การให้บริการแช่ยาสมุนไพร ที่บ้าน','1I081'),
(@id :=@id+1,'1I100 การให้บริการกดจุดบำบัด (Acupressure)','1I100'),
(@id :=@id+1,'1I101 การให้บริการนวดปรับสมดุลร่างกาย','1I101'),
(@id :=@id+1,'1I102 การให้บริการสมาธิบำบัด','1I102'),
(@id :=@id+1,'1I103 การให้บริการนวดสวีดิช (Swedish Massage)','1I103'),
(@id :=@id+1,'1I104 การให้บริการนวดเพื่อสุขภาพแบบเนิฟว์แอสซิสต์ (Nerve Assist)','1I104'),
(@id :=@id+1,'1I105 การให้บริการกดจุดสะท้อนเท้า (Foot Reflexology)','1I105'),
(@id :=@id+1,'1I110 การให้บริการเกอร์สันบำบัด (Gerson Therapy)','1I110'),
(@id :=@id+1,'1I111 การให้บริการคีโตเจนิคไดเอต (Ketogenic Diet) /อาหารพร่องแป้ง (Low-Carbohydrate Diet)','1I111'),
(@id :=@id+1,'1I112 การให้บริการแมคโครไบโอติกส์ (Macrobiotics)','1I112'),
(@id :=@id+1,'1I113 การให้บริการอาหารปรับสมดุลฤทธิ์ ร้อน – เย็น','1I113'),
(@id :=@id+1,'1I180 การให้บริการจินตภาพบำบัด (Visualization Therapy)','1I180'),
(@id :=@id+1,'1I181 การให้สมาธิบำบัด/พลังบำบัด','1I181'),
(@id :=@id+1,'1I182 การให้บริการกัวซา (Guasa)','1I182'),
(@id :=@id+1,'1I183 การให้บริการการแพทย์ทางเลือกวิถีธรรม','1I183'),
(@id :=@id+1,'1J00 ให้ความรู้/ สุขศึกษาเกี่ยวกับโรคและการป้องกันโรคต่าง ๆ','1J00'),
(@id :=@id+1,'1J01 ให้ความรู้/ สุขศึกษาเกี่ยวกับโรคตามฤดูกาล','1J01'),
(@id :=@id+1,'1J02 แนะนำ / ให้ความรู้ เรื่องการใช้ยา','1J02'),
(@id :=@id+1,'1J03 ให้ความรู้และจัดกิจกรรมการออกกำลังกายที่ถูกต้องและเหมาะสม','1J03'),
(@id :=@id+1,'1J04 ให้สุขศึกษาในแหล่งแพร่กามโรค','1J04'),
(@id :=@id+1,'1J05 ให้ความรู้ด้านโภชนาการ','1J05'),
(@id :=@id+1,'1J08 ให้ความรู้/ สุขศึกษาเกี่ยวกับสุขภาพอื่น ๆ','1J08'),
(@id :=@id+1,'1J09 การเผยแพร่ความรู้/ให้สุขศึกษาแก่กลุ่มบุคคลทั่วไป ไม่ระบุรายละเอียด','1J09'),
(@id :=@id+1,'1J10 ให้ความรู้/ สุขศึกษาแก่หญิงขายบริการ','1J10'),
(@id :=@id+1,'1J11 ให้ความรู้เกี่ยวกับการดูแลเท้าในผู้ป่วยเบาหวาน','1J11'),
(@id :=@id+1,'1J18 ให้ความรู้/ สุขศึกษาบุคคลเฉพาะกลุ่มอื่น ๆ','1J18'),
(@id :=@id+1,'1J19 การเผยแพร่ความรู้/ให้สุขศึกษาแก่บุคคลเฉพาะกลุ่ม ไม่ระบุรายละเอียด','1J19'),
(@id :=@id+1,'1J20 ให้ความรู้และจัดกิจกรรมออกกำลังกายที่เหมาะสมสำหรับผู้ป่วยโรคเรื้อรัง','1J20'),
(@id :=@id+1,'1J21 ให้ความรู้และจัดกิจกรรมออกกำลังกายที่เหมาะสมสำหรับผู้ป่วยที่มีปัญหาทางระบบทางเดินหายใจ เช่น ปอดอุดกั้นเรื้อรัง หอบหืด','1J21'),
(@id :=@id+1,'1J22 ให้ความรู้และจัดกิจกรรมออกกำลังกายที่เหมาะสมสำหรับผู้ป่วยที่มีปัญหาทางระบบหัวใจหลอดเลือด','1J22'),
(@id :=@id+1,'1J23 ให้ความรู้และจัดกิจกรรมออกกำลังกายที่เหมาะสมสำหรับเด็กอ้วนที่มีกิจกรรมทางกายต่ำ','1J23'),
(@id :=@id+1,'1J24 ให้ความรู้และจัดกิจกรรมออกกำลังกายที่เหมาะสมสำหรับหญิงตั้งครรภ์และหลังคลอด','1J24'),
(@id :=@id+1,'1J25 ให้ความรู้และจัดกิจกรรมออกกำลังกายที่เหมาะสมสำหรับประชากรกลุ่มเสี่ยงต่อการบาดเจ็บจากการทำงาน','1J25'),
(@id :=@id+1,'1J26 ให้ความรู้และจัดกิจกรรมออกกำลังกายที่เหมาะสมสำหรับกลุ่มคนทำงานที่มีกิจกรรมทางกายต่ำ','1J26'),
(@id :=@id+1,'1J27 ให้ความรู้และจัดกิจกรรมออกกำลังกายที่เหมาะสมสำหรับผู้สูงอายุที่เสี่ยงต่อการหกล้ม','1J27'),
(@id :=@id+1,'1J28 ให้ความรู้บุคคลทั่วไปที่มีสุขภาพดีเกี่ยวกับท่าทางการทำงานและท่าทางในชีวิตประจำวัน','1J28')
;
SET @id := (SELECT max(ovst_community_service_type_id) FROM ovst_community_service_type) ;

INSERT IGNORE INTO ovst_community_service_type (
ovst_community_service_type_id,
ovst_community_service_type_name,
ovst_community_service_type_code
)
SELECT
@id := @id+1,
	ovst_community_service_type_name,
	ovst_community_service_type_code
FROM
	ovst_community_service_type_master
WHERE
	ovst_community_service_type_code NOT IN (
		SELECT
			ovst_community_service_type_code
		FROM
			ovst_community_service_type
	) ;
DROP TABLE IF EXISTS ovst_community_service_type_master ;