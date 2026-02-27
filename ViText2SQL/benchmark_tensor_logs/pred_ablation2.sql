SELECT T1.id_tai_san , T1.chi_tiet_tai_san FROM tai_san AS T1 JOIN bo_phan_cua_tai_san AS T2 ON T1.id_tai_san = T2.id_tai_san JOIN nhat_ky_loi AS T3 ON T1.id_tai_san = T3.id_tai_san GROUP BY T1.id_tai_san HAVING COUNT(T2.id_bo_phan) = 2 AND COUNT(T3.id_muc_nhap_cua_nhat_ky_loi) < 2
SELECT T1.id_hop_dong_bao_tri , COUNT ( * ) FROM hop_dong_bao_tri AS T1 JOIN tai_san AS T2 ON T1.id_hop_dong_bao_tri = T2.id_hop_dong_bao_tri GROUP BY T1.id_hop_dong_bao_tri
SELECT T2.id_cong_ty , COUNT ( * ) FROM tai_san AS T1 JOIN cong_ty_ben_thu_ba AS T2 ON T1.id_cong_ty_cung_cap = T2.id_cong_ty GROUP BY T2.id_cong_ty
SELECT T1.id_cong_ty, T1.ten_cong_ty FROM cong_ty_ben_thu_ba AS T1 JOIN ky_su_bao_tri AS T2 ON T1.id_cong_ty = T2.id_cong_ty GROUP BY T1.id_cong_ty HAVING COUNT(*) >= 2 UNION SELECT T1.id_cong_ty, T1.ten_cong_ty FROM cong_ty_ben_thu_ba AS T1 JOIN hop_dong_bao_tri AS T3 ON T1.id_cong_ty = T3.id_hop_dong_bao_tri_cua_cong_ty GROUP BY T1.id_cong_ty HAVING COUNT(*) >= 2
select t1.id_nhan_vien , t1.ten_nhan_vien from nhan_vien as t1 join nhat_ky_loi as t2 on t1.id_nhan_vien = t2.duoc_ghi_lai_boi_nhan_vien_co_id except select t1.id_nhan_vien , t1.ten_nhan_vien from nhan_vien as t1 join chuyen_tham_cua_ky_su as t2 on t1.id_nhan_vien = t2.id_nhan_vien_lien_lac
SELECT T1.id_ky_su , T1.ten , T1.ho FROM ky_su_bao_tri AS T1 JOIN chuyen_tham_cua_ky_su AS T2 ON T1.id_ky_su = T2.id_ky_su GROUP BY T1.id_ky_su ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.id_bo_phan , T1.ten_bo_phan FROM bo_phan AS T1 JOIN loi_bo_phan AS T2 ON T1.id_bo_phan = T2.id_bo_phan JOIN nhat_ky_cua_loi_bo_phan AS T3 ON T2.id_bo_phan_bi_loi = T3.id_bo_phan_bi_loi GROUP BY T1.id_bo_phan HAVING COUNT ( * ) > 2
SELECT T1.ten , T1.ho , T3.mo_ta_ve_ky_nang FROM ky_su_bao_tri AS T1 JOIN ky_nang_cua_ky_su AS T2 ON T1.id_ky_su = T2.id_ky_su JOIN ky_nang AS T3 ON T2.id_ky_nang = T3.id_ky_nang
SELECT T1.ten_viet_tat_cua_loi , T3.mo_ta_ve_ky_nang FROM loi_bo_phan AS T1 JOIN ky_nang_can_de_sua_chua AS T2 ON T1.id_bo_phan_bi_loi = T2.id_bo_phan_bi_loi JOIN ky_nang AS T3 ON T2.id_ky_nang = T3.id_ky_nang
SELECT T1.ten_bo_phan , COUNT ( * ) FROM bo_phan AS T1 JOIN bo_phan_cua_tai_san AS T2 ON T1.id_bo_phan = T2.id_bo_phan GROUP BY T1.ten_bo_phan
SELECT T3.mo_ta_loi , T2.tinh_trang_loi FROM nhat_ky_loi AS T1 JOIN nhat_ky_cua_loi_bo_phan AS T2 ON T1.id_muc_nhap_cua_nhat_ky_loi = T2.id_muc_nhap_cua_nhat_ky_loi JOIN loi_bo_phan AS T3 ON T2.id_bo_phan_bi_loi = T3.id_bo_phan_bi_loi
SELECT T1.id_muc_nhap_cua_nhat_ky_loi , COUNT ( * ) FROM nhat_ky_loi AS T1 JOIN chuyen_tham_cua_ky_su AS T2 ON T1.id_muc_nhap_cua_nhat_ky_loi = T2.id_muc_nhap_cua_nhat_ky_loi GROUP BY T1.id_muc_nhap_cua_nhat_ky_loi ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT DISTINCT ho FROM ky_su_bao_tri
SELECT DISTINCT tinh_trang_loi FROM nhat_ky_cua_loi_bo_phan
SELECT ten , ho FROM ky_su_bao_tri WHERE id_ky_su NOT IN (SELECT id_ky_su FROM chuyen_tham_cua_ky_su)
SELECT tai_san.id_tai_san , tai_san.chi_tiet_tai_san , tai_san.thuong_hieu_tai_san , tai_san.mau_ma_tai_san FROM tai_san
SELECT ngay_mua_tai_san FROM tai_san ORDER BY ngay_mua_tai_san ASC LIMIT 1
SELECT T1.id_bo_phan_bi_loi, T1.ten_viet_tat_cua_loi, T2.id_bo_phan, T2.ten_bo_phan FROM loi_bo_phan AS T1 JOIN ky_nang_can_de_sua_chua AS T3 ON T1.id_bo_phan_bi_loi = T3.id_bo_phan_bi_loi JOIN bo_phan AS T2 ON T1.id_bo_phan = T2.id_bo_phan GROUP BY T1.id_bo_phan_bi_loi, T1.ten_viet_tat_cua_loi, T2.id_bo_phan, T2.ten_bo_phan ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_bo_phan FROM bo_phan AS T1 JOIN nhat_ky_cua_loi_bo_phan AS T2 ON T1.id_bo_phan = T2.id_bo_phan_bi_loi GROUP BY T1.id_bo_phan ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.id_ky_su , T1.ten , T1.ho FROM ky_su_bao_tri AS T1 JOIN chuyen_tham_cua_ky_su AS T2 ON T1.id_ky_su = T2.id_ky_su GROUP BY T1.id_ky_su ORDER BY COUNT ( * ) ASC LIMIT 1
SELECT T1.ten_nhan_vien , T3.ten , T3.ho FROM nhan_vien AS T1 JOIN chuyen_tham_cua_ky_su AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien_lien_lac JOIN ky_su_bao_tri AS T3 ON T2.id_ky_su = T3.id_ky_su
SELECT T1.id_muc_nhap_cua_nhat_ky_loi , T1.mo_ta_ve_loi , T1.thoi_gian_muc_nhap_cua_nhat_ky_loi FROM nhat_ky_loi AS T1 JOIN nhat_ky_cua_loi_bo_phan AS T2 ON T1.id_muc_nhap_cua_nhat_ky_loi = T2.id_muc_nhap_cua_nhat_ky_loi GROUP BY T1.id_muc_nhap_cua_nhat_ky_loi ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.id_ky_nang , T1.mo_ta_ve_ky_nang FROM ky_nang AS T1 JOIN ky_nang_can_de_sua_chua AS T2 ON T1.id_ky_nang = T2.id_ky_nang GROUP BY T1.id_ky_nang ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT DISTINCT mau_ma_tai_san FROM tai_san
SELECT thuong_hieu_tai_san , mau_ma_tai_san , chi_tiet_tai_san FROM tai_san ORDER BY ngay_thanh_ly_tai_san ASC
SELECT id_bo_phan, so_tien_phai_tra FROM bo_phan ORDER BY so_tien_phai_tra ASC LIMIT 1
SELECT T2.ten_cong_ty FROM hop_dong_bao_tri AS T1 JOIN cong_ty_ben_thu_ba AS T2 ON T1.id_hop_dong_bao_tri_cua_cong_ty = T2.id_cong_ty ORDER BY T1.ngay_bat_dau_hop_dong ASC LIMIT 1
SELECT ten_cong_ty FROM cong_ty_ben_thu_ba JOIN hop_dong_bao_tri ON cong_ty_ben_thu_ba.id_cong_ty = hop_dong_bao_tri.id_hop_dong_bao_tri_cua_cong_ty ORDER BY ngay_ket_thuc_hop_dong DESC LIMIT 1
SELECT gioi_tinh FROM nhan_vien GROUP BY gioi_tinh ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_nhan_vien , T1.ho , COUNT ( * ) FROM nhan_vien AS T1 JOIN chuyen_tham_cua_ky_su AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien_lien_lac GROUP BY T1.id_nhan_vien
SELECT T1.mau_ma_tai_san FROM tai_san AS T1 WHERE T1.id_tai_san NOT IN (SELECT id_tai_san FROM nhat_ky_loi)
SELECT COUNT(*) FROM sach
SELECT tac_gia FROM sach ORDER BY tac_gia ASC
SELECT sach.tieu_de FROM sach ORDER BY sach.so_luong_phat_hanh ASC
SELECT sach.tieu_de FROM sach WHERE sach.tac_gia != 'Elaine Lee'
SELECT sach.tieu_de , sach.so_luong_phat_hanh FROM sach AS sach JOIN an_pham AS an_pham ON sach.id_sach = an_pham.id_sach GROUP BY sach.id_sach ORDER BY sach.so_luong_phat_hanh DESC LIMIT 10
SELECT an_pham.ngay_xuat_ban FROM sach JOIN an_pham ON sach.id_sach = an_pham.id_sach ORDER BY an_pham.gia_ban DESC
SELECT DISTINCT an_pham.nha_xuat_ban FROM an_pham WHERE an_pham.gia_ban > 5000000
SELECT nha_xuat_ban FROM an_pham ORDER BY gia_ban DESC LIMIT 1
SELECT an_pham.ngay_xuat_ban FROM an_pham ORDER BY gia_ban ASC LIMIT 3
SELECT sach.tieu_de, an_pham.ngay_xuat_ban FROM sach JOIN an_pham ON sach.id_sach = an_pham.id_sach
SELECT sach.tac_gia FROM sach JOIN an_pham ON sach.id_sach = an_pham.id_sach WHERE an_pham.gia_ban > 4000000
SELECT sach.tieu_de FROM sach JOIN an_pham ON sach.id_sach = an_pham.id_sach ORDER BY an_pham.gia_ban DESC
SELECT nha_xuat_ban FROM an_pham GROUP BY nha_xuat_ban HAVING COUNT(*) > 1
SELECT an_pham.nha_xuat_ban , COUNT ( * ) FROM an_pham GROUP BY an_pham.nha_xuat_ban
SELECT ngay_xuat_ban FROM an_pham GROUP BY ngay_xuat_ban ORDER BY COUNT(*) DESC LIMIT 1
SELECT tac_gia FROM sach GROUP BY tac_gia HAVING COUNT(*) > 1
SELECT tieu_de FROM sach WHERE id_sach NOT IN (SELECT id_sach FROM an_pham)
SELECT nha_xuat_ban FROM an_pham WHERE gia_ban > 10000000 INTERSECT SELECT nha_xuat_ban FROM an_pham WHERE gia_ban < 5000000
SELECT count ( DISTINCT an_pham.ngay_xuat_ban ) FROM an_pham
SELECT COUNT(DISTINCT ngay_xuat_ban) FROM an_pham
SELECT gia_ban FROM an_pham WHERE nha_xuat_ban = 'Person' OR nha_xuat_ban = 'Wiley'
SELECT ten_bo_phan FROM bo_phan ORDER BY ngay_bat_dau_quan_ly ASC
SELECT ten_nguoi_phu_thuoc FROM nguoi_phu_thuoc WHERE moi_quan_he = 'vợ / chồng'
SELECT COUNT(*) FROM nguoi_phu_thuoc WHERE gioi_tinh = 'Nữ'
SELECT ten_bo_phan FROM bo_phan JOIN dia_diem_cua_bo_phan ON bo_phan.ma_so_bo_phan = dia_diem_cua_bo_phan.ma_so_bo_phan WHERE dia_diem_bo_phan = 'Houston'
SELECT ten , ho FROM nhan_vien WHERE luong > 30000
SELECT COUNT ( * ) FROM nhan_vien WHERE luong < 50000 GROUP BY gioi_tinh
SELECT ten , ho , dia_chi FROM nhan_vien ORDER BY ngay_sinh ASC
SELECT COUNT(*) FROM giao_vien
SELECT COUNT ( * ) FROM giao_vien
SELECT ten FROM giao_vien ORDER BY tuoi ASC
SELECT ten FROM giao_vien ORDER BY tuoi ASC
SELECT giao_vien.tuoi, giao_vien.que_quan FROM giao_vien
SELECT giao_vien.tuoi, giao_vien.que_quan FROM giao_vien AS T1
SELECT ten FROM giao_vien WHERE que_quan != 'Khu đô thị Little Lever'
SELECT ten FROM giao_vien WHERE que_quan != 'Khu đô thị Little Lever'
SELECT ten FROM giao_vien WHERE tuoi = '32' OR tuoi = '33'
SELECT ten FROM giao_vien WHERE tuoi = '32' OR tuoi = '33'
SELECT que_quan FROM giao_vien ORDER BY tuoi ASC LIMIT 1
SELECT ten , que_quan FROM giao_vien ORDER BY tuoi ASC LIMIT 1
SELECT que_quan , COUNT ( * ) FROM giao_vien GROUP BY que_quan
SELECT que_quan , COUNT ( * ) FROM giao_vien GROUP BY que_quan
SELECT que_quan FROM giao_vien GROUP BY que_quan ORDER BY COUNT(*) DESC LIMIT 1
SELECT que_quan FROM giao_vien GROUP BY que_quan ORDER BY COUNT(*) DESC LIMIT 1
SELECT que_quan FROM giao_vien GROUP BY que_quan HAVING COUNT(*) >= 2
SELECT que_quan FROM giao_vien GROUP BY que_quan HAVING COUNT(*) >= 2
SELECT giao_vien.ten, khoa_hoc.khoa_hoc FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien JOIN khoa_hoc ON sap_xep_khoa_hoc.id_khoa_hoc = khoa_hoc.id_khoa_hoc
SELECT T1.ten , T3.khoa_hoc FROM giao_vien AS T1 JOIN sap_xep_khoa_hoc AS T2 ON T1.id_giao_vien = T2.id_giao_vien JOIN khoa_hoc AS T3 ON T2.id_khoa_hoc = T3.id_khoa_hoc
SELECT T1.ten , T3.khoa_hoc FROM giao_vien AS T1 JOIN sap_xep_khoa_hoc AS T2 ON T1.id_giao_vien = T2.id_giao_vien JOIN khoa_hoc AS T3 ON T2.id_khoa_hoc = T3.id_khoa_hoc ORDER BY T1.ten ASC
SELECT T1.ten , T3.khoa_hoc FROM giao_vien AS T1 JOIN sap_xep_khoa_hoc AS T2 ON T1.id_giao_vien = T2.id_giao_vien JOIN khoa_hoc AS T3 ON T2.id_khoa_hoc = T3.id_khoa_hoc ORDER BY T1.ten ASC
SELECT T1.ten FROM giao_vien AS T1 JOIN sap_xep_khoa_hoc AS T2 ON T1.id_giao_vien = T2.id_giao_vien JOIN khoa_hoc AS T3 ON T2.id_khoa_hoc = T3.id_khoa_hoc WHERE T3.khoa_hoc = 'Toán'
SELECT giao_vien.ten FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien JOIN khoa_hoc ON sap_xep_khoa_hoc.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.khoa_hoc = 'Toán'
SELECT giao_vien.ten , COUNT ( * ) FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien GROUP BY giao_vien.id_giao_vien
SELECT giao_vien.ten , COUNT ( * ) FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien GROUP BY giao_vien.id_giao_vien
SELECT ten FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien GROUP BY giao_vien.id_giao_vien HAVING COUNT(*) >= 2
SELECT T1.ten FROM giao_vien AS T1 JOIN sap_xep_khoa_hoc AS T2 ON T1.id_giao_vien = T2.id_giao_vien GROUP BY T1.id_giao_vien HAVING COUNT(*) >= 2
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
SELECT thanh_vien.ten , truong_dai_hoc.ten FROM thanh_vien JOIN truong_dai_hoc ON thanh_vien.id_dai_hoc = truong_dai_hoc.id_dai_hoc
SELECT thanh_vien.ten , truong_dai_hoc.dia_diem_truong_dai_hoc FROM thanh_vien JOIN truong_dai_hoc ON thanh_vien.id_dai_hoc = truong_dai_hoc.id_dai_hoc ORDER BY thanh_vien.ten ASC
SELECT ten_lanh_dao FROM truong_dai_hoc JOIN thanh_vien ON truong_dai_hoc.id_dai_hoc = thanh_vien.id_dai_hoc WHERE thanh_vien.quoc_gia = 'Canada'
SELECT thanh_vien.ten, vong.chu_de_trang_tri FROM thanh_vien JOIN vong ON thanh_vien.id_thanh_vien = vong.id_thanh_vien
SELECT thanh_vien.ten FROM thanh_vien JOIN vong ON thanh_vien.id_thanh_vien = vong.id_thanh_vien WHERE vong.xep_hang_tung_vong > 3
SELECT thanh_vien.ten FROM thanh_vien JOIN vong ON thanh_vien.id_thanh_vien = vong.id_thanh_vien ORDER BY vong.xep_hang_tung_vong ASC
SELECT ten FROM thanh_vien WHERE id_thanh_vien NOT IN (SELECT id_thanh_vien FROM vong)
SELECT COUNT(*) FROM cuoc_bau_cu
SELECT cuoc_bau_cu.so_luong_phieu_bau FROM cuoc_bau_cu ORDER BY cuoc_bau_cu.so_luong_phieu_bau DESC
SELECT ngay, ti_le_phieu_bau FROM cuoc_bau_cu
SELECT MIN(ti_le_phieu_bau), MAX(ti_le_phieu_bau) FROM cuoc_bau_cu
SELECT ten, dang FROM dai_dien
SELECT ten FROM dai_dien WHERE dang != 'Đảng Cộng hoà'
SELECT tuoi_tho FROM dai_dien WHERE tieu_bang = 'New York' OR tieu_bang = 'Indiana'
SELECT dai_dien.ten, cuoc_bau_cu.ngay FROM dai_dien JOIN cuoc_bau_cu ON dai_dien.id_dai_dien = cuoc_bau_cu.id_dai_dien
SELECT T1.ten FROM dai_dien AS T1 JOIN cuoc_bau_cu AS T2 ON T1.id_dai_dien = T2.id_dai_dien WHERE T2.so_luong_phieu_bau > 10000
SELECT ten FROM dai_dien JOIN cuoc_bau_cu ON dai_dien.id_dai_dien = cuoc_bau_cu.id_dai_dien ORDER BY cuoc_bau_cu.so_luong_phieu_bau DESC
SELECT T2.dang FROM dai_dien AS T2 JOIN cuoc_bau_cu AS T1 ON T2.id_dai_dien = T1.id_dai_dien GROUP BY T2.id_dai_dien ORDER BY SUM(T1.so_luong_phieu_bau) ASC LIMIT 1
SELECT dai_dien.tuoi_tho FROM dai_dien JOIN cuoc_bau_cu ON dai_dien.id_dai_dien = cuoc_bau_cu.id_dai_dien ORDER BY cuoc_bau_cu.ti_le_phieu_bau DESC
SELECT AVG(cuoc_bau_cu.so_luong_phieu_bau) FROM cuoc_bau_cu JOIN dai_dien ON cuoc_bau_cu.id_dai_dien = dai_dien.id_dai_dien WHERE dai_dien.dang = 'Cộng hoà'
SELECT dang , COUNT ( * ) FROM dai_dien GROUP BY dang
SELECT dang , COUNT ( * ) FROM dai_dien GROUP BY dang ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT dang FROM dai_dien GROUP BY dang HAVING COUNT(*) >= 3
SELECT ten FROM dai_dien WHERE id_dai_dien IN (SELECT id_dai_dien FROM cuoc_bau_cu GROUP BY id_dai_dien HAVING COUNT(*) >= 2)
SELECT ten FROM dai_dien WHERE id_dai_dien NOT IN (SELECT id_dai_dien FROM cuoc_bau_cu)
SELECT dang FROM dai_dien WHERE tieu_bang = 'New York' INTERSECT SELECT dang FROM dai_dien WHERE tieu_bang = 'Pennsylvania'
SELECT COUNT(DISTINCT dang) FROM dai_dien
SELECT COUNT(*) FROM quoc_gia
SELECT COUNT(*) FROM quoc_gia
SELECT quoc_gia.ten_quoc_gia , quoc_gia.thu_do FROM quoc_gia
SELECT ten_quoc_gia, thu_do FROM quoc_gia
SELECT quoc_gia.ngon_ngu_ban_dia_chinh_thuc FROM quoc_gia WHERE quoc_gia.ngon_ngu_ban_dia_chinh_thuc LIKE '%tieng Anh%'
SELECT ngon_ngu_ban_dia_chinh_thuc FROM quoc_gia WHERE ngon_ngu_ban_dia_chinh_thuc LIKE '%tieng Anh%'
SELECT DISTINCT vi_tri FROM tran_dau_trong_mua_giai
SELECT DISTINCT vi_tri FROM tran_dau_trong_mua_giai
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.doi = tran_dau_trong_mua_giai.doi WHERE tran_dau_trong_mua_giai.truong_dai_hoc = 'UCLA'
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu WHERE tran_dau_trong_mua_giai.truong_dai_hoc = 'UCLA'
SELECT DISTINCT vi_tri FROM tran_dau_trong_mua_giai WHERE truong_dai_hoc IN ('UCLA', 'Duke')
SELECT cau_thu.cau_thu , tran_dau_trong_mua_giai.vi_tri FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu WHERE tran_dau_trong_mua_giai.truong_dai_hoc IN ('UCLA', 'Duke')
SELECT ma_so_tuyen_chon_tan_binh, mua_tuyen_chon FROM tran_dau_trong_mua_giai WHERE vi_tri = 'hậu vệ'
SELECT ma_so_tuyen_chon_tan_binh, mua_tuyen_chon FROM tran_dau_trong_mua_giai WHERE vi_tri = 'hau ve'
SELECT COUNT(DISTINCT tran_dau_trong_mua_giai.doi) FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi
SELECT COUNT ( DISTINCT tran_dau_trong_mua_giai.doi ) FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi
SELECT cau_thu.cau_thu , cau_thu.so_nam_da_choi FROM cau_thu
SELECT cau_thu.cau_thu , cau_thu.so_nam_da_choi FROM cau_thu
SELECT ten FROM doi
SELECT ten FROM doi
SELECT mua_giai, cau_thu, ten_quoc_gia FROM tran_dau_trong_mua_giai JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia
SELECT cau_thu.cau_thu , tran_dau_trong_mua_giai.mua_giai , quoc_gia.ten_quoc_gia FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia GROUP BY cau_thu.cau_thu
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.ten_quoc_gia = 'Indonesia'
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.ten_quoc_gia = 'Indonesia'
SELECT DISTINCT tran_dau_trong_mua_giai.vi_tri FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.thu_do = 'Dublin'
SELECT DISTINCT tran_dau_trong_mua_giai.vi_tri FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.thu_do = 'Dublin'
SELECT quoc_gia.ngon_ngu_ban_dia_chinh_thuc FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia WHERE tran_dau_trong_mua_giai.truong_dai_hoc IN ('Maryland', 'Duke')
SELECT quoc_gia.ngon_ngu_ban_dia_chinh_thuc FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia WHERE tran_dau_trong_mua_giai.truong_dai_hoc IN ('Maryland', 'Duke')
SELECT COUNT(DISTINCT quoc_gia.ngon_ngu_ban_dia_chinh_thuc) FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia WHERE tran_dau_trong_mua_giai.vi_tri = 'hậu vệ'
SELECT COUNT(DISTINCT quoc_gia.ngon_ngu_ban_dia_chinh_thuc) FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia WHERE tran_dau_trong_mua_giai.vi_tri = 'hậu vệ'
SELECT tran_dau_trong_mua_giai.mua_giai , tran_dau_trong_mua_giai.cau_thu , doi.ten FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi
SELECT cau_thu.cau_thu, tran_dau_trong_mua_giai.mua_giai, doi.ten FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu AND cau_thu.doi = tran_dau_trong_mua_giai.doi JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi
SELECT vi_tri FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi WHERE doi.ten = 'Ryley Goldner'
SELECT tran_dau_trong_mua_giai.vi_tri FROM cau_thu JOIN doi ON cau_thu.doi = doi.id_doi JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu WHERE doi.ten = 'Ryley Goldner'
SELECT COUNT(DISTINCT truong_dai_hoc) FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi WHERE doi.ten = 'Columbus Crew'
SELECT COUNT(DISTINCT truong_dai_hoc) FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi WHERE doi.ten = 'Columbus Crew'
SELECT cau_thu.cau_thu , cau_thu.so_nam_da_choi FROM cau_thu JOIN doi ON cau_thu.doi = doi.id_doi WHERE doi.ten = 'Columbus Crew'
SELECT cau_thu.cau_thu , cau_thu.so_nam_da_choi FROM cau_thu JOIN doi ON cau_thu.doi = doi.id_doi WHERE doi.ten = 'Columbus Crew'
SELECT vi_tri , COUNT ( * ) FROM tran_dau_trong_mua_giai GROUP BY vi_tri
SELECT vi_tri , COUNT(DISTINCT cau_thu) FROM tran_dau_trong_mua_giai GROUP BY vi_tri
SELECT quoc_gia.ten_quoc_gia , COUNT(DISTINCT cau_thu.cau_thu) FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia JOIN cau_thu ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu GROUP BY quoc_gia.id_quoc_gia
SELECT quoc_gia , COUNT ( DISTINCT cau_thu ) FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu GROUP BY quoc_gia
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu ORDER BY tran_dau_trong_mua_giai.truong_dai_hoc ASC
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu ORDER BY tran_dau_trong_mua_giai.truong_dai_hoc ASC
SELECT vi_tri FROM tran_dau_trong_mua_giai GROUP BY vi_tri ORDER BY COUNT(DISTINCT cau_thu) DESC LIMIT 1
SELECT vi_tri FROM tran_dau_trong_mua_giai GROUP BY vi_tri ORDER BY COUNT(*) DESC LIMIT 1
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc ORDER BY COUNT(*) DESC LIMIT 3
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc ORDER BY COUNT(*) DESC LIMIT 3
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc HAVING COUNT(*) >= 2
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc HAVING COUNT(*) >= 2
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc HAVING COUNT(*) >= 2 ORDER BY truong_dai_hoc DESC
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc HAVING COUNT(*) >= 2 ORDER BY truong_dai_hoc DESC
SELECT ten FROM doi WHERE id_doi NOT IN (SELECT doi FROM tran_dau_trong_mua_giai)
SELECT ten FROM doi WHERE id_doi NOT IN (SELECT doi FROM tran_dau_trong_mua_giai)
SELECT ten_quoc_gia FROM quoc_gia WHERE id_quoc_gia IN (SELECT quoc_gia FROM tran_dau_trong_mua_giai WHERE vi_tri = 'tiền đạo' INTERSECT SELECT quoc_gia FROM tran_dau_trong_mua_giai WHERE vi_tri = 'hậu vệ')
SELECT ten_quoc_gia FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia WHERE tran_dau_trong_mua_giai.vi_tri = 'tiền đạo' INTERSECT SELECT ten_quoc_gia FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia WHERE tran_dau_trong_mua_giai.vi_tri = 'hậu vệ'
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai WHERE vi_tri = 'tiền vệ' INTERSECT SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai WHERE vi_tri = 'hậu vệ'
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai WHERE vi_tri = 'tiền vệ' INTERSECT SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai WHERE vi_tri = 'hậu vệ'
SELECT COUNT(*) FROM toi_pham
SELECT ngay FROM toi_pham ORDER BY so_nguoi_bi_giet DESC
SELECT SUM(toi_pham.so_nguoi_bi_thuong) FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan GROUP BY ca_nhan.id_ca_nhan ORDER BY SUM(toi_pham.so_nguoi_bi_thuong) ASC
SELECT AVG(so_nguoi_bi_thuong) FROM toi_pham
SELECT T1.que_quan FROM ca_nhan AS T1 JOIN toi_pham AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan GROUP BY T1.id_ca_nhan ORDER BY SUM(T2.so_nguoi_bi_giet) DESC LIMIT 1
SELECT ten FROM ca_nhan ORDER BY ca_nhan.chieu_cao ASC
SELECT ca_nhan.ten FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan
SELECT ca_nhan.ten FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan WHERE toi_pham.quoc_gia != 'Trung Quốc'
SELECT ten FROM ca_nhan ORDER BY can_nang DESC LIMIT 1
SELECT COUNT(*) FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan WHERE ca_nhan.chieu_cao > 1.84
SELECT ca_nhan.ten FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan WHERE toi_pham.quoc_gia IN ('Trung Quoc', 'Nhat Ban')
SELECT T1.chieu_cao , SUM(T2.so_nguoi_bi_thuong) FROM ca_nhan AS T1 JOIN toi_pham AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan GROUP BY T1.id_ca_nhan ORDER BY SUM(T2.so_nguoi_bi_thuong) DESC
SELECT quoc_gia , COUNT ( DISTINCT id_ca_nhan ) FROM toi_pham GROUP BY quoc_gia
SELECT quoc_gia FROM toi_pham GROUP BY quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_gia FROM toi_pham GROUP BY quoc_gia HAVING COUNT(*) >= 2
SELECT ca_nhan.ten FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan ORDER BY toi_pham.nam DESC
SELECT ten FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM toi_pham)
SELECT quoc_gia FROM toi_pham WHERE so_nguoi_bi_thuong > 50 GROUP BY quoc_gia INTERSECT SELECT quoc_gia FROM toi_pham WHERE so_nguoi_bi_thuong < 20 GROUP BY quoc_gia
SELECT COUNT(DISTINCT dia_diem) FROM toi_pham
SELECT toi_pham.ngay FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan ORDER BY ca_nhan.chieu_cao DESC LIMIT 1
SELECT nam FROM toi_pham ORDER BY nam DESC LIMIT 1
SELECT chinh_quyen_dia_phuong , dich_vu FROM nha_ga
SELECT so_hieu_tau , ten FROM tau_hoa ORDER BY thoi_gian ASC
SELECT so_hieu_tau , thoi_gian FROM tau_hoa WHERE diem_den = 'Chennai' ORDER BY thoi_gian ASC
SELECT COUNT(*) FROM tau_hoa WHERE ten LIKE '%Tốc hành%'
SELECT so_hieu_tau , thoi_gian FROM tau_hoa WHERE diem_khoi_hanh = 'Chennai' AND diem_den = 'Guruvayur'
SELECT COUNT ( * ) FROM tau_hoa GROUP BY tau_hoa.diem_khoi_hanh
SELECT tau_hoa.ten FROM tau_hoa JOIN lo_trinh ON tau_hoa.id = lo_trinh.id_tau GROUP BY tau_hoa.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT nha_ga.ten_mang_luoi, nha_ga.dich_vu, COUNT(DISTINCT lo_trinh.id_tau) FROM nha_ga JOIN lo_trinh ON nha_ga.id = lo_trinh.id_nha_ga GROUP BY nha_ga.id
SELECT ngay_trong_tuan , AVG(nhiet_do_cao) FROM thoi_tiet_hang_tuan GROUP BY ngay_trong_tuan
SELECT MAX(thoi_tiet_hang_tuan.nhiet_do_thap), AVG(thoi_tiet_hang_tuan.luong_mua) FROM nha_ga JOIN thoi_tiet_hang_tuan ON nha_ga.id = thoi_tiet_hang_tuan.id_nha_ga WHERE nha_ga.ten_mang_luoi = 'Amersham'
SELECT tau_hoa.ten , tau_hoa.thoi_gian FROM tau_hoa JOIN lo_trinh ON tau_hoa.id = lo_trinh.id_tau JOIN nha_ga ON lo_trinh.id_nha_ga = nha_ga.id WHERE nha_ga.chinh_quyen_dia_phuong = 'Chiltern'
SELECT COUNT(DISTINCT dich_vu) FROM nha_ga
SELECT T1.id , T1.chinh_quyen_dia_phuong FROM nha_ga AS T1 JOIN thoi_tiet_hang_tuan AS T2 ON T1.id = T2.id_nha_ga GROUP BY T1.id ORDER BY AVG ( T2.nhiet_do_cao ) DESC LIMIT 1
SELECT nha_ga.id, nha_ga.chinh_quyen_dia_phuong FROM nha_ga JOIN thoi_tiet_hang_tuan ON nha_ga.id = thoi_tiet_hang_tuan.id_nha_ga WHERE thoi_tiet_hang_tuan.luong_mua > 50
SELECT MIN(nhiet_do_thap), MAX(toc_do_gio_mph) FROM thoi_tiet_hang_tuan
SELECT tau_hoa.diem_khoi_hanh FROM tau_hoa GROUP BY tau_hoa.diem_khoi_hanh HAVING COUNT(*) > 1
SELECT COUNT(*) FROM nha_tho WHERE ngay_mo_cua < 1850
SELECT nha_tho.ten, nha_tho.ngay_mo_cua, ca_nhan.ten FROM nha_tho JOIN ca_nhan ON nha_tho.duoc_to_chuc_boi = ca_nhan.id_ca_nhan
SELECT ten FROM nha_tho ORDER BY ngay_mo_cua DESC
SELECT ngay_mo_cua FROM nha_tho GROUP BY ngay_mo_cua HAVING COUNT(*) >= 2
SELECT ca_nhan.ten, nha_tho.ten FROM nha_tho JOIN ca_nhan ON nha_tho.duoc_to_chuc_boi = ca_nhan.id_ca_nhan WHERE nha_tho.ngay_mo_cua BETWEEN 1830 AND 1840
SELECT ngay_mo_cua , COUNT ( * ) FROM nha_tho GROUP BY ngay_mo_cua
SELECT ten , ngay_mo_cua FROM nha_tho ORDER BY ngay_mo_cua DESC LIMIT 3
SELECT COUNT(*) FROM ca_nhan WHERE la_nam_hay_nu = 'nữ' AND tuoi > 30
SELECT quoc_gia FROM ca_nhan WHERE tuoi > 30 GROUP BY quoc_gia INTERSECT SELECT quoc_gia FROM ca_nhan WHERE tuoi < 25 GROUP BY quoc_gia
SELECT MIN(tuoi), MAX(tuoi), AVG(tuoi) FROM ca_nhan
SELECT ten, quoc_gia FROM ca_nhan WHERE tuoi < (SELECT AVG(tuoi) FROM ca_nhan)
SELECT T1.ten , T2.ten FROM le_cuoi AS T1 JOIN nha_tho AS T2 ON T1.id_nha_tho = T2.id_nha_tho JOIN ca_nhan AS T3 ON T1.id_nam = T3.id_ca_nhan JOIN ca_nhan AS T4 ON T1.id_nu = T4.id_ca_nhan WHERE T2.ngay_mo_cua > 2014
SELECT ten, tuoi FROM ca_nhan WHERE la_nam_hay_nu = 'nam' AND id_ca_nhan NOT IN (SELECT duoc_to_chuc_boi FROM nha_tho)
SELECT T1.ten FROM nha_tho T1 JOIN le_cuoi T2 ON T1.id_nha_tho = T2.id_nha_tho EXCEPT SELECT T1.ten FROM nha_tho T1 WHERE T1.ngay_mo_cua = 2015
SELECT T1.ten FROM nha_tho AS T1 JOIN le_cuoi AS T2 ON T1.id_nha_tho = T2.id_nha_tho GROUP BY T1.id_nha_tho HAVING COUNT(*) >= 2
SELECT T1.ten FROM ca_nhan AS T1 JOIN le_cuoi AS T2 ON T1.id_ca_nhan = T2.id_nu JOIN nha_tho AS T3 ON T2.id_nha_tho = T3.id_nha_tho WHERE T1.quoc_gia = 'Canada' AND T1.la_nam_hay_nu = 'nu' AND T3.ngay_mo_cua = 2016
SELECT COUNT(*) FROM le_cuoi WHERE ngay_cuoi BETWEEN 20160101 AND 20161231
SELECT nha_tho.ten FROM nha_tho JOIN le_cuoi ON nha_tho.id_nha_tho = le_cuoi.id_nha_tho JOIN ca_nhan AS nam ON le_cuoi.id_nam = nam.id_ca_nhan JOIN ca_nhan AS nu ON le_cuoi.id_nu = nu.id_ca_nhan WHERE nam.tuoi > 30 OR nu.tuoi > 30
SELECT ca_nhan.quoc_gia , COUNT ( * ) FROM ca_nhan GROUP BY ca_nhan.quoc_gia
SELECT COUNT(DISTINCT nha_tho.id_nha_tho) FROM nha_tho JOIN le_cuoi ON nha_tho.id_nha_tho = le_cuoi.id_nha_tho WHERE le_cuoi.ngay_mo_cua BETWEEN 20160101 AND 20161231
SELECT COUNT(*) FROM giang_vien
SELECT COUNT(*) FROM giang_vien
SELECT ngach FROM giang_vien
SELECT giang_vien.ngach FROM giang_vien
SELECT DISTINCT toa_nha FROM giang_vien
SELECT DISTINCT toa_nha FROM giang_vien
SELECT ho , ten , ngach FROM giang_vien
SELECT ho , ten , ngach FROM giang_vien
SELECT ho , ten , so_dien_thoai FROM giang_vien WHERE gioi_tinh = 'nữ'
SELECT ho , ten , so_dien_thoai FROM giang_vien WHERE gioi_tinh = 'Nữ'
SELECT id_giang_vien FROM giang_vien WHERE gioi_tinh = 'nam'
SELECT id_giang_vien FROM giang_vien WHERE gioi_tinh = 'nam'
SELECT COUNT(*) FROM giang_vien WHERE ngach = 'Giáo sư' AND gioi_tinh = 'nữ'
SELECT COUNT ( * ) FROM giang_vien WHERE ngach = 'Giáo sư' AND gioi_tinh = 'nữ'
SELECT giang_vien.so_dien_thoai, giang_vien.so_phong, giang_vien.toa_nha FROM giang_vien WHERE giang_vien.ho = 'Prince' AND giang_vien.ten = 'Jerry'
SELECT so_phong, toa_nha, so_dien_thoai FROM giang_vien WHERE ho = 'Prince' AND ten = 'Jerry'
SELECT COUNT(*) FROM giang_vien WHERE toa_nha = 'NEB'
SELECT COUNT(*) FROM giang_vien WHERE toa_nha = 'NEB'
SELECT ho , ten FROM giang_vien
SELECT ho , ten FROM giang_vien
SELECT toa_nha , COUNT ( * ) FROM giang_vien GROUP BY toa_nha
SELECT toa_nha , COUNT ( * ) FROM giang_vien GROUP BY toa_nha
SELECT toa_nha FROM giang_vien GROUP BY toa_nha ORDER BY COUNT(*) DESC LIMIT 1
SELECT toa_nha FROM giang_vien GROUP BY toa_nha ORDER BY COUNT(*) DESC LIMIT 1
SELECT toa_nha FROM giang_vien GROUP BY toa_nha HAVING COUNT(*) >= 10
SELECT toa_nha FROM giang_vien GROUP BY toa_nha HAVING COUNT(*) >= 10
SELECT giang_vien.ngach , COUNT ( * ) FROM giang_vien GROUP BY giang_vien.ngach
SELECT giang_vien.ngach , COUNT ( * ) FROM giang_vien GROUP BY giang_vien.ngach
SELECT ngach , COUNT(CASE WHEN gioi_tinh = 'nam' THEN 1 END) , COUNT(CASE WHEN gioi_tinh = 'nu' THEN 1 END) FROM giang_vien GROUP BY ngach
SELECT ngach , COUNT(CASE WHEN gioi_tinh = 'nam' THEN 1 END) , COUNT(CASE WHEN gioi_tinh = 'nu' THEN 1 END) FROM giang_vien GROUP BY ngach
SELECT giang_vien.ngach FROM giang_vien GROUP BY giang_vien.ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT ngach FROM giang_vien GROUP BY ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT ( * ) FROM giang_vien GROUP BY gioi_tinh
SELECT gioi_tinh , COUNT ( * ) FROM giang_vien WHERE ngach = 'Trợ lý giáo sư' GROUP BY gioi_tinh
SELECT giang_vien.ho, giang_vien.ten FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien WHERE sinh_vien.ho = 'Smith' AND sinh_vien.ten = 'Linda'
SELECT giang_vien.ho, giang_vien.ten FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien WHERE sinh_vien.ten = 'Linda' AND sinh_vien.ho = 'Smith'
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien WHERE giang_vien.ngach = 'Giáo sư'
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien WHERE giang_vien.ngach = 'Giáo sư'
SELECT sinh_vien.ho, sinh_vien.ten FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien WHERE giang_vien.ho = 'Goodrich' AND giang_vien.ten = 'Micheal'
SELECT sinh_vien.ho, sinh_vien.ten FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien WHERE giang_vien.ho = 'Goodrich' AND giang_vien.ten = 'Micheal'
SELECT giang_vien.id_giang_vien , COUNT ( * ) FROM giang_vien JOIN sinh_vien ON giang_vien.id_giang_vien = sinh_vien.co_van GROUP BY giang_vien.id_giang_vien
SELECT giang_vien.id_giang_vien , COUNT ( * ) FROM giang_vien JOIN sinh_vien ON giang_vien.id_giang_vien = sinh_vien.co_van GROUP BY giang_vien.id_giang_vien
SELECT giang_vien.ngach , COUNT ( * ) FROM giang_vien JOIN sinh_vien ON giang_vien.id_giang_vien = sinh_vien.co_van GROUP BY giang_vien.ngach
SELECT giang_vien.ngach , COUNT ( * ) FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien GROUP BY giang_vien.ngach
SELECT giang_vien.ho , giang_vien.ten FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien GROUP BY giang_vien.id_giang_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT giang_vien.ho , giang_vien.ten FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien GROUP BY giang_vien.id_giang_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT co_van FROM sinh_vien GROUP BY co_van HAVING COUNT(*) >= 2
SELECT giang_vien.id_giang_vien FROM giang_vien JOIN sinh_vien ON giang_vien.id_giang_vien = sinh_vien.co_van GROUP BY giang_vien.id_giang_vien HAVING COUNT(*) >= 2
SELECT id_giang_vien FROM giang_vien WHERE id_giang_vien NOT IN (SELECT co_van FROM sinh_vien)
SELECT id_giang_vien FROM giang_vien WHERE id_giang_vien NOT IN (SELECT co_van FROM sinh_vien)
SELECT ten_hoat_dong FROM hoat_dong
SELECT ten_hoat_dong FROM hoat_dong
SELECT COUNT(*) FROM hoat_dong
SELECT COUNT(*) FROM hoat_dong
SELECT COUNT(*) FROM giang_vien_tham_gia_vao
SELECT COUNT ( * ) FROM giang_vien_tham_gia_vao
SELECT id_giang_vien FROM giang_vien WHERE id_giang_vien NOT IN (SELECT id_giang_vien FROM giang_vien_tham_gia_vao)
SELECT id_giang_vien FROM giang_vien WHERE id_giang_vien NOT IN (SELECT id_giang_vien FROM giang_vien_tham_gia_vao)
SELECT id_giang_vien FROM giang_vien_tham_gia_vao INTERSECT SELECT co_van FROM sinh_vien
SELECT g.id_giang_vien FROM giang_vien AS g JOIN giang_vien_tham_gia_vao AS gtv ON g.id_giang_vien = gtv.id_giang_vien JOIN sinh_vien AS s ON g.id_giang_vien = s.co_van
SELECT COUNT(*) FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien WHERE sinh_vien.ho = 'Giuliano' AND sinh_vien.ten = 'Mark'
SELECT COUNT(DISTINCT tham_gia_vao.id_hoat_dong) FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien WHERE sinh_vien.ho = 'Mark' AND sinh_vien.ten = 'Giuliano'
SELECT hoat_dong.ten_hoat_dong FROM hoat_dong JOIN tham_gia_vao ON hoat_dong.id_hoat_dong = tham_gia_vao.id_hoat_dong JOIN sinh_vien ON tham_gia_vao.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Mark' AND sinh_vien.ten = 'Giuliano'
SELECT T1.ten_hoat_dong FROM hoat_dong AS T1 JOIN tham_gia_vao AS T2 ON T1.id_hoat_dong = T2.id_hoat_dong JOIN sinh_vien AS T3 ON T2.id_sinh_vien = T3.id_sinh_vien WHERE T3.ho = 'Mark' AND T3.ten = 'Giuliano'
SELECT giang_vien.ho , giang_vien.ten , COUNT ( * ) FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien GROUP BY giang_vien.id_giang_vien
SELECT giang_vien.ho , giang_vien.ten , COUNT ( * ) FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien GROUP BY giang_vien.id_giang_vien
SELECT hoat_dong.ten_hoat_dong, COUNT(*) FROM hoat_dong JOIN giang_vien_tham_gia_vao ON hoat_dong.id_hoat_dong = giang_vien_tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong
SELECT ten_hoat_dong , COUNT ( * ) FROM hoat_dong JOIN giang_vien_tham_gia_vao ON hoat_dong.id_hoat_dong = giang_vien_tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong
SELECT T1.ho , T1.ten FROM giang_vien AS T1 JOIN giang_vien_tham_gia_vao AS T2 ON T1.id_giang_vien = T2.id_giang_vien GROUP BY T2.id_giang_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT giang_vien.ho , giang_vien.ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien GROUP BY giang_vien.id_giang_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT hoat_dong.ten_hoat_dong FROM hoat_dong JOIN giang_vien_tham_gia_vao ON hoat_dong.id_hoat_dong = giang_vien_tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT hoat_dong.ten_hoat_dong FROM hoat_dong JOIN giang_vien_tham_gia_vao ON hoat_dong.id_hoat_dong = giang_vien_tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT id_sinh_vien FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM tham_gia_vao)
SELECT id_sinh_vien FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM tham_gia_vao)
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien WHERE sinh_vien.tuoi < 20
SELECT tham_gia_vao.id_hoat_dong FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien WHERE sinh_vien.tuoi < 20
SELECT sinh_vien.ho , sinh_vien.ten FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT sinh_vien.ho , sinh_vien.ten FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.ten_hoat_dong FROM hoat_dong AS T1 JOIN tham_gia_vao AS T2 ON T1.id_hoat_dong = T2.id_hoat_dong GROUP BY T1.id_hoat_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT hoat_dong.ten_hoat_dong FROM hoat_dong JOIN tham_gia_vao ON hoat_dong.id_hoat_dong = tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT ho, ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE ten_hoat_dong IN ('Bơi xuong', 'Chèo thuyền Kayak')
SELECT giang_vien.ho , giang_vien.ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong IN ('Bơi xuồng', 'Chèo thuyền Kayak')
SELECT ho , ten FROM giang_vien WHERE id_giang_vien NOT IN ( SELECT DISTINCT giang_vien_tham_gia_vao.id_giang_vien FROM giang_vien_tham_gia_vao JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong IN ( 'Bơi xuồng' , 'Chèo thuyền Kayak' ) )
SELECT ho, ten FROM giang_vien WHERE id_giang_vien NOT IN (SELECT T2.id_giang_vien FROM giang_vien_tham_gia_vao AS T2 JOIN hoat_dong AS T3 ON T2.id_hoat_dong = T3.id_hoat_dong WHERE T3.ten_hoat_dong IN ('Bơi xuồng', 'Chèo thuyền Kayak'))
SELECT ho , ten FROM giang_vien WHERE id_giang_vien IN ( SELECT id_giang_vien FROM giang_vien_tham_gia_vao JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Bơi xuồng' INTERSECT SELECT id_giang_vien FROM giang_vien_tham_gia_vao JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Chèo thuyền Kayak' )
SELECT T1.ho , T1.ten FROM giang_vien AS T1 JOIN giang_vien_tham_gia_vao AS T2 ON T1.id_giang_vien = T2.id_giang_vien JOIN hoat_dong AS T3 ON T2.id_hoat_dong = T3.id_hoat_dong WHERE T3.ten_hoat_dong = 'Bơi xuồng' INTERSECT SELECT T1.ho , T1.ten FROM giang_vien AS T1 JOIN giang_vien_tham_gia_vao AS T2 ON T1.id_giang_vien = T2.id_giang_vien JOIN hoat_dong AS T3 ON T2.id_hoat_dong = T3.id_hoat_dong WHERE T3.ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT id_sinh_vien FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien JOIN hoat_dong ON tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Bơi xuồng' INTERSECT SELECT id_sinh_vien FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien JOIN hoat_dong ON tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT T1.id_sinh_vien FROM tham_gia_vao AS T1 JOIN hoat_dong AS T2 ON T1.id_hoat_dong = T2.id_hoat_dong WHERE T2.ten_hoat_dong = 'Bơi xuồng' INTERSECT SELECT T1.id_sinh_vien FROM tham_gia_vao AS T1 JOIN hoat_dong AS T2 ON T1.id_hoat_dong = T2.id_hoat_dong WHERE T2.ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT COUNT(*) FROM nguoi_luyen_the_hinh
SELECT tong FROM nguoi_luyen_the_hinh ORDER BY tong ASC
SELECT nguoi_luyen_the_hinh.cu_giat , nguoi_luyen_the_hinh.cu_day FROM nguoi_luyen_the_hinh ORDER BY nguoi_luyen_the_hinh.cu_giat ASC
SELECT AVG(cu_giat) FROM nguoi_luyen_the_hinh
SELECT cu_day FROM nguoi_luyen_the_hinh ORDER BY tong DESC LIMIT 1
SELECT ngay_sinh FROM ca_nhan ORDER BY chieu_cao ASC
SELECT ten FROM ca_nhan JOIN nguoi_luyen_the_hinh ON ca_nhan.id_ca_nhan = nguoi_luyen_the_hinh.id_ca_nhan
SELECT ca_nhan.ten FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan WHERE nguoi_luyen_the_hinh.tong > 300
SELECT ca_nhan.ten FROM ca_nhan JOIN nguoi_luyen_the_hinh ON ca_nhan.id_ca_nhan = nguoi_luyen_the_hinh.id_ca_nhan ORDER BY ca_nhan.can_nang DESC LIMIT 1
SELECT ca_nhan.ngay_sinh, ca_nhan.noi_sinh FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan ORDER BY nguoi_luyen_the_hinh.tong DESC LIMIT 1
SELECT ca_nhan.chieu_cao FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan WHERE nguoi_luyen_the_hinh.tong < 315
SELECT AVG(nguoi_luyen_the_hinh.tong) FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan WHERE ca_nhan.chieu_cao > 200
SELECT ca_nhan.ten FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan ORDER BY nguoi_luyen_the_hinh.tong DESC
SELECT noi_sinh , COUNT ( * ) FROM ca_nhan GROUP BY noi_sinh
SELECT noi_sinh FROM ca_nhan GROUP BY noi_sinh ORDER BY COUNT(*) DESC LIMIT 1
SELECT noi_sinh FROM ca_nhan GROUP BY noi_sinh HAVING COUNT(*) >= 2
SELECT ca_nhan.chieu_cao , ca_nhan.can_nang FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan ORDER BY ca_nhan.chieu_cao DESC
SELECT nguoi_luyen_the_hinh.id_nguoi_luyen_the_hinh, nguoi_luyen_the_hinh.id_ca_nhan, nguoi_luyen_the_hinh.cu_giat, nguoi_luyen_the_hinh.cu_day, nguoi_luyen_the_hinh.tong, ca_nhan.ten, ca_nhan.chieu_cao, ca_nhan.can_nang, ca_nhan.ngay_sinh, ca_nhan.no_i_sinh FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan
SELECT ten, noi_sinh FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM nguoi_luyen_the_hinh)
SELECT COUNT(DISTINCT noi_sinh) FROM ca_nhan
SELECT COUNT(*) FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM nguoi_luyen_the_hinh)
SELECT ca_nhan.can_nang FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan WHERE nguoi_luyen_the_hinh.cu_giat > 140 OR ca_nhan.chieu_cao > 200
SELECT SUM(tong) FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan WHERE MONTH(ca_nhan.ngay_sinh) = 1
SELECT cu_giat FROM nguoi_luyen_the_hinh ORDER BY cu_giat ASC LIMIT 1
SELECT COUNT(*) FROM ung_cu_vien
SELECT COUNT(*) FROM ung_cu_vien
SELECT ung_cu_vien.nguon_tham_do_y_kien FROM ung_cu_vien GROUP BY ung_cu_vien.nguon_tham_do_y_kien ORDER BY COUNT(*) DESC LIMIT 1
SELECT nguon_tham_do_y_kien FROM ung_cu_vien GROUP BY nguon_tham_do_y_kien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ty_le_ung_ho FROM ung_cu_vien ORDER BY ty_le_ung_ho DESC LIMIT 3
SELECT ty_le_ung_ho FROM ung_cu_vien ORDER BY ty_le_ung_ho DESC LIMIT 3
SELECT id_ung_cu_vien FROM ung_cu_vien ORDER BY ty_le_phan_doi ASC LIMIT 1
SELECT id_ung_cu_vien FROM ung_cu_vien ORDER BY ty_le_phan_doi ASC LIMIT 1
SELECT ty_le_ung_ho , ty_le_xem_xet , ty_le_phan_doi FROM ung_cu_vien ORDER BY ty_le_khong_chac_chan ASC
SELECT ty_le_ung_ho, ty_le_xem_xet, ty_le_phan_doi, ty_le_khong_chac_chan FROM ung_cu_vien ORDER BY ty_le_khong_chac_chan ASC
SELECT nguon_tham_do_y_kien FROM ung_cu_vien ORDER BY ty_le_phan_doi DESC LIMIT 1
SELECT ung_cu_vien.nguon_tham_do_y_kien FROM ung_cu_vien ORDER BY ung_cu_vien.ty_le_phan_doi DESC LIMIT 1
SELECT ten FROM ca_nhan ORDER BY ngay_sinh ASC
SELECT ten, ngay_sinh FROM ca_nhan ORDER BY ngay_sinh ASC
SELECT AVG(chieu_cao), AVG(can_nang) FROM ca_nhan WHERE gioi_tinh = 'M'
SELECT AVG(chieu_cao), AVG(can_nang) FROM ca_nhan WHERE gioi_tinh = 'Nam'
SELECT ten FROM ca_nhan WHERE chieu_cao > 200 OR chieu_cao < 190
SELECT ten FROM ca_nhan WHERE chieu_cao > 200 OR chieu_cao < 190
SELECT AVG(chieu_cao), MIN(can_nang) FROM ca_nhan GROUP BY gioi_tinh
SELECT AVG(chieu_cao), MIN(can_nang) FROM ca_nhan GROUP BY gioi_tinh
SELECT T2.ten , T2.gioi_tinh FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan ORDER BY T1.ty_le_ung_ho DESC LIMIT 1
SELECT T2.ten, T2.gioi_tinh FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan ORDER BY T1.ty_le_ung_ho DESC LIMIT 1
SELECT ca_nhan.ten FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ca_nhan = ca_nhan.id_ca_nhan GROUP BY ca_nhan.gioi_tinh ORDER BY MIN(ung_cu_vien.ty_le_phan_doi) ASC
SELECT ca_nhan.ten, ca_nhan.gioi_tinh FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ca_nhan = ca_nhan.id_ca_nhan GROUP BY ca_nhan.gioi_tinh ORDER BY ung_cu_vien.ty_le_phan_doi ASC LIMIT 1
SELECT T1.gioi_tinh , AVG(T2.ty_le_khong_chac_chan) FROM ca_nhan AS T1 JOIN ung_cu_vien AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan GROUP BY T1.gioi_tinh ORDER BY AVG(T2.ty_le_khong_chac_chan) DESC LIMIT 1
SELECT ca_nhan.gioi_tinh FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ca_nhan = ca_nhan.id_ca_nhan GROUP BY ca_nhan.gioi_tinh ORDER BY AVG(ung_cu_vien.ty_le_khong_chac_chan) DESC LIMIT 1
SELECT ten FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM ung_cu_vien)
SELECT ten FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM ung_cu_vien)
SELECT ten FROM ung_cu_vien WHERE ty_le_ung_ho < ty_le_phan_doi
SELECT T2.ten FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan WHERE T1.ty_le_ung_ho < T1.ty_le_phan_doi
SELECT gioi_tinh , COUNT ( * ) FROM ca_nhan WHERE can_nang > 85 GROUP BY gioi_tinh
SELECT ca_nhan.gioi_tinh , COUNT ( * ) FROM ca_nhan WHERE ca_nhan.can_nang > 85 GROUP BY ca_nhan.gioi_tinh
SELECT ty_le_ung_ho , ty_le_xem_xet , ty_le_phan_doi FROM ung_cu_vien ORDER BY ty_le_ung_ho DESC , ty_le_xem_xet ASC , ty_le_phan_doi ASC LIMIT 1
SELECT ty_le_ung_ho FROM ung_cu_vien ORDER BY ty_le_ung_ho DESC LIMIT 1 SELECT ty_le_xem_xet FROM ung_cu_vien ORDER BY ty_le_xem_xet ASC LIMIT 1 SELECT ty_le_phan_doi FROM ung_cu_vien ORDER BY ty_le_phan_doi ASC LIMIT 1
SELECT T2.ten FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan WHERE T2.gioi_tinh = 'F' ORDER BY T2.ten ASC
SELECT T2.ten FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan WHERE T2.gioi_tinh = 'Nữ' ORDER BY T2.ten ASC
SELECT ten FROM ca_nhan WHERE chieu_cao < (SELECT AVG(chieu_cao) FROM ca_nhan)
SELECT ten FROM ca_nhan WHERE chieu_cao < (SELECT AVG(chieu_cao) FROM ca_nhan)
SELECT id_ca_nhan, gioi_tinh, ten, ngay_sinh, chieu_cao, can_nang FROM ca_nhan
SELECT id_ca_nhan, gioi_tinh, ten, ngay_sinh, chieu_cao, can_nang FROM ca_nhan
SELECT T1.id_thanh_pho FROM thanh_pho T1 JOIN thanh_pho_chu_nha T2 ON T1.id_thanh_pho = T2.thanh_pho_chu_nha WHERE T2.nam = (SELECT MAX(nam) FROM thanh_pho_chu_nha)
SELECT T1.id_thanh_pho FROM thanh_pho_chu_nha AS T1 JOIN thanh_pho AS T2 ON T1.thanh_pho_chu_nha = T2.id_thanh_pho WHERE T1.nam = (SELECT MAX(nam) FROM thanh_pho_chu_nha) GROUP BY T2.id_thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT id_tran_dau FROM tran_dau WHERE giai_dau = 'vòng loại FIFA World Cup 1994'
SELECT id_tran_dau FROM tran_dau WHERE giai_dau = 'vòng loại FIFA World Cup 1994'
SELECT thanh_pho.thanh_pho FROM thanh_pho_chu_nha JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE thanh_pho_chu_nha.nam > 2010
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha JOIN tran_dau ON thanh_pho_chu_nha.id_tran_dau = tran_dau.id_tran_dau WHERE tran_dau.ngay > '2010-12-31'
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha GROUP BY thanh_pho.id_thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha GROUP BY thanh_pho.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT tran_dau.dia_diem FROM tran_dau JOIN thanh_pho_chu_nha ON tran_dau.id_tran_dau = thanh_pho_chu_nha.id_tran_dau WHERE tran_dau.giai_dau = 'Vòng loại FIFA World Cup 1994' AND thanh_pho_chu_nha.thanh_pho_chu_nha = 'Nam Kinh (Giang Tô)'
SELECT tran_dau.dia_diem FROM tran_dau JOIN thanh_pho_chu_nha ON tran_dau.id_tran_dau = thanh_pho_chu_nha.id_tran_dau JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE tran_dau.giai_dau = 'Vòng loại FIFA World Cup 1994' AND thanh_pho.thanh_pho = 'Nam Kinh (Giang Tô)'
SELECT nhiet_do.thang_mot FROM nhiet_do JOIN thanh_pho ON nhiet_do.id_thanh_pho = thanh_pho.id_thanh_pho WHERE thanh_pho.thanh_pho = 'Thượng Hải'
SELECT thang_mot FROM nhiet_do JOIN thanh_pho ON nhiet_do.id_thanh_pho = thanh_pho.id_thanh_pho WHERE thanh_pho.thanh_pho = 'Thượng Hải'
SELECT nam FROM thanh_pho_chu_nha JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE thanh_pho.thanh_pho = 'Thái Châu ( Chiết Giang )'
SELECT thanh_pho_chu_nha.nam FROM thanh_pho_chu_nha JOIN thanh_pho ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha WHERE thanh_pho.thanh_pho = 'Thái Châu ( Chiết Giang )'
SELECT thanh_pho.thanh_pho FROM thanh_pho ORDER BY thanh_pho.dan_so_khu_vuc DESC LIMIT 3
SELECT thanh_pho.thanh_pho FROM thanh_pho ORDER BY thanh_pho.dan_so_khu_vuc DESC LIMIT 3
SELECT thanh_pho, gdp FROM thanh_pho ORDER BY gdp ASC LIMIT 1
SELECT thanh_pho, gdp FROM thanh_pho ORDER BY gdp ASC LIMIT 1
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho ORDER BY nhiet_do.thang_hai DESC LIMIT 1
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho ORDER BY nhiet_do.thang_hai DESC LIMIT 1
SELECT thanh_pho.thanh_pho FROM nhiet_do JOIN thanh_pho ON nhiet_do.id_thanh_pho = thanh_pho.id_thanh_pho WHERE nhiet_do.thang_ba < nhiet_do.thang_tam OR nhiet_do.thang_ba > nhiet_do.thang_muoi
SELECT thanh_pho.thanh_pho FROM nhiet_do JOIN thanh_pho ON nhiet_do.id_thanh_pho = thanh_pho.id_thanh_pho WHERE thang_ba < thang_tam OR thang_ba > thang_muoi
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha WHERE nhiet_do.thang_ba < nhiet_do.thang_bay
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha WHERE nhiet_do.thang_ba < nhiet_do.thang_tam
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho WHERE nhiet_do.thang_ba < nhiet_do.thang_muoi_hai AND thanh_pho.id_thanh_pho NOT IN (SELECT thanh_pho_chu_nha.thanh_pho_chu_nha FROM thanh_pho_chu_nha)
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho WHERE nhiet_do.thang_ba < nhiet_do.thang_muoi_hai AND thanh_pho.id_thanh_pho NOT IN (SELECT thanh_pho_chu_nha.thanh_pho_chu_nha FROM thanh_pho_chu_nha)
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.id_thanh_pho WHERE nhiet_do.thang_hai > nhiet_do.thang_sau OR thanh_pho_chu_nha.id_thanh_pho IS NOT NULL
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho LEFT JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha WHERE (nhiet_do.thang_hai > nhiet_do.thang_sau) OR (thanh_pho_chu_nha.thanh_pho_chu_nha IS NOT NULL)
SELECT thanh_pho.thanh_pho FROM thanh_pho WHERE thanh_pho.dan_so_khu_vuc > 10000000
SELECT thanh_pho.thanh_pho FROM thanh_pho WHERE thanh_pho.dan_so_khu_vuc > 10000000
SELECT thanh_pho.thanh_pho FROM thanh_pho WHERE thanh_pho.dan_so_khu_vuc > 8000000 OR thanh_pho.dan_so_khu_vuc < 5000000
SELECT thanh_pho.thanh_pho FROM thanh_pho WHERE dan_so_khu_vuc > 8000000 OR dan_so_khu_vuc < 5000000
SELECT tran_dau.giai_dau , COUNT ( * ) FROM tran_dau GROUP BY tran_dau.giai_dau
SELECT giai_dau , COUNT ( * ) FROM tran_dau GROUP BY giai_dau
SELECT dia_diem FROM tran_dau ORDER BY ngay DESC
SELECT tran_dau.dia_diem FROM tran_dau ORDER BY tran_dau.ngay DESC
SELECT gdp FROM thanh_pho ORDER BY dan_so_khu_vuc DESC LIMIT 1
SELECT gdp FROM thanh_pho ORDER BY dan_so_khu_vuc DESC LIMIT 1
SELECT thanh_pho.gdp, thanh_pho.dan_so_khu_vuc FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha GROUP BY thanh_pho.id_thanh_pho HAVING COUNT(*) > 1
SELECT thanh_pho.gdp, thanh_pho.dan_so_khu_vuc FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha GROUP BY thanh_pho.id_thanh_pho HAVING COUNT(*) > 1
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán'
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán'
SELECT COUNT(DISTINCT giao_su.ma_so_nhan_vien) FROM giao_su JOIN lop_hoc ON giao_su.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su WHERE lop_hoc.ma_lop_hoc = 'ACCT-211'
SELECT COUNT(DISTINCT ma_so_nhan_vien_cua_giao_su) FROM lop_hoc WHERE ma_lop_hoc = 'ACCT-211'
SELECT nhan_vien.ho_cua_nhan_vien , nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Sinh học'
SELECT T2.ho_cua_nhan_vien , T2.ten_cua_nhan_vien FROM giao_su AS T1 JOIN nhan_vien AS T2 ON T1.ma_so_nhan_vien = T2.ma_so_nhan_vien JOIN khoa AS T3 ON T1.ma_khoa = T3.ma_khoa WHERE T3.ten_khoa = 'Sinh học'
SELECT ho_cua_nhan_vien , ten_cua_nhan_vien , ngay_sinh_cua_nhan_vien FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN nhan_vien ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT T3.ho_cua_nhan_vien , T3.ten_cua_nhan_vien , T3.ngay_sinh_cua_nhan_vien FROM giao_su AS T1 JOIN lop_hoc AS T2 ON T1.ma_so_nhan_vien = T2.ma_so_nhan_vien_cua_giao_su JOIN nhan_vien AS T3 ON T1.ma_so_nhan_vien = T3.ma_so_nhan_vien WHERE T2.ma_khoa_hoc = 'ACCT-211'
SELECT COUNT(*) FROM lop_hoc JOIN nhan_vien ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien WHERE nhan_vien.ho_cua_nhan_vien = 'Graztevski'
SELECT COUNT(*) FROM lop_hoc JOIN nhan_vien ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien WHERE nhan_vien.ho_cua_nhan_vien = 'Graztevski'
SELECT ma_truong FROM khoa WHERE ten_khoa = 'Kế toán'
SELECT ma_truong FROM khoa WHERE ten_khoa = 'Kế toán'
SELECT ma_khoa_hoc, so_luong_tin_chi_cua_khoa_hoc, mo_ta_ve_khoa_hoc FROM khoa_hoc WHERE ma_khoa_hoc = 'CIS-220'
SELECT mo_ta_ve_khoa_hoc, so_luong_tin_chi_cua_khoa_hoc FROM khoa_hoc WHERE ma_khoa_hoc = 'CIS-220'
SELECT dia_chi_khoa FROM khoa WHERE ten_khoa = 'Lịch sử'
SELECT dia_chi_khoa FROM khoa WHERE ten_khoa = 'Lịch sử'
SELECT COUNT(*) FROM khoa WHERE ma_khoa = 'BUS'
SELECT COUNT(DISTINCT dia_chi_khoa) FROM khoa WHERE ma_truong = 'BUS'
SELECT ma_truong , COUNT(DISTINCT dia_chi_khoa) FROM khoa GROUP BY ma_truong
SELECT ma_truong , COUNT(DISTINCT dia_chi_khoa) FROM khoa GROUP BY ma_truong
SELECT mo_ta_ve_khoa_hoc, so_luong_tin_chi_cua_khoa_hoc FROM khoa_hoc WHERE ma_khoa_hoc = 'QM-261'
SELECT so_luong_tin_chi_cua_khoa_hoc , mo_ta_ve_khoa_hoc FROM khoa_hoc WHERE ma_khoa_hoc = 'QM-261'
SELECT ma_truong, COUNT(*) FROM khoa GROUP BY ma_truong
SELECT ma_truong , COUNT ( * ) FROM khoa GROUP BY ma_truong
SELECT ma_truong , COUNT ( * ) FROM khoa GROUP BY ma_truong HAVING COUNT ( * ) < 5
SELECT ma_truong , COUNT ( * ) FROM khoa GROUP BY ma_truong HAVING COUNT ( * ) < 5
SELECT T1.ma_khoa_hoc , COUNT ( * ) FROM khoa_hoc AS T1 JOIN lop_hoc AS T2 ON T1.ma_khoa_hoc = T2.ma_khoa_hoc GROUP BY T1.ma_khoa_hoc
SELECT T1.ma_khoa_hoc , COUNT ( * ) FROM khoa_hoc AS T1 JOIN lop_hoc AS T2 ON T1.ma_khoa_hoc = T2.ma_khoa_hoc GROUP BY T1.ma_khoa_hoc
SELECT khoa.ma_khoa , SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa GROUP BY khoa.ma_khoa
SELECT T1.ma_khoa , SUM(T2.so_luong_tin_chi_cua_khoa_hoc) FROM khoa AS T1 JOIN khoa_hoc AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa
SELECT COUNT(*) FROM lop_hoc WHERE phong_hoc IN (SELECT phong_hoc FROM lop_hoc GROUP BY phong_hoc HAVING COUNT(*) >= 2)
SELECT phong_hoc , COUNT ( * ) FROM lop_hoc GROUP BY phong_hoc HAVING COUNT ( * ) >= 2
SELECT khoa.ma_khoa , COUNT ( * ) FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ma_khoa , COUNT ( * ) FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa JOIN lop_hoc ON khoa_hoc.ma_khoa_hoc = lop_hoc.ma_khoa_hoc GROUP BY khoa.ma_khoa
SELECT khoa.ma_truong , COUNT ( * ) FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_truong
SELECT COUNT(*) , khoa.ten_khoa FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ten_khoa
SELECT khoa.ma_truong , COUNT ( * ) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_truong
SELECT khoa.ma_truong , COUNT ( * ) FROM khoa JOIN giao_su ON khoa.ma_khoa = giao_su.ma_khoa GROUP BY khoa.ma_truong
SELECT ma_cong_viec_cua_nhan_vien , COUNT ( * ) FROM nhan_vien GROUP BY ma_cong_viec_cua_nhan_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT ma_cong_viec_cua_nhan_vien , COUNT ( * ) FROM nhan_vien GROUP BY ma_cong_viec_cua_nhan_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T2.ma_truong FROM giao_su T1 JOIN khoa T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T2.ma_truong ORDER BY COUNT(*) ASC LIMIT 1
SELECT khoa.ma_truong , COUNT ( * ) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_truong ORDER BY COUNT ( * ) ASC LIMIT 1
SELECT khoa.ten_khoa , COUNT ( * ) FROM giao_su AS T1 JOIN khoa AS T2 ON T1.ma_khoa = T2.ma_khoa WHERE T1.bang_cap_cao_nhat = 'Tiến sĩ' GROUP BY T2.ma_khoa
SELECT khoa.ma_khoa , COUNT ( * ) FROM khoa JOIN giao_su ON khoa.ma_khoa = giao_su.ma_khoa WHERE giao_su.bang_cap_cao_nhat = 'Tiến sĩ' GROUP BY khoa.ma_khoa
SELECT khoa.ma_khoa , khoa.ten_khoa , COUNT ( * ) FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ten_khoa , COUNT ( * ) FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ten_khoa , SUM(sinh_vien.gio_hoc_cua_sinh_vien) FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ten_khoa , SUM(sinh_vien.gio_hoc_cua_sinh_vien) FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ma_khoa , AVG(sinh_vien.gpa_cua_sinh_vien) , MAX(sinh_vien.gpa_cua_sinh_vien) , MIN(sinh_vien.gpa_cua_sinh_vien) FROM khoa JOIN sinh_vien ON khoa.ma_khoa = sinh_vien.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ma_khoa , MAX(sinh_vien.gpa_cua_sinh_vien) , MIN(sinh_vien.gpa_cua_sinh_vien) , AVG(sinh_vien.gpa_cua_sinh_vien) FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ten_khoa , AVG(sinh_vien.gpa_cua_sinh_vien) FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa ORDER BY AVG(sinh_vien.gpa_cua_sinh_vien) DESC LIMIT 1
SELECT khoa.ten_khoa , AVG(sinh_vien.gpa_cua_sinh_vien) FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa ORDER BY AVG(sinh_vien.gpa_cua_sinh_vien) DESC LIMIT 1
SELECT COUNT(*) FROM khoa
SELECT COUNT(*) FROM khoa
SELECT COUNT(*) FROM lop_hoc
SELECT COUNT(*) FROM lop_hoc
SELECT COUNT(*) FROM khoa_hoc
SELECT COUNT(*) FROM khoa_hoc
SELECT COUNT(*) FROM khoa
SELECT COUNT(*) FROM khoa
SELECT COUNT(*) FROM khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Hệ thống thông tin máy tính'
SELECT COUNT(*) FROM khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Hệ thống thông tin máy tính'
SELECT COUNT(*) FROM lop_hoc WHERE ma_khoa_hoc = 'ACCT-211'
SELECT COUNT(DISTINCT lop_hoc.lop_hoc_phan) FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT T1.ma_khoa , SUM(T2.so_luong_tin_chi_cua_khoa_hoc) FROM khoa AS T1 JOIN khoa_hoc AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa
SELECT T1.ma_khoa , SUM(T2.so_luong_tin_chi_cua_khoa_hoc) FROM khoa AS T1 JOIN khoa_hoc AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa
SELECT ten_khoa FROM khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa ORDER BY SUM(so_luong_tin_chi_cua_khoa_hoc) DESC LIMIT 1
SELECT khoa.ten_khoa FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa GROUP BY khoa.ma_khoa ORDER BY SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ma_so_sinh_vien) FROM dang_ky_khoa_hoc AS T1 JOIN lop_hoc AS T2 ON T1.ma_lop = T2.ma_lop_hoc JOIN khoa_hoc AS T3 ON T2.ma_khoa_hoc = T3.ma_khoa_hoc WHERE T3.ma_khoa_hoc = 'ACCT-211'
SELECT COUNT(*) FROM dang_ky_khoa_hoc JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT sinh_vien.ho_cua_sinh_vien , sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc WHERE lop_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT sinh_vien.ho_cua_sinh_vien, sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop WHERE lop_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT sinh_vien.ho_cua_sinh_vien , sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc AS T1 ON sinh_vien.ma_so_sinh_vien = T1.ma_so_sinh_vien JOIN lop_hoc ON T1.ma_lop = lop_hoc.ma_lop_hoc WHERE lop_hoc.ma_khoa_hoc = 'ACCT-211' AND T1.diem_so = 'C'
SELECT T1.ten_cua_sinh_vien FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.ma_so_sinh_vien = T2.ma_so_sinh_vien JOIN lop_hoc AS T3 ON T2.ma_lop = T3.ma_lop_hoc JOIN khoa_hoc AS T4 ON T3.ma_khoa_hoc = T4.ma_khoa_hoc WHERE T4.ma_khoa_hoc = 'ACCT-211' AND T2.diem_so = 'C'
SELECT COUNT(*) FROM nhan_vien
SELECT COUNT(*) FROM nhan_vien
SELECT COUNT ( * ) FROM giao_su WHERE bang_cap_cao_nhat = 'Tiến sĩ'
SELECT COUNT(*) FROM giao_su WHERE bang_cap_cao_nhat = 'Tiến sĩ'
SELECT COUNT(*) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN giao_su ON lop_hoc.ma_so_nhan_vien_cua_giao_su = giao_su.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán'
SELECT COUNT(*) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN giao_su ON lop_hoc.ma_so_nhan_vien_cua_giao_su = giao_su.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ma_khoa = 'Kế toán'
SELECT khoa.ten_khoa FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT khoa.ten_khoa FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY sinh_vien.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khoa FROM khoa ORDER BY ten_khoa ASC
SELECT ten_khoa FROM khoa ORDER BY ten_khoa ASC
SELECT khoa_hoc.ma_khoa_hoc FROM khoa_hoc JOIN lop_hoc ON khoa_hoc.ma_khoa_hoc = lop_hoc.ma_khoa_hoc WHERE lop_hoc.phong_hoc = 'KLR 209'
SELECT ma_khoa_hoc FROM khoa_hoc JOIN lop_hoc ON khoa_hoc.ma_khoa_hoc = lop_hoc.ma_khoa_hoc WHERE lop_hoc.phong_hoc = 'KLR 209'
SELECT ho_cua_nhan_vien , ten_cua_nhan_vien FROM nhan_vien WHERE ma_cong_viec_cua_nhan_vien = 'Giáo sư' ORDER BY ngay_sinh_cua_nhan_vien ASC
SELECT ho_cua_nhan_vien , ten_cua_nhan_vien FROM nhan_vien JOIN giao_su ON nhan_vien.ma_so_nhan_vien = giao_su.ma_so_nhan_vien ORDER BY ngay_sinh_cua_nhan_vien ASC
SELECT nhan_vien.ten_cua_nhan_vien , giao_su.van_phong_giao_su FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien ORDER BY nhan_vien.ten_cua_nhan_vien ASC
SELECT T2.ten_cua_nhan_vien , T1.van_phong_giao_su FROM giao_su AS T1 JOIN nhan_vien AS T2 ON T1.ma_so_nhan_vien = T2.ma_so_nhan_vien ORDER BY T2.ten_cua_nhan_vien ASC
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien FROM nhan_vien ORDER BY nhan_vien.ngay_sinh_cua_nhan_vien ASC LIMIT 1
SELECT ho_cua_nhan_vien , ten_cua_nhan_vien FROM nhan_vien ORDER BY ngay_sinh_cua_nhan_vien ASC LIMIT 1
SELECT ho_cua_sinh_vien , ten_cua_sinh_vien , gpa_cua_sinh_vien FROM sinh_vien WHERE gpa_cua_sinh_vien > 3 ORDER BY ngay_sinh_cua_sinh_vien ASC LIMIT 1
SELECT ho_cua_sinh_vien , ten_cua_sinh_vien , gpa_cua_sinh_vien FROM sinh_vien WHERE gpa_cua_sinh_vien > 3 ORDER BY ngay_sinh_cua_sinh_vien DESC LIMIT 1
SELECT ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien WHERE diem_so = 'C'
SELECT T1.ho_cua_sinh_vien , T1.ten_cua_sinh_vien FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.ma_so_sinh_vien = T2.ma_so_sinh_vien WHERE T2.diem_so = 'C'
SELECT ten_khoa FROM khoa JOIN giao_su ON khoa.ma_khoa = giao_su.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT ten_khoa FROM khoa JOIN giao_su ON khoa.ma_khoa = giao_su.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT ten_khoa FROM khoa JOIN giao_su ON khoa.ma_khoa = giao_su.ma_khoa WHERE giao_su.bang_cap_cao_nhat = 'tiến sĩ' GROUP BY khoa.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_khoa FROM khoa AS T1 JOIN giao_su AS T2 ON T1.ma_khoa = T2.ma_khoa WHERE T2.bang_cap_cao_nhat = 'tiến sĩ' GROUP BY T1.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE giao_su.ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc)
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE giao_su.ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc)
SELECT nhan_vien.ho_cua_nhan_vien , nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc)
SELECT ten_cua_nhan_vien , ho_cua_nhan_vien FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc)
SELECT nhan_vien.ho_cua_nhan_vien , giao_su.van_phong_giao_su FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Lịch sử'
SELECT T3.ho_cua_nhan_vien , T1.van_phong_giao_su FROM giao_su AS T1 JOIN khoa AS T2 ON T1.ma_khoa = T2.ma_khoa JOIN nhan_vien AS T3 ON T1.ma_so_nhan_vien = T3.ma_so_nhan_vien WHERE T2.ten_khoa = 'Lịch sử'
SELECT giao_su.van_phong_giao_su , khoa.ten_khoa FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE nhan_vien.ho_cua_nhan_vien = 'Heffington'
SELECT T2.ten_khoa , T1.van_phong_giao_su FROM giao_su AS T1 JOIN khoa AS T2 ON T1.ma_khoa = T2.ma_khoa JOIN nhan_vien AS T3 ON T1.ma_so_nhan_vien = T3.ma_so_nhan_vien WHERE T3.ho_cua_nhan_vien = 'Heffington'
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ngay_bat_dau_cong_viec_cua_nhan_vien FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE giao_su.van_phong_giao_su = 'DRE 102'
SELECT nhan_vien.ho_cua_nhan_vien , nhan_vien.ngay_bat_dau_cong_viec_cua_nhan_vien FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE giao_su.van_phong_giao_su = 'DRE 102'
SELECT khoa_hoc.ma_khoa_hoc FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE sinh_vien.ho_cua_sinh_vien = 'Smithson'
SELECT dang_ky_khoa_hoc.ma_khoa_hoc FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien WHERE sinh_vien.ho_cua_sinh_vien = 'Smithson'
SELECT khoa_hoc.so_luong_tin_chi_cua_khoa_hoc , khoa_hoc.mo_ta_ve_khoa_hoc FROM khoa_hoc JOIN lop_hoc ON khoa_hoc.ma_khoa_hoc = lop_hoc.ma_khoa_hoc JOIN dang_ky_khoa_hoc ON lop_hoc.ma_lop_hoc = dang_ky_khoa_hoc.ma_lop JOIN sinh_vien ON dang_ky_khoa_hoc.ma_so_sinh_vien = sinh_vien.ma_so_sinh_vien WHERE sinh_vien.ho_cua_sinh_vien = 'Smithson'
SELECT T4.mo_ta_ve_khoa_hoc, T4.so_luong_tin_chi_cua_khoa_hoc FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.ma_so_sinh_vien = T2.ma_so_sinh_vien JOIN lop_hoc AS T3 ON T2.ma_lop = T3.ma_lop_hoc JOIN khoa_hoc AS T4 ON T3.ma_khoa_hoc = T4.ma_khoa_hoc WHERE T1.ho_cua_sinh_vien = 'Smithson'
SELECT COUNT(*) FROM giao_su WHERE bang_cap_cao_nhat = 'Tiến sĩ' OR bang_cap_cao_nhat = 'Thạc sĩ'
SELECT COUNT(*) FROM giao_su WHERE bang_cap_cao_nhat IN ('Tiến sĩ', 'Thạc sĩ')
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa IN ('Kế toán', 'Sinh học')
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán' OR khoa.ten_khoa = 'Sinh học'
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien FROM lop_hoc JOIN nhan_vien ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien WHERE lop_hoc.ma_khoa_hoc IN ('CIS-220', 'QM-261')
SELECT nhan_vien.ho_cua_nhan_vien , nhan_vien.ten_cua_nhan_vien FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN giao_su ON lop_hoc.ma_so_nhan_vien_cua_giao_su = giao_su.ma_so_nhan_vien JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE khoa_hoc.ma_khoa_hoc IN ('CIS-220', 'QM-261')
SELECT sinh_vien.ho_cua_sinh_vien, sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa IN ('Kế toán', 'Hệ thống thông tin máy tính') GROUP BY sinh_vien.ma_so_sinh_vien HAVING COUNT(DISTINCT khoa.ten_khoa) = 2
SELECT sinh_vien.ho_cua_sinh_vien, sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán' OR khoa.ten_khoa = 'Hệ thống thông tin máy tính' GROUP BY sinh_vien.ma_so_sinh_vien HAVING COUNT(DISTINCT khoa.ten_khoa) = 2
SELECT AVG(sinh_vien.gpa_cua_sinh_vien) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT AVG(sinh_vien.gpa_cua_sinh_vien) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT ten_cua_sinh_vien, gpa_cua_sinh_vien, so_dien_thoai_cua_sinh_vien FROM sinh_vien ORDER BY gpa_cua_sinh_vien DESC LIMIT 5
SELECT ten_cua_sinh_vien, gpa_cua_sinh_vien, so_dien_thoai_cua_sinh_vien FROM sinh_vien ORDER BY gpa_cua_sinh_vien DESC LIMIT 5
SELECT khoa.ten_khoa FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa ORDER BY sinh_vien.gpa_cua_sinh_vien ASC LIMIT 1
SELECT khoa.ten_khoa FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa ORDER BY sinh_vien.gpa_cua_sinh_vien ASC LIMIT 1
SELECT ten_cua_sinh_vien, gpa_cua_sinh_vien FROM sinh_vien WHERE gpa_cua_sinh_vien < (SELECT AVG(gpa_cua_sinh_vien) FROM sinh_vien)
SELECT ho_cua_sinh_vien , ten_cua_sinh_vien , gpa_cua_sinh_vien FROM sinh_vien WHERE gpa_cua_sinh_vien < ( SELECT AVG ( gpa_cua_sinh_vien ) FROM sinh_vien )
SELECT T1.ten_khoa , T1.dia_chi_khoa FROM khoa AS T1 JOIN sinh_vien AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT ten_khoa, dia_chi_khoa FROM khoa JOIN sinh_vien ON khoa.ma_khoa = sinh_vien.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_khoa , T1.dia_chi_khoa , COUNT ( * ) FROM khoa AS T1 JOIN sinh_vien AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT ( * ) DESC LIMIT 3
SELECT T1.ten_khoa, T1.dia_chi_khoa, COUNT(*) FROM khoa AS T1 JOIN sinh_vien AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) DESC LIMIT 3
SELECT nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.bang_cap_cao_nhat = 'Tiến sĩ'
SELECT nhan_vien.ho_cua_nhan_vien , nhan_vien.ten_cua_nhan_vien , giao_su.van_phong_giao_su FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.bang_cap_cao_nhat = 'Tiến sĩ'
SELECT nhan_vien.ho_cua_nhan_vien , nhan_vien.ten_cua_nhan_vien , khoa_hoc.ma_khoa_hoc FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON nhan_vien.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc
SELECT nhan_vien.ten_cua_nhan_vien , lop_hoc.ma_khoa_hoc FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON nhan_vien.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien, khoa_hoc.mo_ta_ve_khoa_hoc FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON nhan_vien.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc
SELECT nhan_vien.ten_cua_nhan_vien , khoa_hoc.mo_ta_ve_khoa_hoc FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc
SELECT nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su, khoa_hoc.mo_ta_ve_khoa_hoc FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc
SELECT nhan_vien.ho_cua_nhan_vien, nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su, khoa_hoc.mo_ta_ve_khoa_hoc FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON lop_hoc.ma_so_nhan_vien_cua_giao_su = giao_su.ma_so_nhan_vien JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc
SELECT nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su, khoa_hoc.mo_ta_ve_khoa_hoc, khoa.ten_khoa FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa
SELECT nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su, khoa.ten_khoa, khoa_hoc.mo_ta_ve_khoa_hoc FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON nhan_vien.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa
SELECT T1.ho_cua_sinh_vien , T1.ten_cua_sinh_vien , T4.mo_ta_ve_khoa_hoc FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.ma_so_sinh_vien = T2.ma_so_sinh_vien JOIN lop_hoc AS T3 ON T2.ma_lop = T3.ma_lop_hoc JOIN khoa_hoc AS T4 ON T3.ma_khoa_hoc = T4.ma_khoa_hoc
SELECT sinh_vien.ho_cua_sinh_vien, sinh_vien.ten_cua_sinh_vien, khoa_hoc.mo_ta_ve_khoa_hoc FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc
SELECT ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien WHERE diem_so IN ('A', 'C')
SELECT T1.ten_cua_sinh_vien , T1.ho_cua_sinh_vien FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.ma_so_sinh_vien = T2.ma_so_sinh_vien WHERE T2.diem_so IN ('A', 'C')
SELECT nhan_vien.ho_cua_nhan_vien , nhan_vien.ten_cua_nhan_vien , lop_hoc.phong_hoc FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Kế toán'
SELECT giao_su.ho_cua_nhan_vien, giao_su.ten_cua_nhan_vien, lop_hoc.phong_hoc FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON nhan_vien.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su WHERE khoa.ten_khoa = 'Kế toán'
SELECT ten_cua_giao_su, bang_cap_cao_nhat FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Hệ thống Thông tin Máy tính'
SELECT nhan_vien.ten_cua_nhan_vien , giao_su.bang_cap_cao_nhat FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Hệ thống thông tin máy tính'
SELECT T1.ho_cua_sinh_vien FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.ma_so_sinh_vien = T2.ma_so_sinh_vien WHERE T2.ma_lop = '10018' AND T2.diem_so = 'A'
SELECT ho_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien WHERE dang_ky_khoa_hoc.ma_lop = '10018' AND diem_so = 'A'
SELECT nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.bang_cap_cao_nhat != 'Tiến sĩ'
SELECT nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.bang_cap_cao_nhat != 'Tiến sĩ'
SELECT nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON nhan_vien.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su GROUP BY giao_su.ma_so_nhan_vien HAVING COUNT(*) > 1
SELECT nhan_vien.ho_cua_nhan_vien , nhan_vien.ten_cua_nhan_vien FROM giao_su JOIN lop_hoc ON giao_su.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien GROUP BY nhan_vien.ma_so_nhan_vien HAVING COUNT ( * ) > 1
SELECT ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien GROUP BY sinh_vien.ma_so_sinh_vien HAVING COUNT(*) = 1
SELECT ho_cua_sinh_vien , ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien GROUP BY sinh_vien.ma_so_sinh_vien HAVING COUNT ( * ) = 1
SELECT ten_khoa FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa WHERE khoa_hoc.mo_ta_ve_khoa_hoc LIKE '%Thong ke%'
SELECT T1.ten_khoa FROM khoa AS T1 JOIN khoa_hoc AS T2 ON T1.ma_khoa = T2.ma_khoa WHERE T2.mo_ta_ve_khoa_hoc LIKE '%Thong ke%'
SELECT T1.ho_cua_sinh_vien , T1.ten_cua_sinh_vien FROM sinh_vien AS T1 JOIN dang_ky_khoa_hoc AS T2 ON T1.ma_so_sinh_vien = T2.ma_so_sinh_vien JOIN lop_hoc AS T3 ON T2.ma_lop = T3.ma_lop_hoc JOIN khoa_hoc AS T4 ON T3.ma_khoa_hoc = T4.ma_khoa_hoc WHERE T4.ma_khoa_hoc = 'ACCT-211' AND T1.ho_cua_sinh_vien LIKE 'S%'
SELECT ho_cua_sinh_vien , ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211' AND ho_cua_sinh_vien LIKE 'S%'
SELECT ma_trang_thai_tai_lieu FROM trang_thai_cua_tai_lieu
SELECT trang_thai_cua_tai_lieu.mo_ta_ve_trang_thai_tai_lieu FROM tai_lieu JOIN trang_thai_cua_tai_lieu ON tai_lieu.ma_trang_thai_tai_lieu = trang_thai_cua_tai_lieu.ma_trang_thai_tai_lieu WHERE tai_lieu.ma_trang_thai_tai_lieu = 'đang được xử lý'
SELECT ma_loai_tai_lieu FROM loai_tai_lieu
SELECT mo_ta_ve_loai_tai_lieu FROM loai_tai_lieu WHERE mo_ta_ve_loai_tai_lieu = 'Giấy'
SELECT ten_dai_ly_van_chuyen FROM dai_ly_van_chuyen_tai_lieu
SELECT ma_dai_ly_van_chuyen FROM dai_ly_van_chuyen_tai_lieu WHERE ten_dai_ly_van_chuyen = 'UPS'
SELECT ma_vai_tro FROM vai_tro
SELECT mo_ta_ve_vai_tro FROM vai_tro WHERE ma_vai_tro = 'ED'
SELECT COUNT(*) FROM nhan_vien
SELECT vai_tro.mo_ta_ve_vai_tro FROM nhan_vien JOIN vai_tro ON nhan_vien.ma_vai_tro = vai_tro.ma_vai_tro WHERE nhan_vien.ten_nhan_vien = 'Koby'
SELECT id_tai_lieu, ngay_lap_bien_lai FROM tai_lieu
SELECT T1.mo_ta_ve_vai_tro, T1.ma_vai_tro, COUNT(*) FROM vai_tro AS T1 JOIN nhan_vien AS T2 ON T1.ma_vai_tro = T2.ma_vai_tro GROUP BY T1.ma_vai_tro
SELECT T1.mo_ta_ve_vai_tro , COUNT ( * ) FROM vai_tro AS T1 JOIN nhan_vien AS T2 ON T1.ma_vai_tro = T2.ma_vai_tro GROUP BY T1.ma_vai_tro
SELECT trang_thai_cua_tai_lieu.mo_ta_ve_trang_thai_tai_lieu FROM tai_lieu JOIN trang_thai_cua_tai_lieu ON tai_lieu.ma_trang_thai_tai_lieu = trang_thai_cua_tai_lieu.ma_trang_thai_tai_lieu WHERE tai_lieu.id_tai_lieu = 1
SELECT COUNT ( * ) FROM tai_lieu JOIN trang_thai_cua_tai_lieu ON tai_lieu.ma_trang_thai_tai_lieu = trang_thai_cua_tai_lieu.ma_trang_thai_tai_lieu WHERE trang_thai_cua_tai_lieu.mo_ta_ve_trang_thai_tai_lieu = 'Đã được hoàn thành'
SELECT ma_loai_tai_lieu FROM tai_lieu WHERE id_tai_lieu = 2
SELECT id_tai_lieu FROM tai_lieu WHERE ma_trang_thai_tai_lieu = 'Đã được hoàn thành' AND ma_loai_tai_lieu = 'Giấy'
SELECT dai_ly_van_chuyen_tai_lieu.ten_dai_ly_van_chuyen FROM tai_lieu JOIN dai_ly_van_chuyen_tai_lieu ON tai_lieu.ma_dai_ly_van_chuyen = dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen WHERE tai_lieu.id_tai_lieu = 2
SELECT COUNT(*) FROM tai_lieu JOIN dai_ly_van_chuyen_tai_lieu ON tai_lieu.ma_dai_ly_van_chuyen = dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen WHERE dai_ly_van_chuyen_tai_lieu.ten_dai_ly_van_chuyen = 'USPS'
SELECT T1.ten_dai_ly_van_chuyen , COUNT ( * ) FROM dai_ly_van_chuyen_tai_lieu AS T1 JOIN tai_lieu AS T2 ON T1.ma_dai_ly_van_chuyen = T2.ma_dai_ly_van_chuyen GROUP BY T1.ma_dai_ly_van_chuyen ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT ngay_lap_bien_lai FROM tai_lieu WHERE id_tai_lieu = 3
SELECT T3.chi_tiet_dia_chi FROM tai_lieu AS T1 JOIN tai_lieu_duoc_gui AS T2 ON T1.id_tai_lieu = T2.id_tai_lieu JOIN dia_chi AS T3 ON T2.gui_den_dia_chi_co_id = T3.id_dia_chi WHERE T1.id_tai_lieu = 4
SELECT ngay_gui FROM tai_lieu_duoc_gui WHERE id_tai_lieu = 7
SELECT tai_lieu.id_tai_lieu FROM tai_lieu JOIN trang_thai_cua_tai_lieu ON tai_lieu.ma_trang_thai_tai_lieu = trang_thai_cua_tai_lieu.ma_trang_thai_tai_lieu JOIN loai_tai_lieu ON tai_lieu.ma_loai_tai_lieu = loai_tai_lieu.ma_loai_tai_lieu JOIN dai_ly_van_chuyen_tai_lieu ON tai_lieu.ma_dai_ly_van_chuyen = dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen WHERE trang_thai_cua_tai_lieu.mo_ta_ve_trang_thai_tai_lieu = 'Đã được hoàn thành' AND loai_tai_lieu.mo_ta_ve_loai_tai_lieu = 'Giấy' AND tai_lieu.ma_dai_ly_van_chuyen NOT IN (SELECT ma_dai_ly_van_chuyen FROM dai_ly_van_chuyen_tai_lieu WHERE ten_dai_ly_van_chuyen = 'USPS')
SELECT tai_lieu.id_tai_lieu FROM tai_lieu JOIN trang_thai_cua_tai_lieu ON tai_lieu.ma_trang_thai_tai_lieu = trang_thai_cua_tai_lieu.ma_trang_thai_tai_lieu JOIN loai_tai_lieu ON tai_lieu.ma_loai_tai_lieu = loai_tai_lieu.ma_loai_tai_lieu JOIN dai_ly_van_chuyen_tai_lieu ON tai_lieu.ma_dai_ly_van_chuyen = dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen WHERE trang_thai_cua_tai_lieu.mo_ta_ve_trang_thai_tai_lieu = 'Đã được hoàn thành' AND loai_tai_lieu.mo_ta_ve_loai_tai_lieu = 'Giấy' AND dai_ly_van_chuyen_tai_lieu.ten_dai_ly_van_chuyen = 'USPS'
SELECT T2.so_luong_du_thao, T2.chi_tiet_du_thao FROM tai_lieu AS T1 JOIN ban_du_thao_cua_tai_lieu AS T2 ON T1.id_tai_lieu = T2.id_tai_lieu WHERE T1.id_tai_lieu = 7
SELECT so_luong_ban_sao FROM ban_sao WHERE id_tai_lieu = 2
SELECT id_tai_lieu , so_luong_ban_sao FROM ban_sao ORDER BY so_luong_ban_sao DESC LIMIT 1
SELECT T1.id_tai_lieu , T2.so_luong_du_thao FROM tai_lieu AS T1 JOIN ban_sao AS T2 ON T1.id_tai_lieu = T2.id_tai_lieu WHERE T2.so_luong_du_thao > 1 GROUP BY T1.id_tai_lieu ORDER BY T2.so_luong_du_thao DESC LIMIT 10
SELECT T2.ten_nhan_vien FROM lich_su_luu_hanh AS T1 JOIN nhan_vien AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien WHERE T1.id_tai_lieu = 1
SELECT ten_nhan_vien FROM nhan_vien WHERE id_nhan_vien NOT IN (SELECT id_nhan_vien FROM lich_su_luu_hanh)
SELECT nhan_vien.ten_nhan_vien , COUNT ( * ) FROM lich_su_luu_hanh JOIN nhan_vien ON lich_su_luu_hanh.id_nhan_vien = nhan_vien.id_nhan_vien GROUP BY nhan_vien.id_nhan_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.id_tai_lieu , COUNT ( DISTINCT T2.id_nhan_vien ) FROM tai_lieu AS T1 JOIN lich_su_luu_hanh AS T2 ON T1.id_tai_lieu = T2.id_tai_lieu GROUP BY T1.id_tai_lieu
SELECT COUNT(*) FROM dbo.luot_dat_hang
SELECT COUNT(*) FROM luot_dat_hang
SELECT luot_dat_hang.ngay_dat_hang FROM luot_dat_hang
SELECT luot_dat_hang.ngay_dat_hang FROM luot_dat_hang
SELECT ngay_giao_hang_theo_ke_hoach, ngay_giao_hang_thuc_te FROM luot_dat_hang
SELECT ngay_giao_hang_theo_ke_hoach, ngay_giao_hang_thuc_te FROM luot_dat_hang
SELECT COUNT(*) FROM khach_hang
SELECT COUNT(*) FROM khach_hang
SELECT dia_chi_email_khach_hang, so_dien_thoai_khach_hang FROM khach_hang_1 WHERE ten_khach_hang = 'Harold'
SELECT cua_hang.ten_cua_hang FROM nhom_hoi_thao_kich JOIN cua_hang ON nhom_hoi_thao_kich.id_cua_hang = cua_hang.id_cua_hang
SELECT cua_hang.ten_cua_hang FROM nhom_hoi_thao_kich JOIN cua_hang ON nhom_hoi_thao_kich.id_cua_hang = cua_hang.id_cua_hang
SELECT MIN(so_luong_dat_hang), AVG(so_luong_dat_hang), MAX(so_luong_dat_hang) FROM hoa_don
SELECT MIN(mat_hang_trong_hoa_don.so_luong_dat_hang), AVG(mat_hang_trong_hoa_don.so_luong_dat_hang), MAX(mat_hang_trong_hoa_don.so_luong_dat_hang) FROM mat_hang_trong_hoa_don
SELECT DISTINCT ma_phuong_thuc_thanh_toan FROM hoa_don
SELECT DISTINCT ma_phuong_thuc_thanh_toan FROM hoa_don
SELECT khu_vuc_tiep_thi.mo_ta_ve_khu_vuc_tiep_thi FROM khu_vuc_tiep_thi WHERE khu_vuc_tiep_thi.ten_khu_vuc_tiep_thi = 'Trung Quốc'
SELECT mo_ta_ve_khu_vuc_tiep_thi FROM khu_vuc_tiep_thi WHERE ten_khu_vuc_tiep_thi = 'Trung Quốc'
SELECT ten_san_pham FROM cac_san_pham WHERE gia_san_pham > (SELECT AVG(gia_san_pham) FROM cac_san_pham)
SELECT ten_san_pham FROM cac_san_pham WHERE gia_san_pham > (SELECT AVG(gia_san_pham) FROM cac_san_pham)
SELECT ten_san_pham FROM cac_san_pham ORDER BY gia_san_pham DESC LIMIT 1
SELECT ten_san_pham FROM cac_san_pham ORDER BY gia_san_pham DESC LIMIT 1
SELECT ten_san_pham FROM cac_san_pham ORDER BY gia_san_pham ASC
SELECT ten_san_pham FROM cac_san_pham ORDER BY gia_san_pham ASC
SELECT so_dien_thoai_khach_hang FROM nguoi_bieu_dien WHERE ten_khach_hang = 'Ashley'
SELECT so_dien_thoai_khach_hang FROM nguoi_bieu_dien WHERE ten_khach_hang = 'Ashley'
SELECT T1.ma_phuong_thuc_thanh_toan , COUNT ( * ) FROM phuong_thuc_thanh_toan AS T1 JOIN hoa_don AS T2 ON T1.ma_phuong_thuc_thanh_toan = T2.ma_phuong_thuc_thanh_toan JOIN luot_dat_hang AS T3 ON T2.id_don_hang = T3.id_luot_dat_hang GROUP BY T1.ma_phuong_thuc_thanh_toan
SELECT T1.ma_phuong_thuc_thanh_toan , COUNT ( * ) FROM phuong_thuc_thanh_toan AS T1 JOIN hoa_don AS T2 ON T1.ma_phuong_thuc_thanh_toan = T2.ma_phuong_thuc_thanh_toan JOIN luot_dat_hang AS T3 ON T2.id_don_hang = T3.id_luot_dat_hang GROUP BY T1.ma_phuong_thuc_thanh_toan
SELECT phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan FROM phuong_thuc_thanh_toan JOIN hoa_don ON phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan = hoa_don.ma_phuong_thuc_thanh_toan GROUP BY phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan ORDER BY COUNT(*) DESC LIMIT 1
SELECT phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan FROM hoa_don JOIN phuong_thuc_thanh_toan ON hoa_don.ma_phuong_thuc_thanh_toan = phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan GROUP BY phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan ORDER BY COUNT(*) DESC LIMIT 1
SELECT dia_chi.thanh_pho_thi_tran FROM cua_hang JOIN dia_chi ON cua_hang.id_dia_chi = dia_chi.id_dia_chi WHERE cua_hang.ten_cua_hang = 'FJM Filming'
SELECT dia_chi.thanh_pho_thi_tran FROM cua_hang JOIN dia_chi ON cua_hang.id_dia_chi = dia_chi.id_dia_chi WHERE cua_hang.ten_cua_hang = ' FJA Filming '
SELECT dia_chi.thanh_pho_thi_tran , dia_chi.quan_hat FROM cua_hang JOIN dia_chi ON cua_hang.id_dia_chi = dia_chi.id_dia_chi WHERE cua_hang.ma_khu_vuc_tiep_thi = 'CA'
SELECT dia_chi.thanh_pho_thi_tran , dia_chi.quan_hat FROM cua_hang JOIN dia_chi ON cua_hang.id_dia_chi = dia_chi.id_dia_chi WHERE cua_hang.ma_khu_vuc_tiep_thi = 'CA'
SELECT khu_vuc_tiep_thi.ten_khu_vuc_tiep_thi FROM cua_hang JOIN khu_vuc_tiep_thi ON cua_hang.ma_khu_vuc_tiep_thi = khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi WHERE cua_hang.ten_cua_hang = 'Rob Dinning'
SELECT khu_vuc_tiep_thi.ten_khu_vuc_tiep_thi FROM cua_hang JOIN khu_vuc_tiep_thi ON cua_hang.ma_khu_vuc_tiep_thi = khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi WHERE cua_hang.ten_cua_hang = 'Rob Dinning'
SELECT loai_dich_vu.mo_ta_ve_loai_dich_vu FROM loai_dich_vu JOIN dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu WHERE dich_vu.gia_san_pham > 100
SELECT loai_dich_vu.mo_ta_ve_loai_dich_vu FROM loai_dich_vu JOIN dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu WHERE dich_vu.gia_san_pham > 100
SELECT loai_dich_vu.mo_ta_ve_loai_dich_vu, loai_dich_vu.ma_loai_dich_vu, COUNT(*) FROM loai_dich_vu JOIN dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu GROUP BY loai_dich_vu.ma_loai_dich_vu
SELECT T1.mo_ta_ve_loai_dich_vu , T1.ma_loai_dich_vu , COUNT ( * ) FROM loai_dich_vu AS T1 JOIN dich_vu AS T2 ON T1.ma_loai_dich_vu = T2.ma_loai_dich_vu GROUP BY T1.ma_loai_dich_vu
SELECT loai_dich_vu.ma_loai_dich_vu , loai_dich_vu.mo_ta_ve_loai_dich_vu FROM loai_dich_vu JOIN dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu GROUP BY loai_dich_vu.ma_loai_dich_vu ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.ma_loai_dich_vu , T1.mo_ta_ve_loai_dich_vu FROM loai_dich_vu AS T1 JOIN dich_vu AS T2 ON T1.ma_loai_dich_vu = T2.ma_loai_dich_vu GROUP BY T1.ma_loai_dich_vu ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT so_dien_thoai_cua_hang, dia_chi_email_cua_hang FROM nhom_hoi_thao_kich JOIN dich_vu ON nhom_hoi_thao_kich.id_nhom_hoi_thao_kich = dich_vu.id_nhom_hoi_thao_kich WHERE dich_vu.id_nhom_hoi_thao_kich IS NOT NULL
SELECT nhom_hoi_thao_kich.dia_chi_email_cua_hang, nhom_hoi_thao_kich.so_dien_thoai_cua_hang FROM nhom_hoi_thao_kich JOIN dich_vu ON nhom_hoi_thao_kich.id_nhom_hoi_thao_kich = dich_vu.id_nhom_hoi_thao_kich WHERE dich_vu.id_dich_vu IS NOT NULL
SELECT T1.so_dien_thoai_cua_hang, T1.dia_chi_email_cua_hang FROM nhom_hoi_thao_kich AS T1 JOIN dich_vu AS T2 ON T1.id_nhom_hoi_thao_kich = T2.id_nhom_hoi_thao_kich WHERE T2.ten_san_pham = 'phim'
SELECT nhom_hoi_thao_kich.id_nhom_hoi_thao_kich , nhom_hoi_thao_kich.ten_cua_hang FROM nhom_hoi_thao_kich JOIN dich_vu ON nhom_hoi_thao_kich.id_nhom_hoi_thao_kich = dich_vu.id_nhom_hoi_thao_kich WHERE dich_vu.ten_san_pham = 'phim'
SELECT ten_san_pham, gia_san_pham FROM cac_san_pham
SELECT ten_san_pham , AVG(gia_san_pham) FROM cac_san_pham GROUP BY id_san_pham
SELECT ten_san_pham FROM cac_san_pham WHERE gia_san_pham < 1000000
SELECT ten_san_pham FROM cac_san_pham WHERE gia_san_pham < 1000000
SELECT SUM(T1.so_luong_dat_hang) FROM mat_hang_duoc_dat AS T1 JOIN cac_san_pham AS T2 ON T1.id_san_pham = T2.id_san_pham WHERE T2.mo_ta_ve_san_pham LIKE '%ảnh%'
SELECT SUM(mat_hang_duoc_dat.so_luong_dat_hang) FROM mat_hang_duoc_dat JOIN cac_san_pham ON mat_hang_duoc_dat.id_san_pham = cac_san_pham.id_san_pham WHERE cac_san_pham.ten_san_pham = 'ảnh'
SELECT luot_dat_hang.id_luot_dat_hang, luot_dat_hang.id_khach_hang, luot_dat_hang.id_nhom_hoi_thao_kich, luot_dat_hang.ma_trang_thai, luot_dat_hang.id_cua_hang, luot_dat_hang.ngay_dat_hang, luot_dat_hang.ngay_giao_hang_theo_ke_hoach, luot_dat_hang.ngay_giao_hang_thuc_te, luot_dat_hang.chi_tiet_khac_ve_don_hang FROM cac_san_pham JOIN mat_hang_duoc_dat ON cac_san_pham.id_san_pham = mat_hang_duoc_dat.id_san_pham JOIN luot_dat_hang ON mat_hang_duoc_dat.id_don_hang = luot_dat_hang.id_luot_dat_hang WHERE cac_san_pham.gia_san_pham > 2000
SELECT T1.ten_san_pham, T1.gia_san_pham, T1.mo_ta_ve_san_pham, T3.id_luot_dat_hang, T3.ngay_dat_hang, T3.ma_trang_thai, T2.so_luong_dat_hang FROM cac_san_pham AS T1 JOIN mat_hang_duoc_dat AS T2 ON T1.id_san_pham = T2.id_san_pham JOIN luot_dat_hang AS T3 ON T2.id_don_hang = T3.id_luot_dat_hang WHERE T1.gia_san_pham > 2000
SELECT T1.ngay_giao_hang_thuc_te FROM luot_dat_hang_cua_khach_hang AS T1 JOIN mat_hang_duoc_dat AS T2 ON T1.id_don_hang = T2.id_don_hang WHERE T2.so_luong_dat_hang = '1'
SELECT T1.ngay_giao_hang_thuc_te FROM luot_dat_hang_cua_khach_hang AS T1 JOIN mat_hang_duoc_dat AS T2 ON T1.id_don_hang = T2.id_don_hang WHERE T2.so_luong_dat_hang = '1'
SELECT T1.ngay_dat_hang FROM luot_dat_hang_cua_khach_hang AS T1 JOIN mat_hang_duoc_dat AS T2 ON T1.id_don_hang = T2.id_don_hang JOIN cac_san_pham AS T3 ON T2.id_san_pham = T3.id_san_pham JOIN dich_vu AS T4 ON T2.id_dich_vu = T4.id_dich_vu WHERE (CAST(T2.so_luong_dat_hang AS NUMBER) * T3.gia_san_pham + CAST(T2.so_luong_dat_hang AS NUMBER) * T4.gia_san_pham) > 1000 GROUP BY T1.ngay_dat_hang HAVING SUM(CAST(T2.so_luong_dat_hang AS NUMBER) * T3.gia_san_pham + CAST(T2.so_luong_dat_hang AS NUMBER) * T4.gia_san_pham) > 1000
SELECT T1.ngay_dat_hang FROM luot_dat_hang_cua_khach_hang AS T1 JOIN mat_hang_duoc_dat AS T2 ON T1.id_don_hang = T2.id_don_hang JOIN cac_san_pham AS T3 ON T2.id_san_pham = T3.id_san_pham GROUP BY T1.id_don_hang HAVING SUM(CAST(T3.gia_san_pham AS DECIMAL) * CAST(T2.so_luong_dat_hang AS DECIMAL)) > 1000
SELECT COUNT(DISTINCT ma_tien_te) FROM nhom_hoi_thao_kich
SELECT COUNT(*) FROM nhom_hoi_thao_kich
SELECT nhom_hoi_thao_kich.ten_cua_hang FROM nhom_hoi_thao_kich JOIN dia_chi ON nhom_hoi_thao_kich.id_dia_chi = dia_chi.id_dia_chi WHERE dia_chi.thanh_pho_thi_tran = 'Feliciaberg'
SELECT ten_cua_hang FROM nhom_hoi_thao_kich JOIN dia_chi ON nhom_hoi_thao_kich.id_dia_chi = dia_chi.id_dia_chi WHERE dia_chi.thanh_pho_thi_tran = 'Feliciaberg'
SELECT dia_chi_email_cua_hang FROM nhom_hoi_thao_kich JOIN dia_chi ON nhom_hoi_thao_kich.id_dia_chi = dia_chi.id_dia_chi WHERE thanh_pho_thi_tran = 'Alaska'
SELECT dia_chi.dia_chi_email_cua_hang FROM nhom_hoi_thao_kich JOIN dia_chi ON nhom_hoi_thao_kich.id_dia_chi = dia_chi.id_dia_chi WHERE dia_chi.thanh_pho_thi_tran = 'Alaska'
SELECT T2.thanh_pho_thi_tran , COUNT ( * ) FROM nhom_hoi_thao_kich AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi = T2.id_dia_chi GROUP BY T2.thanh_pho_thi_tran
SELECT dia_chi.thanh_pho_thi_tran , COUNT ( * ) FROM nhom_hoi_thao_kich JOIN dia_chi ON nhom_hoi_thao_kich.id_dia_chi = dia_chi.id_dia_chi GROUP BY dia_chi.thanh_pho_thi_tran
SELECT khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi , COUNT ( * ) FROM nhom_hoi_thao_kich JOIN khu_vuc_tiep_thi ON nhom_hoi_thao_kich.ma_khu_vuc_tiep_thi = khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi GROUP BY khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi FROM khu_vuc_tiep_thi JOIN nhom_hoi_thao_kich ON khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi = nhom_hoi_thao_kich.ma_khu_vuc_tiep_thi GROUP BY khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi ORDER BY COUNT(*) DESC LIMIT 1
SELECT thanh_pho_thi_tran FROM dia_chi WHERE id_dia_chi IN (SELECT id_dia_chi FROM khach_hang UNION SELECT id_dia_chi FROM khach_hang_1) EXCEPT SELECT thanh_pho_thi_tran FROM dia_chi WHERE id_dia_chi IN (SELECT id_dia_chi FROM nguoi_bieu_dien)
SELECT ma_trang_thai , COUNT ( * ) FROM luot_dat_hang GROUP BY ma_trang_thai ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT ma_trang_thai FROM luot_dat_hang GROUP BY ma_trang_thai ORDER BY COUNT(*) DESC LIMIT 1
SELECT nhom_hoi_thao_kich.ten_cua_hang FROM nhom_hoi_thao_kich JOIN luot_dat_hang ON nhom_hoi_thao_kich.id_nhom_hoi_thao_kich = luot_dat_hang.id_nhom_hoi_thao_kich WHERE luot_dat_hang.ma_trang_thai = 'dừng'
SELECT T1.ten_cua_hang FROM nhom_hoi_thao_kich AS T1 JOIN luot_dat_hang AS T2 ON T1.id_nhom_hoi_thao_kich = T2.id_nhom_hoi_thao_kich WHERE T2.ma_trang_thai = 'dừng'
SELECT ten_khach_hang FROM khach_hang_1 WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM luot_dat_hang_cua_khach_hang)
SELECT AVG(hoa_don.so_luong_dat_hang) FROM hoa_don JOIN phuong_thuc_thanh_toan ON hoa_don.ma_phuong_thuc_thanh_toan = phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan WHERE phuong_thuc_thanh_toan.mo_ta_ve_phuong_thuc_thanh_toan = 'Mastercard'
SELECT AVG(hoa_don.so_luong_dat_hang) FROM hoa_don JOIN phuong_thuc_thanh_toan ON hoa_don.ma_phuong_thuc_thanh_toan = phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan WHERE phuong_thuc_thanh_toan.mo_ta_ve_phuong_thuc_thanh_toan = 'Mastercard'
SELECT T1.id_san_pham FROM cac_san_pham AS T1 JOIN mat_hang_trong_hoa_don AS T2 ON T1.id_san_pham = T2.id_san_pham GROUP BY T1.id_san_pham ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_san_pham FROM mat_hang_trong_hoa_don AS T1 JOIN cac_san_pham AS T2 ON T1.id_san_pham = T2.id_san_pham GROUP BY T1.id_san_pham ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.mo_ta_ve_loai_dich_vu FROM loai_dich_vu AS T1 JOIN dich_vu AS T2 ON T1.ma_loai_dich_vu = T2.ma_loai_dich_vu WHERE T2.ten_san_pham = 'ảnh' INTERSECT SELECT T1.mo_ta_ve_loai_dich_vu FROM loai_dich_vu AS T1 JOIN dich_vu AS T2 ON T1.ma_loai_dich_vu = T2.ma_loai_dich_vu WHERE T2.ten_san_pham = 'phim'
SELECT loai_dich_vu.mo_ta_ve_loai_dich_vu FROM loai_dich_vu JOIN dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu WHERE dich_vu.mo_ta_ve_san_pham LIKE '%ảnh%' OR dich_vu.mo_ta_ve_san_pham LIKE '%phim%'
SELECT COUNT(*) FROM tai_khoan
SELECT COUNT(*) FROM tai_khoan
SELECT COUNT(DISTINCT khach_hang.id_khach_hang) FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang
SELECT COUNT(*) FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang
SELECT id_tai_khoan , ngay_mo_tai_khoan , ten_tai_khoan , chi_tiet_khac_ve_tai_khoan FROM tai_khoan
SELECT id_tai_khoan, ngay_mo_tai_khoan, ten_tai_khoan, chi_tiet_khac_ve_tai_khoan FROM tai_khoan
SELECT tai_khoan.id_tai_khoan , tai_khoan.ten_tai_khoan , tai_khoan.ngay_mo_tai_khoan , tai_khoan.chi_tiet_khac_ve_tai_khoan FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten_khach_hang = 'Mea Afghanistan'
SELECT tai_khoan.id_tai_khoan , tai_khoan.ten_tai_khoan , tai_khoan.ngay_mo_tai_khoan , tai_khoan.chi_tiet_khac_ve_tai_khoan FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten_khach_hang = 'Mea Afghanistan'
SELECT tai_khoan.ten_tai_khoan, tai_khoan.chi_tiet_khac_ve_tai_khoan FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten_khach_hang = 'Mea Afghanistan' AND khach_hang.ho_cua_khach_hang = 'Keeling'
SELECT khach_hang.ten_khach_hang, khach_hang.ho_cua_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang WHERE tai_khoan.ten_tai_khoan = '900'
SELECT khach_hang.ten_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang WHERE tai_khoan.ten_tai_khoan = '900'
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT DISTINCT khach_hang.ten_khach_hang, khach_hang.ho_cua_khach_hang, khach_hang.so_dien_thoai FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang
SELECT ten_khach_hang, ho_cua_khach_hang, so_dien_thoai FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang
SELECT id_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT id_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT T1.id_khach_hang , COUNT ( * ) FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang
SELECT T1.id_khach_hang , COUNT ( * ) FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang
SELECT T1.id_khach_hang , T1.ten_khach_hang , T1.ho_cua_khach_hang FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT khach_hang.id_khach_hang , khach_hang.ten_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.ten_khach_hang, khach_hang.ho_cua_khach_hang, COUNT(*) FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang
SELECT khach_hang.ten_khach_hang, khach_hang.id_khach_hang, COUNT(*) FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang
SELECT khach_hang.id_khach_hang , khach_hang.ten_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang HAVING COUNT ( * ) >= 2
SELECT khach_hang.id_khach_hang , khach_hang.ten_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang HAVING COUNT ( * ) >= 2
SELECT COUNT(*) FROM khach_hang
SELECT COUNT(*) FROM khach_hang
SELECT khach_hang.gioi_tinh , COUNT ( * ) FROM khach_hang GROUP BY khach_hang.gioi_tinh
SELECT gioi_tinh , COUNT ( * ) FROM khach_hang GROUP BY gioi_tinh
SELECT COUNT(*) FROM giao_dich_tai_chinh
SELECT COUNT(*) FROM giao_dich_tai_chinh
SELECT T1.id_tai_khoan , COUNT ( * ) FROM tai_khoan AS T1 JOIN giao_dich_tai_chinh AS T2 ON T1.id_tai_khoan = T2.id_tai_khoan GROUP BY T1.id_tai_khoan
SELECT T1.id_tai_khoan , COUNT ( * ) FROM tai_khoan AS T1 JOIN giao_dich_tai_chinh AS T2 ON T1.id_tai_khoan = T2.id_tai_khoan GROUP BY T1.id_tai_khoan
SELECT COUNT(*) FROM giao_dich_tai_chinh JOIN tai_khoan ON giao_dich_tai_chinh.id_tai_khoan = tai_khoan.id_tai_khoan WHERE tai_khoan.ten_tai_khoan = '337'
SELECT COUNT(*) FROM tai_khoan JOIN giao_dich_tai_chinh ON tai_khoan.id_tai_khoan = giao_dich_tai_chinh.id_tai_khoan WHERE tai_khoan.ten_tai_khoan = '337'
SELECT AVG(giao_dich_tai_chinh.so_tien_giao_dich), MIN(giao_dich_tai_chinh.so_tien_giao_dich), MAX(giao_dich_tai_chinh.so_tien_giao_dich), SUM(giao_dich_tai_chinh.so_tien_giao_dich) FROM giao_dich_tai_chinh
SELECT AVG(so_tien_giao_dich), MIN(so_tien_giao_dich), MAX(so_tien_giao_dich), SUM(so_tien_giao_dich) FROM giao_dich_tai_chinh
SELECT id_giao_dich FROM giao_dich_tai_chinh WHERE so_tien_giao_dich > (SELECT AVG(so_tien_giao_dich) FROM giao_dich_tai_chinh)
SELECT id_giao_dich FROM giao_dich_tai_chinh WHERE so_tien_giao_dich > (SELECT AVG(so_tien_giao_dich) FROM giao_dich_tai_chinh)
SELECT giao_dich_tai_chinh.loai_giao_dich , SUM(giao_dich_tai_chinh.so_tien_giao_dich) FROM giao_dich_tai_chinh GROUP BY giao_dich_tai_chinh.loai_giao_dich
SELECT SUM(giao_dich_tai_chinh.so_tien_giao_dich) FROM giao_dich_tai_chinh GROUP BY giao_dich_tai_chinh.loai_giao_dich
SELECT T1.ten_tai_khoan, T1.id_tai_khoan, COUNT(*) FROM tai_khoan AS T1 JOIN giao_dich_tai_chinh AS T2 ON T1.id_tai_khoan = T2.id_tai_khoan GROUP BY T1.id_tai_khoan
SELECT T1.id_tai_khoan , T1.ten_tai_khoan , COUNT ( * ) FROM tai_khoan AS T1 JOIN giao_dich_tai_chinh AS T2 ON T1.id_tai_khoan = T2.id_tai_khoan GROUP BY T1.id_tai_khoan , T1.ten_tai_khoan
SELECT tai_khoan.id_tai_khoan FROM tai_khoan JOIN giao_dich_tai_chinh ON tai_khoan.id_tai_khoan = giao_dich_tai_chinh.id_tai_khoan GROUP BY tai_khoan.id_tai_khoan ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_tai_khoan FROM tai_khoan AS T1 JOIN giao_dich_tai_chinh AS T2 ON T1.id_tai_khoan = T2.id_tai_khoan GROUP BY T1.id_tai_khoan ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_tai_khoan , T1.ten_tai_khoan FROM tai_khoan AS T1 JOIN giao_dich_tai_chinh AS T2 ON T1.id_tai_khoan = T2.id_tai_khoan GROUP BY T1.id_tai_khoan HAVING COUNT ( * ) >= 4
SELECT T1.id_tai_khoan , T1.ten_tai_khoan FROM tai_khoan AS T1 JOIN giao_dich_tai_chinh AS T2 ON T1.id_tai_khoan = T2.id_tai_khoan GROUP BY T1.id_tai_khoan HAVING COUNT ( * ) >= 4
SELECT DISTINCT kich_thuoc_san_pham FROM san_pham
SELECT DISTINCT kich_thuoc_san_pham FROM san_pham
SELECT DISTINCT mau_san_pham FROM san_pham
SELECT DISTINCT mau_san_pham FROM san_pham
SELECT hoa_don.so_hoa_don , COUNT ( * ) FROM hoa_don JOIN giao_dich_tai_chinh ON hoa_don.so_hoa_don = giao_dich_tai_chinh.so_hoa_don GROUP BY hoa_don.so_hoa_don
SELECT T1.so_hoa_don , COUNT ( * ) FROM hoa_don AS T1 JOIN giao_dich_tai_chinh AS T2 ON T1.so_hoa_don = T2.so_hoa_don GROUP BY T1.so_hoa_don
SELECT hoa_don.so_hoa_don , hoa_don.ngay_lap_hoa_don FROM hoa_don JOIN giao_dich_tai_chinh ON hoa_don.so_hoa_don = giao_dich_tai_chinh.so_hoa_don GROUP BY hoa_don.so_hoa_don ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT hoa_don.so_hoa_don, hoa_don.ngay_lap_hoa_don FROM hoa_don JOIN giao_dich_tai_chinh ON hoa_don.so_hoa_don = giao_dich_tai_chinh.so_hoa_don GROUP BY hoa_don.so_hoa_don ORDER BY COUNT(giao_dich_tai_chinh.id_giao_dich) DESC LIMIT 1
SELECT COUNT(*) FROM hoa_don
SELECT COUNT(*) FROM hoa_don
SELECT hoa_don.ngay_lap_hoa_don, hoa_don.id_don_hang, don_dat_hang.chi_tiet_dat_hang FROM hoa_don JOIN don_dat_hang ON hoa_don.id_don_hang = don_dat_hang.id_don_hang
SELECT hoa_don.ngay_lap_hoa_don, hoa_don.id_don_hang, don_dat_hang.chi_tiet_dat_hang FROM hoa_don JOIN don_dat_hang ON hoa_don.id_don_hang = don_dat_hang.id_don_hang
SELECT T1.id_don_hang , COUNT ( * ) FROM don_dat_hang AS T1 JOIN hoa_don AS T2 ON T1.id_don_hang = T2.id_don_hang GROUP BY T1.id_don_hang
SELECT hoa_don.id_don_hang , COUNT ( * ) FROM hoa_don GROUP BY hoa_don.id_don_hang
SELECT T1.id_don_hang, T1.chi_tiet_dat_hang FROM don_dat_hang AS T1 JOIN hoa_don AS T2 ON T1.id_don_hang = T2.id_don_hang GROUP BY T1.id_don_hang HAVING COUNT(*) > 2
SELECT don_dat_hang.id_don_hang, don_dat_hang.id_khach_hang, don_dat_hang.ngay_dat_hang, don_dat_hang.chi_tiet_dat_hang FROM don_dat_hang JOIN hoa_don ON don_dat_hang.id_don_hang = hoa_don.id_don_hang GROUP BY don_dat_hang.id_don_hang HAVING COUNT(*) >= 2
SELECT khach_hang.id_khach_hang , khach_hang.ho_cua_khach_hang , khach_hang.so_dien_thoai FROM khach_hang JOIN don_dat_hang ON khach_hang.id_khach_hang = don_dat_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT khach_hang.id_khach_hang , khach_hang.ho_cua_khach_hang , khach_hang.so_dien_thoai FROM khach_hang JOIN don_dat_hang ON khach_hang.id_khach_hang = don_dat_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT ten_san_pham FROM san_pham WHERE id_san_pham NOT IN (SELECT id_san_pham FROM mat_hang_duoc_dat)
SELECT ten_san_pham FROM san_pham WHERE id_san_pham NOT IN (SELECT id_san_pham FROM mat_hang_duoc_dat)
SELECT T1.ten_san_pham , SUM(T2.so_luong_san_pham) FROM san_pham AS T1 JOIN mat_hang_duoc_dat AS T2 ON T1.id_san_pham = T2.id_san_pham GROUP BY T1.id_san_pham
SELECT T1.ten_san_pham , SUM(T2.so_luong_san_pham) FROM san_pham AS T1 JOIN mat_hang_duoc_dat AS T2 ON T1.id_san_pham = T2.id_san_pham GROUP BY T1.id_san_pham
SELECT don_dat_hang.id_don_hang , COUNT ( * ) FROM don_dat_hang JOIN mat_hang_duoc_dat ON don_dat_hang.id_don_hang = mat_hang_duoc_dat.id_don_hang GROUP BY don_dat_hang.id_don_hang
SELECT T1.id_don_hang , COUNT ( * ) FROM don_dat_hang AS T1 JOIN mat_hang_duoc_dat AS T2 ON T1.id_don_hang = T2.id_don_hang GROUP BY T1.id_don_hang
SELECT T1.id_san_pham , COUNT ( * ) FROM san_pham AS T1 JOIN mat_hang_duoc_dat AS T2 ON T1.id_san_pham = T2.id_san_pham GROUP BY T1.id_san_pham
SELECT T1.id_san_pham , COUNT ( DISTINCT T3.id_don_hang ) FROM san_pham AS T1 JOIN mat_hang_duoc_dat AS T2 ON T1.id_san_pham = T2.id_san_pham JOIN don_dat_hang AS T3 ON T2.id_don_hang = T3.id_don_hang GROUP BY T1.id_san_pham
SELECT T1.ten_san_pham , COUNT(DISTINCT T4.id_khach_hang) FROM san_pham AS T1 JOIN mat_hang_duoc_dat AS T2 ON T1.id_san_pham = T2.id_san_pham JOIN don_dat_hang AS T3 ON T2.id_don_hang = T3.id_don_hang JOIN khach_hang AS T4 ON T3.id_khach_hang = T4.id_khach_hang GROUP BY T1.id_san_pham
SELECT san_pham.ten_san_pham , COUNT(DISTINCT khach_hang.id_khach_hang) FROM san_pham JOIN mat_hang_duoc_dat ON san_pham.id_san_pham = mat_hang_duoc_dat.id_san_pham JOIN don_dat_hang ON mat_hang_duoc_dat.id_don_hang = don_dat_hang.id_don_hang JOIN khach_hang ON don_dat_hang.id_khach_hang = khach_hang.id_khach_hang GROUP BY san_pham.id_san_pham
SELECT don_dat_hang.id_don_hang, mat_hang_duoc_dat.so_luong_san_pham FROM don_dat_hang JOIN mat_hang_duoc_dat ON don_dat_hang.id_don_hang = mat_hang_duoc_dat.id_don_hang
SELECT T1.id_don_hang , COUNT ( * ) FROM don_dat_hang AS T1 JOIN mat_hang_duoc_dat AS T2 ON T1.id_don_hang = T2.id_don_hang GROUP BY T1.id_don_hang
SELECT T1.id_don_hang , SUM(T2.so_luong_san_pham) FROM don_dat_hang AS T1 JOIN mat_hang_duoc_dat AS T2 ON T1.id_don_hang = T2.id_don_hang GROUP BY T1.id_don_hang
SELECT T1.id_don_hang , SUM(T2.so_luong_san_pham) FROM don_dat_hang AS T1 JOIN mat_hang_duoc_dat AS T2 ON T1.id_don_hang = T2.id_don_hang GROUP BY T1.id_don_hang
SELECT COUNT(*) FROM san_pham WHERE id_san_pham NOT IN (SELECT id_san_pham FROM mat_hang_duoc_dat)
SELECT COUNT(*) FROM san_pham WHERE id_san_pham NOT IN (SELECT id_san_pham FROM mat_hang_duoc_dat)
SELECT COUNT(*) FROM dia_chi WHERE quoc_gia = 'United States'
SELECT DISTINCT thanh_pho FROM dia_chi
SELECT tieu_bang , COUNT ( * ) FROM dia_chi GROUP BY tieu_bang
SELECT ten_khach_hang, dien_thoai_khach_hang FROM khach_hang WHERE dia_chi_cua_khach_hang NOT IN (SELECT id_dia_chi FROM dia_chi)
SELECT T1.ten_khach_hang FROM khach_hang AS T1 JOIN luot_dat_hang_cua_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_san_pham FROM san_pham GROUP BY ma_loai_san_pham HAVING COUNT(*) >= 2
SELECT T1.ten_khach_hang FROM khach_hang AS T1 JOIN luot_dat_hang_cua_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.ma_trang_thai_don_hang = 'hoan thanh' INTERSECT SELECT T1.ten_khach_hang FROM khach_hang AS T1 JOIN luot_dat_hang_cua_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.ma_trang_thai_don_hang = 'hoan thanh mot phan'
SELECT ten_khach_hang, dien_thoai_khach_hang, ma_phuong_thuc_thanh_toan FROM khach_hang ORDER BY ma_so_khach_hang DESC
SELECT san_pham.ten_san_pham , SUM(mat_hang_duoc_dat.so_luong_dat_hang) FROM san_pham JOIN mat_hang_duoc_dat ON san_pham.id_san_pham = mat_hang_duoc_dat.id_san_pham GROUP BY san_pham.id_san_pham
SELECT MAX(gia_san_pham), MIN(gia_san_pham), AVG(gia_san_pham) FROM san_pham
SELECT COUNT(*) FROM san_pham WHERE gia_san_pham > (SELECT AVG(gia_san_pham) FROM san_pham)
SELECT T3.ten_khach_hang, T2.thanh_pho, T1.tu_ngay, T1.den_ngay FROM lich_su_dia_chi_khach_hang AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi = T2.id_dia_chi JOIN khach_hang AS T3 ON T1.id_khach_hang = T3.id_khach_hang
SELECT ten_khach_hang FROM khach_hang JOIN luot_dat_hang_cua_khach_hang ON khach_hang.id_khach_hang = luot_dat_hang_cua_khach_hang.id_khach_hang WHERE ma_phuong_thuc_thanh_toan = 'thẻ tín dụng' GROUP BY khach_hang.id_khach_hang HAVING COUNT(*) > 2
SELECT khach_hang.ten_khach_hang, khach_hang.dien_thoai_khach_hang FROM khach_hang JOIN luot_dat_hang_cua_khach_hang ON khach_hang.id_khach_hang = luot_dat_hang_cua_khach_hang.id_khach_hang JOIN mat_hang_duoc_dat ON luot_dat_hang_cua_khach_hang.id_don_hang = mat_hang_duoc_dat.id_don_hang GROUP BY khach_hang.id_khach_hang ORDER BY SUM(CAST(mat_hang_duoc_dat.so_luong_dat_hang AS INTEGER)) DESC LIMIT 1
SELECT ma_loai_san_pham , ten_san_pham FROM san_pham WHERE gia_san_pham > 1000 OR gia_san_pham < 500
SELECT COUNT ( * ) FROM bo_truong WHERE tuoi > 56
SELECT ten , sinh_ra_o_tieu_bang , tuoi FROM bo_truong ORDER BY tuoi ASC
SELECT cac_bo.nam_thanh_lap, cac_bo.ten, cac_bo.ngan_sach_tinh_theo_ty FROM cac_bo
SELECT ngan_sach_tinh_theo_ty FROM cac_bo ORDER BY ngan_sach_tinh_theo_ty DESC LIMIT 1
SELECT AVG(so_luong_nhan_vien) FROM cac_bo WHERE xep_hang BETWEEN 10 AND 15
SELECT ten FROM bo_truong WHERE sinh_ra_o_tieu_bang != 'California'
SELECT DISTINCT cac_bo.nam_thanh_lap FROM bo_truong JOIN su_quan_ly ON bo_truong.id_nguoi_dung_dau = su_quan_ly.id_nguoi_dung_dau JOIN cac_bo ON su_quan_ly.id_cac_bo = cac_bo.id_cac_bo WHERE bo_truong.sinh_ra_o_tieu_bang = 'Alabama'
SELECT sinh_ra_o_tieu_bang FROM bo_truong GROUP BY sinh_ra_o_tieu_bang HAVING COUNT(*) >= 3
SELECT nam_thanh_lap FROM cac_bo GROUP BY nam_thanh_lap ORDER BY COUNT(*) DESC LIMIT 1
SELECT cac_bo.ten , cac_bo.so_luong_nhan_vien FROM cac_bo JOIN su_quan_ly ON cac_bo.id_cac_bo = su_quan_ly.id_cac_bo JOIN bo_truong ON su_quan_ly.id_nguoi_dung_dau = bo_truong.id_nguoi_dung_dau WHERE su_quan_ly.vai_tro_tam_thoi IS NOT NULL
SELECT COUNT(DISTINCT vai_tro_tam_thoi) FROM su_quan_ly
SELECT COUNT(*) FROM cac_bo WHERE id_cac_bo NOT IN (SELECT DISTINCT su_quan_ly.id_cac_bo FROM su_quan_ly JOIN bo_truong ON su_quan_ly.id_nguoi_dung_dau = bo_truong.id_nguoi_dung_dau)
SELECT DISTINCT tuoi FROM bo_truong
SELECT sinh_ra_o_tieu_bang FROM bo_truong JOIN su_quan_ly ON bo_truong.id_nguoi_dung_dau = su_quan_ly.id_nguoi_dung_dau JOIN cac_bo ON su_quan_ly.id_cac_bo = cac_bo.id_cac_bo WHERE cac_bo.ten = 'Bộ tài chính' INTERSECT SELECT sinh_ra_o_tieu_bang FROM bo_truong JOIN su_quan_ly ON bo_truong.id_nguoi_dung_dau = su_quan_ly.id_nguoi_dung_dau JOIN cac_bo ON su_quan_ly.id_cac_bo = cac_bo.id_cac_bo WHERE cac_bo.ten = 'Bộ An ninh nội địa'
SELECT T1.id_cac_bo, T1.ten, COUNT(*) FROM cac_bo AS T1 JOIN su_quan_ly AS T2 ON T1.id_cac_bo = T2.id_cac_bo GROUP BY T1.id_cac_bo HAVING COUNT(*) > 1
SELECT id_nguoi_dung_dau, ten FROM bo_truong WHERE ten LIKE '%Ha%'
SELECT id FROM xe
SELECT id FROM xe
SELECT COUNT(*) FROM xe
SELECT COUNT(*) FROM xe
SELECT id, chi_tiet_ve_xe FROM xe WHERE id = 1
SELECT chi_tiet_ve_xe FROM xe WHERE id = 1
SELECT ten, ten_dem, ho FROM nhan_vien
SELECT ten, ten_dem, ho FROM nhan_vien
SELECT ngay_sinh FROM nhan_vien WHERE ho = 'Sawayn' AND ten = 'Janessa'
SELECT nhan_vien.ngay_sinh FROM nhan_vien WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ho = 'Sawayn'
SELECT ngay_nhan_vien_gia_nhap FROM nhan_vien WHERE ten = 'Janessa' AND ho = 'Sawayn'
SELECT ngay_nhan_vien_gia_nhap FROM nhan_vien WHERE ten = 'Janessa' AND ho = 'Sawayn'
SELECT ngay_nhan_vien_roi_di FROM nhan_vien WHERE ten = 'Janessa' AND ho = 'Sawayn'
SELECT ngay_nhan_vien_roi_di FROM nhan_vien WHERE ho = 'Janessa' AND ten = 'Sawayn'
SELECT COUNT(*) FROM nhan_vien WHERE ten = 'Ludie'
SELECT COUNT(*) FROM nhan_vien WHERE ten = 'Ludie'
SELECT nhan_vien.biet_danh FROM nhan_vien WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ho = 'Sawayn'
SELECT biet_danh FROM nhan_vien WHERE ten = 'Janessa' AND ho = 'Sawayn'
SELECT COUNT(*) FROM nhan_vien
SELECT COUNT(*) FROM nhan_vien
SELECT dia_chi.thanh_pho FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ho = 'Sawayn'
SELECT dia_chi.thanh_pho FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi_khach_hang = dia_chi.id_dia_chi WHERE khach_hang.ho = 'Sawayn' AND khach_hang.ten = 'Janessa'
SELECT dia_chi.quoc_gia, dia_chi.tieu_bang FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi WHERE nhan_vien.ho = 'Sawayn' AND nhan_vien.ten = 'Janessa'
SELECT dia_chi.quoc_gia, dia_chi.tieu_bang FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi_khach_hang = dia_chi.id_dia_chi WHERE khach_hang.ten = 'Janessa' AND khach_hang.ho = 'Sawayn'
SELECT COUNT ( * ) FROM khach_hang AS T1 JOIN bai_giang AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T1.ten = 'Rylan' AND T1.ho = 'Goodwin'
SELECT SUM(bai_giang.gia) FROM khach_hang JOIN bai_giang ON khach_hang.id_khach_hang = bai_giang.id_khach_hang WHERE khach_hang.ten = 'Rylan' AND khach_hang.ho = 'Goodwin'
SELECT dia_chi.ma_buu_dien FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ho = 'Sawayn'
SELECT dia_chi.ma_buu_dien FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ho = 'Sawayn'
SELECT COUNT(*) FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi WHERE dia_chi.tieu_bang = 'Georgia'
SELECT COUNT(*) FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi WHERE dia_chi.quoc_gia = 'Georgia'
SELECT nhan_vien.ten, nhan_vien.ho FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi WHERE dia_chi.thanh_pho = 'Damianfort'
SELECT ten, ho FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi WHERE dia_chi.thanh_pho = 'Damianfort'
SELECT dia_chi.thanh_pho , COUNT ( * ) FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi GROUP BY dia_chi.thanh_pho ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT dia_chi.thanh_pho , COUNT ( * ) FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi GROUP BY dia_chi.thanh_pho ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT dia_chi.tieu_bang FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi GROUP BY dia_chi.tieu_bang HAVING COUNT(*) BETWEEN 2 AND 4
SELECT dia_chi.tieu_bang FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi GROUP BY dia_chi.tieu_bang HAVING COUNT(*) BETWEEN 2 AND 4
SELECT ho , ten FROM khach_hang
SELECT ho , ten FROM khach_hang
SELECT dia_chi_email, ngay_sinh FROM khach_hang WHERE ten = 'Carole'
SELECT dia_chi_email, ngay_sinh FROM khach_hang WHERE ten = 'Carole'
SELECT so_dien_thoai, dia_chi_email FROM khach_hang WHERE so_tien_con_thieu > 2000
SELECT so_dien_thoai, dia_chi_email FROM khach_hang WHERE so_tien_con_thieu > 2000
SELECT ma_trang_thai_khach_hang, so_dien_thoai_di_dong, dia_chi_email FROM khach_hang WHERE ho = 'Kohler' OR ten = 'Marina'
SELECT ma_trang_thai_khach_hang, so_dien_thoai_di_dong, dia_chi_email FROM khach_hang WHERE ho = 'Kohler' OR ten = 'Marina'
SELECT ngay_sinh FROM khach_hang WHERE ma_trang_thai_khach_hang = 'Khách hàng tốt'
SELECT ngay_sinh FROM khach_hang WHERE ma_trang_thai_khach_hang = 'Khách hàng tốt'
SELECT ngay_tro_thanh_khach_hang FROM khach_hang WHERE ten = 'Carole' AND ho = 'Bernhard'
SELECT ngay_tro_thanh_khach_hang FROM khach_hang WHERE ten = 'Carole' AND ho = 'Bernhard'
SELECT COUNT(*) FROM khach_hang
SELECT COUNT(*) FROM khach_hang
SELECT ma_trang_thai_khach_hang , COUNT ( * ) FROM khach_hang GROUP BY ma_trang_thai_khach_hang
SELECT ma_trang_thai_khach_hang , COUNT ( * ) FROM khach_hang GROUP BY ma_trang_thai_khach_hang
SELECT ma_trang_thai_khach_hang FROM khach_hang GROUP BY ma_trang_thai_khach_hang ORDER BY COUNT(*) ASC LIMIT 1
SELECT ma_trang_thai_khach_hang FROM khach_hang GROUP BY ma_trang_thai_khach_hang ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM khach_hang JOIN bai_giang ON khach_hang.id_khach_hang = bai_giang.id_khach_hang WHERE khach_hang.ho = 'Goodwin' AND khach_hang.ten = 'Rylan'
SELECT COUNT(*) FROM bai_giang JOIN khach_hang ON bai_giang.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten = 'Rylan' AND khach_hang.ho = 'Goodwin'
SELECT MAX(so_tien_con_thieu), MIN(so_tien_con_thieu), AVG(so_tien_con_thieu) FROM khach_hang
SELECT MAX(so_tien_con_thieu), MIN(so_tien_con_thieu), AVG(so_tien_con_thieu) FROM khach_hang
SELECT ten , ho FROM khach_hang WHERE so_tien_con_thieu BETWEEN 1000 AND 3000
SELECT ho , ten FROM khach_hang WHERE so_tien_con_thieu BETWEEN 1000 AND 3000
SELECT ho , ten FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi_khach_hang = dia_chi.id_dia_chi WHERE dia_chi.thanh_pho = 'Lockmanfurt'
SELECT ten, ho FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi_khach_hang = dia_chi.id_dia_chi WHERE dia_chi.thanh_pho = 'Lockmanfurt'
SELECT dia_chi.quoc_gia FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi_khach_hang = dia_chi.id_dia_chi WHERE khach_hang.ten = 'Carole' AND khach_hang.ho = 'Bernhard'
SELECT dia_chi.quoc_gia FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi_khach_hang = dia_chi.id_dia_chi WHERE khach_hang.ten = 'Carole' AND khach_hang.ho = 'Bernhard'
SELECT dia_chi.ma_buu_dien FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi_khach_hang = dia_chi.id_dia_chi WHERE khach_hang.ten = 'Carole' AND khach_hang.ho = 'Bernhard'
SELECT dia_chi.ma_buu_dien FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi_khach_hang = dia_chi.id_dia_chi WHERE khach_hang.ho = 'Bernhard' AND khach_hang.ten = 'Carole'
SELECT dia_chi.thanh_pho FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi_khach_hang = dia_chi.id_dia_chi GROUP BY dia_chi.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT dia_chi.thanh_pho FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi_khach_hang = dia_chi.id_dia_chi GROUP BY dia_chi.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT SUM(T1.so_tien_thanh_toan) FROM khoan_thanh_toan_cua_khach_hang AS T1 JOIN khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.ten = 'Carole' AND T2.ho = 'Bernhard'
SELECT SUM(khoan_thanh_toan_cua_khach_hang.so_tien_thanh_toan) FROM khach_hang JOIN khoan_thanh_toan_cua_khach_hang ON khach_hang.id_khach_hang = khoan_thanh_toan_cua_khach_hang.id_khach_hang WHERE khach_hang.ten = 'Carole' AND khach_hang.ho = 'Bernhard'
SELECT COUNT(*) FROM khach_hang LEFT JOIN khoan_thanh_toan_cua_khach_hang ON khach_hang.id_khach_hang = khoan_thanh_toan_cua_khach_hang.id_khach_hang WHERE khoan_thanh_toan_cua_khach_hang.id_khach_hang IS NULL
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM khoan_thanh_toan_cua_khach_hang)
SELECT T1.ten , T1.ho FROM khach_hang AS T1 JOIN khoan_thanh_toan_cua_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang HAVING COUNT(*) > 2
SELECT T1.ho , T1.ten FROM khach_hang AS T1 JOIN khoan_thanh_toan_cua_khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang GROUP BY T1.id_khach_hang HAVING COUNT ( * ) > 2
SELECT ma_phuong_thuc_thanh_toan , COUNT ( * ) FROM khoan_thanh_toan_cua_khach_hang GROUP BY ma_phuong_thuc_thanh_toan
SELECT ma_phuong_thuc_thanh_toan , COUNT ( * ) FROM khoan_thanh_toan_cua_khach_hang GROUP BY ma_phuong_thuc_thanh_toan
SELECT COUNT(*) FROM bai_giang WHERE ma_trang_thai_bai_giang = 'huỷ bỏ'
SELECT COUNT(*) FROM bai_giang WHERE ma_trang_thai_bai_giang = 'hủy'
SELECT id_bai_giang FROM bai_giang JOIN nhan_vien ON bai_giang.id_nhan_vien = nhan_vien.id_nhan_vien WHERE nhan_vien.ho = 'Sawayn' AND nhan_vien.ten = 'Janessa' AND nhan_vien.biet_danh LIKE '%s%'
SELECT bai_giang.id_bai_giang FROM bai_giang JOIN nhan_vien ON bai_giang.id_nhan_vien = nhan_vien.id_nhan_vien WHERE nhan_vien.ten = 'Janessa Sawayn' AND nhan_vien.biet_danh LIKE '%s%'
SELECT COUNT(*) FROM bai_giang JOIN nhan_vien ON bai_giang.id_nhan_vien = nhan_vien.id_nhan_vien WHERE nhan_vien.ten LIKE '%a%' OR nhan_vien.ho LIKE '%a%'
SELECT COUNT(*) FROM bai_giang JOIN nhan_vien ON bai_giang.id_nhan_vien = nhan_vien.id_nhan_vien WHERE nhan_vien.ten LIKE '%a%' OR nhan_vien.ho LIKE '%a%'
SELECT SUM(gia) FROM bai_giang JOIN nhan_vien ON bai_giang.id_nhan_vien = nhan_vien.id_nhan_vien WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ho = 'Sawayn'
SELECT SUM(bai_giang.gia) FROM bai_giang JOIN nhan_vien ON bai_giang.id_nhan_vien = nhan_vien.id_nhan_vien WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ho = 'Sawayn'
SELECT AVG(bai_giang.gia) FROM bai_giang JOIN nhan_vien ON bai_giang.id_nhan_vien = nhan_vien.id_nhan_vien WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ho = 'Sawayn'
SELECT AVG(bai_giang.gia) FROM bai_giang JOIN nhan_vien ON bai_giang.id_nhan_vien = nhan_vien.id_nhan_vien WHERE nhan_vien.biet_danh = 'Janessa Sawayn'
SELECT COUNT(*) FROM khach_hang JOIN bai_giang ON khach_hang.id_khach_hang = bai_giang.id_khach_hang WHERE khach_hang.ten = 'Ray'
SELECT COUNT(*) FROM khach_hang JOIN bai_giang ON khach_hang.id_khach_hang = bai_giang.id_khach_hang WHERE khach_hang.ten = 'Ray'
SELECT ho FROM khach_hang INTERSECT SELECT ho FROM nhan_vien
SELECT ho FROM khach_hang INTERSECT SELECT ho FROM nhan_vien
SELECT ten FROM nhan_vien WHERE id_nhan_vien NOT IN (SELECT id_nhan_vien FROM bai_giang)
SELECT ten FROM nhan_vien WHERE id_nhan_vien NOT IN (SELECT id_nhan_vien FROM bai_giang)
SELECT T1.id , T1.chi_tiet_ve_xe FROM xe AS T1 JOIN bai_giang AS T2 ON T1.id = T2.id_xe GROUP BY T1.id ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT COUNT(*) FROM nhan_vien
SELECT COUNT(*) FROM nhan_vien
SELECT ten FROM nhan_vien ORDER BY tuoi ASC
SELECT ten FROM nhan_vien ORDER BY tuoi ASC
SELECT nhan_vien.thanh_pho , COUNT ( * ) FROM nhan_vien GROUP BY nhan_vien.thanh_pho
SELECT nhan_vien.thanh_pho , COUNT ( * ) FROM nhan_vien GROUP BY nhan_vien.thanh_pho
SELECT thanh_pho FROM nhan_vien WHERE tuoi < 30 GROUP BY thanh_pho HAVING COUNT(*) > 1
SELECT thanh_pho FROM nhan_vien WHERE tuoi < 30 GROUP BY thanh_pho HAVING COUNT(*) > 1
SELECT cua_hang.dia_diem , COUNT ( * ) FROM cua_hang GROUP BY cua_hang.dia_diem
SELECT COUNT ( * ) FROM cua_hang GROUP BY dia_diem
SELECT cua_hang.ten_nguoi_quan_ly, cua_hang.quan FROM cua_hang ORDER BY cua_hang.so_luong_san_pham DESC LIMIT 1
SELECT cua_hang.ten_nguoi_quan_ly, cua_hang.quan FROM cua_hang ORDER BY cua_hang.so_luong_san_pham DESC LIMIT 1
SELECT so_luong_san_pham FROM cua_hang ORDER BY so_luong_san_pham DESC LIMIT 1 UNION SELECT so_luong_san_pham FROM cua_hang ORDER BY so_luong_san_pham ASC LIMIT 1
SELECT so_luong_san_pham FROM cua_hang ORDER BY so_luong_san_pham DESC LIMIT 1 UNION SELECT so_luong_san_pham FROM cua_hang ORDER BY so_luong_san_pham ASC LIMIT 1
SELECT ten, dia_diem, quan FROM cua_hang ORDER BY so_luong_san_pham DESC
SELECT ten, dia_diem, quan FROM cua_hang ORDER BY so_luong_san_pham DESC
SELECT ten FROM cua_hang WHERE so_luong_san_pham > (SELECT AVG(so_luong_san_pham) FROM cua_hang)
SELECT ten FROM cua_hang WHERE so_luong_san_pham > (SELECT AVG(so_luong_san_pham) FROM cua_hang)
SELECT T1.ten FROM nhan_vien AS T1 JOIN danh_gia AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien GROUP BY T1.id_nhan_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten FROM nhan_vien AS T1 JOIN danh_gia AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien GROUP BY T1.id_nhan_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten FROM nhan_vien AS T1 JOIN danh_gia AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien ORDER BY T2.tien_thuong DESC LIMIT 1
SELECT ten FROM nhan_vien JOIN danh_gia ON nhan_vien.id_nhan_vien = danh_gia.id_nhan_vien ORDER BY danh_gia.tien_thuong DESC LIMIT 1
SELECT ten FROM nhan_vien WHERE id_nhan_vien NOT IN (SELECT id_nhan_vien FROM danh_gia)
SELECT ten FROM nhan_vien WHERE id_nhan_vien NOT IN (SELECT id_nhan_vien FROM danh_gia)
SELECT T1.ten FROM cua_hang AS T1 JOIN tuyen_dung AS T2 ON T1.id_cua_hang = T2.id_cua_hang GROUP BY T1.id_cua_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten FROM cua_hang AS T1 JOIN tuyen_dung AS T2 ON T1.id_cua_hang = T2.id_cua_hang GROUP BY T1.id_cua_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM cua_hang WHERE id_cua_hang NOT IN (SELECT DISTINCT id_cua_hang FROM tuyen_dung)
SELECT ten FROM cua_hang WHERE id_cua_hang NOT IN (SELECT id_cua_hang FROM tuyen_dung)
SELECT cua_hang.ten , COUNT ( * ) FROM cua_hang JOIN tuyen_dung ON cua_hang.id_cua_hang = tuyen_dung.id_cua_hang GROUP BY cua_hang.id_cua_hang
SELECT T1.ten , COUNT ( * ) FROM cua_hang AS T1 JOIN tuyen_dung AS T2 ON T1.id_cua_hang = T2.id_cua_hang GROUP BY T1.id_cua_hang
SELECT SUM(tien_thuong) FROM danh_gia
SELECT SUM(tien_thuong) FROM danh_gia
SELECT id_cua_hang, id_nhan_vien, bat_dau_tu, co_phai_nhan_vien_toan_thoi_gian_khong FROM tuyen_dung
SELECT id_cua_hang, id_nhan_vien, bat_dau_tu, co_phai_nhan_vien_toan_thoi_gian_khong FROM tuyen_dung
SELECT quan FROM cua_hang WHERE so_luong_san_pham < 3000 INTERSECT SELECT quan FROM cua_hang WHERE so_luong_san_pham > 10000
SELECT quan FROM cua_hang WHERE so_luong_san_pham < 3000 INTERSECT SELECT quan FROM cua_hang WHERE so_luong_san_pham > 10000
SELECT COUNT(DISTINCT dia_diem) FROM cua_hang
SELECT COUNT(DISTINCT dia_diem) FROM cua_hang
SELECT quoc_gia FROM hang_hang_khong WHERE ten_hang_hang_khong = 'JetBlue Airways'
SELECT quoc_gia FROM hang_hang_khong WHERE ten_hang_hang_khong = 'Jetblue Airways'
SELECT ten_viet_tat FROM hang_hang_khong WHERE ten_hang_hang_khong = 'JetBlue Airways'
SELECT ten_viet_tat FROM hang_hang_khong WHERE ten_hang_hang_khong = 'Jetblue Airways'
SELECT ten_hang_hang_khong, ten_viet_tat FROM hang_hang_khong WHERE quoc_gia = 'Hoa Kỳ'
SELECT ten_hang_hang_khong , ten_viet_tat FROM hang_hang_khong WHERE quoc_gia = 'Hoa Kỳ'
SELECT ma_san_bay , ten_san_bay FROM san_bay WHERE thanh_pho = 'Anthony'
SELECT ma_san_bay, ten_san_bay FROM san_bay WHERE thanh_pho = 'Anthony'
SELECT COUNT(*) FROM hang_hang_khong
SELECT COUNT(*) FROM hang_hang_khong
SELECT COUNT(*) FROM san_bay
SELECT COUNT(*) FROM san_bay
SELECT COUNT(*) FROM chuyen_bay
SELECT COUNT ( * ) FROM chuyen_bay
SELECT ten_hang_hang_khong FROM hang_hang_khong WHERE ten_viet_tat = 'UAL'
SELECT ten_viet_tat FROM hang_hang_khong WHERE ten_viet_tat = 'UAL'
SELECT COUNT(*) FROM hang_hang_khong WHERE quoc_gia = 'United States'
SELECT COUNT(*) FROM hang_hang_khong WHERE quoc_gia = 'Hoa Kỳ'
SELECT thanh_pho, quoc_gia FROM san_bay WHERE ten_san_bay = 'Alton'
SELECT thanh_pho, quoc_gia FROM san_bay WHERE ten_san_bay = 'Alton'
SELECT ten_san_bay FROM san_bay WHERE ma_san_bay = 'AKO'
SELECT ten_san_bay FROM san_bay WHERE ma_san_bay = 'AKO'
SELECT ten_san_bay FROM san_bay WHERE thanh_pho = 'Aberdeen'
SELECT ten_san_bay FROM san_bay WHERE thanh_pho = 'Aberdeen'
SELECT COUNT(*) FROM chuyen_bay WHERE san_bay_khoi_hanh = 'APG'
SELECT COUNT(*) FROM chuyen_bay WHERE san_bay_khoi_hanh = 'APG'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'ATO'
SELECT COUNT(*) FROM chuyen_bay WHERE san_bay_dich = 'ATO'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.thanh_pho = 'Aberdeen'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.thanh_pho = 'Aberdeen'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.thanh_pho = 'Aberdeen'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.ten_san_bay = 'Aberdeen'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay JOIN san_bay AS san_bay_2 ON chuyen_bay.san_bay_dich = san_bay_2.ma_san_bay WHERE san_bay.thanh_pho = 'Aberdeen' AND san_bay_2.thanh_pho = 'Ashley'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_khoi_hanh = T1.ma_san_bay JOIN san_bay AS T2 ON chuyen_bay.san_bay_dich = T2.ma_san_bay WHERE T1.ten_san_bay = 'Aberdeen' AND T2.ten_san_bay = 'Ashley'
SELECT COUNT(*) FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong WHERE hang_hang_khong.ten_hang_hang_khong = 'JetBlue Airways'
SELECT COUNT(*) FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong WHERE hang_hang_khong.ten_hang_hang_khong = 'Jetblue Airways'
SELECT COUNT(*) FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE hang_hang_khong.ten_hang_hang_khong = 'United Airlines' AND san_bay.ma_san_bay = 'ASY'
SELECT COUNT(*) FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE hang_hang_khong.ten_hang_hang_khong = 'United Airlines' AND san_bay.ma_san_bay = 'ASY'
SELECT COUNT(*) FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong WHERE hang_hang_khong.ten_hang_hang_khong = 'United Airlines' AND chuyen_bay.san_bay_khoi_hanh = 'AHD'
SELECT COUNT(*) FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE hang_hang_khong.ten_hang_hang_khong = 'United Airlines' AND san_bay.ma_san_bay = 'AHD'
SELECT COUNT(*) FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE hang_hang_khong.ten_hang_hang_khong = 'United Airlines' AND san_bay.thanh_pho = 'Aberdeen'
SELECT COUNT(*) FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE hang_hang_khong.ten_hang_hang_khong = 'United Airlines' AND san_bay.ten_san_bay = 'Aberdeen'
SELECT san_bay.thanh_pho FROM san_bay JOIN chuyen_bay ON san_bay.ma_san_bay = chuyen_bay.san_bay_dich GROUP BY san_bay.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_bay.thanh_pho FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay GROUP BY san_bay.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_bay.thanh_pho FROM san_bay JOIN chuyen_bay ON san_bay.ma_san_bay = chuyen_bay.san_bay_khoi_hanh GROUP BY san_bay.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_bay.thanh_pho FROM san_bay JOIN chuyen_bay ON san_bay.ma_san_bay = chuyen_bay.san_bay_khoi_hanh GROUP BY san_bay.ma_san_bay ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_bay.ma_san_bay , COUNT ( * ) FROM san_bay JOIN chuyen_bay ON san_bay.ma_san_bay = chuyen_bay.san_bay_khoi_hanh OR san_bay.ma_san_bay = chuyen_bay.san_bay_dich GROUP BY san_bay.ma_san_bay ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.ma_san_bay FROM san_bay AS T1 JOIN chuyen_bay AS T2 ON T1.ma_san_bay = T2.san_bay_khoi_hanh OR T1.ma_san_bay = T2.san_bay_dich GROUP BY T1.ma_san_bay ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_bay.ma_san_bay FROM san_bay JOIN chuyen_bay ON san_bay.ma_san_bay = chuyen_bay.san_bay_khoi_hanh OR san_bay.ma_san_bay = chuyen_bay.san_bay_dich GROUP BY san_bay.ma_san_bay ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.ma_san_bay FROM san_bay AS T1 LEFT JOIN chuyen_bay AS T2 ON T1.ma_san_bay = T2.san_bay_khoi_hanh OR T1.ma_san_bay = T2.san_bay_dich GROUP BY T1.ma_san_bay ORDER BY COUNT(*) ASC LIMIT 1
SELECT hang_hang_khong.ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong GROUP BY hang_hang_khong.id_hang_hang_khong ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong GROUP BY hang_hang_khong.id_hang_hang_khong ORDER BY COUNT(*) DESC LIMIT 1
SELECT hang_hang_khong.ten_viet_tat , hang_hang_khong.quoc_gia FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong GROUP BY hang_hang_khong.id_hang_hang_khong ORDER BY COUNT ( * ) ASC LIMIT 1
SELECT T2.ten_viet_tat , T2.quoc_gia FROM chuyen_bay AS T1 JOIN hang_hang_khong AS T2 ON T1.hang_hang_khong = T2.id_hang_hang_khong GROUP BY T2.id_hang_hang_khong ORDER BY COUNT ( * ) ASC LIMIT 1
SELECT hang_hang_khong.ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'AHD'
SELECT ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong WHERE chuyen_bay.san_bay_khoi_hanh = 'AHD'
SELECT T1.id_hang_hang_khong , T1.ten_hang_hang_khong , T1.ten_viet_tat , T1.quoc_gia FROM hang_hang_khong AS T1 JOIN chuyen_bay AS T2 ON T1.id_hang_hang_khong = T2.hang_hang_khong JOIN san_bay AS T3 ON T2.san_bay_khoi_hanh = T3.ma_san_bay WHERE T3.ma_san_bay = 'AHD'
SELECT ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'AHD'
SELECT hh.id_hang_hang_khong , hh.ten_hang_hang_khong FROM hang_hang_khong AS hh JOIN chuyen_bay AS cb ON hh.id_hang_hang_khong = cb.hang_hang_khong JOIN san_bay AS sb ON cb.san_bay_khoi_hanh = sb.ma_san_bay WHERE sb.ma_san_bay = 'APG' INTERSECT SELECT hh.id_hang_hang_khong , hh.ten_hang_hang_khong FROM hang_hang_khong AS hh JOIN chuyen_bay AS cb ON hh.id_hang_hang_khong = cb.hang_hang_khong JOIN san_bay AS sb ON cb.san_bay_khoi_hanh = sb.ma_san_bay WHERE sb.ma_san_bay = 'CVO'
SELECT T2.ten_hang_hang_khong FROM chuyen_bay AS T1 JOIN hang_hang_khong AS T2 ON T1.hang_hang_khong = T2.id_hang_hang_khong WHERE T1.san_bay_khoi_hanh = 'APG' INTERSECT SELECT T2.ten_hang_hang_khong FROM chuyen_bay AS T1 JOIN hang_hang_khong AS T2 ON T1.hang_hang_khong = T2.id_hang_hang_khong WHERE T1.san_bay_khoi_hanh = 'CVO'
SELECT hang_hang_khong.id_hang_hang_khong, hang_hang_khong.ten_hang_hang_khong FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong WHERE san_bay_khoi_hanh = 'CVO' EXCEPT SELECT hang_hang_khong.id_hang_hang_khong, hang_hang_khong.ten_hang_hang_khong FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong WHERE san_bay_khoi_hanh = 'APG'
SELECT ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong WHERE san_bay_khoi_hanh = 'CVO' EXCEPT SELECT ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong WHERE san_bay_khoi_hanh = 'APG'
SELECT hang_hang_khong.id_hang_hang_khong, hang_hang_khong.ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong GROUP BY hang_hang_khong.id_hang_hang_khong HAVING COUNT(*) >= 10
SELECT hang_hang_khong.id_hang_hang_khong , hang_hang_khong.ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong GROUP BY hang_hang_khong.id_hang_hang_khong HAVING COUNT ( * ) >= 10
SELECT hang_hang_khong.id_hang_hang_khong , hang_hang_khong.ten_hang_hang_khong , hang_hang_khong.ten_viet_tat , hang_hang_khong.quoc_gia , COUNT ( * ) FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong GROUP BY hang_hang_khong.id_hang_hang_khong HAVING COUNT ( * ) < 200
SELECT hang_hang_khong.id_hang_hang_khong, hang_hang_khong.ten_hang_hang_khong, hang_hang_khong.ten_viet_tat, hang_hang_khong.quoc_gia FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong GROUP BY hang_hang_khong.id_hang_hang_khong HAVING COUNT(*) < 200
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong WHERE hang_hang_khong.ten_hang_hang_khong = 'United Airlines'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong WHERE hang_hang_khong.ten_hang_hang_khong = 'United Airlines'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'APG'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'APG'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'APG'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'APG'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.thanh_pho = 'Aberdeen'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.ten_san_bay = 'Aberdeen'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.thanh_pho = 'Aberdeen'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.ten_san_bay = 'Aberdeen'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.thanh_pho IN ('Aberdeen', 'Abilene')
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.ten_san_bay IN ('Aberdeen','Abilene')
SELECT ten_san_bay FROM san_bay WHERE ma_san_bay NOT IN (SELECT san_bay_khoi_hanh FROM chuyen_bay UNION SELECT san_bay_dich FROM chuyen_bay)
SELECT ma_san_bay, ten_san_bay, thanh_pho, quoc_gia, ten_quoc_gia_viet_tat FROM san_bay WHERE ma_san_bay NOT IN (SELECT san_bay_khoi_hanh FROM chuyen_bay UNION SELECT san_bay_dich FROM chuyen_bay)
SELECT COUNT ( * ) FROM tran_dau WHERE mua_giai > 2007
SELECT ngay FROM tran_dau ORDER BY doi_chu_nha DESC
SELECT mua_giai, doi_chu_nha, doi_khach FROM tran_dau
SELECT AVG(tran_dau_san_nha), MAX(tran_dau_san_nha), MIN(tran_dau_san_nha) FROM san_van_dong
SELECT AVG(so_luong_nguoi_tham_du_trung_binh) FROM san_van_dong WHERE phan_tram_suc_chua > 100
SELECT cau_thu , so_luong_tran_dau , nguon_thong_tin FROM chan_thuong WHERE chan_thuong != 'đầu gối'
SELECT T2.mua_giai FROM chan_thuong AS T1 JOIN tran_dau AS T2 ON T1.id_tran_dau = T2.id WHERE T1.cau_thu = 'Walter Samuel'
SELECT tran_dau.id, tran_dau.ti_so, tran_dau.ngay FROM tran_dau JOIN chan_thuong ON tran_dau.id = chan_thuong.id_tran_dau GROUP BY tran_dau.id HAVING COUNT(*) >= 2
SELECT san_van_dong.id , san_van_dong.ten FROM san_van_dong JOIN tran_dau ON san_van_dong.id = tran_dau.id_san_van_dong JOIN chan_thuong ON tran_dau.id = chan_thuong.id_tran_dau GROUP BY san_van_dong.id ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.id , T1.ten FROM san_van_dong AS T1 JOIN tran_dau AS T2 ON T1.id = T2.id_san_van_dong JOIN chan_thuong AS T3 ON T2.id = T3.id_tran_dau GROUP BY T1.id ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T2.mua_giai , T3.ten FROM chan_thuong AS T1 JOIN tran_dau AS T2 ON T1.id_tran_dau = T2.id JOIN san_van_dong AS T3 ON T2.id_san_van_dong = T3.id WHERE T1.chan_thuong LIKE '%chân%' OR T1.chan_thuong LIKE '%đầu gối%'
SELECT COUNT(DISTINCT nguon_thong_tin) FROM chan_thuong
SELECT COUNT(*) FROM tran_dau WHERE id NOT IN (SELECT id_tran_dau FROM chan_thuong)
SELECT COUNT(DISTINCT chan_thuong.chan_thuong) FROM chan_thuong JOIN tran_dau ON chan_thuong.id_tran_dau = tran_dau.id WHERE tran_dau.mua_giai > 2010
SELECT san_van_dong.ten FROM san_van_dong JOIN tran_dau ON san_van_dong.id = tran_dau.id_san_van_dong JOIN chan_thuong ON tran_dau.id = chan_thuong.id_tran_dau WHERE chan_thuong.cau_thu = 'Walter Samuel' INTERSECT SELECT san_van_dong.ten FROM san_van_dong JOIN tran_dau ON san_van_dong.id = tran_dau.id_san_van_dong JOIN chan_thuong ON tran_dau.id = chan_thuong.id_tran_dau WHERE chan_thuong.cau_thu = 'Thiago Motta'
SELECT ten, so_luong_nguoi_tham_du_trung_binh, tong_so_nguoi_tham_du FROM san_van_dong WHERE id NOT IN (SELECT T1.id_san_van_dong FROM tran_dau AS T1 JOIN chan_thuong AS T2 ON T1.id = T2.id_tran_dau)
SELECT ten FROM san_van_dong WHERE ten LIKE '%ngân hàng%'
SELECT ten, tran_dau_san_nha FROM san_van_dong
SELECT T1.cau_thu , T2.ngay FROM chan_thuong AS T1 JOIN tran_dau AS T2 ON T1.id_tran_dau = T2.id ORDER BY T2.mua_giai DESC
SELECT nam_phat_hanh FROM bo_phim WHERE tieu_de = 'Trò chơi bắt chước'
SELECT bo_phim.nam_phat_hanh FROM bo_phim WHERE bo_phim.tieu_de = 'Trò chơi bắt chước'
SELECT nam_sinh FROM dien_vien WHERE ten = 'Benedict Cumberbatch'
SELECT nam_sinh FROM dien_vien WHERE ten = 'Benedict Cumberbatch'
SELECT quoc_tich FROM dien_vien WHERE ten = 'Christoph Waltz' AND gioi_tinh = 'nữ'
SELECT dien_vien.quoc_tich FROM dien_vien WHERE dien_vien.ten = 'Christoph Waltz'
SELECT tieu_de FROM bo_phim WHERE nam_phat_hanh = 2015
SELECT ten FROM dien_vien WHERE noi_sinh = 'Tehran'
SELECT ten FROM dien_vien WHERE noi_sinh = 'Tehran'
SELECT ten FROM dien_vien WHERE noi_sinh = 'Tehran'
SELECT ten FROM dien_vien WHERE quoc_tich = 'Afghanistan'
SELECT ten FROM dien_vien WHERE quoc_tich = 'Afghanistan'
SELECT ten FROM dien_vien WHERE quoc_tich = 'Afghanistan'
SELECT ten FROM dien_vien WHERE nam_sinh = 1984
SELECT nam_sinh FROM dien_vien WHERE ten = 'Kevin Spacey'
SELECT nam_sinh FROM dien_vien WHERE ten = 'Kevin Spacey'
SELECT noi_sinh FROM dien_vien WHERE ten = 'Kevin Spacey'
SELECT noi_sinh FROM dien_vien WHERE ten = 'Kevin Spacey'
SELECT quoc_tich FROM dien_vien WHERE ten = 'Kevin Spacey'
SELECT bo_phim.ngan_sach FROM bo_phim WHERE bo_phim.tieu_de = 'Đi tìm Nemo'
SELECT bo_phim.tieu_de FROM bo_phim JOIN ban_quyen ON bo_phim.id_bo_phim = ban_quyen.id_se_ri_phim JOIN dao_dien_boi ON ban_quyen.id_se_ri_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Steven Spielberg' AND bo_phim.nam_phat_hanh > 2006
SELECT dao_dien.ten FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE bo_phim.tieu_de = 'James Bond'
SELECT dao_dien.ten FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE bo_phim.tieu_de = 'James Bond'
SELECT ten FROM dao_dien JOIN dao_dien_boi ON dao_dien.id_dao_dien = dao_dien_boi.id_dao_dien JOIN bo_phim ON dao_dien_boi.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'James Bond'
SELECT T1.ten FROM dien_vien AS T1 JOIN phan_vai AS T2 ON T1.id_dien_vien = T2.id_dien_vien JOIN bo_phim AS T3 ON T2.id_se_ri_phim = T3.id_bo_phim WHERE T3.tieu_de = 'Trò chơi bắt chước' AND T2.vai_dien = 'Alan Turing'
SELECT ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Trò chơi bắt chước' AND phan_vai.vai_dien = 'Alan Turing'
SELECT ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Trò chơi bắt chước' AND phan_vai.vai_dien = 'Alan Turing'
SELECT dien_vien.ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Trò chơi bắt chước' AND phan_vai.vai_dien = 'Alan Turing'
SELECT dien_vien.ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Trò chơi bắt chước' AND phan_vai.vai_dien = 'Alan Turing'
SELECT the_loai.the_loai FROM bo_phim JOIN phan_loai ON bo_phim.id_bo_phim = phan_loai.id_se_ri_phim JOIN the_loai ON phan_loai.id_the_loai = the_loai.id_the_loai WHERE bo_phim.tieu_de = 'Công viên kỷ Jura'
SELECT dao_dien.ten FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE bo_phim.tieu_de = 'Niềm vui' AND bo_phim.nam_phat_hanh = 2015
SELECT bo_phim.tieu_de FROM bo_phim JOIN ban_quyen ON bo_phim.id_bo_phim = ban_quyen.id_se_ri_phim JOIN duoc_viet_boi ON ban_quyen.id_se_ri_phim = duoc_viet_boi.id_se_ri_phim JOIN nha_viet_kich_ban ON duoc_viet_boi.id_nha_viet_kich_ban = nha_viet_kich_ban.id_nha_viet_kich_ban WHERE nha_viet_kich_ban.ten = 'Matt Damon'
SELECT bo_phim.tieu_de FROM bo_phim JOIN duoc_lam_boi ON bo_phim.id_bo_phim = duoc_lam_boi.id_se_ri_phim JOIN nha_san_xuat ON duoc_lam_boi.id_nha_san_xuat = nha_san_xuat.id_nha_san_xuat JOIN duoc_viet_boi ON bo_phim.id_bo_phim = duoc_viet_boi.id_se_ri_phim JOIN nha_viet_kich_ban ON duoc_viet_boi.id_nha_viet_kich_ban = nha_viet_kich_ban.id_nha_viet_kich_ban WHERE nha_san_xuat.ten = 'Woody Allen' AND nha_viet_kich_ban.ten = 'Woody Allen'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON dien_vien.id_dien_vien = phan_vai.id_dien_vien WHERE dien_vien.ten = 'Robin Wright'
SELECT T1.tieu_de FROM bo_phim AS T1 JOIN phan_vai AS T2 ON T1.id_bo_phim = T2.id_se_ri_phim JOIN dien_vien AS T3 ON T2.id_dien_vien = T3.id_dien_vien WHERE T3.ten = 'Robin Wright'
SELECT T1.tieu_de FROM bo_phim AS T1 JOIN phan_vai AS T2 ON T1.id_bo_phim = T2.id_se_ri_phim JOIN dien_vien AS T3 ON T2.id_dien_vien = T3.id_dien_vien WHERE T3.ten = 'Robin Wright'
SELECT bo_phim.ngan_sach FROM bo_phim WHERE bo_phim.tieu_de = 'Juno' AND bo_phim.nam_phat_hanh = 2007
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_loai ON bo_phim.id_bo_phim = phan_loai.id_se_ri_phim JOIN the_loai ON phan_loai.id_the_loai = the_loai.id_the_loai WHERE the_loai.the_loai = 'Khoa học viễn tưởng' AND bo_phim.nam_phat_hanh = 2010
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_loai ON bo_phim.id_bo_phim = phan_loai.id_se_ri_phim JOIN the_loai ON phan_loai.id_the_loai = the_loai.id_the_loai WHERE the_loai.the_loai = 'Khoa học viễn tưởng' AND bo_phim.nam_phat_hanh = 2010
SELECT ten FROM dien_vien WHERE noi_sinh = 'Austin' AND nam_sinh > 1980
SELECT ten FROM dien_vien WHERE noi_sinh = 'Austin' AND nam_sinh > 1980
SELECT ten FROM dien_vien WHERE noi_sinh = 'Austin' AND nam_sinh > 1980
SELECT bo_phim.tieu_de FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.noi_sinh = 'Los Angeles'
SELECT ten FROM dien_vien WHERE noi_sinh = 'New York' AND nam_sinh = 1984
SELECT bo_phim.tieu_de FROM bo_phim JOIN nhan ON bo_phim.id_bo_phim = nhan.id_se_ri_phim JOIN tu_khoa ON nhan.id_tu_khoa = tu_khoa.id WHERE tu_khoa.tu_khoa = 'Vũ khí hạt nhân'
SELECT bo_phim.tieu_de FROM bo_phim JOIN nhan ON bo_phim.id_bo_phim = nhan.id_se_ri_phim JOIN tu_khoa ON nhan.id_tu_khoa = tu_khoa.id WHERE tu_khoa.tu_khoa = 'Vũ khí hạt nhân'
SELECT T4.tieu_de FROM dao_dien_boi AS T1 JOIN dao_dien AS T3 ON T1.id_dao_dien = T3.id_dao_dien JOIN ban_quyen AS T2 ON T1.id_se_ri_phim = T2.id_se_ri_phim JOIN bo_phim AS T4 ON T2.id_se_ri_phim = T4.id_bo_phim WHERE T3.ten = 'Alfred Hitchcock'
SELECT bo_phim.tieu_de FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dao_dien.ten = 'Asghar Farhadi' AND dien_vien.ten = 'Taraneh Alidoosti'
SELECT bo_phim.tieu_de FROM bo_phim JOIN ban_quyen ON bo_phim.id_bo_phim = ban_quyen.id_se_ri_phim JOIN dao_dien_boi ON ban_quyen.id_se_ri_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien JOIN phan_vai ON ban_quyen.id_se_ri_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dao_dien.ten = 'Asghar Farhadi' AND dien_vien.ten = 'Taraneh Alidoosti'
SELECT bo_phim.tieu_de FROM bo_phim JOIN ban_quyen ON bo_phim.id_bo_phim = ban_quyen.id_se_ri_phim JOIN dao_dien_boi ON ban_quyen.id_se_ri_phim = dao_dien_boi.id_se_ri_phim JOIN phan_vai ON ban_quyen.id_se_ri_phim = phan_vai.id_se_ri_phim WHERE dao_dien_boi.id_dao_dien = (SELECT id_dao_dien FROM dao_dien WHERE ten = 'Asghar Farhadi') AND phan_vai.id_dien_vien = (SELECT id_dien_vien FROM dien_vien WHERE ten = 'Taraneh Alidoosti')
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Asghar Farhad' AND dien_vien.ten = 'Taraneh Alidoosti'
SELECT T1.tieu_de FROM phim_truyen_hinh_nhieu_tap AS T1 JOIN ban_quyen AS T2 ON T1.id_se_ri_phim_truyen_hinh = T2.id_se_ri_phim JOIN dao_dien_boi AS T3 ON T2.id_se_ri_phim = T3.id_se_ri_phim JOIN dao_dien AS T4 ON T3.id_dao_dien = T4.id_dao_dien WHERE T4.ten = 'Shonda Rhimes'
SELECT T1.ten FROM dien_vien AS T1 JOIN phan_vai AS T2 ON T1.id_dien_vien = T2.id_dien_vien JOIN bo_phim AS T3 ON T2.id_se_ri_phim = T3.id_bo_phim WHERE T2.vai_dien = 'Olivia Pope' AND T3.tieu_de = 'Scandal'
SELECT nha_viet_kich_ban.ten FROM bo_phim JOIN duoc_viet_boi ON bo_phim.id_bo_phim = duoc_viet_boi.id_se_ri_phim JOIN nha_viet_kich_ban ON duoc_viet_boi.id_nha_viet_kich_ban = nha_viet_kich_ban.id_nha_viet_kich_ban WHERE bo_phim.tieu_de = 'Buổi diễn của Truman'
SELECT nha_viet_kich_ban.ten FROM bo_phim JOIN duoc_viet_boi ON bo_phim.id_bo_phim = duoc_viet_boi.id_se_ri_phim JOIN nha_viet_kich_ban ON duoc_viet_boi.id_nha_viet_kich_ban = nha_viet_kich_ban.id_nha_viet_kich_ban WHERE bo_phim.tieu_de = 'Buổi diễn của Truman'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Scott Foley'
SELECT T1.tieu_de FROM bo_phim AS T1 JOIN phan_vai AS T2 ON T1.id_bo_phim = T2.id_se_ri_phim JOIN dien_vien AS T3 ON T2.id_dien_vien = T3.id_dien_vien WHERE T3.ten = 'Scott Foley'
SELECT dao_dien.ten FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien JOIN dao_dien_boi ON phan_vai.id_se_ri_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dien_vien.ten = 'Kate Winslet'
SELECT dao_dien.ten FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dien_vien.ten = 'Kate Winslet'
SELECT ten FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE bo_phim.tieu_de = 'Ván bài chính trị' AND bo_phim.nam_phat_hanh = 2013
SELECT ten FROM dien_vien WHERE gioi_tinh = 'nữ' AND noi_sinh = 'Austin'
SELECT ten FROM dien_vien WHERE quoc_tich = 'Ý' AND nam_sinh > 1980
SELECT ten FROM dien_vien WHERE gioi_tinh = 'nữ' AND noi_sinh = 'New York' AND nam_sinh > 1980
SELECT T1.ten FROM dien_vien AS T1 JOIN phan_vai AS T2 ON T1.id_dien_vien = T2.id_dien_vien JOIN bo_phim AS T3 ON T2.id_se_ri_phim = T3.id_bo_phim WHERE T3.tieu_de = 'Giải cứu binh nhì Ryan' AND T1.gioi_tinh = 'nữ'
SELECT ten FROM dao_dien WHERE quoc_tich = 'Afghanistan'
SELECT dien_vien.ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Nữ binh sĩ'
SELECT dien_vien.id_dien_vien , dien_vien.gioi_tinh , dien_vien.ten , dien_vien.quoc_tich , dien_vien.noi_sinh , dien_vien.nam_sinh FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE dien_vien.quoc_tich = 'Canada' AND bo_phim.tieu_de = 'James Bond'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Rowan Atkinson' AND phan_vai.vai_dien = 'Ngài Bean'
SELECT dao_dien.noi_sinh FROM dao_dien JOIN dao_dien_boi ON dao_dien.id_dao_dien = dao_dien_boi.id_dao_dien JOIN bo_phim ON dao_dien_boi.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Quá khứ'
SELECT ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien WHERE phan_vai.vai_dien = 'Ngài Bean'
SELECT the_loai.the_loai FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien JOIN phan_loai ON bo_phim.id_bo_phim = phan_loai.id_se_ri_phim WHERE dao_dien.ten = 'Asghar Farhadi'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE phan_vai.vai_dien = 'Chú vịt Daffy'
SELECT phan_vai.vai_dien FROM phan_vai JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Ông bố chân dài'
SELECT dao_dien.ten FROM bo_phim JOIN phan_loai ON bo_phim.id_bo_phim = phan_loai.id_se_ri_phim JOIN the_loai ON phan_loai.id_the_loai = the_loai.id_the_loai JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE the_loai.the_loai = 'Vũ khí hạt nhân'
SELECT COUNT(*) FROM bo_phim AS T1 JOIN phan_vai AS T2 ON T1.id_bo_phim = T2.id_se_ri_phim JOIN dien_vien AS T3 ON T2.id_dien_vien = T3.id_dien_vien WHERE T3.ten = 'Jennifer Aniston' AND T1.nam_phat_hanh > 2010
SELECT COUNT ( * ) FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Giải cứu binh nhì Ryan'
SELECT COUNT(*) FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Giải cứu binh nhì Ryan'
SELECT COUNT(*) FROM bo_phim JOIN ban_quyen ON bo_phim.id_bo_phim = ban_quyen.id_se_ri_phim JOIN dao_dien_boi ON ban_quyen.id_se_ri_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Steven Spielberg'
SELECT COUNT(*) FROM bo_phim WHERE nam_phat_hanh = 2013
SELECT COUNT(*) FROM dbo.bo_phim WHERE nam_phat_hanh = 2013
SELECT T3.nam_phat_hanh , COUNT ( * ) FROM dao_dien AS T1 JOIN dao_dien_boi AS T2 ON T1.id_dao_dien = T2.id_dao_dien JOIN bo_phim AS T3 ON T2.id_se_ri_phim = T3.id_bo_phim WHERE T1.ten = 'Woody Allen' GROUP BY T3.nam_phat_hanh
SELECT COUNT(DISTINCT bo_phim.id_bo_phim) FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Shahab Hosseini'
SELECT COUNT(DISTINCT T1.id_bo_phim) FROM bo_phim AS T1 JOIN phan_vai AS T2 ON T1.id_bo_phim = T2.id_se_ri_phim JOIN dien_vien AS T3 ON T2.id_dien_vien = T3.id_dien_vien WHERE T3.ten = 'Shahab Hosseini'
SELECT COUNT(*) FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien WHERE dien_vien.ten = 'Shahab Hosseini'
SELECT COUNT(DISTINCT phan_vai.id_se_ri_phim) FROM phan_vai JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Shahab Hosseini'
SELECT COUNT(*) FROM dien_vien WHERE noi_sinh = 'Los Angeles' AND nam_sinh > 2000
SELECT COUNT(*) FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Humphrey Bogart' AND bo_phim.nam_phat_hanh < 1942
SELECT T2.nam_phat_hanh , COUNT ( * ) FROM phan_vai AS T1 JOIN bo_phim AS T2 ON T1.id_se_ri_phim = T2.id_bo_phim JOIN dien_vien AS T3 ON T1.id_dien_vien = T3.id_dien_vien WHERE T3.ten_dien_vien = 'Brad Pitt' GROUP BY T2.nam_phat_hanh
SELECT COUNT(*) FROM bo_phim JOIN nhan ON bo_phim.id_bo_phim = nhan.id_se_ri_phim JOIN tu_khoa ON nhan.id_tu_khoa = tu_khoa.id WHERE tu_khoa.tu_khoa = 'Chiến tranh Iraq' AND bo_phim.nam_phat_hanh = 2015
SELECT COUNT(*) FROM bo_phim JOIN nhan ON bo_phim.id_bo_phim = nhan.id_se_ri_phim JOIN tu_khoa ON nhan.id_tu_khoa = tu_khoa.id WHERE tu_khoa.tu_khoa = 'Ba Tư' AND bo_phim.nam_phat_hanh > 1990
SELECT COUNT(*) FROM dao_dien AS T1 JOIN dao_dien_boi AS T2 ON T1.id_dao_dien = T2.id_dao_dien JOIN bo_phim AS T3 ON T2.id_se_ri_phim = T3.id_bo_phim WHERE T1.ten = 'Quentin Tarantino' AND T3.nam_phat_hanh > 2010
SELECT COUNT(*) FROM dao_dien JOIN dao_dien_boi ON dao_dien.id_dao_dien = dao_dien_boi.id_dao_dien JOIN bo_phim ON dao_dien_boi.id_se_ri_phim = bo_phim.id_bo_phim WHERE dao_dien.ten = 'Quentin Tarantino' AND bo_phim.nam_phat_hanh < 2010
SELECT COUNT(*) FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Quentin Tarantino' AND (bo_phim.nam_phat_hanh < 2002 OR bo_phim.nam_phat_hanh > 2010)
SELECT COUNT(*) FROM dien_vien WHERE gioi_tinh = 'nữ' AND nam_sinh > 1980 AND noi_sinh = 'New York'
SELECT COUNT(*) FROM dien_vien AS T1 JOIN phan_vai AS T2 ON T1.id_dien_vien = T2.id_dien_vien JOIN ban_quyen AS T3 ON T2.id_se_ri_phim = T3.id_se_ri_phim JOIN dao_dien AS T4 ON T3.id_se_ri_phim = T4.id_dao_dien WHERE T1.quoc_tich = 'Iran' AND T4.ten = 'Jim Jarmusch'
SELECT COUNT(*) FROM dien_vien AS T1 JOIN phan_vai AS T2 ON T1.id_dien_vien = T2.id_dien_vien JOIN bo_phim AS T3 ON T2.id_se_ri_phim = T3.id_bo_phim WHERE T3.tieu_de = 'Giờ cao điểm 3' AND T1.quoc_tich = 'Trung Quốc'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Woody Strode' INTERSECT SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Jason Robards'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Woody Strode' INTERSECT SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Jason Robards'
SELECT bo_phim.tieu_de FROM phan_vai JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Woody Strode' INTERSECT SELECT bo_phim.tieu_de FROM phan_vai JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Jason Robards'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Woody Strode' INTERSECT SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Jason Robards'
SELECT ten FROM dien_vien WHERE id_dien_vien IN (SELECT id_dien_vien FROM phan_vai WHERE id_se_ri_phim IN (SELECT id_se_ri_phim FROM phan_vai WHERE id_dien_vien = (SELECT id_dien_vien FROM dien_vien WHERE ten = 'Tom Hanks'))) AND id_dien_vien != (SELECT id_dien_vien FROM dien_vien WHERE ten = 'Tom Hanks')
SELECT bo_phim.tieu_de FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim WHERE dao_dien_boi.id_dao_dien IN (SELECT dao_dien_boi.id_dao_dien FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim WHERE bo_phim.tieu_de = 'Con đường cách mạng')
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_loai ON bo_phim.id_bo_phim = phan_loai.id_se_ri_phim GROUP BY bo_phim.id_bo_phim ORDER BY COUNT(*) DESC LIMIT 1
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.quoc_tich = 'Trung Quốc' GROUP BY bo_phim.id_bo_phim ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM dien_vien WHERE id_dien_vien IN (SELECT id_dien_vien FROM phan_vai WHERE id_se_ri_phim = (SELECT id_bo_phim FROM bo_phim ORDER BY nam_phat_hanh DESC LIMIT 1))
SELECT bo_phim.tieu_de, bo_phim.ngan_sach FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Quentin Tarantino' ORDER BY bo_phim.nam_phat_hanh DESC LIMIT 1
SELECT T1.tieu_de FROM bo_phim AS T1 JOIN dao_dien_boi AS T2 ON T1.id_bo_phim = T2.id_se_ri_phim JOIN dao_dien AS T3 ON T2.id_dao_dien = T3.id_dao_dien WHERE T3.ten = 'Jim Jarmusch' ORDER BY T1.nam_phat_hanh DESC LIMIT 1
SELECT nha_san_xuat.ten FROM nha_san_xuat JOIN duoc_lam_boi ON nha_san_xuat.id_nha_san_xuat = duoc_lam_boi.id_nha_san_xuat JOIN dao_dien_boi ON duoc_lam_boi.id_se_ri_phim = dao_dien_boi.id_se_ri_phim GROUP BY nha_san_xuat.id_nha_san_xuat ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.tieu_de FROM bo_phim AS T2 JOIN phan_vai AS T1 ON T2.id_bo_phim = T1.id_se_ri_phim JOIN dien_vien AS T3 ON T1.id_dien_vien = T3.id_dien_vien WHERE T3.ten = 'Gabriele Ferzetti' ORDER BY T2.nam_phat_hanh DESC LIMIT 1
SELECT chi_tiet_khach_hang FROM khach_hang ORDER BY chi_tiet_khach_hang ASC
SELECT chi_tiet_khach_hang FROM khach_hang ORDER BY chi_tiet_khach_hang ASC
SELECT chinh_sach.ma_loai_chinh_sach FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang WHERE khach_hang.chi_tiet_khach_hang = 'Dayana Robel'
SELECT chinh_sach.ma_loai_chinh_sach FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang WHERE khach_hang.chi_tiet_khach_hang = 'Dayana Robel'
SELECT ma_loai_chinh_sach FROM chinh_sach GROUP BY ma_loai_chinh_sach ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_chinh_sach FROM chinh_sach GROUP BY ma_loai_chinh_sach ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_chinh_sach FROM chinh_sach GROUP BY ma_loai_chinh_sach HAVING COUNT(id_khach_hang) > 2
SELECT ma_loai_chinh_sach FROM chinh_sach GROUP BY ma_loai_chinh_sach HAVING COUNT(id_khach_hang) > 2
SELECT SUM(so_tien_duoc_tra), AVG(so_tien_duoc_tra) FROM tieu_de_cua_yeu_cau
SELECT SUM(so_tien_duoc_tra), AVG(so_tien_duoc_tra) FROM tieu_de_cua_yeu_cau
SELECT T2.so_tien_duoc_yeu_cau FROM tai_lieu_cua_yeu_cau AS T1 JOIN tieu_de_cua_yeu_cau AS T2 ON T1.id_yeu_cau = T2.id_tieu_de_cua_yeu_cau ORDER BY T1.ngay_tao_ra DESC LIMIT 1
SELECT T2.so_tien_duoc_yeu_cau FROM tai_lieu_cua_yeu_cau AS T1 JOIN tieu_de_cua_yeu_cau AS T2 ON T1.id_yeu_cau = T2.id_tieu_de_cua_yeu_cau WHERE T1.ngay_tao_ra = (SELECT MAX(ngay_tao_ra) FROM tai_lieu_cua_yeu_cau)
SELECT khach_hang.chi_tiet_khach_hang, tieu_de_cua_yeu_cau.so_tien_duoc_yeu_cau FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang JOIN tieu_de_cua_yeu_cau ON chinh_sach.id_chinh_sach = tieu_de_cua_yeu_cau.id_chinh_sach ORDER BY tieu_de_cua_yeu_cau.so_tien_duoc_yeu_cau DESC LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang JOIN tieu_de_cua_yeu_cau ON chinh_sach.id_chinh_sach = tieu_de_cua_yeu_cau.id_chinh_sach ORDER BY tieu_de_cua_yeu_cau.so_tien_duoc_yeu_cau DESC LIMIT 1
SELECT T1.chi_tiet_khach_hang FROM khach_hang AS T1 JOIN chinh_sach AS T2 ON T1.id_khach_hang = T2.id_khach_hang JOIN tieu_de_cua_yeu_cau AS T3 ON T2.id_chinh_sach = T3.id_chinh_sach ORDER BY T3.so_tien_duoc_tra ASC LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang JOIN tieu_de_cua_yeu_cau ON chinh_sach.id_chinh_sach = tieu_de_cua_yeu_cau.id_chinh_sach ORDER BY tieu_de_cua_yeu_cau.so_tien_duoc_tra ASC LIMIT 1
SELECT chi_tiet_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM chinh_sach)
SELECT chi_tiet_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM chinh_sach)
SELECT COUNT(*) FROM giai_doan_xu_ly_yeu_cau
SELECT COUNT(DISTINCT ten_tinh_trang_yeu_cau) FROM giai_doan_xu_ly_yeu_cau
SELECT T2.ten_tinh_trang_yeu_cau , COUNT ( * ) FROM xu_ly_yeu_cau AS T1 JOIN giai_doan_xu_ly_yeu_cau AS T2 ON T1.id_giai_doan_xu_ly_yeu_cau = T2.id_giai_doan_yeu_cau GROUP BY T2.id_giai_doan_yeu_cau ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT giai_doan_xu_ly_yeu_cau.ten_tinh_trang_yeu_cau FROM giai_doan_xu_ly_yeu_cau JOIN xu_ly_yeu_cau ON giai_doan_xu_ly_yeu_cau.id_giai_doan_yeu_cau = xu_ly_yeu_cau.id_giai_doan_xu_ly_yeu_cau GROUP BY giai_doan_xu_ly_yeu_cau.id_giai_doan_yeu_cau ORDER BY COUNT(*) DESC LIMIT 1
SELECT id_khach_hang, chi_tiet_khach_hang FROM khach_hang WHERE chi_tiet_khach_hang LIKE '%Diana%'
SELECT khach_hang.chi_tiet_khach_hang FROM khach_hang WHERE khach_hang.chi_tiet_khach_hang LIKE '%Diana%'
SELECT khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang WHERE chinh_sach.ma_loai_chinh_sach = 'Uỷ quyền'
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang WHERE chinh_sach.ma_loai_chinh_sach = 'Uỷ quyền'
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang WHERE chinh_sach.ma_loai_chinh_sach IN ('Uỷ quyền', 'Thống nhất')
SELECT khach_hang.* FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang WHERE chinh_sach.ma_loai_chinh_sach IN ('Uỷ quyền', 'Thống nhất')
SELECT id_khach_hang, chi_tiet_khach_hang FROM khach_hang UNION SELECT id_nhan_vien, chi_tiet_nhan_vien FROM nhan_vien
SELECT chi_tiet_khach_hang FROM khach_hang UNION SELECT chi_tiet_nhan_vien FROM nhan_vien
SELECT ma_loai_chinh_sach , COUNT ( * ) FROM chinh_sach GROUP BY ma_loai_chinh_sach
SELECT ma_loai_chinh_sach , COUNT ( * ) FROM chinh_sach GROUP BY ma_loai_chinh_sach
SELECT khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.mo_ta_ve_tinh_trang_yeu_cau FROM tieu_de_cua_yeu_cau AS T1 JOIN giai_doan_xu_ly_yeu_cau AS T2 ON T1.ma_tinh_trang_yeu_cau = T2.ten_tinh_trang_yeu_cau WHERE T1.ma_tinh_trang_yeu_cau = 'Mở'
SELECT T2.mo_ta_ve_tinh_trang_yeu_cau FROM tieu_de_cua_yeu_cau AS T1 JOIN giai_doan_xu_ly_yeu_cau AS T2 ON T1.id_giai_doan_xu_ly_yeu_cau = T2.id_giai_doan_xu_ly_yeu_cau WHERE T1.ma_tinh_trang_yeu_cau = 'Mở'
SELECT COUNT(*) FROM tieu_de_cua_yeu_cau
SELECT COUNT(DISTINCT ma_ket_qua_cua_yeu_cau) FROM xu_ly_yeu_cau
SELECT khach_hang.id_khach_hang , khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang ORDER BY chinh_sach.ngay_bat_dau DESC LIMIT 1
SELECT khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang ORDER BY chinh_sach.ngay_bat_dau DESC LIMIT 1
SELECT su_kien.chi_tiet_su_kien FROM su_kien JOIN dich_vu ON su_kien.id_dich_vu = dich_vu.id_dich_vu WHERE dich_vu.ma_loai_dich_vu = 'Đám cưới'
SELECT T1.id_su_kien , T1.chi_tiet_su_kien FROM su_kien AS T1 JOIN nguoi_tham_gia_su_kien AS T2 ON T1.id_su_kien = T2.id_su_kien GROUP BY T1.id_su_kien HAVING COUNT ( * ) > 1
SELECT T1.id_nguoi_tham_gia , T1.ma_loai_nguoi_tham_gia , COUNT ( * ) FROM nguoi_tham_gia AS T1 JOIN nguoi_tham_gia_su_kien AS T2 ON T1.id_nguoi_tham_gia = T2.id_nguoi_tham_gia GROUP BY T1.id_nguoi_tham_gia , T1.ma_loai_nguoi_tham_gia
SELECT id_nguoi_tham_gia , ma_loai_nguoi_tham_gia , chi_tiet_nguoi_tham_gia FROM nguoi_tham_gia
SELECT COUNT(*) FROM nguoi_tham_gia WHERE ma_loai_nguoi_tham_gia = ' Người tổ chức '
SELECT ma_loai_dich_vu FROM dich_vu ORDER BY ma_loai_dich_vu ASC
SELECT COUNT(*) FROM su_kien JOIN nguoi_tham_gia_su_kien ON su_kien.id_su_kien = nguoi_tham_gia_su_kien.id_su_kien JOIN nguoi_tham_gia ON nguoi_tham_gia_su_kien.id_nguoi_tham_gia = nguoi_tham_gia.id_nguoi_tham_gia WHERE nguoi_tham_gia.chi_tiet_nguoi_tham_gia LIKE '%Dr%'
SELECT ma_loai_nguoi_tham_gia FROM nguoi_tham_gia GROUP BY ma_loai_nguoi_tham_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT dich_vu.id_dich_vu, dich_vu.ma_loai_dich_vu FROM dich_vu JOIN su_kien ON dich_vu.id_dich_vu = su_kien.id_dich_vu JOIN nguoi_tham_gia_su_kien ON su_kien.id_su_kien = nguoi_tham_gia_su_kien.id_su_kien GROUP BY dich_vu.id_dich_vu, dich_vu.ma_loai_dich_vu ORDER BY COUNT(*) ASC LIMIT 1
SELECT su_kien.id_su_kien FROM su_kien JOIN nguoi_tham_gia_su_kien ON su_kien.id_su_kien = nguoi_tham_gia_su_kien.id_su_kien GROUP BY su_kien.id_su_kien ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_su_kien FROM su_kien AS T1 WHERE T1.id_su_kien NOT IN (SELECT T2.id_su_kien FROM nguoi_tham_gia_su_kien AS T2 JOIN nguoi_tham_gia AS T3 ON T2.id_nguoi_tham_gia = T3.id_nguoi_tham_gia WHERE T3.chi_tiet_nguoi_tham_gia = 'Kenyatta Kuhn')
SELECT DISTINCT dich_vu.ma_loai_dich_vu FROM dich_vu JOIN su_kien ON dich_vu.id_dich_vu = su_kien.id_dich_vu WHERE su_kien.chi_tiet_su_kien IN ('Thành công', 'Thất bại')
SELECT COUNT(*) FROM su_kien WHERE id_su_kien NOT IN (SELECT id_su_kien FROM nguoi_tham_gia_su_kien)
SELECT COUNT(*) FROM nguoi_tham_gia JOIN nguoi_tham_gia_su_kien ON nguoi_tham_gia.id_nguoi_tham_gia = nguoi_tham_gia_su_kien.id_nguoi_tham_gia
SELECT COUNT(*) FROM ky_thuat_vien
SELECT COUNT(*) FROM ky_thuat_vien
SELECT ten FROM ky_thuat_vien ORDER BY tuoi ASC
SELECT ten FROM ky_thuat_vien ORDER BY tuoi ASC
SELECT doi , nam_bat_dau FROM ky_thuat_vien
SELECT doi, nam_bat_dau FROM ky_thuat_vien
SELECT ten FROM ky_thuat_vien WHERE doi != 'NYY'
SELECT ten FROM ky_thuat_vien WHERE doi != 'NYY'
SELECT ten FROM ky_thuat_vien WHERE tuoi = 36 OR tuoi = 37
SELECT ten FROM ky_thuat_vien WHERE tuoi = 36 OR tuoi = 37
SELECT ky_thuat_vien.nam_bat_dau FROM ky_thuat_vien ORDER BY ky_thuat_vien.nam_bat_dau ASC LIMIT 1
SELECT MIN(ky_thuat_vien.nam_bat_dau) FROM ky_thuat_vien
SELECT doi , COUNT ( * ) FROM ky_thuat_vien GROUP BY doi
SELECT doi , COUNT ( * ) FROM ky_thuat_vien GROUP BY doi
SELECT doi FROM ky_thuat_vien GROUP BY doi ORDER BY COUNT(*) DESC LIMIT 1
SELECT doi FROM ky_thuat_vien GROUP BY doi ORDER BY COUNT(*) DESC LIMIT 1
SELECT doi FROM ky_thuat_vien GROUP BY doi HAVING COUNT(*) >= 2
SELECT doi FROM ky_thuat_vien GROUP BY doi HAVING COUNT(*) >= 2
SELECT ky_thuat_vien.ten , may_moc.loat_may FROM ky_thuat_vien JOIN phan_cong_sua_chua ON ky_thuat_vien.id_ky_thuat_vien = phan_cong_sua_chua.id_ky_thuat_vien JOIN may_moc ON phan_cong_sua_chua.id_may = may_moc.id_may
SELECT ky_thuat_vien.ten , may_moc.loat_may FROM ky_thuat_vien JOIN phan_cong_sua_chua ON ky_thuat_vien.id_ky_thuat_vien = phan_cong_sua_chua.id_ky_thuat_vien JOIN may_moc ON phan_cong_sua_chua.id_may = may_moc.id_may
SELECT T1.ten FROM ky_thuat_vien AS T1 JOIN phan_cong_sua_chua AS T2 ON T1.id_ky_thuat_vien = T2.id_ky_thuat_vien JOIN may_moc AS T3 ON T2.id_may = T3.id_may ORDER BY T3.xep_hang_chat_luong ASC
SELECT ky_thuat_vien.ten FROM ky_thuat_vien JOIN phan_cong_sua_chua ON ky_thuat_vien.id_ky_thuat_vien = phan_cong_sua_chua.id_ky_thuat_vien JOIN may_moc ON phan_cong_sua_chua.id_may = may_moc.id_may ORDER BY may_moc.xep_hang_chat_luong ASC
SELECT T1.ten FROM ky_thuat_vien AS T1 JOIN phan_cong_sua_chua AS T2 ON T1.id_ky_thuat_vien = T2.id_ky_thuat_vien JOIN may_moc AS T3 ON T2.id_may = T3.id_may WHERE T3.diem_gia_tri > 70
SELECT T1.ten FROM ky_thuat_vien AS T1 JOIN phan_cong_sua_chua AS T2 ON T1.id_ky_thuat_vien = T2.id_ky_thuat_vien JOIN may_moc AS T3 ON T2.id_may = T3.id_may WHERE T3.diem_gia_tri > 70
SELECT ky_thuat_vien.ten , COUNT ( * ) FROM ky_thuat_vien JOIN phan_cong_sua_chua ON ky_thuat_vien.id_ky_thuat_vien = phan_cong_sua_chua.id_ky_thuat_vien GROUP BY ky_thuat_vien.id_ky_thuat_vien
SELECT ky_thuat_vien.ten , COUNT ( * ) FROM ky_thuat_vien JOIN phan_cong_sua_chua ON ky_thuat_vien.id_ky_thuat_vien = phan_cong_sua_chua.id_ky_thuat_vien GROUP BY ky_thuat_vien.id_ky_thuat_vien
SELECT ten FROM ky_thuat_vien WHERE id_ky_thuat_vien NOT IN (SELECT id_ky_thuat_vien FROM phan_cong_sua_chua)
SELECT ten FROM ky_thuat_vien WHERE id_ky_thuat_vien NOT IN (SELECT id_ky_thuat_vien FROM phan_cong_sua_chua)
SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi = 'CLE' INTERSECT SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi = 'CWS'
SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi = 'CLE' INTERSECT SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi = 'CWS'
SELECT COUNT ( * ) FROM ong_kinh_may_anh WHERE do_dai_tieu_cu_theo_mm > 15
SELECT nhan_hieu , ten FROM ong_kinh_may_anh ORDER BY khau_do_toi_da DESC
SELECT id, mau_sac, ten FROM anh
SELECT MAX(nui.chieu_cao), AVG(nui.chieu_cao) FROM nui
SELECT AVG(nui.do_noi) FROM nui WHERE nui.quoc_gia = 'Morocco'
SELECT ten, chieu_cao, do_noi FROM nui WHERE ten != 'Aberdare'
SELECT anh.id, anh.ten FROM anh JOIN nui ON anh.id_nui = nui.id WHERE nui.chieu_cao > 4000
SELECT T1.id , T1.ten FROM nui AS T1 JOIN anh AS T2 ON T1.id = T2.id_nui GROUP BY T1.id HAVING COUNT(*) >= 2
SELECT T2.ten FROM ong_kinh_may_anh AS T2 JOIN anh AS T1 ON T2.id = T1.id_ong_kinh_may_anh JOIN nui AS T3 ON T1.id_nui = T3.id WHERE T3.chieu_cao = (SELECT MAX(chieu_cao) FROM nui)
SELECT ten FROM anh JOIN ong_kinh_may_anh ON anh.id_ong_kinh_may_anh = ong_kinh_may_anh.id WHERE ong_kinh_may_anh.nhan_hieu IN ('Sigma', 'Olympus')
SELECT COUNT ( DISTINCT nhan_hieu ) FROM ong_kinh_may_anh
SELECT COUNT(*) FROM ong_kinh_may_anh WHERE id NOT IN (SELECT id_ong_kinh_may_anh FROM anh)
SELECT COUNT(DISTINCT ong_kinh_may_anh.id) FROM anh JOIN nui ON anh.id_nui = nui.id JOIN ong_kinh_may_anh ON anh.id_ong_kinh_may_anh = ong_kinh_may_anh.id WHERE nui.quoc_gia = 'Ethiopia'
SELECT T1.nhan_hieu FROM ong_kinh_may_anh AS T1 JOIN anh AS T2 ON T1.id = T2.id_ong_kinh_may_anh JOIN nui AS T3 ON T2.id_nui = T3.id WHERE T3.ten IN ('Toubkal Atlas', 'Lasta Massif')
SELECT ten, do_noi FROM nui WHERE id NOT IN (SELECT anh.id_nui FROM anh JOIN ong_kinh_may_anh ON anh.id_ong_kinh_may_anh = ong_kinh_may_anh.id WHERE ong_kinh_may_anh.nhan_hieu = 'Sigma')
SELECT ten FROM ong_kinh_may_anh WHERE ten LIKE '% Kỹ Thuật Số %'
SELECT T1.ten , COUNT ( * ) FROM ong_kinh_may_anh AS T1 JOIN anh AS T2 ON T1.id = T2.id_ong_kinh_may_anh GROUP BY T1.ten ORDER BY COUNT ( * ) DESC
SELECT COUNT(*) FROM ban_nhac
SELECT COUNT(*) FROM ban_nhac
SELECT hang_thu_am FROM album
SELECT hang_thu_am FROM album
SELECT * FROM album WHERE nam = 2012
SELECT tieu_de FROM album WHERE nam = 2012
SELECT buoi_bieu_dien.vi_tri_tren_san_khau FROM buoi_bieu_dien JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten = 'Solveig'
SELECT buoi_bieu_dien.vi_tri_tren_san_khau FROM ban_nhac JOIN buoi_bieu_dien ON ban_nhac.id = buoi_bieu_dien.nghe_si_trong_ban_nhac WHERE ban_nhac.ten = 'Solveig'
SELECT COUNT(*) FROM bai_hat
SELECT COUNT(*) FROM bai_hat
SELECT T1.tieu_de FROM bai_hat AS T1 JOIN buoi_bieu_dien AS T2 ON T1.id_bai_hat = T2.id_bai_hat JOIN ban_nhac AS T3 ON T2.nghe_si_trong_ban_nhac = T3.id WHERE T3.ho = 'Heilo'
SELECT bai_hat.tieu_de FROM ban_nhac JOIN buoi_bieu_dien ON ban_nhac.id = buoi_bieu_dien.nghe_si_trong_ban_nhac JOIN bai_hat ON buoi_bieu_dien.id_bai_hat = bai_hat.id_bai_hat WHERE ban_nhac.ho = 'Hello'
SELECT COUNT(DISTINCT buoi_bieu_dien.nghe_si_trong_ban_nhac) FROM bai_hat JOIN buoi_bieu_dien ON bai_hat.id_bai_hat = buoi_bieu_dien.id_bai_hat WHERE bai_hat.tieu_de = 'Flash'
SELECT COUNT(*) FROM buoi_bieu_dien JOIN bai_hat ON buoi_bieu_dien.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Flash'
SELECT T1.tieu_de FROM bai_hat AS T1 JOIN nhac_cu AS T2 ON T1.id_bai_hat = T2.id_bai_hat JOIN ban_nhac AS T3 ON T2.id_nghe_si_trong_ban_nhac = T3.id WHERE T3.ten = 'Marianne'
SELECT bai_hat.tieu_de FROM bai_hat JOIN nhac_cu ON bai_hat.id_bai_hat = nhac_cu.id_bai_hat JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten = 'Marianne'
SELECT ban_nhac.ten , ban_nhac.ho FROM buoi_bieu_dien JOIN bai_hat ON buoi_bieu_dien.id_bai_hat = bai_hat.id_bai_hat JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id WHERE bai_hat.tieu_de = 'Badlands'
SELECT ban_nhac.ten , ban_nhac.ho FROM bai_hat JOIN buoi_bieu_dien ON bai_hat.id_bai_hat = buoi_bieu_dien.id_bai_hat JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id WHERE bai_hat.tieu_de = 'Badlands'
SELECT T3.ho , T3.ten FROM buoi_bieu_dien AS T1 JOIN bai_hat AS T2 ON T1.id_bai_hat = T2.id_bai_hat JOIN ban_nhac AS T3 ON T1.nghe_si_trong_ban_nhac = T3.id WHERE T2.tieu_de = 'Badlands' AND T1.vi_tri_tren_san_khau = 'hậu trường'
SELECT T1.ten , T1.ho FROM ban_nhac AS T1 JOIN buoi_bieu_dien AS T2 ON T1.id = T2.nghe_si_trong_ban_nhac JOIN bai_hat AS T3 ON T2.id_bai_hat = T3.id_bai_hat WHERE T3.tieu_de = 'Badlands' AND T2.vi_tri_tren_san_khau = 'hậu trường'
SELECT COUNT(DISTINCT hang_thu_am) FROM album
SELECT COUNT(DISTINCT hang_thu_am) FROM album
SELECT hang_thu_am FROM album GROUP BY hang_thu_am ORDER BY COUNT(*) DESC LIMIT 1
SELECT hang_thu_am FROM album GROUP BY hang_thu_am ORDER BY COUNT(*) DESC LIMIT 1
SELECT ban_nhac.ho FROM ban_nhac JOIN nhac_cu ON ban_nhac.id = nhac_cu.id_nghe_si_trong_ban_nhac GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT ho FROM ban_nhac JOIN nhac_cu ON ban_nhac.id = nhac_cu.id_nghe_si_trong_ban_nhac JOIN giong_hat ON ban_nhac.id = giong_hat.nghe_si_trong_ban_nhac GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT ban_nhac.ho FROM ban_nhac JOIN buoi_bieu_dien ON ban_nhac.id = buoi_bieu_dien.nghe_si_trong_ban_nhac WHERE buoi_bieu_dien.vi_tri_tren_san_khau = 'hậu trường' GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT ban_nhac.ho FROM ban_nhac JOIN buoi_bieu_dien ON ban_nhac.id = buoi_bieu_dien.nghe_si_trong_ban_nhac WHERE buoi_bieu_dien.vi_tri_tren_san_khau = 'hậu trường' GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT tieu_de FROM bai_hat WHERE tieu_de LIKE '%the%'
SELECT tieu_de FROM bai_hat WHERE tieu_de LIKE '%the%'
SELECT nhac_cu.nhac_cu FROM nhac_cu
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN buoi_bieu_dien ON nhac_cu.id_bai_hat = buoi_bieu_dien.id_bai_hat
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id JOIN bai_hat ON nhac_cu.id_bai_hat = bai_hat.id_bai_hat WHERE ban_nhac.ho = 'Heilo' AND bai_hat.tieu_de = 'Le Pop'
SELECT T1.nhac_cu FROM nhac_cu AS T1 JOIN ban_nhac AS T2 ON T1.id_nghe_si_trong_ban_nhac = T2.id JOIN bai_hat AS T3 ON T1.id_bai_hat = T3.id_bai_hat WHERE T2.ho = 'Heilo' AND T3.tieu_de = 'Le Pop'
SELECT nhac_cu FROM nhac_cu GROUP BY nhac_cu ORDER BY COUNT(*) DESC LIMIT 1
SELECT nhac_cu FROM nhac_cu GROUP BY nhac_cu ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM bai_hat JOIN nhac_cu ON bai_hat.id_bai_hat = nhac_cu.id_bai_hat WHERE nhac_cu.nhac_cu = 'trống'
SELECT COUNT ( DISTINCT id_bai_hat ) FROM nhac_cu WHERE nhac_cu = 'trống'
SELECT nhac_cu.nhac_cu FROM bai_hat JOIN nhac_cu ON bai_hat.id_bai_hat = nhac_cu.id_bai_hat WHERE bai_hat.tieu_de = 'Le Pop'
SELECT nhac_cu.nhac_cu FROM bai_hat JOIN nhac_cu ON bai_hat.id_bai_hat = nhac_cu.id_bai_hat WHERE bai_hat.tieu_de = 'Le Pop'
SELECT COUNT(*) FROM nhac_cu JOIN bai_hat ON nhac_cu.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Le Pop'
SELECT COUNT(DISTINCT nhac_cu.nhac_cu) FROM bai_hat JOIN nhac_cu ON bai_hat.id_bai_hat = nhac_cu.id_bai_hat WHERE bai_hat.tieu_de = 'Le Pop'
SELECT COUNT(DISTINCT T2.nhac_cu) FROM ban_nhac AS T1 JOIN nhac_cu AS T2 ON T1.id = T2.id_nghe_si_trong_ban_nhac WHERE T1.ho = 'Heilo'
SELECT COUNT(DISTINCT nhac_cu.nhac_cu) FROM ban_nhac JOIN nhac_cu ON ban_nhac.id = nhac_cu.id_nghe_si_trong_ban_nhac WHERE ban_nhac.ho = 'Hello'
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Heilo'
SELECT T2.nhac_cu FROM ban_nhac AS T1 JOIN nhac_cu AS T2 ON T1.id = T2.id_nghe_si_trong_ban_nhac WHERE T1.ho = 'Hello'
SELECT T1.tieu_de FROM bai_hat AS T1 JOIN giong_hat AS T2 ON T1.id_bai_hat = T2.id_bai_hat GROUP BY T1.id_bai_hat ORDER BY COUNT(*) DESC LIMIT 1
SELECT bai_hat.tieu_de FROM bai_hat JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat GROUP BY bai_hat.id_bai_hat ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai FROM giong_hat GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai FROM giong_hat GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT giong_hat.loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Hello'
SELECT giong_hat.loai FROM ban_nhac JOIN giong_hat ON ban_nhac.id = giong_hat.nghe_si_trong_ban_nhac WHERE ban_nhac.ho = 'Hello'
SELECT giong_hat.loai FROM giong_hat JOIN bai_hat ON giong_hat.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Le Pop'
SELECT giong_hat.loai FROM bai_hat JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Le Pop'
SELECT COUNT(DISTINCT loai) FROM giong_hat JOIN bai_hat ON giong_hat.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Demon Kitty Rag'
SELECT COUNT(DISTINCT giong_hat.loai) FROM bai_hat JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Demon Kitty Rag'
SELECT COUNT(*) FROM giong_hat JOIN bai_hat ON giong_hat.id_bai_hat = bai_hat.id_bai_hat WHERE giong_hat.loai = 'chính'
SELECT COUNT(*) FROM bai_hat JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat WHERE giong_hat.loai = 'chính'
SELECT loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id JOIN bai_hat ON giong_hat.id_bai_hat = bai_hat.id_bai_hat WHERE ban_nhac.ten = 'Solveig' AND bai_hat.tieu_de = 'Quán bar ở Amsterdam'
SELECT T1.loai FROM giong_hat AS T1 JOIN bai_hat AS T2 ON T1.id_bai_hat = T2.id_bai_hat JOIN ban_nhac AS T3 ON T1.nghe_si_trong_ban_nhac = T3.id WHERE T2.tieu_de = 'Quán bar ở Amsterdam' AND T3.ten = 'Solveig'
SELECT id_bai_hat, tieu_de FROM bai_hat WHERE id_bai_hat NOT IN (SELECT id_bai_hat FROM giong_hat WHERE loai = 'chính')
SELECT tieu_de FROM bai_hat WHERE NOT EXISTS (SELECT 1 FROM giong_hat WHERE id_bai_hat = bai_hat.id_bai_hat AND loai = 'chính')
SELECT loai FROM giong_hat GROUP BY loai
SELECT DISTINCT loai FROM giong_hat
SELECT id_album, tieu_de, nam, hang_thu_am, loai FROM album WHERE nam = 2010
SELECT id_album, tieu_de, nam, hang_thu_am, loai FROM album WHERE nam = 2010
SELECT T1.ten , T1.ho FROM ban_nhac AS T1 JOIN buoi_bieu_dien AS T2 ON T1.id = T2.nghe_si_trong_ban_nhac JOIN bai_hat AS T3 ON T2.id_bai_hat = T3.id_bai_hat WHERE T3.tieu_de = 'Le Pop'
SELECT ban_nhac.ten , ban_nhac.ho FROM ban_nhac JOIN buoi_bieu_dien ON ban_nhac.id = buoi_bieu_dien.nghe_si_trong_ban_nhac JOIN bai_hat ON buoi_bieu_dien.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Le Pop'
SELECT T1.ho FROM ban_nhac AS T1 JOIN nhac_cu AS T2 ON T1.id = T2.id_nghe_si_trong_ban_nhac GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT ban_nhac.ho FROM ban_nhac JOIN nhac_cu ON ban_nhac.id = nhac_cu.id_nghe_si_trong_ban_nhac GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id JOIN bai_hat ON nhac_cu.id_bai_hat = bai_hat.id_bai_hat WHERE ban_nhac.ho = 'Heilo' AND bai_hat.tieu_de = 'Badlands'
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id JOIN bai_hat ON nhac_cu.id_bai_hat = bai_hat.id_bai_hat WHERE ban_nhac.ho = 'Hello' AND bai_hat.tieu_de = 'Badlands'
SELECT COUNT(*) FROM nhac_cu JOIN bai_hat ON nhac_cu.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Badlands'
SELECT COUNT(DISTINCT nhac_cu.nhac_cu) FROM bai_hat JOIN nhac_cu ON bai_hat.id_bai_hat = nhac_cu.id_bai_hat WHERE bai_hat.tieu_de = 'Badlands'
SELECT giong_hat.loai FROM bai_hat JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Badlands'
SELECT giong_hat.loai FROM bai_hat JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Badlands'
SELECT COUNT(DISTINCT T2.loai) FROM bai_hat AS T1 JOIN giong_hat AS T2 ON T1.id_bai_hat = T2.id_bai_hat WHERE T1.tieu_de = 'Le Pop'
SELECT COUNT(DISTINCT giong_hat.loai) FROM bai_hat JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Le Pop'
SELECT COUNT(*) FROM bai_hat JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat GROUP BY bai_hat.id_bai_hat HAVING COUNT(DISTINCT giong_hat.nghe_si_trong_ban_nhac) >= 2
SELECT COUNT(*) FROM giong_hat GROUP BY id_bai_hat HAVING COUNT(DISTINCT nghe_si_trong_ban_nhac) > 1
SELECT bai_hat.id_bai_hat, bai_hat.tieu_de FROM bai_hat LEFT JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat WHERE giong_hat.loai != 'phụ' AND giong_hat.id_bai_hat IS NULL
SELECT tieu_de FROM bai_hat WHERE id_bai_hat NOT IN (SELECT id_bai_hat FROM giong_hat WHERE loai = 'phu')
SELECT T2.loai FROM ban_nhac AS T1 JOIN giong_hat AS T2 ON T1.id = T2.nghe_si_trong_ban_nhac WHERE T1.ten = 'Solveig' GROUP BY T2.loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT giong_hat.loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten = 'Solveig' GROUP BY giong_hat.loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT giong_hat.loai FROM ban_nhac JOIN giong_hat ON ban_nhac.id = giong_hat.nghe_si_trong_ban_nhac JOIN bai_hat ON giong_hat.id_bai_hat = bai_hat.id_bai_hat WHERE ban_nhac.ho = 'Hello' AND bai_hat.tieu_de = 'Der Kapitan'
SELECT giong_hat.loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id JOIN bai_hat ON giong_hat.id_bai_hat = bai_hat.id_bai_hat WHERE ban_nhac.ho = 'Hello' AND bai_hat.tieu_de = 'Der Kapitan'
SELECT ten , ho FROM ban_nhac JOIN buoi_bieu_dien ON ban_nhac.id = buoi_bieu_dien.nghe_si_trong_ban_nhac GROUP BY ban_nhac.id ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.ten , T1.ho FROM ban_nhac AS T1 JOIN buoi_bieu_dien AS T2 ON T1.id = T2.nghe_si_trong_ban_nhac GROUP BY T1.id ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT giong_hat.loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten = 'Marianne' GROUP BY giong_hat.loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT giong_hat.loai FROM ban_nhac JOIN giong_hat ON ban_nhac.id = giong_hat.nghe_si_trong_ban_nhac WHERE ban_nhac.ten = 'Marianne' GROUP BY giong_hat.loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT ban_nhac.ho, ban_nhac.ten FROM buoi_bieu_dien JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id WHERE buoi_bieu_dien.vi_tri_tren_san_khau = 'hậu trường' AND buoi_bieu_dien.id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Der Kapitan')
SELECT ho, ten FROM ban_nhac JOIN buoi_bieu_dien ON ban_nhac.id = buoi_bieu_dien.nghe_si_trong_ban_nhac JOIN bai_hat ON buoi_bieu_dien.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Der Kapitan'
SELECT bai_hat.tieu_de FROM bai_hat LEFT JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat WHERE giong_hat.loai != 'phụ' OR giong_hat.id_bai_hat IS NULL
SELECT tieu_de FROM bai_hat WHERE id_bai_hat NOT IN (SELECT id_bai_hat FROM giong_hat WHERE loai = 'phu')
SELECT bai_hat.tieu_de FROM album JOIN danh_sach_bai_hat ON album.id_album = danh_sach_bai_hat.id_album JOIN bai_hat ON danh_sach_bai_hat.id_bai_hat = bai_hat.id_bai_hat WHERE album.tieu_de = 'Một nụ hôn trước khi bạn ra đi : Sống ở Hamburg'
SELECT bai_hat.tieu_de FROM bai_hat JOIN danh_sach_bai_hat ON bai_hat.id_bai_hat = danh_sach_bai_hat.id_bai_hat JOIN album ON danh_sach_bai_hat.id_album = album.id_album WHERE album.tieu_de = 'Một nụ hôn trước khi bạn ra đi : Sống ở Hamburg'
SELECT bai_hat.tieu_de FROM album JOIN danh_sach_bai_hat ON album.id_album = danh_sach_bai_hat.id_album JOIN bai_hat ON danh_sach_bai_hat.id_bai_hat = bai_hat.id_bai_hat WHERE album.hang_thu_am = 'Universal Music Group'
SELECT bai_hat.tieu_de FROM album JOIN danh_sach_bai_hat ON album.id_album = danh_sach_bai_hat.id_album JOIN bai_hat ON danh_sach_bai_hat.id_bai_hat = bai_hat.id_bai_hat WHERE album.hang_thu_am = 'Universal Music Group'
SELECT COUNT(*) FROM bai_hat JOIN danh_sach_bai_hat ON bai_hat.id_bai_hat = danh_sach_bai_hat.id_bai_hat JOIN album ON danh_sach_bai_hat.id_album = album.id_album WHERE album.tieu_de = 'phòng thu' GROUP BY bai_hat.id_bai_hat HAVING COUNT(*) = (SELECT COUNT(*) FROM album WHERE tieu_de = 'phòng thu')
SELECT COUNT(*) FROM bai_hat JOIN danh_sach_bai_hat ON bai_hat.id_bai_hat = danh_sach_bai_hat.id_bai_hat JOIN album ON danh_sach_bai_hat.id_album = album.id_album WHERE album.tieu_de = 'phòng thu'
SELECT khach_hang.khach_hang_tot_hay_xau FROM khach_hang JOIN phieu_giam_gia ON khach_hang.id_phieu_giam_gia = phieu_giam_gia.id_phieu_giam_gia WHERE phieu_giam_gia.so_tien_giam_gia = 500
SELECT khach_hang.id_khach_hang , khach_hang.ten , COUNT ( * ) FROM khach_hang JOIN luot_dat_mua ON khach_hang.id_khach_hang = luot_dat_mua.id_khach_hang GROUP BY khach_hang.id_khach_hang
SELECT khach_hang.id_khach_hang , SUM(luot_dat_mua.so_tien_phai_tra) FROM khach_hang JOIN luot_dat_mua ON khach_hang.id_khach_hang = luot_dat_mua.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY SUM(luot_dat_mua.so_tien_phai_tra) DESC LIMIT 1
SELECT T1.id_dat_mua , T1.so_tien_hoan_tra FROM luot_dat_mua AS T1 JOIN thanh_toan AS T2 ON T1.id_dat_mua = T2.id_dat_mua GROUP BY T1.id_dat_mua ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.id_san_pham FROM san_pham_cho_thue AS T1 JOIN san_pham_duoc_dat AS T2 ON T1.id_san_pham = T2.id_san_pham GROUP BY T1.id_san_pham HAVING COUNT(*) = 3
SELECT T1.mo_ta_san_pham FROM san_pham_cho_thue AS T1 JOIN san_pham_duoc_dat AS T2 ON T1.id_san_pham = T2.id_san_pham WHERE T2.so_tien_da_dat = 102.76
SELECT ngay_bat_dau_dat_mua , ngay_ket_thuc_dat_mua FROM luot_dat_mua JOIN san_pham_duoc_dat ON luot_dat_mua.id_dat_mua = san_pham_duoc_dat.id_dat_mua JOIN san_pham_cho_thue ON san_pham_duoc_dat.id_san_pham = san_pham_cho_thue.id_san_pham WHERE san_pham_cho_thue.ten_san_pham = 'Bộ sưu tập sách'
SELECT san_pham_cho_thue.ten_san_pham FROM san_pham_cho_thue JOIN san_pham_co_san ON san_pham_cho_thue.id_san_pham = san_pham_co_san.id_san_pham WHERE san_pham_co_san.co_san_hay_khong = 'có'
SELECT COUNT(DISTINCT ma_loai_san_pham) FROM san_pham_cho_thue
SELECT ten, ho, gioi_tinh FROM khach_hang WHERE khach_hang_tot_hay_xau = 'tốt' ORDER BY ho ASC
SELECT AVG(so_tien_no) FROM thanh_toan
SELECT COUNT(*) FROM san_pham_cho_thue JOIN san_pham_duoc_dat ON san_pham_cho_thue.id_san_pham = san_pham_duoc_dat.id_san_pham GROUP BY san_pham_cho_thue.id_san_pham
SELECT DISTINCT ma_loai_thanh_toan FROM thanh_toan
SELECT chi_phi_thue_hang_ngay FROM san_pham_cho_thue WHERE ten_san_pham LIKE '%Sách%'
SELECT COUNT(*) FROM san_pham_cho_thue WHERE id_san_pham NOT IN (SELECT DISTINCT T2.id_san_pham FROM san_pham_duoc_dat T2 JOIN luot_dat_mua T3 ON T2.id_dat_mua = T3.id_dat_mua WHERE T3.so_tien_phai_tra > 200)
SELECT SUM(phieu_giam_gia.so_tien_giam_gia) FROM phieu_giam_gia JOIN khach_hang ON phieu_giam_gia.id_phieu_giam_gia = khach_hang.id_phieu_giam_gia WHERE khach_hang.khach_hang_tot_hay_xau IN ('tốt', 'xấu')
SELECT thanh_toan.ngay_thanh_toan FROM thanh_toan WHERE (so_tien_da_tra > 300) OR (ma_loai_thanh_toan = 'Giao dịch')
SELECT ten_san_pham , mo_ta_san_pham FROM san_pham_cho_thue WHERE ma_loai_san_pham = 'Dao kéo' AND chi_phi_thue_hang_ngay < 20
SELECT id_nha_hang, ten_nha_hang, dia_chi, danh_gia_xep_hang FROM nha_hang
SELECT dia_chi FROM nha_hang WHERE ten_nha_hang = 'Subway'
SELECT danh_gia_xep_hang FROM nha_hang WHERE ten_nha_hang = 'Subway'
SELECT ten_loai_nha_hang FROM loai_nha_hang
SELECT mo_ta_ve_loai_nha_hang FROM loai_nha_hang WHERE ten_loai_nha_hang = 'Sandwich'
SELECT ten_nha_hang, danh_gia_xep_hang FROM nha_hang ORDER BY danh_gia_xep_hang DESC LIMIT 1
SELECT sinh_vien.tuoi FROM sinh_vien WHERE sinh_vien.ho = 'Smith' AND sinh_vien.ten = 'Linda'
SELECT sinh_vien.gioi_tinh FROM sinh_vien WHERE sinh_vien.ho = 'Smith' AND sinh_vien.ten = 'Linda'
SELECT ho , ten FROM sinh_vien WHERE chuyen_nganh = 600
SELECT ma_thanh_pho FROM sinh_vien WHERE ho = 'Smith' AND ten = 'Linda'
SELECT COUNT(*) FROM sinh_vien WHERE co_van = 1121
SELECT sinh_vien.co_van , COUNT ( * ) FROM sinh_vien GROUP BY sinh_vien.co_van ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT chuyen_nganh , COUNT ( * ) FROM sinh_vien GROUP BY chuyen_nganh ORDER BY COUNT ( * ) ASC LIMIT 1
SELECT sinh_vien.chuyen_nganh , COUNT ( * ) FROM sinh_vien GROUP BY sinh_vien.chuyen_nganh HAVING COUNT ( * ) BETWEEN 2 AND 30
SELECT ho , ten FROM sinh_vien WHERE tuoi > 18 AND chuyen_nganh = 600
SELECT ho , ten FROM sinh_vien WHERE gioi_tinh = 'nữ' AND tuoi > 18 AND chuyen_nganh != 600
SELECT COUNT(*) FROM nha_hang JOIN loai_cua_nha_hang ON nha_hang.id_nha_hang = loai_cua_nha_hang.id_nha_hang JOIN loai_nha_hang ON loai_cua_nha_hang.id_loai_nha_hang = loai_nha_hang.id_loai_nha_hang WHERE loai_nha_hang.ten_loai_nha_hang = 'Sandwich'
SELECT SUM(luot_ghe_tham_nha_hang.thoi_gian_danh_ra) FROM sinh_vien JOIN luot_ghe_tham_nha_hang ON sinh_vien.id_sinh_vien = luot_ghe_tham_nha_hang.id_sinh_vien WHERE sinh_vien.ho = 'Smith' AND sinh_vien.ten = 'Linda'
SELECT COUNT(*) FROM sinh_vien JOIN luot_ghe_tham_nha_hang ON sinh_vien.id_sinh_vien = luot_ghe_tham_nha_hang.id_sinh_vien JOIN nha_hang ON luot_ghe_tham_nha_hang.id_nha_hang = nha_hang.id_nha_hang WHERE sinh_vien.ho = 'Smith' AND sinh_vien.ten = 'Linda' AND nha_hang.ten_nha_hang = 'Subway'
SELECT luot_ghe_tham_nha_hang.thoi_gian FROM sinh_vien JOIN luot_ghe_tham_nha_hang ON sinh_vien.id_sinh_vien = luot_ghe_tham_nha_hang.id_sinh_vien JOIN nha_hang ON luot_ghe_tham_nha_hang.id_nha_hang = nha_hang.id_nha_hang WHERE sinh_vien.ho = 'Linda' AND sinh_vien.ten = 'Smith' AND nha_hang.ten_nha_hang = 'Subway'
SELECT nha_hang.ten_nha_hang, SUM(luot_ghe_tham_nha_hang.thoi_gian_danh_ra) FROM luot_ghe_tham_nha_hang JOIN nha_hang ON luot_ghe_tham_nha_hang.id_nha_hang = nha_hang.id_nha_hang GROUP BY luot_ghe_tham_nha_hang.id_nha_hang ORDER BY SUM(luot_ghe_tham_nha_hang.thoi_gian_danh_ra) ASC LIMIT 1
SELECT sinh_vien.ho , sinh_vien.ten FROM sinh_vien JOIN luot_ghe_tham_nha_hang ON sinh_vien.id_sinh_vien = luot_ghe_tham_nha_hang.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT COUNT(DISTINCT ho) FROM dien_vien
SELECT COUNT(DISTINCT ho) FROM dien_vien
SELECT ten FROM dien_vien GROUP BY ten ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM dien_vien GROUP BY ten ORDER BY COUNT(*) DESC LIMIT 1
SELECT ho , ten FROM dien_vien GROUP BY ho , ten ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT ho , ten FROM dien_vien GROUP BY ho , ten ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT quan FROM dia_chi GROUP BY quan HAVING COUNT(*) >= 2
SELECT quan FROM dia_chi GROUP BY quan HAVING COUNT(*) >= 2
SELECT so_dien_thoai, ma_buu_dien FROM dia_chi WHERE dia_chi = '1031 Daugavpils Parkway'
SELECT dia_chi.so_dien_thoai, dia_chi.ma_buu_dien FROM dia_chi WHERE dia_chi.dia_chi = '1031 Daugavpils Parkway'
SELECT thanh_pho.thanh_pho, COUNT(*) , thanh_pho.id_thanh_pho FROM thanh_pho JOIN dia_chi ON thanh_pho.id_thanh_pho = dia_chi.id_thanh_pho GROUP BY thanh_pho.id_thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT thanh_pho.id_thanh_pho , thanh_pho.thanh_pho FROM thanh_pho JOIN dia_chi ON thanh_pho.id_thanh_pho = dia_chi.id_thanh_pho GROUP BY thanh_pho.id_thanh_pho ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT COUNT(*) FROM dia_chi WHERE quan = 'California'
SELECT COUNT ( * ) FROM dia_chi JOIN thanh_pho ON dia_chi.id_thanh_pho = thanh_pho.id_thanh_pho WHERE thanh_pho.thanh_pho = 'California'
SELECT phim.id_phim, phim.tieu_de FROM phim JOIN hang_ton_kho ON phim.id_phim = hang_ton_kho.id_phim WHERE phim.gia_cho_thue = 0.99 GROUP BY phim.id_phim, phim.tieu_de HAVING COUNT(hang_ton_kho.id_hang_ton_kho) < 3
SELECT phim.id_phim , phim.tieu_de FROM phim JOIN hang_ton_kho ON phim.id_phim = hang_ton_kho.id_phim WHERE phim.gia_cho_thue = 0.99 GROUP BY phim.id_phim HAVING COUNT ( * ) < 3
SELECT COUNT(*) FROM thanh_pho JOIN quoc_gia ON thanh_pho.id_quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.quoc_gia = 'Úc'
SELECT COUNT(*) FROM thanh_pho JOIN quoc_gia ON thanh_pho.id_quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.quoc_gia = 'Australia'
SELECT quoc_gia.quoc_gia FROM quoc_gia JOIN thanh_pho ON quoc_gia.id_quoc_gia = thanh_pho.id_quoc_gia GROUP BY quoc_gia.id_quoc_gia HAVING COUNT(thanh_pho.id_thanh_pho) >= 3
SELECT quoc_gia.quoc_gia FROM quoc_gia JOIN thanh_pho ON quoc_gia.id_quoc_gia = thanh_pho.id_quoc_gia GROUP BY quoc_gia.id_quoc_gia HAVING COUNT(thanh_pho.id_thanh_pho) >= 3
SELECT khoan_thanh_toan.ngay_thanh_toan FROM khoan_thanh_toan JOIN nhan_vien ON khoan_thanh_toan.id_nhan_vien = nhan_vien.id_nhan_vien WHERE khoan_thanh_toan.so_tien > 10 AND nhan_vien.ten = 'Elsa'
SELECT ngay_thanh_toan FROM khoan_thanh_toan JOIN nhan_vien ON khoan_thanh_toan.id_nhan_vien = nhan_vien.id_nhan_vien WHERE (so_tien > 10 OR nhan_vien.ten = 'Elsa')
SELECT COUNT(*) FROM khach_hang WHERE co_hoat_dong_khong = 1
SELECT COUNT(*) FROM khach_hang WHERE co_hoat_dong_khong = 1
SELECT tieu_de, gia_cho_thue FROM phim ORDER BY gia_cho_thue DESC LIMIT 1
SELECT phim.tieu_de, phim.gia_cho_thue FROM phim ORDER BY phim.gia_cho_thue DESC LIMIT 1
SELECT phim.id_phim, phim.tieu_de, phim.mo_ta FROM phim JOIN dien_vien_dien_anh ON phim.id_phim = dien_vien_dien_anh.id_phim GROUP BY phim.id_phim ORDER BY COUNT(*) DESC LIMIT 1
SELECT phim.id_phim, phim.tieu_de, phim.mo_ta FROM phim JOIN dien_vien_dien_anh ON phim.id_phim = dien_vien_dien_anh.id_phim GROUP BY phim.id_phim ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten , ho FROM dien_vien JOIN dien_vien_dien_anh ON dien_vien.id_dien_vien = dien_vien_dien_anh.id_dien_vien GROUP BY dien_vien.id_dien_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT dien_vien.id_dien_vien , dien_vien.ten , dien_vien.ho FROM dien_vien JOIN dien_vien_dien_anh ON dien_vien.id_dien_vien = dien_vien_dien_anh.id_dien_vien GROUP BY dien_vien.id_dien_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.ten , T1.ho FROM dien_vien AS T1 JOIN dien_vien_dien_anh AS T2 ON T1.id_dien_vien = T2.id_dien_vien GROUP BY T1.id_dien_vien HAVING COUNT ( * ) > 30
SELECT T1.ho , T1.ten FROM dien_vien AS T1 JOIN dien_vien_dien_anh AS T2 ON T1.id_dien_vien = T2.id_dien_vien GROUP BY T1.id_dien_vien HAVING COUNT ( * ) > 30
SELECT cua_hang.id_cua_hang, cua_hang.id_nhan_vien_quan_ly, cua_hang.id_dia_chi FROM cua_hang JOIN hang_ton_kho ON cua_hang.id_cua_hang = hang_ton_kho.id_cua_hang GROUP BY cua_hang.id_cua_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT cua_hang.id_cua_hang FROM cua_hang JOIN hang_ton_kho ON cua_hang.id_cua_hang = hang_ton_kho.id_cua_hang GROUP BY cua_hang.id_cua_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT SUM(so_tien) FROM khoan_thanh_toan
SELECT SUM(khoan_thanh_toan.so_tien) FROM khoan_thanh_toan
SELECT khach_hang.id_khach_hang, khach_hang.ho, khach_hang.ten FROM khach_hang JOIN khoan_thanh_toan ON khach_hang.id_khach_hang = khoan_thanh_toan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY SUM(khoan_thanh_toan.so_tien) ASC LIMIT 1
SELECT khach_hang.id_khach_hang , khach_hang.ho , khach_hang.ten FROM khach_hang JOIN khoan_thanh_toan ON khach_hang.id_khach_hang = khoan_thanh_toan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY SUM(khoan_thanh_toan.so_tien) ASC LIMIT 1
SELECT danh_muc.ten FROM phim JOIN danh_muc_phim ON phim.id_phim = danh_muc_phim.id_phim JOIN danh_muc ON danh_muc_phim.id_danh_muc = danh_muc.id_danh_muc WHERE phim.tieu_de = 'HUNGER ROOF'
SELECT danh_muc.ten FROM phim JOIN danh_muc_phim ON phim.id_phim = danh_muc_phim.id_phim JOIN danh_muc ON danh_muc_phim.id_danh_muc = danh_muc.id_danh_muc WHERE phim.tieu_de = 'HUNGER ROOF'
SELECT danh_muc.ten, danh_muc.id_danh_muc, COUNT(*) FROM danh_muc JOIN danh_muc_phim ON danh_muc.id_danh_muc = danh_muc_phim.id_danh_muc GROUP BY danh_muc.id_danh_muc
SELECT T1.id_danh_muc, T1.ten, COUNT(*) FROM danh_muc AS T1 JOIN danh_muc_phim AS T2 ON T1.id_danh_muc = T2.id_danh_muc GROUP BY T1.id_danh_muc, T1.ten
SELECT phim.id_phim , phim.tieu_de FROM phim JOIN hang_ton_kho ON phim.id_phim = hang_ton_kho.id_phim GROUP BY phim.id_phim ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT phim.id_phim , phim.tieu_de FROM phim JOIN hang_ton_kho ON phim.id_phim = hang_ton_kho.id_phim GROUP BY phim.id_phim ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT phim.id_phim , phim.tieu_de FROM luot_cho_thue JOIN hang_ton_kho ON luot_cho_thue.id_hang_ton_kho = hang_ton_kho.id_hang_ton_kho JOIN phim ON hang_ton_kho.id_phim = phim.id_phim GROUP BY phim.id_phim , phim.tieu_de ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT phim.tieu_de, hang_ton_kho.id_hang_ton_kho FROM luot_cho_thue JOIN hang_ton_kho ON luot_cho_thue.id_hang_ton_kho = hang_ton_kho.id_hang_ton_kho JOIN phim ON hang_ton_kho.id_phim = phim.id_phim GROUP BY hang_ton_kho.id_hang_ton_kho, phim.tieu_de ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT id_ngon_ngu) FROM phim
SELECT COUNT(DISTINCT id_ngon_ngu) FROM phim
SELECT phim.tieu_de FROM phim WHERE phim.danh_gia_xep_hang = 'R'
SELECT phim.tieu_de FROM phim WHERE phim.danh_gia_xep_hang = 'R'
SELECT dia_chi.dia_chi, dia_chi.quan, dia_chi.ma_buu_dien, dia_chi.so_dien_thoai FROM cua_hang JOIN dia_chi ON cua_hang.id_dia_chi = dia_chi.id_dia_chi WHERE cua_hang.id_cua_hang = 1
SELECT dia_chi.dia_chi FROM cua_hang JOIN dia_chi ON cua_hang.id_dia_chi = dia_chi.id_dia_chi WHERE cua_hang.id_cua_hang = 1
SELECT nhan_vien.id_nhan_vien , nhan_vien.ho , nhan_vien.ten FROM nhan_vien JOIN khoan_thanh_toan ON nhan_vien.id_nhan_vien = khoan_thanh_toan.id_nhan_vien GROUP BY nhan_vien.id_nhan_vien ORDER BY COUNT ( * ) ASC LIMIT 1
SELECT T1.id_nhan_vien , T1.ten , T1.ho FROM nhan_vien AS T1 JOIN khoan_thanh_toan AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien GROUP BY T1.id_nhan_vien ORDER BY COUNT ( * ) ASC LIMIT 1
SELECT ten FROM phim JOIN ngon_ngu ON phim.id_ngon_ngu = ngon_ngu.id_ngon_ngu WHERE phim.tieu_de = 'AIRPORT POLLOCK'
SELECT ngon_ngu.ten FROM phim JOIN ngon_ngu ON phim.id_ngon_ngu = ngon_ngu.id_ngon_ngu WHERE phim.tieu_de = 'AIRPORT POLLOCK'
SELECT COUNT(*) FROM cua_hang
SELECT COUNT(*) FROM cua_hang
SELECT COUNT(*) FROM phim
SELECT COUNT ( DISTINCT danh_gia_xep_hang ) FROM phim
SELECT phim.tieu_de FROM phim WHERE phim.tinh_nang_dac_biet LIKE '%Cảnh đã xoá%'
SELECT phim.tieu_de FROM phim WHERE phim.tinh_nang_dac_biet LIKE '%Cảnh đã xoá%'
SELECT COUNT(*) FROM hang_ton_kho WHERE id_cua_hang = 1
SELECT COUNT ( * ) FROM hang_ton_kho WHERE id_cua_hang = 1
SELECT MIN(ngay_thanh_toan) FROM khoan_thanh_toan
SELECT ngay_thanh_toan FROM khoan_thanh_toan ORDER BY ngay_thanh_toan ASC LIMIT 1
SELECT khach_hang.email, dia_chi.dia_chi, dia_chi.dia_chi_2, dia_chi.quan FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi = dia_chi.id_dia_chi WHERE khach_hang.ten = 'Linda'
SELECT dia_chi.dia_chi, khach_hang.email FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi = dia_chi.id_dia_chi WHERE khach_hang.ten = 'Linda'
SELECT phim.tieu_de FROM phim WHERE (phim.thoi_luong_phim > 100 OR phim.danh_gia_xep_hang = 'PG') AND phim.gia_thay_the <= 200
SELECT phim.tieu_de FROM phim WHERE (phim.thoi_luong_phim > 100 OR phim.danh_gia_xep_hang = 'PG') AND phim.gia_thay_the <= 200
SELECT khach_hang.ho , khach_hang.ten FROM khach_hang JOIN luot_cho_thue ON khach_hang.id_khach_hang = luot_cho_thue.id_khach_hang ORDER BY luot_cho_thue.ngay_cho_thue ASC LIMIT 1
SELECT ho , ten FROM khach_hang JOIN luot_cho_thue ON khach_hang.id_khach_hang = luot_cho_thue.id_khach_hang ORDER BY luot_cho_thue.ngay_cho_thue ASC LIMIT 1
SELECT T1.ho , T1.ten FROM nhan_vien AS T1 JOIN luot_cho_thue AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien JOIN khach_hang AS T3 ON T2.id_khach_hang = T3.id_khach_hang WHERE T3.ten = 'April' AND T3.ho = 'Burns'
SELECT nhan_vien.ho, nhan_vien.ten FROM luot_cho_thue JOIN nhan_vien ON luot_cho_thue.id_nhan_vien = nhan_vien.id_nhan_vien WHERE luot_cho_thue.id_khach_hang = (SELECT id_khach_hang FROM khach_hang WHERE ten = 'April' AND ho = 'Burns')
SELECT cua_hang.id_cua_hang FROM khach_hang JOIN cua_hang ON khach_hang.id_cua_hang = cua_hang.id_cua_hang GROUP BY cua_hang.id_cua_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT cua_hang.id_cua_hang FROM khach_hang JOIN cua_hang ON khach_hang.id_cua_hang = cua_hang.id_cua_hang GROUP BY cua_hang.id_cua_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT so_tien FROM khoan_thanh_toan ORDER BY so_tien DESC LIMIT 1
SELECT MAX(so_tien) FROM khoan_thanh_toan ORDER BY so_tien DESC LIMIT 1
SELECT dia_chi.dia_chi, dia_chi.dia_chi_2, dia_chi.quan, dia_chi.id_thanh_pho, dia_chi.ma_buu_dien, dia_chi.so_dien_thoai FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi = dia_chi.id_dia_chi WHERE nhan_vien.ten = 'Elsa'
SELECT dia_chi.dia_chi FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi = dia_chi.id_dia_chi WHERE nhan_vien.ten = 'Elsa'
SELECT ten , ho FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM luot_cho_thue WHERE ngay_cho_thue > '2005-08-23 02:06:01')
SELECT ten FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM luot_cho_thue WHERE ngay_cho_thue > '2005-08-23 02:06:01')
SELECT COUNT(*) FROM tai_xe
SELECT ten , thanh_pho_que_huong , tuoi FROM tai_xe
SELECT tai_xe.dang , COUNT ( * ) FROM tai_xe GROUP BY tai_xe.dang
SELECT ten FROM tai_xe ORDER BY tuoi DESC
SELECT DISTINCT thanh_pho_que_huong FROM tai_xe
SELECT thanh_pho_que_huong FROM tai_xe GROUP BY thanh_pho_que_huong ORDER BY COUNT(*) DESC LIMIT 1
SELECT tai_xe.dang FROM tai_xe WHERE tai_xe.thanh_pho_que_huong = 'Hartford' AND tai_xe.tuoi > 40
SELECT thanh_pho_que_huong FROM tai_xe WHERE tuoi > 40 GROUP BY thanh_pho_que_huong HAVING COUNT(*) >= 2
SELECT thanh_pho_que_huong FROM tai_xe WHERE thanh_pho_que_huong NOT IN (SELECT thanh_pho_que_huong FROM tai_xe WHERE tuoi > 40)
SELECT ten FROM tai_xe WHERE id_tai_xe NOT IN (SELECT id_tai_xe FROM xe_buyt_cua_truong_hoc)
SELECT loai_hinh FROM truong_hoc GROUP BY loai_hinh HAVING COUNT(*) = 2
SELECT truong_hoc.truong_hoc , tai_xe.ten FROM truong_hoc JOIN xe_buyt_cua_truong_hoc ON truong_hoc.id_truong_hoc = xe_buyt_cua_truong_hoc.id_truong_hoc JOIN tai_xe ON xe_buyt_cua_truong_hoc.id_tai_xe = tai_xe.id_tai_xe
SELECT AVG(xe_buyt_cua_truong_hoc.so_nam_lam_viec), MAX(xe_buyt_cua_truong_hoc.so_nam_lam_viec), MIN(xe_buyt_cua_truong_hoc.so_nam_lam_viec) FROM xe_buyt_cua_truong_hoc
SELECT truong_hoc.truong_hoc , truong_hoc.loai_hinh FROM truong_hoc WHERE truong_hoc.id_truong_hoc NOT IN (SELECT xe_buyt_cua_truong_hoc.id_truong_hoc FROM xe_buyt_cua_truong_hoc)
SELECT truong_hoc.loai_hinh , COUNT ( * ) FROM truong_hoc JOIN xe_buyt_cua_truong_hoc ON truong_hoc.id_truong_hoc = xe_buyt_cua_truong_hoc.id_truong_hoc GROUP BY truong_hoc.loai_hinh
SELECT COUNT(*) FROM tai_xe WHERE thanh_pho_que_huong = 'Hartford' OR tuoi < 40
SELECT ten FROM tai_xe WHERE thanh_pho_que_huong = 'Hartford' AND tuoi < 40
SELECT tai_xe.ten FROM tai_xe JOIN xe_buyt_cua_truong_hoc ON tai_xe.id_tai_xe = xe_buyt_cua_truong_hoc.id_tai_xe GROUP BY tai_xe.id_tai_xe ORDER BY MAX(xe_buyt_cua_truong_hoc.so_nam_lam_viec) DESC LIMIT 1
SELECT COUNT(*) FROM truong_hoc
SELECT COUNT(*) FROM truong_hoc
SELECT dia_diem FROM truong_hoc ORDER BY so_luong_nhap_hoc ASC
SELECT truong_hoc.dia_diem , truong_hoc.so_luong_nhap_hoc FROM truong_hoc ORDER BY truong_hoc.so_luong_nhap_hoc ASC
SELECT dia_diem FROM truong_hoc ORDER BY nam_thanh_lap DESC
SELECT dia_diem FROM truong_hoc ORDER BY nam_thanh_lap DESC
SELECT truong_hoc.so_luong_nhap_hoc FROM truong_hoc WHERE truong_hoc.ton_giao != 'Công giáo'
SELECT truong_hoc.so_luong_nhap_hoc FROM truong_hoc WHERE truong_hoc.ton_giao != 'Công giáo'
SELECT AVG(truong_hoc.so_luong_nhap_hoc) FROM truong_hoc
SELECT AVG(truong_hoc.so_luong_nhap_hoc) FROM truong_hoc
SELECT doi FROM cau_thu ORDER BY doi ASC
SELECT doi FROM cau_thu ORDER BY doi ASC
SELECT COUNT(DISTINCT vi_tri) FROM cau_thu
SELECT COUNT(DISTINCT vi_tri) FROM cau_thu
SELECT cau_thu.doi FROM cau_thu ORDER BY cau_thu.tuoi DESC LIMIT 1
SELECT doi FROM cau_thu ORDER BY tuoi DESC LIMIT 1
SELECT cau_thu.doi FROM cau_thu ORDER BY cau_thu.tuoi DESC LIMIT 5
SELECT cau_thu.cau_thu , cau_thu.doi FROM cau_thu ORDER BY cau_thu.tuoi DESC LIMIT 5
SELECT cau_thu.doi , truong_hoc.dia_diem FROM cau_thu JOIN truong_hoc ON cau_thu.id_truong = truong_hoc.id_truong
SELECT cau_thu.doi, truong_hoc.dia_diem FROM cau_thu JOIN truong_hoc ON cau_thu.id_truong = truong_hoc.id_truong
SELECT truong_hoc.dia_diem FROM truong_hoc JOIN cau_thu ON truong_hoc.id_truong = cau_thu.id_truong GROUP BY truong_hoc.id_truong HAVING COUNT(*) > 1
SELECT truong_hoc.dia_diem FROM truong_hoc JOIN cau_thu ON truong_hoc.id_truong = cau_thu.id_truong GROUP BY truong_hoc.id_truong HAVING COUNT(*) > 1
SELECT truong_hoc.ton_giao FROM truong_hoc JOIN cau_thu ON truong_hoc.id_truong = cau_thu.id_truong GROUP BY truong_hoc.id_truong ORDER BY COUNT(*) DESC LIMIT 1
SELECT truong_hoc.ton_giao FROM cau_thu JOIN truong_hoc ON cau_thu.id_truong = truong_hoc.id_truong GROUP BY truong_hoc.id_truong ORDER BY COUNT(*) DESC LIMIT 1
SELECT truong_hoc.dia_diem, chi_tiet_truong_hoc.biet_danh FROM truong_hoc JOIN chi_tiet_truong_hoc ON truong_hoc.id_truong = chi_tiet_truong_hoc.id_truong
SELECT chi_tiet_truong_hoc.biet_danh , truong_hoc.dia_diem FROM truong_hoc JOIN chi_tiet_truong_hoc ON truong_hoc.id_truong = chi_tiet_truong_hoc.id_truong
SELECT ton_giao , COUNT ( * ) FROM truong_hoc GROUP BY ton_giao
SELECT truong_hoc.ton_giao , COUNT ( * ) FROM truong_hoc GROUP BY truong_hoc.ton_giao
SELECT ton_giao , COUNT ( * ) FROM truong_hoc GROUP BY ton_giao ORDER BY COUNT ( * ) DESC
SELECT truong_hoc.ton_giao , COUNT ( * ) FROM truong_hoc GROUP BY truong_hoc.ton_giao ORDER BY COUNT ( * ) DESC
SELECT truong_hoc.mau_cua_truong FROM truong_hoc ORDER BY truong_hoc.so_luong_nhap_hoc DESC LIMIT 1
SELECT truong_hoc.truong_hoc , truong_hoc.mau_cua_truong FROM truong_hoc ORDER BY truong_hoc.so_luong_nhap_hoc DESC LIMIT 1
SELECT truong_hoc.dia_diem FROM truong_hoc WHERE truong_hoc.id_truong NOT IN (SELECT cau_thu.id_truong FROM cau_thu)
SELECT truong_hoc.dia_diem FROM truong_hoc WHERE truong_hoc.id_truong NOT IN (SELECT cau_thu.id_truong FROM cau_thu)
SELECT ton_giao FROM truong_hoc WHERE nam_thanh_lap < 1890 INTERSECT SELECT ton_giao FROM truong_hoc WHERE nam_thanh_lap > 1900
SELECT ton_giao FROM truong_hoc WHERE nam_thanh_lap < 1890 INTERSECT SELECT ton_giao FROM truong_hoc WHERE nam_thanh_lap > 1900
SELECT chi_tiet_truong_hoc.biet_danh FROM truong_hoc JOIN chi_tiet_truong_hoc ON truong_hoc.id_truong = chi_tiet_truong_hoc.id_truong WHERE chi_tiet_truong_hoc.phan_hang != '1'
SELECT chi_tiet_truong_hoc.biet_danh FROM truong_hoc JOIN chi_tiet_truong_hoc ON truong_hoc.id_truong = chi_tiet_truong_hoc.id_truong WHERE truong_hoc.mam_hay_nu != 'nam' AND truong_hoc.trong_ngay_hay_noi_tru != 'noi_tru'
SELECT ton_giao FROM truong_hoc GROUP BY ton_giao HAVING COUNT(*) > 1
SELECT truong_hoc.ton_giao FROM truong_hoc GROUP BY truong_hoc.ton_giao HAVING COUNT(*) > 1
SELECT ten FROM quoc_gia UNION SELECT ten FROM giai_dau
SELECT COUNT(*) FROM giai_dau JOIN quoc_gia ON giai_dau.id_quoc_gia = quoc_gia.id WHERE quoc_gia.ten = 'England'
SELECT AVG(cau_thu.can_nang) FROM cau_thu
SELECT ten_cau_thu FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api AND cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa WHERE danh_gia_tong_the > (SELECT AVG(danh_gia_tong_the) FROM dac_diem_cua_cau_thu)
SELECT ten_cau_thu FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api AND cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa ORDER BY dac_diem_cua_cau_thu.re_bong DESC LIMIT 1
SELECT cau_thu.ten_cau_thu FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api AND cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa WHERE dac_diem_cua_cau_thu.tat_bong > 90 AND cau_thu.chan_thuan = 'phải'
SELECT cau_thu.ten_cau_thu FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api AND cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa WHERE dac_diem_cua_cau_thu.chan_thuan = 'trái' AND dac_diem_cua_cau_thu.danh_gia_tong_the BETWEEN 85 AND 90
SELECT AVG(dac_diem_cua_cau_thu.danh_gia_tong_the) FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api AND cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa WHERE dac_diem_cua_cau_thu.chan_thuan IN ('phai','trai') GROUP BY dac_diem_cua_cau_thu.chan_thuan
SELECT COUNT(*) FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api AND cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa WHERE dac_diem_cua_cau_thu.danh_gia_tong_the > 80 GROUP BY dac_diem_cua_cau_thu.chan_thuan
SELECT cau_thu.id FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api AND cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa WHERE cau_thu.chieu_cao >= 180 AND dac_diem_cua_cau_thu.danh_gia_tong_the > 85
SELECT id FROM cau_thu WHERE chan_thuan = 'trái' AND chieu_cao BETWEEN 180 AND 190
SELECT cau_thu.ten_cau_thu , dac_diem_cua_cau_thu.danh_gia_tong_the FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api AND cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa ORDER BY dac_diem_cua_cau_thu.danh_gia_tong_the DESC LIMIT 3
SELECT cau_thu.ten_cau_thu, cau_thu.ngay_sinh FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api AND cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa ORDER BY dac_diem_cua_cau_thu.tiem_nang DESC LIMIT 5
SELECT ten_quan, dien_tich_cua_cac_thanh_pho FROM quan ORDER BY dien_tich_cua_cac_thanh_pho DESC
SELECT ten_quan FROM quan ORDER BY dien_tich_cua_cac_thanh_pho DESC
SELECT san_pham.kich_thuoc_trang_toi_da FROM san_pham GROUP BY san_pham.kich_thuoc_trang_toi_da HAVING COUNT(*) > 3
SELECT san_pham.kich_thuoc_trang_toi_da FROM san_pham GROUP BY san_pham.kich_thuoc_trang_toi_da HAVING COUNT(*) > 3
SELECT ten_quan, dan_so_thanh_pho FROM quan WHERE dan_so_thanh_pho BETWEEN 200000 AND 20000000
SELECT ten_quan , dan_so_thanh_pho FROM quan WHERE dan_so_thanh_pho BETWEEN 200000 AND 2000000
SELECT ten_quan FROM quan WHERE dien_tich_cua_cac_thanh_pho > 10 OR dan_so_thanh_pho > 100000
SELECT ten_quan FROM quan WHERE dien_tich_cua_cac_thanh_pho > 10 OR dan_so_thanh_pho > 100000
SELECT ten_quan FROM quan ORDER BY dan_so_thanh_pho DESC LIMIT 1
SELECT ten_quan FROM quan ORDER BY dan_so_thanh_pho DESC LIMIT 1
SELECT ten_quan FROM quan ORDER BY dien_tich_cua_cac_thanh_pho ASC LIMIT 1
SELECT ten_quan FROM quan ORDER BY dien_tich ASC LIMIT 1
SELECT SUM(dan_so_thanh_pho) FROM quan ORDER BY dien_tich_cua_cac_thanh_pho DESC LIMIT 3
SELECT SUM(dan_so_thanh_pho) FROM quan ORDER BY dien_tich_cua_cac_thanh_pho DESC LIMIT 3
SELECT loai , COUNT ( * ) FROM cua_hang GROUP BY loai
SELECT loai , COUNT ( * ) FROM cua_hang GROUP BY loai
SELECT T1.ten_cua_hang FROM cua_hang AS T1 JOIN quan_cua_cua_hang AS T2 ON T1.id_cua_hang = T2.id_cua_hang JOIN quan AS T3 ON T2.id_quan = T3.id_quan WHERE T3.ten_quan = 'Khanewal'
SELECT T1.ten_cua_hang FROM cua_hang AS T1 JOIN quan_cua_cua_hang AS T2 ON T1.id_cua_hang = T2.id_cua_hang JOIN quan AS T3 ON T2.id_quan = T3.id_quan WHERE T3.ten_quan = 'Khanewal'
SELECT cua_hang.ten_cua_hang FROM cua_hang JOIN quan_cua_cua_hang ON cua_hang.id_cua_hang = quan_cua_cua_hang.id_cua_hang JOIN quan ON quan_cua_cua_hang.id_quan = quan.id_quan WHERE quan.dan_so_thanh_pho = (SELECT MAX(dan_so_thanh_pho) FROM quan)
SELECT cua_hang.ten_cua_hang FROM quan JOIN quan_cua_cua_hang ON quan.id_quan = quan_cua_cua_hang.id_quan JOIN cua_hang ON quan_cua_cua_hang.id_cua_hang = cua_hang.id_cua_hang ORDER BY quan.dan_so_thanh_pho DESC LIMIT 1
SELECT quan.thanh_pho_cua_cac_tru_so FROM cua_hang JOIN quan_cua_cua_hang ON cua_hang.id_cua_hang = quan_cua_cua_hang.id_cua_hang JOIN quan ON quan_cua_cua_hang.id_quan = quan.id_quan WHERE cua_hang.ten_cua_hang = 'Blackville'
SELECT T3.thanh_pho_cua_cac_tru_so FROM cua_hang AS T1 JOIN quan_cua_cua_hang AS T2 ON T1.id_cua_hang = T2.id_cua_hang JOIN quan AS T3 ON T2.id_quan = T3.id_quan WHERE T1.ten_cua_hang = 'Blackville'
SELECT quan.thanh_pho_cua_cac_tru_so , COUNT ( * ) FROM cua_hang JOIN quan_cua_cua_hang ON cua_hang.id_cua_hang = quan_cua_cua_hang.id_cua_hang JOIN quan ON quan_cua_cua_hang.id_quan = quan.id_quan GROUP BY quan.thanh_pho_cua_cac_tru_so
SELECT T3.thanh_pho_cua_cac_tru_so , COUNT ( * ) FROM cua_hang AS T1 JOIN quan_cua_cua_hang AS T2 ON T1.id_cua_hang = T2.id_cua_hang JOIN quan AS T3 ON T2.id_quan = T3.id_quan GROUP BY T3.thanh_pho_cua_cac_tru_so
SELECT quan.thanh_pho_cua_cac_tru_so FROM cua_hang JOIN quan_cua_cua_hang ON cua_hang.id_cua_hang = quan_cua_cua_hang.id_cua_hang JOIN quan ON quan_cua_cua_hang.id_quan = quan.id_quan GROUP BY quan.thanh_pho_cua_cac_tru_so ORDER BY COUNT(*) DESC LIMIT 1
SELECT quan.thanh_pho_cua_cac_tru_so FROM quan JOIN quan_cua_cua_hang ON quan.id_quan = quan_cua_cua_hang.id_quan JOIN cua_hang ON quan_cua_cua_hang.id_cua_hang = cua_hang.id_cua_hang GROUP BY quan.thanh_pho_cua_cac_tru_so ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(so_trang_mau_tren_tung_phut) FROM san_pham
SELECT AVG(so_trang_mau_tren_tung_phut) FROM san_pham
SELECT T1.san_pham FROM san_pham AS T1 JOIN san_pham_cua_cua_hang AS T2 ON T1.id_san_pham = T2.id_san_pham JOIN cua_hang AS T3 ON T2.id_cua_hang = T3.id_cua_hang WHERE T3.ten_cua_hang = 'Miramichi'
SELECT T1.san_pham FROM san_pham AS T1 JOIN san_pham_cua_cua_hang AS T2 ON T1.id_san_pham = T2.id_san_pham JOIN cua_hang AS T3 ON T2.id_cua_hang = T3.id_cua_hang WHERE T3.ten_cua_hang = 'Miramichi'
SELECT san_pham.san_pham FROM san_pham WHERE san_pham.kich_thuoc_trang_toi_da = 'A 4' AND san_pham.so_trang_mau_tren_tung_phut < 5
SELECT san_pham.san_pham FROM san_pham WHERE san_pham.kich_thuoc_trang_toi_da = 'A 4' AND san_pham.so_trang_mau_tren_tung_phut < 5
SELECT san_pham FROM san_pham WHERE (kich_thuoc_trang_toi_da = 'A 4') OR (so_trang_mau_tren_tung_phut < 5)
SELECT san_pham FROM san_pham WHERE (kich_thuoc_trang_toi_da = 'A 4') OR (so_trang_mau_tren_tung_phut < 5)
SELECT san_pham.san_pham FROM san_pham WHERE san_pham.san_pham LIKE '%Máy quét%'
SELECT san_pham.san_pham FROM san_pham WHERE san_pham.san_pham LIKE '% Máy quét %'
SELECT san_pham.kich_thuoc_trang_toi_da FROM san_pham GROUP BY san_pham.kich_thuoc_trang_toi_da ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_pham.kich_thuoc_trang_toi_da FROM san_pham GROUP BY san_pham.kich_thuoc_trang_toi_da ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_pham FROM san_pham WHERE kich_thuoc_trang_toi_da != (SELECT kich_thuoc_trang_toi_da FROM san_pham GROUP BY kich_thuoc_trang_toi_da ORDER BY COUNT(*) DESC LIMIT 1)
SELECT san_pham.san_pham FROM san_pham JOIN san_pham_cua_cua_hang ON san_pham.id_san_pham = san_pham_cua_cua_hang.id_san_pham WHERE san_pham.kich_thuoc != san_pham.kich_thuoc_trang_toi_da GROUP BY san_pham.id_san_pham ORDER BY COUNT(*) DESC
SELECT SUM(dan_so_thanh_pho) FROM quan WHERE dien_tich_cua_cac_thanh_pho > (SELECT AVG(dien_tich_cua_cac_thanh_pho) FROM quan)
SELECT SUM(dan_so_thanh_pho) FROM quan WHERE dien_tich_cua_cac_thanh_pho > (SELECT AVG(dien_tich_cua_cac_thanh_pho) FROM quan)
SELECT quan.ten_quan FROM quan JOIN quan_cua_cua_hang ON quan.id_quan = quan_cua_cua_hang.id_quan JOIN cua_hang ON quan_cua_cua_hang.id_cua_hang = cua_hang.id_cua_hang WHERE cua_hang.loai = 'trung tâm mua sắm' INTERSECT SELECT quan.ten_quan FROM quan JOIN quan_cua_cua_hang ON quan.id_quan = quan_cua_cua_hang.id_quan JOIN cua_hang ON quan_cua_cua_hang.id_cua_hang = cua_hang.id_cua_hang WHERE cua_hang.loai = 'cửa hàng bình dân'
SELECT T1.ten_quan FROM quan AS T1 INNER JOIN quan_cua_cua_hang AS T2 ON T1.id_quan = T2.id_quan INNER JOIN cua_hang AS T3 ON T2.id_cua_hang = T3.id_cua_hang WHERE T3.loai = 'trung tâm mua sắm' INTERSECT SELECT T1.ten_quan FROM quan AS T1 INNER JOIN quan_cua_cua_hang AS T2 ON T1.id_quan = T2.id_quan INNER JOIN cua_hang AS T3 ON T2.id_cua_hang = T3.id_cua_hang WHERE T3.loai = 'cửa hàng bình dân'
SELECT COUNT(*) FROM khu_vuc
SELECT COUNT(*) FROM khu_vuc
SELECT ma_khu_vuc, ten_khu_vuc FROM khu_vuc ORDER BY ma_khu_vuc ASC
SELECT ma_khu_vuc, ten_khu_vuc FROM khu_vuc ORDER BY ma_khu_vuc
SELECT ten_khu_vuc FROM khu_vuc ORDER BY ten_khu_vuc ASC
SELECT ten_khu_vuc FROM khu_vuc ORDER BY ten_khu_vuc ASC
SELECT ten_khu_vuc FROM khu_vuc EXCEPT SELECT 'Đan Mạch' FROM khu_vuc WHERE ten_khu_vuc = 'Đan Mạch'
SELECT ten_khu_vuc FROM khu_vuc WHERE ten_khu_vuc != 'Đan Mạch'
SELECT COUNT(*) FROM bao WHERE so_luong_nguoi_chet > 0
SELECT COUNT(*) FROM bao WHERE so_luong_nguoi_chet >= 1
SELECT ten, ngay_hoat_dong, so_luong_nguoi_chet FROM bao WHERE so_luong_nguoi_chet >= 1
SELECT ten, ngay_hoat_dong, so_luong_nguoi_chet FROM bao WHERE so_luong_nguoi_chet >= 1
SELECT AVG(thiet_hai_theo_trieu_usd), MAX(thiet_hai_theo_trieu_usd) FROM bao WHERE toc_do_toi_da > 1000
SELECT AVG(thiet_hai_theo_trieu_usd), MAX(thiet_hai_theo_trieu_usd) FROM bao WHERE toc_do_toi_da > 1000
SELECT SUM(so_luong_nguoi_chet), SUM(thiet_hai_theo_trieu_usd) FROM bao WHERE toc_do_toi_da > (SELECT AVG(toc_do_toi_da) FROM bao)
SELECT SUM(so_luong_nguoi_chet), SUM(thiet_hai_theo_trieu_usd) FROM bao WHERE toc_do_toi_da > (SELECT AVG(toc_do_toi_da) FROM bao)
SELECT ten, thiet_hai_theo_trieu_usd FROM bao ORDER BY toc_do_toi_da DESC
SELECT ten , thiet_hai_theo_trieu_usd FROM bao ORDER BY toc_do_toi_da DESC
SELECT COUNT ( * ) FROM khu_vuc_bi_anh_huong
SELECT COUNT(DISTINCT id_khu_vuc) FROM khu_vuc_bi_anh_huong
SELECT ten_khu_vuc FROM khu_vuc WHERE id_khu_vuc NOT IN (SELECT id_khu_vuc FROM khu_vuc_bi_anh_huong)
SELECT ten_khu_vuc FROM khu_vuc EXCEPT SELECT khu_vuc.ten_khu_vuc FROM khu_vuc JOIN khu_vuc_bi_anh_huong ON khu_vuc.id_khu_vuc = khu_vuc_bi_anh_huong.id_khu_vuc
SELECT ten_khu_vuc , COUNT ( * ) FROM khu_vuc JOIN khu_vuc_bi_anh_huong ON khu_vuc.id_khu_vuc = khu_vuc_bi_anh_huong.id_khu_vuc GROUP BY khu_vuc.id_khu_vuc
SELECT T1.ten_khu_vuc , COUNT ( * ) FROM khu_vuc_bi_anh_huong AS T1 JOIN khu_vuc AS T2 ON T1.id_khu_vuc = T2.id_khu_vuc JOIN bao AS T3 ON T1.id_bao = T3.id_con_bao GROUP BY T1.id_khu_vuc ORDER BY COUNT ( * ) DESC
SELECT bao.ten , COUNT ( * ) FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao GROUP BY bao.id_con_bao
SELECT bao.id_con_bao , COUNT ( * ) FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao GROUP BY bao.id_con_bao
SELECT bao.ten, bao.toc_do_toi_da FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao GROUP BY bao.id_con_bao ORDER BY COUNT(*) DESC LIMIT 1
SELECT bao.ten , bao.toc_do_toi_da FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao GROUP BY bao.id_con_bao ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT ten FROM bao WHERE id_con_bao NOT IN (SELECT id_bao FROM khu_vuc_bi_anh_huong)
SELECT ten FROM bao EXCEPT SELECT ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao
SELECT bao.ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao GROUP BY bao.id_con_bao HAVING COUNT(DISTINCT khu_vuc_bi_anh_huong.id_khu_vuc) >= 2 AND SUM(khu_vuc_bi_anh_huong.so_thanh_pho_bi_anh_huong) >= 10
SELECT ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao GROUP BY bao.id_con_bao HAVING COUNT(khu_vuc_bi_anh_huong.id_khu_vuc) >= 2 AND SUM(khu_vuc_bi_anh_huong.so_thanh_pho_bi_anh_huong) >= 10
SELECT ten FROM bao WHERE id_con_bao NOT IN (SELECT id_bao FROM khu_vuc_bi_anh_huong GROUP BY id_bao HAVING COUNT(*) >= 2)
SELECT bao.ten FROM bao LEFT JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao GROUP BY bao.id_con_bao HAVING COUNT(khu_vuc_bi_anh_huong.id_khu_vuc) <= 2
SELECT T3.ten_khu_vuc FROM khu_vuc_bi_anh_huong AS T1 JOIN bao AS T2 ON T1.id_bao = T2.id_con_bao JOIN khu_vuc AS T3 ON T1.id_khu_vuc = T3.id_khu_vuc WHERE T2.so_luong_nguoi_chet >= 10
SELECT T3.ten_khu_vuc FROM khu_vuc_bi_anh_huong AS T1 JOIN bao AS T2 ON T1.id_bao = T2.id_con_bao JOIN khu_vuc AS T3 ON T1.id_khu_vuc = T3.id_khu_vuc WHERE T2.so_luong_nguoi_chet >= 10
SELECT bao.ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao JOIN khu_vuc ON khu_vuc_bi_anh_huong.id_khu_vuc = khu_vuc.id_khu_vuc WHERE khu_vuc.ten_khu_vuc = 'Đan Mạch'
SELECT bao.ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao JOIN khu_vuc ON khu_vuc_bi_anh_huong.id_khu_vuc = khu_vuc.id_khu_vuc WHERE khu_vuc.ten_khu_vuc = 'Đan Mạch'
SELECT T1.ten_khu_vuc FROM khu_vuc AS T1 JOIN khu_vuc_bi_anh_huong AS T2 ON T1.id_khu_vuc = T2.id_khu_vuc GROUP BY T1.id_khu_vuc HAVING COUNT(*) >= 2
SELECT T1.ten_khu_vuc FROM khu_vuc AS T1 JOIN khu_vuc_bi_anh_huong AS T2 ON T1.id_khu_vuc = T2.id_khu_vuc GROUP BY T1.id_khu_vuc HAVING COUNT(*) >= 2
SELECT T3.ten_khu_vuc FROM bao AS T1 JOIN khu_vuc_bi_anh_huong AS T2 ON T1.id_con_bao = T2.id_bao JOIN khu_vuc AS T3 ON T2.id_khu_vuc = T3.id_khu_vuc ORDER BY T1.so_luong_nguoi_chet DESC LIMIT 1
SELECT T3.ten_khu_vuc FROM bao AS T1 JOIN khu_vuc_bi_anh_huong AS T2 ON T1.id_con_bao = T2.id_bao JOIN khu_vuc AS T3 ON T2.id_khu_vuc = T3.id_khu_vuc WHERE T1.id_con_bao = (SELECT id_con_bao FROM bao ORDER BY so_luong_nguoi_chet DESC LIMIT 1)
SELECT bao.ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao JOIN khu_vuc ON khu_vuc_bi_anh_huong.id_khu_vuc = khu_vuc.id_khu_vuc WHERE khu_vuc.ten_khu_vuc = 'Afghanistan' AND khu_vuc.ten_khu_vuc = 'Albania'
SELECT bao.ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao JOIN khu_vuc ON khu_vuc_bi_anh_huong.id_khu_vuc = khu_vuc.id_khu_vuc WHERE khu_vuc.ten_khu_vuc = 'Afghanistan' INTERSECT SELECT bao.ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao JOIN khu_vuc ON khu_vuc_bi_anh_huong.id_khu_vuc = khu_vuc.id_khu_vuc WHERE khu_vuc.ten_khu_vuc = 'Albania'
SELECT COUNT(*) FROM danh_sach
SELECT COUNT(*) FROM danh_sach
SELECT ho FROM danh_sach WHERE phong_hoc = 111
SELECT ho FROM danh_sach WHERE phong_hoc = 111
SELECT ho FROM danh_sach WHERE phong_hoc = 108
SELECT ten FROM danh_sach WHERE phong_hoc = 108
SELECT ten FROM danh_sach WHERE phong_hoc = 107
SELECT DISTINCT ten FROM danh_sach WHERE phong_hoc = 107
SELECT phong_hoc , khoi_lop FROM danh_sach
SELECT phong_hoc , khoi_lop FROM danh_sach GROUP BY phong_hoc , khoi_lop
SELECT khoi_lop FROM danh_sach WHERE phong_hoc = 103
SELECT khoi_lop FROM danh_sach WHERE phong_hoc = 103
SELECT khoi_lop FROM danh_sach WHERE phong_hoc = 105
SELECT khoi_lop FROM danh_sach WHERE phong_hoc = 105
SELECT phong_hoc FROM danh_sach WHERE khoi_lop = 4
SELECT phong_hoc FROM danh_sach WHERE khoi_lop = 4
SELECT phong_hoc FROM danh_sach WHERE khoi_lop = 5
SELECT phong_hoc FROM danh_sach WHERE khoi_lop = 5
SELECT giao_vien.ho FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.khoi_lop = 5
SELECT giao_vien.ho FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.khoi_lop = 5
SELECT giao_vien.ho FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.khoi_lop = 1
SELECT ho , ten FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.khoi_lop = 1
SELECT ho , ten FROM giao_vien WHERE phong_hoc = 110
SELECT ho , ten FROM giao_vien WHERE phong_hoc = 110
SELECT ho FROM giao_vien WHERE phong_hoc = 109
SELECT ho FROM giao_vien WHERE phong_hoc = 109
SELECT ho , ten FROM giao_vien
SELECT ho , ten FROM giao_vien
SELECT ho , ten FROM danh_sach
SELECT ho , ten FROM danh_sach
SELECT danh_sach.ho , danh_sach.ten FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'OTHA' AND giao_vien.ten = 'MOYER'
SELECT danh_sach.ho , danh_sach.ten FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'OTHA MOYER'
SELECT ho , ten FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'MARROTTE' AND giao_vien.ten = 'KIRK'
SELECT danh_sach.ho , danh_sach.ten FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'MARROTTE' AND giao_vien.ten = 'KIRK'
SELECT giao_vien.ho, giao_vien.ten FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.ho = 'BROMLEY' AND danh_sach.ten = 'EVELINA'
SELECT giao_vien.ho , giao_vien.ten FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.ten = 'EVELINA' AND danh_sach.ho = 'BROMLEY'
SELECT T1.ho FROM giao_vien AS T1 JOIN danh_sach AS T2 ON T1.phong_hoc = T2.phong_hoc WHERE T2.ho = 'GELL' AND T2.ten = 'TAMI'
SELECT giao_vien.ho FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.ten = 'GELL TAMI'
SELECT COUNT(*) FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE giao_vien.ho = 'LORIA' AND giao_vien.ten = 'ONDERSMA'
SELECT COUNT(*) FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'LORIA' AND giao_vien.ten = 'ONDERSMA'
SELECT COUNT(*) FROM danh_sach WHERE phong_hoc = (SELECT phong_hoc FROM giao_vien WHERE ho = 'KAWA' AND ten = 'GORDON')
SELECT COUNT(*) FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'KAWA' AND giao_vien.ten = 'GORDON'
SELECT COUNT(*) FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'TARRING' AND giao_vien.ten = 'LEIA'
SELECT COUNT(*) FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'TARRING' AND giao_vien.ten = 'LEIA'
SELECT COUNT(*) FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE danh_sach.ten = 'CHRISSY NABOZNY'
SELECT COUNT(*) FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.ten = 'CHRISSY NABOZNY'
SELECT COUNT(*) FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE danh_sach.ten = 'MADLOCK RAY'
SELECT COUNT(*) FROM giao_vien WHERE phong_hoc = (SELECT phong_hoc FROM danh_sach WHERE ho = 'MADLOCK' AND ten = 'RAY')
SELECT ho , ten FROM danh_sach WHERE khoi_lop = 1 AND phong_hoc NOT IN (SELECT phong_hoc FROM giao_vien WHERE ho = 'OTHA' AND ten = 'MOYER')
SELECT danh_sach.ho FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE danh_sach.khoi_lop = 1 AND danh_sach.phong_hoc NOT IN (SELECT phong_hoc FROM giao_vien WHERE ho = 'OTHA' AND ten = 'MOYER')
SELECT ho FROM danh_sach WHERE khoi_lop = 3 AND phong_hoc NOT IN (SELECT phong_hoc FROM giao_vien WHERE ho = 'COVIN' AND ten = 'JEROME')
SELECT ho FROM danh_sach WHERE khoi_lop = 3 AND phong_hoc NOT IN (SELECT phong_hoc FROM giao_vien WHERE ho = 'COVIN' AND ten = 'JEROME')
SELECT danh_sach.khoi_lop , COUNT ( DISTINCT danh_sach.phong_hoc ) , COUNT ( * ) FROM danh_sach GROUP BY danh_sach.khoi_lop
SELECT khoi_lop , COUNT ( * ) , COUNT ( DISTINCT phong_hoc ) FROM danh_sach GROUP BY khoi_lop
SELECT phong_hoc , COUNT ( DISTINCT khoi_lop ) FROM danh_sach GROUP BY phong_hoc
SELECT danh_sach.phong_hoc , COUNT(DISTINCT danh_sach.khoi_lop) FROM danh_sach GROUP BY danh_sach.phong_hoc
SELECT phong_hoc FROM danh_sach GROUP BY phong_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT phong_hoc FROM danh_sach GROUP BY phong_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT danh_sach.phong_hoc , COUNT ( * ) FROM danh_sach GROUP BY danh_sach.phong_hoc
SELECT danh_sach.phong_hoc , COUNT ( * ) FROM danh_sach GROUP BY danh_sach.phong_hoc
SELECT phong_hoc , COUNT ( * ) FROM danh_sach WHERE khoi_lop = 0 GROUP BY phong_hoc
SELECT phong_hoc , COUNT ( * ) FROM danh_sach WHERE khoi_lop = 0 GROUP BY phong_hoc
SELECT phong_hoc , COUNT ( * ) FROM danh_sach WHERE khoi_lop = 4 GROUP BY phong_hoc
SELECT phong_hoc , COUNT ( * ) FROM danh_sach WHERE khoi_lop = 4 GROUP BY phong_hoc
SELECT giao_vien.ho , giao_vien.ten FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc GROUP BY giao_vien.ho , giao_vien.ten ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT giao_vien.ho, giao_vien.ten FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc GROUP BY giao_vien.ho ORDER BY COUNT(*) DESC LIMIT 1
SELECT phong_hoc , COUNT ( * ) FROM danh_sach GROUP BY phong_hoc
SELECT phong_hoc , COUNT ( * ) FROM danh_sach GROUP BY phong_hoc
SELECT ten_khoa_hoc FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_khoa_hoc FROM khoa_hoc AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_khoa_hoc = T2.id_khoa_hoc GROUP BY T1.id_khoa_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_sinh_vien FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien ORDER BY COUNT(*) ASC LIMIT 1
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT(*) ASC LIMIT 1
SELECT ca_nhan.ho , ca_nhan.ten FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ung_cu_vien = ca_nhan.id_ca_nhan
SELECT T2.ho , T2.ten FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ung_cu_vien = T2.id_ca_nhan
SELECT id_sinh_vien FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien)
SELECT sinh_vien.id_sinh_vien FROM sinh_vien WHERE sinh_vien.id_sinh_vien NOT IN (SELECT lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien)
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN lan_tham_du_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien
SELECT DISTINCT sinh_vien.id_sinh_vien FROM sinh_vien JOIN lan_tham_du_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien
SELECT sinh_vien.id_sinh_vien , khoa_hoc.ten_khoa_hoc FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc
SELECT ca_nhan.ho , ca_nhan.ten FROM sinh_vien JOIN ca_nhan ON sinh_vien.chi_tiet_sinh_vien = ca_nhan.id_ca_nhan JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien ORDER BY luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ki DESC LIMIT 1
SELECT ca_nhan.ho , ca_nhan.ten , ca_nhan.ten_dem , luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ki FROM sinh_vien JOIN ca_nhan ON sinh_vien.chi_tiet_sinh_vien = ca_nhan.id_ca_nhan JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien ORDER BY luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ki DESC LIMIT 1
SELECT COUNT(DISTINCT sinh_vien.id_sinh_vien) FROM sinh_vien JOIN lan_tham_du_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN khoa_hoc ON lan_tham_du_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'tiếng Anh'
SELECT COUNT(*) FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'tiếng Anh'
SELECT COUNT(*) FROM lan_tham_du_khoa_hoc_cua_sinh_vien WHERE id_sinh_vien = 171
SELECT COUNT(*) FROM lan_tham_du_khoa_hoc_cua_sinh_vien WHERE id_sinh_vien = 171
SELECT ung_cu_vien.id_ung_cu_vien FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ung_cu_vien = ca_nhan.id_ca_nhan WHERE ca_nhan.dia_chi_email = 'stanley.monahan@example.org'
SELECT ung_cu_vien.id_ung_cu_vien FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ung_cu_vien = ca_nhan.id_ca_nhan WHERE ca_nhan.dia_chi_email = 'stanley.monahan@example.org'
SELECT T1.id_ung_cu_vien FROM ung_cu_vien AS T1 JOIN danh_gia_ung_cu_vien AS T2 ON T1.id_ung_cu_vien = T2.id_ung_cu_vien ORDER BY T2.ngay_danh_gia DESC LIMIT 1
SELECT id_ung_cu_vien FROM danh_gia_ung_cu_vien ORDER BY ngay_danh_gia DESC LIMIT 1
SELECT sinh_vien.id_sinh_vien , ca_nhan.ho , ca_nhan.ten , ca_nhan.ten_dem FROM sinh_vien JOIN ca_nhan ON sinh_vien.chi_tiet_sinh_vien = ca_nhan.id_ca_nhan JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT sinh_vien.id_sinh_vien , sinh_vien.chi_tiet_sinh_vien FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT ( * ) DESC LIMIT 1
SELECT T1.id_sinh_vien , COUNT ( * ) FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien GROUP BY T1.id_sinh_vien
SELECT ca_nhan.ho , ca_nhan.ten , COUNT ( * ) FROM sinh_vien JOIN ca_nhan ON sinh_vien.chi_tiet_sinh_vien = ca_nhan.id_ca_nhan JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien
SELECT khoa_hoc.ten_khoa_hoc , COUNT ( * ) FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc
SELECT khoa_hoc.id_khoa_hoc , khoa_hoc.ten_khoa_hoc , COUNT ( * ) FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc
SELECT T1.id_ung_cu_vien FROM ung_cu_vien AS T1 JOIN danh_gia_ung_cu_vien AS T2 ON T1.id_ung_cu_vien = T2.id_ung_cu_vien WHERE T2.ma_ket_qua_danh_gia = 'Đạt'
SELECT T1.id_ung_cu_vien FROM ung_cu_vien AS T1 JOIN danh_gia_ung_cu_vien AS T2 ON T1.id_ung_cu_vien = T2.id_ung_cu_vien WHERE T2.ma_ket_qua_danh_gia = 'Đạt'
SELECT T3.so_di_dong FROM ung_cu_vien AS T1 JOIN ca_nhan AS T3 ON T1.id_ca_nhan = T3.id_ca_nhan JOIN danh_gia_ung_cu_vien AS T2 ON T1.id_ung_cu_vien = T2.id_ung_cu_vien WHERE T2.ma_ket_qua_danh_gia = 'Trượt'
SELECT T3.so_di_dong FROM ung_cu_vien AS T1 JOIN danh_gia_ung_cu_vien AS T2 ON T1.id_ung_cu_vien = T2.id_ung_cu_vien JOIN ca_nhan AS T3 ON T1.chi_tiet_ung_cu_vien = T3.id_ca_nhan WHERE T2.ma_ket_qua_danh_gia = 'Trượt'
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien WHERE luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = '301'
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien WHERE luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = 301
SELECT id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien WHERE id_khoa_hoc = 301 ORDER BY ngay_tham_du DESC LIMIT 1
SELECT T1.id_sinh_vien FROM sinh_vien AS T1 JOIN lan_tham_du_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien WHERE T2.id_khoa_hoc = '301' ORDER BY T2.ngay_tham_du DESC LIMIT 1
SELECT DISTINCT dia_chi.thanh_pho FROM ca_nhan JOIN dia_chi_ca_nhan ON ca_nhan.id_ca_nhan = dia_chi_ca_nhan.id_ca_nhan JOIN dia_chi ON dia_chi_ca_nhan.id_dia_chi = dia_chi.id_dia_chi
SELECT DISTINCT dia_chi.thanh_pho FROM ca_nhan JOIN dia_chi_ca_nhan ON ca_nhan.id_ca_nhan = dia_chi_ca_nhan.id_ca_nhan JOIN dia_chi ON dia_chi_ca_nhan.id_dia_chi = dia_chi.id_dia_chi
SELECT DISTINCT dia_chi.thanh_pho FROM sinh_vien JOIN ca_nhan ON sinh_vien.chi_tiet_sinh_vien = ca_nhan.id_ca_nhan JOIN dia_chi_ca_nhan ON ca_nhan.id_ca_nhan = dia_chi_ca_nhan.id_ca_nhan JOIN dia_chi ON dia_chi_ca_nhan.id_dia_chi = dia_chi.id_dia_chi
SELECT DISTINCT dia_chi.thanh_pho FROM sinh_vien JOIN ca_nhan ON sinh_vien.chi_tiet_sinh_vien = ca_nhan.id_ca_nhan JOIN dia_chi_ca_nhan ON ca_nhan.id_ca_nhan = dia_chi_ca_nhan.id_ca_nhan JOIN dia_chi ON dia_chi_ca_nhan.id_dia_chi = dia_chi.id_dia_chi
SELECT ten_khoa_hoc FROM khoa_hoc ORDER BY ten_khoa_hoc ASC
SELECT ten_khoa_hoc FROM khoa_hoc ORDER BY ten_khoa_hoc ASC
SELECT ten FROM ca_nhan ORDER BY ten ASC
SELECT ho , ten FROM ca_nhan ORDER BY ho ASC , ten ASC
SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien UNION SELECT id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc , lan_tham_du_khoa_hoc_cua_sinh_vien.id_khoa_hoc FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN lan_tham_du_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien WHERE sinh_vien.id_sinh_vien = 121
SELECT id_khoa_hoc FROM luot_dang_ky_khoa_hoc_cua_sinh_vien WHERE id_sinh_vien = 121 UNION SELECT id_khoa_hoc FROM lan_tham_du_khoa_hoc_cua_sinh_vien WHERE id_sinh_vien = 121
SELECT T1.id_sinh_vien , T1.id_ca_nhan , T1.chi_tiet_sinh_vien FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien EXCEPT SELECT T1.id_sinh_vien , T1.id_ca_nhan , T1.chi_tiet_sinh_vien FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien JOIN lan_tham_du_khoa_hoc_cua_sinh_vien AS T3 ON T1.id_sinh_vien = T3.id_sinh_vien AND T2.id_khoa_hoc = T3.id_khoa_hoc
SELECT sinh_vien.id_sinh_vien, ca_nhan.ho, ca_nhan.ten, sinh_vien.chi_tiet_sinh_vien FROM sinh_vien JOIN ca_nhan ON sinh_vien.chi_tiet_sinh_vien = ca_nhan.id_ca_nhan WHERE sinh_vien.id_sinh_vien IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien) AND sinh_vien.id_sinh_vien NOT IN (SELECT id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien)
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'thống kê' ORDER BY luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ki ASC
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'thống kê' ORDER BY luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ki ASC
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN lan_tham_du_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN khoa_hoc ON lan_tham_du_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'thống kê' ORDER BY lan_tham_du_khoa_hoc_cua_sinh_vien.ngay_tham_du
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN lan_tham_du_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN khoa_hoc ON lan_tham_du_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'thống kê' ORDER BY lan_tham_du_khoa_hoc_cua_sinh_vien.ngay_tham_du
SELECT COUNT(*) FROM luot_nop_bai
SELECT COUNT(*) FROM luot_nop_bai
SELECT tac_gia FROM luot_nop_bai ORDER BY so_diem ASC
SELECT tac_gia , so_diem FROM luot_nop_bai ORDER BY so_diem ASC
SELECT tac_gia , truong_dai_hoc FROM luot_nop_bai
SELECT tac_gia , truong_dai_hoc FROM luot_nop_bai
SELECT tac_gia FROM luot_nop_bai WHERE truong_dai_hoc = 'Florida' OR truong_dai_hoc = 'Temple'
SELECT tac_gia FROM luot_nop_bai WHERE truong_dai_hoc = 'Florida' OR truong_dai_hoc = 'Temple'
SELECT AVG(so_diem) FROM luot_nop_bai
SELECT AVG(so_diem) FROM luot_nop_bai
SELECT tac_gia FROM luot_nop_bai ORDER BY so_diem DESC LIMIT 1
SELECT tac_gia FROM luot_nop_bai ORDER BY so_diem DESC LIMIT 1
SELECT truong_dai_hoc , COUNT ( * ) FROM luot_nop_bai GROUP BY truong_dai_hoc
SELECT luot_nop_bai.truong_dai_hoc , COUNT ( * ) FROM luot_nop_bai GROUP BY luot_nop_bai.truong_dai_hoc
SELECT truong_dai_hoc FROM luot_nop_bai GROUP BY truong_dai_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT luot_nop_bai.truong_dai_hoc FROM luot_nop_bai GROUP BY luot_nop_bai.truong_dai_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT truong_dai_hoc FROM luot_nop_bai GROUP BY truong_dai_hoc HAVING SUM(CASE WHEN so_diem > 90 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN so_diem < 80 THEN 1 ELSE 0 END) > 0
SELECT truong_dai_hoc FROM luot_nop_bai WHERE so_diem > 90 INTERSECT SELECT truong_dai_hoc FROM luot_nop_bai WHERE so_diem < 80
SELECT luot_nop_bai.tac_gia , chap_thuan.ket_qua FROM luot_nop_bai JOIN chap_thuan ON luot_nop_bai.id_luot_nop_bai = chap_thuan.id_luot_nop_bai
SELECT luot_nop_bai.tac_gia , chap_thuan.ket_qua FROM luot_nop_bai JOIN chap_thuan ON luot_nop_bai.id_luot_nop_bai = chap_thuan.id_luot_nop_bai
SELECT chap_thuan.ket_qua FROM luot_nop_bai JOIN chap_thuan ON luot_nop_bai.id_luot_nop_bai = chap_thuan.id_luot_nop_bai ORDER BY luot_nop_bai.so_diem DESC LIMIT 1
SELECT luot_nop_bai.so_diem , chap_thuan.ket_qua FROM luot_nop_bai JOIN chap_thuan ON luot_nop_bai.id_luot_nop_bai = chap_thuan.id_luot_nop_bai ORDER BY luot_nop_bai.so_diem DESC LIMIT 1
SELECT tac_gia , COUNT ( DISTINCT chap_thuan.id_hoi_thao ) FROM luot_nop_bai JOIN chap_thuan ON luot_nop_bai.id_luot_nop_bai = chap_thuan.id_luot_nop_bai GROUP BY tac_gia
SELECT luot_nop_bai.tac_gia , COUNT(DISTINCT chap_thuan.id_hoi_thao) FROM luot_nop_bai JOIN chap_thuan ON luot_nop_bai.id_luot_nop_bai = chap_thuan.id_luot_nop_bai GROUP BY luot_nop_bai.tac_gia
SELECT tac_gia FROM luot_nop_bai JOIN chap_thuan ON luot_nop_bai.id_luot_nop_bai = chap_thuan.id_luot_nop_bai GROUP BY tac_gia HAVING COUNT(DISTINCT chap_thuan.id_hoi_thao) > 1
SELECT tac_gia FROM luot_nop_bai JOIN chap_thuan ON luot_nop_bai.id_luot_nop_bai = chap_thuan.id_luot_nop_bai GROUP BY tac_gia ORDER BY COUNT(*) DESC
SELECT ngay, dia_diem FROM hoi_thao ORDER BY dia_diem ASC
SELECT ngay , dia_diem FROM hoi_thao ORDER BY dia_diem ASC
SELECT ten FROM doanh_nghiep WHERE danh_gia_xep_hang > 4.5
SELECT ten FROM doanh_nghiep WHERE danh_gia_xep_hang = 3.5
SELECT id_nguoi_tieu_dung FROM nguoi_tieu_dung WHERE ten = 'Michelle'
SELECT thanh_pho FROM doanh_nghiep WHERE ten = 'Whataburger'
SELECT thanh_pho FROM doanh_nghiep WHERE ten = 'tiệc đứng sang trọng MGM'
SELECT thanh_pho FROM doanh_nghiep WHERE danh_gia_xep_hang < 1.5
SELECT thanh_pho FROM doanh_nghiep WHERE ten = 'Taj Mahal'
SELECT van_ban FROM danh_gia WHERE danh_gia_xep_hang < 1
SELECT ten FROM doanh_nghiep WHERE danh_gia_xep_hang > 3.5
SELECT DISTINCT thanh_pho FROM doanh_nghiep WHERE ten = 'Taj Mahal'
SELECT danh_gia.van_ban FROM danh_gia JOIN nguoi_tieu_dung ON danh_gia.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE nguoi_tieu_dung.ten = 'Niloofar'
SELECT doanh_nghiep.ten FROM doanh_nghiep JOIN danh_gia ON doanh_nghiep.id_doanh_nghiep = danh_gia.id_doanh_nghiep JOIN nguoi_tieu_dung ON danh_gia.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE nguoi_tieu_dung.ten = 'Niloofar'
SELECT T1.ten FROM doanh_nghiep AS T1 JOIN danh_gia AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep JOIN nguoi_tieu_dung AS T3 ON T2.id_nguoi_tieu_dung = T3.id_nguoi_tieu_dung WHERE T3.ten = 'Niloofar' AND T2.danh_gia_xep_hang = 5
SELECT danh_gia.van_ban FROM danh_gia JOIN nguoi_tieu_dung ON danh_gia.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE nguoi_tieu_dung.ten = 'Michelle' AND loai_hinh.ten_loai_hinh = 'nhà hàng Ý'
SELECT COUNT(*) FROM danh_gia JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Cafe Zinho' AND doanh_nghiep.thanh_pho = 'Texas'
SELECT ten FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'nhà hàng Ý' AND doanh_nghiep.danh_gia_xep_hang = 5
SELECT T1.ten_khu_pho_lan_can FROM khu_vuc_lan_can AS T1 JOIN loai_hinh AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep JOIN doanh_nghiep AS T3 ON T2.id_doanh_nghiep = T3.id_doanh_nghiep WHERE T3.ten_loai_hinh = 'nhà hàng Ý' AND T3.thanh_pho = 'Madison'
SELECT T1.ten_khu_pho_lan_can FROM khu_vuc_lan_can AS T1 JOIN doanh_nghiep AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep JOIN loai_hinh AS T3 ON T2.id_doanh_nghiep = T3.id_doanh_nghiep WHERE T3.ten_loai_hinh = 'nhà hàng Ý' AND T2.danh_gia_xep_hang < 2.5 AND T2.thanh_pho = 'Madison'
SELECT * FROM doanh_nghiep WHERE thanh_pho = 'Pennsylvania'
SELECT doanh_nghiep.id_doanh_nghiep , doanh_nghiep.ten , doanh_nghiep.dia_chi_day_du , doanh_nghiep.thanh_pho , doanh_nghiep.vi_do , doanh_nghiep.kinh_do , doanh_nghiep.so_luong_danh_gia , doanh_nghiep.co_mo_cua_hay_khong , doanh_nghiep.danh_gia_xep_hang , doanh_nghiep.tieu_bang FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'nhà hàng' AND doanh_nghiep.thanh_pho = 'Pennsylvania'
SELECT danh_gia.van_ban FROM danh_gia JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'chải chuốt cho vật nuôi' AND doanh_nghiep.so_luong_danh_gia > 100
SELECT ten, dia_chi_day_du FROM doanh_nghiep WHERE thanh_pho = 'Los Angeles'
SELECT T1.id_doanh_nghiep , T1.ten , T1.dia_chi_day_du , T1.thanh_pho , T1.vi_do , T1.kinh_do , T1.so_luong_danh_gia , T1.co_mo_cua_hay_khong , T1.danh_gia_xep_hang , T1.tieu_bang FROM doanh_nghiep AS T1 JOIN loai_hinh AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep WHERE T2.ten_loai_hinh = 'Nhà máy bia' AND T1.thanh_pho = 'Los Angeles'
SELECT doanh_nghiep.id_doanh_nghiep , doanh_nghiep.ten , doanh_nghiep.dia_chi_day_du , doanh_nghiep.thanh_pho , doanh_nghiep.vi_do , doanh_nghiep.kinh_do , doanh_nghiep.so_luong_danh_gia , doanh_nghiep.co_mo_cua_hay_khong , doanh_nghiep.danh_gia_xep_hang , doanh_nghiep.tieu_bang FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'Nhà máy bia' AND doanh_nghiep.thanh_pho = 'Los Angeles'
SELECT nguoi_tieu_dung.ten FROM danh_gia JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep JOIN nguoi_tieu_dung ON danh_gia.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE doanh_nghiep.ten = 'Mesa Grill'
SELECT dia_chi_day_du FROM doanh_nghiep WHERE thanh_pho = 'Los Angeles' AND ten LIKE '%Walmart%'
SELECT doanh_nghiep.id_doanh_nghiep , doanh_nghiep.ten , doanh_nghiep.dia_chi_day_du , doanh_nghiep.thanh_pho , doanh_nghiep.vi_do , doanh_nghiep.kinh_do , doanh_nghiep.so_luong_danh_gia , doanh_nghiep.co_mo_cua_hay_khong , doanh_nghiep.danh_gia_xep_hang , doanh_nghiep.tieu_bang FROM doanh_nghiep JOIN danh_gia ON doanh_nghiep.id_doanh_nghiep = danh_gia.id_doanh_nghiep JOIN nguoi_tieu_dung ON danh_gia.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE doanh_nghiep.thanh_pho = 'Dallas' AND nguoi_tieu_dung.ten = 'Patrick'
SELECT ten FROM doanh_nghiep JOIN danh_gia ON doanh_nghiep.id_doanh_nghiep = danh_gia.id_doanh_nghiep JOIN nguoi_tieu_dung ON danh_gia.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE nguoi_tieu_dung.ten = 'Patrick' AND doanh_nghiep.thanh_pho = 'Dallas'
SELECT T2.ten, T2.dia_chi_day_du, T2.thanh_pho, T2.vi_do, T2.kinh_do FROM danh_gia AS T1 JOIN doanh_nghiep AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep JOIN nguoi_tieu_dung AS T3 ON T1.id_nguoi_tieu_dung = T3.id_nguoi_tieu_dung WHERE T3.ten = 'Patrick'
SELECT T3.ten FROM danh_gia AS T1 JOIN nguoi_tieu_dung AS T2 ON T1.id_nguoi_tieu_dung = T2.id_nguoi_tieu_dung JOIN doanh_nghiep AS T3 ON T1.id_doanh_nghiep = T3.id_doanh_nghiep WHERE T2.ten = 'Patrick' AND T1.danh_gia_xep_hang >= 3
SELECT T3.id_nguoi_tieu_dung , T3.ten FROM khoan_tien_boa AS T1 JOIN doanh_nghiep AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep JOIN nguoi_tieu_dung AS T3 ON T1.id_nguoi_tieu_dung = T3.id_nguoi_tieu_dung WHERE T2.ten = 'Barrio Café' AND T1.nam = 2015
SELECT * FROM doanh_nghiep WHERE thanh_pho = 'Texas' AND danh_gia_xep_hang < 2
SELECT doanh_nghiep.id_doanh_nghiep, doanh_nghiep.ten, doanh_nghiep.dia_chi_day_du, doanh_nghiep.thanh_pho, doanh_nghiep.vi_do, doanh_nghiep.kinh_do, doanh_nghiep.so_luong_danh_gia, doanh_nghiep.co_mo_cua_hay_khong, doanh_nghiep.danh_gia_xep_hang, doanh_nghiep.tieu_bang FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'hải sản' AND doanh_nghiep.thanh_pho = 'Los Angeles'
SELECT T1.id_doanh_nghiep , T1.ten , T1.dia_chi_day_du , T1.thanh_pho , T1.vi_do , T1.kinh_do , T1.so_luong_danh_gia , T1.co_mo_cua_hay_khong , T1.danh_gia_xep_hang , T1.tieu_bang FROM doanh_nghiep AS T1 JOIN loai_hinh AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep WHERE T2.ten_loai_hinh = 'hải sản' AND T1.thanh_pho = 'Los Angeles'
SELECT T1.id_doanh_nghiep , T1.ten , T1.dia_chi_day_du , T1.thanh_pho , T1.vi_do , T1.kinh_do , T1.so_luong_danh_gia , T1.co_mo_cua_hay_khong , T1.danh_gia_xep_hang , T1.tieu_bang FROM doanh_nghiep AS T1 JOIN loai_hinh AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep WHERE T2.ten_loai_hinh = 'Hải sản' AND T1.thanh_pho = 'Los Angeles'
SELECT T1.van_ban FROM danh_gia AS T1 JOIN nguoi_tieu_dung AS T2 ON T1.id_nguoi_tieu_dung = T2.id_nguoi_tieu_dung WHERE T2.ten = 'Patrick' AND T1.danh_gia_xep_hang > 4
SELECT id_doanh_nghiep , ten , dia_chi_day_du , thanh_pho FROM doanh_nghiep WHERE ten = 'Apple' AND thanh_pho = 'Los Angeles'
SELECT ten FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'nhà hàng' AND doanh_nghiep.thanh_pho = 'Dallas' AND doanh_nghiep.danh_gia_xep_hang > 4.5
SELECT T2.ten_khu_pho_lan_can FROM doanh_nghiep AS T1 JOIN khu_vuc_lan_can AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep WHERE T1.ten = 'Flat Top Grill'
SELECT T1.van_ban FROM khoan_tien_boa AS T1 JOIN doanh_nghiep AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep WHERE T2.ten = 'Vintner Grill' AND T1.so_luot_thich > 9
SELECT danh_gia.van_ban FROM danh_gia JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'cung điện Kabob' AND danh_gia.nam = 2014
SELECT T1.ten FROM nguoi_tieu_dung AS T1 JOIN khoan_tien_boa AS T2 ON T1.id_nguoi_tieu_dung = T2.id_nguoi_tieu_dung JOIN doanh_nghiep AS T3 ON T2.id_doanh_nghiep = T3.id_doanh_nghiep WHERE T3.thanh_pho = 'Dallas'
SELECT thanh_pho FROM doanh_nghiep WHERE ten = 'tiệc đứng sang trọng MGM' AND thanh_pho = 'Texas'
SELECT nguoi_tieu_dung.ten FROM khoan_tien_boa JOIN doanh_nghiep ON khoan_tien_boa.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep JOIN nguoi_tieu_dung ON khoan_tien_boa.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE loai_hinh.ten_loai_hinh = 'chải chuốt cho thú nuôi'
SELECT T1.van_ban FROM khoan_tien_boa AS T1 JOIN doanh_nghiep AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep WHERE T2.ten = 'Cafe Zinho' AND T2.thanh_pho = 'Texas'
SELECT T1.ten FROM nguoi_tieu_dung AS T1 JOIN danh_gia AS T2 ON T1.id_nguoi_tieu_dung = T2.id_nguoi_tieu_dung JOIN doanh_nghiep AS T3 ON T2.id_doanh_nghiep = T3.id_doanh_nghiep JOIN loai_hinh AS T4 ON T3.id_doanh_nghiep = T4.id_doanh_nghiep WHERE T4.ten_loai_hinh = 'nhà hàng'
SELECT khoan_tien_boa.van_ban FROM khoan_tien_boa JOIN doanh_nghiep ON khoan_tien_boa.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'cafe zinho' AND doanh_nghiep.thanh_pho = 'pennsylvania' AND khoan_tien_boa.nam = 2010
SELECT T2.ten FROM danh_gia AS T1 JOIN nguoi_tieu_dung AS T2 ON T1.id_nguoi_tieu_dung = T2.id_nguoi_tieu_dung WHERE T1.nam = 2010
SELECT van_ban FROM khoan_tien_boa WHERE nam = 2012
SELECT van_ban FROM danh_gia WHERE danh_gia_xep_hang = 2.5
SELECT COUNT(*) FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE doanh_nghiep.thanh_pho = 'Madison' AND loai_hinh.ten_loai_hinh = 'trò chơi trốn thoát'
SELECT COUNT(*) FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE doanh_nghiep.thanh_pho = 'Madison' AND loai_hinh.ten_loai_hinh = 'trò chơi trốn thoát'
SELECT COUNT(*) FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE doanh_nghiep.thanh_pho = 'Madison' AND loai_hinh.ten_loai_hinh = 'trò chơi trốn thoát'
SELECT COUNT(*) FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'trò chơi trốn thoát' AND doanh_nghiep.thanh_pho = 'Madison'
SELECT COUNT(*) FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE doanh_nghiep.thanh_pho = 'Madison' AND loai_hinh.ten_loai_hinh = 'trò chơi trốn thoát'
SELECT COUNT(*) FROM doanh_nghiep WHERE danh_gia_xep_hang > 3.5
SELECT SUM(luot_dang_ky.so_luong) FROM luot_dang_ky JOIN doanh_nghiep ON luot_dang_ky.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE doanh_nghiep.thanh_pho = 'Los Angeles' AND loai_hinh.ten_loai_hinh = 'Ma-rốc'
SELECT SUM(luot_dang_ky.so_luong) FROM luot_dang_ky JOIN doanh_nghiep ON luot_dang_ky.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'Ma-róc' AND doanh_nghiep.thanh_pho = 'Los Angeles' AND luot_dang_ky.ngay LIKE '%thứ Sáu%'
SELECT T1.ngay , SUM(T1.so_luong) FROM luot_dang_ky AS T1 JOIN doanh_nghiep AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep JOIN loai_hinh AS T3 ON T2.id_doanh_nghiep = T3.id_doanh_nghiep WHERE T3.ten_loai_hinh = 'Ma-rốc' AND T2.thanh_pho = 'Los Angeles' GROUP BY T1.ngay
SELECT T1.tieu_bang , SUM(T2.so_luong) FROM doanh_nghiep AS T1 JOIN luot_dang_ky AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep WHERE T1.ten = 'Italian Delis' GROUP BY T1.tieu_bang
SELECT COUNT(*) FROM danh_gia JOIN nguoi_tieu_dung ON danh_gia.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE nguoi_tieu_dung.ten = 'Niloofar' AND danh_gia.nam = 2015
SELECT AVG(T1.danh_gia_xep_hang) FROM danh_gia AS T1 JOIN nguoi_tieu_dung AS T2 ON T1.id_nguoi_tieu_dung = T2.id_nguoi_tieu_dung WHERE T2.ten = 'Michelle'
SELECT COUNT(*) FROM luot_dang_ky JOIN doanh_nghiep ON luot_dang_ky.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Cafe Zinho' AND luot_dang_ky.ngay LIKE '%thursday%'
SELECT COUNT(*) FROM nguoi_tieu_dung JOIN danh_gia ON nguoi_tieu_dung.id_nguoi_tieu_dung = danh_gia.id_nguoi_tieu_dung JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Sushi Too' AND doanh_nghiep.thanh_pho = 'Pittsburgh'
SELECT COUNT(*) FROM doanh_nghiep WHERE thanh_pho = 'Pittsburgh' AND danh_gia_xep_hang > 4.5
SELECT COUNT(*) FROM danh_gia JOIN khoan_tien_boa ON danh_gia.id_doanh_nghiep = khoan_tien_boa.id_doanh_nghiep AND danh_gia.id_nguoi_tieu_dung = khoan_tien_boa.id_nguoi_tieu_dung WHERE khoan_tien_boa.nam = 2015
SELECT SUM(khoan_tien_boa.so_luot_thich) FROM khoan_tien_boa JOIN doanh_nghiep ON khoan_tien_boa.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Niloofar'
SELECT SUM(khoan_tien_boa.so_luot_thich) FROM khoan_tien_boa JOIN doanh_nghiep ON khoan_tien_boa.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Cafe Zinho'
SELECT SUM(T1.so_luot_thich) FROM khoan_tien_boa AS T1 JOIN doanh_nghiep AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep JOIN nguoi_tieu_dung AS T3 ON T1.id_nguoi_tieu_dung = T3.id_nguoi_tieu_dung WHERE T2.ten = 'Cafe Zinho' AND T3.ten = 'Niloofar'
SELECT COUNT(*) FROM khoan_tien_boa JOIN nguoi_tieu_dung ON khoan_tien_boa.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE nguoi_tieu_dung.ten = 'Michelle' AND khoan_tien_boa.nam = 2010
SELECT COUNT(*) FROM khoan_tien_boa JOIN nguoi_tieu_dung ON khoan_tien_boa.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE khoan_tien_boa.nam = 2010 AND nguoi_tieu_dung.ten = 'Michelle'
SELECT COUNT(*) FROM nguoi_tieu_dung AS T1 JOIN khoan_tien_boa AS T2 ON T1.id_nguoi_tieu_dung = T2.id_nguoi_tieu_dung WHERE T1.ten = 'Michelle' AND T2.thang = '4'
SELECT COUNT(*) FROM doanh_nghiep WHERE thanh_pho = 'Texas'
SELECT COUNT(*) FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'bar' AND doanh_nghiep.thanh_pho = 'Dallas' AND doanh_nghiep.danh_gia_xep_hang > 3.5
SELECT COUNT(*) FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE doanh_nghiep.thanh_pho = 'Dallas' AND loai_hinh.ten_loai_hinh = 'Quán bar' AND doanh_nghiep.danh_gia_xep_hang > 3.5
SELECT COUNT ( DISTINCT danh_gia.id_nguoi_tieu_dung ) FROM danh_gia JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Texas de Brazil' AND doanh_nghiep.thanh_pho = 'Dallas'
SELECT COUNT(DISTINCT danh_gia.id_nguoi_tieu_dung) FROM danh_gia JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Bistro Di Napoli' AND danh_gia.nam = 2015
SELECT COUNT(*) FROM doanh_nghiep WHERE thanh_pho = 'Dallas' AND dia_chi_day_du LIKE '%Hazelwood%'
SELECT COUNT(*) FROM doanh_nghiep WHERE ten = 'Starbucks' AND thanh_pho = 'Dallas'
SELECT so_luong_danh_gia FROM doanh_nghiep WHERE ten = 'Acacia Cafe'
SELECT AVG(T1.so_luong) FROM luot_dang_ky AS T1 JOIN doanh_nghiep AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep WHERE T2.ten = 'Barrio Cafe'
SELECT COUNT(*) FROM doanh_nghiep JOIN khu_vuc_lan_can ON doanh_nghiep.id_doanh_nghiep = khu_vuc_lan_can.id_doanh_nghiep WHERE khu_vuc_lan_can.ten_khu_pho_lan_can = 'Stone Meadows' AND doanh_nghiep.thanh_pho = 'Madison'
SELECT COUNT ( * ) FROM nguoi_tieu_dung AS T1 JOIN danh_gia AS T2 ON T1.id_nguoi_tieu_dung = T2.id_nguoi_tieu_dung WHERE T1.ten = 'Adrienne'
SELECT COUNT(*) FROM danh_gia JOIN nguoi_tieu_dung ON danh_gia.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE nguoi_tieu_dung.ten = 'Michelle' AND danh_gia.nam = 2014 AND danh_gia.thang = '3'
SELECT COUNT(*) FROM nguoi_tieu_dung JOIN danh_gia ON nguoi_tieu_dung.id_nguoi_tieu_dung = danh_gia.id_nguoi_tieu_dung WHERE danh_gia.nam = 2010
SELECT COUNT(*) FROM doanh_nghiep JOIN danh_gia ON doanh_nghiep.id_doanh_nghiep = danh_gia.id_doanh_nghiep JOIN nguoi_tieu_dung ON nguoi_tieu_dung.id_nguoi_tieu_dung = danh_gia.id_nguoi_tieu_dung WHERE nguoi_tieu_dung.ten = 'Christine' AND danh_gia.nam = 2010 AND doanh_nghiep.thanh_pho = 'San Diego'
SELECT COUNT(*) FROM doanh_nghiep WHERE ten = 'Target' AND thanh_pho = 'Los Angeles'
SELECT COUNT(DISTINCT danh_gia.id_nguoi_tieu_dung) FROM danh_gia JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'quán rượu Ai-len' AND doanh_nghiep.thanh_pho = 'Dallas'
SELECT AVG(danh_gia_xep_hang) FROM danh_gia WHERE nam = 2014
SELECT COUNT(DISTINCT danh_gia.id_nguoi_tieu_dung) FROM danh_gia JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Vintner Grill' AND danh_gia.nam = 2010
SELECT SUM(doanh_nghiep.so_luong_danh_gia) FROM doanh_nghiep JOIN khu_vuc_lan_can ON doanh_nghiep.id_doanh_nghiep = khu_vuc_lan_can.id_doanh_nghiep WHERE khu_vuc_lan_can.ten_khu_pho_lan_can = 'South Summerlin'
SELECT COUNT(*) FROM nguoi_tieu_dung WHERE ten = 'Michelle'
SELECT COUNT(*) FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'nhà hàng'
SELECT COUNT(DISTINCT doanh_nghiep.thanh_pho) FROM doanh_nghiep WHERE doanh_nghiep.ten = 'Panda Express'
SELECT COUNT(*) FROM danh_gia JOIN nguoi_tieu_dung ON danh_gia.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE nguoi_tieu_dung.ten = 'Michelle'
SELECT SUM(luot_dang_ky.so_luong) FROM doanh_nghiep JOIN khu_vuc_lan_can ON doanh_nghiep.id_doanh_nghiep = khu_vuc_lan_can.id_doanh_nghiep JOIN luot_dang_ky ON doanh_nghiep.id_doanh_nghiep = luot_dang_ky.id_doanh_nghiep WHERE khu_vuc_lan_can.ten_khu_pho_lan_can = 'Brighton Heights'
SELECT COUNT(*) FROM danh_gia WHERE thang = '3'
SELECT khoan_tien_boa.thang , COUNT ( * ) FROM danh_gia JOIN khoan_tien_boa ON danh_gia.id_doanh_nghiep = khoan_tien_boa.id_doanh_nghiep AND danh_gia.id_nguoi_tieu_dung = khoan_tien_boa.id_nguoi_tieu_dung GROUP BY khoan_tien_boa.thang
SELECT COUNT(*) FROM khu_vuc_lan_can JOIN doanh_nghiep ON khu_vuc_lan_can.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.danh_gia_xep_hang = 5
SELECT ten FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'Ma-rốc' AND doanh_nghiep.thanh_pho LIKE '%Texas%'
SELECT ten FROM doanh_nghiep JOIN luot_dang_ky ON doanh_nghiep.id_doanh_nghiep = luot_dang_ky.id_doanh_nghiep GROUP BY doanh_nghiep.id_doanh_nghiep ORDER BY SUM(luot_dang_ky.so_luong) DESC LIMIT 1
SELECT khu_vuc_lan_can.ten_khu_pho_lan_can FROM khu_vuc_lan_can JOIN doanh_nghiep ON khu_vuc_lan_can.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.thanh_pho = 'Madison' GROUP BY khu_vuc_lan_can.ten_khu_pho_lan_can ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten, thanh_pho, danh_gia_xep_hang FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'Mexican' AND thanh_pho = 'Dallas' AND danh_gia_xep_hang >= 3.5
SELECT ten, dia_chi_day_du FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'Mexico' AND doanh_nghiep.thanh_pho = 'Dallas' AND doanh_nghiep.danh_gia_xep_hang >= 3.5
SELECT doanh_nghiep.id_doanh_nghiep, doanh_nghiep.ten, doanh_nghiep.dia_chi_day_du, doanh_nghiep.thanh_pho, doanh_nghiep.vi_do, doanh_nghiep.kinh_do FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE doanh_nghiep.thanh_pho = 'Dallas' AND loai_hinh.ten_loai_hinh = 'dịch vụ đỗ xe'
SELECT T1.ten FROM dbo.doanh_nghiep AS T1 JOIN dbo.loai_hinh AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep JOIN dbo.khu_vuc_lan_can AS T3 ON T1.id_doanh_nghiep = T3.id_doanh_nghiep WHERE T2.ten_loai_hinh = 'nhà hàng Ý' AND T3.ten_khu_pho_lan_can = 'Meadowood' AND T1.thanh_pho = 'Madison'
SELECT ten FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'Bar' AND doanh_nghiep.thanh_pho = 'Los Angeles' AND doanh_nghiep.so_luong_danh_gia >= 30 AND doanh_nghiep.danh_gia_xep_hang > 3
SELECT COUNT(*) FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE doanh_nghiep.thanh_pho = 'Edinburgh' AND loai_hinh.ten_loai_hinh = 'Ai Cập'
SELECT T1.id_nguoi_tieu_dung , T1.ten FROM nguoi_tieu_dung AS T1 JOIN danh_gia AS T2 ON T1.id_nguoi_tieu_dung = T2.id_nguoi_tieu_dung GROUP BY T1.id_nguoi_tieu_dung HAVING AVG(T2.danh_gia_xep_hang) < 3
SELECT T1.ten FROM doanh_nghiep AS T1 JOIN danh_gia AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep WHERE T2.thang = '4' GROUP BY T1.id_doanh_nghiep ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep GROUP BY doanh_nghiep.id_doanh_nghiep ORDER BY COUNT(*) DESC LIMIT 1
