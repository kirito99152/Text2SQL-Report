SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien FROM lop_hoc JOIN nhan_vien ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien WHERE lop_hoc.ma_khoa_hoc IN ('CIS-220', 'QM-261')
select count(distinct ma_tien_te) from nhom_hoi_thao_kich
SELECT ten FROM danh_sach WHERE phong_hoc = 107
SELECT T1.ho , T1.ten FROM nhan_vien AS T1 JOIN luot_cho_thue AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien JOIN khach_hang AS T3 ON T2.id_khach_hang = T3.id_khach_hang WHERE T3.ten = 'April' AND T3.ho = 'Burns'
SELECT cau_thu.cau_thu , tran_dau_trong_mua_giai.vi_tri FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu WHERE tran_dau_trong_mua_giai.truong_dai_hoc IN ('UCLA', 'Duke')
SELECT T1.id_san_pham FROM cac_san_pham AS T1 JOIN mat_hang_duoc_dat AS T2 ON T1.id_san_pham = T2.id_san_pham GROUP BY T1.id_san_pham ORDER BY COUNT(*) DESC LIMIT 1
SELECT ho FROM ban_nhac JOIN nhac_cu ON ban_nhac.id = nhac_cu.id_nghe_si_trong_ban_nhac GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM khach_hang
SELECT ten_khu_pho_lan_can FROM khu_vuc_lan_can JOIN doanh_nghiep ON khu_vuc_lan_can.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.thanh_pho = 'Madison' GROUP BY ten_khu_pho_lan_can ORDER BY COUNT(*) DESC LIMIT 1
SELECT SUM(dan_so_thanh_pho) FROM quan WHERE dien_tich_cua_cac_thanh_pho > (SELECT AVG(dien_tich_cua_cac_thanh_pho) FROM quan)
SELECT COUNT(*) FROM hang_ton_kho WHERE id_cua_hang = 1
SELECT nha_tho.ten FROM nha_tho JOIN le_cuoi ON nha_tho.id_nha_tho = le_cuoi.id_nha_tho JOIN ca_nhan AS ca_nhan_1 ON le_cuoi.id_nam = ca_nhan_1.id_ca_nhan JOIN ca_nhan AS ca_nhan_2 ON le_cuoi.id_nu = ca_nhan_2.id_ca_nhan WHERE ca_nhan_1.tuoi > 30 AND ca_nhan_2.tuoi > 30
SELECT T2.ten FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan WHERE T2.gioi_tinh = 'nữ' ORDER BY T2.ten ASC
SELECT ten_viet_tat FROM hang_hang_khong WHERE ten_hang_hang_khong = 'Jetblue Airways'
SELECT hang_thu_am FROM album
SELECT nha_tho.ten FROM nha_tho JOIN le_cuoi ON nha_tho.id_nha_tho = le_cuoi.id_nha_tho WHERE nha_tho.ngay_mo_cua NOT BETWEEN 20150101 AND 20151231
SELECT ten FROM dai_dien WHERE dang != 'Đảng Cộng hoà'
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN lan_tham_du_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien WHERE lan_tham_du_khoa_hoc_cua_sinh_vien.id_khoa_hoc = '301' ORDER BY lan_tham_du_khoa_hoc_cua_sinh_vien.ngay_tham_du DESC LIMIT 1
SELECT ten_nguoi_quan_ly, quan FROM cua_hang ORDER BY so_luong_san_pham DESC LIMIT 1
SELECT COUNT(DISTINCT ngay_xuat_ban) FROM an_pham
SELECT ten, quoc_gia FROM ca_nhan WHERE tuoi < (SELECT AVG(tuoi) FROM ca_nhan)
SELECT COUNT(*) FROM quoc_gia
SELECT COUNT(*) FROM nhan_vien
SELECT ho, ten FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'MARROTTE' AND giao_vien.ten = 'KIRK'
SELECT id_album, tieu_de, nam, hang_thu_am, loai FROM album WHERE nam = 2010
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang JOIN tieu_de_cua_yeu_cau ON chinh_sach.id_chinh_sach = tieu_de_cua_yeu_cau.id_chinh_sach ORDER BY tieu_de_cua_yeu_cau.so_tien_duoc_tra ASC LIMIT 1
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa IN ('Kế toán', 'Sinh học')
SELECT COUNT(*) FROM giao_su WHERE bang_cap_cao_nhat = 'Tiến sĩ'
SELECT COUNT(*) FROM tau_hoa WHERE ten LIKE '%Tốc hành%'
SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi = 'CLE' INTERSECT SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi = 'CWS'
SELECT vi_tri , COUNT ( * ) FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.doi = tran_dau_trong_mua_giai.doi GROUP BY tran_dau_trong_mua_giai.vi_tri
SELECT ca_nhan.ten , ca_nhan.ten_dem , ca_nhan.ho , ca_nhan.so_di_dong , ca_nhan.dia_chi_email , ca_nhan.ten_dang_nhap , ca_nhan.mat_khau FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN ca_nhan ON sinh_vien.chi_tiet_sinh_vien = ca_nhan.id_ca_nhan GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_bay.thanh_pho FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay GROUP BY san_bay.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ho_cua_sinh_vien , T1.ten_cua_sinh_vien FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.ma_so_sinh_vien = T2.ma_so_sinh_vien JOIN lop_hoc AS T3 ON T2.ma_lop = T3.ma_lop_hoc JOIN khoa_hoc AS T4 ON T3.ma_khoa_hoc = T4.ma_khoa_hoc WHERE T4.ma_khoa_hoc = 'ACCT-211' AND T1.ho_cua_sinh_vien LIKE 'S%'
SELECT loai_dich_vu.ma_loai_dich_vu, loai_dich_vu.mo_ta_ve_loai_dich_vu FROM loai_dich_vu JOIN dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu GROUP BY loai_dich_vu.ma_loai_dich_vu ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM doanh_nghiep WHERE danh_gia_xep_hang = 3.5
SELECT chi_tiet_khach_hang FROM khach_hang WHERE chi_tiet_khach_hang LIKE '%Diana%'
SELECT bo_phim.tieu_de FROM bo_phim JOIN ban_quyen ON bo_phim.id_bo_phim = ban_quyen.id_se_ri_phim JOIN phan_vai ON ban_quyen.id_se_ri_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Woody Strode' INTERSECT SELECT bo_phim.tieu_de FROM bo_phim JOIN ban_quyen ON bo_phim.id_bo_phim = ban_quyen.id_se_ri_phim JOIN phan_vai ON ban_quyen.id_se_ri_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Jason Robards'
SELECT dao_dien.ten FROM bo_phim JOIN nhan ON bo_phim.id_bo_phim = nhan.id_se_ri_phim JOIN tu_khoa ON nhan.id_tu_khoa = tu_khoa.id JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE tu_khoa.tu_khoa = 'Vũ khí hạt nhân'
SELECT khach_hang.ten_khach_hang, khach_hang.dien_thoai_khach_hang FROM khach_hang JOIN luot_dat_hang_cua_khach_hang ON khach_hang.id_khach_hang = luot_dat_hang_cua_khach_hang.id_khach_hang JOIN mat_hang_duoc_dat ON luot_dat_hang_cua_khach_hang.id_don_hang = mat_hang_duoc_dat.id_don_hang GROUP BY khach_hang.id_khach_hang ORDER BY CAST(mat_hang_duoc_dat.so_luong_dat_hang AS INTEGER) DESC LIMIT 1
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai WHERE vi_tri = 'tiền vệ' INTERSECT SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai WHERE vi_tri = 'hậu vệ'
SELECT T3.ten FROM nui AS T1 JOIN anh AS T2 ON T1.id = T2.id_nui JOIN ong_kinh_may_anh AS T3 ON T2.id_ong_kinh_may_anh = T3.id WHERE T1.chieu_cao = (SELECT MAX(chieu_cao) FROM nui)
SELECT ho FROM danh_sach WHERE khoi_lop = 1 AND phong_hoc NOT IN (SELECT phong_hoc FROM giao_vien WHERE ho = 'OTHA' AND ten = 'MOYER')
SELECT thanh_pho.thanh_pho, nhiet_do.thang_hai FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho ORDER BY nhiet_do.thang_hai DESC LIMIT 1
SELECT T3.ho_cua_nhan_vien , T3.ten_cua_nhan_vien FROM giao_su AS T1 JOIN khoa AS T2 ON T1.ma_khoa = T2.ma_khoa JOIN nhan_vien AS T3 ON T1.ma_so_nhan_vien = T3.ma_so_nhan_vien WHERE T2.ten_khoa = 'Sinh học'
SELECT tieu_de FROM phim WHERE (thoi_luong_phim > 100 OR danh_gia_xep_hang = 'PG') AND gia_thay_the <= 200
SELECT khach_hang.id_khach_hang , khach_hang.ten , khach_hang.ho FROM khach_hang JOIN khoan_thanh_toan ON khach_hang.id_khach_hang = khoan_thanh_toan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY SUM(khoan_thanh_toan.so_tien) ASC LIMIT 1
SELECT ten FROM giao_vien WHERE id_giao_vien NOT IN (SELECT id_giao_vien FROM sap_xep_khoa_hoc)
SELECT khoa.ten_khoa FROM khoa JOIN sinh_vien ON khoa.ma_khoa = sinh_vien.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.mua_giai FROM chan_thuong AS T1 JOIN tran_dau AS T2 ON T1.id_tran_dau = T2.id WHERE T1.cau_thu = 'Walter Samuel'
SELECT ho , ten FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc GROUP BY giao_vien.phong_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT id_cua_hang FROM hang_ton_kho GROUP BY id_cua_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ho FROM ban_nhac AS T1 JOIN buoi_bieu_dien AS T2 ON T1.id = T2.nghe_si_trong_ban_nhac WHERE T2.vi_tri_tren_san_khau = 'hậu trường' GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT ho , ten FROM dien_vien JOIN dien_vien_dien_anh ON dien_vien.id_dien_vien = dien_vien_dien_anh.id_dien_vien GROUP BY dien_vien.id_dien_vien HAVING COUNT(*) > 30
SELECT COUNT(DISTINCT danh_gia.id_nguoi_tieu_dung) FROM danh_gia JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Bistro Di Napoli' AND danh_gia.nam = 2015
SELECT giang_vien.ngach, COUNT(*) FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien GROUP BY giang_vien.ngach
SELECT ten_loai_nha_hang FROM loai_nha_hang
SELECT ten_dai_ly_van_chuyen FROM dai_ly_van_chuyen_tai_lieu
SELECT AVG(so_luong_nguoi_tham_du_trung_binh) FROM san_van_dong WHERE phan_tram_suc_chua > 100
SELECT COUNT(*) FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE hang_hang_khong.ten_hang_hang_khong = 'United Airlines' AND san_bay.ma_san_bay = 'AHD'
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.bang_cap_cao_nhat = 'Tiến sĩ'
SELECT tai_lieu.id_tai_lieu , ban_sao.so_luong_ban_sao FROM tai_lieu JOIN ban_sao ON tai_lieu.id_tai_lieu = ban_sao.id_tai_lieu ORDER BY ban_sao.so_luong_ban_sao DESC LIMIT 1
SELECT ten FROM doanh_nghiep WHERE danh_gia_xep_hang > 3.5
SELECT cau_thu.id FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api AND cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa WHERE dac_diem_cua_cau_thu.chan_thuan = 'chan trai' AND cau_thu.chieu_cao BETWEEN 180 AND 190
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha GROUP BY thanh_pho.id_thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT giong_hat.loai FROM ban_nhac JOIN giong_hat ON ban_nhac.id = giong_hat.nghe_si_trong_ban_nhac WHERE ban_nhac.ho = 'Hello'
SELECT sinh_vien.ho, sinh_vien.ten FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien WHERE giang_vien.ho = 'Goodrich' AND giang_vien.ten = 'Micheal'
SELECT khach_hang.id_khach_hang, khach_hang.ten_khach_hang, khach_hang.ho_cua_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT kich_thuoc_trang_toi_da, so_trang_mau_tren_tung_phut FROM san_pham WHERE kich_thuoc_trang_toi_da = 'A 4' AND so_trang_mau_tren_tung_phut < 5
SELECT ten_khoa_hoc FROM khoa_hoc ORDER BY ten_khoa_hoc ASC
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa IN ('Kế toán', 'Sinh học')
SELECT ho , ten FROM giang_vien
SELECT COUNT(*) FROM nha_hang JOIN loai_cua_nha_hang ON nha_hang.id_nha_hang = loai_cua_nha_hang.id_nha_hang JOIN loai_nha_hang ON loai_cua_nha_hang.id_loai_nha_hang = loai_nha_hang.id_loai_nha_hang WHERE loai_nha_hang.ten_loai_nha_hang = 'Sandwich'
SELECT T1.nhac_cu FROM nhac_cu AS T1 JOIN ban_nhac AS T2 ON T1.id_nghe_si_trong_ban_nhac = T2.id JOIN bai_hat AS T3 ON T1.id_bai_hat = T3.id_bai_hat WHERE T2.ho = 'Heilo' AND T3.tieu_de = 'Le Pop'
SELECT ca_nhan.ten , ca_nhan.ten_dem , ca_nhan.ho , luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc , luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ki FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN ca_nhan ON sinh_vien.chi_tiet_sinh_vien = ca_nhan.id_ca_nhan ORDER BY luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ki DESC
SELECT so_dien_thoai, ma_buu_dien FROM dia_chi WHERE dia_chi = '1031 Daugavpils Parkway'
SELECT ban_nhac.ten, ban_nhac.ho FROM ban_nhac JOIN buoi_bieu_dien ON ban_nhac.id = buoi_bieu_dien.nghe_si_trong_ban_nhac WHERE buoi_bieu_dien.vi_tri_tren_san_khau = 'hậu trường' AND buoi_bieu_dien.id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Badlands')
SELECT ngach FROM giang_vien GROUP BY ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT mo_ta_ve_khoa_hoc, so_luong_tin_chi_cua_khoa_hoc FROM khoa_hoc WHERE ma_khoa_hoc = 'CIS-220'
SELECT T2.ngay, SUM(T2.so_nguoi_bi_giet) FROM toi_pham AS T2 JOIN ca_nhan AS T1 ON T2.id_ca_nhan = T1.id_ca_nhan GROUP BY T1.id_ca_nhan ORDER BY SUM(T2.so_nguoi_bi_giet) DESC
SELECT DISTINCT kich_thuoc_san_pham FROM san_pham
SELECT SUM(dan_so_thanh_pho) FROM quan ORDER BY dien_tich_cua_cac_thanh_pho DESC LIMIT 3
SELECT T1.id_bai_giang FROM bai_giang AS T1 JOIN nhan_vien AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien WHERE T2.ten = 'Janessa' AND T2.ho = 'Sawayn' AND T2.biet_danh LIKE '%s%'
select t1.id_ky_su , t1.ten , t1.ho from ky_su_bao_tri as t1 join chuyen_tham_cua_ky_su as t2 on t1.id_ky_su = t2.id_ky_su group by t1.id_ky_su order by count(*) desc limit 1
SELECT COUNT(DISTINCT dia_diem) FROM cua_hang
SELECT doi FROM cau_thu ORDER BY doi ASC
SELECT T1.ho, T1.ten FROM giang_vien AS T1 JOIN giang_vien_tham_gia_vao AS T2 ON T1.id_giang_vien = T2.id_giang_vien JOIN hoat_dong AS T3 ON T2.id_hoat_dong = T3.id_hoat_dong WHERE T3.ten_hoat_dong IN ('Bơi xuồng', 'Chèo thuyền Kayak')
SELECT T1.ten FROM dien_vien AS T1 JOIN phan_vai AS T2 ON T1.id_dien_vien = T2.id_dien_vien JOIN ban_quyen AS T3 ON T2.id_se_ri_phim = T3.id_se_ri_phim JOIN bo_phim AS T4 ON T3.id_se_ri_phim = T4.id_bo_phim JOIN dao_dien_boi AS T5 ON T3.id_se_ri_phim = T5.id_se_ri_phim JOIN dao_dien AS T6 ON T5.id_dao_dien = T6.id_dao_dien WHERE T6.ten = 'Quentin Tarantino' ORDER BY T4.nam_phat_hanh DESC LIMIT 1
SELECT T3.ten FROM chan_thuong AS T1 JOIN tran_dau AS T2 ON T1.id_tran_dau = T2.id JOIN san_van_dong AS T3 ON T2.id_san_van_dong = T3.id WHERE T1.cau_thu = 'Walter Samuel' INTERSECT SELECT T3.ten FROM chan_thuong AS T1 JOIN tran_dau AS T2 ON T1.id_tran_dau = T2.id JOIN san_van_dong AS T3 ON T2.id_san_van_dong = T3.id WHERE T1.cau_thu = 'Thiago Motta'
SELECT ten, ngay_mo_cua FROM nha_tho ORDER BY ngay_mo_cua DESC LIMIT 3
SELECT SUM(T1.so_luot_thich) FROM khoan_tien_boa AS T1 JOIN nguoi_tieu_dung AS T2 ON T1.id_nguoi_tieu_dung = T2.id_nguoi_tieu_dung WHERE T2.ten = 'Niloofar'
SELECT hang_thu_am FROM album
SELECT AVG(hoa_don.so_luong_dat_hang) FROM hoa_don JOIN phuong_thuc_thanh_toan ON hoa_don.ma_phuong_thuc_thanh_toan = phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan WHERE phuong_thuc_thanh_toan.mo_ta_ve_phuong_thuc_thanh_toan = 'Mastercard'
SELECT chi_tiet_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM chinh_sach)
SELECT SUM(phieu_giam_gia.so_tien_giam_gia) FROM khach_hang JOIN phieu_giam_gia ON khach_hang.id_phieu_giam_gia = phieu_giam_gia.id_phieu_giam_gia WHERE khach_hang.khach_hang_tot_hay_xau IN ('tốt', 'xấu')
SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi = 'CLE' INTERSECT SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi = 'CWS'
SELECT ten FROM ca_nhan ORDER BY ten ASC
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang WHERE chinh_sach.ma_loai_chinh_sach IN ('Uỷ quyền', 'Thống nhất')
SELECT ten FROM doi WHERE id_doi NOT IN (SELECT doi FROM tran_dau_trong_mua_giai)
SELECT phong_hoc, COUNT(DISTINCT khoi_lop) FROM danh_sach GROUP BY phong_hoc
SELECT khoa.ten_khoa FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa ORDER BY sinh_vien.gpa_cua_sinh_vien ASC LIMIT 1
SELECT ten FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM ung_cu_vien)
SELECT T1.id_san_pham FROM san_pham_cho_thue AS T1 JOIN san_pham_duoc_dat AS T2 ON T1.id_san_pham = T2.id_san_pham GROUP BY T1.id_san_pham HAVING COUNT(*) = 3
SELECT ten FROM ca_nhan WHERE chieu_cao < (SELECT AVG(chieu_cao) FROM ca_nhan)
SELECT COUNT(DISTINCT luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien) FROM luot_dang_ky_khoa_hoc_cua_sinh_vien JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'tiếng Anh'
SELECT so_dien_thoai_khach_hang FROM nguoi_bieu_dien WHERE ten_khach_hang = 'Ashley'
SELECT ten_khoa FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa GROUP BY khoa.ma_khoa ORDER BY SUM(so_luong_tin_chi_cua_khoa_hoc) DESC LIMIT 1
SELECT nguoi_tieu_dung.ten FROM nguoi_tieu_dung JOIN danh_gia ON nguoi_tieu_dung.id_nguoi_tieu_dung = danh_gia.id_nguoi_tieu_dung WHERE danh_gia.nam = 2010
SELECT ten FROM doi
SELECT COUNT(*) FROM danh_gia JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Cafe Zinho' AND doanh_nghiep.thanh_pho = 'Texas'
SELECT T3.id_khach_hang, T3.chi_tiet_khach_hang FROM tieu_de_cua_yeu_cau AS T1 JOIN chinh_sach AS T2 ON T1.id_chinh_sach = T2.id_chinh_sach JOIN khach_hang AS T3 ON T2.id_khach_hang = T3.id_khach_hang ORDER BY T1.so_tien_duoc_yeu_cau DESC LIMIT 1
SELECT khach_hang.ho , khach_hang.ten FROM khach_hang JOIN luot_cho_thue ON khach_hang.id_khach_hang = luot_cho_thue.id_khach_hang ORDER BY luot_cho_thue.ngay_cho_thue ASC LIMIT 1
SELECT doi FROM ky_thuat_vien GROUP BY doi ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM nhan_vien
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang WHERE chinh_sach.ma_loai_chinh_sach IN ('Uỷ quyền', 'Thống nhất')
SELECT bai_hat.tieu_de FROM ban_nhac JOIN buoi_bieu_dien ON ban_nhac.id = buoi_bieu_dien.nghe_si_trong_ban_nhac JOIN bai_hat ON buoi_bieu_dien.id_bai_hat = bai_hat.id_bai_hat WHERE ban_nhac.ho = 'Hello'
SELECT DISTINCT mau_san_pham FROM san_pham
SELECT ma_cong_viec_cua_nhan_vien , COUNT(*) FROM nhan_vien GROUP BY ma_cong_viec_cua_nhan_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_quoc_gia FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia WHERE vi_tri = 'tiền đạo' INTERSECT SELECT ten_quoc_gia FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia WHERE vi_tri = 'hậu vệ'
SELECT COUNT(DISTINCT id_khu_vuc) FROM khu_vuc_bi_anh_huong
SELECT COUNT(DISTINCT dia_chi_khoa) FROM khoa WHERE ma_truong = 'BUS'
SELECT COUNT(*) FROM nha_tho WHERE ngay_mo_cua < 1850
SELECT tham_gia_vao.id_hoat_dong FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien WHERE sinh_vien.tuoi < 20
SELECT danh_sach.ho, danh_sach.ten FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'OTHA' AND giao_vien.ten = 'MOYER'
SELECT dia_diem FROM truong_hoc WHERE id_truong NOT IN (SELECT id_truong FROM cau_thu)
SELECT bao.ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao JOIN khu_vuc ON khu_vuc_bi_anh_huong.id_khu_vuc = khu_vuc.id_khu_vuc WHERE khu_vuc.ten_khu_vuc = 'Afghanistan' INTERSECT SELECT bao.ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao JOIN khu_vuc ON khu_vuc_bi_anh_huong.id_khu_vuc = khu_vuc.id_khu_vuc WHERE khu_vuc.ten_khu_vuc = 'Albania'
SELECT T2.ma_truong , COUNT ( * ) FROM giao_su AS T1 JOIN khoa AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T2.ma_truong ORDER BY COUNT ( * ) ASC LIMIT 1
SELECT id_giang_vien FROM giang_vien EXCEPT SELECT id_giang_vien FROM giang_vien_tham_gia_vao
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc ORDER BY COUNT(*) DESC LIMIT 3
SELECT COUNT(*) FROM giang_vien WHERE ngach = 'Giáo sư' AND gioi_tinh = 'nữ'
SELECT DISTINCT mau_ma_tai_san FROM tai_san
SELECT truong_hoc.ton_giao FROM truong_hoc JOIN cau_thu ON truong_hoc.id_truong = cau_thu.id_truong GROUP BY truong_hoc.id_truong ORDER BY COUNT(*) DESC LIMIT 1
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN lan_tham_du_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN khoa_hoc ON lan_tham_du_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'thống kê' ORDER BY lan_tham_du_khoa_hoc_cua_sinh_vien.ngay_tham_du
SELECT COUNT(*) FROM hoat_dong
SELECT dia_chi.thanh_pho_thi_tran FROM cua_hang JOIN dia_chi ON cua_hang.id_dia_chi = dia_chi.id_dia_chi WHERE cua_hang.ten_cua_hang = 'FJA Filming'
SELECT SUM(thiet_hai_theo_trieu_usd), SUM(so_luong_nguoi_chet) FROM bao WHERE toc_do_toi_da > (SELECT AVG(toc_do_toi_da) FROM bao)
SELECT thanh_pho, quoc_gia FROM san_bay WHERE ten_san_bay = 'Alton'
SELECT T1.ten_khoa, T1.dia_chi_khoa FROM khoa AS T1 JOIN sinh_vien AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT truong_dai_hoc, COUNT(*) AS so_luong_cau_thu FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc ORDER BY so_luong_cau_thu DESC LIMIT 3
SELECT ten FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM toi_pham)
SELECT ho, ten FROM danh_sach
SELECT toa_nha, COUNT(*) FROM giang_vien GROUP BY toa_nha
SELECT dai_dien.ten, cuoc_bau_cu.ngay FROM dai_dien JOIN cuoc_bau_cu ON dai_dien.id_dai_dien = cuoc_bau_cu.id_dai_dien
SELECT T1.id_sinh_vien , COUNT ( * ) FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien
SELECT ten_lanh_dao FROM truong_dai_hoc JOIN thanh_vien ON truong_dai_hoc.id_dai_hoc = thanh_vien.id_dai_hoc WHERE thanh_vien.quoc_gia = 'Canada'
SELECT dich_vu.ma_loai_dich_vu FROM dich_vu JOIN su_kien ON dich_vu.id_dich_vu = su_kien.id_dich_vu WHERE su_kien.chi_tiet_su_kien IN ('Thành công', 'Thất bại')
SELECT COUNT(*) FROM ban_nhac
SELECT khoa.ma_truong , COUNT(*) FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_truong
SELECT dia_chi.thanh_pho, COUNT(*) FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi GROUP BY dia_chi.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.ten FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan WHERE T2.gioi_tinh = 'F' ORDER BY T2.ten ASC
SELECT ho, ten FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'OTHA' AND giao_vien.ten = 'MOYER'
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc HAVING COUNT(*) >= 2
SELECT ten FROM bao WHERE id_con_bao NOT IN (SELECT id_bao FROM khu_vuc_bi_anh_huong)
SELECT ten_tai_khoan, chi_tiet_khac_ve_tai_khoan FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten_khach_hang = 'Mea Afghanistan' AND khach_hang.ho_cua_khach_hang = 'Keeling'
SELECT thanh_pho FROM thanh_pho WHERE dan_so_khu_vuc > 8000000 OR dan_so_khu_vuc < 5000000
SELECT T1.id_khach_hang , COUNT(*) FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang
SELECT khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi FROM khu_vuc_tiep_thi JOIN nhom_hoi_thao_kich ON khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi = nhom_hoi_thao_kich.ma_khu_vuc_tiep_thi GROUP BY khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi ORDER BY COUNT(*) DESC LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang WHERE chinh_sach.ma_loai_chinh_sach = 'Uỷ quyền'
SELECT ten FROM ky_thuat_vien WHERE tuoi BETWEEN 36 AND 37
SELECT DISTINCT toa_nha FROM giang_vien
SELECT cau_thu.id FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api AND cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa WHERE cau_thu.chieu_cao >= 180 AND dac_diem_cua_cau_thu.danh_gia_tong_the > 85
SELECT gioi_tinh FROM nhan_vien GROUP BY gioi_tinh ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT danh_gia_xep_hang) FROM phim
SELECT T2.thanh_pho FROM chuyen_bay AS T1 JOIN san_bay AS T2 ON T1.san_bay_khoi_hanh = T2.ma_san_bay GROUP BY T2.ma_san_bay ORDER BY COUNT(*) DESC LIMIT 1
SELECT sinh_vien.ho , sinh_vien.ten FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_trang_thai_khach_hang, so_dien_thoai_di_dong, dia_chi_email FROM khach_hang WHERE ho = 'Kohler' OR ten = 'Marina'
SELECT ban_nhac.ho FROM ban_nhac JOIN nhac_cu ON ban_nhac.id = nhac_cu.id_nghe_si_trong_ban_nhac GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT id_giang_vien FROM giang_vien WHERE id_giang_vien NOT IN (SELECT co_van FROM sinh_vien)
SELECT phim.id_phim, phim.tieu_de, phim.mo_ta FROM phim JOIN dien_vien_dien_anh ON phim.id_phim = dien_vien_dien_anh.id_phim GROUP BY phim.id_phim ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_san_pham , ten_san_pham FROM san_pham WHERE gia_san_pham > 1000 OR gia_san_pham < 500
SELECT truong_hoc.dia_diem FROM truong_hoc JOIN cau_thu ON truong_hoc.id_truong = cau_thu.id_truong GROUP BY truong_hoc.id_truong HAVING COUNT(*) > 1
SELECT T1.id_doanh_nghiep, T1.ten, T1.dia_chi_day_du, T1.thanh_pho, T1.vi_do, T1.kinh_do, T1.so_luong_danh_gia, T1.co_mo_cua_hay_khong, T1.danh_gia_xep_hang, T1.tieu_bang FROM doanh_nghiep AS T1 JOIN loai_hinh AS T2 ON T1.id_doanh_nghiep = CAST(T2.id_doanh_nghiep AS INTEGER) WHERE T2.ten_loai_hinh = 'hải sản' AND T1.thanh_pho = 'Los Angeles'
SELECT tieu_de FROM phim WHERE danh_gia_xep_hang = 'R'
SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien UNION SELECT id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien
SELECT COUNT(*) FROM nguoi_tieu_dung AS T1 JOIN danh_gia AS T2 ON T1.id_nguoi_tieu_dung = T2.id_nguoi_tieu_dung WHERE T1.ten = 'Niloofar' AND T2.nam = 2015
SELECT T4.tieu_de FROM dien_vien AS T1 JOIN phan_vai AS T2 ON T1.id_dien_vien = T2.id_dien_vien JOIN ban_quyen AS T3 ON T2.id_se_ri_phim = T3.id_se_ri_phim JOIN bo_phim AS T4 ON T3.id_se_ri_phim = T4.id_bo_phim WHERE T1.ten = 'Gabriele Ferzetti' ORDER BY T4.nam_phat_hanh DESC LIMIT 1
SELECT id_sinh_vien FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien)
SELECT ten FROM cua_hang WHERE so_luong_san_pham > (SELECT AVG(so_luong_san_pham) FROM cua_hang)
SELECT ten_khu_vuc_tiep_thi, mo_ta_ve_khu_vuc_tiep_thi FROM khu_vuc_tiep_thi WHERE ten_khu_vuc_tiep_thi = 'Trung Quốc'
SELECT ngay_mua_tai_san FROM tai_san ORDER BY ngay_mua_tai_san ASC LIMIT 1
SELECT ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'AHD' UNION SELECT ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'AHD'
SELECT chi_tiet_khach_hang FROM khach_hang ORDER BY chi_tiet_khach_hang
SELECT id_sinh_vien FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM tham_gia_vao)
SELECT id_khoa_hoc FROM luot_dang_ky_khoa_hoc_cua_sinh_vien WHERE id_sinh_vien = 121 UNION SELECT id_khoa_hoc FROM lan_tham_du_khoa_hoc_cua_sinh_vien WHERE id_sinh_vien = 121
SELECT T1.tieu_de FROM bai_hat AS T1 JOIN giong_hat AS T2 ON T1.id_bai_hat = T2.id_bai_hat GROUP BY T1.id_bai_hat ORDER BY COUNT(*) DESC LIMIT 1
SELECT dien_vien.ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN ban_quyen ON phan_vai.id_se_ri_phim = ban_quyen.id_se_ri_phim JOIN bo_phim ON ban_quyen.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Trò chơi bắt chước' AND phan_vai.vai_dien = 'Alan Turing'
SELECT ngay_thanh_toan FROM khoan_thanh_toan JOIN nhan_vien ON khoan_thanh_toan.id_nhan_vien = nhan_vien.id_nhan_vien WHERE so_tien > 10 AND nhan_vien.ten = 'Elsa'
SELECT giang_vien.id_giang_vien , COUNT ( * ) FROM giang_vien JOIN sinh_vien ON giang_vien.id_giang_vien = sinh_vien.co_van GROUP BY giang_vien.id_giang_vien
SELECT T1.id_tai_san , T1.chi_tiet_tai_san FROM tai_san AS T1 JOIN bo_phan_cua_tai_san AS T2 ON T1.id_tai_san = T2.id_tai_san JOIN nhat_ky_loi AS T3 ON T1.id_tai_san = T3.id_tai_san GROUP BY T1.id_tai_san HAVING COUNT(T2.id_bo_phan) = 2 AND COUNT(T3.id_muc_nhap_cua_nhat_ky_loi) < 2
SELECT id FROM xe
SELECT ngay_xuat_ban FROM an_pham ORDER BY gia_ban ASC LIMIT 3
SELECT bao.ten , bao.toc_do_toi_da FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao GROUP BY bao.id_con_bao ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.thanh_pho IN ('Aberdeen', 'Abilene')
SELECT COUNT(DISTINCT dia_diem) FROM toi_pham
SELECT dia_chi.quoc_gia, dia_chi.thanh_pho FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi_khach_hang = dia_chi.id_dia_chi WHERE khach_hang.ho = 'Sawayn' AND khach_hang.ten = 'Janessa'
SELECT COUNT(*) FROM danh_gia JOIN nguoi_tieu_dung ON danh_gia.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE nguoi_tieu_dung.ten = 'Adrienne'
SELECT ton_giao FROM truong_hoc GROUP BY ton_giao HAVING COUNT(*) > 1
SELECT dia_chi.dia_chi , dia_chi.dia_chi_2 , dia_chi.quan , thanh_pho.thanh_pho FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi = dia_chi.id_dia_chi JOIN thanh_pho ON dia_chi.id_thanh_pho = thanh_pho.id_thanh_pho WHERE nhan_vien.ten = 'Elsa'
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT truong_dai_hoc FROM luot_nop_bai WHERE so_diem > 90 INTERSECT SELECT truong_dai_hoc FROM luot_nop_bai WHERE so_diem < 80
SELECT MIN(ti_le_phieu_bau), MAX(ti_le_phieu_bau) FROM cuoc_bau_cu
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.bang_cap_cao_nhat != 'Tiến sĩ'
SELECT su_kien.id_su_kien FROM su_kien JOIN nguoi_tham_gia_su_kien ON su_kien.id_su_kien = nguoi_tham_gia_su_kien.id_su_kien GROUP BY su_kien.id_su_kien ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_ung_cu_vien FROM ung_cu_vien AS T1 JOIN danh_gia_ung_cu_vien AS T2 ON T1.id_ung_cu_vien = T2.id_ung_cu_vien WHERE T2.ma_ket_qua_danh_gia = 'Đạt'
SELECT ngay_trong_tuan , AVG(nhiet_do_cao) FROM thoi_tiet_hang_tuan GROUP BY ngay_trong_tuan
SELECT ten, dang FROM dai_dien
SELECT AVG(so_luong_nhan_vien) FROM cac_bo WHERE xep_hang BETWEEN 10 AND 15
SELECT T1.ten_khoa FROM khoa AS T1 JOIN giao_su AS T2 ON T1.ma_khoa = T2.ma_khoa WHERE T2.bang_cap_cao_nhat = 'Tiến sĩ' GROUP BY T1.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_chinh_sach FROM chinh_sach GROUP BY ma_loai_chinh_sach ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_chinh_sach FROM chinh_sach GROUP BY ma_loai_chinh_sach HAVING COUNT(*) > 2
SELECT khoa.ten_khoa, giao_su.van_phong_giao_su FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE nhan_vien.ho_cua_nhan_vien = 'Heffington'
SELECT T1.id_dien_vien , T1.ho , T1.ten FROM dien_vien AS T1 JOIN dien_vien_dien_anh AS T2 ON T1.id_dien_vien = T2.id_dien_vien GROUP BY T1.id_dien_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT dang FROM dai_dien GROUP BY dang ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.que_quan FROM ca_nhan AS T1 JOIN toi_pham AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan GROUP BY T1.id_ca_nhan ORDER BY SUM(T2.so_nguoi_bi_giet) DESC LIMIT 1
SELECT dia_chi.thanh_pho_thi_tran FROM khach_hang INNER JOIN dia_chi ON khach_hang.id_dia_chi = dia_chi.id_dia_chi EXCEPT SELECT dia_chi.thanh_pho_thi_tran FROM nguoi_bieu_dien INNER JOIN dia_chi ON nguoi_bieu_dien.id_dia_chi = dia_chi.id_dia_chi
SELECT AVG(so_diem) FROM luot_nop_bai
SELECT thanh_pho FROM doanh_nghiep WHERE ten = 'tiệc đứng sang trọng MGM' AND thanh_pho = 'Texas'
SELECT id_sinh_vien FROM tham_gia_vao JOIN hoat_dong ON tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Bơi xuồng' INTERSECT SELECT id_sinh_vien FROM tham_gia_vao JOIN hoat_dong ON tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT chi_tiet_khach_hang FROM khach_hang ORDER BY chi_tiet_khach_hang ASC
SELECT ten, ho FROM nhan_vien EXCEPT SELECT T1.ten, T1.ho FROM nhan_vien AS T1 INNER JOIN bai_giang AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien
SELECT nhan_vien.ho_cua_nhan_vien , nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc)
SELECT giao_vien.ten, khoa_hoc.khoa_hoc FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien JOIN khoa_hoc ON sap_xep_khoa_hoc.id_khoa_hoc = khoa_hoc.id_khoa_hoc
SELECT ho , ten FROM danh_sach WHERE khoi_lop = 1 AND phong_hoc NOT IN (SELECT phong_hoc FROM giao_vien WHERE ho = 'OTHA' AND ten = 'MOYER')
SELECT ten FROM cua_hang WHERE so_luong_san_pham > (SELECT AVG(so_luong_san_pham) FROM cua_hang)
SELECT COUNT(DISTINCT noi_sinh) FROM ca_nhan
SELECT thanh_vien.ten, truong_dai_hoc.dia_diem_truong_dai_hoc FROM thanh_vien JOIN truong_dai_hoc ON thanh_vien.id_dai_hoc = truong_dai_hoc.id_dai_hoc ORDER BY thanh_vien.ten ASC
SELECT id_khach_hang, chi_tiet_khach_hang FROM khach_hang
SELECT khoa.ma_truong, COUNT(*) FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_truong
SELECT ten FROM dien_vien GROUP BY ten ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ho , T1.ten FROM giang_vien AS T1 JOIN giang_vien_tham_gia_vao AS T2 ON T1.id_giang_vien = T2.id_giang_vien GROUP BY T1.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT cau_thu.cau_thu , tran_dau_trong_mua_giai.truong_dai_hoc FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.doi = tran_dau_trong_mua_giai.doi ORDER BY tran_dau_trong_mua_giai.truong_dai_hoc ASC
SELECT nhan_vien.ten_cua_nhan_vien, lop_hoc.phong_hoc FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Kế toán'
SELECT ma_trang_thai FROM luot_dat_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT bai_hat.tieu_de FROM bai_hat WHERE NOT EXISTS (SELECT 1 FROM giong_hat WHERE giong_hat.id_bai_hat = bai_hat.id_bai_hat AND giong_hat.loai = 'phụ')
SELECT san_bay.ma_san_bay FROM san_bay LEFT JOIN chuyen_bay ON san_bay.ma_san_bay = chuyen_bay.san_bay_khoi_hanh OR san_bay.ma_san_bay = chuyen_bay.san_bay_dich GROUP BY san_bay.ma_san_bay ORDER BY COUNT(*) ASC LIMIT 1
SELECT chinh_quyen_dia_phuong, dich_vu FROM nha_ga
SELECT COUNT(*) FROM giao_dich_tai_chinh
SELECT ten FROM dao_dien WHERE quoc_tich = 'Afghanistan'
SELECT chi_tiet_truong_hoc.biet_danh FROM truong_hoc JOIN chi_tiet_truong_hoc ON truong_hoc.id_truong = chi_tiet_truong_hoc.id_truong WHERE chi_tiet_truong_hoc.phan_hang != '1'
SELECT T1.van_ban FROM khoan_tien_boa AS T1 JOIN doanh_nghiep AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep WHERE T2.ten = 'Cafe Zinho' AND T2.thanh_pho = 'Texas'
SELECT COUNT(*) FROM tran_dau WHERE mua_giai > 2007
SELECT COUNT(DISTINCT id_giang_vien) FROM giang_vien_tham_gia_vao
SELECT T2.ten_cong_ty FROM hop_dong_bao_tri AS T1 JOIN cong_ty_ben_thu_ba AS T2 ON T1.id_hop_dong_bao_tri_cua_cong_ty = T2.id_cong_ty ORDER BY T1.ngay_ket_thuc_hop_dong DESC LIMIT 1
SELECT COUNT(*) FROM nhom_hoi_thao_kich
SELECT SUM(luot_dang_ky.so_luong) FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep JOIN luot_dang_ky ON doanh_nghiep.id_doanh_nghiep = luot_dang_ky.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'Ma-róc' AND doanh_nghiep.thanh_pho = 'Los Angeles' AND luot_dang_ky.ngay LIKE '%Friday%'
SELECT ngon_ngu_ban_dia_chinh_thuc FROM quoc_gia WHERE ngon_ngu_ban_dia_chinh_thuc LIKE '%tiếng Anh%'
SELECT ten_san_pham FROM san_pham WHERE id_san_pham NOT IN (SELECT id_san_pham FROM mat_hang_duoc_dat)
SELECT ca_nhan.can_nang FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan WHERE nguoi_luyen_the_hinh.cu_giat > 140 OR ca_nhan.chieu_cao > 200
SELECT ten_khach_hang, dien_thoai_khach_hang FROM khach_hang WHERE dia_chi_cua_khach_hang IS NULL
SELECT ung_cu_vien.id_ung_cu_vien FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ca_nhan = ca_nhan.id_ca_nhan WHERE ca_nhan.dia_chi_email = 'stanley.monahan@example.org'
SELECT COUNT(*) FROM nhan_vien
SELECT ten_nhan_vien FROM nhan_vien WHERE id_nhan_vien NOT IN (SELECT id_nhan_vien FROM lich_su_luu_hanh)
SELECT tac_gia FROM sach ORDER BY tac_gia ASC
SELECT T3.tieu_de FROM nha_viet_kich_ban AS T1 JOIN duoc_viet_boi AS T2 ON T1.id_nha_viet_kich_ban = T2.id_nha_viet_kich_ban JOIN bo_phim AS T3 ON T2.id_se_ri_phim = T3.id_bo_phim WHERE T1.ten = 'Matt Damon'
SELECT loai_hinh FROM truong_hoc GROUP BY loai_hinh HAVING COUNT(*) = 2
SELECT ho, ten FROM danh_sach WHERE phong_hoc = 107
SELECT ten FROM dien_vien WHERE quoc_tich = 'Afghanistan'
SELECT T1.ten_khoa , AVG(T2.gpa_cua_sinh_vien) FROM khoa AS T1 JOIN sinh_vien AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY AVG(T2.gpa_cua_sinh_vien) DESC LIMIT 1
SELECT g.ho, g.ten FROM giao_vien AS g JOIN danh_sach AS d ON g.phong_hoc = d.phong_hoc WHERE d.ho = 'EVELINA' AND d.ten = 'BROMLEY'
SELECT COUNT(DISTINCT dia_diem) FROM cua_hang
SELECT nha_ga.id, nha_ga.chinh_quyen_dia_phuong FROM nha_ga JOIN thoi_tiet_hang_tuan ON nha_ga.id = thoi_tiet_hang_tuan.id_nha_ga GROUP BY nha_ga.id ORDER BY AVG(thoi_tiet_hang_tuan.nhiet_do_cao) DESC LIMIT 1
SELECT bo_phan.ten_bo_phan FROM bo_phan JOIN dia_diem_cua_bo_phan ON bo_phan.ma_so_bo_phan = dia_diem_cua_bo_phan.ma_so_bo_phan WHERE dia_diem_cua_bo_phan.dia_diem_bo_phan = 'Houston'
SELECT COUNT(*) FROM ung_cu_vien
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu WHERE tran_dau_trong_mua_giai.truong_dai_hoc = 'UCLA'
SELECT id_ca_nhan, gioi_tinh, ten, ngay_sinh, chieu_cao, can_nang FROM ca_nhan
SELECT ho FROM khach_hang INTERSECT SELECT ho FROM nhan_vien
SELECT SUM(so_tien) FROM khoan_thanh_toan
SELECT cua_hang.id_cua_hang FROM khach_hang JOIN cua_hang ON khach_hang.id_cua_hang = cua_hang.id_cua_hang GROUP BY khach_hang.id_cua_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT khach_hang.id_khach_hang) FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien WHERE giang_vien.ngach = 'Giáo sư'
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT ten_san_pham FROM cac_san_pham WHERE gia_san_pham < 1000000
SELECT khu_vuc.ten_khu_vuc FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao JOIN khu_vuc ON khu_vuc_bi_anh_huong.id_khu_vuc = khu_vuc.id_khu_vuc ORDER BY bao.so_luong_nguoi_chet DESC LIMIT 1
SELECT gioi_tinh, AVG(can_nang), MIN(can_nang) FROM ca_nhan GROUP BY gioi_tinh
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE giao_su.ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc)
SELECT phim.id_phim, phim.tieu_de FROM phim JOIN hang_ton_kho ON phim.id_phim = hang_ton_kho.id_phim WHERE phim.gia_cho_thue = 0.99 GROUP BY phim.id_phim HAVING COUNT(*) < 3
SELECT ho , ten FROM dien_vien JOIN dien_vien_dien_anh ON dien_vien.id_dien_vien = dien_vien_dien_anh.id_dien_vien GROUP BY dien_vien.id_dien_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_tich FROM dien_vien WHERE ten = 'Christoph Waltz'
SELECT loai FROM giong_hat GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT so_luong_du_thao FROM ban_du_thao_cua_tai_lieu WHERE id_tai_lieu = 2
SELECT ten_san_pham FROM san_pham WHERE id_san_pham NOT IN (SELECT id_san_pham FROM mat_hang_duoc_dat)
SELECT T1.ten_khoa , T1.dia_chi_khoa FROM khoa AS T1 JOIN sinh_vien AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT can_nang FROM cau_thu ORDER BY can_nang DESC LIMIT 1 UNION SELECT can_nang FROM cau_thu ORDER BY can_nang ASC LIMIT 1
SELECT COUNT(DISTINCT doi) FROM tran_dau_trong_mua_giai
SELECT su_kien.id_su_kien FROM su_kien LEFT JOIN nguoi_tham_gia_su_kien ON su_kien.id_su_kien = nguoi_tham_gia_su_kien.id_su_kien LEFT JOIN nguoi_tham_gia ON nguoi_tham_gia_su_kien.id_nguoi_tham_gia = nguoi_tham_gia.id_nguoi_tham_gia WHERE nguoi_tham_gia.chi_tiet_nguoi_tham_gia IS NULL OR nguoi_tham_gia.chi_tiet_nguoi_tham_gia != 'Kenyatta Kuhn'
SELECT ma_san_bay , ten_san_bay FROM san_bay WHERE thanh_pho = 'Anthony'
SELECT COUNT(*) FROM san_pham WHERE id_san_pham NOT IN (SELECT id_san_pham FROM mat_hang_duoc_dat)
SELECT loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten = 'Solveig' GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM san_van_dong WHERE ten LIKE '%ngân hàng%'
SELECT phong_hoc, COUNT(*) FROM danh_sach GROUP BY phong_hoc
SELECT T2.mo_ta_ve_tinh_trang_yeu_cau FROM tieu_de_cua_yeu_cau AS T1 JOIN giai_doan_xu_ly_yeu_cau AS T2 ON T1.id_giai_doan_xu_ly_yeu_cau = T2.id_giai_doan_xu_ly_yeu_cau WHERE T1.ma_tinh_trang_yeu_cau = 'Mở'
SELECT khoa_hoc.ma_khoa_hoc FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE sinh_vien.ho_cua_sinh_vien = 'Smithson'
SELECT COUNT(DISTINCT nguon_thong_tin) FROM chan_thuong
select t1.id_nhan_vien , t1.ten_nhan_vien from nhan_vien as t1 join nhat_ky_loi as t2 on t1.id_nhan_vien = t2.duoc_ghi_lai_boi_nhan_vien_co_id except select t1.id_nhan_vien , t1.ten_nhan_vien from nhan_vien as t1 join chuyen_tham_cua_ky_su as t3 on t1.id_nhan_vien = t3.id_nhan_vien_lien_lac
SELECT ten_san_bay FROM san_bay WHERE ma_san_bay = 'AKO'
SELECT hang_hang_khong.id_hang_hang_khong , hang_hang_khong.ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'CVO' GROUP BY hang_hang_khong.id_hang_hang_khong EXCEPT SELECT hang_hang_khong.id_hang_hang_khong , hang_hang_khong.ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'APG' GROUP BY hang_hang_khong.id_hang_hang_khong
SELECT id_giao_dich FROM giao_dich_tai_chinh WHERE so_tien_giao_dich > (SELECT AVG(so_tien_giao_dich) FROM giao_dich_tai_chinh)
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.quoc_tich = 'Trung Quốc' GROUP BY bo_phim.id_bo_phim ORDER BY COUNT(*) DESC LIMIT 1
