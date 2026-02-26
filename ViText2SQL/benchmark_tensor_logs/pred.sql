SELECT T1.id_tai_san, T1.chi_tiet_tai_san FROM tai_san AS T1 JOIN bo_phan_cua_tai_san AS T2 ON T1.id_tai_san = T2.id_tai_san JOIN nhat_ky_loi AS T3 ON T1.id_tai_san = T3.id_tai_san GROUP BY T1.id_tai_san HAVING COUNT(T2.id_bo_phan) = 2 AND COUNT(T3.id_muc_nhap_cua_nhat_ky_loi) < 2
SELECT T1.id_hop_dong_bao_tri, COUNT(*) FROM hop_dong_bao_tri AS T1 JOIN tai_san AS T2 ON T1.id_hop_dong_bao_tri = T2.id_hop_dong_bao_tri GROUP BY T1.id_hop_dong_bao_tri
SELECT T2.id_cong_ty , COUNT ( * ) FROM tai_san AS T1 JOIN cong_ty_ben_thu_ba AS T2 ON T1.id_cong_ty_cung_cap = T2.id_cong_ty GROUP BY T2.id_cong_ty
SELECT T1.id_cong_ty, T1.ten_cong_ty FROM cong_ty_ben_thu_ba AS T1 JOIN ky_su_bao_tri AS T2 ON T1.id_cong_ty = T2.id_cong_ty GROUP BY T1.id_cong_ty HAVING COUNT(*) >= 2 UNION SELECT T1.id_cong_ty, T1.ten_cong_ty FROM cong_ty_ben_thu_ba AS T1 JOIN hop_dong_bao_tri AS T3 ON T1.id_cong_ty = T3.id_hop_dong_bao_tri_cua_cong_ty GROUP BY T1.id_cong_ty HAVING COUNT(*) >= 2
select t1.id_nhan_vien , t1.ten_nhan_vien from nhan_vien as t1 join nhat_ky_loi as t2 on t1.id_nhan_vien = t2.duoc_ghi_lai_boi_nhan_vien_co_id except select t1.id_nhan_vien , t1.ten_nhan_vien from nhan_vien as t1 join chuyen_tham_cua_ky_su as t3 on t1.id_nhan_vien = t3.id_nhan_vien_lien_lac
SELECT t1.id_ky_su , t1.ten , t1.ho FROM ky_su_bao_tri AS t1 JOIN chuyen_tham_cua_ky_su AS t2 ON t1.id_ky_su = t2.id_ky_su GROUP BY t1.id_ky_su ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_bo_phan, T1.ten_bo_phan FROM bo_phan AS T1 JOIN loi_bo_phan AS T2 ON T1.id_bo_phan = T2.id_bo_phan GROUP BY T1.id_bo_phan HAVING COUNT(*) > 2
SELECT T1.ten, T1.ho, T1.nhung_chi_tiet_khac, T3.mo_ta_ve_ky_nang FROM ky_su_bao_tri AS T1 JOIN ky_nang_cua_ky_su AS T2 ON T1.id_ky_su = T2.id_ky_su JOIN ky_nang AS T3 ON T2.id_ky_nang = T3.id_ky_nang
SELECT T1.ten_viet_tat_cua_loi , T3.mo_ta_ve_ky_nang FROM loi_bo_phan AS T1 JOIN ky_nang_can_de_sua_chua AS T2 ON T1.id_bo_phan_bi_loi = T2.id_bo_phan_bi_loi JOIN ky_nang AS T3 ON T2.id_ky_nang = T3.id_ky_nang
SELECT T1.ten_bo_phan , COUNT ( * ) FROM bo_phan AS T1 JOIN bo_phan_cua_tai_san AS T2 ON T1.id_bo_phan = T2.id_bo_phan GROUP BY T1.id_bo_phan
SELECT T3.mo_ta_loi , T2.tinh_trang_loi FROM nhat_ky_loi AS T1 JOIN nhat_ky_cua_loi_bo_phan AS T2 ON T1.id_muc_nhap_cua_nhat_ky_loi = T2.id_muc_nhap_cua_nhat_ky_loi JOIN loi_bo_phan AS T3 ON T2.id_bo_phan_bi_loi = T3.id_bo_phan_bi_loi
SELECT T1.id_muc_nhap_cua_nhat_ky_loi , COUNT ( * ) FROM nhat_ky_loi AS T1 JOIN chuyen_tham_cua_ky_su AS T2 ON T1.id_muc_nhap_cua_nhat_ky_loi = T2.id_muc_nhap_cua_nhat_ky_loi GROUP BY T1.id_muc_nhap_cua_nhat_ky_loi ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT DISTINCT ho FROM ky_su_bao_tri
SELECT DISTINCT tinh_trang_loi FROM nhat_ky_cua_loi_bo_phan
SELECT ten , ho FROM ky_su_bao_tri WHERE id_ky_su NOT IN (SELECT id_ky_su FROM chuyen_tham_cua_ky_su)
SELECT id_tai_san, chi_tiet_tai_san, thuong_hieu_tai_san, mau_ma_tai_san FROM tai_san
SELECT MIN(ngay_mua_tai_san) FROM tai_san
SELECT T3.id_bo_phan, T3.ten_bo_phan FROM loi_bo_phan AS T1 JOIN ky_nang_can_de_sua_chua AS T2 ON T1.id_bo_phan_bi_loi = T2.id_bo_phan_bi_loi JOIN bo_phan AS T3 ON T1.id_bo_phan = T3.id_bo_phan GROUP BY T1.id_bo_phan_bi_loi ORDER BY COUNT(*) DESC LIMIT 1
SELECT bo_phan.ten_bo_phan FROM bo_phan LEFT JOIN loi_bo_phan ON bo_phan.id_bo_phan = loi_bo_phan.id_bo_phan GROUP BY bo_phan.id_bo_phan ORDER BY COUNT(loi_bo_phan.id_bo_phan) ASC LIMIT 1
SELECT T1.id_ky_su , T1.ten , T1.ho FROM ky_su_bao_tri AS T1 JOIN chuyen_tham_cua_ky_su AS T2 ON T1.id_ky_su = T2.id_ky_su GROUP BY T1.id_ky_su ORDER BY COUNT(*) ASC LIMIT 1
select t1.ten_nhan_vien , t3.ten , t3.ho from nhan_vien as t1 join chuyen_tham_cua_ky_su as t2 on t1.id_nhan_vien = t2.id_nhan_vien_lien_lac join ky_su_bao_tri as t3 on t2.id_ky_su = t3.id_ky_su
SELECT T1.id_muc_nhap_cua_nhat_ky_loi , T1.mo_ta_ve_loi , T1.thoi_gian_muc_nhap_cua_nhat_ky_loi FROM nhat_ky_loi AS T1 JOIN nhat_ky_cua_loi_bo_phan AS T2 ON T1.id_muc_nhap_cua_nhat_ky_loi = T2.id_muc_nhap_cua_nhat_ky_loi GROUP BY T1.id_muc_nhap_cua_nhat_ky_loi ORDER BY COUNT(*) DESC LIMIT 1
SELECT ky_nang.id_ky_nang, ky_nang.mo_ta_ve_ky_nang FROM ky_nang JOIN ky_nang_can_de_sua_chua ON ky_nang.id_ky_nang = ky_nang_can_de_sua_chua.id_ky_nang GROUP BY ky_nang.id_ky_nang ORDER BY COUNT(DISTINCT ky_nang_can_de_sua_chua.id_bo_phan_bi_loi) DESC LIMIT 1
SELECT DISTINCT mau_ma_tai_san FROM tai_san
SELECT thuong_hieu_tai_san, mau_ma_tai_san, chi_tiet_tai_san FROM tai_san ORDER BY ngay_thanh_ly_tai_san ASC
SELECT id_bo_phan, so_tien_phai_tra FROM bo_phan ORDER BY so_tien_phai_tra ASC LIMIT 1
SELECT T2.ten_cong_ty FROM hop_dong_bao_tri AS T1 JOIN cong_ty_ben_thu_ba AS T2 ON T1.id_hop_dong_bao_tri_cua_cong_ty = T2.id_cong_ty ORDER BY T1.ngay_bat_dau_hop_dong ASC LIMIT 1
SELECT ten_cong_ty FROM cong_ty_ben_thu_ba JOIN hop_dong_bao_tri ON cong_ty_ben_thu_ba.id_cong_ty = hop_dong_bao_tri.id_hop_dong_bao_tri_cua_cong_ty ORDER BY hop_dong_bao_tri.ngay_ket_thuc_hop_dong DESC LIMIT 1
SELECT gioi_tinh FROM nhan_vien GROUP BY gioi_tinh ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_nhan_vien , COUNT(DISTINCT T2.id_ky_su) FROM nhan_vien AS T1 JOIN chuyen_tham_cua_ky_su AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien_lien_lac GROUP BY T1.id_nhan_vien
SELECT mau_ma_tai_san FROM tai_san WHERE id_tai_san NOT IN (SELECT id_tai_san FROM nhat_ky_loi)
SELECT COUNT(*) FROM sach
SELECT tac_gia FROM sach ORDER BY tac_gia ASC
SELECT sach.tieu_de FROM sach ORDER BY sach.so_luong_phat_hanh ASC
SELECT tieu_de FROM sach WHERE tac_gia != 'Elaine Lee'
SELECT sach.tieu_de, sach.so_luong_phat_hanh FROM sach
SELECT an_pham.ngay_xuat_ban FROM sach JOIN an_pham ON sach.id_sach = an_pham.id_sach ORDER BY an_pham.gia_ban DESC
SELECT DISTINCT an_pham.nha_xuat_ban FROM an_pham WHERE an_pham.gia_ban > 5000000
SELECT nha_xuat_ban FROM an_pham ORDER BY gia_ban DESC LIMIT 1
SELECT ngay_xuat_ban FROM an_pham ORDER BY gia_ban ASC LIMIT 3
SELECT sach.tieu_de, an_pham.ngay_xuat_ban FROM sach JOIN an_pham ON sach.id_sach = an_pham.id_sach
SELECT sach.tac_gia FROM sach JOIN an_pham ON sach.id_sach = an_pham.id_sach WHERE an_pham.gia_ban > 4000000
SELECT sach.tieu_de FROM sach JOIN an_pham ON sach.id_sach = an_pham.id_sach ORDER BY an_pham.gia_ban DESC
SELECT nha_xuat_ban FROM an_pham GROUP BY nha_xuat_ban HAVING COUNT(*) > 1
SELECT an_pham.nha_xuat_ban , COUNT ( * ) FROM an_pham GROUP BY an_pham.nha_xuat_ban
SELECT ngay_xuat_ban FROM an_pham GROUP BY ngay_xuat_ban ORDER BY COUNT(*) DESC LIMIT 1
SELECT tac_gia FROM sach GROUP BY tac_gia HAVING COUNT(*) > 1
SELECT tieu_de FROM sach WHERE id_sach NOT IN (SELECT id_sach FROM an_pham)
SELECT nha_xuat_ban FROM an_pham WHERE gia_ban > 10000000 INTERSECT SELECT nha_xuat_ban FROM an_pham WHERE gia_ban < 5000000
SELECT COUNT(DISTINCT ngay_xuat_ban) FROM an_pham
SELECT COUNT(DISTINCT ngay_xuat_ban) FROM an_pham
SELECT gia_ban FROM an_pham WHERE nha_xuat_ban = 'Person' OR nha_xuat_ban = 'Wiley'
SELECT ten_bo_phan FROM bo_phan ORDER BY ngay_bat_dau_quan_ly ASC
SELECT ten_nguoi_phu_thuoc FROM nguoi_phu_thuoc WHERE moi_quan_he IN ('vợ', 'chồng')
SELECT COUNT(*) FROM nguoi_phu_thuoc WHERE gioi_tinh = 'Nữ'
SELECT bo_phan.ten_bo_phan FROM bo_phan JOIN dia_diem_cua_bo_phan ON bo_phan.ma_so_bo_phan = dia_diem_cua_bo_phan.ma_so_bo_phan WHERE dia_diem_cua_bo_phan.dia_diem_bo_phan = 'Houston'
SELECT ho, ten FROM nhan_vien WHERE luong > 30000
SELECT gioi_tinh, COUNT(*) FROM nhan_vien WHERE luong < 50000 GROUP BY gioi_tinh
SELECT ten, ho, dia_chi FROM nhan_vien ORDER BY ngay_sinh ASC
SELECT COUNT(*) FROM giao_vien
SELECT COUNT(*) FROM giao_vien
SELECT ten FROM giao_vien ORDER BY tuoi ASC
SELECT ten FROM giao_vien ORDER BY tuoi ASC
SELECT tuoi, que_quan FROM giao_vien
SELECT tuoi, que_quan FROM giao_vien
SELECT ten FROM giao_vien WHERE que_quan != 'Khu đô thị Little Lever'
SELECT ten FROM giao_vien WHERE que_quan != 'Khu đô thị Little Lever'
SELECT ten FROM giao_vien WHERE tuoi = '32' OR tuoi = '33'
SELECT ten FROM giao_vien WHERE tuoi = '32' OR tuoi = '33'
SELECT que_quan FROM giao_vien ORDER BY tuoi ASC LIMIT 1
SELECT que_quan FROM giao_vien ORDER BY tuoi ASC LIMIT 1
SELECT que_quan, COUNT(*) FROM giao_vien GROUP BY que_quan
SELECT que_quan, COUNT(*) FROM giao_vien GROUP BY que_quan
SELECT que_quan FROM giao_vien GROUP BY que_quan ORDER BY COUNT(*) DESC LIMIT 1
SELECT que_quan FROM giao_vien GROUP BY que_quan ORDER BY COUNT(*) DESC LIMIT 1
SELECT que_quan FROM giao_vien GROUP BY que_quan HAVING COUNT(*) >= 2
SELECT que_quan FROM giao_vien GROUP BY que_quan HAVING COUNT(*) >= 2
SELECT giao_vien.ten, khoa_hoc.khoa_hoc FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien JOIN khoa_hoc ON sap_xep_khoa_hoc.id_khoa_hoc = khoa_hoc.id_khoa_hoc
SELECT giao_vien.ten, khoa_hoc.khoa_hoc FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien JOIN khoa_hoc ON sap_xep_khoa_hoc.id_khoa_hoc = khoa_hoc.id_khoa_hoc
SELECT T1.ten, T3.khoa_hoc FROM giao_vien AS T1 JOIN sap_xep_khoa_hoc AS T2 ON T1.id_giao_vien = T2.id_giao_vien JOIN khoa_hoc AS T3 ON T2.id_khoa_hoc = T3.id_khoa_hoc ORDER BY T1.ten ASC
SELECT giao_vien.ten, khoa_hoc.khoa_hoc FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien JOIN khoa_hoc ON sap_xep_khoa_hoc.id_khoa_hoc = khoa_hoc.id_khoa_hoc ORDER BY giao_vien.ten ASC
SELECT giao_vien.ten FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien JOIN khoa_hoc ON sap_xep_khoa_hoc.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.khoa_hoc = 'Toán'
SELECT giao_vien.ten FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien JOIN khoa_hoc ON sap_xep_khoa_hoc.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.khoa_hoc = 'Toán'
SELECT giao_vien.ten , COUNT ( * ) FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien GROUP BY giao_vien.id_giao_vien
SELECT giao_vien.ten , COUNT(*) FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien GROUP BY giao_vien.id_giao_vien
SELECT T1.ten FROM giao_vien AS T1 JOIN sap_xep_khoa_hoc AS T2 ON T1.id_giao_vien = T2.id_giao_vien GROUP BY T1.id_giao_vien HAVING COUNT(*) >= 2
SELECT giao_vien.ten FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien GROUP BY giao_vien.id_giao_vien HAVING COUNT(*) >= 2
SELECT ten FROM giao_vien WHERE id_giao_vien NOT IN (SELECT id_giao_vien FROM sap_xep_khoa_hoc)
SELECT ten FROM giao_vien WHERE id_giao_vien NOT IN (SELECT id_giao_vien FROM sap_xep_khoa_hoc)
SELECT COUNT(*) FROM thanh_vien
SELECT ten FROM thanh_vien ORDER BY ten ASC
SELECT ten, quoc_gia FROM thanh_vien
SELECT ten FROM thanh_vien WHERE quoc_gia = 'Hoa Kỳ' OR quoc_gia = 'Canada'
SELECT quoc_gia , COUNT ( * ) FROM thanh_vien GROUP BY quoc_gia
SELECT quoc_gia FROM thanh_vien GROUP BY quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_gia FROM thanh_vien GROUP BY quoc_gia HAVING COUNT(*) > 2
SELECT ten_lanh_dao, dia_diem_truong_dai_hoc FROM truong_dai_hoc
SELECT thanh_vien.ten, truong_dai_hoc.ten FROM thanh_vien JOIN truong_dai_hoc ON thanh_vien.id_dai_hoc = truong_dai_hoc.id_dai_hoc
SELECT thanh_vien.ten, truong_dai_hoc.dia_diem_truong_dai_hoc FROM thanh_vien JOIN truong_dai_hoc ON thanh_vien.id_dai_hoc = truong_dai_hoc.id_dai_hoc ORDER BY thanh_vien.ten ASC
SELECT truong_dai_hoc.ten_lanh_dao FROM truong_dai_hoc JOIN thanh_vien ON truong_dai_hoc.id_dai_hoc = thanh_vien.id_dai_hoc WHERE thanh_vien.quoc_gia = 'Canada'
SELECT thanh_vien.ten, vong.chu_de_trang_tri FROM thanh_vien JOIN vong ON thanh_vien.id_thanh_vien = vong.id_thanh_vien
SELECT ten FROM thanh_vien JOIN vong ON thanh_vien.id_thanh_vien = vong.id_thanh_vien WHERE xep_hang_tung_vong > 3
SELECT ten FROM thanh_vien JOIN vong ON thanh_vien.id_thanh_vien = vong.id_thanh_vien ORDER BY vong.xep_hang_tung_vong ASC
SELECT ten FROM thanh_vien WHERE id_thanh_vien NOT IN (SELECT id_thanh_vien FROM vong)
SELECT COUNT(*) FROM cuoc_bau_cu
SELECT so_luong_phieu_bau FROM cuoc_bau_cu ORDER BY so_luong_phieu_bau DESC
SELECT ngay, ti_le_phieu_bau FROM cuoc_bau_cu
SELECT MIN(ti_le_phieu_bau), MAX(ti_le_phieu_bau) FROM cuoc_bau_cu
SELECT ten, dang FROM dai_dien
SELECT ten FROM dai_dien WHERE dang != 'Đảng Cộng hoà'
SELECT tuoi_tho FROM dai_dien WHERE tieu_bang = 'New York' OR tieu_bang = 'Indiana'
SELECT dai_dien.ten, cuoc_bau_cu.ngay FROM dai_dien JOIN cuoc_bau_cu ON dai_dien.id_dai_dien = cuoc_bau_cu.id_dai_dien
SELECT T1.ten FROM dai_dien AS T1 JOIN cuoc_bau_cu AS T2 ON T1.id_dai_dien = T2.id_dai_dien WHERE T2.so_luong_phieu_bau > 10000
SELECT ten FROM dai_dien JOIN cuoc_bau_cu ON dai_dien.id_dai_dien = cuoc_bau_cu.id_dai_dien ORDER BY SUM(cuoc_bau_cu.so_luong_phieu_bau) DESC
SELECT T1.dang FROM dai_dien AS T1 JOIN cuoc_bau_cu AS T2 ON T1.id_dai_dien = T2.id_dai_dien GROUP BY T1.id_dai_dien ORDER BY SUM(T2.so_luong_phieu_bau) ASC LIMIT 1
SELECT dai_dien.tuoi_tho FROM dai_dien JOIN cuoc_bau_cu ON dai_dien.id_dai_dien = cuoc_bau_cu.id_dai_dien ORDER BY cuoc_bau_cu.ti_le_phieu_bau DESC
SELECT AVG(T1.so_luong_phieu_bau) FROM cuoc_bau_cu AS T1 JOIN dai_dien AS T2 ON T1.id_dai_dien = T2.id_dai_dien WHERE T2.dang = 'Cộng hoà'
SELECT dang , COUNT(*) FROM dai_dien GROUP BY dang
SELECT dang FROM dai_dien GROUP BY dang ORDER BY COUNT(*) DESC LIMIT 1
SELECT dang, COUNT(*) FROM dai_dien GROUP BY dang HAVING COUNT(*) >= 3
SELECT ten FROM dai_dien GROUP BY ten HAVING COUNT(*) >= 2
SELECT ten FROM dai_dien WHERE id_dai_dien NOT IN (SELECT id_dai_dien FROM cuoc_bau_cu)
SELECT dang FROM dai_dien WHERE tieu_bang = 'New York' INTERSECT SELECT dang FROM dai_dien WHERE tieu_bang = 'Pennsylvania'
SELECT COUNT(DISTINCT dang) FROM dai_dien
SELECT COUNT(*) FROM quoc_gia
SELECT COUNT(*) FROM quoc_gia
SELECT quoc_gia.ten_quoc_gia, quoc_gia.thu_do FROM quoc_gia
SELECT ten_quoc_gia, thu_do FROM quoc_gia
SELECT ngon_ngu_ban_dia_chinh_thuc FROM quoc_gia WHERE ngon_ngu_ban_dia_chinh_thuc LIKE '%tiếng Anh%'
SELECT ngon_ngu_ban_dia_chinh_thuc FROM quoc_gia WHERE ngon_ngu_ban_dia_chinh_thuc LIKE '%tiếng Anh%'
SELECT DISTINCT vi_tri FROM tran_dau_trong_mua_giai
SELECT DISTINCT vi_tri FROM tran_dau_trong_mua_giai
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.doi = tran_dau_trong_mua_giai.doi WHERE tran_dau_trong_mua_giai.truong_dai_hoc = 'UCLA'
SELECT cau_thu FROM tran_dau_trong_mua_giai WHERE truong_dai_hoc = 'UCLA'
SELECT DISTINCT vi_tri FROM tran_dau_trong_mua_giai WHERE truong_dai_hoc IN ('UCLA', 'Duke')
SELECT vi_tri FROM tran_dau_trong_mua_giai WHERE truong_dai_hoc IN ('UCLA', 'Duke')
SELECT ma_so_tuyen_chon_tan_binh, mua_tuyen_chon FROM tran_dau_trong_mua_giai WHERE vi_tri = 'hậu vệ'
SELECT tran_dau_trong_mua_giai.ma_so_tuyen_chon_tan_binh , tran_dau_trong_mua_giai.mua_tuyen_chon FROM tran_dau_trong_mua_giai JOIN cau_thu ON tran_dau_trong_mua_giai.cau_thu = cau_thu.cau_thu WHERE tran_dau_trong_mua_giai.vi_tri = 'hậu vệ'
SELECT COUNT(DISTINCT doi) FROM tran_dau_trong_mua_giai
SELECT COUNT(DISTINCT doi) FROM tran_dau_trong_mua_giai
SELECT cau_thu.cau_thu , cau_thu.so_nam_da_choi FROM cau_thu
SELECT cau_thu.cau_thu , cau_thu.so_nam_da_choi FROM cau_thu
SELECT ten FROM doi
SELECT ten FROM doi
SELECT tran_dau_trong_mua_giai.mua_giai, tran_dau_trong_mua_giai.cau_thu, quoc_gia.ten_quoc_gia FROM tran_dau_trong_mua_giai JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia
SELECT cau_thu.cau_thu , tran_dau_trong_mua_giai.mua_giai , quoc_gia.ten_quoc_gia FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.ten_quoc_gia = 'Indonesia'
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.ten_quoc_gia = 'Indonesia'
SELECT DISTINCT tran_dau_trong_mua_giai.vi_tri FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.doi = tran_dau_trong_mua_giai.doi JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.thu_do = 'Dublin'
SELECT DISTINCT vi_tri FROM tran_dau_trong_mua_giai JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.thu_do = 'Dublin'
SELECT quoc_gia.ngon_ngu_ban_dia_chinh_thuc FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia WHERE tran_dau_trong_mua_giai.truong_dai_hoc IN ('Maryland', 'Duke')
SELECT quoc_gia.ngon_ngu_ban_dia_chinh_thuc FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia WHERE tran_dau_trong_mua_giai.truong_dai_hoc IN ('Maryland', 'Duke')
SELECT COUNT(DISTINCT quoc_gia.ngon_ngu_ban_dia_chinh_thuc) FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia WHERE tran_dau_trong_mua_giai.vi_tri = 'hậu vệ'
SELECT COUNT(DISTINCT quoc_gia.ngon_ngu_ban_dia_chinh_thuc) FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia WHERE tran_dau_trong_mua_giai.vi_tri = 'hậu vệ'
SELECT tran_dau_trong_mua_giai.mua_giai, cau_thu.cau_thu, doi.ten FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN doi ON cau_thu.doi = doi.id_doi
SELECT cau_thu.cau_thu , tran_dau_trong_mua_giai.mua_giai , doi.ten FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi
SELECT vi_tri FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi WHERE doi.ten = 'Ryley Goldner'
SELECT tran_dau_trong_mua_giai.vi_tri FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi WHERE doi.ten = 'Ryley Goldner'
SELECT COUNT(DISTINCT truong_dai_hoc) FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi WHERE doi.ten = 'Columbus Crew'
SELECT COUNT(DISTINCT tran_dau_trong_mua_giai.truong_dai_hoc) FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi WHERE doi.ten = 'Columbus Crew'
SELECT cau_thu.cau_thu , cau_thu.so_nam_da_choi FROM cau_thu JOIN doi ON cau_thu.doi = doi.id_doi WHERE doi.ten = 'Columbus Crew'
SELECT cau_thu.cau_thu , cau_thu.so_nam_da_choi FROM cau_thu JOIN doi ON cau_thu.doi = doi.id_doi WHERE doi.ten = 'Columbus Crew'
SELECT vi_tri, COUNT(*) FROM tran_dau_trong_mua_giai GROUP BY vi_tri
SELECT vi_tri, COUNT(DISTINCT cau_thu) FROM tran_dau_trong_mua_giai GROUP BY vi_tri
SELECT quoc_gia.ten_quoc_gia, COUNT(tran_dau_trong_mua_giai.cau_thu) FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia GROUP BY quoc_gia.id_quoc_gia
SELECT quoc_gia.ten_quoc_gia , COUNT(cau_thu.cau_thu) FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia GROUP BY quoc_gia.ten_quoc_gia
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu ORDER BY tran_dau_trong_mua_giai.truong_dai_hoc ASC
SELECT cau_thu.cau_thu , tran_dau_trong_mua_giai.truong_dai_hoc FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu ORDER BY tran_dau_trong_mua_giai.truong_dai_hoc ASC
SELECT vi_tri FROM tran_dau_trong_mua_giai GROUP BY vi_tri ORDER BY COUNT(*) DESC LIMIT 1
SELECT vi_tri FROM tran_dau_trong_mua_giai GROUP BY vi_tri ORDER BY COUNT(*) DESC LIMIT 1
SELECT truong_dai_hoc, COUNT(*) AS so_luong_cau_thu FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc ORDER BY so_luong_cau_thu DESC LIMIT 3
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc ORDER BY COUNT(*) DESC LIMIT 3
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc HAVING COUNT(*) >= 2
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc HAVING COUNT(*) >= 2
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc HAVING COUNT(*) >= 2 ORDER BY truong_dai_hoc DESC
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc HAVING COUNT(*) >= 2 ORDER BY truong_dai_hoc DESC
SELECT ten FROM doi WHERE id_doi NOT IN (SELECT doi FROM tran_dau_trong_mua_giai)
SELECT ten FROM doi WHERE id_doi NOT IN (SELECT doi FROM tran_dau_trong_mua_giai)
SELECT quoc_gia.ten_quoc_gia FROM tran_dau_trong_mua_giai JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE tran_dau_trong_mua_giai.vi_tri = 'tiền đạo' INTERSECT SELECT quoc_gia.ten_quoc_gia FROM tran_dau_trong_mua_giai JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE tran_dau_trong_mua_giai.vi_tri = 'hậu vệ'
SELECT ten_quoc_gia FROM quoc_gia WHERE id_quoc_gia IN (SELECT quoc_gia FROM tran_dau_trong_mua_giai WHERE vi_tri = 'tiền đạo') INTERSECT SELECT ten_quoc_gia FROM quoc_gia WHERE id_quoc_gia IN (SELECT quoc_gia FROM tran_dau_trong_mua_giai WHERE vi_tri = 'hậu vệ')
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai WHERE vi_tri = 'tiền vệ' INTERSECT SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai WHERE vi_tri = 'hậu vệ'
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc HAVING SUM(CASE WHEN vi_tri = 'tiền vệ' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN vi_tri = 'hậu vệ' THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM toi_pham
SELECT ngay FROM toi_pham ORDER BY so_nguoi_bi_giet DESC
SELECT so_nguoi_bi_thuong FROM toi_pham ORDER BY so_nguoi_bi_thuong ASC
SELECT AVG(so_nguoi_bi_thuong) FROM toi_pham
SELECT T1.que_quan FROM ca_nhan AS T1 JOIN toi_pham AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan GROUP BY T1.id_ca_nhan HAVING SUM(T2.so_nguoi_bi_giet) = (SELECT MAX(kills) FROM (SELECT SUM(so_nguoi_bi_giet) AS kills FROM toi_pham GROUP BY id_ca_nhan) AS sub)
SELECT ten FROM ca_nhan ORDER BY chieu_cao ASC
SELECT ca_nhan.ten FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan
SELECT ten FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan WHERE toi_pham.quoc_gia != 'Trung Quốc'
SELECT ten FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan ORDER BY can_nang DESC LIMIT 1
SELECT COUNT(*) FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan WHERE ca_nhan.chieu_cao > 1.84
SELECT ca_nhan.ten FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan WHERE toi_pham.quoc_gia IN ('Trung Quốc', 'Nhật Bản')
SELECT ca_nhan.chieu_cao FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan GROUP BY ca_nhan.id_ca_nhan ORDER BY SUM(toi_pham.so_nguoi_bi_thuong) DESC
SELECT toi_pham.quoc_gia , COUNT ( * ) FROM toi_pham GROUP BY toi_pham.quoc_gia
SELECT quoc_gia FROM toi_pham GROUP BY quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_gia FROM toi_pham GROUP BY quoc_gia HAVING COUNT(*) >= 2
SELECT ca_nhan.ten FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan ORDER BY toi_pham.nam DESC
SELECT ten FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM toi_pham)
SELECT quoc_gia FROM toi_pham WHERE so_nguoi_bi_thuong > 50 GROUP BY quoc_gia INTERSECT SELECT quoc_gia FROM toi_pham WHERE so_nguoi_bi_thuong < 20 GROUP BY quoc_gia
SELECT COUNT(DISTINCT dia_diem) FROM toi_pham
SELECT toi_pham.ngay FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan ORDER BY ca_nhan.chieu_cao DESC LIMIT 1
SELECT nam FROM toi_pham ORDER BY nam DESC LIMIT 1
SELECT nha_ga.chinh_quyen_dia_phuong , nha_ga.dich_vu FROM nha_ga
SELECT so_hieu_tau, ten FROM tau_hoa ORDER BY thoi_gian ASC
SELECT so_hieu_tau , thoi_gian FROM tau_hoa WHERE diem_den = 'Chennai' ORDER BY thoi_gian ASC
SELECT COUNT(*) FROM tau_hoa WHERE ten LIKE '%Tốc hành%'
SELECT so_hieu_tau , thoi_gian FROM tau_hoa WHERE diem_khoi_hanh = 'Chennai' AND diem_den = 'Guruvayur'
SELECT tau_hoa.diem_khoi_hanh, COUNT(*) FROM tau_hoa GROUP BY tau_hoa.diem_khoi_hanh
SELECT ten FROM tau_hoa JOIN lo_trinh ON tau_hoa.id = lo_trinh.id_tau GROUP BY tau_hoa.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT nha_ga.ten_mang_luoi, nha_ga.dich_vu, COUNT(DISTINCT lo_trinh.id_tau) FROM nha_ga JOIN lo_trinh ON nha_ga.id = lo_trinh.id_nha_ga GROUP BY nha_ga.id
SELECT ngay_trong_tuan , AVG(nhiet_do_cao) FROM thoi_tiet_hang_tuan GROUP BY ngay_trong_tuan
SELECT MAX(thoi_tiet_hang_tuan.nhiet_do_thap), AVG(thoi_tiet_hang_tuan.luong_mua) FROM thoi_tiet_hang_tuan JOIN nha_ga ON thoi_tiet_hang_tuan.id_nha_ga = nha_ga.id WHERE nha_ga.ten_mang_luoi = 'Amersham'
SELECT tau_hoa.ten , tau_hoa.thoi_gian FROM tau_hoa JOIN lo_trinh ON tau_hoa.id = lo_trinh.id_tau JOIN nha_ga ON lo_trinh.id_nha_ga = nha_ga.id WHERE nha_ga.chinh_quyen_dia_phuong = 'Chiltern'
SELECT COUNT(DISTINCT dich_vu) FROM nha_ga
SELECT nha_ga.id, nha_ga.chinh_quyen_dia_phuong FROM nha_ga JOIN thoi_tiet_hang_tuan ON nha_ga.id = thoi_tiet_hang_tuan.id_nha_ga GROUP BY nha_ga.id ORDER BY AVG(thoi_tiet_hang_tuan.nhiet_do_cao) DESC LIMIT 1
SELECT nha_ga.id, nha_ga.chinh_quyen_dia_phuong FROM nha_ga JOIN thoi_tiet_hang_tuan ON nha_ga.id = thoi_tiet_hang_tuan.id_nha_ga WHERE thoi_tiet_hang_tuan.luong_mua > 50
SELECT MIN(nhiet_do_thap) AS min_nhiet_do_thap, MAX(toc_do_gio_mph) AS max_toc_do_gio FROM thoi_tiet_hang_tuan
SELECT diem_khoi_hanh FROM tau_hoa GROUP BY diem_khoi_hanh HAVING COUNT(*) > 1
SELECT COUNT(*) FROM nha_tho WHERE ngay_mo_cua < 1850
SELECT nha_tho.ten, nha_tho.ngay_mo_cua, ca_nhan.ten FROM nha_tho JOIN ca_nhan ON nha_tho.duoc_to_chuc_boi = ca_nhan.id_ca_nhan
SELECT ten FROM nha_tho ORDER BY ngay_mo_cua DESC
SELECT ngay_mo_cua FROM nha_tho GROUP BY ngay_mo_cua HAVING COUNT(*) >= 2
SELECT ca_nhan.ten, nha_tho.ten FROM nha_tho JOIN ca_nhan ON nha_tho.duoc_to_chuc_boi = ca_nhan.id_ca_nhan WHERE nha_tho.ngay_mo_cua BETWEEN 1830 AND 1840
SELECT ngay_mo_cua , COUNT ( * ) FROM nha_tho GROUP BY ngay_mo_cua
SELECT ten, ngay_mo_cua FROM nha_tho ORDER BY ngay_mo_cua DESC LIMIT 3
SELECT COUNT(*) FROM ca_nhan WHERE la_nam_hay_nu = 'nữ' AND tuoi > 30
SELECT quoc_gia FROM ca_nhan WHERE tuoi > 30 GROUP BY quoc_gia INTERSECT SELECT quoc_gia FROM ca_nhan WHERE tuoi < 25 GROUP BY quoc_gia
SELECT MIN(tuoi), MAX(tuoi), AVG(tuoi) FROM ca_nhan
SELECT ten, quoc_gia FROM ca_nhan WHERE tuoi < (SELECT AVG(tuoi) FROM ca_nhan)
SELECT T2.ten , T3.ten FROM le_cuoi AS T1 JOIN ca_nhan AS T2 ON T1.id_nam = T2.id_ca_nhan JOIN ca_nhan AS T3 ON T1.id_nu = T3.id_ca_nhan JOIN nha_tho AS T4 ON T1.id_nha_tho = T4.id_nha_tho WHERE T4.ngay_mo_cua > 2014
SELECT ten, tuoi FROM ca_nhan WHERE la_nam_hay_nu = 'nam' AND id_ca_nhan NOT IN (SELECT CAST(duoc_to_chuc_boi AS INTEGER) FROM nha_tho WHERE id_nha_tho IN (SELECT id_nha_tho FROM le_cuoi))
SELECT nha_tho.ten FROM nha_tho WHERE nha_tho.id_nha_tho NOT IN (SELECT le_cuoi.id_nha_tho FROM le_cuoi WHERE le_cuoi.ngay_mo_cua = 2015)
SELECT T1.ten FROM nha_tho AS T1 JOIN le_cuoi AS T2 ON T1.id_nha_tho = T2.id_nha_tho GROUP BY T1.id_nha_tho HAVING COUNT(*) >= 2
SELECT T1.ten FROM ca_nhan AS T1 JOIN le_cuoi AS T2 ON T1.id_ca_nhan = T2.id_nu JOIN nha_tho AS T3 ON T2.id_nha_tho = T3.id_nha_tho WHERE T1.quoc_gia = 'Canada' AND T1.la_nam_hay_nu = 'nu' AND T3.ngay_mo_cua = 2016
SELECT COUNT(*) FROM le_cuoi JOIN nha_tho ON le_cuoi.id_nha_tho = nha_tho.id_nha_tho WHERE nha_tho.ngay_mo_cua BETWEEN 20160101 AND 20161231
SELECT nha_tho.ten FROM nha_tho JOIN le_cuoi ON nha_tho.id_nha_tho = le_cuoi.id_nha_tho JOIN ca_nhan AS ca_nhan_1 ON le_cuoi.id_nam = ca_nhan_1.id_ca_nhan JOIN ca_nhan AS ca_nhan_2 ON le_cuoi.id_nu = ca_nhan_2.id_ca_nhan WHERE ca_nhan_1.tuoi > 30 AND ca_nhan_2.tuoi > 30
SELECT ca_nhan.quoc_gia, COUNT(*) FROM ca_nhan GROUP BY ca_nhan.quoc_gia
SELECT COUNT(*) FROM nha_tho JOIN le_cuoi ON nha_tho.id_nha_tho = le_cuoi.id_nha_tho WHERE le_cuoi.ngay_mo_cua = 2016
SELECT COUNT(*) FROM giang_vien
SELECT COUNT(*) FROM giang_vien
SELECT ngach FROM giang_vien
SELECT ngach FROM giang_vien
SELECT DISTINCT toa_nha FROM giang_vien
SELECT DISTINCT toa_nha FROM giang_vien
SELECT ho, ten, ngach FROM giang_vien
SELECT ho , ten , ngach FROM giang_vien
SELECT ho , ten , so_dien_thoai FROM giang_vien WHERE gioi_tinh = 'nữ'
SELECT ho , ten , so_dien_thoai FROM giang_vien WHERE gioi_tinh = 'nữ'
SELECT id_giang_vien FROM giang_vien WHERE gioi_tinh = 'nam'
SELECT id_giang_vien FROM giang_vien WHERE gioi_tinh = 'nam'
SELECT COUNT(*) FROM giang_vien WHERE gioi_tinh = 'nữ' AND ngach = 'Giáo sư'
SELECT COUNT(*) FROM giang_vien WHERE ngach = 'Giáo sư' AND gioi_tinh = 'nữ'
SELECT so_dien_thoai , so_phong , toa_nha FROM giang_vien WHERE ho = 'Prince' AND ten = 'Jerry'
SELECT so_phong, toa_nha, so_dien_thoai FROM giang_vien WHERE ho = 'Prince' AND ten = 'Jerry'
SELECT COUNT(*) FROM giang_vien WHERE toa_nha = 'NEB'
SELECT COUNT(*) FROM giang_vien WHERE toa_nha = 'NEB'
SELECT ho, ten FROM giang_vien
SELECT ho , ten FROM giang_vien
SELECT toa_nha , COUNT ( * ) FROM giang_vien GROUP BY toa_nha
SELECT toa_nha , COUNT ( * ) FROM giang_vien GROUP BY toa_nha
SELECT toa_nha FROM giang_vien GROUP BY toa_nha ORDER BY COUNT(*) DESC LIMIT 1
SELECT toa_nha FROM giang_vien GROUP BY toa_nha ORDER BY COUNT(*) DESC LIMIT 1
SELECT toa_nha FROM giang_vien GROUP BY toa_nha HAVING COUNT(*) >= 10
SELECT toa_nha FROM giang_vien GROUP BY toa_nha HAVING COUNT(*) >= 10
SELECT ngach, COUNT(*) FROM giang_vien GROUP BY ngach
SELECT ngach, COUNT(*) FROM giang_vien GROUP BY ngach
SELECT ngach, COUNT(CASE WHEN gioi_tinh = 'nam' THEN 1 END) AS nam_count, COUNT(CASE WHEN gioi_tinh = 'nữ' THEN 1 END) AS nu_count FROM giang_vien GROUP BY ngach
SELECT ngach, gioi_tinh, COUNT(*) AS so_luong FROM giang_vien GROUP BY ngach, gioi_tinh
SELECT ngach FROM giang_vien GROUP BY ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT ngach FROM giang_vien GROUP BY ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT gioi_tinh, COUNT(*) FROM giang_vien WHERE ngach = 'Trợ lý giáo sư' GROUP BY gioi_tinh
SELECT gioi_tinh, COUNT(*) FROM giang_vien WHERE ngach = 'Trợ lý giáo sư' GROUP BY gioi_tinh
SELECT giang_vien.ho, giang_vien.ten FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien WHERE sinh_vien.ho = 'Smith' AND sinh_vien.ten = 'Linda'
SELECT ho , ten FROM sinh_vien WHERE id_sinh_vien = (SELECT co_van FROM sinh_vien WHERE ho = 'Linda' AND ten = 'Smith')
SELECT id_sinh_vien FROM sinh_vien WHERE co_van = 'Giáo sư'
SELECT id_sinh_vien FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien WHERE giang_vien.ngach = 'Giáo sư'
SELECT sinh_vien.ho, sinh_vien.ten FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien WHERE giang_vien.ho = 'Micheal' AND giang_vien.ten = 'Goodrich'
SELECT sinh_vien.ho, sinh_vien.ten FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien WHERE giang_vien.ho = 'Goodrich' AND giang_vien.ten = 'Micheal'
SELECT T1.id_giang_vien , COUNT ( * ) FROM giang_vien AS T1 LEFT JOIN giang_vien_tham_gia_vao AS T2 ON T1.id_giang_vien = T2.id_giang_vien LEFT JOIN hoat_dong AS T3 ON T2.id_hoat_dong = T3.id_hoat_dong LEFT JOIN tham_gia_vao AS T4 ON T3.id_hoat_dong = T4.id_hoat_dong LEFT JOIN sinh_vien AS T5 ON T4.id_sinh_vien = T5.id_sinh_vien GROUP BY T1.id_giang_vien
SELECT giang_vien.id_giang_vien , COUNT ( * ) FROM giang_vien JOIN sinh_vien ON sinh_vien.co_van = giang_vien.id_giang_vien GROUP BY giang_vien.id_giang_vien
SELECT giang_vien.ngach, COUNT(*) FROM giang_vien JOIN sinh_vien ON giang_vien.id_giang_vien = sinh_vien.co_van GROUP BY giang_vien.ngach
SELECT COUNT(*) FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien GROUP BY giang_vien.ngach
SELECT giang_vien.ho , giang_vien.ten FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT giang_vien.ho , giang_vien.ten FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT giang_vien.id_giang_vien FROM giang_vien JOIN sinh_vien ON sinh_vien.co_van = giang_vien.id_giang_vien GROUP BY giang_vien.id_giang_vien HAVING COUNT(*) >= 2
SELECT giang_vien.id_giang_vien FROM giang_vien JOIN sinh_vien ON giang_vien.id_giang_vien = sinh_vien.co_van GROUP BY giang_vien.id_giang_vien HAVING COUNT(*) >= 2
SELECT id_giang_vien FROM giang_vien WHERE id_giang_vien NOT IN (SELECT co_van FROM sinh_vien)
SELECT id_giang_vien FROM giang_vien WHERE id_giang_vien NOT IN (SELECT co_van FROM sinh_vien)
SELECT ten_hoat_dong FROM hoat_dong
SELECT id_hoat_dong, ten_hoat_dong FROM hoat_dong
SELECT COUNT(*) FROM hoat_dong
SELECT COUNT(*) FROM hoat_dong
SELECT COUNT(DISTINCT id_giang_vien) FROM giang_vien_tham_gia_vao
SELECT COUNT(DISTINCT giang_vien_tham_gia_vao.id_giang_vien) FROM giang_vien_tham_gia_vao JOIN giang_vien ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien
SELECT id_giang_vien FROM giang_vien WHERE id_giang_vien NOT IN (SELECT id_giang_vien FROM giang_vien_tham_gia_vao)
SELECT id_giang_vien FROM giang_vien WHERE id_giang_vien NOT IN (SELECT id_giang_vien FROM giang_vien_tham_gia_vao)
SELECT id_giang_vien FROM giang_vien_tham_gia_vao INTERSECT SELECT co_van FROM sinh_vien
SELECT giang_vien.id_giang_vien FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien WHERE giang_vien.id_giang_vien IN (SELECT co_van FROM sinh_vien)
SELECT COUNT(*) FROM sinh_vien AS T1 JOIN tham_gia_vao AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE T1.ho = 'Giuliano' AND T1.ten = 'Mark'
SELECT COUNT(DISTINCT tham_gia_vao.id_hoat_dong) FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien WHERE sinh_vien.ho = 'Mark' AND sinh_vien.ten = 'Giuliano'
SELECT hoat_dong.ten_hoat_dong FROM hoat_dong JOIN tham_gia_vao ON hoat_dong.id_hoat_dong = tham_gia_vao.id_hoat_dong JOIN sinh_vien ON tham_gia_vao.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Mark' AND sinh_vien.ten = 'Giuliano'
SELECT T1.ten_hoat_dong FROM hoat_dong AS T1 JOIN tham_gia_vao AS T2 ON T1.id_hoat_dong = T2.id_hoat_dong JOIN sinh_vien AS T3 ON T2.id_sinh_vien = T3.id_sinh_vien WHERE T3.ho = 'Mark' AND T3.ten = 'Giuliano'
SELECT giang_vien.ho , giang_vien.ten , COUNT(*) FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien GROUP BY giang_vien.id_giang_vien
SELECT T1.ho, T1.ten, COUNT(*) FROM giang_vien AS T1 JOIN giang_vien_tham_gia_vao AS T2 ON T1.id_giang_vien = T2.id_giang_vien WHERE T2.id_hoat_dong IS NOT NULL GROUP BY T1.id_giang_vien
SELECT hoat_dong.ten_hoat_dong , COUNT ( * ) FROM hoat_dong JOIN giang_vien_tham_gia_vao ON hoat_dong.id_hoat_dong = giang_vien_tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong
SELECT T1.ten_hoat_dong , COUNT ( * ) FROM hoat_dong AS T1 JOIN giang_vien_tham_gia_vao AS T2 ON T1.id_hoat_dong = T2.id_hoat_dong GROUP BY T1.id_hoat_dong
SELECT giang_vien.ho , giang_vien.ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ho , ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_hoat_dong FROM hoat_dong JOIN giang_vien_tham_gia_vao ON hoat_dong.id_hoat_dong = giang_vien_tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_hoat_dong FROM hoat_dong JOIN giang_vien_tham_gia_vao ON hoat_dong.id_hoat_dong = giang_vien_tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT id_sinh_vien FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM tham_gia_vao)
SELECT id_sinh_vien FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM tham_gia_vao)
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien WHERE sinh_vien.tuoi < 20
SELECT tham_gia_vao.id_hoat_dong FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien WHERE sinh_vien.tuoi < 20
SELECT sinh_vien.ho , sinh_vien.ten FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT sinh_vien.ho , sinh_vien.ten FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT ten_hoat_dong FROM hoat_dong JOIN tham_gia_vao ON hoat_dong.id_hoat_dong = tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT hoat_dong.ten_hoat_dong FROM hoat_dong JOIN tham_gia_vao ON hoat_dong.id_hoat_dong = tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ho, T1.ten FROM giang_vien AS T1 JOIN giang_vien_tham_gia_vao AS T2 ON T1.id_giang_vien = T2.id_giang_vien JOIN hoat_dong AS T3 ON T2.id_hoat_dong = T3.id_hoat_dong WHERE T3.ten_hoat_dong IN ('Bơi xuồng', 'Chèo thuyền Kayak')
SELECT giang_vien.ho , giang_vien.ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Bơi xuồng' OR hoat_dong.ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT ho, ten FROM giang_vien EXCEPT SELECT T1.ho, T1.ten FROM giang_vien AS T1 JOIN giang_vien_tham_gia_vao AS T2 ON T1.id_giang_vien = T2.id_giang_vien JOIN hoat_dong AS T3 ON T2.id_hoat_dong = T3.id_hoat_dong WHERE T3.ten_hoat_dong IN ('Bơi xuồng', 'Chèo thuyền Kayak')
SELECT ho, ten FROM giang_vien WHERE id_giang_vien NOT IN (SELECT giang_vien_tham_gia_vao.id_giang_vien FROM giang_vien_tham_gia_vao JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong IN ('Bơi xuồng', 'Chèo thuyền Kayak'))
SELECT t1.ho , t1.ten FROM giang_vien AS t1 JOIN giang_vien_tham_gia_vao AS t2 ON t1.id_giang_vien = t2.id_giang_vien JOIN hoat_dong AS t3 ON t2.id_hoat_dong = t3.id_hoat_dong WHERE t3.ten_hoat_dong = 'Bơi xuồng' INTERSECT SELECT t1.ho , t1.ten FROM giang_vien AS t1 JOIN giang_vien_tham_gia_vao AS t2 ON t1.id_giang_vien = t2.id_giang_vien JOIN hoat_dong AS t3 ON t2.id_hoat_dong = t3.id_hoat_dong WHERE t3.ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT T3.ho , T3.ten FROM giang_vien_tham_gia_vao T1 JOIN hoat_dong T2 ON T1.id_hoat_dong = T2.id_hoat_dong JOIN giang_vien T3 ON T1.id_giang_vien = T3.id_giang_vien WHERE T2.ten_hoat_dong = 'Bơi xuồng' INTERSECT SELECT T1.id_giang_vien FROM giang_vien_tham_gia_vao T1 JOIN hoat_dong T2 ON T1.id_hoat_dong = T2.id_hoat_dong JOIN giang_vien T3 ON T1.id_giang_vien = T3.id_giang_vien WHERE T2.ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT id_sinh_vien FROM tham_gia_vao JOIN hoat_dong ON tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE ten_hoat_dong = 'Bơi xuồng' INTERSECT SELECT id_sinh_vien FROM tham_gia_vao JOIN hoat_dong ON tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT id_sinh_vien FROM tham_gia_vao JOIN hoat_dong ON tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Bơi xuồng' INTERSECT SELECT id_sinh_vien FROM tham_gia_vao JOIN hoat_dong ON tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT COUNT(*) FROM nguoi_luyen_the_hinh
SELECT tong FROM nguoi_luyen_the_hinh ORDER BY tong ASC
SELECT cu_giat, cu_day FROM nguoi_luyen_the_hinh ORDER BY cu_giat ASC
SELECT AVG(cu_giat) FROM nguoi_luyen_the_hinh
SELECT cu_day FROM nguoi_luyen_the_hinh ORDER BY tong DESC LIMIT 1
SELECT ngay_sinh FROM ca_nhan ORDER BY chieu_cao ASC
SELECT ca_nhan.ten FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan
SELECT ca_nhan.ten FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan WHERE nguoi_luyen_the_hinh.tong > 300
SELECT ca_nhan.ten FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan ORDER BY ca_nhan.can_nang DESC LIMIT 1
SELECT ca_nhan.ngay_sinh, ca_nhan.noi_sinh FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan ORDER BY nguoi_luyen_the_hinh.tong DESC LIMIT 1
SELECT ca_nhan.chieu_cao FROM ca_nhan JOIN nguoi_luyen_the_hinh ON ca_nhan.id_ca_nhan = nguoi_luyen_the_hinh.id_ca_nhan WHERE nguoi_luyen_the_hinh.tong < 315
SELECT AVG(nguoi_luyen_the_hinh.tong) FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan WHERE ca_nhan.chieu_cao > 200
SELECT ca_nhan.ten FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan ORDER BY nguoi_luyen_the_hinh.tong DESC
SELECT noi_sinh, COUNT(*) FROM ca_nhan GROUP BY noi_sinh
SELECT noi_sinh FROM ca_nhan GROUP BY noi_sinh ORDER BY COUNT(*) DESC LIMIT 1
SELECT noi_sinh FROM ca_nhan GROUP BY noi_sinh HAVING COUNT(*) >= 2
SELECT ca_nhan.chieu_cao, ca_nhan.can_nang FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan ORDER BY ca_nhan.chieu_cao DESC
SELECT nguoi_luyen_the_hinh.id_nguoi_luyen_the_hinh, nguoi_luyen_the_hinh.id_ca_nhan, nguoi_luyen_the_hinh.cu_giat, nguoi_luyen_the_hinh.cu_day, nguoi_luyen_the_hinh.tong, ca_nhan.ten, ca_nhan.chieu_cao, ca_nhan.can_nang, ca_nhan.ngay_sinh, ca_nhan.no_i_sinh FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan
SELECT ten, noi_sinh FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM nguoi_luyen_the_hinh)
SELECT COUNT(DISTINCT noi_sinh) FROM ca_nhan
SELECT COUNT(*) FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM nguoi_luyen_the_hinh)
SELECT T2.can_nang FROM nguoi_luyen_the_hinh AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan WHERE T2.chieu_cao > 200 OR T1.cu_giat > 140
SELECT SUM(nguoi_luyen_the_hinh.tong) FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan WHERE MONTH(ca_nhan.ngay_sinh) = 1
SELECT MIN(cu_giat) FROM nguoi_luyen_the_hinh
SELECT COUNT(*) FROM ung_cu_vien
SELECT COUNT(*) FROM ung_cu_vien
SELECT nguon_tham_do_y_kien , COUNT ( * ) FROM ung_cu_vien GROUP BY nguon_tham_do_y_kien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT nguon_tham_do_y_kien FROM ung_cu_vien GROUP BY nguon_tham_do_y_kien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ty_le_ung_ho FROM ung_cu_vien ORDER BY ty_le_ung_ho DESC LIMIT 3
SELECT ty_le_ung_ho FROM ung_cu_vien ORDER BY ty_le_ung_ho DESC LIMIT 3
SELECT id_ung_cu_vien FROM ung_cu_vien ORDER BY ty_le_phan_doi ASC LIMIT 1
SELECT id_ung_cu_vien FROM ung_cu_vien ORDER BY ty_le_phan_doi ASC LIMIT 1
SELECT ty_le_ung_ho, ty_le_xem_xet, ty_le_phan_doi FROM ung_cu_vien ORDER BY ty_le_khong_chac_chan ASC
SELECT ty_le_ung_ho, ty_le_xem_xet, ty_le_phan_doi, ty_le_khong_chac_chan FROM ung_cu_vien ORDER BY ty_le_khong_chac_chan ASC
SELECT nguon_tham_do_y_kien, ty_le_phan_doi FROM ung_cu_vien ORDER BY ty_le_phan_doi DESC LIMIT 1
SELECT nguon_tham_do_y_kien FROM ung_cu_vien ORDER BY ty_le_phan_doi DESC LIMIT 1
SELECT ten FROM ca_nhan ORDER BY ngay_sinh ASC
SELECT ten FROM ca_nhan ORDER BY ngay_sinh ASC
SELECT AVG(chieu_cao), AVG(can_nang) FROM ca_nhan WHERE gioi_tinh = 'M'
SELECT AVG(chieu_cao), AVG(can_nang) FROM ca_nhan WHERE gioi_tinh = 'Nam'
SELECT ten FROM ca_nhan WHERE chieu_cao > 200 OR chieu_cao < 190
SELECT ten FROM ca_nhan WHERE chieu_cao > 200 OR chieu_cao < 190
SELECT gioi_tinh , AVG(can_nang) , MIN(can_nang) FROM ca_nhan GROUP BY gioi_tinh
SELECT AVG(can_nang), MIN(can_nang) FROM ca_nhan GROUP BY gioi_tinh
SELECT ca_nhan.ten, ca_nhan.gioi_tinh FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ca_nhan = ca_nhan.id_ca_nhan ORDER BY ung_cu_vien.ty_le_ung_ho DESC LIMIT 1
SELECT T2.ten , T2.gioi_tinh FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan ORDER BY T1.ty_le_ung_ho DESC LIMIT 1
SELECT ca_nhan.ten, MIN(ung_cu_vien.ty_le_phan_doi) AS min_phan_doi FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ca_nhan = ca_nhan.id_ca_nhan GROUP BY ca_nhan.gioi_tinh ORDER BY min_phan_doi ASC
SELECT ca_nhan.ten, ca_nhan.gioi_tinh FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ca_nhan = ca_nhan.id_ca_nhan GROUP BY ca_nhan.gioi_tinh ORDER BY ung_cu_vien.ty_le_phan_doi ASC LIMIT 1
SELECT ca_nhan.gioi_tinh FROM ca_nhan JOIN ung_cu_vien ON ca_nhan.id_ca_nhan = ung_cu_vien.id_ca_nhan GROUP BY ca_nhan.gioi_tinh ORDER BY AVG(ung_cu_vien.ty_le_khong_chac_chan) DESC LIMIT 1
SELECT ca_nhan.gioi_tinh FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ca_nhan = ca_nhan.id_ca_nhan GROUP BY ca_nhan.gioi_tinh ORDER BY AVG(ung_cu_vien.ty_le_khong_chac_chan) DESC LIMIT 1
SELECT ten FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM ung_cu_vien)
SELECT ten FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM ung_cu_vien)
SELECT T2.ten FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan WHERE T1.ty_le_ung_ho < T1.ty_le_phan_doi
SELECT T2.ten FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan WHERE T1.ty_le_ung_ho < T1.ty_le_phan_doi
SELECT gioi_tinh, COUNT(*) FROM ca_nhan WHERE can_nang > 85 GROUP BY gioi_tinh
SELECT ca_nhan.gioi_tinh, COUNT(*) FROM ca_nhan WHERE ca_nhan.can_nang > 85 GROUP BY ca_nhan.gioi_tinh
SELECT MAX(ty_le_ung_ho) AS max_ung_ho, MIN(ty_le_xem_xet) AS min_xem_xet, MIN(ty_le_phan_doi) AS min_phan_doi FROM ung_cu_vien
SELECT MAX(ty_le_ung_ho) AS max_ung_ho, MIN(ty_le_xem_xet) AS min_xem_xet, MIN(ty_le_phan_doi) AS min_phan_doi FROM ung_cu_vien
SELECT ca_nhan.ten FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ca_nhan = ca_nhan.id_ca_nhan WHERE ca_nhan.gioi_tinh = 'F' ORDER BY ca_nhan.ten ASC
SELECT T2.ten FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan WHERE T2.gioi_tinh = 'nữ' ORDER BY T2.ten ASC
SELECT ten FROM ca_nhan WHERE chieu_cao < (SELECT AVG(chieu_cao) FROM ca_nhan)
SELECT ten FROM ca_nhan WHERE chieu_cao < (SELECT AVG(chieu_cao) FROM ca_nhan)
SELECT id_ca_nhan, gioi_tinh, ten, ngay_sinh, chieu_cao, can_nang FROM ca_nhan
SELECT id_ca_nhan, gioi_tinh, ten, ngay_sinh, chieu_cao, can_nang FROM ca_nhan
SELECT thanh_pho.id_thanh_pho FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha ORDER BY thanh_pho_chu_nha.nam DESC LIMIT 1
SELECT thanh_pho.id_thanh_pho FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha WHERE thanh_pho_chu_nha.nam = (SELECT MAX(nam) FROM thanh_pho_chu_nha)
SELECT id_tran_dau FROM tran_dau WHERE giai_dau = 'vòng loại FIFA World Cup 1994'
SELECT id_tran_dau FROM tran_dau WHERE giai_dau = 'vòng loại FIFA World Cup 1994'
SELECT thanh_pho.thanh_pho FROM thanh_pho_chu_nha JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE thanh_pho_chu_nha.nam > 2010
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha WHERE thanh_pho_chu_nha.nam > 2010
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha GROUP BY thanh_pho.id_thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha GROUP BY thanh_pho.id_thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT tran_dau.dia_diem FROM tran_dau JOIN thanh_pho_chu_nha ON tran_dau.id_tran_dau = thanh_pho_chu_nha.id_tran_dau JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE tran_dau.giai_dau = 'Vòng loại FIFA World Cup 1994' AND thanh_pho.thanh_pho = 'Nam Kinh (Giang Tô)'
SELECT tran_dau.dia_diem FROM tran_dau JOIN thanh_pho_chu_nha ON tran_dau.id_tran_dau = thanh_pho_chu_nha.id_tran_dau JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE tran_dau.giai_dau = 'Vòng loại FIFA World Cup 1994' AND thanh_pho.thanh_pho = 'Nam Kinh (Giang Tô)'
SELECT nhiet_do.thang_mot FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho WHERE thanh_pho.thanh_pho = 'Thượng Hải'
SELECT thang_mot FROM nhiet_do JOIN thanh_pho ON nhiet_do.id_thanh_pho = thanh_pho.id_thanh_pho WHERE thanh_pho.thanh_pho = 'Thượng Hải'
SELECT nam FROM thanh_pho_chu_nha JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE thanh_pho.thanh_pho = 'Thái Châu (Chiết Giang)'
SELECT nam FROM thanh_pho_chu_nha JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE thanh_pho.thanh_pho = 'Thái Châu ( Chiết Giang )'
SELECT thanh_pho.thanh_pho FROM thanh_pho ORDER BY thanh_pho.dan_so_khu_vuc DESC LIMIT 3
SELECT thanh_pho.thanh_pho, thanh_pho.dan_so_khu_vuc FROM thanh_pho ORDER BY thanh_pho.dan_so_khu_vuc DESC LIMIT 3
SELECT thanh_pho.thanh_pho, thanh_pho.gdp FROM thanh_pho ORDER BY thanh_pho.gdp ASC LIMIT 1
SELECT thanh_pho, gdp FROM thanh_pho ORDER BY gdp ASC LIMIT 1
SELECT thanh_pho.thanh_pho FROM nhiet_do JOIN thanh_pho ON nhiet_do.id_thanh_pho = thanh_pho.id_thanh_pho ORDER BY nhiet_do.thang_hai DESC LIMIT 1
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho ORDER BY nhiet_do.thang_hai DESC LIMIT 1
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho WHERE nhiet_do.thang_ba < nhiet_do.thang_bay OR nhiet_do.thang_ba > nhiet_do.thang_muoi
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho WHERE nhiet_do.thang_ba < nhiet_do.thang_bay OR nhiet_do.thang_ba > nhiet_do.thang_muoi
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha WHERE nhiet_do.thang_ba < nhiet_do.thang_tam AND thanh_pho_chu_nha.thanh_pho_chu_nha IS NOT NULL
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha WHERE nhiet_do.thang_ba < nhiet_do.thang_tam
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho WHERE nhiet_do.thang_ba < nhiet_do.thang_muoi_hai AND thanh_pho.id_thanh_pho NOT IN (SELECT thanh_pho_chu_nha.thanh_pho_chu_nha FROM thanh_pho_chu_nha)
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho LEFT JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha WHERE thanh_pho_chu_nha.thanh_pho_chu_nha IS NULL AND nhiet_do.thang_ba < nhiet_do.thang_muoi_hai
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho WHERE nhiet_do.thang_hai > nhiet_do.thang_sau OR thanh_pho.id_thanh_pho IN (SELECT thanh_pho_chu_nha.thanh_pho_chu_nha FROM thanh_pho_chu_nha)
SELECT T1.thanh_pho FROM thanh_pho T1 JOIN nhiet_do T2 ON T1.id_thanh_pho = T2.id_thanh_pho WHERE T2.thang_hai > T2.thang_sau UNION SELECT T1.thanh_pho FROM thanh_pho T1 JOIN thanh_pho_chu_nha T3 ON T1.id_thanh_pho = T3.thanh_pho_chu_nha
SELECT thanh_pho.thanh_pho FROM thanh_pho WHERE thanh_pho.dan_so_khu_vuc > 10000000
SELECT thanh_pho.thanh_pho FROM thanh_pho WHERE thanh_pho.dan_so_khu_vuc > 10000000
SELECT thanh_pho.dan_so_khu_vuc, thanh_pho.thanh_pho FROM thanh_pho WHERE thanh_pho.dan_so_khu_vuc > 8000000 OR thanh_pho.dan_so_khu_vuc < 5000000
SELECT thanh_pho.thanh_pho FROM thanh_pho WHERE thanh_pho.dan_so_khu_vuc > 8000000 OR thanh_pho.dan_so_khu_vuc < 5000000
SELECT giai_dau, COUNT(*) FROM tran_dau GROUP BY giai_dau
SELECT tran_dau.giai_dau , COUNT(*) FROM tran_dau GROUP BY tran_dau.giai_dau
SELECT tran_dau.dia_diem FROM tran_dau ORDER BY tran_dau.ngay DESC
SELECT dia_diem FROM tran_dau ORDER BY ngay DESC
SELECT gdp FROM thanh_pho ORDER BY dan_so_khu_vuc DESC LIMIT 1
SELECT gdp FROM thanh_pho ORDER BY dan_so_khu_vuc DESC LIMIT 1
SELECT thanh_pho.gdp, thanh_pho.dan_so_khu_vuc FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha GROUP BY thanh_pho.thanh_pho HAVING COUNT(*) > 1
SELECT thanh_pho.thanh_pho, thanh_pho.gdp, thanh_pho.dan_so_khu_vuc FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha GROUP BY thanh_pho.id_thanh_pho HAVING COUNT(*) > 1
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán'
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán'
SELECT COUNT(*) FROM lop_hoc WHERE ma_lop_hoc = 'ACCT-211'
SELECT COUNT(DISTINCT giao_su.ma_so_nhan_vien) FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON nhan_vien.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su WHERE lop_hoc.ma_lop_hoc = 'ACCT-211'
SELECT nhan_vien.ho_cua_nhan_vien , nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Sinh học'
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Sinh học'
SELECT T2.ten_cua_nhan_vien , T2.ngay_sinh_cua_nhan_vien FROM lop_hoc AS T1 JOIN nhan_vien AS T2 ON T1.ma_so_nhan_vien_cua_giao_su = T2.ma_so_nhan_vien JOIN khoa_hoc AS T3 ON T1.ma_khoa_hoc = T3.ma_khoa_hoc WHERE T3.ma_khoa_hoc = 'ACCT-211'
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ngay_sinh_cua_nhan_vien FROM giao_su JOIN lop_hoc ON giao_su.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE lop_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT COUNT(*) FROM lop_hoc JOIN nhan_vien ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien WHERE nhan_vien.ho_cua_nhan_vien = 'Graztevski'
SELECT COUNT(*) FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON nhan_vien.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su WHERE nhan_vien.ho_cua_nhan_vien = 'Graztevski'
SELECT ma_truong FROM khoa WHERE ten_khoa = 'Kế toán'
SELECT ma_khoa FROM khoa WHERE ten_khoa = 'Kế toán'
SELECT so_luong_tin_chi_cua_khoa_hoc , mo_ta_ve_khoa_hoc FROM khoa_hoc WHERE ma_khoa_hoc = 'CIS-220'
SELECT mo_ta_ve_khoa_hoc, so_luong_tin_chi_cua_khoa_hoc FROM khoa_hoc WHERE ma_khoa_hoc = 'CIS-220'
SELECT dia_chi_khoa FROM khoa WHERE ten_khoa = 'Lịch sử'
SELECT dia_chi_khoa FROM khoa WHERE ten_khoa = 'Lịch sử'
SELECT COUNT(DISTINCT dia_chi_khoa) FROM khoa WHERE ma_truong = 'BUS'
SELECT COUNT(DISTINCT dia_chi_khoa) FROM khoa WHERE ma_truong = 'BUS'
SELECT ma_truong , COUNT(DISTINCT dia_chi_khoa) FROM khoa GROUP BY ma_truong
SELECT ma_truong , COUNT(DISTINCT dia_chi_khoa) FROM khoa GROUP BY ma_truong
SELECT mo_ta_ve_khoa_hoc, so_luong_tin_chi_cua_khoa_hoc FROM khoa_hoc WHERE ma_khoa_hoc = 'QM-261'
SELECT so_luong_tin_chi_cua_khoa_hoc , mo_ta_ve_khoa_hoc FROM khoa_hoc WHERE ma_khoa_hoc = 'QM-261'
SELECT ma_truong , COUNT ( * ) FROM khoa GROUP BY ma_truong
SELECT ma_truong , COUNT ( * ) FROM khoa GROUP BY ma_truong
SELECT ma_truong , COUNT ( * ) FROM khoa GROUP BY ma_truong HAVING COUNT ( * ) < 5
SELECT ma_truong , COUNT(*) AS so_luong_khoa FROM khoa GROUP BY ma_truong HAVING COUNT(*) < 5
SELECT T1.ma_khoa_hoc , COUNT ( * ) FROM khoa_hoc AS T1 JOIN lop_hoc AS T2 ON T1.ma_khoa_hoc = T2.ma_khoa_hoc GROUP BY T1.ma_khoa_hoc
SELECT T1.ma_khoa, SUM(T2.so_luong_tin_chi_cua_khoa_hoc) FROM khoa AS T1 JOIN khoa_hoc AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa
SELECT SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa GROUP BY khoa.ma_khoa
SELECT COUNT(*) FROM lop_hoc WHERE phong_hoc IN (SELECT phong_hoc FROM lop_hoc GROUP BY phong_hoc HAVING COUNT(*) >= 2)
SELECT lop_hoc.phong_hoc , COUNT ( * ) FROM lop_hoc GROUP BY lop_hoc.phong_hoc HAVING COUNT ( * ) >= 2
SELECT khoa.ten_khoa , COUNT(*) AS so_luong_lop_hoc FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa
SELECT COUNT(*) FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ma_truong , COUNT ( * ) FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_truong
SELECT khoa.ma_truong , COUNT ( * ) FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_truong
SELECT khoa.ma_truong, COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_truong
SELECT T1.ma_truong , COUNT ( * ) FROM giao_su AS T2 JOIN khoa AS T1 ON T2.ma_khoa = T1.ma_khoa GROUP BY T1.ma_truong
SELECT ma_cong_viec_cua_nhan_vien , COUNT(*) FROM nhan_vien GROUP BY ma_cong_viec_cua_nhan_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_cong_viec_cua_nhan_vien , COUNT ( * ) FROM nhan_vien GROUP BY ma_cong_viec_cua_nhan_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT khoa.ma_truong FROM khoa JOIN giao_su ON khoa.ma_khoa = giao_su.ma_khoa GROUP BY khoa.ma_truong ORDER BY COUNT(*) ASC LIMIT 1
SELECT khoa.ten_khoa FROM khoa JOIN giao_su ON khoa.ma_khoa = giao_su.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT khoa.ten_khoa , COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE giao_su.bang_cap_cao_nhat = 'Tiến sĩ' GROUP BY khoa.ma_khoa
SELECT T1.ma_khoa , COUNT(*) FROM khoa AS T1 JOIN giao_su AS T2 ON T1.ma_khoa = T2.ma_khoa WHERE T2.bang_cap_cao_nhat = 'Tiến sĩ' GROUP BY T1.ma_khoa
SELECT khoa.ten_khoa , COUNT(*) FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ten_khoa , COUNT(*) AS so_luong_sinh_vien FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa
SELECT SUM(sinh_vien.gio_hoc_cua_sinh_vien) FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ten_khoa, SUM(sinh_vien.gio_hoc_cua_sinh_vien) FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ma_khoa, AVG(sinh_vien.gpa_cua_sinh_vien), MAX(sinh_vien.gpa_cua_sinh_vien), MIN(sinh_vien.gpa_cua_sinh_vien) FROM khoa JOIN sinh_vien ON khoa.ma_khoa = sinh_vien.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ma_khoa, MAX(sinh_vien.gpa_cua_sinh_vien) AS max_gpa, MIN(sinh_vien.gpa_cua_sinh_vien) AS min_gpa, AVG(sinh_vien.gpa_cua_sinh_vien) AS avg_gpa FROM khoa JOIN sinh_vien ON khoa.ma_khoa = sinh_vien.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ten_khoa, AVG(sinh_vien.gpa_cua_sinh_vien) FROM khoa JOIN sinh_vien ON khoa.ma_khoa = sinh_vien.ma_khoa GROUP BY khoa.ma_khoa ORDER BY AVG(sinh_vien.gpa_cua_sinh_vien) DESC LIMIT 1
SELECT T4.ma_khoa , AVG(T1.diem_so) FROM dang_ky_khoa_hoc AS T1 JOIN lop_hoc AS T2 ON T1.ma_lop = T2.ma_lop_hoc JOIN khoa_hoc AS T3 ON T2.ma_khoa_hoc = T3.ma_khoa_hoc JOIN khoa AS T4 ON T3.ma_khoa = T4.ma_khoa GROUP BY T4.ma_khoa ORDER BY AVG(T1.diem_so) DESC LIMIT 1
SELECT COUNT(DISTINCT ma_truong) FROM khoa
SELECT COUNT(DISTINCT ma_truong) FROM khoa
SELECT COUNT(*) FROM lop_hoc
SELECT COUNT(*) FROM lop_hoc
SELECT COUNT(*) FROM khoa_hoc
SELECT COUNT(*) FROM khoa_hoc
SELECT COUNT(*) FROM khoa
SELECT COUNT(*) FROM khoa
SELECT COUNT(*) FROM khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Hệ thống thông tin máy tính'
SELECT COUNT(*) FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa WHERE khoa.ten_khoa = 'Hệ thống thông tin máy tính'
SELECT COUNT(*) FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT COUNT(DISTINCT lop_hoc.lop_hoc_phan) FROM khoa_hoc JOIN lop_hoc ON khoa_hoc.ma_khoa_hoc = lop_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT khoa.ma_khoa, SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ma_khoa, SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ten_khoa FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa GROUP BY khoa.ma_khoa ORDER BY SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) DESC LIMIT 1
SELECT khoa.ten_khoa FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa GROUP BY khoa.ma_khoa ORDER BY SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) DESC LIMIT 1
SELECT COUNT(DISTINCT dang_ky_khoa_hoc.ma_so_sinh_vien) FROM dang_ky_khoa_hoc JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT COUNT(DISTINCT dang_ky_khoa_hoc.ma_so_sinh_vien) FROM dang_ky_khoa_hoc JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc WHERE lop_hoc.ma_lop_hoc = 'ACCT-211'
SELECT sinh_vien.ho_cua_sinh_vien , sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT sinh_vien.ho_cua_sinh_vien, sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT T1.ho_cua_sinh_vien , T1.ten_cua_sinh_vien FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.ma_so_sinh_vien = T2.ma_so_sinh_vien JOIN lop_hoc AS T3 ON T2.ma_lop = T3.ma_lop_hoc WHERE T3.ma_khoa_hoc = 'ACCT-211' AND T2.diem_so = 'C'
SELECT sinh_vien.ho_cua_sinh_vien , sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc WHERE lop_hoc.ma_khoa_hoc = 'ACCT-211' AND dang_ky_khoa_hoc.diem_so = 'C'
SELECT COUNT(*) FROM nhan_vien
SELECT COUNT(*) FROM giao_su WHERE bang_cap_cao_nhat = 'Tiến sĩ'
SELECT COUNT(*) FROM giao_su WHERE bang_cap_cao_nhat = 'Tiến sĩ'
SELECT COUNT(DISTINCT sinh_vien.ma_so_sinh_vien) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN giao_su ON lop_hoc.ma_so_nhan_vien_cua_giao_su = giao_su.ma_so_nhan_vien WHERE giao_su.ma_khoa = 'Kế toán'
SELECT COUNT(*) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN giao_su ON lop_hoc.ma_so_nhan_vien_cua_giao_su = giao_su.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ma_khoa = 'Kế toán'
SELECT khoa.ten_khoa FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT khoa.ten_khoa FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY sinh_vien.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khoa FROM khoa ORDER BY ten_khoa ASC
SELECT ten_khoa FROM khoa ORDER BY ten_khoa ASC
SELECT khoa_hoc.ma_khoa_hoc FROM khoa_hoc JOIN lop_hoc ON khoa_hoc.ma_khoa_hoc = lop_hoc.ma_khoa_hoc WHERE lop_hoc.phong_hoc = 'KLR 209'
SELECT ma_khoa_hoc FROM lop_hoc WHERE phong_hoc = 'KLR 209'
SELECT ho_cua_nhan_vien , ten_cua_nhan_vien FROM nhan_vien WHERE ma_cong_viec_cua_nhan_vien = 'Giáo sư' ORDER BY ngay_sinh_cua_nhan_vien ASC
SELECT ten_cua_nhan_vien FROM nhan_vien JOIN giao_su ON nhan_vien.ma_so_nhan_vien = giao_su.ma_so_nhan_vien ORDER BY ngay_sinh_cua_nhan_vien ASC
SELECT nhan_vien.ten_cua_nhan_vien , giao_su.van_phong_giao_su FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien ORDER BY nhan_vien.ten_cua_nhan_vien ASC
SELECT nhan_vien.ten_cua_nhan_vien , giao_su.van_phong_giao_su FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien ORDER BY nhan_vien.ten_cua_nhan_vien ASC
SELECT ho_cua_nhan_vien, ten_cua_nhan_vien FROM nhan_vien ORDER BY ngay_sinh_cua_nhan_vien ASC LIMIT 1
SELECT ho_cua_nhan_vien, ten_cua_nhan_vien FROM nhan_vien ORDER BY ngay_sinh_cua_nhan_vien ASC LIMIT 1
SELECT ho_cua_sinh_vien, ten_cua_sinh_vien, gpa_cua_sinh_vien FROM sinh_vien WHERE gpa_cua_sinh_vien > 3 ORDER BY ngay_sinh_cua_sinh_vien ASC LIMIT 1
SELECT ten_cua_sinh_vien, ho_cua_sinh_vien, gpa_cua_sinh_vien FROM sinh_vien WHERE gpa_cua_sinh_vien > 3 ORDER BY ngay_sinh_cua_sinh_vien DESC LIMIT 1
SELECT ho_cua_sinh_vien, ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien WHERE dang_ky_khoa_hoc.diem_so = 'C'
SELECT sinh_vien.ho_cua_sinh_vien, sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien WHERE dang_ky_khoa_hoc.diem_so = 'C'
SELECT ten_khoa FROM khoa JOIN giao_su ON khoa.ma_khoa = giao_su.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT khoa.ten_khoa FROM khoa JOIN giao_su ON khoa.ma_khoa = giao_su.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT T2.ten_khoa , COUNT ( * ) FROM giao_su AS T1 JOIN khoa AS T2 ON T1.ma_khoa = T2.ma_khoa WHERE T1.bang_cap_cao_nhat = 'tiến sĩ' GROUP BY T2.ma_khoa ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.ten_khoa FROM khoa AS T1 JOIN giao_su AS T2 ON T1.ma_khoa = T2.ma_khoa WHERE T2.bang_cap_cao_nhat = 'tiến sĩ' GROUP BY T1.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE giao_su.ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc)
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE giao_su.ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc)
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc)
SELECT nhan_vien.ho_cua_nhan_vien , nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc)
SELECT nhan_vien.ho_cua_nhan_vien, giao_su.van_phong_giao_su FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Lịch sử'
SELECT ho_cua_nhan_vien, van_phong_giao_su FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Lịch sử'
SELECT giao_su.van_phong_giao_su, khoa.ten_khoa FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE nhan_vien.ho_cua_nhan_vien = 'Heffington'
SELECT giao_su.ma_khoa, giao_su.van_phong_giao_su FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE nhan_vien.ho_cua_nhan_vien = 'Heffington'
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ngay_bat_dau_cong_viec_cua_nhan_vien FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE giao_su.van_phong_giao_su = 'DRE 102'
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ngay_bat_dau_cong_viec_cua_nhan_vien FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE giao_su.van_phong_giao_su = 'DRE 102'
SELECT khoa_hoc.ma_khoa_hoc FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE sinh_vien.ho_cua_sinh_vien = 'Smithson'
SELECT T3.ma_khoa_hoc FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.ma_so_sinh_vien = T2.ma_so_sinh_vien JOIN lop_hoc AS T3 ON T2.ma_lop = T3.ma_lop_hoc WHERE T1.ho_cua_sinh_vien = 'Smithson'
SELECT khoa_hoc.so_luong_tin_chi_cua_khoa_hoc, khoa_hoc.mo_ta_ve_khoa_hoc FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE sinh_vien.ho_cua_sinh_vien = 'Smithson'
SELECT khoa_hoc.so_luong_tin_chi_cua_khoa_hoc , khoa_hoc.mo_ta_ve_khoa_hoc FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE sinh_vien.ho_cua_sinh_vien = 'Smithson'
SELECT COUNT(*) FROM giao_su WHERE bang_cap_cao_nhat IN ('Tiến sĩ', 'Thạc sĩ')
SELECT COUNT(*) FROM giao_su WHERE bang_cap_cao_nhat IN ('Tiến sĩ', 'Thạc sĩ')
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa IN ('Kế toán', 'Sinh học')
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa IN ('Kế toán', 'Sinh học')
SELECT ho_cua_nhan_vien , ten_cua_nhan_vien FROM nhan_vien JOIN lop_hoc ON nhan_vien.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc IN ('CIS-220', 'QM-261')
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien FROM lop_hoc JOIN nhan_vien ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien WHERE lop_hoc.ma_khoa_hoc IN ('CIS-220', 'QM-261')
SELECT sinh_vien.ho_cua_sinh_vien, sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán' INTERSECT SELECT sinh_vien.ho_cua_sinh_vien, sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Hệ thống thông tin máy tính'
SELECT sinh_vien.ho_cua_sinh_vien, sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa IN ('Kế toán', 'Hệ thống thông tin máy tính') GROUP BY sinh_vien.ma_so_sinh_vien HAVING COUNT(DISTINCT khoa.ma_khoa) = 2
SELECT AVG(sinh_vien.gpa_cua_sinh_vien) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT AVG(sinh_vien.gpa_cua_sinh_vien) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT ten_cua_sinh_vien, gpa_cua_sinh_vien, so_dien_thoai_cua_sinh_vien FROM sinh_vien ORDER BY gpa_cua_sinh_vien DESC LIMIT 5
SELECT ten_cua_sinh_vien, gpa_cua_sinh_vien, so_dien_thoai_cua_sinh_vien FROM sinh_vien ORDER BY gpa_cua_sinh_vien DESC LIMIT 5
SELECT khoa.ten_khoa FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa ORDER BY sinh_vien.gpa_cua_sinh_vien ASC LIMIT 1
SELECT khoa.ten_khoa FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa ORDER BY sinh_vien.gpa_cua_sinh_vien ASC LIMIT 1
SELECT ho_cua_sinh_vien , ten_cua_sinh_vien , gpa_cua_sinh_vien FROM sinh_vien WHERE gpa_cua_sinh_vien < ( SELECT AVG ( gpa_cua_sinh_vien ) FROM sinh_vien )
SELECT ten_cua_sinh_vien, gpa_cua_sinh_vien FROM sinh_vien WHERE gpa_cua_sinh_vien < (SELECT AVG(gpa_cua_sinh_vien) FROM sinh_vien)
SELECT T1.ten_khoa, T1.dia_chi_khoa FROM khoa AS T1 JOIN sinh_vien AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khoa, dia_chi_khoa FROM khoa JOIN sinh_vien ON khoa.ma_khoa = sinh_vien.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khoa, dia_chi_khoa, COUNT(*) AS so_luong_sinh_vien FROM khoa JOIN sinh_vien ON khoa.ma_khoa = sinh_vien.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) DESC LIMIT 3
SELECT ten_khoa, dia_chi_khoa, COUNT(*) AS so_luong_sinh_vien FROM khoa JOIN sinh_vien ON khoa.ma_khoa = sinh_vien.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) DESC LIMIT 3
SELECT nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE giao_su.ma_khoa = 'Lịch sử' AND giao_su.bang_cap_cao_nhat = 'Tiến sĩ'
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.bang_cap_cao_nhat = 'Tiến sĩ'
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien, lop_hoc.ma_khoa_hoc FROM lop_hoc JOIN nhan_vien ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien, lop_hoc.ma_lop_hoc FROM lop_hoc JOIN nhan_vien ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien, khoa_hoc.mo_ta_ve_khoa_hoc FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON lop_hoc.ma_so_nhan_vien_cua_giao_su = giao_su.ma_so_nhan_vien JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc
SELECT T2.ho_cua_nhan_vien , T2.ten_cua_nhan_vien , T3.mo_ta_ve_khoa_hoc FROM lop_hoc AS T1 JOIN nhan_vien AS T2 ON T1.ma_so_nhan_vien_cua_giao_su = T2.ma_so_nhan_vien JOIN khoa_hoc AS T3 ON T1.ma_khoa_hoc = T3.ma_khoa_hoc
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su, khoa_hoc.mo_ta_ve_khoa_hoc FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON giao_su.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su, khoa_hoc.mo_ta_ve_khoa_hoc FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON giao_su.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc
SELECT nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su, khoa_hoc.mo_ta_ve_khoa_hoc, khoa.ten_khoa FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su, khoa.ten_khoa, khoa_hoc.mo_ta_ve_khoa_hoc FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN lop_hoc ON giao_su.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc
SELECT sinh_vien.ho_cua_sinh_vien , sinh_vien.ten_cua_sinh_vien , khoa_hoc.mo_ta_ve_khoa_hoc FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc
SELECT sinh_vien.ho_cua_sinh_vien , sinh_vien.ten_cua_sinh_vien , khoa_hoc.mo_ta_ve_khoa_hoc FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc
SELECT T1.ho_cua_sinh_vien, T1.ten_cua_sinh_vien FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.ma_so_sinh_vien = T2.ma_so_sinh_vien WHERE T2.diem_so IN ('A', 'C')
SELECT ho_cua_sinh_vien, ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien WHERE dang_ky_khoa_hoc.diem_so IN ('A', 'C')
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien, lop_hoc.phong_hoc FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON nhan_vien.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su WHERE khoa.ten_khoa = 'Kế toán'
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien, lop_hoc.phong_hoc FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN lop_hoc ON giao_su.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Kế toán'
SELECT nhan_vien.ho_cua_nhan_vien , nhan_vien.ten_cua_nhan_vien , giao_su.bang_cap_cao_nhat FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Hệ thống Thông tin Máy tính'
SELECT nhan_vien.ho_cua_nhan_vien , nhan_vien.ten_cua_nhan_vien , giao_su.bang_cap_cao_nhat FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Hệ thống thông tin máy tính'
SELECT sinh_vien.ho_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien WHERE dang_ky_khoa_hoc.ma_lop = '10018' AND dang_ky_khoa_hoc.diem_so = 'A'
SELECT sinh_vien.ho_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien WHERE dang_ky_khoa_hoc.ma_lop = '10018' AND dang_ky_khoa_hoc.diem_so = 'A'
SELECT nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.bang_cap_cao_nhat != 'Tiến sĩ'
SELECT ten_cua_nhan_vien, van_phong_giao_su FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.bang_cap_cao_nhat != 'Tiến sĩ'
SELECT giao_su.ho_cua_nhan_vien, giao_su.ten_cua_nhan_vien FROM giao_su JOIN lop_hoc ON giao_su.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su GROUP BY giao_su.ma_so_nhan_vien HAVING COUNT(*) > 1
SELECT ho_cua_sinh_vien, ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien GROUP BY sinh_vien.ma_so_sinh_vien HAVING COUNT(*) = 1
SELECT T1.ho_cua_sinh_vien , T1.ten_cua_sinh_vien FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.ma_so_sinh_vien = T2.ma_so_sinh_vien GROUP BY T1.ma_so_sinh_vien HAVING COUNT(*) = 1
SELECT ten_khoa FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa WHERE khoa_hoc.mo_ta_ve_khoa_hoc LIKE '%Thống kê%'
SELECT ten_khoa FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa WHERE khoa_hoc.mo_ta_ve_khoa_hoc LIKE '%Thống kê%'
SELECT sinh_vien.ho_cua_sinh_vien, sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211' AND sinh_vien.ho_cua_sinh_vien LIKE 'S%'
SELECT ten_cua_sinh_vien FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa WHERE sinh_vien.ho_cua_sinh_vien LIKE 'S%' AND khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT ma_trang_thai_tai_lieu FROM trang_thai_cua_tai_lieu
SELECT trang_thai_cua_tai_lieu.mo_ta_ve_trang_thai_tai_lieu FROM tai_lieu JOIN trang_thai_cua_tai_lieu ON tai_lieu.ma_trang_thai_tai_lieu = trang_thai_cua_tai_lieu.ma_trang_thai_tai_lieu WHERE tai_lieu.ma_trang_thai_tai_lieu = 'đang được xử lý'
SELECT ma_loai_tai_lieu FROM loai_tai_lieu
SELECT loai_tai_lieu.mo_ta_ve_loai_tai_lieu FROM tai_lieu JOIN loai_tai_lieu ON tai_lieu.ma_loai_tai_lieu = loai_tai_lieu.ma_loai_tai_lieu WHERE loai_tai_lieu.mo_ta_ve_loai_tai_lieu = 'Giấy'
SELECT ma_dai_ly_van_chuyen FROM dai_ly_van_chuyen_tai_lieu WHERE ten_dai_ly_van_chuyen = 'UPS'
SELECT ma_vai_tro FROM vai_tro
SELECT mo_ta_ve_vai_tro FROM vai_tro WHERE ma_vai_tro = 'ED'
SELECT COUNT(*) FROM nhan_vien
SELECT vai_tro.mo_ta_ve_vai_tro FROM nhan_vien JOIN vai_tro ON nhan_vien.ma_vai_tro = vai_tro.ma_vai_tro WHERE nhan_vien.ten_nhan_vien = 'Koby'
SELECT id_tai_lieu , ngay_lap_bien_lai FROM tai_lieu
SELECT T1.mo_ta_ve_vai_tro, T1.ma_vai_tro, COUNT(*) FROM vai_tro AS T1 JOIN nhan_vien AS T2 ON T1.ma_vai_tro = T2.ma_vai_tro GROUP BY T1.ma_vai_tro
SELECT T2.mo_ta_ve_vai_tro , COUNT ( * ) FROM nhan_vien AS T1 JOIN vai_tro AS T2 ON T1.ma_vai_tro = T2.ma_vai_tro GROUP BY T1.ma_vai_tro HAVING COUNT ( * ) > 1
SELECT trang_thai_cua_tai_lieu.mo_ta_ve_trang_thai_tai_lieu FROM tai_lieu JOIN trang_thai_cua_tai_lieu ON tai_lieu.ma_trang_thai_tai_lieu = trang_thai_cua_tai_lieu.ma_trang_thai_tai_lieu WHERE tai_lieu.id_tai_lieu = 1
SELECT ma_loai_tai_lieu FROM tai_lieu WHERE id_tai_lieu = 2
SELECT id_tai_lieu FROM tai_lieu WHERE ma_trang_thai_tai_lieu = 'Đã được hoàn thành' AND ma_loai_tai_lieu = 'Giấy'
SELECT dai_ly_van_chuyen_tai_lieu.ten_dai_ly_van_chuyen FROM tai_lieu JOIN dai_ly_van_chuyen_tai_lieu ON tai_lieu.ma_dai_ly_van_chuyen = dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen WHERE tai_lieu.id_tai_lieu = 2
