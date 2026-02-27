SELECT COUNT(*) FROM kien_truc_su WHERE gioi_tinh = 'Nữ'
SELECT ten, quoc_tich, id FROM kien_truc_su WHERE gioi_tinh = 'Nam' ORDER BY ten
SELECT cau.id_kien_truc_su, cau.chieu_dai_theo_met, kien_truc_su.ten FROM cau JOIN kien_truc_su ON cau.id_kien_truc_su = kien_truc_su.id ORDER BY cau.chieu_dai_theo_met DESC LIMIT 1
SELECT AVG(chieu_dai_theo_feet) FROM cau
SELECT ten, nam_xay_dung FROM nha_may WHERE loai = 'Grondzeiler'
SELECT T1.ten, T1.quoc_tich FROM kien_truc_su AS T1 JOIN nha_may AS T2 ON T1.id = T2.id_kien_truc_su GROUP BY T1.id HAVING COUNT(DISTINCT T2.id) > 0
SELECT ten FROM nha_may WHERE dia_diem != 'Donceel'
SELECT loai FROM nha_may JOIN kien_truc_su ON nha_may.id_kien_truc_su = kien_truc_su.id WHERE quoc_tich = 'Mỹ' OR quoc_tich = 'Canada' GROUP BY loai
SELECT T1.id, T1.ten FROM kien_truc_su AS T1 JOIN cau AS T2 ON T1.id = T2.id_kien_truc_su GROUP BY T1.id HAVING COUNT(*) >= 3
SELECT kien_truc_su.id, kien_truc_su.ten, kien_truc_su.quoc_tich FROM nha_may JOIN kien_truc_su ON nha_may.id_kien_truc_su = kien_truc_su.id GROUP BY kien_truc_su.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT kien_truc_su.id, kien_truc_su.ten, kien_truc_su.gioi_tinh FROM kien_truc_su JOIN cau ON kien_truc_su.id = cau.id_kien_truc_su LEFT JOIN nha_may ON kien_truc_su.id = nha_may.id_kien_truc_su GROUP BY kien_truc_su.id HAVING COUNT(DISTINCT cau.id) >= 2 OR COUNT(nha_may.id) >= 1
SELECT dia_diem FROM cau WHERE ten='Cổng vòm Kolob' OR ten='Cầu cầu vồng'
SELECT ten FROM nha_may WHERE ten LIKE '%Moulin%'
SELECT nha_may.ten FROM nha_may JOIN kien_truc_su ON nha_may.id_kien_truc_su = kien_truc_su.id JOIN cau ON cau.id_kien_truc_su = kien_truc_su.id WHERE cau.chieu_dai_theo_met > 80 GROUP BY nha_may.id HAVING COUNT(DISTINCT cau.id) > 0
SELECT loai, COUNT(*) FROM nha_may GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM kien_truc_su AS T1 WHERE T1.id NOT IN (SELECT nha_may.id_kien_truc_su FROM nha_may WHERE nha_may.nam_xay_dung < 1850)
SELECT ten FROM cau JOIN kien_truc_su ON cau.id_kien_truc_su = kien_truc_su.id WHERE quoc_tich = 'Mỹ' ORDER BY chieu_dai_theo_met ASC
SELECT dia_diem FROM rap_chieu_phim WHERE suc_chua > 800
SELECT rap_chieu_phim.dia_diem FROM rap_chieu_phim WHERE rap_chieu_phim.nam_mo_cua BETWEEN 2010 AND 2011 GROUP BY rap_chieu_phim.dia_diem HAVING COUNT(*) > 1
SELECT COUNT(*) FROM rap_chieu_phim
SELECT COUNT(*) FROM rap_chieu_phim
SELECT ten, nam_mo_cua, suc_chua FROM rap_chieu_phim
SELECT ten AS ten_rap_chieu_phim, dia_diem AS dia_diem_rap_chieu_phim FROM rap_chieu_phim WHERE suc_chua > (SELECT AVG(suc_chua) FROM rap_chieu_phim) ORDER BY suc_chua DESC LIMIT 10
SELECT rap_chieu_phim.dia_diem FROM rap_chieu_phim GROUP BY rap_chieu_phim.dia_diem HAVING COUNT(*) > 1
SELECT dia_diem FROM rap_chieu_phim GROUP BY dia_diem HAVING COUNT(DISTINCT id_rap_chieu_phim) > 1
SELECT ten, nam_mo_cua FROM rap_chieu_phim ORDER BY nam_mo_cua DESC
SELECT ten AS ten_rap_chieu_phim, dia_diem AS dia_diem_rap_chieu_phim FROM rap_chieu_phim ORDER BY suc_chua DESC LIMIT 1
SELECT AVG(suc_chua) AS suc_chua_trung_binh, MIN(suc_chua) AS suc_chua_tuoi_nhat, MAX(suc_chua) AS suc_chua_tuoi_nhat FROM rap_chieu_phim WHERE nam_mo_cua > 2011
SELECT dia_diem, COUNT(*) AS so_luong_rap FROM rap_chieu_phim GROUP BY dia_diem ORDER BY COUNT(*) DESC
SELECT rap_chieu_phim.dia_diem AS dia_diem FROM rap_chieu_phim WHERE rap_chieu_phim.nam_mo_cua >= 2010 GROUP BY rap_chieu_phim.dia_diem ORDER BY COUNT(*) DESC LIMIT 1
SELECT rap_chieu_phim.dia_diem FROM rap_chieu_phim GROUP BY rap_chieu_phim.dia_diem HAVING COUNT(*) >= 2 AND SUM(rap_chieu_phim.suc_chua) > 600
SELECT rap_chieu_phim.dia_diem FROM rap_chieu_phim GROUP BY rap_chieu_phim.dia_diem HAVING COUNT(*) >= 2 AND AVG(rap_chieu_phim.suc_chua) > 300 ORDER BY rap_chieu_phim.dia_diem
SELECT tieu_de, duoc_dao_dien_boi FROM phim
SELECT tieu_de, duoc_dao_dien_boi FROM phim
SELECT duoc_dao_dien_boi FROM phim
SELECT duoc_dao_dien_boi FROM phim GROUP BY duoc_dao_dien_boi ORDER BY duoc_dao_dien_boi ASC LIMIT 1000
SELECT duoc_dao_dien_boi, COUNT(*) FROM phim GROUP BY duoc_dao_dien_boi ORDER BY COUNT(*) DESC
SELECT lich_chieu_phim.id_rap_chieu_phim, SUM(lich_chieu_phim.so_luong_suat_chieu_moi_ngay) AS tong_suat_chieu FROM lich_chieu_phim GROUP BY lich_chieu_phim.id_rap_chieu_phim ORDER BY SUM(lich_chieu_phim.so_luong_suat_chieu_moi_ngay) DESC
SELECT phim.tieu_de, MAX(lich_chieu_phim.gia) FROM phim JOIN lich_chieu_phim ON phim.id_phim = lich_chieu_phim.id_phim GROUP BY phim.id_phim ORDER BY phim.id_phim DESC
SELECT phim.tieu_de, MAX(lich_chieu_phim.gia) FROM phim JOIN lich_chieu_phim ON phim.id_phim = lich_chieu_phim.id_phim GROUP BY phim.id_phim ORDER BY phim.tieu_de DESC LIMIT 1
SELECT rap_chieu_phim.ten, phim.tieu_de, lich_chieu_phim.ngay, lich_chieu_phim.gia FROM lich_chieu_phim JOIN rap_chieu_phim ON lich_chieu_phim.id_rap_chieu_phim = rap_chieu_phim.id_rap_chieu_phim JOIN phim ON lich_chieu_phim.id_phim = phim.id_phim
SELECT tieu_de, duoc_dao_dien_boi FROM phim WHERE id_phim NOT IN (SELECT id_phim FROM lich_chieu_phim)
SELECT duoc_dao_dien_boi FROM phim GROUP BY duoc_dao_dien_boi ORDER BY COUNT(*) DESC LIMIT 1
SELECT rap_chieu_phim.dia_diem FROM rap_chieu_phim GROUP BY rap_chieu_phim.dia_diem HAVING COUNT(*) > 1 AND AVG(rap_chieu_phim.suc_chua) > 300
SELECT rap_chieu_phim.dia_diem FROM rap_chieu_phim WHERE rap_chieu_phim.suc_chua > 300 GROUP BY rap_chieu_phim.dia_diem HAVING COUNT(rap_chieu_phim.id_rap_chieu_phim) > 1
SELECT COUNT(*) FROM phim WHERE tieu_de LIKE '%Dummy%'
SELECT COUNT(*) FROM phim WHERE tieu_de LIKE '%Dummy%'
SELECT COUNT(*) FROM khoa_hoc
SELECT COUNT(*) FROM khoa_hoc
SELECT COUNT(*) FROM khoa_hoc WHERE so_luong_tin_chi > 2
SELECT COUNT(*) FROM khoa_hoc WHERE so_luong_tin_chi > 2
SELECT ten_khoa_hoc FROM khoa_hoc WHERE so_luong_tin_chi = 1
SELECT ten_khoa_hoc FROM khoa_hoc WHERE so_luong_tin_chi = 1
SELECT id_khoa_hoc FROM khoa_hoc WHERE ngay LIKE 'MTW%'
SELECT ten_khoa_hoc FROM khoa_hoc WHERE ngay LIKE 'MTW'
SELECT COUNT(*) FROM khoa WHERE bo_phan = 'AS'
SELECT COUNT(*) FROM khoa WHERE bo_phan = 'AS'
SELECT so_dien_thoai_khoa FROM khoa WHERE phong = '268'
SELECT so_dien_thoai_khoa FROM khoa WHERE phong = '268'
SELECT COUNT(DISTINCT dang_ky_khoa_hoc.id_sinh_vien) FROM dang_ky_khoa_hoc JOIN chuyen_doi_diem ON dang_ky_khoa_hoc.diem = chuyen_doi_diem.bang_diem WHERE chuyen_doi_diem.diem_so = 3
SELECT COUNT(DISTINCT sinh_vien.id_sinh_vien) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien JOIN chuyen_doi_diem ON dang_ky_khoa_hoc.diem = chuyen_doi_diem.bang_diem WHERE chuyen_doi_diem.diem_so = 3.0
SELECT MAX(diem_so) AS diem_cao_nhat, MIN(diem_so) AS diem_thap_nhat FROM chuyen_doi_diem
SELECT MAX(diem_so) AS diem_cao_nhat, MIN(diem_so) AS diem_thap_nhat FROM chuyen_doi_diem
SELECT ten FROM sinh_vien WHERE ten LIKE '%a%'
SELECT ten FROM sinh_vien WHERE ho LIKE '%a%'
SELECT ho, ten FROM giang_vien WHERE gioi_tinh = 'nam' AND toa_nha = 'NEB'
SELECT ho || ' ' || ten AS ten_day_du FROM giang_vien WHERE gioi_tinh = 'Nam' AND toa_nha = 'NEB'
SELECT giang_vien.phong FROM giang_vien JOIN la_thanh_vien_cua ON giang_vien.id_giang_vien = la_thanh_vien_cua.id_giang_vien JOIN khoa ON la_thanh_vien_cua.ma_so_khoa = khoa.ma_so_khoa WHERE giang_vien.ngach = 'Giáo sư' AND khoa.toa_nha = 'NEB'
SELECT giang_vien.ten FROM giang_vien JOIN la_thanh_vien_cua ON giang_vien.id_giang_vien = la_thanh_vien_cua.id_giang_vien JOIN khoa ON la_thanh_vien_cua.ma_so_khoa = khoa.ma_so_khoa WHERE giang_vien.ngach = 'Giáo sư' AND khoa.toa_nha = 'NEB' AND khoa.phong IS NOT NULL
SELECT ten_khoa FROM khoa WHERE toa_nha = 'Mergenthaler'
SELECT ten_khoa FROM khoa WHERE toa_nha = 'Mergenthaler'
SELECT id_khoa_hoc, ten_khoa_hoc, so_luong_tin_chi FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT id_khoa_hoc, so_luong_tin_chi FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT ten_khoa_hoc FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT ten_khoa_hoc FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT ten FROM sinh_vien ORDER BY tuoi DESC
SELECT ten FROM sinh_vien ORDER BY tuoi DESC
SELECT ho FROM sinh_vien WHERE gioi_tinh = 'F' ORDER BY tuoi DESC
SELECT ho FROM sinh_vien WHERE gioi_tinh = 'Nữ' ORDER BY tuoi DESC
SELECT ho FROM giang_vien WHERE toa_nha = 'Barton' ORDER BY ho ASC
SELECT ho FROM giang_vien WHERE toa_nha = 'Barton' ORDER BY ho ASC
SELECT ten FROM giang_vien ORDER BY ten ASC
SELECT ten FROM giang_vien WHERE ngach = 'Giáo sư' ORDER BY ten ASC
SELECT khoa.ten_khoa FROM chuyen_nganh_phu JOIN khoa ON chuyen_nganh_phu.ma_so_khoa = khoa.ma_so_khoa GROUP BY khoa.ma_so_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_khoa FROM khoa AS T1 JOIN chuyen_nganh_phu AS T2 ON T1.ma_so_khoa = T2.ma_so_khoa GROUP BY T1.ma_so_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khoa FROM khoa WHERE ma_so_khoa NOT IN (SELECT ma_so_khoa FROM chuyen_nganh_phu)
SELECT ten_khoa FROM khoa EXCEPT SELECT khoa.ten_khoa FROM khoa JOIN chuyen_nganh_phu ON khoa.ma_so_khoa = chuyen_nganh_phu.ma_so_khoa
SELECT ten_khoa FROM khoa JOIN la_thanh_vien_cua ON khoa.ma_so_khoa = la_thanh_vien_cua.ma_so_khoa GROUP BY khoa.ma_so_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT ten_khoa FROM khoa JOIN la_thanh_vien_cua ON khoa.ma_so_khoa = la_thanh_vien_cua.ma_so_khoa GROUP BY khoa.ma_so_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT ngach FROM giang_vien GROUP BY ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT ngach FROM giang_vien GROUP BY ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT giang_vien.ho, giang_vien.ten FROM giang_vien JOIN khoa_hoc ON giang_vien.id_giang_vien = khoa_hoc.nguoi_huong_dan GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 3
SELECT T1.ho || ' ' || T1.ten AS ten_day_du, COUNT(*) AS so_khoa_hoc FROM giang_vien AS T1 JOIN khoa_hoc AS T2 ON T1.id_giang_vien = T2.nguoi_huong_dan GROUP BY T1.id_giang_vien ORDER BY so_khoa_hoc DESC LIMIT 3
SELECT giang_vien.toa_nha FROM giang_vien JOIN khoa_hoc ON giang_vien.id_giang_vien = khoa_hoc.nguoi_huong_dan GROUP BY giang_vien.id_giang_vien, giang_vien.toa_nha ORDER BY COUNT(*) DESC LIMIT 1
SELECT khoa.toa_nha FROM khoa_hoc JOIN giang_vien ON khoa_hoc.nguoi_huong_dan = giang_vien.id_giang_vien JOIN khoa ON khoa_hoc.ma_so_khoa = khoa.ma_so_khoa GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khoa_hoc FROM khoa_hoc JOIN dang_ky_khoa_hoc ON khoa_hoc.id_khoa_hoc = dang_ky_khoa_hoc.ma_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc HAVING COUNT(*) >= 5
SELECT ten_khoa_hoc FROM khoa_hoc JOIN dang_ky_khoa_hoc ON khoa_hoc.id_khoa_hoc = dang_ky_khoa_hoc.ma_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc HAVING COUNT(*) >= 5 ORDER BY ten_khoa_hoc
SELECT giang_vien.ho, giang_vien.ten FROM khoa_hoc JOIN giang_vien ON khoa_hoc.nguoi_huong_dan = giang_vien.id_giang_vien WHERE khoa_hoc.ten_khoa_hoc = ' Kỹ năng máy tính '
SELECT giang_vien.ho, giang_vien.ten FROM giang_vien JOIN khoa_hoc ON giang_vien.id_giang_vien = khoa_hoc.nguoi_huong_dan WHERE ten_khoa_hoc = ' Kỹ năng máy tính '
SELECT khoa_hoc.ma_so_khoa, khoa.phong FROM khoa_hoc JOIN khoa ON khoa_hoc.ma_so_khoa = khoa.ma_so_khoa WHERE khoa_hoc.ten_khoa_hoc = 'Giới thiệu về khoa học máy tính'
SELECT khoa.ten_khoa, khoa.phong FROM khoa_hoc JOIN khoa ON khoa_hoc.ma_so_khoa = khoa.ma_so_khoa WHERE khoa_hoc.ten_khoa_hoc = 'Giới thiệu về khoa học máy tính'
SELECT sinh_vien.ho || ' ' || sinh_vien.ten AS ten_sinh_vien, chuyen_doi_diem.diem_so FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien JOIN chuyen_doi_diem ON dang_ky_khoa_hoc.diem = chuyen_doi_diem.bang_diem
SELECT sinh_vien.ho || ' ' || sinh_vien.ten AS ten_day_du, chuyen_doi_diem.diem_so FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien JOIN chuyen_doi_diem ON dang_ky_khoa_hoc.diem = chuyen_doi_diem.bang_diem
SELECT sinh_vien.ten FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien JOIN chuyen_doi_diem ON dang_ky_khoa_hoc.diem = chuyen_doi_diem.bang_diem WHERE chuyen_doi_diem.diem_so > 3.8 GROUP BY sinh_vien.id_sinh_vien HAVING COUNT(*) >= 1 ORDER BY sinh_vien.ten ASC LIMIT 1000
SELECT sinh_vien.ten FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien JOIN chuyen_doi_diem ON dang_ky_khoa_hoc.diem = chuyen_doi_diem.bang_diem WHERE chuyen_doi_diem.diem_so > 3.8 GROUP BY sinh_vien.id_sinh_vien HAVING COUNT(*) >= 1 ORDER BY sinh_vien.ten ASC
SELECT T1.ho || ' ' || T1.ten AS ten_day_du FROM giang_vien AS T1 JOIN la_thanh_vien_cua AS T2 ON T1.id_giang_vien = T2.id_giang_vien WHERE T2.ma_so_khoa = 520
SELECT T1.ho || ' ' || T1.ten AS ten_day_du FROM giang_vien AS T1 JOIN la_thanh_vien_cua AS T2 ON T1.id_giang_vien = T2.id_giang_vien WHERE T2.ma_so_khoa = 520
SELECT sinh_vien.ho, sinh_vien.ten FROM sinh_vien JOIN chuyen_nganh_phu ON sinh_vien.id_sinh_vien = chuyen_nganh_phu.id_sinh_vien JOIN khoa ON chuyen_nganh_phu.ma_so_khoa = khoa.ma_so_khoa WHERE khoa.ma_so_khoa = '140'
SELECT sinh_vien.ho, sinh_vien.ten FROM sinh_vien JOIN chuyen_nganh_phu ON sinh_vien.id_sinh_vien = chuyen_nganh_phu.id_sinh_vien JOIN khoa ON chuyen_nganh_phu.ma_so_khoa = khoa.ma_so_khoa WHERE khoa.ma_so_khoa = '140'
SELECT ten FROM giang_vien JOIN la_thanh_vien_cua ON giang_vien.id_giang_vien = la_thanh_vien_cua.id_giang_vien JOIN khoa ON la_thanh_vien_cua.ma_so_khoa = khoa.ma_so_khoa WHERE khoa.ten_khoa = 'Khoa học máy tính' AND giang_vien.ho = 'G'
SELECT giang_vien.ho FROM giang_vien JOIN la_thanh_vien_cua ON giang_vien.id_giang_vien = la_thanh_vien_cua.id_giang_vien JOIN khoa ON la_thanh_vien_cua.ma_so_khoa = khoa.ma_so_khoa WHERE khoa.ten_khoa = 'Khoa học máy tính'
SELECT AVG(chuyen_doi_diem.diem_so) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien JOIN chuyen_doi_diem ON dang_ky_khoa_hoc.diem = chuyen_doi_diem.bang_diem WHERE sinh_vien.ho = 'Smith'
SELECT AVG(diem) FROM dang_ky_khoa_hoc JOIN sinh_vien ON dang_ky_khoa_hoc.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Smith'
SELECT MAX(diem), MIN(diem) FROM dang_ky_khoa_hoc JOIN sinh_vien ON dang_ky_khoa_hoc.id_sinh_vien = sinh_vien.id_sinh_vien WHERE ma_thanh_pho = 'NYC'
SELECT MAX(diem) AS cao_nhat, MIN(diem) AS thap_nhat FROM dang_ky_khoa_hoc JOIN sinh_vien ON dang_ky_khoa_hoc.id_sinh_vien = sinh_vien.id_sinh_vien WHERE ma_thanh_pho = 'NYC'
SELECT ten_khoa_hoc FROM khoa_hoc WHERE (so_luong_tin_chi = 3 OR so_luong_tin_chi = 1) AND gio = '4'
SELECT ten_khoa_hoc FROM khoa_hoc WHERE (so_luong_tin_chi = 3 OR so_luong_tin_chi = 1) AND gio = '4'
SELECT ten_khoa FROM khoa WHERE bo_phan IN ('AS', 'EN') AND toa_nha = 'NEB'
SELECT ten_khoa FROM khoa WHERE bo_phan IN ('AS', 'EN') AND toa_nha = 'NEB'
SELECT ten FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM dang_ky_khoa_hoc)
SELECT ten FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM dang_ky_khoa_hoc)
SELECT COUNT(*) FROM ca_si
SELECT COUNT(*) FROM ca_si
SELECT ten, quoc_gia, tuoi FROM ca_si ORDER BY tuoi DESC
SELECT ten, quoc_gia, tuoi FROM ca_si ORDER BY tuoi DESC
SELECT AVG(tuoi) AS tuoi_trung_binh, MAX(tuoi) AS tuoi_gia_nhat, MIN(tuoi) AS tuoi_tre_nhat FROM ca_si WHERE quoc_gia = 'Pháp'
SELECT AVG(tuoi) FROM ca_si WHERE quoc_gia = 'Pháp' SELECT tuoi FROM ca_si WHERE quoc_gia = 'Pháp' ORDER BY tuoi DESC LIMIT 1 SELECT tuoi FROM ca_si WHERE quoc_gia = 'Pháp' ORDER BY tuoi ASC LIMIT 1
SELECT ten_bai_hat, nam_phat_hanh_bai_hat FROM ca_si ORDER BY tuoi ASC LIMIT 1
SELECT ten_bai_hat, nam_phat_hanh_bai_hat FROM ca_si ORDER BY tuoi ASC LIMIT 1
SELECT quoc_gia FROM ca_si WHERE tuoi > 20 GROUP BY quoc_gia
SELECT quoc_gia FROM ca_si WHERE tuoi > 20 GROUP BY quoc_gia
SELECT quoc_gia, COUNT(*) FROM ca_si GROUP BY quoc_gia
SELECT quoc_gia, COUNT(*) FROM ca_si GROUP BY quoc_gia
SELECT ten_bai_hat FROM ca_si WHERE tuoi > (SELECT AVG(tuoi) FROM ca_si)
SELECT ten_bai_hat FROM ca_si WHERE tuoi > (SELECT AVG(tuoi) FROM ca_si) ORDER BY ten_bai_hat ASC LIMIT 1000000000
SELECT dia_diem, ten FROM san_van_dong WHERE suc_chua BETWEEN 5000 AND 10000
SELECT ten, dia_diem FROM san_van_dong WHERE suc_chua BETWEEN 5000 AND 10000
SELECT AVG(suc_chua) AS suc_chua_trung_binh, MAX(cao_nhat) AS suc_chua_toida FROM san_van_dong
SELECT AVG(suc_chua) AS suc_chua_trung_binh, MAX(cao_nhat) AS suc_chua_toida FROM san_van_dong
SELECT ten, suc_chua FROM san_van_dong ORDER BY so_luong_tham_gia_trung_binh DESC LIMIT 1
SELECT ten, suc_chua FROM san_van_dong ORDER BY so_luong_tham_gia_trung_binh DESC LIMIT 1
SELECT COUNT(*) FROM buoi_hoa_nhac WHERE nam = '2014' OR nam = '2015'
SELECT COUNT(*) FROM buoi_hoa_nhac WHERE nam = '2014' OR nam = '2015'
SELECT san_van_dong.ten, COUNT(buoi_hoa_nhac.id_buoi_hoa_nhac) FROM san_van_dong JOIN buoi_hoa_nhac ON san_van_dong.id_san_van_dong = buoi_hoa_nhac.id_san_van_dong GROUP BY san_van_dong.id_san_van_dong ORDER BY COUNT(buoi_hoa_nhac.id_buoi_hoa_nhac) DESC
SELECT buoi_hoa_nhac.id_san_van_dong, COUNT(*) FROM buoi_hoa_nhac JOIN san_van_dong ON buoi_hoa_nhac.id_san_van_dong = san_van_dong.id_san_van_dong GROUP BY buoi_hoa_nhac.id_san_van_dong
SELECT san_van_dong.ten, san_van_dong.suc_chua FROM buoi_hoa_nhac JOIN san_van_dong ON buoi_hoa_nhac.id_san_van_dong = san_van_dong.id_san_van_dong WHERE buoi_hoa_nhac.nam >= '2014' GROUP BY san_van_dong.id_san_van_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_van_dong.ten, san_van_dong.suc_chua FROM buoi_hoa_nhac JOIN san_van_dong ON buoi_hoa_nhac.id_san_van_dong = san_van_dong.id_san_van_dong WHERE buoi_hoa_nhac.nam > '2013' GROUP BY san_van_dong.id_san_van_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT nam FROM buoi_hoa_nhac GROUP BY nam ORDER BY COUNT(*) DESC LIMIT 1
SELECT nam FROM buoi_hoa_nhac GROUP BY nam ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM san_van_dong WHERE id_san_van_dong NOT IN (SELECT id_san_van_dong FROM buoi_hoa_nhac)
SELECT ten FROM san_van_dong WHERE id_san_van_dong NOT IN (SELECT id_san_van_dong FROM buoi_hoa_nhac)
SELECT ca_si.quoc_gia FROM ca_si WHERE ca_si.tuoi > 40 INTERSECT SELECT ca_si.quoc_gia FROM ca_si WHERE ca_si.tuoi < 30
SELECT ten FROM san_van_dong WHERE id_san_van_dong NOT IN (SELECT id_san_van_dong FROM buoi_hoa_nhac WHERE nam = '2014')
SELECT ten FROM san_van_dong WHERE id_san_van_dong NOT IN (SELECT id_san_van_dong FROM buoi_hoa_nhac WHERE nam = '2014')
SELECT buoi_hoa_nhac.ten_buoi_hoa_nhac, buoi_hoa_nhac.chu_de, COUNT(ca_si_trong_buoi_hoa_nhac.id_ca_si) AS so_luong_ca_si FROM buoi_hoa_nhac JOIN ca_si_trong_buoi_hoa_nhac ON buoi_hoa_nhac.id_buoi_hoa_nhac = ca_si_trong_buoi_hoa_nhac.id_buoi_hoa_nhac GROUP BY buoi_hoa_nhac.id_buoi_hoa_nhac ORDER BY COUNT(ca_si_trong_buoi_hoa_nhac.id_ca_si) DESC
SELECT buoi_hoa_nhac.ten_buoi_hoa_nhac, buoi_hoa_nhac.chu_de, COUNT(ca_si_trong_buoi_hoa_nhac.id_ca_si) FROM buoi_hoa_nhac JOIN ca_si_trong_buoi_hoa_nhac ON buoi_hoa_nhac.id_buoi_hoa_nhac = ca_si_trong_buoi_hoa_nhac.id_buoi_hoa_nhac GROUP BY buoi_hoa_nhac.id_buoi_hoa_nhac ORDER BY COUNT(ca_si_trong_buoi_hoa_nhac.id_ca_si) DESC
SELECT ca_si.ten, COUNT(*) AS so_luong_buoi_hoa_nhac FROM ca_si JOIN ca_si_trong_buoi_hoa_nhac ON ca_si.id_ca_si = ca_si_trong_buoi_hoa_nhac.id_ca_si GROUP BY ca_si.id_ca_si ORDER BY COUNT(*) DESC
SELECT ca_si.ten, COUNT(*) AS so_luong_buoi_hoa_nhac FROM ca_si JOIN ca_si_trong_buoi_hoa_nhac ON ca_si.id_ca_si = ca_si_trong_buoi_hoa_nhac.id_ca_si GROUP BY ca_si.id_ca_si ORDER BY COUNT(*) DESC
SELECT ca_si.ten FROM ca_si JOIN ca_si_trong_buoi_hoa_nhac ON ca_si.id_ca_si = ca_si_trong_buoi_hoa_nhac.id_ca_si JOIN buoi_hoa_nhac ON ca_si_trong_buoi_hoa_nhac.id_buoi_hoa_nhac = buoi_hoa_nhac.id_buoi_hoa_nhac WHERE buoi_hoa_nhac.nam = '2014'
SELECT ten FROM ca_si JOIN ca_si_trong_buoi_hoa_nhac ON ca_si.id_ca_si = ca_si_trong_buoi_hoa_nhac.id_ca_si JOIN buoi_hoa_nhac ON ca_si_trong_buoi_hoa_nhac.id_buoi_hoa_nhac = buoi_hoa_nhac.id_buoi_hoa_nhac WHERE nam = '2014' GROUP BY ca_si.id_ca_si HAVING COUNT(DISTINCT buoi_hoa_nhac.id_buoi_hoa_nhac) > 0
SELECT ca_si.ten, ca_si.quoc_gia FROM ca_si WHERE ca_si.ten_bai_hat LIKE '%Hey%'
SELECT ten, quoc_gia FROM ca_si WHERE ten_bai_hat LIKE '%Hey%'
SELECT san_van_dong.ten, san_van_dong.dia_diem FROM san_van_dong JOIN buoi_hoa_nhac ON san_van_dong.id_san_van_dong = buoi_hoa_nhac.id_san_van_dong WHERE buoi_hoa_nhac.nam = '2014' OR buoi_hoa_nhac.nam = '2015' GROUP BY san_van_dong.id_san_van_dong HAVING COUNT(DISTINCT buoi_hoa_nhac.id_buoi_hoa_nhac) >= 2
SELECT san_van_dong.ten, san_van_dong.dia_diem FROM san_van_dong JOIN buoi_hoa_nhac ON san_van_dong.id_san_van_dong = buoi_hoa_nhac.id_san_van_dong WHERE buoi_hoa_nhac.nam = '2014' INTERSECT SELECT san_van_dong.ten, san_van_dong.dia_diem FROM san_van_dong JOIN buoi_hoa_nhac ON san_van_dong.id_san_van_dong = buoi_hoa_nhac.id_san_van_dong WHERE buoi_hoa_nhac.nam = '2015'
SELECT COUNT(*) FROM buoi_hoa_nhac JOIN san_van_dong ON buoi_hoa_nhac.id_san_van_dong = san_van_dong.id_san_van_dong ORDER BY san_van_dong.suc_chua DESC LIMIT 1
SELECT COUNT(*) FROM buoi_hoa_nhac JOIN san_van_dong ON buoi_hoa_nhac.id_san_van_dong = san_van_dong.id_san_van_dong WHERE san_van_dong.suc_chua = (SELECT MAX(suc_chua) FROM san_van_dong)
SELECT COUNT(*) FROM khu_nha
SELECT DISTINCT mau_cua_khu_nha FROM khu_nha ORDER BY mau_cua_khu_nha DESC LIMIT 10
SELECT chi_tiet_khu_nha, mau_cua_khu_nha FROM khu_nha ORDER BY mau_cua_khu_nha
SELECT mau_cua_khu_nha, COUNT(*) FROM khu_nha GROUP BY mau_cua_khu_nha ORDER BY COUNT(*) DESC
SELECT danh_muc_san_pham, COUNT(*) FROM chien_dich_gui_thu_quang_cao GROUP BY danh_muc_san_pham ORDER BY COUNT(*) DESC
SELECT ten_khach_hang, so_dien_thoai_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM thu_quang_cao_gui_khach_hang)
SELECT ten_khach_hang, so_dien_thoai_khach_hang FROM khach_hang JOIN thu_quang_cao_gui_khach_hang ON khach_hang.id_khach_hang = thu_quang_cao_gui_khach_hang.id_khach_hang WHERE ma_ket_qua = 'Không phản hồi'
SELECT thu_quang_cao_gui_khach_hang.ma_ket_qua, COUNT(*) AS so_luong_thu_quang_cao FROM thu_quang_cao_gui_khach_hang GROUP BY thu_quang_cao_gui_khach_hang.ma_ket_qua
SELECT ten_khach_hang FROM khach_hang WHERE id_khach_hang IN (SELECT id_khach_hang FROM thu_quang_cao_gui_khach_hang WHERE ma_ket_qua = 'Đặt hàng' GROUP BY id_khach_hang HAVING COUNT(*) >= 2)
SELECT ten_khach_hang FROM khach_hang JOIN thu_quang_cao_gui_khach_hang ON khach_hang.id_khach_hang = thu_quang_cao_gui_khach_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khach_hang, phuong_thuc_thanh_toan FROM khach_hang WHERE id_khach_hang IN (SELECT id_khach_hang FROM thu_quang_cao_gui_khach_hang WHERE ma_ket_qua = 'Đặt hàng') EXCEPT SELECT ten_khach_hang, phuong_thuc_thanh_toan FROM khach_hang WHERE id_khach_hang IN (SELECT id_khach_hang FROM thu_quang_cao_gui_khach_hang WHERE ma_ket_qua = 'Thất bại')
SELECT khu_nha.mau_cua_khu_nha, dia_chi_khach_hang.ma_loai_dia_chi FROM khu_nha JOIN dia_chi_khach_hang ON khu_nha.id_khu_nha = dia_chi_khach_hang.id_khu_nha JOIN khach_hang ON dia_chi_khach_hang.id_khach_hang = khach_hang.id_khach_hang
SELECT DISTINCT dia_chi_khach_hang.ma_loai_dia_chi FROM dia_chi_khach_hang
SELECT phi_van_chuyen_don_hang, id_khach_hang FROM luot_dat_hang_cua_khach_hang WHERE ma_trang_thai_don_hang='Bị huỷ' OR ma_trang_thai_don_hang='Đã thanh toán tiền'
SELECT khach_hang.ten_khach_hang FROM khach_hang JOIN luot_dat_hang_cua_khach_hang ON khach_hang.id_khach_hang = luot_dat_hang_cua_khach_hang.id_khach_hang WHERE luot_dat_hang_cua_khach_hang.ma_phuong_thuc_van_chuyen = 'FedEx' AND luot_dat_hang_cua_khach_hang.ma_trang_thai_don_hang = 'Đã được thanh toán'
SELECT COUNT(*) FROM tai_khoan
SELECT COUNT(*) FROM tai_khoan
SELECT id_tai_khoan, id_khach_hang, ten_tai_khoan FROM tai_khoan
SELECT id_tai_khoan, id_khach_hang, ten_tai_khoan FROM tai_khoan
SELECT chi_tiet_khac_ve_tai_khoan FROM tai_khoan WHERE ten_tai_khoan = '338'
SELECT chi_tiet_khac_ve_tai_khoan FROM tai_khoan WHERE ten_tai_khoan = '338'
SELECT khach_hang.ten_cua_khach_hang, khach_hang.ho_cua_khach_hang, khach_hang.so_dien_thoai_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang WHERE tai_khoan.ten_tai_khoan = '162'
SELECT khach_hang.ho_cua_khach_hang, khach_hang.ten_cua_khach_hang, khach_hang.so_dien_thoai_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang WHERE tai_khoan.ten_tai_khoan = '162'
SELECT COUNT(*) FROM tai_khoan AS T1 JOIN khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.ten_cua_khach_hang = 'Art' AND T2.ho_cua_khach_hang = 'Turcotte'
SELECT COUNT(*) FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Art' AND khach_hang.ho_cua_khach_hang = 'Turcotte'
SELECT tai_khoan.id_tai_khoan, COUNT(*) FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang GROUP BY tai_khoan.id_khach_hang ORDER BY COUNT(*) DESC
SELECT id_khach_hang, COUNT(*) FROM tai_khoan GROUP BY id_khach_hang
SELECT id_khach_hang, COUNT(*) AS so_luong_tai_khoan FROM tai_khoan GROUP BY id_khach_hang ORDER BY so_luong_tai_khoan DESC LIMIT 1
SELECT id_khach_hang, COUNT(*) FROM tai_khoan GROUP BY id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.ten_cua_khach_hang, khach_hang.ho_cua_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) ASC LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.ho_cua_khach_hang, khach_hang.ten_cua_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT ho_cua_khach_hang, ten_cua_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT khach_hang.ho_cua_khach_hang || ' ' || khach_hang.ten_cua_khach_hang AS ten_day_du FROM khach_hang LEFT JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang WHERE tai_khoan.id_khach_hang IS NULL
SELECT khach_hang.ho_cua_khach_hang, khach_hang.ten_cua_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang
SELECT khach_hang.ho_cua_khach_hang, khach_hang.ten_cua_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang
SELECT COUNT(DISTINCT tai_khoan.id_khach_hang) FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang
SELECT COUNT(DISTINCT tai_khoan.id_khach_hang) FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang
SELECT COUNT(*) FROM khach_hang
SELECT COUNT(*) FROM khach_hang
SELECT id_khach_hang, ten_cua_khach_hang, ho_cua_khach_hang, so_dien_thoai_khach_hang FROM khach_hang
SELECT khach_hang.id_khach_hang, khach_hang.ho_cua_khach_hang, khach_hang.ten_cua_khach_hang, khach_hang.so_dien_thoai_khach_hang FROM khach_hang
SELECT so_dien_thoai_khach_hang, email_cua_khach_hang FROM khach_hang WHERE ten_cua_khach_hang = 'Aniyah' AND ho_cua_khach_hang = 'Feest'
SELECT so_dien_thoai_khach_hang, email_cua_khach_hang FROM khach_hang WHERE ten_cua_khach_hang = 'Aniyah' AND ho_cua_khach_hang = 'Feest'
SELECT COUNT(*) FROM the_khach_hang
SELECT COUNT(*) FROM the_khach_hang
SELECT id_the, id_khach_hang, ma_loai_the, so_the FROM the_khach_hang
SELECT id_the, id_khach_hang, ma_loai_the, so_the FROM the_khach_hang
SELECT hop_le_tu_ngay, hop_le_den_ngay FROM the_khach_hang WHERE so_the = '4560596484842'
SELECT hop_le_tu_ngay, hop_le_den_ngay FROM the_khach_hang WHERE so_the = '4560596484842'
SELECT khach_hang.ten_cua_khach_hang, khach_hang.ho_cua_khach_hang, khach_hang.so_dien_thoai_khach_hang FROM khach_hang JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang WHERE the_khach_hang.so_the = '4560596484842'
SELECT khach_hang.ho_cua_khach_hang, khach_hang.ten_cua_khach_hang, khach_hang.so_dien_thoai_khach_hang FROM khach_hang JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang WHERE the_khach_hang.so_the = '4560596484842'
SELECT COUNT(*) FROM the_khach_hang WHERE id_khach_hang = (SELECT id_khach_hang FROM khach_hang WHERE ten_cua_khach_hang = 'Art' AND ho_cua_khach_hang = 'Turcotte')
SELECT COUNT(*) FROM the_khach_hang JOIN khach_hang ON the_khach_hang.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Art' AND khach_hang.ho_cua_khach_hang = 'Turcotte'
SELECT COUNT(*) FROM the_khach_hang WHERE ma_loai_the = 'Ghi no'
SELECT COUNT(*) FROM the_khach_hang WHERE ma_loai_the = 'Ghi no'
SELECT COUNT(*) FROM the_khach_hang WHERE id_khach_hang = (SELECT id_khach_hang FROM khach_hang WHERE ten_cua_khach_hang = 'Blanche' AND ho_cua_khach_hang = 'Huels')
SELECT COUNT(*) FROM the_khach_hang JOIN khach_hang ON the_khach_hang.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Blanche' AND khach_hang.ho_cua_khach_hang = 'Huels'
SELECT khach_hang.id_khach_hang AS id, COUNT(*) AS so_luong_the FROM the_khach_hang JOIN khach_hang ON the_khach_hang.id_khach_hang = khach_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC
SELECT khach_hang.id_khach_hang, COUNT(the_khach_hang.id_the) FROM khach_hang LEFT JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang
SELECT id_khach_hang, COUNT(*) AS so_the FROM the_khach_hang GROUP BY id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM the_khach_hang GROUP BY id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.ten_cua_khach_hang, khach_hang.ho_cua_khach_hang FROM khach_hang JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang HAVING COUNT(*) >= 2
SELECT kh.id_khach_hang, kh.ho_cua_khach_hang, kh.ten_cua_khach_hang FROM khach_hang AS kh JOIN the_khach_hang AS tk ON kh.id_khach_hang = tk.id_khach_hang GROUP BY kh.id_khach_hang HAVING COUNT(tk.id_the) >= 2
SELECT khach_hang.id_khach_hang, khach_hang.ho_cua_khach_hang, khach_hang.ten_cua_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) ASC LIMIT 1
SELECT kh.id_khach_hang AS id, kh.ho_cua_khach_hang AS ho, kh.ten_cua_khach_hang AS ten FROM khach_hang AS kh JOIN tai_khoan AS tk ON kh.id_khach_hang = tk.id_khach_hang GROUP BY kh.id_khach_hang ORDER BY COUNT(tk.id_tai_khoan) ASC LIMIT 1
SELECT ma_loai_the, COUNT(*) FROM the_khach_hang GROUP BY ma_loai_the ORDER BY COUNT(*) DESC
SELECT ma_loai_the, COUNT(*) FROM the_khach_hang GROUP BY ma_loai_the ORDER BY COUNT(*) DESC
SELECT ma_loai_the FROM the_khach_hang GROUP BY ma_loai_the ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_the FROM the_khach_hang GROUP BY ma_loai_the ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_the FROM the_khach_hang GROUP BY ma_loai_the HAVING COUNT(*) >= 5
SELECT ma_loai_the FROM the_khach_hang GROUP BY ma_loai_the HAVING COUNT(*) >= 5
SELECT ma_loai_the, COUNT(*) FROM the_khach_hang GROUP BY ma_loai_the ORDER BY COUNT(*) DESC
SELECT ma_loai_the, COUNT(*) FROM the_khach_hang GROUP BY ma_loai_the ORDER BY COUNT(*) DESC
SELECT id_khach_hang, ten_cua_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM the_khach_hang)
SELECT khach_hang.id_khach_hang, khach_hang.ten_cua_khach_hang FROM khach_hang WHERE khach_hang.id_khach_hang NOT IN (SELECT id_khach_hang FROM the_khach_hang)
SELECT ma_loai_the FROM the_khach_hang
SELECT ma_loai_the FROM the_khach_hang GROUP BY ma_loai_the
SELECT COUNT(DISTINCT ma_loai_the) FROM the_khach_hang
SELECT COUNT(DISTINCT ma_loai_the) FROM the_khach_hang
SELECT DISTINCT loai_giao_dich FROM giao_dich_tai_chinh
SELECT DISTINCT loai_giao_dich FROM giao_dich_tai_chinh
SELECT loai_giao_dich, COUNT(*) FROM giao_dich_tai_chinh GROUP BY loai_giao_dich ORDER BY COUNT(*) DESC
SELECT COUNT(DISTINCT loai_giao_dich) FROM giao_dich_tai_chinh
SELECT SUM(so_tien_giao_dich), AVG(so_tien_giao_dich) FROM giao_dich_tai_chinh
SELECT AVG(so_tien_giao_dich), SUM(so_tien_giao_dich) FROM giao_dich_tai_chinh
SELECT ma_loai_the, COUNT(*) FROM the_khach_hang GROUP BY ma_loai_the ORDER BY COUNT(*) DESC
SELECT ma_loai_the, COUNT(*) FROM the_khach_hang GROUP BY ma_loai_the ORDER BY COUNT(*) DESC
SELECT loai_giao_dich, COUNT(*) FROM giao_dich_tai_chinh GROUP BY loai_giao_dich ORDER BY COUNT(*) DESC
SELECT loai_giao_dich, COUNT(*) FROM giao_dich_tai_chinh GROUP BY loai_giao_dich ORDER BY COUNT(*) DESC
SELECT loai_giao_dich FROM giao_dich_tai_chinh GROUP BY loai_giao_dich ORDER BY SUM(so_tien_giao_dich) DESC LIMIT 1
SELECT loai_giao_dich FROM giao_dich_tai_chinh ORDER BY so_tien_giao_dich DESC LIMIT 1
SELECT tai_khoan.id_tai_khoan, COUNT(*) FROM tai_khoan JOIN giao_dich_tai_chinh ON tai_khoan.id_tai_khoan = giao_dich_tai_chinh.id_tai_khoan GROUP BY tai_khoan.id_tai_khoan ORDER BY COUNT(*) DESC
SELECT giao_dich_tai_chinh.id_tai_khoan, COUNT(*) AS so_luong_giao_dich FROM giao_dich_tai_chinh GROUP BY giao_dich_tai_chinh.id_tai_khoan
SELECT ten_tai_lieu, so_luong_truy_cap FROM tai_lieu ORDER BY ten_tai_lieu ASC
SELECT ten_tai_lieu, so_luong_truy_cap FROM tai_lieu ORDER BY ten_tai_lieu ASC
SELECT ten_tai_lieu, so_luong_truy_cap FROM tai_lieu ORDER BY so_luong_truy_cap DESC LIMIT 1
SELECT ten_tai_lieu, so_luong_truy_cap FROM tai_lieu ORDER BY so_luong_truy_cap DESC LIMIT 1
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING COUNT(*) > 4
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING COUNT(*) > 4
SELECT ma_loai_tai_lieu, COUNT(*) AS so_luong_truy_cap FROM tai_lieu GROUP BY ma_loai_tai_lieu ORDER BY so_luong_truy_cap DESC LIMIT 1
SELECT SUM(so_luong_truy_cap) FROM tai_lieu JOIN (SELECT ma_loai_tai_lieu, COUNT(*) AS count FROM tai_lieu GROUP BY ma_loai_tai_lieu ORDER BY count DESC LIMIT 1) AS T1 ON tai_lieu.ma_loai_tai_lieu = T1.ma_loai_tai_lieu
SELECT AVG(so_luong_truy_cap) FROM tai_lieu
SELECT SUM(so_luong_truy_cap) / COUNT(*) FROM tai_lieu
SELECT ma_cau_truc_tai_lieu FROM tai_lieu ORDER BY so_luong_truy_cap ASC LIMIT 1
SELECT cau_truc_tai_lieu.mo_ta_ve_cau_truc_tai_lieu FROM tai_lieu JOIN cau_truc_tai_lieu ON tai_lieu.ma_cau_truc_tai_lieu = cau_truc_tai_lieu.ma_cau_truc_tai_lieu ORDER BY tai_lieu.so_luong_truy_cap ASC LIMIT 1
SELECT ma_loai_tai_lieu FROM tai_lieu WHERE ten_tai_lieu = 'David CV'
SELECT ma_loai_tai_lieu FROM tai_lieu WHERE ten_tai_lieu = 'David CV'
SELECT tai_lieu.ma_tai_lieu, tai_lieu.ten_tai_lieu, tai_lieu.ma_loai_tai_lieu, tai_lieu.ma_cau_truc_tai_lieu FROM tai_lieu JOIN (SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3) AS T1 ON tai_lieu.ma_loai_tai_lieu = T1.ma_loai_tai_lieu JOIN (SELECT ma_cau_truc_tai_lieu FROM tai_lieu GROUP BY ma_cau_truc_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3) AS T2 ON tai_lieu.ma_cau_truc_tai_lieu = T2.ma_cau_truc_tai_lieu
SELECT tai_lieu.ten_tai_lieu FROM tai_lieu JOIN (SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3) AS T1 ON tai_lieu.ma_loai_tai_lieu = T1.ma_loai_tai_lieu JOIN (SELECT ma_cau_truc_tai_lieu FROM cau_truc_tai_lieu GROUP BY ma_cau_truc_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3) AS T2 ON tai_lieu.ma_cau_truc_tai_lieu = T2.ma_cau_truc_tai_lieu
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING SUM(so_luong_truy_cap) > 10000 ORDER BY SUM(so_luong_truy_cap) DESC LIMIT 1
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING SUM(so_luong_truy_cap) > 10000 ORDER BY ma_loai_tai_lieu
SELECT tieu_de_muc FROM cac_muc_cua_tai_lieu JOIN tai_lieu ON cac_muc_cua_tai_lieu.ma_tai_lieu = tai_lieu.ma_tai_lieu WHERE tai_lieu.ten_tai_lieu = 'David CV'
SELECT tieu_de_muc FROM cac_muc_cua_tai_lieu JOIN tai_lieu ON cac_muc_cua_tai_lieu.ma_tai_lieu = tai_lieu.ma_tai_lieu WHERE tai_lieu.ten_tai_lieu = 'David CV'
SELECT ten_tai_lieu FROM tai_lieu WHERE ma_tai_lieu NOT IN (SELECT ma_tai_lieu FROM cac_muc_cua_tai_lieu)
SELECT ma_tai_lieu FROM tai_lieu WHERE ma_tai_lieu NOT IN (SELECT ma_tai_lieu FROM cac_muc_cua_tai_lieu)
SELECT nguoi_dung.ten_nguoi_dung, nguoi_dung.mat_khau FROM nguoi_dung JOIN vai_tro ON nguoi_dung.ma_vai_tro = vai_tro.ma_vai_tro GROUP BY nguoi_dung.ma_vai_tro HAVING COUNT(*) = (SELECT COUNT(*) FROM nguoi_dung GROUP BY ma_vai_tro ORDER BY COUNT(*) DESC LIMIT 1) ORDER BY nguoi_dung.ten_nguoi_dung
SELECT nguoi_dung.ten_nguoi_dung, nguoi_dung.mat_khau FROM nguoi_dung JOIN vai_tro ON nguoi_dung.ma_vai_tro = vai_tro.ma_vai_tro GROUP BY nguoi_dung.ma_vai_tro ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(so_luong_truy_cap) FROM tai_lieu WHERE ma_tai_lieu IN (SELECT ma_tai_lieu FROM cac_muc_cua_tai_lieu WHERE tieu_de_muc = 'Lời cảm ơn')
SELECT AVG(so_luong_truy_cap) FROM tai_lieu JOIN cac_muc_cua_tai_lieu ON tai_lieu.ma_tai_lieu = cac_muc_cua_tai_lieu.ma_tai_lieu WHERE tieu_de_muc = 'Lời cảm ơn'
SELECT ten_tai_lieu FROM tai_lieu WHERE ma_tai_lieu NOT IN (SELECT cac_muc_cua_tai_lieu.ma_tai_lieu FROM cac_muc_cua_tai_lieu JOIN hinh_anh_trong_cac_muc_cua_tai_lieu ON cac_muc_cua_tai_lieu.id_muc = hinh_anh_trong_cac_muc_cua_tai_lieu.id_muc)
SELECT ten_tai_lieu FROM tai_lieu WHERE ma_tai_lieu NOT IN (SELECT hinh_anh_trong_cac_muc_cua_tai_lieu.id_muc FROM hinh_anh_trong_cac_muc_cua_tai_lieu JOIN hinh_anh ON hinh_anh_trong_cac_muc_cua_tai_lieu.id_hinh_anh = hinh_anh.id_hinh_anh)
SELECT ten_tai_lieu FROM tai_lieu GROUP BY ma_tai_lieu ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_tai_lieu FROM tai_lieu ORDER BY (SELECT COUNT(*) FROM cac_muc_cua_tai_lieu WHERE ma_tai_lieu = tai_lieu.ma_tai_lieu) DESC LIMIT 1
SELECT ten_tai_lieu FROM tai_lieu WHERE ten_tai_lieu LIKE '%CV%'
SELECT ten_tai_lieu FROM tai_lieu WHERE ten_tai_lieu LIKE '%CV%'
SELECT COUNT(*) FROM nguoi_dung
SELECT COUNT(*) FROM nguoi_dung
SELECT vai_tro.mo_ta_ve_vai_tro, COUNT(*) AS so_luong FROM nguoi_dung JOIN vai_tro ON nguoi_dung.ma_vai_tro = vai_tro.ma_vai_tro GROUP BY vai_tro.ma_vai_tro ORDER BY so_luong DESC LIMIT 1
SELECT vai_tro.mo_ta_ve_vai_tro FROM nguoi_dung JOIN vai_tro ON nguoi_dung.ma_vai_tro = vai_tro.ma_vai_tro GROUP BY vai_tro.ma_vai_tro ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(so_luong_truy_cap) FROM tai_lieu WHERE ma_cau_truc_tai_lieu = (SELECT ma_cau_truc_tai_lieu FROM tai_lieu GROUP BY ma_cau_truc_tai_lieu ORDER BY COUNT(*) ASC LIMIT 1)
SELECT AVG(so_luong_truy_cap) FROM tai_lieu WHERE ma_cau_truc_tai_lieu IN (SELECT ma_cau_truc_tai_lieu FROM cau_truc_tai_lieu GROUP BY ma_cau_truc_tai_lieu HAVING COUNT(*) < ALL (SELECT COUNT(*) FROM cau_truc_tai_lieu GROUP BY ma_cau_truc_tai_lieu))
SELECT ten_hinh_anh, duong_dan_cua_hinh_anh FROM hinh_anh ORDER BY ten_hinh_anh ASC
SELECT ten_hinh_anh, duong_dan_cua_hinh_anh FROM hinh_anh ORDER BY ten_hinh_anh ASC
SELECT ma_vai_tro, COUNT(*) AS so_luong_nguoi_dung FROM nguoi_dung GROUP BY ma_vai_tro ORDER BY COUNT(*) DESC LIMIT 10
SELECT ma_vai_tro, COUNT(*) FROM nguoi_dung GROUP BY ma_vai_tro
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING COUNT(*) > 2
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING COUNT(*) >= 2
SELECT COUNT(*) FROM khoa_hoc
SELECT COUNT(*) FROM khoa_hoc
SELECT mo_ta_ve_khoa_hoc FROM khoa_hoc WHERE ten_khoa_hoc = ' cơ sở dữ liệu '
SELECT mo_ta_ve_khoa_hoc FROM khoa_hoc WHERE ten_khoa_hoc = 'Cơ sở dữ liệu'
SELECT dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan JOIN khoa_hoc ON tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia = khoa_hoc.id_tac_gia WHERE ten_ca_nhan LIKE '%Cathrine%' OR ten_dem LIKE '%Cathrine%' OR ho LIKE '%Cathrine%'
SELECT dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan WHERE ten_ca_nhan = 'Cathrine'
SELECT dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan WHERE atb_cua_tac_gia_/_nguoi_huong_dan IN (SELECT id_tac_gia FROM khoa_hoc) UNION SELECT dong_1_cua_dia_chi FROM sinh_vien WHERE ten_dang_nhap IN (SELECT atb_cua_tac_gia_/_nguoi_huong_dan FROM khoa_hoc)
SELECT T1.ho, T1.ten_dem, T1.ho, T1.dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan AS T1 JOIN khoa_hoc AS T2 ON T1.id_tac_gia = T2.id_tac_gia WHERE T2.id_mon_hoc IS NOT NULL UNION SELECT T1.ho, T1.ten_dem, T1.ho, T1.dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan AS T1 WHERE T1.id_tac_gia IN (SELECT DISTINCT id_tac_gia FROM khoa_hoc WHERE id_mon_hoc IS NULL)
SELECT ten_dang_nhap, ho FROM tac_gia_khoa_hoc_va_nguoi_huong_dan UNION SELECT ten_dang_nhap, ho FROM sinh_vien WHERE id_sinh_vien IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien)
SELECT ten_dang_nhap, ho FROM tac_gia_khoa_hoc_va_nguoi_huong_dan UNION SELECT ten_dang_nhap, ho FROM tac_gia_khoa_hoc_va_nguoi_huong_dan WHERE id_tac_gia IN (SELECT id_tac_gia FROM khoa_hoc) EXCEPT SELECT ten_dang_nhap, ho FROM sinh_vien WHERE id_sinh_vien IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien)
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ky, luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh FROM luot_dang_ky_khoa_hoc_cua_sinh_vien JOIN sinh_vien ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien = sinh_vien.id_sinh_vien
SELECT ngay_dang_ky, ngay_hoan_thanh FROM luot_dang_ky_khoa_hoc_cua_sinh_vien
SELECT COUNT(DISTINCT id_sinh_vien) FROM luot_dang_ky_khoa_hoc_cua_sinh_vien
SELECT COUNT(DISTINCT id_sinh_vien) FROM luot_dang_ky_khoa_hoc_cua_sinh_vien
SELECT COUNT(DISTINCT luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc) FROM luot_dang_ky_khoa_hoc_cua_sinh_vien JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc
SELECT COUNT(DISTINCT khoa_hoc.id_khoa_hoc) FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc
SELECT ngay_lam_bai_kiem_tra FROM bai_kiem_tra_cua_sinh_vien WHERE ket_qua_kiem_tra = 'Đạt'
SELECT ngay_lam_bai_kiem_tra FROM bai_kiem_tra_cua_sinh_vien WHERE ket_qua_kiem_tra = 'Đạt'
SELECT COUNT(*) FROM bai_kiem_tra_cua_sinh_vien WHERE ket_qua_kiem_tra = 'Trượt'
SELECT COUNT(*) FROM bai_kiem_tra_cua_sinh_vien WHERE ket_qua_kiem_tra = 'Trượt'
SELECT ten_dang_nhap FROM sinh_vien WHERE ho = 'Ward'
SELECT ten_dang_nhap FROM sinh_vien WHERE ho = 'Ward'
SELECT ngay_dang_nhap_moi_nhat FROM sinh_vien WHERE ho = 'Jaskolski' OR ho = 'Langosh' ORDER BY ngay_dang_nhap_moi_nhat DESC LIMIT 1
SELECT ngay_dang_nhap_moi_nhat FROM sinh_vien WHERE ho = 'Jaskolski' OR ho = 'Langosh' ORDER BY ngay_dang_nhap_moi_nhat DESC LIMIT 1
SELECT COUNT(*) FROM sinh_vien WHERE ten_ca_nhan LIKE '%son%'
SELECT COUNT(*) FROM sinh_vien WHERE ten_ca_nhan LIKE '%son%' OR ten_dem LIKE '%son%' OR ho LIKE '%son%'
SELECT ten_mon_hoc FROM mon_hoc
SELECT ten_mon_hoc FROM mon_hoc
SELECT ten_ca_nhan FROM tac_gia_khoa_hoc_va_nguoi_huong_dan ORDER BY ten_ca_nhan ASC
SELECT ten_ca_nhan FROM tac_gia_khoa_hoc_va_nguoi_huong_dan ORDER BY ten_ca_nhan ASC UNION SELECT ten_ca_nhan FROM sinh_vien ORDER BY ten_ca_nhan ASC
SELECT ten_ca_nhan AS ten, ho AS ho FROM sinh_vien ORDER BY ho ASC
SELECT ten_ca_nhan AS ten, ho AS ho FROM sinh_vien ORDER BY ho ASC
SELECT ket_qua_kiem_tra, COUNT(*) FROM bai_kiem_tra_cua_sinh_vien GROUP BY ket_qua_kiem_tra ORDER BY COUNT(*) DESC
SELECT ket_qua_kiem_tra, COUNT(*) AS so_luong FROM bai_kiem_tra_cua_sinh_vien GROUP BY ket_qua_kiem_tra ORDER BY COUNT(*) DESC
SELECT tac_gia_khoa_hoc_va_nguoi_huong_dan.ten_dang_nhap FROM tac_gia_khoa_hoc_va_nguoi_huong_dan JOIN khoa_hoc ON tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia = khoa_hoc.id_tac_gia WHERE khoa_hoc.ten_khoa_hoc = ' cơ sở dữ liệu nâng cao '
SELECT tac_gia_khoa_hoc_va_nguoi_huong_dan.ten_dang_nhap FROM tac_gia_khoa_hoc_va_nguoi_huong_dan JOIN khoa_hoc ON tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia = khoa_hoc.id_tac_gia WHERE khoa_hoc.ten_khoa_hoc = 'cơ sở dữ liệu nâng cao'
SELECT tac_gia_khoa_hoc_va_nguoi_huong_dan.dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan JOIN khoa_hoc ON tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia = khoa_hoc.id_tac_gia WHERE khoa_hoc.ten_khoa_hoc = 'hệ điều hành' OR khoa_hoc.ten_khoa_hoc = 'cấu trúc dữ liệu'
SELECT tac_gia_khoa_hoc_va_nguoi_huong_dan.dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan JOIN khoa_hoc ON tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia = khoa_hoc.id_tac_gia JOIN mon_hoc ON khoa_hoc.id_mon_hoc = mon_hoc.id_mon_hoc WHERE mon_hoc.ten_mon_hoc = 'Hệ điều hành' OR mon_hoc.ten_mon_hoc = 'Cấu trúc dữ liệu'
SELECT tac_gia_khoa_hoc_va_nguoi_huong_dan.ten_ca_nhan, tac_gia_khoa_hoc_va_nguoi_huong_dan.ho, tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia FROM khoa_hoc JOIN tac_gia_khoa_hoc_va_nguoi_huong_dan ON khoa_hoc.id_tac_gia = tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia GROUP BY tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_ca_nhan AS ten, ho, id_tac_gia FROM tac_gia_khoa_hoc_va_nguoi_huong_dan JOIN khoa_hoc ON tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia = khoa_hoc.id_tac_gia GROUP BY id_tac_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT tac_gia_khoa_hoc_va_nguoi_huong_dan.dong_1_cua_dia_chi, tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia FROM khoa_hoc JOIN tac_gia_khoa_hoc_va_nguoi_huong_dan ON khoa_hoc.id_tac_gia = tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia GROUP BY tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia, tac_gia_khoa_hoc_va_nguoi_huong_dan.dong_1_cua_dia_chi HAVING COUNT(*) >= 2
SELECT tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia, tac_gia_khoa_hoc_va_nguoi_huong_dan.dong_1_cua_dia_chi FROM khoa_hoc JOIN tac_gia_khoa_hoc_va_nguoi_huong_dan ON khoa_hoc.id_tac_gia = tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia GROUP BY tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia HAVING COUNT(*) > 2
SELECT ten_khoa_hoc FROM khoa_hoc JOIN tac_gia_khoa_hoc_va_nguoi_huong_dan ON khoa_hoc.id_tac_gia = tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia WHERE ten_ca_nhan LIKE 'Julio%'
SELECT ten_khoa_hoc FROM khoa_hoc JOIN tac_gia_khoa_hoc_va_nguoi_huong_dan ON khoa_hoc.id_tac_gia = tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia WHERE ten_ca_nhan = 'Julio'
SELECT ten_khoa_hoc, mo_ta_ve_khoa_hoc FROM khoa_hoc JOIN mon_hoc ON khoa_hoc.id_mon_hoc = mon_hoc.id_mon_hoc WHERE mon_hoc.ten_mon_hoc = 'Khoa học máy tính'
SELECT ten_khoa_hoc, mo_ta_ve_khoa_hoc FROM khoa_hoc JOIN mon_hoc ON khoa_hoc.id_mon_hoc = mon_hoc.id_mon_hoc WHERE mon_hoc.ten_mon_hoc = 'Khoa học máy tính'
SELECT mon_hoc.id_mon_hoc AS mon_hoc_id, mon_hoc.ten_mon_hoc AS ten_mon_hoc, COUNT(khoa_hoc.id_mon_hoc) AS so_khoa_hoc FROM mon_hoc JOIN khoa_hoc ON mon_hoc.id_mon_hoc = khoa_hoc.id_mon_hoc GROUP BY mon_hoc.id_mon_hoc ORDER BY COUNT(khoa_hoc.id_mon_hoc) DESC
SELECT mon_hoc.id_mon_hoc, mon_hoc.ten_mon_hoc, COUNT(*) AS so_khoa_hoc FROM mon_hoc JOIN khoa_hoc ON mon_hoc.id_mon_hoc = khoa_hoc.id_mon_hoc GROUP BY mon_hoc.id_mon_hoc, mon_hoc.ten_mon_hoc ORDER BY COUNT(*) DESC
SELECT mon_hoc.id_mon_hoc, mon_hoc.ten_mon_hoc, COUNT(khoa_hoc.id_mon_hoc) AS so_khoa_hoc FROM mon_hoc JOIN khoa_hoc ON mon_hoc.id_mon_hoc = khoa_hoc.id_mon_hoc GROUP BY mon_hoc.id_mon_hoc ORDER BY so_khoa_hoc ASC
SELECT mon_hoc.id_mon_hoc, COUNT(*) AS so_khoa_hoc FROM mon_hoc JOIN khoa_hoc ON mon_hoc.id_mon_hoc = khoa_hoc.id_mon_hoc GROUP BY mon_hoc.id_mon_hoc ORDER BY so_khoa_hoc ASC
SELECT ngay_ngay_dang_ky FROM khoa_hoc WHERE ten_khoa_hoc = 'tiếng Tây Ban Nha'
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_ngay_dang_ky FROM luot_dang_ky_khoa_hoc_cua_sinh_vien JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'tiếng Tây Ban Nha'
SELECT ten_khoa_hoc FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khoa_hoc FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khoa_hoc FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc HAVING COUNT(DISTINCT luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien) = 1
SELECT ten_khoa_hoc FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc HAVING COUNT(DISTINCT luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien) = 1
SELECT khoa_hoc.ten_khoa_hoc, khoa_hoc.mo_ta_ve_khoa_hoc FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc HAVING COUNT(*) > 2
SELECT ten_khoa_hoc, mo_ta_ve_khoa_hoc FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc HAVING COUNT(luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien) > 2
SELECT ten_khoa_hoc, COUNT(*) AS so_luong_hoc_sinh FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc ORDER BY COUNT(*) DESC
SELECT khoa_hoc.ten_khoa_hoc, COUNT(*) AS so_luong_sinh_vien FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc ORDER BY COUNT(*) DESC
SELECT ngay_lam_bai_kiem_tra FROM bai_kiem_tra_cua_sinh_vien WHERE ket_qua_kiem_tra = 'Đạt'
SELECT bai_kiem_tra_cua_sinh_vien.ngay_lam_bai_kiem_tra FROM bai_kiem_tra_cua_sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON bai_kiem_tra_cua_sinh_vien.id_dang_ky = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_dang_ky WHERE bai_kiem_tra_cua_sinh_vien.ket_qua_kiem_tra = 'Đạt'
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh FROM bai_kiem_tra_cua_sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON bai_kiem_tra_cua_sinh_vien.id_dang_ky = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_dang_ky WHERE bai_kiem_tra_cua_sinh_vien.ket_qua_kiem_tra = 'Trượt'
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc JOIN bai_kiem_tra_cua_sinh_vien ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_dang_ky = bai_kiem_tra_cua_sinh_vien.id_dang_ky WHERE bai_kiem_tra_cua_sinh_vien.ket_qua_kiem_tra = 'Trượt'
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_ngay_dang_ky, luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh FROM luot_dang_ky_khoa_hoc_cua_sinh_vien JOIN sinh_vien ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ten_ca_nhan = 'Karson'
SELECT ngay_dang_ky, ngay_hoan_thanh FROM luot_dang_ky_khoa_hoc_cua_sinh_vien JOIN sinh_vien ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ten_ca_nhan = 'Karson'
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_ngay_dang_ky, luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh FROM luot_dang_ky_khoa_hoc_cua_sinh_vien JOIN sinh_vien ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Zieme' AND sinh_vien.ten_ca_nhan = 'Bernie'
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_ngay_dang_ky, luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Zieme' AND sinh_vien.ten_ca_nhan LIKE 'Bernie%'
SELECT sinh_vien.id_sinh_vien, sinh_vien.ten_dang_nhap FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_sinh_vien, T1.ten_ca_nhan FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT sinh_vien.id_sinh_vien, sinh_vien.ten_ca_nhan FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien HAVING COUNT(*) >= 2
SELECT sinh_vien.id_sinh_vien, sinh_vien.ten_ca_nhan FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien HAVING COUNT(*) >= 2
SELECT sinh_vien.id_sinh_vien, sinh_vien.ten_dem FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien HAVING COUNT(*) <= 2 ORDER BY COUNT(*) DESC LIMIT 10
SELECT sinh_vien.id_sinh_vien, sinh_vien.ten_dem FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 2
SELECT ten_ca_nhan FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien)
SELECT ten_ca_nhan FROM sinh_vien AS T1 WHERE T1.id_sinh_vien NOT IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien)
SELECT COUNT(*) FROM sinh_vien AS T1 WHERE T1.id_sinh_vien NOT IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien)
SELECT COUNT(*) FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien)
SELECT ten_dang_nhap FROM (SELECT ten_dang_nhap FROM sinh_vien UNION SELECT ten_dang_nhap FROM tac_gia_khoa_hoc_va_nguoi_huong_dan) AS combined GROUP BY ten_dang_nhap HAVING COUNT(*) > 1
SELECT ten_dang_nhap FROM sinh_vien UNION SELECT ten_dang_nhap FROM tac_gia_khoa_hoc_va_nguoi_huong_dan WHERE ten_dang_nhap IN (SELECT ten_dang_nhap FROM sinh_vien)
SELECT ten_ca_nhan FROM sinh_vien INTERSECT SELECT ten_ca_nhan FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT DISTINCT sinh_vien.ten_ca_nhan FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc JOIN tac_gia_khoa_hoc_va_nguoi_huong_dan ON khoa_hoc.id_tac_gia = tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia WHERE sinh_vien.ten_ca_nhan = tac_gia_khoa_hoc_va_nguoi_huong_dan.ten_ca_nhan AND sinh_vien.ten_ca_nhan <> ''
SELECT COUNT(*) FROM trang_trai
SELECT COUNT(*) FROM trang_trai
SELECT tong_so_ngua FROM trang_trai ORDER BY tong_so_ngua ASC
SELECT tong_so_ngua FROM trang_trai ORDER BY tong_so_ngua ASC
SELECT chu_nha FROM cuoc_thi_trang_trai WHERE chu_de != 'Người ngoài hành tinh'
SELECT chu_nha FROM cuoc_thi_trang_trai WHERE chu_de != 'Người ngoài hành tinh'
SELECT chu_de FROM cuoc_thi_trang_trai ORDER BY nam ASC
SELECT chu_de FROM cuoc_thi_trang_trai ORDER BY nam ASC
SELECT SUM(ngua_lam_viec) / COUNT(*) FROM trang_trai WHERE tong_so_ngua > 5000
SELECT AVG(ngua_lam_viec) FROM trang_trai WHERE tong_so_ngua > 5000
SELECT MAX(trang_trai.bo) AS max_bo, MIN(trang_trai.bo) AS min_bo FROM trang_trai
SELECT MAX(trang_trai.bo) AS max_bo, MIN(trang_trai.bo) AS min_bo FROM trang_trai
SELECT COUNT(DISTINCT cap_bac) FROM thanh_pho
SELECT COUNT(DISTINCT cap_bac) FROM thanh_pho
SELECT ten_chinh_thuc FROM thanh_pho ORDER BY dan_so DESC
SELECT ten_chinh_thuc, dan_so FROM thanh_pho ORDER BY dan_so DESC
SELECT ten_chinh_thuc, cap_bac FROM thanh_pho ORDER BY dan_so DESC LIMIT 1
SELECT ten_chinh_thuc, cap_bac FROM thanh_pho ORDER BY dan_so DESC LIMIT 1
SELECT cuoc_thi_trang_trai.nam, thanh_pho.ten_chinh_thuc FROM cuoc_thi_trang_trai JOIN thanh_pho ON cuoc_thi_trang_trai.id_thanh_pho_chu_nha = thanh_pho.id_thanh_pho
SELECT cuoc_thi_trang_trai.nam, thanh_pho.ten_chinh_thuc FROM cuoc_thi_trang_trai JOIN thanh_pho ON cuoc_thi_trang_trai.id_thanh_pho_chu_nha = thanh_pho.id_thanh_pho
SELECT thanh_pho.ten_chinh_thuc FROM cuoc_thi_trang_trai JOIN thanh_pho ON cuoc_thi_trang_trai.id_thanh_pho_chu_nha = thanh_pho.id_thanh_pho GROUP BY thanh_pho.id_thanh_pho, thanh_pho.ten_chinh_thuc HAVING COUNT(*) > 1
SELECT thanh_pho.ten_chinh_thuc FROM cuoc_thi_trang_trai JOIN thanh_pho ON cuoc_thi_trang_trai.id_thanh_pho_chu_nha = thanh_pho.id_thanh_pho GROUP BY thanh_pho.id_thanh_pho, thanh_pho.ten_chinh_thuc HAVING COUNT(*) > 1
SELECT thanh_pho.cap_bac FROM cuoc_thi_trang_trai JOIN thanh_pho ON cuoc_thi_trang_trai.id_thanh_pho_chu_nha = thanh_pho.id_thanh_pho GROUP BY thanh_pho.id_thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT thanh_pho.cap_bac FROM cuoc_thi_trang_trai JOIN thanh_pho ON cuoc_thi_trang_trai.id_thanh_pho_chu_nha = thanh_pho.id_thanh_pho GROUP BY thanh_pho.id_thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT chu_de FROM cuoc_thi_trang_trai JOIN thanh_pho ON cuoc_thi_trang_trai.id_thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE thanh_pho.dan_so > 1000
SELECT cuoc_thi_trang_trai.chu_de FROM cuoc_thi_trang_trai JOIN thanh_pho ON cuoc_thi_trang_trai.id_thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE thanh_pho.dan_so > 1000
SELECT cap_bac, AVG(dan_so) FROM thanh_pho GROUP BY cap_bac
SELECT cap_bac, AVG(dan_so) FROM thanh_pho GROUP BY cap_bac
SELECT cap_bac, COUNT(*) AS so_luong FROM thanh_pho GROUP BY cap_bac ORDER BY COUNT(*) ASC
SELECT cap_bac, COUNT(*) AS tien_su_xuat_hien FROM thanh_pho GROUP BY cap_bac ORDER BY tien_su_xuat_hien ASC
SELECT cap_bac, COUNT(*) AS so_luong FROM thanh_pho GROUP BY cap_bac ORDER BY so_luong DESC LIMIT 1
SELECT cap_bac FROM thanh_pho GROUP BY cap_bac ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_chinh_thuc FROM thanh_pho WHERE id_thanh_pho NOT IN (SELECT id_thanh_pho_chu_nha FROM cuoc_thi_trang_trai)
SELECT ten_chinh_thuc FROM thanh_pho WHERE id_thanh_pho NOT IN (SELECT id_thanh_pho_chu_nha FROM cuoc_thi_trang_trai)
SELECT cap_bac FROM thanh_pho WHERE dan_so > 1500 AND dan_so < 500
SELECT cap_bac FROM thanh_pho WHERE dan_so > 1500 INTERSECT SELECT cap_bac FROM thanh_pho WHERE dan_so < 500
SELECT ten_chinh_thuc FROM thanh_pho WHERE dan_so > 1500 OR dan_so < 500
SELECT ten_chinh_thuc FROM thanh_pho WHERE dan_so > 1500 OR dan_so < 500
SELECT xep_hang_dieu_tra_dan_so FROM thanh_pho WHERE cap_bac != 'Làng'
SELECT xep_hang_dieu_tra_dan_so FROM thanh_pho WHERE cap_bac != 'Làng'
SELECT COUNT(*) FROM chuyen_bay WHERE van_toc > 200
SELECT COUNT(*) AS so_chuyen_bay, ngay, phi_cong FROM chuyen_bay ORDER BY do_cao ASC
SELECT id, quoc_gia, thanh_pho, ten FROM san_bay ORDER BY ten ASC
SELECT co_phan_nhom FROM cong_ty_dieu_hanh ORDER BY co_phan_nhom DESC LIMIT 1
SELECT van_toc FROM chuyen_bay WHERE phi_cong = 'Thompson'
SELECT cong_ty_dieu_hanh.ten, cong_ty_dieu_hanh.loai FROM cong_ty_dieu_hanh JOIN chuyen_bay ON cong_ty_dieu_hanh.id = chuyen_bay.id_cong_ty GROUP BY cong_ty_dieu_hanh.id ORDER BY cong_ty_dieu_hanh.ten ASC
SELECT ten FROM san_bay WHERE quoc_gia != 'Iceland'
SELECT loai FROM cong_ty_dieu_hanh JOIN chuyen_bay ON cong_ty_dieu_hanh.id = chuyen_bay.id_cong_ty WHERE van_toc < 200 GROUP BY loai HAVING COUNT(*) > 0 ORDER BY loai
SELECT cong_ty_dieu_hanh.id, cong_ty_dieu_hanh.ten FROM chuyen_bay JOIN cong_ty_dieu_hanh ON chuyen_bay.id_cong_ty = cong_ty_dieu_hanh.id GROUP BY cong_ty_dieu_hanh.id HAVING COUNT(*) > 1
SELECT san_bay.id, san_bay.ten, san_bay.iata FROM san_bay JOIN chuyen_bay ON san_bay.id = chuyen_bay.id_san_bay GROUP BY san_bay.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT chuyen_bay.phi_cong FROM chuyen_bay JOIN san_bay ON chuyen_bay.id_san_bay = san_bay.id WHERE san_bay.quoc_gia = 'Hoa Kỳ' OR san_bay.ten = 'Sân bay Billund'
SELECT loai, COUNT(*) FROM cong_ty_dieu_hanh GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM san_bay WHERE id NOT IN (SELECT DISTINCT id_san_bay FROM chuyen_bay WHERE phi_cong = 'Thompson')
SELECT phi_cong FROM chuyen_bay JOIN cong_ty_dieu_hanh ON chuyen_bay.id_cong_ty = cong_ty_dieu_hanh.id WHERE hoat_dong_chinh = 'Vận chuyển hàng hoá' OR hoat_dong_chinh = 'Dịch vụ ăn uống' GROUP BY phi_cong HAVING COUNT(DISTINCT id_cong_ty) > 1
SELECT ten FROM san_bay WHERE ten LIKE '% quốc tế %'
SELECT COUNT(*) FROM chuyen_bay JOIN cong_ty_dieu_hanh ON chuyen_bay.id_cong_ty = cong_ty_dieu_hanh.id GROUP BY chuyen_bay.id_san_bay, cong_ty_dieu_hanh.id
SELECT quoc_gia, COUNT(*) FROM san_bay GROUP BY quoc_gia ORDER BY COUNT(*) DESC
SELECT quoc_gia FROM san_bay GROUP BY quoc_gia HAVING COUNT(*) > 2
SELECT phi_cong FROM chuyen_bay GROUP BY phi_cong ORDER BY COUNT(*) DESC LIMIT 1
SELECT SUM(so_luong_bo_phan) FROM do_noi_that
SELECT id_do_noi_that, ten FROM do_noi_that ORDER BY lai_suat_thi_truong DESC LIMIT 1
SELECT lai_suat_thi_truong FROM do_noi_that ORDER BY lai_suat_thi_truong DESC LIMIT 2
SELECT ten, so_luong_bo_phan FROM do_noi_that WHERE so_luong_bo_phan > 10
SELECT ten, so_luong_bo_phan FROM do_noi_that ORDER BY lai_suat_thi_truong ASC LIMIT 1
SELECT ten FROM do_noi_that WHERE gia_tinh_theo_do_la < (SELECT MAX(gia_tinh_theo_do_la) FROM xuong_san_xuat_do_noi_that)
SELECT ten, nam_mo_cua FROM nha_san_xuat ORDER BY so_luong_cua_hang DESC LIMIT 1
SELECT AVG(so_luong_nha_may) FROM nha_san_xuat WHERE so_luong_cua_hang > 20
SELECT ten, id_nha_san_xuat FROM nha_san_xuat ORDER BY nam_mo_cua
SELECT ten, nam_mo_cua FROM nha_san_xuat WHERE so_luong_nha_may < 10 OR so_luong_cua_hang > 10
SELECT so_luong_cua_hang, AVG(so_luong_nha_may) FROM nha_san_xuat WHERE nam_mo_cua < 1990 GROUP BY id_nha_san_xuat ORDER BY so_luong_cua_hang DESC LIMIT 1
SELECT xuong_san_xuat_do_noi_that.id_nha_san_xuat, nha_san_xuat.so_luong_cua_hang FROM xuong_san_xuat_do_noi_that JOIN nha_san_xuat ON xuong_san_xuat_do_noi_that.id_nha_san_xuat = nha_san_xuat.id_nha_san_xuat ORDER BY xuong_san_xuat_do_noi_that.gia_tinh_theo_do_la DESC LIMIT 1
SELECT nha_san_xuat.ten, COUNT(xuong_san_xuat_do_noi_that.id_do_noi_that) FROM nha_san_xuat JOIN xuong_san_xuat_do_noi_that ON nha_san_xuat.id_nha_san_xuat = xuong_san_xuat_do_noi_that.id_nha_san_xuat GROUP BY nha_san_xuat.id_nha_san_xuat ORDER BY COUNT(xuong_san_xuat_do_noi_that.id_do_noi_that) DESC
SELECT do_noi_that.ten, xuong_san_xuat_do_noi_that.gia_tinh_theo_do_la FROM do_noi_that JOIN xuong_san_xuat_do_noi_that ON do_noi_that.id_do_noi_that = xuong_san_xuat_do_noi_that.id_do_noi_that
SELECT do_noi_that.ten, do_noi_that.lai_suat_thi_truong FROM do_noi_that WHERE do_noi_that.id_do_noi_that NOT IN (SELECT id_do_noi_that FROM xuong_san_xuat_do_noi_that)
SELECT T1.ten FROM nha_san_xuat AS T1 JOIN xuong_san_xuat_do_noi_that AS T2 ON T1.id_nha_san_xuat = T2.id_nha_san_xuat JOIN do_noi_that AS T3 ON T2.id_do_noi_that = T3.id_do_noi_that WHERE T3.so_luong_bo_phan < 6 OR T3.so_luong_bo_phan > 10 GROUP BY T1.id_nha_san_xuat HAVING COUNT(DISTINCT T3.id_do_noi_that) >= 2 ORDER BY T1.ten ASC
SELECT COUNT(*) FROM khach_tham_quan WHERE tuoi < 30
SELECT ten FROM khach_tham_quan WHERE cap_do_thanh_vien > 4 ORDER BY cap_do_thanh_vien DESC
SELECT AVG(khach_tham_quan.tuoi) FROM khach_tham_quan WHERE khach_tham_quan.cap_do_thanh_vien <= 4
SELECT ten, cap_do_thanh_vien FROM khach_tham_quan WHERE cap_do_thanh_vien > 4 ORDER BY tuoi DESC
SELECT id_bao_tang, ten FROM bao_tang ORDER BY so_luong_nhan_vien DESC LIMIT 1
SELECT AVG(so_luong_nhan_vien) FROM bao_tang WHERE nam_mo_cua < '2009'
SELECT nam_mo_cua, so_luong_nhan_vien FROM bao_tang WHERE ten = 'Bảo tàng Plaza'
SELECT ten FROM bao_tang AS T1 WHERE so_luong_nhan_vien > (SELECT so_luong_nhan_vien FROM bao_tang AS T2 WHERE nam_mo_cua > '2010') AND T1.id_bao_tang != (SELECT id_bao_tang FROM bao_tang WHERE nam_mo_cua > '2010')
SELECT khach_tham_quan.id_khach_tham_quan AS id, khach_tham_quan.ten, khach_tham_quan.tuoi FROM khach_tham_quan WHERE khach_tham_quan.id_khach_tham_quan IN (SELECT id_khach_tham_quan FROM chuyen_tham GROUP BY id_khach_tham_quan HAVING COUNT(*) > 1)
SELECT chuyen_tham.id_khach_tham_quan, khach_tham_quan.ten, khach_tham_quan.cap_do_thanh_vien FROM chuyen_tham JOIN khach_tham_quan ON chuyen_tham.id_khach_tham_quan = khach_tham_quan.id_khach_tham_quan ORDER BY tong_so_tien_da_chi DESC LIMIT 1
SELECT T1.id_bao_tang, T1.ten FROM bao_tang AS T1 JOIN chuyen_tham AS T2 ON T1.id_bao_tang = T2.id_bao_tang GROUP BY T1.id_bao_tang ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM bao_tang WHERE id_bao_tang NOT IN (SELECT DISTINCT id_bao_tang FROM chuyen_tham)
SELECT khach_tham_quan.ten, khach_tham_quan.tuoi FROM khach_tham_quan JOIN chuyen_tham ON khach_tham_quan.id_khach_tham_quan = chuyen_tham.id_khach_tham_quan GROUP BY khach_tham_quan.id_khach_tham_quan ORDER BY SUM(so_luong_ve) DESC LIMIT 1
SELECT AVG(so_luong_ve), MAX(so_luong_ve) FROM chuyen_tham
SELECT SUM(chuyen_tham.tong_so_tien_da_chi) FROM chuyen_tham JOIN khach_tham_quan ON chuyen_tham.id_khach_tham_quan = khach_tham_quan.id_khach_tham_quan WHERE khach_tham_quan.cap_do_thanh_vien = 1
SELECT T1.ten FROM khach_tham_quan AS T1 JOIN chuyen_tham AS T2 ON T1.id_khach_tham_quan = T2.id_khach_tham_quan JOIN bao_tang AS T3 ON T2.id_bao_tang = T3.id_bao_tang WHERE T3.nam_mo_cua < '2009' OR T3.nam_mo_cua > '2011' GROUP BY T1.id_khach_tham_quan HAVING COUNT(DISTINCT T3.id_bao_tang) > 1
SELECT COUNT(*) FROM khach_tham_quan WHERE id_khach_tham_quan NOT IN (SELECT chuyen_tham.id_khach_tham_quan FROM chuyen_tham JOIN bao_tang ON chuyen_tham.id_bao_tang = bao_tang.id_bao_tang WHERE bao_tang.nam_mo_cua > '2010')
SELECT COUNT(*) FROM bao_tang WHERE nam_mo_cua < '2008' OR nam_mo_cua > '2013'
SELECT COUNT(*) FROM hoc_sinh_trung_hoc
SELECT COUNT(*) FROM hoc_sinh_trung_hoc
SELECT ten, khoi_lop FROM hoc_sinh_trung_hoc
SELECT ten, khoi_lop FROM hoc_sinh_trung_hoc
SELECT khoi_lop FROM hoc_sinh_trung_hoc
SELECT khoi_lop FROM hoc_sinh_trung_hoc
SELECT ten FROM hoc_sinh_trung_hoc WHERE id = (SELECT id_hoc_sinh FROM ban_be WHERE id_ban_be = 1)
SELECT khoi_lop FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle'
SELECT ten FROM hoc_sinh_trung_hoc WHERE khoi_lop = 10
SELECT ten FROM hoc_sinh_trung_hoc WHERE khoi_lop = 10
SELECT id FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle'
SELECT id FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle'
SELECT COUNT(*) FROM hoc_sinh_trung_hoc WHERE khoi_lop IN (9, 10)
SELECT COUNT(*) FROM hoc_sinh_trung_hoc WHERE khoi_lop IN (9, 10)
SELECT khoi_lop, COUNT(*) FROM hoc_sinh_trung_hoc GROUP BY khoi_lop ORDER BY COUNT(*) DESC
SELECT khoi_lop, COUNT(*) FROM hoc_sinh_trung_hoc GROUP BY khoi_lop ORDER BY COUNT(*) DESC
SELECT khoi_lop FROM hoc_sinh_trung_hoc GROUP BY khoi_lop ORDER BY COUNT(*) DESC LIMIT 1
SELECT khoi_lop FROM hoc_sinh_trung_hoc GROUP BY khoi_lop ORDER BY COUNT(*) DESC LIMIT 1
SELECT khoi_lop FROM hoc_sinh_trung_hoc GROUP BY khoi_lop HAVING COUNT(*) >= 4
SELECT khoi_lop FROM hoc_sinh_trung_hoc GROUP BY khoi_lop HAVING COUNT(*) >= 4
SELECT T1.id, COUNT(T2.id_hoc_sinh) AS count FROM hoc_sinh_trung_hoc AS T1 LEFT JOIN ban_be AS T2 ON T1.id = T2.id_hoc_sinh GROUP BY T1.id ORDER BY COUNT(T2.id_hoc_sinh) DESC LIMIT 10
SELECT hoc_sinh_trung_hoc.id AS id, COUNT(ban_be.id_hoc_sinh) AS count FROM hoc_sinh_trung_hoc LEFT JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id ORDER BY COUNT(ban_be.id_hoc_sinh) DESC LIMIT 10
SELECT hoc_sinh_trung_hoc.ten AS ten, COUNT(ban_be.id_hoc_sinh) AS count FROM hoc_sinh_trung_hoc LEFT JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id ORDER BY count DESC LIMIT 10
SELECT hoc_sinh_trung_hoc.ten, COUNT(ban_be.id_hoc_sinh) AS so_ban_be FROM hoc_sinh_trung_hoc LEFT JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id ORDER BY COUNT(ban_be.id_hoc_sinh) DESC LIMIT 10
SELECT T1.ten FROM hoc_sinh_trung_hoc AS T1 JOIN ban_be AS T2 ON T1.id = T2.id_hoc_sinh GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten FROM hoc_sinh_trung_hoc AS T1 JOIN ban_be AS T2 ON T1.id = T2.id_hoc_sinh GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id HAVING COUNT(ban_be.id_ban_be) >= 3
SELECT ten FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id HAVING COUNT(ban_be.id_ban_be) >= 3
SELECT hoc_sinh_trung_hoc.ten FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh WHERE hoc_sinh_trung_hoc.ten = 'Kyle'
SELECT hoc_sinh_trung_hoc.ten FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh WHERE hoc_sinh_trung_hoc.ten = 'Kyle'
SELECT COUNT(*) FROM ban_be WHERE id_hoc_sinh = (SELECT id FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle')
SELECT COUNT(*) FROM ban_be WHERE id_hoc_sinh = (SELECT id FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle')
SELECT id FROM hoc_sinh_trung_hoc WHERE id NOT IN (SELECT id_hoc_sinh FROM ban_be)
SELECT id AS id FROM hoc_sinh_trung_hoc AS T1 WHERE T1.id NOT IN (SELECT id_hoc_sinh AS id FROM ban_be AS T2)
SELECT ten FROM hoc_sinh_trung_hoc WHERE id NOT IN (SELECT id_hoc_sinh FROM ban_be)
SELECT ten FROM hoc_sinh_trung_hoc WHERE id NOT IN (SELECT id_hoc_sinh FROM ban_be)
SELECT hoc_sinh_trung_hoc.id FROM hoc_sinh_trung_hoc JOIN ban_be ON ban_be.id_hoc_sinh = hoc_sinh_trung_hoc.id JOIN luot_thich ON luot_thich.id_hoc_sinh = hoc_sinh_trung_hoc.id WHERE ban_be.id_ban_be IS NOT NULL AND luot_thich.id_luot_thich IS NOT NULL
SELECT T1.id FROM hoc_sinh_trung_hoc AS T1 JOIN ban_be AS T2 ON T1.id = T2.id_hoc_sinh JOIN luot_thich AS T3 ON T1.id = T3.id_hoc_sinh WHERE T2.id_hoc_sinh = T1.id AND T3.id_hoc_sinh = T1.id GROUP BY T1.id HAVING COUNT(DISTINCT T2.id_ban_be) > 0 AND COUNT(DISTINCT T3.id_luot_thich) > 0
SELECT T1.ten FROM hoc_sinh_trung_hoc AS T1 JOIN ban_be AS T2 ON T1.id = T2.id_hoc_sinh JOIN luot_thich AS T3 ON T1.id = T3.id_hoc_sinh GROUP BY T1.id HAVING COUNT(DISTINCT T2.id_ban_be) > 0 AND COUNT(DISTINCT T3.id_luot_thich) > 0
SELECT T1.ten FROM hoc_sinh_trung_hoc AS T1 JOIN ban_be AS T2 ON T1.id = T2.id_hoc_sinh JOIN luot_thich AS T3 ON T1.id = T3.id_hoc_sinh WHERE T1.ten IS NOT NULL GROUP BY T1.id HAVING COUNT(DISTINCT T2.id_ban_be) > 0 AND COUNT(DISTINCT T3.id_luot_thich) > 0 ORDER BY T1.ten LIMIT 1000
SELECT id_hoc_sinh, COUNT(*) FROM luot_thich GROUP BY id_hoc_sinh
SELECT id_hoc_sinh, COUNT(*) FROM luot_thich GROUP BY id_hoc_sinh
SELECT hoc_sinh_trung_hoc.ten, COUNT(*) AS so_luot_thich FROM hoc_sinh_trung_hoc JOIN luot_thich ON hoc_sinh_trung_hoc.id = luot_thich.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id ORDER BY COUNT(*) DESC
SELECT hoc_sinh_trung_hoc.ten, COUNT(*) AS so_luot_thich FROM hoc_sinh_trung_hoc JOIN luot_thich ON hoc_sinh_trung_hoc.id = luot_thich.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id ORDER BY COUNT(*) DESC
SELECT ten FROM hoc_sinh_trung_hoc ORDER BY (SELECT COUNT(*) FROM luot_thich WHERE luot_thich.id_hoc_sinh = hoc_sinh_trung_hoc.id) DESC LIMIT 1
SELECT ten FROM hoc_sinh_trung_hoc ORDER BY (SELECT COUNT(*) FROM luot_thich WHERE luot_thich.id_hoc_sinh = hoc_sinh_trung_hoc.id) DESC LIMIT 1
SELECT ten FROM hoc_sinh_trung_hoc WHERE id IN (SELECT id_hoc_sinh FROM luot_thich GROUP BY id_hoc_sinh HAVING COUNT(*) >= 2)
SELECT ten FROM hoc_sinh_trung_hoc WHERE id IN (SELECT id_hoc_sinh FROM luot_thich GROUP BY id_hoc_sinh HAVING COUNT(*) >= 2)
SELECT T1.ten FROM hoc_sinh_trung_hoc AS T1 JOIN ban_be AS T2 ON T1.id = T2.id_hoc_sinh WHERE T1.khoi_lop > 5 GROUP BY T1.id HAVING COUNT(T2.id_ban_be) >= 2
SELECT T1.ten FROM hoc_sinh_trung_hoc AS T1 JOIN ban_be AS T2 ON T1.id = T2.id_hoc_sinh WHERE T1.khoi_lop >= 5 GROUP BY T1.id HAVING COUNT(T2.id_ban_be) >= 2
SELECT COUNT(*) FROM luot_thich WHERE id_hoc_sinh = (SELECT id FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle')
SELECT COUNT(*) FROM luot_thich WHERE id_hoc_sinh = (SELECT id FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle')
SELECT AVG(T1.khoi_lop) FROM hoc_sinh_trung_hoc AS T1 JOIN ban_be AS T2 ON T1.id = T2.id_hoc_sinh WHERE T2.id_ban_be IS NOT NULL GROUP BY T1.id HAVING COUNT(DISTINCT T2.id_ban_be) > 0
SELECT AVG(T1.khoi_lop) FROM hoc_sinh_trung_hoc AS T1 JOIN ban_be AS T2 ON T1.id = T2.id_hoc_sinh WHERE T2.id_ban_be IS NOT NULL GROUP BY T1.id HAVING COUNT(DISTINCT T2.id_ban_be) > 0
SELECT khoi_lop FROM hoc_sinh_trung_hoc WHERE id NOT IN (SELECT id_hoc_sinh FROM ban_be) ORDER BY khoi_lop LIMIT 1
SELECT khoi_lop FROM hoc_sinh_trung_hoc WHERE id NOT IN (SELECT id_hoc_sinh FROM ban_be UNION SELECT id_ban_be FROM ban_be) ORDER BY khoi_lop LIMIT 1
SELECT COUNT(*) FROM bua_tiec
SELECT COUNT(*) FROM bua_tiec
SELECT chu_de_bua_tiec FROM bua_tiec ORDER BY so_luong_nguoi_to_chuc ASC
SELECT chu_de_bua_tiec, so_luong_nguoi_to_chuc FROM bua_tiec ORDER BY so_luong_nguoi_to_chuc ASC
SELECT chu_de_bua_tiec, dia_diem FROM bua_tiec
SELECT chu_de_bua_tiec, dia_diem FROM bua_tiec
SELECT nam_dau_tien, nam_cuoi_cung FROM bua_tiec WHERE chu_de_bua_tiec = 'Mùa xuân' OR chu_de_bua_tiec = 'Teqnology'
SELECT AVG(so_luong_nguoi_to_chuc) FROM bua_tiec
SELECT COUNT(chu_tiec.id_nguoi_to_chuc) / COUNT(DISTINCT bua_tiec.id_bua_tiec) FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec
SELECT bua_tiec.dia_diem FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec GROUP BY bua_tiec.dia_diem ORDER BY COUNT(chu_tiec.id_nguoi_to_chuc) DESC LIMIT 1
SELECT bua_tiec.dia_diem FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec GROUP BY bua_tiec.id_bua_tiec ORDER BY COUNT(chu_tiec.id_nguoi_to_chuc) DESC LIMIT 1
SELECT quoc_tich, COUNT(*) FROM nguoi_to_chuc GROUP BY quoc_tich ORDER BY COUNT(*) DESC
SELECT quoc_tich, COUNT(*) FROM nguoi_to_chuc GROUP BY quoc_tich ORDER BY COUNT(*) DESC
SELECT quoc_tich FROM nguoi_to_chuc GROUP BY quoc_tich ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_tich FROM nguoi_to_chuc GROUP BY quoc_tich ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_tich FROM nguoi_to_chuc WHERE tuoi > '45' INTERSECT SELECT quoc_tich FROM nguoi_to_chuc WHERE tuoi < '35' GROUP BY quoc_tich
SELECT quoc_tich FROM nguoi_to_chuc WHERE tuoi > '35' INTERSECT SELECT quoc_tich FROM nguoi_to_chuc WHERE tuoi < '45'
SELECT bua_tiec.chu_de_bua_tiec, nguoi_to_chuc.ten FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec JOIN nguoi_to_chuc ON chu_tiec.id_nguoi_to_chuc = nguoi_to_chuc.id_nguoi_to_chuc
SELECT bua_tiec.chu_de_bua_tiec, nguoi_to_chuc.ten FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec JOIN nguoi_to_chuc ON chu_tiec.id_nguoi_to_chuc = nguoi_to_chuc.id_nguoi_to_chuc
SELECT bua_tiec.dia_diem, nguoi_to_chuc.ten FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec JOIN nguoi_to_chuc ON chu_tiec.id_nguoi_to_chuc = nguoi_to_chuc.id_nguoi_to_chuc ORDER BY nguoi_to_chuc.tuoi ASC
SELECT bua_tiec.dia_diem, nguoi_to_chuc.ten FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec JOIN nguoi_to_chuc ON chu_tiec.id_nguoi_to_chuc = nguoi_to_chuc.id_nguoi_to_chuc ORDER BY nguoi_to_chuc.tuoi ASC
SELECT bua_tiec.dia_diem FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec JOIN nguoi_to_chuc ON chu_tiec.id_nguoi_to_chuc = nguoi_to_chuc.id_nguoi_to_chuc WHERE CAST(nguoi_to_chuc.tuoi AS INTEGER) > 50 GROUP BY bua_tiec.id_bua_tiec HAVING COUNT(DISTINCT chu_tiec.id_nguoi_to_chuc) > 1
SELECT bua_tiec.dia_diem FROM bua_tiec JOIN chu_tiec ON bua_tiec.id_bua_tiec = chu_tiec.id_bua_tiec JOIN nguoi_to_chuc ON chu_tiec.id_nguoi_to_chuc = nguoi_to_chuc.id_nguoi_to_chuc WHERE CAST(nguoi_to_chuc.tuoi AS INTEGER) > 50 GROUP BY bua_tiec.id_bua_tiec HAVING COUNT(*) > 1
SELECT ten FROM nguoi_to_chuc JOIN chu_tiec ON nguoi_to_chuc.id_nguoi_to_chuc = chu_tiec.id_nguoi_to_chuc JOIN bua_tiec ON chu_tiec.id_bua_tiec = bua_tiec.id_bua_tiec GROUP BY nguoi_to_chuc.id_nguoi_to_chuc HAVING COUNT(*) > 20
SELECT ten FROM nguoi_to_chuc JOIN chu_tiec ON nguoi_to_chuc.id_nguoi_to_chuc = chu_tiec.id_nguoi_to_chuc JOIN bua_tiec ON chu_tiec.id_bua_tiec = bua_tiec.id_bua_tiec GROUP BY chu_tiec.id_bua_tiec HAVING COUNT(*) > 20
SELECT ten, quoc_tich FROM nguoi_to_chuc JOIN chu_tiec ON nguoi_to_chuc.id_nguoi_to_chuc = chu_tiec.id_nguoi_to_chuc ORDER BY tuoi DESC LIMIT 1
SELECT ten, quoc_tich FROM nguoi_to_chuc JOIN chu_tiec ON nguoi_to_chuc.id_nguoi_to_chuc = chu_tiec.id_nguoi_to_chuc ORDER BY CAST(tuoi AS INTEGER) DESC LIMIT 1
SELECT ten FROM nguoi_to_chuc WHERE id_nguoi_to_chuc NOT IN (SELECT id_nguoi_to_chuc FROM chu_tiec)
SELECT ten FROM nguoi_to_chuc EXCEPT SELECT T2.ten FROM chu_tiec AS T1 JOIN nguoi_to_chuc AS T2 ON T1.id_nguoi_to_chuc = T2.id_nguoi_to_chuc
SELECT COUNT(*) FROM dien_thoai
SELECT ten FROM dien_thoai ORDER BY gia_ban ASC
SELECT bo_nho_theo_g, nha_mang FROM dien_thoai
SELECT nha_mang FROM dien_thoai WHERE bo_nho_theo_g > 32 GROUP BY nha_mang
SELECT ten FROM dien_thoai WHERE nha_mang = 'Sprint' OR nha_mang = 'Tmobile'
SELECT dien_thoai.nha_mang FROM dien_thoai ORDER BY dien_thoai.gia_ban DESC LIMIT 1
SELECT nha_mang, COUNT(*) FROM dien_thoai GROUP BY nha_mang ORDER BY COUNT(*) DESC
SELECT nha_mang FROM dien_thoai GROUP BY nha_mang ORDER BY COUNT(*) DESC LIMIT 1
SELECT nha_mang FROM dien_thoai WHERE bo_nho_theo_g < 32 INTERSECT SELECT nha_mang FROM dien_thoai WHERE bo_nho_theo_g > 64
SELECT dien_thoai.ten, thi_truong.khu_vuc FROM dien_thoai JOIN thi_truong_dien_thoai ON dien_thoai.id_dien_thoai = thi_truong_dien_thoai.id_dien_thoai JOIN thi_truong ON thi_truong_dien_thoai.id_thi_truong = thi_truong.id_thi_truong
SELECT dien_thoai.ten, thi_truong.khu_vuc FROM dien_thoai JOIN thi_truong_dien_thoai ON dien_thoai.id_dien_thoai = thi_truong_dien_thoai.id_dien_thoai JOIN thi_truong ON thi_truong_dien_thoai.id_thi_truong = thi_truong.id_thi_truong ORDER BY thi_truong.danh_gia ASC
SELECT dien_thoai.ten FROM dien_thoai JOIN thi_truong_dien_thoai ON dien_thoai.id_dien_thoai = thi_truong_dien_thoai.id_dien_thoai JOIN thi_truong ON thi_truong_dien_thoai.id_thi_truong = thi_truong.id_thi_truong WHERE thi_truong.so_luong_cua_hang > 50
SELECT ten, SUM(so_luong_co_phieu) FROM dien_thoai JOIN thi_truong_dien_thoai ON dien_thoai.id_dien_thoai = thi_truong_dien_thoai.id_dien_thoai GROUP BY dien_thoai.id_dien_thoai, dien_thoai.ten ORDER BY SUM(so_luong_co_phieu) DESC
SELECT dien_thoai.ten, SUM(thi_truong_dien_thoai.so_luong_co_phieu) AS tong_co_phieu FROM dien_thoai JOIN thi_truong_dien_thoai ON dien_thoai.id_dien_thoai = thi_truong_dien_thoai.id_dien_thoai GROUP BY dien_thoai.id_dien_thoai HAVING SUM(thi_truong_dien_thoai.so_luong_co_phieu) > 2000 ORDER BY tong_co_phieu DESC
SELECT ten FROM dien_thoai AS T1 WHERE id_dien_thoai NOT IN (SELECT id_dien_thoai FROM thi_truong_dien_thoai)
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc JOIN danh_muc ON noi_dung_danh_muc.id_danh_muc = danh_muc.id_danh_muc WHERE danh_muc.ten_danh_muc = 'Danh muc'
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc JOIN danh_muc ON noi_dung_danh_muc.id_danh_muc = danh_muc.id_danh_muc WHERE danh_muc.ten_danh_muc = 'Category' ORDER BY ten_muc_nhap_cua_danh_muc ASC
SELECT kieu_du_lieu_thuoc_tinh FROM dinh_nghia_thuoc_tinh GROUP BY kieu_du_lieu_thuoc_tinh HAVING COUNT(*) > 3
SELECT kieu_du_lieu_thuoc_tinh FROM dinh_nghia_thuoc_tinh GROUP BY kieu_du_lieu_thuoc_tinh HAVING COUNT(*) > 3
SELECT kieu_du_lieu_thuoc_tinh FROM dinh_nghia_thuoc_tinh WHERE ten_thuoc_tinh = 'Xanh'
SELECT kieu_du_lieu_thuoc_tinh FROM dinh_nghia_thuoc_tinh WHERE ten_thuoc_tinh = 'Xanh'
SELECT ten_cap_do_cua_danh_muc, cap_do_cua_danh_muc FROM cau_truc_danh_muc WHERE cap_do_cua_danh_muc BETWEEN 5 AND 10
SELECT ten_cap_do_cua_danh_muc, cap_do_cua_danh_muc FROM cau_truc_danh_muc WHERE cap_do_cua_danh_muc BETWEEN 5 AND 10
SELECT nha_xuat_ban_danh_muc FROM danh_muc WHERE nha_xuat_ban_danh_muc LIKE '%Murray%'
SELECT nha_xuat_ban_danh_muc FROM danh_muc WHERE nha_xuat_ban_danh_muc LIKE '%Murray%'
SELECT danh_muc.nha_xuat_ban_danh_muc, COUNT(*) FROM danh_muc GROUP BY danh_muc.nha_xuat_ban_danh_muc ORDER BY COUNT(*) DESC LIMIT 1
SELECT danh_muc.nha_xuat_ban_danh_muc, COUNT(*) FROM danh_muc GROUP BY danh_muc.nha_xuat_ban_danh_muc ORDER BY COUNT(*) DESC LIMIT 1
SELECT danh_muc.ten_danh_muc, danh_muc.ngay_xuat_ban FROM danh_muc JOIN cau_truc_danh_muc ON danh_muc.id_danh_muc = cau_truc_danh_muc.id_danh_muc WHERE cau_truc_danh_muc.cap_do_cua_danh_muc > 5
SELECT ten_danh_muc, ngay_xuat_ban FROM danh_muc JOIN cau_truc_danh_muc ON danh_muc.id_danh_muc = cau_truc_danh_muc.id_danh_muc WHERE cau_truc_danh_muc.cap_do_cua_danh_muc > 5
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc JOIN thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc ON noi_dung_danh_muc.id_muc_nhap_cua_danh_muc = thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc.id_muc_nhap_cua_danh_muc GROUP BY noi_dung_danh_muc.id_muc_nhap_cua_danh_muc ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc JOIN thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc ON noi_dung_danh_muc.id_muc_nhap_cua_danh_muc = thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc.id_muc_nhap_cua_danh_muc GROUP BY noi_dung_danh_muc.id_muc_nhap_cua_danh_muc ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc JOIN thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc ON noi_dung_danh_muc.id_muc_nhap_cua_danh_muc = thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc.id_muc_nhap_cua_danh_muc JOIN dinh_nghia_thuoc_tinh ON thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc.id_thuoc_tinh = dinh_nghia_thuoc_tinh.id_thuoc_tinh WHERE dinh_nghia_thuoc_tinh.ten_thuoc_tinh = 'gia_tinh_theo_euro' ORDER BY gia_tinh_theo_euro DESC LIMIT 1
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc JOIN thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc ON noi_dung_danh_muc.id_muc_nhap_cua_danh_muc = thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc.id_muc_nhap_cua_danh_muc JOIN dinh_nghia_thuoc_tinh ON thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc.id_thuoc_tinh = dinh_nghia_thuoc_tinh.id_thuoc_tinh WHERE dinh_nghia_thuoc_tinh.ten_thuoc_tinh = 'gia_tinh_theo_euro' ORDER BY thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc.gia_tri_thuoc_tinh DESC LIMIT 1
SELECT ten_cap_do_cua_danh_muc FROM cau_truc_danh_muc JOIN danh_muc ON cau_truc_danh_muc.id_danh_muc = danh_muc.id_danh_muc ORDER BY MIN(gia_tinh_theo_do_la) ASC LIMIT 1
SELECT ten_cap_do_cua_danh_muc FROM cau_truc_danh_muc JOIN noi_dung_danh_muc ON cau_truc_danh_muc.cap_do_cua_danh_muc = noi_dung_danh_muc.cap_do_cua_danh_muc JOIN thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc ON cau_truc_danh_muc.cap_do_cua_danh_muc = thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc.cap_do_cua_danh_muc JOIN dinh_nghia_thuoc_tinh ON thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc.id_thuoc_tinh = dinh_nghia_thuoc_tinh.id_thuoc_tinh WHERE dinh_nghia_thuoc_tinh.ten_thuoc_tinh = 'gia_tinh_theo_do_la' ORDER BY gia_tinh_theo_do_la LIMIT 1
SELECT AVG(gia_tinh_theo_euro) AS avg_price, MIN(gia_tinh_theo_euro) AS min_price FROM noi_dung_danh_muc
SELECT AVG(gia_tinh_theo_euro) AS trung_binh, MIN(gia_tinh_theo_euro) AS min_gia FROM noi_dung_danh_muc
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc ORDER BY gia_tinh_theo_do_la DESC LIMIT 1
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc ORDER BY CAST(chieu_cao AS INTEGER) DESC LIMIT 1
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc ORDER BY CAST(dung_tich AS INTEGER) ASC LIMIT 1
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc ORDER BY CAST(dung_tich AS INTEGER) ASC LIMIT 1
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE so_luong_co_phieu_cua_san_pham LIKE ' 2%'
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE so_luong_co_phieu_cua_san_pham LIKE '2%'
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE cap_do_cua_danh_muc = 8
SELECT T1.ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc AS T1 JOIN cau_truc_danh_muc AS T2 ON T1.cap_do_cua_danh_muc = T2.cap_do_cua_danh_muc WHERE T2.cap_do_cua_danh_muc = 8
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE chieu_dai < 3 OR chieu_rong > 5
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE chieu_dai < 3 OR chieu_rong > 5
SELECT dinh_nghia_thuoc_tinh.id_thuoc_tinh, dinh_nghia_thuoc_tinh.ten_thuoc_tinh FROM dinh_nghia_thuoc_tinh JOIN thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc ON dinh_nghia_thuoc_tinh.id_thuoc_tinh = thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc.id_thuoc_tinh WHERE thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc.gia_tri_thuoc_tinh = '0'
SELECT ten_thuoc_tinh, id_thuoc_tinh FROM dinh_nghia_thuoc_tinh WHERE id_thuoc_tinh IN (SELECT id_thuoc_tinh FROM thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc WHERE gia_tri_thuoc_tinh = '0')
SELECT ten_muc_nhap_cua_danh_muc, dung_tich FROM noi_dung_danh_muc JOIN thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc ON noi_dung_danh_muc.id_muc_nhap_cua_danh_muc = thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc.id_muc_nhap_cua_danh_muc JOIN dinh_nghia_thuoc_tinh ON thuoc_tinh_bo_sung_cho_noi_dung_cua_danh_muc.id_thuoc_tinh = dinh_nghia_thuoc_tinh.id_thuoc_tinh WHERE dinh_nghia_thuoc_tinh.ten_thuoc_tinh = 'gia_tinh_theo_euro' AND gia_tinh_theo_euro > 700
SELECT ten_muc_nhap_cua_danh_muc, dung_tich FROM noi_dung_danh_muc WHERE gia_tinh_theo_euro > 700 OR gia_tinh_theo_bang_anh > 700 OR gia_tinh_theo_do_la > 700
SELECT ngay_thay_doi_moi_nhat_duoc_thuc_hien FROM danh_muc GROUP BY ngay_thay_doi_moi_nhat_duoc_thuc_hien HAVING COUNT(*) > 1
SELECT ngay_thay_doi_moi_nhat_duoc_thuc_hien FROM danh_muc GROUP BY ngay_thay_doi_moi_nhat_duoc_thuc_hien HAVING COUNT(*) > 1 ORDER BY ngay_thay_doi_moi_nhat_duoc_thuc_hien DESC
SELECT COUNT(*) FROM noi_dung_danh_muc
SELECT COUNT(*) FROM noi_dung_danh_muc WHERE id_danh_muc = 1
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE id_muc_nhap_tiep_theo > 8
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE id_muc_nhap_tiep_theo > 8
SELECT COUNT(*) FROM nha_khoa_hoc
SELECT COUNT(*) FROM nha_khoa_hoc
SELECT SUM(so_gio) FROM du_an
SELECT SUM(so_gio) FROM du_an
SELECT COUNT(DISTINCT phan_cong_du_an.nha_khoa_hoc) FROM phan_cong_du_an JOIN du_an ON phan_cong_du_an.du_an = du_an.ma JOIN nha_khoa_hoc ON phan_cong_du_an.nha_khoa_hoc = nha_khoa_hoc.ssn
SELECT COUNT(DISTINCT nha_khoa_hoc) FROM phan_cong_du_an GROUP BY du_an HAVING COUNT(DISTINCT nha_khoa_hoc) > 1
SELECT COUNT(*) FROM du_an
SELECT COUNT(*) FROM du_an
SELECT AVG(so_gio) FROM du_an WHERE ma IN (SELECT du_an FROM phan_cong_du_an)
SELECT AVG(so_gio) FROM du_an
SELECT ten FROM du_an ORDER BY so_gio DESC LIMIT 1
SELECT ten FROM du_an ORDER BY so_gio DESC LIMIT 1
SELECT ten FROM du_an WHERE so_gio > (SELECT AVG(so_gio) FROM du_an) ORDER BY so_gio DESC
SELECT du_an.ten, du_an.so_gio FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an GROUP BY du_an.ma ORDER BY COUNT(*) DESC LIMIT 1
SELECT du_an.ten, du_an.so_gio FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an GROUP BY du_an.ma ORDER BY COUNT(*) DESC LIMIT 1
SELECT du_an.ten FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an JOIN nha_khoa_hoc ON phan_cong_du_an.nha_khoa_hoc = nha_khoa_hoc.ssn WHERE nha_khoa_hoc.ten LIKE '%Smith%'
SELECT du_an.ten FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an JOIN nha_khoa_hoc ON phan_cong_du_an.nha_khoa_hoc = nha_khoa_hoc.ssn WHERE nha_khoa_hoc.ten LIKE '%Smith%'
SELECT SUM(T3.so_gio) FROM nha_khoa_hoc AS T1 JOIN phan_cong_du_an AS T2 ON T1.ssn = T2.nha_khoa_hoc JOIN du_an AS T3 ON T2.du_an = T3.ma WHERE T1.ten = 'Michael Rogers' OR T1.ten = 'Carol Smith'
SELECT SUM(T3.so_gio) FROM nha_khoa_hoc AS T1 JOIN phan_cong_du_an AS T2 ON T1.ssn = T2.nha_khoa_hoc JOIN du_an AS T3 ON T2.du_an = T3.ma WHERE T1.ten = 'Michael Rogers' OR T1.ten = 'Carol Smith'
SELECT ten FROM du_an WHERE so_gio BETWEEN 100 AND 300
SELECT ten FROM du_an WHERE so_gio BETWEEN 100 AND 300
SELECT ten FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc JOIN du_an ON phan_cong_du_an.du_an = du_an.ma WHERE du_an.ten = 'Vật chất của thời gian' OR du_an.ten = 'Hiện tượng thị sai kỳ bí' GROUP BY nha_khoa_hoc.ssn HAVING COUNT(DISTINCT du_an.ma) = 2
SELECT T1.ten FROM nha_khoa_hoc AS T1 JOIN phan_cong_du_an AS T2 ON T1.ssn = T2.nha_khoa_hoc JOIN du_an AS T3 ON T2.du_an = T3.ma WHERE T3.ten = 'Vật chất của thời gian' OR T3.ten = 'Hiện tượng thị sai kỳ bí' GROUP BY T1.ssn HAVING COUNT(DISTINCT T3.ma) = 2
SELECT ten FROM nha_khoa_hoc ORDER BY ten ASC
SELECT ten FROM nha_khoa_hoc ORDER BY ten ASC
SELECT COUNT(*) FROM phan_cong_du_an JOIN du_an ON phan_cong_du_an.du_an = du_an.ma GROUP BY phan_cong_du_an.du_an ORDER BY COUNT(*) DESC
SELECT du_an.ten, COUNT(phan_cong_du_an.nha_khoa_hoc) FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an GROUP BY du_an.ma ORDER BY COUNT(phan_cong_du_an.nha_khoa_hoc) DESC
SELECT COUNT(*) FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc JOIN du_an ON phan_cong_du_an.du_an = du_an.ma WHERE du_an.so_gio > 300 GROUP BY phan_cong_du_an.nha_khoa_hoc HAVING COUNT(*) > 1
SELECT du_an.ten, COUNT(phan_cong_du_an.nha_khoa_hoc) FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an WHERE du_an.so_gio > 300 GROUP BY du_an.ma ORDER BY COUNT(phan_cong_du_an.nha_khoa_hoc) DESC
SELECT nha_khoa_hoc.ssn, COUNT(phan_cong_du_an.du_an) AS count, nha_khoa_hoc.ten FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc GROUP BY nha_khoa_hoc.ssn ORDER BY count DESC
SELECT nha_khoa_hoc.ten, COUNT(*) AS so_du_an FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc GROUP BY nha_khoa_hoc.ssn ORDER BY COUNT(*) DESC
SELECT nha_khoa_hoc.ssn, nha_khoa_hoc.ten FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc JOIN du_an ON phan_cong_du_an.du_an = du_an.ma ORDER BY du_an.so_gio DESC LIMIT 1
SELECT nha_khoa_hoc.ssn, nha_khoa_hoc.ten FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc JOIN du_an ON phan_cong_du_an.du_an = du_an.ma ORDER BY du_an.so_gio DESC LIMIT 1
SELECT T1.ten FROM nha_khoa_hoc AS T1 JOIN phan_cong_du_an AS T2 ON T1.ssn = T2.nha_khoa_hoc JOIN du_an AS T3 ON T2.du_an = T3.ma GROUP BY T1.ssn HAVING COUNT(DISTINCT T3.ma) > 0
SELECT T1.ten FROM nha_khoa_hoc AS T1 JOIN phan_cong_du_an AS T2 ON T1.ssn = T2.nha_khoa_hoc GROUP BY T1.ssn HAVING COUNT(DISTINCT T2.du_an) > 0
SELECT ten FROM du_an EXCEPT SELECT T1.ten FROM du_an T1 JOIN phan_cong_du_an T2 ON T1.ma = T2.du_an
SELECT ten FROM du_an EXCEPT SELECT T1.ten FROM du_an T1 JOIN phan_cong_du_an T2 ON T1.ma = T2.du_an
SELECT ten FROM nha_khoa_hoc WHERE ssn NOT IN (SELECT nha_khoa_hoc FROM phan_cong_du_an)
SELECT ten FROM nha_khoa_hoc EXCEPT SELECT T1.ten FROM phan_cong_du_an AS T1 JOIN nha_khoa_hoc AS T2 ON T1.nha_khoa_hoc = T2.ssn
SELECT COUNT(*) FROM nha_khoa_hoc AS T1 WHERE T1.ssn NOT IN (SELECT nha_khoa_hoc FROM phan_cong_du_an)
SELECT COUNT(*) FROM nha_khoa_hoc AS T1 WHERE T1.ssn NOT IN (SELECT nha_khoa_hoc FROM phan_cong_du_an)
SELECT ten FROM nha_khoa_hoc WHERE ssn NOT IN (SELECT nha_khoa_hoc FROM phan_cong_du_an JOIN du_an ON phan_cong_du_an.du_an = du_an.ma WHERE du_an.so_gio = (SELECT MAX(so_gio) FROM du_an))
SELECT ten FROM nha_khoa_hoc WHERE ssn NOT IN (SELECT nha_khoa_hoc FROM phan_cong_du_an WHERE du_an = (SELECT ma FROM du_an ORDER BY so_gio DESC LIMIT 1))
SELECT nha_khoa_hoc.ten, du_an.ten, du_an.so_gio FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc JOIN du_an ON phan_cong_du_an.du_an = du_an.ma ORDER BY du_an.ten, nha_khoa_hoc.ten
SELECT T1.ten, T3.ten, T3.so_gio FROM nha_khoa_hoc AS T1 JOIN phan_cong_du_an AS T2 ON T1.ssn = T2.nha_khoa_hoc JOIN du_an AS T3 ON T2.du_an = T3.ma ORDER BY T3.ten, T1.ten
SELECT du_an.ten, nha_khoa_hoc.ten FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an JOIN nha_khoa_hoc ON phan_cong_du_an.nha_khoa_hoc = nha_khoa_hoc.ssn WHERE du_an.ma = (SELECT ma FROM du_an ORDER BY so_gio ASC LIMIT 1)
SELECT du_an.ten, nha_khoa_hoc.ten FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an JOIN nha_khoa_hoc ON phan_cong_du_an.nha_khoa_hoc = nha_khoa_hoc.ssn ORDER BY du_an.so_gio ASC LIMIT 1
SELECT COUNT(*) FROM tau
SELECT COUNT(*) FROM tau
SELECT ten FROM tau ORDER BY trong_tai ASC
SELECT ten FROM tau ORDER BY trong_tai ASC
SELECT loai, quoc_tich FROM tau
SELECT quoc_tich, loai FROM tau
SELECT ten FROM tau WHERE quoc_tich != 'Hoa Kỳ'
SELECT ten FROM tau WHERE quoc_tich != 'Hoa Kỳ'
SELECT ten FROM tau WHERE quoc_tich = 'Hoa Kỳ' OR quoc_tich = 'Vương quốc Anh'
SELECT ten FROM tau WHERE quoc_tich = 'Mỹ' OR quoc_tich = 'Anh'
SELECT ten FROM tau ORDER BY trong_tai DESC LIMIT 1
SELECT ten FROM tau ORDER BY trong_tai DESC LIMIT 1
SELECT loai, COUNT(*) FROM tau GROUP BY loai ORDER BY COUNT(*) DESC
SELECT loai AS ten_loai_tau, COUNT(*) AS so_luong_con_tau FROM tau GROUP BY loai ORDER BY so_luong_con_tau DESC LIMIT 10
SELECT loai FROM tau GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai FROM tau GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_tich FROM tau GROUP BY quoc_tich HAVING COUNT(*) > 2
SELECT quoc_tich FROM tau GROUP BY quoc_tich HAVING COUNT(*) > 2
SELECT loai, AVG(trong_tai) FROM tau GROUP BY loai
SELECT loai, AVG(trong_tai) FROM tau GROUP BY loai
SELECT T1.ten, T2.ma, T2.so_phan FROM tau AS T1 JOIN nhiem_vu AS T2 ON T1.id_tau = T2.id_tau
SELECT nhiem_vu.ma, nhiem_vu.so_phan, tau.ten FROM nhiem_vu JOIN tau ON nhiem_vu.id_tau = tau.id_tau
SELECT T1.ten FROM tau AS T1 JOIN nhiem_vu AS T2 ON T1.id_tau = T2.id_tau WHERE T2.duoc_dua_ra_nam_nao > 1928
SELECT T1.ten FROM tau AS T1 JOIN nhiem_vu AS T2 ON T1.id_tau = T2.id_tau WHERE T2.duoc_dua_ra_nam_nao > 1928
SELECT nhiem_vu.so_phan FROM nhiem_vu JOIN tau ON nhiem_vu.id_tau = tau.id_tau WHERE tau.quoc_tich = 'Hoa Kỳ'
SELECT nhiem_vu.so_phan FROM nhiem_vu JOIN tau ON nhiem_vu.id_tau = tau.id_tau WHERE tau.quoc_tich = 'Hoa Kỳ'
SELECT ten FROM tau WHERE id_tau NOT IN (SELECT id_tau FROM nhiem_vu)
SELECT ten FROM tau WHERE id_tau NOT IN (SELECT id_tau FROM nhiem_vu)
SELECT loai FROM tau WHERE trong_tai > 6000 INTERSECT SELECT loai FROM tau WHERE trong_tai < 4000
SELECT loai FROM tau WHERE trong_tai > 6000 INTERSECT SELECT loai FROM tau WHERE trong_tai < 4000
SELECT COUNT(*) FROM ca_si
SELECT COUNT(*) FROM ca_si
SELECT ten FROM ca_si ORDER BY gia_tri_tai_san_rong ASC
SELECT ten FROM ca_si ORDER BY gia_tri_tai_san_rong ASC
SELECT nam_sinh, quoc_tich FROM ca_si
SELECT nam_sinh, quoc_tich FROM ca_si
SELECT ten FROM ca_si WHERE quoc_tich != 'Pháp'
SELECT ten FROM ca_si WHERE quoc_tich != 'Pháp'
SELECT ten FROM ca_si WHERE nam_sinh = 1948 OR nam_sinh = 1949
SELECT ten FROM ca_si WHERE nam_sinh = 1948 OR nam_sinh = 1949
SELECT ten FROM ca_si ORDER BY gia_tri_tai_san_rong DESC LIMIT 1
SELECT ten FROM ca_si ORDER BY gia_tri_tai_san_rong DESC LIMIT 1
SELECT quoc_tich, COUNT(*) FROM ca_si GROUP BY quoc_tich
SELECT quoc_tich, COUNT(*) FROM ca_si GROUP BY quoc_tich
SELECT quoc_tich FROM ca_si GROUP BY quoc_tich ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_tich FROM ca_si GROUP BY quoc_tich ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_tich, MAX(gia_tri_tai_san_rong) FROM ca_si GROUP BY quoc_tich ORDER BY MAX(gia_tri_tai_san_rong) DESC
SELECT quoc_tich, MAX(gia_tri_tai_san_rong) FROM ca_si GROUP BY quoc_tich ORDER BY MAX(gia_tri_tai_san_rong) DESC LIMIT 1
SELECT bai_hat.tieu_de, ca_si.ten FROM bai_hat JOIN ca_si ON bai_hat.id_ca_si = ca_si.id_ca_si
SELECT bai_hat.tieu_de, ca_si.ten FROM bai_hat JOIN ca_si ON bai_hat.id_ca_si = ca_si.id_ca_si
SELECT ca_si.ten FROM ca_si JOIN bai_hat ON ca_si.id_ca_si = bai_hat.id_ca_si WHERE bai_hat.doanh_so > 300000 GROUP BY ca_si.id_ca_si HAVING COUNT(*) > 0 ORDER BY ca_si.ten ASC
SELECT T1.ten FROM bai_hat JOIN ca_si AS T1 ON bai_hat.id_ca_si = T1.id_ca_si WHERE bai_hat.doanh_so > 300000 GROUP BY T1.id_ca_si HAVING COUNT(*) = 1 ORDER BY bai_hat.doanh_so DESC LIMIT 1000000
SELECT T1.ten FROM bai_hat JOIN ca_si AS T1 ON bai_hat.id_ca_si = T1.id_ca_si GROUP BY T1.id_ca_si HAVING COUNT(*) > 1
SELECT T2.ten FROM bai_hat AS T1 JOIN ca_si AS T2 ON T1.id_ca_si = T2.id_ca_si GROUP BY T2.id_ca_si HAVING COUNT(*) > 1
SELECT ca_si.ten, SUM(bai_hat.doanh_so) FROM ca_si JOIN bai_hat ON ca_si.id_ca_si = bai_hat.id_ca_si GROUP BY ca_si.id_ca_si ORDER BY SUM(bai_hat.doanh_so) DESC LIMIT 10
SELECT ca_si.ten, SUM(bai_hat.doanh_so) FROM ca_si JOIN bai_hat ON ca_si.id_ca_si = bai_hat.id_ca_si GROUP BY ca_si.id_ca_si ORDER BY SUM(bai_hat.doanh_so) DESC
SELECT ten FROM ca_si WHERE id_ca_si NOT IN (SELECT DISTINCT id_ca_si FROM bai_hat)
SELECT ten FROM ca_si WHERE id_ca_si NOT IN (SELECT DISTINCT id_ca_si FROM bai_hat)
SELECT quoc_tich FROM ca_si WHERE nam_sinh < 1945 OR nam_sinh > 1955
SELECT quoc_tich FROM ca_si WHERE nam_sinh < 1945 OR nam_sinh > 1955
SELECT COUNT(*) FROM cau_lac_bo
SELECT COUNT(*) FROM cau_lac_bo
SELECT DISTINCT khu_vuc FROM cau_lac_bo ORDER BY khu_vuc ASC
SELECT khu_vuc FROM cau_lac_bo ORDER BY khu_vuc ASC
SELECT AVG(vang) FROM thu_hang_cua_cau_lac_bo
SELECT AVG(thu_hang_cua_cau_lac_bo.vang) FROM thu_hang_cua_cau_lac_bo JOIN cau_lac_bo ON thu_hang_cua_cau_lac_bo.id_cau_lac_bo = cau_lac_bo.id_cau_lac_bo WHERE thu_hang_cua_cau_lac_bo.vang IS NOT NULL
SELECT loai_cuoc_thi, quoc_gia FROM cuoc_thi
SELECT loai_cuoc_thi, quoc_gia FROM cuoc_thi
SELECT nam FROM cuoc_thi WHERE loai_cuoc_thi != 'Giải đấu'
SELECT nam FROM cuoc_thi WHERE loai_cuoc_thi != 'Giải đấu'
SELECT thu_hang_cua_cau_lac_bo.bac FROM thu_hang_cua_cau_lac_bo ORDER BY thu_hang_cua_cau_lac_bo.bac DESC LIMIT 1 UNION SELECT thu_hang_cua_cau_lac_bo.bac FROM thu_hang_cua_cau_lac_bo ORDER BY thu_hang_cua_cau_lac_bo.bac ASC LIMIT 1
SELECT bac FROM thu_hang_cua_cau_lac_bo ORDER BY bac DESC LIMIT 1 UNION SELECT bac FROM thu_hang_cua_cau_lac_bo ORDER BY bac ASC LIMIT 1
SELECT COUNT(*) FROM cau_lac_bo WHERE id_cau_lac_bo IN (SELECT id_cau_lac_bo FROM thu_hang_cua_cau_lac_bo WHERE vang + bac + dong < 10)
SELECT COUNT(*) FROM cau_lac_bo WHERE id_cau_lac_bo IN (SELECT id_cau_lac_bo FROM thu_hang_cua_cau_lac_bo WHERE vang + bac + dong < 10)
SELECT ten FROM cau_lac_bo ORDER BY nam_thanh_lap ASC
SELECT ten FROM cau_lac_bo ORDER BY nam_thanh_lap ASC
SELECT ten FROM cau_lac_bo ORDER BY ten DESC
SELECT ten FROM cau_lac_bo ORDER BY ten DESC
SELECT cau_lac_bo.ten, cau_thu.id_cau_thu FROM cau_lac_bo JOIN cau_thu ON cau_lac_bo.id_cau_lac_bo = cau_thu.id_cau_lac_bo
SELECT cau_thu.id_cau_thu, cau_lac_bo.ten FROM cau_thu JOIN cau_lac_bo ON cau_thu.id_cau_lac_bo = cau_lac_bo.id_cau_lac_bo
SELECT cau_lac_bo.ten FROM cau_lac_bo JOIN cau_thu ON cau_lac_bo.id_cau_lac_bo = cau_thu.id_cau_lac_bo WHERE cau_thu.vi_tri = 'Cánh phải' GROUP BY cau_lac_bo.id_cau_lac_bo HAVING COUNT(DISTINCT cau_thu.id_cau_thu) > 0
SELECT T2.ten FROM cau_thu AS T1 JOIN cau_lac_bo AS T2 ON T1.id_cau_lac_bo = T2.id_cau_lac_bo WHERE T1.vi_tri = 'Cánh phải' GROUP BY T2.id_cau_lac_bo HAVING COUNT(*) > 0
SELECT AVG(diem_so) FROM cau_thu WHERE id_cau_lac_bo = (SELECT id_cau_lac_bo FROM cau_lac_bo WHERE ten = 'AIB')
SELECT AVG(diem_so) FROM cau_thu WHERE id_cau_lac_bo = (SELECT id_cau_lac_bo FROM cau_lac_bo WHERE ten = 'AIB')
SELECT vi_tri, AVG(diem_so) FROM cau_thu GROUP BY vi_tri ORDER BY AVG(diem_so) DESC
SELECT vi_tri, SUM(diem_so) / COUNT(*) AS diem_trung_binh FROM cau_thu GROUP BY vi_tri
SELECT vi_tri FROM cau_thu WHERE diem_so > 20 GROUP BY vi_tri HAVING AVG(diem_so) > 20 ORDER BY vi_tri ASC
SELECT vi_tri FROM cau_thu GROUP BY vi_tri HAVING AVG(diem_so) > 20
SELECT loai_cuoc_thi, COUNT(*) FROM cuoc_thi GROUP BY loai_cuoc_thi ORDER BY COUNT(*) DESC
SELECT loai_cuoc_thi, COUNT(*) FROM cuoc_thi GROUP BY loai_cuoc_thi ORDER BY COUNT(*) DESC
SELECT loai_cuoc_thi FROM cuoc_thi GROUP BY loai_cuoc_thi ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai_cuoc_thi FROM cuoc_thi GROUP BY loai_cuoc_thi ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai_cuoc_thi FROM cuoc_thi GROUP BY loai_cuoc_thi HAVING COUNT(*) < 5
SELECT loai_cuoc_thi FROM cuoc_thi GROUP BY loai_cuoc_thi ORDER BY COUNT(*) DESC LIMIT 5
SELECT ten FROM cau_lac_bo WHERE id_cau_lac_bo NOT IN (SELECT id_cau_lac_bo FROM cau_thu)
SELECT ten FROM cau_lac_bo WHERE id_cau_lac_bo NOT IN (SELECT id_cau_lac_bo FROM cau_thu)
SELECT vi_tri FROM cau_thu WHERE diem_so > 20 INTERSECT SELECT vi_tri FROM cau_thu WHERE diem_so < 10
SELECT vi_tri FROM cau_thu WHERE diem_so > 20 INTERSECT SELECT vi_tri FROM cau_thu WHERE diem_so < 10 ORDER BY vi_tri
SELECT SUM(diem_so) FROM cau_thu
SELECT SUM(diem_so) FROM cau_thu
SELECT COUNT(DISTINCT vi_tri) FROM cau_thu
SELECT COUNT(DISTINCT vi_tri) FROM cau_thu
SELECT ten FROM cau_thu WHERE diem_so > (SELECT AVG(diem_so) FROM cau_thu)
SELECT ten FROM cau_thu WHERE diem_so > (SELECT AVG(diem_so) FROM cau_thu)
SELECT vi_tri, COUNT(*) FROM cau_thu WHERE diem_so < 30 GROUP BY vi_tri ORDER BY COUNT(*) DESC
SELECT vi_tri, COUNT(*) FROM cau_thu WHERE diem_so < 30 GROUP BY vi_tri ORDER BY COUNT(*) DESC
SELECT quoc_gia, COUNT(*) FROM cuoc_thi GROUP BY quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_gia FROM cuoc_thi GROUP BY quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi = 'Giao huynh' OR loai_cuoc_thi = 'Giai dau'
SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi = 'Giao huynh' OR loai_cuoc_thi = 'Giai dau'
SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi = 'Giao huynh' EXCEPT SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi = 'Giao huynh'
SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi != 'Giao huynh' EXCEPT SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi = 'Giao huynh'
SELECT COUNT(*) FROM su_kien
SELECT ten FROM su_kien ORDER BY nam DESC
SELECT ten FROM su_kien ORDER BY nam DESC LIMIT 1
SELECT COUNT(*) FROM san_van_dong
SELECT ten FROM san_van_dong ORDER BY suc_chua DESC LIMIT 1
SELECT ten FROM san_van_dong WHERE suc_chua < (SELECT AVG(suc_chua) FROM san_van_dong)
SELECT quoc_gia FROM san_van_dong GROUP BY quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_gia FROM san_van_dong GROUP BY quoc_gia HAVING COUNT(*) <= 3
SELECT san_van_dong.quoc_gia FROM san_van_dong WHERE san_van_dong.suc_chua > 60000 INTERSECT SELECT san_van_dong.quoc_gia FROM san_van_dong WHERE san_van_dong.suc_chua < 50000
SELECT COUNT(DISTINCT thanh_pho) FROM san_van_dong WHERE nam_mo_cua < 2006
SELECT quoc_gia, COUNT(*) FROM san_van_dong GROUP BY quoc_gia ORDER BY COUNT(*) DESC
SELECT quoc_gia FROM san_van_dong WHERE nam_mo_cua > 2006 GROUP BY quoc_gia HAVING COUNT(*) = 0
SELECT COUNT(*) FROM san_van_dong WHERE quoc_gia != 'Nga'
SELECT van_dong_vien_boi.ten, ho_so.ket_qua, van_dong_vien_boi.100_met FROM van_dong_vien_boi JOIN ho_so ON van_dong_vien_boi.id = ho_so.id_van_dong_vien_boi ORDER BY ho_so.ket_qua ASC, van_dong_vien_boi.100_met ASC
SELECT COUNT(DISTINCT van_dong_vien_boi.quoc_tich) FROM van_dong_vien_boi JOIN ho_so ON van_dong_vien_boi.id = ho_so.id_van_dong_vien_boi JOIN su_kien ON ho_so.id_su_kien = su_kien.id JOIN san_van_dong ON su_kien.id_san_van_dong = san_van_dong.id WHERE san_van_dong.quoc_gia IS NOT NULL AND van_dong_vien_boi.quoc_tich = san_van_dong.quoc_gia
SELECT quoc_gia FROM san_van_dong GROUP BY quoc_gia HAVING COUNT(*) > 1
SELECT ho_so.ket_qua FROM ho_so JOIN van_dong_vien_boi ON ho_so.id_van_dong_vien_boi = van_dong_vien_boi.id WHERE van_dong_vien_boi.quoc_tich = 'Úc' AND van_dong_vien_boi.200_met IS NOT NULL AND van_dong_vien_boi.300_met IS NOT NULL
SELECT van_dong_vien_boi.ten FROM van_dong_vien_boi JOIN ho_so ON van_dong_vien_boi.id = ho_so.id_van_dong_vien_boi WHERE ho_so.ket_qua = 'thắng lợi'
SELECT T1.ten FROM san_van_dong AS T1 JOIN su_kien AS T2 ON T1.id = T2.id_san_van_dong GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_van_dong.ten, san_van_dong.suc_chua FROM san_van_dong JOIN su_kien ON san_van_dong.id = su_kien.id_san_van_dong WHERE su_kien.ten = 'giải trẻ thế giới'
SELECT ten FROM san_van_dong WHERE id NOT IN (SELECT id_san_van_dong FROM su_kien)
SELECT van_dong_vien_boi.ten FROM van_dong_vien_boi JOIN ho_so ON van_dong_vien_boi.id = ho_so.id_van_dong_vien_boi GROUP BY van_dong_vien_boi.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT van_dong_vien_boi.ten FROM van_dong_vien_boi JOIN ho_so ON van_dong_vien_boi.id = ho_so.id_van_dong_vien_boi GROUP BY van_dong_vien_boi.id HAVING COUNT(*) >= 2
SELECT van_dong_vien_boi.ten, van_dong_vien_boi.quoc_tich FROM ho_so JOIN van_dong_vien_boi ON ho_so.id_van_dong_vien_boi = van_dong_vien_boi.id GROUP BY van_dong_vien_boi.id HAVING COUNT(*) > 1
SELECT ten FROM van_dong_vien_boi WHERE id NOT IN (SELECT id_van_dong_vien_boi FROM ho_so)
SELECT van_dong_vien_boi.ten FROM van_dong_vien_boi JOIN ho_so ON van_dong_vien_boi.id = ho_so.id_van_dong_vien_boi WHERE ho_so.ket_qua = 'thang' INTERSECT SELECT van_dong_vien_boi.ten FROM van_dong_vien_boi JOIN ho_so ON van_dong_vien_boi.id = ho_so.id_van_dong_vien_boi WHERE ho_so.ket_qua = 'thua'
SELECT T1.ten FROM san_van_dong AS T1 JOIN ho_so AS T2 ON T1.id = T2.id_su_kien JOIN van_dong_vien_boi AS T3 ON T2.id_van_dong_vien_boi = T3.id WHERE T3.quoc_tich = 'Úc' GROUP BY T1.id HAVING COUNT(DISTINCT T2.id) > 0
SELECT T1.ten FROM san_van_dong AS T1 JOIN su_kien AS T3 ON T3.id_san_van_dong = T1.id JOIN ho_so AS T2 ON T2.id_su_kien = T3.id GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT van_dong_vien_boi.id, van_dong_vien_boi.ten, van_dong_vien_boi.quoc_tich, van_dong_vien_boi.100_met, van_dong_vien_boi.200_met, van_dong_vien_boi.300_met, van_dong_vien_boi.400_met, van_dong_vien_boi.500_met, van_dong_vien_boi.600_met, van_dong_vien_boi.700_met, van_dong_vien_boi.thoi_gian FROM van_dong_vien_boi AS T1 JOIN ho_so AS T2 ON T1.id = T2.id_van_dong_vien_boi JOIN su_kien AS T3 ON T2.id_su_kien = T3.id JOIN san_van_dong AS T4 ON T3.id_san_van_dong = T4.id
SELECT AVG(san_van_dong.suc_chua) FROM san_van_dong JOIN su_kien ON san_van_dong.id = su_kien.id_san_van_dong WHERE su_kien.nam = '2005'
SELECT COUNT(*) FROM nha_dau_tu
SELECT * FROM nha_dau_tu AS T1
SELECT * FROM lot
SELECT so_tien_giao_dich FROM giao_dich ORDER BY so_tien_giao_dich DESC LIMIT 1
SELECT ngay_giao_dich, so_luong_co_phieu FROM giao_dich
SELECT id_giao_dich FROM giao_dich WHERE ma_loai_giao_dich = 'mua'
SELECT ngay_giao_dich FROM giao_dich JOIN loai_giao_dich ON giao_dich.ma_loai_giao_dich = loai_giao_dich.ma_loai_giao_dich WHERE loai_giao_dich.mo_ta_ve_loai_giao_dich = 'bán'
SELECT AVG(so_tien_giao_dich) FROM giao_dich JOIN loai_giao_dich ON giao_dich.ma_loai_giao_dich = loai_giao_dich.ma_loai_giao_dich WHERE loai_giao_dich.mo_ta_ve_loai_giao_dich = 'bán'
SELECT loai_giao_dich.mo_ta_ve_loai_giao_dich FROM loai_giao_dich JOIN giao_dich ON giao_dich.ma_loai_giao_dich = loai_giao_dich.ma_loai_giao_dich WHERE giao_dich.ma_loai_giao_dich = 'mua'
SELECT so_tien_giao_dich FROM giao_dich JOIN loai_giao_dich ON giao_dich.ma_loai_giao_dich = loai_giao_dich.ma_loai_giao_dich WHERE loai_giao_dich.ma_loai_giao_dich = 'mua' AND so_luong_co_phieu > 50 ORDER BY so_tien_giao_dich LIMIT 1
SELECT so_luong_co_phieu FROM giao_dich WHERE so_tien_giao_dich < 1000 ORDER BY so_luong_co_phieu DESC LIMIT 1
SELECT ngay_giao_dich FROM giao_dich WHERE so_luong_co_phieu > 100 OR so_tien_giao_dich < 1000
SELECT giao_dich.ngay_giao_dich, loai_giao_dich.mo_ta_ve_loai_giao_dich FROM giao_dich JOIN loai_giao_dich ON giao_dich.ma_loai_giao_dich = loai_giao_dich.ma_loai_giao_dich WHERE CAST(giao_dich.so_luong_co_phieu AS INTEGER) < 10
SELECT nha_dau_tu.id_nha_dau_tu, nha_dau_tu.chi_tiet_ve_nha_dau_tu FROM nha_dau_tu JOIN giao_dich ON nha_dau_tu.id_nha_dau_tu = giao_dich.id_nha_dau_tu WHERE CAST(giao_dich.so_luong_co_phieu AS INTEGER) > 150
SELECT COUNT(DISTINCT giao_dich.ma_loai_giao_dich) FROM giao_dich JOIN loai_giao_dich ON giao_dich.ma_loai_giao_dich = loai_giao_dich.ma_loai_giao_dich
SELECT lot.chi_tiet_ve_cac_lot, nha_dau_tu.id_nha_dau_tu FROM lot JOIN nha_dau_tu ON lot.id_nha_dau_tu = nha_dau_tu.id_nha_dau_tu
SELECT chi_tiet_ve_cac_lot FROM lot JOIN nha_dau_tu ON lot.id_nha_dau_tu = nha_dau_tu.id_nha_dau_tu WHERE nha_dau_tu.chi_tiet_ve_nha_dau_tu = ' l '
SELECT mua_hang.chi_tiet_mua_hang FROM mua_hang JOIN giao_dich ON mua_hang.id_giao_dich_mua_hang = giao_dich.id_giao_dich WHERE giao_dich.so_tien_giao_dich > 10000
SELECT ban_hang.chi_tiet_ban_hang, giao_dich.ngay_giao_dich FROM ban_hang JOIN giao_dich ON ban_hang.id_giao_dich_ban_hang = giao_dich.id_giao_dich WHERE giao_dich.so_tien_giao_dich < 3000
SELECT lot.chi_tiet_ve_cac_lot FROM lot JOIN giao_dich ON lot.id_lot = giao_dich_lot.id_lot JOIN giao_dich_lot ON giao_dich.id_giao_dich = giao_dich_lot.id_giao_dich WHERE giao_dich.so_luong_co_phieu < '50'
SELECT lot.chi_tiet_ve_cac_lot FROM lot JOIN giao_dich ON lot.id_nha_dau_tu = giao_dich.id_nha_dau_tu WHERE CAST(giao_dich.so_luong_co_phieu AS INTEGER) > 100 AND giao_dich.ma_loai_giao_dich = 'buy'
SELECT AVG(so_tien_giao_dich) FROM giao_dich JOIN loai_giao_dich ON giao_dich.ma_loai_giao_dich = loai_giao_dich.ma_loai_giao_dich GROUP BY loai_giao_dich.ma_loai_giao_dich
SELECT giao_dich.ma_loai_giao_dich, MAX(giao_dich.so_luong_co_phieu) AS max_so_luong, MIN(giao_dich.so_luong_co_phieu) AS min_so_luong FROM giao_dich JOIN loai_giao_dich ON giao_dich.ma_loai_giao_dich = loai_giao_dich.ma_loai_giao_dich GROUP BY giao_dich.ma_loai_giao_dich
SELECT giao_dich.id_nha_dau_tu, AVG(CAST(giao_dich.so_luong_co_phieu AS REAL)) FROM giao_dich JOIN nha_dau_tu ON giao_dich.id_nha_dau_tu = nha_dau_tu.id_nha_dau_tu GROUP BY giao_dich.id_nha_dau_tu
SELECT giao_dich.id_nha_dau_tu, AVG(CAST(giao_dich.so_luong_co_phieu AS REAL)) FROM giao_dich JOIN nha_dau_tu ON giao_dich.id_nha_dau_tu = nha_dau_tu.id_nha_dau_tu GROUP BY giao_dich.id_nha_dau_tu ORDER BY AVG(CAST(giao_dich.so_luong_co_phieu AS REAL))
SELECT nha_dau_tu.id_nha_dau_tu, COUNT(*) AS so_luong_giao_dich_trung_binh FROM giao_dich JOIN nha_dau_tu ON giao_dich.id_nha_dau_tu = nha_dau_tu.id_nha_dau_tu GROUP BY nha_dau_tu.id_nha_dau_tu
SELECT lot.id_lot, COUNT(*) AS so_luong_giao_dich FROM giao_dich JOIN giao_dich_lot ON giao_dich.id_giao_dich = giao_dich_lot.id_giao_dich JOIN lot ON giao_dich_lot.id_lot = lot.id_lot GROUP BY lot.id_lot
SELECT giao_dich_lot.id_lot, COUNT(*) AS so_luong_giao_dich FROM giao_dich JOIN giao_dich_lot ON giao_dich.id_giao_dich = giao_dich_lot.id_giao_dich GROUP BY giao_dich_lot.id_lot ORDER BY COUNT(*)
SELECT COUNT(*) FROM giao_dich JOIN loai_giao_dich ON giao_dich.ma_loai_giao_dich = loai_giao_dich.ma_loai_giao_dich WHERE loai_giao_dich.mo_ta_ve_loai_giao_dich = 'Bán' GROUP BY giao_dich.id_nha_dau_tu
SELECT id_nha_dau_tu, COUNT(*) FROM giao_dich GROUP BY id_nha_dau_tu ORDER BY COUNT(*) DESC
SELECT ma_loai_giao_dich FROM giao_dich GROUP BY ma_loai_giao_dich ORDER BY COUNT(*) ASC LIMIT 1
SELECT ma_loai_giao_dich FROM giao_dich GROUP BY ma_loai_giao_dich ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai_giao_dich.mo_ta_ve_loai_giao_dich FROM loai_giao_dich JOIN giao_dich ON loai_giao_dich.ma_loai_giao_dich = giao_dich.ma_loai_giao_dich GROUP BY loai_giao_dich.ma_loai_giao_dich ORDER BY COUNT(*) DESC LIMIT 1
SELECT g.id_nha_dau_tu, nd.chi_tiet_ve_nha_dau_tu, COUNT(*) AS so_lan_giao_dich FROM giao_dich g JOIN nha_dau_tu nd ON g.id_nha_dau_tu = nd.id_nha_dau_tu GROUP BY g.id_nha_dau_tu ORDER BY COUNT(*) DESC LIMIT 3
SELECT id_nha_dau_tu FROM giao_dich GROUP BY id_nha_dau_tu HAVING COUNT(*) >= 2
SELECT g.id_nha_dau_tu, n.chi_tiet_ve_nha_dau_tu FROM giao_dich AS g JOIN loai_giao_dich AS l ON g.ma_loai_giao_dich = l.ma_loai_giao_dich JOIN nha_dau_tu AS n ON g.id_nha_dau_tu = n.id_nha_dau_tu WHERE l.mo_ta_ve_loai_giao_dich = 'ban' GROUP BY g.id_nha_dau_tu HAVING COUNT(*) >= 2
SELECT ngay_giao_dich FROM giao_dich WHERE so_luong_co_phieu >= 100 OR so_tien_giao_dich > 100
SELECT chi_tiet_ban_hang FROM ban_hang JOIN giao_dich ON ban_hang.id_giao_dich_ban_hang = giao_dich.id_giao_dich UNION SELECT chi_tiet_mua_hang FROM mua_hang JOIN giao_dich ON mua_hang.id_giao_dich_mua_hang = giao_dich.id_giao_dich
SELECT lot.chi_tiet_ve_cac_lot FROM lot WHERE lot.id_lot NOT IN (SELECT giao_dich_lot.id_lot FROM giao_dich_lot)
SELECT COUNT(*) FROM dbo.nha_ga_tau_hoa JOIN dbo.nha_ga ON nha_ga_tau_hoa.id_nha_ga = nha_ga.id_ga_tau JOIN dbo.toa_hoa ON nha_ga_tau_hoa.id_tau = toa_hoa.id_tau
SELECT T1.ten, T1.dia_diem, T1.so_luong_san_ga FROM nha_ga AS T1
SELECT dia_diem FROM nha_ga
SELECT ten, tong_so_hanh_khach FROM nha_ga WHERE dia_diem != 'London'
SELECT ten, dich_vu_chinh FROM nha_ga ORDER BY tong_so_hanh_khach DESC LIMIT 3
SELECT AVG(tong_so_hanh_khach), MAX(tong_so_hanh_khach) FROM nha_ga WHERE dia_diem = 'London' OR dia_diem = 'Glasgow'
SELECT nha_ga.dia_diem, SUM(nha_ga.so_luong_san_ga), SUM(nha_ga.tong_so_hanh_khach) FROM nha_ga GROUP BY nha_ga.dia_diem
SELECT nha_ga.dia_diem FROM nha_ga WHERE nha_ga.so_luong_san_ga >= 15 AND nha_ga.tong_so_hanh_khach > 25
SELECT dia_diem FROM nha_ga WHERE id_ga_tau NOT IN (SELECT id_nha_ga FROM nha_ga_tau_hoa) AND so_luong_san_ga < 15
SELECT dia_diem FROM nha_ga ORDER BY so_luong_xuat_canh_hang_nam DESC LIMIT 1
SELECT toa_hoa.ten, toa_hoa.thoi_gian, toa_hoa.dich_vu FROM toa_hoa JOIN nha_ga_tau_hoa ON toa_hoa.id_tau = nha_ga_tau_hoa.id_tau JOIN nha_ga ON nha_ga_tau_hoa.id_nha_ga = nha_ga.id_ga_tau
SELECT COUNT(*) FROM toa_hoa JOIN nha_ga_tau_hoa ON toa_hoa.id_tau = nha_ga_tau_hoa.id_tau JOIN nha_ga ON nha_ga_tau_hoa.id_nha_ga = nha_ga.id_ga_tau
SELECT ten, dich_vu FROM toa_hoa ORDER BY thoi_gian ASC
SELECT nha_ga.ten, COUNT(nha_ga_tau_hoa.id_tau) FROM nha_ga JOIN nha_ga_tau_hoa ON nha_ga.id_ga_tau = nha_ga_tau_hoa.id_nha_ga GROUP BY nha_ga.id_ga_tau ORDER BY COUNT(nha_ga_tau_hoa.id_tau) DESC
SELECT toa_hoa.ten, nha_ga.ten FROM toa_hoa JOIN nha_ga_tau_hoa ON toa_hoa.id_tau = nha_ga_tau_hoa.id_tau JOIN nha_ga ON nha_ga_tau_hoa.id_nha_ga = nha_ga.id_ga_tau
SELECT toa_hoa.ten, toa_hoa.thoi_gian FROM toa_hoa JOIN nha_ga_tau_hoa ON toa_hoa.id_tau = nha_ga_tau_hoa.id_tau JOIN nha_ga ON nha_ga_tau_hoa.id_nha_ga = nha_ga.id_ga_tau WHERE nha_ga.dia_diem = 'London' ORDER BY toa_hoa.thoi_gian DESC
SELECT T1.ten FROM nha_ga AS T1 JOIN nha_ga_tau_hoa AS T2 ON T1.id_ga_tau = T2.id_nha_ga JOIN toa_hoa AS T3 ON T2.id_tau = T3.id_tau GROUP BY T1.id_ga_tau ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten FROM nha_ga AS T1 JOIN nha_ga_tau_hoa AS T2 ON T1.id_ga_tau = T2.id_nha_ga JOIN toa_hoa AS T3 ON T2.id_tau = T3.id_tau GROUP BY T1.id_ga_tau HAVING COUNT(*) >= 2
SELECT nha_ga.dia_diem FROM nha_ga JOIN nha_ga_tau_hoa ON nha_ga.id_ga_tau = nha_ga_tau_hoa.id_nha_ga GROUP BY nha_ga.dia_diem HAVING COUNT(DISTINCT nha_ga_tau_hoa.id_tau) = 1
SELECT ten FROM nha_ga WHERE id_ga_tau NOT IN (SELECT id_nha_ga FROM nha_ga_tau_hoa)
SELECT T1.ten FROM nha_ga AS T1 JOIN nha_ga_tau_hoa AS T2 ON T1.id_ga_tau = T2.id_nha_ga JOIN toa_hoa AS T3 ON T2.id_tau = T3.id_tau WHERE T3.ten = 'Ananthapuri Express' OR T3.ten = 'Guruvayur Express' GROUP BY T1.id_ga_tau HAVING COUNT(DISTINCT T3.ten) = 2
SELECT ten FROM toa_hoa WHERE id_tau NOT IN (SELECT T2.id_tau FROM nha_ga_tau_hoa AS T2 JOIN nha_ga AS T3 ON T2.id_nha_ga = T3.id_ga_tau WHERE T3.dia_diem = 'London')
SELECT ten, dia_diem FROM nha_ga ORDER BY so_luong_xuat_canh_hang_nam DESC, so_luong_trao_doi_hang_nam DESC
SELECT COUNT(*) FROM ma_vung_cua_tieu_bang
SELECT ma_so_thi_sinh, ten_thi_sinh FROM thi_sinh ORDER BY ten_thi_sinh DESC
SELECT id_phieu_bau, so_dien_thoai, ma_vung_cua_tieu_bang.ma_vung FROM phieu_bau JOIN ma_vung_cua_tieu_bang ON phieu_bau.tieu_bang = ma_vung_cua_tieu_bang.tieu_bang
SELECT MIN(ma_vung), MAX(ma_vung) FROM dbo.ma_vung_cua_tieu_bang
SELECT MAX(ngay_duoc_tao) FROM phieu_bau JOIN ma_vung_cua_tieu_bang ON phieu_bau.tieu_bang = ma_vung_cua_tieu_bang.tieu_bang WHERE ma_vung = 'CA'
SELECT ten_thi_sinh FROM thi_sinh WHERE ten_thi_sinh != 'Jessie Alloway'
SELECT phieu_bau.tieu_bang, phieu_bau.ngay_duoc_tao FROM phieu_bau JOIN ma_vung_cua_tieu_bang ON phieu_bau.tieu_bang = ma_vung_cua_tieu_bang.tieu_bang
SELECT thi_sinh.ma_so_thi_sinh, thi_sinh.ten_thi_sinh FROM thi_sinh JOIN phieu_bau ON thi_sinh.ma_so_thi_sinh = phieu_bau.ma_so_thi_sinh GROUP BY thi_sinh.ma_so_thi_sinh, thi_sinh.ten_thi_sinh HAVING COUNT(*) >= 2
SELECT T1.ma_so_thi_sinh, T1.ten_thi_sinh FROM thi_sinh AS T1 JOIN phieu_bau AS T2 ON T1.ma_so_thi_sinh = T2.ma_so_thi_sinh GROUP BY T1.ma_so_thi_sinh ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM phieu_bau WHERE tieu_bang IN (SELECT tieu_bang FROM ma_vung_cua_tieu_bang WHERE ma_vung IN (1, 2))
SELECT COUNT(*) FROM thi_sinh WHERE ma_so_thi_sinh NOT IN (SELECT ma_so_thi_sinh FROM phieu_bau)
SELECT ma_vung FROM phieu_bau JOIN ma_vung_cua_tieu_bang ON phieu_bau.tieu_bang = ma_vung_cua_tieu_bang.tieu_bang GROUP BY ma_vung ORDER BY COUNT(*) DESC LIMIT 1
SELECT ngay_duoc_tao, tieu_bang, so_dien_thoai FROM phieu_bau JOIN thi_sinh ON phieu_bau.ma_so_thi_sinh = thi_sinh.ma_so_thi_sinh WHERE thi_sinh.ten_thi_sinh = 'Tabatha Gehling'
SELECT ma_vung FROM ma_vung_cua_tieu_bang JOIN phieu_bau ON ma_vung_cua_tieu_bang.tieu_bang = phieu_bau.tieu_bang WHERE ma_so_thi_sinh = 12345 OR ma_so_thi_sinh = 67890 GROUP BY ma_vung HAVING COUNT(DISTINCT ma_so_thi_sinh) = 2
SELECT ten_thi_sinh FROM thi_sinh WHERE ten_thi_sinh LIKE '% Al%'
SELECT COUNT(*) FROM nguoi_choi
SELECT COUNT(*) FROM nguoi_choi
SELECT COUNT(*) FROM tran_dau
SELECT COUNT(*) FROM tran_dau
SELECT ten, ngay_sinh FROM nguoi_choi WHERE ma_quoc_gia = 'USA'
SELECT ten, ngay_sinh FROM nguoi_choi WHERE ma_quoc_gia = 'US'
SELECT AVG(tuoi_cua_nguoi_thua_cuoc) AS avg_age_loser, AVG(tuoi_cua_nguoi_chien_thang) AS avg_age_winner FROM tran_dau
SELECT AVG(tuoi_cua_nguoi_thua_cuoc) AS AVG_age_loser, AVG(tuoi_cua_nguoi_chien_thang) AS AVG_age_winner FROM tran_dau
SELECT AVG(thu_hang_nguoi_chien_thang) FROM tran_dau
SELECT AVG(thu_hang_nguoi_chien_thang) FROM tran_dau
SELECT thu_hang_cua_nguoi_thua_cuoc FROM tran_dau ORDER BY thu_hang_cua_nguoi_thua_cuoc ASC LIMIT 1
SELECT thu_hang_cua_nguoi_thua_cuoc FROM tran_dau ORDER BY thu_hang_cua_nguoi_thua_cuoc ASC LIMIT 1
SELECT COUNT(DISTINCT ma_quoc_gia) FROM nguoi_choi
SELECT COUNT(DISTINCT ma_quoc_gia) FROM nguoi_choi
SELECT COUNT(DISTINCT tran_dau.nguoi_thua_cuoc) FROM tran_dau
SELECT COUNT(DISTINCT nguoi_thua_cuoc) FROM tran_dau
SELECT ten_giai_dau FROM tran_dau GROUP BY ten_giai_dau HAVING COUNT(*) > 10
SELECT ten_giai_dau FROM tran_dau GROUP BY ten_giai_dau HAVING COUNT(*) > 10 ORDER BY ten_giai_dau
SELECT tran_dau.nguoi_chien_thang FROM tran_dau WHERE tran_dau.nam = 2013 INTERSECT SELECT tran_dau.nguoi_chien_thang FROM tran_dau WHERE tran_dau.nam = 2016
SELECT ten FROM tran_dau JOIN nguoi_choi ON tran_dau.id_cua_nguoi_chien_thang = nguoi_choi.id_nguoi_choi WHERE nam = 2013 INTERSECT SELECT ten FROM tran_dau JOIN nguoi_choi ON tran_dau.id_cua_nguoi_chien_thang = nguoi_choi.id_nguoi_choi WHERE nam = 2016
SELECT COUNT(*) FROM tran_dau WHERE nam = 2013 OR nam = 2016
SELECT COUNT(*) FROM tran_dau WHERE nam IN (2013, 2016)
SELECT nguoi_choi.ma_quoc_gia, nguoi_choi.ten FROM nguoi_choi JOIN tran_dau ON nguoi_choi.id_nguoi_choi = tran_dau.id_cua_nguoi_chien_thang WHERE tran_dau.ten_giai_dau IN ('WTA Championship', 'Australian Open') GROUP BY nguoi_choi.id_nguoi_choi HAVING COUNT(DISTINCT tran_dau.ten_giai_dau) = 2
SELECT T1.ten, T1.ma_quoc_gia FROM nguoi_choi AS T1 JOIN tran_dau AS T2 ON T1.id_nguoi_choi = T2.id_cua_nguoi_chien_thang WHERE T2.ten_giai_dau = 'WTA' INTERSECT SELECT T1.ten, T1.ma_quoc_gia FROM nguoi_choi AS T1 JOIN tran_dau AS T2 ON T1.id_nguoi_choi = T2.id_cua_nguoi_chien_thang WHERE T2.ten_giai_dau = 'Australian Open'
SELECT ten, ma_quoc_gia FROM nguoi_choi ORDER BY (JULIANDAY('now') - JULIANDAY(ngay_sinh)) DESC LIMIT 1
SELECT ten, ma_quoc_gia FROM nguoi_choi ORDER BY ngay_sinh DESC LIMIT 1
SELECT ten, ho FROM nguoi_choi ORDER BY ngay_sinh
SELECT ten_nguoi_thua_cuoc FROM tran_dau JOIN nguoi_choi ON tran_dau.id_nguoi_thua_cuoc = nguoi_choi.id_nguoi_choi UNION SELECT ten_nguoi_chien_thang FROM tran_dau JOIN nguoi_choi ON tran_dau.id_cua_nguoi_chien_thang = nguoi_choi.id_nguoi_choi UNION SELECT ten FROM nguoi_choi ORDER BY ngay_sinh ASC
SELECT ten, ho FROM nguoi_choi WHERE tay_thuan = 'tay trai' ORDER BY ngay_sinh
SELECT ten_nguoi_thua_cuoc FROM tran_dau JOIN nguoi_choi ON tran_dau.id_nguoi_thua_cuoc = nguoi_choi.id_nguoi_choi WHERE tay_thuan_cua_nguoi_thua_cuoc = 'left' ORDER BY ngay_sinh ASC
SELECT ten, ma_quoc_gia FROM nguoi_choi JOIN xep_hang ON nguoi_choi.id_nguoi_choi = xep_hang.id_nguoi_choi GROUP BY nguoi_choi.id_nguoi_choi ORDER BY COUNT(*) DESC LIMIT 1
SELECT nguoi_choi.ten, nguoi_choi.ma_quoc_gia FROM xep_hang JOIN nguoi_choi ON xep_hang.id_nguoi_choi = nguoi_choi.id_nguoi_choi GROUP BY nguoi_choi.id_nguoi_choi ORDER BY COUNT(*) DESC LIMIT 1
SELECT nam, COUNT(*) AS so_luong FROM tran_dau GROUP BY nam ORDER BY so_luong DESC LIMIT 1
SELECT nam, COUNT(*) FROM tran_dau GROUP BY nam ORDER BY COUNT(*) DESC LIMIT 1
SELECT tran_dau.nguoi_chien_thang, tran_dau.diem_xep_hang_cua_nguoi_chien_thang FROM tran_dau ORDER BY tran_dau.so_tran DESC LIMIT 1
SELECT tran_dau.nguoi_chien_thang, xep_hang.diem_xep_hang FROM tran_dau JOIN xep_hang ON tran_dau.id_cua_nguoi_chien_thang = xep_hang.id_nguoi_choi ORDER BY tran_dau.so_tran DESC LIMIT 1
SELECT tran_dau.nguoi_chien_thang FROM tran_dau JOIN xep_hang ON tran_dau.id_cua_nguoi_chien_thang = xep_hang.id_nguoi_choi WHERE tran_dau.ten_giai_dau = 'Úc mở rộng' ORDER BY xep_hang.diem_xep_hang DESC LIMIT 1
SELECT tran_dau.nguoi_chien_thang FROM tran_dau JOIN xep_hang ON tran_dau.id_cua_nguoi_chien_thang = xep_hang.id_nguoi_choi WHERE tran_dau.ten_giai_dau = 'Úc mở rộng' ORDER BY xep_hang.diem_xep_hang DESC LIMIT 1
SELECT tran_dau.nguoi_thua_cuoc, tran_dau.nguoi_chien_thang FROM tran_dau ORDER BY tran_dau.phut DESC LIMIT 1
SELECT tran_dau.nguoi_chien_thang, tran_dau.nguoi_thua_cuoc FROM tran_dau ORDER BY tran_dau.phut DESC LIMIT 1
SELECT ten, AVG(xep_hang.xep_hang) AS thuc_hang_trung_binh FROM nguoi_choi JOIN xep_hang ON nguoi_choi.id_nguoi_choi = xep_hang.id_nguoi_choi GROUP BY nguoi_choi.id_nguoi_choi ORDER BY thuc_hang_trung_binh ASC
SELECT nguoi_choi.ten, AVG(xep_hang.xep_hang) AS trung_binh_xep_hang FROM nguoi_choi JOIN xep_hang ON nguoi_choi.id_nguoi_choi = xep_hang.id_nguoi_choi GROUP BY nguoi_choi.id_nguoi_choi ORDER BY trung_binh_xep_hang ASC
SELECT nguoi_choi.ten, SUM(xep_hang.diem_xep_hang) AS tong_diem_xep_hang FROM nguoi_choi JOIN xep_hang ON nguoi_choi.id_nguoi_choi = xep_hang.id_nguoi_choi GROUP BY nguoi_choi.id_nguoi_choi ORDER BY tong_diem_xep_hang DESC
SELECT nguoi_choi.ten, SUM(xep_hang.diem_xep_hang) AS tong_diem_xep_hang FROM nguoi_choi JOIN xep_hang ON nguoi_choi.id_nguoi_choi = xep_hang.id_nguoi_choi GROUP BY nguoi_choi.id_nguoi_choi ORDER BY tong_diem_xep_hang DESC
SELECT ma_quoc_gia, COUNT(*) FROM nguoi_choi GROUP BY ma_quoc_gia
SELECT ma_quoc_gia, COUNT(*) FROM nguoi_choi GROUP BY ma_quoc_gia
SELECT ma_quoc_gia FROM nguoi_choi GROUP BY ma_quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_quoc_gia FROM nguoi_choi GROUP BY ma_quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_quoc_gia FROM nguoi_choi GROUP BY ma_quoc_gia HAVING COUNT(*) > 50
SELECT ma_quoc_gia FROM nguoi_choi GROUP BY ma_quoc_gia HAVING COUNT(*) > 50
SELECT ngay_xep_hang, COUNT(*) AS tour_du_dau FROM xep_hang GROUP BY ngay_xep_hang
SELECT xep_hang.ngay_xep_hang, COUNT(*) AS tour_du_dau FROM xep_hang GROUP BY xep_hang.ngay_xep_hang ORDER BY COUNT(*) DESC
SELECT nam, COUNT(*) FROM tran_dau GROUP BY nam ORDER BY nam ASC
SELECT COUNT(*) FROM tran_dau GROUP BY nam ORDER BY nam ASC
SELECT ten_nguoi_chien_thang, thu_hang_nguoi_chien_thang FROM tran_dau ORDER BY tuoi_cua_nguoi_chien_thang ASC LIMIT 3
SELECT ten_nguoi_chien_thang, thu_hang_nguoi_chien_thang FROM tran_dau ORDER BY tuoi_cua_nguoi_chien_thang ASC LIMIT 3
SELECT COUNT(DISTINCT tran_dau.id_cua_nguoi_chien_thang) FROM tran_dau JOIN nguoi_choi ON tran_dau.id_cua_nguoi_chien_thang = nguoi_choi.id_nguoi_choi WHERE ten_giai_dau = 'giải vô địch WTA' AND tay_thuan_cua_nguoi_chien_thang = 'left'
SELECT COUNT(*) FROM tran_dau JOIN nguoi_choi ON tran_dau.id_cua_nguoi_chien_thang = nguoi_choi.id_nguoi_choi WHERE tay_thuan_cua_nguoi_chien_thang = 'Left' AND ten_giai_dau = 'WTA Championship'
SELECT nguoi_choi.ten, nguoi_choi.ma_quoc_gia, nguoi_choi.ngay_sinh FROM nguoi_choi JOIN tran_dau ON tran_dau.id_cua_nguoi_chien_thang = nguoi_choi.id_nguoi_choi ORDER BY xep_hang.diem_xep_hang DESC LIMIT 1
SELECT tran_dau.nguoi_chien_thang, nguoi_choi.ma_quoc_gia, nguoi_choi.ngay_sinh FROM tran_dau JOIN nguoi_choi ON tran_dau.id_cua_nguoi_chien_thang = nguoi_choi.id_nguoi_choi ORDER BY xep_hang.diem_xep_hang DESC LIMIT 1
SELECT tay_thuan, COUNT(*) FROM nguoi_choi GROUP BY tay_thuan
SELECT tay_thuan, COUNT(*) FROM nguoi_choi GROUP BY tay_thuan
