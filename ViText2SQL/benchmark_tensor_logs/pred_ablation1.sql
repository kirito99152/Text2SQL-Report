SELECT tai_san.id_tai_san, tai_san.chi_tiet_tai_san FROM tai_san JOIN bo_phan_cua_tai_san ON tai_san.id_tai_san = bo_phan_cua_tai_san.id_tai_san LEFT JOIN nhat_ky_loi ON tai_san.id_tai_san = nhat_ky_loi.id_tai_san GROUP BY tai_san.id_tai_san HAVING COUNT(DISTINCT bo_phan_cua_tai_san.id_bo_phan) = 2 AND COUNT(DISTINCT nhat_ky_loi.id_muc_nhap_cua_nhat_ky_loi) < 2
SELECT hop_dong_bao_tri.id_hop_dong_bao_tri, COUNT(tai_san.id_tai_san) FROM hop_dong_bao_tri JOIN tai_san ON hop_dong_bao_tri.id_hop_dong_bao_tri = tai_san.id_hop_dong_bao_tri GROUP BY hop_dong_bao_tri.id_hop_dong_bao_tri
SELECT tai_san.id_cong_ty_cung_cap, COUNT(*) FROM tai_san GROUP BY tai_san.id_cong_ty_cung_cap
SELECT cong_ty_ben_thu_ba.id_cong_ty, cong_ty_ben_thu_ba.ten_cong_ty FROM cong_ty_ben_thu_ba JOIN hop_dong_bao_tri ON hop_dong_bao_tri.id_hop_dong_bao_tri_cua_cong_ty = cong_ty_ben_thu_ba.id_cong_ty GROUP BY cong_ty_ben_thu_ba.id_cong_ty HAVING COUNT(hop_dong_bao_tri.id_hop_dong_bao_tri) >= 2 UNION SELECT cong_ty_ben_thu_ba.id_cong_ty, cong_ty_ben_thu_ba.ten_cong_ty FROM cong_ty_ben_thu_ba JOIN ky_su_bao_tri ON ky_su_bao_tri.id_cong_ty = cong_ty_ben_thu_ba.id_cong_ty GROUP BY cong_ty_ben_thu_ba.id_cong_ty HAVING COUNT(ky_su_bao_tri.id_ky_su) >= 2 ORDER BY id_cong_ty
SELECT ten_nhan_vien, id_nhan_vien FROM nhan_vien WHERE id_nhan_vien IN (SELECT duoc_ghi_lai_boi_nhan_vien_co_id FROM nhat_ky_loi) AND id_nhan_vien NOT IN (SELECT id_nhan_vien_lien_lac FROM chuyen_tham_cua_ky_su)
SELECT ky_su_bao_tri.id_ky_su, ky_su_bao_tri.ten, ky_su_bao_tri.ho FROM ky_su_bao_tri JOIN chuyen_tham_cua_ky_su ON ky_su_bao_tri.id_ky_su = chuyen_tham_cua_ky_su.id_ky_su GROUP BY ky_su_bao_tri.id_ky_su ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.id_bo_phan, T1.ten_bo_phan FROM bo_phan AS T1 JOIN nhat_ky_cua_loi_bo_phan AS T2 ON T1.id_bo_phan = T2.id_bo_phan_bi_loi GROUP BY T1.id_bo_phan HAVING COUNT(*) > 2
SELECT ky_su_bao_tri.ten, ky_su_bao_tri.ho, ky_nang_cua_ky_su.id_ky_nang, ky_nang.mo_ta_ve_ky_nang FROM ky_su_bao_tri JOIN ky_nang_cua_ky_su ON ky_su_bao_tri.id_ky_su = ky_nang_cua_ky_su.id_ky_su JOIN ky_nang ON ky_nang_cua_ky_su.id_ky_nang = ky_nang.id_ky_nang
SELECT nhat_ky_cua_loi_bo_phan.id_muc_nhap_cua_nhat_ky_loi, loi_bo_phan.ten_viet_tat_cua_loi, loi_bo_phan.mo_ta_loi, ky_nang.mo_ta_ve_ky_nang FROM nhat_ky_cua_loi_bo_phan JOIN loi_bo_phan ON nhat_ky_cua_loi_bo_phan.id_bo_phan_bi_loi = loi_bo_phan.id_bo_phan JOIN ky_nang_can_de_sua_chua ON loi_bo_phan.id_bo_phan_bi_loi = ky_nang_can_de_sua_chua.id_bo_phan_bi_loi JOIN ky_nang ON ky_nang_can_de_sua_chua.id_ky_nang = ky_nang.id_ky_nang
SELECT bo_phan.ten_bo_phan, COUNT(*) AS so_luong_tai_san FROM bo_phan JOIN bo_phan_cua_tai_san ON bo_phan.id_bo_phan = bo_phan_cua_tai_san.id_bo_phan GROUP BY bo_phan.id_bo_phan ORDER BY COUNT(*) DESC
SELECT mo_ta_loi, tinh_trang_loi FROM loi_bo_phan JOIN nhat_ky_cua_loi_bo_phan ON loi_bo_phan.id_bo_phan_bi_loi = nhat_ky_cua_loi_bo_phan.id_bo_phan_bi_loi JOIN nhat_ky_loi ON nhat_ky_cua_loi_bo_phan.id_muc_nhap_cua_nhat_ky_loi = nhat_ky_loi.id_muc_nhap_cua_nhat_ky_loi
SELECT nhat_ky_loi.id_muc_nhap_cua_nhat_ky_loi, COUNT(*) AS so_luong_ghetam FROM nhat_ky_loi JOIN chuyen_tham_cua_ky_su ON nhat_ky_loi.id_muc_nhap_cua_nhat_ky_loi = chuyen_tham_cua_ky_su.id_muc_nhap_cua_nhat_ky_loi GROUP BY nhat_ky_loi.id_muc_nhap_cua_nhat_ky_loi ORDER BY COUNT(*) DESC LIMIT 1
SELECT ho FROM ky_su_bao_tri
SELECT tinh_trang_loi FROM chuyen_tham_cua_ky_su UNION SELECT tinh_trang_loi FROM nhat_ky_cua_loi_bo_phan
SELECT ten, ho FROM ky_su_bao_tri WHERE id_ky_su NOT IN (SELECT DISTINCT chuyen_tham_cua_ky_su.id_ky_su FROM chuyen_tham_cua_ky_su)
SELECT id_tai_san, chi_tiet_tai_san, thuong_hieu_tai_san, mau_ma_tai_san FROM tai_san
SELECT ngay_mua_tai_san FROM tai_san ORDER BY ngay_mua_tai_san ASC LIMIT 1
SELECT T1.id_bo_phan_bi_loi, T1.ten_viet_tat_cua_loi FROM loi_bo_phan AS T1 JOIN ky_nang_can_de_sua_chua AS T2 ON T1.id_bo_phan_bi_loi = T2.id_bo_phan_bi_loi GROUP BY T1.id_bo_phan_bi_loi ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_bo_phan FROM bo_phan ORDER BY (SELECT COUNT(*) FROM nhat_ky_cua_loi_bo_phan WHERE nhat_ky_cua_loi_bo_phan.id_bo_phan_bi_loi = bo_phan.id_bo_phan) ASC LIMIT 1
SELECT ky_su_bao_tri.id_ky_su, ky_su_bao_tri.ten, ky_su_bao_tri.ho FROM chuyen_tham_cua_ky_su JOIN ky_su_bao_tri ON chuyen_tham_cua_ky_su.id_ky_su = ky_su_bao_tri.id_ky_su GROUP BY ky_su_bao_tri.id_ky_su ORDER BY COUNT(*) ASC LIMIT 1
SELECT nhan_vien.ten_nhan_vien, ky_su_bao_tri.ten, ky_su_bao_tri.ho FROM nhat_ky_loi JOIN chuyen_tham_cua_ky_su ON nhat_ky_loi.id_muc_nhap_cua_nhat_ky_loi = chuyen_tham_cua_ky_su.id_muc_nhap_cua_nhat_ky_loi JOIN nhan_vien ON chuyen_tham_cua_ky_su.id_nhan_vien_lien_lac = nhan_vien.id_nhan_vien JOIN ky_su_bao_tri ON chuyen_tham_cua_ky_su.id_ky_su = ky_su_bao_tri.id_ky_su
SELECT nhat_ky_loi.id_muc_nhap_cua_nhat_ky_loi, nhat_ky_loi.mo_ta_ve_loi, nhat_ky_loi.thoi_gian_muc_nhap_cua_nhat_ky_loi FROM nhat_ky_loi JOIN nhat_ky_cua_loi_bo_phan ON nhat_ky_loi.id_muc_nhap_cua_nhat_ky_loi = nhat_ky_cua_loi_bo_phan.id_muc_nhap_cua_nhat_ky_loi JOIN loi_bo_phan ON nhat_ky_cua_loi_bo_phan.id_bo_phan_bi_loi = loi_bo_phan.id_bo_phan_bi_loi GROUP BY nhat_ky_loi.id_muc_nhap_cua_nhat_ky_loi ORDER BY COUNT(*) DESC LIMIT 1
SELECT ky_nang.id_ky_nang, ky_nang.mo_ta_ve_ky_nang FROM ky_nang JOIN ky_nang_can_de_sua_chua ON ky_nang.id_ky_nang = ky_nang_can_de_sua_chua.id_ky_nang GROUP BY ky_nang.id_ky_nang ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT mau_ma_tai_san FROM tai_san WHERE mau_ma_tai_san IS NOT NULL ORDER BY mau_ma_tai_san ASC
SELECT thuong_hieu_tai_san, mau_ma_tai_san, chi_tiet_tai_san FROM tai_san ORDER BY ngay_thanh_ly_tai_san ASC
SELECT id_bo_phan, so_tien_phai_tra FROM bo_phan ORDER BY CAST(so_tien_phai_tra AS REAL) ASC LIMIT 1
SELECT T1.ten_cong_ty FROM cong_ty_ben_thu_ba AS T1 JOIN hop_dong_bao_tri AS T2 ON T1.id_cong_ty = T2.id_hop_dong_bao_tri_cua_cong_ty ORDER BY T2.ngay_bat_dau_hop_dong ASC LIMIT 1
SELECT ten_cong_ty FROM cong_ty_ben_thu_ba JOIN hop_dong_bao_tri ON cong_ty_ben_thu_ba.id_cong_ty = hop_dong_bao_tri.id_hop_dong_bao_tri_cua_cong_ty ORDER BY ngay_ket_thuc_hop_dong DESC LIMIT 1
SELECT gioi_tinh FROM nhan_vien GROUP BY gioi_tinh ORDER BY COUNT(*) DESC LIMIT 1
SELECT nhan_vien.ten_nhan_vien, COUNT(*) FROM nhan_vien JOIN chuyen_tham_cua_ky_su ON nhan_vien.id_nhan_vien = chuyen_tham_cua_ky_su.id_nhan_vien_lien_lac GROUP BY nhan_vien.id_nhan_vien ORDER BY COUNT(*) DESC
SELECT mau_ma_tai_san FROM tai_san WHERE id_tai_san NOT IN (SELECT id_tai_san FROM nhat_ky_loi)
SELECT COUNT(*) FROM sach
SELECT tac_gia FROM sach ORDER BY tac_gia ASC
SELECT tieu_de FROM sach ORDER BY so_luong_phat_hanh ASC
SELECT sach.tieu_de FROM sach WHERE sach.tac_gia != 'Elaine Lee'
SELECT tieu_de, so_luong_phat_hanh FROM sach
SELECT an_pham.ngay_xuat_ban FROM an_pham ORDER BY an_pham.gia_ban DESC
SELECT nha_xuat_ban FROM an_pham WHERE gia_ban > 5000000 GROUP BY nha_xuat_ban ORDER BY nha_xuat_ban
SELECT nha_xuat_ban FROM an_pham WHERE gia_ban = (SELECT MAX(gia_ban) FROM an_pham)
SELECT ngay_xuat_ban FROM an_pham ORDER BY gia_ban ASC LIMIT 3
SELECT sach.tieu_de, an_pham.ngay_xuat_ban FROM sach JOIN an_pham ON sach.id_sach = an_pham.id_sach
SELECT tac_gia FROM sach JOIN an_pham ON sach.id_sach = an_pham.id_sach WHERE gia_ban > 4000000 GROUP BY sach.id_sach
SELECT tieu_de FROM sach JOIN an_pham ON sach.id_sach = an_pham.id_sach ORDER BY an_pham.gia_ban DESC
SELECT nha_xuat_ban FROM an_pham GROUP BY nha_xuat_ban HAVING COUNT(*) > 1
SELECT nha_xuat_ban, COUNT(*) FROM an_pham GROUP BY nha_xuat_ban ORDER BY COUNT(*) DESC
SELECT ngay_xuat_ban FROM an_pham GROUP BY ngay_xuat_ban ORDER BY COUNT(*) DESC LIMIT 1
SELECT tac_gia FROM sach GROUP BY tac_gia HAVING COUNT(*) > 1
SELECT tieu_de FROM sach WHERE id_sach NOT IN (SELECT id_sach FROM an_pham)
SELECT nha_xuat_ban FROM an_pham WHERE gia_ban > 10000000 UNION SELECT nha_xuat_ban FROM an_pham WHERE gia_ban < 5000000
SELECT COUNT(DISTINCT T1.ngay_xuat_ban) FROM an_pham AS T1
SELECT COUNT(DISTINCT T1.ngay_xuat_ban) FROM an_pham AS T1
SELECT gia_ban FROM an_pham WHERE nha_xuat_ban = 'Person' OR nha_xuat_ban = 'Wiley'
SELECT ten_bo_phan FROM bo_phan ORDER BY ngay_bat_dau_quan_ly
SELECT ten_nguoi_phu_thuoc FROM nguoi_phu_thuoc WHERE moi_quan_he = 'Vợ/chồng'
SELECT COUNT(*) FROM nguoi_phu_thuoc WHERE gioi_tinh = 'Nữ'
SELECT ten_bo_phan FROM bo_phan JOIN dia_diem_cua_bo_phan ON bo_phan.ma_so_bo_phan = dia_diem_cua_bo_phan.ma_so_bo_phan WHERE dia_diem_bo_phan = 'Houston'
SELECT ho, ten FROM nhan_vien WHERE luong > 30000 ORDER BY ho, ten
SELECT gioi_tinh, COUNT(*) FROM nhan_vien WHERE luong < 50000 GROUP BY gioi_tinh
SELECT ten, ho, dia_chi FROM nhan_vien ORDER BY ngay_sinh ASC
SELECT COUNT(*) FROM giao_vien
SELECT COUNT(*) FROM giao_vien
SELECT ten FROM giao_vien ORDER BY tuoi ASC
SELECT ten FROM giao_vien ORDER BY tuoi ASC
SELECT tuoi, que_quan FROM giao_vien
SELECT ten, tuoi, que_quan FROM giao_vien
SELECT ten FROM giao_vien WHERE que_quan != 'Khu đô thị Little Lever'
SELECT ten FROM giao_vien WHERE que_quan != 'Khu đô thị Little Lever'
SELECT ten FROM giao_vien WHERE tuoi = 32 OR tuoi = 33
SELECT ten FROM giao_vien WHERE tuoi = '32' OR tuoi = '33'
SELECT que_quan FROM giao_vien WHERE tuoi = (SELECT MIN(tuoi) FROM giao_vien) LIMIT 1
SELECT ten, que_quan FROM giao_vien ORDER BY tuoi ASC LIMIT 1
SELECT que_quan, COUNT(*) AS so_giao_vien FROM giao_vien GROUP BY que_quan ORDER BY COUNT(*) DESC
SELECT que_quan, COUNT(*) FROM giao_vien GROUP BY que_quan ORDER BY COUNT(*) DESC
SELECT que_quan FROM giao_vien GROUP BY que_quan ORDER BY COUNT(*) DESC LIMIT 1
SELECT que_quan FROM giao_vien GROUP BY que_quan ORDER BY COUNT(*) DESC LIMIT 1
SELECT que_quan FROM giao_vien GROUP BY que_quan HAVING COUNT(*) >= 2
SELECT que_quan FROM giao_vien GROUP BY que_quan HAVING COUNT(*) >= 2
SELECT giao_vien.ten, khoa_hoc.khoa_hoc FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien JOIN khoa_hoc ON sap_xep_khoa_hoc.id_khoa_hoc = khoa_hoc.id_khoa_hoc
SELECT giao_vien.ten, khoa_hoc.khoa_hoc FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien JOIN khoa_hoc ON sap_xep_khoa_hoc.id_khoa_hoc = khoa_hoc.id_khoa_hoc
SELECT giao_vien.ten, khoa_hoc.khoa_hoc FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien JOIN khoa_hoc ON sap_xep_khoa_hoc.id_khoa_hoc = khoa_hoc.id_khoa_hoc ORDER BY giao_vien.ten ASC
SELECT giao_vien.ten, khoa_hoc.khoa_hoc FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien JOIN khoa_hoc ON sap_xep_khoa_hoc.id_khoa_hoc = khoa_hoc.id_khoa_hoc ORDER BY giao_vien.ten ASC
SELECT ten FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien JOIN khoa_hoc ON sap_xep_khoa_hoc.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.khoa_hoc = 'Toán'
SELECT ten FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien JOIN khoa_hoc ON sap_xep_khoa_hoc.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.khoa_hoc = 'Toán' GROUP BY giao_vien.id_giao_vien ORDER BY ten ASC LIMIT 1000
SELECT giao_vien.ten, COUNT(*) FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien GROUP BY giao_vien.id_giao_vien ORDER BY COUNT(*) DESC LIMIT 10
SELECT giao_vien.ten, COUNT(sap_xep_khoa_hoc.id_giao_vien) AS so_khoa_hoc FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien GROUP BY giao_vien.id_giao_vien ORDER BY COUNT(sap_xep_khoa_hoc.id_giao_vien) DESC LIMIT 10
SELECT ten FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien GROUP BY giao_vien.id_giao_vien HAVING COUNT(*) >= 2
SELECT giao_vien.ten FROM giao_vien JOIN sap_xep_khoa_hoc ON giao_vien.id_giao_vien = sap_xep_khoa_hoc.id_giao_vien GROUP BY giao_vien.id_giao_vien HAVING COUNT(*) >= 2
SELECT ten FROM giao_vien WHERE id_giao_vien NOT IN (SELECT id_giao_vien FROM sap_xep_khoa_hoc)
SELECT ten FROM giao_vien WHERE id_giao_vien NOT IN (SELECT id_giao_vien FROM sap_xep_khoa_hoc)
SELECT COUNT(*) FROM thanh_vien
SELECT ten FROM thanh_vien ORDER BY ten ASC
SELECT ten, quoc_gia FROM thanh_vien
SELECT ten FROM thanh_vien WHERE quoc_gia = 'Hoa Kỳ' OR quoc_gia = 'Canada'
SELECT quoc_gia, COUNT(*) FROM thanh_vien GROUP BY quoc_gia ORDER BY COUNT(*) DESC
SELECT quoc_gia FROM thanh_vien GROUP BY quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_gia FROM thanh_vien GROUP BY quoc_gia HAVING COUNT(*) > 2
SELECT ten_lanh_dao, dia_diem_truong_dai_hoc FROM truong_dai_hoc
SELECT thanh_vien.ten, truong_dai_hoc.ten FROM thanh_vien JOIN truong_dai_hoc ON thanh_vien.id_dai_hoc = truong_dai_hoc.id_dai_hoc
SELECT thanh_vien.ten, truong_dai_hoc.dia_diem_truong_dai_hoc FROM thanh_vien JOIN truong_dai_hoc ON thanh_vien.id_dai_hoc = truong_dai_hoc.id_dai_hoc ORDER BY thanh_vien.ten ASC
SELECT truong_dai_hoc.ten_lanh_dao FROM truong_dai_hoc JOIN thanh_vien ON truong_dai_hoc.id_dai_hoc = thanh_vien.id_dai_hoc WHERE thanh_vien.quoc_gia = 'Canada'
SELECT thanh_vien.ten, vong.chu_de_trang_tri FROM thanh_vien JOIN vong ON thanh_vien.id_thanh_vien = vong.id_thanh_vien
SELECT ten FROM vong JOIN thanh_vien ON vong.id_thanh_vien = thanh_vien.id_thanh_vien WHERE xep_hang_tung_vong > 3 GROUP BY thanh_vien.id_thanh_vien
SELECT thanh_vien.ten FROM thanh_vien JOIN vong ON thanh_vien.id_thanh_vien = vong.id_thanh_vien ORDER BY vong.xep_hang_tung_vong ASC
SELECT ten FROM thanh_vien WHERE id_thanh_vien NOT IN (SELECT id_thanh_vien FROM vong)
SELECT COUNT(*) FROM cuoc_bau_cu
SELECT so_luong_phieu_bau FROM cuoc_bau_cu ORDER BY so_luong_phieu_bau DESC
SELECT ngay, ti_le_phieu_bau FROM cuoc_bau_cu
SELECT MIN(ti_le_phieu_bau), MAX(ti_le_phieu_bau) FROM cuoc_bau_cu JOIN dai_dien ON cuoc_bau_cu.id_dai_dien = dai_dien.id_dai_dien WHERE dai_dien.ten = 'Nguyen Van A' AND cuoc_bau_cu.ngay BETWEEN '2020-01-01' AND '2025-12-31' ORDER BY cuoc_bau_cu.ngay DESC LIMIT 1
SELECT ten, dang FROM dai_dien
SELECT ten FROM dai_dien WHERE dang != 'Đảng Cộng hoà'
SELECT tuoi_tho FROM dai_dien WHERE tieu_bang = 'New York' OR tieu_bang = 'Indiana'
SELECT dai_dien.ten, cuoc_bau_cu.ngay FROM cuoc_bau_cu JOIN dai_dien ON cuoc_bau_cu.id_dai_dien = dai_dien.id_dai_dien
SELECT T1.ten FROM dai_dien AS T1 JOIN cuoc_bau_cu AS T2 ON T1.id_dai_dien = T2.id_dai_dien WHERE T2.so_luong_phieu_bau > 10000 ORDER BY T2.so_luong_phieu_bau DESC LIMIT 10
SELECT dai_dien.ten FROM dai_dien JOIN cuoc_bau_cu ON dai_dien.id_dai_dien = cuoc_bau_cu.id_dai_dien ORDER BY cuoc_bau_cu.so_luong_phieu_bau DESC
SELECT dai_dien.dang FROM cuoc_bau_cu JOIN dai_dien ON cuoc_bau_cu.id_dai_dien = dai_dien.id_dai_dien ORDER BY cuoc_bau_cu.so_luong_phieu_bau ASC LIMIT 1
SELECT dai_dien.tuoi_tho, cuoc_bau_cu.ti_le_phieu_bau FROM dai_dien JOIN cuoc_bau_cu ON dai_dien.id_dai_dien = cuoc_bau_cu.id_dai_dien ORDER BY cuoc_bau_cu.ti_le_phieu_bau DESC
SELECT AVG(cuoc_bau_cu.so_luong_phieu_bau) FROM cuoc_bau_cu JOIN dai_dien ON cuoc_bau_cu.id_dai_dien = dai_dien.id_dai_dien WHERE dai_dien.dang = 'Cộng hoà'
SELECT dang, COUNT(*) FROM dai_dien GROUP BY dang ORDER BY COUNT(*) DESC
SELECT dai_dien.dang, COUNT(*) AS count FROM dai_dien JOIN cuoc_bau_cu ON dai_dien.id_dai_dien = cuoc_bau_cu.id_dai_dien GROUP BY dai_dien.dang ORDER BY count DESC LIMIT 1
SELECT dang FROM dai_dien GROUP BY dang HAVING COUNT(*) >= 3
SELECT ten FROM dai_dien GROUP BY id_dai_dien HAVING COUNT(*) >= 2
SELECT ten FROM dai_dien WHERE id_dai_dien NOT IN (SELECT id_dai_dien FROM cuoc_bau_cu)
SELECT dang FROM dai_dien WHERE tieu_bang = 'New York' INTERSECT SELECT dang FROM dai_dien WHERE tieu_bang = 'Pennsylvania'
SELECT COUNT(DISTINCT dang) FROM dai_dien
SELECT COUNT(*) FROM quoc_gia
SELECT COUNT(*) FROM quoc_gia
SELECT ten_quoc_gia, thu_do FROM quoc_gia
SELECT ten_quoc_gia, thu_do FROM quoc_gia
SELECT ngon_ngu_ban_dia_chinh_thuc FROM quoc_gia WHERE ngon_ngu_ban_dia_chinh_thuc LIKE '% tiếng Anh %'
SELECT ngon_ngu_ban_dia_chinh_thuc FROM quoc_gia WHERE ngon_ngu_ban_dia_chinh_thuc LIKE '%tieng Anh%'
SELECT vi_tri FROM tran_dau_trong_mua_giai GROUP BY vi_tri ORDER BY vi_tri ASC
SELECT DISTINCT vi_tri FROM tran_dau_trong_mua_giai ORDER BY vi_tri ASC
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.id_cau_thu = tran_dau_trong_mua_giai.id_cau_thu WHERE tran_dau_trong_mua_giai.truong_dai_hoc = 'UCLA'
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.id_cau_thu = tran_dau_trong_mua_giai.cau_thu WHERE truong_dai_hoc = 'UCLA'
SELECT vi_tri FROM tran_dau_trong_mua_giai WHERE truong_dai_hoc = 'UCLA' OR truong_dai_hoc = 'Duke'
SELECT T1.cau_thu, T1.vi_tri FROM tran_dau_trong_mua_giai AS T1 JOIN cau_thu AS T2 ON T1.cau_thu = T2.cau_thu WHERE T1.truong_dai_hoc = 'UCLA' OR T1.truong_dai_hoc = 'Duke' GROUP BY T1.cau_thu HAVING COUNT(DISTINCT T1.vi_tri) > 1
SELECT ma_so_tuyen_chon_tan_binh, mua_tuyen_chon FROM tran_dau_trong_mua_giai WHERE vi_tri = 'hậu vệ'
SELECT tran_dau_trong_mua_giai.ma_so_tuyen_chon_tan_binh, tran_dau_trong_mua_giai.mua_tuyen_chon FROM tran_dau_trong_mua_giai WHERE vi_tri = 'hậu vệ'
SELECT COUNT(DISTINCT tran_dau_trong_mua_giai.doi) FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi
SELECT COUNT(DISTINCT tran_dau_trong_mua_giai.doi) FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi
SELECT cau_thu.cau_thu, cau_thu.so_nam_da_choi FROM cau_thu GROUP BY cau_thu ORDER BY cau_thu
SELECT cau_thu.cau_thu, cau_thu.so_nam_da_choi FROM cau_thu GROUP BY cau_thu.cau_thu ORDER BY cau_thu.cau_thu ASC
SELECT ten FROM doi
SELECT ten FROM doi
SELECT mua_giai, cau_thu, ten_quoc_gia FROM tran_dau_trong_mua_giai JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia
SELECT cau_thu.cau_thu, tran_dau_trong_mua_giai.mua_giai, quoc_gia.ten_quoc_gia FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.ten_quoc_gia = 'Indonesia' GROUP BY cau_thu.cau_thu
SELECT cau_thu.cau_thu FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.cau_thu = tran_dau_trong_mua_giai.cau_thu JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.ten_quoc_gia = 'Indonesia' GROUP BY cau_thu.cau_thu ORDER BY cau_thu.cau_thu ASC
SELECT vi_tri FROM tran_dau_trong_mua_giai JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.thu_do = 'Dublin'
SELECT vi_tri FROM tran_dau_trong_mua_giai JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.thu_do = 'Dublin' GROUP BY vi_tri
SELECT quoc_gia.ngon_ngu_ban_dia_chinh_thuc FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia JOIN cau_thu ON tran_dau_trong_mua_giai.cau_thu = cau_thu.cau_thu WHERE truong_dai_hoc = 'Maryland' OR truong_dai_hoc = 'Duke' GROUP BY quoc_gia.id_quoc_gia
SELECT quoc_gia.ngon_ngu_ban_dia_chinh_thuc FROM tran_dau_trong_mua_giai JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE tran_dau_trong_mua_giai.truong_dai_hoc IN ('Maryland', 'Duke') GROUP BY quoc_gia.ngon_ngu_ban_dia_chinh_thuc HAVING COUNT(DISTINCT tran_dau_trong_mua_giai.quoc_gia) > 1
SELECT COUNT(DISTINCT quoc_gia.ngon_ngu_ban_dia_chinh_thuc) FROM tran_dau_trong_mua_giai JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE tran_dau_trong_mua_giai.vi_tri = 'hậu vệ'
SELECT COUNT(DISTINCT quoc_gia.ngon_ngu_ban_dia_chinh_thuc) FROM tran_dau_trong_mua_giai JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia WHERE tran_dau_trong_mua_giai.vi_tri = 'hậu vệ'
SELECT tran_dau_trong_mua_giai.mua_giai, tran_dau_trong_mua_giai.cau_thu, doi.ten FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi
SELECT cau_thu.cau_thu, tran_dau_trong_mua_giai.mua_giai, tran_dau_trong_mua_giai.doi FROM cau_thu JOIN tran_dau_trong_mua_giai ON cau_thu.id_cau_thu = tran_dau_trong_mua_giai.cau_thu GROUP BY cau_thu.cau_thu, tran_dau_trong_mua_giai.mua_giai, tran_dau_trong_mua_giai.doi ORDER BY cau_thu.cau_thu, tran_dau_trong_mua_giai.mua_giai
SELECT tran_dau_trong_mua_giai.vi_tri FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi WHERE doi.ten = 'Ryley Goldner'
SELECT tran_dau_trong_mua_giai.vi_tri FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi JOIN cau_thu ON tran_dau_trong_mua_giai.cau_thu = cau_thu.cau_thu WHERE cau_thu.cau_thu = 'Ryley Goldner'
SELECT COUNT(DISTINCT truong_dai_hoc) FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi WHERE doi.ten = 'Columbus Crew'
SELECT COUNT(DISTINCT truong_dai_hoc) FROM tran_dau_trong_mua_giai JOIN doi ON tran_dau_trong_mua_giai.doi = doi.id_doi WHERE doi.ten = 'Columbus Crew'
SELECT cau_thu.cau_thu, cau_thu.so_nam_da_choi FROM cau_thu JOIN doi ON cau_thu.doi = doi.id_doi WHERE doi.ten = 'Columbus Crew'
SELECT cau_thu.cau_thu, cau_thu.so_nam_da_choi FROM cau_thu JOIN doi ON cau_thu.doi = doi.id_doi WHERE doi.ten = 'Columbus Crew'
SELECT vi_tri, COUNT(*) FROM tran_dau_trong_mua_giai GROUP BY vi_tri ORDER BY COUNT(*) DESC
SELECT vi_tri, COUNT(*) FROM tran_dau_trong_mua_giai GROUP BY vi_tri ORDER BY COUNT(*) DESC
SELECT quoc_gia.ten_quoc_gia, COUNT(*) AS so_luong_cau_thu FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia GROUP BY quoc_gia.id_quoc_gia ORDER BY COUNT(*) DESC
SELECT quoc_gia.id_quoc_gia, COUNT(*) FROM tran_dau_trong_mua_giai JOIN quoc_gia ON tran_dau_trong_mua_giai.quoc_gia = quoc_gia.id_quoc_gia GROUP BY quoc_gia.id_quoc_gia ORDER BY COUNT(*) DESC
SELECT T1.cau_thu FROM tran_dau_trong_mua_giai AS T1 JOIN cau_thu AS T2 ON T1.cau_thu = T2.cau_thu ORDER BY T1.truong_dai_hoc ASC
SELECT cau_thu.cau_thu FROM tran_dau_trong_mua_giai JOIN cau_thu ON tran_dau_trong_mua_giai.cau_thu = cau_thu.cau_thu ORDER BY tran_dau_trong_mua_giai.truong_dai_hoc ASC
SELECT vi_tri FROM tran_dau_trong_mua_giai GROUP BY vi_tri ORDER BY COUNT(*) DESC LIMIT 1
SELECT vi_tri, COUNT(*) FROM tran_dau_trong_mua_giai GROUP BY vi_tri ORDER BY COUNT(*) DESC LIMIT 1
SELECT truong_dai_hoc, COUNT(*) AS so_luong_cau_thu FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc ORDER BY COUNT(*) DESC LIMIT 3
SELECT truong_dai_hoc, COUNT(*) AS so_luong_cau_thu FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc ORDER BY so_luong_cau_thu DESC LIMIT 3
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc HAVING COUNT(cau_thu) >= 2
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc HAVING COUNT(cau_thu) >= 2
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc HAVING COUNT(*) >= 2 ORDER BY truong_dai_hoc DESC
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai GROUP BY truong_dai_hoc HAVING COUNT(cau_thu) >= 2 ORDER BY truong_dai_hoc DESC
SELECT ten FROM doi WHERE id_doi NOT IN (SELECT DISTINCT doi FROM tran_dau_trong_mua_giai)
SELECT ten FROM doi WHERE id_doi NOT IN (SELECT DISTINCT doi FROM tran_dau_trong_mua_giai)
SELECT quoc_gia.ten_quoc_gia FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia WHERE tran_dau_trong_mua_giai.vi_tri = 'tiền đạo' INTERSECT SELECT quoc_gia.ten_quoc_gia FROM quoc_gia JOIN tran_dau_trong_mua_giai ON quoc_gia.id_quoc_gia = tran_dau_trong_mua_giai.quoc_gia WHERE tran_dau_trong_mua_giai.vi_tri = 'hậu vệ'
SELECT T1.ten_quoc_gia FROM quoc_gia AS T1 JOIN tran_dau_trong_mua_giai AS T2 ON T1.id_quoc_gia = T2.quoc_gia WHERE T2.vi_tri = 'tiền đạo' OR T2.vi_tri = 'hậu vệ' GROUP BY T1.id_quoc_gia HAVING COUNT(DISTINCT T2.vi_tri) > 1
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai WHERE vi_tri = 'tiền vệ' INTERSECT SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai WHERE vi_tri = 'hậu vệ'
SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai WHERE vi_tri = 'tiền vệ' INTERSECT SELECT truong_dai_hoc FROM tran_dau_trong_mua_giai WHERE vi_tri = 'hậu vệ'
SELECT COUNT(DISTINCT toi_pham.id_ca_nhan) FROM toi_pham JOIN ca_nhan ON toi_pham.id_ca_nhan = ca_nhan.id_ca_nhan
SELECT toi_pham.id_ca_nhan, toi_pham.so_nguoi_bi_giet FROM toi_pham ORDER BY toi_pham.so_nguoi_bi_giet DESC
SELECT toi_pham.so_nguoi_bi_thuong FROM toi_pham ORDER BY toi_pham.so_nguoi_bi_thuong ASC
SELECT SUM(so_nguoi_bi_thuong) / COUNT(*) FROM toi_pham
SELECT dia_diem FROM toi_pham ORDER BY so_nguoi_bi_giet DESC LIMIT 1
SELECT ten FROM ca_nhan ORDER BY chieu_cao ASC
SELECT T1.ten FROM toi_pham JOIN ca_nhan AS T1 ON toi_pham.id_ca_nhan = T1.id_ca_nhan
SELECT ten FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan WHERE quoc_gia != 'Trung Quoc'
SELECT T1.ten FROM ca_nhan AS T1 JOIN toi_pham AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan ORDER BY T1.can_nang DESC LIMIT 1
SELECT COUNT(*) FROM toi_pham JOIN ca_nhan ON toi_pham.id_ca_nhan = ca_nhan.id_ca_nhan WHERE ca_nhan.chieu_cao > 184 AND toi_pham.so_nguoi_bi_giet > 0
SELECT T1.ten FROM toi_pham JOIN ca_nhan AS T1 ON toi_pham.id_ca_nhan = T1.id_ca_nhan WHERE toi_pham.quoc_gia = 'Trung Quốc' OR toi_pham.quoc_gia = 'Nhật Bản'
SELECT ca_nhan.chieu_cao, toi_pham.so_nguoi_bi_thuong FROM ca_nhan JOIN toi_pham ON ca_nhan.id_ca_nhan = toi_pham.id_ca_nhan ORDER BY toi_pham.so_nguoi_bi_thuong DESC
SELECT quoc_gia, COUNT(*) AS so_khach FROM toi_pham GROUP BY quoc_gia ORDER BY COUNT(*) DESC
SELECT quoc_gia FROM toi_pham GROUP BY quoc_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT quoc_gia FROM toi_pham GROUP BY quoc_gia HAVING COUNT(*) >= 2
SELECT T1.ten FROM toi_pham JOIN ca_nhan AS T1 ON toi_pham.id_ca_nhan = T1.id_ca_nhan ORDER BY nam DESC
SELECT ten FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM toi_pham)
SELECT quoc_gia FROM toi_pham WHERE so_nguoi_bi_thuong > 50 INTERSECT SELECT quoc_gia FROM toi_pham WHERE so_nguoi_bi_thuong < 20
SELECT COUNT(DISTINCT dia_diem) FROM toi_pham
SELECT ngay FROM toi_pham JOIN ca_nhan ON toi_pham.id_ca_nhan = ca_nhan.id_ca_nhan ORDER BY ca_nhan.chieu_cao DESC LIMIT 1
SELECT nam FROM toi_pham ORDER BY ngay DESC LIMIT 1
SELECT nha_ga.chinh_quyen_dia_phuong, nha_ga.dich_vu FROM nha_ga
SELECT so_hieu_tau, ten FROM tau_hoa ORDER BY thoi_gian ASC
SELECT so_hieu_tau, thoi_gian FROM tau_hoa WHERE diem_den = 'Chennai' ORDER BY thoi_gian ASC
SELECT COUNT(*) FROM tau_hoa WHERE ten LIKE '%Tốc hành%'
SELECT so_hieu_tau, thoi_gian FROM tau_hoa WHERE diem_khoi_hanh = 'Chennai' AND diem_den = 'Guruvayur'
SELECT diem_khoi_hanh, COUNT(*) FROM tau_hoa GROUP BY diem_khoi_hanh ORDER BY COUNT(*) DESC
SELECT tau_hoa.ten FROM tau_hoa JOIN lo_trinh ON tau_hoa.id = lo_trinh.id_tau GROUP BY tau_hoa.id ORDER BY COUNT(lo_trinh.id_nha_ga) DESC LIMIT 1
SELECT COUNT(*) AS count_tau, nha_ga.ten_mang_luoi, nha_ga.dich_vu FROM tau_hoa JOIN lo_trinh ON tau_hoa.id = lo_trinh.id_tau JOIN nha_ga ON lo_trinh.id_nha_ga = nha_ga.id GROUP BY nha_ga.id ORDER BY count_tau DESC LIMIT 10
SELECT AVG(nhiet_do_cao) AS nhiet_do_cao_trung_binh FROM thoi_tiet_hang_tuan GROUP BY ngay_trong_tuan ORDER BY ngay_trong_tuan ASC LIMIT 7
SELECT thoi_tiet_hang_tuan.nhiet_do_thap, thoi_tiet_hang_tuan.luong_mua FROM thoi_tiet_hang_tuan JOIN nha_ga ON thoi_tiet_hang_tuan.id_nha_ga = nha_ga.id WHERE nha_ga.ten_mang_luoi = 'Amersham' ORDER BY thoi_tiet_hang_tuan.nhiet_do_thap DESC LIMIT 1
SELECT tau_hoa.ten, tau_hoa.thoi_gian FROM tau_hoa JOIN lo_trinh ON tau_hoa.id = lo_trinh.id_tau JOIN nha_ga ON lo_trinh.id_nha_ga = nha_ga.id WHERE nha_ga.chinh_quyen_dia_phuong = 'Chiltern'
SELECT COUNT(DISTINCT dich_vu) FROM nha_ga
SELECT thoi_tiet_hang_tuan.id_nha_ga, nha_ga.chinh_quyen_dia_phuong FROM thoi_tiet_hang_tuan JOIN nha_ga ON thoi_tiet_hang_tuan.id_nha_ga = nha_ga.id ORDER BY AVG(thoi_tiet_hang_tuan.nhiet_do_cao) DESC LIMIT 1
SELECT thoi_tiet_hang_tuan.id_nha_ga, nha_ga.chinh_quyen_dia_phuong FROM thoi_tiet_hang_tuan JOIN nha_ga ON thoi_tiet_hang_tuan.id_nha_ga = nha_ga.id WHERE thoi_tiet_hang_tuan.luong_mua > 50 ORDER BY thoi_tiet_hang_tuan.luong_mua DESC LIMIT 1
SELECT MIN(nhiet_do_thap), MAX(toc_do_gio_mph) FROM thoi_tiet_hang_tuan
SELECT diem_khoi_hanh FROM tau_hoa GROUP BY diem_khoi_hanh HAVING COUNT(*) > 1
SELECT COUNT(*) FROM nha_tho WHERE ngay_mo_cua < 1850
SELECT ten AS ten_nha_tho, ngay_mo_cua, duoc_to_chuc_boi FROM nha_tho
SELECT ten AS ten_nha_tho FROM nha_tho ORDER BY ngay_mo_cua DESC
SELECT ngay_mo_cua FROM nha_tho GROUP BY ngay_mo_cua HAVING COUNT(*) >= 2
SELECT nha_tho.duoc_to_chuc_boi, nha_tho.ten FROM nha_tho WHERE nha_tho.ngay_mo_cua BETWEEN 1830 AND 1840
SELECT ngay_mo_cua, COUNT(*) FROM nha_tho GROUP BY ngay_mo_cua ORDER BY ngay_mo_cua
SELECT ten, ngay_mo_cua FROM nha_tho ORDER BY ngay_mo_cua DESC LIMIT 3
SELECT COUNT(*) FROM ca_nhan WHERE la_nam_hay_nu = 'nu' AND tuoi > 30
SELECT quoc_gia FROM ca_nhan WHERE tuoi > 30 GROUP BY quoc_gia HAVING COUNT(*) > 0 INTERSECT SELECT quoc_gia FROM ca_nhan WHERE tuoi < 25 GROUP BY quoc_gia HAVING COUNT(*) > 0
SELECT MIN(tuoi), MAX(tuoi), AVG(tuoi) FROM ca_nhan
SELECT ten, quoc_gia FROM ca_nhan WHERE tuoi < (SELECT AVG(tuoi) FROM ca_nhan)
SELECT ca_nhan.ten AS ten_nam, ca_nhan2.ten AS ten_nu FROM le_cuoi JOIN ca_nhan ON le_cuoi.id_nam = ca_nhan.id_ca_nhan JOIN ca_nhan AS ca_nhan2 ON le_cuoi.id_nu = ca_nhan2.id_ca_nhan WHERE le_cuoi.ngay_mo_cua > 2014 UNION SELECT ca_nhan.ten AS ten_nu, ca_nhan2.ten AS ten_nam FROM le_cuoi JOIN ca_nhan ON le_cuoi.id_nu = ca_nhan.id_ca_nhan JOIN ca_nhan AS ca_nhan2 ON le_cuoi.id_nam = ca_nhan2.id_ca_nhan WHERE le_cuoi.ngay_mo_cua > 2014
SELECT ten, tuoi FROM ca_nhan WHERE la_nam_hay_nu = 'nam' AND id_ca_nhan NOT IN (SELECT id_nam FROM le_cuoi UNION SELECT id_nu FROM le_cuoi)
SELECT nha_tho.ten FROM nha_tho JOIN le_cuoi ON nha_tho.id_nha_tho = le_cuoi.id_nha_tho WHERE le_cuoi.ngay_mo_cua != 2015 EXCEPT SELECT nha_tho.ten FROM nha_tho JOIN le_cuoi ON nha_tho.id_nha_tho = le_cuoi.id_nha_tho WHERE le_cuoi.ngay_mo_cua = 2015
SELECT nha_tho.ten FROM nha_tho JOIN le_cuoi ON nha_tho.id_nha_tho = le_cuoi.id_nha_tho GROUP BY nha_tho.id_nha_tho HAVING COUNT(*) >= 2
SELECT ca_nhan.ten FROM ca_nhan JOIN le_cuoi ON ca_nhan.id_ca_nhan = le_cuoi.id_nu JOIN nha_tho ON le_cuoi.id_nha_tho = nha_tho.id_nha_tho WHERE ca_nhan.quoc_gia = 'Canada' AND nha_tho.ngay_mo_cua BETWEEN 20160101 AND 20161231 AND ca_nhan.la_nam_hay_nu = 'nữ'
SELECT COUNT(*) FROM le_cuoi WHERE id_nha_tho IN (SELECT id_nha_tho FROM nha_tho WHERE ngay_mo_cua BETWEEN 20160101 AND 20161231)
SELECT nha_tho.ten FROM nha_tho JOIN le_cuoi ON le_cuoi.id_nha_tho = nha_tho.id_nha_tho JOIN ca_nhan ON ca_nhan.id_ca_nhan = le_cuoi.id_nam OR ca_nhan.id_ca_nhan = le_cuoi.id_nu WHERE ca_nhan.tuoi > 30 GROUP BY nha_tho.id_nha_tho HAVING COUNT(DISTINCT ca_nhan.id_ca_nhan) = (SELECT COUNT(*) FROM ca_nhan)
SELECT quoc_gia, COUNT(*) FROM ca_nhan GROUP BY quoc_gia ORDER BY COUNT(*) DESC
SELECT COUNT(DISTINCT nha_tho.id_nha_tho) FROM nha_tho JOIN le_cuoi ON nha_tho.id_nha_tho = le_cuoi.id_nha_tho WHERE le_cuoi.ngay_mo_cua BETWEEN 20160101 AND 20161231
SELECT COUNT(*) FROM giang_vien
SELECT COUNT(*) FROM giang_vien
SELECT DISTINCT ngach FROM giang_vien
SELECT ngach FROM giang_vien GROUP BY ngach
SELECT DISTINCT toa_nha FROM giang_vien WHERE ngach LIKE '%Khoa%'
SELECT giang_vien.toa_nha FROM giang_vien WHERE giang_vien.ngach LIKE '%Khoa%' GROUP BY giang_vien.toa_nha HAVING COUNT(*) > 0
SELECT ho, ten, ngach FROM giang_vien
SELECT ho, ten, ngach FROM giang_vien
SELECT ho, ten, so_dien_thoai FROM giang_vien WHERE gioi_tinh = 'Nữ'
SELECT ho, ten, so_dien_thoai FROM giang_vien WHERE gioi_tinh = 'Nữ'
SELECT id_giang_vien FROM giang_vien WHERE gioi_tinh = 'nam'
SELECT id_giang_vien FROM giang_vien WHERE gioi_tinh = 'nam'
SELECT COUNT(*) FROM giang_vien WHERE gioi_tinh='Nữ' AND ngach='Giáo sư'
SELECT COUNT(*) FROM giang_vien WHERE gioi_tinh='Nữ' AND ngach='Giáo sư'
SELECT so_dien_thoai, so_phong, toa_nha FROM giang_vien WHERE ho='Prince' AND ten='Jerry'
SELECT so_phong, toa_nha, so_dien_thoai FROM giang_vien AS T1 WHERE ho='Prince' AND ten='Jerry'
SELECT COUNT(*) FROM giang_vien WHERE toa_nha = 'NEB' AND ngach = 'Giáo sư'
SELECT COUNT(*) FROM giang_vien WHERE ngach = 'Professor' AND toa_nha = 'NEB'
SELECT giang_vien.ho, giang_vien.ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong LIKE '%dạy học%' ORDER BY giang_vien.ho ASC LIMIT 1000
SELECT toa_nha, COUNT(*) FROM giang_vien GROUP BY toa_nha ORDER BY COUNT(*) DESC
SELECT giang_vien.toa_nha AS ten_toa_nha, COUNT(*) AS so_luong_giang_vien FROM giang_vien GROUP BY giang_vien.toa_nha ORDER BY COUNT(*) DESC
SELECT toa_nha, COUNT(*) AS so_luong_giang_vien FROM giang_vien GROUP BY toa_nha ORDER BY so_luong_giang_vien DESC LIMIT 1
SELECT giang_vien.toa_nha FROM giang_vien GROUP BY giang_vien.toa_nha ORDER BY COUNT(*) DESC LIMIT 1
SELECT toa_nha FROM giang_vien GROUP BY toa_nha HAVING COUNT(*) >= 10
SELECT toa_nha FROM giang_vien GROUP BY toa_nha HAVING COUNT(*) >= 10
SELECT ngach, COUNT(*) AS count FROM giang_vien GROUP BY ngach ORDER BY count DESC
SELECT ngach, COUNT(*) AS count FROM giang_vien GROUP BY ngach ORDER BY count DESC
SELECT giang_vien.ngach, SUM(CASE WHEN giang_vien.gioi_tinh = 'Nam' THEN 1 ELSE 0 END) AS nam, SUM(CASE WHEN giang_vien.gioi_tinh = 'Nu' THEN 1 ELSE 0 END) AS nu FROM giang_vien GROUP BY giang_vien.ngach
SELECT ngach, COUNT(*) AS so_luong FROM giang_vien GROUP BY ngach, gioi_tinh ORDER BY ngach
SELECT ngach FROM giang_vien GROUP BY ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT ngach FROM giang_vien GROUP BY ngach ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM giang_vien WHERE ngach = 'Trợ lý giáo sư' GROUP BY gioi_tinh
SELECT COUNT(*) AS nam FROM giang_vien WHERE gioi_tinh='Nam' AND ngach='Tru ly giao su' UNION SELECT COUNT(*) AS nu FROM giang_vien WHERE gioi_tinh='Nu' AND ngach='Tru ly giao su'
SELECT ho, ten FROM giang_vien WHERE id_giang_vien = (SELECT co_van FROM sinh_vien WHERE ho = 'Smith' AND ten = 'Linda')
SELECT ho, ten FROM sinh_vien WHERE id_sinh_vien = (SELECT co_van FROM sinh_vien WHERE ho = 'Smith' AND ten = 'Linda')
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien WHERE giang_vien.ngach = 'Giáo sư'
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien WHERE giang_vien.ngach = 'Giáo sư'
SELECT sinh_vien.ho, sinh_vien.ten FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien JOIN hoat_dong ON tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong JOIN giang_vien_tham_gia_vao ON hoat_dong.id_hoat_dong = giang_vien_tham_gia_vao.id_hoat_dong JOIN giang_vien ON giang_vien_tham_gia_vao.id_giang_vien = giang_vien.id_giang_vien WHERE giang_vien.ho = 'Goodrich' AND giang_vien.ten = 'Micheal'
SELECT sinh_vien.ten, sinh_vien.ho FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien JOIN hoat_dong ON tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong JOIN giang_vien_tham_gia_vao ON hoat_dong.id_hoat_dong = giang_vien_tham_gia_vao.id_hoat_dong JOIN giang_vien ON giang_vien_tham_gia_vao.id_giang_vien = giang_vien.id_giang_vien WHERE giang_vien.ho = 'Goodrich' AND giang_vien.ten = 'Micheal'
SELECT giang_vien.id_giang_vien, COUNT(tham_gia_vao.id_sinh_vien) AS so_luong_sinh_vien FROM giang_vien LEFT JOIN tham_gia_vao ON giang_vien.id_giang_vien = tham_gia_vao.id_giang_vien GROUP BY giang_vien.id_giang_vien
SELECT giang_vien.id_giang_vien, COUNT(sinh_vien.id_sinh_vien) FROM giang_vien JOIN sinh_vien ON giang_vien.id_giang_vien = sinh_vien.co_van GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(sinh_vien.id_sinh_vien) DESC
SELECT giang_vien.ngach, COUNT(sinh_vien.id_sinh_vien) FROM giang_vien JOIN sinh_vien ON giang_vien.id_giang_vien = sinh_vien.co_van GROUP BY giang_vien.ngach ORDER BY COUNT(sinh_vien.id_sinh_vien) DESC
SELECT ngach, COUNT(*) AS so_sinh_vien FROM sinh_vien JOIN giang_vien ON sinh_vien.co_van = giang_vien.id_giang_vien GROUP BY ngach
SELECT giang_vien.ho, giang_vien.ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT giang_vien.ho, giang_vien.ten FROM giang_vien JOIN sinh_vien ON sinh_vien.co_van = giang_vien.id_giang_vien GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT giang_vien.id_giang_vien FROM giang_vien JOIN sinh_vien ON giang_vien.id_giang_vien = sinh_vien.co_van GROUP BY giang_vien.id_giang_vien HAVING COUNT(*) >= 2
SELECT id_giang_vien FROM giang_vien WHERE id_giang_vien IN (SELECT co_van FROM sinh_vien GROUP BY co_van HAVING COUNT(*) >= 2)
SELECT id_giang_vien FROM giang_vien WHERE id_giang_vien NOT IN (SELECT co_van FROM sinh_vien WHERE co_van IS NOT NULL)
SELECT id_giang_vien FROM giang_vien WHERE id_giang_vien NOT IN (SELECT co_van FROM sinh_vien WHERE co_van IS NOT NULL)
SELECT ten_hoat_dong FROM hoat_dong AS T1
SELECT ten_hoat_dong FROM hoat_dong
SELECT COUNT(*) FROM hoat_dong
SELECT COUNT(*) FROM hoat_dong
SELECT COUNT(DISTINCT T1.id_giang_vien) FROM giang_vien_tham_gia_vao AS T1 JOIN giang_vien AS T2 ON T1.id_giang_vien = T2.id_giang_vien JOIN hoat_dong AS T3 ON T1.id_hoat_dong = T3.id_hoat_dong
SELECT COUNT(*) FROM giang_vien_tham_gia_vao GROUP BY id_hoat_dong HAVING COUNT(*) > 1 ORDER BY COUNT(*) DESC LIMIT 10
SELECT id_giang_vien FROM giang_vien WHERE id_giang_vien NOT IN (SELECT id_giang_vien FROM giang_vien_tham_gia_vao)
SELECT id_giang_vien FROM giang_vien EXCEPT SELECT id_giang_vien FROM giang_vien_tham_gia_vao
SELECT id_giang_vien FROM giang_vien_tham_gia_vao INTERSECT SELECT id_giang_vien FROM giang_vien WHERE id_giang_vien IN (SELECT co_van FROM sinh_vien)
SELECT giang_vien.id_giang_vien FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien JOIN tham_gia_vao ON giang_vien_tham_gia_vao.id_hoat_dong = tham_gia_vao.id_hoat_dong GROUP BY giang_vien.id_giang_vien HAVING COUNT(DISTINCT giang_vien_tham_gia_vao.id_hoat_dong) > 1 AND COUNT(DISTINCT tham_gia_vao.id_sinh_vien) > 0
SELECT COUNT(*) FROM tham_gia_vao JOIN sinh_vien ON tham_gia_vao.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Giuliano' AND sinh_vien.ten = 'Mark'
SELECT COUNT(*) FROM hoat_dong JOIN tham_gia_vao ON hoat_dong.id_hoat_dong = tham_gia_vao.id_hoat_dong JOIN sinh_vien ON tham_gia_vao.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Giuliano' AND sinh_vien.ten = 'Mark'
SELECT ten_hoat_dong FROM hoat_dong JOIN tham_gia_vao ON hoat_dong.id_hoat_dong = tham_gia_vao.id_hoat_dong JOIN sinh_vien ON tham_gia_vao.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Giuliano' AND sinh_vien.ten = 'Mark'
SELECT ten_hoat_dong FROM hoat_dong JOIN tham_gia_vao ON hoat_dong.id_hoat_dong = tham_gia_vao.id_hoat_dong JOIN sinh_vien ON tham_gia_vao.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Giuliano' AND sinh_vien.ten = 'Mark'
SELECT giang_vien.ho, giang_vien.ten, COUNT(DISTINCT giang_vien_tham_gia_vao.id_hoat_dong) AS so_luong_hoat_dong FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien GROUP BY giang_vien.id_giang_vien ORDER BY so_luong_hoat_dong DESC LIMIT 10
SELECT giang_vien.ho, giang_vien.ten, COUNT(giang_vien_tham_gia_vao.id_hoat_dong) AS so_luong_hoat_dong FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong GROUP BY giang_vien.id_giang_vien HAVING COUNT(giang_vien_tham_gia_vao.id_hoat_dong) >= 1 ORDER BY COUNT(giang_vien_tham_gia_vao.id_hoat_dong) DESC
SELECT hoat_dong.ten_hoat_dong, COUNT(giang_vien_tham_gia_vao.id_giang_vien) FROM hoat_dong JOIN giang_vien_tham_gia_vao ON hoat_dong.id_hoat_dong = giang_vien_tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong ORDER BY COUNT(giang_vien_tham_gia_vao.id_giang_vien) DESC
SELECT hoat_dong.ten_hoat_dong, COUNT(giang_vien_tham_gia_vao.id_giang_vien) FROM hoat_dong JOIN giang_vien_tham_gia_vao ON hoat_dong.id_hoat_dong = giang_vien_tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong ORDER BY COUNT(giang_vien_tham_gia_vao.id_giang_vien) DESC
SELECT giang_vien.ho, giang_vien.ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT giang_vien.ho, giang_vien.ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien GROUP BY giang_vien.id_giang_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_hoat_dong FROM hoat_dong JOIN giang_vien_tham_gia_vao ON hoat_dong.id_hoat_dong = giang_vien_tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_hoat_dong FROM hoat_dong JOIN giang_vien_tham_gia_vao ON hoat_dong.id_hoat_dong = giang_vien_tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT id_sinh_vien FROM sinh_vien EXCEPT SELECT id_sinh_vien FROM tham_gia_vao
SELECT id_sinh_vien FROM sinh_vien EXCEPT SELECT id_sinh_vien FROM tham_gia_vao
SELECT DISTINCT tham_gia_vao.id_sinh_vien FROM tham_gia_vao JOIN sinh_vien ON tham_gia_vao.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.tuoi < 20
SELECT sinh_vien.id_sinh_vien, COUNT(DISTINCT tham_gia_vao.id_hoat_dong) FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien WHERE sinh_vien.tuoi < 20 GROUP BY sinh_vien.id_sinh_vien
SELECT sinh_vien.ten, sinh_vien.ho FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT sinh_vien.ho, sinh_vien.ten FROM sinh_vien JOIN tham_gia_vao ON sinh_vien.id_sinh_vien = tham_gia_vao.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_hoat_dong FROM hoat_dong JOIN tham_gia_vao ON hoat_dong.id_hoat_dong = tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT hoat_dong.ten_hoat_dong FROM hoat_dong JOIN tham_gia_vao ON hoat_dong.id_hoat_dong = tham_gia_vao.id_hoat_dong GROUP BY hoat_dong.id_hoat_dong ORDER BY COUNT(*) DESC LIMIT 1
SELECT giang_vien.ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Bơi xuồng' OR hoat_dong.ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT giang_vien.ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Bơi xuồng' OR hoat_dong.ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT ten FROM giang_vien WHERE id_giang_vien NOT IN (SELECT id_giang_vien FROM giang_vien_tham_gia_vao WHERE id_hoat_dong IN (SELECT id_hoat_dong FROM hoat_dong WHERE ten_hoat_dong = 'Bơi xuồng' OR ten_hoat_dong = 'Chèo thuyền Kayak'))
SELECT ten FROM giang_vien WHERE id_giang_vien NOT IN (SELECT id_giang_vien FROM giang_vien_tham_gia_vao WHERE id_hoat_dong IN (SELECT id_hoat_dong FROM hoat_dong WHERE ten_hoat_dong = 'Bơi xuồng' OR ten_hoat_dong = 'Chèo thuyền Kayak'))
SELECT ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE ten_hoat_dong = 'Bơi xuồng' INTERSECT SELECT ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Bơi xuồng' INTERSECT SELECT ten FROM giang_vien JOIN giang_vien_tham_gia_vao ON giang_vien.id_giang_vien = giang_vien_tham_gia_vao.id_giang_vien JOIN hoat_dong ON giang_vien_tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT tham_gia_vao.id_sinh_vien FROM tham_gia_vao JOIN hoat_dong ON tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Bơi xuồng' INTERSECT SELECT tham_gia_vao.id_sinh_vien FROM tham_gia_vao JOIN hoat_dong ON tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT tham_gia_vao.id_sinh_vien FROM tham_gia_vao JOIN hoat_dong ON tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Bơi xuồng' INTERSECT SELECT tham_gia_vao.id_sinh_vien FROM tham_gia_vao JOIN hoat_dong ON tham_gia_vao.id_hoat_dong = hoat_dong.id_hoat_dong WHERE hoat_dong.ten_hoat_dong = 'Chèo thuyền Kayak'
SELECT COUNT(*) FROM nguoi_luyen_the_hinh
SELECT tong FROM nguoi_luyen_the_hinh ORDER BY tong ASC
SELECT nguoi_luyen_the_hinh.cu_giat, nguoi_luyen_the_hinh.cu_day FROM nguoi_luyen_the_hinh ORDER BY nguoi_luyen_the_hinh.cu_giat ASC
SELECT AVG(nguoi_luyen_the_hinh.cu_giat) FROM nguoi_luyen_the_hinh
SELECT cu_day FROM nguoi_luyen_the_hinh ORDER BY tong DESC LIMIT 1
SELECT ca_nhan.ngay_sinh FROM ca_nhan JOIN nguoi_luyen_the_hinh ON ca_nhan.id_ca_nhan = nguoi_luyen_the_hinh.id_ca_nhan ORDER BY ca_nhan.chieu_cao ASC
SELECT T2.ten FROM nguoi_luyen_the_hinh AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan
SELECT T2.ten FROM nguoi_luyen_the_hinh AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan WHERE T1.tong > 300 ORDER BY T1.tong DESC LIMIT 10
SELECT T1.ten FROM ca_nhan AS T1 JOIN nguoi_luyen_the_hinh AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan ORDER BY T1.can_nang DESC LIMIT 1
SELECT ca_nhan.ngay_sinh, ca_nhan.noi_sinh FROM ca_nhan JOIN nguoi_luyen_the_hinh ON ca_nhan.id_ca_nhan = nguoi_luyen_the_hinh.id_ca_nhan ORDER BY nguoi_luyen_the_hinh.tong DESC LIMIT 1
SELECT ca_nhan.chieu_cao FROM ca_nhan JOIN nguoi_luyen_the_hinh ON ca_nhan.id_ca_nhan = nguoi_luyen_the_hinh.id_ca_nhan WHERE nguoi_luyen_the_hinh.tong < 315
SELECT AVG(tong) FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan WHERE ca_nhan.chieu_cao > 200
SELECT T2.ten FROM nguoi_luyen_the_hinh AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan ORDER BY T1.tong DESC
SELECT noi_sinh, COUNT(*) FROM ca_nhan GROUP BY noi_sinh ORDER BY COUNT(*) DESC
SELECT noi_sinh FROM ca_nhan GROUP BY noi_sinh ORDER BY COUNT(*) DESC LIMIT 1
SELECT noi_sinh FROM ca_nhan GROUP BY noi_sinh HAVING COUNT(*) >= 2
SELECT ca_nhan.chieu_cao, ca_nhan.can_nang FROM ca_nhan JOIN nguoi_luyen_the_hinh ON ca_nhan.id_ca_nhan = nguoi_luyen_the_hinh.id_ca_nhan ORDER BY ca_nhan.chieu_cao DESC
SELECT nguoi_luyen_the_hinh.id_nguoi_luyen_the_hinh, ca_nhan.id_ca_nhan, ca_nhan.ten, ca_nhan.chieu_cao, ca_nhan.can_nang, ca_nhan.ngay_sinh, ca_nhan.noisinh, nguoi_luyen_the_hinh.cu_giat, nguoi_luyen_the_hinh.cu_day, nguoi_luyen_the_hinh.tong FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan
SELECT ca_nhan.ten, ca_nhan.noi_sinh FROM ca_nhan WHERE ca_nhan.id_ca_nhan NOT IN (SELECT id_ca_nhan FROM nguoi_luyen_the_hinh)
SELECT COUNT(DISTINCT ca_nhan.noi_sinh) FROM ca_nhan LEFT JOIN nguoi_luyen_the_hinh ON ca_nhan.id_ca_nhan = nguoi_luyen_the_hinh.id_ca_nhan
SELECT COUNT(*) FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM nguoi_luyen_the_hinh)
SELECT can_nang FROM nguoi_luyen_the_hinh JOIN ca_nhan ON nguoi_luyen_the_hinh.id_ca_nhan = ca_nhan.id_ca_nhan WHERE cu_giat > 140 OR ca_nhan.chieu_cao > 200
SELECT SUM(T1.tong) FROM nguoi_luyen_the_hinh AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan WHERE strftime('%m', T2.ngay_sinh) = '01'
SELECT MIN(cu_giat) FROM nguoi_luyen_the_hinh
SELECT COUNT(*) FROM ung_cu_vien T1
SELECT COUNT(*) FROM ung_cu_vien T1
SELECT nguon_tham_do_y_kien FROM ung_cu_vien GROUP BY nguon_tham_do_y_kien ORDER BY COUNT(*) DESC LIMIT 1
SELECT nguon_tham_do_y_kien FROM ung_cu_vien GROUP BY nguon_tham_do_y_kien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ty_le_ung_ho FROM ung_cu_vien ORDER BY ty_le_ung_ho DESC LIMIT 3
SELECT ty_le_ung_ho FROM ung_cu_vien ORDER BY ty_le_ung_ho DESC LIMIT 3
SELECT id_ung_cu_vien FROM ung_cu_vien ORDER BY ty_le_phan_doi ASC LIMIT 1
SELECT id_ung_cu_vien FROM ung_cu_vien ORDER BY ty_le_phan_doi ASC LIMIT 1
SELECT ung_cu_vien.ty_le_ung_ho, ung_cu_vien.ty_le_xem_xet, ung_cu_vien.ty_le_phan_doi FROM ung_cu_vien ORDER BY ung_cu_vien.ty_le_khong_chac_chan ASC
SELECT ung_cu_vien.id_ung_cu_vien, ung_cu_vien.ty_le_ung_ho, ung_cu_vien.ty_le_xem_xet, ung_cu_vien.ty_le_phan_doi, ung_cu_vien.ty_le_khong_chac_chan FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ca_nhan = ca_nhan.id_ca_nhan ORDER BY ung_cu_vien.ty_le_khong_chac_chan ASC
SELECT nguon_tham_do_y_kien FROM ung_cu_vien ORDER BY ty_le_phan_doi DESC LIMIT 1
SELECT ung_cu_vien.nguon_tham_do_y_kien FROM ung_cu_vien ORDER BY ung_cu_vien.ty_le_phan_doi DESC LIMIT 1
SELECT ten FROM ca_nhan ORDER BY ngay_sinh
SELECT ten FROM ca_nhan ORDER BY ngay_sinh
SELECT AVG(ca_nhan.chieu_cao), AVG(ca_nhan.can_nang) FROM ca_nhan WHERE ca_nhan.gioi_tinh = 'M' GROUP BY ca_nhan.gioi_tinh
SELECT AVG(chieu_cao) AS AVG_chieu_cao, AVG(can_nang) AS AVG_can_nang FROM ca_nhan WHERE gioi_tinh = 'Nam' GROUP BY gioi_tinh
SELECT ten FROM ca_nhan WHERE chieu_cao > 200 OR chieu_cao < 190
SELECT ten FROM ca_nhan WHERE chieu_cao > 200 OR chieu_cao < 190
SELECT AVG(can_nang) AS trung_binh, MIN(can_nang) AS min_can_nang, gioi_tinh FROM ca_nhan GROUP BY gioi_tinh ORDER BY gioi_tinh ASC
SELECT AVG(can_nang), MIN(can_nang) FROM ca_nhan GROUP BY gioi_tinh ORDER BY gioi_tinh
SELECT ca_nhan.ten, ca_nhan.gioi_tinh FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ca_nhan = ca_nhan.id_ca_nhan ORDER BY ung_cu_vien.ty_le_ung_ho DESC LIMIT 1
SELECT T1.ten, T2.gioi_tinh FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan ORDER BY T1.ty_le_ung_ho DESC LIMIT 1
SELECT T2.ten FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan GROUP BY T2.gioi_tinh, T2.ten HAVING T1.ty_le_phan_doi = (SELECT MIN(ty_le_phan_doi) FROM ung_cu_vien WHERE id_ca_nhan = T1.id_ca_nhan) ORDER BY T2.gioi_tinh
SELECT T1.ten, T1.gioi_tinh FROM ca_nhan AS T1 JOIN ung_cu_vien AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan GROUP BY T1.id_ca_nhan HAVING MIN(T2.ty_le_phan_doi) ORDER BY T2.ty_le_phan_doi ASC LIMIT 1
SELECT ca_nhan.gioi_tinh, AVG(ung_cu_vien.ty_le_khong_chac_chan) AS avg_ty_le_khong_chac_chan FROM ca_nhan JOIN ung_cu_vien ON ca_nhan.id_ca_nhan = ung_cu_vien.id_ca_nhan GROUP BY ca_nhan.gioi_tinh ORDER BY avg_ty_le_khong_chac_chan DESC LIMIT 1
SELECT ca_nhan.gioi_tinh FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ca_nhan = ca_nhan.id_ca_nhan GROUP BY ca_nhan.gioi_tinh ORDER BY AVG(ung_cu_vien.ty_le_khong_chac_chan) DESC LIMIT 1
SELECT ten FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM ung_cu_vien)
SELECT ten FROM ca_nhan WHERE id_ca_nhan NOT IN (SELECT id_ca_nhan FROM ung_cu_vien)
SELECT ca_nhan.ten FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ca_nhan = ca_nhan.id_ca_nhan WHERE ung_cu_vien.ty_le_ung_ho < ung_cu_vien.ty_le_phan_doi
SELECT T2.ten FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan WHERE T1.ty_le_ung_ho < T1.ty_le_phan_doi
SELECT COUNT(*) FROM ca_nhan WHERE can_nang > 85 GROUP BY gioi_tinh ORDER BY COUNT(*) DESC
SELECT COUNT(*) FROM ca_nhan WHERE can_nang > 85 GROUP BY gioi_tinh
SELECT MAX(ty_le_ung_ho) AS max_ung_ho, MIN(ty_le_xem_xet) AS min_xem_xet, MIN(ty_le_phan_doi) AS min_phan_doi FROM ung_cu_vien
SELECT MAX(ty_le_ung_ho) AS ty_le_ung_ho, MIN(ty_le_xem_xet) AS ty_le_xem_xet, MIN(ty_le_phan_doi) AS ty_le_phan_doi FROM ung_cu_vien
SELECT T1.ten FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan WHERE T2.gioi_tinh = 'F' ORDER BY T1.ten ASC
SELECT ca_nhan.ten FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ca_nhan = ca_nhan.id_ca_nhan WHERE ca_nhan.gioi_tinh = 'Nữ' ORDER BY ca_nhan.ten
SELECT ten FROM ca_nhan WHERE chieu_cao < (SELECT AVG(chieu_cao) FROM ca_nhan)
SELECT T1.id_ca_nhan AS T1_id_ca_nhan, T1.gioi_tinh AS T1_gioi_tinh, T1.ten AS T1_ten, T1.ngay_sinh AS T1_ngay_sinh, T1.chieu_cao AS T1_chieu_cao, T1.can_nang AS T1_can_nang FROM ca_nhan AS T1 LEFT JOIN ung_cu_vien AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan
SELECT T1.id_ca_nhan, T1.gioi_tinh, T1.ten, T1.ngay_sinh, T1.chieu_cao, T1.can_nang FROM ca_nhan AS T1 LEFT JOIN ung_cu_vien AS T2 ON T1.id_ca_nhan = T2.id_ca_nhan
SELECT thanh_pho_chu_nha.thanh_pho_chu_nha FROM thanh_pho_chu_nha JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho ORDER BY thanh_pho_chu_nha.nam DESC LIMIT 1
SELECT thanh_pho.id_thanh_pho FROM thanh_pho_chu_nha JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho ORDER BY thanh_pho_chu_nha.nam DESC LIMIT 1
SELECT id_tran_dau FROM tran_dau WHERE giai_dau = 'vòng loại FIFA World Cup 1994'
SELECT id_tran_dau FROM tran_dau WHERE giai_dau = 'FIFA World Cup 1994 Qualifying'
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha JOIN tran_dau ON thanh_pho_chu_nha.id_tran_dau = tran_dau.id_tran_dau WHERE tran_dau.nam > 2010 GROUP BY thanh_pho.id_thanh_pho ORDER BY thanh_pho.thanh_pho ASC
SELECT thanh_pho_chu_nha.thanh_pho_chu_nha FROM thanh_pho_chu_nha JOIN tran_dau ON thanh_pho_chu_nha.id_tran_dau = tran_dau.id_tran_dau WHERE tran_dau.ngay > '2010' JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.thanh_pho GROUP BY thanh_pho_chu_nha.thanh_pho_chu_nha HAVING COUNT(*) > 1 ORDER BY thanh_pho_chu_nha.thanh_pho_chu_nha ASC LIMIT 1000000
SELECT thanh_pho_chu_nha.thanh_pho_chu_nha, COUNT(*) AS so_luong FROM thanh_pho_chu_nha GROUP BY thanh_pho_chu_nha.thanh_pho_chu_nha ORDER BY so_luong DESC LIMIT 1
SELECT thanh_pho.thanh_pho FROM thanh_pho_chu_nha JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho GROUP BY thanh_pho.id_thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT dia_diem FROM tran_dau JOIN thanh_pho_chu_nha ON tran_dau.id_tran_dau = thanh_pho_chu_nha.id_tran_dau JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE giai_dau = 'Vòng loại FIFA World Cup 1994' AND thanh_pho.thanh_pho = 'Nam Kinh (Giang Tô)'
SELECT tran_dau.dia_diem FROM tran_dau JOIN thanh_pho_chu_nha ON tran_dau.id_tran_dau = thanh_pho_chu_nha.id_tran_dau JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE tran_dau.giai_dau = 'Vòng loại FIFA World Cup 1994' AND thanh_pho.thanh_pho = 'Nam Kinh (Giang Tô)'
SELECT nhiet_do.thang_mot FROM nhiet_do JOIN thanh_pho ON nhiet_do.id_thanh_pho = thanh_pho.id_thanh_pho WHERE thanh_pho.thanh_pho = 'Thượng Hải'
SELECT thang_mot FROM nhiet_do JOIN thanh_pho ON nhiet_do.id_thanh_pho = thanh_pho.id_thanh_pho WHERE thanh_pho.thanh_pho = 'Thượng Hải'
SELECT nam FROM thanh_pho_chu_nha JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE thanh_pho.thanh_pho = 'Thái Châu (Chiết Giang)'
SELECT nam FROM thanh_pho_chu_nha JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho WHERE thanh_pho.thanh_pho = 'Thái Châu (Chiết Giang)'
SELECT thanh_pho FROM thanh_pho ORDER BY dan_so_khu_vuc DESC LIMIT 3
SELECT thanh_pho FROM thanh_pho ORDER BY dan_so_khu_vuc DESC LIMIT 3
SELECT thanh_pho.thanh_pho, thanh_pho.gdp FROM thanh_pho ORDER BY thanh_pho.gdp ASC LIMIT 1
SELECT thanh_pho, gdp FROM thanh_pho ORDER BY gdp ASC LIMIT 1
SELECT thanh_pho FROM nhiet_do JOIN thanh_pho ON nhiet_do.id_thanh_pho = thanh_pho.id_thanh_pho ORDER BY thang_hai DESC LIMIT 1
SELECT t.thanh_pho FROM nhiet_do n JOIN thanh_pho t ON n.id_thanh_pho = t.id_thanh_pho ORDER BY n.thang_hai DESC LIMIT 1
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho WHERE (thang_ba < thang_tam OR thang_ba > thang_muoi_hai)
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho WHERE (thang_ba < thang_tam OR thang_ba > thang_muoi)
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho WHERE thang_ba < thang_tam AND thanh_pho.thanh_pho IN (SELECT thanh_pho_chu_nha FROM thanh_pho_chu_nha)
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho WHERE thang_ba < thang_tam AND thanh_pho.thanh_pho IN (SELECT thanh_pho_chu_nha FROM thanh_pho_chu_nha)
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho WHERE thang_ba < thang_muoi_hai AND thanh_pho.thanh_pho NOT IN (SELECT thanh_pho_chu_nha FROM thanh_pho_chu_nha)
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho WHERE thang_ba < thang_muoi_hai AND thanh_pho.thanh_pho NOT IN (SELECT thanh_pho_chu_nha.thanh_pho_chu_nha FROM thanh_pho_chu_nha JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho)
SELECT thanh_pho.thanh_pho FROM thanh_pho JOIN nhiet_do ON thanh_pho.id_thanh_pho = nhiet_do.id_thanh_pho WHERE nhiet_do.thang_hai > nhiet_do.thang_sau UNION SELECT thanh_pho_chu_nha.thanh_pho_chu_nha FROM thanh_pho_chu_nha JOIN thanh_pho ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho
SELECT thanh_pho.thanh_pho FROM nhiet_do JOIN thanh_pho ON nhiet_do.id_thanh_pho = thanh_pho.id_thanh_pho WHERE thang_hai > thang_bay OR thanh_pho.thanh_pho IN (SELECT thanh_pho_chu_nha FROM thanh_pho_chu_nha)
SELECT thanh_pho FROM thanh_pho WHERE dan_so_khu_vuc > 10000000
SELECT thanh_pho FROM thanh_pho WHERE dan_so_khu_vuc > 10000000
SELECT thanh_pho FROM thanh_pho WHERE dan_so_khu_vuc > 8000000 OR dan_so_khu_vuc < 5000000
SELECT thanh_pho FROM thanh_pho WHERE dan_so_khu_vuc > 8000000 OR dan_so_khu_vuc < 5000000
SELECT giai_dau, COUNT(*) FROM tran_dau GROUP BY giai_dau ORDER BY COUNT(*) DESC
SELECT giai_dau, COUNT(*) FROM tran_dau GROUP BY giai_dau
SELECT dia_diem, ngay FROM tran_dau ORDER BY ngay DESC
SELECT dia_diem FROM tran_dau ORDER BY ngay DESC
SELECT gdp FROM thanh_pho ORDER BY dan_so_khu_vuc DESC LIMIT 1
SELECT gdp FROM thanh_pho ORDER BY dan_so_khu_vuc DESC LIMIT 1
SELECT thanh_pho.gdp, thanh_pho.dan_so_khu_vuc FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho.id_thanh_pho = thanh_pho_chu_nha.thanh_pho_chu_nha GROUP BY thanh_pho.id_thanh_pho HAVING COUNT(*) > 1
SELECT thanh_pho.thanh_pho, thanh_pho.dan_so_khu_vuc, thanh_pho.gdp FROM thanh_pho JOIN thanh_pho_chu_nha ON thanh_pho_chu_nha.thanh_pho_chu_nha = thanh_pho.id_thanh_pho GROUP BY thanh_pho.id_thanh_pho HAVING COUNT(*) > 1
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán'
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán'
SELECT COUNT(DISTINCT giao_su.ma_so_nhan_vien) FROM lop_hoc JOIN giao_su ON lop_hoc.ma_so_nhan_vien_cua_giao_su = giao_su.ma_so_nhan_vien WHERE lop_hoc.ma_lop_hoc = 'ACCT-211'
SELECT COUNT(DISTINCT giao_su.ma_so_nhan_vien) FROM lop_hoc JOIN giao_su ON lop_hoc.ma_so_nhan_vien_cua_giao_su = giao_su.ma_so_nhan_vien WHERE lop_hoc.ma_lop_hoc = 'ACCT-211'
SELECT nhan_vien.ten_cua_nhan_vien, nhan_vien.ho_cua_nhan_vien FROM nhan_vien JOIN giao_su ON nhan_vien.ma_so_nhan_vien = giao_su.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Sinh học'
SELECT ho_cua_nhan_vien, ten_cua_nhan_vien FROM nhan_vien JOIN giao_su ON nhan_vien.ma_so_nhan_vien = giao_su.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Sinh học'
SELECT nhan_vien.ten_cua_nhan_vien, nhan_vien.ngay_sinh_cua_nhan_vien FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON giao_su.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT nhan_vien.ten_cua_nhan_vien, nhan_vien.ngay_sinh_cua_nhan_vien FROM nhan_vien JOIN giao_su ON nhan_vien.ma_so_nhan_vien = giao_su.ma_so_nhan_vien JOIN lop_hoc ON giao_su.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT COUNT(*) FROM lop_hoc JOIN nhan_vien ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien WHERE nhan_vien.ho_cua_nhan_vien = 'Graztevski'
SELECT COUNT(*) FROM lop_hoc JOIN nhan_vien ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien WHERE nhan_vien.ho_cua_nhan_vien = 'Graztevski' GROUP BY lop_hoc.ma_so_nhan_vien_cua_giao_su
SELECT ma_truong FROM khoa WHERE ten_khoa = 'Kế toán'
SELECT ma_truong FROM khoa WHERE ten_khoa = 'Kế toán'
SELECT so_luong_tin_chi_cua_khoa_hoc, mo_ta_ve_khoa_hoc FROM khoa_hoc WHERE ma_khoa_hoc = 'CIS-220'
SELECT mo_ta_ve_khoa_hoc, so_luong_tin_chi_cua_khoa_hoc FROM khoa_hoc WHERE ma_khoa_hoc = 'CIS-220'
SELECT dia_chi_khoa FROM khoa WHERE ten_khoa = 'Lịch sử'
SELECT dia_chi_khoa FROM khoa WHERE ten_khoa = 'Lịch sử'
SELECT COUNT(DISTINCT dia_chi_khoa) FROM khoa WHERE ma_khoa = ' BUS '
SELECT COUNT(DISTINCT dia_chi_khoa) FROM khoa WHERE ma_khoa = 'BUS'
SELECT COUNT(DISTINCT ma_truong) FROM khoa GROUP BY ma_truong HAVING COUNT(DISTINCT dia_chi_khoa) > 0
SELECT COUNT(DISTINCT khoa.ma_truong) FROM khoa JOIN khoa_hoc ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_truong
SELECT mo_ta_ve_khoa_hoc, so_luong_tin_chi_cua_khoa_hoc FROM khoa_hoc WHERE ma_khoa_hoc = 'QM-261'
SELECT so_luong_tin_chi_cua_khoa_hoc, mo_ta_ve_khoa_hoc FROM khoa_hoc WHERE ma_khoa_hoc = 'QM-261'
SELECT ma_truong, COUNT(*) FROM khoa GROUP BY ma_truong
SELECT khoa.ma_truong, COUNT(*) AS so_luong_khoa FROM khoa GROUP BY khoa.ma_truong
SELECT ma_truong, COUNT(ma_khoa) FROM khoa GROUP BY ma_truong HAVING COUNT(ma_khoa) < 5
SELECT khoa.ma_truong, COUNT(khoa.ma_khoa) FROM khoa GROUP BY khoa.ma_truong HAVING COUNT(khoa.ma_khoa) < 5
SELECT ma_khoa_hoc, COUNT(*) FROM lop_hoc GROUP BY ma_khoa_hoc
SELECT ma_khoa_hoc, COUNT(*) FROM lop_hoc GROUP BY ma_khoa_hoc
SELECT khoa.ma_khoa, SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ma_khoa, SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa GROUP BY khoa.ma_khoa
SELECT phong_hoc, COUNT(*) FROM lop_hoc GROUP BY phong_hoc HAVING COUNT(*) >= 2
SELECT phong_hoc, COUNT(*) FROM lop_hoc GROUP BY phong_hoc HAVING COUNT(*) >= 2
SELECT T3.ma_khoa, COUNT(*) AS so_luong_lop_hoc FROM lop_hoc T1 JOIN khoa_hoc T2 ON T1.ma_khoa_hoc = T2.ma_khoa_hoc JOIN khoa T3 ON T2.ma_khoa = T3.ma_khoa GROUP BY T3.ma_khoa ORDER BY COUNT(*) DESC
SELECT khoa.ma_khoa, COUNT(*) FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) DESC
SELECT COUNT(*) FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_truong
SELECT COUNT(*) FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_truong
SELECT COUNT(DISTINCT giao_su.ma_so_nhan_vien) FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_truong
SELECT COUNT(DISTINCT giao_su.ma_so_nhan_vien) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_truong
SELECT ma_cong_viec_cua_nhan_vien, COUNT(*) AS so_luong_nhan_vien FROM nhan_vien GROUP BY ma_cong_viec_cua_nhan_vien ORDER BY so_luong_nhan_vien DESC LIMIT 1
SELECT ma_cong_viec_cua_nhan_vien, COUNT(*) AS so_luong_nhan_vien FROM nhan_vien GROUP BY ma_cong_viec_cua_nhan_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ma_truong FROM khoa AS T1 JOIN giao_su AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.ma_truong FROM khoa AS T1 JOIN giao_su AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT khoa.ma_khoa, COUNT(*) AS so_luong_giao_su FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE giao_su.bang_cap_cao_nhat = 'Tiến sĩ' GROUP BY khoa.ma_khoa
SELECT COUNT(*) FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE bang_cap_cao_nhat = 'Tiến sĩ' GROUP BY ma_khoa
SELECT khoa.ma_khoa, COUNT(*) AS so_luong_sinh_vien FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) DESC
SELECT ma_khoa, COUNT(*) FROM sinh_vien GROUP BY ma_khoa
SELECT khoa.ma_khoa AS khoa_ma_khoa, SUM(sinh_vien.gio_hoc_cua_sinh_vien) AS tong_gio_hoc FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa ORDER BY SUM(sinh_vien.gio_hoc_cua_sinh_vien) DESC
SELECT sinh_vien.ma_khoa AS ma_khoa, SUM(sinh_vien.gio_hoc_cua_sinh_vien) AS tong_thoi_gian_hoc FROM sinh_vien GROUP BY sinh_vien.ma_khoa
SELECT sinh_vien.gpa_cua_sinh_vien FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa ORDER BY sinh_vien.gpa_cua_sinh_vien DESC LIMIT 1 UNION SELECT sinh_vien.gpa_cua_sinh_vien FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa ORDER BY sinh_vien.gpa_cua_sinh_vien ASC LIMIT 1 UNION SELECT AVG(sinh_vien.gpa_cua_sinh_vien) FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa
SELECT khoa.ten_khoa, AVG(sinh_vien.gpa_cua_sinh_vien) AS trung_binh_gpa FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa ORDER BY trung_binh_gpa DESC LIMIT 1
SELECT khoa.ma_khoa, AVG(sinh_vien.gpa_cua_sinh_vien) AS trung_binh_gpa FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa ORDER BY trung_binh_gpa DESC LIMIT 1
SELECT COUNT(*) FROM khoa
SELECT COUNT(DISTINCT khoa.ma_truong) FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa
SELECT COUNT(*) FROM lop_hoc
SELECT COUNT(*) FROM lop_hoc
SELECT COUNT(*) FROM khoa_hoc
SELECT COUNT(DISTINCT ma_khoa_hoc) FROM khoa_hoc
SELECT COUNT(*) FROM khoa
SELECT COUNT(DISTINCT ma_khoa) FROM khoa
SELECT COUNT(*) FROM khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Hệ thống thông tin máy tính'
SELECT COUNT(*) FROM khoa_hoc WHERE ma_khoa = 'Hệ thống thông tin máy tính'
SELECT COUNT(*) FROM lop_hoc WHERE ma_khoa_hoc = 'ACCT-211'
SELECT COUNT(DISTINCT lop_hoc_phan) FROM lop_hoc WHERE ma_khoa_hoc = 'ACCT-211'
SELECT khoa.ma_khoa, SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa GROUP BY khoa.ma_khoa ORDER BY SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) DESC
SELECT khoa.ma_khoa, SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) AS tong_tin_chi FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa GROUP BY khoa.ma_khoa ORDER BY SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) DESC
SELECT khoa.ten_khoa FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa GROUP BY khoa.ma_khoa ORDER BY SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) DESC LIMIT 1
SELECT khoa.ma_khoa, SUM(khoa_hoc.so_luong_tin_chi_cua_khoa_hoc) AS tong_tin_chi FROM khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa ORDER BY tong_tin_chi DESC LIMIT 1
SELECT COUNT(*) FROM dang_ky_khoa_hoc JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc WHERE lop_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT COUNT(*) FROM dang_ky_khoa_hoc JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc WHERE lop_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211' AND dang_ky_khoa_hoc.diem_so = 'C'
SELECT sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211' AND diem_so = 'C'
SELECT khoa.so_luong_nhan_vien FROM khoa LIMIT 1
SELECT COUNT(*) FROM nhan_vien
SELECT COUNT(*) FROM giao_su WHERE bang_cap_cao_nhat = 'Tiến sĩ'
SELECT COUNT(*) FROM giao_su WHERE bang_cap_cao_nhat = 'Tiến sĩ'
SELECT COUNT(DISTINCT sinh_vien.ma_so_sinh_vien) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán'
SELECT COUNT(*) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán'
SELECT T1.ten_khoa FROM khoa AS T1 JOIN sinh_vien AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT khoa.ten_khoa FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_khoa FROM khoa ORDER BY ten_khoa ASC
SELECT ten_khoa FROM khoa ORDER BY ten_khoa ASC
SELECT lop_hoc.ma_khoa_hoc FROM lop_hoc WHERE lop_hoc.phong_hoc = 'KLR 209'
SELECT DISTINCT lop_hoc.ma_khoa_hoc FROM lop_hoc WHERE lop_hoc.phong_hoc = 'KLR 209'
SELECT ten_cua_nhan_vien FROM nhan_vien WHERE ma_cong_viec_cua_nhan_vien = 'Giáo sư' ORDER BY ngay_sinh_cua_nhan_vien
SELECT ten_cua_nhan_vien FROM nhan_vien AS T1 WHERE T1.ma_so_nhan_vien IN (SELECT ma_so_nhan_vien FROM giao_su) ORDER BY ngay_sinh_cua_nhan_vien
SELECT T2.ten_cua_nhan_vien, T1.van_phong_giao_su FROM giao_su AS T1 JOIN nhan_vien AS T2 ON T1.ma_so_nhan_vien = T2.ma_so_nhan_vien ORDER BY T2.ten_cua_nhan_vien ASC
SELECT T2.ten_cua_nhan_vien, T1.van_phong_giao_su FROM giao_su AS T1 JOIN nhan_vien AS T2 ON T1.ma_so_nhan_vien = T2.ma_so_nhan_vien ORDER BY T2.ten_cua_nhan_vien
SELECT ho_cua_nhan_vien, ten_cua_nhan_vien FROM nhan_vien ORDER BY ngay_sinh_cua_nhan_vien DESC LIMIT 1
SELECT ho_cua_nhan_vien, ten_cua_nhan_vien FROM nhan_vien ORDER BY ngay_sinh_cua_nhan_vien ASC LIMIT 1
SELECT ten_cua_sinh_vien, ho_cua_sinh_vien, gpa_cua_sinh_vien FROM sinh_vien WHERE gpa_cua_sinh_vien > 3 ORDER BY ngay_sinh_cua_sinh_vien ASC LIMIT 1
SELECT ho_cua_sinh_vien, ten_cua_sinh_vien, gpa_cua_sinh_vien FROM sinh_vien WHERE gpa_cua_sinh_vien > 3 ORDER BY ngay_sinh_cua_sinh_vien ASC LIMIT 1
SELECT sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien WHERE diem_so = 'C'
SELECT sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien WHERE diem_so = 'C'
SELECT T1.ten_khoa FROM khoa AS T1 JOIN giao_su AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.ten_khoa FROM khoa AS T1 JOIN giao_su AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.ten_khoa FROM khoa AS T1 JOIN giao_su AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_khoa FROM khoa AS T1 JOIN giao_su AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_cua_nhan_vien FROM nhan_vien WHERE ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien FROM giao_su) AND ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc)
SELECT ten_cua_nhan_vien FROM nhan_vien WHERE ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc) AND ma_so_nhan_vien IN (SELECT ma_so_nhan_vien FROM giao_su)
SELECT ten_cua_nhan_vien FROM nhan_vien JOIN giao_su ON nhan_vien.ma_so_nhan_vien = giao_su.ma_so_nhan_vien WHERE giao_su.ma_khoa = 'Lịch sử' AND giao_su.ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc)
SELECT ten_cua_nhan_vien FROM nhan_vien JOIN giao_su ON nhan_vien.ma_so_nhan_vien = giao_su.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Lịch sử' AND nhan_vien.ma_so_nhan_vien NOT IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc)
SELECT giao_su.ho_cua_nhan_vien, giao_su.van_phong_giao_su FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Lịch sử'
SELECT van_phong_giao_su, giao_su.ma_so_nhan_vien FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Lịch sử'
SELECT van_phong_giao_su, ma_khoa FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE nhan_vien.ho_cua_nhan_vien = 'Heffington'
SELECT giao_su.ma_khoa, khoa.dia_chi_khoa, giao_su.van_phong_giao_su FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE nhan_vien.ho_cua_nhan_vien = 'Heffington'
SELECT T1.ho_cua_nhan_vien, T1.ngay_bat_dau_cong_viec_cua_nhan_vien FROM nhan_vien AS T1 JOIN giao_su AS T2 ON T1.ma_so_nhan_vien = T2.ma_so_nhan_vien WHERE T2.van_phong_giao_su = 'DRE 102'
SELECT T1.ho_cua_nhan_vien, T1.ngay_bat_dau_cong_viec_cua_nhan_vien FROM nhan_vien AS T1 JOIN giao_su AS T2 ON T1.ma_so_nhan_vien = T2.ma_so_nhan_vien WHERE T2.van_phong_giao_su = 'DRE 102' ORDER BY T1.ngay_bat_dau_cong_viec_cua_nhan_vien ASC
SELECT DISTINCT lop_hoc.ma_khoa_hoc FROM lop_hoc JOIN dang_ky_khoa_hoc ON lop_hoc.ma_lop_hoc = dang_ky_khoa_hoc.ma_lop JOIN sinh_vien ON dang_ky_khoa_hoc.ma_so_sinh_vien = sinh_vien.ma_so_sinh_vien WHERE sinh_vien.ho_cua_sinh_vien = 'Smithson'
SELECT lop_hoc.ma_khoa_hoc FROM lop_hoc JOIN dang_ky_khoa_hoc ON lop_hoc.ma_lop_hoc = dang_ky_khoa_hoc.ma_lop JOIN sinh_vien ON dang_ky_khoa_hoc.ma_so_sinh_vien = sinh_vien.ma_so_sinh_vien WHERE sinh_vien.ho_cua_sinh_vien = 'Smithson'
SELECT khoa_hoc.so_luong_tin_chi_cua_khoa_hoc, khoa_hoc.mo_ta_ve_khoa_hoc FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE sinh_vien.ho_cua_sinh_vien = 'Smithson' GROUP BY khoa_hoc.ma_khoa_hoc, khoa_hoc.mo_ta_ve_khoa_hoc ORDER BY khoa_hoc.ma_khoa_hoc
SELECT khoa_hoc.so_luong_tin_chi_cua_khoa_hoc, khoa_hoc.mo_ta_ve_khoa_hoc FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE sinh_vien.ho_cua_sinh_vien = 'Smithson'
SELECT COUNT(*) FROM giao_su WHERE bang_cap_cao_nhat = 'Tiến sĩ' OR bang_cap_cao_nhat = 'Thạc sĩ'
SELECT COUNT(*) FROM giao_su WHERE bang_cap_cao_nhat = 'Tiến sĩ' OR bang_cap_cao_nhat = 'Thạc sĩ'
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán' OR khoa.ten_khoa = 'Sinh học'
SELECT COUNT(*) FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán' OR khoa.ten_khoa = 'Sinh học'
SELECT giao_su.ten_cua_nhan_vien FROM giao_su JOIN lop_hoc ON giao_su.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'CIS-220' OR khoa_hoc.ma_khoa_hoc = 'QM-261'
SELECT T1.ten_cua_nhan_vien FROM giao_su AS T1 JOIN nhan_vien AS T2 ON T1.ma_so_nhan_vien = T2.ma_so_nhan_vien JOIN lop_hoc AS T3 ON T3.ma_so_nhan_vien_cua_giao_su = T1.ma_so_nhan_vien JOIN khoa_hoc AS T4 ON T3.ma_khoa_hoc = T4.ma_khoa_hoc WHERE T4.ma_khoa_hoc = 'CIS-220' OR T4.ma_khoa_hoc = 'QM-261'
SELECT sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán' INTERSECT SELECT sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Hệ thống thông tin máy tính'
SELECT ten_cua_sinh_vien FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Kế toán' INTERSECT SELECT ten_cua_sinh_vien FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Hệ thống thông tin máy tính'
SELECT AVG(gpa_cua_sinh_vien) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien WHERE dang_ky_khoa_hoc.ma_lop = 'ACCT-211'
SELECT AVG(gpa_cua_sinh_vien) FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT ten_cua_sinh_vien, gpa_cua_sinh_vien, so_dien_thoai_cua_sinh_vien FROM sinh_vien ORDER BY gpa_cua_sinh_vien DESC LIMIT 5
SELECT ten_cua_sinh_vien, gpa_cua_sinh_vien, so_dien_thoai_cua_sinh_vien FROM sinh_vien ORDER BY gpa_cua_sinh_vien DESC LIMIT 5
SELECT khoa.ten_khoa FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa ORDER BY sinh_vien.gpa_cua_sinh_vien ASC LIMIT 1
SELECT khoa.ma_khoa FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa ORDER BY sinh_vien.gpa_cua_sinh_vien ASC LIMIT 1
SELECT ten_cua_sinh_vien, gpa_cua_sinh_vien FROM sinh_vien WHERE gpa_cua_sinh_vien < (SELECT AVG(gpa_cua_sinh_vien) FROM sinh_vien)
SELECT ten_cua_sinh_vien, gpa_cua_sinh_vien FROM sinh_vien WHERE gpa_cua_sinh_vien < (SELECT AVG(gpa_cua_sinh_vien) FROM sinh_vien)
SELECT khoa.ten_khoa, khoa.dia_chi_khoa FROM khoa JOIN sinh_vien ON khoa.ma_khoa = sinh_vien.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten_khoa, T1.dia_chi_khoa FROM khoa AS T1 JOIN sinh_vien AS T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T1.ma_khoa ORDER BY COUNT(*) DESC LIMIT 1
SELECT khoa.ten_khoa, khoa.dia_chi_khoa, COUNT(sinh_vien.ma_so_sinh_vien) AS so_luong_sinh_vien FROM sinh_vien JOIN khoa ON sinh_vien.ma_khoa = khoa.ma_khoa GROUP BY khoa.ma_khoa ORDER BY COUNT(sinh_vien.ma_so_sinh_vien) DESC LIMIT 3
SELECT T2.ten_khoa, T2.dia_chi_khoa, COUNT(*) AS so_luong_sinh_vien FROM sinh_vien T1 JOIN khoa T2 ON T1.ma_khoa = T2.ma_khoa GROUP BY T2.ma_khoa ORDER BY so_luong_sinh_vien DESC LIMIT 3
SELECT nhan_vien.ten_cua_nhan_vien, giao_su.van_phong_giao_su FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.bang_cap_cao_nhat = 'Tiến sĩ'
SELECT giao_su.ten_cua_nhan_vien, giao_su.van_phong_giao_su FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa WHERE khoa.ten_khoa = 'Lịch sử' AND giao_su.bang_cap_cao_nhat = 'Tiến sĩ'
SELECT nhan_vien.ten_cua_nhan_vien, lop_hoc.ma_khoa_hoc FROM lop_hoc JOIN nhan_vien ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien GROUP BY nhan_vien.ma_so_nhan_vien HAVING COUNT(DISTINCT lop_hoc.ma_khoa_hoc) > 0
SELECT nhan_vien.ten_cua_nhan_vien, lop_hoc.ma_khoa_hoc FROM lop_hoc JOIN nhan_vien ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien GROUP BY nhan_vien.ma_so_nhan_vien, lop_hoc.ma_khoa_hoc HAVING COUNT(*) > 0
SELECT nhan_vien.ten_cua_nhan_vien, khoa_hoc.mo_ta_ve_khoa_hoc FROM lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN nhan_vien ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien GROUP BY nhan_vien.ma_so_nhan_vien ORDER BY nhan_vien.ten_cua_nhan_vien ASC
SELECT nhan_vien.ten_cua_nhan_vien, khoa_hoc.mo_ta_ve_khoa_hoc FROM lop_hoc JOIN nhan_vien ON lop_hoc.ma_so_nhan_vien_cua_giao_su = nhan_vien.ma_so_nhan_vien JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc GROUP BY nhan_vien.ma_so_nhan_vien ORDER BY nhan_vien.ten_cua_nhan_vien ASC
SELECT giao_su.van_phong_giao_su, nhan_vien.ho_cua_nhan_vien || ' ' || nhan_vien.ten_cua_nhan_vien AS ten_giao_su, khoa_hoc.mo_ta_ve_khoa_hoc FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN lop_hoc ON lop_hoc.ma_so_nhan_vien_cua_giao_su = giao_su.ma_so_nhan_vien JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc JOIN khoa ON khoa_hoc.ma_khoa = khoa.ma_khoa
SELECT g.ten_cua_nhan_vien, g.van_phong_giao_su, kh.mo_ta_ve_khoa_hoc FROM giao_su AS g JOIN lop_hoc AS lh ON g.ma_so_nhan_vien = lh.ma_so_nhan_vien_cua_giao_su JOIN khoa_hoc AS kh ON lh.ma_khoa_hoc = kh.ma_khoa_hoc GROUP BY g.ma_so_nhan_vien, kh.ma_khoa_hoc
SELECT giao_su.van_phong_giao_su, nhan_vien.ho_cua_nhan_vien || ' ' || nhan_vien.ten_cua_nhan_vien AS ten_giao_su, khoa.ten_khoa, khoa_hoc.mo_ta_ve_khoa_hoc FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa JOIN lop_hoc ON khoa_hoc.ma_khoa_hoc = lop_hoc.ma_khoa_hoc
SELECT giao_su.ten_cua_nhan_vien, giao_su.van_phong_giao_su, khoa.ten_khoa, khoa_hoc.mo_ta_ve_khoa_hoc FROM giao_su JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN lop_hoc ON giao_su.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc
SELECT sinh_vien.ho_cua_sinh_vien, sinh_vien.ten_cua_sinh_vien, khoa_hoc.mo_ta_ve_khoa_hoc FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc GROUP BY sinh_vien.ma_so_sinh_vien, khoa_hoc.ma_khoa_hoc ORDER BY sinh_vien.ma_so_sinh_vien, khoa_hoc.ma_khoa_hoc
SELECT sinh_vien.ho_cua_sinh_vien, sinh_vien.ten_cua_sinh_vien, khoa_hoc.mo_ta_ve_khoa_hoc FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc GROUP BY sinh_vien.ma_so_sinh_vien, khoa_hoc.ma_khoa_hoc
SELECT sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien WHERE diem_so IN ('A', 'C') GROUP BY sinh_vien.ma_so_sinh_vien
SELECT sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien WHERE diem_so IN ('A', 'C') GROUP BY sinh_vien.ma_so_sinh_vien HAVING COUNT(*) > 0
SELECT giao_su.ten_cua_nhan_vien, lop_hoc.phong_hoc FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN lop_hoc ON lop_hoc.ma_so_nhan_vien_cua_giao_su = giao_su.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Kế toán' AND lop_hoc.ma_khoa_hoc IS NOT NULL GROUP BY giao_su.ma_so_nhan_vien, lop_hoc.ma_lop_hoc ORDER BY giao_su.ten_cua_nhan_vien ASC
SELECT giao_su.ten_cua_nhan_vien, lop_hoc.phong_hoc FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN lop_hoc ON lop_hoc.ma_so_nhan_vien_cua_giao_su = giao_su.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Kế toán'
SELECT g.ten_cua_nhan_vien, g.bang_cap_cao_nhat FROM giao_su g JOIN khoa k ON g.ma_khoa = k.ma_khoa WHERE k.ten_khoa = 'Hệ thống Thông tin Máy tính' AND g.ma_so_nhan_vien IN (SELECT ma_so_nhan_vien_cua_giao_su FROM lop_hoc) GROUP BY g.ma_so_nhan_vien ORDER BY g.ten_cua_nhan_vien ASC
SELECT g.ten_cua_nhan_vien, g.bang_cap_cao_nhat FROM giao_su AS g JOIN khoa AS k ON g.ma_khoa = k.ma_khoa WHERE k.ten_khoa = 'Hệ thống thông tin máy tính'
SELECT sinh_vien.ho_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc WHERE lop_hoc.ma_lop_hoc = '10018' AND diem_so = 'A'
SELECT sinh_vien.ho_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc WHERE lop_hoc.ma_lop_hoc = '10018' AND diem_so = 'A'
SELECT ten_cua_nhan_vien, van_phong_giao_su FROM giao_su JOIN khoa ON giao_su.ma_khoa = khoa.ma_khoa JOIN nhan_vien ON giao_su.ma_so_nhan_vien = nhan_vien.ma_so_nhan_vien WHERE khoa.ten_khoa = 'Lịch sử' AND bang_cap_cao_nhat != 'Tiến sĩ'
SELECT g.ten_cua_nhan_vien, g.van_phong_giao_su FROM giao_su AS g JOIN khoa AS k ON g.ma_khoa = k.ma_khoa WHERE k.ten_khoa = 'Lịch sử' AND g.bang_cap_cao_nhat != 'Tiến sĩ'
SELECT nhan_vien.ten_cua_nhan_vien FROM nhan_vien JOIN giao_su ON nhan_vien.ma_so_nhan_vien = giao_su.ma_so_nhan_vien JOIN lop_hoc ON giao_su.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su GROUP BY nhan_vien.ma_so_nhan_vien HAVING COUNT(DISTINCT lop_hoc.ma_lop_hoc) > 1
SELECT giao_su.ten_cua_nhan_vien FROM giao_su JOIN lop_hoc ON giao_su.ma_so_nhan_vien = lop_hoc.ma_so_nhan_vien_cua_giao_su GROUP BY giao_su.ma_so_nhan_vien HAVING COUNT(lop_hoc.ma_lop_hoc) > 1
SELECT ten_cua_sinh_vien FROM sinh_vien WHERE ma_so_sinh_vien IN (SELECT ma_so_sinh_vien FROM dang_ky_khoa_hoc GROUP BY ma_so_sinh_vien HAVING COUNT(*) = 1)
SELECT sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien GROUP BY sinh_vien.ma_so_sinh_vien HAVING COUNT(dang_ky_khoa_hoc.ma_lop) = 1
SELECT khoa.ten_khoa FROM khoa JOIN khoa_hoc ON khoa.ma_khoa = khoa_hoc.ma_khoa WHERE khoa_hoc.mo_ta_ve_khoa_hoc LIKE '%Thong ke%' GROUP BY khoa.ma_khoa HAVING COUNT(DISTINCT khoa_hoc.ma_khoa_hoc) > 0 ORDER BY khoa.ten_khoa ASC LIMIT 1000000000
SELECT T1.ten_khoa FROM khoa AS T1 JOIN khoa_hoc AS T2 ON T1.ma_khoa = T2.ma_khoa WHERE T2.mo_ta_ve_khoa_hoc LIKE '%Thống kê%' GROUP BY T1.ma_khoa HAVING COUNT(*) > 0 ORDER BY T1.ten_khoa ASC LIMIT 1000000000
SELECT sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN dang_ky_khoa_hoc ON sinh_vien.ma_so_sinh_vien = dang_ky_khoa_hoc.ma_so_sinh_vien JOIN lop_hoc ON dang_ky_khoa_hoc.ma_lop = lop_hoc.ma_lop_hoc JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE sinh_vien.ho_cua_sinh_vien LIKE 'S%' AND khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT sinh_vien.ten_cua_sinh_vien FROM sinh_vien JOIN lop_hoc ON sinh_vien.ma_khoa = khoa_hoc.ma_khoa JOIN khoa_hoc ON lop_hoc.ma_khoa_hoc = khoa_hoc.ma_khoa_hoc WHERE sinh_vien.ho_cua_sinh_vien LIKE 'S%' AND khoa_hoc.ma_khoa_hoc = 'ACCT-211'
SELECT ma_trang_thai_tai_lieu FROM trang_thai_cua_tai_lieu
SELECT mo_ta_ve_trang_thai_tai_lieu FROM trang_thai_cua_tai_lieu WHERE ma_trang_thai_tai_lieu = 'đang được xử lý'
SELECT ma_loai_tai_lieu FROM loai_tai_lieu
SELECT mo_ta_ve_loai_tai_lieu FROM loai_tai_lieu WHERE mo_ta_ve_loai_tai_lieu = 'Giấy'
SELECT ten_dai_ly_van_chuyen FROM dai_ly_van_chuyen_tai_lieu
SELECT ma_dai_ly_van_chuyen FROM dai_ly_van_chuyen_tai_lieu WHERE ten_dai_ly_van_chuyen = 'UPS'
SELECT ma_vai_tro FROM vai_tro
SELECT mo_ta_ve_vai_tro FROM vai_tro WHERE ma_vai_tro = 'ED'
SELECT COUNT(*) FROM nhan_vien
SELECT T1.mo_ta_ve_vai_tro FROM nhan_vien AS T1 JOIN vai_tro AS T2 ON T1.ma_vai_tro = T2.ma_vai_tro WHERE T1.ten_nhan_vien = 'Koby'
SELECT id_tai_lieu, ngay_lap_bien_lai FROM tai_lieu
SELECT vai_tro.ma_vai_tro, vai_tro.mo_ta_ve_vai_tro, COUNT(nhan_vien.id_nhan_vien) AS so_luong_nhan_vien FROM nhan_vien JOIN vai_tro ON nhan_vien.ma_vai_tro = vai_tro.ma_vai_tro GROUP BY vai_tro.ma_vai_tro ORDER BY COUNT(nhan_vien.id_nhan_vien) DESC
SELECT vai_tro.ma_vai_tro, vai_tro.mo_ta_ve_vai_tro, COUNT(*) AS so_luong_nhan_vien FROM nhan_vien JOIN vai_tro ON nhan_vien.ma_vai_tro = vai_tro.ma_vai_tro GROUP BY vai_tro.ma_vai_tro HAVING COUNT(*) > 1 ORDER BY COUNT(*) DESC
SELECT mo_ta_ve_trang_thai_tai_lieu FROM trang_thai_cua_tai_lieu WHERE ma_trang_thai_tai_lieu = (SELECT ma_trang_thai_tai_lieu FROM tai_lieu WHERE id_tai_lieu = 1)
SELECT COUNT(*) FROM tai_lieu WHERE ma_trang_thai_tai_lieu = 'Đã được hoàn thành'
SELECT tai_lieu.ma_loai_tai_lieu FROM tai_lieu WHERE tai_lieu.id_tai_lieu = 2
SELECT id_tai_lieu FROM tai_lieu WHERE ma_trang_thai_tai_lieu = 'Đã được hoàn thành' AND ma_loai_tai_lieu = 'Giấy'
SELECT ten_dai_ly_van_chuyen FROM tai_lieu JOIN dai_ly_van_chuyen_tai_lieu ON tai_lieu.ma_dai_ly_van_chuyen = dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen WHERE tai_lieu.id_tai_lieu = 2
SELECT COUNT(*) FROM tai_lieu WHERE ma_dai_ly_van_chuyen = 'USPS'
SELECT dai_ly_van_chuyen_tai_lieu.ten_dai_ly_van_chuyen, COUNT(*) AS so_luong_tai_lieu FROM tai_lieu JOIN dai_ly_van_chuyen_tai_lieu ON tai_lieu.ma_dai_ly_van_chuyen = dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen GROUP BY dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen ORDER BY so_luong_tai_lieu DESC LIMIT 1
SELECT ngay_lap_bien_lai FROM tai_lieu WHERE id_tai_lieu = 3
SELECT dia_chi.chi_tiet_dia_chi FROM dia_chi JOIN tai_lieu_duoc_gui ON tai_lieu_duoc_gui.gui_den_dia_chi_co_id = dia_chi.id_dia_chi WHERE tai_lieu_duoc_gui.id_tai_lieu = 4
SELECT ngay_gui FROM tai_lieu_duoc_gui WHERE id_tai_lieu = 7
SELECT id_tai_lieu FROM tai_lieu WHERE ma_trang_thai_tai_lieu = 'Đã được hoàn thành' AND ma_loai_tai_lieu = 'Giấy' AND ma_dai_ly_van_chuyen NOT IN (SELECT ma_dai_ly_van_chuyen FROM dai_ly_van_chuyen_tai_lieu WHERE ten_dai_ly_van_chuyen = 'USPS')
SELECT tai_lieu.id_tai_lieu FROM tai_lieu JOIN trang_thai_cua_tai_lieu ON tai_lieu.ma_trang_thai_tai_lieu = trang_thai_cua_tai_lieu.ma_trang_thai_tai_lieu JOIN loai_tai_lieu ON tai_lieu.ma_loai_tai_lieu = loai_tai_lieu.ma_loai_tai_lieu JOIN dai_ly_van_chuyen_tai_lieu ON tai_lieu.ma_dai_ly_van_chuyen = dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen WHERE trang_thai_cua_tai_lieu.mo_ta_ve_trang_thai_tai_lieu = 'Đã được hoàn thành' AND loai_tai_lieu.mo_ta_ve_loai_tai_lieu = 'Giấy' AND dai_ly_van_chuyen_tai_lieu.ten_dai_ly_van_chuyen = 'USPS'
SELECT chi_tiet_du_thao FROM ban_du_thao_cua_tai_lieu WHERE id_tai_lieu = 7
SELECT ban_sao.so_luong_ban_sao FROM ban_sao JOIN ban_du_thao_cua_tai_lieu ON ban_sao.id_tai_lieu = ban_du_thao_cua_tai_lieu.id_tai_lieu WHERE ban_du_thao_cua_tai_lieu.id_tai_lieu = 2
SELECT ban_sao.id_tai_lieu, ban_sao.so_luong_ban_sao FROM ban_sao ORDER BY ban_sao.so_luong_ban_sao DESC LIMIT 1
SELECT ban_sao.id_tai_lieu, ban_sao.so_luong_ban_sao FROM ban_sao WHERE ban_sao.so_luong_ban_sao > 1
SELECT T1.ten_nhan_vien FROM nhan_vien AS T1 JOIN lich_su_luu_hanh AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien WHERE T2.id_tai_lieu = 1
SELECT ten_nhan_vien FROM nhan_vien EXCEPT SELECT T2.ten_nhan_vien FROM lich_su_luu_hanh AS T1 JOIN nhan_vien AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien
SELECT n.ten_nhan_vien, COUNT(*) AS so_lan_xuat_hien FROM lich_su_luu_hanh l JOIN nhan_vien n ON l.id_nhan_vien = n.id_nhan_vien GROUP BY n.id_nhan_vien, n.ten_nhan_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT lich_su_luu_hanh.id_tai_lieu, COUNT(lich_su_luu_hanh.id_nhan_vien) FROM lich_su_luu_hanh GROUP BY lich_su_luu_hanh.id_tai_lieu ORDER BY COUNT(lich_su_luu_hanh.id_nhan_vien) DESC
SELECT COUNT(*) FROM luot_dat_hang
SELECT COUNT(*) FROM luot_dat_hang
SELECT ngay_dat_hang FROM luot_dat_hang UNION SELECT ngay_dat_hang FROM luot_dat_hang_cua_khach_hang
SELECT ngay_dat_hang FROM luot_dat_hang UNION SELECT ngay_dat_hang FROM luot_dat_hang_cua_khach_hang
SELECT luot_dat_hang.ngay_giao_hang_theo_ke_hoach, luot_dat_hang.ngay_giao_hang_thuc_te FROM luot_dat_hang JOIN luot_dat_hang_cua_khach_hang ON luot_dat_hang.id_luot_dat_hang = luot_dat_hang_cua_khach_hang.id_don_hang
SELECT luot_dat_hang.ngay_giao_hang_theo_ke_hoach, luot_dat_hang.ngay_giao_hang_thuc_te FROM luot_dat_hang JOIN luot_dat_hang_cua_khach_hang ON luot_dat_hang.id_luot_dat_hang = luot_dat_hang_cua_khach_hang.id_don_hang
SELECT COUNT(*) FROM khach_hang UNION SELECT COUNT(*) FROM khach_hang_1
SELECT COUNT(*) FROM khach_hang UNION SELECT COUNT(*) FROM khach_hang_1
SELECT so_dien_thoai_khach_hang, dia_chi_email_khach_hang FROM khach_hang WHERE ten_khach_hang = 'Harold' UNION SELECT so_dien_thoai_khach_hang, dia_chi_email_khach_hang FROM khach_hang_1 WHERE ten_khach_hang = 'Harold'
SELECT dia_chi_email_khach_hang, so_dien_thoai_khach_hang FROM khach_hang WHERE ten_khach_hang = 'Harold'
SELECT ten_cua_hang FROM nhom_hoi_thao_kich
SELECT ten_cua_hang FROM nhom_hoi_thao_kich
SELECT DISTINCT ma_phuong_thuc_thanh_toan FROM hoa_don
SELECT ma_phuong_thuc_thanh_toan FROM hoa_don GROUP BY ma_phuong_thuc_thanh_toan HAVING COUNT(*) = (SELECT COUNT(DISTINCT id_hoa_don) FROM hoa_don)
SELECT mo_ta_ve_khu_vuc_tiep_thi FROM khu_vuc_tiep_thi WHERE ten_khu_vuc_tiep_thi = 'Trung_Quoc'
SELECT mo_ta_ve_khu_vuc_tiep_thi FROM khu_vuc_tiep_thi WHERE ma_khu_vuc_tiep_thi = 'Trung_Quoc'
SELECT ten_san_pham FROM cac_san_pham WHERE gia_san_pham > (SELECT AVG(gia_san_pham) FROM cac_san_pham)
SELECT ten_san_pham FROM cac_san_pham WHERE gia_san_pham > (SELECT AVG(gia_san_pham) FROM cac_san_pham)
SELECT ten_san_pham FROM cac_san_pham ORDER BY gia_san_pham DESC LIMIT 1
SELECT ten_san_pham FROM cac_san_pham ORDER BY gia_san_pham DESC LIMIT 1
SELECT ten_san_pham FROM cac_san_pham ORDER BY gia_san_pham ASC
SELECT ten_san_pham FROM cac_san_pham ORDER BY gia_san_pham ASC
SELECT so_dien_thoai_khach_hang FROM nguoi_bieu_dien AS T1 WHERE ten_khach_hang = 'Ashley'
SELECT so_dien_thoai_khach_hang FROM nguoi_bieu_dien WHERE ten_khach_hang = 'Ashley'
SELECT hoa_don.ma_phuong_thuc_thanh_toan, COUNT(*) AS count FROM hoa_don JOIN phuong_thuc_thanh_toan ON hoa_don.ma_phuong_thuc_thanh_toan = phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan GROUP BY hoa_don.ma_phuong_thuc_thanh_toan
SELECT phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan, COUNT(*) FROM hoa_don JOIN phuong_thuc_thanh_toan ON hoa_don.ma_phuong_thuc_thanh_toan = phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan GROUP BY phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan ORDER BY COUNT(*) DESC
SELECT ma_phuong_thuc_thanh_toan FROM hoa_don GROUP BY ma_phuong_thuc_thanh_toan ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_phuong_thuc_thanh_toan FROM hoa_don GROUP BY ma_phuong_thuc_thanh_toan ORDER BY COUNT(*) DESC LIMIT 1
SELECT thanh_pho_thi_tran FROM dia_chi JOIN cua_hang ON dia_chi.id_dia_chi = cua_hang.id_dia_chi WHERE ten_cua_hang = 'FJM Filming'
SELECT dia_chi.thanh_pho_thi_tran FROM cua_hang JOIN dia_chi ON cua_hang.id_dia_chi = dia_chi.id_dia_chi WHERE cua_hang.ten_cua_hang = 'FJA Filming'
SELECT thanh_pho_thi_tran FROM dia_chi JOIN cua_hang ON dia_chi.id_dia_chi = cua_hang.id_dia_chi WHERE cua_hang.ma_khu_vuc_tiep_thi = 'CA' GROUP BY thanh_pho_thi_tran
SELECT dia_chi.thanh_pho_thi_tran, dia_chi.quan_hat FROM cua_hang JOIN dia_chi ON cua_hang.id_dia_chi = dia_chi.id_dia_chi WHERE cua_hang.ma_khu_vuc_tiep_thi = ' CA '
SELECT cua_hang.ma_khu_vuc_tiep_thi FROM cua_hang WHERE cua_hang.ten_cua_hang = 'Rob Dinning'
SELECT khu_vuc_tiep_thi.ten_khu_vuc_tiep_thi FROM cua_hang JOIN khu_vuc_tiep_thi ON cua_hang.ma_khu_vuc_tiep_thi = khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi WHERE cua_hang.ten_cua_hang = 'Rob Dinning'
SELECT loai_dich_vu.mo_ta_ve_loai_dich_vu FROM loai_dich_vu JOIN dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu WHERE dich_vu.gia_san_pham > 100
SELECT mo_ta_ve_loai_dich_vu FROM loai_dich_vu WHERE ma_loai_dich_vu IN (SELECT ma_loai_dich_vu FROM dich_vu WHERE gia_san_pham > 100)
SELECT mo_ta_ve_loai_dich_vu, ma_loai_dich_vu, COUNT(*) AS so_luong FROM loai_dich_vu JOIN dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu GROUP BY loai_dich_vu.ma_loai_dich_vu ORDER BY COUNT(*) DESC
SELECT mo_ta_ve_loai_dich_vu, ma_loai_dich_vu, COUNT(*) AS so_luong FROM loai_dich_vu JOIN dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu GROUP BY mo_ta_ve_loai_dich_vu, ma_loai_dich_vu ORDER BY COUNT(*) DESC
SELECT loai_dich_vu.ma_loai_dich_vu, loai_dich_vu.mo_ta_ve_loai_dich_vu FROM loai_dich_vu JOIN dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu GROUP BY loai_dich_vu.ma_loai_dich_vu ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai_dich_vu.ma_loai_dich_vu, loai_dich_vu.mo_ta_ve_loai_dich_vu FROM dich_vu JOIN loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu GROUP BY loai_dich_vu.ma_loai_dich_vu ORDER BY COUNT(*) DESC LIMIT 1
SELECT so_dien_thoai_cua_hang, dia_chi_email_cua_hang FROM nhom_hoi_thao_kich JOIN dich_vu ON nhom_hoi_thao_kich.id_nhom_hoi_thao_kich = dich_vu.id_nhom_hoi_thao_kich
SELECT nhom_hoi_thao_kich.dia_chi_email_cua_hang, nhom_hoi_thao_kich.so_dien_thoai_cua_hang FROM nhom_hoi_thao_kich JOIN dich_vu ON nhom_hoi_thao_kich.id_nhom_hoi_thao_kich = dich_vu.id_nhom_hoi_thao_kich WHERE dich_vu.id_nhom_hoi_thao_kich IS NOT NULL
SELECT so_dien_thoai_cua_hang, dia_chi_email_cua_hang FROM nhom_hoi_thao_kich JOIN dich_vu ON nhom_hoi_thao_kich.id_nhom_hoi_thao_kich = dich_vu.id_nhom_hoi_thao_kich WHERE dich_vu.ten_san_pham = 'phim'
SELECT nhom_hoi_thao_kich.id_nhom_hoi_thao_kich FROM dich_vu JOIN nhom_hoi_thao_kich ON dich_vu.id_nhom_hoi_thao_kich = nhom_hoi_thao_kich.id_nhom_hoi_thao_kich WHERE dich_vu.ten_san_pham = 'phim'
SELECT ten_san_pham, AVG(gia_san_pham) AS gia_trung_binh FROM cac_san_pham GROUP BY id_san_pham ORDER BY gia_trung_binh DESC
SELECT ten_san_pham, AVG(gia_san_pham) AS gia_trung_binh FROM cac_san_pham GROUP BY id_san_pham ORDER BY gia_trung_binh DESC LIMIT 10
SELECT ten_san_pham FROM cac_san_pham AS T1 WHERE gia_san_pham < 1000000 ORDER BY gia_san_pham ASC LIMIT 1000000
SELECT ten_san_pham FROM cac_san_pham WHERE gia_san_pham < 1000000 ORDER BY gia_san_pham ASC
SELECT SUM(mat_hang_trong_hoa_don.so_luong_dat_hang) FROM mat_hang_trong_hoa_don JOIN hoa_don ON mat_hang_trong_hoa_don.id_hoa_don = hoa_don.id_hoa_don JOIN luot_dat_hang_cua_khach_hang ON hoa_don.id_don_hang = luot_dat_hang_cua_khach_hang.id_don_hang JOIN dich_vu_dat_hang ON luot_dat_hang_cua_khach_hang.id_don_hang = dich_vu_dat_hang.id_don_hang JOIN dich_vu ON dich_vu_dat_hang.id_san_pham = dich_vu.id_dich_vu JOIN cac_san_pham ON dich_vu.id_dich_vu = cac_san_pham.id_san_pham WHERE cac_san_pham.ten_san_pham LIKE '%image%'
SELECT SUM(CAST(mat_hang_duoc_dat.so_luong_dat_hang AS INTEGER)) FROM mat_hang_duoc_dat JOIN cac_san_pham ON mat_hang_duoc_dat.id_san_pham = cac_san_pham.id_san_pham WHERE cac_san_pham.ten_san_pham = 'ảnh'
SELECT mat_hang_duoc_dat.id_mat_hang_duoc_dat AS so_luong_dat_hang, mat_hang_duoc_dat.id_san_pham, cac_san_pham.ten_san_pham, cac_san_pham.gia_san_pham FROM mat_hang_duoc_dat JOIN cac_san_pham ON mat_hang_duoc_dat.id_san_pham = cac_san_pham.id_san_pham WHERE cac_san_pham.gia_san_pham > 2000 ORDER BY cac_san_pham.gia_san_pham DESC
SELECT cac_san_pham.ten_san_pham, cac_san_pham.gia_san_pham, cac_san_pham.mo_ta_ve_san_pham, cac_san_pham.chi_tiet_khac_ve_dich_vu_san_pham, luot_dat_hang.id_luot_dat_hang, luot_dat_hang.id_khach_hang, luot_dat_hang.id_nhom_hoi_thao_kich, luot_dat_hang.ma_trang_thai, luot_dat_hang.id_cua_hang, luot_dat_hang.ngay_dat_hang, luot_dat_hang.ngay_giao_hang_theo_ke_hoach, luot_dat_hang.ngay_giao_hang_thuc_te, luot_dat_hang.chi_tiet_khac_ve_don_hang FROM cac_san_pham JOIN mat_hang_duoc_dat ON cac_san_pham.id_san_pham = mat_hang_duoc_dat.id_san_pham JOIN luot_dat_hang ON mat_hang_duoc_dat.id_don_hang = luot_dat_hang.id_luot_dat_hang WHERE cac_san_pham.gia_san_pham > 2000
SELECT ngay_giao_hang_thuc_te FROM luot_dat_hang_cua_khach_hang WHERE so_luong_dat_hang = '1'
SELECT luot_dat_hang_cua_khach_hang.ngay_giao_hang_thuc_te FROM luot_dat_hang_cua_khach_hang JOIN mat_hang_duoc_dat ON luot_dat_hang_cua_khach_hang.id_don_hang = mat_hang_duoc_dat.id_don_hang WHERE mat_hang_duoc_dat.so_luong_dat_hang = '1'
SELECT ngay_dat_hang FROM luot_dat_hang WHERE id_luot_dat_hang IN (SELECT id_luot_dat_hang FROM mat_hang_duoc_dat JOIN cac_san_pham ON mat_hang_duoc_dat.id_san_pham = cac_san_pham.id_san_pham WHERE CAST(so_luong_dat_hang AS INTEGER) * cac_san_pham.gia_san_pham > 1000) UNION SELECT ngay_dat_hang FROM luot_dat_hang_cua_khach_hang WHERE id_don_hang IN (SELECT id_don_hang FROM mat_hang_duoc_dat JOIN cac_san_pham ON mat_hang_duoc_dat.id_san_pham = cac_san_pham.id_san_pham WHERE CAST(so_luong_dat_hang AS INTEGER) * cac_san_pham.gia_san_pham > 1000)
SELECT luot_dat_hang.ngay_dat_hang FROM luot_dat_hang JOIN mat_hang_duoc_dat ON luot_dat_hang.id_luot_dat_hang = mat_hang_duoc_dat.id_don_hang JOIN cac_san_pham ON mat_hang_duoc_dat.id_san_pham = cac_san_pham.id_san_pham WHERE cac_san_pham.gia_san_pham > 1000
SELECT COUNT(DISTINCT ma_tien_te) FROM nhom_hoi_thao_kich
SELECT COUNT(DISTINCT ma_tien_te) FROM nhom_hoi_thao_kich
SELECT ten_cua_hang FROM nhom_hoi_thao_kich JOIN dia_chi ON nhom_hoi_thao_kich.id_dia_chi = dia_chi.id_dia_chi WHERE thanh_pho_thi_tran = 'Feliciaberg'
SELECT ten_cua_hang FROM nhom_hoi_thao_kich JOIN dia_chi ON nhom_hoi_thao_kich.id_dia_chi = dia_chi.id_dia_chi WHERE thanh_pho_thi_tran = 'Feliciaberg'
SELECT dia_chi_email_cua_hang FROM nhom_hoi_thao_kich JOIN dia_chi ON nhom_hoi_thao_kich.id_dia_chi = dia_chi.id_dia_chi WHERE quan_hat = 'Alaska'
SELECT dia_chi_email_cua_hang FROM nhom_hoi_thao_kich JOIN dia_chi ON nhom_hoi_thao_kich.id_dia_chi = dia_chi.id_dia_chi WHERE thanh_pho_thi_tran = 'Alaska'
SELECT dia_chi.thanh_pho_thi_tran AS thanh_pho, COUNT(*) AS count FROM nhom_hoi_thao_kich JOIN dia_chi ON nhom_hoi_thao_kich.id_dia_chi = dia_chi.id_dia_chi GROUP BY dia_chi.thanh_pho_thi_tran ORDER BY COUNT(*) DESC
SELECT thanh_pho_thi_tran, COUNT(*) AS count FROM nhom_hoi_thao_kich JOIN dia_chi ON nhom_hoi_thao_kich.id_dia_chi = dia_chi.id_dia_chi GROUP BY thanh_pho_thi_tran ORDER BY COUNT(*) DESC
SELECT ma_khu_vuc_tiep_thi FROM nhom_hoi_thao_kich GROUP BY ma_khu_vuc_tiep_thi ORDER BY COUNT(*) DESC LIMIT 1
SELECT khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi FROM nhom_hoi_thao_kich JOIN khu_vuc_tiep_thi ON nhom_hoi_thao_kich.ma_khu_vuc_tiep_thi = khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi GROUP BY khu_vuc_tiep_thi.ma_khu_vuc_tiep_thi ORDER BY COUNT(*) DESC LIMIT 1
SELECT thanh_pho_thi_tran FROM dia_chi JOIN khach_hang ON dia_chi.id_dia_chi = khach_hang.id_dia_chi EXCEPT SELECT thanh_pho_thi_tran FROM dia_chi JOIN nguoi_bieu_dien ON dia_chi.id_dia_chi = nguoi_bieu_dien.id_dia_chi
SELECT thanh_pho_thi_tran FROM dia_chi JOIN khach_hang ON dia_chi.id_dia_chi = khach_hang.id_dia_chi EXCEPT SELECT thanh_pho_thi_tran FROM dia_chi JOIN nguoi_bieu_dien ON dia_chi.id_dia_chi = nguoi_bieu_dien.id_dia_chi
SELECT ma_trang_thai, COUNT(*) AS so_luong FROM luot_dat_hang GROUP BY ma_trang_thai ORDER BY so_luong DESC LIMIT 1
SELECT ma_trang_thai FROM luot_dat_hang GROUP BY ma_trang_thai ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_cua_hang FROM nhom_hoi_thao_kich JOIN luot_dat_hang ON luot_dat_hang.id_nhom_hoi_thao_kich = nhom_hoi_thao_kich.id_nhom_hoi_thao_kich WHERE ma_trang_thai = 'stopped'
SELECT nhom_hoi_thao_kich.ten FROM luot_dat_hang JOIN nhom_hoi_thao_kich ON luot_dat_hang.id_nhom_hoi_thao_kich = nhom_hoi_thao_kich.id_nhom_hoi_thao_kich WHERE luot_dat_hang.ma_trang_thai = 'dung' ORDER BY nhom_hoi_thao_kich.ten
SELECT ten_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM luot_dat_hang) UNION SELECT ten_khach_hang FROM khach_hang_1 WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM luot_dat_hang_cua_khach_hang)
SELECT ten_khach_hang FROM khach_hang_1 EXCEPT SELECT khach_hang_1.ten_khach_hang FROM khach_hang_1 JOIN luot_dat_hang_cua_khach_hang ON khach_hang_1.id_khach_hang = luot_dat_hang_cua_khach_hang.id_khach_hang
SELECT AVG(hoa_don.so_luong_dat_hang) FROM hoa_don JOIN phuong_thuc_thanh_toan ON hoa_don.ma_phuong_thuc_thanh_toan = phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan WHERE phuong_thuc_thanh_toan.mo_ta_ve_phuong_thuc_thanh_toan = 'Mastercard'
SELECT AVG(hoa_don.so_luong_dat_hang) FROM hoa_don JOIN phuong_thuc_thanh_toan ON hoa_don.ma_phuong_thuc_thanh_toan = phuong_thuc_thanh_toan.ma_phuong_thuc_thanh_toan WHERE phuong_thuc_thanh_toan.mo_ta_ve_phuong_thuc_thanh_toan = 'Mastercard'
SELECT id_san_pham FROM mat_hang_trong_hoa_don GROUP BY id_san_pham ORDER BY COUNT(*) DESC LIMIT 1
SELECT id_san_pham FROM mat_hang_trong_hoa_don JOIN hoa_don ON mat_hang_trong_hoa_don.id_hoa_don = hoa_don.id_hoa_don GROUP BY id_san_pham ORDER BY COUNT(*) DESC LIMIT 1
SELECT mo_ta_ve_loai_dich_vu FROM loai_dich_vu WHERE ma_loai_dich_vu IN (SELECT ma_loai_dich_vu FROM dich_vu WHERE ten_san_pham LIKE '%anh%' INTERSECT SELECT ma_loai_dich_vu FROM dich_vu WHERE ten_san_pham LIKE '%phim%')
SELECT mo_ta_ve_loai_dich_vu FROM loai_dich_vu WHERE ma_loai_dich_vu IN (SELECT DISTINCT ma_loai_dich_vu FROM dich_vu WHERE ten_san_pham LIKE 'ảnh%' OR ten_san_pham LIKE 'phim%')
SELECT COUNT(*) FROM tai_khoan
SELECT COUNT(*) FROM tai_khoan
SELECT COUNT(DISTINCT khach_hang.id_khach_hang) FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang WHERE tai_khoan.id_tai_khoan IS NOT NULL
SELECT COUNT(DISTINCT khach_hang.id_khach_hang) FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang
SELECT id_tai_khoan, ngay_mo_tai_khoan, ten_tai_khoan, chi_tiet_khac_ve_tai_khoan FROM tai_khoan
SELECT id_tai_khoan, ngay_mo_tai_khoan, ten_tai_khoan, chi_tiet_khac_ve_tai_khoan FROM tai_khoan
SELECT tai_khoan.id_tai_khoan, tai_khoan.ten_tai_khoan, tai_khoan.ngay_mo_tai_khoan, tai_khoan.chi_tiet_khac_ve_tai_khoan FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten_khach_hang = 'Mea Afghanistan'
SELECT tai_khoan.id_tai_khoan, tai_khoan.ten_tai_khoan, tai_khoan.ngay_mo_tai_khoan, tai_khoan.chi_tiet_khac_ve_tai_khoan FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten_khach_hang = 'Mea Afghanistan'
SELECT ten_tai_khoan, chi_tiet_khac_ve_tai_khoan FROM tai_khoan JOIN khach_hang ON tai_khoan.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten_khach_hang = 'Mea Afghanistan' AND khach_hang.ho_cua_khach_hang = 'Keeling'
SELECT T1.ten_tai_khoan, T1.chi_tiet_khac_ve_tai_khoan FROM tai_khoan AS T1 JOIN khach_hang AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.ten_khach_hang = 'Mea Afghanistan Keeling'
SELECT khach_hang.ho_cua_khach_hang, khach_hang.ten_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang WHERE tai_khoan.ten_tai_khoan = '900'
SELECT T1.ten_khach_hang FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.ten_tai_khoan = '900'
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT T1.ten_khach_hang, T1.ho_cua_khach_hang, T1.so_dien_thoai FROM khach_hang AS T1 JOIN tai_khoan AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.id_khach_hang IS NOT NULL GROUP BY T1.id_khach_hang HAVING COUNT(*) = 1 ORDER BY T1.id_khach_hang ASC LIMIT 1000000000
SELECT id_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT id_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
SELECT khach_hang.id_khach_hang, COUNT(tai_khoan.id_tai_khoan) FROM khach_hang LEFT JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(tai_khoan.id_tai_khoan) DESC
SELECT khach_hang.id_khach_hang AS id, COUNT(tai_khoan.id_tai_khoan) AS so_luong_tai_khoan FROM khach_hang LEFT JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY so_luong_tai_khoan DESC
SELECT khach_hang.id_khach_hang, khach_hang.ten_khach_hang, khach_hang.ho_cua_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.ten_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.ten_khach_hang, khach_hang.ho_cua_khach_hang, COUNT(tai_khoan.id_tai_khoan) FROM khach_hang LEFT JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY khach_hang.id_khach_hang
SELECT khach_hang.ten_khach_hang, khach_hang.id_khach_hang, COUNT(tai_khoan.id_tai_khoan) AS so_tai_khoan FROM khach_hang LEFT JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(tai_khoan.id_tai_khoan) DESC
SELECT khach_hang.id_khach_hang, khach_hang.ten_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang HAVING COUNT(tai_khoan.id_tai_khoan) >= 2
SELECT khach_hang.id_khach_hang, khach_hang.ten_khach_hang FROM khach_hang JOIN tai_khoan ON khach_hang.id_khach_hang = tai_khoan.id_khach_hang GROUP BY khach_hang.id_khach_hang HAVING COUNT(tai_khoan.id_tai_khoan) >= 2
SELECT COUNT(*) FROM khach_hang
SELECT COUNT(*) FROM khach_hang
SELECT gioi_tinh, COUNT(*) FROM khach_hang GROUP BY gioi_tinh ORDER BY COUNT(*) DESC
SELECT gioi_tinh, COUNT(*) FROM khach_hang GROUP BY gioi_tinh ORDER BY COUNT(*) DESC
SELECT COUNT(*) FROM giao_dich_tai_chinh
SELECT COUNT(*) FROM giao_dich_tai_chinh
SELECT id_tai_khoan, COUNT(*) AS so_luong_giao_dich FROM tai_khoan JOIN giao_dich_tai_chinh ON tai_khoan.id_tai_khoan = giao_dich_tai_chinh.id_tai_khoan GROUP BY id_tai_khoan ORDER BY COUNT(*) DESC
SELECT id_tai_khoan, COUNT(*) FROM giao_dich_tai_chinh GROUP BY id_tai_khoan
SELECT COUNT(*) FROM giao_dich_tai_chinh JOIN tai_khoan ON giao_dich_tai_chinh.id_tai_khoan = tai_khoan.id_tai_khoan WHERE tai_khoan.ten_tai_khoan = '337'
SELECT COUNT(*) FROM giao_dich_tai_chinh AS T1 JOIN tai_khoan AS T2 ON T1.id_tai_khoan = T2.id_tai_khoan WHERE T2.ten_tai_khoan = '337'
SELECT AVG(so_tien_giao_dich), MIN(so_tien_giao_dich), MAX(so_tien_giao_dich), SUM(so_tien_giao_dich) FROM giao_dich_tai_chinh
SELECT AVG(so_tien_giao_dich), MIN(so_tien_giao_dich), MAX(so_tien_giao_dich), SUM(so_tien_giao_dich) FROM giao_dich_tai_chinh
SELECT id_giao_dich FROM giao_dich_tai_chinh WHERE so_tien_giao_dich > (SELECT AVG(so_tien_giao_dich) FROM giao_dich_tai_chinh)
SELECT id_giao_dich FROM giao_dich_tai_chinh WHERE so_tien_giao_dich > (SELECT AVG(so_tien_giao_dich) FROM giao_dich_tai_chinh)
SELECT loai_giao_dich, SUM(so_tien_giao_dich) FROM giao_dich_tai_chinh GROUP BY loai_giao_dich ORDER BY SUM(so_tien_giao_dich) DESC
SELECT loai_giao_dich, SUM(so_tien_giao_dich) FROM giao_dich_tai_chinh GROUP BY loai_giao_dich ORDER BY SUM(so_tien_giao_dich) DESC
SELECT tai_khoan.ten_tai_khoan, tai_khoan.id_tai_khoan, COUNT(giao_dich_tai_chinh.id_giao_dich) FROM tai_khoan LEFT JOIN giao_dich_tai_chinh ON tai_khoan.id_tai_khoan = giao_dich_tai_chinh.id_tai_khoan GROUP BY tai_khoan.id_tai_khoan ORDER BY COUNT(giao_dich_tai_chinh.id_giao_dich) DESC
SELECT tai_khoan.id_tai_khoan AS id_tai_khoan, COUNT(*) AS so_luong_giao_dich FROM tai_khoan JOIN giao_dich_tai_chinh ON tai_khoan.id_tai_khoan = giao_dich_tai_chinh.id_tai_khoan GROUP BY tai_khoan.id_tai_khoan ORDER BY COUNT(*) DESC
SELECT id_tai_khoan FROM tai_khoan JOIN giao_dich_tai_chinh ON tai_khoan.id_tai_khoan = giao_dich_tai_chinh.id_tai_khoan GROUP BY id_tai_khoan ORDER BY COUNT(*) DESC LIMIT 1
SELECT tai_khoan.id_tai_khoan FROM tai_khoan JOIN giao_dich_tai_chinh ON tai_khoan.id_tai_khoan = giao_dich_tai_chinh.id_tai_khoan GROUP BY tai_khoan.id_tai_khoan ORDER BY COUNT(*) DESC LIMIT 1
SELECT tai_khoan.id_tai_khoan, tai_khoan.ten_tai_khoan FROM tai_khoan JOIN giao_dich_tai_chinh ON tai_khoan.id_tai_khoan = giao_dich_tai_chinh.id_tai_khoan GROUP BY tai_khoan.id_tai_khoan HAVING COUNT(*) >= 4
SELECT tai_khoan.id_tai_khoan, tai_khoan.ten_tai_khoan FROM tai_khoan JOIN giao_dich_tai_chinh ON tai_khoan.id_tai_khoan = giao_dich_tai_chinh.id_tai_khoan GROUP BY tai_khoan.id_tai_khoan HAVING COUNT(*) >= 4
SELECT DISTINCT kich_thuoc_san_pham FROM san_pham
SELECT kich_thuoc_san_pham FROM san_pham GROUP BY kich_thuoc_san_pham ORDER BY kich_thuoc_san_pham DESC
SELECT DISTINCT mau_san_pham FROM san_pham
SELECT DISTINCT mau_san_pham FROM san_pham ORDER BY mau_san_pham
SELECT so_hoa_don, COUNT(*) AS so_luong_giao_dich FROM giao_dich_tai_chinh GROUP BY so_hoa_don ORDER BY COUNT(*) DESC
SELECT so_hoa_don, COUNT(*) FROM giao_dich_tai_chinh GROUP BY so_hoa_don
SELECT so_hoa_don, ngay_lap_hoa_don FROM hoa_don JOIN giao_dich_tai_chinh ON hoa_don.so_hoa_don = giao_dich_tai_chinh.so_hoa_don GROUP BY hoa_don.so_hoa_don ORDER BY COUNT(*) DESC LIMIT 1
SELECT hoa_don.so_hoa_don, hoa_don.ngay_lap_hoa_don FROM hoa_don JOIN giao_dich_tai_chinh ON hoa_don.so_hoa_don = giao_dich_tai_chinh.so_hoa_don GROUP BY hoa_don.so_hoa_don ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM hoa_don
SELECT COUNT(*) FROM hoa_don
SELECT hoa_don.ngay_lap_hoa_don, hoa_don.id_don_hang, T3.ten_khach_hang FROM hoa_don JOIN don_dat_hang ON hoa_don.id_don_hang = don_dat_hang.id_don_hang JOIN khach_hang ON don_dat_hang.id_khach_hang = khach_hang.id_khach_hang
SELECT hoa_don.ngay_lap_hoa_don, hoa_don.id_don_hang, don_dat_hang.chi_tiet_dat_hang FROM hoa_don JOIN don_dat_hang ON hoa_don.id_don_hang = don_dat_hang.id_don_hang
SELECT don_dat_hang.id_don_hang, COUNT(hoa_don.so_hoa_don) FROM don_dat_hang JOIN hoa_don ON don_dat_hang.id_don_hang = hoa_don.id_don_hang GROUP BY don_dat_hang.id_don_hang ORDER BY COUNT(hoa_don.so_hoa_don) DESC
SELECT hoa_don.id_don_hang, COUNT(*) FROM hoa_don GROUP BY hoa_don.id_don_hang
SELECT don_dat_hang.id_don_hang, don_dat_hang.id_khach_hang, don_dat_hang.ngay_dat_hang, don_dat_hang.chi_tiet_dat_hang FROM don_dat_hang JOIN hoa_don ON don_dat_hang.id_don_hang = hoa_don.id_don_hang GROUP BY don_dat_hang.id_don_hang HAVING COUNT(hoa_don.so_hoa_don) > 2
SELECT don_dat_hang.id_don_hang, don_dat_hang.id_khach_hang, don_dat_hang.ngay_dat_hang, don_dat_hang.chi_tiet_dat_hang FROM don_dat_hang JOIN hoa_don ON don_dat_hang.id_don_hang = hoa_don.id_don_hang GROUP BY don_dat_hang.id_don_hang HAVING COUNT(hoa_don.so_hoa_don) >= 2
SELECT khach_hang.id_khach_hang, khach_hang.ho_cua_khach_hang, khach_hang.so_dien_thoai FROM don_dat_hang JOIN khach_hang ON don_dat_hang.id_khach_hang = khach_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT khach_hang.ho_cua_khach_hang, khach_hang.id_khach_hang, khach_hang.so_dien_thoai FROM khach_hang JOIN don_dat_hang ON khach_hang.id_khach_hang = don_dat_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten_san_pham FROM san_pham WHERE id_san_pham NOT IN (SELECT id_san_pham FROM mat_hang_duoc_dat)
SELECT ten_san_pham FROM san_pham WHERE id_san_pham NOT IN (SELECT DISTINCT id_san_pham FROM mat_hang_duoc_dat)
SELECT san_pham.ten_san_pham AS ten_san_pham, SUM(CAST(mat_hang_duoc_dat.so_luong_san_pham AS INTEGER)) AS tong_so_luong FROM san_pham JOIN mat_hang_duoc_dat ON san_pham.id_san_pham = mat_hang_duoc_dat.id_san_pham GROUP BY san_pham.ten_san_pham ORDER BY SUM(CAST(mat_hang_duoc_dat.so_luong_san_pham AS INTEGER)) DESC
SELECT san_pham.ten_san_pham AS ten, SUM(mat_hang_duoc_dat.so_luong_san_pham) FROM san_pham JOIN mat_hang_duoc_dat ON san_pham.id_san_pham = mat_hang_duoc_dat.id_san_pham GROUP BY san_pham.id_san_pham ORDER BY SUM(mat_hang_duoc_dat.so_luong_san_pham) DESC
SELECT mat_hang_duoc_dat.id_don_hang, COUNT(mat_hang_duoc_dat.id_mat_hang_duoc_dat) AS so_luong_mat_hang FROM mat_hang_duoc_dat GROUP BY mat_hang_duoc_dat.id_don_hang
SELECT id_don_hang, COUNT(*) FROM mat_hang_duoc_dat GROUP BY id_don_hang
SELECT mat_hang_duoc_dat.id_san_pham, COUNT(*) AS so_luong_don_dat_hang FROM mat_hang_duoc_dat GROUP BY mat_hang_duoc_dat.id_san_pham ORDER BY COUNT(*) DESC LIMIT 10
SELECT id_san_pham, COUNT(*) FROM mat_hang_duoc_dat GROUP BY id_san_pham
SELECT ten_san_pham, COUNT(*) AS so_luong_khach_hang FROM san_pham JOIN mat_hang_duoc_dat ON san_pham.id_san_pham = mat_hang_duoc_dat.id_san_pham GROUP BY san_pham.id_san_pham ORDER BY COUNT(*) DESC
SELECT san_pham.ten_san_pham AS ten_san_pham, COUNT(DISTINCT mat_hang_duoc_dat.id_don_hang) AS so_luong_khach_hang FROM san_pham JOIN mat_hang_duoc_dat ON san_pham.id_san_pham = mat_hang_duoc_dat.id_san_pham GROUP BY san_pham.ten_san_pham ORDER BY so_luong_khach_hang DESC
SELECT don_dat_hang.id_don_hang, SUM(mat_hang_duoc_dat.so_luong_san_pham) AS tong_so_luong FROM don_dat_hang JOIN mat_hang_duoc_dat ON don_dat_hang.id_don_hang = mat_hang_duoc_dat.id_don_hang GROUP BY don_dat_hang.id_don_hang
SELECT id_don_hang, COUNT(*) FROM mat_hang_duoc_dat GROUP BY id_don_hang
SELECT don_dat_hang.id_don_hang, SUM(CAST(mat_hang_duoc_dat.so_luong_san_pham AS INTEGER)) FROM don_dat_hang JOIN mat_hang_duoc_dat ON don_dat_hang.id_don_hang = mat_hang_duoc_dat.id_don_hang GROUP BY don_dat_hang.id_don_hang ORDER BY don_dat_hang.id_don_hang
SELECT don_dat_hang.id_don_hang, SUM(CAST(mat_hang_duoc_dat.so_luong_san_pham AS INTEGER)) FROM don_dat_hang JOIN mat_hang_duoc_dat ON don_dat_hang.id_don_hang = mat_hang_duoc_dat.id_don_hang GROUP BY don_dat_hang.id_don_hang
SELECT COUNT(*) FROM san_pham WHERE id_san_pham NOT IN (SELECT id_san_pham FROM mat_hang_duoc_dat)
SELECT COUNT(*) FROM san_pham WHERE id_san_pham NOT IN (SELECT DISTINCT id_san_pham FROM mat_hang_duoc_dat)
SELECT COUNT(*) FROM dia_chi WHERE quoc_gia = 'Mỹ'
SELECT DISTINCT thanh_pho FROM dia_chi
SELECT tieu_bang, COUNT(*) FROM dia_chi GROUP BY tieu_bang ORDER BY COUNT(*) DESC
SELECT ten_khach_hang, dien_thoai_khach_hang FROM khach_hang WHERE dia_chi_cua_khach_hang IS NULL
SELECT khach_hang.ten_khach_hang FROM khach_hang JOIN luot_dat_hang_cua_khach_hang ON khach_hang.id_khach_hang = luot_dat_hang_cua_khach_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_san_pham FROM san_pham GROUP BY ma_loai_san_pham HAVING COUNT(*) >= 2
SELECT ten_khach_hang FROM khach_hang JOIN luot_dat_hang_cua_khach_hang ON khach_hang.id_khach_hang = luot_dat_hang_cua_khach_hang.id_khach_hang WHERE ma_trang_thai_don_hang = 'Completed' OR ma_trang_thai_don_hang = 'Partially Completed' GROUP BY khach_hang.id_khach_hang HAVING COUNT(DISTINCT ma_trang_thai_don_hang) > 1
SELECT ten_khach_hang, dien_thoai_khach_hang, ma_phuong_thuc_thanh_toan FROM khach_hang ORDER BY ma_so_khach_hang DESC
SELECT san_pham.ten_san_pham, SUM(CAST(mat_hang_duoc_dat.so_luong_dat_hang AS INTEGER)) FROM san_pham JOIN mat_hang_duoc_dat ON san_pham.id_san_pham = mat_hang_duoc_dat.id_san_pham GROUP BY san_pham.id_san_pham, san_pham.ten_san_pham ORDER BY SUM(CAST(mat_hang_duoc_dat.so_luong_dat_hang AS INTEGER)) DESC
SELECT MAX(gia_san_pham), MIN(gia_san_pham), AVG(gia_san_pham) FROM san_pham
SELECT COUNT(*) FROM san_pham WHERE gia_san_pham > (SELECT AVG(gia_san_pham) FROM san_pham)
SELECT khach_hang.ten_khach_hang, dia_chi.thanh_pho, lich_su_dia_chi_khach_hang.tu_ngay, lich_su_dia_chi_khach_hang.den_ngay FROM khach_hang JOIN lich_su_dia_chi_khach_hang ON khach_hang.id_khach_hang = lich_su_dia_chi_khach_hang.id_khach_hang JOIN dia_chi ON lich_su_dia_chi_khach_hang.id_dia_chi = dia_chi.id_dia_chi
SELECT ten_khach_hang FROM khach_hang WHERE ma_phuong_thuc_thanh_toan = 'Credit Card' AND id_khach_hang IN (SELECT id_khach_hang FROM luot_dat_hang_cua_khach_hang GROUP BY id_khach_hang HAVING COUNT(*) > 2)
SELECT khach_hang.ten_khach_hang, khach_hang.dien_thoai_khach_hang FROM khach_hang JOIN luot_dat_hang_cua_khach_hang ON khach_hang.id_khach_hang = luot_dat_hang_cua_khach_hang.id_khach_hang JOIN mat_hang_duoc_dat ON luot_dat_hang_cua_khach_hang.id_don_hang = mat_hang_duoc_dat.id_don_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_san_pham, ten_san_pham FROM san_pham WHERE gia_san_pham > 1000 OR gia_san_pham < 500
SELECT COUNT(*) FROM bo_truong WHERE tuoi > 56
SELECT ten, sinh_ra_o_tieu_bang, tuoi FROM bo_truong ORDER BY tuoi ASC
SELECT nam_thanh_lap, ten, ngan_sach_tinh_theo_ty FROM cac_bo
SELECT MAX(ngan_sach_tinh_theo_ty) AS MAX_NGAN_SACH_TINH_THEO_TY, MIN(ngan_sach_tinh_theo_ty) AS MIN_NGAN_SACH_TINH_THEO_TY FROM cac_bo
SELECT AVG(so_luong_nhan_vien) FROM cac_bo WHERE xep_hang BETWEEN 10 AND 15
SELECT ten FROM bo_truong WHERE sinh_ra_o_tieu_bang != 'California'
SELECT DISTINCT cac_bo.nam_thanh_lap FROM cac_bo JOIN su_quan_ly ON cac_bo.id_cac_bo = su_quan_ly.id_cac_bo JOIN bo_truong ON su_quan_ly.id_nguoi_dung_dau = bo_truong.id_nguoi_dung_dau WHERE bo_truong.sinh_ra_o_tieu_bang = 'Alabama'
SELECT sinh_ra_o_tieu_bang FROM bo_truong GROUP BY sinh_ra_o_tieu_bang HAVING COUNT(*) >= 3
SELECT nam_thanh_lap FROM cac_bo GROUP BY nam_thanh_lap ORDER BY COUNT(*) DESC LIMIT 1
SELECT cac_bo.ten, cac_bo.so_luong_nhan_vien FROM cac_bo JOIN su_quan_ly ON cac_bo.id_cac_bo = su_quan_ly.id_cac_bo JOIN bo_truong ON su_quan_ly.id_nguoi_dung_dau = bo_truong.id_nguoi_dung_dau WHERE su_quan_ly.vai_tro_tam_thoi IS NOT NULL
SELECT COUNT(DISTINCT vai_tro_tam_thoi) FROM su_quan_ly
SELECT COUNT(*) FROM cac_bo WHERE id_cac_bo NOT IN (SELECT id_cac_bo FROM bo_truong)
SELECT CAST(tuoi AS TEXT) FROM bo_truong UNION SELECT vai_tro_tam_thoi FROM su_quan_ly WHERE vai_tro_tam_thoi IS NOT NULL
SELECT sinh_ra_o_tieu_bang FROM bo_truong WHERE ten = 'Bộ trưởng Bộ Tài chính' INTERSECT SELECT sinh_ra_o_tieu_bang FROM bo_truong WHERE ten = 'Bộ trưởng Bộ An ninh nội địa'
SELECT T1.id_cac_bo, T1.ten, T2.id_nguoi_dung_dau, T2.ten, T2.sinh_ra_o_tieu_bang, T2.tuoi FROM cac_bo AS T1 JOIN bo_truong AS T2 ON T1.id_cac_bo = T2.id_nguoi_dung_dau JOIN su_quan_ly AS T3 ON T1.id_cac_bo = T3.id_cac_bo GROUP BY T1.id_cac_bo HAVING COUNT(*) > 1
SELECT id_nguoi_dung_dau, ten FROM bo_truong WHERE ten LIKE '%Ha%'
SELECT id FROM xe
SELECT id FROM xe
SELECT COUNT(*) FROM xe
SELECT COUNT(*) FROM xe
SELECT * FROM xe WHERE id = 1
SELECT chi_tiet_ve_xe FROM xe WHERE id = 1
SELECT ten, ten_dem, ho FROM nhan_vien
SELECT ten, ten_dem, ho FROM nhan_vien
SELECT ngay_sinh FROM nhan_vien WHERE ten = 'Janessa' AND ho = 'Sawayn'
SELECT ngay_sinh FROM nhan_vien WHERE ten = 'Janessa' AND ten_dem = 'Sawayn' AND ho = ''
SELECT ngay_nhan_vien_gia_nhap FROM nhan_vien WHERE ten = 'Janessa' AND ho = 'Sawayn'
SELECT ngay_nhan_vien_gia_nhap FROM nhan_vien WHERE ho = 'Sawayn' AND ten = 'Janessa'
SELECT ngay_nhan_vien_roi_di FROM nhan_vien WHERE ten = 'Janessa' AND ho = 'Sawayn'
SELECT ngay_nhan_vien_roi_di FROM nhan_vien WHERE ten = 'Janessa' AND ten_dem = 'Sawayn' AND ho = 'Sawayn'
SELECT COUNT(*) FROM nhan_vien WHERE ten = 'Ludie'
SELECT COUNT(*) FROM nhan_vien WHERE ten = 'Ludie'
SELECT biet_danh FROM nhan_vien WHERE ten = 'Janessa' AND ho = 'Sawayn'
SELECT biet_danh FROM nhan_vien WHERE ten = 'Janessa' AND ho = 'Sawayn'
SELECT COUNT(*) FROM nhan_vien
SELECT COUNT(*) FROM nhan_vien
SELECT dia_chi.thanh_pho FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ho = 'Sawayn'
SELECT T2.thanh_pho FROM khach_hang AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi_khach_hang = T2.id_dia_chi WHERE T1.ten = 'Sawayn' AND T1.ho = 'Janessa' AND T2.thanh_pho IS NOT NULL
SELECT dia_chi.quoc_gia, dia_chi.tieu_bang FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ho = 'Sawayn'
SELECT dia_chi.quoc_gia, dia_chi.tieu_bang FROM dia_chi JOIN khach_hang ON khach_hang.id_dia_chi_khach_hang = dia_chi.id_dia_chi WHERE khach_hang.ten = 'Sawayn' AND khach_hang.ho = 'Janessa'
SELECT ngay_dien_ra_bai_giang FROM bai_giang JOIN khach_hang ON bai_giang.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten = 'Rylan' AND khach_hang.ho = 'Goodwin' ORDER BY ngay_dien_ra_bai_giang DESC LIMIT 10
SELECT SUM(gia) FROM bai_giang JOIN khach_hang ON bai_giang.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ho = 'Goodwin' AND khach_hang.ten = 'Rylan'
SELECT dia_chi.ma_buu_dien FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ho = 'Sawayn'
SELECT dia_chi.ma_buu_dien FROM dia_chi JOIN nhan_vien ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ten_dem = 'Sawayn'
SELECT COUNT(*) FROM nhan_vien AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi_nhan_vien = T2.id_dia_chi WHERE T2.tieu_bang = 'Georgia'
SELECT COUNT(*) FROM nhan_vien AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi_nhan_vien = T2.id_dia_chi WHERE T2.quoc_gia = 'Georgia'
SELECT T1.ho, T1.ten FROM nhan_vien AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi_nhan_vien = T2.id_dia_chi WHERE T2.thanh_pho = 'Damianfort'
SELECT T1.ho, T1.ten FROM nhan_vien AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi_nhan_vien = T2.id_dia_chi WHERE T2.thanh_pho = 'Damianfort'
SELECT T1.thanh_pho, COUNT(*) AS so_luong_nhan_vien FROM nhan_vien JOIN dia_chi AS T1 ON nhan_vien.id_dia_chi_nhan_vien = T1.id_dia_chi GROUP BY T1.thanh_pho ORDER BY so_luong_nhan_vien DESC LIMIT 1
SELECT dia_chi.thanh_pho, COUNT(*) AS so_nhan_vien FROM nhan_vien JOIN dia_chi ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi GROUP BY dia_chi.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT tieu_bang FROM dia_chi JOIN nhan_vien ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi GROUP BY dia_chi.id_dia_chi HAVING COUNT(*) BETWEEN 2 AND 4
SELECT tieu_bang FROM dia_chi JOIN nhan_vien ON nhan_vien.id_dia_chi_nhan_vien = dia_chi.id_dia_chi GROUP BY tieu_bang HAVING COUNT(DISTINCT nhan_vien.id_nhan_vien) BETWEEN 2 AND 4
SELECT ho, ten FROM khach_hang
SELECT ho, ten FROM khach_hang
SELECT T1.dia_chi_email, T1.ngay_sinh FROM khach_hang AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi_khach_hang = T2.id_dia_chi WHERE T1.ten = 'Carole'
SELECT dia_chi_email, ngay_sinh FROM khach_hang WHERE ten = 'Carole'
SELECT khach_hang.so_dien_thoai, khach_hang.dia_chi_email FROM khach_hang WHERE khach_hang.so_tien_con_thieu > 2000
SELECT khach_hang.so_dien_thoai, khach_hang.dia_chi_email FROM khach_hang WHERE khach_hang.so_tien_con_thieu > 2000
SELECT ma_trang_thai_khach_hang, so_dien_thoai_di_dong, dia_chi_email FROM khach_hang WHERE ho = 'Kohler' OR ten = 'Marina'
SELECT ma_trang_thai_khach_hang, so_dien_thoai_di_dong, dia_chi_email FROM khach_hang WHERE ho='Kohler' OR ten='Marina'
SELECT ngay_sinh FROM khach_hang WHERE ma_trang_thai_khach_hang = 'Khách hàng tốt'
SELECT ngay_sinh FROM khach_hang WHERE ma_trang_thai_khach_hang = 'Khách hàng tốt' AND ngay_sinh IS NOT NULL
SELECT ngay_tro_thanh_khach_hang FROM khach_hang WHERE ten = 'Carole' AND ho = 'Bernhard'
SELECT ngay_tro_thanh_khach_hang FROM khach_hang WHERE ho = 'Bernhard' AND ten = 'Carole'
SELECT COUNT(*) FROM khach_hang
SELECT COUNT(*) FROM khach_hang
SELECT ma_trang_thai_khach_hang, COUNT(*) FROM khach_hang GROUP BY ma_trang_thai_khach_hang ORDER BY COUNT(*) DESC
SELECT ma_trang_thai_khach_hang, COUNT(*) FROM khach_hang GROUP BY ma_trang_thai_khach_hang
SELECT ma_trang_thai_khach_hang FROM khach_hang GROUP BY ma_trang_thai_khach_hang ORDER BY COUNT(*) ASC LIMIT 1
SELECT ma_trang_thai_khach_hang FROM khach_hang GROUP BY ma_trang_thai_khach_hang ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM bai_giang JOIN khach_hang ON bai_giang.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten = 'Rylan' AND khach_hang.ho = 'Goodwin' AND bai_giang.ma_trang_thai_bai_giang = 'completed'
SELECT COUNT(*) FROM bai_giang JOIN khach_hang ON bai_giang.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten = 'Goodwin' AND khach_hang.ho = 'Rylan'
SELECT MAX(so_tien_con_thieu) AS MAX_so_tien_con_thieu, MIN(so_tien_con_thieu) AS MIN_so_tien_con_thieu, AVG(so_tien_con_thieu) AS AVG_so_tien_con_thieu FROM khach_hang
SELECT MAX(so_tien_con_thieu) AS MAX_so_tien_con_thieu, MIN(so_tien_con_thieu) AS MIN_so_tien_con_thieu, AVG(so_tien_con_thieu) AS AVG_so_tien_con_thieu FROM khach_hang
SELECT ho, ten FROM khach_hang WHERE so_tien_con_thieu BETWEEN 1000 AND 3000
SELECT ho, ten FROM khach_hang WHERE so_tien_con_thieu BETWEEN 1000 AND 3000
SELECT T1.ho, T1.ten FROM khach_hang AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi_khach_hang = T2.id_dia_chi WHERE T2.thanh_pho = 'Lockmanfurt'
SELECT T1.ho, T1.ten FROM khach_hang AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi_khach_hang = T2.id_dia_chi WHERE T2.thanh_pho = 'Lockmanfurt'
SELECT T1.thanh_pho FROM dia_chi AS T1 JOIN khach_hang AS T2 ON T2.id_dia_chi_khach_hang = T1.id_dia_chi WHERE T2.ten = 'Carole' AND T2.ho = 'Bernhard'
SELECT T2.quoc_gia FROM khach_hang AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi_khach_hang = T2.id_dia_chi WHERE T1.ten = 'Carole' AND T1.ho = 'Bernhard'
SELECT T2.ma_buu_dien FROM khach_hang AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi_khach_hang = T2.id_dia_chi WHERE T1.ten = 'Carole' AND T1.ho = 'Bernhard'
SELECT T1.ma_buu_dien FROM khach_hang AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi_khach_hang = T2.id_dia_chi WHERE T1.ten = 'Carole' AND T1.ho = 'Bernhard'
SELECT T2.thanh_pho FROM khach_hang JOIN dia_chi AS T2 ON khach_hang.id_dia_chi_khach_hang = T2.id_dia_chi GROUP BY T2.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT dia_chi.thanh_pho FROM dia_chi JOIN khach_hang ON khach_hang.id_dia_chi_khach_hang = dia_chi.id_dia_chi GROUP BY dia_chi.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT SUM(khoan_thanh_toan_cua_khach_hang.so_tien_thanh_toan) FROM khoan_thanh_toan_cua_khach_hang JOIN khach_hang ON khoan_thanh_toan_cua_khach_hang.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten = 'Carole' AND khach_hang.ho = 'Bernhard'
SELECT SUM(khoan_thanh_toan_cua_khach_hang.so_tien_thanh_toan) FROM khoan_thanh_toan_cua_khach_hang JOIN khach_hang ON khoan_thanh_toan_cua_khach_hang.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten = 'Carole' AND khach_hang.ho = 'Bernhard'
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM khoan_thanh_toan_cua_khach_hang)
SELECT COUNT(*) FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM khoan_thanh_toan_cua_khach_hang)
SELECT khach_hang.ten, khach_hang.ho FROM khach_hang JOIN khoan_thanh_toan_cua_khach_hang ON khach_hang.id_khach_hang = khoan_thanh_toan_cua_khach_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang HAVING COUNT(*) > 2
SELECT khach_hang.ten, khach_hang.ho FROM khach_hang JOIN khoan_thanh_toan_cua_khach_hang ON khach_hang.id_khach_hang = khoan_thanh_toan_cua_khach_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang HAVING COUNT(*) > 2
SELECT ma_phuong_thuc_thanh_toan, COUNT(*) FROM khoan_thanh_toan_cua_khach_hang GROUP BY ma_phuong_thuc_thanh_toan ORDER BY COUNT(*) DESC
SELECT ma_phuong_thuc_thanh_toan, COUNT(*) FROM khoan_thanh_toan_cua_khach_hang GROUP BY ma_phuong_thuc_thanh_toan
SELECT COUNT(*) FROM bai_giang WHERE ma_trang_thai_bai_giang = 'Huỷ bỏ'
SELECT COUNT(*) FROM bai_giang WHERE ma_trang_thai_bai_giang = 'Canceled'
SELECT T1.id_bai_giang FROM bai_giang AS T1 JOIN nhan_vien AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien WHERE T2.ten = 'Janessa' AND T2.ho = 'Sawayn' AND T2.biet_danh LIKE '%s%'
SELECT id_bai_giang FROM bai_giang JOIN nhan_vien ON bai_giang.id_nhan_vien = nhan_vien.id_nhan_vien WHERE nhan_vien.ten = 'Janessa Sawayn' AND nhan_vien.biet_danh LIKE '%s%'
SELECT COUNT(*) FROM bai_giang JOIN nhan_vien ON bai_giang.id_nhan_vien = nhan_vien.id_nhan_vien WHERE nhan_vien.ten LIKE '%a%'
SELECT COUNT(*) FROM bai_giang JOIN nhan_vien ON bai_giang.id_nhan_vien = nhan_vien.id_nhan_vien WHERE nhan_vien.ten LIKE '%a%'
SELECT SUM(gia) FROM bai_giang JOIN nhan_vien ON bai_giang.id_nhan_vien = nhan_vien.id_nhan_vien WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ho = 'Sawayn'
SELECT SUM(gia) FROM bai_giang JOIN nhan_vien ON bai_giang.id_nhan_vien = nhan_vien.id_nhan_vien WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ten_dem = 'Sawayn'
SELECT AVG(bai_giang.gia) FROM bai_giang JOIN nhan_vien ON bai_giang.id_nhan_vien = nhan_vien.id_nhan_vien WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ho = 'Sawayn'
SELECT AVG(bai_giang.gia) FROM bai_giang JOIN nhan_vien ON bai_giang.id_nhan_vien = nhan_vien.id_nhan_vien WHERE nhan_vien.ten = 'Janessa' AND nhan_vien.ho = 'Sawayn'
SELECT COUNT(*) FROM bai_giang JOIN khach_hang ON bai_giang.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten = 'Ray'
SELECT COUNT(*) FROM bai_giang JOIN khach_hang ON bai_giang.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten = 'Ray'
SELECT ho FROM khach_hang UNION SELECT ho FROM nhan_vien
SELECT ho FROM khach_hang UNION SELECT ho FROM nhan_vien
SELECT ten FROM nhan_vien WHERE id_nhan_vien NOT IN (SELECT id_nhan_vien FROM bai_giang)
SELECT ten FROM nhan_vien WHERE id_nhan_vien NOT IN (SELECT id_nhan_vien FROM bai_giang)
SELECT xe.id, xe.chi_tiet_ve_xe FROM xe JOIN bai_giang ON xe.id = bai_giang.id_xe GROUP BY xe.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM nhan_vien
SELECT COUNT(*) FROM nhan_vien
SELECT ten FROM nhan_vien ORDER BY tuoi ASC
SELECT ten FROM nhan_vien ORDER BY tuoi ASC
SELECT thanh_pho, COUNT(*) FROM nhan_vien GROUP BY thanh_pho ORDER BY COUNT(*) DESC
SELECT thanh_pho, COUNT(*) FROM nhan_vien GROUP BY thanh_pho ORDER BY COUNT(*) DESC
SELECT thanh_pho FROM nhan_vien WHERE tuoi < 30 GROUP BY thanh_pho HAVING COUNT(*) > 1
SELECT thanh_pho FROM nhan_vien WHERE tuoi < 30 GROUP BY thanh_pho HAVING COUNT(*) > 1
SELECT cua_hang.dia_diem, COUNT(*) FROM cua_hang GROUP BY dia_diem ORDER BY COUNT(*) DESC
SELECT cua_hang.dia_diem, COUNT(*) FROM cua_hang GROUP BY dia_diem ORDER BY COUNT(*) DESC
SELECT cua_hang.ten_nguoi_quan_ly, cua_hang.quan FROM cua_hang ORDER BY cua_hang.so_luong_san_pham DESC LIMIT 1
SELECT ten_nguoi_quan_ly, quan FROM cua_hang ORDER BY so_luong_san_pham DESC LIMIT 1
SELECT so_luong_san_pham FROM cua_hang ORDER BY so_luong_san_pham DESC LIMIT 1 UNION SELECT so_luong_san_pham FROM cua_hang ORDER BY so_luong_san_pham ASC LIMIT 1
SELECT so_luong_san_pham FROM cua_hang ORDER BY so_luong_san_pham DESC LIMIT 1 UNION SELECT so_luong_san_pham FROM cua_hang ORDER BY so_luong_san_pham ASC LIMIT 1
SELECT ten, dia_diem, quan FROM cua_hang ORDER BY so_luong_san_pham DESC
SELECT ten, dia_diem, quan FROM cua_hang ORDER BY so_luong_san_pham DESC
SELECT ten FROM cua_hang WHERE so_luong_san_pham > (SELECT AVG(so_luong_san_pham) FROM cua_hang)
SELECT ten FROM cua_hang WHERE so_luong_san_pham > (SELECT AVG(so_luong_san_pham) FROM cua_hang)
SELECT T1.ten FROM nhan_vien AS T1 JOIN danh_gia AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien GROUP BY T1.id_nhan_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM danh_gia JOIN nhan_vien ON danh_gia.id_nhan_vien = nhan_vien.id_nhan_vien GROUP BY danh_gia.id_nhan_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM danh_gia JOIN nhan_vien ON danh_gia.id_nhan_vien = nhan_vien.id_nhan_vien ORDER BY tien_thuong DESC LIMIT 1
SELECT ten FROM danh_gia JOIN nhan_vien ON danh_gia.id_nhan_vien = nhan_vien.id_nhan_vien ORDER BY tien_thuong DESC LIMIT 1
SELECT ten FROM nhan_vien WHERE id_nhan_vien NOT IN (SELECT id_nhan_vien FROM danh_gia)
SELECT ten FROM nhan_vien WHERE id_nhan_vien NOT IN (SELECT id_nhan_vien FROM danh_gia)
SELECT T1.ten FROM cua_hang AS T1 JOIN tuyen_dung AS T2 ON T1.id_cua_hang = T2.id_cua_hang GROUP BY T1.id_cua_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.ten FROM cua_hang AS T1 JOIN tuyen_dung AS T2 ON T1.id_cua_hang = T2.id_cua_hang GROUP BY T1.id_cua_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM cua_hang WHERE id_cua_hang NOT IN (SELECT DISTINCT id_cua_hang FROM tuyen_dung)
SELECT ten FROM cua_hang WHERE id_cua_hang NOT IN (SELECT DISTINCT id_cua_hang FROM tuyen_dung)
SELECT T2.ten, COUNT(*) FROM tuyen_dung AS T1 JOIN nhan_vien AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien GROUP BY T1.id_cua_hang ORDER BY COUNT(*) DESC
SELECT cua_hang.ten, COUNT(tuyen_dung.id_nhan_vien) FROM cua_hang JOIN tuyen_dung ON cua_hang.id_cua_hang = tuyen_dung.id_cua_hang GROUP BY cua_hang.id_cua_hang, cua_hang.ten
SELECT SUM(danh_gia.tien_thuong) FROM danh_gia JOIN nhan_vien ON danh_gia.id_nhan_vien = nhan_vien.id_nhan_vien JOIN tuyen_dung ON nhan_vien.id_nhan_vien = tuyen_dung.id_nhan_vien JOIN cua_hang ON tuyen_dung.id_cua_hang = cua_hang.id_cua_hang WHERE cua_hang.quan = 'District 1' AND nhan_vien.tuoi > 25 AND tuyen_dung.bat_dau_tu BETWEEN '2020-01-01' AND '2023-12-31' AND danh_gia.nam_nhan_giai_thuong = '2022'
SELECT SUM(tien_thuong) FROM danh_gia
SELECT * FROM tuyen_dung JOIN nhan_vien ON tuyen_dung.id_nhan_vien = nhan_vien.id_nhan_vien JOIN cua_hang ON tuyen_dung.id_cua_hang = cua_hang.id_cua_hang
SELECT * FROM tuyen_dung JOIN nhan_vien ON tuyen_dung.id_nhan_vien = nhan_vien.id_nhan_vien JOIN cua_hang ON tuyen_dung.id_cua_hang = cua_hang.id_cua_hang
SELECT quan FROM cua_hang WHERE so_luong_san_pham < 3000 INTERSECT SELECT quan FROM cua_hang WHERE so_luong_san_pham > 10000
SELECT quan FROM cua_hang WHERE so_luong_san_pham < 3000 INTERSECT SELECT quan FROM cua_hang WHERE so_luong_san_pham > 10000
SELECT COUNT(DISTINCT dia_diem) FROM cua_hang
SELECT COUNT(DISTINCT dia_diem) FROM cua_hang
SELECT quoc_gia FROM hang_hang_khong WHERE ten_hang_hang_khong = 'JetBlue Airways'
SELECT quoc_gia FROM hang_hang_khong WHERE ten_hang_hang_khong = 'Jetblue Airways'
SELECT ten_viet_tat FROM hang_hang_khong WHERE ten_hang_hang_khong = 'JetBlue Airways'
SELECT ten_viet_tat FROM hang_hang_khong WHERE ten_hang_hang_khong = 'Jetblue Airways'
SELECT ten_hang_hang_khong, ten_viet_tat FROM hang_hang_khong WHERE quoc_gia = 'Hoa Kỳ'
SELECT ten_hang_hang_khong, ten_viet_tat FROM hang_hang_khong WHERE quoc_gia = 'Hoa Kỳ'
SELECT ma_san_bay, ten_san_bay FROM san_bay WHERE thanh_pho = 'Anthony'
SELECT ma_san_bay, ten_san_bay FROM san_bay WHERE thanh_pho = 'Anthony'
SELECT COUNT(*) FROM hang_hang_khong
SELECT COUNT(*) FROM hang_hang_khong
SELECT COUNT(*) FROM san_bay
SELECT COUNT(*) FROM san_bay
SELECT COUNT(*) FROM chuyen_bay
SELECT COUNT(*) FROM chuyen_bay
SELECT id_hang_hang_khong FROM hang_hang_khong WHERE ten_viet_tat = 'UAL'
SELECT ten_viet_tat FROM hang_hang_khong WHERE ten_viet_tat = 'UAL'
SELECT COUNT(*) FROM hang_hang_khong WHERE quoc_gia = 'Mỹ'
SELECT COUNT(*) FROM hang_hang_khong WHERE quoc_gia = 'Hoa Kỳ'
SELECT thanh_pho, quoc_gia FROM san_bay WHERE ten_san_bay = 'Alton'
SELECT thanh_pho, quoc_gia FROM san_bay WHERE ten_san_bay = 'Alton'
SELECT ten_san_bay FROM san_bay WHERE ma_san_bay = 'AKO'
SELECT ten_san_bay FROM san_bay WHERE ma_san_bay = 'AKO'
SELECT ten_san_bay FROM san_bay WHERE thanh_pho = 'Aberdeen'
SELECT ten_san_bay FROM san_bay WHERE thanh_pho = 'Aberdeen'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_khoi_hanh = T1.ma_san_bay WHERE T1.ma_san_bay = 'APG'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'APG'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.ten_san_bay = 'ATO'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'ATO'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_khoi_hanh = T1.ma_san_bay WHERE T1.thanh_pho = 'Aberdeen'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.thanh_pho = 'Aberdeen'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_dich = T1.ma_san_bay WHERE T1.thanh_pho = 'Aberdeen'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.thanh_pho = 'Aberdeen'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_khoi_hanh = T1.ma_san_bay JOIN san_bay AS T2 ON chuyen_bay.san_bay_dich = T2.ma_san_bay WHERE T1.thanh_pho = 'Aberdeen' AND T2.thanh_pho = 'Ashley'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_khoi_hanh = T1.ma_san_bay JOIN san_bay AS T2 ON chuyen_bay.san_bay_dich = T2.ma_san_bay WHERE T1.thanh_pho = 'Aberdeen' AND T2.thanh_pho = 'Ashley'
SELECT COUNT(*) FROM chuyen_bay WHERE hang_hang_khong = (SELECT id_hang_hang_khong FROM hang_hang_khong WHERE ten_hang_hang_khong = 'JetBlue Airways')
SELECT COUNT(*) FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong WHERE hang_hang_khong.ten_hang_hang_khong = 'Jetblue Airways'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_dich = T1.ma_san_bay WHERE chuyen_bay.hang_hang_khong = (SELECT id_hang_hang_khong FROM hang_hang_khong WHERE ten_hang_hang_khong = 'United Airlines') AND T1.ma_san_bay = 'ASY'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong WHERE san_bay.ma_san_bay = 'ASY' AND hang_hang_khong.ten_hang_hang_khong = 'United Airlines'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_khoi_hanh = T1.ma_san_bay WHERE chuyen_bay.hang_hang_khong = (SELECT id_hang_hang_khong FROM hang_hang_khong WHERE ten_hang_hang_khong = 'United Airlines') AND T1.ma_san_bay = 'AHD'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_khoi_hanh = T1.ma_san_bay JOIN hang_hang_khong AS T2 ON chuyen_bay.hang_hang_khong = T2.id_hang_hang_khong WHERE T1.ma_san_bay = 'AHD' AND T2.ten_hang_hang_khong = 'United Airlines'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_dich = T1.ma_san_bay WHERE hang_hang_khong = (SELECT id_hang_hang_khong FROM hang_hang_khong WHERE ten_hang_hang_khong = 'United Airlines') AND T1.thanh_pho = 'Aberdeen'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_dich = T1.ma_san_bay JOIN hang_hang_khong AS T2 ON chuyen_bay.hang_hang_khong = T2.id_hang_hang_khong WHERE T1.thanh_pho = 'Aberdeen' AND T2.ten_hang_hang_khong = 'United Airlines'
SELECT san_bay.thanh_pho FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay GROUP BY san_bay.ma_san_bay, san_bay.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_bay.thanh_pho FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay GROUP BY san_bay.ma_san_bay, san_bay.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_bay.thanh_pho FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay GROUP BY san_bay.ma_san_bay ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_bay.thanh_pho FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay GROUP BY san_bay.ma_san_bay, san_bay.thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT chuyen_bay.san_bay_dich, chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay GROUP BY chuyen_bay.san_bay_dich, chuyen_bay.so_hieu_chuyen_bay HAVING COUNT(*) = (SELECT COUNT(*) FROM chuyen_bay GROUP BY san_bay_dich ORDER BY COUNT(*) DESC LIMIT 1)
SELECT san_bay.ma_san_bay FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay GROUP BY san_bay.ma_san_bay ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_bay.ma_san_bay FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay GROUP BY san_bay.ma_san_bay ORDER BY COUNT(*) ASC LIMIT 1
SELECT san_bay.ma_san_bay, COUNT(*) AS so_chuyen_bay FROM san_bay LEFT JOIN chuyen_bay ON san_bay.ma_san_bay = chuyen_bay.san_bay_khoi_hanh OR san_bay.ma_san_bay = chuyen_bay.san_bay_dich GROUP BY san_bay.ma_san_bay ORDER BY so_chuyen_bay ASC LIMIT 1
SELECT hang_hang_khong.ten_hang_hang_khong FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong GROUP BY hang_hang_khong.id_hang_hang_khong ORDER BY COUNT(*) DESC LIMIT 1
SELECT hang_hang_khong.ten_hang_hang_khong FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong GROUP BY hang_hang_khong.id_hang_hang_khong ORDER BY COUNT(*) DESC LIMIT 1
SELECT hang_hang_khong.ten_viet_tat, hang_hang_khong.quoc_gia FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong GROUP BY hang_hang_khong.id_hang_hang_khong ORDER BY COUNT(*) ASC LIMIT 1
SELECT hang_hang_khong.ten_viet_tat, hang_hang_khong.quoc_gia FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong GROUP BY hang_hang_khong.id_hang_hang_khong ORDER BY COUNT(*) ASC LIMIT 1
SELECT hang_hang_khong.ten_hang_hang_khong FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'AHD' GROUP BY chuyen_bay.hang_hang_khong
SELECT hang_hang_khong.ten_hang_hang_khong FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'AHD' GROUP BY chuyen_bay.hang_hang_khong
SELECT hang_hang_khong.ten_hang_hang_khong FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'AHD' GROUP BY hang_hang_khong.id_hang_hang_khong
SELECT hang_hang_khong.ten_hang_hang_khong FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong WHERE san_bay.ma_san_bay = 'AHD' GROUP BY hang_hang_khong.id_hang_hang_khong
SELECT hang_hang_khong.ten_hang_hang_khong FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_khoi_hanh = T1.ma_san_bay JOIN san_bay AS T2 ON chuyen_bay.san_bay_dich = T2.ma_san_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong WHERE T1.ma_san_bay = 'APG' AND T2.ma_san_bay = 'CVO' GROUP BY hang_hang_khong.id_hang_hang_khong
SELECT hang_hang_khong.ten_hang_hang_khong FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_khoi_hanh = T1.ma_san_bay JOIN san_bay AS T2 ON chuyen_bay.san_bay_dich = T2.ma_san_bay WHERE T1.ma_san_bay = 'APG' AND T2.ma_san_bay = 'CVO' GROUP BY hang_hang_khong.id_hang_hang_khong HAVING COUNT(DISTINCT chuyen_bay.so_hieu_chuyen_bay) > 1
SELECT hang_hang_khong.ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong WHERE chuyen_bay.san_bay_khoi_hanh = 'CVO' EXCEPT SELECT hang_hang_khong.ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong WHERE chuyen_bay.san_bay_khoi_hanh = 'APG'
SELECT hang_hang_khong.ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong WHERE chuyen_bay.san_bay_khoi_hanh = 'CVO' EXCEPT SELECT hang_hang_khong.ten_hang_hang_khong FROM hang_hang_khong JOIN chuyen_bay ON hang_hang_khong.id_hang_hang_khong = chuyen_bay.hang_hang_khong WHERE chuyen_bay.san_bay_khoi_hanh = 'APG'
SELECT hang_hang_khong.ten_hang_hang_khong FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong GROUP BY hang_hang_khong.id_hang_hang_khong HAVING COUNT(*) >= 10
SELECT hang_hang_khong.ten_hang_hang_khong FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong GROUP BY hang_hang_khong.id_hang_hang_khong HAVING COUNT(*) >= 10
SELECT hang_hang_khong.ten_hang_hang_khong FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong GROUP BY hang_hang_khong.id_hang_hang_khong HAVING COUNT(*) < 200
SELECT hang_hang_khong.ten_hang_hang_khong FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong GROUP BY hang_hang_khong.id_hang_hang_khong HAVING COUNT(*) < 200
SELECT so_hieu_chuyen_bay FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong WHERE hang_hang_khong.ten_hang_hang_khong = 'United Airlines'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN hang_hang_khong ON chuyen_bay.hang_hang_khong = hang_hang_khong.id_hang_hang_khong WHERE hang_hang_khong.ten_hang_hang_khong = 'United Airlines'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'APG'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_khoi_hanh = san_bay.ma_san_bay WHERE san_bay.thanh_pho = 'APG'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'APG'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay ON chuyen_bay.san_bay_dich = san_bay.ma_san_bay WHERE san_bay.ma_san_bay = 'APG'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_khoi_hanh = T1.ma_san_bay WHERE T1.thanh_pho = 'Aberdeen'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_khoi_hanh = T1.ma_san_bay WHERE T1.thanh_pho = 'Aberdeen'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_dich = T1.ma_san_bay WHERE T1.thanh_pho = 'Aberdeen'
SELECT chuyen_bay.so_hieu_chuyen_bay FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_dich = T1.ma_san_bay WHERE T1.thanh_pho = 'Aberdeen'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_dich = T1.ma_san_bay WHERE T1.thanh_pho = 'Aberdeen' OR T1.thanh_pho = 'Abilene'
SELECT COUNT(*) FROM chuyen_bay JOIN san_bay AS T1 ON chuyen_bay.san_bay_dich = T1.ma_san_bay WHERE T1.thanh_pho = 'Aberdeen' OR T1.thanh_pho = 'Abilene'
SELECT ten_san_bay FROM san_bay WHERE ma_san_bay NOT IN (SELECT san_bay_khoi_hanh FROM chuyen_bay UNION SELECT san_bay_dich FROM chuyen_bay)
SELECT ten_san_bay FROM san_bay WHERE ma_san_bay NOT IN (SELECT san_bay_khoi_hanh FROM chuyen_bay UNION SELECT san_bay_dich FROM chuyen_bay)
SELECT COUNT(*) FROM tran_dau WHERE mua_giai > 2007
SELECT ngay FROM tran_dau ORDER BY doi_chu_nha DESC
SELECT mua_giai, doi_chu_nha, doi_khach FROM tran_dau
SELECT AVG(tran_dau_san_nha) AS trung_binh, MAX(tran_dau_san_nha) AS nhieu_nhat, MIN(tran_dau_san_nha) AS it_nhat FROM san_van_dong
SELECT so_luong_nguoi_tham_du_trung_binh FROM san_van_dong WHERE phan_tram_suc_chua > 100
SELECT cau_thu, so_luong_tran_dau, nguon_thong_tin FROM chan_thuong WHERE chan_thuong != 'đầu gối'
SELECT tran_dau.mua_giai FROM chan_thuong JOIN tran_dau ON chan_thuong.id_tran_dau = tran_dau.id WHERE chan_thuong.cau_thu = 'Walter Samuel'
SELECT tran_dau.id, tran_dau.ti_so, tran_dau.ngay FROM tran_dau JOIN chan_thuong ON tran_dau.id = chan_thuong.id_tran_dau GROUP BY tran_dau.id HAVING COUNT(*) >= 2
SELECT san_van_dong.id, san_van_dong.ten FROM san_van_dong JOIN tran_dau ON san_van_dong.id = tran_dau.id_san_van_dong JOIN chan_thuong ON tran_dau.id = chan_thuong.id_tran_dau GROUP BY san_van_dong.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_van_dong.id, san_van_dong.ten FROM san_van_dong JOIN tran_dau ON san_van_dong.id = tran_dau.id_san_van_dong JOIN chan_thuong ON tran_dau.id = chan_thuong.id_tran_dau GROUP BY san_van_dong.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT tran_dau.mua_giai, san_van_dong.ten FROM chan_thuong JOIN tran_dau ON chan_thuong.id_tran_dau = tran_dau.id JOIN san_van_dong ON tran_dau.id_san_van_dong = san_van_dong.id WHERE chan_thuong.chan_thuong LIKE '%chân%' OR chan_thuong.chan_thuong LIKE '%đầu gối%' GROUP BY tran_dau.mua_giai, san_van_dong.ten ORDER BY tran_dau.mua_giai DESC LIMIT 10
SELECT COUNT(DISTINCT nguon_thong_tin) FROM chan_thuong
SELECT COUNT(*) FROM tran_dau WHERE tran_dau.id NOT IN (SELECT id_tran_dau FROM chan_thuong)
SELECT COUNT(DISTINCT chan_thuong.chan_thuong) FROM chan_thuong JOIN tran_dau ON chan_thuong.id_tran_dau = tran_dau.id WHERE tran_dau.mua_giai = 2010
SELECT san_van_dong.ten FROM san_van_dong JOIN tran_dau ON san_van_dong.id = tran_dau.id_san_van_dong JOIN chan_thuong ON tran_dau.id = chan_thuong.id_tran_dau WHERE cau_thu = 'Walter Samuel' OR cau_thu = 'Thiago Motta' GROUP BY san_van_dong.id HAVING COUNT(DISTINCT cau_thu) = 2
SELECT ten, so_luong_nguoi_tham_du_trung_binh, tong_so_nguoi_tham_du FROM san_van_dong WHERE id NOT IN (SELECT id_san_van_dong FROM tran_dau JOIN chan_thuong ON tran_dau.id = chan_thuong.id_tran_dau)
SELECT ten FROM san_van_dong WHERE ten LIKE '% ngân hàng %'
SELECT ten, tran_dau_san_nha FROM san_van_dong ORDER BY tran_dau_san_nha DESC LIMIT 1
SELECT cau_thu, tran_dau.ngay FROM chan_thuong JOIN tran_dau ON chan_thuong.id_tran_dau = tran_dau.id ORDER BY tran_dau.mua_giai DESC
SELECT nam_phat_hanh FROM bo_phim WHERE tieu_de = 'Trò chơi bắt chước'
SELECT nam_phat_hanh FROM bo_phim WHERE tieu_de = 'Trò chơi bắt chước'
SELECT nam_sinh FROM dien_vien WHERE ten = 'Benedict Cumberbatch'
SELECT nam_sinh FROM dien_vien WHERE ten = 'Benedict Cumberbatch'
SELECT quoc_tich FROM dien_vien WHERE ten = 'Christoph Waltz' AND gioi_tinh = 'Nữ'
SELECT quoc_tich FROM dien_vien WHERE ten = 'Christoph Waltz'
SELECT tieu_de FROM bo_phim WHERE nam_phat_hanh = 2015 UNION SELECT tieu_de FROM phim_truyen_hinh_nhieu_tap WHERE nam_phat_hanh = 2015
SELECT ten FROM dien_vien WHERE noi_sinh = 'Tehran'
SELECT ten FROM dien_vien WHERE noi_sinh = 'Tehran'
SELECT ten FROM dien_vien WHERE noi_sinh = 'Tehran'
SELECT ten FROM dien_vien WHERE quoc_tich = 'Afghanistan'
SELECT ten FROM dien_vien WHERE quoc_tich = 'Afghanistan' AND ten IS NOT NULL
SELECT ten FROM dien_vien WHERE quoc_tich = 'Afghanistan'
SELECT ten FROM dien_vien WHERE nam_sinh = 1984
SELECT nam_sinh FROM dien_vien WHERE ten = 'Kevin Spacey'
SELECT nam_sinh FROM dien_vien WHERE ten = 'Kevin Spacey'
SELECT noi_sinh FROM dien_vien WHERE ten = 'Kevin Spacey'
SELECT noi_sinh FROM dien_vien WHERE ten = 'Kevin Spacey'
SELECT quoc_tich FROM dien_vien WHERE ten = 'Kevin Spacey'
SELECT ngan_sach FROM bo_phim WHERE tieu_de = 'Đi tìm Nemo'
SELECT bo_phim.tieu_de FROM bo_phim JOIN ban_quyen ON bo_phim.id_bo_phim = ban_quyen.id_se_ri_phim JOIN dao_dien_boi ON ban_quyen.id_se_ri_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Steven Spielberg' AND bo_phim.nam_phat_hanh > 2006
SELECT T1.ten FROM bo_phim AS T1 JOIN dao_dien_boi AS T2 ON T1.id_bo_phim = T2.id_se_ri_phim JOIN dao_dien AS T3 ON T2.id_dao_dien = T3.id_dao_dien WHERE T1.tieu_de = 'James Bond'
SELECT ten FROM dao_dien JOIN dao_dien_boi ON dao_dien.id_dao_dien = dao_dien_boi.id_dao_dien JOIN bo_phim ON dao_dien_boi.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'James Bond'
SELECT T3.ten FROM bo_phim AS T1 JOIN dao_dien_boi AS T2 ON T1.id_bo_phim = T2.id_se_ri_phim JOIN dao_dien AS T3 ON T2.id_dao_dien = T3.id_dao_dien WHERE T1.tieu_de = 'James Bond'
SELECT ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Trò chơi bắt chước' AND phan_vai.vai_dien = 'Alan Turing'
SELECT ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE vai_dien = 'Alan Turing' AND tieu_de = 'Trò chơi bắt chước'
SELECT ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien WHERE phan_vai.vai_dien = 'Alan Turing' AND phan_vai.id_se_ri_phim = (SELECT id_bo_phim FROM bo_phim WHERE tieu_de = 'Trò chơi bắt chước')
SELECT ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien WHERE phan_vai.vai_dien = 'Alan Turing' AND phan_vai.id_se_ri_phim = (SELECT id_se_ri_phim FROM bo_phim WHERE tieu_de = 'Trò chơi bắt chước')
SELECT T1.ten FROM dien_vien AS T1 JOIN phan_vai AS T2 ON T1.id_dien_vien = T2.id_dien_vien WHERE T2.vai_dien = 'Alan Turing' AND T2.id_se_ri_phim = (SELECT id_se_ri_phim FROM bo_phim WHERE tieu_de = 'Trò chơi bắt chước')
SELECT the_loai.the_loai FROM bo_phim JOIN phan_loai ON bo_phim.id_bo_phim = phan_loai.id_se_ri_phim JOIN the_loai ON phan_loai.id_the_loai = the_loai.id_the_loai WHERE bo_phim.tieu_de = 'Công viên kỷ Jura'
SELECT T1.ten FROM bo_phim AS T1 JOIN dao_dien_boi AS T2 ON T1.id_bo_phim = T2.id_se_ri_phim JOIN dao_dien AS T3 ON T2.id_dao_dien = T3.id_dao_dien WHERE T1.tieu_de = 'Niềm vui' AND T1.nam_phat_hanh = 2015
SELECT bo_phim.tieu_de FROM bo_phim JOIN duoc_viet_boi ON bo_phim.id_bo_phim = duoc_viet_boi.id_se_ri_phim JOIN nha_viet_kich_ban ON duoc_viet_boi.id_nha_viet_kich_ban = nha_viet_kich_ban.id_nha_viet_kich_ban WHERE nha_viet_kich_ban.ten = 'Matt Damon'
SELECT bo_phim.tieu_de FROM bo_phim JOIN duoc_lam_boi ON bo_phim.id_bo_phim = duoc_lam_boi.id_se_ri_phim JOIN nha_san_xuat ON duoc_lam_boi.id_nha_san_xuat = nha_san_xuat.id_nha_san_xuat JOIN duoc_viet_boi ON duoc_lam_boi.id_se_ri_phim = duoc_viet_boi.id_se_ri_phim JOIN nha_viet_kich_ban ON duoc_viet_boi.id_nha_viet_kich_ban = nha_viet_kich_ban.id_nha_viet_kich_ban WHERE nha_san_xuat.ten = 'Woody Allen' AND nha_viet_kich_ban.ten = 'Woody Allen'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Robin Wright'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Robin Wright'
SELECT T1.tieu_de FROM phan_vai AS T1 JOIN dien_vien AS T2 ON T1.id_dien_vien = T2.id_dien_vien JOIN bo_phim AS T3 ON T1.id_se_ri_phim = T3.id_bo_phim WHERE T2.ten = 'Robin Wright' UNION SELECT T1.tieu_de FROM phan_vai AS T1 JOIN dien_vien AS T2 ON T1.id_dien_vien = T2.id_dien_vien JOIN phim_truyen_hinh_nhieu_tap AS T3 ON T1.id_se_ri_phim = T3.id_se_ri_phim WHERE T2.ten = 'Robin Wright'
SELECT ngan_sach FROM bo_phim WHERE tieu_de = 'Juno' AND nam_phat_hanh = 2007
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_loai ON bo_phim.id_bo_phim = phan_loai.id_se_ri_phim JOIN the_loai ON phan_loai.id_the_loai = the_loai.id_the_loai WHERE the_loai.the_loai = 'Khoa học viễn tưởng' AND bo_phim.nam_phat_hanh = 2010
SELECT tieu_de FROM bo_phim WHERE nam_phat_hanh = 2010 AND id_bo_phim IN (SELECT id_se_ri_phim FROM phan_loai WHERE id_the_loai = (SELECT id_the_loai FROM the_loai WHERE the_loai = 'Khoa học viễn tưởng'))
SELECT ten FROM dien_vien WHERE noi_sinh = 'Austin' AND nam_sinh > 1980
SELECT ten FROM dien_vien WHERE noi_sinh = 'Austin' AND nam_sinh > 1980
SELECT ten FROM dien_vien WHERE noi_sinh = 'Austin' AND nam_sinh > 1980
SELECT bo_phim.tieu_de FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.noi_sinh = 'Los Angeles'
SELECT ten FROM dien_vien WHERE noi_sinh = 'Thành phố New York' AND nam_sinh = 1984
SELECT bo_phim.tieu_de FROM bo_phim JOIN nhan ON bo_phim.id_bo_phim = nhan.id_se_ri_phim JOIN tu_khoa ON nhan.id_tu_khoa = tu_khoa.id WHERE tu_khoa.tu_khoa = 'Vũ khí hạt nhân' UNION SELECT phim_truyen_hinh_nhieu_tap.tieu_de FROM phim_truyen_hinh_nhieu_tap JOIN nhan ON phim_truyen_hinh_nhieu_tap.id_se_ri_phim_truyen_hinh = nhan.id_se_ri_phim JOIN tu_khoa ON nhan.id_tu_khoa = tu_khoa.id WHERE tu_khoa.tu_khoa = 'Vũ khí hạt nhân'
SELECT bo_phim.tieu_de FROM bo_phim JOIN nhan ON bo_phim.id_bo_phim = nhan.id_se_ri_phim JOIN tu_khoa ON nhan.id_tu_khoa = tu_khoa.id WHERE tu_khoa.tu_khoa = 'Vũ khí hạt nhân'
SELECT bo_phim.tieu_de FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Alfred Hitchcock'
SELECT bo_phim.tieu_de FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dao_dien.ten = 'Asghar Farhadi' AND dien_vien.ten = 'Taraneh Alidoosti'
SELECT bo_phim.tieu_de FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dao_dien.ten = 'Asghar Farhadi' AND dien_vien.ten = 'Taraneh Alidoosti'
SELECT bo_phim.tieu_de FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dao_dien.ten = 'Asghar Farhadi' AND dien_vien.ten = 'Taraneh Alidoosti'
SELECT bo_phim.tieu_de FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dao_dien.ten = 'Asghar Farhad' AND dien_vien.ten = 'Taraneh Alidoosti'
SELECT bo_phim.tieu_de FROM bo_phim JOIN ban_quyen ON bo_phim.id_bo_phim = ban_quyen.id_se_ri_phim JOIN dao_dien_boi ON ban_quyen.id_se_ri_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Shonda Rhimes'
SELECT ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE vai_dien = 'Olivia Pope' AND tieu_de = 'Scandal'
SELECT nha_viet_kich_ban.ten FROM nha_viet_kich_ban JOIN duoc_viet_boi ON nha_viet_kich_ban.id_nha_viet_kich_ban = duoc_viet_boi.id_nha_viet_kich_ban JOIN bo_phim ON duoc_viet_boi.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Buổi diễn của Truman'
SELECT nha_viet_kich_ban.ten FROM nha_viet_kich_ban JOIN duoc_viet_boi ON nha_viet_kich_ban.id_nha_viet_kich_ban = duoc_viet_boi.id_nha_viet_kich_ban JOIN bo_phim ON duoc_viet_boi.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Buổi diễn của Truman'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Scott Foley'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Scott Foley'
SELECT T1.ten FROM dao_dien AS T1 JOIN phan_vai AS T2 ON T1.id_dao_dien = T2.id_dien_vien JOIN bo_phim AS T3 ON T2.id_se_ri_phim = T3.id_bo_phim WHERE T3.tieu_de = 'Titanic' AND T2.id_dien_vien = (SELECT id_dien_vien FROM dien_vien WHERE ten = 'Kate Winslet')
SELECT T1.ten FROM dao_dien AS T1 JOIN dao_dien_boi AS T2 ON T1.id_dao_dien = T2.id_dao_dien JOIN bo_phim AS T3 ON T2.id_se_ri_phim = T3.id_bo_phim JOIN phan_vai AS T4 ON T3.id_bo_phim = T4.id_se_ri_phim JOIN dien_vien AS T5 ON T4.id_dien_vien = T5.id_dien_vien WHERE T5.ten = 'Kate Winslet'
SELECT T3.ten FROM bo_phim AS T1 JOIN dao_dien_boi AS T2 ON T1.id_bo_phim = T2.id_se_ri_phim JOIN dao_dien AS T3 ON T2.id_dao_dien = T3.id_dao_dien WHERE T1.tieu_de = 'Ván bài chính trị' AND T1.nam_phat_hanh = 2013
SELECT ten FROM dien_vien WHERE gioi_tinh = 'Nữ' AND noi_sinh = 'Austin'
SELECT ten FROM dien_vien WHERE quoc_tich = 'Ý' AND nam_sinh > 1980
SELECT ten FROM dien_vien WHERE gioi_tinh = 'Nữ' AND noi_sinh = 'New York' AND nam_sinh > 1980
SELECT ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE dien_vien.gioi_tinh = 'Nữ' AND bo_phim.tieu_de = 'Giải cứu binh nhì Ryan'
SELECT ten FROM dao_dien WHERE quoc_tich = 'Afghanistan'
SELECT ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Nữ binh sĩ'
SELECT T1.ten FROM dien_vien AS T1 JOIN phan_vai AS T2 ON T1.id_dien_vien = T2.id_dien_vien JOIN bo_phim AS T3 ON T2.id_se_ri_phim = T3.id_bo_phim WHERE T1.quoc_tich = 'Canada' AND T3.tieu_de = 'James Bond'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Rowan Atkinson' AND phan_vai.vai_dien = 'Ngài Bean'
SELECT T1.noi_sinh FROM dao_dien AS T1 JOIN dao_dien_boi AS T2 ON T1.id_dao_dien = T2.id_dao_dien JOIN bo_phim AS T3 ON T2.id_se_ri_phim = T3.id_bo_phim WHERE T3.tieu_de = 'Quá khứ'
SELECT ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien WHERE vai_dien = 'Ngài Bean'
SELECT the_loai.the_loai FROM bo_phim JOIN phan_loai ON bo_phim.id_bo_phim = phan_loai.id_se_ri_phim JOIN the_loai ON phan_loai.id_the_loai = the_loai.id_the_loai JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Asghar Farhadi'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim WHERE phan_vai.vai_dien = 'Chú vịt Daffy'
SELECT vai_dien FROM phan_vai JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Ông bố chân dài' ORDER BY vai_dien DESC LIMIT 1
SELECT dao_dien.ten FROM dao_dien JOIN dao_dien_boi ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien JOIN bo_phim ON dao_dien_boi.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de LIKE 'Vũ khí hạt nhân'
SELECT COUNT(DISTINCT phan_vai.id_se_ri_phim) FROM phan_vai JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Jennifer Aniston' AND bo_phim.nam_phat_hanh > 2010
SELECT COUNT(*) FROM phan_vai JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Giải cứu binh nhì Ryan'
SELECT COUNT(DISTINCT phan_vai.id_dien_vien) FROM phan_vai JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Giải cứu binh nhì Ryan'
SELECT COUNT(*) FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Steven Spielberg'
SELECT COUNT(*) FROM bo_phim WHERE nam_phat_hanh = 2013
SELECT COUNT(*) FROM bo_phim WHERE nam_phat_hanh = 2013
SELECT bo_phim.nam_phat_hanh, COUNT(*) FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Woody Allen' GROUP BY bo_phim.nam_phat_hanh ORDER BY bo_phim.nam_phat_hanh
SELECT COUNT(DISTINCT phan_vai.id_se_ri_phim) FROM phan_vai JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Shahab Hosseini'
SELECT COUNT(DISTINCT phan_vai.id_se_ri_phim) FROM phan_vai JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Shahab Hosseini'
SELECT COUNT(*) FROM phan_vai JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Shahab Hosseini'
SELECT COUNT(DISTINCT phan_vai.id_se_ri_phim) FROM phan_vai JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Shahab Hosseini'
SELECT COUNT(*) FROM dien_vien WHERE noi_sinh = 'Los Angeles' AND nam_sinh > 2000
SELECT COUNT(*) FROM phan_vai JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Humphrey Bogart' AND bo_phim.nam_phat_hanh < 1942
SELECT COUNT(*) FROM phan_vai JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE phan_vai.id_dien_vien = (SELECT id_dien_vien FROM dien_vien WHERE ten = 'Brad Pitt') GROUP BY bo_phim.nam_phat_hanh ORDER BY bo_phim.nam_phat_hanh
SELECT COUNT(*) FROM bo_phim JOIN nhan ON bo_phim.id_bo_phim = nhan.id_se_ri_phim JOIN tu_khoa ON nhan.id_tu_khoa = tu_khoa.id WHERE tu_khoa.tu_khoa = 'Chiến tranh Iraq' AND bo_phim.nam_phat_hanh = 2015
SELECT COUNT(*) FROM bo_phim JOIN nhan ON bo_phim.id_bo_phim = nhan.id_se_ri_phim JOIN tu_khoa ON nhan.id_tu_khoa = tu_khoa.id WHERE tu_khoa.tu_khoa = 'Ba Tư' AND bo_phim.nam_phat_hanh > 1990
SELECT COUNT(*) FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Quentin Tarantino' AND bo_phim.nam_phat_hanh > 2010
SELECT COUNT(*) FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Quentin Tarantino' AND bo_phim.nam_phat_hanh < 2010
SELECT COUNT(*) FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Quentin Tarantino' AND (bo_phim.nam_phat_hanh < 2002 OR bo_phim.nam_phat_hanh > 2010)
SELECT COUNT(*) FROM dien_vien AS T1 WHERE gioi_tinh = 'Nữ' AND nam_sinh > 1980 AND noi_sinh = 'New York'
SELECT COUNT(*) FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN ban_quyen ON phan_vai.id_se_ri_phim = ban_quyen.id_se_ri_phim JOIN bo_phim ON ban_quyen.id_se_ri_phim = bo_phim.id_bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dien_vien.quoc_tich = 'Iran' AND dao_dien.ten = 'Jim Jarmusch'
SELECT COUNT(*) FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE dien_vien.quoc_tich = 'Trung Quốc' AND bo_phim.tieu_de = 'Giờ cao điểm 3'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Woody Strode' AND phan_vai.id_se_ri_phim IN (SELECT phan_vai.id_se_ri_phim FROM phan_vai JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Jason Robards') UNION SELECT phim_truyen_hinh_nhieu_tap.tieu_de FROM phim_truyen_hinh_nhieu_tap JOIN phan_vai ON phim_truyen_hinh_nhieu_tap.id_se_ri_phim_truyen_hinh = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Woody Strode' AND phan_vai.id_se_ri_phim IN (SELECT phan_vai.id_se_ri_phim FROM phan_vai JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Jason Robards')
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Woody Strode' AND phan_vai.id_se_ri_phim IN (SELECT phan_vai.id_se_ri_phim FROM phan_vai JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Jason Robards') UNION SELECT phim_truyen_hinh_nhieu_tap.tieu_de FROM phim_truyen_hinh_nhieu_tap JOIN phan_vai ON phim_truyen_hinh_nhieu_tap.id_se_ri_phim_truyen_hinh = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Woody Strode' AND phan_vai.id_se_ri_phim IN (SELECT phan_vai.id_se_ri_phim FROM phan_vai JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Jason Robards')
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim WHERE phan_vai.id_dien_vien = (SELECT id_dien_vien FROM dien_vien WHERE ten = 'Woody Strode') INTERSECT SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim WHERE phan_vai.id_dien_vien = (SELECT id_dien_vien FROM dien_vien WHERE ten = 'Jason Robards')
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Woody Strode' INTERSECT SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Jason Robards'
SELECT T1.ten FROM dien_vien AS T1 JOIN phan_vai AS T2 ON T1.id_dien_vien = T2.id_dien_vien WHERE T2.id_se_ri_phim IN (SELECT id_se_ri_phim FROM phan_vai WHERE id_dien_vien = (SELECT id_dien_vien FROM dien_vien WHERE ten = 'Tom Hanks')) ORDER BY T1.ten ASC
SELECT bo_phim.tieu_de FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Con đường cách mạng' UNION SELECT phim_truyen_hinh_nhieu_tap.tieu_de FROM phim_truyen_hinh_nhieu_tap JOIN dao_dien_boi ON phim_truyen_hinh_nhieu_tap.id_se_ri_phim_truyen_hinh = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Con đường cách mạng'
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_loai ON bo_phim.id_bo_phim = phan_loai.id_se_ri_phim GROUP BY bo_phim.id_bo_phim ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.tieu_de FROM bo_phim AS T1 JOIN phan_vai AS T2 ON T1.id_bo_phim = T2.id_se_ri_phim JOIN dien_vien AS T3 ON T2.id_dien_vien = T3.id_dien_vien WHERE T3.quoc_tich = 'Trung Quốc' GROUP BY T1.id_bo_phim ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM dien_vien JOIN phan_vai ON dien_vien.id_dien_vien = phan_vai.id_dien_vien JOIN bo_phim ON phan_vai.id_se_ri_phim = bo_phim.id_bo_phim WHERE bo_phim.tieu_de = 'Quentin Tarantino' ORDER BY bo_phim.nam_phat_hanh DESC LIMIT 1
SELECT bo_phim.tieu_de, bo_phim.ngan_sach FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Quentin Tarantino' ORDER BY bo_phim.nam_phat_hanh DESC LIMIT 1
SELECT bo_phim.tieu_de FROM bo_phim JOIN dao_dien_boi ON bo_phim.id_bo_phim = dao_dien_boi.id_se_ri_phim JOIN dao_dien ON dao_dien_boi.id_dao_dien = dao_dien.id_dao_dien WHERE dao_dien.ten = 'Jim Jarmusch' ORDER BY bo_phim.nam_phat_hanh DESC LIMIT 1
SELECT nha_san_xuat.ten FROM nha_san_xuat JOIN duoc_lam_boi ON nha_san_xuat.id_nha_san_xuat = duoc_lam_boi.id_nha_san_xuat GROUP BY nha_san_xuat.id_nha_san_xuat ORDER BY COUNT(DISTINCT duoc_lam_boi.id_dao_dien) DESC LIMIT 1
SELECT bo_phim.tieu_de FROM bo_phim JOIN phan_vai ON bo_phim.id_bo_phim = phan_vai.id_se_ri_phim JOIN dien_vien ON phan_vai.id_dien_vien = dien_vien.id_dien_vien WHERE dien_vien.ten = 'Gabriele Ferzetti' ORDER BY bo_phim.nam_phat_hanh DESC LIMIT 1
SELECT chi_tiet_khach_hang FROM khach_hang ORDER BY chi_tiet_khach_hang ASC
SELECT chi_tiet_khach_hang FROM khach_hang ORDER BY chi_tiet_khach_hang ASC
SELECT DISTINCT chinh_sach.ma_loai_chinh_sach FROM chinh_sach JOIN khach_hang ON chinh_sach.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.chi_tiet_khach_hang = 'Dayana Robel'
SELECT ma_loai_chinh_sach FROM chinh_sach JOIN khach_hang ON chinh_sach.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.chi_tiet_khach_hang = 'Dayana Robel'
SELECT ma_loai_chinh_sach FROM chinh_sach GROUP BY ma_loai_chinh_sach ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_chinh_sach FROM chinh_sach GROUP BY ma_loai_chinh_sach ORDER BY COUNT(*) DESC LIMIT 1
SELECT ma_loai_chinh_sach FROM chinh_sach GROUP BY ma_loai_chinh_sach HAVING COUNT(DISTINCT id_khach_hang) > 2
SELECT ma_loai_chinh_sach FROM chinh_sach GROUP BY ma_loai_chinh_sach HAVING COUNT(DISTINCT id_khach_hang) > 2
SELECT SUM(so_tien_duoc_tra) AS SUM_so_tien_duoc_tra, AVG(so_tien_duoc_tra) AS AVG_so_tien_duoc_tra FROM tieu_de_cua_yeu_cau
SELECT so_tien_duoc_yeu_cau FROM tai_lieu_cua_yeu_cau JOIN tieu_de_cua_yeu_cau ON tai_lieu_cua_yeu_cau.id_yeu_cau = tieu_de_cua_yeu_cau.id_tieu_de_cua_yeu_cau ORDER BY ngay_tao_ra DESC LIMIT 1
SELECT so_tien_duoc_yeu_cau FROM tai_lieu_cua_yeu_cau JOIN tieu_de_cua_yeu_cau ON tai_lieu_cua_yeu_cau.id_yeu_cau = tieu_de_cua_yeu_cau.id_tieu_de_cua_yeu_cau ORDER BY ngay_tao_ra DESC LIMIT 1
SELECT khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang JOIN tieu_de_cua_yeu_cau ON chinh_sach.id_chinh_sach = tieu_de_cua_yeu_cau.id_chinh_sach ORDER BY tieu_de_cua_yeu_cau.so_tien_duoc_yeu_cau DESC LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang JOIN tieu_de_cua_yeu_cau ON chinh_sach.id_chinh_sach = tieu_de_cua_yeu_cau.id_chinh_sach ORDER BY tieu_de_cua_yeu_cau.so_tien_duoc_yeu_cau DESC LIMIT 1
SELECT khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang JOIN tieu_de_cua_yeu_cau ON chinh_sach.id_chinh_sach = tieu_de_cua_yeu_cau.id_chinh_sach JOIN xu_ly_yeu_cau ON tieu_de_cua_yeu_cau.id_tieu_de_cua_yeu_cau = xu_ly_yeu_cau.id_yeu_cau WHERE xu_ly_yeu_cau.so_tien_duoc_tra = (SELECT MIN(so_tien_duoc_tra) FROM xu_ly_yeu_cau) ORDER BY xu_ly_yeu_cau.so_tien_duoc_tra ASC LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang JOIN tieu_de_cua_yeu_cau ON chinh_sach.id_chinh_sach = tieu_de_cua_yeu_cau.id_chinh_sach JOIN xu_ly_yeu_cau ON tieu_de_cua_yeu_cau.id_tieu_de_cua_yeu_cau = xu_ly_yeu_cau.id_yeu_cau WHERE xu_ly_yeu_cau.so_tien_duoc_tra = (SELECT MIN(so_tien_duoc_tra) FROM xu_ly_yeu_cau)
SELECT chi_tiet_khach_hang FROM khach_hang AS T1 WHERE T1.id_khach_hang NOT IN (SELECT id_khach_hang FROM chinh_sach)
SELECT chi_tiet_khach_hang FROM khach_hang WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM chinh_sach)
SELECT COUNT(*) FROM giai_doan_xu_ly_yeu_cau
SELECT COUNT(DISTINCT xu_ly_yeu_cau.id_giai_doan_xu_ly_yeu_cau) FROM xu_ly_yeu_cau JOIN giai_doan_xu_ly_yeu_cau ON xu_ly_yeu_cau.id_giai_doan_xu_ly_yeu_cau = giai_doan_xu_ly_yeu_cau.id_giai_doan_yeu_cau
SELECT ten_tinh_trang_yeu_cau, COUNT(*) FROM tieu_de_cua_yeu_cau JOIN xu_ly_yeu_cau ON tieu_de_cua_yeu_cau.id_tieu_de_cua_yeu_cau = xu_ly_yeu_cau.id_yeu_cau JOIN giai_doan_xu_ly_yeu_cau ON xu_ly_yeu_cau.id_giai_doan_xu_ly_yeu_cau = giai_doan_xu_ly_yeu_cau.id_giai_doan_yeu_cau GROUP BY ten_tinh_trang_yeu_cau ORDER BY COUNT(*) DESC LIMIT 1
SELECT giai_doan_xu_ly_yeu_cau.ten_tinh_trang_yeu_cau, COUNT(*) AS so_luong FROM giai_doan_xu_ly_yeu_cau JOIN xu_ly_yeu_cau ON giai_doan_xu_ly_yeu_cau.id_giai_doan_yeu_cau = xu_ly_yeu_cau.id_giai_doan_xu_ly_yeu_cau GROUP BY giai_doan_xu_ly_yeu_cau.ten_tinh_trang_yeu_cau ORDER BY so_luong DESC LIMIT 1
SELECT chi_tiet_khach_hang FROM khach_hang WHERE id_khach_hang LIKE '%Diana%'
SELECT chi_tiet_khach_hang FROM khach_hang WHERE chi_tiet_khach_hang LIKE '%Diana%'
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang WHERE chinh_sach.ma_loai_chinh_sach = 'Uỷ quyền'
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang WHERE chinh_sach.ma_loai_chinh_sach = 'Uỷ quyền'
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang WHERE chinh_sach.ma_loai_chinh_sach = 'Uỷ quyền' OR chinh_sach.ma_loai_chinh_sach = 'Thống nhất'
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang WHERE chinh_sach.ma_loai_chinh_sach = 'Uỷ quyền' OR chinh_sach.ma_loai_chinh_sach = 'Thống nhất'
SELECT chi_tiet_khach_hang FROM khach_hang UNION SELECT chi_tiet_nhan_vien FROM nhan_vien
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang, nhan_vien.id_nhan_vien, nhan_vien.chi_tiet_nhan_vien FROM khach_hang, nhan_vien
SELECT COUNT(*), ma_loai_chinh_sach FROM chinh_sach GROUP BY ma_loai_chinh_sach ORDER BY COUNT(*) DESC
SELECT ma_loai_chinh_sach, COUNT(*) FROM chinh_sach GROUP BY ma_loai_chinh_sach ORDER BY COUNT(*) DESC
SELECT khach_hang.chi_tiet_khach_hang, COUNT(*) AS so_chinh_sach FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY so_chinh_sach DESC LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM chinh_sach JOIN khach_hang ON chinh_sach.id_khach_hang = khach_hang.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT mo_ta_ve_tinh_trang_yeu_cau FROM giai_doan_xu_ly_yeu_cau WHERE ten_tinh_trang_yeu_cau = 'Mở'
SELECT mo_ta_ve_tinh_trang_yeu_cau FROM giai_doan_xu_ly_yeu_cau WHERE ten_tinh_trang_yeu_cau = 'Mở'
SELECT COUNT(*) FROM xu_ly_yeu_cau JOIN tieu_de_cua_yeu_cau ON xu_ly_yeu_cau.id_yeu_cau = tieu_de_cua_yeu_cau.id_tieu_de_cua_yeu_cau
SELECT COUNT(DISTINCT ma_ket_qua_cua_yeu_cau) FROM xu_ly_yeu_cau
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang ORDER BY chinh_sach.ngay_bat_dau DESC LIMIT 1
SELECT khach_hang.id_khach_hang, khach_hang.chi_tiet_khach_hang FROM khach_hang JOIN chinh_sach ON khach_hang.id_khach_hang = chinh_sach.id_khach_hang ORDER BY chinh_sach.ngay_bat_dau DESC LIMIT 1
SELECT su_kien.chi_tiet_su_kien FROM su_kien JOIN dich_vu ON su_kien.id_dich_vu = dich_vu.id_dich_vu WHERE dich_vu.ma_loai_dich_vu = 'Đám cưới'
SELECT id_su_kien, chi_tiet_su_kien FROM su_kien JOIN nguoi_tham_gia_su_kien ON su_kien.id_su_kien = nguoi_tham_gia_su_kien.id_su_kien GROUP BY id_su_kien HAVING COUNT(*) > 1
SELECT nguoi_tham_gia.id_nguoi_tham_gia, nguoi_tham_gia.ma_loai_nguoi_tham_gia, COUNT(*) FROM nguoi_tham_gia_su_kien JOIN nguoi_tham_gia ON nguoi_tham_gia_su_kien.id_nguoi_tham_gia = nguoi_tham_gia.id_nguoi_tham_gia GROUP BY nguoi_tham_gia.id_nguoi_tham_gia, nguoi_tham_gia.ma_loai_nguoi_tham_gia ORDER BY COUNT(*) DESC
SELECT id_nguoi_tham_gia, ma_loai_nguoi_tham_gia, chi_tiet_nguoi_tham_gia FROM nguoi_tham_gia
SELECT COUNT(*) FROM nguoi_tham_gia WHERE ma_loai_nguoi_tham_gia = 'Người tổ chức'
SELECT ma_loai_dich_vu FROM dich_vu ORDER BY ma_loai_dich_vu ASC
SELECT dich_vu.id_dich_vu, su_kien.id_su_kien, su_kien.chi_tiet_su_kien FROM dich_vu JOIN su_kien ON dich_vu.id_dich_vu = su_kien.id_dich_vu
SELECT COUNT(*) FROM su_kien JOIN nguoi_tham_gia_su_kien ON su_kien.id_su_kien = nguoi_tham_gia_su_kien.id_su_kien JOIN nguoi_tham_gia ON nguoi_tham_gia_su_kien.id_nguoi_tham_gia = nguoi_tham_gia.id_nguoi_tham_gia WHERE chi_tiet_nguoi_tham_gia LIKE '%Dr%' GROUP BY su_kien.id_su_kien HAVING COUNT(DISTINCT nguoi_tham_gia_su_kien.id_nguoi_tham_gia) > 0
SELECT ma_loai_nguoi_tham_gia FROM nguoi_tham_gia GROUP BY ma_loai_nguoi_tham_gia ORDER BY COUNT(*) DESC LIMIT 1
SELECT dich_vu.id_dich_vu, dich_vu.ma_loai_dich_vu FROM dich_vu JOIN su_kien ON dich_vu.id_dich_vu = su_kien.id_dich_vu JOIN nguoi_tham_gia_su_kien ON su_kien.id_su_kien = nguoi_tham_gia_su_kien.id_su_kien GROUP BY dich_vu.id_dich_vu ORDER BY COUNT(*) ASC LIMIT 1
SELECT id_su_kien FROM nguoi_tham_gia_su_kien GROUP BY id_su_kien ORDER BY COUNT(*) DESC LIMIT 1
SELECT id_su_kien FROM su_kien EXCEPT SELECT nguoi_tham_gia_su_kien.id_su_kien FROM nguoi_tham_gia_su_kien JOIN nguoi_tham_gia ON nguoi_tham_gia_su_kien.id_nguoi_tham_gia = nguoi_tham_gia.id_nguoi_tham_gia WHERE nguoi_tham_gia.chi_tiet_nguoi_tham_gia = 'Kenyatta Kuhn'
SELECT dich_vu.ma_loai_dich_vu FROM su_kien JOIN dich_vu ON su_kien.id_dich_vu = dich_vu.id_dich_vu WHERE su_kien.chi_tiet_su_kien IN ('Thành công', 'Thất bại') GROUP BY dich_vu.ma_loai_dich_vu
SELECT COUNT(*) FROM su_kien LEFT JOIN nguoi_tham_gia_su_kien ON su_kien.id_su_kien = nguoi_tham_gia_su_kien.id_su_kien WHERE nguoi_tham_gia_su_kien.id_nguoi_tham_gia IS NULL
SELECT COUNT(DISTINCT id_nguoi_tham_gia) FROM nguoi_tham_gia_su_kien
SELECT COUNT(*) FROM ky_thuat_vien
SELECT COUNT(*) FROM ky_thuat_vien
SELECT ten FROM ky_thuat_vien ORDER BY tuoi ASC
SELECT ten FROM ky_thuat_vien ORDER BY tuoi ASC
SELECT doi, nam_bat_dau FROM ky_thuat_vien
SELECT T1.doi, T1.nam_bat_dau FROM ky_thuat_vien AS T1 JOIN phan_cong_sua_chua AS T2 ON T1.id_ky_thuat_vien = T2.id_ky_thuat_vien GROUP BY T1.id_ky_thuat_vien ORDER BY T1.id_ky_thuat_vien
SELECT ten FROM ky_thuat_vien WHERE doi != 'NYY'
SELECT ten FROM ky_thuat_vien WHERE doi != 'NYY'
SELECT ten FROM ky_thuat_vien WHERE tuoi BETWEEN 36 AND 37
SELECT ten FROM ky_thuat_vien WHERE tuoi BETWEEN 36 AND 37
SELECT ky_thuat_vien.nam_bat_dau FROM ky_thuat_vien ORDER BY ky_thuat_vien.tuoi DESC LIMIT 1
SELECT ky_thuat_vien.nam_bat_dau FROM ky_thuat_vien ORDER BY ky_thuat_vien.nam_bat_dau ASC LIMIT 1
SELECT doi, COUNT(*) AS so_luong_ky_thuat_vien FROM ky_thuat_vien GROUP BY doi ORDER BY COUNT(*) DESC
SELECT doi, COUNT(*) FROM ky_thuat_vien GROUP BY doi
SELECT doi FROM ky_thuat_vien GROUP BY doi ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.doi FROM ky_thuat_vien AS T1 GROUP BY T1.doi ORDER BY COUNT(*) DESC LIMIT 1
SELECT doi FROM ky_thuat_vien GROUP BY doi HAVING COUNT(*) >= 2
SELECT doi FROM ky_thuat_vien GROUP BY doi HAVING COUNT(*) >= 2
SELECT ky_thuat_vien.ten, may_moc.loat_may FROM ky_thuat_vien JOIN phan_cong_sua_chua ON ky_thuat_vien.id_ky_thuat_vien = phan_cong_sua_chua.id_ky_thuat_vien JOIN may_moc ON phan_cong_sua_chua.id_may = may_moc.id_may
SELECT ky_thuat_vien.ten, may_moc.loat_may FROM ky_thuat_vien JOIN phan_cong_sua_chua ON ky_thuat_vien.id_ky_thuat_vien = phan_cong_sua_chua.id_ky_thuat_vien JOIN may_moc ON phan_cong_sua_chua.id_may = may_moc.id_may
SELECT ky_thuat_vien.ten FROM ky_thuat_vien JOIN phan_cong_sua_chua ON ky_thuat_vien.id_ky_thuat_vien = phan_cong_sua_chua.id_ky_thuat_vien JOIN may_moc ON phan_cong_sua_chua.id_may = may_moc.id_may ORDER BY may_moc.xep_hang_chat_luong ASC
SELECT ky_thuat_vien.ten FROM ky_thuat_vien JOIN phan_cong_sua_chua ON ky_thuat_vien.id_ky_thuat_vien = phan_cong_sua_chua.id_ky_thuat_vien JOIN may_moc ON phan_cong_sua_chua.id_may = may_moc.id_may ORDER BY may_moc.xep_hang_chat_luong ASC
SELECT ky_thuat_vien.ten FROM ky_thuat_vien JOIN phan_cong_sua_chua ON ky_thuat_vien.id_ky_thuat_vien = phan_cong_sua_chua.id_ky_thuat_vien JOIN may_moc ON phan_cong_sua_chua.id_may = may_moc.id_may WHERE may_moc.diem_gia_tri > 70
SELECT ky_thuat_vien.ten FROM ky_thuat_vien JOIN phan_cong_sua_chua ON ky_thuat_vien.id_ky_thuat_vien = phan_cong_sua_chua.id_ky_thuat_vien JOIN may_moc ON phan_cong_sua_chua.id_may = may_moc.id_may WHERE may_moc.diem_gia_tri > 70
SELECT ky_thuat_vien.ten, COUNT(*) AS so_luong_may FROM ky_thuat_vien JOIN phan_cong_sua_chua ON ky_thuat_vien.id_ky_thuat_vien = phan_cong_sua_chua.id_ky_thuat_vien GROUP BY ky_thuat_vien.id_ky_thuat_vien ORDER BY COUNT(*) DESC
SELECT ky_thuat_vien.ten, COUNT(phan_cong_sua_chua.id_may) FROM ky_thuat_vien JOIN phan_cong_sua_chua ON ky_thuat_vien.id_ky_thuat_vien = phan_cong_sua_chua.id_ky_thuat_vien GROUP BY ky_thuat_vien.id_ky_thuat_vien ORDER BY COUNT(phan_cong_sua_chua.id_may) DESC
SELECT ten FROM ky_thuat_vien WHERE id_ky_thuat_vien NOT IN (SELECT DISTINCT id_ky_thuat_vien FROM phan_cong_sua_chua)
SELECT ten FROM ky_thuat_vien WHERE id_ky_thuat_vien NOT IN (SELECT id_ky_thuat_vien FROM phan_cong_sua_chua)
SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi = 'CLE' INTERSECT SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi = 'CWS'
SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi = 'CLE' INTERSECT SELECT nam_bat_dau FROM ky_thuat_vien WHERE doi = 'CWS' ORDER BY nam_bat_dau
SELECT COUNT(*) FROM ong_kinh_may_anh WHERE do_dai_tieu_cu_theo_mm > 15
SELECT nhan_hieu, ten FROM ong_kinh_may_anh ORDER BY khau_do_toi_da DESC
SELECT id, mau_sac, ten FROM anh
SELECT MAX(chieu_cao) AS chieu_cao_toi_da, AVG(chieu_cao) AS chieu_cao_trung_binh FROM nui
SELECT AVG(nui.do_noi) FROM nui WHERE nui.quoc_gia = 'Morocco'
SELECT ten, chieu_cao, do_noi FROM nui WHERE ten NOT IN (SELECT T2.ten FROM anh T2 JOIN nui T3 ON T2.id_nui = T3.id WHERE T3.ten = 'Aberdare')
SELECT anh.id, anh.ten FROM anh JOIN nui ON anh.id_nui = nui.id WHERE nui.chieu_cao > 4000
SELECT nui.ten, nui.id FROM nui JOIN anh ON nui.id = anh.id_nui GROUP BY nui.id HAVING COUNT(anh.id) >= 2
SELECT ong_kinh_may_anh.nhan_hieu FROM anh JOIN nui ON anh.id_nui = nui.id JOIN ong_kinh_may_anh ON anh.id_ong_kinh_may_anh = ong_kinh_may_anh.id ORDER BY nui.chieu_cao DESC LIMIT 1
SELECT anh.ten FROM anh JOIN ong_kinh_may_anh ON anh.id_ong_kinh_may_anh = ong_kinh_may_anh.id WHERE ong_kinh_may_anh.nhan_hieu = 'Sigma' OR ong_kinh_may_anh.nhan_hieu = 'Olympus'
SELECT COUNT(DISTINCT nhan_hieu) FROM ong_kinh_may_anh
SELECT COUNT(*) FROM ong_kinh_may_anh WHERE id NOT IN (SELECT DISTINCT id_ong_kinh_may_anh FROM anh)
SELECT COUNT(DISTINCT anh.id_ong_kinh_may_anh) FROM anh JOIN nui ON anh.id_nui = nui.id JOIN ong_kinh_may_anh ON anh.id_ong_kinh_may_anh = ong_kinh_may_anh.id WHERE nui.quoc_gia = 'Ethiopia'
SELECT DISTINCT ong_kinh_may_anh.nhan_hieu FROM anh JOIN nui ON anh.id_nui = nui.id JOIN ong_kinh_may_anh ON anh.id_ong_kinh_may_anh = ong_kinh_may_anh.id WHERE nui.ten IN ('Toubkal Atlas', 'Lasta Massif')
SELECT ten, do_noi FROM nui AS T1 WHERE T1.id NOT IN (SELECT DISTINCT T2.id_nui FROM anh AS T2 JOIN ong_kinh_may_anh AS T3 ON T2.id_ong_kinh_may_anh = T3.id WHERE T3.nhan_hieu = 'Sigma')
SELECT ten FROM ong_kinh_may_anh WHERE ten LIKE '%Kỹ Thuật Số%'
SELECT ong_kinh_may_anh.ten, COUNT(*) FROM anh JOIN ong_kinh_may_anh ON anh.id_ong_kinh_may_anh = ong_kinh_may_anh.id GROUP BY ong_kinh_may_anh.ten ORDER BY COUNT(*) DESC
SELECT COUNT(*) FROM ban_nhac
SELECT COUNT(*) FROM ban_nhac
SELECT hang_thu_am FROM album
SELECT hang_thu_am FROM album
SELECT tieu_de FROM album WHERE nam = 2012
SELECT tieu_de FROM album WHERE nam = 2012
SELECT buoi_bieu_dien.vi_tri_tren_san_khau FROM buoi_bieu_dien JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten = 'Solveig'
SELECT buoi_bieu_dien.vi_tri_tren_san_khau FROM buoi_bieu_dien JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten = 'Solveig'
SELECT COUNT(*) FROM bai_hat
SELECT COUNT(*) FROM bai_hat
SELECT bai_hat.tieu_de FROM bai_hat JOIN buoi_bieu_dien ON bai_hat.id_bai_hat = buoi_bieu_dien.id_bai_hat JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Heilo'
SELECT bai_hat.tieu_de FROM bai_hat JOIN buoi_bieu_dien ON bai_hat.id_bai_hat = buoi_bieu_dien.id_bai_hat JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Hello'
SELECT COUNT(DISTINCT buoi_bieu_dien.nghe_si_trong_ban_nhac) FROM buoi_bieu_dien JOIN bai_hat ON buoi_bieu_dien.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Flash'
SELECT COUNT(DISTINCT nghe_si_trong_ban_nhac) FROM buoi_bieu_dien JOIN bai_hat ON buoi_bieu_dien.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Flash'
SELECT tieu_de FROM bai_hat JOIN nhac_cu ON bai_hat.id_bai_hat = nhac_cu.id_bai_hat JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten = 'Marianne'
SELECT tieu_de FROM bai_hat JOIN nhac_cu ON bai_hat.id_bai_hat = nhac_cu.id_bai_hat JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten = 'Marianne'
SELECT ban_nhac.ten, ban_nhac.ho FROM buoi_bieu_dien JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id WHERE buoi_bieu_dien.id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Badlands')
SELECT ho, ten FROM ban_nhac JOIN buoi_bieu_dien ON ban_nhac.id = buoi_bieu_dien.nghe_si_trong_ban_nhac JOIN bai_hat ON buoi_bieu_dien.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Badlands'
SELECT ban_nhac.ten, ban_nhac.ho FROM ban_nhac JOIN buoi_bieu_dien ON ban_nhac.id = buoi_bieu_dien.nghe_si_trong_ban_nhac JOIN bai_hat ON buoi_bieu_dien.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Badlands' AND buoi_bieu_dien.vi_tri_tren_san_khau = 'hậu trường'
SELECT ban_nhac.ten, ban_nhac.ho FROM buoi_bieu_dien JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id WHERE buoi_bieu_dien.vi_tri_tren_san_khau = 'hậu trường' AND buoi_bieu_dien.id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Badlands')
SELECT COUNT(DISTINCT hang_thu_am) FROM album
SELECT COUNT(DISTINCT hang_thu_am) FROM album
SELECT hang_thu_am FROM album GROUP BY hang_thu_am ORDER BY COUNT(*) DESC LIMIT 1
SELECT hang_thu_am FROM album GROUP BY hang_thu_am ORDER BY COUNT(*) DESC LIMIT 1
SELECT ban_nhac.ho FROM ban_nhac JOIN nhac_cu ON ban_nhac.id = nhac_cu.id_nghe_si_trong_ban_nhac GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT ban_nhac.ho FROM ban_nhac JOIN nhac_cu ON ban_nhac.id = nhac_cu.id_nghe_si_trong_ban_nhac GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT ban_nhac.ho FROM buoi_bieu_dien JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT ban_nhac.ho FROM buoi_bieu_dien JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT tieu_de FROM bai_hat WHERE tieu_de LIKE '%the%'
SELECT tieu_de FROM bai_hat WHERE tieu_de LIKE '% the%'
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id GROUP BY nhac_cu.nhac_cu HAVING COUNT(*) > 1 ORDER BY nhac_cu.nhac_cu LIMIT 1000
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN buoi_bieu_dien ON nhac_cu.id_nghe_si_trong_ban_nhac = buoi_bieu_dien.nghe_si_trong_ban_nhac AND nhac_cu.id_bai_hat = buoi_bieu_dien.id_bai_hat GROUP BY nhac_cu.nhac_cu
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Heilo' AND nhac_cu.id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Le Pop')
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Heilo' AND nhac_cu.id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Le Pop')
SELECT nhac_cu.nhac_cu, COUNT(*) AS count FROM nhac_cu GROUP BY nhac_cu.nhac_cu ORDER BY count DESC LIMIT 1
SELECT nhac_cu.nhac_cu, COUNT(*) AS count FROM nhac_cu GROUP BY nhac_cu.nhac_cu ORDER BY count DESC LIMIT 1
SELECT COUNT(*) FROM nhac_cu WHERE nhac_cu.nhac_cu = 'trống'
SELECT COUNT(*) FROM nhac_cu WHERE nhac_cu.nhac_cu = 'trống'
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN bai_hat ON nhac_cu.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Le Pop'
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN bai_hat ON nhac_cu.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Le Pop'
SELECT COUNT(*) FROM nhac_cu WHERE id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Le Pop')
SELECT COUNT(DISTINCT nhac_cu.nhac_cu) FROM nhac_cu JOIN bai_hat ON nhac_cu.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Le Pop'
SELECT COUNT(DISTINCT nhac_cu.nhac_cu) FROM nhac_cu JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Heilo'
SELECT COUNT(DISTINCT nhac_cu.nhac_cu) FROM nhac_cu JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Hello'
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Heilo'
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Hello'
SELECT bai_hat.tieu_de FROM bai_hat JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat GROUP BY bai_hat.id_bai_hat ORDER BY COUNT(*) DESC LIMIT 1
SELECT giong_hat.id_bai_hat, COUNT(*) AS count FROM giong_hat GROUP BY giong_hat.id_bai_hat ORDER BY count DESC LIMIT 1
SELECT loai FROM giong_hat GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai FROM giong_hat GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Hello'
SELECT loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Hello'
SELECT loai FROM giong_hat JOIN bai_hat ON giong_hat.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Le Pop' GROUP BY loai
SELECT loai FROM giong_hat JOIN bai_hat ON giong_hat.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Le Pop'
SELECT COUNT(DISTINCT giong_hat.loai) FROM giong_hat JOIN bai_hat ON giong_hat.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Demon Kitty Rag'
SELECT COUNT(DISTINCT loai) FROM giong_hat JOIN bai_hat ON giong_hat.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Demon Kitty Rag'
SELECT COUNT(*) FROM giong_hat WHERE loai = 'chính'
SELECT COUNT(*) FROM giong_hat WHERE loai = 'chính'
SELECT loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten = 'Solveig' AND giong_hat.id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Quán bar ở Amsterdam')
SELECT loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten = 'Solveig' AND giong_hat.id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Quán bar ở Amsterdam')
SELECT tieu_de FROM bai_hat WHERE id_bai_hat NOT IN (SELECT id_bai_hat FROM giong_hat)
SELECT tieu_de FROM bai_hat WHERE id_bai_hat NOT IN (SELECT id_bai_hat FROM giong_hat WHERE loai = 'chinh')
SELECT DISTINCT loai FROM giong_hat
SELECT loai FROM giong_hat GROUP BY loai
SELECT tieu_de FROM album WHERE nam = 2010
SELECT tieu_de, nam, hang_thu_am, loai FROM album WHERE nam = 2010
SELECT ban_nhac.ten FROM bai_hat JOIN buoi_bieu_dien ON bai_hat.id_bai_hat = buoi_bieu_dien.id_bai_hat JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id WHERE bai_hat.tieu_de = 'Le Pop'
SELECT ban_nhac.ten, ban_nhac.ho FROM buoi_bieu_dien JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id WHERE buoi_bieu_dien.id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Le Pop')
SELECT ban_nhac.ho FROM ban_nhac JOIN nhac_cu ON ban_nhac.id = nhac_cu.id_nghe_si_trong_ban_nhac GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT ban_nhac.ho FROM ban_nhac JOIN nhac_cu ON ban_nhac.id = nhac_cu.id_nghe_si_trong_ban_nhac GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Heilo' AND nhac_cu.id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Badlands')
SELECT nhac_cu.nhac_cu FROM nhac_cu JOIN ban_nhac ON nhac_cu.id_nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Hello' AND nhac_cu.id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Badlands')
SELECT COUNT(*) FROM nhac_cu WHERE id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Badlands')
SELECT COUNT(DISTINCT nhac_cu.nhac_cu) FROM nhac_cu JOIN bai_hat ON nhac_cu.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Badlands'
SELECT loai FROM giong_hat JOIN bai_hat ON giong_hat.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Badlands' GROUP BY loai
SELECT T1.loai FROM giong_hat AS T1 JOIN bai_hat AS T2 ON T1.id_bai_hat = T2.id_bai_hat WHERE T2.tieu_de = 'Badlands'
SELECT COUNT(DISTINCT giong_hat.loai) FROM giong_hat JOIN bai_hat ON giong_hat.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Le Pop'
SELECT COUNT(DISTINCT loai) FROM giong_hat JOIN bai_hat ON giong_hat.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Le Pop'
SELECT COUNT(*) FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id GROUP BY giong_hat.id_bai_hat HAVING COUNT(DISTINCT giong_hat.nghe_si_trong_ban_nhac) > 1
SELECT COUNT(DISTINCT giong_hat.id_bai_hat) FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id GROUP BY giong_hat.id_bai_hat HAVING COUNT(DISTINCT giong_hat.nghe_si_trong_ban_nhac) > 1
SELECT tieu_de FROM bai_hat WHERE id_bai_hat NOT IN (SELECT id_bai_hat FROM giong_hat WHERE loai = 'phu')
SELECT tieu_de FROM bai_hat WHERE id_bai_hat NOT IN (SELECT id_bai_hat FROM giong_hat WHERE loai = 'phu')
SELECT loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten = 'Solveig' GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten = 'Solveig' GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id JOIN bai_hat ON giong_hat.id_bai_hat = bai_hat.id_bai_hat WHERE ban_nhac.ho = 'Hello' AND bai_hat.tieu_de = 'Der Kapitan'
SELECT loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Hello' AND giong_hat.id_bai_hat = (SELECT id_bai_hat FROM bai_hat WHERE tieu_de = 'Der Kapitan')
SELECT ban_nhac.ten FROM buoi_bieu_dien JOIN ban_nhac ON buoi_bieu_dien.nghe_si_trong_ban_nhac = ban_nhac.id GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT ban_nhac.ten FROM ban_nhac JOIN buoi_bieu_dien ON ban_nhac.id = buoi_bieu_dien.nghe_si_trong_ban_nhac GROUP BY ban_nhac.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ten = 'Marianne' GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT loai FROM giong_hat JOIN ban_nhac ON giong_hat.nghe_si_trong_ban_nhac = ban_nhac.id WHERE ban_nhac.ho = 'Marianne' GROUP BY loai ORDER BY COUNT(*) DESC LIMIT 1
SELECT ban_nhac.ten, ban_nhac.ho FROM ban_nhac JOIN buoi_bieu_dien ON ban_nhac.id = buoi_bieu_dien.nghe_si_trong_ban_nhac JOIN bai_hat ON buoi_bieu_dien.id_bai_hat = bai_hat.id_bai_hat WHERE buoi_bieu_dien.vi_tri_tren_san_khau = 'hậu trường' AND bai_hat.tieu_de = 'Der Kapitan'
SELECT ban_nhac.ten, ban_nhac.ho FROM ban_nhac JOIN buoi_bieu_dien ON ban_nhac.id = buoi_bieu_dien.nghe_si_trong_ban_nhac JOIN bai_hat ON buoi_bieu_dien.id_bai_hat = bai_hat.id_bai_hat WHERE bai_hat.tieu_de = 'Der Kapitan'
SELECT tieu_de FROM bai_hat WHERE id_bai_hat NOT IN (SELECT id_bai_hat FROM giong_hat WHERE loai = 'phu')
SELECT bai_hat.tieu_de FROM bai_hat JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat WHERE giong_hat.loai != 'phu' EXCEPT SELECT bai_hat.tieu_de FROM bai_hat JOIN giong_hat ON bai_hat.id_bai_hat = giong_hat.id_bai_hat WHERE giong_hat.loai = 'phu'
SELECT bai_hat.tieu_de FROM bai_hat JOIN danh_sach_bai_hat ON bai_hat.id_bai_hat = danh_sach_bai_hat.id_bai_hat JOIN album ON danh_sach_bai_hat.id_album = album.id_album WHERE album.tieu_de = 'Một nụ hôn trước khi bạn ra đi : Sống ở Hamburg'
SELECT bai_hat.tieu_de FROM bai_hat JOIN danh_sach_bai_hat ON bai_hat.id_bai_hat = danh_sach_bai_hat.id_bai_hat JOIN album ON danh_sach_bai_hat.id_album = album.id_album WHERE album.tieu_de = 'Một nụ hôn trước khi bạn ra đi : Sống ở Hamburg'
SELECT bai_hat.tieu_de FROM bai_hat JOIN danh_sach_bai_hat ON bai_hat.id_bai_hat = danh_sach_bai_hat.id_bai_hat JOIN album ON danh_sach_bai_hat.id_album = album.id_album WHERE album.hang_thu_am = 'Universal Music Group'
SELECT bai_hat.tieu_de FROM bai_hat JOIN danh_sach_bai_hat ON bai_hat.id_bai_hat = danh_sach_bai_hat.id_bai_hat JOIN album ON danh_sach_bai_hat.id_album = album.id_album WHERE album.hang_thu_am = 'Universal Music Group'
SELECT COUNT(*) FROM bai_hat JOIN danh_sach_bai_hat ON bai_hat.id_bai_hat = danh_sach_bai_hat.id_bai_hat JOIN album ON danh_sach_bai_hat.id_album = album.id_album WHERE album.loai = 'phòng thu' GROUP BY bai_hat.id_bai_hat HAVING COUNT(*) = (SELECT COUNT(*) FROM album WHERE loai = 'phòng thu')
SELECT COUNT(*) FROM bai_hat JOIN danh_sach_bai_hat ON bai_hat.id_bai_hat = danh_sach_bai_hat.id_bai_hat WHERE danh_sach_bai_hat.id_album = (SELECT id_album FROM album WHERE tieu_de = 'phòng thu')
SELECT khach_hang.khach_hang_tot_hay_xau FROM khach_hang JOIN phieu_giam_gia ON khach_hang.id_phieu_giam_gia = phieu_giam_gia.id_phieu_giam_gia WHERE phieu_giam_gia.so_tien_giam_gia = 500
SELECT khach_hang.id_khach_hang, khach_hang.ten, COUNT(luot_dat_mua.id_dat_mua) FROM khach_hang JOIN luot_dat_mua ON khach_hang.id_khach_hang = luot_dat_mua.id_khach_hang GROUP BY khach_hang.id_khach_hang, khach_hang.ten ORDER BY COUNT(luot_dat_mua.id_dat_mua) DESC
SELECT khach_hang.id_khach_hang, SUM(luot_dat_mua.so_tien_phai_tra) AS tong_tien FROM khach_hang JOIN luot_dat_mua ON khach_hang.id_khach_hang = luot_dat_mua.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY SUM(luot_dat_mua.so_tien_phai_tra) DESC LIMIT 1
SELECT luot_dat_mua.id_dat_mua, luot_dat_mua.so_tien_hoan_tra FROM luot_dat_mua JOIN thanh_toan ON thanh_toan.id_dat_mua = luot_dat_mua.id_dat_mua GROUP BY luot_dat_mua.id_dat_mua ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_pham_duoc_dat.id_san_pham FROM san_pham_duoc_dat JOIN luot_dat_mua ON san_pham_duoc_dat.id_dat_mua = luot_dat_mua.id_dat_mua GROUP BY san_pham_duoc_dat.id_san_pham HAVING COUNT(*) >= 3
SELECT mo_ta_san_pham FROM san_pham_cho_thue JOIN san_pham_duoc_dat ON san_pham_cho_thue.id_san_pham = san_pham_duoc_dat.id_san_pham JOIN luot_dat_mua ON san_pham_duoc_dat.id_dat_mua = luot_dat_mua.id_dat_mua WHERE so_tien_da_dat = 102.76
SELECT luot_dat_mua.ngay_bat_dau_dat_mua, luot_dat_mua.ngay_ket_thuc_dat_mua FROM luot_dat_mua JOIN san_pham_duoc_dat ON luot_dat_mua.id_dat_mua = san_pham_duoc_dat.id_dat_mua JOIN san_pham_cho_thue ON san_pham_duoc_dat.id_san_pham = san_pham_cho_thue.id_san_pham WHERE san_pham_cho_thue.ten_san_pham = 'Bộ sưu tập sách'
SELECT ten_san_pham FROM san_pham_cho_thue JOIN san_pham_co_san ON san_pham_cho_thue.id_san_pham = san_pham_co_san.id_san_pham WHERE co_san_hay_khong = 'có' ORDER BY ten_san_pham ASC
SELECT COUNT(DISTINCT ma_loai_san_pham) FROM san_pham_cho_thue
SELECT ho, ten, gioi_tinh FROM khach_hang WHERE khach_hang_tot_hay_xau = 'tot' ORDER BY ho
SELECT AVG(so_tien_no) FROM thanh_toan
SELECT MAX(cnt) AS max_count FROM (SELECT COUNT(*) AS cnt FROM san_pham_duoc_dat GROUP BY id_san_pham) UNION SELECT MIN(cnt) AS min_count FROM (SELECT COUNT(*) AS cnt FROM san_pham_duoc_dat GROUP BY id_san_pham) UNION SELECT AVG(cnt) AS avg_count FROM (SELECT COUNT(*) AS cnt FROM san_pham_duoc_dat GROUP BY id_san_pham)
SELECT DISTINCT ma_loai_thanh_toan FROM thanh_toan
SELECT chi_phi_thue_hang_ngay FROM san_pham_cho_thue WHERE ten_san_pham LIKE '%Sách%'
SELECT COUNT(*) FROM san_pham_cho_thue WHERE id_san_pham NOT IN (SELECT DISTINCT id_san_pham FROM san_pham_duoc_dat) AND chi_phi_thue_hang_ngay > 200
SELECT phieu_giam_gia.so_tien_giam_gia FROM phieu_giam_gia JOIN khach_hang ON phieu_giam_gia.id_phieu_giam_gia = khach_hang.id_phieu_giam_gia WHERE khach_hang.khach_hang_tot_hay_xau IN ('tốt', 'xấu') GROUP BY phieu_giam_gia.id_phieu_giam_gia HAVING COUNT(DISTINCT khach_hang.id_khach_hang) > 1
SELECT ngay_thanh_toan FROM thanh_toan WHERE so_tien_da_tra > 300 OR ma_loai_thanh_toan = 'Giao dịch'
SELECT ten_san_pham, mo_ta_san_pham FROM san_pham_cho_thue WHERE ma_loai_san_pham = 'Dao kéo' AND chi_phi_thue_hang_ngay < 20
SELECT ten_nha_hang FROM nha_hang
SELECT dia_chi FROM nha_hang WHERE ten_nha_hang = 'Subway'
SELECT danh_gia_xep_hang FROM nha_hang WHERE ten_nha_hang = 'Subway'
SELECT ten_loai_nha_hang FROM loai_nha_hang
SELECT mo_ta_ve_loai_nha_hang FROM loai_nha_hang WHERE ten_loai_nha_hang = 'Sandwich'
SELECT ten_nha_hang, danh_gia_xep_hang FROM nha_hang ORDER BY danh_gia_xep_hang DESC LIMIT 1
SELECT tuoi FROM sinh_vien WHERE ho = 'Smith' AND ten = 'Linda'
SELECT gioi_tinh FROM sinh_vien WHERE ho = 'Smith' AND ten = 'Linda'
SELECT ho, ten FROM sinh_vien WHERE chuyen_nganh = 600
SELECT ma_thanh_pho FROM sinh_vien WHERE ho = 'Smith' AND ten = 'Linda'
SELECT COUNT(*) FROM sinh_vien WHERE co_van = 1121
SELECT sinh_vien.co_van, COUNT(*) AS so_luong FROM sinh_vien GROUP BY sinh_vien.co_van ORDER BY so_luong DESC LIMIT 1
SELECT chuyen_nganh, COUNT(*) AS so_luong FROM sinh_vien GROUP BY chuyen_nganh ORDER BY so_luong ASC LIMIT 1
SELECT chuyen_nganh, COUNT(*) AS so_luong FROM sinh_vien GROUP BY chuyen_nganh HAVING COUNT(*) BETWEEN 2 AND 30 ORDER BY COUNT(*)
SELECT ho, ten FROM sinh_vien WHERE tuoi > 18 AND chuyen_nganh = 600
SELECT ho, ten FROM sinh_vien WHERE gioi_tinh = 'Nữ' AND tuoi > 18 AND chuyen_nganh != 600
SELECT COUNT(DISTINCT nha_hang.id_nha_hang) FROM nha_hang JOIN loai_cua_nha_hang ON nha_hang.id_nha_hang = loai_cua_nha_hang.id_nha_hang JOIN loai_nha_hang ON loai_cua_nha_hang.id_loai_nha_hang = loai_nha_hang.id_loai_nha_hang WHERE loai_nha_hang.ten_loai_nha_hang = 'Sandwich'
SELECT SUM(thoi_gian_danh_ra) FROM luot_ghe_tham_nha_hang JOIN sinh_vien ON luot_ghe_tham_nha_hang.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Smith' AND sinh_vien.ten = 'Linda'
SELECT COUNT(*) FROM luot_ghe_tham_nha_hang JOIN nha_hang ON luot_ghe_tham_nha_hang.id_nha_hang = nha_hang.id_nha_hang JOIN sinh_vien ON luot_ghe_tham_nha_hang.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Smith' AND sinh_vien.ten = 'Linda' AND nha_hang.ten_nha_hang = 'Subway'
SELECT luot_ghe_tham_nha_hang.thoi_gian FROM luot_ghe_tham_nha_hang JOIN nha_hang ON luot_ghe_tham_nha_hang.id_nha_hang = nha_hang.id_nha_hang JOIN sinh_vien ON luot_ghe_tham_nha_hang.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.ho = 'Smith' AND sinh_vien.ten = 'Linda' AND nha_hang.ten_nha_hang = 'Subway'
SELECT nha_hang.ten_nha_hang, SUM(luot_ghe_tham_nha_hang.thoi_gian_danh_ra) FROM luot_ghe_tham_nha_hang JOIN nha_hang ON luot_ghe_tham_nha_hang.id_nha_hang = nha_hang.id_nha_hang GROUP BY luot_ghe_tham_nha_hang.id_nha_hang ORDER BY SUM(luot_ghe_tham_nha_hang.thoi_gian_danh_ra) ASC LIMIT 1
SELECT sinh_vien.ho, sinh_vien.ten FROM sinh_vien JOIN luot_ghe_tham_nha_hang ON sinh_vien.id_sinh_vien = luot_ghe_tham_nha_hang.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT ho) FROM (SELECT ho FROM dien_vien WHERE ho IS NOT NULL UNION SELECT ho FROM khach_hang WHERE ho IS NOT NULL UNION SELECT ho FROM nhan_vien WHERE ho IS NOT NULL) AS distinct_ho
SELECT COUNT(DISTINCT ho) FROM dien_vien
SELECT ten FROM dien_vien GROUP BY ten ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM dien_vien GROUP BY ten ORDER BY COUNT(*) DESC LIMIT 1
SELECT ho || ' ' || ten AS ten_day_du, COUNT(*) AS so_luong FROM dien_vien GROUP BY ho, ten ORDER BY so_luong DESC LIMIT 1
SELECT ho || ' ' || ten AS ten_day_du, COUNT(*) AS so_luong FROM dien_vien GROUP BY ho, ten ORDER BY so_luong DESC LIMIT 1
SELECT quan FROM dia_chi GROUP BY quan HAVING COUNT(*) >= 2
SELECT quan FROM dia_chi GROUP BY quan HAVING COUNT(*) >= 2
SELECT dia_chi.so_dien_thoai, dia_chi.ma_buu_dien FROM dia_chi WHERE dia_chi.id_dia_chi = 1031
SELECT dia_chi.so_dien_thoai, dia_chi.ma_buu_dien FROM dia_chi WHERE dia_chi.dia_chi = '1031 Daugavpils Parkway'
SELECT thanh_pho.thanh_pho, COUNT(*) AS so_dia_chi, thanh_pho.id_thanh_pho FROM dia_chi JOIN thanh_pho ON dia_chi.id_thanh_pho = thanh_pho.id_thanh_pho GROUP BY thanh_pho.id_thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT thanh_pho.thanh_pho, COUNT(*) AS so_dia_chi FROM dia_chi JOIN thanh_pho ON dia_chi.id_thanh_pho = thanh_pho.id_thanh_pho GROUP BY thanh_pho.id_thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM dia_chi WHERE quan = 'California'
SELECT COUNT(*) FROM dia_chi JOIN thanh_pho ON dia_chi.id_thanh_pho = thanh_pho.id_thanh_pho JOIN quoc_gia ON thanh_pho.id_quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.quoc_gia = 'California'
SELECT phim.id_phim, phim.tieu_de FROM phim JOIN hang_ton_kho ON phim.id_phim = hang_ton_kho.id_phim WHERE phim.gia_cho_thue = 0.99 AND COUNT(hang_ton_kho.id_hang_ton_kho) < 3 GROUP BY phim.id_phim
SELECT phim.id_phim, phim.tieu_de FROM phim JOIN hang_ton_kho ON phim.id_phim = hang_ton_kho.id_phim WHERE phim.gia_cho_thue = 0.99 GROUP BY phim.id_phim HAVING COUNT(hang_ton_kho.id_hang_ton_kho) < 3
SELECT COUNT(*) FROM thanh_pho JOIN quoc_gia ON thanh_pho.id_quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.quoc_gia = 'Úc'
SELECT COUNT(*) FROM thanh_pho JOIN quoc_gia ON thanh_pho.id_quoc_gia = quoc_gia.id_quoc_gia WHERE quoc_gia.quoc_gia = 'Úc'
SELECT quoc_gia.quoc_gia FROM quoc_gia JOIN thanh_pho ON quoc_gia.id_quoc_gia = thanh_pho.id_quoc_gia GROUP BY quoc_gia.id_quoc_gia HAVING COUNT(thanh_pho.id_thanh_pho) >= 3 ORDER BY quoc_gia.quoc_gia
SELECT quoc_gia.quoc_gia FROM quoc_gia JOIN thanh_pho ON quoc_gia.id_quoc_gia = thanh_pho.id_quoc_gia GROUP BY quoc_gia.id_quoc_gia HAVING COUNT(thanh_pho.id_thanh_pho) >= 3 ORDER BY COUNT(thanh_pho.id_thanh_pho) DESC
SELECT T1.ngay_thanh_toan FROM khoan_thanh_toan AS T1 JOIN nhan_vien AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien WHERE T2.ten = 'Elsa' AND T1.so_tien > 10
SELECT ngay_thanh_toan FROM khoan_thanh_toan WHERE so_tien > 10 OR id_nhan_vien = (SELECT id_nhan_vien FROM nhan_vien WHERE ten = 'Elsa')
SELECT COUNT(*) FROM khach_hang WHERE co_hoat_dong_khong = 1
SELECT COUNT(*) FROM khach_hang WHERE co_hoat_dong_khong = 1
SELECT gia_cho_thue FROM phim ORDER BY gia_cho_thue DESC LIMIT 1
SELECT tieu_de, gia_cho_thue FROM phim ORDER BY gia_cho_thue DESC LIMIT 1
SELECT phim.id_phim, phim.tieu_de, phim.mo_ta FROM phim JOIN dien_vien_dien_anh ON phim.id_phim = dien_vien_dien_anh.id_phim GROUP BY phim.id_phim ORDER BY COUNT(*) DESC LIMIT 1
SELECT phim.id_phim, phim.tieu_de, phim.mo_ta FROM phim JOIN dien_vien_dien_anh ON phim.id_phim = dien_vien_dien_anh.id_phim GROUP BY phim.id_phim ORDER BY COUNT(*) DESC LIMIT 1
SELECT dien_vien.ten, dien_vien.ho FROM dien_vien JOIN dien_vien_dien_anh ON dien_vien.id_dien_vien = dien_vien_dien_anh.id_dien_vien GROUP BY dien_vien.id_dien_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT ho || ' ' || ten AS ten_day_dien_vien, id_dien_vien FROM dien_vien JOIN dien_vien_dien_anh ON dien_vien.id_dien_vien = dien_vien_dien_anh.id_dien_vien GROUP BY id_dien_vien ORDER BY COUNT(*) DESC LIMIT 1
SELECT dien_vien.ten, dien_vien.ho FROM dien_vien JOIN dien_vien_dien_anh ON dien_vien.id_dien_vien = dien_vien_dien_anh.id_dien_vien GROUP BY dien_vien.id_dien_vien HAVING COUNT(dien_vien_dien_anh.id_phim) > 30 ORDER BY COUNT(dien_vien_dien_anh.id_phim) DESC
SELECT ho || ' ' || ten AS ten_dien_vien FROM dien_vien JOIN dien_vien_dien_anh ON dien_vien.id_dien_vien = dien_vien_dien_anh.id_dien_vien GROUP BY dien_vien.id_dien_vien HAVING COUNT(DISTINCT dien_vien_dien_anh.id_phim) > 30 ORDER BY COUNT(DISTINCT dien_vien_dien_anh.id_phim) DESC
SELECT cua_hang.id_cua_hang, COUNT(*) AS so_luong_mat_hang FROM cua_hang JOIN hang_ton_kho ON hang_ton_kho.id_cua_hang = cua_hang.id_cua_hang GROUP BY cua_hang.id_cua_hang ORDER BY so_luong_mat_hang DESC LIMIT 1
SELECT id_cua_hang FROM hang_ton_kho GROUP BY id_cua_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT SUM(so_tien) FROM khoan_thanh_toan
SELECT SUM(khoan_thanh_toan.so_tien) FROM khoan_thanh_toan
SELECT khach_hang.id_khach_hang, khach_hang.ho, khach_hang.ten FROM khach_hang JOIN khoan_thanh_toan ON khach_hang.id_khach_hang = khoan_thanh_toan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY SUM(khoan_thanh_toan.so_tien) ASC LIMIT 1
SELECT khach_hang.ho, khach_hang.ten, khach_hang.id_khach_hang FROM khach_hang JOIN khoan_thanh_toan ON khach_hang.id_khach_hang = khoan_thanh_toan.id_khach_hang GROUP BY khach_hang.id_khach_hang ORDER BY SUM(khoan_thanh_toan.so_tien) ASC LIMIT 1
SELECT danh_muc.ten FROM danh_muc JOIN danh_muc_phim ON danh_muc.id_danh_muc = danh_muc_phim.id_danh_muc JOIN phim ON danh_muc_phim.id_phim = phim.id_phim WHERE phim.tieu_de = 'HUNGER ROOF'
SELECT danh_muc.ten FROM danh_muc_phim JOIN danh_muc ON danh_muc_phim.id_danh_muc = danh_muc.id_danh_muc JOIN phim ON danh_muc_phim.id_phim = phim.id_phim WHERE phim.tieu_de = 'HUNGER ROOF'
SELECT danh_muc.ten, danh_muc.id_danh_muc, COUNT(*) AS so_luong_phim FROM danh_muc JOIN danh_muc_phim ON danh_muc.id_danh_muc = danh_muc_phim.id_danh_muc GROUP BY danh_muc.id_danh_muc ORDER BY COUNT(*) DESC
SELECT danh_muc.id_danh_muc, danh_muc.ten, COUNT(danh_muc_phim.id_phim) AS so_phim FROM danh_muc JOIN danh_muc_phim ON danh_muc.id_danh_muc = danh_muc_phim.id_danh_muc GROUP BY danh_muc.id_danh_muc ORDER BY COUNT(danh_muc_phim.id_phim) DESC
SELECT phim.id_phim, phim.tieu_de FROM phim JOIN hang_ton_kho ON phim.id_phim = hang_ton_kho.id_phim GROUP BY phim.id_phim ORDER BY COUNT(*) DESC LIMIT 1
SELECT phim.id_phim, phim.tieu_de FROM phim JOIN hang_ton_kho ON phim.id_phim = hang_ton_kho.id_phim GROUP BY phim.id_phim ORDER BY COUNT(*) DESC LIMIT 1
SELECT phim.tieu_de, luot_cho_thue.id_hang_ton_kho FROM luot_cho_thue JOIN hang_ton_kho ON luot_cho_thue.id_hang_ton_kho = hang_ton_kho.id_hang_ton_kho JOIN phim ON hang_ton_kho.id_phim = phim.id_phim GROUP BY phim.tieu_de, luot_cho_thue.id_hang_ton_kho ORDER BY COUNT(*) DESC LIMIT 1
SELECT phim.id_phim, luot_cho_thue.id_hang_ton_kho FROM phim JOIN hang_ton_kho ON phim.id_phim = hang_ton_kho.id_phim JOIN luot_cho_thue ON luot_cho_thue.id_hang_ton_kho = hang_ton_kho.id_hang_ton_kho GROUP BY phim.id_phim ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT phim.id_ngon_ngu) + COUNT(DISTINCT phim.id_ngon_ngu_goc) FROM phim JOIN ngon_ngu ON phim.id_ngon_ngu = ngon_ngu.id_ngon_ngu UNION SELECT COUNT(DISTINCT phim.id_ngon_ngu) + COUNT(DISTINCT phim.id_ngon_ngu_goc) FROM phim JOIN ngon_ngu ON phim.id_ngon_ngu_goc = ngon_ngu.id_ngon_ngu
SELECT COUNT(DISTINCT phim.id_ngon_ngu) FROM phim
SELECT tieu_de FROM phim WHERE danh_gia_xep_hang = 'R'
SELECT tieu_de FROM phim WHERE danh_gia_xep_hang = 'R'
SELECT T2.dia_chi FROM cua_hang AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi = T2.id_dia_chi WHERE T1.id_cua_hang = 1
SELECT dia_chi.dia_chi FROM cua_hang JOIN dia_chi ON cua_hang.id_dia_chi = dia_chi.id_dia_chi WHERE cua_hang.id_cua_hang = 1
SELECT n.ho, n.ten, n.id_nhan_vien FROM nhan_vien n JOIN khoan_thanh_toan kt ON n.id_nhan_vien = kt.id_nhan_vien GROUP BY n.id_nhan_vien ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.ho, T1.ten, T1.id_nhan_vien FROM nhan_vien AS T1 JOIN khoan_thanh_toan AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien GROUP BY T1.id_nhan_vien ORDER BY COUNT(*) ASC LIMIT 1
SELECT ten FROM ngon_ngu WHERE id_ngon_ngu = (SELECT id_ngon_ngu FROM phim WHERE tieu_de = 'AIRPORT POLLOCK')
SELECT ten FROM ngon_ngu WHERE id_ngon_ngu = (SELECT id_ngon_ngu FROM phim WHERE tieu_de = 'AIRPORT POLLOCK')
SELECT COUNT(*) FROM cua_hang
SELECT COUNT(*) FROM cua_hang
SELECT COUNT(DISTINCT danh_gia_xep_hang) FROM phim
SELECT COUNT(DISTINCT danh_gia_xep_hang) FROM phim
SELECT tieu_de FROM phim WHERE tinh_nang_dac_biet LIKE '%Cảnh đã xoá%'
SELECT tieu_de FROM phim WHERE tinh_nang_dac_biet LIKE '%Cảnh đã xoá%'
SELECT COUNT(*) FROM hang_ton_kho WHERE id_cua_hang = 1
SELECT COUNT(*) FROM hang_ton_kho WHERE id_cua_hang = 1
SELECT ngay_thanh_toan FROM khoan_thanh_toan ORDER BY ngay_thanh_toan LIMIT 1
SELECT ngay_thanh_toan FROM khoan_thanh_toan ORDER BY ngay_thanh_toan ASC LIMIT 1
SELECT khach_hang.email, dia_chi.dia_chi FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi = dia_chi.id_dia_chi WHERE khach_hang.ten = 'Linda'
SELECT khach_hang.ho || ' ' || khach_hang.ten AS ten_khach_hang, dia_chi.dia_chi, khach_hang.email FROM khach_hang JOIN dia_chi ON khach_hang.id_dia_chi = dia_chi.id_dia_chi WHERE khach_hang.ten = 'Linda'
SELECT tieu_de FROM phim WHERE thoi_luong_phim > 100 OR (danh_gia_xep_hang = 'PG' AND gia_thay_the <= 200)
SELECT tieu_de FROM phim WHERE (thoi_luong_phim > 100 OR danh_gia_xep_hang = 'PG') AND gia_thay_the <= 200
SELECT T1.ten, T1.ho FROM khach_hang AS T1 JOIN luot_cho_thue AS T2 ON T1.id_khach_hang = T2.id_khach_hang ORDER BY T2.ngay_cho_thue ASC LIMIT 1
SELECT khach_hang.ho || ' ' || khach_hang.ten AS ten_day_du FROM khach_hang JOIN luot_cho_thue ON khach_hang.id_khach_hang = luot_cho_thue.id_khach_hang ORDER BY luot_cho_thue.ngay_cho_thue ASC LIMIT 1
SELECT nhan_vien.ten FROM nhan_vien JOIN luot_cho_thue ON nhan_vien.id_nhan_vien = luot_cho_thue.id_nhan_vien JOIN khach_hang ON luot_cho_thue.id_khach_hang = khach_hang.id_khach_hang WHERE khach_hang.ten = 'April' AND khach_hang.ho = 'Burns'
SELECT T1.ho || ' ' || T1.ten AS ten_day_du FROM nhan_vien AS T1 JOIN luot_cho_thue AS T2 ON T1.id_nhan_vien = T2.id_nhan_vien JOIN khach_hang AS T3 ON T2.id_khach_hang = T3.id_khach_hang WHERE T3.ten = 'April' AND T3.ho = 'Burns'
SELECT id_cua_hang FROM khach_hang GROUP BY id_cua_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT id_cua_hang FROM khach_hang GROUP BY id_cua_hang ORDER BY COUNT(*) DESC LIMIT 1
SELECT so_tien FROM khoan_thanh_toan ORDER BY so_tien DESC LIMIT 1
SELECT MAX(so_tien) FROM khoan_thanh_toan
SELECT T1.ten, T2.dia_chi, T2.quan FROM nhan_vien AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi = T2.id_dia_chi WHERE T1.ten = 'Elsa'
SELECT T1.dia_chi FROM nhan_vien AS T1 JOIN dia_chi AS T2 ON T1.id_dia_chi = T2.id_dia_chi WHERE T1.ten = 'Elsa'
SELECT khach_hang.ten FROM khach_hang WHERE khach_hang.id_khach_hang NOT IN (SELECT DISTINCT luot_cho_thue.id_khach_hang FROM luot_cho_thue WHERE luot_cho_thue.ngay_cho_thue > '2005-08-23 02:06:01')
SELECT ten FROM khach_hang AS T1 LEFT JOIN luot_cho_thue AS T2 ON T1.id_khach_hang = T2.id_khach_hang WHERE T2.ngay_cho_thue IS NULL AND T1.co_hoat_dong_khong = 1
SELECT COUNT(*) FROM tai_xe
SELECT ten, thanh_pho_que_huong, tuoi FROM tai_xe
SELECT dang, COUNT(*) FROM tai_xe GROUP BY dang ORDER BY COUNT(*) DESC
SELECT ten FROM tai_xe ORDER BY tuoi DESC
SELECT DISTINCT thanh_pho_que_huong FROM tai_xe
SELECT thanh_pho_que_huong FROM tai_xe GROUP BY thanh_pho_que_huong ORDER BY COUNT(*) DESC LIMIT 1
SELECT dang FROM tai_xe WHERE thanh_pho_que_huong = 'Hartford' OR tuoi > 40
SELECT thanh_pho_que_huong FROM tai_xe WHERE tuoi > 40 GROUP BY thanh_pho_que_huong HAVING COUNT(*) >= 2
SELECT thanh_pho_que_huong FROM tai_xe EXCEPT SELECT thanh_pho_que_huong FROM tai_xe WHERE tuoi > 40
SELECT ten FROM tai_xe WHERE id_tai_xe NOT IN (SELECT id_tai_xe FROM xe_buyt_cua_truong_hoc)
SELECT loai_hinh FROM truong_hoc GROUP BY loai_hinh HAVING COUNT(*) = 2
SELECT truong_hoc.truong_hoc, tai_xe.ten FROM truong_hoc JOIN xe_buyt_cua_truong_hoc ON truong_hoc.id_truong_hoc = xe_buyt_cua_truong_hoc.id_truong_hoc JOIN tai_xe ON xe_buyt_cua_truong_hoc.id_tai_xe = tai_xe.id_tai_xe
SELECT AVG(xe_buyt_cua_truong_hoc.so_nam_lam_viec), MAX(xe_buyt_cua_truong_hoc.so_nam_lam_viec), MIN(xe_buyt_cua_truong_hoc.so_nam_lam_viec) FROM xe_buyt_cua_truong_hoc
SELECT truong_hoc.truong_hoc, truong_hoc.loai_hinh FROM truong_hoc EXCEPT SELECT t.truong_hoc, t.loai_hinh FROM truong_hoc t JOIN xe_buyt_cua_truong_hoc x ON t.id_truong_hoc = x.id_truong_hoc
SELECT truong_hoc.loai_hinh, COUNT(*) FROM truong_hoc JOIN xe_buyt_cua_truong_hoc ON truong_hoc.id_truong_hoc = xe_buyt_cua_truong_hoc.id_truong_hoc GROUP BY truong_hoc.loai_hinh ORDER BY COUNT(*) DESC
SELECT COUNT(*) FROM tai_xe WHERE thanh_pho_que_huong = 'Hartford' OR tuoi < 40
SELECT ten FROM tai_xe WHERE thanh_pho_que_huong = 'Hartford' AND tuoi < 40
SELECT ten FROM tai_xe JOIN xe_buyt_cua_truong_hoc ON tai_xe.id_tai_xe = xe_buyt_cua_truong_hoc.id_tai_xe ORDER BY so_nam_lam_viec DESC LIMIT 1
SELECT COUNT(*) FROM truong_hoc
SELECT COUNT(*) FROM truong_hoc
SELECT dia_diem FROM truong_hoc ORDER BY so_luong_nhap_hoc ASC
SELECT dia_diem, so_luong_nhap_hoc FROM truong_hoc ORDER BY so_luong_nhap_hoc ASC
SELECT dia_diem FROM truong_hoc ORDER BY nam_thanh_lap DESC
SELECT dia_diem, nam_thanh_lap FROM truong_hoc ORDER BY nam_thanh_lap DESC
SELECT so_luong_nhap_hoc FROM truong_hoc WHERE ton_giao != 'Công giáo'
SELECT so_luong_nhap_hoc FROM truong_hoc WHERE ton_giao != 'Công giáo'
SELECT AVG(so_luong_nhap_hoc) FROM truong_hoc
SELECT AVG(so_luong_nhap_hoc) FROM truong_hoc
SELECT doi FROM cau_thu ORDER BY doi ASC
SELECT doi FROM cau_thu ORDER BY doi ASC
SELECT COUNT(DISTINCT vi_tri) FROM cau_thu
SELECT COUNT(DISTINCT vi_tri) FROM cau_thu
SELECT doi FROM cau_thu ORDER BY tuoi DESC LIMIT 1
SELECT cau_thu.doi FROM cau_thu ORDER BY cau_thu.tuoi DESC LIMIT 1
SELECT cau_thu.doi FROM cau_thu ORDER BY cau_thu.tuoi DESC LIMIT 5
SELECT cau_thu.doi FROM cau_thu ORDER BY cau_thu.tuoi DESC LIMIT 5
SELECT cau_thu.doi, truong_hoc.dia_diem FROM cau_thu JOIN truong_hoc ON cau_thu.id_truong = truong_hoc.id_truong
SELECT cau_thu.doi, truong_hoc.dia_diem FROM cau_thu JOIN truong_hoc ON cau_thu.id_truong = truong_hoc.id_truong
SELECT truong_hoc.dia_diem FROM truong_hoc JOIN cau_thu ON truong_hoc.id_truong = cau_thu.id_truong GROUP BY truong_hoc.id_truong, truong_hoc.dia_diem HAVING COUNT(*) > 1
SELECT truong_hoc.dia_diem FROM truong_hoc JOIN cau_thu ON truong_hoc.id_truong = cau_thu.id_truong GROUP BY truong_hoc.id_truong HAVING COUNT(cau_thu.id_cau_thu) > 1
SELECT truong_hoc.ton_giao FROM cau_thu JOIN truong_hoc ON cau_thu.id_truong = truong_hoc.id_truong GROUP BY truong_hoc.id_truong ORDER BY COUNT(*) DESC LIMIT 1
SELECT truong_hoc.ton_giao FROM cau_thu JOIN truong_hoc ON cau_thu.id_truong = truong_hoc.id_truong GROUP BY truong_hoc.id_truong ORDER BY COUNT(*) DESC LIMIT 1
SELECT truong_hoc.dia_diem, chi_tiet_truong_hoc.biet_danh FROM truong_hoc JOIN chi_tiet_truong_hoc ON truong_hoc.id_truong = chi_tiet_truong_hoc.id_truong
SELECT chi_tiet_truong_hoc.biet_danh, truong_hoc.dia_diem FROM truong_hoc JOIN chi_tiet_truong_hoc ON truong_hoc.id_truong = chi_tiet_truong_hoc.id_truong
SELECT ton_giao, COUNT(*) FROM truong_hoc GROUP BY ton_giao ORDER BY COUNT(*) DESC
SELECT ton_giao, COUNT(*) FROM truong_hoc GROUP BY ton_giao ORDER BY COUNT(*) DESC
SELECT ton_giao, COUNT(*) AS so_luong FROM truong_hoc GROUP BY ton_giao ORDER BY COUNT(*) DESC
SELECT ton_giao, COUNT(*) AS so_luong_truong FROM truong_hoc GROUP BY ton_giao ORDER BY COUNT(*) DESC
SELECT mau_cua_truong FROM truong_hoc ORDER BY so_luong_nhap_hoc DESC LIMIT 1
SELECT mau_sac FROM chi_tiet_truong_hoc WHERE id_truong = (SELECT id_truong FROM truong_hoc ORDER BY so_luong_nhap_hoc DESC LIMIT 1)
SELECT truong_hoc.dia_diem FROM truong_hoc WHERE NOT EXISTS (SELECT 1 FROM cau_thu WHERE cau_thu.id_truong = truong_hoc.id_truong)
SELECT truong_hoc.dia_diem FROM truong_hoc WHERE truong_hoc.id_truong NOT IN (SELECT cau_thu.id_truong FROM cau_thu)
SELECT truong_hoc.ton_giao FROM truong_hoc WHERE truong_hoc.nam_thanh_lap < 1890 OR truong_hoc.nam_thanh_lap > 1900 GROUP BY truong_hoc.ton_giao HAVING COUNT(*) > 1
SELECT ton_giao FROM truong_hoc WHERE nam_thanh_lap < 1890 INTERSECT SELECT ton_giao FROM truong_hoc WHERE nam_thanh_lap > 1900
SELECT biet_danh FROM chi_tiet_truong_hoc WHERE phan_hang != '1'
SELECT biet_danh FROM chi_tiet_truong_hoc JOIN truong_hoc ON chi_tiet_truong_hoc.id_truong = truong_hoc.id_truong WHERE truong_hoc.mam_hay_nu != 'nam'
SELECT ton_giao FROM truong_hoc GROUP BY ton_giao HAVING COUNT(*) > 1
SELECT ton_giao FROM truong_hoc GROUP BY ton_giao HAVING COUNT(*) > 1
SELECT ten FROM quoc_gia UNION SELECT ten FROM giai_dau
SELECT COUNT(*) FROM giai_dau WHERE id_quoc_gia = (SELECT id FROM quoc_gia WHERE ten = 'Anh')
SELECT AVG(can_nang) FROM cau_thu
SELECT can_nang FROM cau_thu ORDER BY can_nang DESC LIMIT 1 UNION SELECT can_nang FROM cau_thu ORDER BY can_nang ASC LIMIT 1
SELECT ten_cau_thu FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api OR cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa WHERE danh_gia_tong_the > (SELECT AVG(danh_gia_tong_the) FROM dac_diem_cua_cau_thu) ORDER BY danh_gia_tong_the DESC
SELECT cau_thu.ten_cau_thu FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api AND cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa ORDER BY dac_diem_cua_cau_thu.re_bong DESC LIMIT 1
SELECT cau_thu.ten_cau_thu FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api AND cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa WHERE dac_diem_cua_cau_thu.tat_bong > 90 AND cau_thu.chan_thuan = 'right'
SELECT cau_thu.ten_cau_thu FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api AND cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa WHERE dac_diem_cua_cau_thu.chan_thuan = 'Left' AND dac_diem_cua_cau_thu.danh_gia_tong_the BETWEEN 85 AND 90
SELECT AVG(CASE WHEN dac_diem_cua_cau_thu.chan_thuan = 'right' THEN dac_diem_cua_cau_thu.danh_gia_tong_the ELSE NULL END) AS avg_phai, AVG(CASE WHEN dac_diem_cua_cau_thu.chan_thuan = 'left' THEN dac_diem_cua_cau_thu.danh_gia_tong_the ELSE NULL END) AS avg_trai FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api OR cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa WHERE dac_diem_cua_cau_thu.chan_thuan IN ('right','left') GROUP BY 1, 2
SELECT COUNT(*) AS so_cau_thu_thuan_phai FROM dac_diem_cua_cau_thu WHERE danh_gia_tong_the > 80 AND chan_thuan = 'Right' UNION SELECT COUNT(*) AS so_cau_thu_thuan_trai FROM dac_diem_cua_cau_thu WHERE danh_gia_tong_the > 80 AND chan_thuan = 'Left'
SELECT id FROM cau_thu WHERE chieu_cao >= 180 AND id_cau_thu_api IN (SELECT id_cau_thu_api FROM dac_diem_cua_cau_thu WHERE danh_gia_tong_the > 85)
SELECT cau_thu.id FROM cau_thu WHERE cau_thu.chan_thuan = 'Left' AND cau_thu.chieu_cao BETWEEN 180 AND 190
SELECT cau_thu.ten_cau_thu FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api OR cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa ORDER BY dac_diem_cua_cau_thu.danh_gia_tong_the DESC LIMIT 3
SELECT cau_thu.ten_cau_thu, cau_thu.ngay_sinh FROM cau_thu JOIN dac_diem_cua_cau_thu ON cau_thu.id_cau_thu_api = dac_diem_cua_cau_thu.id_cau_thu_api OR cau_thu.id_cau_thu_api_cua_fifa = dac_diem_cua_cau_thu.id_cau_thu_api_cua_fifa ORDER BY dac_diem_cua_cau_thu.tiem_nang DESC LIMIT 5
SELECT ten_quan, dien_tich_cua_cac_thanh_pho FROM quan ORDER BY dien_tich_cua_cac_thanh_pho DESC
SELECT ten_quan FROM quan ORDER BY dien_tich_cua_cac_thanh_pho DESC
SELECT san_pham.kich_thuoc_trang_toi_da FROM san_pham JOIN san_pham_cua_cua_hang ON san_pham.id_san_pham = san_pham_cua_cua_hang.id_san_pham GROUP BY san_pham.kich_thuoc_trang_toi_da HAVING COUNT(*) > 3
SELECT san_pham.kich_thuoc_trang_toi_da FROM san_pham WHERE san_pham.id_san_pham IN (SELECT san_pham_cua_cua_hang.id_san_pham FROM san_pham_cua_cua_hang GROUP BY san_pham_cua_cua_hang.id_san_pham HAVING COUNT(*) > 3)
SELECT ten_quan, dan_so_thanh_pho FROM quan WHERE dan_so_thanh_pho BETWEEN 200000 AND 20000000
SELECT ten_quan, dan_so_thanh_pho FROM quan WHERE dan_so_thanh_pho BETWEEN 200000 AND 2000000
SELECT ten_quan FROM quan WHERE dien_tich_cua_cac_thanh_pho > 10 OR dan_so_thanh_pho > 100000
SELECT ten_quan FROM quan WHERE dien_tich_cua_cac_thanh_pho > 10 OR dan_so_thanh_pho > 100000
SELECT ten_quan FROM quan ORDER BY dan_so_thanh_pho DESC LIMIT 1
SELECT ten_quan FROM quan ORDER BY dan_so_thanh_pho DESC LIMIT 1
SELECT ten_quan FROM quan ORDER BY dien_tich_cua_cac_thanh_pho ASC LIMIT 1
SELECT ten_quan FROM quan ORDER BY dien_tich_cua_cac_thanh_pho ASC LIMIT 1
SELECT SUM(dan_so_thanh_pho) FROM quan ORDER BY dien_tich_cua_cac_thanh_pho DESC LIMIT 3
SELECT SUM(dan_so_thanh_pho) FROM quan ORDER BY dien_tich_cua_cac_thanh_pho DESC LIMIT 3
SELECT loai, COUNT(*) AS so_luong_cua_hang FROM cua_hang GROUP BY loai ORDER BY so_luong_cua_hang DESC
SELECT loai AS loai_cua_hang, COUNT(*) AS so_luong_cua_hang FROM cua_hang GROUP BY loai ORDER BY COUNT(*) DESC
SELECT cua_hang.ten_cua_hang FROM cua_hang JOIN quan_cua_cua_hang ON cua_hang.id_cua_hang = quan_cua_cua_hang.id_cua_hang JOIN quan ON quan_cua_cua_hang.id_quan = quan.id_quan WHERE quan.ten_quan = 'Khanewal'
SELECT cua_hang.ten_cua_hang FROM cua_hang JOIN quan_cua_cua_hang ON cua_hang.id_cua_hang = quan_cua_cua_hang.id_cua_hang JOIN quan ON quan_cua_cua_hang.id_quan = quan.id_quan WHERE quan.ten_quan = 'Khanewal'
SELECT T1.ten_cua_hang FROM cua_hang AS T1 JOIN quan_cua_cua_hang AS T2 ON T1.id_cua_hang = T2.id_cua_hang JOIN quan AS T3 ON T2.id_quan = T3.id_quan ORDER BY T3.dan_so_thanh_pho DESC LIMIT 1
SELECT T1.ten_cua_hang FROM cua_hang AS T1 JOIN quan_cua_cua_hang AS T2 ON T1.id_cua_hang = T2.id_cua_hang JOIN quan AS T3 ON T2.id_quan = T3.id_quan ORDER BY T3.dan_so_thanh_pho DESC LIMIT 1
SELECT T1.thanh_pho_cua_cac_tru_so FROM quan AS T1 JOIN quan_cua_cua_hang AS T2 ON T1.id_quan = T2.id_quan JOIN cua_hang AS T3 ON T2.id_cua_hang = T3.id_cua_hang WHERE T3.ten_cua_hang = 'Blackville'
SELECT thanh_pho_cua_cac_tru_so FROM quan JOIN quan_cua_cua_hang ON quan.id_quan = quan_cua_cua_hang.id_quan JOIN cua_hang ON cua_hang.id_cua_hang = quan_cua_cua_hang.id_cua_hang WHERE ten_cua_hang = 'Blackville'
SELECT quan.thanh_pho_cua_cac_tru_so AS ten_thanh_pho, COUNT(DISTINCT cua_hang.id_cua_hang) AS so_luong_cua_hang FROM quan JOIN quan_cua_cua_hang ON quan.id_quan = quan_cua_cua_hang.id_quan JOIN cua_hang ON quan_cua_cua_hang.id_cua_hang = cua_hang.id_cua_hang GROUP BY quan.thanh_pho_cua_cac_tru_so ORDER BY so_luong_cua_hang DESC
SELECT quan.ten_quan, COUNT(*) FROM quan JOIN quan_cua_cua_hang ON quan.id_quan = quan_cua_cua_hang.id_quan GROUP BY quan.id_quan ORDER BY COUNT(*) DESC
SELECT quan.ten_thanh_pho FROM quan JOIN quan_cua_cua_hang ON quan.id_quan = quan_cua_cua_hang.id_quan GROUP BY quan.ten_thanh_pho ORDER BY COUNT(*) DESC LIMIT 1
SELECT quan.ten_quan, COUNT(*) AS so_luong_cua_hang FROM quan JOIN quan_cua_cua_hang ON quan.id_quan = quan_cua_cua_hang.id_quan GROUP BY quan.id_quan ORDER BY so_luong_cua_hang DESC LIMIT 1
SELECT AVG(so_trang_mau_tren_tung_phut) FROM san_pham JOIN san_pham_cua_cua_hang ON san_pham.id_san_pham = san_pham_cua_cua_hang.id_san_pham JOIN cua_hang ON san_pham_cua_cua_hang.id_cua_hang = cua_hang.id_cua_hang JOIN quan_cua_cua_hang ON cua_hang.id_cua_hang = quan_cua_cua_hang.id_cua_hang JOIN quan ON quan_cua_cua_hang.id_quan = quan.id_quan WHERE quan.ten_quan = 'District 1' AND cua_hang.loai = 'Supermarket' AND quan.thanh_pho_cua_cac_tru_so = 'Ho Chi Minh' AND quan.dan_so_thanh_pho > 1000000 AND quan.dien_tich_cua_cac_thanh_pho BETWEEN 1000 AND 5000
SELECT AVG(so_trang_mau_tren_tung_phut) FROM san_pham
SELECT san_pham.san_pham FROM san_pham JOIN san_pham_cua_cua_hang ON san_pham.id_san_pham = san_pham_cua_cua_hang.id_san_pham JOIN cua_hang ON san_pham_cua_cua_hang.id_cua_hang = cua_hang.id_cua_hang WHERE cua_hang.ten_cua_hang = 'Miramichi'
SELECT san_pham.san_pham FROM san_pham JOIN san_pham_cua_cua_hang ON san_pham.id_san_pham = san_pham_cua_cua_hang.id_san_pham JOIN cua_hang ON san_pham_cua_cua_hang.id_cua_hang = cua_hang.id_cua_hang WHERE cua_hang.ten_cua_hang = 'Miramichi'
SELECT san_pham FROM san_pham WHERE kich_thuoc_trang_toi_da = 'A 4' AND so_trang_mau_tren_tung_phut < 5
SELECT san_pham FROM san_pham WHERE kich_thuoc_trang_toi_da = 'A 4' AND so_trang_mau_tren_tung_phut < 5
SELECT san_pham FROM san_pham WHERE kich_thuoc_trang_toi_da = 'A 4' OR so_trang_mau_tren_tung_phut < 5
SELECT san_pham FROM san_pham WHERE kich_thuoc_trang_toi_da = 'A 4' OR so_trang_mau_tren_tung_phut < 5
SELECT san_pham FROM san_pham WHERE san_pham LIKE '%Máy quét%'
SELECT san_pham FROM san_pham WHERE san_pham LIKE '%Máy quét%'
SELECT san_pham.kich_thuoc_trang_toi_da FROM san_pham GROUP BY san_pham.kich_thuoc_trang_toi_da ORDER BY COUNT(*) DESC LIMIT 1
SELECT kich_thuoc_trang_toi_da FROM san_pham GROUP BY kich_thuoc_trang_toi_da ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_pham FROM san_pham WHERE kich_thuoc_trang_toi_da NOT IN (SELECT DISTINCT kich_thuoc FROM san_pham) GROUP BY san_pham ORDER BY COUNT(*) DESC LIMIT 1
SELECT san_pham FROM san_pham WHERE kich_thuoc_trang_toi_da NOT IN (SELECT kich_thuoc FROM san_pham) ORDER BY kich_thuoc DESC LIMIT 1
SELECT SUM(dan_so_thanh_pho) FROM quan WHERE dien_tich_cua_cac_thanh_pho > (SELECT AVG(dien_tich_cua_cac_thanh_pho) FROM quan)
SELECT ten_quan, SUM(dan_so_thanh_pho) FROM quan WHERE dien_tich_cua_cac_thanh_pho > (SELECT AVG(dien_tich_cua_cac_thanh_pho) FROM quan) GROUP BY ten_quan
SELECT ten_quan FROM quan JOIN quan_cua_cua_hang ON quan.id_quan = quan_cua_cua_hang.id_quan JOIN cua_hang ON quan_cua_cua_hang.id_cua_hang = cua_hang.id_cua_hang WHERE cua_hang.loai = 'trung tam mua sắm' INTERSECT SELECT ten_quan FROM quan JOIN quan_cua_cua_hang ON quan.id_quan = quan_cua_cua_hang.id_quan JOIN cua_hang ON quan_cua_cua_hang.id_cua_hang = cua_hang.id_cua_hang WHERE cua_hang.loai = 'cua hang binh dan'
SELECT T1.ten_quan FROM quan AS T1 JOIN quan_cua_cua_hang AS T2 ON T1.id_quan = T2.id_quan JOIN cua_hang AS T3 ON T2.id_cua_hang = T3.id_cua_hang WHERE T3.loai = 'trung tam mua sắm' INTERSECT SELECT T1.ten_quan FROM quan AS T1 JOIN quan_cua_cua_hang AS T2 ON T1.id_quan = T2.id_quan JOIN cua_hang AS T3 ON T2.id_cua_hang = T3.id_cua_hang WHERE T3.loai = 'cua hang binh dan'
SELECT COUNT(*) FROM khu_vuc
SELECT COUNT(*) FROM khu_vuc
SELECT ma_khu_vuc, ten_khu_vuc FROM khu_vuc ORDER BY ma_khu_vuc
SELECT ma_khu_vuc, ten_khu_vuc FROM khu_vuc ORDER BY ma_khu_vuc
SELECT ten_khu_vuc FROM khu_vuc ORDER BY ten_khu_vuc ASC
SELECT ten_khu_vuc FROM khu_vuc ORDER BY ten_khu_vuc ASC
SELECT ten_khu_vuc FROM khu_vuc WHERE ten_khu_vuc != 'Đan Mạch'
SELECT ten_khu_vuc FROM khu_vuc WHERE ten_khu_vuc != 'Đan Mạch'
SELECT COUNT(*) FROM bao WHERE so_luong_nguoi_chet > 0
SELECT COUNT(*) FROM bao WHERE so_luong_nguoi_chet >= 1
SELECT ten, ngay_hoat_dong, so_luong_nguoi_chet FROM bao WHERE so_luong_nguoi_chet >= 1
SELECT ten, ngay_hoat_dong, so_luong_nguoi_chet FROM bao WHERE so_luong_nguoi_chet >= 1 ORDER BY so_luong_nguoi_chet DESC LIMIT 1000000000
SELECT AVG(thiet_hai_theo_trieu_usd) AS thiet_hai_trung_binh, MAX(thiet_hai_theo_trieu_usd) AS thiet_hai_toi_da FROM bao WHERE toc_do_toi_da > 1000
SELECT AVG(thiet_hai_theo_trieu_usd) AS trung_binh, MAX(thiet_hai_theo_trieu_usd) AS toi_da FROM bao WHERE toc_do_toi_da > 1000
SELECT SUM(so_luong_nguoi_chet), SUM(thiet_hai_theo_trieu_usd) FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao WHERE toc_do_toi_da > (SELECT AVG(toc_do_toi_da) FROM bao) GROUP BY bao.id_con_bao
SELECT SUM(so_luong_nguoi_chet), SUM(thiet_hai_theo_trieu_usd) FROM bao WHERE toc_do_toi_da > (SELECT AVG(toc_do_toi_da) FROM bao)
SELECT ten, thiet_hai_theo_trieu_usd FROM bao ORDER BY toc_do_toi_da DESC
SELECT ten, thiet_hai_theo_trieu_usd FROM bao ORDER BY toc_do_toi_da DESC
SELECT COUNT(DISTINCT khu_vuc_bi_anh_huong.id_khu_vuc) FROM khu_vuc_bi_anh_huong JOIN khu_vuc ON khu_vuc_bi_anh_huong.id_khu_vuc = khu_vuc.id_khu_vuc JOIN bao ON khu_vuc_bi_anh_huong.id_bao = bao.id_con_bao
SELECT COUNT(DISTINCT khu_vuc_bi_anh_huong.id_khu_vuc) FROM khu_vuc_bi_anh_huong JOIN khu_vuc ON khu_vuc_bi_anh_huong.id_khu_vuc = khu_vuc.id_khu_vuc JOIN bao ON khu_vuc_bi_anh_huong.id_bao = bao.id_con_bao
SELECT ten_khu_vuc FROM khu_vuc EXCEPT SELECT khu_vuc.ten_khu_vuc FROM khu_vuc JOIN khu_vuc_bi_anh_huong ON khu_vuc.id_khu_vuc = khu_vuc_bi_anh_huong.id_khu_vuc
SELECT ten_khu_vuc FROM khu_vuc EXCEPT SELECT khu_vuc.ten_khu_vuc FROM khu_vuc JOIN khu_vuc_bi_anh_huong ON khu_vuc.id_khu_vuc = khu_vuc_bi_anh_huong.id_khu_vuc
SELECT khu_vuc.ten_khu_vuc, COUNT(khu_vuc_bi_anh_huong.id_bao) FROM khu_vuc JOIN khu_vuc_bi_anh_huong ON khu_vuc.id_khu_vuc = khu_vuc_bi_anh_huong.id_khu_vuc GROUP BY khu_vuc.id_khu_vuc ORDER BY COUNT(khu_vuc_bi_anh_huong.id_bao) DESC
SELECT khu_vuc.ten_khu_vuc, COUNT(*) FROM khu_vuc_bi_anh_huong JOIN khu_vuc ON khu_vuc_bi_anh_huong.id_khu_vuc = khu_vuc.id_khu_vuc GROUP BY khu_vuc.id_khu_vuc
SELECT bao.ten, COUNT(khu_vuc_bi_anh_huong.id_khu_vuc) FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao GROUP BY bao.id_con_bao ORDER BY COUNT(khu_vuc_bi_anh_huong.id_khu_vuc) DESC
SELECT khu_vuc_bi_anh_huong.id_bao, COUNT(*) AS so_luong_khu_vuc_bi_anh_huong FROM khu_vuc_bi_anh_huong GROUP BY khu_vuc_bi_anh_huong.id_bao
SELECT bao.ten, bao.toc_do_toi_da FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao GROUP BY bao.id_con_bao ORDER BY COUNT(*) DESC LIMIT 1
SELECT bao.ten, bao.toc_do_toi_da FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao GROUP BY bao.id_con_bao ORDER BY COUNT(*) DESC LIMIT 1
SELECT ten FROM bao WHERE id_con_bao NOT IN (SELECT id_bao FROM khu_vuc_bi_anh_huong)
SELECT ten FROM bao WHERE id_con_bao NOT IN (SELECT id_bao FROM khu_vuc_bi_anh_huong)
SELECT bao.ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao GROUP BY bao.id_con_bao HAVING COUNT(DISTINCT khu_vuc_bi_anh_huong.id_khu_vuc) >= 2 AND SUM(khu_vuc_bi_anh_huong.so_thanh_pho_bi_anh_huong) >= 10
SELECT ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao GROUP BY bao.id_con_bao HAVING COUNT(DISTINCT khu_vuc_bi_anh_huong.id_khu_vuc) >= 2 AND SUM(so_thanh_pho_bi_anh_huong) >= 10
SELECT ten FROM bao WHERE id_con_bao NOT IN (SELECT id_bao FROM khu_vuc_bi_anh_huong GROUP BY id_bao HAVING COUNT(DISTINCT id_khu_vuc) >= 2)
SELECT ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao GROUP BY bao.id_con_bao HAVING COUNT(DISTINCT khu_vuc_bi_anh_huong.id_khu_vuc) < 3
SELECT T1.ten_khu_vuc FROM khu_vuc AS T1 JOIN khu_vuc_bi_anh_huong AS T2 ON T1.id_khu_vuc = T2.id_khu_vuc JOIN bao AS T3 ON T2.id_bao = T3.id_con_bao WHERE T3.so_luong_nguoi_chet >= 10
SELECT T1.ten_khu_vuc FROM khu_vuc AS T1 JOIN khu_vuc_bi_anh_huong AS T2 ON T1.id_khu_vuc = T2.id_khu_vuc JOIN bao AS T3 ON T2.id_bao = T3.id_con_bao WHERE T3.so_luong_nguoi_chet >= 10 GROUP BY T1.ten_khu_vuc
SELECT bao.ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao JOIN khu_vuc ON khu_vuc_bi_anh_huong.id_khu_vuc = khu_vuc.id_khu_vuc WHERE khu_vuc.ten_khu_vuc = 'Đan Mạch'
SELECT ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao JOIN khu_vuc ON khu_vuc_bi_anh_huong.id_khu_vuc = khu_vuc.id_khu_vuc WHERE khu_vuc.ma_khu_vuc = 'DK'
SELECT khu_vuc.ten_khu_vuc FROM khu_vuc JOIN khu_vuc_bi_anh_huong ON khu_vuc.id_khu_vuc = khu_vuc_bi_anh_huong.id_khu_vuc GROUP BY khu_vuc.id_khu_vuc HAVING COUNT(khu_vuc_bi_anh_huong.id_bao) >= 2
SELECT khu_vuc.ten_khu_vuc FROM khu_vuc JOIN khu_vuc_bi_anh_huong ON khu_vuc.id_khu_vuc = khu_vuc_bi_anh_huong.id_khu_vuc GROUP BY khu_vuc.id_khu_vuc HAVING COUNT(khu_vuc_bi_anh_huong.id_bao) >= 2
SELECT T1.ten_khu_vuc FROM khu_vuc AS T1 JOIN khu_vuc_bi_anh_huong AS T2 ON T1.id_khu_vuc = T2.id_khu_vuc JOIN bao AS T3 ON T2.id_bao = T3.id_con_bao ORDER BY T3.so_luong_nguoi_chet DESC LIMIT 1
SELECT T1.ten_khu_vuc FROM khu_vuc AS T1 JOIN khu_vuc_bi_anh_huong AS T2 ON T1.id_khu_vuc = T2.id_khu_vuc JOIN bao AS T3 ON T2.id_bao = T3.id_con_bao ORDER BY T3.so_luong_nguoi_chet DESC LIMIT 1
SELECT bao.ten FROM bao JOIN khu_vuc_bi_anh_huong AS T1 ON bao.id_con_bao = T1.id_bao JOIN khu_vuc AS T2 ON T1.id_khu_vuc = T2.id_khu_vuc WHERE T2.ma_khu_vuc = 'Afghanistan' AND T2.ma_khu_vuc = 'Albania' GROUP BY bao.id_con_bao HAVING COUNT(DISTINCT T2.ma_khu_vuc) = 2
SELECT bao.ten FROM bao JOIN khu_vuc_bi_anh_huong ON bao.id_con_bao = khu_vuc_bi_anh_huong.id_bao JOIN khu_vuc ON khu_vuc_bi_anh_huong.id_khu_vuc = khu_vuc.id_khu_vuc WHERE khu_vuc.ma_khu_vuc = 'Afghanistan' AND khu_vuc_bi_anh_huong.id_khu_vuc IN (SELECT id_khu_vuc FROM khu_vuc WHERE ma_khu_vuc = 'Albania')
SELECT COUNT(*) FROM danh_sach
SELECT COUNT(*) FROM danh_sach
SELECT ho FROM danh_sach WHERE phong_hoc = 111
SELECT ho FROM danh_sach WHERE phong_hoc = 111
SELECT ten FROM danh_sach WHERE phong_hoc = 108
SELECT ten FROM danh_sach WHERE phong_hoc = 108
SELECT ten FROM danh_sach WHERE phong_hoc = 107
SELECT DISTINCT ten FROM danh_sach WHERE phong_hoc = 107
SELECT T1.phong_hoc, T1.khoi_lop FROM danh_sach AS T1 JOIN giao_vien AS T2 ON T1.phong_hoc = T2.phong_hoc GROUP BY T1.phong_hoc, T1.khoi_lop ORDER BY T1.phong_hoc
SELECT T1.phong_hoc, T1.khoi_lop FROM danh_sach AS T1 JOIN giao_vien AS T2 ON T1.phong_hoc = T2.phong_hoc GROUP BY T1.phong_hoc, T1.khoi_lop ORDER BY T1.phong_hoc
SELECT khoi_lop FROM danh_sach WHERE phong_hoc = 103 GROUP BY khoi_lop ORDER BY khoi_lop DESC LIMIT 1
SELECT khoi_lop FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.phong_hoc = 103 GROUP BY khoi_lop ORDER BY khoi_lop
SELECT khoi_lop FROM danh_sach WHERE phong_hoc = 105
SELECT khoi_lop FROM danh_sach WHERE phong_hoc = 105 GROUP BY khoi_lop ORDER BY khoi_lop DESC LIMIT 1
SELECT phong_hoc FROM danh_sach WHERE khoi_lop = 4 GROUP BY phong_hoc ORDER BY phong_hoc ASC
SELECT phong_hoc FROM danh_sach WHERE khoi_lop = 4
SELECT phong_hoc FROM danh_sach WHERE khoi_lop = 5 GROUP BY phong_hoc ORDER BY phong_hoc ASC
SELECT phong_hoc FROM danh_sach WHERE khoi_lop = 5 GROUP BY phong_hoc
SELECT ho FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.khoi_lop = 5
SELECT giao_vien.ho FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.khoi_lop = 5
SELECT T1.ten FROM giao_vien AS T1 JOIN danh_sach AS T2 ON T1.phong_hoc = T2.phong_hoc WHERE T2.khoi_lop = 1
SELECT T1.ten FROM giao_vien AS T1 JOIN danh_sach AS T2 ON T1.phong_hoc = T2.phong_hoc WHERE T2.khoi_lop = 1
SELECT ten FROM giao_vien WHERE phong_hoc = 110
SELECT ten FROM giao_vien WHERE phong_hoc = 110
SELECT ho FROM giao_vien WHERE phong_hoc = 109
SELECT ho FROM giao_vien WHERE phong_hoc = 109
SELECT ho, ten FROM giao_vien
SELECT ho, ten FROM giao_vien
SELECT ho, ten FROM danh_sach ORDER BY ho ASC LIMIT 1000000
SELECT ho, ten FROM danh_sach
SELECT T1.ten, T1.ho FROM danh_sach AS T1 JOIN giao_vien AS T2 ON T1.phong_hoc = T2.phong_hoc WHERE T2.ho = 'OTHA' AND T2.ten = 'MOYER'
SELECT danh_sach.ten, danh_sach.ho FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ten = 'OTHA MOYER'
SELECT danh_sach.ho, danh_sach.ten FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'MARROTTE' AND giao_vien.ten = 'KIRK'
SELECT danh_sach.ten, danh_sach.ho FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'MARROTTE' AND giao_vien.ten = 'KIRK'
SELECT ho, ten FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.ten = 'EVELINA' AND danh_sach.ho = 'BROMLEY'
SELECT giao_vien.ho, giao_vien.ten FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.ten = 'EVELINA BROMLEY'
SELECT ho FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.ho = 'GELL' AND danh_sach.ten = 'TAMI'
SELECT giao_vien.ho FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.ten = 'GELL TAMI'
SELECT COUNT(*) FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'LORIA' AND giao_vien.ten = 'ONDERSMA'
SELECT COUNT(*) FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'LORIA' AND giao_vien.ten = 'ONDERSMA'
SELECT COUNT(*) FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'KAWA' AND giao_vien.ten = 'GORDON'
SELECT COUNT(*) FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'KAWA' AND giao_vien.ten = 'GORDON'
SELECT COUNT(*) FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'TARRING' AND giao_vien.ten = 'LEIA'
SELECT COUNT(*) FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc WHERE giao_vien.ho = 'TARRING' AND giao_vien.ten = 'LEIA'
SELECT COUNT(*) FROM danh_sach AS T1 JOIN giao_vien AS T2 ON T1.phong_hoc = T2.phong_hoc WHERE T1.ten = 'CHRISSY NABOZNY' AND T1.ho = 'NABOZNY'
SELECT COUNT(*) FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.ten = 'CHRISSY NABOZNY' AND danh_sach.ho IS NOT NULL
SELECT COUNT(*) FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.ten = 'RAY' AND danh_sach.ho = 'MADLOCK'
SELECT COUNT(*) FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc WHERE danh_sach.ten = 'RAY' AND danh_sach.ho = 'MADLOCK'
SELECT ten, ho FROM danh_sach WHERE khoi_lop = 1 AND ho NOT IN (SELECT ho FROM giao_vien WHERE phong_hoc = 10)
SELECT ho FROM danh_sach WHERE khoi_lop = 1 AND phong_hoc NOT IN (SELECT phong_hoc FROM giao_vien WHERE ho = 'OTHA' AND ten = 'MOYER')
SELECT ho FROM danh_sach WHERE khoi_lop = 3 AND phong_hoc NOT IN (SELECT phong_hoc FROM giao_vien WHERE ho = 'COVIN' AND ten = 'JEROME')
SELECT ho FROM danh_sach WHERE khoi_lop = 3 AND phong_hoc NOT IN (SELECT phong_hoc FROM giao_vien WHERE ho = 'COVIN' AND ten = 'JEROME')
SELECT khoi_lop, COUNT(DISTINCT phong_hoc), COUNT(*) FROM danh_sach JOIN giao_vien ON danh_sach.phong_hoc = giao_vien.phong_hoc GROUP BY khoi_lop ORDER BY khoi_lop ASC
SELECT khoi_lop, COUNT(DISTINCT phong_hoc) AS so_luong_phong_hoc, COUNT(*) AS so_luong_hoc_sinh FROM danh_sach GROUP BY khoi_lop ORDER BY khoi_lop
SELECT phong_hoc, COUNT(*) FROM danh_sach GROUP BY phong_hoc UNION SELECT phong_hoc, COUNT(*) FROM giao_vien GROUP BY phong_hoc ORDER BY phong_hoc
SELECT phong_hoc, COUNT(DISTINCT khoi_lop) FROM danh_sach GROUP BY phong_hoc
SELECT phong_hoc FROM danh_sach GROUP BY phong_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT phong_hoc FROM danh_sach GROUP BY phong_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT phong_hoc, COUNT(*) AS count FROM danh_sach GROUP BY phong_hoc ORDER BY count DESC
SELECT phong_hoc, COUNT(*) AS so_hoc_sinh FROM danh_sach GROUP BY phong_hoc ORDER BY COUNT(*) DESC
SELECT COUNT(*), phong_hoc FROM danh_sach WHERE khoi_lop = 0 GROUP BY phong_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT phong_hoc, COUNT(*) FROM danh_sach WHERE khoi_lop = 0 GROUP BY phong_hoc
SELECT phong_hoc, COUNT(*) AS count FROM danh_sach WHERE khoi_lop = 4 GROUP BY phong_hoc ORDER BY count DESC
SELECT phong_hoc, COUNT(*) FROM danh_sach WHERE khoi_lop = 4 GROUP BY phong_hoc
SELECT giao_vien.ho, giao_vien.ten FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc GROUP BY giao_vien.ho, giao_vien.ten ORDER BY COUNT(*) DESC LIMIT 1
SELECT giao_vien.ten, giao_vien.ho FROM giao_vien JOIN danh_sach ON giao_vien.phong_hoc = danh_sach.phong_hoc GROUP BY giao_vien.ho, giao_vien.ten ORDER BY COUNT(*) DESC LIMIT 1
SELECT phong_hoc, COUNT(*) AS count FROM danh_sach GROUP BY phong_hoc ORDER BY count DESC
SELECT phong_hoc, COUNT(*) FROM danh_sach GROUP BY phong_hoc ORDER BY COUNT(*) DESC
SELECT khoa_hoc.id_khoa_hoc FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT khoa_hoc.ten_khoa_hoc FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY COUNT(luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc) ASC LIMIT 1
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN ca_nhan ON sinh_vien.id_sinh_vien = ca_nhan.id_ca_nhan GROUP BY sinh_vien.id_sinh_vien HAVING COUNT(luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc) = (SELECT MIN(cnt) FROM (SELECT COUNT(luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc) AS cnt FROM sinh_vien JOIN ca_nhan ON sinh_vien.id_sinh_vien = ca_nhan.id_ca_nhan JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien))
SELECT T2.ho, T2.ten FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ung_cu_vien = T2.id_ca_nhan WHERE T2.ho IS NOT NULL AND T2.ten IS NOT NULL
SELECT T1.ho, T1.ten FROM ung_cu_vien AS T1 JOIN ca_nhan AS T2 ON T1.id_ung_cu_vien = T2.id_ca_nhan
SELECT id_sinh_vien FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien)
SELECT id_sinh_vien FROM sinh_vien WHERE id_sinh_vien NOT IN (SELECT id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien)
SELECT DISTINCT T1.id_sinh_vien FROM sinh_vien AS T1 JOIN lan_tham_du_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN lan_tham_du_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien HAVING COUNT(*) >= 1
SELECT sinh_vien.id_sinh_vien, khoa_hoc.id_khoa_hoc FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc
SELECT sinh_vien.id_sinh_vien, ca_nhan.ho FROM sinh_vien JOIN ca_nhan ON sinh_vien.id_sinh_vien = ca_nhan.id_ca_nhan ORDER BY ca_nhan.ho DESC LIMIT 1
SELECT sinh_vien.id_sinh_vien, sinh_vien.chi_tiet_sinh_vien, ca_nhan.ho, ca_nhan.ten, luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc, khoa_hoc.ten_khoa_hoc, luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ki FROM sinh_vien JOIN ca_nhan ON sinh_vien.id_sinh_vien = ca_nhan.id_ca_nhan JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc ORDER BY luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ki DESC LIMIT 10
SELECT COUNT(DISTINCT sinh_vien.id_sinh_vien) FROM sinh_vien JOIN ca_nhan ON sinh_vien.id_sinh_vien = ca_nhan.id_ca_nhan JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'tiếng Anh'
SELECT COUNT(DISTINCT sinh_vien.id_sinh_vien) FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE ten_khoa_hoc = 'tiếng Anh' AND ngay_dang_ki <= '2026-02-27'
SELECT COUNT(*) FROM lan_tham_du_khoa_hoc_cua_sinh_vien WHERE id_sinh_vien = 171
SELECT COUNT(*) FROM lan_tham_du_khoa_hoc_cua_sinh_vien WHERE id_sinh_vien = 171
SELECT id_ung_cu_vien FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ung_cu_vien = ca_nhan.id_ca_nhan WHERE ca_nhan.dia_chi_email = 'stanley.monahan@example.org'
SELECT ung_cu_vien.id_ung_cu_vien FROM ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ung_cu_vien = ca_nhan.id_ca_nhan WHERE ca_nhan.dia_chi_email = 'stanley.monahan@example.org'
SELECT ung_cu_vien.id_ung_cu_vien FROM ung_cu_vien JOIN danh_gia_ung_cu_vien ON ung_cu_vien.id_ung_cu_vien = danh_gia_ung_cu_vien.id_ung_cu_vien ORDER BY danh_gia_ung_cu_vien.ngay_danh_gia DESC LIMIT 1
SELECT id_ung_cu_vien FROM danh_gia_ung_cu_vien ORDER BY ngay_danh_gia DESC LIMIT 1
SELECT sinh_vien.id_sinh_vien, COUNT(*) AS so_khoa_hoc_dang_ky FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY so_khoa_hoc_dang_ky DESC LIMIT 1
SELECT sinh_vien.id_sinh_vien AS T1_id_sinh_vien, ca_nhan.id_ca_nhan AS T2_id_ca_nhan, ca_nhan.ho AS T3_ho, ca_nhan.ten AS T4_ten, COUNT(luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc) AS T5_so_khoa_hoc FROM sinh_vien JOIN ca_nhan ON sinh_vien.id_sinh_vien = ca_nhan.id_ca_nhan JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien ORDER BY T5_so_khoa_hoc DESC LIMIT 1
SELECT id_sinh_vien, COUNT(*) AS so_khoa_hoc_dang_ky FROM luot_dang_ky_khoa_hoc_cua_sinh_vien GROUP BY id_sinh_vien ORDER BY COUNT(*) DESC
SELECT sinh_vien.id_sinh_vien, COUNT(*) AS so_khoa_hoc_dang_ky FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien GROUP BY sinh_vien.id_sinh_vien HAVING COUNT(*) > 0 ORDER BY COUNT(*) DESC
SELECT khoa_hoc.ten_khoa_hoc, COUNT(DISTINCT luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien) FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc ORDER BY COUNT(DISTINCT luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien) DESC
SELECT khoa_hoc.id_khoa_hoc, khoa_hoc.ten_khoa_hoc, COUNT(*) FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc GROUP BY khoa_hoc.id_khoa_hoc ORDER BY COUNT(*) DESC
SELECT id_ung_cu_vien FROM danh_gia_ung_cu_vien WHERE ma_ket_qua_danh_gia = 'Đạt'
SELECT id_ung_cu_vien FROM danh_gia_ung_cu_vien WHERE ma_ket_qua_danh_gia = 'Đạt'
SELECT ca_nhan.so_di_dong FROM ca_nhan JOIN ung_cu_vien ON ca_nhan.id_ca_nhan = ung_cu_vien.id_ung_cu_vien JOIN danh_gia_ung_cu_vien ON ung_cu_vien.id_ung_cu_vien = danh_gia_ung_cu_vien.id_ung_cu_vien WHERE danh_gia_ung_cu_vien.ma_ket_qua_danh_gia = ' Trượt '
SELECT ca_nhan.so_di_dong FROM ung_cu_vien JOIN danh_gia_ung_cu_vien ON ung_cu_vien.id_ung_cu_vien = danh_gia_ung_cu_vien.id_ung_cu_vien JOIN ca_nhan ON ung_cu_vien.id_ung_cu_vien = ca_nhan.id_ca_nhan WHERE danh_gia_ung_cu_vien.ma_ket_qua_danh_gia = 'Trượt'
SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien WHERE id_khoa_hoc = 301
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN ca_nhan ON sinh_vien.id_sinh_vien = ca_nhan.id_ca_nhan JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien WHERE luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = '301'
SELECT id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien WHERE id_khoa_hoc = '301' ORDER BY ngay_tham_du DESC LIMIT 1
SELECT DISTINCT dia_chi.thanh_pho FROM dia_chi JOIN dia_chi_ca_nhan ON dia_chi.id_dia_chi = dia_chi_ca_nhan.id_dia_chi JOIN ca_nhan ON dia_chi_ca_nhan.id_ca_nhan = ca_nhan.id_ca_nhan
SELECT dia_chi.thanh_pho FROM dia_chi_ca_nhan JOIN dia_chi ON dia_chi_ca_nhan.id_dia_chi = dia_chi.id_dia_chi JOIN ca_nhan ON dia_chi_ca_nhan.id_ca_nhan = ca_nhan.id_ca_nhan GROUP BY dia_chi.thanh_pho HAVING COUNT(*) > 1 ORDER BY dia_chi.thanh_pho ASC
SELECT DISTINCT dia_chi.thanh_pho FROM sinh_vien JOIN ca_nhan ON sinh_vien.id_sinh_vien = ca_nhan.id_ca_nhan JOIN dia_chi_ca_nhan ON ca_nhan.id_ca_nhan = dia_chi_ca_nhan.id_ca_nhan JOIN dia_chi ON dia_chi_ca_nhan.id_dia_chi = dia_chi.id_dia_chi
SELECT DISTINCT dia_chi.thanh_pho FROM sinh_vien JOIN ca_nhan ON sinh_vien.id_sinh_vien = ca_nhan.id_ca_nhan JOIN dia_chi_ca_nhan ON ca_nhan.id_ca_nhan = dia_chi_ca_nhan.id_ca_nhan JOIN dia_chi ON dia_chi_ca_nhan.id_dia_chi = dia_chi.id_dia_chi WHERE dia_chi_ca_nhan.den_ngay IS NULL ORDER BY dia_chi.thanh_pho ASC
SELECT ten_khoa_hoc FROM khoa_hoc ORDER BY ten_khoa_hoc ASC
SELECT ten_khoa_hoc FROM khoa_hoc ORDER BY ten_khoa_hoc ASC
SELECT ten FROM ca_nhan ORDER BY ten ASC
SELECT ten FROM ca_nhan ORDER BY ten ASC
SELECT id_sinh_vien FROM sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien UNION SELECT id_sinh_vien FROM sinh_vien JOIN lan_tham_du_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien
SELECT DISTINCT T1.id_sinh_vien FROM sinh_vien AS T1 JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien UNION SELECT DISTINCT T1.id_sinh_vien FROM sinh_vien AS T1 JOIN lan_tham_du_khoa_hoc_cua_sinh_vien AS T2 ON T1.id_sinh_vien = T2.id_sinh_vien
SELECT id_khoa_hoc FROM luot_dang_ky_khoa_hoc_cua_sinh_vien WHERE id_sinh_vien = 121 UNION SELECT id_khoa_hoc FROM lan_tham_du_khoa_hoc_cua_sinh_vien WHERE id_sinh_vien = 121
SELECT id_khoa_hoc FROM khoa_hoc JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc JOIN sinh_vien ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.id_sinh_vien = 121 UNION SELECT id_khoa_hoc FROM khoa_hoc JOIN lan_tham_du_khoa_hoc_cua_sinh_vien ON khoa_hoc.id_khoa_hoc = lan_tham_du_khoa_hoc_cua_sinh_vien.id_khoa_hoc JOIN sinh_vien ON lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien = sinh_vien.id_sinh_vien WHERE sinh_vien.id_sinh_vien = 121
SELECT sinh_vien.id_sinh_vien, ca_nhan.ho, ca_nhan.ten FROM sinh_vien JOIN ca_nhan ON sinh_vien.id_sinh_vien = ca_nhan.id_ca_nhan JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien LEFT JOIN lan_tham_du_khoa_hoc_cua_sinh_vien ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien = lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien AND luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = lan_tham_du_khoa_hoc_cua_sinh_vien.id_khoa_hoc WHERE lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien IS NULL
SELECT sinh_vien.id_sinh_vien, ca_nhan.ho, ca_nhan.ten FROM sinh_vien JOIN ca_nhan ON sinh_vien.id_sinh_vien = ca_nhan.id_ca_nhan WHERE sinh_vien.id_sinh_vien NOT IN (SELECT id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien UNION SELECT id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien)
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'thống kê' ORDER BY luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ki
SELECT luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien FROM luot_dang_ky_khoa_hoc_cua_sinh_vien JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'thống kê' ORDER BY luot_dang_ky_khoa_hoc_cua_sinh_vien.ngay_dang_ki ASC
SELECT lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien FROM lan_tham_du_khoa_hoc_cua_sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_sinh_vien AND lan_tham_du_khoa_hoc_cua_sinh_vien.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'thống kê' ORDER BY lan_tham_du_khoa_hoc_cua_sinh_vien.ngay_tham_du
SELECT sinh_vien.id_sinh_vien FROM sinh_vien JOIN ca_nhan ON sinh_vien.id_sinh_vien = ca_nhan.id_ca_nhan JOIN lan_tham_du_khoa_hoc_cua_sinh_vien ON sinh_vien.id_sinh_vien = lan_tham_du_khoa_hoc_cua_sinh_vien.id_sinh_vien JOIN luot_dang_ky_khoa_hoc_cua_sinh_vien ON lan_tham_du_khoa_hoc_cua_sinh_vien.id_khoa_hoc = luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc JOIN khoa_hoc ON luot_dang_ky_khoa_hoc_cua_sinh_vien.id_khoa_hoc = khoa_hoc.id_khoa_hoc WHERE khoa_hoc.ten_khoa_hoc = 'thống kê' ORDER BY lan_tham_du_khoa_hoc_cua_sinh_vien.ngay_tham_du
SELECT COUNT(*) FROM luot_nop_bai
SELECT COUNT(*) FROM luot_nop_bai
SELECT tac_gia FROM luot_nop_bai ORDER BY so_diem ASC
SELECT tac_gia, so_diem FROM luot_nop_bai ORDER BY so_diem ASC
SELECT tac_gia, truong_dai_hoc FROM luot_nop_bai
SELECT tac_gia, truong_dai_hoc FROM luot_nop_bai GROUP BY tac_gia, truong_dai_hoc
SELECT tac_gia FROM luot_nop_bai WHERE truong_dai_hoc = 'Florida' OR truong_dai_hoc = 'Temple'
SELECT tac_gia FROM luot_nop_bai WHERE truong_dai_hoc = 'Florida' OR truong_dai_hoc = 'Temple'
SELECT AVG(so_diem) FROM luot_nop_bai
SELECT SUM(so_diem) / COUNT(*) FROM luot_nop_bai
SELECT tac_gia FROM luot_nop_bai ORDER BY so_diem DESC LIMIT 1
SELECT tac_gia FROM luot_nop_bai ORDER BY so_diem DESC LIMIT 1
SELECT truong_dai_hoc, COUNT(*) FROM luot_nop_bai GROUP BY truong_dai_hoc ORDER BY COUNT(*) DESC
SELECT truong_dai_hoc, COUNT(*) AS luot_nop_bai FROM luot_nop_bai GROUP BY truong_dai_hoc ORDER BY COUNT(*) DESC
SELECT truong_dai_hoc FROM luot_nop_bai GROUP BY truong_dai_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT truong_dai_hoc FROM luot_nop_bai GROUP BY truong_dai_hoc ORDER BY COUNT(*) DESC LIMIT 1
SELECT truong_dai_hoc FROM luot_nop_bai WHERE so_diem > 90 INTERSECT SELECT truong_dai_hoc FROM luot_nop_bai WHERE so_diem < 80
SELECT truong_dai_hoc FROM luot_nop_bai WHERE so_diem > 90 INTERSECT SELECT truong_dai_hoc FROM luot_nop_bai WHERE so_diem < 80 GROUP BY truong_dai_hoc
SELECT luot_nop_bai.tac_gia, chap_thuan.ket_qua FROM luot_nop_bai JOIN chap_thuan ON luot_nop_bai.id_luot_nop_bai = chap_thuan.id_luot_nop_bai
SELECT luot_nop_bai.tac_gia, chap_thuan.ket_qua FROM luot_nop_bai JOIN chap_thuan ON luot_nop_bai.id_luot_nop_bai = chap_thuan.id_luot_nop_bai
SELECT chap_thuan.ket_qua FROM chap_thuan JOIN luot_nop_bai ON chap_thuan.id_luot_nop_bai = luot_nop_bai.id_luot_nop_bai ORDER BY luot_nop_bai.so_diem DESC LIMIT 1
SELECT ket_qua FROM chap_thuan JOIN luot_nop_bai ON chap_thuan.id_luot_nop_bai = luot_nop_bai.id_luot_nop_bai ORDER BY so_diem DESC LIMIT 1
SELECT tac_gia, COUNT(*) FROM luot_nop_bai GROUP BY tac_gia ORDER BY COUNT(*) DESC LIMIT 10
SELECT tac_gia, COUNT(*) FROM luot_nop_bai JOIN chap_thuan ON luot_nop_bai.id_luot_nop_bai = chap_thuan.id_luot_nop_bai GROUP BY tac_gia ORDER BY COUNT(*) DESC LIMIT 10
SELECT tac_gia FROM luot_nop_bai GROUP BY tac_gia HAVING COUNT(*) > 1
SELECT tac_gia FROM luot_nop_bai GROUP BY tac_gia HAVING COUNT(*) > 1 ORDER BY COUNT(*) DESC LIMIT 10
SELECT ngay, dia_diem FROM hoi_thao ORDER BY dia_diem
SELECT ngay, dia_diem FROM hoi_thao ORDER BY dia_diem
SELECT ten FROM doanh_nghiep WHERE danh_gia_xep_hang > 4.5
SELECT ten FROM doanh_nghiep WHERE danh_gia_xep_hang = 3.5
SELECT id_nguoi_tieu_dung FROM nguoi_tieu_dung WHERE ten = 'Michelle'
SELECT thanh_pho FROM doanh_nghiep WHERE ten = 'Whataburger'
SELECT thanh_pho FROM doanh_nghiep WHERE ten = 'tiệc đứng sang trọng MGM'
SELECT thanh_pho FROM doanh_nghiep WHERE danh_gia_xep_hang < 1.5
SELECT thanh_pho FROM doanh_nghiep WHERE ten = 'Taj Mahal'
SELECT van_ban FROM danh_gia WHERE danh_gia_xep_hang < 1
SELECT ten FROM dbo.doanh_nghiep WHERE danh_gia_xep_hang > 3.5
SELECT thanh_pho FROM doanh_nghiep WHERE ten = 'Taj Mahal' GROUP BY thanh_pho HAVING COUNT(*) = 1
SELECT van_ban FROM danh_gia WHERE id_nguoi_tieu_dung = 123
SELECT T1.ten FROM doanh_nghiep AS T1 JOIN danh_gia AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep WHERE T2.id_nguoi_tieu_dung = 'Niloofar'
SELECT ten FROM doanh_nghiep WHERE id_doanh_nghiep IN (SELECT id_doanh_nghiep FROM danh_gia WHERE danh_gia_xep_hang = 5 AND id_nguoi_tieu_dung = 'Niloofar')
SELECT danh_gia.van_ban FROM danh_gia JOIN nguoi_tieu_dung ON danh_gia.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE nguoi_tieu_dung.ten = 'Michelle' AND danh_gia.id_doanh_nghiep IN (SELECT loai_hinh.id_doanh_nghiep FROM loai_hinh WHERE loai_hinh.ten_loai_hinh = 'nhà hàng Ý')
SELECT COUNT(*) FROM danh_gia JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Cafe Zinho' AND doanh_nghiep.thanh_pho = 'Texas'
SELECT ten FROM dbo.doanh_nghiep JOIN dbo.loai_hinh ON dbo.doanh_nghiep.id_doanh_nghiep = dbo.loai_hinh.id_doanh_nghiep WHERE ten_loai_hinh = 'Ý' AND danh_gia_xep_hang = 5
SELECT ten_khu_pho_lan_can FROM khu_vuc_lan_can JOIN doanh_nghiep ON khu_vuc_lan_can.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten LIKE '%nhà hàng Ý%' AND doanh_nghiep.thanh_pho = 'Madison'
SELECT khu_vuc_lan_can.ten_khu_pho_lan_can FROM khu_vuc_lan_can JOIN doanh_nghiep ON khu_vuc_lan_can.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten LIKE '%nhà hàng Ý%' AND doanh_nghiep.danh_gia_xep_hang < 2.5 AND doanh_nghiep.thanh_pho = 'Madison'
SELECT ten FROM dbo.doanh_nghiep WHERE thanh_pho = 'Pennsylvania'
SELECT doanh_nghiep.ten FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'Nhà hàng' AND doanh_nghiep.thanh_pho = 'Pennsylvania'
SELECT danh_gia.van_ban FROM danh_gia JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep::text = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'chải chuốt cho vật nuôi' AND doanh_nghiep.so_luong_danh_gia > 100
SELECT ten FROM dbo.doanh_nghiep WHERE thanh_pho = 'Los Angeles' AND ten LIKE '%bia%'
SELECT ten FROM dbo.doanh_nghiep WHERE thanh_pho = 'Los Angeles' AND tieu_bang = 'Beer'
SELECT doanh_nghiep.ten FROM dbo.doanh_nghiep INNER JOIN dbo.loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE doanh_nghiep.thanh_pho = 'Los Angeles' AND loai_hinh.ten_loai_hinh = 'Nhà máy bia'
SELECT ten FROM nguoi_tieu_dung WHERE id_nguoi_tieu_dung IN (SELECT id_nguoi_tieu_dung FROM danh_gia WHERE id_doanh_nghiep = (SELECT id_doanh_nghiep FROM doanh_nghiep WHERE ten = 'Mesa Grill'))
SELECT dia_chi_day_du FROM dbo.doanh_nghiep WHERE thanh_pho = 'Los Angeles' AND ten LIKE 'Walmart%'
SELECT ten FROM dbo.doanh_nghiep WHERE thanh_pho = 'Dallas' AND id_doanh_nghiep IN (SELECT id_doanh_nghiep FROM dbo.danh_gia WHERE id_nguoi_tieu_dung = (SELECT id_nguoi_tieu_dung FROM dbo.nguoi_tieu_dung WHERE ten = 'Patrick'))
SELECT T1.ten FROM dbo.doanh_nghiep AS T1 JOIN dbo.danh_gia AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep JOIN dbo.nguoi_tieu_dung AS T3 ON T2.id_nguoi_tieu_dung = T3.id_nguoi_tieu_dung WHERE T3.ten = 'Patrick' AND T1.thanh_pho = 'Dallas'
SELECT ten FROM dbo.doanh_nghiep WHERE id_doanh_nghiep IN (SELECT CAST(id_doanh_nghiep AS INTEGER) FROM dbo.danh_gia WHERE id_nguoi_tieu_dung = 'Patrick')
SELECT ten FROM dbo.doanh_nghiep JOIN dbo.danh_gia ON dbo.doanh_nghiep.id_doanh_nghiep = dbo.danh_gia.id_doanh_nghiep JOIN dbo.nguoi_tieu_dung ON dbo.danh_gia.id_nguoi_tieu_dung = dbo.nguoi_tieu_dung.id_nguoi_tieu_dung WHERE dbo.danh_gia.danh_gia_xep_hang >= 3 AND dbo.nguoi_tieu_dung.ten = 'Patrick'
SELECT nguoi_tieu_dung.ten FROM khoan_tien_boa JOIN nguoi_tieu_dung ON khoan_tien_boa.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE khoan_tien_boa.id_doanh_nghiep = '123' AND khoan_tien_boa.nam = 2015
SELECT ten FROM doanh_nghiep WHERE thanh_pho = 'Texas' AND danh_gia_xep_hang < 2
SELECT ten FROM dbo.doanh_nghiep JOIN dbo.loai_hinh ON dbo.doanh_nghiep.id_doanh_nghiep = dbo.loai_hinh.id_doanh_nghiep WHERE dbo.loai_hinh.ten_loai_hinh = 'hải sản' AND dbo.doanh_nghiep.thanh_pho = 'Los Angeles'
SELECT ten FROM dbo.doanh_nghiep JOIN dbo.loai_hinh ON dbo.doanh_nghiep.id_doanh_nghiep = dbo.loai_hinh.id_doanh_nghiep WHERE dbo.loai_hinh.ten_loai_hinh = 'hải sản' AND dbo.doanh_nghiep.thanh_pho = 'Los Angeles'
SELECT doanh_nghiep.ten FROM dbo.doanh_nghiep JOIN dbo.loai_hinh ON dbo.doanh_nghiep.id_doanh_nghiep = dbo.loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'Hải sản' AND doanh_nghiep.thanh_pho = 'Los Angeles'
SELECT van_ban FROM danh_gia WHERE id_nguoi_tieu_dung = 123 AND danh_gia_xep_hang > 4
SELECT ten FROM dbo.doanh_nghiep WHERE ten LIKE '%apple%' AND thanh_pho = 'Los Angeles'
SELECT ten FROM dbo.doanh_nghiep WHERE thanh_pho = 'Dallas' AND danh_gia_xep_hang > 4.5
SELECT ten_khu_pho_lan_can FROM khu_vuc_lan_can JOIN doanh_nghiep ON khu_vuc_lan_can.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Flat Top Grill'
SELECT van_ban FROM khoan_tien_boa WHERE id_doanh_nghiep = (SELECT id_doanh_nghiep FROM doanh_nghiep WHERE ten = 'Vintner Grill') AND so_luot_thich > 9
SELECT van_ban FROM danh_gia WHERE id_doanh_nghiep = 'cung điện Kabob' AND nam = 2014
SELECT nguoi_tieu_dung.ten FROM nguoi_tieu_dung JOIN khoan_tien_boa ON nguoi_tieu_dung.id_nguoi_tieu_dung = khoan_tien_boa.id_nguoi_tieu_dung JOIN doanh_nghiep ON khoan_tien_boa.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.thanh_pho = 'Dallas'
SELECT doanh_nghiep.thanh_pho FROM doanh_nghiep WHERE doanh_nghiep.ten = 'tiệc đứng sang trọng MGM' AND doanh_nghiep.thanh_pho = 'Texas'
SELECT nguoi_tieu_dung.ten FROM khoan_tien_boa JOIN doanh_nghiep ON khoan_tien_boa.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'chải chuốt cho thú nuôi' AND khoan_tien_boa.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung
SELECT khoan_tien_boa.van_ban FROM khoan_tien_boa JOIN doanh_nghiep ON khoan_tien_boa.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Cafe Zinho' AND doanh_nghiep.thanh_pho = 'Texas'
SELECT nguoi_tieu_dung.ten FROM nguoi_tieu_dung JOIN danh_gia ON nguoi_tieu_dung.id_nguoi_tieu_dung = danh_gia.id_nguoi_tieu_dung JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'nhà hàng'
SELECT khoan_tien_boa.van_ban FROM khoan_tien_boa JOIN doanh_nghiep ON khoan_tien_boa.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'cafe zinho' AND doanh_nghiep.thanh_pho = 'pennsylvania' AND khoan_tien_boa.nam = 2010
SELECT ten FROM nguoi_tieu_dung WHERE id_nguoi_tieu_dung IN (SELECT id_nguoi_tieu_dung FROM danh_gia WHERE nam = 2010)
SELECT danh_gia.van_ban FROM danh_gia JOIN khoan_tien_boa ON danh_gia.id_doanh_nghiep = khoan_tien_boa.id_doanh_nghiep WHERE khoan_tien_boa.nam = 2012
SELECT van_ban FROM danh_gia WHERE danh_gia_xep_hang = 2.5
SELECT COUNT(*) FROM doanh_nghiep AS T1 JOIN loai_hinh AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep WHERE T2.ten_loai_hinh = 'trò chơi trốn thoát' AND T1.thanh_pho = 'Madison'
SELECT COUNT(*) FROM doanh_nghiep AS T1 JOIN loai_hinh AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep WHERE T2.ten_loai_hinh = 'trò chơi trốn thoát' AND T1.thanh_pho = 'Madison'
SELECT COUNT(*) FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE doanh_nghiep.thanh_pho = 'Madison' AND loai_hinh.ten_loai_hinh = 'trò chơi trốn thoát'
SELECT COUNT(DISTINCT doanh_nghiep.id_doanh_nghiep) FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'trò chơi trốn thoát' AND doanh_nghiep.thanh_pho = 'Madison'
SELECT COUNT(*) FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'trò chơi trốn thoát' AND doanh_nghiep.ten = 'Madison'
SELECT COUNT(*) FROM dbo.doanh_nghiep WHERE danh_gia_xep_hang > 3.5
SELECT SUM(luot_dang_ky.so_luong) FROM luot_dang_ky JOIN doanh_nghiep ON luot_dang_ky.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten LIKE '%Ma-rốc%' AND doanh_nghiep.thanh_pho = 'Los Angeles'
SELECT SUM(luot_dang_ky.so_luong) FROM luot_dang_ky JOIN doanh_nghiep ON luot_dang_ky.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten LIKE '%Ma-rốc%' AND doanh_nghiep.thanh_pho = 'Los Angeles' AND luot_dang_ky.ngay LIKE '%Friday%'
SELECT luot_dang_ky.id_luot_dang_ky, SUM(luot_dang_ky.so_luong) AS total_dang_ky, luot_dang_ky.ngay FROM luot_dang_ky JOIN doanh_nghiep ON luot_dang_ky.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Ma-rốc' AND doanh_nghiep.thanh_pho = 'Los Angeles' GROUP BY luot_dang_ky.ngay ORDER BY luot_dang_ky.ngay ASC
SELECT doanh_nghiep.id_doanh_nghiep, doanh_nghiep.tieu_bang, SUM(luot_dang_ky.so_luong) AS tong_luot_dang_ky FROM doanh_nghiep JOIN luot_dang_ky ON doanh_nghiep.id_doanh_nghiep = luot_dang_ky.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Italian Delis' AND luot_dang_ky.ngay LIKE '%Sunday%' GROUP BY doanh_nghiep.tieu_bang, doanh_nghiep.id_doanh_nghiep
SELECT COUNT(*) FROM danh_gia WHERE id_nguoi_tieu_dung = '123' AND nam = 2015
SELECT AVG(danh_gia.danh_gia_xep_hang) FROM danh_gia JOIN nguoi_tieu_dung ON danh_gia.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE nguoi_tieu_dung.ten = 'Michelle'
SELECT so_luong FROM luot_dang_ky JOIN doanh_nghiep ON luot_dang_ky.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Cafe Zinho' AND ngay LIKE '%Fri%'
SELECT COUNT(*) FROM danh_gia JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Sushi Too' AND doanh_nghiep.thanh_pho = 'Pittsburgh'
SELECT COUNT(*) FROM dbo.doanh_nghiep WHERE thanh_pho = 'Pittsburgh' AND danh_gia_xep_hang > 4.5
SELECT COUNT(*) FROM khoan_tien_boa WHERE nam = 2015
SELECT SUM(khoan_tien_boa.so_luot_thich) FROM khoan_tien_boa JOIN danh_gia ON khoan_tien_boa.id_doanh_nghiep = danh_gia.id_doanh_nghiep WHERE danh_gia.id_nguoi_tieu_dung = 'Niloofar'
SELECT SUM(danh_gia.so_luot_thich) FROM danh_gia JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Cafe Zinho'
SELECT SUM(khoan_tien_boa.so_luot_thich) FROM khoan_tien_boa JOIN doanh_nghiep ON khoan_tien_boa.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Cafe Zinho' AND khoan_tien_boa.id_nguoi_tieu_dung = 'Niloofar'
SELECT COUNT(*) FROM danh_gia JOIN khoan_tien_boa ON danh_gia.id_doanh_nghiep = khoan_tien_boa.id_doanh_nghiep WHERE danh_gia.id_nguoi_tieu_dung = 'Michelle' AND khoan_tien_boa.nam = 2010
SELECT COUNT(*) FROM khoan_tien_boa JOIN nguoi_tieu_dung ON khoan_tien_boa.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE nguoi_tieu_dung.ten = 'Michelle' AND khoan_tien_boa.nam = 2010
SELECT COUNT(*) FROM danh_gia JOIN khoan_tien_boa ON danh_gia.id_doanh_nghiep = khoan_tien_boa.id_doanh_nghiep WHERE danh_gia.id_nguoi_tieu_dung = 'Michelle' AND danh_gia.thang = '4' AND khoan_tien_boa.thang = '4'
SELECT COUNT(*) FROM dbo.doanh_nghiep WHERE thanh_pho = 'Texas'
SELECT COUNT(*) FROM dbo.doanh_nghiep WHERE thanh_pho = 'Dallas' AND danh_gia_xep_hang > 3.5
SELECT COUNT(*) FROM dbo.doanh_nghiep WHERE thanh_pho='Dallas' AND danh_gia_xep_hang>3.5
SELECT COUNT(*) FROM danh_gia WHERE id_doanh_nghiep = (SELECT id_doanh_nghiep FROM doanh_nghiep WHERE ten = 'Texas de Brazil' AND thanh_pho = 'Dallas')
SELECT COUNT(*) FROM danh_gia WHERE id_doanh_nghiep = (SELECT id_doanh_nghiep FROM doanh_nghiep WHERE ten = 'Bistro Di Napoli') AND nam = 2015
SELECT COUNT(*) FROM dbo.doanh_nghiep INNER JOIN dbo.khu_vuc_lan_can ON dbo.doanh_nghiep.id_doanh_nghiep = dbo.khu_vuc_lan_can.id_doanh_nghiep WHERE dbo.khu_vuc_lan_can.ten_khu_pho_lan_can = 'Hazelwood' AND dbo.doanh_nghiep.thanh_pho = 'Dallas'
SELECT COUNT(*) FROM dbo.doanh_nghiep WHERE ten LIKE '%Starbucks%' AND thanh_pho = 'Dallas'
SELECT so_luong_danh_gia FROM doanh_nghiep WHERE ten = 'Acacia Cafe'
SELECT AVG(so_luong) FROM luot_dang_ky JOIN doanh_nghiep ON luot_dang_ky.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten = 'Barrio Cafe' GROUP BY ngay
SELECT COUNT(*) FROM doanh_nghiep JOIN khu_vuc_lan_can ON doanh_nghiep.id_doanh_nghiep = khu_vuc_lan_can.id_doanh_nghiep WHERE ten_khu_pho_lan_can = 'Stone Meadows' AND doanh_nghiep.thanh_pho = 'Madison'
SELECT COUNT(*) FROM danh_gia WHERE id_nguoi_tieu_dung = (SELECT id_nguoi_tieu_dung FROM nguoi_tieu_dung WHERE ten = 'Adrienne')
SELECT COUNT(*) FROM danh_gia WHERE id_nguoi_tieu_dung = (SELECT id_nguoi_tieu_dung FROM nguoi_tieu_dung WHERE ten = 'Michelle') AND nam = 2014 AND thang = '3'
SELECT COUNT(*) FROM danh_gia WHERE id_nguoi_tieu_dung = (SELECT id_nguoi_tieu_dung FROM nguoi_tieu_dung WHERE ten = 'Michelle') AND nam = 2010
SELECT COUNT(DISTINCT doanh_nghiep.id_doanh_nghiep) FROM doanh_nghiep JOIN danh_gia ON doanh_nghiep.id_doanh_nghiep = danh_gia.id_doanh_nghiep JOIN nguoi_tieu_dung ON danh_gia.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE doanh_nghiep.thanh_pho = 'San Diego' AND nguoi_tieu_dung.ten = 'Christine' AND danh_gia.nam = 2010
SELECT COUNT(*) FROM doanh_nghiep WHERE ten = 'Target' AND thanh_pho = 'Los Angeles'
SELECT COUNT(DISTINCT danh_gia.id_nguoi_tieu_dung) FROM danh_gia JOIN doanh_nghiep ON danh_gia.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.ten LIKE '%Ale House%' AND doanh_nghiep.thanh_pho = 'Dallas'
SELECT AVG(danh_gia_xep_hang) FROM danh_gia WHERE nam = 2014
SELECT COUNT(DISTINCT id_nguoi_tieu_dung) FROM danh_gia WHERE id_doanh_nghiep = (SELECT CAST(id_doanh_nghiep AS TEXT) FROM doanh_nghiep WHERE ten = 'Vintner Grill') AND nam = 2010
SELECT doanh_nghiep.id_doanh_nghiep, COUNT(*) AS so_luong_danh_gia FROM doanh_nghiep JOIN khu_vuc_lan_can ON doanh_nghiep.id_doanh_nghiep = khu_vuc_lan_can.id_doanh_nghiep WHERE khu_vuc_lan_can.ten_khu_pho_lan_can = 'South Summerlin' GROUP BY doanh_nghiep.id_doanh_nghiep
SELECT COUNT(*) FROM nguoi_tieu_dung WHERE ten = 'Michelle'
SELECT COUNT(*) FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'nhà hàng'
SELECT COUNT(DISTINCT doanh_nghiep.thanh_pho) FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep WHERE loai_hinh.ten_loai_hinh = 'Panda Express'
SELECT COUNT(*) FROM khoan_tien_boa JOIN nguoi_tieu_dung ON khoan_tien_boa.id_nguoi_tieu_dung = nguoi_tieu_dung.id_nguoi_tieu_dung WHERE nguoi_tieu_dung.ten = 'Michelle'
SELECT SUM(luot_dang_ky.so_luong) FROM luot_dang_ky JOIN doanh_nghiep ON luot_dang_ky.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep JOIN khu_vuc_lan_can ON doanh_nghiep.id_doanh_nghiep = khu_vuc_lan_can.id_doanh_nghiep WHERE khu_vuc_lan_can.ten_khu_pho_lan_can = 'Brighton Heights'
SELECT COUNT(*) FROM danh_gia WHERE thang = '3'
SELECT khoan_tien_boa.thang, COUNT(*) AS so_luong_danh_gia FROM khoan_tien_boa GROUP BY khoan_tien_boa.thang
SELECT COUNT(*) FROM khu_vuc_lan_can JOIN doanh_nghiep ON khu_vuc_lan_can.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE doanh_nghiep.thanh_pho = 'Madison' AND doanh_nghiep.danh_gia_xep_hang = 5
SELECT ten FROM dbo.doanh_nghiep JOIN dbo.loai_hinh ON dbo.doanh_nghiep.id_doanh_nghiep = dbo.loai_hinh.id_doanh_nghiep WHERE thanh_pho = 'Texas' AND ten_loai_hinh = 'Maroc'
SELECT T1.ten FROM doanh_nghiep AS T1 JOIN luot_dang_ky AS T2 ON T1.id_doanh_nghiep = T2.id_doanh_nghiep ORDER BY T2.so_luong DESC LIMIT 1
SELECT ten_khu_pho_lan_can, COUNT(*) AS so_doanh_nghiep FROM khu_vuc_lan_can JOIN doanh_nghiep ON khu_vuc_lan_can.id_doanh_nghiep = doanh_nghiep.id_doanh_nghiep WHERE thanh_pho = 'Madison' GROUP BY ten_khu_pho_lan_can ORDER BY so_doanh_nghiep DESC LIMIT 1
SELECT ten FROM dbo.doanh_nghiep JOIN dbo.loai_hinh ON dbo.doanh_nghiep.id_doanh_nghiep = dbo.loai_hinh.id_doanh_nghiep WHERE thanh_pho = 'Dallas' AND danh_gia_xep_hang >= 3.5 AND loai_hinh.ten_loai_hinh = 'Mexican'
SELECT ten FROM dbo.doanh_nghiep JOIN dbo.loai_hinh ON dbo.doanh_nghiep.id_doanh_nghiep = dbo.loai_hinh.id_doanh_nghiep WHERE dbo.loai_hinh.ten_loai_hinh = 'Mexican' AND dbo.doanh_nghiep.danh_gia_xep_hang >= 3.5 AND dbo.doanh_nghiep.thanh_pho = 'Dallas'
SELECT ten FROM dbo.doanh_nghiep JOIN dbo.loai_hinh ON dbo.doanh_nghiep.id_doanh_nghiep = dbo.loai_hinh.id_doanh_nghiep WHERE thanh_pho = 'Dallas' AND ten_loai_hinh = 'dịch vụ đỗ xe'
SELECT ten FROM dbo.doanh_nghiep JOIN dbo.khu_vuc_lan_can ON dbo.doanh_nghiep.id_doanh_nghiep = dbo.khu_vuc_lan_can.id_doanh_nghiep JOIN dbo.loai_hinh ON dbo.doanh_nghiep.id_doanh_nghiep = dbo.loai_hinh.id_doanh_nghiep WHERE ten_khu_pho_lan_can = 'Meadowood' AND thanh_pho = 'Madison' AND ten_loai_hinh = 'Ý'
SELECT ten FROM dbo.doanh_nghiep WHERE ten LIKE '%bar%' AND thanh_pho = 'Los Angeles' AND danh_gia_xep_hang > 3 AND so_luong_danh_gia >= 30 ORDER BY danh_gia_xep_hang DESC LIMIT 1000
SELECT COUNT(*) FROM dbo.doanh_nghiep JOIN dbo.loai_hinh ON dbo.doanh_nghiep.id_doanh_nghiep = dbo.loai_hinh.id_doanh_nghiep WHERE dbo.loai_hinh.ten_loai_hinh = 'Ai Cập' AND dbo.doanh_nghiep.thanh_pho = 'Edinburgh'
SELECT ten FROM nguoi_tieu_dung WHERE id_nguoi_tieu_dung IN (SELECT id_nguoi_tieu_dung FROM danh_gia GROUP BY id_nguoi_tieu_dung HAVING AVG(danh_gia_xep_hang) < 3)
SELECT doanh_nghiep.ten FROM doanh_nghiep JOIN danh_gia ON doanh_nghiep.id_doanh_nghiep = danh_gia.id_doanh_nghiep WHERE danh_gia.thang = '4' GROUP BY doanh_nghiep.id_doanh_nghiep ORDER BY COUNT(*) DESC LIMIT 1
SELECT doanh_nghiep.ten, COUNT(loai_hinh.id) AS so_loai_hinh FROM doanh_nghiep JOIN loai_hinh ON doanh_nghiep.id_doanh_nghiep = loai_hinh.id_doanh_nghiep GROUP BY doanh_nghiep.id_doanh_nghiep ORDER BY so_loai_hinh DESC LIMIT 1
