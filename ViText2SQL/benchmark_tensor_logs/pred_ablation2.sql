SELECT ten FROM du_an WHERE so_gio BETWEEN 100 AND 300
SELECT ten_khoa_hoc FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT dia_diem FROM rap_chieu_phim GROUP BY dia_diem HAVING COUNT(*) > 1
SELECT nam FROM cuoc_thi WHERE loai_cuoc_thi != 'Giải đấu'
SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu HAVING COUNT(*) > 2
SELECT SUM(so_luong_truy_cap) / COUNT(*) FROM tai_lieu
SELECT loai_giao_dich FROM giao_dich_tai_chinh UNION SELECT ma_loai_the FROM the_khach_hang UNION SELECT ten_tai_khoan FROM tai_khoan UNION SELECT ten_cua_khach_hang FROM khach_hang ORDER BY loai_giao_dich ASC LIMIT 1000000
SELECT COUNT(*) FROM khu_nha
SELECT AVG(vang) FROM thu_hang_cua_cau_lac_bo
SELECT id_khoa_hoc, ten_khoa_hoc, so_luong_tin_chi FROM khoa_hoc ORDER BY so_luong_tin_chi ASC
SELECT ten FROM tau WHERE quoc_tich != 'Hoa Kỳ'
SELECT ten_giai_dau FROM tran_dau GROUP BY ten_giai_dau HAVING COUNT(*) > 10
SELECT COUNT(*) FROM toa_hoa JOIN nha_ga_tau_hoa ON toa_hoa.id_tau = nha_ga_tau_hoa.id_tau JOIN nha_ga ON nha_ga_tau_hoa.id_nha_ga = nha_ga.id_ga_tau
SELECT ten FROM dien_thoai ORDER BY gia_ban ASC
SELECT COUNT(DISTINCT dang_ky_khoa_hoc.id_sinh_vien) FROM dang_ky_khoa_hoc JOIN chuyen_doi_diem ON dang_ky_khoa_hoc.diem = chuyen_doi_diem.bang_diem WHERE chuyen_doi_diem.diem_so = 3.0
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE id_muc_nhap_tiep_theo > 8
SELECT xep_hang_dieu_tra_dan_so FROM thanh_pho WHERE cap_bac != 'Làng'
SELECT duoc_dao_dien_boi FROM phim GROUP BY duoc_dao_dien_boi ORDER BY duoc_dao_dien_boi ASC LIMIT 1000000
SELECT duoc_dao_dien_boi FROM phim
SELECT ten_khoa FROM khoa WHERE toa_nha = 'Mergenthaler'
SELECT COUNT(DISTINCT ma_loai_the) FROM the_khach_hang
SELECT COUNT(DISTINCT loai_giao_dich) FROM giao_dich_tai_chinh
SELECT id FROM hoc_sinh_trung_hoc WHERE ten = 'Kyle'
SELECT COUNT(*) FROM nha_khoa_hoc
SELECT ten_giai_dau FROM tran_dau GROUP BY ten_giai_dau HAVING COUNT(*) > 10
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc WHERE chieu_dai < 3 OR chieu_rong > 5
SELECT id_the, id_khach_hang, ma_loai_the, so_the FROM the_khach_hang
SELECT chi_tiet_ve_cac_lot FROM lot JOIN nha_dau_tu ON lot.id_nha_dau_tu = nha_dau_tu.id_nha_dau_tu WHERE nha_dau_tu.chi_tiet_ve_nha_dau_tu = ' l '
SELECT T1.ten FROM bai_hat JOIN ca_si AS T1 ON bai_hat.id_ca_si = T1.id_ca_si GROUP BY T1.id_ca_si HAVING COUNT(*) > 1
SELECT T1.ten FROM san_van_dong AS T1 JOIN ho_so AS T2 ON T1.id = T2.id_su_kien JOIN van_dong_vien_boi AS T3 ON T2.id_van_dong_vien_boi = T3.id WHERE T3.quoc_tich = 'Úc' GROUP BY T1.id HAVING COUNT(DISTINCT T2.id) > 0
SELECT ten_muc_nhap_cua_danh_muc FROM noi_dung_danh_muc ORDER BY gia_tinh_theo_do_la DESC LIMIT 1
SELECT id_bao_tang, ten FROM bao_tang ORDER BY so_luong_nhan_vien DESC LIMIT 1
SELECT id_khach_hang, COUNT(*) FROM the_khach_hang GROUP BY id_khach_hang ORDER BY COUNT(*) DESC
SELECT hoc_sinh_trung_hoc.ten, COUNT(ban_be.id_hoc_sinh) AS count FROM hoc_sinh_trung_hoc LEFT JOIN ban_be ON hoc_sinh_trung_hoc.id = ban_be.id_hoc_sinh GROUP BY hoc_sinh_trung_hoc.id ORDER BY count DESC LIMIT 10
SELECT loai, quoc_tich FROM tau
SELECT ten_dang_nhap, ho FROM tac_gia_khoa_hoc_va_nguoi_huong_dan UNION SELECT ten_dang_nhap, ho FROM tac_gia_khoa_hoc_va_nguoi_huong_dan WHERE id_tac_gia IN (SELECT id_tac_gia FROM khoa_hoc)
SELECT ten, AVG(thu_hang_nguoi_chien_thang) FROM tran_dau JOIN nguoi_choi ON tran_dau.id_cua_nguoi_chien_thang = nguoi_choi.id_nguoi_choi GROUP BY nguoi_choi.id_nguoi_choi ORDER BY AVG(thu_hang_nguoi_chien_thang) DESC
SELECT ten, quoc_tich FROM kien_truc_su WHERE id IN (SELECT id_kien_truc_su FROM nha_may) ORDER BY ten ASC
SELECT toa_hoa.ten, nha_ga.ten FROM toa_hoa JOIN nha_ga_tau_hoa ON toa_hoa.id_tau = nha_ga_tau_hoa.id_tau JOIN nha_ga ON nha_ga_tau_hoa.id_nha_ga = nha_ga.id_ga_tau ORDER BY toa_hoa.ten ASC
SELECT tran_dau.nguoi_chien_thang, tran_dau.nguoi_thua_cuoc FROM tran_dau ORDER BY tran_dau.phut DESC LIMIT 1
SELECT mau_cua_khu_nha, COUNT(*) FROM khu_nha GROUP BY mau_cua_khu_nha ORDER BY COUNT(*) DESC
SELECT T1.ten, T1.suc_chua FROM san_van_dong AS T1 JOIN su_kien AS T2 ON T1.id = T2.id_san_van_dong WHERE T2.ten = 'giải trẻ thế giới'
SELECT id_khach_tham_quan AS id, ten, tuoi FROM khach_tham_quan WHERE id_khach_tham_quan IN (SELECT id_khach_tham_quan FROM chuyen_tham GROUP BY id_khach_tham_quan HAVING COUNT(*) > 1)
SELECT ngay_dang_ky, ngay_hoan_thanh FROM luot_dang_ky_khoa_hoc_cua_sinh_vien JOIN sinh_vien ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ten_ca_nhan = 'Karson'
SELECT ca_si.ten, ca_si.quoc_gia FROM ca_si WHERE ca_si.ten_bai_hat LIKE '%Hey%'
SELECT COUNT(*) FROM the_khach_hang JOIN khach_hang ON the_khach_hang.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten_cua_khach_hang = 'Blanche' AND khach_hang.ho_cua_khach_hang = 'Huels'
SELECT dia_diem, so_luong_xuat_canh_hang_nam, so_luong_trao_doi_hang_nam FROM nha_ga ORDER BY so_luong_xuat_canh_hang_nam DESC, so_luong_trao_doi_hang_nam DESC
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh FROM bai_kiem_tra_cua_sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON bai_kiem_tra_cua_sinh_vien.id_dang_ky = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_dang_ky JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE bai_kiem_tra_cua_sinh_vien.ket_qua_kiem_tra = 'Trượt' AND luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh IS NOT NULL
SELECT ten FROM giang_vien JOIN la_thanh_vien_cua ON giang_vien.id_giang_vien = la_thanh_vien_cua.id_giang_vien JOIN khoa ON la_thanh_vien_cua.ma_so_khoa = khoa.ma_so_khoa WHERE khoa.ten_khoa = 'Khoa học máy tính' AND giang_vien.ho = 'Gi'
SELECT sinh_vien.ho || ' ' || sinh_vien.ten AS ten_day_du, dang_ky_khoa_hoc.diem FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien
SELECT ten FROM dien_thoai WHERE bo_nho_theo_g < 32 INTERSECT SELECT ten FROM dien_thoai WHERE bo_nho_theo_g > 64
SELECT nam, COUNT(*) AS COUNT FROM buoi_hoa_nhac GROUP BY nam ORDER BY COUNT DESC LIMIT 1
SELECT quoc_tich FROM nguoi_to_chuc GROUP BY quoc_tich ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(khoi_lop) FROM hoc_sinh_trung_hoc WHERE id IN (SELECT id_hoc_sinh FROM ban_be)
SELECT AVG(tong_so_hanh_khach), MAX(tong_so_hanh_khach) FROM nha_ga WHERE dia_diem IN ('London', 'Glasgow')
SELECT cap_bac FROM thanh_pho WHERE dan_so > 1500 AND dan_so < 500
SELECT AVG(chuyen_doi_diem.diem_so) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.id_sinh_vien = dang_ky_khoa_hoc.id_sinh_vien JOIN chuyen_doi_diem ON dang_ky_khoa_hoc.diem = chuyen_doi_diem.bang_diem WHERE sinh_vien.ho = 'Smith'
SELECT loai FROM tau GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi = 'Giao huynh' UNION SELECT quoc_gia FROM cuoc_thi WHERE loai_cuoc_thi = 'Giai dau'
SELECT COUNT(*) FROM buoi_hoa_nhac JOIN san_van_dong ON buoi_hoa_nhac.id_san_van_dong = san_van_dong.id_san_van_dong WHERE san_van_dong.suc_chua = (SELECT MAX(suc_chua) FROM san_van_dong)
SELECT nha_mang FROM dien_thoai GROUP BY nha_mang ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM dang_ky_khoa_hoc)
SELECT ten FROM san_van_dong WHERE suc_chua < (SELECT AVG(suc_chua) FROM san_van_dong)
SELECT khach_tham_quan.ten, khach_tham_quan.tuoi FROM khach_tham_quan JOIN chuyen_tham ON khach_tham_quan.id_khach_tham_quan = chuyen_tham.id_khach_tham_quan GROUP BY khach_tham_quan.id_khach_tham_quan ORDER BY SUM(so_luong_ve) DESC LIMIT 1
SELECT ten FROM nha_ga WHERE id_ga_tau NOT IN (SELECT id_nha_ga FROM nha_ga_tau_hoa)
SELECT quoc_tich FROM nguoi_to_chuc WHERE tuoi > '45' INTERSECT SELECT quoc_tich FROM nguoi_to_chuc WHERE tuoi < '35' GROUP BY quoc_tich
SELECT ten FROM van_dong_vien_boi WHERE id NOT IN (SELECT id_van_dong_vien_boi FROM ho_so)
SELECT mo_ta_ve_vai_tro FROM vai_tro JOIN nguoi_dung ON vai_tro.ma_vai_tro = nguoi_dung.ma_vai_tro GROUP BY vai_tro.ma_vai_tro ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khoa FROM khoa WHERE bo_phan IN ('AS', 'EN') AND toa_nha = 'NEB'
SELECT ten_nguoi_chien_thang, diem_xep_hang_cua_nguoi_chien_thang FROM tran_dau ORDER BY so_tran DESC LIMIT 1
SELECT ten_ca_nhan FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien)
SELECT ten FROM bao_tang WHERE id_bao_tang NOT IN (SELECT DISTINCT id_bao_tang FROM chuyen_tham)
SELECT ten, ma_quoc_gia FROM nguoi_choi JOIN tran_dau ON tran_dau.id_cua_nguoi_chien_thang = nguoi_choi.id_nguoi_choi GROUP BY nguoi_choi.id_nguoi_choi ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_dang_nhap FROM sinh_vien INTERSECT SELECT ten_dang_nhap FROM tac_gia_khoa_hoc_va_nguoi_huong_dan
SELECT ten FROM san_van_dong WHERE id_san_van_dong NOT IN (SELECT id_san_van_dong FROM buoi_hoa_nhac)
SELECT T1.id_sinh_vien, T1.ten_ca_nhan FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT tai_lieu.ma_tai_lieu FROM tai_lieu JOIN (SELECT ma_loai_tai_lieu FROM tai_lieu GROUP BY ma_loai_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3) AS T1 ON tai_lieu.ma_loai_tai_lieu = T1.ma_loai_tai_lieu JOIN (SELECT ma_cau_truc_tai_lieu FROM cau_truc_tai_lieu GROUP BY ma_cau_truc_tai_lieu ORDER BY COUNT(*) DESC LIMIT 3) AS T2 ON tai_lieu.ma_cau_truc_tai_lieu = T2.ma_cau_truc_tai_lieu
SELECT ten, lai_suat_thi_truong FROM do_noi_that EXCEPT SELECT T1.ten, T1.lai_suat_thi_truong FROM do_noi_that AS T1 JOIN xuong_san_xuat_do_noi_that AS T2 ON T1.id_do_noi_that = T2.id_do_noi_that
SELECT COUNT(*) FROM nha_khoa_hoc WHERE ssn NOT IN (SELECT nha_khoa_hoc FROM phan_cong_du_an)
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ky, luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh FROM luot_dang_ky_khoa_hoc_cua_sinh_vien JOIN sinh_vien ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Zieme' AND sinh_vien.ten_ca_nhan = 'Bernie'
SELECT ten_khach_hang FROM khach_hang JOIN thu_quang_cao_gui_khach_hang ON khach_hang.id_khach_hang = thu_quang_cao_gui_khach_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT sinh_vien.id_sinh_vien, sinh_vien.ten_dang_nhap FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ky, luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_hoan_thanh FROM luot_dang_ky_khoa_hoc_cua_sinh_vien JOIN sinh_vien ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Zieme' AND sinh_vien.ten_ca_nhan = 'Bernie'
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT DISTINCT id_khach_hang FROM tai_khoan)
SELECT quoc_gia FROM cuoc_thi GROUP BY quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT cau_truc_tai_lieu.mo_ta_ve_cau_truc_tai_lieu FROM tai_lieu JOIN cau_truc_tai_lieu ON tai_lieu.ma_cau_truc_tai_lieu = cau_truc_tai_lieu.ma_cau_truc_tai_lieu ORDER BY tai_lieu.so_luong_truy_cap ASC LIMIT 1
SELECT T1.ten FROM san_van_dong AS T1 JOIN ho_so AS T2 ON T2.id_su_kien = T1.id GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.ten FROM ho_so AS T1 JOIN van_dong_vien_boi AS T2 ON T1.id_van_dong_vien_boi = T2.id GROUP BY T2.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT du_an.ten, nha_khoa_hoc.ten FROM du_an JOIN phan_cong_du_an ON du_an.ma = phan_cong_du_an.du_an JOIN nha_khoa_hoc ON phan_cong_du_an.nha_khoa_hoc = nha_khoa_hoc.ssn WHERE du_an.so_gio = (SELECT MIN(so_gio) FROM du_an) ORDER BY du_an.so_gio LIMIT 1
SELECT ten_khoa FROM khoa JOIN la_thanh_vien_cua ON khoa.ma_so_khoa = la_thanh_vien_cua.ma_so_khoa GROUP BY khoa.ma_so_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT ten FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc JOIN du_an ON phan_cong_du_an.du_an = du_an.ma WHERE du_an.ten = 'Vật chất của thời gian' INTERSECT SELECT ten FROM nha_khoa_hoc JOIN phan_cong_du_an ON nha_khoa_hoc.ssn = phan_cong_du_an.nha_khoa_hoc JOIN du_an ON phan_cong_du_an.du_an = du_an.ma WHERE du_an.ten = 'Hiện tượng thị sai kỳ bí'
SELECT ma_vung FROM phieu_bau JOIN ma_vung_cua_tieu_bang ON phieu_bau.tieu_bang = ma_vung_cua_tieu_bang.tieu_bang GROUP BY ma_vung ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khach_hang, phuong_thuc_thanh_toan FROM khach_hang WHERE id_khach_hang IN (SELECT id_khach_hang FROM thu_quang_cao_gui_khach_hang WHERE ma_ket_qua = 'Đặt hàng') AND id_khach_hang NOT IN (SELECT id_khach_hang FROM thu_quang_cao_gui_khach_hang WHERE ma_ket_qua != 'Đặt hàng')
SELECT khoi_lop FROM hoc_sinh_trung_hoc WHERE id NOT IN (SELECT id_hoc_sinh FROM ban_be) ORDER BY khoi_lop LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.ten_cua_khach_hang FROM khach_hang WHERE khach_hang.id_khach_hang NOT IN (SELECT the_khach_hang.id_khach_hang FROM the_khach_hang)
SELECT thi_sinh.ma_so_thi_sinh, thi_sinh.ten_thi_sinh FROM thi_sinh JOIN phieu_bau ON thi_sinh.ma_so_thi_sinh = phieu_bau.ma_so_thi_sinh GROUP BY thi_sinh.ma_so_thi_sinh, thi_sinh.ten_thi_sinh ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.ten FROM nha_san_xuat AS T1 JOIN xuong_san_xuat_do_noi_that AS T2 ON T1.id_nha_san_xuat = T2.id_nha_san_xuat JOIN do_noi_that AS T3 ON T2.id_do_noi_that = T3.id_do_noi_that WHERE T3.so_luong_bo_phan < 6 AND T3.so_luong_bo_phan > 10 GROUP BY T1.id_nha_san_xuat HAVING COUNT(DISTINCT T3.id_do_noi_that) >= 2
SELECT nguoi_choi.ten, nguoi_choi.ma_quoc_gia FROM nguoi_choi JOIN tran_dau ON tran_dau.id_cua_nguoi_chien_thang = nguoi_choi.id_nguoi_choi WHERE tran_dau.ten_giai_dau = ' vô địch WTA ' OR tran_dau.ten_giai_dau = ' Úc mở rộng ' GROUP BY nguoi_choi.id_nguoi_choi HAVING COUNT(DISTINCT tran_dau.ten_giai_dau) = 2
SELECT nha_dau_tu.id_nha_dau_tu, nha_dau_tu.chi_tiet_ve_nha_dau_tu FROM giao_dich JOIN nha_dau_tu ON giao_dich.id_nha_dau_tu = nha_dau_tu.id_nha_dau_tu GROUP BY nha_dau_tu.id_nha_dau_tu ORDER BY COUNT(*) DESC LIMIT 1
SELECT nam_dau_tien, nam_cuoi_cung FROM bua_tiec WHERE chu_de_bua_tiec = 'Mùa Xuân' OR chu_de_bua_tiec = 'Teqnology' ORDER BY nam_dau_tiec LIMIT 1
