SELECT T2.ten_cua_nhan_vien FROM lop_hoc AS T1 JOIN nhan_vien AS T2 ON T1.ma_so_nhan_vien_cua_giao_su = T2.ma_so_nhan_vien WHERE T1.ma_khoa_hoc = 'CIS-220' OR T1.ma_khoa_hoc = 'QM-261'
SELECT COUNT(DISTINCT ma_tien_te) FROM nhom_hoi_thao_kich
SELECT chuyen_bay.san_bay_dich, chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay GROUP BY chuyen_bay.san_bay_dich, chuyen_bay.so_hieu_chuyen_bay HAVING COUNT(*) = (SELECT COUNT(*) FROM chuyen_bay GROUP BY san_bay_dich ORDER BY COUNT(*) DESC LIMIT 1)
SELECT ten FROM dbo.danh_sach WHERE phong_hoc = 107
SELECT T1.ten || ' ' || T1.ho FROM nhan_vien AS T1 JOIN luot_cho_thue AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien JOIN khach_hang AS T3 ON T2.id_khach_hang = T3.id_khach_hang WHERE T3.ten = 'April' AND T3.ho = 'Burns'
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.doi = tran_dau_trong_mua_giai.doi WHERE tran_dau_trong_mua_giai.truong_dai_hoc IN ('UCLA', 'Duke') GROUP BY cau_thu.cau_thu HAVING COUNT(DISTINCT tran_dau_trong_mua_giai.vi_tri) > 1
SELECT mat_hang_duoc_dat.id_san_pham FROM mat_hang_duoc_dat GROUP BY mat_hang_duoc_dat.id_san_pham ORDER BY COUNT(*) DESC LIMIT 1
SELECT ban_nhac.ho FROM ban_nhac JOIN nhac_cu ON ban_nhac.id = nhac_cu.id_nghe_si_trong_ban_nhac GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM khach_hang UNION SELECT COUNT(*) FROM khach_hang_1
SELECT ten_khu_pho_lan_can FROM khu_vuc_lan_can JOIN doanh_nghiep ON khu_vuc_lan_can.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE thanh_pho = 'Madison' GROUP BY ten_khu_pho_lan_can ORDER BY COUNT(*) DESC LIMIT 1
SELECT SUM(quan.dan_so_thanh_pho) FROM quan JOIN quan_cua_cua_hang ON quan.id_quan = quan_cua_cua_hang.id_quan WHERE quan.dien_tich_cua_cac_thanh_pho > (SELECT AVG(dien_tich) FROM quan)
SELECT COUNT(*) FROM hang_ton_kho WHERE id_cua_hang = 1
SELECT T1.ten FROM nha_tho AS T1 JOIN le_cuoi AS T2 ON T1.id_nha_tho = T2.id_nha_tho JOIN ca_nhan AS T3 ON T2.id_nam = T3.id_ca_nhan WHERE T3.tuoi > 30 UNION SELECT T1.ten FROM nha_tho AS T1 JOIN le_cuoi AS T2 ON T1.id_nha_tho = T2.id_nha_tho JOIN ca_nhan AS T3 ON T2.id_nu = T3.id_ca_nhan WHERE T3.tuoi > 30 ORDER BY T1.ten
SELECT T1.ten FROM dbo.ung_cu_vien AS T1 JOIN dbo.ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan WHERE T2.gioi_tinh = 'Nữ' ORDER BY T1.ten
SELECT ten_viet_tat FROM hang_hang_khong WHERE ten_hang_hang_khong = 'Jetblue Airways'
SELECT hang_thu_am FROM album
SELECT T1.ten AS ten FROM nha_tho AS T1 WHERE T1.id_nha_tho NOT IN (SELECT le_cuoi.id_nha_tho FROM le_cuoi WHERE le_cuoi.ngay_mo_cua >= 2015)
SELECT ten FROM dai_dien WHERE dang != 'Đảng Cộng hoà'
SELECT id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien WHERE id_khoa_hoc = '301' ORDER BY ngay_tham_du DESC LIMIT 10
SELECT ten_nguoi_quan_ly, quan FROM cua_hang WHERE id_cua_hang = (SELECT id_cua_hang FROM cua_hang ORDER BY so_luong_san_pham DESC LIMIT 1)
SELECT COUNT(DISTINCT T1.ngay_xuat_ban) FROM an_pham AS T1 JOIN sach AS T2 ON T1.id_sach = T2.id_sach
SELECT ten, quoc_gia FROM ca_nhan WHERE tuoi < (SELECT AVG(tuoi) FROM ca_nhan)
SELECT COUNT(*) FROM quoc_gia
SELECT COUNT(*) FROM nhan_vien
SELECT danh_sach.ho || ' ' || danh_sach.ten FROM dbo.danh_sach JOIN dbo.giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'MARROTTE' AND giao_vien.ten = 'KIRK'
SELECT tieu_de FROM album WHERE nam = 2010
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang JOIN tieu_de_cua_yeu_cau ON chinh_sach.id_chinh_sach = tieu_de_cua_yeu_cau.id_chinh_sach JOIN xu_ly_yeu_cau ON tieu_de_cua_yeu_cau.id_tieu_de_cua_yeu_cau = xu_ly_yeu_cau.id_yeu_cau WHERE xu_ly_yeu_cau.so_tien_duoc_tra = (SELECT MIN(so_tien_duoc_tra) FROM xu_ly_yeu_cau) ORDER BY khach_hang.id_khach_hang LIMIT 1
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán' OR khoa.ten_khoa = 'Sinh học'
SELECT COUNT(*) FROM giao_su WHERE bang_cap_cao_nhat = 'Tiến sĩ'
SELECT COUNT(*) FROM tau_hoa WHERE ten LIKE '%Tốc hành%'
SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi = 'CLE' INTERSECT SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi = 'CWS'
SELECT vi_tri, COUNT(*) FROM tran_dau_trong_mua_giai GROUP BY vi_tri ORDER BY COUNT(*) DESC
SELECT T1.id_ca_nhan, T1.ten, T1.ten_dem, T1.ho, COUNT(*) AS so_khoa_hoc_dang_ky FROM ca_nhan AS T1 JOIN sinh_vien AS T3 ON T1.id_ca_nhan = T3.id_ca_nhan JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T3.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_ca_nhan ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_bay.thanh_pho FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay GROUP BY san_bay.ma_san_bay, san_bay.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN lop_hoc ON sinh_vien.lop_cua_sinh_vien = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE sinh_vien.ho_cua_sinh_vien LIKE 'S%' AND khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT loai_dich_vu.ma_loai_dich_vu, loai_dich_vu.mo_ta_ve_loai_dich_vu FROM dich_vu JOIN loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu GROUP BY loai_dich_vu.ma_loai_dich_vu ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM dbo.doanh_nghiep WHERE danh_gia_xep_hang = 3.5
SELECT chi_tiet_khach_hang FROM khach_hang WHERE chi_tiet_khach_hang LIKE '%Diana%'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Woody Strode' INTERSECT SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Jason Robards'
SELECT dao_dien.ten FROM dao_dien JOIN dao_dien_boi ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien JOIN bo_phim ON dao_dien_boi.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de LIKE '%Vũ khí hạt nhân%'
SELECT khach_hang.ten_khach_hang, khach_hang.dien_thoai_khach_hang FROM khach_hang JOIN luot_dat_hang_cua_khach_hang ON khach_hang.id_khach_hang = luot_dat_hang_cua_khach_hang.id_khach_hang JOIN mat_hang_duoc_dat ON luot_dat_hang_cua_khach_hang.id_don_hang = mat_hang_duoc_dat.id_don_hang GROUP BY khach_hang.id_khach_hang ORDER BY SUM(CAST(so_luong_dat_hang AS INTEGER)) DESC LIMIT 1
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai WHERE vi_tri = 'tiền vệ' INTERSECT SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai WHERE vi_tri = 'hậu vệ'
SELECT o.nhan_hieu FROM nui AS n JOIN anh AS a ON n.id = a.id_nui JOIN ong_kinh_may_anh AS o ON a.id_ong_kinh_may_anh = o.id ORDER BY n.chieu_cao DESC LIMIT 1
SELECT ho FROM dbo.danh_sach WHERE khoi_lop = 1 AND phong_hoc NOT IN (SELECT phong_hoc FROM dbo.giao_vien WHERE ho = 'OTHA' AND ten = 'MOYER')
SELECT thanh_pho FROM nhiet_do JOIN thanh_pho ON nhiet_do.id_thanh_pho = thanh_pho.id_thanh_pho ORDER BY thang_hai DESC LIMIT 1
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien FROM nhan_vien JOIN giao_su ON nhan_vien.ma_so_nhan_vien = giao_su.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Sinh học'
SELECT tieu_de FROM phim WHERE (thoi_luong_phim > 100 OR danh_gia_xep_hang = 'PG') AND gia_thay_the <= 200
SELECT khach_hang.id_khach_hang, khach_hang.ho, khach_hang.ten FROM khach_hang JOIN khoan_thanh_toan ON khach_hang.id_khach_hang = khoan_thanh_toan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY SUM(khoan_thanh_toan.so_tien) ASC LIMIT 1
SELECT ten FROM giao_vien WHERE id_giao_vien NOT IN (SELECT id_giao_vien FROM sap_xep_khoa_hoc)
SELECT T1.ten_khoa FROM khoa AS T1 JOIN sinh_vien AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT mua_giai FROM tran_dau JOIN chan_thuong ON tran_dau.id = chan_thuong.id_tran_dau WHERE cau_thu = 'Walter Samuel'
SELECT giao_vien.ho, giao_vien.ten FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc GROUP BY giao_vien.ho, giao_vien.ten ORDER BY COUNT(*) DESC LIMIT 1
SELECT id_cua_hang FROM hang_ton_kho GROUP BY id_cua_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT ban_nhac.ho FROM buoi_bieu_dien JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT ho || ' ' || ten AS ten_dien_vien FROM dien_vien JOIN dien_vien_dien_anh ON dien_vien.id_dien_vien = dien_vien_dien_anh.id_dien_vien GROUP BY dien_vien.id_dien_vien HAVING COUNT(DISTINCT dien_vien_dien_anh.id_phim) > 30 ORDER BY COUNT(DISTINCT dien_vien_dien_anh.id_phim) DESC
SELECT COUNT(*) FROM danh_gia WHERE id_doanh_nghiep = (SELECT id_doanh_nghiep FROM doanh_nghiep WHERE ten = 'Bistro Di Napoli') AND nam = 2015
SELECT COUNT(*) FROM sinh_vien JOIN giang_vien_tham_gia_vao ON sinh_vien.co_van = giang_vien_tham_gia_vao.id_giang_vien JOIN giang_vien ON giang_vien_tham_gia_vao.id_giang_vien = giang_vien.id_giang_vien GROUP BY giang_vien.ngach
SELECT ten_loai_nha_hang FROM loai_nha_hang
SELECT ten_dai_ly_van_chuyen FROM dai_ly_van_chuyen_tai_lieu
SELECT so_luong_nguoi_tham_du_trung_binh FROM san_van_dong WHERE phan_tram_suc_chua > 100 ORDER BY so_luong_nguoi_tham_du_trung_binh DESC LIMIT 1
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_khoi_hanh = T1.ma_san_bay WHERE hang_hang_khong = (SELECT id_hang_hang_khong FROM hang_hang_khong WHERE ten_hang_hang_khong = 'United Airlines') AND T1.ma_san_bay = 'AHD'
SELECT van_phong_giao_su, nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE giao_su.ma_khoa = 'Lịch sử' AND giao_su.bang_cap_cao_nhat = 'Tiến sĩ'
SELECT ban_sao.id_tai_lieu, COUNT(ban_sao.so_luong_ban_sao) AS so_luong_ban_sao FROM ban_sao GROUP BY ban_sao.id_tai_lieu ORDER BY so_luong_ban_sao DESC LIMIT 1
SELECT ten FROM dbo.doanh_nghiep WHERE danh_gia_xep_hang > 3.5
SELECT id FROM cau_thu WHERE chan_thuan = 'Left' AND chieu_cao BETWEEN 180 AND 190
SELECT T1.thanh_pho_chu_nha FROM thanh_pho_chu_nha AS T1 GROUP BY T1.thanh_pho_chu_nha ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Hello'
SELECT ho, ten FROM sinh_vien WHERE id_sinh_vien = (SELECT co_van FROM sinh_vien WHERE ho = 'Goodrich' AND ten = 'Micheal')
SELECT khach_hang.id_khach_hang, khach_hang.ten_khach_hang, khach_hang.ho_cua_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_pham FROM dbo.san_pham WHERE kich_thuoc_trang_toi_da = 'A 4' AND so_trang_mau_tren_tung_phut < 5
SELECT ten_khoa_hoc FROM khoa_hoc ORDER BY ten_khoa_hoc ASC
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán' OR khoa.ten_khoa = 'Sinh học'
SELECT COUNT(DISTINCT nha_hang.id_nha_hang) FROM nha_hang JOIN loai_cua_nha_hang ON nha_hang.id_nha_hang = loai_cua_nha_hang.id_nha_hang JOIN loai_nha_hang ON loai_cua_nha_hang.id_loai_nha_hang = loai_nha_hang.id_loai_nha_hang WHERE loai_nha_hang.ten_loai_nha_hang = 'Sandwich'
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Heilo' AND nhac_cu.id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Le Pop')
SELECT sinh_vien.id_sinh_vien, sinh_vien.chi_tiet_sinh_vien, luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc, luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ki FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien ORDER BY luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ki DESC LIMIT 10
SELECT so_dien_thoai, ma_buu_dien FROM dia_chi WHERE id_dia_chi = 1031
SELECT ten, ho FROM ban_nhac JOIN buoi_bieu_dien ON ban_nhac.id = buoi_bieu_dien.nghe_si_trong_ban_nhac WHERE buoi_bieu_dien.vi_tri_tren_san_khau = 'hậu trường' AND buoi_bieu_dien.id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Badlands')
SELECT ngach FROM giang_vien GROUP BY ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT mo_ta_ve_khoa_hoc, so_luong_tin_chi_cua_khoa_hoc FROM khoa_hoc WHERE ma_khoa_hoc = 'CIS-220'
SELECT toi_pham.id_ca_nhan, so_nguoi_bi_giet FROM toi_pham ORDER BY so_nguoi_bi_giet DESC
SELECT kich_thuoc_san_pham FROM san_pham WHERE kich_thuoc_san_pham IS NOT NULL GROUP BY kich_thuoc_san_pham ORDER BY kich_thuoc_san_pham ASC
SELECT SUM(dan_so_thanh_pho) FROM quan ORDER BY dien_tich_cua_cac_thanh_pho DESC LIMIT 3
SELECT T1.id_bai_giang FROM bai_giang AS T1 JOIN nhan_vien AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien WHERE T2.ten = 'Janessa' AND T2.ho = 'Sawayn' AND T2.biet_danh LIKE '%s%'
SELECT T1.id_ky_su, T1.ten, T1.ho FROM ky_su_bao_tri AS T1 JOIN chuyen_tham_cua_ky_su AS T2 ON T1.id_ky_su = T2.id_ky_su GROUP BY T1.id_ky_su ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT dia_diem) FROM cua_hang
SELECT doi FROM cau_thu ORDER BY doi ASC
SELECT giang_vien.ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Bơi xuồng' OR hoat_dong.ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.nam_phat_hanh = (SELECT MAX(nam_phat_hanh) FROM bo_phim) AND bo_phim.tieu_de = 'Quentin Tarantino'
SELECT san_van_dong.ten FROM san_van_dong JOIN tran_dau ON san_van_dong.id = tran_dau.id_san_van_dong JOIN chan_thuong ON tran_dau.id = chan_thuong.id_tran_dau WHERE cau_thu = 'Walter Samuel' OR cau_thu = 'Thiago Motta' GROUP BY san_van_dong.id HAVING COUNT(DISTINCT cau_thu) = 2
SELECT ten, ngay_mo_cua FROM nha_tho ORDER BY ngay_mo_cua DESC LIMIT 3
SELECT SUM(khoan_tien_boa.so_luot_thich) FROM khoan_tien_boa JOIN danh_gia ON khoan_tien_boa.id_danh_gia = danh_gia.id_danh_gia JOIN nguoi_tieu_dung ON danh_gia.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE nguoi_tieu_dung.ten = 'Niloofar'
SELECT hang_thu_am FROM album WHERE tieu_de IN ('Album 1', 'Album 2', 'Album 3') UNION SELECT hang_thu_am FROM danh_sach_bai_hat JOIN album ON danh_sach_bai_hat.id_album = album.id_album WHERE album.tieu_de IN ('Album 1', 'Album 2', 'Album 3') UNION SELECT hang_thu_am FROM bai_hat JOIN danh_sach_bai_hat ON bai_hat.id_bai_hat = danh_sach_bai_hat.id_bai_hat JOIN album ON danh_sach_bai_hat.id_album = album.id_album WHERE album.tieu_de IN ('Album 1', 'Album 2', 'Album 3') UNION SELECT hang_thu_am FROM bai_hat JOIN nhac_cu ON bai_hat.id_bai_hat = nhac_cu.id_bai_hat JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten IN ('Artist 1', 'Artist 2', 'Artist 3') UNION SELECT hang_thu_am FROM bai_hat JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten IN ('Artist 1', 'Artist 2', 'Artist 3') UNION SELECT hang_thu_am FROM bai_hat JOIN buoi_bieu_dien ON bai_hat.id_bai_hat = buoi_bieu_dien.id_bai_hat JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten IN ('Artist 1', 'Artist 2', 'Artist 3') UNION SELECT hang_thu_am FROM album WHERE tieu_de NOT IN ('Album 1', 'Album 2', 'Album 3') EXCEPT SELECT hang_thu_am FROM danh_sach_bai_hat JOIN album ON danh_sach_bai_hat.id_album = album.id_album WHERE album.tieu_de NOT IN ('Album 1', 'Album 2', 'Album 3') EXCEPT SELECT hang_thu_am FROM bai_hat JOIN danh_sach_bai_hat ON bai_hat.id_bai_hat = danh_sach_bai_hat.id_bai_hat JOIN album ON danh_sach_bai_hat.id_album = album.id_album WHERE album.tieu_de NOT IN ('Album 1', 'Album 2', 'Album 3') EXCEPT SELECT hang_thu_am FROM bai_hat JOIN nhac_cu ON bai_hat.id_bai_hat = nhac_cu.id_bai_hat JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten NOT IN ('Artist 1', 'Artist 2', 'Artist 3') EXCEPT SELECT hang_thu_am FROM bai_hat JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten NOT IN ('Artist 1', 'Artist 2', 'Artist 3') EXCEPT SELECT hang_thu_am FROM bai_hat JOIN buoi_bieu_dien ON bai_hat.id_bai_hat = buoi_bieu_dien.id_bai_hat JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten NOT IN ('Artist 1', 'Artist 2', 'Artist 3')
SELECT SUM(CAST(so_luong_dat_hang AS INTEGER)) / COUNT(*) FROM hoa_don JOIN phuong_thuc_thanh_toan ON hoa_don.ma_phuong_thuc_thanh_toan = phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan WHERE phuong_thuc_thanh_toan.mo_ta_ve_phuong_thuc_thanh_toan = 'Mastercard'
SELECT chi_tiet_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM chinh_sach)
SELECT so_tien_giam_gia FROM phieu_giam_gia WHERE id_phieu_giam_gia IN (SELECT id_phieu_giam_gia FROM khach_hang WHERE khach_hang_tot_hay_xau = 'tốt' UNION SELECT id_phieu_giam_gia FROM khach_hang WHERE khach_hang_tot_hay_xau = 'xấu')
SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi='CLE' INTERSECT SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi='CWS' ORDER BY nam_bat_dau
SELECT ten FROM ca_nhan ORDER BY ten ASC
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang WHERE chinh_sach.ma_loai_chinh_sach = 'Uỷ quyền' OR chinh_sach.ma_loai_chinh_sach = 'Thống nhất'
SELECT ten FROM doi WHERE id_doi NOT IN (SELECT DISTINCT doi FROM tran_dau_trong_mua_giai)
SELECT phong_hoc, COUNT(*) FROM danh_sach GROUP BY phong_hoc ORDER BY COUNT(*) DESC
SELECT T1.ten_khoa FROM sinh_vien AS T1 JOIN khoa AS T2 ON T1.ma_khoa = T2.ma_khoa ORDER BY T1.gpa_cua_sinh_vien ASC LIMIT 1
SELECT T1.ten FROM ca_nhan AS T1 WHERE T1.id_ca_nhan NOT IN (SELECT id_ca_nhan FROM ung_cu_vien)
SELECT san_pham_duoc_dat.id_san_pham FROM san_pham_duoc_dat JOIN luot_dat_mua ON san_pham_duoc_dat.id_dat_mua = luot_dat_mua.id_dat_mua GROUP BY san_pham_duoc_dat.id_san_pham HAVING COUNT(*) >= 3
SELECT COUNT(DISTINCT sinh_vien.id_sinh_vien) FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE ten_khoa_hoc = 'tieng Anh' AND ngay_dang_ki <= '2026-02-27'
SELECT so_dien_thoai_khach_hang FROM nguoi_bieu_dien WHERE ten_khach_hang = 'Ashley'
SELECT khoa.ma_khoa, SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) AS tong_tin_chi FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa GROUP BY khoa.ma_khoa ORDER BY tong_tin_chi DESC LIMIT 1
SELECT ten FROM nguoi_tieu_dung WHERE id_nguoi_tieu_dung IN (SELECT id_nguoi_tieu_dung FROM danh_gia WHERE nam = 2010)
SELECT ten FROM doi
SELECT COUNT(*) FROM danh_gia WHERE id_doanh_nghiep = (SELECT id_doanh_nghiep FROM doanh_nghiep WHERE ten = 'Cafe Zinho' AND thanh_pho = 'Texas')
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang JOIN tieu_de_cua_yeu_cau ON chinh_sach.id_chinh_sach = tieu_de_cua_yeu_cau.id_chinh_sach ORDER BY tieu_de_cua_yeu_cau.so_tien_duoc_yeu_cau DESC LIMIT 1
SELECT ho, ten FROM khach_hang JOIN luot_cho_thue ON khach_hang.id_khach_hang = luot_cho_thue.id_khach_hang ORDER BY ngay_cho_thue ASC LIMIT 1
SELECT doi FROM ky_thuat_vien GROUP BY doi ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM nhan_vien
SELECT chi_tiet_khach_hang FROM khach_hang WHERE id_khach_hang IN (SELECT id_khach_hang FROM chinh_sach WHERE ma_loai_chinh_sach IN ('Uỷ quyền', 'Thống nhất'))
SELECT T1.tieu_de FROM bai_hat AS T1 JOIN buoi_bieu_dien AS T2 ON T1.id_bai_hat = T2.id_bai_hat JOIN ban_nhac AS T3 ON T2.nghe_si_trong_ban_nhac = T3.id WHERE T3.ho = 'Hello'
SELECT DISTINCT mau_san_pham FROM san_pham ORDER BY mau_san_pham
SELECT ma_cong_viec_cua_nhan_vien, COUNT(*) AS so_luong_nhan_vien FROM nhan_vien GROUP BY ma_cong_viec_cua_nhan_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_quoc_gia FROM quoc_gia AS T1 JOIN tran_dau_trong_mua_giai AS T2 ON T1.id_quoc_gia = T2.quoc_gia WHERE T2.vi_tri = 'tiền đạo' INTERSECT SELECT T1.ten_quoc_gia FROM quoc_gia AS T1 JOIN tran_dau_trong_mua_giai AS T2 ON T1.id_quoc_gia = T2.quoc_gia WHERE T2.vi_tri = 'hậu vệ'
SELECT COUNT(DISTINCT khu_vuc_bi_anh_huong.id_khu_vuc) FROM khu_vuc_bi_anh_huong JOIN khu_vuc ON khu_vuc_bi_anh_huong.id_khu_vuc = khu_vuc.id_khu_vuc JOIN bao ON khu_vuc_bi_anh_huong.id_bao = bao.id_con_bao WHERE bao.ngay_hoat_dong BETWEEN '2026-01-01' AND '2026-12-31'
SELECT COUNT(DISTINCT dia_chi_khoa) FROM khoa WHERE ma_khoa = 'BUS'
SELECT COUNT(*) FROM nha_tho WHERE ngay_mo_cua < 1850
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien WHERE sinh_vien.tuoi < 20 GROUP BY sinh_vien.id_sinh_vien HAVING COUNT(DISTINCT tham_gia_vao.id_hoat_dong) > 0
SELECT danh_sach.ten, danh_sach.ho FROM dbo.danh_sach JOIN dbo.giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'OTHA' AND giao_vien.ten = 'MOYER'
SELECT dia_diem FROM truong_hoc WHERE id_truong NOT IN (SELECT id_truong FROM cau_thu)
SELECT T1.ten FROM bao AS T1 JOIN khu_vuc_bi_anh_huong AS T2 ON T1.id_con_bao = T2.id_bao JOIN khu_vuc AS T3 ON T2.id_khu_vuc = T3.id_khu_vuc WHERE T3.ma_khu_vuc = 'Afghanistan' AND T3.ma_khu_vuc = 'Albania' GROUP BY T1.id_con_bao HAVING COUNT(DISTINCT T3.ma_khu_vuc) = 2
SELECT T1.ma_truong FROM khoa AS T1 JOIN giao_su AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT id_giang_vien FROM giang_vien EXCEPT SELECT id_giang_vien FROM giang_vien_tham_gia_vao
SELECT truong_dai_hoc, COUNT(*) AS so_luong_cau_thu FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc ORDER BY so_luong_cau_thu DESC LIMIT 3
SELECT COUNT(*) FROM giang_vien WHERE gioi_tinh='Nữ' AND ngach='Giáo sư'
SELECT mau_ma_tai_san FROM tai_san GROUP BY mau_ma_tai_san ORDER BY mau_ma_tai_san ASC
SELECT truong_hoc.ton_giao FROM truong_hoc JOIN cau_thu ON truong_hoc.id_truong = cau_thu.id_truong GROUP BY truong_hoc.id_truong ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien AS T1 JOIN khoa_hoc AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc WHERE T2.ten_khoa_hoc = 'thong ke' ORDER BY T1.ngay_tham_du ASC
SELECT COUNT(*) FROM hoat_dong
SELECT dia_chi.thanh_pho_thi_tran FROM cua_hang JOIN dia_chi ON cua_hang.id_dia_chi = dia_chi.id_dia_chi WHERE cua_hang.ten_cua_hang = 'FJA Filming'
SELECT SUM(so_luong_nguoi_chet) AS SUM_SO_LUONG_NGUOI_CHET, SUM(thiet_hai_theo_trieu_usd) AS SUM_THIET_HAI_THEO_TRIEU_USD FROM bao WHERE toc_do_toi_da > (SELECT AVG(toc_do_toi_da) FROM bao)
SELECT thanh_pho, quoc_gia FROM san_bay WHERE ten_san_bay = 'Alton'
SELECT khoa.ten_khoa, khoa.dia_chi_khoa FROM khoa JOIN sinh_vien ON khoa.ma_khoa = sinh_vien.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT truong_dai_hoc, COUNT(*) AS so_luong_cau_thu FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc ORDER BY COUNT(*) DESC LIMIT 3
SELECT ten FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM toi_pham)
SELECT ho, ten FROM dbo.danh_sach
SELECT toa_nha AS ten_toa_nha, COUNT(*) AS so_luong_giang_vien FROM giang_vien GROUP BY toa_nha ORDER BY COUNT(*) DESC
SELECT dai_dien.ten, cuoc_bau_cu.ngay FROM cuoc_bau_cu JOIN dai_dien ON cuoc_bau_cu.id_dai_dien = dai_dien.id_dai_dien
SELECT id_sinh_vien, COUNT(*) AS so_khoa_hoc_dang_ky FROM luot_dang_ky_khoa_hoc_cua_sinh_vien GROUP BY id_sinh_vien HAVING COUNT(*) > 0 ORDER BY COUNT(*) DESC
SELECT truong_dai_hoc.ten_lanh_dao FROM truong_dai_hoc JOIN thanh_vien ON truong_dai_hoc.id_dai_hoc = thanh_vien.id_dai_hoc WHERE thanh_vien.quoc_gia = 'Canada'
SELECT ma_loai_dich_vu FROM dich_vu WHERE id_dich_vu IN (SELECT id_dich_vu FROM su_kien WHERE chi_tiet_su_kien IN ('Thành công', 'Thất bại'))
SELECT COUNT(*) FROM ban_nhac
SELECT COUNT(*) FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_truong
SELECT dia_chi.thanh_pho, COUNT(nhan_vien.id_nhan_vien) AS so_luong_nhan_vien FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi GROUP BY dia_chi.thanh_pho ORDER BY so_luong_nhan_vien DESC LIMIT 1
SELECT T1.ten FROM dbo.ung_cu_vien AS T1 JOIN dbo.ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan WHERE T2.gioi_tinh = 'F' ORDER BY T1.ten ASC
SELECT danh_sach.ten, danh_sach.ho FROM dbo.danh_sach JOIN dbo.giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'MOYER' AND giao_vien.ten = 'OTHA'
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc HAVING COUNT(*) >= 2
SELECT ten FROM bao WHERE id_con_bao NOT IN (SELECT id_bao FROM khu_vuc_bi_anh_huong)
SELECT T1.ten_tai_khoan, T1.chi_tiet_khac_ve_tai_khoan FROM tai_khoan AS T1 JOIN khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.ten_khach_hang = 'Mea Afghanistan' AND T2.ho_cua_khach_hang = 'Keeling'
SELECT ten FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api AND cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa WHERE chan_thuan = 'Left' AND danh_gia_tong_the BETWEEN 85 AND 90
SELECT thanh_pho FROM thanh_pho WHERE dan_so_khu_vuc > 8000000 OR dan_so_khu_vuc < 5000000
SELECT tai_khoan.id_tai_khoan AS id, COUNT(*) AS so_luong_tai_khoan FROM tai_khoan GROUP BY tai_khoan.id_tai_khoan ORDER BY so_luong_tai_khoan DESC LIMIT 1
SELECT khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi FROM nhom_hoi_thao_kich JOIN khu_vuc_tiep_thi ON nhom_hoi_thao_kich.ma_khu_vuc_tiep_thi = khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi GROUP BY nhom_hoi_thao_kich.ma_khu_vuc_tiep_thi ORDER BY COUNT(*) DESC LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM chinh_sach JOIN khach_hang ON chinh_sach.id_khach_hang = khach_hang.id_khach_hang WHERE chinh_sach.ma_loai_chinh_sach = 'Uỷ quyền'
SELECT ten FROM ky_thuat_vien WHERE tuoi BETWEEN 36 AND 37
SELECT DISTINCT toa_nha FROM giang_vien WHERE ngach LIKE '%Khoa%'
SELECT dac_diem_cua_cau_thu.id FROM dac_diem_cua_cau_thu JOIN cau_thu ON dac_diem_cua_cau_thu.id_cau_thu_api = cau_thu.id_cau_thu_api WHERE cau_thu.chieu_cao >= 180 AND dac_diem_cua_cau_thu.danh_gia_tong_the > 85
SELECT gioi_tinh FROM nhan_vien GROUP BY gioi_tinh ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT danh_gia_xep_hang) FROM phim
SELECT T1.thanh_pho FROM san_bay AS T1 JOIN chuyen_bay AS T2 ON T1.ma_san_bay = T2.san_bay_khoi_hanh GROUP BY T1.ma_san_bay, T1.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ho, T1.ten FROM sinh_vien AS T1 JOIN tham_gia_vao AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_trang_thai_khach_hang, so_dien_thoai_di_dong, dia_chi_email FROM khach_hang WHERE ho='Kohler' OR ten='Marina'
SELECT ban_nhac.ho FROM ban_nhac JOIN nhac_cu ON ban_nhac.id = nhac_cu.id_nghe_si_trong_ban_nhac GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT id_giang_vien FROM giang_vien WHERE id_giang_vien NOT IN (SELECT co_van FROM sinh_vien)
SELECT phim.id_phim, phim.tieu_de, phim.mo_ta FROM phim JOIN dien_vien_dien_anh ON phim.id_phim = dien_vien_dien_anh.id_phim GROUP BY phim.id_phim ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_san_pham, ten_san_pham FROM san_pham WHERE gia_san_pham > 1000 OR gia_san_pham < 500
SELECT dia_diem FROM truong_hoc WHERE id_truong IN (SELECT id_truong FROM cau_thu GROUP BY id_truong HAVING COUNT(*) > 1)
SELECT ten FROM dbo.doanh_nghiep JOIN dbo.loai_hinh ON dbo.doanh_nghiep.id_doanh_nghiep = dbo.loai_hinh.id_doanh_nghiep WHERE dbo.loai_hinh.ten_loai_hinh = 'hải sản' AND dbo.doanh_nghiep.thanh_pho = 'Los Angeles'
SELECT tieu_de FROM phim WHERE danh_gia_xep_hang = 'R'
SELECT id_sinh_vien FROM sinh_vien UNION SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien UNION SELECT id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien
SELECT COUNT(*) FROM danh_gia WHERE id_nguoi_tieu_dung='Niloofar' AND nam=2015
SELECT T1.tieu_de FROM bo_phim AS T1 JOIN phan_vai AS T2 ON T1.id_bo_phim = T2.id_se_ri_phim JOIN dien_vien AS T3 ON T2.id_dien_vien = T3.id_dien_vien WHERE T3.ten = 'Gabriele Ferzetti' ORDER BY T1.nam_phat_hanh DESC LIMIT 1
SELECT id_sinh_vien FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien)
SELECT ten AS ten_cua_hang FROM cua_hang WHERE so_luong_san_pham > (SELECT AVG(so_luong_san_pham) FROM cua_hang)
SELECT mo_ta_ve_khu_vuc_tiep_thi FROM khu_vuc_tiep_thi WHERE ten_khu_vuc_tiep_thi='Trung Quốc'
SELECT ngay_mua_tai_san FROM tai_san ORDER BY ngay_mua_tai_san LIMIT 1
SELECT hang_hang_khong.id_hang_hang_khong FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.ten_san_bay = 'AHD' GROUP BY hang_hang_khong.id_hang_hang_khong
SELECT chi_tiet_khach_hang FROM khach_hang ORDER BY chi_tiet_khach_hang ASC
SELECT id_sinh_vien FROM sinh_vien EXCEPT SELECT id_sinh_vien FROM tham_gia_vao
SELECT id_khoa_hoc FROM luot_dang_ky_khoa_hoc_cua_sinh_vien WHERE id_sinh_vien = 121 UNION SELECT id_khoa_hoc FROM lan_tham_du_khoa_hoc_cua_sinh_vien WHERE id_sinh_vien = 121
SELECT bai_hat.tieu_de FROM bai_hat JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat GROUP BY bai_hat.id_bai_hat ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien WHERE vai_dien = 'Alan Turing' AND phan_vai.id_se_ri_phim = (SELECT id_bo_phim FROM bo_phim WHERE tieu_de = 'Trò chơi bắt chước')
SELECT ngay_thanh_toan FROM khoan_thanh_toan JOIN nhan_vien ON khoan_thanh_toan.id_nhan_vien = nhan_vien.id_nhan_vien WHERE so_tien > 10 AND nhan_vien.ten = 'Elsa'
SELECT giang_vien.id_giang_vien, COUNT(sinh_vien.id_sinh_vien) FROM giang_vien JOIN sinh_vien ON giang_vien.id_giang_vien = sinh_vien.co_van GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(sinh_vien.id_sinh_vien) DESC
SELECT tai_san.id_tai_san, tai_san.chi_tiet_tai_san FROM tai_san JOIN bo_phan_cua_tai_san ON tai_san.id_tai_san = bo_phan_cua_tai_san.id_tai_san LEFT JOIN nhat_ky_loi ON tai_san.id_tai_san = nhat_ky_loi.id_tai_san WHERE tai_san.ngay_thanh_ly_tai_san IS NULL GROUP BY tai_san.id_tai_san HAVING COUNT(DISTINCT bo_phan_cua_tai_san.id_bo_phan) = 2 AND COUNT(nhat_ky_loi.id_muc_nhap_cua_nhat_ky_loi) < 2 ORDER BY tai_san.id_tai_san LIMIT 1000
SELECT id FROM xe
SELECT ngay_xuat_ban FROM an_pham ORDER BY gia_ban ASC LIMIT 3
SELECT T1.ten, T1.toc_do_toi_da FROM bao AS T1 JOIN khu_vuc_bi_anh_huong AS T2 ON T1.id_con_bao = T2.id_bao GROUP BY T1.id_con_bao ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_dich = T1.ma_san_bay WHERE T1.thanh_pho = 'Aberdeen' OR T1.thanh_pho = 'Abilene'
SELECT COUNT(DISTINCT dia_diem) FROM toi_pham
SELECT quoc_gia, thanh_pho FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi_khach_hang = dia_chi.id_dia_chi WHERE khach_hang.ten = 'Sawayn' AND khach_hang.ho = 'Janessa'
SELECT COUNT(*) FROM danh_gia WHERE id_nguoi_tieu_dung = (SELECT id_nguoi_tieu_dung FROM nguoi_tieu_dung WHERE ten = 'Adrienne')
SELECT ton_giao FROM truong_hoc GROUP BY ton_giao HAVING COUNT(*) > 1
SELECT nhan_vien.ten, dia_chi.dia_chi, dia_chi.quan, thanh_pho.ten_thanh_pho FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi = dia_chi.id_dia_chi JOIN thanh_pho ON dia_chi.id_thanh_pho = thanh_pho.id_thanh_pho WHERE nhan_vien.ten = 'Elsa'
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM chinh_sach JOIN khach_hang ON chinh_sach.id_khach_hang = khach_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT truong_dai_hoc FROM luot_nop_bai WHERE so_diem > 90 INTERSECT SELECT truong_dai_hoc FROM luot_nop_bai WHERE so_diem < 80
SELECT MIN(ti_le_phieu_bau) AS MIN_TIEU_LE_PHIEU_BAU FROM cuoc_bau_cu JOIN dai_dien ON cuoc_bau_cu.id_dai_dien = dai_dien.id_dai_dien WHERE dai_dien.dang = 'Communist Party' AND dai_dien.tuoi_tho BETWEEN 30 AND 60 UNION SELECT MAX(ti_le_phieu_bau) AS MAX_TIEU_LE_PHIEU_BAU FROM cuoc_bau_cu JOIN dai_dien ON cuoc_bau_cu.id_dai_dien = dai_dien.id_dai_dien WHERE dai_dien.dang = 'Communist Party' AND dai_dien.tuoi_tho BETWEEN 30 AND 60
SELECT giao_su.ma_so_nhan_vien, giao_su.van_phong_giao_su, nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.bang_cap_cao_nhat != 'Tiến sĩ'
SELECT id_su_kien FROM nguoi_tham_gia_su_kien GROUP BY id_su_kien ORDER BY COUNT(*) DESC LIMIT 1
SELECT id_ung_cu_vien FROM danh_gia_ung_cu_vien WHERE ma_ket_qua_danh_gia = 'Đạt'
SELECT AVG(nhiet_do_cao) FROM thoi_tiet_hang_tuan GROUP BY ngay_trong_tuan HAVING COUNT(*) = 1 ORDER BY ngay_trong_tuan ASC LIMIT 7
SELECT ten, dang FROM dai_dien
SELECT AVG(so_luong_nhan_vien) FROM cac_bo WHERE xep_hang BETWEEN 10 AND 15
SELECT T1.ten_khoa FROM khoa AS T1 JOIN giao_su AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_chinh_sach FROM chinh_sach GROUP BY ma_loai_chinh_sach ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_chinh_sach FROM chinh_sach GROUP BY ma_loai_chinh_sach HAVING COUNT(DISTINCT id_khach_hang) > 2
SELECT khoa.ma_khoa, giao_su.van_phong_giao_su FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE nhan_vien.ho_cua_nhan_vien = 'Heffington'
SELECT ho, ten, id_dien_vien FROM dien_vien JOIN dien_vien_dien_anh ON dien_vien.id_dien_vien = dien_vien_dien_anh.id_dien_vien GROUP BY id_dien_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT dai_dien.dang, COUNT(*) AS count FROM dai_dien JOIN cuoc_bau_cu ON dai_dien.id_dai_dien = cuoc_bau_cu.id_dai_dien GROUP BY dai_dien.dang ORDER BY count DESC LIMIT 1
SELECT dia_diem FROM toi_pham ORDER BY so_nguoi_bi_giet DESC LIMIT 1
SELECT thanh_pho_thi_tran FROM dia_chi JOIN khach_hang ON dia_chi.id_dia_chi = khach_hang.id_dia_chi EXCEPT SELECT thanh_pho_thi_tran FROM dia_chi JOIN nguoi_bieu_dien ON dia_chi.id_dia_chi = nguoi_bieu_dien.id_dia_chi
SELECT SUM(so_diem) / COUNT(*) FROM luot_nop_bai
SELECT thanh_pho FROM dbo.doanh_nghiep WHERE ten = 'tiệc đứng sang trọng MGM' AND thanh_pho = 'Texas'
SELECT id_sinh_vien FROM tham_gia_vao WHERE id_hoat_dong = (SELECT id_hoat_dong FROM hoat_dong WHERE ten_hoat_dong = 'Bơi xuồng') INTERSECT SELECT id_sinh_vien FROM tham_gia_vao WHERE id_hoat_dong = (SELECT id_hoat_dong FROM hoat_dong WHERE ten_hoat_dong = 'Chèo thuyền Kayak')
SELECT chi_tiet_khach_hang FROM khach_hang ORDER BY chi_tiet_khach_hang
SELECT ten FROM nhan_vien WHERE id_nhan_vien NOT IN (SELECT id_nhan_vien FROM bai_giang)
SELECT ten_cua_nhan_vien FROM nhan_vien JOIN giao_su ON nhan_vien.ma_so_nhan_vien = giao_su.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Lịch sử' EXCEPT SELECT ten_cua_nhan_vien FROM nhan_vien JOIN lop_hoc ON nhan_vien.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su
SELECT giao_vien.ten, khoa_hoc.khoa_hoc FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien JOIN khoa_hoc ON sap_xep_khoa_hoc.id_khoa_hoc = khoa_hoc.id_khoa_hoc
SELECT ho, ten FROM dbo.danh_sach WHERE khoi_lop = 1 AND phong_hoc NOT IN (SELECT phong_hoc FROM dbo.giao_vien WHERE ho = 'OTHA' AND ten = 'MOYER')
SELECT ten FROM cua_hang WHERE so_luong_san_pham > (SELECT AVG(so_luong_san_pham) FROM cua_hang)
SELECT COUNT(DISTINCT noi_sinh) FROM ca_nhan
SELECT thanh_vien.ten, truong_dai_hoc.dia_diem_truong_dai_hoc FROM thanh_vien JOIN truong_dai_hoc ON thanh_vien.id_dai_hoc = truong_dai_hoc.id_dai_hoc ORDER BY thanh_vien.ten ASC
SELECT id_khach_hang AS id_khach_hang, chi_tiet_khach_hang AS chi_tiet_khach_hang FROM khach_hang UNION SELECT id_nhan_vien AS id_nhan_vien, chi_tiet_nhan_vien AS chi_tiet_nhan_vien FROM nhan_vien
SELECT COUNT(*) FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_truong
SELECT ten FROM dien_vien GROUP BY ten ORDER BY COUNT(*) DESC LIMIT 1
SELECT giang_vien.ho, giang_vien.ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT truong_dai_hoc, cau_thu FROM tran_dau_trong_mua_giai ORDER BY truong_dai_hoc ASC
SELECT T1.ten_cua_nhan_vien, T4.phong_hoc FROM nhan_vien AS T1 JOIN giao_su AS T2 ON T1.ma_so_nhan_vien = T2.ma_so_nhan_vien JOIN khoa AS T3 ON T2.ma_khoa = T3.ma_khoa JOIN lop_hoc AS T4 ON T1.ma_so_nhan_vien = T4.ma_so_nhan_vien_cua_giao_su WHERE T3.ten_khoa = 'Kế toán' AND T1.ma_so_nhan_vien IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc)
SELECT ma_trang_thai, COUNT(*) AS so_luong FROM luot_dat_hang GROUP BY ma_trang_thai ORDER BY so_luong DESC LIMIT 1
SELECT tieu_de FROM bai_hat WHERE id_bai_hat NOT IN (SELECT id_bai_hat FROM giong_hat WHERE loai = 'phu')
SELECT san_bay.ma_san_bay FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay GROUP BY san_bay.ma_san_bay ORDER BY COUNT(*) ASC LIMIT 1
SELECT chinh_quyen_dia_phuong, dich_vu FROM nha_ga ORDER BY chinh_quyen_dia_phuong ASC
SELECT COUNT(*) FROM giao_dich_tai_chinh
SELECT ten FROM dao_dien WHERE quoc_tich = 'Afghanistan'
SELECT biet_danh FROM chi_tiet_truong_hoc WHERE phan_hang NOT IN ('1')
SELECT khoan_tien_boa.van_ban FROM khoan_tien_boa JOIN doanh_nghiep ON khoan_tien_boa.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Cafe Zinho' AND doanh_nghiep.thanh_pho = 'Texas'
SELECT COUNT(*) FROM tran_dau WHERE mua_giai > 2007
SELECT COUNT(*) FROM giang_vien_tham_gia_vao JOIN giang_vien ON giang_vien_tham_gia_vao.id_giang_vien = giang_vien.id_giang_vien GROUP BY id_hoat_dong HAVING COUNT(*) > 1 ORDER BY COUNT(*) DESC LIMIT 10
SELECT T1.ten_cong_ty FROM hop_dong_bao_tri AS T2 JOIN cong_ty_ben_thu_ba AS T1 ON T2.id_hop_dong_bao_tri_cua_cong_ty = T1.id_cong_ty ORDER BY T2.ngay_ket_thuc_hop_dong DESC LIMIT 1
SELECT COUNT(DISTINCT ma_tien_te) FROM nhom_hoi_thao_kich
SELECT COUNT(*) FROM dbo.luot_dang_ky JOIN dbo.doanh_nghiep ON dbo.luot_dang_ky.id_doanh_nghiep = dbo.doanh_nghiep.id_doanh_nghiep WHERE dbo.doanh_nghiep.ten LIKE '%Maroc%' AND dbo.doanh_nghiep.thanh_pho = 'Los Angeles' AND dbo.luot_dang_ky.ngay LIKE '%Friday%'
SELECT ngon_ngu_ban_dia_chinh_thuc FROM quoc_gia WHERE ngon_ngu_ban_dia_chinh_thuc LIKE '% tiếng Anh %'
SELECT ten_san_pham FROM san_pham WHERE id_san_pham NOT IN (SELECT DISTINCT id_san_pham FROM mat_hang_duoc_dat)
SELECT can_nang FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan WHERE cu_giat > 140 OR ca_nhan.chieu_cao > 200
SELECT ten_khach_hang, dien_thoai_khach_hang FROM khach_hang WHERE dia_chi_cua_khach_hang IS NULL
SELECT id_ung_cu_vien FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ung_cu_vien = ca_nhan.id_ca_nhan WHERE ca_nhan.dia_chi_email = 'stanley.monahan@example.org'
SELECT COUNT(*) FROM nhan_vien
SELECT ten_nhan_vien FROM nhan_vien EXCEPT SELECT T2.ten_nhan_vien FROM lich_su_luu_hanh T3 JOIN nhan_vien T2 ON T3.id_nhan_vien = T2.id_nhan_vien
SELECT tac_gia FROM sach ORDER BY tac_gia ASC
SELECT tieu_de FROM dbo.bo_phim JOIN dbo.duoc_viet_boi ON dbo.bo_phim.id_bo_phim = dbo.duoc_viet_boi.id_se_ri_phim JOIN dbo.nha_viet_kich_ban ON dbo.duoc_viet_boi.id_nha_viet_kich_ban = dbo.nha_viet_kich_ban.id_nha_viet_kich_ban WHERE dbo.nha_viet_kich_ban.ten = 'Matt Damon'
SELECT loai_hinh FROM truong_hoc GROUP BY loai_hinh HAVING COUNT(*) = 2
SELECT ten FROM danh_sach WHERE phong_hoc = 107
SELECT ten FROM dien_vien WHERE quoc_tich = 'Afghanistan'
SELECT khoa.ma_khoa, AVG(sinh_vien.gpa_cua_sinh_vien) AS trung_binh_gpa FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa ORDER BY trung_binh_gpa DESC LIMIT 1
SELECT ho, ten FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.ho = 'EVELINA' AND danh_sach.ten = 'BROMLEY'
SELECT COUNT(DISTINCT dia_diem) FROM cua_hang
SELECT nha_ga.id, nha_ga.chinh_quyen_dia_phuong FROM nha_ga JOIN thoi_tiet_hang_tuan ON nha_ga.id = thoi_tiet_hang_tuan.id_nha_ga GROUP BY nha_ga.id ORDER BY AVG(thoi_tiet_hang_tuan.nhiet_do_cao) DESC LIMIT 1
SELECT ten_bo_phan FROM bo_phan JOIN dia_diem_cua_bo_phan ON bo_phan.ma_so_bo_phan = dia_diem_cua_bo_phan.ma_so_bo_phan WHERE dia_diem_cua_bo_phan.dia_diem_bo_phan = 'Houston'
SELECT COUNT(*) FROM dbo.ung_cu_vien
SELECT cau_thu.cau_thu FROM cau_thu JOIN doi ON cau_thu.doi = doi.id_doi JOIN tran_dau_trong_mua_giai ON cau_thu.doi = tran_dau_trong_mua_giai.doi WHERE tran_dau_trong_mua_giai.truong_dai_hoc = 'UCLA'
SELECT ca_nhan.id_ca_nhan, ca_nhan.gioi_tinh, ca_nhan.ten, ca_nhan.ngay_sinh, ca_nhan.chieu_cao, ca_nhan.can_nang FROM ca_nhan JOIN ung_cu_vien ON ca_nhan.id_ca_nhan = ung_cu_vien.id_ca_nhan UNION SELECT id_ca_nhan, gioi_tinh, ten, ngay_sinh, chieu_cao, can_nang FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM ung_cu_vien)
SELECT ho FROM nhan_vien UNION SELECT ho FROM khach_hang ORDER BY ho ASC
SELECT SUM(so_tien) FROM khoan_thanh_toan
SELECT id_cua_hang FROM khach_hang GROUP BY id_cua_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT tai_khoan.id_khach_hang) FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang
SELECT id_sinh_vien FROM sinh_vien WHERE co_van IN (SELECT id_giang_vien FROM giang_vien WHERE ngach = 'Giáo sư')
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT ten_san_pham FROM cac_san_pham WHERE gia_san_pham < 1000000
SELECT T1.ten_khu_vuc FROM khu_vuc AS T1 JOIN khu_vuc_bi_anh_huong AS T2 ON T1.id_khu_vuc = T2.id_khu_vuc JOIN bao AS T3 ON T2.id_bao = T3.id_con_bao ORDER BY T3.so_luong_nguoi_chet DESC LIMIT 1
SELECT gioi_tinh, AVG(can_nang), MIN(can_nang) FROM ca_nhan GROUP BY gioi_tinh ORDER BY gioi_tinh ASC
SELECT ten_cua_nhan_vien FROM nhan_vien WHERE ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc) AND ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien FROM giao_su)
SELECT phim.id_phim, phim.tieu_de FROM phim JOIN hang_ton_kho ON phim.id_phim = hang_ton_kho.id_phim WHERE phim.gia_cho_thue = 0.99 GROUP BY phim.id_phim HAVING COUNT(hang_ton_kho.id_hang_ton_kho) < 3
SELECT T1.ho, T1.ten FROM dien_vien AS T1 JOIN dien_vien_dien_anh ON T1.id_dien_vien = dien_vien_dien_anh.id_dien_vien GROUP BY T1.id_dien_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_tich FROM dien_vien WHERE ten = 'Christoph Waltz'
SELECT loai, COUNT(*) FROM giong_hat GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM ban_sao JOIN ban_du_thao_cua_tai_lieu ON ban_sao.id_tai_lieu = ban_du_thao_cua_tai_lieu.id_tai_lieu WHERE ban_du_thao_cua_tai_lieu.id_tai_lieu = 2
SELECT ten_san_pham FROM san_pham WHERE id_san_pham NOT IN (SELECT DISTINCT id_san_pham FROM mat_hang_duoc_dat)
SELECT T1.ten_khoa, T1.dia_chi_khoa FROM khoa AS T1 JOIN sinh_vien AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT can_nang FROM cau_thu ORDER BY can_nang DESC LIMIT 1 UNION SELECT can_nang FROM cau_thu ORDER BY can_nang ASC LIMIT 1
SELECT COUNT(DISTINCT tran_dau_trong_mua_giai.doi) FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi
SELECT id_su_kien FROM su_kien EXCEPT SELECT nguoi_tham_gia_su_kien.id_su_kien FROM nguoi_tham_gia_su_kien JOIN nguoi_tham_gia ON nguoi_tham_gia_su_kien.id_nguoi_tham_gia = nguoi_tham_gia.id_nguoi_tham_gia WHERE nguoi_tham_gia.chi_tiet_nguoi_tham_gia = 'Kenyatta Kuhn'
SELECT ma_san_bay ten_san_bay FROM san_bay WHERE thanh_pho = 'Anthony'
SELECT COUNT(*) FROM san_pham WHERE id_san_pham NOT IN (SELECT id_san_pham FROM mat_hang_duoc_dat)
SELECT loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten = 'Solveig' GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM san_van_dong WHERE ten LIKE '% ngân hàng %'
SELECT phong_hoc, COUNT(*) FROM danh_sach GROUP BY phong_hoc ORDER BY COUNT(*) DESC
SELECT mo_ta_ve_tinh_trang_yeu_cau FROM giai_doan_xu_ly_yeu_cau WHERE ten_tinh_trang_yeu_cau = 'Mở'
SELECT DISTINCT lop_hoc.ma_khoa_hoc FROM lop_hoc JOIN sinh_vien ON lop_hoc.ma_lop_hoc = sinh_vien.lop_cua_sinh_vien WHERE sinh_vien.ho_cua_sinh_vien = 'Smithson'
SELECT COUNT(DISTINCT nguon_thong_tin) FROM chan_thuong
SELECT ten_nhan_vien, id_nhan_vien FROM nhan_vien WHERE id_nhan_vien NOT IN (SELECT DISTINCT id_nhan_vien_lien_lac FROM chuyen_tham_cua_ky_su) AND id_nhan_vien IN (SELECT duoc_ghi_lai_boi_nhan_vien_co_id FROM nhat_ky_loi)
SELECT ten_san_bay FROM san_bay WHERE ma_san_bay = 'AKO'
SELECT ten_hang_hang_khong FROM hang_hang_khong WHERE id_hang_hang_khong IN (SELECT hang_hang_khong FROM chuyen_bay WHERE san_bay_khoi_hanh = 'CVO') EXCEPT SELECT ten_hang_hang_khong FROM hang_hang_khong WHERE id_hang_hang_khong IN (SELECT hang_hang_khong FROM chuyen_bay WHERE san_bay_khoi_hanh = 'APG')
SELECT id_giao_dich FROM giao_dich_tai_chinh WHERE so_tien_giao_dich > (SELECT AVG(so_tien_giao_dich) FROM giao_dich_tai_chinh)
SELECT T1.tieu_de FROM bo_phim AS T1 JOIN phan_vai AS T2 ON T1.id_bo_phim = T2.id_se_ri_phim JOIN dien_vien AS T3 ON T2.id_dien_vien = T3.id_dien_vien WHERE T3.quoc_tich = 'Trung Quốc' GROUP BY T1.id_bo_phim ORDER BY COUNT(*) DESC LIMIT 1
