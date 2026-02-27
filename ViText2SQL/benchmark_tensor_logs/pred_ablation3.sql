SELECT ten FROM du_an WHERE so_gio BETWEEN 100 AND 300
SELECT ten_khoa_hoc FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT DISTINCT dia_diem FROM rap_chieu_phim
SELECT nam FROM cuoc_thi WHERE loai_cuoc_thi != 'Giải đấu'
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING COUNT(*) > 2
SELECT AVG(so_luong_truy_cap) FROM tai_lieu
SELECT DISTINCT loai_giao_dich FROM giao_dich_tai_chinh
SELECT COUNT(*) FROM khu_nha
SELECT AVG(vang) FROM thu_hang_cua_cau_lac_bo
SELECT * FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT ten FROM tau WHERE quoc_tich != 'Hoa Kỳ'
SELECT ten_giai_dau FROM tran_dau GROUP BY id_giai_dau HAVING COUNT(*) > 10
SELECT COUNT(*) FROM toa_hoa
SELECT ten FROM dien_thoai ORDER BY gia_ban ASC
SELECT COUNT(*) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien JOIN chuyen_doi_diem ON dang_ky_khoa_hoc.diem = chuyen_doi_diem.bang_diem WHERE chuyen_doi_diem.bang_diem = 'B' GROUP BY sinh_vien.id_sinh_vien
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE id_muc_nhap_tiep_theo > 8
SELECT xep_hang_dieu_tra_dan_so FROM thanh_pho WHERE cap_bac != 'Làng'
SELECT duoc_dao_dien_boi FROM phim
SELECT duoc_dao_dien_boi FROM phim
SELECT ten_khoa FROM khoa WHERE toa_nha = 'Mergenthaler'
SELECT COUNT(DISTINCT ma_loai_the) FROM the_khach_hang
SELECT COUNT(DISTINCT loai_giao_dich) FROM giao_dich_tai_chinh
SELECT id FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle'
SELECT COUNT(*) FROM nha_khoa_hoc
SELECT ten_giai_dau FROM tran_dau GROUP BY id_giai_dau HAVING COUNT(*) > 10
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE chieu_dai < '3' OR chieu_rong > '5'
SELECT id_the , id_khach_hang , ma_loai_the , so_the FROM the_khach_hang
SELECT lot.id_lot, lot.chi_tiet_ve_cac_lot FROM lot JOIN nha_dau_tu ON lot.id_nha_dau_tu = nha_dau_tu.id_nha_dau_tu WHERE nha_dau_tu.chi_tiet_ve_nha_dau_tu = 'l'
SELECT ca_si.ten FROM ca_si JOIN bai_hat ON ca_si.id_ca_si = bai_hat.id_ca_si GROUP BY ca_si.id_ca_si HAVING COUNT(*) > 1
SELECT T1.ten FROM san_van_dong AS T1 JOIN su_kien AS T2 ON T1.id = T2.id_san_van_dong JOIN ho_so AS T3 ON T2.id = T3.id_su_kien JOIN van_dong_vien_boi AS T4 ON T3.id_van_dong_vien_boi = T4.id WHERE T4.quoc_tich = 'Úc'
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc ORDER BY gia_tinh_theo_do_la DESC LIMIT 1
SELECT id_bao_tang , ten FROM bao_tang ORDER BY so_luong_nhan_vien DESC LIMIT 1
SELECT T1.id_khach_hang , COUNT ( * ) FROM khach_hang AS T1 JOIN the_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang
SELECT hoc_sinh_trung_hoc.ten , COUNT(*) FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id
SELECT loai, quoc_tich FROM tau
SELECT ten_dang_nhap, ho FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT nguoi_choi.ten , AVG(xep_hang.xep_hang) FROM nguoi_choi JOIN xep_hang ON nguoi_choi.id_nguoi_choi = xep_hang.id_nguoi_choi GROUP BY nguoi_choi.id_nguoi_choi
SELECT DISTINCT kien_truc_su.ten, kien_truc_su.quoc_tich FROM kien_truc_su JOIN nha_may ON kien_truc_su.id = nha_may.id_kien_truc_su
SELECT toa_hoa.ten , nha_ga.ten FROM toa_hoa JOIN nha_ga_tau_hoa ON toa_hoa.id_tau = nha_ga_tau_hoa.id_tau JOIN nha_ga ON nha_ga_tau_hoa.id_nha_ga = nha_ga.id_ga_tau
SELECT nguoi_chien_thang, nguoi_thua_cuoc FROM tran_dau ORDER BY phut DESC LIMIT 1
SELECT mau_cua_khu_nha , COUNT ( * ) FROM khu_nha GROUP BY mau_cua_khu_nha
SELECT san_van_dong.ten , san_van_dong.suc_chua FROM su_kien JOIN san_van_dong ON su_kien.id_san_van_dong = san_van_dong.id WHERE su_kien.ten = 'giải trẻ thế giới'
SELECT khach_tham_quan.id_khach_tham_quan, khach_tham_quan.ten, khach_tham_quan.tuoi FROM khach_tham_quan JOIN chuyen_tham ON khach_tham_quan.id_khach_tham_quan = chuyen_tham.id_khach_tham_quan GROUP BY khach_tham_quan.id_khach_tham_quan HAVING COUNT(*) > 1
SELECT T2.ngay_dang_ky, T2.ngay_hoan_thanh FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE T1.ten_ca_nhan = 'Karson'
SELECT ten, quoc_gia FROM ca_si WHERE ten_bai_hat LIKE '%Hey%'
SELECT COUNT(*) FROM khach_hang JOIN the_khach_hang ON khach_hang.id_khach_hang = the_khach_hang.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Blanche' AND khach_hang.ho_cua_khach_hang = 'Huels'
SELECT ten, dia_diem FROM nha_ga ORDER BY so_luong_xuat_canh_hang_nam, so_luong_trao_doi_hang_nam
SELECT ngay_lam_bai_kiem_tra FROM bai_kiem_tra_cua_sinh_vien WHERE ket_qua_kiem_tra = 'Trượt'
SELECT giang_vien.ho FROM giang_vien JOIN la_thanh_vien_cua ON giang_vien.id_giang_vien = la_thanh_vien_cua.id_giang_vien JOIN khoa ON la_thanh_vien_cua.ma_so_khoa = khoa.ma_so_khoa WHERE khoa.ten_khoa = 'Khoa học máy tính'
SELECT sinh_vien.ho, sinh_vien.ten, dang_ky_khoa_hoc.diem FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien
SELECT nha_mang FROM dien_thoai GROUP BY nha_mang HAVING SUM(CASE WHEN bo_nho_theo_g < 32 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN bo_nho_theo_g > 64 THEN 1 ELSE 0 END) > 0
SELECT nam FROM buoi_hoa_nhac GROUP BY nam ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_tich FROM nguoi_to_chuc GROUP BY quoc_tich ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(hoc_sinh_trung_hoc.khoi_lop) FROM hoc_sinh_trung_hoc JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh WHERE hoc_sinh_trung_hoc.id IN (SELECT DISTINCT id_hoc_sinh FROM ban_be)
SELECT AVG(tong_so_hanh_khach), MAX(tong_so_hanh_khach) FROM nha_ga WHERE dia_diem IN ('Luân Đôn', 'Glasgow')
SELECT cap_bac FROM thanh_pho WHERE dan_so > 1500 AND dan_so < 500
SELECT AVG(dang_ky_khoa_hoc.diem) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien WHERE sinh_vien.ho = 'Smith'
SELECT loai FROM tau GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi = 'Giao huynh' INTERSECT SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi = 'Giai dau'
SELECT COUNT(*) FROM buoi_hoa_nhac WHERE id_san_van_dong = (SELECT id_san_van_dong FROM san_van_dong ORDER BY suc_chua DESC LIMIT 1)
SELECT nha_mang FROM dien_thoai GROUP BY nha_mang ORDER BY COUNT(*) DESC LIMIT 1
SELECT ho , ten FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM dang_ky_khoa_hoc)
SELECT ten FROM san_van_dong WHERE suc_chua < (SELECT AVG(suc_chua) FROM san_van_dong)
SELECT T1.ten, T1.tuoi FROM khach_tham_quan AS T1 JOIN chuyen_tham AS T2 ON T1.id_khach_tham_quan = T2.id_khach_tham_quan GROUP BY T1.id_khach_tham_quan ORDER BY COUNT(T2.so_luong_ve) DESC LIMIT 1
SELECT ten FROM nha_ga WHERE id_ga_tau NOT IN (SELECT id_nha_ga FROM nha_ga_tau_hoa)
SELECT quoc_tich FROM nguoi_to_chuc WHERE tuoi > 45 INTERSECT SELECT quoc_tich FROM nguoi_to_chuc WHERE tuoi < 35
SELECT ten FROM van_dong_vien_boi WHERE id NOT IN (SELECT id_van_dong_vien_boi FROM ho_so)
SELECT T2.mo_ta_ve_vai_tro FROM nguoi_dung T1 JOIN vai_tro T2 ON T1.ma_vai_tro = T2.ma_vai_tro GROUP BY T2.ma_vai_tro ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khoa FROM khoa WHERE bo_phan IN ('AS', 'EN') AND toa_nha = 'NEB'
SELECT nguoi_choi.ten, xep_hang.diem_xep_hang FROM tran_dau JOIN nguoi_choi ON tran_dau.id_cua_nguoi_chien_thang = nguoi_choi.id_nguoi_choi JOIN xep_hang ON nguoi_choi.id_nguoi_choi = xep_hang.id_nguoi_choi GROUP BY nguoi_choi.id_nguoi_choi ORDER BY COUNT(tran_dau.id_cua_nguoi_chien_thang) DESC LIMIT 1
SELECT ten_ca_nhan FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien)
SELECT ten FROM bao_tang WHERE id_bao_tang NOT IN (SELECT id_bao_tang FROM chuyen_tham)
SELECT ten, ma_quoc_gia FROM nguoi_choi JOIN tran_dau ON nguoi_choi.id_nguoi_choi = tran_dau.id_cua_nguoi_chien_thang OR nguoi_choi.id_nguoi_choi = tran_dau.id_nguoi_thua_cuoc GROUP BY nguoi_choi.id_nguoi_choi ORDER BY COUNT(DISTINCT id_giai_dau) DESC LIMIT 1
SELECT ten_dang_nhap FROM sinh_vien INTERSECT SELECT ten_dang_nhap FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT ten FROM san_van_dong WHERE id_san_van_dong NOT IN (SELECT id_san_van_dong FROM buoi_hoa_nhac)
SELECT T1.id_sinh_vien , T1.ten_ca_nhan FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT ma_tai_lieu , ten_tai_lieu FROM tai_lieu WHERE ma_loai_tai_lieu IN (SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3) AND ma_cau_truc_tai_lieu IN (SELECT ma_cau_truc_tai_lieu FROM tai_lieu GROUP BY ma_cau_truc_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3)
SELECT ten, lai_suat_thi_truong FROM do_noi_that WHERE id_do_noi_that NOT IN (SELECT id_do_noi_that FROM xuong_san_xuat_do_noi_that)
SELECT COUNT(*) FROM nha_khoa_hoc WHERE ssn NOT IN (SELECT nha_khoa_hoc FROM phan_cong_du_an)
SELECT T2.ngay_dang_ky, T2.ngay_hoan_thanh FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE T1.ho = 'Zieme' AND T1.ten_dem = 'Bernie'
SELECT ten_khach_hang FROM khach_hang JOIN thu_quang_cao_gui_khach_hang ON khach_hang.id_khach_hang = thu_quang_cao_gui_khach_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_sinh_vien , T1.ten_dang_nhap FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ky, luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Zieme' AND sinh_vien.ten_ca_nhan LIKE 'Bernie%'
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT quoc_gia FROM cuoc_thi GROUP BY quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.mo_ta_ve_cau_truc_tai_lieu FROM tai_lieu AS T1 JOIN cau_truc_tai_lieu AS T2 ON T1.ma_cau_truc_tai_lieu = T2.ma_cau_truc_tai_lieu ORDER BY T1.so_luong_truy_cap ASC LIMIT 1
SELECT T1.ten FROM san_van_dong AS T1 JOIN su_kien AS T2 ON T1.id = T2.id_san_van_dong JOIN ho_so AS T3 ON T2.id = T3.id_su_kien GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten FROM van_dong_vien_boi AS T1 JOIN ho_so AS T2 ON T1.id_van_dong_vien_boi = T2.id_van_dong_vien_boi GROUP BY T1.id_van_dong_vien_boi ORDER BY COUNT(*) DESC LIMIT 1
SELECT du_an.ten , nha_khoa_hoc.ten FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an JOIN nha_khoa_hoc ON phan_cong_du_an.nha_khoa_hoc = nha_khoa_hoc.ssn ORDER BY du_an.so_gio ASC LIMIT 1
SELECT ten_khoa FROM khoa JOIN la_thanh_vien_cua ON khoa.ma_so_khoa = la_thanh_vien_cua.ma_so_khoa GROUP BY khoa.ma_so_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT nha_khoa_hoc.ten FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc JOIN du_an ON phan_cong_du_an.du_an = du_an.ma WHERE du_an.ten IN ('Vật chất của thời gian', 'Hiện tượng thị sai kỳ bí') GROUP BY nha_khoa_hoc.ssn HAVING COUNT(DISTINCT du_an.ten) = 2
SELECT T1.ma_vung FROM ma_vung_cua_tieu_bang T1 JOIN phieu_bau T2 ON T1.tieu_bang = T2.tieu_bang GROUP BY T1.tieu_bang ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khach_hang, phuong_thuc_thanh_toan FROM khach_hang WHERE id_khach_hang IN (SELECT id_khach_hang FROM thu_quang_cao_gui_khach_hang WHERE ma_ket_qua = 'Đặt hàng') AND id_khach_hang NOT IN (SELECT id_khach_hang FROM thu_quang_cao_gui_khach_hang WHERE ma_ket_qua = 'Đặt hàng' GROUP BY id_khach_hang HAVING COUNT(DISTINCT ma_ket_qua) = 1)
SELECT khoi_lop FROM hoc_sinh_trung_hoc WHERE id NOT IN (SELECT id_hoc_sinh FROM ban_be UNION SELECT id_ban_be FROM ban_be) ORDER BY khoi_lop LIMIT 1
SELECT id_khach_hang, ten_cua_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM the_khach_hang)
SELECT thi_sinh.ma_so_thi_sinh , thi_sinh.ten_thi_sinh FROM thi_sinh JOIN phieu_bau ON thi_sinh.ma_so_thi_sinh = phieu_bau.ma_so_thi_sinh GROUP BY thi_sinh.ma_so_thi_sinh ORDER BY COUNT ( * ) ASC LIMIT 1
SELECT T1.ten FROM nha_san_xuat T1 JOIN xuong_san_xuat_do_noi_that T2 ON T1.id_nha_san_xuat = T2.id_nha_san_xuat JOIN do_noi_that T3 ON T2.id_do_noi_that = T3.id_do_noi_that WHERE T3.so_luong_bo_phan < 6 INTERSECT SELECT T1.ten FROM nha_san_xuat T1 JOIN xuong_san_xuat_do_noi_that T2 ON T1.id_nha_san_xuat = T2.id_nha_san_xuat JOIN do_noi_that T3 ON T2.id_do_noi_that = T3.id_do_noi_that WHERE T3.so_luong_bo_phan > 10
SELECT nguoi_choi.ten , nguoi_choi.ma_quoc_gia FROM tran_dau JOIN nguoi_choi ON tran_dau.id_cua_nguoi_chien_thang = nguoi_choi.id_nguoi_choi WHERE tran_dau.ten_giai_dau = 'vô địch WTA' INTERSECT SELECT nguoi_choi.ten , nguoi_choi.ma_quoc_gia FROM tran_dau JOIN nguoi_choi ON tran_dau.id_cua_nguoi_chien_thang = nguoi_choi.id_nguoi_choi WHERE tran_dau.ten_giai_dau = 'Úc mở rộng'
SELECT T1.id_nha_dau_tu , T1.chi_tiet_ve_nha_dau_tu FROM nha_dau_tu AS T1 JOIN giao_dich AS T2 ON T1.id_nha_dau_tu = T2.id_nha_dau_tu GROUP BY T1.id_nha_dau_tu ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT nam_dau_tien, nam_cuoi_cung FROM bua_tiec WHERE chu_de_bua_tiec IN ('Mùa Xuân', 'Technology')
