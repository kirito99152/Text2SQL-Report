SELECT COUNT(*) FROM kien_truc_su WHERE gioi_tinh = 'nữ'
SELECT ten, quoc_tich, id FROM kien_truc_su WHERE gioi_tinh = 'nam' ORDER BY ten ASC
SELECT T2.ten , T1.chieu_dai_theo_met FROM cau AS T1 JOIN kien_truc_su AS T2 ON T1.id_kien_truc_su = T2.id ORDER BY T1.chieu_dai_theo_met DESC LIMIT 1
SELECT AVG(chieu_dai_theo_feet) FROM cau
SELECT ten, nam_xay_dung FROM nha_may WHERE loai = 'Grondzeiler'
SELECT kien_truc_su.ten, kien_truc_su.quoc_tich FROM kien_truc_su JOIN nha_may ON kien_truc_su.id_kien_truc_su = nha_may.id_kien_truc_su
SELECT ten FROM nha_may WHERE dia_diem != 'Donceel'
SELECT DISTINCT T1.loai FROM nha_may AS T1 JOIN kien_truc_su AS T2 ON T1.id_kien_truc_su = T2.id WHERE T2.quoc_tich IN ('Mỹ', 'Canada')
SELECT T1.id, T1.ten FROM kien_truc_su AS T1 JOIN cau AS T2 ON T1.id = T2.id_kien_truc_su GROUP BY T1.id HAVING COUNT(*) >= 3
SELECT T1.id, T1.ten, T1.quoc_tich FROM kien_truc_su AS T1 JOIN nha_may AS T2 ON T1.id = T2.id_kien_truc_su GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id, T1.ten, T1.gioi_tinh FROM kien_truc_su AS T1 LEFT JOIN cau AS T2 ON T1.id = T2.id_kien_truc_su LEFT JOIN nha_may AS T3 ON T1.id = T3.id_kien_truc_su GROUP BY T1.id HAVING COUNT(T2.id) >= 2 OR COUNT(T3.id) >= 1
SELECT dia_diem FROM cau WHERE ten = 'Cổng vòm Kolob' OR ten = 'Cầu cầu vồng'
SELECT ten FROM nha_may WHERE ten LIKE '%Moulin%'
SELECT DISTINCT T1.ten FROM nha_may AS T1 JOIN kien_truc_su AS T2 ON T1.id_kien_truc_su = T2.id JOIN cau AS T3 ON T2.id = T3.id_kien_truc_su WHERE T3.chieu_dai_theo_met > 80
SELECT loai , COUNT(*) FROM nha_may GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM kien_truc_su AS T1 WHERE T1.id NOT IN (SELECT T2.id_kien_truc_su FROM nha_may AS T2 WHERE T2.nam_xay_dung < 1850)
SELECT T1.ten FROM cau AS T1 JOIN kien_truc_su AS T2 ON T1.id_kien_truc_su = T2.id WHERE T2.quoc_tich = 'Mỹ' ORDER BY T1.chieu_dai_theo_met ASC
SELECT dia_diem FROM rap_chieu_phim WHERE dia_diem NOT IN (SELECT dia_diem FROM rap_chieu_phim WHERE suc_chua > 800)
SELECT dia_diem FROM rap_chieu_phim WHERE nam_mo_cua IN (2010, 2011) GROUP BY dia_diem HAVING COUNT(DISTINCT nam_mo_cua) = 2
SELECT COUNT(*) FROM rap_chieu_phim
SELECT COUNT(*) FROM rap_chieu_phim
SELECT ten, nam_mo_cua, suc_chua FROM rap_chieu_phim
SELECT ten, dia_diem FROM rap_chieu_phim WHERE suc_chua > (SELECT AVG(suc_chua) FROM rap_chieu_phim)
SELECT dia_diem FROM rap_chieu_phim GROUP BY dia_diem HAVING COUNT(*) > 1
SELECT DISTINCT dia_diem FROM rap_chieu_phim
SELECT ten, nam_mo_cua FROM rap_chieu_phim ORDER BY nam_mo_cua DESC
SELECT ten, dia_diem FROM rap_chieu_phim ORDER BY suc_chua DESC LIMIT 1
SELECT AVG(suc_chua), MIN(suc_chua), MAX(suc_chua) FROM rap_chieu_phim WHERE nam_mo_cua > 2011
SELECT dia_diem, COUNT(*) FROM rap_chieu_phim GROUP BY dia_diem
SELECT dia_diem , COUNT ( * ) FROM rap_chieu_phim WHERE nam_mo_cua >= 2010 GROUP BY dia_diem ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT dia_diem FROM rap_chieu_phim WHERE suc_chua > 300 GROUP BY dia_diem HAVING COUNT(*) >= 2
SELECT dia_diem FROM rap_chieu_phim WHERE suc_chua > 300 GROUP BY dia_diem HAVING COUNT(*) >= 2
SELECT tieu_de, duoc_dao_dien_boi FROM phim
SELECT tieu_de, duoc_dao_dien_boi FROM phim
SELECT duoc_dao_dien_boi FROM phim
SELECT duoc_dao_dien_boi FROM phim
SELECT duoc_dao_dien_boi , COUNT ( * ) FROM phim GROUP BY duoc_dao_dien_boi
SELECT T1.id_rap_chieu_phim , SUM(T2.so_luong_suat_chieu_moi_ngay) FROM rap_chieu_phim AS T1 JOIN lich_chieu_phim AS T2 ON T1.id_rap_chieu_phim = T2.id_rap_chieu_phim GROUP BY T1.id_rap_chieu_phim
SELECT T1.tieu_de, MAX(T2.gia) FROM phim AS T1 JOIN lich_chieu_phim AS T2 ON T1.id_phim = T2.id_phim GROUP BY T1.id_phim
SELECT phim.tieu_de, MAX(lich_chieu_phim.gia) FROM phim JOIN lich_chieu_phim ON phim.id_phim = lich_chieu_phim.id_phim GROUP BY phim.id_phim
SELECT T2.ten, T3.tieu_de, T1.ngay, T1.gia FROM lich_chieu_phim AS T1 JOIN rap_chieu_phim AS T2 ON T1.id_rap_chieu_phim = T2.id_rap_chieu_phim JOIN phim AS T3 ON T1.id_phim = T3.id_phim
SELECT tieu_de, duoc_dao_dien_boi FROM phim EXCEPT SELECT T1.tieu_de, T1.duoc_dao_dien_boi FROM phim T1 JOIN lich_chieu_phim T2 ON T1.id_phim = T2.id_phim
SELECT T1.duoc_dao_dien_boi , COUNT ( * ) FROM phim AS T1 JOIN lich_chieu_phim AS T2 ON T1.id_phim = T2.id_phim GROUP BY T1.id_phim ORDER BY COUNT ( * ) DESC LIMIT 1
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
SELECT * FROM khoa_hoc WHERE ngay IN ('MON', 'TUE', 'WED')
SELECT ten_khoa_hoc FROM khoa_hoc WHERE ngay = 'MTW'
SELECT COUNT(*) FROM khoa WHERE bo_phan = 'AS'
SELECT COUNT(*) FROM khoa WHERE bo_phan = 'AS'
SELECT so_dien_thoai_khoa FROM khoa WHERE phong = '268'
SELECT so_dien_thoai_khoa FROM khoa WHERE phong = '268'
SELECT COUNT(DISTINCT sinh_vien.id_sinh_vien) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien WHERE dang_ky_khoa_hoc.diem = 'B'
SELECT COUNT(*) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien WHERE dang_ky_khoa_hoc.diem = 'B' GROUP BY sinh_vien.id_sinh_vien
SELECT 1
SELECT 1
SELECT ten FROM sinh_vien WHERE ten LIKE '%a%'
SELECT ho, ten FROM sinh_vien WHERE ho LIKE '%a%'
SELECT ho, ten FROM giang_vien WHERE gioi_tinh = 'nam' AND toa_nha = 'NEB'
SELECT ho , ten FROM giang_vien WHERE gioi_tinh = 'nam' AND toa_nha = 'NEB'
SELECT phong FROM giang_vien WHERE ngach = 'Giáo sư' AND toa_nha = 'NEB'
SELECT phong FROM giang_vien WHERE ngach = 'Giáo sư' AND toa_nha = 'NEB'
SELECT ten_khoa FROM khoa WHERE toa_nha = 'Mergenthaler'
SELECT ten_khoa, ma_so_khoa FROM khoa WHERE toa_nha = 'Mergenthaler'
SELECT * FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT * FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT ten_khoa_hoc FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT ten_khoa_hoc FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT ho , ten FROM sinh_vien ORDER BY tuoi DESC
SELECT ten FROM sinh_vien ORDER BY tuoi DESC
SELECT ho FROM sinh_vien WHERE gioi_tinh = 'F' ORDER BY tuoi DESC
SELECT ho FROM sinh_vien WHERE gioi_tinh = 'nữ' ORDER BY tuoi DESC
SELECT ho FROM giang_vien WHERE toa_nha = 'Barton' ORDER BY ho ASC
SELECT ho FROM giang_vien WHERE toa_nha = 'Barton' ORDER BY ho ASC
SELECT ho , ten FROM giang_vien ORDER BY ho ASC , ten ASC
SELECT ho , ten FROM giang_vien WHERE ngach = 'Giáo sư' ORDER BY ho , ten ASC
SELECT khoa.ten_khoa FROM khoa JOIN chuyen_nganh_phu ON khoa.ma_so_khoa = chuyen_nganh_phu.ma_so_khoa GROUP BY khoa.ma_so_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.ten_khoa , COUNT ( * ) FROM sinh_vien AS T1 JOIN chuyen_nganh_phu AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien JOIN khoa AS T3 ON T2.ma_so_khoa = T3.ma_so_khoa GROUP BY T3.ma_so_khoa ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT ten_khoa FROM khoa WHERE ma_so_khoa NOT IN (SELECT ma_so_khoa FROM chuyen_nganh_phu)
SELECT ten_khoa FROM khoa WHERE ma_so_khoa NOT IN (SELECT ma_so_khoa FROM chuyen_nganh_phu)
SELECT khoa.ten_khoa FROM khoa LEFT JOIN la_thanh_vien_cua ON khoa.ma_so_khoa = la_thanh_vien_cua.ma_so_khoa LEFT JOIN chuyen_nganh_phu ON khoa.ma_so_khoa = chuyen_nganh_phu.ma_so_khoa GROUP BY khoa.ma_so_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT k.ten_khoa, COUNT(*) AS total_members FROM khoa k LEFT JOIN la_thanh_vien_cua l ON k.ma_so_khoa = l.ma_so_khoa LEFT JOIN chuyen_nganh_phu c ON k.ma_so_khoa = c.ma_so_khoa GROUP BY k.ma_so_khoa, k.ten_khoa ORDER BY total_members ASC LIMIT 1
SELECT ngach, COUNT(*) FROM giang_vien GROUP BY ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT ngach FROM giang_vien GROUP BY ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.ho , T1.ten FROM giang_vien AS T1 JOIN khoa_hoc AS T2 ON T1.id_giang_vien = T2.nguoi_huong_dan GROUP BY T1.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 3
SELECT T1.ho , T1.ten FROM giang_vien AS T1 JOIN khoa_hoc AS T2 ON T1.id_giang_vien = T2.nguoi_huong_dan GROUP BY T1.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 3
SELECT T1.toa_nha FROM giang_vien AS T1 JOIN khoa_hoc AS T2 ON T1.id_giang_vien = T2.nguoi_huong_dan GROUP BY T1.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.toa_nha FROM giang_vien AS T1 JOIN khoa_hoc AS T2 ON T1.id_giang_vien = T2.nguoi_huong_dan GROUP BY T1.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_khoa_hoc FROM khoa_hoc AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.id_khoa_hoc = T2.ma_khoa_hoc GROUP BY T1.id_khoa_hoc HAVING COUNT(*) >= 5
SELECT T1.ten_khoa_hoc FROM khoa_hoc AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.id_khoa_hoc = T2.ma_khoa_hoc GROUP BY T1.id_khoa_hoc HAVING COUNT(*) >= 5
SELECT T2.ho, T2.ten FROM khoa_hoc AS T1 JOIN giang_vien AS T2 ON T1.nguoi_huong_dan = T2.id_giang_vien WHERE T1.ten_khoa_hoc = ' Kỹ năng máy tính '
SELECT T2.ho , T2.ten FROM khoa_hoc AS T1 JOIN giang_vien AS T2 ON T1.nguoi_huong_dan = T2.id_giang_vien WHERE T1.ten_khoa_hoc = 'Kỹ năng máy tính'
SELECT ten_khoa_hoc, ten_khoa, phong FROM khoa_hoc JOIN khoa ON khoa_hoc.ma_so_khoa = khoa.ma_so_khoa WHERE ten_khoa_hoc = 'Giới thiệu về khoa học máy tính'
SELECT khoa.ten_khoa, khoa_hoc.phong FROM khoa_hoc JOIN khoa ON khoa_hoc.ma_so_khoa = khoa.ma_so_khoa WHERE khoa_hoc.ten_khoa_hoc = 'Giới thiệu về khoa học máy tính'
SELECT T2.ho, T2.ten, T3.diem_so FROM dang_ky_khoa_hoc AS T1 JOIN sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien JOIN chuyen_doi_diem AS T3 ON T1.diem = T3.bang_diem
SELECT sinh_vien.ho, sinh_vien.ten, dang_ky_khoa_hoc.diem FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien
SELECT T1.ho, T1.ten FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE CAST(T2.diem AS DECIMAL) > 3.8
SELECT DISTINCT T1.ho, T1.ten FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE T2.diem > '3.8'
SELECT T1.ho, T1.ten FROM giang_vien AS T1 JOIN la_thanh_vien_cua AS T2 ON T1.id_giang_vien = T2.id_giang_vien WHERE T2.ma_so_khoa = 520
SELECT giang_vien.ho || ' ' || giang_vien.ten FROM giang_vien JOIN la_thanh_vien_cua ON giang_vien.id_giang_vien = la_thanh_vien_cua.id_giang_vien WHERE la_thanh_vien_cua.ma_so_khoa = 520
SELECT T1.ho, T1.ten FROM sinh_vien AS T1 JOIN chuyen_nganh_phu AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE T2.ma_so_khoa = 140
SELECT T1.ho || ' ' || T1.ten FROM sinh_vien AS T1 JOIN chuyen_nganh_phu AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE T2.ma_so_khoa = 140
SELECT T1.ho FROM giang_vien AS T1 JOIN la_thanh_vien_cua AS T2 ON T1.id_giang_vien = T2.id_giang_vien JOIN khoa AS T3 ON T2.ma_so_khoa = T3.ma_so_khoa WHERE T3.ten_khoa = 'Khoa học máy tính'
SELECT T1.ho FROM giang_vien AS T1 JOIN la_thanh_vien_cua AS T2 ON T1.id_giang_vien = T2.id_giang_vien JOIN khoa AS T3 ON T2.ma_so_khoa = T3.ma_so_khoa WHERE T3.ten_khoa = 'Khoa học máy tính'
SELECT AVG(T3.diem_so) FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien JOIN chuyen_doi_diem AS T3 ON T2.diem = T3.bang_diem WHERE T1.ho = 'Smith'
SELECT AVG(T3.diem_so) FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien JOIN chuyen_doi_diem AS T3 ON T2.diem = T3.bang_diem WHERE T1.ho = 'Smith'
SELECT MAX(T2.diem), MIN(T2.diem) FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE T1.ma_thanh_pho = 'NYC'
SELECT 1
SELECT ten_khoa_hoc FROM khoa_hoc WHERE so_luong_tin_chi IN (1, 3) AND gio = '4'
SELECT ten_khoa_hoc FROM khoa_hoc WHERE so_luong_tin_chi IN (1, 3) AND gio = '4'
SELECT ten_khoa FROM khoa WHERE bo_phan IN ('AS', 'EN') AND toa_nha = 'NEB'
SELECT ten_khoa FROM khoa WHERE bo_phan IN ('AS', 'EN') AND toa_nha = 'NEB'
SELECT ho , ten FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM dang_ky_khoa_hoc)
SELECT ho , ten FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM dang_ky_khoa_hoc)
SELECT COUNT(*) FROM ca_si
SELECT COUNT(*) FROM ca_si
SELECT ten, quoc_gia, tuoi FROM ca_si ORDER BY tuoi DESC
SELECT ten, quoc_gia, tuoi FROM ca_si ORDER BY tuoi DESC
SELECT AVG(tuoi) AS trung_binh, MAX(tuoi) AS gia_nhat, MIN(tuoi) AS tre_nhat FROM ca_si WHERE quoc_gia = 'Pháp'
SELECT AVG(tuoi), MAX(tuoi), MIN(tuoi) FROM ca_si WHERE quoc_gia = 'Pháp'
SELECT ten_bai_hat, nam_phat_hanh_bai_hat FROM ca_si WHERE tuoi = (SELECT MIN(tuoi) FROM ca_si)
SELECT ten_bai_hat, nam_phat_hanh_bai_hat FROM ca_si ORDER BY tuoi ASC LIMIT 1
SELECT DISTINCT quoc_gia FROM ca_si WHERE tuoi > 20
SELECT quoc_gia FROM ca_si WHERE tuoi > 20
SELECT quoc_gia , COUNT ( * ) FROM ca_si GROUP BY quoc_gia
SELECT id_ca_si, COUNT(*) AS num_singers FROM ca_si GROUP BY id_ca_si
SELECT ten_bai_hat FROM ca_si WHERE tuoi > (SELECT AVG(tuoi) FROM ca_si)
SELECT ten_bai_hat FROM ca_si WHERE tuoi > (SELECT AVG(tuoi) FROM ca_si)
SELECT dia_diem , ten FROM san_van_dong WHERE suc_chua BETWEEN 5000 AND 10000
SELECT ten, dia_diem FROM san_van_dong WHERE suc_chua BETWEEN 5000 AND 10000
SELECT AVG(suc_chua), MAX(suc_chua) FROM san_van_dong
SELECT AVG(suc_chua), MAX(suc_chua) FROM san_van_dong
SELECT ten, suc_chua FROM san_van_dong ORDER BY so_luong_tham_gia_trung_binh DESC LIMIT 1
SELECT ten, suc_chua FROM san_van_dong ORDER BY so_luong_tham_gia_trung_binh DESC LIMIT 1
SELECT COUNT(*) FROM buoi_hoa_nhac WHERE nam = '2014' OR nam = '2015'
SELECT COUNT(*) FROM buoi_hoa_nhac WHERE nam = '2014' OR nam = '2015'
SELECT san_van_dong.ten , COUNT ( * ) FROM san_van_dong AS san_van_dong JOIN buoi_hoa_nhac AS buoi_hoa_nhac ON san_van_dong.id_san_van_dong = CAST(buoi_hoa_nhac.id_san_van_dong AS NUMBER) GROUP BY san_van_dong.id_san_van_dong
SELECT T1.id_san_van_dong , COUNT ( * ) FROM san_van_dong AS T1 JOIN buoi_hoa_nhac AS T2 ON T1.id_san_van_dong = T2.id_san_van_dong GROUP BY T1.id_san_van_dong
SELECT T1.ten, T1.suc_chua FROM san_van_dong AS T1 JOIN buoi_hoa_nhac AS T2 ON T1.id_san_van_dong = T2.id_san_van_dong WHERE T2.nam >= '2014' GROUP BY T1.id_san_van_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_van_dong.ten, san_van_dong.suc_chua FROM san_van_dong INNER JOIN buoi_hoa_nhac ON san_van_dong.id_san_van_dong = buoi_hoa_nhac.id_san_van_dong WHERE buoi_hoa_nhac.nam > '2013' GROUP BY san_van_dong.id_san_van_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT nam , COUNT(*) AS so_luong FROM buoi_hoa_nhac GROUP BY nam ORDER BY so_luong DESC LIMIT 1
SELECT 1
SELECT ten FROM san_van_dong WHERE id_san_van_dong NOT IN (SELECT id_san_van_dong FROM buoi_hoa_nhac)
SELECT T1.ten FROM san_van_dong AS T1 WHERE T1.id_san_van_dong NOT IN (SELECT id_san_van_dong FROM buoi_hoa_nhac)
SELECT quoc_gia FROM ca_si WHERE tuoi > 40 INTERSECT SELECT quoc_gia FROM ca_si WHERE tuoi < 30
SELECT ten FROM san_van_dong WHERE id_san_van_dong NOT IN (SELECT id_san_van_dong FROM buoi_hoa_nhac WHERE nam = '2014')
SELECT ten FROM san_van_dong WHERE id_san_van_dong NOT IN (SELECT id_san_van_dong FROM buoi_hoa_nhac WHERE nam = '2014')
SELECT T1.ten_buoi_hoa_nhac, T1.chu_de, COUNT(*) FROM buoi_hoa_nhac AS T1 JOIN ca_si_trong_buoi_hoa_nhac AS T2 ON T1.id_buoi_hoa_nhac = T2.id_buoi_hoa_nhac GROUP BY T1.id_buoi_hoa_nhac
SELECT T1.ten_buoi_hoa_nhac, T1.chu_de, COUNT(*) FROM buoi_hoa_nhac AS T1 JOIN ca_si_trong_buoi_hoa_nhac AS T2 ON T1.id_buoi_hoa_nhac = T2.id_buoi_hoa_nhac GROUP BY T1.id_buoi_hoa_nhac
SELECT ca_si.ten , COUNT ( * ) AS so_luong_buoi FROM ca_si JOIN ca_si_trong_buoi_hoa_nhac ON ca_si.id_ca_si = ca_si_trong_buoi_hoa_nhac.id_ca_si GROUP BY ca_si.id_ca_si
SELECT T1.ten , COUNT ( * ) FROM ca_si AS T1 JOIN ca_si_trong_buoi_hoa_nhac AS T2 ON T1.id_ca_si = T2.id_ca_si GROUP BY T1.id_ca_si
SELECT T1.ten FROM ca_si AS T1 JOIN ca_si_trong_buoi_hoa_nhac AS T2 ON T1.id_ca_si = T2.id_ca_si JOIN buoi_hoa_nhac AS T3 ON T2.id_buoi_hoa_nhac = T3.id_buoi_hoa_nhac WHERE T3.nam = '2014'
SELECT T1.ten FROM ca_si AS T1 JOIN ca_si_trong_buoi_hoa_nhac AS T2 ON T1.id_ca_si = T2.id_ca_si JOIN buoi_hoa_nhac AS T3 ON T2.id_buoi_hoa_nhac = T3.id_buoi_hoa_nhac WHERE T3.nam = '2014'
SELECT ten, quoc_gia FROM ca_si WHERE ten_bai_hat LIKE '%Hey%'
SELECT ten, quoc_gia FROM ca_si WHERE ten_bai_hat LIKE '%Hey%'
SELECT T1.ten, T1.dia_diem FROM san_van_dong AS T1 JOIN buoi_hoa_nhac AS T2 ON T1.id_san_van_dong = T2.id_san_van_dong WHERE T2.nam IN ('2014', '2015') GROUP BY T1.id_san_van_dong HAVING COUNT(DISTINCT T2.nam) = 2
SELECT T1.ten, T1.dia_diem FROM san_van_dong AS T1 JOIN buoi_hoa_nhac AS T2 ON T1.id_san_van_dong = T2.id_san_van_dong GROUP BY T1.id_san_van_dong HAVING COUNT(DISTINCT T2.nam) = 2
SELECT COUNT(*) FROM buoi_hoa_nhac AS T1 JOIN san_van_dong AS T2 ON T1.id_san_van_dong = T2.id_san_van_dong WHERE T2.suc_chua = (SELECT MAX(suc_chua) FROM san_van_dong)
SELECT COUNT(*) FROM buoi_hoa_nhac JOIN san_van_dong ON buoi_hoa_nhac.id_san_van_dong = san_van_dong.id_san_van_dong WHERE san_van_dong.suc_chua = (SELECT MAX(suc_chua) FROM san_van_dong)
SELECT COUNT(*) FROM khu_nha
SELECT DISTINCT mau_cua_khu_nha FROM khu_nha
SELECT chi_tiet_khu_nha, mau_cua_khu_nha FROM khu_nha ORDER BY mau_cua_khu_nha ASC
SELECT mau_cua_khu_nha, COUNT(*) FROM khu_nha GROUP BY mau_cua_khu_nha
SELECT T1.danh_muc_san_pham , COUNT ( * ) FROM chien_dich_gui_thu_quang_cao AS T1 JOIN thu_quang_cao_gui_khach_hang AS T2 ON T1.id_thu_quang_cao = T2.id_thu_quang_cao GROUP BY T1.danh_muc_san_pham
SELECT ten_khach_hang, so_dien_thoai_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM thu_quang_cao_gui_khach_hang)
SELECT T1.ten_khach_hang, T1.so_dien_thoai_khach_hang FROM khach_hang AS T1 JOIN thu_quang_cao_gui_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.ma_ket_qua = 'Không phản hồi'
SELECT ma_ket_qua , COUNT ( * ) FROM thu_quang_cao_gui_khach_hang GROUP BY ma_ket_qua
SELECT T1.ten_khach_hang FROM khach_hang AS T1 JOIN thu_quang_cao_gui_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.ma_ket_qua = 'Đặt hàng' GROUP BY T1.id_khach_hang HAVING COUNT(*) >= 2
SELECT T1.ten_khach_hang , COUNT ( * ) FROM khach_hang AS T1 JOIN thu_quang_cao_gui_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT khach_hang.ten_khach_hang, khach_hang.phuong_thuc_thanh_toan FROM khach_hang JOIN thu_quang_cao_gui_khach_hang ON khach_hang.id_khach_hang = thu_quang_cao_gui_khach_hang.id_khach_hang WHERE khach_hang.id_khach_hang IN (SELECT id_khach_hang FROM thu_quang_cao_gui_khach_hang WHERE ma_ket_qua = 'Đặt hàng') AND khach_hang.id_khach_hang IN (SELECT id_khach_hang FROM thu_quang_cao_gui_khach_hang WHERE ma_ket_qua != 'Đặt hàng')
SELECT khu_nha.mau_cua_khu_nha, dia_chi_khach_hang.ma_loai_dia_chi FROM khach_hang JOIN dia_chi_khach_hang ON khach_hang.id_khach_hang = dia_chi_khach_hang.id_khach_hang JOIN khu_nha ON dia_chi_khach_hang.id_khu_nha = khu_nha.id_khu_nha
SELECT DISTINCT ma_loai_dia_chi FROM dia_chi_khach_hang
SELECT id_khach_hang, phi_van_chuyen_don_hang FROM luot_dat_hang_cua_khach_hang WHERE ma_trang_thai_don_hang = 'Bị huỷ' OR ma_trang_thai_don_hang = 'Đã thanh toán tiền'
SELECT T1.ten_khach_hang FROM khach_hang AS T1 JOIN luot_dat_hang_cua_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.ma_phuong_thuc_van_chuyen = 'FedEx' AND T2.ma_trang_thai_don_hang = 'Đã được thanh toán'
SELECT COUNT(*) FROM tai_khoan
SELECT COUNT(*) FROM tai_khoan
SELECT id_tai_khoan, id_khach_hang, ten_tai_khoan FROM tai_khoan
SELECT id_tai_khoan, id_khach_hang, ten_tai_khoan FROM tai_khoan
SELECT chi_tiet_khac_ve_tai_khoan FROM tai_khoan WHERE ten_tai_khoan = '338'
SELECT chi_tiet_khac_ve_tai_khoan FROM tai_khoan WHERE ten_tai_khoan = '338'
SELECT T1.ten_cua_khach_hang, T1.ho_cua_khach_hang, T1.so_dien_thoai_khach_hang FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.ten_tai_khoan = '162'
SELECT T1.ten_cua_khach_hang, T1.ho_cua_khach_hang, T1.so_dien_thoai_khach_hang FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.ten_tai_khoan = '162'
SELECT COUNT(*) FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Art' AND khach_hang.ho_cua_khach_hang = 'Turcotte'
SELECT COUNT(*) FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Art' AND khach_hang.ho_cua_khach_hang = 'Turcotte'
SELECT T1.id_khach_hang , COUNT ( * ) FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang
SELECT T1.id_khach_hang , COUNT ( * ) FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang
SELECT T1.id_khach_hang , COUNT ( * ) AS so_luong_tai_khoan FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.id_khach_hang, COUNT(*) AS so_tai_khoan FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_khach_hang, T1.ten_cua_khach_hang, T1.ho_cua_khach_hang FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.id_khach_hang, T1.ten_cua_khach_hang, T1.ho_cua_khach_hang FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT ten_cua_khach_hang, ho_cua_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT CONCAT(ho_cua_khach_hang, ' ', ten_cua_khach_hang) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT khach_hang.ho_cua_khach_hang, khach_hang.ten_cua_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang
SELECT T1.ten_cua_khach_hang, T1.ho_cua_khach_hang FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang
SELECT COUNT(DISTINCT tai_khoan.id_khach_hang) FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang
SELECT COUNT(DISTINCT tai_khoan.id_khach_hang) FROM tai_khoan
SELECT COUNT(*) FROM khach_hang
SELECT COUNT(*) FROM khach_hang
SELECT id_khach_hang, ten_cua_khach_hang, ho_cua_khach_hang, so_dien_thoai_khach_hang FROM khach_hang
SELECT id_khach_hang, ten_cua_khach_hang, ho_cua_khach_hang, so_dien_thoai_khach_hang FROM khach_hang
SELECT so_dien_thoai_khach_hang, email_cua_khach_hang FROM khach_hang WHERE ten_cua_khach_hang = 'Aniyah' AND ho_cua_khach_hang = 'Feest'
SELECT so_dien_thoai_khach_hang, email_cua_khach_hang FROM khach_hang WHERE ten_cua_khach_hang = 'Aniyah' AND ho_cua_khach_hang = 'Feest'
SELECT COUNT(*) FROM the_khach_hang
SELECT COUNT(*) FROM the_khach_hang
SELECT id_the, id_khach_hang, ma_loai_the, so_the FROM the_khach_hang
SELECT id_the, id_khach_hang, ma_loai_the, so_the FROM the_khach_hang
SELECT hop_le_tu_ngay, hop_le_den_ngay FROM the_khach_hang WHERE so_the = '4560596484842'
SELECT hop_le_tu_ngay, hop_le_den_ngay FROM the_khach_hang WHERE so_the = '4560596484842'
SELECT T2.ten_cua_khach_hang, T2.ho_cua_khach_hang, T2.so_dien_thoai_khach_hang FROM the_khach_hang AS T1 JOIN khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T1.so_the = '4560596484842'
SELECT T2.ten_cua_khach_hang, T2.ho_cua_khach_hang, T2.so_dien_thoai_khach_hang FROM the_khach_hang AS T1 JOIN khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T1.so_the = '4560596484842'
SELECT COUNT(*) FROM khach_hang JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Art' AND khach_hang.ho_cua_khach_hang = 'Turcotte'
SELECT COUNT(*) FROM khach_hang JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Art' AND khach_hang.ho_cua_khach_hang = 'Turcotte'
SELECT COUNT(*) FROM the_khach_hang WHERE ma_loai_the = 'Ghi nợ'
SELECT COUNT(*) FROM the_khach_hang WHERE ma_loai_the = 'Ghi nợ'
SELECT COUNT(*) FROM khach_hang JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Blanche' AND khach_hang.ho_cua_khach_hang = 'Huels'
SELECT COUNT(*) FROM khach_hang JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Blanche' AND khach_hang.ho_cua_khach_hang = 'Huels'
SELECT T1.id_khach_hang , COUNT ( * ) FROM khach_hang AS T1 JOIN the_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang
SELECT T1.id_khach_hang , COUNT ( * ) FROM khach_hang AS T1 JOIN the_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang
SELECT T1.id_khach_hang , COUNT ( * ) AS so_the FROM khach_hang AS T1 JOIN the_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.id_khach_hang , COUNT ( * ) AS so_the FROM khach_hang AS T1 JOIN the_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.id_khach_hang, T1.ten_cua_khach_hang, T1.ho_cua_khach_hang FROM khach_hang AS T1 JOIN the_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang HAVING COUNT(*) >= 2
SELECT T1.id_khach_hang, T1.ten_cua_khach_hang, T1.ho_cua_khach_hang FROM khach_hang AS T1 JOIN the_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang HAVING COUNT(*) >= 2
SELECT T1.id_khach_hang, T1.ho_cua_khach_hang, T1.ten_cua_khach_hang FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.id_khach_hang, T1.ho_cua_khach_hang, T1.ten_cua_khach_hang FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT(*) ASC LIMIT 1
SELECT ma_loai_the, COUNT(*) FROM the_khach_hang GROUP BY ma_loai_the
SELECT ma_loai_the , COUNT ( * ) FROM the_khach_hang GROUP BY ma_loai_the
SELECT ma_loai_the, COUNT(*) AS so_the FROM the_khach_hang GROUP BY ma_loai_the ORDER BY so_the DESC LIMIT 1
SELECT ma_loai_the FROM the_khach_hang GROUP BY ma_loai_the ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_the FROM the_khach_hang GROUP BY ma_loai_the HAVING COUNT(*) >= 5
SELECT ma_loai_the FROM the_khach_hang GROUP BY ma_loai_the HAVING COUNT(*) >= 5
SELECT ma_loai_the, COUNT(DISTINCT id_khach_hang) FROM the_khach_hang GROUP BY ma_loai_the
SELECT ma_loai_the, COUNT(DISTINCT id_khach_hang) FROM the_khach_hang GROUP BY ma_loai_the
SELECT id_khach_hang, ten_cua_khach_hang, ho_cua_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM the_khach_hang)
SELECT id_khach_hang, ten_cua_khach_hang, ho_cua_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM the_khach_hang)
SELECT ma_loai_the FROM the_khach_hang
SELECT DISTINCT ma_loai_the FROM the_khach_hang
SELECT ma_loai_the , COUNT ( * ) FROM the_khach_hang AS T1 GROUP BY T1.ma_loai_the
SELECT COUNT(DISTINCT ma_loai_the) FROM the_khach_hang
SELECT loai_giao_dich FROM giao_dich_tai_chinh
SELECT DISTINCT loai_giao_dich FROM giao_dich_tai_chinh
SELECT loai_giao_dich, COUNT(*) FROM giao_dich_tai_chinh GROUP BY loai_giao_dich
SELECT COUNT(DISTINCT loai_giao_dich) FROM giao_dich_tai_chinh
SELECT SUM(so_tien_giao_dich), AVG(so_tien_giao_dich) FROM giao_dich_tai_chinh AS T1
SELECT AVG(so_tien_giao_dich), SUM(so_tien_giao_dich) FROM giao_dich_tai_chinh
SELECT T1.ma_loai_the , COUNT ( * ) FROM the_khach_hang AS T1 JOIN giao_dich_tai_chinh AS T2 ON T1.id_the = T2.id_the GROUP BY T1.ma_loai_the
SELECT T1.ma_loai_the , COUNT ( * ) FROM the_khach_hang AS T1 JOIN giao_dich_tai_chinh AS T2 ON T1.id_the = T2.id_the GROUP BY T1.ma_loai_the
SELECT loai_giao_dich , COUNT ( * ) FROM giao_dich_tai_chinh GROUP BY loai_giao_dich
SELECT loai_giao_dich, COUNT(*) FROM giao_dich_tai_chinh GROUP BY loai_giao_dich
SELECT loai_giao_dich, SUM(so_tien_giao_dich) FROM giao_dich_tai_chinh GROUP BY loai_giao_dich ORDER BY SUM(so_tien_giao_dich) DESC LIMIT 1
SELECT loai_giao_dich, SUM(so_tien_giao_dich) FROM giao_dich_tai_chinh GROUP BY loai_giao_dich ORDER BY SUM(so_tien_giao_dich) DESC LIMIT 1
SELECT T1.id_tai_khoan , COUNT ( * ) FROM tai_khoan AS T1 JOIN giao_dich_tai_chinh AS T2 ON T1.id_tai_khoan = T2.id_tai_khoan GROUP BY T1.id_tai_khoan
SELECT T1.id_tai_khoan , COUNT ( * ) FROM tai_khoan AS T1 JOIN giao_dich_tai_chinh AS T2 ON T1.id_tai_khoan = T2.id_tai_khoan GROUP BY T1.id_tai_khoan
SELECT ten_tai_lieu, so_luong_truy_cap FROM tai_lieu ORDER BY ten_tai_lieu ASC
SELECT ten_tai_lieu, so_luong_truy_cap FROM tai_lieu ORDER BY ten_tai_lieu ASC
SELECT ten_tai_lieu, so_luong_truy_cap FROM tai_lieu ORDER BY so_luong_truy_cap DESC LIMIT 1
SELECT ten_tai_lieu, so_luong_truy_cap FROM tai_lieu ORDER BY so_luong_truy_cap DESC LIMIT 1
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING COUNT(*) > 4
SELECT ma_loai_tai_lieu , COUNT ( * ) FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING COUNT ( * ) > 4
SELECT ma_loai_tai_lieu, SUM(so_luong_truy_cap) FROM tai_lieu GROUP BY ma_loai_tai_lieu ORDER BY SUM(so_luong_truy_cap) DESC LIMIT 1
SELECT SUM(so_luong_truy_cap) FROM tai_lieu WHERE ma_loai_tai_lieu = (SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu ORDER BY COUNT(*) DESC LIMIT 1)
SELECT AVG(so_luong_truy_cap) FROM tai_lieu
SELECT AVG(so_luong_truy_cap) FROM tai_lieu
SELECT T1.ma_tai_lieu, T2.mo_ta_ve_cau_truc_tai_lieu, T1.so_luong_truy_cap FROM tai_lieu AS T1 JOIN cau_truc_tai_lieu AS T2 ON T1.ma_cau_truc_tai_lieu = T2.ma_cau_truc_tai_lieu ORDER BY T1.so_luong_truy_cap ASC LIMIT 1
SELECT T2.mo_ta_ve_cau_truc_tai_lieu FROM tai_lieu AS T1 JOIN cau_truc_tai_lieu AS T2 ON T1.ma_cau_truc_tai_lieu = T2.ma_cau_truc_tai_lieu ORDER BY T1.so_luong_truy_cap ASC LIMIT 1
SELECT ma_loai_tai_lieu FROM tai_lieu WHERE ten_tai_lieu = 'David CV'
SELECT ma_loai_tai_lieu FROM tai_lieu WHERE ten_tai_lieu = 'David CV'
SELECT T1.ma_tai_lieu, T1.ten_tai_lieu, T1.ma_loai_tai_lieu, T1.ma_cau_truc_tai_lieu FROM tai_lieu AS T1 WHERE T1.ma_loai_tai_lieu IN (SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3) AND T1.ma_cau_truc_tai_lieu IN (SELECT ma_cau_truc_tai_lieu FROM cau_truc_tai_lieu GROUP BY ma_cau_truc_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3)
SELECT T1.ten_tai_lieu FROM tai_lieu AS T1 JOIN cau_truc_tai_lieu AS T2 ON T1.ma_cau_truc_tai_lieu = T2.ma_cau_truc_tai_lieu WHERE T1.ma_loai_tai_lieu IN (SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3) AND T2.ma_cau_truc_tai_lieu IN (SELECT ma_cau_truc_tai_lieu FROM cau_truc_tai_lieu GROUP BY ma_cau_truc_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3)
SELECT ma_loai_tai_lieu , SUM(so_luong_truy_cap) FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING SUM(so_luong_truy_cap) > 10000
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING SUM(so_luong_truy_cap) > 10000
SELECT cac_muc_cua_tai_lieu.tieu_de_muc FROM tai_lieu JOIN cac_muc_cua_tai_lieu ON tai_lieu.ma_tai_lieu = cac_muc_cua_tai_lieu.ma_tai_lieu WHERE tai_lieu.ten_tai_lieu = 'David CV'
SELECT T2.tieu_de_muc FROM tai_lieu AS T1 JOIN cac_muc_cua_tai_lieu AS T2 ON T1.ma_tai_lieu = T2.ma_tai_lieu WHERE T1.ten_tai_lieu = 'David CV'
SELECT ten_tai_lieu FROM tai_lieu EXCEPT SELECT T1.ten_tai_lieu FROM tai_lieu T1 JOIN cac_muc_cua_tai_lieu T2 ON T1.ma_tai_lieu = T2.ma_tai_lieu
SELECT T1.ten_tai_lieu FROM tai_lieu AS T1 LEFT JOIN cac_muc_cua_tai_lieu AS T2 ON T1.ma_tai_lieu = T2.ma_tai_lieu WHERE T2.id_muc IS NULL
SELECT ten_nguoi_dung, mat_khau FROM nguoi_dung WHERE ma_vai_tro = (SELECT ma_vai_tro FROM nguoi_dung GROUP BY ma_vai_tro ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.ten_nguoi_dung, T1.mat_khau FROM nguoi_dung AS T1 JOIN vai_tro AS T2 ON T1.ma_vai_tro = T2.ma_vai_tro GROUP BY T1.ma_vai_tro ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(T1.so_luong_truy_cap) FROM tai_lieu AS T1 JOIN cac_muc_cua_tai_lieu AS T2 ON T1.ma_tai_lieu = T2.ma_tai_lieu WHERE T2.tieu_de_muc = 'Lời cảm ơn'
SELECT AVG(tai_lieu.so_luong_truy_cap) FROM tai_lieu INNER JOIN cac_muc_cua_tai_lieu ON tai_lieu.ma_tai_lieu = cac_muc_cua_tai_lieu.ma_tai_lieu WHERE cac_muc_cua_tai_lieu.tieu_de_muc = ' Lời cảm ơn '
SELECT tai_lieu.ten_tai_lieu FROM tai_lieu LEFT JOIN cac_muc_cua_tai_lieu ON tai_lieu.ma_tai_lieu = cac_muc_cua_tai_lieu.ma_tai_lieu LEFT JOIN hinh_anh_trong_cac_muc_cua_tai_lieu ON cac_muc_cua_tai_lieu.id_muc = hinh_anh_trong_cac_muc_cua_tai_lieu.id_muc WHERE hinh_anh_trong_cac_muc_cua_tai_lieu.id_hinh_anh IS NULL
SELECT T1.ten_tai_lieu FROM tai_lieu AS T1 LEFT JOIN cac_muc_cua_tai_lieu AS T2 ON T1.ma_tai_lieu = T2.ma_tai_lieu LEFT JOIN hinh_anh_trong_cac_muc_cua_tai_lieu AS T3 ON T2.id_muc = T3.id_muc LEFT JOIN hinh_anh AS T4 ON T3.id_hinh_anh = T4.id_hinh_anh WHERE T4.id_hinh_anh IS NULL
SELECT T1.ten_tai_lieu FROM tai_lieu AS T1 JOIN cac_muc_cua_tai_lieu AS T2 ON T1.ma_tai_lieu = T2.ma_tai_lieu GROUP BY T1.ma_tai_lieu ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ma_tai_lieu, T1.ten_tai_lieu, COUNT(*) AS so_luong_muc FROM tai_lieu AS T1 JOIN cac_muc_cua_tai_lieu AS T2 ON T1.ma_tai_lieu = T2.ma_tai_lieu GROUP BY T1.ma_tai_lieu ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_tai_lieu FROM tai_lieu WHERE ten_tai_lieu LIKE '%CV%'
SELECT ten_tai_lieu FROM tai_lieu WHERE ten_tai_lieu LIKE '%CV%'
SELECT COUNT(*) FROM nguoi_dung WHERE lan_dang_nhap_cua_nguoi_dung IS NOT NULL
SELECT COUNT(*) FROM nguoi_dung WHERE lan_dang_nhap_cua_nguoi_dung IS NOT NULL
SELECT T2.mo_ta_ve_vai_tro , COUNT ( * ) FROM nguoi_dung AS T1 JOIN vai_tro AS T2 ON T1.ma_vai_tro = T2.ma_vai_tro WHERE T1.lan_dang_nhap_cua_nguoi_dung IS NOT NULL GROUP BY T1.ma_vai_tro ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.mo_ta_ve_vai_tro FROM vai_tro AS T1 JOIN nguoi_dung AS T2 ON T1.ma_vai_tro = T2.ma_vai_tro GROUP BY T1.ma_vai_tro ORDER BY COUNT(*) DESC LIMIT 1
SELECT tai_lieu.so_luong_truy_cap FROM tai_lieu INNER JOIN cau_truc_tai_lieu ON tai_lieu.ma_cau_truc_tai_lieu = cau_truc_tai_lieu.ma_cau_truc_tai_lieu ORDER BY tai_lieu.so_luong_truy_cap ASC LIMIT 1
SELECT AVG(T1.so_luong_truy_cap) FROM tai_lieu AS T1 JOIN cau_truc_tai_lieu AS T2 ON T1.ma_cau_truc_tai_lieu = T2.ma_cau_truc_tai_lieu WHERE T1.ma_cau_truc_tai_lieu IN (SELECT ma_cau_truc_tai_lieu FROM tai_lieu GROUP BY ma_cau_truc_tai_lieu HAVING COUNT(*) = (SELECT MIN(cnt) FROM (SELECT COUNT(*) AS cnt FROM tai_lieu GROUP BY ma_cau_truc_tai_lieu) AS sub))
SELECT ten_hinh_anh, duong_dan_cua_hinh_anh FROM hinh_anh ORDER BY ten_hinh_anh ASC
SELECT ten_hinh_anh, duong_dan_cua_hinh_anh FROM hinh_anh ORDER BY ten_hinh_anh ASC
SELECT T1.ma_vai_tro , COUNT(*) FROM vai_tro AS T1 JOIN nguoi_dung AS T2 ON T1.ma_vai_tro = T2.ma_vai_tro GROUP BY T1.ma_vai_tro
SELECT T2.mo_ta_ve_vai_tro, COUNT(*) FROM nguoi_dung AS T1 JOIN vai_tro AS T2 ON T1.ma_vai_tro = T2.ma_vai_tro GROUP BY T2.ma_vai_tro
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING COUNT(*) > 2
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING COUNT(*) >= 2
SELECT COUNT(*) FROM khoa_hoc
SELECT COUNT(*) FROM khoa_hoc
SELECT mo_ta_ve_khoa_hoc FROM khoa_hoc WHERE ten_khoa_hoc = ' cơ sở dữ liệu '
SELECT mo_ta_ve_khoa_hoc FROM khoa_hoc WHERE ten_khoa_hoc = 'cơ sở dữ liệu'
SELECT T1.dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan AS T1 JOIN khoa_hoc AS T2 ON T1.id_tac_gia = T2.id_tac_gia WHERE T2.ten_khoa_hoc = 'Cathrine'
SELECT dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan WHERE ten_ca_nhan = 'Cathrine'
SELECT dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
select dong_1_cua_dia_chi from tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT ten_dang_nhap, ho FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT ten_dang_nhap, ho FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_ngay_dang_ky, luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien
SELECT ngay_ngay_dang_ky, ngay_hoan_thanh FROM luot_dang_ky_khoa_hoc_cua_sinh_vien
SELECT 1
SELECT COUNT(*) FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien
SELECT COUNT(DISTINCT id_khoa_hoc) FROM luot_dang_ky_khoa_hoc_cua_sinh_vien
SELECT COUNT(DISTINCT T1.id_khoa_hoc) FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc
SELECT ngay_lam_bai_kiem_tra FROM bai_kiem_tra_cua_sinh_vien WHERE ket_qua_kiem_tra = 'Đạt'
SELECT ngay_lam_bai_kiem_tra FROM bai_kiem_tra_cua_sinh_vien WHERE ket_qua_kiem_tra = 'Đạt'
SELECT COUNT(*) FROM bai_kiem_tra_cua_sinh_vien WHERE ket_qua_kiem_tra = ' Trượt '
SELECT COUNT(*) FROM bai_kiem_tra_cua_sinh_vien WHERE ket_qua_kiem_tra = ' Trượt '
SELECT ten_dang_nhap FROM sinh_vien WHERE ho = 'Ward'
SELECT ten_dang_nhap FROM sinh_vien WHERE ho = 'Ward'
SELECT ten_ho, ngay_dang_nhap_moi_nhat FROM sinh_vien WHERE ten_ho IN ('Jaskolski', 'Langosh')
SELECT ngay_dang_nhap_moi_nhat FROM sinh_vien WHERE ten_dem IN ('Jaskolski', 'Langosh')
SELECT 1
SELECT COUNT(*) FROM sinh_vien WHERE ten_ca_nhan LIKE '%son%'
SELECT ten_mon_hoc FROM mon_hoc
SELECT ten_mon_hoc FROM mon_hoc
SELECT * FROM tac_gia_khoa_hoc_va_nguoi_huong_dan ORDER BY ten_ca_nhan ASC
SELECT * FROM tac_gia_khoa_hoc_va_nguoi_huong_dan ORDER BY ten_ca_nhan ASC
SELECT ten_ca_nhan, ho FROM sinh_vien ORDER BY ho ASC
SELECT ten_ca_nhan , ho FROM sinh_vien ORDER BY ho ASC
SELECT ket_qua_kiem_tra, COUNT(*) FROM bai_kiem_tra_cua_sinh_vien GROUP BY ket_qua_kiem_tra ORDER BY COUNT(*) DESC
SELECT ket_qua_kiem_tra, COUNT(*) FROM bai_kiem_tra_cua_sinh_vien GROUP BY ket_qua_kiem_tra ORDER BY COUNT(*) DESC
SELECT T1.ten_dang_nhap FROM tac_gia_khoa_hoc_va_nguoi_huong_dan AS T1 JOIN khoa_hoc AS T2 ON T1.id_tac_gia = T2.id_tac_gia WHERE T2.ten_khoa_hoc = ' cơ sở dữ liệu nâng cao '
SELECT T2.ten_dang_nhap FROM khoa_hoc AS T1 JOIN tac_gia_khoa_hoc_va_nguoi_huong_dan AS T2 ON T1.id_tac_gia = T2.id_tac_gia WHERE T1.ten_khoa_hoc = 'cơ sở dữ liệu nâng cao'
SELECT T1.dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan AS T1 JOIN khoa_hoc AS T2 ON T1.id_tac_gia = T2.id_tac_gia WHERE T2.ten_khoa_hoc IN ('hệ điều hành', 'cấu trúc dữ liệu')
SELECT T1.dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan AS T1 JOIN khoa_hoc AS T2 ON T1.id_tac_gia = T2.id_tac_gia JOIN mon_hoc AS T3 ON T2.id_mon_hoc = T3.id_mon_hoc WHERE T3.ten_mon_hoc IN ('hệ điều hành', 'cấu trúc dữ liệu')
SELECT T1.id_tac_gia , T1.ten_ca_nhan , T1.ho FROM tac_gia_khoa_hoc_va_nguoi_huong_dan AS T1 JOIN khoa_hoc AS T2 ON T1.id_tac_gia = T2.id_tac_gia GROUP BY T1.id_tac_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_ca_nhan, T1.ho, T1.id_tac_gia FROM tac_gia_khoa_hoc_va_nguoi_huong_dan AS T1 JOIN khoa_hoc AS T2 ON T1.id_tac_gia = T2.id_tac_gia GROUP BY T1.id_tac_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_tac_gia , T1.dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan AS T1 JOIN khoa_hoc AS T2 ON T1.id_tac_gia = T2.id_tac_gia GROUP BY T1.id_tac_gia HAVING COUNT ( * ) >= 2
SELECT T1.id_tac_gia , T1.dong_1_cua_dia_chi FROM tac_gia_khoa_hoc_va_nguoi_huong_dan AS T1 JOIN khoa_hoc AS T2 ON T1.id_tac_gia = T2.id_tac_gia GROUP BY T1.id_tac_gia HAVING COUNT ( * ) > 2
SELECT khoa_hoc.ten_khoa_hoc FROM khoa_hoc JOIN tac_gia_khoa_hoc_va_nguoi_huong_dan ON khoa_hoc.id_tac_gia = tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia WHERE tac_gia_khoa_hoc_va_nguoi_huong_dan.ten_ca_nhan = 'Julio'
SELECT ten_khoa_hoc FROM khoa_hoc JOIN tac_gia_khoa_hoc_va_nguoi_huong_dan ON khoa_hoc.id_tac_gia = tac_gia_khoa_hoc_va_nguoi_huong_dan.id_tac_gia WHERE tac_gia_khoa_hoc_va_nguoi_huong_dan.ten_ca_nhan = 'Julio'
SELECT ten_khoa_hoc, mo_ta_ve_khoa_hoc FROM khoa_hoc JOIN mon_hoc ON khoa_hoc.id_mon_hoc = mon_hoc.id_mon_hoc WHERE mon_hoc.ten_mon_hoc = 'Khoa học máy tính'
SELECT T1.ten_khoa_hoc, T1.mo_ta_ve_khoa_hoc FROM khoa_hoc AS T1 JOIN mon_hoc AS T2 ON T1.id_mon_hoc = T2.id_mon_hoc WHERE T2.ten_mon_hoc = 'Khoa học máy tính'
SELECT T1.id_mon_hoc, T1.ten_mon_hoc, COUNT(*) AS so_khoa_hoc FROM mon_hoc AS T1 JOIN khoa_hoc AS T2 ON T1.id_mon_hoc = T2.id_mon_hoc GROUP BY T1.id_mon_hoc
SELECT T1.id_mon_hoc, T1.ten_mon_hoc, COUNT(*) AS so_khoa_hoc FROM mon_hoc AS T1 JOIN khoa_hoc AS T2 ON T1.id_mon_hoc = T2.id_mon_hoc GROUP BY T1.id_mon_hoc
SELECT T1.id_mon_hoc, T1.ten_mon_hoc, COUNT(*) AS so_luong_khoa_hoc FROM mon_hoc AS T1 JOIN khoa_hoc AS T2 ON T1.id_mon_hoc = T2.id_mon_hoc GROUP BY T1.id_mon_hoc ORDER BY COUNT(*) ASC
SELECT T1.id_mon_hoc, T1.ten_mon_hoc, COUNT(*) AS so_khoa_hoc FROM mon_hoc AS T1 JOIN khoa_hoc AS T2 ON T1.id_mon_hoc = T2.id_mon_hoc GROUP BY T1.id_mon_hoc ORDER BY COUNT(*) ASC
SELECT T2.ngay_ngay_dang_ky FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc WHERE T1.ten_khoa_hoc = 'tiếng Tây Ban Nha'
SELECT T2.ngay_ngay_dang_ky FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc WHERE T1.ten_khoa_hoc = 'tiếng Tây Ban Nha'
SELECT T1.ten_khoa_hoc FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc GROUP BY T1.id_khoa_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_khoa_hoc , COUNT ( * ) FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc GROUP BY T1.id_khoa_hoc ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.ten_khoa_hoc FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc GROUP BY T1.id_khoa_hoc HAVING COUNT(*) = 1
SELECT T1.ten_khoa_hoc FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc GROUP BY T1.id_khoa_hoc HAVING COUNT(*) = 1
SELECT T1.ten_khoa_hoc, T1.mo_ta_ve_khoa_hoc FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc GROUP BY T1.id_khoa_hoc HAVING COUNT(*) > 2
SELECT T1.mo_ta_ve_khoa_hoc, T1.ten_khoa_hoc FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc GROUP BY T1.id_khoa_hoc HAVING COUNT(*) > 2
SELECT T1.ten_khoa_hoc , COUNT ( * ) FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc GROUP BY T1.id_khoa_hoc
SELECT T1.ten_khoa_hoc , COUNT ( * ) FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc GROUP BY T1.id_khoa_hoc
SELECT T2.ngay_ngay_dang_ky FROM bai_kiem_tra_cua_sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_dang_ky = T2.id_dang_ky WHERE T1.ket_qua_kiem_tra = 'Đạt'
SELECT T2.ngay_ngay_dang_ky FROM bai_kiem_tra_cua_sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_dang_ky = T2.id_dang_ky WHERE T1.ket_qua_kiem_tra = 'Đạt'
SELECT T2.ngay_hoan_thanh FROM bai_kiem_tra_cua_sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_dang_ky = T2.id_dang_ky WHERE T1.ket_qua_kiem_tra = ' Trượt '
SELECT T2.ngay_hoan_thanh FROM bai_kiem_tra_cua_sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_dang_ky = T2.id_dang_ky WHERE T1.ket_qua_kiem_tra = ' Trượt '
SELECT T2.ngay_dang_ky, T2.ngay_hoan_thanh FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE T1.ten_ca_nhan = 'Karson'
SELECT T1.ngay_dang_ky, T1.ngay_hoan_thanh FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE T1.ten_ca_nhan = 'Karson'
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_ngay_dang_ky, luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Zieme' AND sinh_vien.ten_ca_nhan = 'Bernie'
SELECT T2.ngay_dang_ky, T2.ngay_hoan_thanh FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE T1.ho = 'Zieme' AND T1.ten_ca_nhan = 'Bernie'
SELECT T1.id_sinh_vien , T1.ten_dang_nhap FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_sinh_vien , T1.ten_ca_nhan FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT sinh_vien.id_sinh_vien , sinh_vien.ten_ca_nhan FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien HAVING COUNT ( * ) >= 2
SELECT T1.id_sinh_vien , T1.ten_ca_nhan FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien HAVING COUNT ( * ) >= 2
SELECT sinh_vien.id_sinh_vien, sinh_vien.ten_dem FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien HAVING COUNT(*) <= 2
SELECT T1.id_sinh_vien , T1.ten_dem FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT ten_ca_nhan , ten_dem , ho FROM sinh_vien EXCEPT SELECT T1.ten_ca_nhan , T1.ten_dem , T1.ho FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien
SELECT ten_ca_nhan , ten_dem , ho FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien)
SELECT COUNT(*) FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien)
SELECT COUNT(*) FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien)
SELECT ten_dang_nhap FROM sinh_vien INTERSECT SELECT ten_dang_nhap FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT ten_dang_nhap FROM sinh_vien INTERSECT SELECT ten_dang_nhap FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT ten_ca_nhan FROM sinh_vien INTERSECT SELECT ten_ca_nhan FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT ho FROM sinh_vien INTERSECT SELECT ho FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT COUNT(*) FROM trang_trai
SELECT COUNT(*) FROM trang_trai
SELECT tong_so_ngua FROM trang_trai ORDER BY tong_so_ngua ASC
SELECT id_trang_trai, SUM(tong_so_ngua) FROM trang_trai GROUP BY id_trang_trai ORDER BY SUM(tong_so_ngua) ASC
SELECT trang_trai.id_trang_trai , trang_trai.ten_chinh_thuc FROM trang_trai JOIN ho_so_cuoc_thi ON trang_trai.id_trang_trai = ho_so_cuoc_thi.id_trang_trai JOIN cuoc_thi_trang_trai ON ho_so_cuoc_thi.id_cuoc_thi = cuoc_thi_trang_trai.id_cuoc_thi WHERE cuoc_thi_trang_trai.chu_de != 'Người ngoài hành tinh'
SELECT chu_nha FROM cuoc_thi_trang_trai WHERE chu_de != 'Người ngoài hành tinh'
SELECT chu_de, nam FROM cuoc_thi_trang_trai ORDER BY nam ASC
SELECT chu_de, nam FROM cuoc_thi_trang_trai ORDER BY nam ASC
SELECT AVG(ngua_lam_viec) FROM trang_trai WHERE tong_so_ngua > 5000
SELECT AVG(ngua_lam_viec) FROM trang_trai WHERE tong_so_ngua > 5000
SELECT MAX(bo), MIN(bo) FROM trang_trai
SELECT MAX(total_cattle) FROM (SELECT SUM(bo + bo_duc + bo_cai + lon + cuu_va_de) AS total_cattle FROM trang_trai) AS subquery UNION ALL SELECT MIN(total_cattle) FROM (SELECT SUM(bo + bo_duc + bo_cai + lon + cuu_va_de) AS total_cattle FROM trang_trai) AS subquery
SELECT COUNT(DISTINCT cap_bac) FROM thanh_pho
SELECT 1
SELECT ten_chinh_thuc FROM thanh_pho ORDER BY dan_so DESC
SELECT ten_chinh_thuc , dan_so FROM thanh_pho AS T1 ORDER BY dan_so DESC
SELECT ten_chinh_thuc , cap_bac FROM thanh_pho ORDER BY dan_so DESC LIMIT 1
SELECT ten_chinh_thuc , cap_bac FROM thanh_pho ORDER BY dan_so DESC LIMIT 1
SELECT T1.nam, T2.ten_chinh_thuc FROM cuoc_thi_trang_trai AS T1 JOIN thanh_pho AS T2 ON T1.id_thanh_pho_chu_nha = T2.id_thanh_pho
SELECT T1.nam, T2.ten_chinh_thuc FROM cuoc_thi_trang_trai AS T1 JOIN thanh_pho AS T2 ON T1.id_thanh_pho_chu_nha = T2.id_thanh_pho
SELECT T2.ten_chinh_thuc FROM cuoc_thi_trang_trai AS T1 JOIN thanh_pho AS T2 ON T1.id_thanh_pho_chu_nha = T2.id_thanh_pho GROUP BY T2.id_thanh_pho HAVING COUNT(*) > 1
SELECT T1.ten_chinh_thuc FROM thanh_pho AS T1 JOIN cuoc_thi_trang_trai AS T2 ON T1.id_thanh_pho = T2.id_thanh_pho_chu_nha GROUP BY T1.id_thanh_pho HAVING COUNT(*) > 1
SELECT T2.cap_bac FROM cuoc_thi_trang_trai AS T1 JOIN thanh_pho AS T2 ON T1.id_thanh_pho_chu_nha = T2.id_thanh_pho GROUP BY T2.id_thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.cap_bac FROM cuoc_thi_trang_trai AS T1 JOIN thanh_pho AS T2 ON T1.id_thanh_pho_chu_nha = T2.id_thanh_pho GROUP BY T1.id_thanh_pho_chu_nha ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.chu_de FROM cuoc_thi_trang_trai AS T1 JOIN thanh_pho AS T2 ON T1.id_thanh_pho_chu_nha = T2.id_thanh_pho WHERE T2.dan_so > 1000
SELECT T1.chu_de, T2.ten_chinh_thuc FROM cuoc_thi_trang_trai AS T1 JOIN thanh_pho AS T2 ON T1.id_thanh_pho_chu_nha = T2.id_thanh_pho WHERE T2.dan_so > 1000
SELECT cap_bac, AVG(dan_so) FROM thanh_pho GROUP BY cap_bac
SELECT cap_bac , AVG ( dan_so ) FROM thanh_pho AS T1 GROUP BY T1.cap_bac
SELECT cap_bac, COUNT(*) FROM thanh_pho GROUP BY cap_bac ORDER BY COUNT(*) ASC
SELECT cap_bac, COUNT(*) FROM thanh_pho GROUP BY cap_bac ORDER BY COUNT(*) ASC
SELECT cap_bac, COUNT(*) FROM thanh_pho GROUP BY cap_bac ORDER BY COUNT(*) DESC LIMIT 1
SELECT cap_bac FROM thanh_pho GROUP BY cap_bac ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_chinh_thuc FROM thanh_pho WHERE id_thanh_pho NOT IN (SELECT id_thanh_pho_chu_nha FROM cuoc_thi_trang_trai)
SELECT T1.ten_chinh_thuc FROM thanh_pho T1 WHERE T1.id_thanh_pho NOT IN (SELECT T2.id_thanh_pho_chu_nha FROM cuoc_thi_trang_trai T2)
SELECT cap_bac FROM thanh_pho WHERE dan_so > 1500 AND dan_so < 500
SELECT cap_bac FROM thanh_pho WHERE dan_so > 1500 INTERSECT SELECT cap_bac FROM thanh_pho WHERE dan_so < 500
SELECT ten_chinh_thuc FROM thanh_pho WHERE dan_so > 1500 OR dan_so < 500
SELECT ten_chinh_thuc FROM thanh_pho WHERE dan_so > 1500 OR dan_so < 500
SELECT ten_chinh_thuc, xep_hang_dieu_tra_dan_so FROM thanh_pho WHERE cap_bac != 'Làng'
SELECT ten_chinh_thuc, xep_hang_dieu_tra_dan_so FROM thanh_pho WHERE cap_bac != 'Làng'
SELECT COUNT(*) FROM chuyen_bay WHERE van_toc > 200
SELECT so_hieu , ngay , phi_cong FROM chuyen_bay ORDER BY do_cao
SELECT id, quoc_gia, thanh_pho, ten FROM san_bay ORDER BY ten ASC
SELECT MAX(co_phan_nhom) FROM cong_ty_dieu_hanh
SELECT AVG(van_toc) FROM chuyen_bay WHERE phi_cong = 'Thompson'
SELECT T1.ten, T1.loai FROM cong_ty_dieu_hanh AS T1 JOIN chuyen_bay AS T2 ON T1.id = T2.id_cong_ty GROUP BY T1.id
SELECT ten FROM san_bay WHERE quoc_gia != 'Iceland'
SELECT DISTINCT T1.loai FROM cong_ty_dieu_hanh AS T1 JOIN chuyen_bay AS T2 ON T1.id_cong_ty = T2.id_cong_ty WHERE T2.van_toc < 200
SELECT T1.id, T1.ten FROM cong_ty_dieu_hanh AS T1 JOIN chuyen_bay AS T2 ON T1.id = T2.id_cong_ty GROUP BY T1.id HAVING COUNT(*) > 1
SELECT T1.id, T1.ten, T1.iata FROM san_bay AS T1 JOIN chuyen_bay AS T2 ON T1.id = T2.id_san_bay GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT phi_cong FROM chuyen_bay JOIN san_bay ON chuyen_bay.id_san_bay = san_bay.id WHERE san_bay.quoc_gia = 'Hoa Kỳ' OR san_bay.ten = 'Sân bay Billund'
SELECT loai , COUNT ( * ) FROM cong_ty_dieu_hanh GROUP BY loai ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT COUNT(*) FROM san_bay WHERE id NOT IN (SELECT id_san_bay FROM chuyen_bay WHERE phi_cong = 'Thompson')
SELECT T1.phi_cong FROM chuyen_bay AS T1 JOIN cong_ty_dieu_hanh AS T2 ON T1.id_cong_ty = T2.id WHERE T2.hoat_dong_chinh = 'Vận chuyển hàng hoá' INTERSECT SELECT T1.phi_cong FROM chuyen_bay AS T1 JOIN cong_ty_dieu_hanh AS T2 ON T1.id_cong_ty = T2.id WHERE T2.hoat_dong_chinh = 'Dịch vụ ăn uống'
SELECT ten FROM san_bay WHERE ten LIKE '%quốc tế%'
SELECT san_bay.id , COUNT(*) FROM san_bay JOIN chuyen_bay ON san_bay.id = chuyen_bay.id_san_bay GROUP BY san_bay.id
SELECT quoc_gia , COUNT ( * ) FROM san_bay GROUP BY quoc_gia
SELECT quoc_gia , COUNT(*) FROM san_bay GROUP BY quoc_gia HAVING COUNT(*) > 2
SELECT phi_cong, COUNT(*) FROM chuyen_bay GROUP BY phi_cong ORDER BY COUNT(*) DESC LIMIT 1
SELECT SUM(so_luong_bo_phan) FROM do_noi_that
SELECT id_do_noi_that, ten FROM do_noi_that ORDER BY lai_suat_thi_truong DESC LIMIT 1
SELECT SUM(lai_suat_thi_truong) FROM do_noi_that ORDER BY lai_suat_thi_truong DESC LIMIT 2
SELECT ten, so_luong_bo_phan FROM do_noi_that WHERE so_luong_bo_phan > 10
SELECT ten, so_luong_bo_phan FROM do_noi_that ORDER BY lai_suat_thi_truong ASC LIMIT 1
SELECT ten FROM do_noi_that JOIN xuong_san_xuat_do_noi_that ON do_noi_that.id_do_noi_that = xuong_san_xuat_do_noi_that.id_do_noi_that WHERE gia_tinh_theo_do_la < (SELECT MAX(gia_tinh_theo_do_la) FROM xuong_san_xuat_do_noi_that)
SELECT ten, nam_mo_cua FROM nha_san_xuat ORDER BY so_luong_cua_hang DESC LIMIT 1
SELECT AVG(so_luong_nha_may) FROM nha_san_xuat WHERE so_luong_cua_hang > 20
SELECT id_nha_san_xuat , ten FROM nha_san_xuat ORDER BY nam_mo_cua ASC
SELECT ten, nam_mo_cua FROM nha_san_xuat WHERE so_luong_nha_may < 10 OR so_luong_cua_hang > 10
SELECT MAX(so_luong_cua_hang) AS so_luong_cua_hang_max FROM nha_san_xuat WHERE nam_mo_cua < 1990
SELECT T1.id_nha_san_xuat , T1.so_luong_cua_hang FROM nha_san_xuat AS T1 JOIN xuong_san_xuat_do_noi_that AS T2 ON T1.id_nha_san_xuat = T2.id_nha_san_xuat WHERE T2.gia_tinh_theo_do_la = ( SELECT MAX(gia_tinh_theo_do_la) FROM xuong_san_xuat_do_noi_that )
SELECT T1.ten , COUNT(*) FROM nha_san_xuat AS T1 JOIN xuong_san_xuat_do_noi_that AS T2 ON T1.id_nha_san_xuat = T2.id_nha_san_xuat JOIN do_noi_that AS T3 ON T2.id_do_noi_that = T3.id_do_noi_that GROUP BY T1.id_nha_san_xuat
SELECT T1.ten, T2.gia_tinh_theo_do_la FROM do_noi_that AS T1 JOIN xuong_san_xuat_do_noi_that AS T2 ON T1.id_do_noi_that = T2.id_do_noi_that
SELECT ten, lai_suat_thi_truong FROM do_noi_that EXCEPT SELECT do_noi_that.ten, do_noi_that.lai_suat_thi_truong FROM do_noi_that JOIN xuong_san_xuat_do_noi_that ON do_noi_that.id_do_noi_that = xuong_san_xuat_do_noi_that.id_do_noi_that
SELECT T1.ten FROM nha_san_xuat AS T1 JOIN xuong_san_xuat_do_noi_that AS T2 ON T1.id_nha_san_xuat = T2.id_nha_san_xuat JOIN do_noi_that AS T3 ON T2.id_do_noi_that = T3.id_do_noi_that WHERE T3.so_luong_bo_phan < 6 INTERSECT SELECT T1.ten FROM nha_san_xuat AS T1 JOIN xuong_san_xuat_do_noi_that AS T2 ON T1.id_nha_san_xuat = T2.id_nha_san_xuat JOIN do_noi_that AS T3 ON T2.id_do_noi_that = T3.id_do_noi_that WHERE T3.so_luong_bo_phan > 10
SELECT COUNT(*) FROM khach_tham_quan WHERE tuoi < 30
SELECT ten FROM khach_tham_quan WHERE cap_do_thanh_vien > 4 ORDER BY cap_do_thanh_vien DESC
SELECT AVG(tuoi) FROM khach_tham_quan WHERE cap_do_thanh_vien <= 4
SELECT ten, cap_do_thanh_vien FROM khach_tham_quan WHERE cap_do_thanh_vien > 4 ORDER BY tuoi DESC
SELECT id_bao_tang, ten FROM bao_tang ORDER BY so_luong_nhan_vien DESC LIMIT 1
SELECT AVG(so_luong_nhan_vien) FROM bao_tang WHERE nam_mo_cua < '2009'
SELECT nam_mo_cua, so_luong_nhan_vien FROM bao_tang WHERE ten = 'Bảo tàng Plaza'
SELECT ten FROM bao_tang WHERE so_luong_nhan_vien > ANY (SELECT so_luong_nhan_vien FROM bao_tang WHERE nam_mo_cua > '2010')
SELECT T1.id_khach_tham_quan, T1.ten, T1.tuoi FROM khach_tham_quan AS T1 JOIN chuyen_tham AS T2 ON T1.id_khach_tham_quan = T2.id_khach_tham_quan GROUP BY T1.id_khach_tham_quan HAVING COUNT(*) > 1
SELECT T1.id_khach_tham_quan , T1.ten , T1.cap_do_thanh_vien FROM khach_tham_quan AS T1 JOIN chuyen_tham AS T2 ON T1.id_khach_tham_quan = T2.id_khach_tham_quan GROUP BY T1.id_khach_tham_quan ORDER BY SUM(tong_so_tien_da_chi) DESC LIMIT 1
SELECT T1.id_bao_tang, T1.ten FROM bao_tang AS T1 JOIN chuyen_tham AS T2 ON T1.id_bao_tang = T2.id_bao_tang GROUP BY T1.id_bao_tang ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM bao_tang WHERE id_bao_tang NOT IN (SELECT id_bao_tang FROM chuyen_tham)
SELECT T1.ten, T1.tuoi FROM khach_tham_quan AS T1 JOIN chuyen_tham AS T2 ON T1.id_khach_tham_quan = T2.id_khach_tham_quan GROUP BY T1.id_khach_tham_quan ORDER BY SUM(T2.so_luong_ve) DESC LIMIT 1
SELECT AVG(so_luong_ve), MAX(so_luong_ve) FROM chuyen_tham
SELECT SUM(chuyen_tham.tong_so_tien_da_chi) FROM khach_tham_quan JOIN chuyen_tham ON khach_tham_quan.id_khach_tham_quan = chuyen_tham.id_khach_tham_quan WHERE khach_tham_quan.cap_do_thanh_vien = 1
SELECT T1.ten FROM khach_tham_quan AS T1 JOIN chuyen_tham AS T2 ON T1.id_khach_tham_quan = T2.id_khach_tham_quan JOIN bao_tang AS T3 ON T2.id_bao_tang = T3.id_bao_tang GROUP BY T1.id_khach_tham_quan HAVING SUM(CASE WHEN T3.nam_mo_cua < '2009' THEN 1 ELSE 0 END) >= 1 AND SUM(CASE WHEN T3.nam_mo_cua > '2011' THEN 1 ELSE 0 END) >= 1
SELECT COUNT(*) FROM (SELECT T1.id_khach_tham_quan FROM khach_tham_quan AS T1 EXCEPT SELECT T2.id_khach_tham_quan FROM chuyen_tham AS T2 JOIN bao_tang AS T3 ON T2.id_bao_tang = T3.id_bao_tang WHERE T3.nam_mo_cua > '2010') AS subquery
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
SELECT COUNT(*) FROM hoc_sinh_trung_hoc WHERE khoi_lop IN (9, 10)
SELECT COUNT(*) FROM hoc_sinh_trung_hoc WHERE khoi_lop = 9 OR khoi_lop = 10
SELECT khoi_lop, COUNT(*) FROM hoc_sinh_trung_hoc GROUP BY khoi_lop
SELECT 1
SELECT khoi_lop, COUNT(*) FROM hoc_sinh_trung_hoc GROUP BY khoi_lop ORDER BY COUNT(*) DESC LIMIT 1
SELECT khoi_lop FROM hoc_sinh_trung_hoc GROUP BY khoi_lop ORDER BY COUNT(*) DESC LIMIT 1
SELECT khoi_lop FROM hoc_sinh_trung_hoc GROUP BY khoi_lop HAVING COUNT(*) >= 4
SELECT khoi_lop, COUNT(*) FROM hoc_sinh_trung_hoc GROUP BY khoi_lop HAVING COUNT(*) >= 4
