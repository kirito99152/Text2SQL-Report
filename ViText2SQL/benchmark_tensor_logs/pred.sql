SELECT COUNT(*) FROM kien_truc_su WHERE gioi_tinh = 'nữ'
SELECT ten, quoc_tich, id FROM kien_truc_su WHERE gioi_tinh = 'nam' ORDER BY ten ASC
SELECT T2.ten, T1.chieu_dai_theo_met FROM cau AS T1 JOIN kien_truc_su AS T2 ON T1.id_kien_truc_su = T2.id ORDER BY T1.chieu_dai_theo_met DESC LIMIT 1
SELECT AVG(chieu_dai_theo_feet) FROM cau
SELECT ten, nam_xay_dung FROM nha_may WHERE loai = 'Grondzeiler'
SELECT DISTINCT T1.ten, T1.quoc_tich FROM kien_truc_su AS T1 INNER JOIN nha_may AS T2 ON T1.id = T2.id_kien_truc_su
SELECT ten FROM nha_may WHERE dia_diem != 'Donceel'
SELECT DISTINCT T1.loai FROM nha_may AS T1 JOIN kien_truc_su AS T2 ON T1.id_kien_truc_su = T2.id WHERE T2.quoc_tich IN ('Mỹ', 'Canada')
SELECT T1.id, T1.ten FROM kien_truc_su AS T1 JOIN cau AS T2 ON T1.id = T2.id_kien_truc_su GROUP BY T1.id HAVING COUNT(*) >= 3
SELECT T1.id, T1.ten, T1.quoc_tich FROM kien_truc_su AS T1 JOIN nha_may AS T2 ON T1.id = T2.id_kien_truc_su GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id, T1.ten, T1.gioi_tinh FROM kien_truc_su AS T1 JOIN cau AS T2 ON T1.id_kien_truc_su = T2.id_kien_truc_su JOIN nha_may AS T3 ON T1.id_kien_truc_su = T3.id_kien_truc_su GROUP BY T1.id HAVING COUNT(T2.id) >= 2 OR COUNT(T3.id) >= 1
SELECT dia_diem FROM cau WHERE ten = 'Cổng vòm Kolob' OR ten = 'Cầu cầu vồng'
SELECT ten FROM nha_may WHERE ten LIKE '%Moulin%'
SELECT DISTINCT nha_may.ten FROM nha_may JOIN kien_truc_su ON nha_may.id_kien_truc_su = kien_truc_su.id JOIN cau ON kien_truc_su.id = cau.id_kien_truc_su WHERE cau.chieu_dai_theo_met > 80
SELECT loai , COUNT(*) FROM nha_may GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM kien_truc_su AS T1 WHERE T1.id NOT IN (SELECT T2.id_kien_truc_su FROM nha_may AS T2 WHERE T2.nam_xay_dung < 1850)
SELECT T1.ten, T1.chieu_dai_theo_met FROM cau AS T1 JOIN kien_truc_su AS T2 ON T1.id_kien_truc_su = T2.id WHERE T2.quoc_tich = 'Mỹ' ORDER BY T1.chieu_dai_theo_met ASC
SELECT dia_diem FROM rap_chieu_phim WHERE dia_diem NOT IN (SELECT dia_diem FROM rap_chieu_phim WHERE suc_chua > 800)
SELECT dia_diem
FROM rap_chieu_phim
WHERE nam_mo_cua IN (2010, 2011)
GROUP BY dia_diem
HAVING COUNT(DISTINCT nam_mo_cua) = 2
SELECT COUNT(*) FROM rap_chieu_phim
SELECT COUNT(*) FROM rap_chieu_phim
SELECT ten, nam_mo_cua, suc_chua FROM rap_chieu_phim
SELECT ten, dia_diem FROM rap_chieu_phim WHERE suc_chua > (SELECT AVG(suc_chua) FROM rap_chieu_phim)
SELECT dia_diem FROM rap_chieu_phim GROUP BY dia_diem HAVING COUNT(*) > 1
SELECT dia_diem FROM rap_chieu_phim GROUP BY dia_diem HAVING COUNT(*) > 1
SELECT ten, nam_mo_cua FROM rap_chieu_phim ORDER BY nam_mo_cua DESC
SELECT ten, dia_diem FROM rap_chieu_phim ORDER BY suc_chua DESC LIMIT 1
SELECT AVG(suc_chua), MIN(suc_chua), MAX(suc_chua) FROM rap_chieu_phim WHERE nam_mo_cua > 2011
SELECT dia_diem, COUNT(*) FROM rap_chieu_phim GROUP BY dia_diem
SELECT dia_diem , COUNT ( * ) FROM rap_chieu_phim WHERE nam_mo_cua >= 2010 GROUP BY dia_diem ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT dia_diem FROM rap_chieu_phim WHERE suc_chua > 300 GROUP BY id_rap_chieu_phim HAVING COUNT(*) >= 2
SELECT dia_diem FROM rap_chieu_phim WHERE suc_chua > 300 GROUP BY dia_diem HAVING COUNT(*) >= 2
SELECT tieu_de, duoc_dao_dien_boi FROM phim
SELECT tieu_de, duoc_dao_dien_boi FROM phim
SELECT duoc_dao_dien_boi FROM phim
SELECT duoc_dao_dien_boi FROM phim
SELECT 1
SELECT T1.id_rap_chieu_phim , SUM(T2.so_luong_suat_chieu_moi_ngay) FROM rap_chieu_phim AS T1 JOIN lich_chieu_phim AS T2 ON T1.id_rap_chieu_phim = T2.id_rap_chieu_phim GROUP BY T1.id_rap_chieu_phim
SELECT T1.tieu_de, MAX(T2.gia) FROM phim AS T1 JOIN lich_chieu_phim AS T2 ON T1.id_phim = T2.id_phim GROUP BY T1.id_phim
SELECT phim.tieu_de, MAX(lich_chieu_phim.gia) FROM phim JOIN lich_chieu_phim ON phim.id_phim = lich_chieu_phim.id_phim GROUP BY phim.id_phim
SELECT T3.ten, T2.tieu_de, T1.ngay, T1.gia FROM lich_chieu_phim AS T1 JOIN phim AS T2 ON T1.id_phim = T2.id_phim JOIN rap_chieu_phim AS T3 ON T1.id_rap_chieu_phim = T3.id_rap_chieu_phim
SELECT tieu_de, duoc_dao_dien_boi FROM phim EXCEPT SELECT phim.tieu_de, phim.duoc_dao_dien_boi FROM phim JOIN lich_chieu_phim ON phim.id_phim = lich_chieu_phim.id_phim
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
SELECT COUNT(DISTINCT T1.id_sinh_vien) FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE T2.diem = 'B'
SELECT COUNT(*) FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE T2.diem = 'B'
SELECT 1
SELECT MAX(diem_so), MIN(diem_so) FROM chuyen_doi_diem
SELECT ho, ten FROM sinh_vien WHERE ten LIKE '%a%'
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
SELECT ho , ten FROM giang_vien WHERE ngach = 'Giáo sư' ORDER BY ho , ten
SELECT T1.ten_khoa FROM khoa AS T1 JOIN chuyen_nganh_phu AS T2 ON T1.ma_so_khoa = T2.ma_so_khoa GROUP BY T1.ma_so_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.ten_khoa , COUNT ( * ) FROM sinh_vien AS T1 JOIN chuyen_nganh_phu AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien JOIN khoa AS T3 ON T2.ma_so_khoa = T3.ma_so_khoa GROUP BY T3.ma_so_khoa ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT ten_khoa FROM khoa LEFT JOIN chuyen_nganh_phu ON khoa.ma_so_khoa = chuyen_nganh_phu.ma_so_khoa WHERE chuyen_nganh_phu.id_sinh_vien IS NULL
SELECT ten_khoa FROM khoa EXCEPT SELECT ten_khoa FROM khoa WHERE ma_so_khoa IN (SELECT ma_so_khoa FROM chuyen_nganh_phu)
SELECT khoa.ten_khoa
FROM khoa
LEFT JOIN (
    SELECT ma_so_khoa, COUNT(*) AS lecturer_count
    FROM la_thanh_vien_cua
    GROUP BY ma_so_khoa
) AS lecturers ON khoa.ma_so_khoa = lecturers.ma_so_khoa
LEFT JOIN (
    SELECT ma_so_khoa, COUNT(*) AS student_count
    FROM chuyen_nganh_phu
    GROUP BY ma_so_khoa
) AS students ON khoa.ma_so_khoa = students.ma_so_khoa
GROUP BY khoa.ma_so_khoa, khoa.ten_khoa
ORDER BY COALESCE(lecturer_count, 0) + COALESCE(student_count, 0) ASC
LIMIT 1
SELECT khoa.ten_khoa FROM khoa LEFT JOIN la_thanh_vien_cua ON khoa.ma_so_khoa = la_thanh_vien_cua.ma_so_khoa LEFT JOIN chuyen_nganh_phu ON khoa.ma_so_khoa = chuyen_nganh_phu.ma_so_khoa GROUP BY khoa.ma_so_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT ngach, COUNT(*) FROM giang_vien GROUP BY ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT ngach FROM giang_vien GROUP BY ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.ho , T1.ten FROM giang_vien AS T1 JOIN khoa_hoc AS T2 ON T1.id_giang_vien = T2.nguoi_huong_dan GROUP BY T1.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 3
SELECT T1.ho, T1.ten, COUNT(*) AS so_khoa_hoc FROM giang_vien AS T1 JOIN khoa_hoc AS T2 ON T1.id_giang_vien = T2.nguoi_huong_dan GROUP BY T1.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 3
SELECT T1.toa_nha , COUNT ( * ) FROM giang_vien AS T1 JOIN khoa_hoc AS T2 ON T1.id_giang_vien = T2.nguoi_huong_dan GROUP BY T1.id_giang_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.toa_nha FROM giang_vien AS T1 JOIN khoa_hoc AS T2 ON T1.id_giang_vien = T2.nguoi_huong_dan GROUP BY T1.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_khoa_hoc FROM khoa_hoc AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.id_khoa_hoc = T2.ma_khoa_hoc GROUP BY T1.id_khoa_hoc HAVING COUNT(*) >= 5
SELECT T1.ten_khoa_hoc FROM khoa_hoc AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.id_khoa_hoc = T2.ma_khoa_hoc GROUP BY T1.id_khoa_hoc HAVING COUNT(*) >= 5
SELECT T2.ho, T2.ten FROM khoa_hoc AS T1 JOIN giang_vien AS T2 ON T1.nguoi_huong_dan = T2.id_giang_vien WHERE T1.ten_khoa_hoc = ' Kỹ năng máy tính '
SELECT T2.ho , T2.ten FROM khoa_hoc AS T1 JOIN giang_vien AS T2 ON T1.nguoi_huong_dan = T2.id_giang_vien WHERE T1.ten_khoa_hoc = 'Kỹ năng máy tính'
SELECT ten_khoa_hoc, ten_khoa, phong FROM khoa_hoc JOIN khoa ON khoa_hoc.ma_so_khoa = khoa.ma_so_khoa WHERE ten_khoa_hoc = 'Giới thiệu về khoa học máy tính'
