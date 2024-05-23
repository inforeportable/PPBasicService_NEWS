-- 2024-05-23 import pp_special
-- 205.รหัสบริการส่งเสริมป้องกันเฉพาะ (แฟ้มSpecialPP)5Apr67.xlsx
DROP TABLE
IF EXISTS cupnp_pp_special_code_master;
CREATE TABLE cupnp_pp_special_code_master LIKE pp_special_code;
INSERT IGNORE INTO cupnp_pp_special_code_master (
	cupnp_pp_special_code_master.CODE,
	cupnp_pp_special_code_master.NAME
)
VALUES
('1B0030','ตรวจคัดกรองความเสี่ยง/โรคมะเร็งเต้านมได้ผลปกติ ผู้รับบริการเคยตรวจด้วยตนเองได้ผลปกติ'),
('1B0031','ตรวจคัดกรองความเสี่ยง/โรคมะเร็งเต้านมได้ผลปกติ ผู้รับบริการเคยตรวจด้วยตนเองได้ผลผิดปกติ'),
('1B0032','ตรวจคัดกรองความเสี่ยง/โรคมะเร็งเต้านมได้ผลปกติ ผู้รับบริการไม่เคยตรวจด้วยตนเอง'),
('1B0033','ตรวจคัดกรองความเสี่ยง/โรคมะเร็งเต้านมได้ผลปกติ ไม่ระบุว่าผู้รับบริการเคยตรวจด้วยตนเองหรือไม่'),
('1B0034','ตรวจคัดกรองความเสี่ยง/โรคมะเร็งเต้านมได้ผลผิดปกติ ผู้รับบริการเคยตรวจด้วยตนเองได้ผลปกติ'),
('1B0035','ตรวจคัดกรองความเสี่ยง/โรคมะเร็งเต้านมได้ผลผิดปกติ ผู้รับบริการเคยตรวจด้วยตนเองได้ผลผิดปกติ'),
('1B0036','ตรวจคัดกรองความเสี่ยง/โรคมะเร็งเต้านมได้ผลผิดปกติ ผู้รับบริการไม่เคยตรวจด้วยตนเอง'),
('1B0037','ตรวจคัดกรองความเสี่ยง/โรคมะเร็งเต้านมได้ผลผิดปกติ ไม่ระบุว่าผู้รับบริการเคยตรวจด้วยตนเองหรือไม่'),
('1B0039','ตรวจคัดกรองมะเร็งเต้านม ไม่ระบุรายละเอียด'),
('1B0040','ตรวจคัดกรองความเสี่ยง/โรคมะเร็งปากมดลูก ด้วยวิธี VIA ได้ผลลบ'),
('1B0041','ตรวจคัดกรองความเสี่ยง/โรคมะเร็งปากมดลูก ด้วยวิธี VIA ได้ผลบวก ไม่ให้การรักษา'),
('1B0042','ตรวจคัดกรองความเสี่ยง/โรคมะเร็งปากมดลูก ด้วยวิธี VIA ได้ผลบวก และให้การรักษา'),
('1B0043','ตรวจคัดกรองความเสี่ยง/โรคมะเร็งปากมดลูก ด้วยวิธี VIA ไม่ระบุผลการตรวจ'),
('1B0044','ตรวจคัดกรองความเสี่ยง/โรคมะเร็งปากมดลูก ด้วยวิธี Pap (ยังไม่ทราบผล)'),
('1B0045','การคัดกรองมะเร็งปากมดลูก ด้วยวิธี VIA ผลตรวจเป็นมะเร็งปากมดลูก'),
('1B0046','การคัดกรองมะเร็งปากมดลูก ด้วยวิธี HPV Genotype Testing'),
('1B0048','ตรวจคัดกรองมะเร็งปากมดลูก วิธีอื่น (ระบุวิธี)'),
('1B0049','ตรวจคัดกรองมะเร็งปากมดลูก ไม่ระบุวิธี'),
('1B0060','ตรวจคัดกรองความเสี่ยง/โรคมะเร็งลำไส้ ได้ผลลบ'),
('1B0061','ตรวจคัดกรองความเสี่ยง/โรคมะเร็งลำไส้ ได้ผลบวก'),
('1B010','การตรวจคัดกรองไวรัสตับอักเสบ บี (screening examination for viral hepatitis B)'),
('1B0100','การตรวจคัดกรองไวรัสตับอักเสบ บี ได้ผลเป็นบวก (screening examination for viral hepatitis B, positive)'),
('1B0101','การตรวจคัดกรองไวรัสตับอักเสบ บี ได้ผลเป็นลบ (screening examination for viral hepatitis B, negative)'),
('1B011','การตรวจคัดกรองไวรัสตับอักเสบ ซี (screening examination for viral hepatitis C)'),
('1B0110','การตรวจคัดกรองไวรัสตับอักเสบ ซี ได้ผลเป็นบวก (screening examination for viral hepatitis C, positive)'),
('1B0111','การตรวจคัดกรองไวรัสตับอักเสบ ซี ได้ผลเป็นลบ (screening examination for viral hepatitis C, negative)'),
('1B0210','การตรวจคัดกรองโรคซึมเศร้าในประชาชนทั่วไปด้วยแบบคัดกรอง 2Q พบว่า ผลปกติ'),
('1B0211','การตรวจคัดกรองโรคซึมเศร้าในประชาชนทั่วไปด้วยแบบคัดกรอง 2Q พบว่า ผลผิดปกติ'),
('1B0212','การตรวจคัดกรองโรคซึมเศร้าและเสี่ยงต่อภาวะการทำร้ายตัวเอง / ฆ่าตัวตาย (2Q plus)'),
('1B0260','การประเมินภาวะซึมเศร้าด้วยแบบประเมิน 9Q พบว่าผลปกติ'),
('1B0261','การประเมินภาวะซึมเศร้าด้วยแบบประเมิน 9Q พบว่าซึมเศร้าน้อย (คะแนน 7-12)'),
('1B0262','การประเมินภาวะซึมเศร้าด้วยแบบประเมิน 9Q พบว่าซึมเศร้าปานกลาง (คะแนน 13-18)'),
('1B0263','การประเมินภาวะซึมเศร้าด้วยแบบประเมิน 9Q พบว่าซึมเศร้ารุนแรง (คะแนน≥19)'),
('1B0269','การประเมินภาวะซึมเศร้าด้วยแบบประเมิน 9Q ไม่ระบุรายละเอียด'),
('1B0270','การประเมินการฆ่าตัวตายด้วยแบบประเมิน 8Q พบว่าไม่มีแนวโน้มการฆ่าตัวตาย'),
('1B0271','การประเมินการฆ่าตัวตายด้วยแบบประเมิน 8Q พบว่ามีแนวโน้มที่จะฆ่าตัวตายระดับน้อย (คะแนน 1-8)'),
('1B0272','การประเมินการฆ่าตัวตายด้วยแบบประเมิน 8Q พบว่ามีแนวโน้มที่จะฆ่าตัวตายระดับปานกลาง (คะแนน 9-16)'),
('1B0273','การประเมินการฆ่าตัวตายด้วยแบบประเมิน 8Q พบว่ามีแนวโน้มที่จะฆ่าตัวตายระดับรุนแรง (คะแนน ≥17)'),
('1B0279','การประเมินการฆ่าตัวตายด้วยแบบประเมิน 8Q ไม่ระบุรายละเอียด'),
('1B0280','การตรวจคัดกรองโรคซึมเศร้าในผู้สูงอายุด้วยแบบคัดกรอง 2Q พบว่าผลปกติ'),
('1B0281','การตรวจคัดกรองโรคซึมเศร้าในผู้สูงอายุด้วยแบบคัดกรอง 2Q พบว่าผลผิดปกติ'),
('1B0282','การตรวจคัดกรองโรคซึมเศร้าในผู้สูงอายุด้วยแบบคัดกรอง 9Q พบว่าผลปกติ'),
('1B0283','การตรวจคัดกรองโรคซึมเศร้าในผู้สูงอายุด้วยแบบคัดกรอง 9Q พบว่าซึมเศร้าน้อย (คะแนน 7-12)'),
('1B0284','การตรวจคัดกรองโรคซึมเศร้าในผู้สูงอายุด้วยแบบคัดกรอง 9Q พบว่าซึมเศร้าปานกลาง (คะแนน 13-18)'),
('1B0285','การตรวจคัดกรองโรคซึมเศร้าในผู้สูงอายุด้วยแบบคัดกรอง 9Q พบว่าซึมเศร้ารุนแรง (คะแนน ≥19)'),
('1B0286','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในผู้สูงอายุ พบว่าผลปกติ'),
('1B0287','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในผู้สูงอายุ พบว่าผลผิดปกติ'),
('1B0289','การตรวจคัดกรองโรคซึมเศร้า/ประเมินความเครียดในผู้สูงอายุ ไม่ระบุรายละเอียด'),
('1B030','การประเมิน ผู้ป่วยจิตเวชที่มีความเสี่ยงสูง พบทำร้ายตนเองด้วยวิธีรุนแรง มุ่งหวังให้เสียชีวิต'),
('1B031','การประเมิน ผู้ป่วยจิตเวชที่มีความเสี่ยงสูง พบทำร้ายผู้อื่นด้วยวิธีรุนแรง/ก่อเหตุการณ์รุนแรงในชุมชน'),
('1B032','การประเมิน ผู้ป่วยจิตเวชที่มีความเสี่ยงสูง พบมีอาการหลงผิด มีความคิดทำร้าย ผู้อื่นให้ถึงกับชีวิต หรือมุ่งร้ายผู้อื่นแบบเฉพาะเจาะจง เช่น ระบุชื่อคนที่จะมุ่งร้าย'),
('1B033','การประเมิน ผู้ป่วยจิตเวชที่มีความเสี่ยงสูง พบก่อคดีอาชญากรรมรุนแรง (ฆ่า พยายามฆ่า ข่มขืน วางเพลิง)'),
('1B036','การประเมิน ผู้ป่วยจิตเวชที่มีความเสี่ยงสูงต่อการก่อความรุนแรง พบว่าปกติ'),
('1B037','ผู้ป่วยจิตเวชที่มีความเสี่ยงสูงต่อการก่อความรุนแรง พบว่าก่อเหตุความรุนแรง ทำร้ายตัวเอง/ทำร้ายผู้อื่น/ก่อคดีอาชญากรรมรุนแรง ได้รับการติดตาม'),
('1B038','การประเมิน ผู้ป่วยจิตเวชที่มีความเสี่ยงสูงต่อการก่อความรุนแรงพบว่ามีประวัติ/อาการ อื่นๆ'),
('1B040','สนทนาสร้างแรงจูงใจเพื่อปรับพฤติกรรม (MI)'),
('1B041','ให้คำปรึกษาแบบใช้ความเข้มแข็งเป็นฐาน (SBC)'),
('1B042','ประเมินความเข้มแข็งทางใจ (RQ) พบเสี่ยงมาก (3-20 คะแนน)'),
('1B043','ประเมินความเข้มแข็งทางใจ (RQ) พบเสี่ยงน้อย (21-25 คะแนน)'),
('1B044','ประเมินความเข้มแข็งทางใจ (RQ) ไม่พบความเสี่ยง (26-30 คะแนน)'),
('1B1130','การตรวจคัดกรองสมรรถภาพการมองเห็น ผลเหมาะสมกับลักษณะงาน'),
('1B1131','การตรวจคัดกรองสมรรถภาพการมองเห็น ผลไม่เหมาะสมกับลักษณะงาน'),
('1B1139','การตรวจคัดกรองสมรรถภาพการมองเห็น ไม่ระบุรายละเอียด'),
('1B1140','การตรวจคัดกรองสมรรถภาพการได้ยินของการตรวจที่มีผลครั้งเดียว มีผลปกติ (ระดับการได้ยินของหูทั้ง 2 ข้าง ไม่เกิน 25 เดซิเบล ทุกความถี่)'),
('1B1141','การตรวจคัดกรองสมรรถภาพการได้ยินของการตรวจที่มีผลครั้งเดียว มีผลตรวจระดับการได้ยินมากกว่า 25 เดซิเบล ที่ความถี่ใด ความถี่หนึ่งของหูข้างใดข้างหนึ่ง'),
('1B1142','การตรวจคัดกรองสมรรถภาพการได้ยิน มีผลผ่านเกณฑ์ เมื่อเทียบผลการตรวจกับ Baseline audiogram (ไม่พบ 15 dB-shift หรือ ไม่พบ 15 dB-shift Twice ทุกความถี่)'),
('1B1143','การตรวจคัดกรองสมรรถภาพการได้ยิน มีผลไม่ผ่านเกณฑ์ เมื่อเทียบผลการตรวจกับ Baseline audiogram (พบ 15 dB-shift Twice หลังจากตรวจยืนยัน: Confirmation audiogram ภายใน 30 วัน)'),
('1B1144','การตรวจคัดกรองสมรรถภาพการได้ยิน เมื่อเทียบผลการตรวจกับ Baseline audiogram (พบ 15 dB-shift และไม่ได้รับการตรวจยืนยัน: Confirmation audiogram ภายใน 30 วัน)'),
('1B1149','การตรวจคัดกรองสมรรถภาพการได้ยิน ไม่ระบุรายละเอียด'),
('1B1150','การตรวจคัดกรองสมรรถภาพปอด ผลปกติ'),
('1B1151','การตรวจคัดกรองสมรรถภาพปอด ผลต่ำกว่าค่าคาดคะเนชนิดหลอดลมอุดกั้น'),
('1B1152','การตรวจคัดกรองสมรรถภาพปอด ผลต่ำกว่าค่าคาดคะเนชนิดจำกัดการขยายตัว'),
('1B1153','การตรวจคัดกรองสมรรถภาพปอด ผลต่ำกว่าค่าคาดคะเนชนิดหลอดลมอุดกั้นและจำกัดการขยายตัว (ผสม)'),
('1B1159','การตรวจคัดกรองสมรรถภาพปอด ไม่ระบุรายละเอียด'),
('1B1160','การตรวจเอ็กซเรย์ปอดฟิล์มใหญ่ในวัยทำงาน ผลปกติระดับ 0/0'),
('1B1161','การตรวจเอ็กซเรย์ปอดฟิล์มใหญ่ในวัยทำงาน ผลผิดปกติตั้งแต่ระดับ 0/1 – 1/0'),
('1B1162','การตรวจเอ็กซเรย์ปอดฟิล์มใหญ่ในวัยทำงาน ผลผิดปกติตั้งแต่ระดับ 1/1 ขึ้นไป'),
('1B1169','การตรวจเอ็กซเรย์ปอดฟิล์มใหญ่ในวัยทำงาน ไม่ระบุรายละเอียด'),
('1B1170','การตรวจคัดกรองเพื่อหาความเสี่ยงจากสารกำจัดศัตรูพืช ผลปกติ'),
('1B1171','การตรวจคัดกรองเพื่อหาความเสี่ยงจากสารกำจัดศัตรูพืช ผลปลอดภัย'),
('1B1172','การตรวจคัดกรองเพื่อหาความเสี่ยงจากสารกำจัดศัตรูพืช ผลมีความเสี่ยง'),
('1B1173','การตรวจคัดกรองเพื่อหาความเสี่ยงจากสารกำจัดศัตรูพืช ผลไม่ปลอดภัย'),
('1B1179','การตรวจคัดกรองเพื่อหาความเสี่ยงจากสารกำจัดศัตรูพืช ไม่ระบุรายละเอียด'),
('1B120','การตรวจคัดกรองผู้สูงอายุที่มีภาวะเสี่ยงหกล้มและมีภาวะถดถอยด้านการเคลื่อนไหว'),
('1B1200','การตรวจคัดกรองผู้สูงอายุที่มีภาวะเสี่ยงหกล้มและมีภาวะถดถอยด้านการเคลื่อนไหว พบว่าไม่มีความเสี่ยง'),
('1B1201','การตรวจคัดกรองผู้สูงอายุที่มีภาวะเสี่ยงหกล้มและมีภาวะถดถอยด้านการเคลื่อนไหว พบว่ามีความเสี่ยง ได้จัดทำ Care Plan และให้โปรแกรมส่งเสริมสุขภาพ'),
('1B1202','การตรวจคัดกรองผู้สูงอายุที่มีภาวะเสี่ยงหกล้มและมีภาวะถดถอยด้านการเคลื่อนไหว พบว่ามีความเสี่ยงส่งรักษาต่อ'),
('1B1203','การตรวจคัดกรองผู้สูงอายุที่มีภาวะเสี่ยงหกล้มและมีภาวะถดถอยด้านการเคลื่อนไหว พบว่ามีความเสี่ยง ได้จัดทำ Care Plan'),
('1B1209','การตรวจคัดกรองผู้สูงอายุที่เสี่ยงภาวะเสี่ยงหกล้มและมีภาวะถดถอยด้านการเคลื่อนไหวไม่ระบุรายละเอียด'),
('1B1210','การตรวจคัดกรองความเสี่ยง / เฝ้าระวังโรคไตเรื้อรังในผู้สูงอายุ'),
('1B1211','การตรวจคัดกรองความเสี่ยง / เฝ้าระวังภาวะทุพโภชนาการในผู้สูงอายุ'),
('1B1212','การตรวจคัดกรองความเสี่ยง / เฝ้าระวังภาวะโลหิตจางในผู้สูงอายุ'),
('1B1213','การตรวจคัดกรองความเสี่ยง / เฝ้าระวังปัญหาการนอนในผู้สูงอายุ (นอนไม่หลับ / นอนไม่เพียงพอ)'),
('1B122','การตรวจคัดกรองสมรรถภาพสมอง (ภาวะสมองเสื่อม)'),
('1B1220','การตรวจคัดกรองสมรรถภาพสมอง (ภาวะสมองเสื่อม) โดยแบบAMT ในผู้สูงอายุพบว่าปกติ'),
('1B1221','การตรวจคัดกรองสมรรถภาพสมอง (ภาวะสมองเสื่อม) โดยแบบ AMT ในผู้สูงอายุพบว่าผิดปกติ ให้คำแนะนำและรักษา'),
('1B1223','การตรวจคัดกรองสมรรถภาพสมอง (ภาวะสมองเสื่อม) โดยแบบ AMT ในผู้สูงอายุพบว่าผิดปกติและส่งไปรักษาต่อ'),
('1B1224','การตรวจประเมินสมรรถภาพสมอง (ภาวะสมองเสื่อม) โดยแบบ MMSE-T 2002 ในผู้สูงอายุพบว่าปกติ'),
('1B1225','การตรวจประเมินสมรรถภาพสมอง (ภาวะสมองเสื่อม) โดยแบบ MMSE-T 2002 ในผู้สูงอายุพบว่าผิดปกติ ได้จัดทำ Care Plan และให้โปรแกรมส่งเสริมสุขภาพ'),
('1B1226','การตรวจประเมินสมรรถภาพสมอง (ภาวะสมองเสื่อม) โดยแบบ MMSE-T 2002 ในผู้สูงอายุพบว่าผิดปกติและส่งไปรักษาต่อ'),
('1B1229','การตรวจประเมินสมรรถภาพสมอง (ภาวะสมองเสื่อม) โดยแบบ AMT/ MMSE-T 2002 ในผู้สูงอายุ ไม่ระบุรายละเอียด'),
('1B1230','การตรวจคัดกรองความเสี่ยงโรคหัวใจและหลอดเลือดสมองในผู้สูงอายุ พบว่าไม่มีความเสี่ยง'),
('1B1231','การตรวจคัดกรองความเสี่ยงโรคหัวใจและหลอดเลือดสมองในผู้สูงอายุ พบว่ามีความเสี่ยง'),
('1B1232','การตรวจคัดกรองความเสี่ยงโรคหัวใจและหลอดเลือดสมองในผู้สูงอายุ พบว่ามีความเสี่ยงสูง'),
('1B1234','การตรวจคัดกรองความเสี่ยงโรคหัวใจและหลอดเลือดสมองในผู้สูงอายุ พบว่ามีความเสี่ยงสูงมาก ให้คำแนะนำ / รักษา'),
('1B1235','การตรวจคัดกรองความเสี่ยงโรคหัวใจและหลอดเลือดสมองในผู้สูงอายุพบว่ามีความเสี่ยงสูงมาก รักษาต่อ'),
('1B1239','การตรวจคัดกรองความเสี่ยงโรคหัวใจและหลอดเลือดสมองในผู้สูงอายุ ไม่ระบุรายละเอียด'),
('1B1240','การตรวจคัดกรองสายตาระยะใกล้ในผู้สูงอายุพบว่าไม่มีปัญหา'),
('1B1241','การตรวจคัดกรองสายตาระยะใกล้ในผู้สูงอายุพบว่ามีปัญหาให้คำแนะนำและรักษา'),
('1B1242','การตรวจคัดกรองสายตาระยะใกล้ในผู้สูงอายุพบว่ามีปัญหาส่งไปรักษาต่อ'),
('1B1243','การตรวจคัดกรองสายตาระยะไกลในผู้สูงอายุพบว่าไม่มีปัญหา'),
('1B1244','การตรวจคัดกรองสายตาระยะไกลในผู้สูงอายุพบว่ามีปัญหาให้คำแนะนำและรักษา'),
('1B1245','การตรวจคัดกรองสายตาระยะไกลในผู้สูงอายุพบว่ามีปัญหาส่งไปรักษาต่อ'),
('1B1249','การตรวจคัดกรองสายตาระยะใกล้/ระยะไกลในผู้สูงอายุไม่ระบุรายละเอียด'),
('1B1250','การตรวจคัดกรองความเสี่ยงต้อกระจกในผู้สูงอายุพบว่าไม่มีปัญหา'),
('1B1251','การตรวจคัดกรองความเสี่ยงต้อกระจกในผู้สูงอายุพบว่ามีปัญหาให้คำแนะนำและรักษา'),
('1B1252','การตรวจคัดกรองความเสี่ยงต้อกระจกในผู้สูงอายุพบว่ามีปัญหาส่งไปรักษาต่อ'),
('1B1253','การตรวจคัดกรองความเสี่ยงต้อหินในผู้สูงอายุพบว่าไม่มีปัญหา'),
('1B1254','การตรวจคัดกรองความเสี่ยงต้อหินในผู้สูงอายุพบว่ามีปัญหาให้คำแนะนำและรักษา'),
('1B1255','การตรวจคัดกรองความเสี่ยงต้อหินในผู้สูงอายุพบว่ามีปัญหาส่งไปรักษาต่อ'),
('1B1256','การตรวจคัดกรองความเสี่ยงโรคจอประสาทตาเสื่อมจากอายุในผู้สูงอายุพบว่าไม่มีปัญหา'),
('1B1257','การตรวจคัดกรองความเสี่ยงโรคจอประสาทตาเสื่อมจากอายุในผู้สูงอายุพบว่ามีปัญหาให้คำแนะนำ และรักษา'),
('1B1258','การตรวจคัดกรองความเสี่ยงโรคจอประสาทตาเสื่อมจากอายุในผู้สูงอายุพบว่ามีปัญหา ส่งไปรักษาต่อ'),
('1B1259','การตรวจคัดกรองความเสี่ยงต้อกระจก / ต้อหิน / จอประสาทตาเสื่อมจากอายุ ในผู้สูงอายุ ไม่ระบุรายละเอียด'),
('1B126','การตรวจคัดกรองพฤติกรรมเสี่ยงต่อสุขภาพช่องปากในผู้สูงอายุ'),
('1B1260','การตรวจคัดกรองพฤติกรรมเสี่ยงต่อสุขภาพช่องปากในผู้สูงอายุพบว่าพฤติกรรมเหมาะสม'),
('1B1261','การตรวจคัดกรองพฤติกรรมเสี่ยงต่อสุขภาพช่องปากในผู้สูงอายุพบว่าพฤติกรรมไม่เหมาะสม และแนะนำให้ความรู้'),
('1B1262','การตรวจคัดกรองพฤติกรรมเสี่ยงต่อสุขภาพช่องปากและการตรวจสุขภาพช่องปากในผู้สูงอายุ พบภาวะผิดปกติ'),
('1B1263','การตรวจคัดกรองพฤติกรรมเสี่ยงต่อสุขภาพช่องปากและการตรวจสุขภาพช่องปากในผู้สูงอายุ พบภาวะผิดปกติ ได้จัดทำ Care Plan'),
('1B1264','การตรวจคัดกรองพฤติกรรมเสี่ยงต่อสุขภาพช่องปากและการตรวจสุขภาพช่องปากในผู้สูงอายุ พบภาวะผิดปกติ ได้จัดทำ Care Plan และให้โปรแกรมส่งเสริมสุขภาพ'),
('1B1269','การตรวจคัดกรองพฤติกรรมเสี่ยงต่อสุขภาพช่องปากในผู้สูงอายุไม่ระบุรายละเอียด'),
('1B1270','การตรวจคัดกรองข้อเข่าเสื่อมทางคลินิกในผู้สูงอายุพบว่าปกติ'),
('1B1271','การตรวจคัดกรองข้อเข่าเสื่อมทางคลินิกในผู้สูงอายุพบว่าผิดปกติ ให้คำแนะนำและรักษา'),
('1B1272','การตรวจคัดกรองข้อเข่าเสื่อมทางคลินิกในผู้สูงอายุพบว่าผิดปกติและส่งรักษาต่อ'),
('1B1273','การตรวจคัดกรองสมรรถนะผู้สูงอายุเกี่ยวกับการดูแลระยะยาวพบว่าไม่ต้องดูแลระยะยาว'),
('1B1274','การตรวจคัดกรองสมรรถนะผู้สูงอายุเกี่ยวกับการดูแลระยะยาวพบว่าต้องเฝ้าระวัง ให้คำแนะนำและติดตาม'),
('1B1275','การตรวจคัดกรองสมรรถนะผู้สูงอายุเกี่ยวกับการดูแลระยะยาวพบว่าต้องดูแลระยะยาว ให้คำแนะนำและดูแลต่อเนื่อง'),
('1B1279','การตรวจคัดกรองข้อเข่าเสื่อมทางคลินิก ในผู้สูงอายุ / สมรรถนะผู้สูงอายุเกี่ยวกับการดูแลระยะยาว ไม่ระบุรายละเอียด'),
('1B1280','การตรวจคัดกรองสมรรถนะผู้สูงอายุเกี่ยวกับความสามารถในการทำกิจวัตรประจำวันพบว่าช่วยเหลือตัวเองได้ /ติดสังคม (ADL 12-20 คะแนน) และได้รับการจัดทำ Care Plan'),
('1B1281','การตรวจคัดกรองสมรรถนะผู้สูงอายุเกี่ยวกับความสามารถในการทำกิจวัตรประจำวันพบว่าช่วยเหลือตัวเองได้บ้าง / บางส่วน /ติดบ้าน (ADL 5-11 คะแนน) และได้รับการจัดทำ Care Plan'),
('1B1282','การตรวจคัดกรองสมรรถนะผู้สูงอายุเกี่ยวกับความสามารถในการทำกิจวัตรประจำวัน พบว่าช่วยเหลือตัวเองได้น้อย / ไม่ได้เลย /ภาวะติดเตียง (ADL 0-4 คะแนน) และได้รับการจัดทำ Care Plan'),
('1B1283','การตรวจคัดกรองภาวะกลั้นปัสสาวะในผู้สูงอายุ'),
('1B1284','การตรวจคัดกรองภาวะกลั้นปัสสาวะในผู้สูงอายุ ไม่มีปัญหา'),
('1B1285','การตรวจคัดกรองภาวะกลั้นปัสสาวะในผู้สูงอายุ มีปัญหา'),
('1B1289','การตรวจคัดกรองสมรรถนะผู้สูงอายุเกี่ยวกับความสามารถในการทำกิจวัตรประจำวันไม่ระบุรายละเอียด'),
('1B130','การตรวจคัดกรองโรคซึมเศร้าในผู้ป่วยโรคเรื้อรังด้วยแบบคัดกรอง 2Q พบว่าผลปกติ'),
('1B131','การตรวจคัดกรองโรคซึมเศร้าในผู้ป่วยโรคเรื้อรังด้วยแบบคัดกรอง 2Q พบว่าผลผิดปกติ'),
('1B132','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในผู้ป่วยโรคเรื้อรังพบว่าผลปกติ (0 – 4 คะแนน)'),
('1B133','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในผู้ป่วยโรคเรื้อรังพบว่ามีปัญหาความเครียด (5 – 7 คะแนน)'),
('1B134','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในผู้ป่วยโรคเรื้อรังพบว่ามีความเครียดสูง (8 คะแนนขึ้นไป)'),
('1B139','การตรวจคัดกรองโรคซึมเศร้า/ประเมินความเครียดในผู้ป่วยโรคเรื้อรังไม่ระบุรายละเอียด'),
('1B140','การตรวจคัดกรองโรคซึมเศร้าในหญิงตั้งครรภ์/หลังคลอดด้วยแบบคัดกรอง 2Q พบว่าผลปกติ'),
('1B141','การตรวจคัดกรองโรคซึมเศร้าในหญิงตั้งครรภ์/หลังคลอดด้วยแบบคัดกรอง 2Q พบว่าผลผิดปกติ'),
('1B142','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในหญิงตั้งครรภ์/หลังคลอดพบว่าผลปกติ (0 – 4 คะแนน)'),
('1B143','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในหญิงตั้งครรภ์/หลังคลอดพบว่ามีปัญหาความเครียด (5 – 7 คะแนน)'),
('1B144','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในหญิงตั้งครรภ์/หลังคลอดพบว่ามีความเครียดสูง (8 คะแนนขึ้นไป)'),
('1B149','การตรวจคัดกรองโรคซึมเศร้า/ประเมินความเครียดในหญิงตั้งครรภ์/หลังคลอด ไม่ระบุรายละเอียด'),
('1B150','การตรวจคัดกรองโรคซึมเศร้าในผู้มีปัญหาสุรา/สารเสพติดด้วยแบบคัดกรอง 2Q พบว่าผลปกติ'),
('1B151','การตรวจคัดกรองโรคซึมเศร้าในผู้มีปัญหาสุรา/สารเสพติดด้วยแบบคัดกรอง 2Q พบว่าผลผิดปกติ'),
('1B152','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในผู้มีปัญหาสุรา/สารเสพติดพบว่าผลปกติ (0 – 4 คะแนน)'),
('1B153','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในผู้มีปัญหาสุรา/สารเสพติดพบว่ามีปัญหาความเครียด (5 – 7 คะแนน)'),
('1B154','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในผู้มีปัญหาสุรา/สารเสพติดพบว่ามีความเครียดสูง (8 คะแนนขึ้นไป)'),
('1B159','การตรวจคัดกรองโรคซึมเศร้า/ประเมินความเครียดในผู้มีปัญหาสุรา/สารเสพติดไม่ระบุรายละเอียด'),
('1B160','การตรวจคัดกรองโรคซึมเศร้าในกลุ่มที่มีอาการซึมเศร้าชัดเจนด้วยแบบคัดกรอง 2Q พบว่าผลปกติ'),
('1B161','การตรวจคัดกรองโรคซึมเศร้าในกลุ่มที่มีอาการซึมเศร้าชัดเจนด้วยแบบคัดกรอง 2Q พบว่าผลผิดปกติ'),
('1B162','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในกลุ่มที่มีอาการซึมเศร้าชัดเจนพบว่าผลปกติ (0 – 4 คะแนน)'),
('1B163','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในกลุ่มที่มีอาการซึมเศร้าชัดเจนพบว่ามีปัญหาความเครียด (5 – 7 คะแนน)'),
('1B164','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในกลุ่มที่มีอาการซึมเศร้าชัดเจนพบว่ามีความเครียดสูง (8 คะแนนขึ้นไป)'),
('1B169','การตรวจคัดกรองโรคซึมเศร้า/ประเมินความเครียดในกลุ่มที่มีอาการซึมเศร้า ชัดเจน ไม่ระบุรายละเอียด'),
('1B170','การตรวจคัดกรองโรคซึมเศร้าในผู้ที่มีอาการทางกายเรื้อรังหลายอาการที่หาสาเหตุไม่ได้ด้วยแบบคัดกรอง 2Q พบว่าผลปกติ'),
('1B171','การตรวจคัดกรองโรคซึมเศร้าในผู้ที่มีอาการทางกายเรื้อรังหลายอาการที่หาสาเหตุไม่ได้ด้วยแบบคัดกรอง 2Q พบว่าผลผิดปกติ'),
('1B172','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในกลุ่มที่มีอาการซึมเศร้ในผู้ที่มีอาการทางกายเรื้อรังหลายอาการที่หาสาเหตุไม่ได้ พบว่าผลปกติ (0 – 4 คะแนน)'),
('1B173','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในผู้ที่มีอาการทางกายเรื้อรังหลายอาการที่หาสาเหตุไม่ได้ พบว่ามีปัญหาความเครียด (5 – 7 คะแนน)'),
('1B174','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในผู้ที่มีอาการทางกายเรื้อรังหลายอาการที่หาสาเหตุไม่ได้ พบว่ามีความเครียดสูง (8 คะแนนขึ้นไป)'),
('1B179','การตรวจคัดกรองโรคซึมเศร้า/ประเมินความเครียดในผู้ที่มีอาการทางกายเรื้อรังหลายอาการที่หาสาเหตุไม่ได้ ไม่ระบุรายละเอียด'),
('1B180','การตรวจคัดกรองโรคซึมเศร้าในกลุ่มที่มีการสูญเสีย ด้วยแบบคัดกรอง 2Q พบว่าผลปกติ'),
('1B181','การตรวจคัดกรองโรคซึมเศร้าในกลุ่มที่มีการสูญเสีย ด้วยแบบคัดกรอง 2Q พบว่าผลผิดปกติ'),
('1B182','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในกลุ่มที่มีการสูญเสีย พบว่าผลปกติ (0 – 4 คะแนน)'),
('1B183','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในกลุ่มที่มีการสูญเสีย พบว่าปัญหาความเครียด (5 – 7 คะแนน)'),
('1B184','การประเมินความเครียดด้วยแบบคัดกรอง ST5 ในกลุ่มที่มีการสูญเสีย พบว่ามีความเครียดสูง (8 คะแนนขึ้นไป)'),
('1B189','การตรวจคัดกรองโรคซึมเศร้า/ประเมินความเครียดในกลุ่มที่มีการสูญเสีย ไม่ระบุรายละเอียด'),
('1B200','การตรวจคัดกรองพัฒนาการสมวัยด้านการเคลื่อนไหวโดยเครื่องมือ DSPM ผลปกติ'),
('1B201','การตรวจคัดกรองพัฒนาการสมวัยด้านการเคลื่อนไหวโดยเครื่องมือ DSPM สงสัยล่าช้า ส่งเสริมพัฒนาการใน 1 เดือน'),
('1B202','การตรวจคัดกรองพัฒนาการสมวัยด้านการเคลื่อนไหวโดยเครื่องมือ DSPM ผลล่าช้า ส่งเพื่อประเมิน/รักษาต่อ'),
('1B203','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการเคลื่อนไหวโดยเครื่องมือ DSPM ผลปกติ'),
('1B204','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการเคลื่อนไหวโดยเครื่องมือ DSPM สงสัยล่าช้า ส่งเสริมพัฒนาการใน 1 เดือน'),
('1B205','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการเคลื่อนไหวโดยเครื่องมือ DSPM ผลล่าช้า ส่งเพื่อประเมิน/รักษาต่อ'),
('1B206','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการเคลื่อนไหวโดยเครื่องมือ DAIM ผลปกติ'),
('1B207','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการเคลื่อนไหวโดยเครื่องมือ DAIM ผลล่าช้า ส่งเพื่อประเมิน/รักษาต่อ'),
('1B209','การตรวจคัดกรอง/แบบเฝ้าระวังพัฒนาการสมวัยด้านการเคลื่อนไหวโดยเครื่องมือ DSPM และ หรือ DAIM ไม่ระบุรายละเอียด'),
('1B210','การตรวจคัดกรองพัฒนาการสมวัยด้านกล้ามเนื้อมัดเล็กและสติปัญญาโดยเครื่องมือ DSPM ผลปกติ'),
('1B211','การตรวจคัดกรองพัฒนาการสมวัยด้านกล้ามเนื้อมัดเล็กและสติปัญญาโดยเครื่องมือ DSPM สงสัยล่าช้า ส่งเสริมพัฒนาการใน 1 เดือน'),
('1B212','การตรวจคัดกรองพัฒนาการสมวัยด้านกล้ามเนื้อมัดเล็กและสติปัญญาโดยเครื่องมือ DSPM ผลล่าช้า ส่งเพื่อประเมิน/รักษาต่อ'),
('1B213','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านกล้ามเนื้อมัดเล็กและสติปัญญาโดยเครื่องมือ DSPM ผลปกติ'),
('1B214','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านกล้ามเนื้อมัดเล็กและสติปัญญาโดยเครื่องมือ DSPM สงสัยล่าช้า ส่งเสริมพัฒนาการใน 1 เดือน'),
('1B215','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านกล้ามเนื้อมัดเล็กและสติปัญญาโดยเครื่องมือ DSPM ผลล่าช้า ส่งเพื่อประเมิน/รักษาต่อ'),
('1B216','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านกล้ามเนื้อมัดเล็กและสติปัญญาโดยเครื่องมือ DAIM ผลปกติ'),
('1B217','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านกล้ามเนื้อมัดเล็กและสติปัญญาโดยเครื่องมือ DAIM ผลล่าช้า ส่งเพื่อประเมิน/รักษาต่อ'),
('1B219','การตรวจคัดกรอง/แบบเฝ้าระวังพัฒนาการสมวัยด้านกล้ามเนื้อมัดเล็กและสติปัญญาโดยเครื่องมือ DSPM และหรือ DAIM ไม่ระบุรายละเอียด'),
('1B220','การตรวจคัดกรองพัฒนาการสมวัยด้านการเข้าใจภาษาโดยเครื่องมือ DSPM ผลปกติ'),
('1B221','การตรวจคัดกรองพัฒนาการสมวัยด้านการเข้าใจภาษาโดยเครื่องมือ DSPM สงสัยล่าช้า ส่งเสริมพัฒนาการใน 1 เดือน'),
('1B222','การตรวจคัดกรองพัฒนาการสมวัยด้านการเข้าใจภาษาโดยเครื่องมือ DSPM ผลล่าช้า ส่งเพื่อประเมิน/รักษาต่อ'),
('1B223','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการเข้าใจภาษาโดยเครื่องมือ DSPM ผลปกติ'),
('1B224','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการเข้าใจภาษาโดยเครื่องมือ DSPM สงสัยล่าช้า ส่งเสริมพัฒนาการใน 1 เดือน'),
('1B225','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการเข้าใจภาษาโดยเครื่องมือ DSPM ผลล่าช้า ส่งเพื่อประเมิน/รักษาต่อ'),
('1B226','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการเข้าใจภาษาโดยเครื่องมือ DAIM ผลปกติ'),
('1B227','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการเข้าใจภาษาโดยเครื่องมือ DAIM ผลล่าช้า ส่งเพื่อประเมิน/รักษาต่อ'),
('1B229','การตรวจคัดกรอง/แบบเฝ้าระวังพัฒนาการสมวัยด้านการเข้าใจภาษาโดยเครื่องมือ DSPM และหรือ DAIM ไม่ระบุรายละเอียด'),
('1B230','การตรวจคัดกรองพัฒนาการสมวัยด้านการใช้ภาษาโดยเครื่องมือ DSPM ผลปกติ'),
('1B231','การตรวจคัดกรองพัฒนาการสมวัยด้านการใช้ภาษาโดยเครื่องมือ DSPM สงสัยล่าช้า ส่งเสริมพัฒนาการใน 1 เดือน'),
('1B232','การตรวจคัดกรองพัฒนาการสมวัยด้านการใช้ภาษาโดยเครื่องมือ DSPM ผลล่าช้า ส่งเพื่อประเมิน/รักษาต่อ'),
('1B233','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการใช้ภาษาโดยเครื่องมือ DSPM ผลปกติ'),
('1B234','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการใช้ภาษาโดยเครื่องมือ DSPM สงสัยล่าช้า ส่งเสริมพัฒนาการใน 1 เดือน'),
('1B235','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการใช้ภาษาโดยเครื่องมือ DSPM ผลล่าช้า ส่งเพื่อประเมิน/รักษาต่อ'),
('1B236','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการใช้ภาษาโดยเครื่องมือ DAIM ผลปกติ'),
('1B237','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการใช้ภาษาโดยเครื่องมือ DAIM ผลล่าช้า ส่งเพื่อประเมิน/รักษาต่อ'),
('1B239','การตรวจคัดกรอง/แบบเฝ้าระวังพัฒนาการสมวัยด้านการใช้ภาษาโดยเครื่องมือ DSPM และหรือ DAIM ไม่ระบุรายละเอียด'),
('1B240','การตรวจคัดกรองพัฒนาการสมวัยด้านการช่วยเหลือตัวเองและสังคมโดยเครื่องมือ DSPM ผลปกติ'),
('1B241','การตรวจคัดกรองพัฒนาการสมวัยด้านการช่วยเหลือตัวเองและสังคมโดยเครื่องมือ DSPM สงสัยล่าช้า ส่งเสริมพัฒนาการใน 1 เดือน'),
('1B242','การตรวจคัดกรองพัฒนาการสมวัยด้านการช่วยเหลือตัวเองและสังคมโดยเครื่องมือ DSPM ผลล่าช้าส่งเพื่อประเมิน/รักษาต่อ'),
('1B243','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการช่วยเหลือตัวเองและสังคมโดยเครื่องมือ DSPM ผลปกติ'),
('1B244','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการช่วยเหลือตัวเองและสังคมโดยเครื่องมือ DSPM สงสัยล่าช้า ส่งเสริมพัฒนาการใน 1 เดือน'),
('1B245','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการใช้ภาด้านการช่วยเหลือตัวเองและสังคม โดยเครื่องมือ DSPM ผลล่าช้า ส่งเพื่อประเมิน/รักษาต่อ'),
('1B246','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการช่วยเหลือตัวเองและสังคมโดยเครื่องมือ DAIM ผลปกติ'),
('1B247','การตรวจแบบเฝ้าระวังพัฒนาการสมวัยด้านการช่วยเหลือตัวเองและสังคมโดยเครื่องมือ DAIM ผลล่าช้า ส่งเพื่อประเมิน/รักษาต่อ'),
('1B249','การตรวจคัดกรอง/แบบเฝ้าระวังพัฒนาการสมวัยด้านการช่วยเหลือตัวเองและสังคมโดยเครื่องมือ DSPMและหรือ DAIM ไม่ระบุรายละเอียด'),
('1B250','การตรวจประเมินระบบประสาทและพัฒนาการอายุแรกเกิด โดยเครื่องมือ DAIM ข้อที่ 1-3 (ตรวจปฏิกิริยา ตรวจความตึงตัวของกล้ามเนื้อ และตรวจข้อเท้า) ผ่าน'),
('1B251','การตรวจประเมินระบบประสาทและพัฒนาการอายุแรกเกิด โดยเครื่องมือ DAIMข้อที่ 1-3 (ตรวจปฏิกิริยา ตรวจความตึงตัวของกล้ามเนื้อ และตรวจข้อเท้า) ไม่ผ่าน ส่งเพื่อประเมิน/รักษาต่อ'),
('1B252','การตรวจประเมินระบบประสาทและพัฒนาการอายุ 1 เดือน โดยเครื่องมือ DAIM ข้อที่ 4 (ตรวจการเหยียดแขนและขา) ผ่าน'),
('1B253','การตรวจประเมินระบบประสาทและพัฒนาการอายุ 1 เดือน โดยเครื่องมือ DAIM ข้อที่ 4 (ตรวจการเหยียดแขนและขา) ไม่ผ่าน ส่งเพื่อประเมิน/รักษาต่อ'),
('1B254','การตรวจประเมินระบบประสาทและพัฒนาการอายุ 3-4 เดือน โดยเครื่องมือ DAIM ข้อที่ 5 (ตรวจการกำมือ) ผ่าน'),
('1B255','การตรวจประเมินระบบประสาทและพัฒนาการอายุ 3-4 เดือน โดยเครื่องมือ DAIM ข้อที่ 5 (ตรวจการกำมือ) ไม่ผ่าน ส่งเพื่อประเมิน/รักษาต่อ'),
('1B256','การตรวจประเมินระบบประสาทและพัฒนาการอายุ 10-12 เดือน โดยเครื่องมือ DAIM ข้อที่ 6 (ตรวจการกางแขน) ผ่าน'),
('1B257','การตรวจประเมินระบบประสาทและพัฒนาการอายุ 10-12 เดือน โดยเครื่องมือ DAIM ข้อที่ 6 (ตรวจการกางแขน) ไม่ผ่าน ส่งเพื่อประเมิน/รักษาต่อ'),
('1B258','การตรวจประเมินระบบประสาทและพัฒนาการอายุ 55-60 เดือน โดยเครื่องมือ DAIM ข้อที่ 7 (เดินต่อส้นเท้า) ผ่าน'),
('1B259','การตรวจประเมินระบบประสาทและพัฒนาการอายุ 55-60 เดือน โดยเครื่องมือ DAIM ข้อที่ 7 (เดินต่อส้นเท้า) ไม่ผ่าน ส่งเพื่อประเมิน/รักษาต่อ'),
('1B260','ผลการตรวจคัดกรองพัฒนาการสมวัยโดยเครื่องมือ DSPM ผลปกติ'),
('1B261','ผลการตรวจคัดกรองพัฒนาการสมวัยโดยเครื่องมือ DSPM สงสัยล่าช้า ส่งเสริมพัฒนาการใน 1 เดือน'),
('1B262','ผลการตรวจคัดกรองพัฒนาการสมวัยโดยเครื่องมือ DSPM สงสัยล่าช้า ส่งต่อทันที'),
('1B270','การกระตุ้นพัฒนาการเด็กล่าช้าโดยเครื่องมือ TEDA4I หรือเครื่องมือมาตรฐานอื่น ผลปกติ'),
('1B271','การกระตุ้นพัฒนาการเด็กล่าช้าโดยเครื่องมือ TEDA4I หรือเครื่องมือมาตรฐานอื่น ผลล่าช้า ด้านการเคลื่อนไหว'),
('1B272','การกระตุ้นพัฒนาการเด็กล่าช้าโดยเครื่องมือ TEDA4I หรือเครื่องมือมาตรฐานอื่น ผลล่าช้า ด้านกล้ามเนื้อมัดเล็กและสติปัญญา'),
('1B273','การกระตุ้นพัฒนาการเด็กล่าช้าโดยเครื่องมือ TEDA4I หรือเครื่องมือมาตรฐานอื่น ผลล่าช้า ด้านความเข้าใจภาษา'),
('1B274','การกระตุ้นพัฒนาการเด็กล่าช้าโดยเครื่องมือ TEDA4I หรือเครื่องมือมาตรฐานอื่น ผลล่าช้า ด้านการใช้ภาษา'),
('1B275','การกระตุ้นพัฒนาการเด็กล่าช้าโดยเครื่องมือ TEDA4I หรือเครื่องมือมาตรฐานอื่น ผลล่าช้า ด้านการช่วยเหลือตนเองและสังคม'),
('1B30','ผลการตรวจคัดกรองมะเร็งปากมดลูก ผลปกติ'),
('1B31','ผลการตรวจคัดกรองธาลาสซีเมีย ผลปกติ'),
('1B40','ผลการตรวจคัดกรองมะเร็งปากมดลูก ผลผิดปกติ'),
('1B41','ผลการตรวจคัดกรองธาลาสซีเมีย ผลผิดปกติ'),
('1B501','ผู้มารับบริการมีพฤติกรรมสูบบุหรี่ 1-10 มวนต่อวัน'),
('1B502','ผู้มารับบริการมีพฤติกรรมสูบบุหรี่ 11-19 มวนต่อวัน'),
('1B503','ผู้มารับบริการมีพฤติกรรมสูบบุหรี่ 20 มวนขึ้นไปต่อวัน'),
('1B504','ผู้มารับบริการมีพฤติกรรมสูบบุหรี่มวนแรกหลังตื่นนอน น้อยกว่า 30 นาที'),
('1B505','ผู้มารับบริการมีพฤติกรรมสูบบุหรี่มวนแรกหลังตื่นนอน มากกว่า 30 นาที แต่น้อยกว่า 1 ชั่วโมง'),
('1B506','ผู้มารับบริการมีพฤติกรรมสูบบุหรี่มวนแรกหลังตื่นนอน 1 ชั่วโมง หรือมากกว่า'),
('1B509','ผู้มารับบริการมีพฤติกรรมสูบบุหรี่ ไม่ระบุรายละเอียด'),
('1B51','ผู้มารับบริการมีพฤติกรรมเคยสูบบุหรี่แต่เลิกแล้ว'),
('1B52','ผู้มารับบริการมีพฤติกรรมไม่เคยสูบบุหรี่'),
('1B530','การให้คำแนะนำผู้ติดบุหรี่แบบสั้น (Brief Advice)'),
('1B531','การให้คำปรึกษาเพื่อการเลิกบุหรี่ (Counseling Advice)'),
('1B532','การให้คำปรึกษาและให้ยาเพื่อเลิกบุหรี่ (Counseling Advice + Medicine)'),
('1B540','การติดตามผู้ติดบุหรี่ ระยะเวลา 1 เดือน ผลยังสูบอยู่ปริมาณ/จำนวนมวน เท่าเดิม'),
('1B541','การติดตามผู้ติดบุหรี่ ระยะเวลา 1 เดือน ผลลดปริมาณ/จำนวนมวนที่สูบลงได้'),
('1B542','การติดตามผู้ติดบุหรี่ ระยะเวลา 1 เดือน ผลไม่สูบแล้ว'),
('1B550','การติดตามผู้ติดบุหรี่ ระยะเวลา 3 เดือน ผลยังสูบบุหรี่อยู่ปริมาณ/จำนวนมวนเท่าเดิม'),
('1B551','การติดตามผู้ติดบุหรี่ ระยะเวลา 3 เดือน ผลลดปริมาณ/จำนวนมวนที่สูบลงได้'),
('1B552','การติดตามผู้ติดบุหรี่ ระยะเวลา 3 เดือน ผลไม่สูบแล้ว'),
('1B560','การติดตามผู้ติดบุหรี่ ระยะเวลา 6 เดือน ผลยังสูบบุหรี่อยู่ปริมาณ/จำนวนมวนเท่าเดิม'),
('1B561','การติดตามผู้ติดบุหรี่ ระยะเวลา 6 เดือน ผลลดปริมาณ/จำนวนมวนที่สูบลงได้'),
('1B562','การติดตามผู้ติดบุหรี่ ระยะเวลา 6 เดือน ผลไม่สูบแล้ว'),
('1B600','ผู้มารับบริการไม่เคยดื่มเครื่องดื่มแอลกอฮอล์ ตลอดชีวิตที่ผ่านมา'),
('1B601','ผู้มารับบริการเคยดื่มเครื่องดื่มแอลกอฮอล์ แต่เลิกดื่มมาแล้ว 1 ปีขึ้นไป'),
('1B602','ผู้มารับบริการดื่มเครื่องดื่มแอลกอฮอล์ในระดับเสี่ยงต่ำ (คะแนน 0-10)'),
('1B603','ผู้มารับบริการดื่มเครื่องดื่มแอลกอฮอล์ในระดับเสี่ยงปานกลาง (คะแนน 11-26)'),
('1B604','ผู้มารับบริการดื่มเครื่องดื่มแอลกอฮอล์ในระดับเสี่ยงสูง (คะแนนตั้งแต่ 27 ขึ้นไป)'),
('1B609','ผู้มารับบริการดื่มเครื่องดื่มแอลกอฮอล์ ไม่ระบุรายละเอียด'),
('1B610','การให้คำแนะนำ (brief advice)'),
('1B611','การให้คำปรึกษาแบบสั้น (brief counseling)'),
('1B612','การส่งต่อเพื่อรับการประเมินและการบำบัดโดยผู้เชี่ยวชาญ (refer)'),
('1B620','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 1 เดือน ไม่ดื่มเลย'),
('1B621','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 1 เดือน ดื่มลดลง'),
('1B622','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 1 เดือน ดื่มเท่าเดิม'),
('1B623','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 1 เดือน ดื่มมากขึ้น'),
('1B630','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 3 เดือน ไม่ดื่มเลย'),
('1B631','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 3 เดือน ดื่มลดลง'),
('1B632','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 3 เดือน ดื่มเท่าเดิม'),
('1B633','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 3 เดือน ดื่มมากขึ้น'),
('1B640','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 6 เดือน ไม่ดื่มเลย'),
('1B641','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 6 เดือน ดื่มลดลง'),
('1B642','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 6 เดือน ดื่มเท่าเดิม'),
('1B643','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 6 เดือน ดื่มมากขึ้น'),
('1B650','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 12 เดือน ไม่ดื่มเลย'),
('1B651','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 12 เดือน ดื่มลดลง'),
('1B652','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 12 เดือน ดื่มเท่าเดิม'),
('1B653','การติดตามพฤติกรรมผู้มีปัญหาการดื่มสุรา ระยะเวลา 12 เดือน ดื่มมากขึ้น'),
('1B700','การคัดกรองด้านการมองเห็นเบื้องต้น พบว่าปกติ'),
('1B701','การคัดกรองด้านการมองเห็นเบื้องต้น พบว่ามีความเสี่ยง'),
('1B710','การคัดกรองด้านการได้ยินเบื้องต้น พบว่าปกติ'),
('1B711','การคัดกรองด้านการได้ยินเบื้องต้น พบว่ามีความเสี่ยง'),
('1B720','การคัดกรองด้านการปฏิบัติกิจวัตรประจำวันเบื้องต้น พบว่าปกติ'),
('1B721','การคัดกรองด้านการปฏิบัติกิจวัตรประจำวันเบื้องต้น พบว่ามีความเสี่ยง'),
('1B730','การคัดกรองด้านสุขภาพช่องปากเบื้องต้น พบว่าปกติ'),
('1B731','การคัดกรองด้านสุขภาพช่องปากเบื้องต้น พบว่ามีความเสี่ยง'),
('1F301','การให้คำปรึกษาด้านสุขภาพ กลุ่มชายที่มีเพศสัมพันธ์กับชาย'),
('1F302','การให้คำปรึกษาด้านสุขภาพ กลุ่มสาวประเภทสอง'),
('1F31','การให้คำปรึกษาด้านสุขภาพ กลุ่มที่มีคู่นอนหลายคนเชิงพาณิชย์'),
('1F32','การให้คำปรึกษาด้านสุขภาพ กลุ่มผู้ใช้ยาเสพติดประเภทฉีด'),
('1F33','การให้คำปรึกษาด้านสุขภาพ กลุ่มคู่ผู้ติดเชื้อ'),
('1F38','การให้คำปรึกษาด้านสุขภาพ กลุ่มอื่น ๆ'),
('1F8','การให้บริการติดตาม/ให้คำปรึกษา/ให้ความรู้และแนะนำทางด้านสุขภาพอื่น'),
('1K0','การประเมินการพัฒนาทักษะความรอบรู้ด้านสุขภาพ(HL) ในหญิงตั้งครรภ์'),
('1K00','การประเมินการพัฒนาทักษะความรอบรู้ด้านสุขภาพ(HL) ในหญิงตั้งครรภ์ ผ่านเกณฑ์'),
('1K01','การประเมินการพัฒนาทักษะความรอบรู้ด้านสุขภาพ(HL) ในหญิงตั้งครรภ์ ไม่ผ่านเกณฑ์'),
('1K1','การประเมินภาวะขาดสารอาหาร'),
('1K10','การประเมินภาวะขาดสารอาหาร พบผลปกติ'),
('1K11','การประเมินภาวะขาดสารอาหาร พบเสี่ยงต่อการขาดสารอาหาร'),
('1K12','การประเมินภาวะขาดสารอาหาร พบเสี่ยงต่อการขาดสารอาหาร ได้จัดทำ Care Plan'),
('1K13','การประเมินภาวะขาดสารอาหาร พบเสี่ยงต่อการขาดสารอาหาร ได้จัดทำ Care Plan และให้โปรแกรมส่งเสริมสุขภาพ'),
('1K14','การประเมินภาวะขาดสารอาหาร พบขาดสารอาหาร'),
('1K15','การประเมินภาวะขาดสารอาหาร พบขาดสารอาหาร ให้คำแนะนำและรักษา/ส่งต่อ'),
('1K16','การประเมินภาวะขาดสารอาหาร พบขาดสารอาหารและได้รับการดูแลต่อเนื่อง')
;
-- insert to table pp_special_code only not exists
INSERT IGNORE INTO pp_special_code (
	pp_special_code.`code`,
	pp_special_code.`name`
) SELECT
	cupnp_pp_special_code_master.`code` as 'a',
	cupnp_pp_special_code_master.`name` as 'b'
FROM
	cupnp_pp_special_code_master
WHERE
	cupnp_pp_special_code_master.`code` NOT IN (
		SELECT
			pp_special_code.`code`
		FROM
			pp_special_code
	) ;
-- insert to table pp_special_type only not exists
SET @pp_pype_id := IFNULL((SELECT MAX(pp_special_type_id) FROM pp_special_type),0) ;

INSERT IGNORE INTO pp_special_type (
	pp_special_type.pp_special_type_id,
	pp_special_type.pp_special_type_name,
  pp_special_type.pp_special_code
)
SELECT
	@pp_pype_id := (@pp_pype_id + 1) as 'a',
concat(	
	cupnp_pp_special_code_master.`code`,' ',
	cupnp_pp_special_code_master.`name`
) as 'b',
   cupnp_pp_special_code_master.`code` as 'c'
FROM
	cupnp_pp_special_code_master
WHERE
	cupnp_pp_special_code_master.`code` NOT IN (
		SELECT
			pp_special_type.pp_special_code
		FROM
			pp_special_type
	) ;
DROP TABLE
IF EXISTS cupnp_pp_special_code_master;