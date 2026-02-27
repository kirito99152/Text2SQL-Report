SELECT COUNT(*) FROM kien_truc_su WHERE gioi_tinh = 'nữ'
SELECT ten, quoc_tich, id FROM kien_truc_su WHERE gioi_tinh = 'nam' ORDER BY ten ASC
SELECT kien_truc_su.ten, cau.chieu_dai_theo_met FROM cau JOIN kien_truc_su ON cau.id_kien_truc_su = kien_truc_su.id ORDER BY cau.chieu_dai_theo_met DESC LIMIT 1
SELECT AVG(chieu_dai_theo_feet) FROM cau
SELECT ten, nam_xay_dung FROM nha_may WHERE loai = 'Grondzeiler'
SELECT DISTINCT kien_truc_su.ten, kien_truc_su.quoc_tich FROM kien_truc_su JOIN nha_may ON kien_truc_su.id = nha_may.id_kien_truc_su
SELECT ten FROM nha_may WHERE dia_diem != 'Donceel'
SELECT DISTINCT loai FROM nha_may JOIN kien_truc_su ON nha_may.id_kien_truc_su = kien_truc_su.id WHERE quoc_tich IN ('American', 'Canadian')
SELECT kien_truc_su.id, kien_truc_su.ten FROM kien_truc_su JOIN cau ON kien_truc_su.id = cau.id_kien_truc_su GROUP BY kien_truc_su.id HAVING COUNT(*) >= 3
SELECT kien_truc_su.id, kien_truc_su.ten, kien_truc_su.quoc_tich FROM kien_truc_su JOIN nha_may ON kien_truc_su.id = nha_may.id_kien_truc_su GROUP BY kien_truc_su.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id, T1.ten, T1.gioi_tinh FROM kien_truc_su T1 JOIN cau T2 ON T1.id = T2.id_kien_truc_su GROUP BY T1.id HAVING COUNT(*) >= 2 UNION SELECT T1.id, T1.ten, T1.gioi_tinh FROM kien_truc_su T1 JOIN nha_may T3 ON T1.id = T3.id_kien_truc_su GROUP BY T1.id HAVING COUNT(*) >= 1
SELECT dia_diem FROM cau WHERE ten = 'Cổng vòm Kolob' OR ten = 'Cầu cầu vồng'
SELECT ten FROM nha_may WHERE ten LIKE '%Moulin%'
SELECT DISTINCT n.ten FROM nha_may n JOIN cau c ON n.id_kien_truc_su = c.id_kien_truc_su WHERE c.chieu_dai_theo_met > 80
SELECT loai, COUNT(*) FROM nha_may GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM kien_truc_su WHERE id NOT IN (SELECT id_kien_truc_su FROM nha_may WHERE nam_xay_dung < 1850)
SELECT cau.ten FROM cau JOIN kien_truc_su ON cau.id_kien_truc_su = kien_truc_su.id WHERE kien_truc_su.quoc_tich = 'American' ORDER BY cau.chieu_dai_theo_met ASC
SELECT dia_diem FROM rap_chieu_phim WHERE NOT EXISTS (SELECT 1 FROM rap_chieu_phim r2 WHERE r2.dia_diem = rap_chieu_phim.dia_diem AND r2.suc_chua > 800)
SELECT dia_diem FROM rap_chieu_phim WHERE nam_mo_cua IN (2010, 2011)
SELECT COUNT(*) FROM rap_chieu_phim
SELECT COUNT(*) FROM rap_chieu_phim
SELECT ten, nam_mo_cua, suc_chua FROM rap_chieu_phim
SELECT ten, dia_diem FROM rap_chieu_phim WHERE suc_chua > (SELECT AVG(suc_chua) FROM rap_chieu_phim)
select distinct dia_diem from rap_chieu_phim
SELECT DISTINCT dia_diem FROM rap_chieu_phim
SELECT ten, nam_mo_cua FROM rap_chieu_phim ORDER BY nam_mo_cua DESC
SELECT ten, dia_diem FROM rap_chieu_phim ORDER BY suc_chua DESC LIMIT 1
SELECT AVG(suc_chua), MIN(suc_chua), MAX(suc_chua) FROM rap_chieu_phim WHERE nam_mo_cua > 2011
SELECT dia_diem , COUNT ( * ) FROM rap_chieu_phim GROUP BY dia_diem
SELECT dia_diem FROM rap_chieu_phim WHERE nam_mo_cua >= 2010 GROUP BY dia_diem ORDER BY COUNT(*) DESC LIMIT 1
SELECT dia_diem FROM rap_chieu_phim WHERE suc_chua > 300 GROUP BY dia_diem HAVING COUNT(*) >= 2
SELECT dia_diem FROM rap_chieu_phim WHERE suc_chua > 300 GROUP BY dia_diem HAVING COUNT(*) >= 2
SELECT tieu_de, duoc_dao_dien_boi FROM phim
SELECT tieu_de, duoc_dao_dien_boi FROM phim
SELECT duoc_dao_dien_boi FROM phim
SELECT duoc_dao_dien_boi FROM phim
SELECT duoc_dao_dien_boi , COUNT ( * ) FROM phim GROUP BY duoc_dao_dien_boi
SELECT rap_chieu_phim.ten, SUM(lich_chieu_phim.so_luong_suat_chieu_moi_ngay) FROM rap_chieu_phim JOIN lich_chieu_phim ON rap_chieu_phim.id_rap_chieu_phim = lich_chieu_phim.id_rap_chieu_phim GROUP BY rap_chieu_phim.id_rap_chieu_phim
SELECT phim.tieu_de, MAX(lich_chieu_phim.gia) FROM phim JOIN lich_chieu_phim ON phim.id_phim = lich_chieu_phim.id_phim GROUP BY phim.id_phim
SELECT phim.tieu_de, MAX(lich_chieu_phim.gia) FROM phim JOIN lich_chieu_phim ON phim.id_phim = lich_chieu_phim.id_phim GROUP BY phim.id_phim
SELECT rap_chieu_phim.ten, phim.tieu_de, lich_chieu_phim.ngay, lich_chieu_phim.gia FROM lich_chieu_phim JOIN rap_chieu_phim ON lich_chieu_phim.id_rap_chieu_phim = rap_chieu_phim.id_rap_chieu_phim JOIN phim ON lich_chieu_phim.id_phim = phim.id_phim
SELECT tieu_de, duoc_dao_dien_boi FROM phim WHERE id_phim NOT IN (SELECT id_phim FROM lich_chieu_phim)
SELECT T1.duoc_dao_dien_boi FROM phim AS T1 JOIN lich_chieu_phim AS T2 ON T1.id_phim = T2.id_phim GROUP BY T1.duoc_dao_dien_boi ORDER BY COUNT(*) DESC LIMIT 1
SELECT dia_diem FROM rap_chieu_phim WHERE suc_chua > 300 GROUP BY dia_diem HAVING COUNT(*) > 1
SELECT dia_diem FROM rap_chieu_phim WHERE suc_chua > 300 GROUP BY dia_diem HAVING COUNT(*) > 1
SELECT COUNT(*) FROM phim WHERE tieu_de LIKE '%Dummy%'
SELECT COUNT(*) FROM phim WHERE tieu_de LIKE '%Dummy%'
SELECT COUNT(*) FROM khoa_hoc
SELECT COUNT(*) FROM khoa_hoc
SELECT COUNT(*) FROM khoa_hoc WHERE so_luong_tin_chi > 2
SELECT COUNT(*) FROM khoa_hoc WHERE so_luong_tin_chi > 2
SELECT ten_khoa_hoc FROM khoa_hoc WHERE so_luong_tin_chi = 1
SELECT ten_khoa_hoc FROM khoa_hoc WHERE so_luong_tin_chi = 1
SELECT id_khoa_hoc, ten_khoa_hoc FROM khoa_hoc WHERE ngay IN ('Mon', 'Tue', 'Wed')
SELECT ten_khoa_hoc FROM khoa_hoc WHERE ngay = 'MTW'
SELECT COUNT(*) FROM khoa WHERE bo_phan = 'AS'
SELECT COUNT(*) FROM khoa WHERE bo_phan = 'AS'
SELECT so_dien_thoai_khoa FROM khoa WHERE phong = '268'
SELECT so_dien_thoai_khoa FROM khoa WHERE phong = '268'
SELECT COUNT(DISTINCT sinh_vien.id_sinh_vien) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien JOIN chuyen_doi_diem ON dang_ky_khoa_hoc.diem = chuyen_doi_diem.bang_diem WHERE chuyen_doi_diem.bang_diem = 'B'
SELECT COUNT(DISTINCT dang_ky_khoa_hoc.id_sinh_vien) FROM dang_ky_khoa_hoc JOIN chuyen_doi_diem ON dang_ky_khoa_hoc.diem = chuyen_doi_diem.bang_diem WHERE chuyen_doi_diem.bang_diem = 'B'
SELECT MAX(diem_so), MIN(diem_so) FROM chuyen_doi_diem
SELECT MAX(diem_so) AS diem_cao_nhat, MIN(diem_so) AS diem_thap_nhat FROM chuyen_doi_diem
SELECT ten FROM sinh_vien WHERE ten LIKE '%a%'
SELECT ten FROM sinh_vien WHERE ho LIKE '%a%'
SELECT ho , ten FROM giang_vien WHERE gioi_tinh = 'nam' AND toa_nha = 'NEB'
SELECT ho , ten FROM giang_vien WHERE gioi_tinh = 'nam' AND toa_nha = 'NEB'
SELECT phong FROM giang_vien WHERE ngach = 'Giáo sư' AND toa_nha = 'NEB'
SELECT phong FROM giang_vien WHERE ngach = 'Giáo sư' AND toa_nha = 'NEB'
SELECT ten_khoa FROM khoa WHERE toa_nha = 'Mergenthaler'
SELECT ten_khoa FROM khoa WHERE toa_nha = 'Mergenthaler'
SELECT * FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT * FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT ten_khoa_hoc FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT ten_khoa_hoc, so_luong_tin_chi FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT ten FROM sinh_vien ORDER BY tuoi DESC
SELECT ho, ten FROM sinh_vien ORDER BY tuoi DESC
SELECT ho FROM sinh_vien WHERE gioi_tinh = 'F' ORDER BY tuoi DESC
SELECT ho FROM sinh_vien WHERE gioi_tinh = 'nữ' ORDER BY tuoi DESC
SELECT ho FROM giang_vien WHERE toa_nha = 'Barton' ORDER BY ho ASC
SELECT ho FROM giang_vien WHERE toa_nha = 'Barton' ORDER BY ho ASC
SELECT ho , ten FROM giang_vien ORDER BY ho , ten ASC
SELECT ten FROM giang_vien WHERE ngach = 'Giáo sư' ORDER BY ten ASC
SELECT ten_khoa FROM khoa JOIN chuyen_nganh_phu ON khoa.ma_so_khoa = chuyen_nganh_phu.ma_so_khoa JOIN sinh_vien ON chuyen_nganh_phu.id_sinh_vien = sinh_vien.id_sinh_vien GROUP BY khoa.ma_so_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khoa FROM khoa JOIN chuyen_nganh_phu ON khoa.ma_so_khoa = chuyen_nganh_phu.ma_so_khoa GROUP BY khoa.ma_so_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khoa FROM khoa WHERE ma_so_khoa NOT IN (SELECT ma_so_khoa FROM chuyen_nganh_phu)
SELECT ten_khoa FROM khoa EXCEPT SELECT khoa.ten_khoa FROM khoa JOIN chuyen_nganh_phu ON khoa.ma_so_khoa = chuyen_nganh_phu.ma_so_khoa
SELECT ten_khoa FROM khoa LEFT JOIN la_thanh_vien_cua ON khoa.ma_so_khoa = la_thanh_vien_cua.ma_so_khoa LEFT JOIN chuyen_nganh_phu ON khoa.ma_so_khoa = chuyen_nganh_phu.ma_so_khoa GROUP BY khoa.ma_so_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT khoa.ten_khoa FROM khoa JOIN la_thanh_vien_cua ON khoa.ma_so_khoa = la_thanh_vien_cua.ma_so_khoa GROUP BY khoa.ma_so_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT ngach FROM giang_vien GROUP BY ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT ngach FROM giang_vien GROUP BY ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT ho , ten FROM giang_vien JOIN khoa_hoc ON giang_vien.id_giang_vien = khoa_hoc.nguoi_huong_dan GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 3
SELECT giang_vien.ho , giang_vien.ten FROM giang_vien JOIN khoa_hoc ON giang_vien.id_giang_vien = khoa_hoc.nguoi_huong_dan GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 3
SELECT T1.toa_nha , COUNT ( * ) FROM giang_vien AS T1 JOIN khoa_hoc AS T2 ON T1.id_giang_vien = T2.nguoi_huong_dan GROUP BY T1.id_giang_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT giang_vien.toa_nha FROM giang_vien JOIN khoa_hoc ON giang_vien.id_giang_vien = khoa_hoc.nguoi_huong_dan GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khoa_hoc FROM khoa_hoc JOIN dang_ky_khoa_hoc ON khoa_hoc.id_khoa_hoc = dang_ky_khoa_hoc.ma_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc, ten_khoa_hoc HAVING COUNT(*) >= 5
SELECT T1.ten_khoa_hoc FROM khoa_hoc AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.id_khoa_hoc = T2.ma_khoa_hoc GROUP BY T1.id_khoa_hoc HAVING COUNT(*) >= 5
SELECT giang_vien.ho , giang_vien.ten FROM khoa_hoc JOIN giang_vien ON khoa_hoc.nguoi_huong_dan = giang_vien.id_giang_vien WHERE khoa_hoc.ten_khoa_hoc = 'Kỹ năng máy tính'
SELECT giang_vien.ho , giang_vien.ten FROM khoa_hoc JOIN giang_vien ON khoa_hoc.nguoi_huong_dan = giang_vien.id_giang_vien WHERE khoa_hoc.ten_khoa_hoc = 'Computer Skills'
SELECT khoa.ten_khoa, khoa.phong FROM khoa_hoc JOIN khoa ON khoa_hoc.ma_so_khoa = khoa.ma_so_khoa WHERE khoa_hoc.ten_khoa_hoc = 'Giới thiệu về khoa học máy tính'
SELECT khoa.ten_khoa, khoa.phong FROM khoa_hoc JOIN khoa ON khoa_hoc.ma_so_khoa = khoa.ma_so_khoa WHERE khoa_hoc.ten_khoa_hoc = 'Giới thiệu về khoa học máy tính'
SELECT T2.ho , T2.ten , T3.diem_so FROM dang_ky_khoa_hoc AS T1 JOIN sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien JOIN chuyen_doi_diem AS T3 ON T1.diem = T3.bang_diem
SELECT sinh_vien.ho, sinh_vien.ten, dang_ky_khoa_hoc.diem FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien
SELECT DISTINCT sinh_vien.ten FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien JOIN chuyen_doi_diem ON dang_ky_khoa_hoc.diem = chuyen_doi_diem.bang_diem WHERE chuyen_doi_diem.diem_so > 3.8
SELECT DISTINCT sinh_vien.ho , sinh_vien.ten FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien JOIN chuyen_doi_diem ON dang_ky_khoa_hoc.diem = chuyen_doi_diem.bang_diem WHERE chuyen_doi_diem.diem_so > 3.8
SELECT giang_vien.ho , giang_vien.ten FROM giang_vien JOIN la_thanh_vien_cua ON giang_vien.id_giang_vien = la_thanh_vien_cua.id_giang_vien WHERE la_thanh_vien_cua.ma_so_khoa = 520
SELECT ho , ten FROM giang_vien JOIN la_thanh_vien_cua ON giang_vien.id_giang_vien = la_thanh_vien_cua.id_giang_vien WHERE la_thanh_vien_cua.ma_so_khoa = 520
SELECT ho, ten FROM sinh_vien JOIN chuyen_nganh_phu ON sinh_vien.id_sinh_vien = chuyen_nganh_phu.id_sinh_vien WHERE chuyen_nganh_phu.ma_so_khoa = 140
SELECT ho , ten FROM sinh_vien JOIN chuyen_nganh_phu ON sinh_vien.id_sinh_vien = chuyen_nganh_phu.id_sinh_vien WHERE chuyen_nganh_phu.ma_so_khoa = 140
SELECT giang_vien.ho FROM giang_vien JOIN la_thanh_vien_cua ON giang_vien.id_giang_vien = la_thanh_vien_cua.id_giang_vien JOIN khoa ON la_thanh_vien_cua.ma_so_khoa = khoa.ma_so_khoa WHERE khoa.ten_khoa = 'Khoa học máy tính'
SELECT giang_vien.ho FROM giang_vien JOIN la_thanh_vien_cua ON giang_vien.id_giang_vien = la_thanh_vien_cua.id_giang_vien JOIN khoa ON la_thanh_vien_cua.ma_so_khoa = khoa.ma_so_khoa WHERE khoa.ten_khoa = 'Khoa học máy tính'
SELECT AVG(T3.diem_so) FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien JOIN chuyen_doi_diem AS T3 ON T2.diem = T3.bang_diem WHERE T1.ho = 'Smith'
SELECT AVG(dang_ky_khoa_hoc.diem) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien WHERE sinh_vien.ho = 'Smith'
SELECT MAX(dang_ky_khoa_hoc.diem) AS cao_nhat, MIN(dang_ky_khoa_hoc.diem) AS thap_nhat FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien WHERE sinh_vien.ma_thanh_pho = 'NYC'
SELECT MAX(chuyen_doi_diem.diem_so), MIN(chuyen_doi_diem.diem_so) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien JOIN chuyen_doi_diem ON dang_ky_khoa_hoc.diem = chuyen_doi_diem.bang_diem WHERE sinh_vien.ma_thanh_pho = 'NYC'
SELECT ten_khoa_hoc FROM khoa_hoc WHERE so_luong_tin_chi IN (1, 3) AND gio = '4'
SELECT ten_khoa_hoc FROM khoa_hoc WHERE so_luong_tin_chi IN (1, 3) AND gio = '4'
SELECT ten_khoa FROM khoa WHERE bo_phan IN ('AS', 'EN') AND toa_nha = 'NEB'
SELECT ten_khoa FROM khoa WHERE bo_phan IN ('AS', 'EN') AND toa_nha = 'NEB'
SELECT ho , ten FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT DISTINCT id_sinh_vien FROM dang_ky_khoa_hoc)
SELECT ho , ten FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM dang_ky_khoa_hoc)
SELECT COUNT(*) FROM ca_si
SELECT COUNT(*) FROM ca_si
SELECT ten, quoc_gia, tuoi FROM ca_si ORDER BY tuoi DESC
SELECT ten, quoc_gia, tuoi FROM ca_si ORDER BY tuoi DESC
SELECT AVG(tuoi), MAX(tuoi), MIN(tuoi) FROM ca_si WHERE quoc_gia = 'Pháp'
SELECT AVG(tuoi), MAX(tuoi), MIN(tuoi) FROM ca_si WHERE quoc_gia = 'Pháp'
SELECT ten , nam_phat_hanh_bai_hat FROM ca_si ORDER BY tuoi ASC LIMIT 1
SELECT ten_bai_hat, nam_phat_hanh_bai_hat FROM ca_si ORDER BY tuoi ASC LIMIT 1
SELECT DISTINCT quoc_gia FROM ca_si WHERE tuoi > 20
SELECT quoc_gia FROM ca_si WHERE tuoi > 20
SELECT quoc_gia , COUNT ( * ) FROM ca_si GROUP BY quoc_gia
SELECT COUNT(*) FROM ca_si GROUP BY quoc_gia
SELECT ten_bai_hat FROM ca_si WHERE tuoi > (SELECT AVG(tuoi) FROM ca_si)
SELECT ten_bai_hat FROM ca_si WHERE tuoi > (SELECT AVG(tuoi) FROM ca_si)
SELECT dia_diem, ten FROM san_van_dong WHERE suc_chua BETWEEN 5000 AND 10000
SELECT ten, dia_diem FROM san_van_dong WHERE suc_chua BETWEEN 5000 AND 10000
SELECT AVG(suc_chua), MAX(suc_chua) FROM san_van_dong
SELECT ten, suc_chua FROM san_van_dong ORDER BY so_luong_tham_gia_trung_binh DESC LIMIT 1
SELECT ten, suc_chua FROM san_van_dong ORDER BY so_luong_tham_gia_trung_binh DESC LIMIT 1
SELECT COUNT(*) FROM buoi_hoa_nhac WHERE nam = '2014' OR nam = '2015'
SELECT COUNT(*) FROM buoi_hoa_nhac WHERE nam = '2014' OR nam = '2015'
SELECT san_van_dong.ten , COUNT ( * ) FROM san_van_dong JOIN buoi_hoa_nhac ON san_van_dong.id_san_van_dong = buoi_hoa_nhac.id_san_van_dong GROUP BY san_van_dong.id_san_van_dong
SELECT san_van_dong.dia_diem, COUNT(*) FROM buoi_hoa_nhac JOIN san_van_dong ON buoi_hoa_nhac.id_san_van_dong = san_van_dong.id_san_van_dong GROUP BY san_van_dong.id_san_van_dong
The SQL is invalid due to a type mismatch in the JOIN condition. The `buoi_hoa_nhac.id_san_van_dong` is a text field referencing a numeric `san_van_dong.id_san_van_dong`. This requires explicit type conversion. **Corrected SQL:** SELECT san_van_dong.ten , san_van_dong.suc_chua FROM san_van_dong JOIN buoi_hoa_nhac ON san_van_dong.id_san_van_dong = CAST(buoi_hoa_nhac.id_san_van_dong AS NUMBER) WHERE buoi_hoa_nhac.nam >= '2014' GROUP BY san_van_dong.id_san_van_dong ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT ten, suc_chua FROM san_van_dong JOIN buoi_hoa_nhac ON san_van_dong.id_san_van_dong = buoi_hoa_nhac.id_san_van_dong WHERE buoi_hoa_nhac.nam > '2013' GROUP BY san_van_dong.id_san_van_dong, ten ORDER BY COUNT(*) DESC LIMIT 1
SELECT nam FROM buoi_hoa_nhac GROUP BY nam ORDER BY COUNT(*) DESC LIMIT 1
SELECT nam FROM buoi_hoa_nhac GROUP BY nam ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM san_van_dong WHERE id_san_van_dong NOT IN (SELECT id_san_van_dong FROM buoi_hoa_nhac)
SELECT ten FROM san_van_dong WHERE id_san_van_dong NOT IN (SELECT id_san_van_dong FROM buoi_hoa_nhac)
SELECT quoc_gia FROM ca_si WHERE tuoi > 40 INTERSECT SELECT quoc_gia FROM ca_si WHERE tuoi < 30
SELECT ten FROM san_van_dong WHERE id_san_van_dong NOT IN (SELECT id_san_van_dong FROM buoi_hoa_nhac WHERE nam = '2014')
SELECT ten FROM san_van_dong WHERE id_san_van_dong NOT IN (SELECT id_san_van_dong FROM buoi_hoa_nhac WHERE nam = '2014')
SELECT T1.ten_buoi_hoa_nhac, T1.chu_de, COUNT(*) FROM buoi_hoa_nhac AS T1 JOIN ca_si_trong_buoi_hoa_nhac AS T2 ON T1.id_buoi_hoa_nhac = CAST(T2.id_buoi_hoa_nhac AS NUMBER) GROUP BY T1.id_buoi_hoa_nhac
SELECT T1.ten_buoi_hoa_nhac , T1.chu_de , COUNT(*) FROM buoi_hoa_nhac AS T1 JOIN ca_si_trong_buoi_hoa_nhac AS T2 ON T1.id_buoi_hoa_nhac = T2.id_buoi_hoa_nhac GROUP BY T1.id_buoi_hoa_nhac
SELECT ca_si.ten, COUNT(*) AS so_luong_buoi FROM ca_si JOIN ca_si_trong_buoi_hoa_nhac ON ca_si.id_ca_si = ca_si_trong_buoi_hoa_nhac.id_ca_si GROUP BY ca_si.id_ca_si
SELECT ca_si.ten, COUNT(*) FROM ca_si JOIN ca_si_trong_buoi_hoa_nhac ON ca_si.id_ca_si = ca_si_trong_buoi_hoa_nhac.id_ca_si GROUP BY ca_si.id_ca_si
SELECT T1.ten FROM ca_si AS T1 JOIN ca_si_trong_buoi_hoa_nhac AS T2 ON T1.id_ca_si = T2.id_ca_si JOIN buoi_hoa_nhac AS T3 ON T2.id_buoi_hoa_nhac = T3.id_buoi_hoa_nhac WHERE T3.nam = '2014'
SELECT ca_si.ten FROM ca_si JOIN ca_si_trong_buoi_hoa_nhac ON ca_si.id_ca_si = ca_si_trong_buoi_hoa_nhac.id_ca_si JOIN buoi_hoa_nhac ON ca_si_trong_buoi_hoa_nhac.id_buoi_hoa_nhac = buoi_hoa_nhac.id_buoi_hoa_nhac WHERE buoi_hoa_nhac.nam = '2014'
SELECT ten, quoc_gia FROM ca_si WHERE ten_bai_hat LIKE '%Hey%'
SELECT ten, quoc_gia FROM ca_si WHERE ten_bai_hat LIKE '%Hey%'
SELECT san_van_dong.ten, san_van_dong.dia_diem FROM san_van_dong JOIN buoi_hoa_nhac ON san_van_dong.id_san_van_dong = buoi_hoa_nhac.id_san_van_dong GROUP BY san_van_dong.id_san_van_dong HAVING COUNT(DISTINCT CASE WHEN buoi_hoa_nhac.nam = '2014' THEN 1 END) > 0 AND COUNT(DISTINCT CASE WHEN buoi_hoa_nhac.nam = '2015' THEN 1 END) > 0
SELECT ten, dia_diem FROM san_van_dong WHERE id_san_van_dong IN (SELECT id_san_van_dong FROM buoi_hoa_nhac WHERE nam = '2014' INTERSECT SELECT id_san_van_dong FROM buoi_hoa_nhac WHERE nam = '2015')
SELECT COUNT(*) FROM buoi_hoa_nhac WHERE id_san_van_dong = (SELECT CAST(id_san_van_dong AS TEXT) FROM san_van_dong ORDER BY suc_chua DESC LIMIT 1)
SELECT COUNT(*) FROM buoi_hoa_nhac WHERE id_san_van_dong = (SELECT CAST(id_san_van_dong AS TEXT) FROM san_van_dong ORDER BY suc_chua DESC LIMIT 1)
SELECT COUNT(*) FROM khu_nha
SELECT mau_cua_khu_nha FROM khu_nha
SELECT chi_tiet_khu_nha, mau_cua_khu_nha FROM khu_nha ORDER BY mau_cua_khu_nha ASC
SELECT mau_cua_khu_nha , COUNT ( * ) FROM khu_nha GROUP BY mau_cua_khu_nha
SELECT T1.danh_muc_san_pham , COUNT ( * ) FROM chien_dich_gui_thu_quang_cao AS T1 JOIN thu_quang_cao_gui_khach_hang AS T2 ON T1.id_thu_quang_cao = T2.id_thu_quang_cao GROUP BY T1.danh_muc_san_pham
SELECT ten_khach_hang, so_dien_thoai_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM thu_quang_cao_gui_khach_hang)
SELECT ten_khach_hang, so_dien_thoai_khach_hang FROM khach_hang JOIN thu_quang_cao_gui_khach_hang ON khach_hang.id_khach_hang = thu_quang_cao_gui_khach_hang.id_khach_hang WHERE thu_quang_cao_gui_khach_hang.ma_ket_qua = 'Không phản hồi'
SELECT ma_ket_qua , COUNT ( * ) FROM thu_quang_cao_gui_khach_hang GROUP BY ma_ket_qua
SELECT T1.ten_khach_hang FROM khach_hang AS T1 JOIN thu_quang_cao_gui_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.ma_ket_qua = 'Đặt hàng' GROUP BY T1.id_khach_hang HAVING COUNT(*) >= 2
SELECT T1.ten_khach_hang FROM khach_hang AS T1 JOIN thu_quang_cao_gui_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT kh.ten_khach_hang, kh.phuong_thuc_thanh_toan FROM khach_hang kh JOIN thu_quang_cao_gui_khach_hang tq ON kh.id_khach_hang = tq.id_khach_hang WHERE EXISTS (SELECT 1 FROM thu_quang_cao_gui_khach_hang tq2 WHERE tq2.id_khach_hang = kh.id_khach_hang AND tq2.ma_ket_qua = 'Đặt hàng') AND EXISTS (SELECT 1 FROM thu_quang_cao_gui_khach_hang tq3 WHERE tq3.id_khach_hang = kh.id_khach_hang AND tq3.ma_ket_qua != 'Đặt hàng')
SELECT khu_nha.mau_cua_khu_nha , dia_chi_khach_hang.ma_loai_dia_chi FROM khach_hang JOIN dia_chi_khach_hang ON khach_hang.id_khach_hang = dia_chi_khach_hang.id_khach_hang JOIN khu_nha ON dia_chi_khach_hang.id_khu_nha = khu_nha.id_khu_nha
SELECT DISTINCT ma_loai_dia_chi FROM dia_chi_khach_hang
SELECT id_khach_hang, phi_van_chuyen_don_hang FROM luot_dat_hang_cua_khach_hang WHERE ma_trang_thai_don_hang = 'Bị huỷ' OR ma_trang_thai_don_hang = 'Đã thanh toán tiền'
SELECT khach_hang.ten_khach_hang FROM khach_hang JOIN luot_dat_hang_cua_khach_hang ON khach_hang.id_khach_hang = luot_dat_hang_cua_khach_hang.id_khach_hang WHERE luot_dat_hang_cua_khach_hang.ma_phuong_thuc_van_chuyen = 'FedEx' AND luot_dat_hang_cua_khach_hang.ma_trang_thai_don_hang = 'Đã được thanh toán'
SELECT COUNT(*) FROM tai_khoan
SELECT COUNT(*) FROM tai_khoan
SELECT id_tai_khoan, id_khach_hang, ten_tai_khoan FROM tai_khoan
SELECT id_tai_khoan, id_khach_hang, ten_tai_khoan FROM tai_khoan
SELECT chi_tiet_khac_ve_tai_khoan FROM tai_khoan WHERE ten_tai_khoan = '338'
SELECT chi_tiet_khac_ve_tai_khoan FROM tai_khoan WHERE ten_tai_khoan = '338'
SELECT khach_hang.ten_cua_khach_hang, khach_hang.ho_cua_khach_hang, khach_hang.so_dien_thoai_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang WHERE tai_khoan.ten_tai_khoan = '162'
SELECT T1.ho_cua_khach_hang, T1.ten_cua_khach_hang, T1.so_dien_thoai_khach_hang FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.ten_tai_khoan = '162'
SELECT COUNT(*) FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Art' AND khach_hang.ho_cua_khach_hang = 'Turcotte'
SELECT COUNT(*) FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Art' AND khach_hang.ho_cua_khach_hang = 'Turcotte'
SELECT T1.id_khach_hang, COUNT(*) FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang
SELECT tai_khoan.id_khach_hang , COUNT(*) FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang GROUP BY tai_khoan.id_khach_hang
SELECT T1.id_khach_hang , COUNT(*) FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT tai_khoan.id_khach_hang , COUNT(*) AS num_accounts FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang GROUP BY tai_khoan.id_khach_hang ORDER BY num_accounts DESC LIMIT 1
SELECT T1.id_khach_hang , T1.ten_cua_khach_hang , T1.ho_cua_khach_hang FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT(*) ASC LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.ten_cua_khach_hang, khach_hang.ho_cua_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT ten_cua_khach_hang, ho_cua_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT ho_cua_khach_hang, ten_cua_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT ho_cua_khach_hang, ten_cua_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang
SELECT ho_cua_khach_hang, ten_cua_khach_hang FROM khach_hang WHERE id_khach_hang IN (SELECT id_khach_hang FROM tai_khoan)
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang IN (SELECT id_khach_hang FROM tai_khoan)
SELECT COUNT(DISTINCT id_khach_hang) FROM tai_khoan
SELECT COUNT(*) FROM khach_hang
SELECT COUNT(*) FROM khach_hang
SELECT id_khach_hang, ten_cua_khach_hang, ho_cua_khach_hang, so_dien_thoai_khach_hang FROM khach_hang
SELECT id_khach_hang, ho_cua_khach_hang, ten_cua_khach_hang, so_dien_thoai_khach_hang FROM khach_hang
SELECT so_dien_thoai_khach_hang, email_cua_khach_hang FROM khach_hang WHERE ten_cua_khach_hang = 'Aniyah' AND ho_cua_khach_hang = 'Feest'
SELECT so_dien_thoai_khach_hang, email_cua_khach_hang FROM khach_hang WHERE ten_cua_khach_hang = 'Aniyah' AND ho_cua_khach_hang = 'Feest'
SELECT COUNT(*) FROM the_khach_hang
SELECT COUNT(*) FROM the_khach_hang
SELECT id_the, id_khach_hang, ma_loai_the, so_the FROM the_khach_hang
SELECT id_the, id_khach_hang, ma_loai_the, so_the FROM the_khach_hang
SELECT hop_le_tu_ngay, hop_le_den_ngay FROM the_khach_hang WHERE so_the = '4560596484842'
SELECT hop_le_tu_ngay, hop_le_den_ngay FROM the_khach_hang WHERE so_the = '4560596484842'
SELECT khach_hang.ten_cua_khach_hang, khach_hang.ho_cua_khach_hang, khach_hang.so_dien_thoai_khach_hang FROM khach_hang JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang WHERE the_khach_hang.so_the = '4560596484842'
SELECT khach_hang.ten_cua_khach_hang, khach_hang.ho_cua_khach_hang, khach_hang.so_dien_thoai_khach_hang FROM khach_hang JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang WHERE the_khach_hang.so_the = '4560596484842'
SELECT COUNT(*) FROM khach_hang JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Art Turcotte'
SELECT COUNT(*) FROM khach_hang JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Art' AND khach_hang.ho_cua_khach_hang = 'Turcotte'
SELECT COUNT(*) FROM the_khach_hang WHERE ma_loai_the = 'Ghi nợ'
SELECT COUNT(*) FROM the_khach_hang WHERE ma_loai_the = 'Ghi nợ'
SELECT COUNT(*) FROM khach_hang JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Blanche' AND khach_hang.ho_cua_khach_hang = 'Huels'
SELECT COUNT(*) FROM khach_hang JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Blanche' AND khach_hang.ho_cua_khach_hang = 'Huels'
SELECT T1.id_khach_hang , COUNT(*) FROM khach_hang AS T1 JOIN the_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang
SELECT T1.id_khach_hang , COUNT ( * ) FROM khach_hang AS T1 JOIN the_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang
SELECT khach_hang.id_khach_hang , COUNT(*) FROM khach_hang JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM the_khach_hang GROUP BY id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_khach_hang, T1.ten_cua_khach_hang, T1.ho_cua_khach_hang FROM khach_hang AS T1 JOIN the_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang HAVING COUNT(*) >= 2
SELECT T1.id_khach_hang, T1.ho_cua_khach_hang, T1.ten_cua_khach_hang FROM khach_hang AS T1 JOIN the_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang HAVING COUNT(*) >= 2
SELECT T1.id_khach_hang , T1.ho_cua_khach_hang , T1.ten_cua_khach_hang FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.id_khach_hang , T1.ten_cua_khach_hang , T1.ho_cua_khach_hang FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT(*) ASC LIMIT 1
SELECT ma_loai_the, COUNT(*) FROM the_khach_hang GROUP BY ma_loai_the
SELECT ma_loai_the, COUNT(*) FROM the_khach_hang GROUP BY ma_loai_the
SELECT ma_loai_the FROM the_khach_hang GROUP BY ma_loai_the ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_the FROM the_khach_hang GROUP BY ma_loai_the ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_the FROM the_khach_hang GROUP BY ma_loai_the HAVING COUNT(*) >= 5
SELECT ma_loai_the FROM the_khach_hang GROUP BY ma_loai_the HAVING COUNT(*) >= 5
SELECT ma_loai_the, COUNT(DISTINCT id_khach_hang) FROM the_khach_hang GROUP BY ma_loai_the
SELECT ma_loai_the , COUNT ( * ) FROM the_khach_hang GROUP BY ma_loai_the
SELECT id_khach_hang, ten_cua_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM the_khach_hang)
SELECT id_khach_hang, ten_cua_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM the_khach_hang)
SELECT ma_loai_the FROM the_khach_hang
SELECT DISTINCT ma_loai_the FROM the_khach_hang
SELECT COUNT(DISTINCT ma_loai_the) FROM the_khach_hang
SELECT COUNT(DISTINCT ma_loai_the) FROM the_khach_hang
SELECT DISTINCT loai_giao_dich FROM giao_dich_tai_chinh
SELECT DISTINCT loai_giao_dich FROM giao_dich_tai_chinh
SELECT loai_giao_dich, COUNT(*) FROM giao_dich_tai_chinh GROUP BY loai_giao_dich
SELECT COUNT(DISTINCT loai_giao_dich) FROM giao_dich_tai_chinh
SELECT SUM(so_tien_giao_dich), AVG(so_tien_giao_dich) FROM giao_dich_tai_chinh
SELECT AVG(so_tien_giao_dich), SUM(so_tien_giao_dich) FROM giao_dich_tai_chinh
SELECT T1.ma_loai_the, COUNT(*) FROM the_khach_hang AS T1 JOIN giao_dich_tai_chinh AS T2 ON T1.id_the = T2.id_the GROUP BY T1.ma_loai_the
SELECT T1.ma_loai_the, COUNT(*) FROM the_khach_hang AS T1 JOIN giao_dich_tai_chinh AS T2 ON T1.id_the = T2.id_the GROUP BY T1.ma_loai_the
SELECT loai_giao_dich, COUNT(*) FROM giao_dich_tai_chinh GROUP BY loai_giao_dich
SELECT loai_giao_dich, COUNT(*) FROM giao_dich_tai_chinh GROUP BY loai_giao_dich
SELECT loai_giao_dich FROM giao_dich_tai_chinh ORDER BY SUM(so_tien_giao_dich) DESC LIMIT 1
SELECT loai_giao_dich FROM giao_dich_tai_chinh GROUP BY loai_giao_dich ORDER BY SUM(so_tien_giao_dich) DESC LIMIT 1
SELECT tai_khoan.id_tai_khoan , COUNT ( * ) FROM tai_khoan JOIN giao_dich_tai_chinh ON tai_khoan.id_tai_khoan = giao_dich_tai_chinh.id_tai_khoan GROUP BY tai_khoan.id_tai_khoan
SELECT T1.id_tai_khoan , COUNT ( * ) FROM tai_khoan AS T1 JOIN giao_dich_tai_chinh AS T2 ON T1.id_tai_khoan = T2.id_tai_khoan GROUP BY T1.id_tai_khoan
SELECT ten_tai_lieu, so_luong_truy_cap FROM tai_lieu ORDER BY ten_tai_lieu ASC
SELECT ten_tai_lieu, so_luong_truy_cap FROM tai_lieu ORDER BY ten_tai_lieu ASC
SELECT ten_tai_lieu, so_luong_truy_cap FROM tai_lieu ORDER BY so_luong_truy_cap DESC LIMIT 1
SELECT ten_tai_lieu, so_luong_truy_cap FROM tai_lieu ORDER BY so_luong_truy_cap DESC LIMIT 1
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING COUNT(*) > 4
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING COUNT(*) > 4
SELECT SUM(so_luong_truy_cap) FROM tai_lieu GROUP BY ma_loai_tai_lieu ORDER BY SUM(so_luong_truy_cap) DESC LIMIT 1
SELECT SUM(tai_lieu.so_luong_truy_cap) FROM tai_lieu WHERE tai_lieu.ma_loai_tai_lieu = (SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu ORDER BY COUNT(*) DESC LIMIT 1)
SELECT AVG(so_luong_truy_cap) FROM tai_lieu
SELECT AVG(so_luong_truy_cap) FROM tai_lieu
SELECT cau_truc_tai_lieu.mo_ta_ve_cau_truc_tai_lieu FROM tai_lieu JOIN cau_truc_tai_lieu ON tai_lieu.ma_cau_truc_tai_lieu = cau_truc_tai_lieu.ma_cau_truc_tai_lieu ORDER BY tai_lieu.so_luong_truy_cap ASC LIMIT 1
SELECT T1.mo_ta_ve_cau_truc_tai_lieu FROM cau_truc_tai_lieu AS T1 JOIN tai_lieu AS T2 ON T1.ma_cau_truc_tai_lieu = T2.ma_cau_truc_tai_lieu ORDER BY T2.so_luong_truy_cap ASC LIMIT 1
SELECT ma_loai_tai_lieu FROM tai_lieu WHERE ten_tai_lieu = 'David CV'
SELECT ma_loai_tai_lieu FROM tai_lieu WHERE ten_tai_lieu = 'David CV'
SELECT * FROM tai_lieu WHERE ma_loai_tai_lieu IN (SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3) AND ma_cau_truc_tai_lieu IN (SELECT ma_cau_truc_tai_lieu FROM tai_lieu GROUP BY ma_cau_truc_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3)
SELECT ten_tai_lieu FROM tai_lieu WHERE ma_loai_tai_lieu IN (SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3) AND ma_cau_truc_tai_lieu IN (SELECT ma_cau_truc_tai_lieu FROM tai_lieu GROUP BY ma_cau_truc_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3)
SELECT ma_loai_tai_lieu, SUM(so_luong_truy_cap) FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING SUM(so_luong_truy_cap) > 10000
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING SUM(so_luong_truy_cap) > 10000
SELECT T1.tieu_de_muc FROM cac_muc_cua_tai_lieu AS T1 JOIN tai_lieu AS T2 ON T1.ma_tai_lieu = T2.ma_tai_lieu WHERE T2.ten_tai_lieu = 'David CV'
SELECT T2.tieu_de_muc FROM tai_lieu AS T1 JOIN cac_muc_cua_tai_lieu AS T2 ON T1.ma_tai_lieu = T2.ma_tai_lieu WHERE T1.ten_tai_lieu = 'David CV'
SELECT ten_tai_lieu FROM tai_lieu WHERE ma_tai_lieu NOT IN (SELECT ma_tai_lieu FROM cac_muc_cua_tai_lieu)
SELECT ten_tai_lieu FROM tai_lieu WHERE ma_tai_lieu NOT IN (SELECT ma_tai_lieu FROM cac_muc_cua_tai_lieu)
SELECT ten_nguoi_dung, mat_khau FROM nguoi_dung WHERE ma_vai_tro = (SELECT ma_vai_tro FROM nguoi_dung GROUP BY ma_vai_tro ORDER BY COUNT(*) DESC LIMIT 1)
SELECT ten_nguoi_dung, mat_khau FROM nguoi_dung JOIN vai_tro ON nguoi_dung.ma_vai_tro = vai_tro.ma_vai_tro GROUP BY nguoi_dung.ma_vai_tro ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(tai_lieu.so_luong_truy_cap) FROM tai_lieu JOIN cac_muc_cua_tai_lieu ON tai_lieu.ma_tai_lieu = cac_muc_cua_tai_lieu.ma_tai_lieu WHERE cac_muc_cua_tai_lieu.tieu_de_muc = 'Lời cảm ơn'
SELECT AVG(tai_lieu.so_luong_truy_cap) FROM tai_lieu JOIN cac_muc_cua_tai_lieu ON tai_lieu.ma_tai_lieu = cac_muc_cua_tai_lieu.ma_tai_lieu WHERE cac_muc_cua_tai_lieu.tieu_de_muc = 'Lời cảm ơn'
SELECT ten_tai_lieu FROM tai_lieu WHERE ma_tai_lieu NOT IN (SELECT ma_tai_lieu FROM hinh_anh_trong_cac_muc_cua_tai_lieu)
SELECT ten_tai_lieu FROM tai_lieu WHERE ma_tai_lieu NOT IN (SELECT DISTINCT cac_muc_cua_tai_lieu.ma_tai_lieu FROM hinh_anh_trong_cac_muc_cua_tai_lieu JOIN cac_muc_cua_tai_lieu ON hinh_anh_trong_cac_muc_cua_tai_lieu.id_muc = cac_muc_cua_tai_lieu.id_muc)
SELECT T1.ten_tai_lieu FROM tai_lieu AS T1 JOIN cac_muc_cua_tai_lieu AS T2 ON T1.ma_tai_lieu = T2.ma_tai_lieu GROUP BY T1.ma_tai_lieu ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_tai_lieu FROM tai_lieu AS T1 JOIN cac_muc_cua_tai_lieu AS T2 ON T1.ma_tai_lieu = T2.ma_tai_lieu GROUP BY T1.ma_tai_lieu ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_tai_lieu FROM tai_lieu WHERE ten_tai_lieu LIKE '%CV%'
SELECT ten_tai_lieu FROM tai_lieu WHERE ten_tai_lieu LIKE '%CV%'
SELECT COUNT(*) FROM nguoi_dung WHERE lan_dang_nhap_cua_nguoi_dung > '0'
SELECT COUNT(*) FROM nguoi_dung WHERE lan_dang_nhap_cua_nguoi_dung > 0
SELECT vai_tro.mo_ta_ve_vai_tro FROM nguoi_dung JOIN vai_tro ON nguoi_dung.ma_vai_tro = vai_tro.ma_vai_tro WHERE nguoi_dung.lan_dang_nhap_cua_nguoi_dung > 0 GROUP BY vai_tro.mo_ta_ve_vai_tro ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.mo_ta_ve_vai_tro FROM vai_tro AS T1 JOIN nguoi_dung AS T2 ON T1.ma_vai_tro = T2.ma_vai_tro WHERE T2.lan_dang_nhap_cua_nguoi_dung > 0 GROUP BY T1.ma_vai_tro ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(tai_lieu.so_luong_truy_cap) FROM tai_lieu JOIN cau_truc_tai_lieu ON tai_lieu.ma_cau_truc_tai_lieu = cau_truc_tai_lieu.ma_cau_truc_tai_lieu WHERE cau_truc_tai_lieu.ma_cau_truc_tai_lieu IN (SELECT ma_cau_truc_tai_lieu FROM tai_lieu GROUP BY ma_cau_truc_tai_lieu ORDER BY SUM(so_luong_truy_cap) ASC LIMIT 1)
SELECT AVG(tai_lieu.so_luong_truy_cap) FROM tai_lieu JOIN cau_truc_tai_lieu ON tai_lieu.ma_cau_truc_tai_lieu = cau_truc_tai_lieu.ma_cau_truc_tai_lieu WHERE tai_lieu.ma_cau_truc_tai_lieu IN (SELECT ma_cau_truc_tai_lieu FROM tai_lieu GROUP BY ma_cau_truc_tai_lieu ORDER BY COUNT(*) ASC LIMIT 1)
SELECT ten_hinh_anh, duong_dan_cua_hinh_anh FROM hinh_anh ORDER BY ten_hinh_anh ASC
SELECT ten_hinh_anh, duong_dan_cua_hinh_anh FROM hinh_anh ORDER BY ten_hinh_anh ASC
SELECT vai_tro.ma_vai_tro , COUNT(*) FROM vai_tro JOIN nguoi_dung ON vai_tro.ma_vai_tro = nguoi_dung.ma_vai_tro GROUP BY vai_tro.ma_vai_tro
SELECT T1.ma_vai_tro , COUNT ( * ) FROM vai_tro AS T1 JOIN nguoi_dung AS T2 ON T1.ma_vai_tro = T2.ma_vai_tro GROUP BY T1.ma_vai_tro
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING COUNT(*) > 2
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING COUNT(*) >= 2
SELECT COUNT(*) FROM khoa_hoc
SELECT COUNT(*) FROM khoa_hoc
SELECT mo_ta_ve_khoa_hoc FROM khoa_hoc WHERE ten_khoa_hoc = ' cơ sở dữ liệu '
SELECT mo_ta_ve_khoa_hoc FROM khoa_hoc WHERE ten_khoa_hoc = 'cơ sở dữ liệu'
SELECT T2.dong_1_cua_dia_chi FROM khoa_hoc AS T1 JOIN tac_gia_khoa_hoc_va_nguoi_huong_dan AS T2 ON T1.id_tac_gia = T2.id_tac_gia WHERE T1.ten_khoa_hoc = 'Cathrine'
SELECT dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan WHERE ten_ca_nhan = 'Cathrine'
SELECT dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT ten_dang_nhap, ho FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT ten_dang_nhap, ho FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_ngay_dang_ky, luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien
SELECT ngay_ngay_dang_ky, ngay_hoan_thanh FROM luot_dang_ky_khoa_hoc_cua_sinh_vien
SELECT COUNT(DISTINCT luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien) FROM luot_dang_ky_khoa_hoc_cua_sinh_vien
SELECT COUNT(DISTINCT sinh_vien.id_sinh_vien) FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien
SELECT COUNT(DISTINCT id_khoa_hoc) FROM luot_dang_ky_khoa_hoc_cua_sinh_vien
SELECT COUNT(DISTINCT khoa_hoc.id_khoa_hoc) FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc
SELECT ngay_lam_bai_kiem_tra FROM bai_kiem_tra_cua_sinh_vien WHERE ket_qua_kiem_tra = 'Đạt'
SELECT ngay_lam_bai_kiem_tra FROM bai_kiem_tra_cua_sinh_vien WHERE ket_qua_kiem_tra = 'Đạt'
SELECT COUNT(*) FROM bai_kiem_tra_cua_sinh_vien WHERE ket_qua_kiem_tra = ' Trượt '
SELECT COUNT(*) FROM bai_kiem_tra_cua_sinh_vien WHERE ket_qua_kiem_tra = 'Trượt'
SELECT ten_dang_nhap FROM sinh_vien WHERE ho = 'Ward'
SELECT ten_dang_nhap FROM sinh_vien WHERE ho = 'Ward'
SELECT ten_dang_nhap, ngay_dang_nhap_moi_nhat FROM sinh_vien WHERE ho = 'Jaskolski' OR ho = 'Langosh'
SELECT ngay_dang_nhap_moi_nhat FROM sinh_vien WHERE ho = 'Jaskolski' OR ho = 'Langosh' ORDER BY ngay_dang_nhap_moi_nhat DESC LIMIT 1
SELECT COUNT(*) FROM sinh_vien WHERE ten_ca_nhan LIKE '%son%'
SELECT COUNT(*) FROM sinh_vien WHERE ten_ca_nhan LIKE '%son%'
SELECT ten_mon_hoc FROM mon_hoc
SELECT ten_mon_hoc FROM mon_hoc
SELECT id_tac_gia, atb_cua_tac_gia_/_nguoi_huong_dan, ten_dang_nhap, mat_khau, ten_ca_nhan, ten_dem, ho, gioi_tinh, dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan ORDER BY ten_ca_nhan ASC
SELECT ten_ca_nhan FROM tac_gia_khoa_hoc_va_nguoi_huong_dan ORDER BY ten_ca_nhan ASC
SELECT ten_ca_nhan , ho FROM sinh_vien ORDER BY ho ASC
SELECT ho , ten_ca_nhan FROM sinh_vien ORDER BY ho ASC
SELECT ket_qua_kiem_tra, COUNT(*) FROM bai_kiem_tra_cua_sinh_vien GROUP BY ket_qua_kiem_tra ORDER BY COUNT(*) DESC
SELECT ket_qua_kiem_tra, COUNT(DISTINCT luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien) FROM bai_kiem_tra_cua_sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON bai_kiem_tra_cua_sinh_vien.id_dang_ky = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_dang_ky GROUP BY ket_qua_kiem_tra ORDER BY COUNT(DISTINCT luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien) DESC
SELECT T2.ten_dang_nhap FROM khoa_hoc AS T1 JOIN tac_gia_khoa_hoc_va_nguoi_huong_dan AS T2 ON T1.id_tac_gia = T2.id_tac_gia WHERE T1.ten_khoa_hoc = ' cơ sở dữ liệu nâng cao '
SELECT T2.ten_dang_nhap FROM khoa_hoc AS T1 JOIN tac_gia_khoa_hoc_va_nguoi_huong_dan AS T2 ON T1.id_tac_gia = T2.id_tac_gia WHERE T1.ten_khoa_hoc = 'cơ sở dữ liệu nâng cao'
SELECT tac_gia_khoa_hoc_va_nguoi_huong_dan.dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan JOIN khoa_hoc ON tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia = khoa_hoc.id_tac_gia WHERE khoa_hoc.ten_khoa_hoc = 'hệ điều hành' OR khoa_hoc.ten_khoa_hoc = 'cấu trúc dữ liệu'
SELECT dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan JOIN khoa_hoc ON tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia = khoa_hoc.id_tac_gia JOIN mon_hoc ON khoa_hoc.id_mon_hoc = mon_hoc.id_mon_hoc WHERE mon_hoc.ten_mon_hoc IN ('Operating System', 'Data Structures')
SELECT T1.id_tac_gia , T1.ten_ca_nhan , T1.ho FROM dbo.tac_gia_khoa_hoc_va_nguoi_huong_dan AS T1 JOIN dbo.khoa_hoc AS T2 ON T1.id_tac_gia = T2.id_tac_gia GROUP BY T1.id_tac_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_ca_nhan, ho, id_tac_gia FROM tac_gia_khoa_hoc_va_nguoi_huong_dan JOIN khoa_hoc ON tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia = khoa_hoc.id_tac_gia GROUP BY tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_tac_gia , T1.dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan AS T1 JOIN khoa_hoc AS T2 ON T1.id_tac_gia = T2.id_tac_gia GROUP BY T1.id_tac_gia HAVING COUNT(*) >= 2
SELECT T1.id_tac_gia , T1.dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan AS T1 JOIN khoa_hoc AS T2 ON T1.id_tac_gia = T2.id_tac_gia GROUP BY T1.id_tac_gia HAVING COUNT(*) > 2
SELECT ten_khoa_hoc FROM khoa_hoc JOIN tac_gia_khoa_hoc_va_nguoi_huong_dan ON khoa_hoc.id_tac_gia = tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia WHERE tac_gia_khoa_hoc_va_nguoi_huong_dan.ten_ca_nhan = 'Julio'
SELECT ten_khoa_hoc FROM khoa_hoc JOIN tac_gia_khoa_hoc_va_nguoi_huong_dan ON khoa_hoc.id_tac_gia = tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia WHERE tac_gia_khoa_hoc_va_nguoi_huong_dan.ten_ca_nhan = 'Julio'
SELECT ten_khoa_hoc, mo_ta_ve_khoa_hoc FROM khoa_hoc JOIN mon_hoc ON khoa_hoc.id_mon_hoc = mon_hoc.id_mon_hoc WHERE mon_hoc.ten_mon_hoc = 'Khoa học máy tính'
SELECT ten_khoa_hoc, mo_ta_ve_khoa_hoc FROM khoa_hoc JOIN mon_hoc ON khoa_hoc.id_mon_hoc = mon_hoc.id_mon_hoc WHERE mon_hoc.ten_mon_hoc = 'Khoa học máy tính'
SELECT mon_hoc.id_mon_hoc, mon_hoc.ten_mon_hoc, COUNT(*) FROM mon_hoc JOIN khoa_hoc ON mon_hoc.id_mon_hoc = khoa_hoc.id_mon_hoc GROUP BY mon_hoc.id_mon_hoc, mon_hoc.ten_mon_hoc
SELECT mon_hoc.id_mon_hoc , mon_hoc.ten_mon_hoc , COUNT(*) FROM mon_hoc JOIN khoa_hoc ON mon_hoc.id_mon_hoc = khoa_hoc.id_mon_hoc GROUP BY mon_hoc.id_mon_hoc , mon_hoc.ten_mon_hoc
SELECT mon_hoc.id_mon_hoc, mon_hoc.ten_mon_hoc, COUNT(*) FROM mon_hoc JOIN khoa_hoc ON mon_hoc.id_mon_hoc = khoa_hoc.id_mon_hoc GROUP BY mon_hoc.id_mon_hoc ORDER BY COUNT(*) ASC
SELECT mon_hoc.id_mon_hoc, mon_hoc.ten_mon_hoc, COUNT(*) FROM mon_hoc JOIN khoa_hoc ON mon_hoc.id_mon_hoc = khoa_hoc.id_mon_hoc GROUP BY mon_hoc.id_mon_hoc ORDER BY COUNT(*) ASC
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_ngay_dang_ky FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'tiếng Tây Ban Nha'
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_ngay_dang_ky FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'tiếng Tây Ban Nha'
SELECT khoa_hoc.ten_khoa_hoc FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khoa_hoc FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_khoa_hoc FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc GROUP BY T1.id_khoa_hoc HAVING COUNT(*) = 1
SELECT T1.ten_khoa_hoc FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc GROUP BY T1.id_khoa_hoc HAVING COUNT(*) = 1
SELECT T1.ten_khoa_hoc, T1.mo_ta_ve_khoa_hoc FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc GROUP BY T1.id_khoa_hoc HAVING COUNT(*) > 2
SELECT khoa_hoc.ten_khoa_hoc, khoa_hoc.mo_ta_ve_khoa_hoc FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc HAVING COUNT(*) > 2
SELECT T1.ten_khoa_hoc , COUNT ( * ) FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc GROUP BY T1.ten_khoa_hoc
SELECT T1.ten_khoa_hoc , COUNT ( * ) FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc GROUP BY T1.id_khoa_hoc
SELECT ngay_lam_bai_kiem_tra FROM bai_kiem_tra_cua_sinh_vien WHERE ket_qua_kiem_tra = 'Đạt'
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_ngay_dang_ky FROM bai_kiem_tra_cua_sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON bai_kiem_tra_cua_sinh_vien.id_dang_ky = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_dang_ky WHERE bai_kiem_tra_cua_sinh_vien.ket_qua_kiem_tra = 'Đạt'
SELECT T2.ngay_hoan_thanh FROM bai_kiem_tra_cua_sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_dang_ky = T2.id_dang_ky WHERE T1.ket_qua_kiem_tra = 'Trượt'
SELECT T2.ngay_hoan_thanh FROM bai_kiem_tra_cua_sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_dang_ky = T2.id_dang_ky WHERE T1.ket_qua_kiem_tra = 'Trượt'
SELECT T2.ngay_dang_ky, T2.ngay_hoan_thanh FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE T1.ten_ca_nhan = 'Karson'
SELECT T2.ngay_dang_ky, T2.ngay_hoan_thanh FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE T1.ten_ca_nhan = 'Karson'
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ky, luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Zieme' AND sinh_vien.ten_ca_nhan LIKE '%Bernie%'
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ky, luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien WHERE sinh_vien.ten_ca_nhan = 'Bernie Zieme' AND sinh_vien.ho = 'Zieme'
SELECT T1.id_sinh_vien , T1.ten_dang_nhap FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_sinh_vien , T1.ten_ca_nhan FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT sinh_vien.id_sinh_vien, sinh_vien.ten_ca_nhan FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien, sinh_vien.ten_ca_nhan HAVING COUNT(*) >= 2
SELECT T1.id_sinh_vien , T1.ten_ca_nhan FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien HAVING COUNT(*) >= 2
SELECT sinh_vien.id_sinh_vien, sinh_vien.ten_dem FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien HAVING COUNT(*) <= 2
SELECT T1.id_sinh_vien , T1.ten_dem FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_ca_nhan FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien)
SELECT ten_ca_nhan FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien)
SELECT COUNT(*) FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien)
SELECT COUNT(*) FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien)
SELECT ten_dang_nhap FROM sinh_vien INTERSECT SELECT ten_dang_nhap FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT ten_dang_nhap FROM sinh_vien INTERSECT SELECT ten_dang_nhap FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT ten_ca_nhan FROM sinh_vien INTERSECT SELECT ten_ca_nhan FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT ho FROM sinh_vien INTERSECT SELECT ho FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT COUNT(*) FROM trang_trai
SELECT COUNT(*) FROM trang_trai
SELECT tong_so_ngua FROM trang_trai ORDER BY tong_so_ngua ASC
SELECT tong_so_ngua FROM trang_trai ORDER BY tong_so_ngua ASC
SELECT chu_nha FROM cuoc_thi_trang_trai WHERE chu_de != 'Người ngoài hành tinh'
SELECT chu_nha FROM cuoc_thi_trang_trai WHERE chu_de != 'Người ngoài hành tinh'
SELECT chu_de, nam FROM cuoc_thi_trang_trai ORDER BY nam ASC
SELECT chu_de FROM cuoc_thi_trang_trai ORDER BY nam ASC
SELECT AVG(ngua_lam_viec) FROM trang_trai WHERE tong_so_ngua > 5000
SELECT AVG(ngua_lam_viec) FROM trang_trai WHERE tong_so_ngua > 5000
SELECT MAX(bo) AS max_bo, MIN(bo) AS min_bo FROM trang_trai
SELECT MAX(bo) AS max_bo, MIN(bo) AS min_bo FROM trang_trai
SELECT COUNT(DISTINCT cap_bac) FROM thanh_pho
SELECT COUNT(DISTINCT cap_bac) FROM thanh_pho
SELECT ten_chinh_thuc FROM thanh_pho ORDER BY dan_so DESC
SELECT ten_chinh_thuc FROM thanh_pho ORDER BY dan_so DESC
SELECT ten_chinh_thuc, cap_bac FROM thanh_pho ORDER BY dan_so DESC LIMIT 1
SELECT ten_chinh_thuc, cap_bac FROM thanh_pho ORDER BY dan_so DESC LIMIT 1
SELECT cuoc_thi_trang_trai.nam, thanh_pho.ten_chinh_thuc FROM cuoc_thi_trang_trai JOIN thanh_pho ON cuoc_thi_trang_trai.id_thanh_pho_chu_nha = thanh_pho.id_thanh_pho
SELECT cuoc_thi_trang_trai.nam , thanh_pho.ten_chinh_thuc FROM cuoc_thi_trang_trai JOIN thanh_pho ON cuoc_thi_trang_trai.id_thanh_pho_chu_nha = thanh_pho.id_thanh_pho
SELECT ten_chinh_thuc FROM thanh_pho JOIN cuoc_thi_trang_trai ON thanh_pho.id_thanh_pho = cuoc_thi_trang_trai.id_thanh_pho_chu_nha GROUP BY thanh_pho.id_thanh_pho HAVING COUNT(*) > 1
SELECT thanh_pho.ten_chinh_thuc FROM thanh_pho JOIN cuoc_thi_trang_trai ON thanh_pho.id_thanh_pho = cuoc_thi_trang_trai.id_thanh_pho_chu_nha GROUP BY thanh_pho.id_thanh_pho HAVING COUNT(*) > 1
SELECT cap_bac FROM thanh_pho JOIN cuoc_thi_trang_trai ON thanh_pho.id_thanh_pho = cuoc_thi_trang_trai.id_thanh_pho_chu_nha GROUP BY thanh_pho.id_thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT thanh_pho.cap_bac FROM cuoc_thi_trang_trai JOIN thanh_pho ON cuoc_thi_trang_trai.id_thanh_pho_chu_nha = thanh_pho.id_thanh_pho GROUP BY thanh_pho.id_thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT cuoc_thi_trang_trai.chu_de FROM cuoc_thi_trang_trai JOIN thanh_pho ON cuoc_thi_trang_trai.id_thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE thanh_pho.dan_so > 1000
SELECT cuoc_thi_trang_trai.chu_de FROM cuoc_thi_trang_trai JOIN thanh_pho ON cuoc_thi_trang_trai.id_thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE thanh_pho.dan_so > 1000
SELECT cap_bac, AVG(dan_so) FROM thanh_pho GROUP BY cap_bac
SELECT cap_bac, AVG(dan_so) FROM thanh_pho GROUP BY cap_bac
SELECT cap_bac, COUNT(*) AS so_luong_thanh_pho FROM thanh_pho GROUP BY cap_bac ORDER BY COUNT(*) ASC
SELECT cap_bac, COUNT(*) AS tien_suat FROM thanh_pho GROUP BY cap_bac ORDER BY COUNT(*) ASC
SELECT cap_bac FROM thanh_pho GROUP BY cap_bac ORDER BY COUNT(*) DESC LIMIT 1
SELECT cap_bac FROM thanh_pho GROUP BY cap_bac ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_chinh_thuc FROM thanh_pho WHERE id_thanh_pho NOT IN (SELECT id_thanh_pho_chu_nha FROM cuoc_thi_trang_trai)
SELECT ten_chinh_thuc FROM thanh_pho WHERE id_thanh_pho NOT IN (SELECT id_thanh_pho_chu_nha FROM cuoc_thi_trang_trai)
SELECT cap_bac FROM thanh_pho WHERE dan_so > 500 AND dan_so < 1500
SELECT cap_bac FROM thanh_pho WHERE dan_so > 1500 INTERSECT SELECT cap_bac FROM thanh_pho WHERE dan_so < 500
SELECT ten_chinh_thuc FROM thanh_pho WHERE dan_so > 1500 OR dan_so < 500
SELECT ten_chinh_thuc FROM thanh_pho WHERE dan_so > 1500 OR dan_so < 500
SELECT xep_hang_dieu_tra_dan_so FROM thanh_pho WHERE cap_bac != 'Làng'
SELECT xep_hang_dieu_tra_dan_so FROM thanh_pho WHERE cap_bac != 'Làng'
SELECT COUNT(*) FROM chuyen_bay WHERE van_toc > 200
SELECT so_hieu , ngay , phi_cong FROM chuyen_bay ORDER BY do_cao ASC
SELECT id, quoc_gia, thanh_pho, ten FROM san_bay ORDER BY ten ASC
SELECT MAX(co_phan_nhom) FROM cong_ty_dieu_hanh
SELECT AVG(van_toc) FROM chuyen_bay WHERE phi_cong = 'Thompson'
SELECT DISTINCT cong_ty_dieu_hanh.ten, cong_ty_dieu_hanh.loai FROM chuyen_bay JOIN cong_ty_dieu_hanh ON chuyen_bay.id_cong_ty = cong_ty_dieu_hanh.id
SELECT ten FROM san_bay WHERE quoc_gia != 'Iceland'
SELECT DISTINCT cong_ty_dieu_hanh.loai FROM cong_ty_dieu_hanh JOIN chuyen_bay ON cong_ty_dieu_hanh.id = chuyen_bay.id_cong_ty WHERE chuyen_bay.van_toc < 200
SELECT T1.id, T1.ten FROM cong_ty_dieu_hanh AS T1 JOIN chuyen_bay AS T2 ON T1.id = T2.id_cong_ty GROUP BY T1.id HAVING COUNT(*) > 1
SELECT T1.id, T1.ten, T1.iata FROM san_bay AS T1 JOIN chuyen_bay AS T2 ON T1.id = T2.id_san_bay GROUP BY T1.id, T1.ten, T1.iata ORDER BY COUNT(*) DESC LIMIT 1
SELECT phi_cong FROM chuyen_bay JOIN san_bay ON chuyen_bay.id_san_bay = san_bay.id WHERE san_bay.quoc_gia = 'Hoa Kỳ' OR san_bay.ten = 'Sân bay Billund'
SELECT loai, COUNT(*) FROM cong_ty_dieu_hanh GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM san_bay WHERE id NOT IN (SELECT DISTINCT id_san_bay FROM chuyen_bay WHERE phi_cong = 'Thompson')
SELECT phi_cong FROM chuyen_bay JOIN cong_ty_dieu_hanh ON chuyen_bay.id_cong_ty = cong_ty_dieu_hanh.id WHERE cong_ty_dieu_hanh.hoat_dong_chinh = 'Vận chuyển hàng hoá' INTERSECT SELECT phi_cong FROM chuyen_bay JOIN cong_ty_dieu_hanh ON chuyen_bay.id_cong_ty = cong_ty_dieu_hanh.id WHERE cong_ty_dieu_hanh.hoat_dong_chinh = 'Dịch vụ ăn uống'
SELECT ten FROM san_bay WHERE ten LIKE '%International%'
SELECT san_bay.id, COUNT(*) FROM san_bay JOIN chuyen_bay ON san_bay.id = chuyen_bay.id_san_bay JOIN cong_ty_dieu_hanh ON chuyen_bay.id_cong_ty = cong_ty_dieu_hanh.id WHERE cong_ty_dieu_hanh.loai = 'hãng hàng không' GROUP BY san_bay.id
SELECT quoc_gia, COUNT(*) FROM san_bay GROUP BY quoc_gia
SELECT quoc_gia FROM san_bay GROUP BY quoc_gia HAVING COUNT(*) > 2
SELECT phi_cong FROM chuyen_bay GROUP BY phi_cong ORDER BY COUNT(*) DESC LIMIT 1
SELECT SUM(so_luong_bo_phan) FROM do_noi_that
SELECT id_do_noi_that , ten FROM do_noi_that ORDER BY lai_suat_thi_truong DESC LIMIT 1
SELECT SUM(lai_suat_thi_truong) FROM do_noi_that ORDER BY lai_suat_thi_truong DESC LIMIT 2
SELECT ten, so_luong_bo_phan FROM do_noi_that WHERE so_luong_bo_phan > 10
SELECT ten, so_luong_bo_phan FROM do_noi_that ORDER BY lai_suat_thi_truong ASC LIMIT 1
SELECT do_noi_that.ten FROM do_noi_that JOIN xuong_san_xuat_do_noi_that ON do_noi_that.id_do_noi_that = xuong_san_xuat_do_noi_that.id_do_noi_that WHERE xuong_san_xuat_do_noi_that.gia_tinh_theo_do_la < (SELECT MAX(gia_tinh_theo_do_la) FROM xuong_san_xuat_do_noi_that)
SELECT ten , nam_mo_cua FROM nha_san_xuat ORDER BY so_luong_cua_hang DESC LIMIT 1
SELECT AVG(so_luong_nha_may) FROM nha_san_xuat WHERE so_luong_cua_hang > 20
SELECT id_nha_san_xuat, ten FROM nha_san_xuat ORDER BY nam_mo_cua ASC
SELECT ten, nam_mo_cua FROM nha_san_xuat WHERE so_luong_nha_may < 10 OR so_luong_cua_hang > 10
SELECT MAX(so_luong_cua_hang), AVG(so_luong_nha_may) FROM nha_san_xuat WHERE nam_mo_cua < 1990
SELECT T1.id_nha_san_xuat , T1.so_luong_cua_hang FROM nha_san_xuat AS T1 JOIN xuong_san_xuat_do_noi_that AS T2 ON T1.id_nha_san_xuat = T2.id_nha_san_xuat ORDER BY T2.gia_tinh_theo_do_la DESC LIMIT 1
SELECT T1.ten , COUNT(*) FROM nha_san_xuat AS T1 JOIN xuong_san_xuat_do_noi_that AS T2 ON T1.id_nha_san_xuat = T2.id_nha_san_xuat GROUP BY T1.id_nha_san_xuat
SELECT do_noi_that.ten, xuong_san_xuat_do_noi_that.gia_tinh_theo_do_la FROM do_noi_that JOIN xuong_san_xuat_do_noi_that ON do_noi_that.id_do_noi_that = xuong_san_xuat_do_noi_that.id_do_noi_that
SELECT ten, lai_suat_thi_truong FROM do_noi_that WHERE id_do_noi_that NOT IN (SELECT id_do_noi_that FROM xuong_san_xuat_do_noi_that)
SELECT T1.ten FROM nha_san_xuat T1 JOIN xuong_san_xuat_do_noi_that T2 ON T1.id_nha_san_xuat = T2.id_nha_san_xuat JOIN do_noi_that T3 ON T2.id_do_noi_that = T3.id_do_noi_that WHERE T3.so_luong_bo_phan < 6 INTERSECT SELECT T1.ten FROM nha_san_xuat T1 JOIN xuong_san_xuat_do_noi_that T2 ON T1.id_nha_san_xuat = T2.id_nha_san_xuat JOIN do_noi_that T3 ON T2.id_do_noi_that = T3.id_do_noi_that WHERE T3.so_luong_bo_phan > 10
SELECT COUNT(*) FROM khach_tham_quan WHERE tuoi < 30
SELECT ten FROM khach_tham_quan WHERE cap_do_thanh_vien > 4 ORDER BY cap_do_thanh_vien DESC
SELECT AVG(tuoi) FROM khach_tham_quan WHERE cap_do_thanh_vien <= 4
SELECT ten, cap_do_thanh_vien FROM khach_tham_quan WHERE cap_do_thanh_vien > 4 ORDER BY tuoi DESC
SELECT id_bao_tang , ten FROM bao_tang ORDER BY so_luong_nhan_vien DESC LIMIT 1
SELECT AVG(so_luong_nhan_vien) FROM bao_tang WHERE nam_mo_cua < '2009'
SELECT nam_mo_cua, so_luong_nhan_vien FROM bao_tang WHERE ten = 'Bảo tàng Plaza'
SELECT ten FROM bao_tang WHERE so_luong_nhan_vien > (SELECT MIN(so_luong_nhan_vien) FROM bao_tang WHERE nam_mo_cua > '2010')
SELECT T1.id_khach_tham_quan, T1.ten, T1.tuoi FROM khach_tham_quan AS T1 JOIN chuyen_tham AS T2 ON T1.id_khach_tham_quan = CAST(T2.id_khach_tham_quan AS NUMBER) GROUP BY T1.id_khach_tham_quan HAVING COUNT(*) > 1
SELECT T1.id_khach_tham_quan , T1.ten , T1.cap_do_thanh_vien FROM khach_tham_quan AS T1 JOIN chuyen_tham AS T2 ON T1.id_khach_tham_quan = T2.id_khach_tham_quan ORDER BY T2.tong_so_tien_da_chi DESC LIMIT 1
SELECT bao_tang.id_bao_tang , bao_tang.ten FROM bao_tang JOIN chuyen_tham ON bao_tang.id_bao_tang = chuyen_tham.id_bao_tang GROUP BY bao_tang.id_bao_tang ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM bao_tang WHERE id_bao_tang NOT IN (SELECT id_bao_tang FROM chuyen_tham)
SELECT T1.ten , T1.tuoi FROM khach_tham_quan AS T1 JOIN chuyen_tham AS T2 ON T1.id_khach_tham_quan = T2.id_khach_tham_quan GROUP BY T1.id_khach_tham_quan ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(so_luong_ve), MAX(so_luong_ve) FROM chuyen_tham
SELECT SUM(chuyen_tham.tong_so_tien_da_chi) FROM khach_tham_quan JOIN chuyen_tham ON khach_tham_quan.id_khach_tham_quan = chuyen_tham.id_khach_tham_quan WHERE khach_tham_quan.cap_do_thanh_vien = 1
SELECT ten FROM khach_tham_quan JOIN chuyen_tham ON khach_tham_quan.id_khach_tham_quan = chuyen_tham.id_khach_tham_quan JOIN bao_tang ON chuyen_tham.id_bao_tang = bao_tang.id_bao_tang GROUP BY khach_tham_quan.id_khach_tham_quan HAVING COUNT(CASE WHEN bao_tang.nam_mo_cua < '2009' THEN 1 END) >= 1 AND COUNT(CASE WHEN bao_tang.nam_mo_cua > '2011' THEN 1 END) >= 1
SELECT COUNT(*) FROM khach_tham_quan WHERE id_khach_tham_quan NOT IN (SELECT DISTINCT chuyen_tham.id_khach_tham_quan FROM chuyen_tham JOIN bao_tang ON chuyen_tham.id_bao_tang = bao_tang.id_bao_tang WHERE bao_tang.nam_mo_cua > '2010')
SELECT COUNT(*) FROM bao_tang WHERE nam_mo_cua > '2013' OR nam_mo_cua < '2008'
SELECT COUNT(*) FROM hoc_sinh_trung_hoc
SELECT COUNT(*) FROM hoc_sinh_trung_hoc
SELECT ten, khoi_lop FROM hoc_sinh_trung_hoc
SELECT ten, khoi_lop FROM hoc_sinh_trung_hoc
SELECT khoi_lop FROM hoc_sinh_trung_hoc
SELECT khoi_lop FROM hoc_sinh_trung_hoc
SELECT khoi_lop FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle'
SELECT khoi_lop FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle'
SELECT ten FROM hoc_sinh_trung_hoc WHERE khoi_lop = 10
SELECT ten FROM hoc_sinh_trung_hoc WHERE khoi_lop = 10
SELECT id FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle'
SELECT id FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle'
SELECT COUNT(*) FROM hoc_sinh_trung_hoc WHERE khoi_lop = 9 OR khoi_lop = 10
SELECT COUNT(*) FROM hoc_sinh_trung_hoc WHERE khoi_lop = 9 OR khoi_lop = 10
SELECT khoi_lop, COUNT(*) FROM hoc_sinh_trung_hoc GROUP BY khoi_lop
SELECT khoi_lop, COUNT(*) FROM hoc_sinh_trung_hoc GROUP BY khoi_lop
SELECT khoi_lop FROM hoc_sinh_trung_hoc GROUP BY khoi_lop ORDER BY COUNT(*) DESC LIMIT 1
SELECT khoi_lop FROM hoc_sinh_trung_hoc GROUP BY khoi_lop ORDER BY COUNT(*) DESC LIMIT 1
SELECT khoi_lop, COUNT(*) FROM hoc_sinh_trung_hoc GROUP BY khoi_lop HAVING COUNT(*) >= 4
SELECT khoi_lop FROM hoc_sinh_trung_hoc GROUP BY khoi_lop HAVING COUNT(*) >= 4
SELECT hoc_sinh_trung_hoc.id, COUNT(*) FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id
SELECT hoc_sinh_trung_hoc.id, COUNT(*) FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id
SELECT hoc_sinh_trung_hoc.ten , COUNT(*) FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id
SELECT hoc_sinh_trung_hoc.ten, COUNT(*) FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id
SELECT hoc_sinh_trung_hoc.ten FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT hoc_sinh_trung_hoc.ten FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT hoc_sinh_trung_hoc.ten FROM hoc_sinh_trung_hoc JOIN (SELECT id_hoc_sinh AS id FROM ban_be UNION SELECT id_ban_be AS id FROM ban_be) AS friends ON hoc_sinh_trung_hoc.id = friends.id GROUP BY hoc_sinh_trung_hoc.id HAVING COUNT(*) >= 3
SELECT ten FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id HAVING COUNT(*) >= 3
SELECT hoc_sinh_trung_hoc_1.ten FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh JOIN hoc_sinh_trung_hoc AS hoc_sinh_trung_hoc_1 ON ban_be.id_ban_be = hoc_sinh_trung_hoc_1.id WHERE hoc_sinh_trung_hoc.ten = 'Kyle'
SELECT hoc_sinh_trung_hoc.ten FROM ban_be JOIN hoc_sinh_trung_hoc ON ban_be.id_ban_be = hoc_sinh_trung_hoc.id WHERE (ban_be.id_hoc_sinh = (SELECT id FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle') OR ban_be.id_ban_be = (SELECT id FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle'))
SELECT COUNT(*) FROM ban_be WHERE id_hoc_sinh = (SELECT id FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle')
SELECT COUNT(*) FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh WHERE hoc_sinh_trung_hoc.ten = 'Kyle'
SELECT id FROM hoc_sinh_trung_hoc WHERE id NOT IN (SELECT id_hoc_sinh FROM ban_be)
SELECT id FROM hoc_sinh_trung_hoc WHERE id NOT IN (SELECT id_hoc_sinh FROM ban_be)
SELECT ten FROM hoc_sinh_trung_hoc WHERE id NOT IN (SELECT id_hoc_sinh FROM ban_be UNION SELECT id_ban_be FROM ban_be)
SELECT ten FROM hoc_sinh_trung_hoc WHERE id NOT IN (SELECT id_hoc_sinh FROM ban_be)
SELECT id FROM hoc_sinh_trung_hoc WHERE id IN (SELECT id_hoc_sinh FROM ban_be) INTERSECT SELECT id FROM hoc_sinh_trung_hoc WHERE id IN (SELECT id_hoc_sinh FROM luot_thich)
SELECT id FROM hoc_sinh_trung_hoc WHERE id IN (SELECT id_hoc_sinh FROM ban_be UNION SELECT id_ban_be FROM ban_be) AND id IN (SELECT id_hoc_sinh FROM luot_thich)
SELECT ten FROM hoc_sinh_trung_hoc WHERE id IN (SELECT id_hoc_sinh FROM ban_be) AND id IN (SELECT id_hoc_sinh FROM luot_thich)
SELECT hoc_sinh_trung_hoc.ten FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh INTERSECT SELECT hoc_sinh_trung_hoc.ten FROM hoc_sinh_trung_hoc JOIN luot_thich ON hoc_sinh_trung_hoc.id = luot_thich.id_hoc_sinh
SELECT T1.id, COUNT(*) FROM hoc_sinh_trung_hoc AS T1 JOIN luot_thich AS T2 ON T1.id = T2.id_hoc_sinh GROUP BY T1.id
SELECT hoc_sinh_trung_hoc.id , COUNT ( * ) FROM hoc_sinh_trung_hoc JOIN luot_thich ON hoc_sinh_trung_hoc.id = luot_thich.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id
SELECT hoc_sinh_trung_hoc.ten, COUNT(*) FROM hoc_sinh_trung_hoc JOIN luot_thich ON hoc_sinh_trung_hoc.id = luot_thich.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id
SELECT hoc_sinh_trung_hoc.ten , COUNT(*) FROM hoc_sinh_trung_hoc JOIN luot_thich ON hoc_sinh_trung_hoc.id = luot_thich.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id HAVING COUNT(*) > 0
SELECT ten FROM hoc_sinh_trung_hoc JOIN luot_thich ON hoc_sinh_trung_hoc.id = luot_thich.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM hoc_sinh_trung_hoc JOIN luot_thich ON hoc_sinh_trung_hoc.id = luot_thich.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM hoc_sinh_trung_hoc JOIN luot_thich ON hoc_sinh_trung_hoc.id = luot_thich.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id HAVING COUNT(*) >= 2
SELECT hoc_sinh_trung_hoc.ten FROM hoc_sinh_trung_hoc JOIN luot_thich ON hoc_sinh_trung_hoc.id = luot_thich.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id HAVING COUNT(*) >= 2
SELECT ten FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh OR hoc_sinh_trung_hoc.id = ban_be.id_ban_be WHERE khoi_lop > 5 GROUP BY hoc_sinh_trung_hoc.id HAVING COUNT(*) >= 2
SELECT ten FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh WHERE hoc_sinh_trung_hoc.khoi_lop >= 5 GROUP BY hoc_sinh_trung_hoc.id HAVING COUNT(*) >= 2
SELECT COUNT(*) FROM hoc_sinh_trung_hoc JOIN luot_thich ON hoc_sinh_trung_hoc.id = luot_thich.id_hoc_sinh WHERE hoc_sinh_trung_hoc.ten = 'Kyle'
SELECT COUNT(*) FROM hoc_sinh_trung_hoc JOIN luot_thich ON hoc_sinh_trung_hoc.id = luot_thich.id_hoc_sinh WHERE hoc_sinh_trung_hoc.ten = 'Kyle' GROUP BY hoc_sinh_trung_hoc.id
SELECT AVG(hoc_sinh_trung_hoc.khoi_lop) FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh
SELECT AVG(khoi_lop) FROM hoc_sinh_trung_hoc WHERE id IN (SELECT id_hoc_sinh FROM ban_be UNION SELECT id_ban_be FROM ban_be)
SELECT MIN(khoi_lop) FROM hoc_sinh_trung_hoc WHERE id NOT IN (SELECT id_hoc_sinh FROM ban_be UNION SELECT id_ban_be FROM ban_be)
SELECT MIN(khoi_lop) FROM hoc_sinh_trung_hoc WHERE id NOT IN (SELECT id_hoc_sinh FROM ban_be)
SELECT COUNT(*) FROM bua_tiec
SELECT COUNT(*) FROM bua_tiec
SELECT bua_tiec.chu_de_bua_tiec FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec GROUP BY bua_tiec.id_bua_tiec, bua_tiec.chu_de_bua_tiec ORDER BY COUNT(*) ASC
SELECT bua_tiec.chu_de_bua_tiec, COUNT(chu_tiec.id_bua_tiec) FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec GROUP BY bua_tiec.id_bua_tiec ORDER BY COUNT(chu_tiec.id_bua_tiec) ASC
SELECT chu_de_bua_tiec, dia_diem FROM bua_tiec
SELECT chu_de_bua_tiec, dia_diem FROM bua_tiec
SELECT nam_dau_tien, nam_cuoi_cung FROM bua_tiec WHERE chu_de_bua_tiec = 'Mùa xuân' OR chu_de_bua_tiec = 'Teqnology'
SELECT nam_dau_tien, nam_cuoi_cung FROM bua_tiec WHERE chu_de_bua_tiec IN ('Mùa Xuân', 'Technology')
SELECT AVG(num_organizers) FROM (SELECT COUNT(*) AS num_organizers FROM chu_tiec JOIN bua_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec GROUP BY bua_tiec.id_bua_tiec) AS subquery
SELECT AVG(organizer_count) FROM (SELECT COUNT(*) AS organizer_count FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec GROUP BY bua_tiec.id_bua_tiec) AS subquery
SELECT dia_diem FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec GROUP BY bua_tiec.id_bua_tiec ORDER BY COUNT(*) DESC LIMIT 1
SELECT dia_diem FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec GROUP BY bua_tiec.id_bua_tiec ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_tich, COUNT(*) FROM nguoi_to_chuc GROUP BY quoc_tich
SELECT quoc_tich , COUNT ( * ) FROM nguoi_to_chuc GROUP BY quoc_tich
SELECT quoc_tich FROM nguoi_to_chuc GROUP BY quoc_tich ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_tich FROM nguoi_to_chuc GROUP BY quoc_tich ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_tich FROM nguoi_to_chuc WHERE CAST(tuoi AS INTEGER) > 45 GROUP BY quoc_tich HAVING COUNT(*) >= 1 INTERSECT SELECT quoc_tich FROM nguoi_to_chuc WHERE CAST(tuoi AS INTEGER) < 35 GROUP BY quoc_tich HAVING COUNT(*) >= 1
SELECT quoc_tich FROM nguoi_to_chuc WHERE tuoi > 45 GROUP BY quoc_tich HAVING COUNT(*) > 0 INTERSECT SELECT quoc_tich FROM nguoi_to_chuc WHERE tuoi < 35 GROUP BY quoc_tich HAVING COUNT(*) > 0
SELECT bua_tiec.chu_de_bua_tiec, nguoi_to_chuc.ten FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec JOIN nguoi_to_chuc ON chu_tiec.id_nguoi_to_chuc = nguoi_to_chuc.id_nguoi_to_chuc
SELECT bua_tiec.chu_de_bua_tiec, nguoi_to_chuc.ten FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec JOIN nguoi_to_chuc ON chu_tiec.id_nguoi_to_chuc = nguoi_to_chuc.id_nguoi_to_chuc
SELECT bua_tiec.dia_diem, nguoi_to_chuc.ten FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec JOIN nguoi_to_chuc ON chu_tiec.id_nguoi_to_chuc = nguoi_to_chuc.id_nguoi_to_chuc ORDER BY nguoi_to_chuc.tuoi ASC
SELECT bua_tiec.dia_diem, nguoi_to_chuc.ten FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec JOIN nguoi_to_chuc ON chu_tiec.id_nguoi_to_chuc = nguoi_to_chuc.id_nguoi_to_chuc ORDER BY nguoi_to_chuc.tuoi ASC
SELECT DISTINCT bua_tiec.dia_diem FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec JOIN nguoi_to_chuc ON chu_tiec.id_nguoi_to_chuc = nguoi_to_chuc.id_nguoi_to_chuc WHERE nguoi_to_chuc.tuoi > '50'
SELECT bua_tiec.dia_diem FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec JOIN nguoi_to_chuc ON chu_tiec.id_nguoi_to_chuc = nguoi_to_chuc.id_nguoi_to_chuc WHERE nguoi_to_chuc.tuoi > 50
SELECT ten FROM nguoi_to_chuc JOIN chu_tiec ON nguoi_to_chuc.id_nguoi_to_chuc = chu_tiec.id_nguoi_to_chuc JOIN bua_tiec ON chu_tiec.id_bua_tiec = bua_tiec.id_bua_tiec WHERE bua_tiec.so_luong_nguoi_to_chuc > 20
SELECT nguoi_to_chuc.ten FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec JOIN nguoi_to_chuc ON chu_tiec.id_nguoi_to_chuc = nguoi_to_chuc.id_nguoi_to_chuc WHERE bua_tiec.so_luong_nguoi_to_chuc > 20
SELECT ten, quoc_tich FROM nguoi_to_chuc ORDER BY tuoi DESC LIMIT 1
SELECT ten, quoc_tich FROM nguoi_to_chuc ORDER BY tuoi DESC LIMIT 1
SELECT ten FROM nguoi_to_chuc WHERE id_nguoi_to_chuc NOT IN (SELECT id_nguoi_to_chuc FROM chu_tiec)
SELECT ten FROM nguoi_to_chuc WHERE id_nguoi_to_chuc NOT IN (SELECT id_nguoi_to_chuc FROM chu_tiec)
SELECT COUNT(*) FROM dien_thoai
SELECT ten FROM dien_thoai ORDER BY gia_ban ASC
SELECT bo_nho_theo_g , nha_mang FROM dien_thoai
SELECT DISTINCT nha_mang FROM dien_thoai WHERE bo_nho_theo_g > 32
SELECT ten FROM dien_thoai WHERE nha_mang = 'Sprint' OR nha_mang = 'Tmobile'
SELECT nha_mang FROM dien_thoai ORDER BY gia_ban DESC LIMIT 1
SELECT nha_mang , COUNT ( * ) FROM dien_thoai GROUP BY nha_mang
SELECT nha_mang FROM dien_thoai GROUP BY nha_mang ORDER BY COUNT(*) DESC LIMIT 1
SELECT nha_mang FROM dien_thoai WHERE bo_nho_theo_g < 32 INTERSECT SELECT nha_mang FROM dien_thoai WHERE bo_nho_theo_g > 64
SELECT dien_thoai.ten , thi_truong.khu_vuc FROM dien_thoai JOIN thi_truong_dien_thoai ON CAST(thi_truong_dien_thoai.id_dien_thoai AS NUMBER) = dien_thoai.id_dien_thoai JOIN thi_truong ON thi_truong_dien_thoai.id_thi_truong = thi_truong.id_thi_truong
SELECT dien_thoai.ten , thi_truong.khu_vuc FROM dien_thoai JOIN thi_truong_dien_thoai ON dien_thoai.id_dien_thoai = thi_truong_dien_thoai.id_dien_thoai JOIN thi_truong ON thi_truong_dien_thoai.id_thi_truong = thi_truong.id_thi_truong ORDER BY thi_truong.danh_gia ASC
SELECT T1.ten FROM dien_thoai AS T1 JOIN thi_truong_dien_thoai AS T2 ON T1.id_dien_thoai = T2.id_dien_thoai JOIN thi_truong AS T3 ON T2.id_thi_truong = T3.id_thi_truong WHERE T3.so_luong_cua_hang > 50
SELECT T1.ten, SUM(T2.so_luong_co_phieu) FROM dien_thoai AS T1 JOIN thi_truong_dien_thoai AS T2 ON T1.id_dien_thoai = T2.id_dien_thoai GROUP BY T1.id_dien_thoai, T1.ten
SELECT T1.ten, SUM(T2.so_luong_co_phieu) FROM dien_thoai AS T1 JOIN thi_truong_dien_thoai AS T2 ON T1.id_dien_thoai = T2.id_dien_thoai GROUP BY T1.id_dien_thoai, T1.ten HAVING SUM(T2.so_luong_co_phieu) > 2000 ORDER BY SUM(T2.so_luong_co_phieu) DESC
SELECT ten FROM dien_thoai WHERE id_dien_thoai NOT IN (SELECT id_dien_thoai FROM thi_truong_dien_thoai)
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc
SELECT kieu_du_lieu_thuoc_tinh FROM dinh_nghia_thuoc_tinh GROUP BY kieu_du_lieu_thuoc_tinh HAVING COUNT(*) > 3
SELECT kieu_du_lieu_thuoc_tinh FROM dinh_nghia_thuoc_tinh GROUP BY kieu_du_lieu_thuoc_tinh HAVING COUNT(*) > 3
SELECT kieu_du_lieu_thuoc_tinh FROM dinh_nghia_thuoc_tinh WHERE ten_thuoc_tinh = 'Xanh'
SELECT kieu_du_lieu_thuoc_tinh FROM dinh_nghia_thuoc_tinh WHERE ten_thuoc_tinh = 'Xanh'
SELECT ten_cap_do_cua_danh_muc, cap_do_cua_danh_muc FROM cau_truc_danh_muc WHERE cap_do_cua_danh_muc BETWEEN 5 AND 10
SELECT ten_cap_do_cua_danh_muc, cap_do_cua_danh_muc FROM cau_truc_danh_muc WHERE cap_do_cua_danh_muc BETWEEN 5 AND 10
SELECT nha_xuat_ban_danh_muc FROM danh_muc WHERE nha_xuat_ban_danh_muc LIKE '%Murray%'
SELECT nha_xuat_ban_danh_muc FROM danh_muc WHERE nha_xuat_ban_danh_muc LIKE '%Murray%'
SELECT nha_xuat_ban_danh_muc FROM danh_muc GROUP BY nha_xuat_ban_danh_muc ORDER BY COUNT(*) DESC LIMIT 1
SELECT nha_xuat_ban_danh_muc FROM danh_muc GROUP BY nha_xuat_ban_danh_muc ORDER BY COUNT(*) DESC LIMIT 1
SELECT danh_muc.ten_danh_muc, danh_muc.ngay_xuat_ban FROM danh_muc JOIN cau_truc_danh_muc ON danh_muc.id_danh_muc = cau_truc_danh_muc.id_danh_muc WHERE cau_truc_danh_muc.cap_do_cua_danh_muc > 5
SELECT ten_danh_muc, ngay_xuat_ban FROM danh_muc JOIN cau_truc_danh_muc ON danh_muc.id_danh_muc = cau_truc_danh_muc.id_danh_muc WHERE cau_truc_danh_muc.cap_do_cua_danh_muc > 5
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc JOIN thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc ON noi_dung_danh_muc.id_muc_nhap_cua_danh_muc = thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc.id_muc_nhap_cua_danh_muc WHERE thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc.id_thuoc_tinh = (SELECT id_thuoc_tinh FROM thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc GROUP BY id_thuoc_tinh ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc AS T1 JOIN thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc AS T2 ON T1.id_muc_nhap_cua_danh_muc = T2.id_muc_nhap_cua_danh_muc GROUP BY T2.id_thuoc_tinh HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc GROUP BY id_thuoc_tinh) AS sub) ORDER BY T2.id_thuoc_tinh ASC
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc ORDER BY gia_tinh_theo_do_la DESC LIMIT 1
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc ORDER BY gia_tinh_theo_do_la DESC LIMIT 1
SELECT cau_truc_danh_muc.ten_cap_do_cua_danh_muc FROM cau_truc_danh_muc JOIN noi_dung_danh_muc ON cau_truc_danh_muc.cap_do_cua_danh_muc = noi_dung_danh_muc.cap_do_cua_danh_muc ORDER BY noi_dung_danh_muc.gia_tinh_theo_do_la ASC LIMIT 1
SELECT T2.ten_cap_do_cua_danh_muc FROM noi_dung_danh_muc AS T1 JOIN cau_truc_danh_muc AS T2 ON T1.cap_do_cua_danh_muc = T2.cap_do_cua_danh_muc ORDER BY T1.gia_tinh_theo_euro ASC LIMIT 1
SELECT AVG(gia_tinh_theo_euro), MIN(gia_tinh_theo_euro) FROM noi_dung_danh_muc
SELECT AVG(noi_dung_danh_muc.gia_tinh_theo_euro), MIN(noi_dung_danh_muc.gia_tinh_theo_euro) FROM danh_muc JOIN noi_dung_danh_muc ON danh_muc.id_danh_muc = noi_dung_danh_muc.id_danh_muc
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc ORDER BY gia_tinh_theo_do_la DESC LIMIT 1
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc ORDER BY gia_tinh_theo_do_la DESC LIMIT 1
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc ORDER BY dung_tich ASC LIMIT 1
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc ORDER BY dung_tich ASC LIMIT 1
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE so_luong_co_phieu_cua_san_pham LIKE '2%'
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE so_luong_co_phieu_cua_san_pham LIKE '2%'
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE cap_do_cua_danh_muc = 8
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE cap_do_cua_danh_muc = 8
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE chieu_dai < 3 OR chieu_rong > 5
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE chieu_dai < '3' OR chieu_rong > '5'
SELECT T1.id_thuoc_tinh , T1.ten_thuoc_tinh FROM dinh_nghia_thuoc_tinh AS T1 JOIN thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc AS T2 ON T1.id_thuoc_tinh = T2.id_thuoc_tinh WHERE T2.gia_tri_thuoc_tinh = '0'
SELECT T1.id_thuoc_tinh , T1.ten_thuoc_tinh FROM dinh_nghia_thuoc_tinh AS T1 JOIN thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc AS T2 ON T1.id_thuoc_tinh = T2.id_thuoc_tinh WHERE T2.gia_tri_thuoc_tinh = '0'
SELECT ten_muc_nhap_cua_danh_muc, dung_tich FROM noi_dung_danh_muc WHERE gia_tinh_theo_do_la > 700
SELECT ten_muc_nhap_cua_danh_muc, dung_tich FROM noi_dung_danh_muc WHERE gia_tinh_theo_do_la > 700
SELECT ngay_thay_doi_moi_nhat_duoc_thuc_hien FROM danh_muc GROUP BY ngay_thay_doi_moi_nhat_duoc_thuc_hien HAVING COUNT(*) > 1
SELECT ngay_thay_doi_moi_nhat_duoc_thuc_hien FROM danh_muc GROUP BY ngay_thay_doi_moi_nhat_duoc_thuc_hien HAVING COUNT(*) > 1
SELECT COUNT(*) FROM noi_dung_danh_muc
SELECT COUNT(*) FROM noi_dung_danh_muc
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE id_muc_nhap_tiep_theo > 8
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE id_muc_nhap_tiep_theo > 8
SELECT COUNT(*) FROM nha_khoa_hoc
SELECT COUNT(*) FROM nha_khoa_hoc
SELECT SUM(so_gio) FROM du_an
SELECT SUM(so_gio) FROM du_an
SELECT COUNT(DISTINCT phan_cong_du_an.nha_khoa_hoc) FROM phan_cong_du_an JOIN nha_khoa_hoc ON phan_cong_du_an.nha_khoa_hoc = nha_khoa_hoc.ssn
SELECT COUNT(DISTINCT nha_khoa_hoc) FROM phan_cong_du_an
SELECT COUNT(*) FROM du_an
SELECT COUNT(*) FROM du_an
SELECT AVG(so_gio) FROM du_an
SELECT AVG(so_gio) FROM du_an
SELECT ten FROM du_an ORDER BY so_gio DESC LIMIT 1
SELECT ten FROM du_an ORDER BY so_gio DESC LIMIT 1
SELECT ten FROM du_an WHERE so_gio > (SELECT AVG(so_gio) FROM du_an)
SELECT ten FROM du_an WHERE so_gio > (SELECT AVG(so_gio) FROM du_an)
SELECT ten, so_gio FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an GROUP BY du_an.ma ORDER BY COUNT(*) DESC LIMIT 1
SELECT du_an.ten, du_an.so_gio FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an GROUP BY du_an.ma ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten FROM du_an AS T1 JOIN phan_cong_du_an AS T2 ON T1.ma = T2.du_an JOIN nha_khoa_hoc AS T3 ON T2.nha_khoa_hoc = T3.ssn WHERE T3.ten LIKE '%Smith%'
SELECT du_an.ten FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an JOIN nha_khoa_hoc ON phan_cong_du_an.nha_khoa_hoc = nha_khoa_hoc.ssn WHERE nha_khoa_hoc.ten LIKE '%Smith%'
SELECT SUM(du_an.so_gio) FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an JOIN nha_khoa_hoc ON phan_cong_du_an.nha_khoa_hoc = nha_khoa_hoc.ssn WHERE nha_khoa_hoc.ten IN ('Michael Rogers', 'Carol Smith')
SELECT SUM(du_an.so_gio) FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an JOIN nha_khoa_hoc ON phan_cong_du_an.nha_khoa_hoc = nha_khoa_hoc.ssn WHERE nha_khoa_hoc.ten IN ('Michael Rogers', 'Carol Smith')
SELECT ten FROM du_an WHERE so_gio BETWEEN 100 AND 300
SELECT ten FROM du_an WHERE so_gio BETWEEN 100 AND 300
SELECT nha_khoa_hoc.ten FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc JOIN du_an ON phan_cong_du_an.du_an = du_an.ma WHERE du_an.ten = 'Vật chất của thời gian' OR du_an.ten = 'Hiện tượng thị sai kỳ bí' GROUP BY nha_khoa_hoc.ssn HAVING COUNT(DISTINCT du_an.ma) = 2
SELECT T1.ten FROM nha_khoa_hoc AS T1 JOIN phan_cong_du_an AS T2 ON T1.ssn = T2.nha_khoa_hoc JOIN du_an AS T3 ON T2.du_an = T3.ma WHERE T3.ten IN ('Vật chất của thời gian', 'Hiện tượng thị sai kỳ bí') GROUP BY T1.ssn HAVING COUNT(DISTINCT T3.ma) = 2
SELECT ten FROM nha_khoa_hoc ORDER BY ten ASC
SELECT ten FROM nha_khoa_hoc ORDER BY ten ASC
SELECT T1.ma, T1.ten, COUNT(*) FROM du_an AS T1 JOIN phan_cong_du_an AS T2 ON T1.ma = T2.du_an GROUP BY T1.ma
SELECT du_an.ten, COUNT(*) FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an GROUP BY du_an.ma
SELECT COUNT(DISTINCT nha_khoa_hoc.ssn) FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc JOIN du_an ON phan_cong_du_an.du_an = du_an.ma WHERE du_an.so_gio > 300
SELECT T1.ten, COUNT(*) FROM du_an AS T1 JOIN phan_cong_du_an AS T2 ON T1.ma = T2.du_an WHERE T1.so_gio > 300 GROUP BY T1.ma
SELECT T1.ten , COUNT(*) FROM nha_khoa_hoc AS T1 JOIN phan_cong_du_an AS T2 ON T1.ssn = T2.nha_khoa_hoc GROUP BY T1.ssn
SELECT T1.ten, COUNT(*) FROM nha_khoa_hoc AS T1 JOIN phan_cong_du_an AS T2 ON T1.ssn = T2.nha_khoa_hoc GROUP BY T1.ssn
SELECT T3.ssn, T3.ten FROM du_an AS T1 JOIN phan_cong_du_an AS T2 ON T1.ma = T2.du_an JOIN nha_khoa_hoc AS T3 ON T2.nha_khoa_hoc = T3.ssn ORDER BY T1.so_gio DESC LIMIT 1
SELECT nha_khoa_hoc.ssn , nha_khoa_hoc.ten FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc JOIN du_an ON phan_cong_du_an.du_an = du_an.ma WHERE du_an.ma = (SELECT ma FROM du_an ORDER BY so_gio DESC LIMIT 1)
SELECT ten FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc
SELECT DISTINCT nha_khoa_hoc.ten FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc
SELECT ten FROM du_an WHERE ma NOT IN (SELECT du_an FROM phan_cong_du_an)
SELECT ten FROM du_an WHERE ma NOT IN (SELECT du_an FROM phan_cong_du_an)
SELECT ten FROM nha_khoa_hoc WHERE ssn NOT IN (SELECT nha_khoa_hoc FROM phan_cong_du_an)
SELECT ten FROM nha_khoa_hoc WHERE ssn NOT IN (SELECT nha_khoa_hoc FROM phan_cong_du_an)
SELECT COUNT(*) FROM nha_khoa_hoc WHERE ssn NOT IN (SELECT nha_khoa_hoc FROM phan_cong_du_an)
SELECT COUNT(*) FROM nha_khoa_hoc WHERE ssn NOT IN (SELECT nha_khoa_hoc FROM phan_cong_du_an)
SELECT ten FROM nha_khoa_hoc WHERE ssn NOT IN (SELECT phan_cong_du_an.nha_khoa_hoc FROM phan_cong_du_an JOIN du_an ON phan_cong_du_an.du_an = du_an.ma WHERE du_an.so_gio = (SELECT MAX(so_gio) FROM du_an))
SELECT ten FROM nha_khoa_hoc WHERE ssn NOT IN (SELECT nha_khoa_hoc FROM phan_cong_du_an WHERE du_an IN (SELECT ma FROM du_an WHERE so_gio = (SELECT MAX(so_gio) FROM du_an)))
SELECT nha_khoa_hoc.ten, du_an.ten, du_an.so_gio FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc JOIN du_an ON phan_cong_du_an.du_an = du_an.ma ORDER BY du_an.ten, nha_khoa_hoc.ten
SELECT T1.ten , T3.ten , T3.so_gio FROM nha_khoa_hoc AS T1 JOIN phan_cong_du_an AS T2 ON T1.ssn = T2.nha_khoa_hoc JOIN du_an AS T3 ON T2.du_an = T3.ma ORDER BY T3.ten , T1.ten
SELECT du_an.ten, nha_khoa_hoc.ten FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an JOIN nha_khoa_hoc ON phan_cong_du_an.nha_khoa_hoc = nha_khoa_hoc.ssn ORDER BY so_gio ASC LIMIT 1
SELECT du_an.ten, nha_khoa_hoc.ten FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an JOIN nha_khoa_hoc ON phan_cong_du_an.nha_khoa_hoc = nha_khoa_hoc.ssn ORDER BY du_an.so_gio ASC LIMIT 1
SELECT COUNT(*) FROM tau
SELECT COUNT(*) FROM tau
SELECT ten FROM tau ORDER BY trong_tai ASC
SELECT ten FROM tau ORDER BY trong_tai ASC
SELECT loai, quoc_tich FROM tau
SELECT quoc_tich, loai FROM tau
SELECT ten FROM tau WHERE quoc_tich != 'Hoa Kỳ'
SELECT ten FROM tau WHERE quoc_tich != 'Hoa Kỳ'
SELECT ten FROM tau WHERE quoc_tich = 'American' OR quoc_tich = 'British'
SELECT ten FROM tau WHERE quoc_tich = 'Mỹ' OR quoc_tich = 'Anh'
SELECT ten FROM tau ORDER BY trong_tai DESC LIMIT 1
SELECT ten FROM tau ORDER BY trong_tai DESC LIMIT 1
SELECT loai , COUNT ( * ) FROM tau GROUP BY loai
SELECT loai , COUNT(*) FROM tau GROUP BY loai
SELECT loai FROM tau GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai FROM tau GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_tich FROM tau GROUP BY quoc_tich HAVING COUNT(*) > 2
SELECT quoc_tich FROM tau GROUP BY quoc_tich HAVING COUNT(*) > 2
SELECT loai , AVG(trong_tai) FROM tau GROUP BY loai
SELECT loai , AVG(trong_tai) FROM tau GROUP BY loai
SELECT tau.ten, nhiem_vu.ma, nhiem_vu.so_phan FROM tau JOIN nhiem_vu ON tau.id_tau = nhiem_vu.id_tau
SELECT nhiem_vu.ma, nhiem_vu.so_phan, tau.ten FROM nhiem_vu JOIN tau ON nhiem_vu.id_tau = tau.id_tau
SELECT tau.ten FROM tau JOIN nhiem_vu ON tau.id_tau = nhiem_vu.id_tau WHERE nhiem_vu.duoc_dua_ra_nam_nao > 1928
SELECT tau.ten FROM tau JOIN nhiem_vu ON tau.id_tau = nhiem_vu.id_tau WHERE nhiem_vu.duoc_dua_ra_nam_nao > 1928
SELECT id_nhiem_vu, ma, duoc_dua_ra_nam_nao, dia_diem, toc_do_tinh_theo_nut, so_phan FROM nhiem_vu JOIN tau ON nhiem_vu.id_tau = tau.id_tau WHERE tau.quoc_tich = 'Hoa Kỳ'
SELECT nhiem_vu.id_nhiem_vu, nhiem_vu.ma, nhiem_vu.dia_diem, nhiem_vu.toc_do_tinh_theo_nut, nhiem_vu.so_phan FROM nhiem_vu JOIN tau ON nhiem_vu.id_tau = tau.id_tau WHERE tau.quoc_tich = 'Hoa Kỳ'
SELECT ten FROM tau WHERE id_tau NOT IN (SELECT id_tau FROM nhiem_vu)
SELECT ten FROM tau WHERE id_tau NOT IN (SELECT id_tau FROM nhiem_vu)
SELECT loai FROM tau WHERE trong_tai > 6000 INTERSECT SELECT loai FROM tau WHERE trong_tai < 4000
SELECT loai FROM tau WHERE trong_tai > 6000 GROUP BY loai INTERSECT SELECT loai FROM tau WHERE trong_tai < 4000 GROUP BY loai
SELECT COUNT(*) FROM ca_si
SELECT COUNT(*) FROM ca_si
SELECT ten FROM ca_si ORDER BY gia_tri_tai_san_rong ASC
SELECT ten FROM ca_si ORDER BY gia_tri_tai_san_rong ASC
SELECT nam_sinh, quoc_tich FROM ca_si
SELECT nam_sinh, quoc_tich FROM ca_si
SELECT ten FROM ca_si WHERE quoc_tich != 'Pháp'
SELECT ten FROM ca_si WHERE quoc_tich != 'Phap'
SELECT ten FROM ca_si WHERE nam_sinh = 1948 OR nam_sinh = 1949
SELECT ten FROM ca_si WHERE nam_sinh = 1948 OR nam_sinh = 1949
SELECT ten FROM ca_si ORDER BY gia_tri_tai_san_rong DESC LIMIT 1
SELECT ten FROM ca_si ORDER BY gia_tri_tai_san_rong DESC LIMIT 1
SELECT quoc_tich, COUNT(*) FROM ca_si GROUP BY quoc_tich
SELECT quoc_tich, COUNT(*) FROM ca_si GROUP BY quoc_tich
SELECT quoc_tich, COUNT(*) AS so_luong FROM ca_si GROUP BY quoc_tich ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_tich FROM ca_si GROUP BY quoc_tich ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_tich, MAX(gia_tri_tai_san_rong) FROM ca_si GROUP BY quoc_tich
SELECT quoc_tich, MAX(gia_tri_tai_san_rong) FROM ca_si GROUP BY quoc_tich
SELECT bai_hat.tieu_de, ca_si.ten FROM bai_hat JOIN ca_si ON bai_hat.id_ca_si = ca_si.id_ca_si
SELECT bai_hat.tieu_de, ca_si.ten FROM bai_hat JOIN ca_si ON bai_hat.id_ca_si = ca_si.id_ca_si
SELECT DISTINCT ca_si.ten FROM ca_si JOIN bai_hat ON ca_si.id_ca_si = bai_hat.id_ca_si WHERE bai_hat.doanh_so > 300000
SELECT DISTINCT ca_si.ten FROM ca_si JOIN bai_hat ON ca_si.id_ca_si = bai_hat.id_ca_si WHERE bai_hat.doanh_so > 300000
SELECT ca_si.ten FROM ca_si JOIN bai_hat ON ca_si.id_ca_si = bai_hat.id_ca_si GROUP BY ca_si.id_ca_si HAVING COUNT(*) > 1
SELECT T1.ten FROM ca_si AS T1 JOIN bai_hat AS T2 ON T1.id_ca_si = T2.id_ca_si GROUP BY T1.id_ca_si HAVING COUNT(*) > 1
SELECT T1.ten, SUM(T2.doanh_so) FROM ca_si AS T1 JOIN bai_hat AS T2 ON T1.id_ca_si = T2.id_ca_si GROUP BY T1.id_ca_si
SELECT ca_si.ten, SUM(bai_hat.doanh_so) FROM ca_si JOIN bai_hat ON ca_si.id_ca_si = bai_hat.id_ca_si GROUP BY ca_si.id_ca_si
SELECT ten FROM ca_si WHERE id_ca_si NOT IN (SELECT id_ca_si FROM bai_hat)
SELECT ten FROM ca_si WHERE id_ca_si NOT IN (SELECT id_ca_si FROM bai_hat)
SELECT quoc_tich FROM ca_si WHERE nam_sinh < 1945 OR nam_sinh > 1955
SELECT quoc_tich FROM ca_si WHERE nam_sinh < 1945 OR nam_sinh > 1955
SELECT COUNT(*) FROM cau_lac_bo
SELECT COUNT(*) FROM cau_lac_bo
SELECT DISTINCT khu_vuc FROM cau_lac_bo ORDER BY khu_vuc ASC
SELECT khu_vuc FROM cau_lac_bo ORDER BY khu_vuc ASC
SELECT AVG(vang) FROM thu_hang_cua_cau_lac_bo
SELECT AVG(vang) FROM thu_hang_cua_cau_lac_bo
SELECT loai_cuoc_thi, quoc_gia FROM cuoc_thi
SELECT loai_cuoc_thi, quoc_gia FROM cuoc_thi
SELECT nam FROM cuoc_thi WHERE loai_cuoc_thi != 'Giải đấu'
SELECT nam FROM cuoc_thi WHERE loai_cuoc_thi != 'Giải đấu'
SELECT COUNT(*) FROM cau_lac_bo JOIN thu_hang_cua_cau_lac_bo ON cau_lac_bo.id_cau_lac_bo = thu_hang_cua_cau_lac_bo.id_cau_lac_bo WHERE thu_hang_cua_cau_lac_bo.tong < 10
SELECT COUNT(*) FROM cau_lac_bo JOIN thu_hang_cua_cau_lac_bo ON cau_lac_bo.id_cau_lac_bo = thu_hang_cua_cau_lac_bo.id_cau_lac_bo WHERE thu_hang_cua_cau_lac_bo.vang + thu_hang_cua_cau_lac_bo.bac + thu_hang_cua_cau_lac_bo.dong < 10
SELECT ten FROM cau_lac_bo ORDER BY nam_thanh_lap ASC
SELECT ten FROM cau_lac_bo ORDER BY nam_thanh_lap ASC
SELECT ten FROM cau_lac_bo ORDER BY ten DESC
SELECT ten FROM cau_lac_bo ORDER BY ten DESC
SELECT cau_lac_bo.ten, cau_thu.id_cau_thu FROM cau_lac_bo, cau_thu
SELECT cau_thu.id_cau_thu, cau_lac_bo.ten FROM cau_thu JOIN cau_lac_bo ON cau_thu.id_cau_lac_bo = cau_lac_bo.id_cau_lac_bo
SELECT cau_lac_bo.ten FROM cau_lac_bo JOIN cau_thu ON cau_lac_bo.id_cau_lac_bo = cau_thu.id_cau_lac_bo WHERE cau_thu.vi_tri = 'Cánh phải'
SELECT DISTINCT cau_lac_bo.ten FROM cau_lac_bo JOIN cau_thu ON cau_lac_bo.id_cau_lac_bo = cau_thu.id_cau_lac_bo WHERE cau_thu.vi_tri = 'Cánh phải'
SELECT AVG(cau_thu.diem_so) FROM cau_thu JOIN cau_lac_bo ON cau_thu.id_cau_lac_bo = cau_lac_bo.id_cau_lac_bo WHERE cau_lac_bo.ten = 'AIB'
SELECT AVG(cau_thu.diem_so) FROM cau_thu JOIN cau_lac_bo ON cau_thu.id_cau_lac_bo = cau_lac_bo.id_cau_lac_bo WHERE cau_lac_bo.ten = 'AIB'
SELECT vi_tri, AVG(diem_so) FROM cau_thu GROUP BY vi_tri
SELECT vi_tri, AVG(diem_so) FROM cau_thu GROUP BY vi_tri
SELECT vi_tri FROM cau_thu GROUP BY vi_tri HAVING AVG(diem_so) > 20
SELECT vi_tri FROM cau_thu GROUP BY vi_tri HAVING AVG(diem_so) > 20
SELECT loai_cuoc_thi , COUNT ( * ) FROM cuoc_thi GROUP BY loai_cuoc_thi
SELECT loai_cuoc_thi , COUNT ( * ) FROM cuoc_thi GROUP BY loai_cuoc_thi
SELECT loai_cuoc_thi FROM cuoc_thi GROUP BY loai_cuoc_thi ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai_cuoc_thi , COUNT ( * ) FROM cuoc_thi GROUP BY loai_cuoc_thi ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT loai_cuoc_thi FROM cuoc_thi GROUP BY loai_cuoc_thi HAVING COUNT(*) <= 5
SELECT loai_cuoc_thi FROM cuoc_thi GROUP BY loai_cuoc_thi HAVING COUNT(*) >= 5
SELECT ten FROM cau_lac_bo WHERE id_cau_lac_bo NOT IN (SELECT id_cau_lac_bo FROM cau_thu)
SELECT ten FROM cau_lac_bo WHERE id_cau_lac_bo NOT IN (SELECT id_cau_lac_bo FROM cau_thu)
SELECT xep_hang FROM thu_hang_cua_cau_lac_bo WHERE id_cau_lac_bo IN (SELECT id_cau_lac_bo FROM cau_thu WHERE diem_so > 20 GROUP BY id_cau_lac_bo HAVING COUNT(*) > 0 AND EXISTS (SELECT 1 FROM cau_thu WHERE id_cau_lac_bo = cau_thu.id_cau_lac_bo AND diem_so < 10))
SELECT vi_tri FROM cau_thu WHERE diem_so > 20 INTERSECT SELECT vi_tri FROM cau_thu WHERE diem_so < 10
SELECT SUM(diem_so) FROM cau_thu
SELECT SUM(diem_so) FROM cau_thu
SELECT COUNT(DISTINCT vi_tri) FROM cau_thu
SELECT COUNT(DISTINCT vi_tri) FROM cau_thu
SELECT ten FROM cau_thu WHERE diem_so > (SELECT AVG(diem_so) FROM cau_thu)
SELECT ten FROM cau_thu WHERE diem_so > (SELECT AVG(diem_so) FROM cau_thu)
SELECT vi_tri, COUNT(*) FROM cau_thu WHERE diem_so < 30 GROUP BY vi_tri
SELECT vi_tri, COUNT(*) FROM cau_thu WHERE diem_so < 30 GROUP BY vi_tri
SELECT quoc_gia FROM cuoc_thi GROUP BY quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_gia FROM cuoc_thi GROUP BY quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi = 'Giao huong' INTERSECT SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi = 'Giai dau'
SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi = 'Giao huynh' INTERSECT SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi = 'Giai dau'
SELECT quoc_gia FROM cuoc_thi WHERE quoc_gia NOT IN (SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi = 'giao huynh')
SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi = 'Giao hung' EXCEPT SELECT quoc_gia FROM cuoc_thi WHERE 1 = 0
SELECT COUNT(*) FROM su_kien
SELECT ten FROM su_kien ORDER BY nam DESC
SELECT ten FROM su_kien ORDER BY nam DESC LIMIT 1
SELECT COUNT(*) FROM san_van_dong
SELECT ten FROM san_van_dong ORDER BY suc_chua DESC LIMIT 1
SELECT ten FROM san_van_dong WHERE suc_chua < (SELECT AVG(suc_chua) FROM san_van_dong)
SELECT quoc_gia, COUNT(*) AS so_luong FROM san_van_dong GROUP BY quoc_gia ORDER BY so_luong DESC LIMIT 1
SELECT quoc_gia FROM san_van_dong GROUP BY quoc_gia HAVING COUNT(*) <= 3
SELECT quoc_gia FROM san_van_dong WHERE suc_chua > 60000 INTERSECT SELECT quoc_gia FROM san_van_dong WHERE suc_chua < 5000
SELECT COUNT(DISTINCT thanh_pho) FROM san_van_dong WHERE nam_mo_cua < 2006
SELECT quoc_gia , COUNT ( * ) FROM san_van_dong GROUP BY quoc_gia
SELECT quoc_gia FROM san_van_dong WHERE quoc_gia NOT IN (SELECT quoc_gia FROM san_van_dong WHERE nam_mo_cua > 2006)
SELECT COUNT(*) FROM san_van_dong WHERE quoc_gia != 'Nga'
SELECT ten FROM van_dong_vien_boi ORDER BY 100_met ASC
SELECT COUNT(DISTINCT quoc_tich) FROM van_dong_vien_boi
SELECT quoc_tich FROM van_dong_vien_boi GROUP BY quoc_tich HAVING COUNT(*) > 1
SELECT 200_met, 300_met FROM van_dong_vien_boi WHERE quoc_tich = 'Úc'
SELECT T1.ten FROM van_dong_vien_boi AS T1 JOIN ho_so AS T2 ON T1.id_van_dong_vien_boi = T2.id_van_dong_vien_boi WHERE T2.ket_qua = 'thắng lợi'
SELECT ten FROM san_van_dong JOIN su_kien ON san_van_dong.id = su_kien.id_san_van_dong GROUP BY san_van_dong.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_van_dong.ten, san_van_dong.suc_chua FROM su_kien JOIN san_van_dong ON su_kien.id_san_van_dong = san_van_dong.id WHERE su_kien.ten = 'giải trẻ thế giới'
SELECT ten FROM san_van_dong WHERE id NOT IN (SELECT id_san_van_dong FROM su_kien)
SELECT T1.ten FROM van_dong_vien_boi AS T1 JOIN ho_so AS T2 ON T1.id = T2.id_van_dong_vien_boi GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM van_dong_vien_boi JOIN ho_so ON van_dong_vien_boi.id = ho_so.id_van_dong_vien_boi GROUP BY van_dong_vien_boi.id HAVING COUNT(*) >= 2
SELECT van_dong_vien_boi.ten, van_dong_vien_boi.quoc_tich FROM van_dong_vien_boi JOIN ho_so ON van_dong_vien_boi.id = ho_so.id_van_dong_vien_boi GROUP BY van_dong_vien_boi.id HAVING COUNT(*) > 1
SELECT ten FROM van_dong_vien_boi WHERE id NOT IN (SELECT id_van_dong_vien_boi FROM ho_so)
SELECT ten FROM van_dong_vien_boi WHERE id IN (SELECT id_van_dong_vien_boi FROM ho_so WHERE ket_qua = 'thang' INTERSECT SELECT id_van_dong_vien_boi FROM ho_so WHERE ket_qua = 'thua')
SELECT T1.ten FROM san_van_dong AS T1 JOIN su_kien AS T2 ON T1.id = T2.id_san_van_dong JOIN ho_so AS T3 ON T2.id = T3.id_su_kien JOIN van_dong_vien_boi AS T4 ON T3.id_van_dong_vien_boi = T4.id WHERE T4.quoc_tich = 'Úc'
SELECT san_van_dong.ten FROM san_van_dong JOIN su_kien ON san_van_dong.id = su_kien.id_san_van_dong JOIN ho_so ON su_kien.id = ho_so.id_su_kien GROUP BY san_van_dong.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT id, ten, quoc_tich, 100_met, 200_met, 300_met, 400_met, 500_met, 600_met, 700_met, thoi_gian FROM van_dong_vien_boi
SELECT AVG(suc_chua) FROM san_van_dong WHERE nam_mo_cua = 2005
SELECT COUNT(*) FROM nha_dau_tu
SELECT id_nha_dau_tu , chi_tiet_ve_nha_dau_tu FROM nha_dau_tu
SELECT id_lot, id_nha_dau_tu, chi_tiet_ve_cac_lot FROM lot
SELECT MAX(so_tien_giao_dich) FROM giao_dich
SELECT ngay_giao_dich, so_luong_co_phieu FROM giao_dich
SELECT SUM(CAST(so_luong_co_phieu AS INTEGER)) FROM giao_dich
SELECT id_giao_dich FROM giao_dich WHERE ma_loai_giao_dich = 'mua'
SELECT ngay_giao_dich FROM giao_dich WHERE ma_loai_giao_dich = 'bán'
SELECT AVG(so_tien_giao_dich) FROM giao_dich WHERE ma_loai_giao_dich = 'bán'
SELECT loai_giao_dich.mo_ta_ve_loai_giao_dich FROM giao_dich JOIN loai_giao_dich ON giao_dich.ma_loai_giao_dich = loai_giao_dich.ma_loai_giao_dich WHERE giao_dich.ma_loai_giao_dich = 'mua'
SELECT so_tien_giao_dich FROM giao_dich WHERE ma_loai_giao_dich = 'mua' AND so_luong_co_phieu > 50 ORDER BY so_tien_giao_dich ASC LIMIT 1
SELECT MAX(so_luong_co_phieu) FROM giao_dich WHERE so_tien_giao_dich < 1000 ORDER BY MAX(so_luong_co_phieu) DESC LIMIT 1
SELECT ngay_giao_dich FROM giao_dich WHERE so_luong_co_phieu > 100 OR so_tien_giao_dich < 1000
SELECT giao_dich.ngay_giao_dich, loai_giao_dich.mo_ta_ve_loai_giao_dich FROM giao_dich JOIN loai_giao_dich ON giao_dich.ma_loai_giao_dich = loai_giao_dich.ma_loai_giao_dich WHERE giao_dich.so_luong_co_phieu < 10
SELECT nha_dau_tu.id_nha_dau_tu, nha_dau_tu.chi_tiet_ve_nha_dau_tu FROM nha_dau_tu JOIN giao_dich ON nha_dau_tu.id_nha_dau_tu = giao_dich.id_nha_dau_tu WHERE giao_dich.so_luong_co_phieu > 150
SELECT COUNT(DISTINCT ma_loai_giao_dich) FROM giao_dich
SELECT chi_tiet_ve_cac_lot, id_nha_dau_tu FROM lot
SELECT lot.id_lot, lot.chi_tiet_ve_cac_lot FROM lot JOIN nha_dau_tu ON lot.id_nha_dau_tu = nha_dau_tu.id_nha_dau_tu WHERE nha_dau_tu.chi_tiet_ve_nha_dau_tu = 'l'
SELECT mua_hang.chi_tiet_mua_hang FROM giao_dich JOIN mua_hang ON giao_dich.id_giao_dich = mua_hang.id_giao_dich_mua_hang WHERE giao_dich.so_tien_giao_dich > 10000
SELECT ban_hang.chi_tiet_ban_hang, giao_dich.ngay_giao_dich FROM giao_dich JOIN ban_hang ON giao_dich.id_giao_dich = ban_hang.id_giao_dich_ban_hang WHERE giao_dich.so_tien_giao_dich < 3000
SELECT lot.chi_tiet_ve_cac_lot FROM lot JOIN giao_dich_lot ON lot.id_lot = giao_dich_lot.id_lot JOIN giao_dich ON giao_dich_lot.id_giao_dich = giao_dich.id_giao_dich WHERE giao_dich.so_luong_co_phieu < 50
SELECT lot.chi_tiet_ve_cac_lot FROM giao_dich JOIN giao_dich_lot ON giao_dich.id_giao_dich = giao_dich_lot.id_giao_dich JOIN lot ON giao_dich_lot.id_lot = lot.id_lot WHERE giao_dich.so_luong_co_phieu > 100 AND giao_dich.ma_loai_giao_dich = 'mua'
SELECT T1.mo_ta_ve_loai_giao_dich , AVG(T2.so_tien_giao_dich) FROM loai_giao_dich AS T1 JOIN giao_dich AS T2 ON T1.ma_loai_giao_dich = T2.ma_loai_giao_dich GROUP BY T1.ma_loai_giao_dich
SELECT T1.ma_loai_giao_dich , MAX(T2.so_luong_co_phieu) , MIN(T2.so_luong_co_phieu) FROM loai_giao_dich AS T1 JOIN giao_dich AS T2 ON T1.ma_loai_giao_dich = T2.ma_loai_giao_dich GROUP BY T1.ma_loai_giao_dich
SELECT nha_dau_tu.id_nha_dau_tu , AVG(giao_dich.so_luong_co_phieu) FROM nha_dau_tu JOIN giao_dich ON nha_dau_tu.id_nha_dau_tu = giao_dich.id_nha_dau_tu GROUP BY nha_dau_tu.id_nha_dau_tu
SELECT nha_dau_tu.id_nha_dau_tu , AVG(giao_dich.so_luong_co_phieu) FROM nha_dau_tu JOIN giao_dich ON nha_dau_tu.id_nha_dau_tu = giao_dich.id_nha_dau_tu GROUP BY nha_dau_tu.id_nha_dau_tu ORDER BY AVG(giao_dich.so_luong_co_phieu) ASC
SELECT T1.id_nha_dau_tu , COUNT ( * ) FROM nha_dau_tu AS T1 JOIN giao_dich AS T2 ON T1.id_nha_dau_tu = T2.id_nha_dau_tu GROUP BY T1.id_nha_dau_tu
SELECT AVG(transaction_count) FROM (SELECT COUNT(*) AS transaction_count FROM giao_dich_lot GROUP BY id_lot) AS subquery
SELECT T2.id_lot, COUNT(*) FROM lot AS T2 JOIN giao_dich_lot AS T1 ON T2.id_lot = T1.id_lot GROUP BY T2.id_lot ORDER BY COUNT(*) DESC
SELECT T1.id_nha_dau_tu , COUNT ( * ) FROM nha_dau_tu AS T1 JOIN giao_dich AS T2 ON T1.id_nha_dau_tu = T2.id_nha_dau_tu JOIN loai_giao_dich AS T3 ON T2.ma_loai_giao_dich = T3.ma_loai_giao_dich WHERE T3.mo_ta_ve_loai_giao_dich = 'bán' GROUP BY T1.id_nha_dau_tu
SELECT nha_dau_tu.id_nha_dau_tu , COUNT(*) FROM nha_dau_tu JOIN giao_dich ON nha_dau_tu.id_nha_dau_tu = giao_dich.id_nha_dau_tu GROUP BY nha_dau_tu.id_nha_dau_tu
SELECT loai_giao_dich.ma_loai_giao_dich FROM giao_dich JOIN loai_giao_dich ON giao_dich.ma_loai_giao_dich = loai_giao_dich.ma_loai_giao_dich GROUP BY loai_giao_dich.ma_loai_giao_dich ORDER BY COUNT(*) ASC LIMIT 1
SELECT ma_loai_giao_dich FROM giao_dich GROUP BY ma_loai_giao_dich ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai_giao_dich.mo_ta_ve_loai_giao_dich FROM loai_giao_dich JOIN giao_dich ON loai_giao_dich.ma_loai_giao_dich = giao_dich.ma_loai_giao_dich GROUP BY loai_giao_dich.ma_loai_giao_dich ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_nha_dau_tu , T1.chi_tiet_ve_nha_dau_tu FROM nha_dau_tu AS T1 JOIN giao_dich AS T2 ON T1.id_nha_dau_tu = T2.id_nha_dau_tu GROUP BY T1.id_nha_dau_tu ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_nha_dau_tu , T1.chi_tiet_ve_nha_dau_tu FROM nha_dau_tu AS T1 JOIN giao_dich AS T2 ON T1.id_nha_dau_tu = T2.id_nha_dau_tu GROUP BY T1.id_nha_dau_tu ORDER BY COUNT(*) DESC LIMIT 3
SELECT T1.id_nha_dau_tu FROM nha_dau_tu AS T1 JOIN giao_dich AS T2 ON T1.id_nha_dau_tu = T2.id_nha_dau_tu GROUP BY T1.id_nha_dau_tu HAVING COUNT(*) >= 2
SELECT T1.id_nha_dau_tu , T1.chi_tiet_ve_nha_dau_tu FROM nha_dau_tu AS T1 JOIN giao_dich AS T2 ON T1.id_nha_dau_tu = T2.id_nha_dau_tu JOIN loai_giao_dich AS T3 ON T2.ma_loai_giao_dich = T3.ma_loai_giao_dich WHERE T3.mo_ta_ve_loai_giao_dich = 'bán' GROUP BY T1.id_nha_dau_tu , T1.chi_tiet_ve_nha_dau_tu HAVING COUNT ( * ) >= 2
SELECT ngay_giao_dich FROM giao_dich WHERE so_luong_co_phieu >= '100' OR so_tien_giao_dich > 100
SELECT giao_dich.id_giao_dich, giao_dich.id_nha_dau_tu, giao_dich.ma_loai_giao_dich, giao_dich.ngay_giao_dich, giao_dich.so_tien_giao_dich, giao_dich.so_luong_co_phieu, giao_dich.nhung_chi_tiet_khac, loai_giao_dich.mo_ta_ve_loai_giao_dich FROM giao_dich JOIN loai_giao_dich ON giao_dich.ma_loai_giao_dich = loai_giao_dich.ma_loai_giao_dich
SELECT chi_tiet_ve_cac_lot FROM lot WHERE id_lot NOT IN (SELECT id_lot FROM giao_dich_lot)
SELECT COUNT(*) FROM nha_ga
SELECT ten, dia_diem, so_luong_san_ga FROM nha_ga
SELECT dia_diem FROM nha_ga
SELECT ten, tong_so_hanh_khach FROM nha_ga WHERE dia_diem != 'Luân Đôn'
SELECT ten, dich_vu_chinh FROM nha_ga ORDER BY tong_so_hanh_khach DESC LIMIT 3
SELECT AVG(tong_so_hanh_khach), MAX(tong_so_hanh_khach) FROM nha_ga WHERE dia_diem IN ('Luân Đôn', 'Glasgow')
SELECT dia_diem, SUM(so_luong_san_ga), SUM(tong_so_hanh_khach) FROM nha_ga GROUP BY dia_diem
SELECT dia_diem FROM nha_ga WHERE so_luong_san_ga >= 15 AND tong_so_hanh_khach > 25
SELECT dia_diem FROM nha_ga WHERE dia_diem NOT IN (SELECT dia_diem FROM nha_ga WHERE so_luong_san_ga >= 15)
SELECT dia_diem FROM nha_ga GROUP BY dia_diem ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten, thoi_gian, dich_vu FROM toa_hoa
SELECT COUNT(*) FROM toa_hoa
SELECT ten, dich_vu FROM toa_hoa ORDER BY thoi_gian ASC
SELECT nha_ga.ten , COUNT(*) FROM nha_ga JOIN nha_ga_tau_hoa ON nha_ga.id_ga_tau = nha_ga_tau_hoa.id_nha_ga GROUP BY nha_ga.id_ga_tau
SELECT toa_hoa.ten , nha_ga.ten FROM toa_hoa JOIN nha_ga_tau_hoa ON toa_hoa.id_tau = nha_ga_tau_hoa.id_tau JOIN nha_ga ON nha_ga_tau_hoa.id_nha_ga = nha_ga.id_ga_tau
SELECT toa_hoa.ten, toa_hoa.thoi_gian FROM toa_hoa JOIN nha_ga_tau_hoa ON toa_hoa.id_tau = nha_ga_tau_hoa.id_tau JOIN nha_ga ON nha_ga_tau_hoa.id_nha_ga = nha_ga.id_ga_tau WHERE nha_ga.dia_diem = 'Luân Đôn' ORDER BY toa_hoa.thoi_gian DESC
SELECT ten FROM nha_ga JOIN nha_ga_tau_hoa ON nha_ga.id_ga_tau = nha_ga_tau_hoa.id_nha_ga GROUP BY nha_ga.id_ga_tau ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten FROM nha_ga AS T1 JOIN nha_ga_tau_hoa AS T2 ON T1.id_ga_tau = T2.id_nha_ga JOIN toa_hoa AS T3 ON T2.id_tau = T3.id_tau GROUP BY T1.id_ga_tau HAVING COUNT(*) >= 2
SELECT dia_diem FROM nha_ga GROUP BY dia_diem HAVING COUNT(*) = 1
SELECT ten FROM nha_ga WHERE id_ga_tau NOT IN (SELECT id_nha_ga FROM nha_ga_tau_hoa)
SELECT T1.ten FROM nha_ga AS T1 JOIN nha_ga_tau_hoa AS T2 ON T1.id_ga_tau = T2.id_nha_ga JOIN toa_hoa AS T3 ON T2.id_tau = T3.id_tau WHERE T3.ten = 'Ananthapuri Express' INTERSECT SELECT T1.ten FROM nha_ga AS T1 JOIN nha_ga_tau_hoa AS T2 ON T1.id_ga_tau = T2.id_nha_ga JOIN toa_hoa AS T3 ON T2.id_tau = T3.id_tau WHERE T3.ten = 'Guruvayur Express'
SELECT ten FROM toa_hoa WHERE id_tau NOT IN (SELECT nha_ga_tau_hoa.id_tau FROM nha_ga_tau_hoa JOIN nha_ga ON nha_ga_tau_hoa.id_nha_ga = nha_ga.id_ga_tau WHERE nha_ga.dia_diem = 'Luân Đôn')
SELECT ten, dia_diem FROM nha_ga ORDER BY so_luong_xuat_canh_hang_nam, so_luong_trao_doi_hang_nam ASC
SELECT COUNT(*) FROM ma_vung_cua_tieu_bang
SELECT ma_so_thi_sinh , ten_thi_sinh FROM thi_sinh ORDER BY ten_thi_sinh DESC
SELECT phieu_bau.id_phieu_bau, phieu_bau.so_dien_thoai, ma_vung_cua_tieu_bang.tieu_bang FROM phieu_bau JOIN ma_vung_cua_tieu_bang ON phieu_bau.tieu_bang = ma_vung_cua_tieu_bang.tieu_bang
SELECT MIN(ma_vung) AS min_ma_vung, MAX(ma_vung) AS max_ma_vung FROM dbo.ma_vung_cua_tieu_bang
SELECT MAX(ngay_duoc_tao) FROM phieu_bau JOIN ma_vung_cua_tieu_bang ON phieu_bau.tieu_bang = ma_vung_cua_tieu_bang.tieu_bang WHERE ma_vung_cua_tieu_bang.tieu_bang = 'CA'
SELECT ten_thi_sinh FROM thi_sinh WHERE ten_thi_sinh != 'Jessie Alloway'
SELECT tieu_bang, ngay_duoc_tao FROM phieu_bau ORDER BY ngay_duoc_tao ASC
SELECT thi_sinh.ma_so_thi_sinh , thi_sinh.ten_thi_sinh FROM thi_sinh JOIN phieu_bau ON thi_sinh.ma_so_thi_sinh = phieu_bau.ma_so_thi_sinh GROUP BY thi_sinh.ma_so_thi_sinh HAVING COUNT ( * ) >= 2
SELECT thi_sinh.ma_so_thi_sinh, thi_sinh.ten_thi_sinh FROM thi_sinh JOIN phieu_bau ON thi_sinh.ma_so_thi_sinh = phieu_bau.ma_so_thi_sinh GROUP BY thi_sinh.ma_so_thi_sinh ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM phieu_bau WHERE tieu_bang IN ('NY', 'CA')
SELECT COUNT(*) FROM thi_sinh WHERE ma_so_thi_sinh NOT IN (SELECT ma_so_thi_sinh FROM phieu_bau)
SELECT T1.ma_vung FROM ma_vung_cua_tieu_bang AS T1 JOIN phieu_bau AS T2 ON T1.tieu_bang = T2.tieu_bang GROUP BY T1.ma_vung ORDER BY COUNT(*) DESC LIMIT 1
SELECT phieu_bau.ngay_duoc_tao, phieu_bau.tieu_bang, phieu_bau.so_dien_thoai FROM phieu_bau JOIN thi_sinh ON phieu_bau.ma_so_thi_sinh = thi_sinh.ma_so_thi_sinh WHERE thi_sinh.ten_thi_sinh = 'Tabatha Gehling'
SELECT ma_vung_cua_tieu_bang.ma_vung FROM phieu_bau JOIN ma_vung_cua_tieu_bang ON phieu_bau.tieu_bang = ma_vung_cua_tieu_bang.tieu_bang WHERE phieu_bau.ma_so_thi_sinh = (SELECT ma_so_thi_sinh FROM thi_sinh WHERE ten_thi_sinh = 'Tabatha Gehling') AND phieu_bau.tieu_bang IN (SELECT tieu_bang FROM phieu_bau WHERE ma_so_thi_sinh = (SELECT ma_so_thi_sinh FROM thi_sinh WHERE ten_thi_sinh = 'Kelly Clauss')) INTERSECT SELECT ma_vung_cua_tieu_bang.ma_vung FROM phieu_bau JOIN ma_vung_cua_tieu_bang ON phieu_bau.tieu_bang = ma_vung_cua_tieu_bang.tieu_bang WHERE phieu_bau.ma_so_thi_sinh = (SELECT ma_so_thi_sinh FROM thi_sinh WHERE ten_thi_sinh = 'Kelly Clauss') AND phieu_bau.tieu_bang IN (SELECT tieu_bang FROM phieu_bau WHERE ma_so_thi_sinh = (SELECT ma_so_thi_sinh FROM thi_sinh WHERE ten_thi_sinh = 'Tabatha Gehling'))
SELECT ten_thi_sinh FROM thi_sinh WHERE ten_thi_sinh LIKE '%Al%'
SELECT COUNT(*) FROM nguoi_choi
SELECT COUNT(*) FROM nguoi_choi
SELECT COUNT(*) FROM tran_dau
SELECT COUNT(*) FROM tran_dau
SELECT ten, ngay_sinh FROM nguoi_choi WHERE ma_quoc_gia = 'USA'
SELECT ten, ngay_sinh FROM nguoi_choi WHERE ma_quoc_gia = 'Hoa Kỳ'
SELECT AVG(tuoi_cua_nguoi_thua_cuoc), AVG(tuoi_cua_nguoi_chien_thang) FROM tran_dau
SELECT AVG(tuoi_cua_nguoi_thua_cuoc) AS avg_loser_age, AVG(tuoi_cua_nguoi_chien_thang) AS avg_winner_age FROM tran_dau
SELECT AVG(thu_hang_cua_nguoi_chien_thang) FROM tran_dau
SELECT AVG(thu_hang_cua_nguoi_chien_thang) FROM tran_dau
SELECT MIN(thu_hang_cua_nguoi_thua_cuoc) FROM tran_dau
SELECT MIN(xep_hang.xep_hang) FROM tran_dau JOIN xep_hang ON tran_dau.id_nguoi_thua_cuoc = xep_hang.id_nguoi_choi
SELECT COUNT(DISTINCT ma_quoc_gia) FROM nguoi_choi
SELECT COUNT(DISTINCT ma_quoc_gia) FROM nguoi_choi
SELECT COUNT(DISTINCT nguoi_thua_cuoc) FROM tran_dau
SELECT COUNT(DISTINCT nguoi_thua_cuoc) FROM tran_dau
SELECT ten_giai_dau FROM tran_dau GROUP BY id_giai_dau HAVING COUNT(*) > 10
SELECT ten_giai_dau FROM tran_dau GROUP BY id_giai_dau HAVING COUNT(*) > 10
SELECT ten_nguoi_chien_thang FROM tran_dau WHERE nam IN (2013, 2016) GROUP BY id_cua_nguoi_chien_thang HAVING COUNT(DISTINCT nam) = 2
SELECT ten FROM nguoi_choi JOIN tran_dau ON nguoi_choi.id_nguoi_choi = tran_dau.id_cua_nguoi_chien_thang WHERE tran_dau.nam = 2013 INTERSECT SELECT ten FROM nguoi_choi JOIN tran_dau ON nguoi_choi.id_nguoi_choi = tran_dau.id_cua_nguoi_chien_thang WHERE tran_dau.nam = 2016
SELECT COUNT(*) FROM tran_dau WHERE nam = 2013 OR nam = 2016
SELECT COUNT(*) FROM tran_dau WHERE nam = 2013 OR nam = 2016
SELECT ma_quoc_gia, ten, ho FROM nguoi_choi JOIN tran_dau ON nguoi_choi.id_nguoi_choi = tran_dau.id_cua_nguoi_chien_thang WHERE ten_giai_dau = 'vô địch WTA' INTERSECT SELECT ma_quoc_gia, ten, ho FROM nguoi_choi JOIN tran_dau ON nguoi_choi.id_nguoi_choi = tran_dau.id_cua_nguoi_chien_thang WHERE ten_giai_dau = 'Úc mở rộng'
SELECT T2.ten, T2.ma_quoc_gia FROM tran_dau AS T1 JOIN nguoi_choi AS T2 ON T1.id_cua_nguoi_chien_thang = T2.id_nguoi_choi WHERE T1.ten_giai_dau = 'vô địch WTA' INTERSECT SELECT T2.ten, T2.ma_quoc_gia FROM tran_dau AS T1 JOIN nguoi_choi AS T2 ON T1.id_cua_nguoi_chien_thang = T2.id_nguoi_choi WHERE T1.ten_giai_dau = 'Úc mở rộng'
SELECT ten, ma_quoc_gia FROM nguoi_choi ORDER BY (strftime('%Y', 'now') - strftime('%Y', ngay_sinh)) DESC LIMIT 1
SELECT ten, ma_quoc_gia FROM nguoi_choi ORDER BY ngay_sinh ASC LIMIT 1
SELECT ten, ho FROM nguoi_choi ORDER BY ngay_sinh ASC
SELECT ten, ho FROM nguoi_choi ORDER BY ngay_sinh ASC
SELECT ten, ho FROM nguoi_choi WHERE tay_thuan = 'tay trái' ORDER BY ngay_sinh ASC
SELECT ten, ho FROM nguoi_choi WHERE tay_thuan = 'tay trái' ORDER BY ngay_sinh ASC
SELECT nguoi_choi.ten, nguoi_choi.ma_quoc_gia FROM nguoi_choi JOIN tran_dau ON nguoi_choi.id_nguoi_choi = tran_dau.id_cua_nguoi_chien_thang OR nguoi_choi.id_nguoi_choi = tran_dau.id_nguoi_thua_cuoc GROUP BY nguoi_choi.id_nguoi_choi ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten, ma_quoc_gia FROM nguoi_choi JOIN tran_dau ON nguoi_choi.id_nguoi_choi = tran_dau.id_cua_nguoi_chien_thang OR nguoi_choi.id_nguoi_choi = tran_dau.id_nguoi_thua_cuoc GROUP BY nguoi_choi.id_nguoi_choi ORDER BY COUNT(*) DESC LIMIT 1
SELECT nam FROM tran_dau GROUP BY nam ORDER BY COUNT(*) DESC LIMIT 1
SELECT nam FROM tran_dau GROUP BY nam ORDER BY COUNT(*) DESC LIMIT 1
SELECT nguoi_choi.ten, diem_xep_hang_cua_nguoi_chien_thang FROM nguoi_choi JOIN tran_dau ON nguoi_choi.id_nguoi_choi = tran_dau.id_cua_nguoi_chien_thang GROUP BY nguoi_choi.id_nguoi_choi ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten , T3.diem_xep_hang FROM nguoi_choi AS T1 JOIN tran_dau AS T2 ON T1.id_nguoi_choi = T2.id_cua_nguoi_chien_thang JOIN xep_hang AS T3 ON T1.id_nguoi_choi = T3.id_nguoi_choi GROUP BY T1.id_nguoi_choi ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_nguoi_chien_thang FROM tran_dau WHERE ten_giai_dau = 'Úc mở rộng' ORDER BY diem_xep_hang_cua_nguoi_chien_thang DESC LIMIT 1
SELECT ten_nguoi_chien_thang FROM tran_dau WHERE ten_giai_dau = 'Úc mở rộng' ORDER BY diem_xep_hang_cua_nguoi_chien_thang DESC LIMIT 1
SELECT nguoi_thua_cuoc, nguoi_chien_thang FROM tran_dau ORDER BY phut DESC LIMIT 1
SELECT nguoi_chien_thang, nguoi_thua_cuoc FROM tran_dau ORDER BY phut DESC LIMIT 1
SELECT nguoi_choi.ten, AVG(xep_hang.xep_hang) FROM nguoi_choi JOIN xep_hang ON nguoi_choi.id_nguoi_choi = xep_hang.id_nguoi_choi GROUP BY nguoi_choi.id_nguoi_choi
SELECT nguoi_choi.ten , AVG(xep_hang.xep_hang) FROM nguoi_choi JOIN xep_hang ON nguoi_choi.id_nguoi_choi = xep_hang.id_nguoi_choi GROUP BY nguoi_choi.id_nguoi_choi
SELECT nguoi_choi.ten, SUM(xep_hang.diem_xep_hang) FROM nguoi_choi JOIN xep_hang ON nguoi_choi.id_nguoi_choi = xep_hang.id_nguoi_choi GROUP BY nguoi_choi.id_nguoi_choi, nguoi_choi.ten
SELECT nguoi_choi.ten, SUM(xep_hang.diem_xep_hang) FROM nguoi_choi JOIN xep_hang ON nguoi_choi.id_nguoi_choi = xep_hang.id_nguoi_choi GROUP BY nguoi_choi.id_nguoi_choi
SELECT ma_quoc_gia , COUNT ( * ) FROM nguoi_choi GROUP BY ma_quoc_gia
SELECT COUNT(*) FROM nguoi_choi GROUP BY ma_quoc_gia
SELECT ma_quoc_gia FROM nguoi_choi GROUP BY ma_quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_quoc_gia FROM nguoi_choi GROUP BY ma_quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_quoc_gia FROM nguoi_choi GROUP BY ma_quoc_gia HAVING COUNT(*) > 50
SELECT ma_quoc_gia FROM nguoi_choi GROUP BY ma_quoc_gia HAVING COUNT(*) > 50
SELECT ngay_xep_hang , COUNT ( * ) AS tong_so_tour FROM xep_hang GROUP BY ngay_xep_hang
SELECT ngay_xep_hang, COUNT(tour_du_dau) FROM xep_hang GROUP BY ngay_xep_hang
SELECT nam, COUNT(*) FROM tran_dau GROUP BY nam
SELECT nam , COUNT(*) FROM tran_dau GROUP BY nam
SELECT ten_nguoi_chien_thang, thu_hang_nguoi_chien_thang FROM tran_dau ORDER BY tuoi_cua_nguoi_chien_thang ASC LIMIT 3
SELECT nguoi_chien_thang, xep_hang FROM tran_dau JOIN xep_hang ON tran_dau.id_cua_nguoi_chien_thang = xep_hang.id_nguoi_choi ORDER BY tuoi_cua_nguoi_chien_thang ASC LIMIT 3
SELECT COUNT(DISTINCT id_cua_nguoi_chien_thang) FROM tran_dau WHERE ten_giai_dau = 'giải vô địch WTA' AND tay_thuan_cua_nguoi_chien_thang = 'trái'
SELECT COUNT(*) FROM tran_dau WHERE ten_giai_dau = 'giải vô địch WTA' AND tay_thuan_cua_nguoi_chien_thang = 'trái'
SELECT nguoi_choi.ten, nguoi_choi.ma_quoc_gia, nguoi_choi.ngay_sinh FROM xep_hang JOIN nguoi_choi ON xep_hang.id_nguoi_choi = nguoi_choi.id_nguoi_choi ORDER BY xep_hang.diem_xep_hang DESC LIMIT 1
SELECT nguoi_choi.ten, nguoi_choi.ma_quoc_gia, nguoi_choi.ngay_sinh FROM tran_dau JOIN nguoi_choi ON tran_dau.id_cua_nguoi_chien_thang = nguoi_choi.id_nguoi_choi ORDER BY diem_xep_hang_cua_nguoi_chien_thang DESC LIMIT 1
SELECT tay_thuan , COUNT ( * ) FROM nguoi_choi GROUP BY tay_thuan
SELECT tay_thuan , COUNT ( * ) FROM nguoi_choi GROUP BY tay_thuan
