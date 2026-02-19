select t1.id_tai_san , t1.chi_tiet_tai_san from tai_san as t1 join bo_phan_cua_tai_san as t2 on t1.id_tai_san = t2.id_tai_san group by t1.id_tai_san having count ( * ) = 2 intersect select t1.id_tai_san , t1.chi_tiet_tai_san from tai_san as t1 join nhat_ky_loi as t2 on t1.id_tai_san = t2.id_tai_san group by t1.id_tai_san having count ( * ) < 2	assets_maintenance
select count ( * ) , t1.id_hop_dong_bao_tri from hop_dong_bao_tri as t1 join tai_san as t2 on t1.id_hop_dong_bao_tri = t2.id_hop_dong_bao_tri group by t1.id_hop_dong_bao_tri	assets_maintenance
select count ( * ) , t1.id_cong_ty from cong_ty_ben_thu_ba as t1 join tai_san as t2 on t1.id_cong_ty = t2.id_cong_ty_cung_cap group by t1.id_cong_ty	assets_maintenance
select t1.id_cong_ty , t1.ten_cong_ty from cong_ty_ben_thu_ba as t1 join ky_su_bao_tri as t2 on t1.id_cong_ty = t2.id_cong_ty group by t1.id_cong_ty having count ( * ) >= 2 union select t3.id_cong_ty , t3.ten_cong_ty from cong_ty_ben_thu_ba as t3 join hop_dong_bao_tri as t4 on t3.id_cong_ty = t4.id_hop_dong_bao_tri_cua_cong_ty group by t3.id_cong_ty having count ( * ) >= 2	assets_maintenance
select t1.ten_nhan_vien , t1.id_nhan_vien from nhan_vien as t1 join nhat_ky_loi as t2 on t1.id_nhan_vien = t2.duoc_ghi_lai_boi_nhan_vien_co_id except select t3.ten_nhan_vien , t3.id_nhan_vien from nhan_vien as t3 join chuyen_tham_cua_ky_su as t4 on t3.id_nhan_vien = t4.id_nhan_vien_lien_lac	assets_maintenance
select t1.id_ky_su , t1.ten , t1.ho from ky_su_bao_tri as t1 join chuyen_tham_cua_ky_su as t2 group by t1.id_ky_su order by count ( * ) desc limit 1	assets_maintenance
select t1.ten_bo_phan , t1.id_bo_phan from bo_phan as t1 join loi_bo_phan as t2 on t1.id_bo_phan = t2.id_bo_phan group by t1.id_bo_phan having count ( * ) > 2	assets_maintenance
select t1.ten , t1.ho , t1.nhung_chi_tiet_khac , t3.mo_ta_ve_ky_nang from ky_su_bao_tri as t1 join ky_nang_cua_ky_su as t2 on t1.id_ky_su = t2.id_ky_su join ky_nang as t3 on t2.id_ky_nang = t3.id_ky_nang	assets_maintenance
select t1.ten_viet_tat_cua_loi , t3.mo_ta_ve_ky_nang from loi_bo_phan as t1 join ky_nang_can_de_sua_chua as t2 on t1.id_bo_phan_bi_loi = t2.id_bo_phan_bi_loi join ky_nang as t3 on t2.id_ky_nang = t3.id_ky_nang	assets_maintenance
select t1.ten_bo_phan , count ( * ) from bo_phan as t1 join bo_phan_cua_tai_san as t2 on t1.id_bo_phan = t2.id_bo_phan group by t1.ten_bo_phan	assets_maintenance
select t1.mo_ta_ve_loi , t2.tinh_trang_loi from nhat_ky_loi as t1 join nhat_ky_cua_loi_bo_phan as t2 on t1.id_muc_nhap_cua_nhat_ky_loi = t2.id_muc_nhap_cua_nhat_ky_loi	assets_maintenance
select count ( * ) , t1.id_muc_nhap_cua_nhat_ky_loi from nhat_ky_loi as t1 join chuyen_tham_cua_ky_su as t2 on t1.id_muc_nhap_cua_nhat_ky_loi = t2.id_muc_nhap_cua_nhat_ky_loi group by t1.id_muc_nhap_cua_nhat_ky_loi order by count ( * ) desc limit 1	assets_maintenance
select distinct ho from ky_su_bao_tri	assets_maintenance
select distinct tinh_trang_loi from nhat_ky_cua_loi_bo_phan	assets_maintenance
select ten , ho from ky_su_bao_tri where id_ky_su not in ( select id_ky_su from chuyen_tham_cua_ky_su )	assets_maintenance
select id_tai_san , chi_tiet_tai_san , thuong_hieu_tai_san , mau_ma_tai_san from tai_san	assets_maintenance
select ngay_mua_tai_san from tai_san order by ngay_mua_tai_san asc limit 1	assets_maintenance
select t1.id_bo_phan , t1.ten_bo_phan from bo_phan as t1 join loi_bo_phan as t2 on t1.id_bo_phan = t2.id_bo_phan join ky_nang_can_de_sua_chua as t3 on t2.id_bo_phan_bi_loi = t3.id_bo_phan_bi_loi group by t1.id_bo_phan order by count ( * ) desc limit 1	assets_maintenance
select t1.ten_bo_phan from bo_phan as t1 join loi_bo_phan as t2 on t1.id_bo_phan = t2.id_bo_phan group by t1.ten_bo_phan order by count ( * ) asc limit 1	assets_maintenance
select t1.id_ky_su , t1.ten , t1.ho from ky_su_bao_tri as t1 join chuyen_tham_cua_ky_su as t2 on t1.id_ky_su = t2.id_ky_su group by t1.id_ky_su order by count ( * ) asc limit 1	assets_maintenance
select t1.ten_nhan_vien , t3.ten , t3.ho from nhan_vien as t1 join chuyen_tham_cua_ky_su as t2 on t1.id_nhan_vien = t2.id_nhan_vien_lien_lac join ky_su_bao_tri as t3 on t2.id_ky_su = t3.id_ky_su	assets_maintenance
select t1.id_muc_nhap_cua_nhat_ky_loi , t1.mo_ta_ve_loi , t1.thoi_gian_muc_nhap_cua_nhat_ky_loi from nhat_ky_loi as t1 join nhat_ky_cua_loi_bo_phan as t2 on t1.id_muc_nhap_cua_nhat_ky_loi = t2.id_muc_nhap_cua_nhat_ky_loi group by t1.id_muc_nhap_cua_nhat_ky_loi order by count ( * ) desc limit 1	assets_maintenance
select t1.id_ky_nang , t1.mo_ta_ve_ky_nang from ky_nang as t1 join ky_nang_can_de_sua_chua as t2 on t1.id_ky_nang = t2.id_ky_nang group by t1.id_ky_nang order by count ( * ) desc limit 1	assets_maintenance
select distinct mau_ma_tai_san from tai_san	assets_maintenance
select thuong_hieu_tai_san , mau_ma_tai_san , chi_tiet_tai_san from tai_san order by ngay_thanh_ly_tai_san asc	assets_maintenance
select id_bo_phan , so_tien_phai_tra from bo_phan order by so_tien_phai_tra asc limit 1	assets_maintenance
select t1.ten_cong_ty from cong_ty_ben_thu_ba as t1 join hop_dong_bao_tri as t2 on t1.id_cong_ty = t2.id_hop_dong_bao_tri_cua_cong_ty order by t2.ngay_bat_dau_hop_dong asc limit 1	assets_maintenance
select t1.ten_cong_ty from cong_ty_ben_thu_ba as t1 join hop_dong_bao_tri as t2 on t1.id_cong_ty = t2.id_hop_dong_bao_tri_cua_cong_ty order by t2.ngay_ket_thuc_hop_dong desc limit 1	assets_maintenance
select gioi_tinh from nhan_vien group by gioi_tinh order by count ( * ) desc limit 1	assets_maintenance
select t1.ten_nhan_vien , count ( * ) from nhan_vien as t1 join chuyen_tham_cua_ky_su as t2 on t1.id_nhan_vien = t2.id_nhan_vien_lien_lac group by t1.ten_nhan_vien	assets_maintenance
select mau_ma_tai_san from tai_san where id_tai_san not in (select id_tai_san from nhat_ky_loi)	assets_maintenance
select count ( * ) from sach	book_2
select tac_gia from sach order by tac_gia asc	book_2
select tieu_de from sach order by so_luong_phat_hanh asc	book_2
select tieu_de from sach where tac_gia != 'Elaine Lee'	book_2
select tieu_de , so_luong_phat_hanh from sach	book_2
select ngay_xuat_ban from an_pham order by gia_ban desc	book_2
select distinct nha_xuat_ban from an_pham where gia_ban > 5000000	book_2
select nha_xuat_ban from an_pham order by gia_ban desc limit 1	book_2
select ngay_xuat_ban from an_pham order by gia_ban asc limit 3	book_2
select t1.tieu_de , t2.ngay_xuat_ban from sach as t1 join an_pham as t2 on t1.id_sach = t2.id_sach	book_2
select t1.tac_gia from sach as t1 join an_pham as t2 on t1.id_sach = t2.id_sach where t2.gia_ban > 4000000	book_2
select t1.tieu_de from sach as t1 join an_pham as t2 on t1.id_sach = t2.id_sach order by t2.gia_ban desc	book_2
select nha_xuat_ban from an_pham group by nha_xuat_ban having count ( * ) > 1	book_2
select nha_xuat_ban , count ( * ) from an_pham group by nha_xuat_ban	book_2
select ngay_xuat_ban from an_pham group by ngay_xuat_ban order by count ( * ) desc limit 1	book_2
select tac_gia from sach group by tac_gia having count ( * ) > 1	book_2
select tieu_de from sach where id_sach not in ( select id_sach from an_pham )	book_2
select nha_xuat_ban from an_pham where gia_ban > 10000000 intersect select nha_xuat_ban from an_pham where gia_ban < 5000000	book_2
select count ( distinct ngay_xuat_ban ) from an_pham	book_2
select count ( distinct ngay_xuat_ban ) from an_pham	book_2
select gia_ban from an_pham where nha_xuat_ban = 'Person' or nha_xuat_ban = 'Wiley'	book_2
select ten_bo_phan from bo_phan order by ngay_bat_dau_quan_ly	company_1
select ten_nguoi_phu_thuoc from nguoi_phu_thuoc where moi_quan_he = 'Spouse'	company_1
select count ( * ) from nguoi_phu_thuoc where gioi_tinh = 'F'	company_1
select t1.ten_bo_phan from bo_phan as t1 join dia_diem_cua_bo_phan as t2 on t1.ma_so_bo_phan = t2.ma_so_bo_phan where t2.dia_diem_bo_phan = 'Houston'	company_1
select ten , ho from nhan_vien where luong > 30000	company_1
select count ( * ) , gioi_tinh from nhan_vien where luong < 50000 group by gioi_tinh	company_1
select ten , ho , dia_chi from nhan_vien order by ngay_sinh	company_1
select count ( * ) from giao_vien	course_teach
select count ( * ) from giao_vien	course_teach
select ten from giao_vien order by tuoi asc	course_teach
select ten from giao_vien order by tuoi asc	course_teach
select tuoi , que_quan from giao_vien	course_teach
select tuoi , que_quan from giao_vien	course_teach
select ten from giao_vien where que_quan != 'Little Lever Urban Distric'	course_teach
select ten from giao_vien where que_quan != 'Little Lever Urban Distric'	course_teach
select ten from giao_vien where tuoi = 32 or tuoi = 33	course_teach
select ten from giao_vien where tuoi = 32 or tuoi = 33	course_teach
select que_quan from giao_vien order by tuoi asc limit 1	course_teach
select que_quan from giao_vien order by tuoi asc limit 1	course_teach
select que_quan , count ( * ) from giao_vien group by que_quan	course_teach
select que_quan , count ( * ) from giao_vien group by que_quan	course_teach
select que_quan from giao_vien group by que_quan order by count ( * ) desc limit 1	course_teach
select que_quan from giao_vien group by que_quan order by count ( * ) desc limit 1	course_teach
select que_quan from giao_vien group by que_quan having count ( * ) >= 2	course_teach
select que_quan from giao_vien group by que_quan having count ( * ) >= 2	course_teach
select t3.ten , t2.khoa_hoc from sap_xep_khoa_hoc as t1 join khoa_hoc as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc join giao_vien as t3 on t1.id_giao_vien = t3.id_giao_vien	course_teach
select t3.ten , t2.khoa_hoc from sap_xep_khoa_hoc as t1 join khoa_hoc as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc join giao_vien as t3 on t1.id_giao_vien = t3.id_giao_vien	course_teach
select t3.ten , t2.khoa_hoc from sap_xep_khoa_hoc as t1 join khoa_hoc as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc join giao_vien as t3 on t1.id_giao_vien = t3.id_giao_vien order by t3.ten	course_teach
select t3.ten , t2.khoa_hoc from sap_xep_khoa_hoc as t1 join khoa_hoc as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc join giao_vien as t3 on t1.id_giao_vien = t3.id_giao_vien order by t3.ten	course_teach
select t3.ten from sap_xep_khoa_hoc as t1 join khoa_hoc as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc join giao_vien as t3 on t1.id_giao_vien = t3.id_giao_vien where t2.khoa_hoc = 'Math'	course_teach
select t3.ten from sap_xep_khoa_hoc as t1 join khoa_hoc as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc join giao_vien as t3 on t1.id_giao_vien = t3.id_giao_vien where t2.khoa_hoc = 'Math'	course_teach
select t2.ten , count ( * ) from sap_xep_khoa_hoc as t1 join giao_vien as t2 on t1.id_giao_vien = t2.id_giao_vien group by t2.ten	course_teach
select t2.ten , count ( * ) from sap_xep_khoa_hoc as t1 join giao_vien as t2 on t1.id_giao_vien = t2.id_giao_vien group by t2.ten	course_teach
select t2.ten from sap_xep_khoa_hoc as t1 join giao_vien as t2 on t1.id_giao_vien = t2.id_giao_vien group by t2.ten having count ( * ) >= 2	course_teach
select t2.ten from sap_xep_khoa_hoc as t1 join giao_vien as t2 on t1.id_giao_vien = t2.id_giao_vien group by t2.ten having count ( * ) >= 2	course_teach
select ten from giao_vien where id_giao_vien not in ( select id_giao_vien from sap_xep_khoa_hoc )	course_teach
select ten from giao_vien where id_giao_vien not in ( select id_giao_vien from sap_xep_khoa_hoc )	course_teach
select count ( * ) from thanh_vien	decoration_competition
select ten from thanh_vien order by ten asc	decoration_competition
select ten , quoc_gia from thanh_vien	decoration_competition
select ten from thanh_vien where quoc_gia = 'United States' or quoc_gia = 'Canada'	decoration_competition
select quoc_gia , count ( * ) from thanh_vien group by quoc_gia	decoration_competition
select quoc_gia from thanh_vien group by quoc_gia order by count ( * ) desc limit 1	decoration_competition
select quoc_gia from thanh_vien group by quoc_gia having count ( * ) > 2	decoration_competition
select ten_lanh_dao , dia_diem_truong_dai_hoc from truong_dai_hoc	decoration_competition
select t2.ten , t1.ten from truong_dai_hoc as t1 join thanh_vien as t2 on t1.id_dai_hoc = t2.id_dai_hoc	decoration_competition
select t2.ten , t1.dia_diem_truong_dai_hoc from truong_dai_hoc as t1 join thanh_vien as t2 on t1.id_dai_hoc = t2.id_dai_hoc order by t2.ten asc	decoration_competition
select distinct t1.ten_lanh_dao from truong_dai_hoc as t1 join thanh_vien as t2 on t1.id_dai_hoc = t2.id_dai_hoc where t2.quoc_gia = 'Canada'	decoration_competition
select t1.ten , t2.chu_de_trang_tri from thanh_vien as t1 join vong as t2 on t1.id_thanh_vien = t2.id_thanh_vien	decoration_competition
select t1.ten from thanh_vien as t1 join vong as t2 on t1.id_thanh_vien = t2.id_thanh_vien where t2.xep_hang_tung_vong > 3	decoration_competition
select t1.ten from thanh_vien as t1 join vong as t2 on t1.id_thanh_vien = t2.id_thanh_vien order by xep_hang_tung_vong asc	decoration_competition
select ten from thanh_vien where id_thanh_vien not in ( select id_thanh_vien from vong )	decoration_competition
select count ( * ) from cuoc_bau_cu	election_representative
select so_luong_phieu_bau from cuoc_bau_cu order by so_luong_phieu_bau desc	election_representative
select ngay , ti_le_phieu_bau from cuoc_bau_cu	election_representative
select min ( ti_le_phieu_bau ) , max ( ti_le_phieu_bau ) from cuoc_bau_cu	election_representative
select ten , dang from dai_dien	election_representative
select ten from dai_dien where dang != 'Republican'	election_representative
select tuoi_tho from dai_dien where tieu_bang = 'New York' or tieu_bang = 'Indiana'	election_representative
select t2.ten , t1.ngay from cuoc_bau_cu as t1 join dai_dien as t2 on t1.id_dai_dien = t2.id_dai_dien	election_representative
select t2.ten from cuoc_bau_cu as t1 join dai_dien as t2 on t1.id_dai_dien = t2.id_dai_dien where so_luong_phieu_bau > 10000	election_representative
select t2.ten from cuoc_bau_cu as t1 join dai_dien as t2 on t1.id_dai_dien = t2.id_dai_dien order by so_luong_phieu_bau desc	election_representative
select t2.dang from cuoc_bau_cu as t1 join dai_dien as t2 on t1.id_dai_dien = t2.id_dai_dien order by so_luong_phieu_bau asc limit 1	election_representative
select t2.tuoi_tho from cuoc_bau_cu as t1 join dai_dien as t2 on t1.id_dai_dien = t2.id_dai_dien order by ti_le_phieu_bau desc	election_representative
select avg ( t1.so_luong_phieu_bau ) from cuoc_bau_cu as t1 join dai_dien as t2 on t1.id_dai_dien = t2.id_dai_dien where t2.dang = 'Republican'	election_representative
select dang , count ( * ) from dai_dien group by dang	election_representative
select dang , count ( * ) from dai_dien group by dang order by count ( * ) desc limit 1	election_representative
select dang from dai_dien group by dang having count ( * ) >= 3	election_representative
select tieu_bang from dai_dien group by tieu_bang having count ( * ) >= 2	election_representative
select ten from dai_dien where id_dai_dien not in ( select id_dai_dien from cuoc_bau_cu )	election_representative
select dang from dai_dien where tieu_bang = 'New York' intersect select dang from dai_dien where tieu_bang = 'Pennsylvania'	election_representative
select count ( distinct dang ) from dai_dien	election_representative
select count ( * ) from quoc_gia	match_season
select count ( * ) from quoc_gia	match_season
select ten_quoc_gia , thu_do from quoc_gia	match_season
select ten_quoc_gia , thu_do from quoc_gia	match_season
select ngon_ngu_ban_dia_chinh_thuc from quoc_gia where ngon_ngu_ban_dia_chinh_thuc like '%English%'	match_season
select ngon_ngu_ban_dia_chinh_thuc from quoc_gia where ngon_ngu_ban_dia_chinh_thuc like '%English%'	match_season
select distinct vi_tri from tran_dau_trong_mua_giai	match_season
select distinct vi_tri from tran_dau_trong_mua_giai	match_season
select cau_thu from tran_dau_trong_mua_giai where truong_dai_hoc = 'UCLA'	match_season
select cau_thu from tran_dau_trong_mua_giai where truong_dai_hoc = 'UCLA'	match_season
select distinct vi_tri from tran_dau_trong_mua_giai where truong_dai_hoc = 'UCLA' or truong_dai_hoc = 'Duke'	match_season
select distinct vi_tri from tran_dau_trong_mua_giai where truong_dai_hoc = 'UCLA' or truong_dai_hoc = 'Duke'	match_season
select ma_so_tuyen_chon_tan_binh , mua_tuyen_chon from tran_dau_trong_mua_giai where vi_tri = 'Defender'	match_season
select ma_so_tuyen_chon_tan_binh , mua_tuyen_chon from tran_dau_trong_mua_giai where vi_tri = 'Defender'	match_season
select count ( distinct doi ) from tran_dau_trong_mua_giai	match_season
select count ( distinct doi ) from tran_dau_trong_mua_giai	match_season
select cau_thu , so_nam_da_choi from cau_thu	match_season
select cau_thu , so_nam_da_choi from cau_thu	match_season
select ten from doi	match_season
select ten from doi	match_season
select t2.mua_giai , t2.cau_thu , t1.ten_quoc_gia from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia	match_season
select t2.mua_giai , t2.cau_thu , t1.ten_quoc_gia from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia	match_season
select t2.cau_thu from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t1.ten_quoc_gia = 'Indonesia'	match_season
select t2.cau_thu from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t1.ten_quoc_gia = 'Indonesia'	match_season
select distinct t2.vi_tri from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t1.thu_do = 'Dublin'	match_season
select distinct t2.vi_tri from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t1.thu_do = 'Dublin'	match_season
select t1.ngon_ngu_ban_dia_chinh_thuc from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.truong_dai_hoc = 'Maryland' or t2.truong_dai_hoc = 'Duke'	match_season
select t1.ngon_ngu_ban_dia_chinh_thuc from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.truong_dai_hoc = 'Maryland' or t2.truong_dai_hoc = 'Duke'	match_season
select count ( distinct t1.ngon_ngu_ban_dia_chinh_thuc ) from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.vi_tri = 'Defender'	match_season
select count ( distinct t1.ngon_ngu_ban_dia_chinh_thuc ) from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.vi_tri = 'Defender'	match_season
select t1.mua_giai , t1.cau_thu , t2.ten from tran_dau_trong_mua_giai as t1 join doi as t2 on t1.doi = t2.id_doi	match_season
select t1.mua_giai , t1.cau_thu , t2.ten from tran_dau_trong_mua_giai as t1 join doi as t2 on t1.doi = t2.id_doi	match_season
select t1.vi_tri from tran_dau_trong_mua_giai as t1 join doi as t2 on t1.doi = t2.id_doi where t2.ten = 'Ryley Goldner'	match_season
select t1.vi_tri from tran_dau_trong_mua_giai as t1 join doi as t2 on t1.doi = t2.id_doi where t2.ten = 'Ryley Goldner'	match_season
select count ( distinct t1.truong_dai_hoc ) from tran_dau_trong_mua_giai as t1 join doi as t2 on t1.doi = t2.id_doi where t2.ten = 'Columbus Crew'	match_season
select count ( distinct t1.truong_dai_hoc ) from tran_dau_trong_mua_giai as t1 join doi as t2 on t1.doi = t2.id_doi where t2.ten = 'Columbus Crew'	match_season
select t1.cau_thu , t1.so_nam_da_choi from cau_thu as t1 join doi as t2 on t1.doi = t2.id_doi where t2.ten = 'Columbus Crew'	match_season
select t1.cau_thu , t1.so_nam_da_choi from cau_thu as t1 join doi as t2 on t1.doi = t2.id_doi where t2.ten = 'Columbus Crew'	match_season
select vi_tri , count ( * ) from tran_dau_trong_mua_giai group by vi_tri	match_season
select vi_tri , count ( * ) from tran_dau_trong_mua_giai group by vi_tri	match_season
select ten_quoc_gia , count ( * ) from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia group by t1.ten_quoc_gia	match_season
select ten_quoc_gia , count ( * ) from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia group by t1.ten_quoc_gia	match_season
select cau_thu from tran_dau_trong_mua_giai order by truong_dai_hoc asc	match_season
select cau_thu from tran_dau_trong_mua_giai order by truong_dai_hoc asc	match_season
select vi_tri from tran_dau_trong_mua_giai group by vi_tri order by count ( * ) desc limit 1	match_season
select vi_tri from tran_dau_trong_mua_giai group by vi_tri order by count ( * ) desc limit 1	match_season
select truong_dai_hoc from tran_dau_trong_mua_giai group by truong_dai_hoc order by count ( * ) desc limit 3	match_season
select truong_dai_hoc from tran_dau_trong_mua_giai group by truong_dai_hoc order by count ( * ) desc limit 3	match_season
select truong_dai_hoc from tran_dau_trong_mua_giai group by truong_dai_hoc having count ( * ) >= 2	match_season
select truong_dai_hoc from tran_dau_trong_mua_giai group by truong_dai_hoc having count ( * ) >= 2	match_season
select truong_dai_hoc from tran_dau_trong_mua_giai group by truong_dai_hoc having count ( * ) >= 2 order by truong_dai_hoc desc	match_season
select truong_dai_hoc from tran_dau_trong_mua_giai group by truong_dai_hoc having count ( * ) >= 2 order by truong_dai_hoc desc	match_season
select ten from doi where id_doi not in ( select doi from tran_dau_trong_mua_giai )	match_season
select ten from doi where id_doi not in ( select doi from tran_dau_trong_mua_giai )	match_season
select t1.ten_quoc_gia from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.vi_tri = 'Forward' intersect select t1.ten_quoc_gia from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.vi_tri = 'Defender'	match_season
select t1.ten_quoc_gia from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.vi_tri = 'Forward' intersect select t1.ten_quoc_gia from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.vi_tri = 'Defender'	match_season
select truong_dai_hoc from tran_dau_trong_mua_giai where vi_tri = 'Midfielder' intersect select truong_dai_hoc from tran_dau_trong_mua_giai where vi_tri = 'Defender'	match_season
select truong_dai_hoc from tran_dau_trong_mua_giai where vi_tri = 'Midfielder' intersect select truong_dai_hoc from tran_dau_trong_mua_giai where vi_tri = 'Defender'	match_season
select count ( * ) from toi_pham	perpetrator
select ngay from toi_pham order by so_nguoi_bi_giet desc	perpetrator
select so_nguoi_bi_thuong from toi_pham order by so_nguoi_bi_thuong asc	perpetrator
select avg ( so_nguoi_bi_thuong ) from toi_pham	perpetrator
select dia_diem from toi_pham order by so_nguoi_bi_giet desc limit 1	perpetrator
select ten from ca_nhan order by chieu_cao asc	perpetrator
select t1.ten from ca_nhan as t1 join toi_pham as t2 on t1.id_ca_nhan = t2.id_ca_nhan	perpetrator
select t1.ten from ca_nhan as t1 join toi_pham as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t2.quoc_gia != 'China'	perpetrator
select t1.ten from ca_nhan as t1 join toi_pham as t2 on t1.id_ca_nhan = t2.id_ca_nhan order by t1.can_nang desc limit 1	perpetrator
select sum ( t2.so_nguoi_bi_giet ) from ca_nhan as t1 join toi_pham as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t1.chieu_cao > 1.84	perpetrator
select t1.ten from ca_nhan as t1 join toi_pham as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t2.quoc_gia = 'China' or t2.quoc_gia = 'Japan'	perpetrator
select t1.chieu_cao from ca_nhan as t1 join toi_pham as t2 on t1.id_ca_nhan = t2.id_ca_nhan order by t2.so_nguoi_bi_thuong desc	perpetrator
select quoc_gia , count ( * ) from toi_pham group by quoc_gia	perpetrator
select quoc_gia , count ( * ) from toi_pham group by quoc_gia order by count ( * ) desc limit 1	perpetrator
select quoc_gia , count ( * ) from toi_pham group by quoc_gia having count ( * ) >= 2	perpetrator
select t1.ten from ca_nhan as t1 join toi_pham as t2 on t1.id_ca_nhan = t2.id_ca_nhan order by t2.nam desc	perpetrator
select ten from ca_nhan where id_ca_nhan not in ( select id_ca_nhan from toi_pham )	perpetrator
select quoc_gia from toi_pham where so_nguoi_bi_thuong > 50 intersect select quoc_gia from toi_pham where so_nguoi_bi_thuong < 20	perpetrator
select count ( distinct dia_diem ) from toi_pham	perpetrator
select t2.ngay from ca_nhan as t1 join toi_pham as t2 on t1.id_ca_nhan = t2.id_ca_nhan order by t1.chieu_cao desc limit 1	perpetrator
select max ( nam ) from toi_pham	perpetrator
select chinh_quyen_dia_phuong , dich_vu from nha_ga	station_weather
select so_hieu_tau , ten from tau_hoa order by thoi_gian	station_weather
select thoi_gian , so_hieu_tau from tau_hoa where diem_den = 'Chennai' order by thoi_gian	station_weather
select count ( * ) from tau_hoa where ten like '%Express%'	station_weather
select so_hieu_tau , thoi_gian from tau_hoa where diem_khoi_hanh = 'Chennai' and diem_den = 'Guruvayur'	station_weather
select diem_khoi_hanh , count ( * ) from tau_hoa group by diem_khoi_hanh	station_weather
select t1.ten from tau_hoa as t1 join lo_trinh as t2 on t1.id = t2.id_tau group by t2.id_tau order by count ( * ) desc limit 1	station_weather
select count ( * ) , t1.ten_mang_luoi , t1.dich_vu from nha_ga as t1 join lo_trinh as t2 on t1.id = t2.id_nha_ga group by t2.id_nha_ga	station_weather
select avg ( nhiet_do_cao ) , ngay_trong_tuan from thoi_tiet_hang_tuan group by ngay_trong_tuan	station_weather
select max ( t1.nhiet_do_thap ) , avg ( t1.luong_mua ) from thoi_tiet_hang_tuan as t1 join nha_ga as t2 on t1.id_nha_ga = t2.id where t2.ten_mang_luoi = 'Amersham'	station_weather
select t3.ten , t3.thoi_gian from nha_ga as t1 join lo_trinh as t2 on t1.id = t2.id_nha_ga join tau_hoa as t3 on t2.id_tau = t3.id where t1.chinh_quyen_dia_phuong = 'Chiltern'	station_weather
select count ( distinct dich_vu ) from nha_ga	station_weather
select t2.id , t2.chinh_quyen_dia_phuong from thoi_tiet_hang_tuan as t1 join nha_ga as t2 on t1.id_nha_ga = t2.id group by t1.id_nha_ga order by avg ( nhiet_do_cao ) desc limit 1	station_weather
select t2.id , t2.chinh_quyen_dia_phuong from thoi_tiet_hang_tuan as t1 join nha_ga as t2 on t1.id_nha_ga = t2.id group by t1.id_nha_ga having max ( t1.luong_mua ) > 50	station_weather
select min ( nhiet_do_thap ) , max ( toc_do_gio_mph ) from thoi_tiet_hang_tuan	station_weather
select diem_khoi_hanh from tau_hoa group by diem_khoi_hanh having count ( * ) > 1	station_weather
select count ( * ) from nha_tho where ngay_mo_cua < 1850	wedding
select ten , ngay_mo_cua , duoc_to_chuc_boi from nha_tho	wedding
select ten from nha_tho order by ngay_mo_cua desc	wedding
select ngay_mo_cua from nha_tho group by ngay_mo_cua having count ( * ) >= 2	wedding
select duoc_to_chuc_boi , ten from nha_tho where ngay_mo_cua between 1830 and 1840	wedding
select ngay_mo_cua , count ( * ) from nha_tho group by ngay_mo_cua	wedding
select ten , ngay_mo_cua from nha_tho order by ngay_mo_cua desc limit 3	wedding
select count ( * ) from ca_nhan where la_nam_hay_nu = 'F' and tuoi > 30	wedding
select quoc_gia from ca_nhan where tuoi < 25 intersect select quoc_gia from ca_nhan where tuoi > 30	wedding
select min ( tuoi ) , max ( tuoi ) , avg ( tuoi ) from ca_nhan	wedding
select ten , quoc_gia from ca_nhan where tuoi < ( select avg ( tuoi ) from ca_nhan )	wedding
select t2.ten , t3.ten from le_cuoi as t1 join ca_nhan as t2 on t1.id_nam = t2.id_ca_nhan join ca_nhan as t3 on t1.id_nu = t3.id_ca_nhan where t1.nam > 2014	wedding
select ten , tuoi from ca_nhan where la_nam_hay_nu = 'T' and id_ca_nhan not in ( select id_nam from le_cuoi )	wedding
select ten from nha_tho except select t1.ten from nha_tho as t1 join le_cuoi as t2 on t1.id_nha_tho = t2.id_nha_tho where t2.nam = 2015	wedding
select t1.ten from nha_tho as t1 join le_cuoi as t2 on t1.id_nha_tho = t2.id_nha_tho group by t1.id_nha_tho having count ( * ) >= 2	wedding
select t2.ten from le_cuoi as t1 join ca_nhan as t2 on t1.id_nu = t2.id_ca_nhan where t1.nam = 2016 and t2.la_nam_hay_nu = 'F' and t2.quoc_gia = 'Canada'	wedding
select count ( * ) from le_cuoi where nam = 2016	wedding
select t4.ten from le_cuoi as t1 join ca_nhan as t2 on t1.id_nam = t2.id_ca_nhan join ca_nhan as t3 on t1.id_nu = t3.id_ca_nhan join nha_tho as t4 on t4.id_nha_tho = t1.id_nha_tho where t2.tuoi > 30 or t3.tuoi > 30	wedding
select quoc_gia , count ( * ) from ca_nhan group by quoc_gia	wedding
select count ( distinct id_nha_tho ) from le_cuoi where nam = 2016	wedding
select count ( * ) from giang_vien	activity_1
select count ( * ) from giang_vien	activity_1
select distinct ngach from giang_vien	activity_1
select distinct ngach from giang_vien	activity_1
select distinct toa_nha from giang_vien	activity_1
select distinct toa_nha from giang_vien	activity_1
select ngach , ten , ho from giang_vien	activity_1
select ngach , ten , ho from giang_vien	activity_1
select ten , ho , so_dien_thoai from giang_vien where gioi_tinh = 'F'	activity_1
select ten , ho , so_dien_thoai from giang_vien where gioi_tinh = 'F'	activity_1
select id_giang_vien from giang_vien where gioi_tinh = 'M'	activity_1
select id_giang_vien from giang_vien where gioi_tinh = 'M'	activity_1
select count ( * ) from giang_vien where gioi_tinh = 'F' and ngach = 'Professor'	activity_1
select count ( * ) from giang_vien where gioi_tinh = 'F' and ngach = 'Professor'	activity_1
select so_dien_thoai , so_phong , toa_nha from giang_vien where ten = 'Jerry' and ho = 'Prince'	activity_1
select so_dien_thoai , so_phong , toa_nha from giang_vien where ten = 'Jerry' and ho = 'Prince'	activity_1
select count ( * ) from giang_vien where ngach = 'Professor' and toa_nha = 'NEB'	activity_1
select count ( * ) from giang_vien where ngach = 'Professor' and toa_nha = 'NEB'	activity_1
select ten , ho from giang_vien where ngach = 'Instructor'	activity_1
select ten , ho from giang_vien where ngach = 'Instructor'	activity_1
select toa_nha , count ( * ) from giang_vien group by toa_nha	activity_1
select toa_nha , count ( * ) from giang_vien group by toa_nha	activity_1
select toa_nha from giang_vien group by toa_nha order by count ( * ) desc limit 1	activity_1
select toa_nha from giang_vien group by toa_nha order by count ( * ) desc limit 1	activity_1
select toa_nha from giang_vien where ngach = 'Professor' group by toa_nha having count ( * ) >= 10	activity_1
select toa_nha from giang_vien where ngach = 'Professor' group by toa_nha having count ( * ) >= 10	activity_1
select ngach , count ( * ) from giang_vien group by ngach	activity_1
select ngach , count ( * ) from giang_vien group by ngach	activity_1
select ngach , gioi_tinh , count ( * ) from giang_vien group by ngach , gioi_tinh	activity_1
select ngach , gioi_tinh , count ( * ) from giang_vien group by ngach , gioi_tinh	activity_1
select ngach from giang_vien group by ngach order by count ( * ) asc limit 1	activity_1
select ngach from giang_vien group by ngach order by count ( * ) asc limit 1	activity_1
select gioi_tinh , count ( * ) from giang_vien where ngach = 'AsstProf' group by gioi_tinh	activity_1
select gioi_tinh , count ( * ) from giang_vien where ngach = 'AsstProf' group by gioi_tinh	activity_1
select t1.ten , t1.ho from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van where t2.ten = 'Linda' and t2.ho = 'Smith'	activity_1
select t1.ten , t1.ho from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van where t2.ten = 'Linda' and t2.ho = 'Smith'	activity_1
select t2.id_sinh_vien from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van where t1.ngach = 'Professor'	activity_1
select t2.id_sinh_vien from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van where t1.ngach = 'Professor'	activity_1
select t2.ten , t2.ho from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van where t1.ten = 'Michael' and t1.ho = 'Goodrich'	activity_1
select t2.ten , t2.ho from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van where t1.ten = 'Michael' and t1.ho = 'Goodrich'	activity_1
select t1.id_giang_vien , count ( * ) from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van group by t1.id_giang_vien	activity_1
select t1.id_giang_vien , count ( * ) from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van group by t1.id_giang_vien	activity_1
select t1.ngach , count ( * ) from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van group by t1.ngach	activity_1
select t1.ngach , count ( * ) from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van group by t1.ngach	activity_1
select t1.ten , t1.ho from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van group by t1.id_giang_vien order by count ( * ) desc limit 1	activity_1
select t1.ten , t1.ho from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van group by t1.id_giang_vien order by count ( * ) desc limit 1	activity_1
select t1.id_giang_vien from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van group by t1.id_giang_vien having count ( * ) >= 2	activity_1
select t1.id_giang_vien from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van group by t1.id_giang_vien having count ( * ) >= 2	activity_1
select id_giang_vien from giang_vien except select co_van from sinh_vien	activity_1
select id_giang_vien from giang_vien except select co_van from sinh_vien	activity_1
select ten_hoat_dong from hoat_dong	activity_1
select ten_hoat_dong from hoat_dong	activity_1
select count ( * ) from hoat_dong	activity_1
select count ( * ) from hoat_dong	activity_1
select count ( distinct id_giang_vien ) from giang_vien_tham_gia_vao	activity_1
select count ( distinct id_giang_vien ) from giang_vien_tham_gia_vao	activity_1
select id_giang_vien from giang_vien except select id_giang_vien from giang_vien_tham_gia_vao	activity_1
select id_giang_vien from giang_vien except select id_giang_vien from giang_vien_tham_gia_vao	activity_1
select id_giang_vien from giang_vien_tham_gia_vao intersect select co_van from sinh_vien	activity_1
select id_giang_vien from giang_vien_tham_gia_vao intersect select co_van from sinh_vien	activity_1
select count ( * ) from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien where t1.ten = 'Mark' and t1.ho = 'Giuliano'	activity_1
select count ( * ) from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien where t1.ten = 'Mark' and t1.ho = 'Giuliano'	activity_1
select t3.ten_hoat_dong from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t3.id_hoat_dong = t2.id_hoat_dong where t1.ten = 'Mark' and t1.ho = 'Giuliano'	activity_1
select t3.ten_hoat_dong from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t3.id_hoat_dong = t2.id_hoat_dong where t1.ten = 'Mark' and t1.ho = 'Giuliano'	activity_1
select t1.ten , t1.ho , count ( * ) , t1.id_giang_vien from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien group by t1.id_giang_vien	activity_1
select t1.ten , t1.ho , count ( * ) , t1.id_giang_vien from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien group by t1.id_giang_vien	activity_1
select t1.ten_hoat_dong , count ( * ) from hoat_dong as t1 join giang_vien_tham_gia_vao as t2 on t1.id_hoat_dong = t2.id_hoat_dong group by t1.id_hoat_dong	activity_1
select t1.ten_hoat_dong , count ( * ) from hoat_dong as t1 join giang_vien_tham_gia_vao as t2 on t1.id_hoat_dong = t2.id_hoat_dong group by t1.id_hoat_dong	activity_1
select t1.ten , t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien group by t1.id_giang_vien order by count ( * ) desc limit 1	activity_1
select t1.ten , t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien group by t1.id_giang_vien order by count ( * ) desc limit 1	activity_1
select t1.ten_hoat_dong from hoat_dong as t1 join giang_vien_tham_gia_vao as t2 on t1.id_hoat_dong = t2.id_hoat_dong group by t1.id_hoat_dong order by count ( * ) desc limit 1	activity_1
select t1.ten_hoat_dong from hoat_dong as t1 join giang_vien_tham_gia_vao as t2 on t1.id_hoat_dong = t2.id_hoat_dong group by t1.id_hoat_dong order by count ( * ) desc limit 1	activity_1
select id_sinh_vien from sinh_vien except select id_sinh_vien from tham_gia_vao	activity_1
select id_sinh_vien from sinh_vien except select id_sinh_vien from tham_gia_vao	activity_1
select id_sinh_vien from tham_gia_vao intersect select id_sinh_vien from sinh_vien where tuoi < 20	activity_1
select id_sinh_vien from tham_gia_vao intersect select id_sinh_vien from sinh_vien where tuoi < 20	activity_1
select t1.ten , t1.ho from sinh_vien as t1 join tham_gia_vao as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien order by count ( * ) desc limit 1	activity_1
select t1.ten , t1.ho from sinh_vien as t1 join tham_gia_vao as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien order by count ( * ) desc limit 1	activity_1
select t1.ten_hoat_dong from hoat_dong as t1 join tham_gia_vao as t2 on t1.id_hoat_dong = t2.id_hoat_dong group by t1.id_hoat_dong order by count ( * ) desc limit 1	activity_1
select t1.ten_hoat_dong from hoat_dong as t1 join tham_gia_vao as t2 on t1.id_hoat_dong = t2.id_hoat_dong group by t1.id_hoat_dong order by count ( * ) desc limit 1	activity_1
select distinct t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = 'Canoeing' or t3.ten_hoat_dong = 'Kayaking'	activity_1
select distinct t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = 'Canoeing' or t3.ten_hoat_dong = 'Kayaking'	activity_1
select ho from giang_vien where ngach = 'Professor' except select distinct t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = 'Canoeing' or t3.ten_hoat_dong = 'Kayaking'	activity_1
select ho from giang_vien where ngach = 'Professor' except select distinct t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = 'Canoeing' or t3.ten_hoat_dong = 'Kayaking'	activity_1
select t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = 'Canoeing' intersect select t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = 'Kayaking'	activity_1
select t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = 'Canoeing' intersect select t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = 'Kayaking'	activity_1
select t1.id_sinh_vien from tham_gia_vao as t1 join hoat_dong as t2 on t2.id_hoat_dong = t2.id_hoat_dong where t2.ten_hoat_dong = 'Canoeing' intersect select t1.id_sinh_vien from tham_gia_vao as t1 join hoat_dong as t2 on t2.id_hoat_dong = t2.id_hoat_dong where t2.ten_hoat_dong = 'Kayaking'	activity_1
select t1.id_sinh_vien from tham_gia_vao as t1 join hoat_dong as t2 on t2.id_hoat_dong = t2.id_hoat_dong where t2.ten_hoat_dong = 'Canoeing' intersect select t1.id_sinh_vien from tham_gia_vao as t1 join hoat_dong as t2 on t2.id_hoat_dong = t2.id_hoat_dong where t2.ten_hoat_dong = 'Kayaking'	activity_1
select count ( * ) from nguoi_luyen_the_hinh	body_builder
select tong from nguoi_luyen_the_hinh order by tong asc	body_builder
select cu_giat , cu_day from nguoi_luyen_the_hinh order by cu_giat asc	body_builder
select avg ( cu_giat ) from nguoi_luyen_the_hinh	body_builder
select cu_day from nguoi_luyen_the_hinh order by tong desc limit 1	body_builder
select ngay_sinh from ca_nhan order by chieu_cao asc	body_builder
select t2.ten from nguoi_luyen_the_hinh as t1 join ca_nhan as t2 on t1.id_ca_nhan = t2.id_ca_nhan	body_builder
select t2.ten from nguoi_luyen_the_hinh as t1 join ca_nhan as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t1.tong > 300	body_builder
select t2.ten from nguoi_luyen_the_hinh as t1 join ca_nhan as t2 on t1.id_ca_nhan = t2.id_ca_nhan order by t2.can_nang desc limit 1	body_builder
select t2.ngay_sinh , t2.noi_sinh from nguoi_luyen_the_hinh as t1 join ca_nhan as t2 on t1.id_ca_nhan = t2.id_ca_nhan order by t1.tong desc limit 1	body_builder
select t2.chieu_cao from nguoi_luyen_the_hinh as t1 join ca_nhan as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t1.tong < 315	body_builder
select avg ( t1.tong ) from nguoi_luyen_the_hinh as t1 join ca_nhan as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t2.chieu_cao > 200	body_builder
select t2.ten from nguoi_luyen_the_hinh as t1 join ca_nhan as t2 on t1.id_ca_nhan = t2.id_ca_nhan order by t1.tong desc	body_builder
select noi_sinh , count ( * ) from ca_nhan group by noi_sinh	body_builder
select noi_sinh from ca_nhan group by noi_sinh order by count ( * ) desc limit 1	body_builder
select noi_sinh from ca_nhan group by noi_sinh having count ( * ) >= 2	body_builder
select chieu_cao , can_nang from ca_nhan order by chieu_cao desc	body_builder
select * from nguoi_luyen_the_hinh	body_builder
select ten , noi_sinh from ca_nhan except select t1.ten , t1.noi_sinh from ca_nhan as t1 join nguoi_luyen_the_hinh as t2 on t1.id_ca_nhan = t2.id_ca_nhan	body_builder
select count ( distinct noi_sinh ) from ca_nhan	body_builder
select count ( * ) from ca_nhan where id_ca_nhan not in ( select id_ca_nhan from nguoi_luyen_the_hinh )	body_builder
select t2.can_nang from nguoi_luyen_the_hinh as t1 join ca_nhan as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t1.cu_giat > 140 or t2.chieu_cao > 200	body_builder
select t1.tong from nguoi_luyen_the_hinh as t1 join ca_nhan as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t2.ngay_sinh like '%January%'	body_builder
select min ( cu_giat ) from nguoi_luyen_the_hinh	body_builder
select count ( * ) from ung_cu_vien	candidate_poll
select count ( * ) from ung_cu_vien	candidate_poll
select nguon_tham_do_y_kien from ung_cu_vien group by nguon_tham_do_y_kien order by count ( * ) desc limit 1	candidate_poll
select nguon_tham_do_y_kien from ung_cu_vien group by nguon_tham_do_y_kien order by count ( * ) desc limit 1	candidate_poll
select ty_le_ung_ho from ung_cu_vien order by ty_le_ung_ho desc limit 3	candidate_poll
select ty_le_ung_ho from ung_cu_vien order by ty_le_ung_ho desc limit 3	candidate_poll
select id_ung_cu_vien from ung_cu_vien order by ty_le_phan_doi limit 1	candidate_poll
select id_ung_cu_vien from ung_cu_vien order by ty_le_phan_doi limit 1	candidate_poll
select ty_le_ung_ho , ty_le_xem_xet , ty_le_phan_doi from ung_cu_vien order by ty_le_khong_chac_chan	candidate_poll
select ty_le_ung_ho , ty_le_xem_xet , ty_le_phan_doi from ung_cu_vien order by ty_le_khong_chac_chan	candidate_poll
select nguon_tham_do_y_kien from ung_cu_vien order by ty_le_phan_doi desc limit 1	candidate_poll
select nguon_tham_do_y_kien from ung_cu_vien order by ty_le_phan_doi desc limit 1	candidate_poll
select ten from ca_nhan order by ngay_sinh	candidate_poll
select ten from ca_nhan order by ngay_sinh	candidate_poll
select avg ( chieu_cao ) , avg ( can_nang ) from ca_nhan where gioi_tinh = 'M'	candidate_poll
select avg ( chieu_cao ) , avg ( can_nang ) from ca_nhan where gioi_tinh = 'M'	candidate_poll
select ten from ca_nhan where chieu_cao > 200 or chieu_cao < 190	candidate_poll
select ten from ca_nhan where chieu_cao > 200 or chieu_cao < 190	candidate_poll
select avg ( can_nang ) , min ( can_nang ) , gioi_tinh from ca_nhan group by gioi_tinh	candidate_poll
select avg ( can_nang ) , min ( can_nang ) , gioi_tinh from ca_nhan group by gioi_tinh	candidate_poll
select t1.ten , t1.gioi_tinh from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ca_nhan order by t2.ty_le_ung_ho desc limit 1	candidate_poll
select t1.ten , t1.gioi_tinh from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ca_nhan order by t2.ty_le_ung_ho desc limit 1	candidate_poll
select t1.ten , t1.gioi_tinh , min ( ty_le_phan_doi ) from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ca_nhan group by t1.gioi_tinh	candidate_poll
select t1.ten , t1.gioi_tinh , min ( ty_le_phan_doi ) from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ca_nhan group by t1.gioi_tinh	candidate_poll
select t1.gioi_tinh from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ca_nhan group by t1.gioi_tinh order by avg ( t2.ty_le_khong_chac_chan ) desc limit 1	candidate_poll
select t1.gioi_tinh from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ca_nhan group by t1.gioi_tinh order by avg ( t2.ty_le_khong_chac_chan ) desc limit 1	candidate_poll
select ten from ca_nhan where id_ca_nhan not in ( select id_ca_nhan from ung_cu_vien )	candidate_poll
select ten from ca_nhan where id_ca_nhan not in ( select id_ca_nhan from ung_cu_vien )	candidate_poll
select t1.ten from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t2.ty_le_ung_ho < t2.ty_le_phan_doi	candidate_poll
select t1.ten from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t2.ty_le_ung_ho < t2.ty_le_phan_doi	candidate_poll
select count ( * ) , gioi_tinh from ca_nhan where can_nang > 85 group by gioi_tinh	candidate_poll
select count ( * ) , gioi_tinh from ca_nhan where can_nang > 85 group by gioi_tinh	candidate_poll
select max ( ty_le_ung_ho ) , min ( ty_le_xem_xet ) , min ( ty_le_phan_doi ) from ung_cu_vien	candidate_poll
select max ( ty_le_ung_ho ) , min ( ty_le_xem_xet ) , min ( ty_le_phan_doi ) from ung_cu_vien	candidate_poll
select t1.ten from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t1.gioi_tinh = 'F' order by t1.ten	candidate_poll
select t1.ten from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t1.gioi_tinh = 'F' order by t1.ten	candidate_poll
select ten from ca_nhan where chieu_cao < ( select avg ( chieu_cao ) from ca_nhan )	candidate_poll
select ten from ca_nhan where chieu_cao < ( select avg ( chieu_cao ) from ca_nhan )	candidate_poll
select * from ca_nhan	candidate_poll
select * from ca_nhan	candidate_poll
select thanh_pho_chu_nha from thanh_pho_chu_nha order by nam desc limit 1	city_record
select thanh_pho_chu_nha from thanh_pho_chu_nha order by nam desc limit 1	city_record
select id_tran_dau from tran_dau where giai_dau = '1994 FIFA World Cup qualification'	city_record
select id_tran_dau from tran_dau where giai_dau = '1994 FIFA World Cup qualification'	city_record
select t1.thanh_pho from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha where t2.nam > 2010	city_record
select t1.thanh_pho from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha where t2.nam > 2010	city_record
select t1.thanh_pho from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha group by t2.thanh_pho_chu_nha order by count ( * ) desc limit 1	city_record
select t1.thanh_pho from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha group by t2.thanh_pho_chu_nha order by count ( * ) desc limit 1	city_record
select t3.dia_diem from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha join tran_dau as t3 on t2.id_tran_dau = t3.id_tran_dau where t1.thanh_pho = 'Nanjing ( Jiangsu )' and t3.giai_dau = '1994 FIFA World Cup qualification'	city_record
select t3.dia_diem from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha join tran_dau as t3 on t2.id_tran_dau = t3.id_tran_dau where t1.thanh_pho = 'Nanjing ( Jiangsu )' and t3.giai_dau = '1994 FIFA World Cup qualification'	city_record
select t2.thang_mot from thanh_pho as t1 join nhiet_do as t2 on t1.id_thanh_pho = t2.id_thanh_pho where t1.thanh_pho = 'Shanghai'	city_record
select t2.thang_mot from thanh_pho as t1 join nhiet_do as t2 on t1.id_thanh_pho = t2.id_thanh_pho where t1.thanh_pho = 'Shanghai'	city_record
select t2.nam from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha where t1.thanh_pho = 'Taizhou ( Zhejiang )'	city_record
select t2.nam from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha where t1.thanh_pho = 'Taizhou ( Zhejiang )'	city_record
select thanh_pho from thanh_pho order by dan_so_khu_vuc desc limit 3	city_record
select thanh_pho from thanh_pho order by dan_so_khu_vuc desc limit 3	city_record
select thanh_pho , gdp from thanh_pho order by gdp limit 1	city_record
select thanh_pho , gdp from thanh_pho order by gdp limit 1	city_record
select t1.thanh_pho from thanh_pho as t1 join nhiet_do as t2 on t1.id_thanh_pho = t2.id_thanh_pho order by t2.thang_hai desc limit 1	city_record
select t1.thanh_pho from thanh_pho as t1 join nhiet_do as t2 on t1.id_thanh_pho = t2.id_thanh_pho order by t2.thang_hai desc limit 1	city_record
select t1.thanh_pho from thanh_pho as t1 join nhiet_do as t2 on t1.id_thanh_pho = t2.id_thanh_pho where t2.thang_ba < t2.thang_bay or t2.thang_ba > t2.thang_muoi	city_record
select t1.thanh_pho from thanh_pho as t1 join nhiet_do as t2 on t1.id_thanh_pho = t2.id_thanh_pho where t2.thang_ba < t2.thang_bay or t2.thang_ba > t2.thang_muoi	city_record
select t1.thanh_pho from thanh_pho as t1 join nhiet_do as t2 on t1.id_thanh_pho = t2.id_thanh_pho where t2.thang_ba < t2.thang_bay intersect select t3.thanh_pho from thanh_pho as t3 join thanh_pho_chu_nha as t4 on t3.id_thanh_pho = t4.thanh_pho_chu_nha	city_record
select t1.thanh_pho from thanh_pho as t1 join nhiet_do as t2 on t1.id_thanh_pho = t2.id_thanh_pho where t2.thang_ba < t2.thang_bay intersect select t3.thanh_pho from thanh_pho as t3 join thanh_pho_chu_nha as t4 on t3.id_thanh_pho = t4.thanh_pho_chu_nha	city_record
select t1.thanh_pho from thanh_pho as t1 join nhiet_do as t2 on t1.id_thanh_pho = t2.id_thanh_pho where t2.thang_ba < t2.thang_muoi_hai except select t3.thanh_pho from thanh_pho as t3 join thanh_pho_chu_nha as t4 on t3.id_thanh_pho = t4.thanh_pho_chu_nha	city_record
select t1.thanh_pho from thanh_pho as t1 join nhiet_do as t2 on t1.id_thanh_pho = t2.id_thanh_pho where t2.thang_ba < t2.thang_muoi_hai except select t3.thanh_pho from thanh_pho as t3 join thanh_pho_chu_nha as t4 on t3.id_thanh_pho = t4.thanh_pho_chu_nha	city_record
select t1.thanh_pho from thanh_pho as t1 join nhiet_do as t2 on t1.id_thanh_pho = t2.id_thanh_pho where t2.thang_hai > t2.thang_sau union select t3.thanh_pho from thanh_pho as t3 join thanh_pho_chu_nha as t4 on t3.id_thanh_pho = t4.thanh_pho_chu_nha	city_record
select t1.thanh_pho from thanh_pho as t1 join nhiet_do as t2 on t1.id_thanh_pho = t2.id_thanh_pho where t2.thang_hai > t2.thang_sau union select t3.thanh_pho from thanh_pho as t3 join thanh_pho_chu_nha as t4 on t3.id_thanh_pho = t4.thanh_pho_chu_nha	city_record
select thanh_pho from thanh_pho where dan_so_khu_vuc > 10000000	city_record
select thanh_pho from thanh_pho where dan_so_khu_vuc > 10000000	city_record
select thanh_pho from thanh_pho where dan_so_khu_vuc > 10000000 union select thanh_pho from thanh_pho where dan_so_khu_vuc < 5000000	city_record
select thanh_pho from thanh_pho where dan_so_khu_vuc > 10000000 union select thanh_pho from thanh_pho where dan_so_khu_vuc < 5000000	city_record
select count ( * ) , giai_dau from tran_dau group by giai_dau	city_record
select count ( * ) , giai_dau from tran_dau group by giai_dau	city_record
select dia_diem from tran_dau order by ngay desc	city_record
select dia_diem from tran_dau order by ngay desc	city_record
select gdp from thanh_pho order by dan_so_khu_vuc desc limit 1	city_record
select gdp from thanh_pho order by dan_so_khu_vuc desc limit 1	city_record
select t1.gdp , t1.dan_so_khu_vuc from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha group by t2.thanh_pho_chu_nha having count ( * ) > 1	city_record
select t1.gdp , t1.dan_so_khu_vuc from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha group by t2.thanh_pho_chu_nha having count ( * ) > 1	city_record
select count ( * ) from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where ten_khoa = 'Accounting'	college_1
select count ( * ) from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where ten_khoa = 'Accounting'	college_1
select count ( distinct ma_so_nhan_vien_cua_giao_su ) from lop_hoc where ma_khoa_hoc = 'ACCT-211'	college_1
select count ( distinct ma_so_nhan_vien_cua_giao_su ) from lop_hoc where ma_khoa_hoc = 'ACCT-211'	college_1
select t3.ten_cua_nhan_vien , t3.ho_cua_nhan_vien from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa join nhan_vien as t3 on t1.ma_so_nhan_vien = t3.ma_so_nhan_vien where ten_khoa = 'Biology'	college_1
select t3.ten_cua_nhan_vien , t3.ho_cua_nhan_vien from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa join nhan_vien as t3 on t1.ma_so_nhan_vien = t3.ma_so_nhan_vien where ten_khoa = 'Biology'	college_1
select distinct t1.ten_cua_nhan_vien , t1.ngay_sinh_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where ma_khoa_hoc = 'ACCT-211'	college_1
select distinct t1.ten_cua_nhan_vien , t1.ngay_sinh_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where ma_khoa_hoc = 'ACCT-211'	college_1
select count ( * ) from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where t1.ho_cua_nhan_vien = 'Graztevski'	college_1
select count ( * ) from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where t1.ho_cua_nhan_vien = 'Graztevski'	college_1
select ma_truong from khoa where ten_khoa = 'Accounting'	college_1
select ma_truong from khoa where ten_khoa = 'Accounting'	college_1
select so_luong_tin_chi_cua_khoa_hoc , mo_ta_ve_khoa_hoc from khoa_hoc where ma_khoa_hoc = 'CIS-220'	college_1
select so_luong_tin_chi_cua_khoa_hoc , mo_ta_ve_khoa_hoc from khoa_hoc where ma_khoa_hoc = 'CIS-220'	college_1
select dia_chi_khoa from khoa where ten_khoa = 'History'	college_1
select dia_chi_khoa from khoa where ten_khoa = 'History'	college_1
select count ( distinct dia_chi_khoa ) from khoa where ma_truong = 'BUS'	college_1
select count ( distinct dia_chi_khoa ) from khoa where ma_truong = 'BUS'	college_1
select count ( distinct dia_chi_khoa ) , ma_truong from khoa group by ma_truong	college_1
select count ( distinct dia_chi_khoa ) , ma_truong from khoa group by ma_truong	college_1
select so_luong_tin_chi_cua_khoa_hoc , mo_ta_ve_khoa_hoc from khoa_hoc where ma_khoa_hoc = 'QM-261'	college_1
select so_luong_tin_chi_cua_khoa_hoc , mo_ta_ve_khoa_hoc from khoa_hoc where ma_khoa_hoc = 'QM-261'	college_1
select count ( distinct ten_khoa ) , ma_truong from khoa group by ma_truong	college_1
select count ( distinct ten_khoa ) , ma_truong from khoa group by ma_truong	college_1
select count ( distinct ten_khoa ) , ma_truong from khoa group by ma_truong having count ( distinct ten_khoa ) < 5	college_1
select count ( distinct ten_khoa ) , ma_truong from khoa group by ma_truong having count ( distinct ten_khoa ) < 5	college_1
select count ( * ) , ma_khoa_hoc from lop_hoc group by ma_khoa_hoc	college_1
select count ( * ) , ma_khoa_hoc from lop_hoc group by ma_khoa_hoc	college_1
select sum ( so_luong_tin_chi_cua_khoa_hoc ) , ma_khoa from khoa_hoc group by ma_khoa	college_1
select sum ( so_luong_tin_chi_cua_khoa_hoc ) , ma_khoa from khoa_hoc group by ma_khoa	college_1
select count ( * ) , phong_hoc from lop_hoc group by phong_hoc having count ( * ) >= 2	college_1
select count ( * ) , phong_hoc from lop_hoc group by phong_hoc having count ( * ) >= 2	college_1
select count ( * ) , ma_khoa from lop_hoc as t1 join khoa_hoc as t2 on t1.ma_khoa_hoc = t2.ma_khoa_hoc group by ma_khoa	college_1
select count ( * ) , ma_khoa from lop_hoc as t1 join khoa_hoc as t2 on t1.ma_khoa_hoc = t2.ma_khoa_hoc group by ma_khoa	college_1
select count ( * ) , t3.ma_truong from lop_hoc as t1 join khoa_hoc as t2 on t1.ma_khoa_hoc = t2.ma_khoa_hoc join khoa as t3 on t2.ma_khoa = t3.ma_khoa group by t3.ma_truong	college_1
select count ( * ) , t3.ma_truong from lop_hoc as t1 join khoa_hoc as t2 on t1.ma_khoa_hoc = t2.ma_khoa_hoc join khoa as t3 on t2.ma_khoa = t3.ma_khoa group by t3.ma_truong	college_1
select count ( * ) , t1.ma_truong from khoa as t1 join giao_su as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_truong	college_1
select count ( * ) , t1.ma_truong from khoa as t1 join giao_su as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_truong	college_1
select ma_cong_viec_cua_nhan_vien , count ( * ) from nhan_vien group by ma_cong_viec_cua_nhan_vien order by count ( * ) desc limit 1	college_1
select ma_cong_viec_cua_nhan_vien , count ( * ) from nhan_vien group by ma_cong_viec_cua_nhan_vien order by count ( * ) desc limit 1	college_1
select t1.ma_truong from khoa as t1 join giao_su as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_truong order by count ( * ) limit 1	college_1
select t1.ma_truong from khoa as t1 join giao_su as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_truong order by count ( * ) limit 1	college_1
select count ( * ) , ma_khoa from giao_su where bang_cap_cao_nhat = 'Ph.D.' group by ma_khoa	college_1
select count ( * ) , ma_khoa from giao_su where bang_cap_cao_nhat = 'Ph.D.' group by ma_khoa	college_1
select count ( * ) , ma_khoa from sinh_vien group by ma_khoa	college_1
select count ( * ) , ma_khoa from sinh_vien group by ma_khoa	college_1
select sum ( gio_hoc_cua_sinh_vien ) , ma_khoa from sinh_vien group by ma_khoa	college_1
select sum ( gio_hoc_cua_sinh_vien ) , ma_khoa from sinh_vien group by ma_khoa	college_1
select max ( gpa_cua_sinh_vien ) , avg ( gpa_cua_sinh_vien ) , min ( gpa_cua_sinh_vien ) , ma_khoa from sinh_vien group by ma_khoa	college_1
select max ( gpa_cua_sinh_vien ) , avg ( gpa_cua_sinh_vien ) , min ( gpa_cua_sinh_vien ) , ma_khoa from sinh_vien group by ma_khoa	college_1
select t2.ten_khoa , avg ( t1.gpa_cua_sinh_vien ) from sinh_vien as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_khoa order by avg ( t1.gpa_cua_sinh_vien ) desc limit 1	college_1
select t2.ten_khoa , avg ( t1.gpa_cua_sinh_vien ) from sinh_vien as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_khoa order by avg ( t1.gpa_cua_sinh_vien ) desc limit 1	college_1
select count ( distinct ma_truong ) from khoa	college_1
select count ( distinct ma_truong ) from khoa	college_1
select count ( distinct ma_lop_hoc ) from lop_hoc	college_1
select count ( distinct ma_lop_hoc ) from lop_hoc	college_1
select count ( distinct ma_khoa_hoc ) from lop_hoc	college_1
select count ( distinct ma_khoa_hoc ) from lop_hoc	college_1
select count ( distinct ten_khoa ) from khoa	college_1
select count ( distinct ten_khoa ) from khoa	college_1
select count ( * ) from khoa as t1 join khoa_hoc as t2 on t1.ma_khoa = t2.ma_khoa where ten_khoa = 'Computer Info. Systems'	college_1
select count ( * ) from khoa as t1 join khoa_hoc as t2 on t1.ma_khoa = t2.ma_khoa where ten_khoa = 'Computer Info. Systems'	college_1
select count ( distinct lop_hoc_phan ) from lop_hoc where ma_khoa_hoc = 'ACCT-211'	college_1
select count ( distinct lop_hoc_phan ) from lop_hoc where ma_khoa_hoc = 'ACCT-211'	college_1
select sum ( t1.so_luong_tin_chi_cua_khoa_hoc ) , t1.ma_khoa from khoa_hoc as t1 join lop_hoc as t2 on t1.ma_khoa_hoc = t2.ma_khoa_hoc group by t1.ma_khoa	college_1
select sum ( t1.so_luong_tin_chi_cua_khoa_hoc ) , t1.ma_khoa from khoa_hoc as t1 join lop_hoc as t2 on t1.ma_khoa_hoc = t2.ma_khoa_hoc group by t1.ma_khoa	college_1
select t3.ten_khoa from khoa_hoc as t1 join lop_hoc as t2 on t1.ma_khoa_hoc = t2.ma_khoa_hoc join khoa as t3 on t1.ma_khoa = t3.ma_khoa group by t1.ma_khoa order by sum ( t1.so_luong_tin_chi_cua_khoa_hoc ) desc limit 1	college_1
select t3.ten_khoa from khoa_hoc as t1 join lop_hoc as t2 on t1.ma_khoa_hoc = t2.ma_khoa_hoc join khoa as t3 on t1.ma_khoa = t3.ma_khoa group by t1.ma_khoa order by sum ( t1.so_luong_tin_chi_cua_khoa_hoc ) desc limit 1	college_1
select count ( * ) from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop where t1.ma_khoa_hoc = 'ACCT-211'	college_1
select count ( * ) from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop where t1.ma_khoa_hoc = 'ACCT-211'	college_1
select t3.ten_cua_sinh_vien from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t2.ma_so_sinh_vien = t3.ma_so_sinh_vien where t1.ma_khoa_hoc = 'ACCT-211'	college_1
select t3.ten_cua_sinh_vien from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t2.ma_so_sinh_vien = t3.ma_so_sinh_vien where t1.ma_khoa_hoc = 'ACCT-211'	college_1
select t3.ten_cua_sinh_vien from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t2.ma_so_sinh_vien = t3.ma_so_sinh_vien where t1.ma_khoa_hoc = 'ACCT-211' and t2.diem_so = 'C'	college_1
select t3.ten_cua_sinh_vien from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t2.ma_so_sinh_vien = t3.ma_so_sinh_vien where t1.ma_khoa_hoc = 'ACCT-211' and t2.diem_so = 'C'	college_1
select count ( * ) from nhan_vien	college_1
select count ( * ) from nhan_vien	college_1
select count ( * ) from giao_su where bang_cap_cao_nhat = 'Ph.D.'	college_1
select count ( * ) from giao_su where bang_cap_cao_nhat = 'Ph.D.'	college_1
select count ( * ) from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join khoa_hoc as t3 on t1.ma_khoa_hoc = t3.ma_khoa_hoc join khoa as t4 on t3.ma_khoa = t4.ma_khoa where t4.ten_khoa = 'Accounting'	college_1
select count ( * ) from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join khoa_hoc as t3 on t1.ma_khoa_hoc = t3.ma_khoa_hoc join khoa as t4 on t3.ma_khoa = t4.ma_khoa where t4.ten_khoa = 'Accounting'	college_1
select t4.ten_khoa from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join khoa_hoc as t3 on t1.ma_khoa_hoc = t3.ma_khoa_hoc join khoa as t4 on t3.ma_khoa = t4.ma_khoa group by t3.ma_khoa order by count ( * ) desc limit 1	college_1
select t4.ten_khoa from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join khoa_hoc as t3 on t1.ma_khoa_hoc = t3.ma_khoa_hoc join khoa as t4 on t3.ma_khoa = t4.ma_khoa group by t3.ma_khoa order by count ( * ) desc limit 1	college_1
select ten_khoa from khoa order by ten_khoa	college_1
select ten_khoa from khoa order by ten_khoa	college_1
select ma_lop_hoc from lop_hoc where phong_hoc = 'KLR209'	college_1
select ma_lop_hoc from lop_hoc where phong_hoc = 'KLR209'	college_1
select ten_cua_nhan_vien from nhan_vien where ma_cong_viec_cua_nhan_vien = 'PROF' order by ngay_sinh_cua_nhan_vien	college_1
select ten_cua_nhan_vien from nhan_vien where ma_cong_viec_cua_nhan_vien = 'PROF' order by ngay_sinh_cua_nhan_vien	college_1
select t2.ten_cua_nhan_vien , t1.van_phong_giao_su from giao_su as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien order by t2.ten_cua_nhan_vien	college_1
select t2.ten_cua_nhan_vien , t1.van_phong_giao_su from giao_su as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien order by t2.ten_cua_nhan_vien	college_1
select ten_cua_nhan_vien , ho_cua_nhan_vien from nhan_vien order by ngay_sinh_cua_nhan_vien limit 1	college_1
select ten_cua_nhan_vien , ho_cua_nhan_vien from nhan_vien order by ngay_sinh_cua_nhan_vien limit 1	college_1
select ten_cua_sinh_vien , ho_cua_sinh_vien , gpa_cua_sinh_vien from sinh_vien where gpa_cua_sinh_vien > 3 order by ngay_sinh_cua_sinh_vien desc limit 1	college_1
select ten_cua_sinh_vien , ho_cua_sinh_vien , gpa_cua_sinh_vien from sinh_vien where gpa_cua_sinh_vien > 3 order by ngay_sinh_cua_sinh_vien desc limit 1	college_1
select distinct ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien where diem_so = 'C'	college_1
select distinct ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien where diem_so = 'C'	college_1
select t2.ten_khoa from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_khoa order by count ( * ) limit 1	college_1
select t2.ten_khoa from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_khoa order by count ( * ) limit 1	college_1
select t2.ten_khoa , t1.ma_khoa from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where t1.bang_cap_cao_nhat = 'Ph.D.' group by t1.ma_khoa order by count ( * ) desc limit 1	college_1
select t2.ten_khoa , t1.ma_khoa from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where t1.bang_cap_cao_nhat = 'Ph.D.' group by t1.ma_khoa order by count ( * ) desc limit 1	college_1
select ten_cua_nhan_vien from nhan_vien where ma_cong_viec_cua_nhan_vien = 'PROF' except select t1.ten_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su	college_1
select ten_cua_nhan_vien from nhan_vien where ma_cong_viec_cua_nhan_vien = 'PROF' except select t1.ten_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su	college_1
select t1.ten_cua_nhan_vien from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t2.ma_khoa = t3.ma_khoa where t3.ten_khoa = 'History' except select t4.ten_cua_nhan_vien from nhan_vien as t4 join lop_hoc as t5 on t4.ma_so_nhan_vien = t5.ma_so_nhan_vien_cua_giao_su	college_1
select t1.ten_cua_nhan_vien from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t2.ma_khoa = t3.ma_khoa where t3.ten_khoa = 'History' except select t4.ten_cua_nhan_vien from nhan_vien as t4 join lop_hoc as t5 on t4.ma_so_nhan_vien = t5.ma_so_nhan_vien_cua_giao_su	college_1
select t1.ho_cua_nhan_vien , t2.van_phong_giao_su from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t2.ma_khoa = t3.ma_khoa where t3.ten_khoa = 'History'	college_1
select t1.ho_cua_nhan_vien , t2.van_phong_giao_su from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t2.ma_khoa = t3.ma_khoa where t3.ten_khoa = 'History'	college_1
select t3.ten_khoa , t2.van_phong_giao_su from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t2.ma_khoa = t3.ma_khoa where t1.ho_cua_nhan_vien = 'Heffington'	college_1
select t3.ten_khoa , t2.van_phong_giao_su from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t2.ma_khoa = t3.ma_khoa where t1.ho_cua_nhan_vien = 'Heffington'	college_1
select t1.ho_cua_nhan_vien , t1.ngay_bat_dau_cong_viec_cua_nhan_vien from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien where t2.van_phong_giao_su = 'DRE 102'	college_1
select t1.ho_cua_nhan_vien , t1.ngay_bat_dau_cong_viec_cua_nhan_vien from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien where t2.van_phong_giao_su = 'DRE 102'	college_1
select t1.ma_khoa_hoc from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t3.ma_so_sinh_vien = t2.ma_so_sinh_vien where t3.ho_cua_sinh_vien = 'Smithson'	college_1
select t1.ma_khoa_hoc from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t3.ma_so_sinh_vien = t2.ma_so_sinh_vien where t3.ho_cua_sinh_vien = 'Smithson'	college_1
select t4.mo_ta_ve_khoa_hoc , t4.so_luong_tin_chi_cua_khoa_hoc from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t3.ma_so_sinh_vien = t2.ma_so_sinh_vien join khoa_hoc as t4 on t4.ma_khoa_hoc = t1.ma_khoa_hoc where t3.ho_cua_sinh_vien = 'Smithson'	college_1
select t4.mo_ta_ve_khoa_hoc , t4.so_luong_tin_chi_cua_khoa_hoc from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t3.ma_so_sinh_vien = t2.ma_so_sinh_vien join khoa_hoc as t4 on t4.ma_khoa_hoc = t1.ma_khoa_hoc where t3.ho_cua_sinh_vien = 'Smithson'	college_1
select count ( * ) from giao_su where bang_cap_cao_nhat = 'Ph.D.' or bang_cap_cao_nhat = 'MA'	college_1
select count ( * ) from giao_su where bang_cap_cao_nhat = 'Ph.D.' or bang_cap_cao_nhat = 'MA'	college_1
select count ( * ) from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where t2.ten_khoa = 'Accounting' or t2.ten_khoa = 'Biology'	college_1
select count ( * ) from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where t2.ten_khoa = 'Accounting' or t2.ten_khoa = 'Biology'	college_1
select t1.ten_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where ma_khoa_hoc = 'CIS-220' intersect select t1.ten_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where ma_khoa_hoc = 'QM-261'	college_1
select t1.ten_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where ma_khoa_hoc = 'CIS-220' intersect select t1.ten_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where ma_khoa_hoc = 'QM-261'	college_1
select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t2.ma_lop = t3.ma_lop_hoc join khoa_hoc as t4 on t3.ma_khoa_hoc = t4.ma_khoa_hoc join khoa as t5 on t5.ma_khoa = t4.ma_khoa where t5.ten_khoa = 'Accounting' intersect select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t2.ma_lop = t3.ma_lop_hoc join khoa_hoc as t4 on t3.ma_khoa_hoc = t4.ma_khoa_hoc join khoa as t5 on t5.ma_khoa = t4.ma_khoa where t5.ten_khoa = 'Computer Info. Systems'	college_1
select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t2.ma_lop = t3.ma_lop_hoc join khoa_hoc as t4 on t3.ma_khoa_hoc = t4.ma_khoa_hoc join khoa as t5 on t5.ma_khoa = t4.ma_khoa where t5.ten_khoa = 'Accounting' intersect select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t2.ma_lop = t3.ma_lop_hoc join khoa_hoc as t4 on t3.ma_khoa_hoc = t4.ma_khoa_hoc join khoa as t5 on t5.ma_khoa = t4.ma_khoa where t5.ten_khoa = 'Computer Info. Systems'	college_1
select avg ( t2.gpa_cua_sinh_vien ) from dang_ky_khoa_hoc as t1 join sinh_vien as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t1.ma_lop = t3.ma_lop_hoc where t3.ma_khoa_hoc = 'ACCT-211'	college_1
select avg ( t2.gpa_cua_sinh_vien ) from dang_ky_khoa_hoc as t1 join sinh_vien as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t1.ma_lop = t3.ma_lop_hoc where t3.ma_khoa_hoc = 'ACCT-211'	college_1
select gpa_cua_sinh_vien , so_dien_thoai_cua_sinh_vien , ten_cua_sinh_vien from sinh_vien order by gpa_cua_sinh_vien desc limit 5	college_1
select gpa_cua_sinh_vien , so_dien_thoai_cua_sinh_vien , ten_cua_sinh_vien from sinh_vien order by gpa_cua_sinh_vien desc limit 5	college_1
select t2.ten_khoa from sinh_vien as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa order by gpa_cua_sinh_vien limit 1	college_1
select t2.ten_khoa from sinh_vien as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa order by gpa_cua_sinh_vien limit 1	college_1
select ten_cua_sinh_vien , gpa_cua_sinh_vien from sinh_vien where gpa_cua_sinh_vien < ( select avg ( gpa_cua_sinh_vien ) from sinh_vien )	college_1
select ten_cua_sinh_vien , gpa_cua_sinh_vien from sinh_vien where gpa_cua_sinh_vien < ( select avg ( gpa_cua_sinh_vien ) from sinh_vien )	college_1
select t2.ten_khoa , t2.dia_chi_khoa from sinh_vien as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_khoa order by count ( * ) desc limit 1	college_1
select t2.ten_khoa , t2.dia_chi_khoa from sinh_vien as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_khoa order by count ( * ) desc limit 1	college_1
select t2.ten_khoa , t2.dia_chi_khoa , count ( * ) from sinh_vien as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_khoa order by count ( * ) desc limit 3	college_1
select t2.ten_khoa , t2.dia_chi_khoa , count ( * ) from sinh_vien as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_khoa order by count ( * ) desc limit 3	college_1
select t1.ten_cua_nhan_vien , t2.van_phong_giao_su from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t3.ma_khoa = t2.ma_khoa where t3.ten_khoa = 'History' and t2.bang_cap_cao_nhat = 'Ph.D.'	college_1
select t1.ten_cua_nhan_vien , t2.van_phong_giao_su from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t3.ma_khoa = t2.ma_khoa where t3.ten_khoa = 'History' and t2.bang_cap_cao_nhat = 'Ph.D.'	college_1
select t2.ten_cua_nhan_vien , t1.ma_khoa_hoc from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien	college_1
select t2.ten_cua_nhan_vien , t1.ma_khoa_hoc from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien	college_1
select t2.ten_cua_nhan_vien , t3.mo_ta_ve_khoa_hoc from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien join khoa_hoc as t3 on t1.ma_khoa_hoc = t3.ma_khoa_hoc	college_1
select t2.ten_cua_nhan_vien , t3.mo_ta_ve_khoa_hoc from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien join khoa_hoc as t3 on t1.ma_khoa_hoc = t3.ma_khoa_hoc	college_1
select t2.ten_cua_nhan_vien , t4.van_phong_giao_su , t3.mo_ta_ve_khoa_hoc from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien join khoa_hoc as t3 on t1.ma_khoa_hoc = t3.ma_khoa_hoc join giao_su as t4 on t2.ma_so_nhan_vien = t4.ma_so_nhan_vien	college_1
select t2.ten_cua_nhan_vien , t4.van_phong_giao_su , t3.mo_ta_ve_khoa_hoc from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien join khoa_hoc as t3 on t1.ma_khoa_hoc = t3.ma_khoa_hoc join giao_su as t4 on t2.ma_so_nhan_vien = t4.ma_so_nhan_vien	college_1
select t2.ten_cua_nhan_vien , t4.van_phong_giao_su , t3.mo_ta_ve_khoa_hoc , t5.ten_khoa from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien join khoa_hoc as t3 on t1.ma_khoa_hoc = t3.ma_khoa_hoc join giao_su as t4 on t2.ma_so_nhan_vien = t4.ma_so_nhan_vien join khoa as t5 on t4.ma_khoa = t5.ma_khoa	college_1
select t2.ten_cua_nhan_vien , t4.van_phong_giao_su , t3.mo_ta_ve_khoa_hoc , t5.ten_khoa from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien join khoa_hoc as t3 on t1.ma_khoa_hoc = t3.ma_khoa_hoc join giao_su as t4 on t2.ma_so_nhan_vien = t4.ma_so_nhan_vien join khoa as t5 on t4.ma_khoa = t5.ma_khoa	college_1
select t1.ten_cua_sinh_vien , t1.ho_cua_sinh_vien , t4.mo_ta_ve_khoa_hoc from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t2.ma_lop = t3.ma_lop_hoc join khoa_hoc as t4 on t3.ma_khoa_hoc = t4.ma_khoa_hoc	college_1
select t1.ten_cua_sinh_vien , t1.ho_cua_sinh_vien , t4.mo_ta_ve_khoa_hoc from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t2.ma_lop = t3.ma_lop_hoc join khoa_hoc as t4 on t3.ma_khoa_hoc = t4.ma_khoa_hoc	college_1
select t1.ten_cua_sinh_vien , t1.ho_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien where t2.diem_so = 'C' or t2.diem_so = 'A'	college_1
select t1.ten_cua_sinh_vien , t1.ho_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien where t2.diem_so = 'C' or t2.diem_so = 'A'	college_1
select t2.ten_cua_nhan_vien , t1.phong_hoc from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien join giao_su as t3 on t2.ma_so_nhan_vien = t3.ma_so_nhan_vien join khoa as t4 on t4.ma_khoa = t3.ma_khoa where t4.ten_khoa = 'Accounting'	college_1
select t2.ten_cua_nhan_vien , t1.phong_hoc from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien join giao_su as t3 on t2.ma_so_nhan_vien = t3.ma_so_nhan_vien join khoa as t4 on t4.ma_khoa = t3.ma_khoa where t4.ten_khoa = 'Accounting'	college_1
select distinct t2.ten_cua_nhan_vien , t3.bang_cap_cao_nhat from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien join giao_su as t3 on t2.ma_so_nhan_vien = t3.ma_so_nhan_vien join khoa as t4 on t4.ma_khoa = t3.ma_khoa where t4.ten_khoa = 'Computer Info. Systems'	college_1
select distinct t2.ten_cua_nhan_vien , t3.bang_cap_cao_nhat from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien join giao_su as t3 on t2.ma_so_nhan_vien = t3.ma_so_nhan_vien join khoa as t4 on t4.ma_khoa = t3.ma_khoa where t4.ten_khoa = 'Computer Info. Systems'	college_1
select t1.ho_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien where t2.diem_so = 'A' and t2.ma_lop = 10018	college_1
select t1.ho_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien where t2.diem_so = 'A' and t2.ma_lop = 10018	college_1
select t2.ten_cua_nhan_vien , t1.van_phong_giao_su from giao_su as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t1.ma_khoa = t3.ma_khoa where t3.ten_khoa = 'History' and t1.bang_cap_cao_nhat != 'Ph.D.'	college_1
select t2.ten_cua_nhan_vien , t1.van_phong_giao_su from giao_su as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t1.ma_khoa = t3.ma_khoa where t3.ten_khoa = 'History' and t1.bang_cap_cao_nhat != 'Ph.D.'	college_1
select t2.ten_cua_nhan_vien from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien group by t1.ma_so_nhan_vien_cua_giao_su having count ( * ) > 1	college_1
select t2.ten_cua_nhan_vien from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien group by t1.ma_so_nhan_vien_cua_giao_su having count ( * ) > 1	college_1
select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien group by t2.ma_so_sinh_vien having count ( * ) = 1	college_1
select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien group by t2.ma_so_sinh_vien having count ( * ) = 1	college_1
select t2.ten_khoa from khoa_hoc as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where t1.mo_ta_ve_khoa_hoc like '%Statistics%'	college_1
select t2.ten_khoa from khoa_hoc as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where t1.mo_ta_ve_khoa_hoc like '%Statistics%'	college_1
select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t2.ma_lop = t3.ma_lop_hoc where t3.ma_khoa_hoc = 'ACCT-211' and t1.ho_cua_sinh_vien like 'S%'	college_1
select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t2.ma_lop = t3.ma_lop_hoc where t3.ma_khoa_hoc = 'ACCT-211' and t1.ho_cua_sinh_vien like 'S%'	college_1
select ma_trang_thai_tai_lieu from trang_thai_cua_tai_lieu	cre_Doc_Control_Systems
select mo_ta_ve_trang_thai_tai_lieu from trang_thai_cua_tai_lieu where ma_trang_thai_tai_lieu = 'working'	cre_Doc_Control_Systems
select ma_loai_tai_lieu from loai_tai_lieu	cre_Doc_Control_Systems
select mo_ta_ve_loai_tai_lieu from loai_tai_lieu where ma_loai_tai_lieu = 'Paper'	cre_Doc_Control_Systems
select ten_dai_ly_van_chuyen from dai_ly_van_chuyen_tai_lieu	cre_Doc_Control_Systems
select ma_dai_ly_van_chuyen from dai_ly_van_chuyen_tai_lieu where ten_dai_ly_van_chuyen = 'UPS'	cre_Doc_Control_Systems
select ma_vai_tro from vai_tro	cre_Doc_Control_Systems
select mo_ta_ve_vai_tro from vai_tro where ma_vai_tro = 'ED'	cre_Doc_Control_Systems
select count ( * ) from nhan_vien	cre_Doc_Control_Systems
select t1.mo_ta_ve_vai_tro from vai_tro as t1 join nhan_vien as t2 on t1.ma_vai_tro = t2.ma_vai_tro where t2.ten_nhan_vien = 'Koby'	cre_Doc_Control_Systems
select id_tai_lieu , ngay_lap_bien_lai from tai_lieu	cre_Doc_Control_Systems
select t1.mo_ta_ve_vai_tro , t2.ma_vai_tro , count ( * ) from vai_tro as t1 join nhan_vien as t2 on t1.ma_vai_tro = t2.ma_vai_tro group by t2.ma_vai_tro	cre_Doc_Control_Systems
select vai_tro.mo_ta_ve_vai_tro , count ( nhan_vien.id_nhan_vien ) from vai_tro join nhan_vien on nhan_vien.ma_vai_tro = vai_tro.ma_vai_tro group by nhan_vien.ma_vai_tro having count ( nhan_vien.id_nhan_vien ) > 1	cre_Doc_Control_Systems
select trang_thai_cua_tai_lieu.mo_ta_ve_trang_thai_tai_lieu from trang_thai_cua_tai_lieu join tai_lieu on tai_lieu.ma_trang_thai_tai_lieu = trang_thai_cua_tai_lieu.ma_trang_thai_tai_lieu where tai_lieu.id_tai_lieu = 1	cre_Doc_Control_Systems
select count ( * ) from tai_lieu where ma_trang_thai_tai_lieu = 'done'	cre_Doc_Control_Systems
select ma_loai_tai_lieu from tai_lieu where id_tai_lieu = 2	cre_Doc_Control_Systems
select id_tai_lieu from tai_lieu where ma_trang_thai_tai_lieu = 'done' and ma_loai_tai_lieu = 'Paper'	cre_Doc_Control_Systems
select dai_ly_van_chuyen_tai_lieu.ten_dai_ly_van_chuyen from dai_ly_van_chuyen_tai_lieu join tai_lieu on tai_lieu.ma_dai_ly_van_chuyen = dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen where tai_lieu.id_tai_lieu = 2	cre_Doc_Control_Systems
select count ( * ) from dai_ly_van_chuyen_tai_lieu join tai_lieu on tai_lieu.ma_dai_ly_van_chuyen = dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen where dai_ly_van_chuyen_tai_lieu.ten_dai_ly_van_chuyen = 'USPS'	cre_Doc_Control_Systems
select dai_ly_van_chuyen_tai_lieu.ten_dai_ly_van_chuyen , count ( tai_lieu.id_tai_lieu ) from dai_ly_van_chuyen_tai_lieu join tai_lieu on tai_lieu.ma_dai_ly_van_chuyen = dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen group by dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen order by count ( tai_lieu.id_tai_lieu ) desc limit 1	cre_Doc_Control_Systems
select ngay_lap_bien_lai from tai_lieu where id_tai_lieu = 3	cre_Doc_Control_Systems
select dia_chi.chi_tiet_dia_chi from dia_chi join tai_lieu_duoc_gui on tai_lieu_duoc_gui.gui_den_dia_chi_co_id = dia_chi.id_dia_chi where id_tai_lieu = 4	cre_Doc_Control_Systems
select ngay_gui from tai_lieu_duoc_gui where id_tai_lieu = 7	cre_Doc_Control_Systems
select id_tai_lieu from tai_lieu where ma_trang_thai_tai_lieu = 'done' and ma_loai_tai_lieu = 'Paper' except select id_tai_lieu from tai_lieu join dai_ly_van_chuyen_tai_lieu on tai_lieu.ma_dai_ly_van_chuyen = dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen where dai_ly_van_chuyen_tai_lieu.ten_dai_ly_van_chuyen = 'USPS'	cre_Doc_Control_Systems
select id_tai_lieu from tai_lieu where ma_trang_thai_tai_lieu = 'done' and ma_loai_tai_lieu = 'Paper' intersect select id_tai_lieu from tai_lieu join dai_ly_van_chuyen_tai_lieu on tai_lieu.ma_dai_ly_van_chuyen = dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen where dai_ly_van_chuyen_tai_lieu.ten_dai_ly_van_chuyen = 'USPS'	cre_Doc_Control_Systems
select chi_tiet_du_thao from ban_du_thao_cua_tai_lieu where id_tai_lieu = 7	cre_Doc_Control_Systems
select count ( * ) from ban_sao where id_tai_lieu = 2	cre_Doc_Control_Systems
select id_tai_lieu , count ( so_luong_ban_sao ) from ban_sao group by id_tai_lieu order by count ( so_luong_ban_sao ) desc limit 1	cre_Doc_Control_Systems
select id_tai_lieu , count ( * ) from ban_sao group by id_tai_lieu having count ( * ) > 1	cre_Doc_Control_Systems
select nhan_vien.ten_nhan_vien from nhan_vien join lich_su_luu_hanh on lich_su_luu_hanh.id_nhan_vien = nhan_vien.id_nhan_vien where lich_su_luu_hanh.id_tai_lieu = 1	cre_Doc_Control_Systems
select ten_nhan_vien from nhan_vien except select nhan_vien.ten_nhan_vien from nhan_vien join lich_su_luu_hanh on lich_su_luu_hanh.id_nhan_vien = nhan_vien.id_nhan_vien	cre_Doc_Control_Systems
select nhan_vien.ten_nhan_vien , count ( * ) from nhan_vien join lich_su_luu_hanh on lich_su_luu_hanh.id_nhan_vien = nhan_vien.id_nhan_vien group by lich_su_luu_hanh.id_tai_lieu , lich_su_luu_hanh.so_luong_du_thao , lich_su_luu_hanh.so_luong_ban_sao order by count ( * ) desc limit 1	cre_Doc_Control_Systems
select id_tai_lieu , count ( distinct id_nhan_vien ) from lich_su_luu_hanh group by id_tai_lieu	cre_Doc_Control_Systems
select count ( * ) from luot_dat_hang	cre_Drama_Workshop_Groups
select count ( * ) from luot_dat_hang	cre_Drama_Workshop_Groups
select ngay_dat_hang from luot_dat_hang	cre_Drama_Workshop_Groups
select ngay_dat_hang from luot_dat_hang	cre_Drama_Workshop_Groups
select ngay_giao_hang_theo_ke_hoach , ngay_giao_hang_thuc_te from luot_dat_hang	cre_Drama_Workshop_Groups
select ngay_giao_hang_theo_ke_hoach , ngay_giao_hang_thuc_te from luot_dat_hang	cre_Drama_Workshop_Groups
select count ( * ) from khach_hang_1	cre_Drama_Workshop_Groups
select count ( * ) from khach_hang_1	cre_Drama_Workshop_Groups
select so_dien_thoai_khach_hang , dia_chi_email_khach_hang from khach_hang_1 where ten_khach_hang = 'Harold'	cre_Drama_Workshop_Groups
select so_dien_thoai_khach_hang , dia_chi_email_khach_hang from khach_hang_1 where ten_khach_hang = 'Harold'	cre_Drama_Workshop_Groups
select ten_cua_hang from nhom_hoi_thao_kich	cre_Drama_Workshop_Groups
select ten_cua_hang from nhom_hoi_thao_kich	cre_Drama_Workshop_Groups
select min ( so_luong_dat_hang ) , avg ( so_luong_dat_hang ) , max ( so_luong_dat_hang ) from hoa_don	cre_Drama_Workshop_Groups
select min ( so_luong_dat_hang ) , avg ( so_luong_dat_hang ) , max ( so_luong_dat_hang ) from hoa_don	cre_Drama_Workshop_Groups
select distinct ma_phuong_thuc_thanh_toan from hoa_don	cre_Drama_Workshop_Groups
select distinct ma_phuong_thuc_thanh_toan from hoa_don	cre_Drama_Workshop_Groups
select mo_ta_ve_khu_vuc_tiep_thi from khu_vuc_tiep_thi where ten_khu_vuc_tiep_thi = 'China'	cre_Drama_Workshop_Groups
select mo_ta_ve_khu_vuc_tiep_thi from khu_vuc_tiep_thi where ten_khu_vuc_tiep_thi = 'China'	cre_Drama_Workshop_Groups
select distinct ten_san_pham from cac_san_pham where gia_san_pham > ( select avg ( gia_san_pham ) from cac_san_pham )	cre_Drama_Workshop_Groups
select distinct ten_san_pham from cac_san_pham where gia_san_pham > ( select avg ( gia_san_pham ) from cac_san_pham )	cre_Drama_Workshop_Groups
select ten_san_pham from cac_san_pham order by gia_san_pham desc limit 1	cre_Drama_Workshop_Groups
select ten_san_pham from cac_san_pham order by gia_san_pham desc limit 1	cre_Drama_Workshop_Groups
select ten_san_pham from cac_san_pham order by gia_san_pham asc	cre_Drama_Workshop_Groups
select ten_san_pham from cac_san_pham order by gia_san_pham asc	cre_Drama_Workshop_Groups
select so_dien_thoai_khach_hang from nguoi_bieu_dien where ten_khach_hang = 'Ashley'	cre_Drama_Workshop_Groups
select so_dien_thoai_khach_hang from nguoi_bieu_dien where ten_khach_hang = 'Ashley'	cre_Drama_Workshop_Groups
select ma_phuong_thuc_thanh_toan , count ( * ) from hoa_don group by ma_phuong_thuc_thanh_toan	cre_Drama_Workshop_Groups
select ma_phuong_thuc_thanh_toan , count ( * ) from hoa_don group by ma_phuong_thuc_thanh_toan	cre_Drama_Workshop_Groups
select ma_phuong_thuc_thanh_toan from hoa_don group by ma_phuong_thuc_thanh_toan order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select ma_phuong_thuc_thanh_toan from hoa_don group by ma_phuong_thuc_thanh_toan order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t1.thanh_pho_thi_tran from dia_chi as t1 join cua_hang as t2 on t1.id_dia_chi = t2.id_dia_chi where t2.ten_cua_hang = 'FJA Filming'	cre_Drama_Workshop_Groups
select t1.thanh_pho_thi_tran from dia_chi as t1 join cua_hang as t2 on t1.id_dia_chi = t2.id_dia_chi where t2.ten_cua_hang = 'FJA Filming'	cre_Drama_Workshop_Groups
select t1.quan_hat from dia_chi as t1 join cua_hang as t2 on t1.id_dia_chi = t2.id_dia_chi where t2.ma_khu_vuc_tiep_thi = 'CA'	cre_Drama_Workshop_Groups
select t1.quan_hat from dia_chi as t1 join cua_hang as t2 on t1.id_dia_chi = t2.id_dia_chi where t2.ma_khu_vuc_tiep_thi = 'CA'	cre_Drama_Workshop_Groups
select t1.ten_khu_vuc_tiep_thi from khu_vuc_tiep_thi as t1 join cua_hang as t2 on t1.ma_khu_vuc_tiep_thi = t2.ma_khu_vuc_tiep_thi where t2.ten_cua_hang = 'Rob Dinning'	cre_Drama_Workshop_Groups
select t1.ten_khu_vuc_tiep_thi from khu_vuc_tiep_thi as t1 join cua_hang as t2 on t1.ma_khu_vuc_tiep_thi = t2.ma_khu_vuc_tiep_thi where t2.ten_cua_hang = 'Rob Dinning'	cre_Drama_Workshop_Groups
select t1.mo_ta_ve_loai_dich_vu from loai_dich_vu as t1 join dich_vu as t2 on t1.ma_loai_dich_vu = t2.ma_loai_dich_vu where t2.gia_san_pham > 100	cre_Drama_Workshop_Groups
select t1.mo_ta_ve_loai_dich_vu from loai_dich_vu as t1 join dich_vu as t2 on t1.ma_loai_dich_vu = t2.ma_loai_dich_vu where t2.gia_san_pham > 100	cre_Drama_Workshop_Groups
select t1.mo_ta_ve_loai_dich_vu , t2.ma_loai_dich_vu , count ( * ) from loai_dich_vu as t1 join dich_vu as t2 on t1.ma_loai_dich_vu = t2.ma_loai_dich_vu group by t2.ma_loai_dich_vu	cre_Drama_Workshop_Groups
select t1.mo_ta_ve_loai_dich_vu , t2.ma_loai_dich_vu , count ( * ) from loai_dich_vu as t1 join dich_vu as t2 on t1.ma_loai_dich_vu = t2.ma_loai_dich_vu group by t2.ma_loai_dich_vu	cre_Drama_Workshop_Groups
select t1.mo_ta_ve_loai_dich_vu , t1.ma_loai_dich_vu from loai_dich_vu as t1 join dich_vu as t2 on t1.ma_loai_dich_vu = t2.ma_loai_dich_vu group by t1.ma_loai_dich_vu order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t1.mo_ta_ve_loai_dich_vu , t1.ma_loai_dich_vu from loai_dich_vu as t1 join dich_vu as t2 on t1.ma_loai_dich_vu = t2.ma_loai_dich_vu group by t1.ma_loai_dich_vu order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t1.so_dien_thoai_cua_hang , t1.dia_chi_email_cua_hang from nhom_hoi_thao_kich as t1 join dich_vu as t2 on t1.id_nhom_hoi_thao_kich = t2.id_nhom_hoi_thao_kich	cre_Drama_Workshop_Groups
select t1.so_dien_thoai_cua_hang , t1.dia_chi_email_cua_hang from nhom_hoi_thao_kich as t1 join dich_vu as t2 on t1.id_nhom_hoi_thao_kich = t2.id_nhom_hoi_thao_kich	cre_Drama_Workshop_Groups
select t1.so_dien_thoai_cua_hang , t1.dia_chi_email_cua_hang from nhom_hoi_thao_kich as t1 join dich_vu as t2 on t1.id_nhom_hoi_thao_kich = t2.id_nhom_hoi_thao_kich where t2.ten_san_pham = 'film'	cre_Drama_Workshop_Groups
select t1.so_dien_thoai_cua_hang , t1.dia_chi_email_cua_hang from nhom_hoi_thao_kich as t1 join dich_vu as t2 on t1.id_nhom_hoi_thao_kich = t2.id_nhom_hoi_thao_kich where t2.ten_san_pham = 'film'	cre_Drama_Workshop_Groups
select ten_san_pham , avg ( gia_san_pham ) from cac_san_pham group by ten_san_pham	cre_Drama_Workshop_Groups
select ten_san_pham , avg ( gia_san_pham ) from cac_san_pham group by ten_san_pham	cre_Drama_Workshop_Groups
select ten_san_pham from cac_san_pham group by ten_san_pham having avg ( gia_san_pham ) < 1000000	cre_Drama_Workshop_Groups
select ten_san_pham from cac_san_pham group by ten_san_pham having avg ( gia_san_pham ) < 1000000	cre_Drama_Workshop_Groups
select sum ( t1.so_luong_dat_hang ) from mat_hang_duoc_dat as t1 join cac_san_pham as t2 on t1.id_san_pham = t2.id_san_pham where t2.ten_san_pham = 'photo'	cre_Drama_Workshop_Groups
select sum ( t1.so_luong_dat_hang ) from mat_hang_duoc_dat as t1 join cac_san_pham as t2 on t1.id_san_pham = t2.id_san_pham where t2.ten_san_pham = 'photo'	cre_Drama_Workshop_Groups
select t1.chi_tiet_khac_ve_mat_hang from mat_hang_duoc_dat as t1 join cac_san_pham as t2 on t1.id_san_pham = t2.id_san_pham where t2.gia_san_pham > 2000	cre_Drama_Workshop_Groups
select t1.chi_tiet_khac_ve_mat_hang from mat_hang_duoc_dat as t1 join cac_san_pham as t2 on t1.id_san_pham = t2.id_san_pham where t2.gia_san_pham > 2000	cre_Drama_Workshop_Groups
select t1.ngay_giao_hang_thuc_te from luot_dat_hang_cua_khach_hang as t1 join mat_hang_duoc_dat as t2 on t1.id_don_hang = t2.id_don_hang where t2.so_luong_dat_hang = 1	cre_Drama_Workshop_Groups
select t1.ngay_giao_hang_thuc_te from luot_dat_hang_cua_khach_hang as t1 join mat_hang_duoc_dat as t2 on t1.id_don_hang = t2.id_don_hang where t2.so_luong_dat_hang = 1	cre_Drama_Workshop_Groups
select t1.ngay_dat_hang from luot_dat_hang_cua_khach_hang as t1 join mat_hang_duoc_dat as t2 on t1.id_don_hang = t2.id_don_hang join cac_san_pham as t3 on t2.id_san_pham = t3.id_san_pham where t3.gia_san_pham > 1000	cre_Drama_Workshop_Groups
select t1.ngay_dat_hang from luot_dat_hang_cua_khach_hang as t1 join mat_hang_duoc_dat as t2 on t1.id_don_hang = t2.id_don_hang join cac_san_pham as t3 on t2.id_san_pham = t3.id_san_pham where t3.gia_san_pham > 1000	cre_Drama_Workshop_Groups
select count ( distinct ma_tien_te ) from nhom_hoi_thao_kich	cre_Drama_Workshop_Groups
select count ( distinct ma_tien_te ) from nhom_hoi_thao_kich	cre_Drama_Workshop_Groups
select t2.ten_cua_hang from dia_chi as t1 join nhom_hoi_thao_kich as t2 on t1.id_dia_chi = t2.id_dia_chi where t1.thanh_pho_thi_tran = 'Feliciaberg'	cre_Drama_Workshop_Groups
select t2.ten_cua_hang from dia_chi as t1 join nhom_hoi_thao_kich as t2 on t1.id_dia_chi = t2.id_dia_chi where t1.thanh_pho_thi_tran = 'Feliciaberg'	cre_Drama_Workshop_Groups
select t2.dia_chi_email_cua_hang from dia_chi as t1 join nhom_hoi_thao_kich as t2 on t1.id_dia_chi = t2.id_dia_chi where t1.quan_hat = 'Alaska'	cre_Drama_Workshop_Groups
select t2.dia_chi_email_cua_hang from dia_chi as t1 join nhom_hoi_thao_kich as t2 on t1.id_dia_chi = t2.id_dia_chi where t1.quan_hat = 'Alaska'	cre_Drama_Workshop_Groups
select t1.thanh_pho_thi_tran , count ( * ) from dia_chi as t1 join nhom_hoi_thao_kich as t2 on t1.id_dia_chi = t2.id_dia_chi group by t1.thanh_pho_thi_tran	cre_Drama_Workshop_Groups
select t1.thanh_pho_thi_tran , count ( * ) from dia_chi as t1 join nhom_hoi_thao_kich as t2 on t1.id_dia_chi = t2.id_dia_chi group by t1.thanh_pho_thi_tran	cre_Drama_Workshop_Groups
select ma_khu_vuc_tiep_thi from nhom_hoi_thao_kich group by ma_khu_vuc_tiep_thi order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select ma_khu_vuc_tiep_thi from nhom_hoi_thao_kich group by ma_khu_vuc_tiep_thi order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t1.thanh_pho_thi_tran from dia_chi as t1 join khach_hang_1 as t2 on t1.id_dia_chi = t2.id_dia_chi except select t1.thanh_pho_thi_tran from dia_chi as t1 join nguoi_bieu_dien as t2 on t1.id_dia_chi = t2.id_dia_chi	cre_Drama_Workshop_Groups
select t1.thanh_pho_thi_tran from dia_chi as t1 join khach_hang_1 as t2 on t1.id_dia_chi = t2.id_dia_chi except select t1.thanh_pho_thi_tran from dia_chi as t1 join nguoi_bieu_dien as t2 on t1.id_dia_chi = t2.id_dia_chi	cre_Drama_Workshop_Groups
select ma_trang_thai from luot_dat_hang group by ma_trang_thai order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select ma_trang_thai from luot_dat_hang group by ma_trang_thai order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t2.ten_cua_hang from luot_dat_hang as t1 join nhom_hoi_thao_kich as t2 on t1.id_nhom_hoi_thao_kich = t2.id_nhom_hoi_thao_kich where t1.ma_trang_thai = 'stop'	cre_Drama_Workshop_Groups
select t2.ten_cua_hang from luot_dat_hang as t1 join nhom_hoi_thao_kich as t2 on t1.id_nhom_hoi_thao_kich = t2.id_nhom_hoi_thao_kich where t1.ma_trang_thai = 'stop'	cre_Drama_Workshop_Groups
select ten_khach_hang from khach_hang_1 except select t2.ten_khach_hang from luot_dat_hang as t1 join khach_hang_1 as t2 on t1.id_khach_hang = t2.id_khach_hang	cre_Drama_Workshop_Groups
select ten_khach_hang from khach_hang_1 except select t2.ten_khach_hang from luot_dat_hang as t1 join khach_hang_1 as t2 on t1.id_khach_hang = t2.id_khach_hang	cre_Drama_Workshop_Groups
select avg ( so_luong_dat_hang ) from hoa_don where ma_phuong_thuc_thanh_toan = 'MasterCard'	cre_Drama_Workshop_Groups
select avg ( so_luong_dat_hang ) from hoa_don where ma_phuong_thuc_thanh_toan = 'MasterCard'	cre_Drama_Workshop_Groups
select id_san_pham from hoa_don group by id_san_pham order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select id_san_pham from hoa_don group by id_san_pham order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t1.mo_ta_ve_loai_dich_vu from loai_dich_vu as t1 join dich_vu as t2 on t1.ma_loai_dich_vu = t2.ma_loai_dich_vu where t2.ten_san_pham = 'photo' intersect select t1.mo_ta_ve_loai_dich_vu from loai_dich_vu as t1 join dich_vu as t2 on t1.ma_loai_dich_vu = t2.ma_loai_dich_vu where t2.ten_san_pham = 'film'	cre_Drama_Workshop_Groups
select t1.mo_ta_ve_loai_dich_vu from loai_dich_vu as t1 join dich_vu as t2 on t1.ma_loai_dich_vu = t2.ma_loai_dich_vu where t2.ten_san_pham = 'photo' intersect select t1.mo_ta_ve_loai_dich_vu from loai_dich_vu as t1 join dich_vu as t2 on t1.ma_loai_dich_vu = t2.ma_loai_dich_vu where t2.ten_san_pham = 'film'	cre_Drama_Workshop_Groups
select count ( * ) from tai_khoan	customers_and_invoices
select count ( * ) from tai_khoan	customers_and_invoices
select count ( distinct id_khach_hang ) from tai_khoan	customers_and_invoices
select count ( distinct id_khach_hang ) from tai_khoan	customers_and_invoices
select id_tai_khoan , ngay_mo_tai_khoan , ten_tai_khoan , chi_tiet_khac_ve_tai_khoan from tai_khoan	customers_and_invoices
select id_tai_khoan , ngay_mo_tai_khoan , ten_tai_khoan , chi_tiet_khac_ve_tai_khoan from tai_khoan	customers_and_invoices
select t1.id_tai_khoan , t1.ngay_mo_tai_khoan , t1.ten_tai_khoan , t1.chi_tiet_khac_ve_tai_khoan from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten_khach_hang = 'Meaghan'	customers_and_invoices
select t1.id_tai_khoan , t1.ngay_mo_tai_khoan , t1.ten_tai_khoan , t1.chi_tiet_khac_ve_tai_khoan from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten_khach_hang = 'Meaghan'	customers_and_invoices
select t1.ten_tai_khoan , t1.chi_tiet_khac_ve_tai_khoan from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten_khach_hang = 'Meaghan' and t2.ho_cua_khach_hang = 'Keeling'	customers_and_invoices
select t1.ten_tai_khoan , t1.chi_tiet_khac_ve_tai_khoan from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten_khach_hang = 'Meaghan' and t2.ho_cua_khach_hang = 'Keeling'	customers_and_invoices
select t2.ten_khach_hang , t2.ho_cua_khach_hang from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ten_tai_khoan = '900'	customers_and_invoices
select t2.ten_khach_hang , t2.ho_cua_khach_hang from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ten_tai_khoan = '900'	customers_and_invoices
select count ( * ) from khach_hang where id_khach_hang not in ( select id_khach_hang from tai_khoan )	customers_and_invoices
select count ( * ) from khach_hang where id_khach_hang not in ( select id_khach_hang from tai_khoan )	customers_and_invoices
select distinct t1.ten_khach_hang , t1.ho_cua_khach_hang , t1.so_dien_thoai from khach_hang as t1 join tai_khoan as t2 on t1.id_khach_hang = t2.id_khach_hang	customers_and_invoices
select distinct t1.ten_khach_hang , t1.ho_cua_khach_hang , t1.so_dien_thoai from khach_hang as t1 join tai_khoan as t2 on t1.id_khach_hang = t2.id_khach_hang	customers_and_invoices
select id_khach_hang from khach_hang except select id_khach_hang from tai_khoan	customers_and_invoices
select id_khach_hang from khach_hang except select id_khach_hang from tai_khoan	customers_and_invoices
select count ( * ) , id_khach_hang from tai_khoan group by id_khach_hang	customers_and_invoices
select count ( * ) , id_khach_hang from tai_khoan group by id_khach_hang	customers_and_invoices
select t1.id_khach_hang , t2.ten_khach_hang , t2.ho_cua_khach_hang from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang order by count ( * ) desc limit 1	customers_and_invoices
select t1.id_khach_hang , t2.ten_khach_hang , t2.ho_cua_khach_hang from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang order by count ( * ) desc limit 1	customers_and_invoices
select t1.id_khach_hang , t2.ten_khach_hang , t2.ho_cua_khach_hang , count ( * ) from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang	customers_and_invoices
select t1.id_khach_hang , t2.ten_khach_hang , t2.ho_cua_khach_hang , count ( * ) from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang	customers_and_invoices
select t2.ten_khach_hang , t1.id_khach_hang from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang having count ( * ) >= 2	customers_and_invoices
select t2.ten_khach_hang , t1.id_khach_hang from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang having count ( * ) >= 2	customers_and_invoices
select count ( * ) from khach_hang	customers_and_invoices
select count ( * ) from khach_hang	customers_and_invoices
select gioi_tinh , count ( * ) from khach_hang group by gioi_tinh	customers_and_invoices
select gioi_tinh , count ( * ) from khach_hang group by gioi_tinh	customers_and_invoices
select count ( * ) from giao_dich_tai_chinh	customers_and_invoices
select count ( * ) from giao_dich_tai_chinh	customers_and_invoices
select count ( * ) , id_tai_khoan from giao_dich_tai_chinh	customers_and_invoices
select count ( * ) , id_tai_khoan from giao_dich_tai_chinh	customers_and_invoices
select count ( * ) from giao_dich_tai_chinh as t1 join tai_khoan as t2 on t1.id_tai_khoan = t2.id_tai_khoan where t2.ten_tai_khoan = '337'	customers_and_invoices
select count ( * ) from giao_dich_tai_chinh as t1 join tai_khoan as t2 on t1.id_tai_khoan = t2.id_tai_khoan where t2.ten_tai_khoan = '337'	customers_and_invoices
select avg ( so_tien_giao_dich ) , min ( so_tien_giao_dich ) , max ( so_tien_giao_dich ) , sum ( so_tien_giao_dich ) from giao_dich_tai_chinh	customers_and_invoices
select avg ( so_tien_giao_dich ) , min ( so_tien_giao_dich ) , max ( so_tien_giao_dich ) , sum ( so_tien_giao_dich ) from giao_dich_tai_chinh	customers_and_invoices
select id_giao_dich from giao_dich_tai_chinh where so_tien_giao_dich > ( select avg ( so_tien_giao_dich ) from giao_dich_tai_chinh )	customers_and_invoices
select id_giao_dich from giao_dich_tai_chinh where so_tien_giao_dich > ( select avg ( so_tien_giao_dich ) from giao_dich_tai_chinh )	customers_and_invoices
select loai_giao_dich , sum ( so_tien_giao_dich ) from giao_dich_tai_chinh group by loai_giao_dich	customers_and_invoices
select loai_giao_dich , sum ( so_tien_giao_dich ) from giao_dich_tai_chinh group by loai_giao_dich	customers_and_invoices
select t2.ten_tai_khoan , t1.id_tai_khoan , count ( * ) from giao_dich_tai_chinh as t1 join tai_khoan as t2 on t1.id_tai_khoan = t2.id_tai_khoan group by t1.id_tai_khoan	customers_and_invoices
select t2.ten_tai_khoan , t1.id_tai_khoan , count ( * ) from giao_dich_tai_chinh as t1 join tai_khoan as t2 on t1.id_tai_khoan = t2.id_tai_khoan group by t1.id_tai_khoan	customers_and_invoices
select id_tai_khoan from giao_dich_tai_chinh group by id_tai_khoan order by count ( * ) desc limit 1	customers_and_invoices
select id_tai_khoan from giao_dich_tai_chinh group by id_tai_khoan order by count ( * ) desc limit 1	customers_and_invoices
select t1.id_tai_khoan , t2.ten_tai_khoan from giao_dich_tai_chinh as t1 join tai_khoan as t2 on t1.id_tai_khoan = t2.id_tai_khoan group by t1.id_tai_khoan having count ( * ) >= 4	customers_and_invoices
select t1.id_tai_khoan , t2.ten_tai_khoan from giao_dich_tai_chinh as t1 join tai_khoan as t2 on t1.id_tai_khoan = t2.id_tai_khoan group by t1.id_tai_khoan having count ( * ) >= 4	customers_and_invoices
select distinct kich_thuoc_san_pham from san_pham	customers_and_invoices
select distinct kich_thuoc_san_pham from san_pham	customers_and_invoices
select distinct mau_san_pham from san_pham	customers_and_invoices
select distinct mau_san_pham from san_pham	customers_and_invoices
select so_hoa_don , count ( * ) from giao_dich_tai_chinh group by so_hoa_don	customers_and_invoices
select so_hoa_don , count ( * ) from giao_dich_tai_chinh group by so_hoa_don	customers_and_invoices
select t2.so_hoa_don , t2.ngay_lap_hoa_don from giao_dich_tai_chinh as t1 join hoa_don as t2 on t1.so_hoa_don = t2.so_hoa_don group by t1.so_hoa_don order by count ( * ) desc limit 1	customers_and_invoices
select t2.so_hoa_don , t2.ngay_lap_hoa_don from giao_dich_tai_chinh as t1 join hoa_don as t2 on t1.so_hoa_don = t2.so_hoa_don group by t1.so_hoa_don order by count ( * ) desc limit 1	customers_and_invoices
select count ( * ) from hoa_don	customers_and_invoices
select count ( * ) from hoa_don	customers_and_invoices
select t1.ngay_lap_hoa_don , t1.id_don_hang , t2.chi_tiet_dat_hang from hoa_don as t1 join don_dat_hang as t2 on t1.id_don_hang = t2.id_don_hang	customers_and_invoices
select t1.ngay_lap_hoa_don , t1.id_don_hang , t2.chi_tiet_dat_hang from hoa_don as t1 join don_dat_hang as t2 on t1.id_don_hang = t2.id_don_hang	customers_and_invoices
select id_don_hang , count ( * ) from hoa_don group by id_don_hang	customers_and_invoices
select id_don_hang , count ( * ) from hoa_don group by id_don_hang	customers_and_invoices
select t2.id_don_hang , t2.chi_tiet_dat_hang from hoa_don as t1 join don_dat_hang as t2 on t1.id_don_hang = t2.id_don_hang group by t2.id_don_hang having count ( * ) > 2	customers_and_invoices
select t2.id_don_hang , t2.chi_tiet_dat_hang from hoa_don as t1 join don_dat_hang as t2 on t1.id_don_hang = t2.id_don_hang group by t2.id_don_hang having count ( * ) > 2	customers_and_invoices
select t2.ho_cua_khach_hang , t1.id_khach_hang , t2.so_dien_thoai from don_dat_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang order by count ( * ) desc limit 1	customers_and_invoices
select t2.ho_cua_khach_hang , t1.id_khach_hang , t2.so_dien_thoai from don_dat_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang order by count ( * ) desc limit 1	customers_and_invoices
select ten_san_pham from san_pham except select t1.ten_san_pham from san_pham as t1 join mat_hang_duoc_dat as t2 on t1.id_san_pham = t2.id_san_pham	customers_and_invoices
select ten_san_pham from san_pham except select t1.ten_san_pham from san_pham as t1 join mat_hang_duoc_dat as t2 on t1.id_san_pham = t2.id_san_pham	customers_and_invoices
select t2.ten_san_pham , sum ( t1.so_luong_san_pham ) from mat_hang_duoc_dat as t1 join san_pham as t2 on t1.id_san_pham = t2.id_san_pham group by t2.ten_san_pham	customers_and_invoices
select t2.ten_san_pham , sum ( t1.so_luong_san_pham ) from mat_hang_duoc_dat as t1 join san_pham as t2 on t1.id_san_pham = t2.id_san_pham group by t2.ten_san_pham	customers_and_invoices
select id_don_hang , count ( * ) from mat_hang_duoc_dat group by id_don_hang	customers_and_invoices
select id_don_hang , count ( * ) from mat_hang_duoc_dat group by id_don_hang	customers_and_invoices
select id_san_pham , count ( distinct id_don_hang ) from mat_hang_duoc_dat group by id_san_pham	customers_and_invoices
select id_san_pham , count ( distinct id_don_hang ) from mat_hang_duoc_dat group by id_san_pham	customers_and_invoices
select t2.ten_san_pham , count ( * ) from mat_hang_duoc_dat as t1 join san_pham as t2 on t1.id_san_pham = t2.id_san_pham join don_dat_hang as t3 on t3.id_don_hang = t1.id_don_hang group by t2.ten_san_pham	customers_and_invoices
select t2.ten_san_pham , count ( * ) from mat_hang_duoc_dat as t1 join san_pham as t2 on t1.id_san_pham = t2.id_san_pham join don_dat_hang as t3 on t3.id_don_hang = t1.id_don_hang group by t2.ten_san_pham	customers_and_invoices
select id_don_hang , count ( distinct id_san_pham ) from mat_hang_duoc_dat group by id_don_hang	customers_and_invoices
select id_don_hang , count ( distinct id_san_pham ) from mat_hang_duoc_dat group by id_don_hang	customers_and_invoices
select id_don_hang , sum ( so_luong_san_pham ) from mat_hang_duoc_dat group by id_don_hang	customers_and_invoices
select id_don_hang , sum ( so_luong_san_pham ) from mat_hang_duoc_dat group by id_don_hang	customers_and_invoices
select count ( * ) from san_pham where id_san_pham not in ( select id_san_pham from mat_hang_duoc_dat )	customers_and_invoices
select count ( * ) from san_pham where id_san_pham not in ( select id_san_pham from mat_hang_duoc_dat )	customers_and_invoices
select count ( * ) from dia_chi where quoc_gia = 'USA'	customers_and_products_contacts
select distinct thanh_pho from dia_chi	customers_and_products_contacts
select tieu_bang , count ( * ) from dia_chi group by tieu_bang	customers_and_products_contacts
select ten_khach_hang , dien_thoai_khach_hang from khach_hang where id_khach_hang not in ( select id_khach_hang from lich_su_dia_chi_khach_hang )	customers_and_products_contacts
select t1.ten_khach_hang from khach_hang as t1 join luot_dat_hang_cua_khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang order by count ( * ) desc limit 1	customers_and_products_contacts
select ma_loai_san_pham from san_pham group by ma_loai_san_pham having count ( * ) >= 2	customers_and_products_contacts
select t1.ten_khach_hang from khach_hang as t1 join luot_dat_hang_cua_khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ma_trang_thai_don_hang = 'Completed' intersect select t1.ten_khach_hang from khach_hang as t1 join luot_dat_hang_cua_khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ma_trang_thai_don_hang = 'Part'	customers_and_products_contacts
select ten_khach_hang , dien_thoai_khach_hang , ma_phuong_thuc_thanh_toan from khach_hang order by ma_so_khach_hang desc	customers_and_products_contacts
select t1.ten_san_pham , sum ( t2.so_luong_dat_hang ) from san_pham as t1 join mat_hang_duoc_dat as t2 on t1.id_san_pham = t2.id_san_pham group by t1.id_san_pham	customers_and_products_contacts
select min ( gia_san_pham ) , max ( gia_san_pham ) , avg ( gia_san_pham ) from san_pham	customers_and_products_contacts
select count ( * ) from san_pham where gia_san_pham > ( select avg ( gia_san_pham ) from san_pham )	customers_and_products_contacts
select t2.ten_khach_hang , t3.thanh_pho , t1.tu_ngay , t1.den_ngay from lich_su_dia_chi_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang join dia_chi as t3 on t1.id_dia_chi = t3.id_dia_chi	customers_and_products_contacts
select t1.ten_khach_hang from khach_hang as t1 join luot_dat_hang_cua_khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ma_phuong_thuc_thanh_toan = 'Credit Card' group by t1.id_khach_hang having count ( * ) > 2	customers_and_products_contacts
select t1.ten_khach_hang , t1.dien_thoai_khach_hang from khach_hang as t1 join luot_dat_hang_cua_khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang join mat_hang_duoc_dat as t3 on t3.id_don_hang = t2.id_don_hang group by t1.id_khach_hang order by sum ( t3.so_luong_dat_hang ) desc limit 1	customers_and_products_contacts
select ma_loai_san_pham , ten_san_pham from san_pham where gia_san_pham > 1000 or gia_san_pham < 500	customers_and_products_contacts
select count ( * ) from bo_truong where tuoi > 56	department_management
select ten , sinh_ra_o_tieu_bang , tuoi from bo_truong order by tuoi	department_management
select nam_thanh_lap , ten , ngan_sach_tinh_theo_ty from cac_bo	department_management
select max ( ngan_sach_tinh_theo_ty ) , min ( ngan_sach_tinh_theo_ty ) from cac_bo	department_management
select avg ( so_luong_nhan_vien ) from cac_bo where xep_hang between 10 and 15	department_management
select ten from bo_truong where sinh_ra_o_tieu_bang != 'California'	department_management
select distinct t1.nam_thanh_lap from cac_bo as t1 join su_quan_ly as t2 on t1.id_cac_bo = t2.id_cac_bo join bo_truong as t3 on t2.id_nguoi_dung_dau = t3.id_nguoi_dung_dau where t3.sinh_ra_o_tieu_bang = 'Alabama'	department_management
select sinh_ra_o_tieu_bang from bo_truong group by sinh_ra_o_tieu_bang having count ( * ) >= 3	department_management
select nam_thanh_lap from cac_bo group by nam_thanh_lap order by count ( * ) desc limit 1	department_management
select t1.ten , t1.so_luong_nhan_vien from cac_bo as t1 join su_quan_ly as t2 on t1.id_cac_bo = t2.id_cac_bo where t2.vai_tro_tam_thoi = 'Yes'	department_management
select count ( distinct vai_tro_tam_thoi ) from su_quan_ly	department_management
select count ( * ) from cac_bo where id_cac_bo not in ( select id_cac_bo from su_quan_ly )	department_management
select distinct t1.tuoi from su_quan_ly as t2 join bo_truong as t1 on t1.id_nguoi_dung_dau = t2.id_nguoi_dung_dau where t2.vai_tro_tam_thoi = 'Yes'	department_management
select t3.sinh_ra_o_tieu_bang from cac_bo as t1 join su_quan_ly as t2 on t1.id_cac_bo = t2.id_cac_bo join bo_truong as t3 on t2.id_nguoi_dung_dau = t3.id_nguoi_dung_dau where t1.ten = 'Treasury' intersect select t3.sinh_ra_o_tieu_bang from cac_bo as t1 join su_quan_ly as t2 on t1.id_cac_bo = t2.id_cac_bo join bo_truong as t3 on t2.id_nguoi_dung_dau = t3.id_nguoi_dung_dau where t1.ten = 'Homeland Security'	department_management
select t1.id_cac_bo , t1.ten , count ( * ) from su_quan_ly as t2 join cac_bo as t1 on t1.id_cac_bo = t2.id_cac_bo group by t1.id_cac_bo having count ( * ) > 1	department_management
select id_nguoi_dung_dau , ten from bo_truong where ten like '%Ha%'	department_management
select id from xe	driving_school
select id from xe	driving_school
select count ( * ) from xe	driving_school
select count ( * ) from xe	driving_school
select chi_tiet_ve_xe from xe where id = 1	driving_school
select chi_tiet_ve_xe from xe where id = 1	driving_school
select ten , ten_dem , ho from nhan_vien	driving_school
select ten , ten_dem , ho from nhan_vien	driving_school
select ngay_sinh from nhan_vien where ten = 'Janessa' and ho = 'Sawayn'	driving_school
select ngay_sinh from nhan_vien where ten = 'Janessa' and ho = 'Sawayn'	driving_school
select ngay_nhan_vien_gia_nhap from nhan_vien where ten = 'Janessa' and ho = 'Sawayn'	driving_school
select ngay_nhan_vien_gia_nhap from nhan_vien where ten = 'Janessa' and ho = 'Sawayn'	driving_school
select ngay_nhan_vien_roi_di from nhan_vien where ten = 'Janessa' and ho = 'Sawayn'	driving_school
select ngay_nhan_vien_roi_di from nhan_vien where ten = 'Janessa' and ho = 'Sawayn'	driving_school
select count ( * ) from nhan_vien where ten = 'Ludie'	driving_school
select count ( * ) from nhan_vien where ten = 'Ludie'	driving_school
select biet_danh from nhan_vien where ten = 'Janessa' and ho = 'Sawayn'	driving_school
select biet_danh from nhan_vien where ten = 'Janessa' and ho = 'Sawayn'	driving_school
select count ( * ) from nhan_vien	driving_school
select count ( * ) from nhan_vien	driving_school
select t1.thanh_pho from dia_chi as t1 join nhan_vien as t2 on t1.id_dia_chi = t2.id_dia_chi_nhan_vien where t2.ten = 'Janessa' and t2.ho = 'Sawayn'	driving_school
select t1.thanh_pho from dia_chi as t1 join nhan_vien as t2 on t1.id_dia_chi = t2.id_dia_chi_nhan_vien where t2.ten = 'Janessa' and t2.ho = 'Sawayn'	driving_school
select t1.quoc_gia , t1.tieu_bang from dia_chi as t1 join nhan_vien as t2 on t1.id_dia_chi = t2.id_dia_chi_nhan_vien where t2.ten = 'Janessa' and t2.ho = 'Sawayn'	driving_school
select t1.quoc_gia , t1.tieu_bang from dia_chi as t1 join nhan_vien as t2 on t1.id_dia_chi = t2.id_dia_chi_nhan_vien where t2.ten = 'Janessa' and t2.ho = 'Sawayn'	driving_school
select sum ( t1.gio_hoc ) from bai_giang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten = 'Rylan' and t2.ho = 'Goodwin'	driving_school
select sum ( t1.gio_hoc ) from bai_giang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten = 'Rylan' and t2.ho = 'Goodwin'	driving_school
select t1.ma_buu_dien from dia_chi as t1 join nhan_vien as t2 on t1.id_dia_chi = t2.id_dia_chi_nhan_vien where t2.ten = 'Janessa' and t2.ho = 'Sawayn'	driving_school
select t1.ma_buu_dien from dia_chi as t1 join nhan_vien as t2 on t1.id_dia_chi = t2.id_dia_chi_nhan_vien where t2.ten = 'Janessa' and t2.ho = 'Sawayn'	driving_school
select count ( * ) from dia_chi where tieu_bang = 'Georgia'	driving_school
select count ( * ) from dia_chi where tieu_bang = 'Georgia'	driving_school
select t2.ten , t2.ho from dia_chi as t1 join nhan_vien as t2 on t1.id_dia_chi = t2.id_dia_chi_nhan_vien where t1.thanh_pho = 'Damianfort'	driving_school
select t2.ten , t2.ho from dia_chi as t1 join nhan_vien as t2 on t1.id_dia_chi = t2.id_dia_chi_nhan_vien where t1.thanh_pho = 'Damianfort'	driving_school
select t1.thanh_pho , count ( * ) from dia_chi as t1 join nhan_vien as t2 on t1.id_dia_chi = t2.id_dia_chi_nhan_vien group by t1.thanh_pho order by count ( * ) desc limit 1	driving_school
select t1.thanh_pho , count ( * ) from dia_chi as t1 join nhan_vien as t2 on t1.id_dia_chi = t2.id_dia_chi_nhan_vien group by t1.thanh_pho order by count ( * ) desc limit 1	driving_school
select t1.tieu_bang from dia_chi as t1 join nhan_vien as t2 on t1.id_dia_chi = t2.id_dia_chi_nhan_vien group by t1.tieu_bang having count ( * ) between 2 and 4	driving_school
select t1.tieu_bang from dia_chi as t1 join nhan_vien as t2 on t1.id_dia_chi = t2.id_dia_chi_nhan_vien group by t1.tieu_bang having count ( * ) between 2 and 4	driving_school
select ten , ho from khach_hang	driving_school
select ten , ho from khach_hang	driving_school
select dia_chi_email , ngay_sinh from khach_hang where ten = 'Carole'	driving_school
select dia_chi_email , ngay_sinh from khach_hang where ten = 'Carole'	driving_school
select so_dien_thoai , dia_chi_email from khach_hang where so_tien_con_thieu > 2000	driving_school
select so_dien_thoai , dia_chi_email from khach_hang where so_tien_con_thieu > 2000	driving_school
select ma_trang_thai_khach_hang , so_dien_thoai_di_dong , dia_chi_email from khach_hang where ten = 'Marina' or ho = 'Kohler'	driving_school
select ma_trang_thai_khach_hang , so_dien_thoai_di_dong , dia_chi_email from khach_hang where ten = 'Marina' or ho = 'Kohler'	driving_school
select ngay_sinh from khach_hang where ma_trang_thai_khach_hang = 'Good Customer'	driving_school
select ngay_sinh from khach_hang where ma_trang_thai_khach_hang = 'Good Customer'	driving_school
select ngay_tro_thanh_khach_hang from khach_hang where ten = 'Carole' and ho = 'Bernhard'	driving_school
select ngay_tro_thanh_khach_hang from khach_hang where ten = 'Carole' and ho = 'Bernhard'	driving_school
select count ( * ) from khach_hang	driving_school
select count ( * ) from khach_hang	driving_school
select ma_trang_thai_khach_hang , count ( * ) from khach_hang group by ma_trang_thai_khach_hang	driving_school
select ma_trang_thai_khach_hang , count ( * ) from khach_hang group by ma_trang_thai_khach_hang	driving_school
select ma_trang_thai_khach_hang from khach_hang group by ma_trang_thai_khach_hang order by count ( * ) asc limit 1	driving_school
select ma_trang_thai_khach_hang from khach_hang group by ma_trang_thai_khach_hang order by count ( * ) asc limit 1	driving_school
select count ( * ) from bai_giang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten = 'Rylan' and t2.ho = 'Goodwin' and t1.ma_trang_thai_bai_giang = 'Completed'	driving_school
select count ( * ) from bai_giang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten = 'Rylan' and t2.ho = 'Goodwin' and t1.ma_trang_thai_bai_giang = 'Completed'	driving_school
select max ( so_tien_con_thieu ) , min ( so_tien_con_thieu ) , avg ( so_tien_con_thieu ) from khach_hang	driving_school
select max ( so_tien_con_thieu ) , min ( so_tien_con_thieu ) , avg ( so_tien_con_thieu ) from khach_hang	driving_school
select ten , ho from khach_hang where so_tien_con_thieu between 1000 and 3000	driving_school
select ten , ho from khach_hang where so_tien_con_thieu between 1000 and 3000	driving_school
select t1.ten , t1.ho from khach_hang as t1 join dia_chi as t2 on t1.id_dia_chi_khach_hang = t2.id_dia_chi where t2.thanh_pho = 'Lockmanfurt'	driving_school
select t1.ten , t1.ho from khach_hang as t1 join dia_chi as t2 on t1.id_dia_chi_khach_hang = t2.id_dia_chi where t2.thanh_pho = 'Lockmanfurt'	driving_school
select t2.quoc_gia from khach_hang as t1 join dia_chi as t2 on t1.id_dia_chi_khach_hang = t2.id_dia_chi where t1.ten = 'Carole' and t1.ho = 'Bernhard'	driving_school
select t2.quoc_gia from khach_hang as t1 join dia_chi as t2 on t1.id_dia_chi_khach_hang = t2.id_dia_chi where t1.ten = 'Carole' and t1.ho = 'Bernhard'	driving_school
select t2.ma_buu_dien from khach_hang as t1 join dia_chi as t2 on t1.id_dia_chi_khach_hang = t2.id_dia_chi where t1.ten = 'Carole' and t1.ho = 'Bernhard'	driving_school
select t2.ma_buu_dien from khach_hang as t1 join dia_chi as t2 on t1.id_dia_chi_khach_hang = t2.id_dia_chi where t1.ten = 'Carole' and t1.ho = 'Bernhard'	driving_school
select t2.thanh_pho from khach_hang as t1 join dia_chi as t2 on t1.id_dia_chi_khach_hang = t2.id_dia_chi group by t2.thanh_pho order by count ( * ) desc limit 1	driving_school
select t2.thanh_pho from khach_hang as t1 join dia_chi as t2 on t1.id_dia_chi_khach_hang = t2.id_dia_chi group by t2.thanh_pho order by count ( * ) desc limit 1	driving_school
select sum ( t1.so_tien_thanh_toan ) from khoan_thanh_toan_cua_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten = 'Carole' and t2.ho = 'Bernhard'	driving_school
select sum ( t1.so_tien_thanh_toan ) from khoan_thanh_toan_cua_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten = 'Carole' and t2.ho = 'Bernhard'	driving_school
select count ( * ) from khach_hang where id_khach_hang not in ( select id_khach_hang from khoan_thanh_toan_cua_khach_hang )	driving_school
select count ( * ) from khach_hang where id_khach_hang not in ( select id_khach_hang from khoan_thanh_toan_cua_khach_hang )	driving_school
select t2.ten , t2.ho from khoan_thanh_toan_cua_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang having count ( * ) > 2	driving_school
select t2.ten , t2.ho from khoan_thanh_toan_cua_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang having count ( * ) > 2	driving_school
select ma_phuong_thuc_thanh_toan , count ( * ) from khoan_thanh_toan_cua_khach_hang group by ma_phuong_thuc_thanh_toan	driving_school
select ma_phuong_thuc_thanh_toan , count ( * ) from khoan_thanh_toan_cua_khach_hang group by ma_phuong_thuc_thanh_toan	driving_school
select count ( * ) from bai_giang where ma_trang_thai_bai_giang = 'Cancelled'	driving_school
select count ( * ) from bai_giang where ma_trang_thai_bai_giang = 'Cancelled'	driving_school
select t1.id_bai_giang from bai_giang as t1 join nhan_vien as t2 on t1.id_nhan_vien = t2.id_nhan_vien where t2.ten = 'Janessa' and t2.ho = 'Sawayn' and biet_danh like '%s%'	driving_school
select t1.id_bai_giang from bai_giang as t1 join nhan_vien as t2 on t1.id_nhan_vien = t2.id_nhan_vien where t2.ten = 'Janessa' and t2.ho = 'Sawayn' and biet_danh like '%s%'	driving_school
select count ( * ) from bai_giang as t1 join nhan_vien as t2 on t1.id_nhan_vien = t2.id_nhan_vien where t2.ten like '%a%'	driving_school
select count ( * ) from bai_giang as t1 join nhan_vien as t2 on t1.id_nhan_vien = t2.id_nhan_vien where t2.ten like '%a%'	driving_school
select sum ( gio_hoc ) from bai_giang as t1 join nhan_vien as t2 on t1.id_nhan_vien = t2.id_nhan_vien where t2.ten = 'Janessa' and t2.ho = 'Sawayn'	driving_school
select sum ( gio_hoc ) from bai_giang as t1 join nhan_vien as t2 on t1.id_nhan_vien = t2.id_nhan_vien where t2.ten = 'Janessa' and t2.ho = 'Sawayn'	driving_school
select avg ( gia ) from bai_giang as t1 join nhan_vien as t2 on t1.id_nhan_vien = t2.id_nhan_vien where t2.ten = 'Janessa' and t2.ho = 'Sawayn'	driving_school
select avg ( gia ) from bai_giang as t1 join nhan_vien as t2 on t1.id_nhan_vien = t2.id_nhan_vien where t2.ten = 'Janessa' and t2.ho = 'Sawayn'	driving_school
select count ( * ) from bai_giang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten = 'Ray'	driving_school
select count ( * ) from bai_giang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten = 'Ray'	driving_school
select ho from khach_hang intersect select ho from nhan_vien	driving_school
select ho from khach_hang intersect select ho from nhan_vien	driving_school
select ten from nhan_vien except select t2.ten from bai_giang as t1 join nhan_vien as t2 on t1.id_nhan_vien = t2.id_nhan_vien	driving_school
select ten from nhan_vien except select t2.ten from bai_giang as t1 join nhan_vien as t2 on t1.id_nhan_vien = t2.id_nhan_vien	driving_school
select t1.id , t1.chi_tiet_ve_xe from xe as t1 join bai_giang as t2 on t1.id = t2.id_xe group by t1.id order by count ( * ) desc limit 1	driving_school
select count ( * ) from nhan_vien	employee_hire_evaluation
select count ( * ) from nhan_vien	employee_hire_evaluation
select ten from nhan_vien order by tuoi	employee_hire_evaluation
select ten from nhan_vien order by tuoi	employee_hire_evaluation
select count ( * ) , thanh_pho from nhan_vien group by thanh_pho	employee_hire_evaluation
select count ( * ) , thanh_pho from nhan_vien group by thanh_pho	employee_hire_evaluation
select thanh_pho from nhan_vien where tuoi < 30 group by thanh_pho having count ( * ) > 1	employee_hire_evaluation
select thanh_pho from nhan_vien where tuoi < 30 group by thanh_pho having count ( * ) > 1	employee_hire_evaluation
select count ( * ) , dia_diem from cua_hang group by dia_diem	employee_hire_evaluation
select count ( * ) , dia_diem from cua_hang group by dia_diem	employee_hire_evaluation
select ten_nguoi_quan_ly , quan from cua_hang order by so_luong_san_pham desc limit 1	employee_hire_evaluation
select ten_nguoi_quan_ly , quan from cua_hang order by so_luong_san_pham desc limit 1	employee_hire_evaluation
select min ( so_luong_san_pham ) , max ( so_luong_san_pham ) from cua_hang	employee_hire_evaluation
select min ( so_luong_san_pham ) , max ( so_luong_san_pham ) from cua_hang	employee_hire_evaluation
select ten , dia_diem , quan from cua_hang order by so_luong_san_pham desc	employee_hire_evaluation
select ten , dia_diem , quan from cua_hang order by so_luong_san_pham desc	employee_hire_evaluation
select ten from cua_hang where so_luong_san_pham > ( select avg ( so_luong_san_pham ) from cua_hang )	employee_hire_evaluation
select ten from cua_hang where so_luong_san_pham > ( select avg ( so_luong_san_pham ) from cua_hang )	employee_hire_evaluation
select t1.ten from nhan_vien as t1 join danh_gia as t2 on t1.id_nhan_vien = t2.id_nhan_vien group by t2.id_nhan_vien order by count ( * ) desc limit 1	employee_hire_evaluation
select t1.ten from nhan_vien as t1 join danh_gia as t2 on t1.id_nhan_vien = t2.id_nhan_vien group by t2.id_nhan_vien order by count ( * ) desc limit 1	employee_hire_evaluation
select t1.ten from nhan_vien as t1 join danh_gia as t2 on t1.id_nhan_vien = t2.id_nhan_vien order by t2.tien_thuong desc limit 1	employee_hire_evaluation
select t1.ten from nhan_vien as t1 join danh_gia as t2 on t1.id_nhan_vien = t2.id_nhan_vien order by t2.tien_thuong desc limit 1	employee_hire_evaluation
select ten from nhan_vien where id_nhan_vien not in ( select id_nhan_vien from danh_gia )	employee_hire_evaluation
select ten from nhan_vien where id_nhan_vien not in ( select id_nhan_vien from danh_gia )	employee_hire_evaluation
select t2.ten from tuyen_dung as t1 join cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang group by t1.id_cua_hang order by count ( * ) desc limit 1	employee_hire_evaluation
select t2.ten from tuyen_dung as t1 join cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang group by t1.id_cua_hang order by count ( * ) desc limit 1	employee_hire_evaluation
select ten from cua_hang where id_cua_hang not in ( select id_cua_hang from tuyen_dung )	employee_hire_evaluation
select ten from cua_hang where id_cua_hang not in ( select id_cua_hang from tuyen_dung )	employee_hire_evaluation
select count ( * ) , t2.ten from tuyen_dung as t1 join cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang group by t2.ten	employee_hire_evaluation
select count ( * ) , t2.ten from tuyen_dung as t1 join cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang group by t2.ten	employee_hire_evaluation
select sum ( tien_thuong ) from danh_gia	employee_hire_evaluation
select sum ( tien_thuong ) from danh_gia	employee_hire_evaluation
select * from tuyen_dung	employee_hire_evaluation
select * from tuyen_dung	employee_hire_evaluation
select quan from cua_hang where so_luong_san_pham < 3000 intersect select quan from cua_hang where so_luong_san_pham > 10000	employee_hire_evaluation
select quan from cua_hang where so_luong_san_pham < 3000 intersect select quan from cua_hang where so_luong_san_pham > 10000	employee_hire_evaluation
select count ( distinct dia_diem ) from cua_hang	employee_hire_evaluation
select count ( distinct dia_diem ) from cua_hang	employee_hire_evaluation
select quoc_gia from hang_hang_khong where ten_hang_hang_khong = 'JetBlue Airways'	flight_2
select quoc_gia from hang_hang_khong where ten_hang_hang_khong = 'JetBlue Airways'	flight_2
select ten_viet_tat from hang_hang_khong where ten_hang_hang_khong = 'JetBlue Airways'	flight_2
select ten_viet_tat from hang_hang_khong where ten_hang_hang_khong = 'JetBlue Airways'	flight_2
select ten_hang_hang_khong , ten_viet_tat from hang_hang_khong where quoc_gia = 'USA'	flight_2
select ten_hang_hang_khong , ten_viet_tat from hang_hang_khong where quoc_gia = 'USA'	flight_2
select ma_san_bay , ten_san_bay from san_bay where thanh_pho = 'Anthony'	flight_2
select ma_san_bay , ten_san_bay from san_bay where thanh_pho = 'Anthony'	flight_2
select count ( * ) from hang_hang_khong	flight_2
select count ( * ) from hang_hang_khong	flight_2
select count ( * ) from san_bay	flight_2
select count ( * ) from san_bay	flight_2
select count ( * ) from chuyen_bay	flight_2
select count ( * ) from chuyen_bay	flight_2
select ten_hang_hang_khong from hang_hang_khong where ten_viet_tat = 'UAL'	flight_2
select ten_hang_hang_khong from hang_hang_khong where ten_viet_tat = 'UAL'	flight_2
select count ( * ) from hang_hang_khong where quoc_gia = 'USA'	flight_2
select count ( * ) from hang_hang_khong where quoc_gia = 'USA'	flight_2
select thanh_pho , quoc_gia from san_bay where ten_san_bay = 'Alton'	flight_2
select thanh_pho , quoc_gia from san_bay where ten_san_bay = 'Alton'	flight_2
select ten_san_bay from san_bay where ma_san_bay = 'AKO'	flight_2
select ten_san_bay from san_bay where ma_san_bay = 'AKO'	flight_2
select ten_san_bay from san_bay where thanh_pho = 'Aberdeen'	flight_2
select ten_san_bay from san_bay where thanh_pho = 'Aberdeen'	flight_2
select count ( * ) from chuyen_bay where san_bay_khoi_hanh = 'APG'	flight_2
select count ( * ) from chuyen_bay where san_bay_khoi_hanh = 'APG'	flight_2
select count ( * ) from chuyen_bay where san_bay_dich = 'ATO'	flight_2
select count ( * ) from chuyen_bay where san_bay_dich = 'ATO'	flight_2
select count ( * ) from chuyen_bay as t1 join san_bay as t2 on t1.san_bay_khoi_hanh = t2.ma_san_bay where t2.thanh_pho = 'Aberdeen'	flight_2
select count ( * ) from chuyen_bay as t1 join san_bay as t2 on t1.san_bay_khoi_hanh = t2.ma_san_bay where t2.thanh_pho = 'Aberdeen'	flight_2
select count ( * ) from chuyen_bay as t1 join san_bay as t2 on t1.san_bay_dich = t2.ma_san_bay where t2.thanh_pho = 'Aberdeen'	flight_2
select count ( * ) from chuyen_bay as t1 join san_bay as t2 on t1.san_bay_dich = t2.ma_san_bay where t2.thanh_pho = 'Aberdeen'	flight_2
select count ( * ) from chuyen_bay as t1 join san_bay as t2 on t1.san_bay_dich = t2.ma_san_bay join san_bay as t3 on t1.san_bay_khoi_hanh = t3.ma_san_bay where t2.thanh_pho = 'Ashley' and t3.thanh_pho = 'Aberdeen'	flight_2
select count ( * ) from chuyen_bay as t1 join san_bay as t2 on t1.san_bay_dich = t2.ma_san_bay join san_bay as t3 on t1.san_bay_khoi_hanh = t3.ma_san_bay where t2.thanh_pho = 'Ashley' and t3.thanh_pho = 'Aberdeen'	flight_2
select count ( * ) from chuyen_bay as t1 join hang_hang_khong as t2 on t1.hang_hang_khong = t2.id_hang_hang_khong where t2.ten_hang_hang_khong = 'JetBlue Airways'	flight_2
select count ( * ) from chuyen_bay as t1 join hang_hang_khong as t2 on t1.hang_hang_khong = t2.id_hang_hang_khong where t2.ten_hang_hang_khong = 'JetBlue Airways'	flight_2
select count ( * ) from hang_hang_khong as t1 join chuyen_bay as t2 on t2.hang_hang_khong = t1.id_hang_hang_khong where t1.ten_hang_hang_khong = 'United Airlines' and t2.san_bay_dich = 'ASY'	flight_2
select count ( * ) from hang_hang_khong as t1 join chuyen_bay as t2 on t2.hang_hang_khong = t1.id_hang_hang_khong where t1.ten_hang_hang_khong = 'United Airlines' and t2.san_bay_dich = 'ASY'	flight_2
select count ( * ) from hang_hang_khong as t1 join chuyen_bay as t2 on t2.hang_hang_khong = t1.id_hang_hang_khong where t1.ten_hang_hang_khong = 'United Airlines' and t2.san_bay_khoi_hanh = 'AHD'	flight_2
select count ( * ) from hang_hang_khong as t1 join chuyen_bay as t2 on t2.hang_hang_khong = t1.id_hang_hang_khong where t1.ten_hang_hang_khong = 'United Airlines' and t2.san_bay_khoi_hanh = 'AHD'	flight_2
select count ( * ) from chuyen_bay as t1 join san_bay as t2 on t1.san_bay_dich = t2.ma_san_bay join hang_hang_khong as t3 on t3.id_hang_hang_khong = t1.hang_hang_khong where t2.thanh_pho = 'Aberdeen' and t3.ten_hang_hang_khong = 'United Airlines'	flight_2
select count ( * ) from chuyen_bay as t1 join san_bay as t2 on t1.san_bay_dich = t2.ma_san_bay join hang_hang_khong as t3 on t3.id_hang_hang_khong = t1.hang_hang_khong where t2.thanh_pho = 'Aberdeen' and t3.ten_hang_hang_khong = 'United Airlines'	flight_2
select t1.thanh_pho from san_bay as t1 join chuyen_bay as t2 on t1.ma_san_bay = t2.san_bay_dich group by t1.thanh_pho order by count ( * ) desc limit 1	flight_2
select t1.thanh_pho from san_bay as t1 join chuyen_bay as t2 on t1.ma_san_bay = t2.san_bay_dich group by t1.thanh_pho order by count ( * ) desc limit 1	flight_2
select t1.thanh_pho from san_bay as t1 join chuyen_bay as t2 on t1.ma_san_bay = t2.san_bay_khoi_hanh group by t1.thanh_pho order by count ( * ) desc limit 1	flight_2
select t1.thanh_pho from san_bay as t1 join chuyen_bay as t2 on t1.ma_san_bay = t2.san_bay_khoi_hanh group by t1.thanh_pho order by count ( * ) desc limit 1	flight_2
select t1.ma_san_bay from san_bay as t1 join chuyen_bay as t2 on t1.ma_san_bay = t2.san_bay_dich or t1.ma_san_bay = t2.san_bay_khoi_hanh group by t1.ma_san_bay order by count ( * ) desc limit 1	flight_2
select t1.ma_san_bay from san_bay as t1 join chuyen_bay as t2 on t1.ma_san_bay = t2.san_bay_dich or t1.ma_san_bay = t2.san_bay_khoi_hanh group by t1.ma_san_bay order by count ( * ) desc limit 1	flight_2
select t1.ma_san_bay from san_bay as t1 join chuyen_bay as t2 on t1.ma_san_bay = t2.san_bay_dich or t1.ma_san_bay = t2.san_bay_khoi_hanh group by t1.ma_san_bay order by count ( * ) limit 1	flight_2
select t1.ma_san_bay from san_bay as t1 join chuyen_bay as t2 on t1.ma_san_bay = t2.san_bay_dich or t1.ma_san_bay = t2.san_bay_khoi_hanh group by t1.ma_san_bay order by count ( * ) limit 1	flight_2
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong group by t1.ten_hang_hang_khong order by count ( * ) desc limit 1	flight_2
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong group by t1.ten_hang_hang_khong order by count ( * ) desc limit 1	flight_2
select t1.ten_viet_tat , t1.quoc_gia from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong group by t1.ten_hang_hang_khong order by count ( * ) limit 1	flight_2
select t1.ten_viet_tat , t1.quoc_gia from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong group by t1.ten_hang_hang_khong order by count ( * ) limit 1	flight_2
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong where t2.san_bay_khoi_hanh = 'AHD'	flight_2
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong where t2.san_bay_khoi_hanh = 'AHD'	flight_2
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong where t2.san_bay_dich = 'AHD'	flight_2
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong where t2.san_bay_dich = 'AHD'	flight_2
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong where t2.san_bay_khoi_hanh = 'APG' intersect select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong where t2.san_bay_khoi_hanh = 'CVO'	flight_2
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong where t2.san_bay_khoi_hanh = 'APG' intersect select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong where t2.san_bay_khoi_hanh = 'CVO'	flight_2
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong where t2.san_bay_khoi_hanh = 'CVO' except select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong where t2.san_bay_khoi_hanh = 'APG'	flight_2
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong where t2.san_bay_khoi_hanh = 'CVO' except select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong where t2.san_bay_khoi_hanh = 'APG'	flight_2
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong group by t1.ten_hang_hang_khong having count ( * ) > 10	flight_2
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong group by t1.ten_hang_hang_khong having count ( * ) > 10	flight_2
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong group by t1.ten_hang_hang_khong having count ( * ) < 200	flight_2
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong group by t1.ten_hang_hang_khong having count ( * ) < 200	flight_2
select t1.so_hieu_chuyen_bay from chuyen_bay as t1 join hang_hang_khong as t2 on t2.id_hang_hang_khong = t1.hang_hang_khong where t2.ten_hang_hang_khong = 'United Airlines'	flight_2
select t1.so_hieu_chuyen_bay from chuyen_bay as t1 join hang_hang_khong as t2 on t2.id_hang_hang_khong = t1.hang_hang_khong where t2.ten_hang_hang_khong = 'United Airlines'	flight_2
select so_hieu_chuyen_bay from chuyen_bay where san_bay_khoi_hanh = 'APG'	flight_2
select so_hieu_chuyen_bay from chuyen_bay where san_bay_khoi_hanh = 'APG'	flight_2
select so_hieu_chuyen_bay from chuyen_bay where san_bay_dich = 'APG'	flight_2
select so_hieu_chuyen_bay from chuyen_bay where san_bay_dich = 'APG'	flight_2
select t1.so_hieu_chuyen_bay from chuyen_bay as t1 join san_bay as t2 on t1.san_bay_khoi_hanh = t2.ma_san_bay where t2.thanh_pho = 'Aberdeen'	flight_2
select t1.so_hieu_chuyen_bay from chuyen_bay as t1 join san_bay as t2 on t1.san_bay_khoi_hanh = t2.ma_san_bay where t2.thanh_pho = 'Aberdeen'	flight_2
select t1.so_hieu_chuyen_bay from chuyen_bay as t1 join san_bay as t2 on t1.san_bay_dich = t2.ma_san_bay where t2.thanh_pho = 'Aberdeen'	flight_2
select t1.so_hieu_chuyen_bay from chuyen_bay as t1 join san_bay as t2 on t1.san_bay_dich = t2.ma_san_bay where t2.thanh_pho = 'Aberdeen'	flight_2
select count ( * ) from chuyen_bay as t1 join san_bay as t2 on t1.san_bay_dich = t2.ma_san_bay where t2.thanh_pho = 'Aberdeen' or t2.thanh_pho = 'Abilene'	flight_2
select count ( * ) from chuyen_bay as t1 join san_bay as t2 on t1.san_bay_dich = t2.ma_san_bay where t2.thanh_pho = 'Aberdeen' or t2.thanh_pho = 'Abilene'	flight_2
select ten_san_bay from san_bay where ma_san_bay not in ( select san_bay_khoi_hanh from chuyen_bay union select san_bay_dich from chuyen_bay )	flight_2
select ten_san_bay from san_bay where ma_san_bay not in ( select san_bay_khoi_hanh from chuyen_bay union select san_bay_dich from chuyen_bay )	flight_2
select count ( * ) from tran_dau where mua_giai > 2007	game_injury
select ngay from tran_dau order by doi_chu_nha desc	game_injury
select mua_giai , doi_chu_nha , doi_khach from tran_dau	game_injury
select max ( tran_dau_san_nha ) , min ( tran_dau_san_nha ) , avg ( tran_dau_san_nha ) from san_van_dong	game_injury
select so_luong_nguoi_tham_du_trung_binh from san_van_dong where phan_tram_suc_chua > 100	game_injury
select cau_thu , so_luong_tran_dau , nguon_thong_tin from chan_thuong where chan_thuong != 'Knee problem'	game_injury
select t1.mua_giai from tran_dau as t1 join chan_thuong as t2 on t1.id = t2.id_tran_dau where t2.cau_thu = 'Walter Samuel'	game_injury
select t1.id , t1.ti_so , t1.ngay from tran_dau as t1 join chan_thuong as t2 on t2.id_tran_dau = t1.id group by t1.id having count ( * ) >= 2	game_injury
select t1.id , t1.ten from san_van_dong as t1 join tran_dau as t2 on t1.id = t2.id_san_van_dong join chan_thuong as t3 on t2.id = t3.id_tran_dau group by t1.id order by count ( * ) desc limit 1	game_injury
select t1.id , t1.ten from san_van_dong as t1 join tran_dau as t2 on t1.id = t2.id_san_van_dong join chan_thuong as t3 on t2.id = t3.id_tran_dau group by t1.id order by count ( * ) desc limit 1	game_injury
select t1.mua_giai , t2.ten from tran_dau as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id join chan_thuong as t3 on t1.id = t3.id_tran_dau where t3.chan_thuong = 'Foot injury' or t3.chan_thuong = 'Knee problem'	game_injury
select count ( distinct nguon_thong_tin ) from chan_thuong	game_injury
select count ( * ) from tran_dau where id not in ( select id_tran_dau from chan_thuong )	game_injury
select count ( distinct t1.chan_thuong ) from chan_thuong as t1 join tran_dau as t2 on t1.id_tran_dau = t2.id where t2.mua_giai > 2010	game_injury
select t2.ten from tran_dau as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id join chan_thuong as t3 on t1.id = t3.id_tran_dau where t3.cau_thu = 'Walter Samuel' intersect select t2.ten from tran_dau as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id join chan_thuong as t3 on t1.id = t3.id_tran_dau where t3.cau_thu = 'Thiago Motta'	game_injury
select ten , so_luong_nguoi_tham_du_trung_binh , tong_so_nguoi_tham_du from san_van_dong except select t2.ten , t2.so_luong_nguoi_tham_du_trung_binh , t2.tong_so_nguoi_tham_du from tran_dau as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id join chan_thuong as t3 on t1.id = t3.id_tran_dau	game_injury
select ten from san_van_dong where ten like '%Bank%'	game_injury
select t1.id , count ( * ) from san_van_dong as t1 join tran_dau as t2 on t1.id = t2.id_san_van_dong group by t1.id	game_injury
select t1.ngay , t2.cau_thu from tran_dau as t1 join chan_thuong as t2 on t1.id = t2.id_tran_dau order by t1.mua_giai desc	game_injury
select nam_phat_hanh from bo_phim where tieu_de = 'The Imitation Game'	imdb
select nam_phat_hanh from bo_phim where tieu_de = 'The Imitation Game'	imdb
select nam_sinh from dien_vien where ten = 'Benedict Cumberbatch'	imdb
select nam_sinh from dien_vien where ten = 'Benedict Cumberbatch'	imdb
select quoc_tich from dien_vien where ten = 'Christoph Waltz'	imdb
select quoc_tich from dien_vien where ten = 'Christoph Waltz'	imdb
select tieu_de from bo_phim where nam_phat_hanh = 2015	imdb
select ten from dien_vien where noi_sinh = 'Tehran'	imdb
select ten from dien_vien where noi_sinh = 'Tehran'	imdb
select ten from dien_vien where noi_sinh = 'Tehran'	imdb
select ten from dien_vien where quoc_tich = 'Afghanistan'	imdb
select ten from dien_vien where quoc_tich = 'Afghanistan'	imdb
select ten from dien_vien where quoc_tich = 'Afghanistan'	imdb
select ten from dien_vien where nam_sinh = 1984	imdb
select nam_sinh from dien_vien where ten = 'actor name0'	imdb
select nam_sinh from dien_vien where ten = 'actor name0'	imdb
select noi_sinh from dao_dien where ten = 'director name0'	imdb
select noi_sinh from dao_dien where ten = 'director name0'	imdb
select quoc_tich from dao_dien where ten = 'director name0'	imdb
select ngan_sach from bo_phim where tieu_de = 'Finding Nemo'	imdb
select t3.tieu_de from dao_dien as t2 join dao_dien_boi as t1 on t2.id_dao_dien = t1.id_dao_dien join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t2.ten = 'Steven Spielberg' and t3.nam_phat_hanh > 2006	imdb
select t2.ten from dao_dien as t2 join dao_dien_boi as t1 on t2.id_dao_dien = t1.id_dao_dien join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t3.tieu_de = 'James Bond'	imdb
select t2.ten from dao_dien as t2 join dao_dien_boi as t1 on t2.id_dao_dien = t1.id_dao_dien join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t3.tieu_de = 'James Bond'	imdb
select t2.ten from dao_dien as t2 join dao_dien_boi as t1 on t2.id_dao_dien = t1.id_dao_dien join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t3.tieu_de = 'James Bond'	imdb
select t1.ten from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien join bo_phim as t3 on t3.id_bo_phim = t2.id_se_ri_phim where t2.vai_dien = 'Alan Turing' and t3.tieu_de = 'The Imitation Game'	imdb
select t1.ten from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien join bo_phim as t3 on t3.id_bo_phim = t2.id_se_ri_phim where t2.vai_dien = 'Alan Turing' and t3.tieu_de = 'The Imitation Game'	imdb
select t1.ten from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien join bo_phim as t3 on t3.id_bo_phim = t2.id_se_ri_phim where t2.vai_dien = 'Alan Turing' and t3.tieu_de = 'The Imitation Game'	imdb
select t1.ten from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien join bo_phim as t3 on t3.id_bo_phim = t2.id_se_ri_phim where t2.vai_dien = 'Alan Turing' and t3.tieu_de = 'The Imitation Game'	imdb
select t1.ten from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien join bo_phim as t3 on t3.id_bo_phim = t2.id_se_ri_phim where t2.vai_dien = 'Alan Turing' and t3.tieu_de = 'The Imitation Game'	imdb
select t2.the_loai from the_loai as t2 join phan_loai as t1 on t2.id_the_loai = t1.id_the_loai join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t3.tieu_de = 'Jurassic Park'	imdb
select t2.ten from dao_dien as t2 join dao_dien_boi as t1 on t2.id_dao_dien = t1.id_dao_dien join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t3.nam_phat_hanh = 2015 and t3.tieu_de = 'Joy'	imdb
select t1.tieu_de from duoc_viet_boi as t3 join bo_phim as t1 on t3.id_se_ri_phim = t1.id_bo_phim join nha_viet_kich_ban as t2 on t3.id_nha_viet_kich_ban = t2.id_nha_viet_kich_ban where t2.ten = 'Matt Damon'	imdb
select t2.tieu_de from bo_phim as t2 join duoc_lam_boi as t3 on t2.id_bo_phim = t3.id_se_ri_phim join nha_san_xuat as t1 on t1.id_nha_san_xuat = t3.id_nha_san_xuat join duoc_viet_boi as t5 on t5.id_se_ri_phim = t2.id_bo_phim join nha_viet_kich_ban as t4 on t5.id_nha_viet_kich_ban = t4.id_nha_viet_kich_ban where t1.ten = 'Woody Allen' and t4.ten = 'Woody Allen'	imdb
select t2.tieu_de from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join bo_phim as t2 on t2.id_bo_phim = t3.id_se_ri_phim where t1.ten = 'Robin Wright'	imdb
select t2.tieu_de from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join bo_phim as t2 on t2.id_bo_phim = t3.id_se_ri_phim where t1.ten = 'Robin Wright'	imdb
select t2.tieu_de from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join bo_phim as t2 on t2.id_bo_phim = t3.id_se_ri_phim where t1.ten = 'Robin Wright'	imdb
select ngan_sach from bo_phim where nam_phat_hanh = 2007 and tieu_de = 'Juno'	imdb
select t3.tieu_de from the_loai as t2 join phan_loai as t1 on t2.id_the_loai = t1.id_the_loai join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t2.the_loai = 'Sci-Fi' and t3.nam_phat_hanh = 2010	imdb
select t3.tieu_de from the_loai as t2 join phan_loai as t1 on t2.id_the_loai = t1.id_the_loai join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t2.the_loai = 'Sci-Fi' and t3.nam_phat_hanh = 2010	imdb
select ten from dien_vien where noi_sinh = 'Austin' and nam_sinh > 1980	imdb
select ten from dien_vien where noi_sinh = 'Austin' and nam_sinh > 1980	imdb
select ten from dien_vien where noi_sinh = 'Austin' and nam_sinh > 1980	imdb
select t3.tieu_de from dao_dien as t2 join dao_dien_boi as t1 on t2.id_dao_dien = t1.id_dao_dien join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t2.noi_sinh = 'Los Angeles'	imdb
select ten from dien_vien where noi_sinh = 'New York City' and nam_sinh = 1984	imdb
select t3.tieu_de from nhan as t2 join tu_khoa as t1 on t2.id_tu_khoa = t1.id join bo_phim as t3 on t2.id_se_ri_phim = t3.id_bo_phim where t1.tu_khoa = 'nuclear weapons'	imdb
select t3.tieu_de from nhan as t2 join tu_khoa as t1 on t2.id_tu_khoa = t1.id join bo_phim as t3 on t2.id_se_ri_phim = t3.id_bo_phim where t1.tu_khoa = 'nuclear weapons'	imdb
select t3.tieu_de from dao_dien as t2 join dao_dien_boi as t1 on t2.id_dao_dien = t1.id_dao_dien join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t2.ten = 'Alfred Hitchcock'	imdb
select t4.tieu_de from phan_vai as t5 join dien_vien as t1 on t5.id_dien_vien = t1.id_dien_vien join bo_phim as t4 on t4.id_bo_phim = t5.id_se_ri_phim join dao_dien_boi as t2 on t4.id_bo_phim = t2.id_se_ri_phim join dao_dien as t3 on t3.id_dao_dien = t2.id_dao_dien where t1.ten = 'Taraneh Alidoosti' and t3.ten = 'Asghar Farhadi'	imdb
select t4.tieu_de from phan_vai as t5 join dien_vien as t1 on t5.id_dien_vien = t1.id_dien_vien join bo_phim as t4 on t4.id_bo_phim = t5.id_se_ri_phim join dao_dien_boi as t2 on t4.id_bo_phim = t2.id_se_ri_phim join dao_dien as t3 on t3.id_dao_dien = t2.id_dao_dien where t1.ten = 'Taraneh Alidoosti' and t3.ten = 'Asghar Farhadi'	imdb
select t4.tieu_de from phan_vai as t5 join dien_vien as t1 on t5.id_dien_vien = t1.id_dien_vien join bo_phim as t4 on t4.id_bo_phim = t5.id_se_ri_phim join dao_dien_boi as t2 on t4.id_bo_phim = t2.id_se_ri_phim join dao_dien as t3 on t3.id_dao_dien = t2.id_dao_dien where t1.ten = 'Taraneh Alidoosti' and t3.ten = 'Asghar Farhadi'	imdb
select t4.tieu_de from phan_vai as t5 join dien_vien as t1 on t5.id_dien_vien = t1.id_dien_vien join bo_phim as t4 on t4.id_bo_phim = t5.id_se_ri_phim join dao_dien_boi as t2 on t4.id_bo_phim = t2.id_se_ri_phim join dao_dien as t3 on t3.id_dao_dien = t2.id_dao_dien where t1.ten = 'Taraneh Alidoosti' and t3.ten = 'Asghar Farhadi'	imdb
select t2.tieu_de from nha_san_xuat as t1 join duoc_lam_boi as t3 on t1.id_nha_san_xuat = t3.id_nha_san_xuat join phim_truyen_hinh_nhieu_tap as t2 on t2.id_se_ri_phim_truyen_hinh = t3.id_se_ri_phim where t1.ten = 'Shonda Rhimes'	imdb
select t1.ten from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join phim_truyen_hinh_nhieu_tap as t2 on t2.id_se_ri_phim_truyen_hinh = t3.id_se_ri_phim where t3.vai_dien = 'Olivia Pope' and t2.tieu_de = 'Scandal'	imdb
select t2.ten from duoc_viet_boi as t3 join bo_phim as t1 on t3.id_se_ri_phim = t1.id_bo_phim join nha_viet_kich_ban as t2 on t3.id_nha_viet_kich_ban = t2.id_nha_viet_kich_ban where t1.tieu_de = 'The Truman Show'	imdb
select t2.ten from duoc_viet_boi as t3 join bo_phim as t1 on t3.id_se_ri_phim = t1.id_bo_phim join nha_viet_kich_ban as t2 on t3.id_nha_viet_kich_ban = t2.id_nha_viet_kich_ban where t1.tieu_de = 'The Truman Show'	imdb
select t2.tieu_de from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join phim_truyen_hinh_nhieu_tap as t2 on t2.id_se_ri_phim_truyen_hinh = t3.id_se_ri_phim where t1.ten = 'Scott Foley'	imdb
select t2.tieu_de from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join phim_truyen_hinh_nhieu_tap as t2 on t2.id_se_ri_phim_truyen_hinh = t3.id_se_ri_phim where t1.ten = 'Scott Foley'	imdb
select t3.ten from phan_vai as t4 join dien_vien as t1 on t4.id_dien_vien = t1.id_dien_vien join bo_phim as t5 on t5.id_bo_phim = t4.id_se_ri_phim join dao_dien_boi as t2 on t5.id_bo_phim = t2.id_se_ri_phim join dao_dien as t3 on t3.id_dao_dien = t2.id_dao_dien where t1.ten = 'Kate Winslet'	imdb
select t1.ten from phan_vai as t3 join dien_vien as t2 on t3.id_dien_vien = t2.id_dien_vien join bo_phim as t5 on t5.id_bo_phim = t3.id_se_ri_phim join duoc_lam_boi as t4 on t5.id_bo_phim = t4.id_se_ri_phim join nha_san_xuat as t1 on t1.id_nha_san_xuat = t4.id_nha_san_xuat where t2.ten = 'Kate Winslet'	imdb
select t2.ten from dao_dien as t2 join dao_dien_boi as t1 on t2.id_dao_dien = t1.id_dao_dien join phim_truyen_hinh_nhieu_tap as t3 on t3.id_se_ri_phim_truyen_hinh = t1.id_se_ri_phim where t3.nam_phat_hanh = 2013 and t3.tieu_de = 'House of Cards'	imdb
select ten from dien_vien where noi_sinh = 'Austin' and gioi_tinh = 'female'	imdb
select ten from dien_vien where nam_sinh > 1980 and quoc_tich = 'Italy'	imdb
select ten from dien_vien where noi_sinh = 'New York City' and nam_sinh > 1980 and gioi_tinh = 'female'	imdb
select t1.ten from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien join bo_phim as t3 on t3.id_bo_phim = t2.id_se_ri_phim where t1.gioi_tinh = 'female' and t3.tieu_de = 'Saving Private Ryan'	imdb
select ten from dao_dien where quoc_tich = 'Afghanistan'	imdb
select t1.ten from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien join bo_phim as t3 on t3.id_bo_phim = t2.id_se_ri_phim where t3.tieu_de = 'Camp X-Ray'	imdb
select t1.ten from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien join bo_phim as t3 on t3.id_bo_phim = t2.id_se_ri_phim where t1.quoc_tich = 'Canada' and t3.tieu_de = 'James Bond'	imdb
select t2.tieu_de from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join bo_phim as t2 on t2.id_bo_phim = t3.id_se_ri_phim where t1.ten = 'Rowan Atkinson' and t3.vai_dien = 'Mr. Bean'	imdb
select t2.noi_sinh from dao_dien as t2 join dao_dien_boi as t1 on t2.id_dao_dien = t1.id_dao_dien join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t3.tieu_de = 'The Past'	imdb
select t1.ten from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien where t2.vai_dien = 'Mr. Bean'	imdb
select t3.the_loai from dao_dien as t5 join dao_dien_boi as t2 on t5.id_dao_dien = t2.id_dao_dien join bo_phim as t4 on t4.id_bo_phim = t2.id_se_ri_phim join phan_loai as t1 on t4.id_bo_phim = t1.id_se_ri_phim join the_loai as t3 on t3.id_the_loai = t1.id_the_loai where t5.ten = 'Asghar Farhadi'	imdb
select t1.tieu_de from bo_phim as t1 join phan_vai as t2 on t1.id_bo_phim = t2.id_se_ri_phim where t2.vai_dien = 'Daffy Duck'	imdb
select t2.vai_dien from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien join bo_phim as t3 on t3.id_bo_phim = t2.id_se_ri_phim where t3.tieu_de = 'Daddy Long Legs'	imdb
select t3.ten from dao_dien as t3 join dao_dien_boi as t2 on t3.id_dao_dien = t2.id_dao_dien join bo_phim as t4 on t4.id_bo_phim = t2.id_se_ri_phim join nhan as t5 on t5.id_se_ri_phim = t4.id_bo_phim join tu_khoa as t1 on t5.id_tu_khoa = t1.id where t1.tu_khoa = 'nuclear weapons'	imdb
select count ( distinct t2.tieu_de ) from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join bo_phim as t2 on t2.id_bo_phim = t3.id_se_ri_phim where t1.ten = 'Jennifer Aniston' and t2.nam_phat_hanh > 2010	imdb
select count ( distinct t1.ten ) from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien join bo_phim as t3 on t3.id_bo_phim = t2.id_se_ri_phim where t3.tieu_de = 'Saving Private Ryan'	imdb
select count ( distinct t1.ten ) from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien join bo_phim as t3 on t3.id_bo_phim = t2.id_se_ri_phim where t3.tieu_de = 'Saving Private Ryan'	imdb
select count ( distinct t3.tieu_de ) from dao_dien as t2 join dao_dien_boi as t1 on t2.id_dao_dien = t1.id_dao_dien join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t2.ten = 'Steven Spielberg'	imdb
select count ( distinct tieu_de ) from bo_phim where nam_phat_hanh = 2013	imdb
select count ( distinct tieu_de ) from bo_phim where nam_phat_hanh = 2013	imdb
select count ( distinct t3.tieu_de ) , t3.nam_phat_hanh from dao_dien as t2 join dao_dien_boi as t1 on t2.id_dao_dien = t1.id_dao_dien join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t2.ten = 'Woody Allen' group by t3.nam_phat_hanh	imdb
select count ( distinct t2.tieu_de ) from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join bo_phim as t2 on t2.id_bo_phim = t3.id_se_ri_phim where t1.ten = 'Shahab Hosseini'	imdb
select count ( distinct t2.tieu_de ) from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join bo_phim as t2 on t2.id_bo_phim = t3.id_se_ri_phim where t1.ten = 'Shahab Hosseini'	imdb
select count ( distinct t2.tieu_de ) from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join bo_phim as t2 on t2.id_bo_phim = t3.id_se_ri_phim where t1.ten = 'Shahab Hosseini'	imdb
select count ( distinct t2.tieu_de ) from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join bo_phim as t2 on t2.id_bo_phim = t3.id_se_ri_phim where t1.ten = 'Shahab Hosseini'	imdb
select count ( distinct ten ) from dien_vien where noi_sinh = 'Los Angeles' and nam_sinh > 2000	imdb
select count ( distinct t2.tieu_de ) from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join bo_phim as t2 on t2.id_bo_phim = t3.id_se_ri_phim where t1.ten = 'Humphrey Bogart' and t2.nam_phat_hanh < 1942	imdb
select count ( distinct t2.tieu_de ) , t2.nam_phat_hanh from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join bo_phim as t2 on t2.id_bo_phim = t3.id_se_ri_phim where t1.ten = 'Brad Pitt' group by t2.nam_phat_hanh	imdb
select count ( distinct t3.tieu_de ) from nhan as t2 join tu_khoa as t1 on t2.id_tu_khoa = t1.id join bo_phim as t3 on t2.id_se_ri_phim = t3.id_bo_phim where t1.tu_khoa = 'Iraq war' and t3.nam_phat_hanh = 2015	imdb
select count ( distinct t3.tieu_de ) from nhan as t2 join tu_khoa as t1 on t2.id_tu_khoa = t1.id join bo_phim as t3 on t2.id_se_ri_phim = t3.id_bo_phim where t1.tu_khoa = 'Persians' and t3.nam_phat_hanh > 1990	imdb
select count ( distinct t3.tieu_de ) from dao_dien as t2 join dao_dien_boi as t1 on t2.id_dao_dien = t1.id_dao_dien join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t2.ten = 'Quentin Tarantino' and t3.nam_phat_hanh > 2010	imdb
select count ( distinct t3.tieu_de ) from dao_dien as t2 join dao_dien_boi as t1 on t2.id_dao_dien = t1.id_dao_dien join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t2.ten = 'Quentin Tarantino' and t3.nam_phat_hanh < 2010	imdb
select count ( distinct t4.tieu_de ) from dao_dien as t3 join dao_dien_boi as t2 on t3.id_dao_dien = t2.id_dao_dien join bo_phim as t4 on t4.id_bo_phim = t2.id_se_ri_phim join duoc_lam_boi as t5 on t4.id_bo_phim = t5.id_se_ri_phim join nha_san_xuat as t1 on t1.id_nha_san_xuat = t5.id_nha_san_xuat where t3.ten = 'Quentin Tarantino' and t4.nam_phat_hanh < 2010 and t4.nam_phat_hanh > 2002	imdb
select count ( distinct ten ) from dien_vien where noi_sinh = 'New York City' and nam_sinh > 1980 and gioi_tinh = 'female'	imdb
select count ( distinct t1.ten ) from phan_vai as t4 join dien_vien as t1 on t4.id_dien_vien = t1.id_dien_vien join bo_phim as t5 on t5.id_bo_phim = t4.id_se_ri_phim join dao_dien_boi as t2 on t5.id_bo_phim = t2.id_se_ri_phim join dao_dien as t3 on t3.id_dao_dien = t2.id_dao_dien where t1.quoc_tich = 'Iran' and t3.ten = 'Jim Jarmusch'	imdb
select count ( distinct t1.ten ) from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien join bo_phim as t3 on t3.id_bo_phim = t2.id_se_ri_phim where t1.quoc_tich = 'China' and t3.tieu_de = 'Rush Hour 3'	imdb
select t4.tieu_de from phan_vai as t5 join dien_vien as t1 on t5.id_dien_vien = t1.id_dien_vien join bo_phim as t4 on t4.id_bo_phim = t5.id_se_ri_phim join phan_vai as t3 on t4.id_bo_phim = t3.id_se_ri_phim join dien_vien as t2 on t3.id_dien_vien = t2.id_dien_vien where t1.ten = 'Woody Strode' and t2.ten = 'Jason Robards'	imdb
select t4.tieu_de from phan_vai as t5 join dien_vien as t1 on t5.id_dien_vien = t1.id_dien_vien join bo_phim as t4 on t4.id_bo_phim = t5.id_se_ri_phim join phan_vai as t3 on t4.id_bo_phim = t3.id_se_ri_phim join dien_vien as t2 on t3.id_dien_vien = t2.id_dien_vien where t1.ten = 'Woody Strode' and t2.ten = 'Jason Robards'	imdb
select t4.tieu_de from phan_vai as t5 join dien_vien as t1 on t5.id_dien_vien = t1.id_dien_vien join bo_phim as t4 on t4.id_bo_phim = t5.id_se_ri_phim join phan_vai as t3 on t4.id_bo_phim = t3.id_se_ri_phim join dien_vien as t2 on t3.id_dien_vien = t2.id_dien_vien where t1.ten = 'Woody Strode' and t2.ten = 'Jason Robards'	imdb
select t4.tieu_de from phan_vai as t5 join dien_vien as t1 on t5.id_dien_vien = t1.id_dien_vien join bo_phim as t4 on t4.id_bo_phim = t5.id_se_ri_phim join phan_vai as t3 on t4.id_bo_phim = t3.id_se_ri_phim join dien_vien as t2 on t3.id_dien_vien = t2.id_dien_vien where t1.ten = 'Woody Strode' and t2.ten = 'Jason Robards'	imdb
select t1.ten from phan_vai as t4 join dien_vien as t1 on t4.id_dien_vien = t1.id_dien_vien join bo_phim as t5 on t5.id_bo_phim = t4.id_se_ri_phim join phan_vai as t3 on t5.id_bo_phim = t3.id_se_ri_phim join dien_vien as t2 on t3.id_dien_vien = t2.id_dien_vien where t2.ten = 'Tom Hanks'	imdb
select t3.tieu_de from dao_dien as t5 join dao_dien_boi as t2 on t5.id_dao_dien = t2.id_dao_dien join dao_dien_boi as t1 on t5.id_dao_dien = t1.id_dao_dien join bo_phim as t4 on t4.id_bo_phim = t2.id_se_ri_phim join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t4.tieu_de = 'Revolutionary Road'	imdb
select t3.tieu_de from the_loai as t2 join phan_loai as t1 on t2.id_the_loai = t1.id_the_loai join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim group by t3.tieu_de order by count ( distinct t2.the_loai ) desc limit 1	imdb
select t2.tieu_de from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join bo_phim as t2 on t2.id_bo_phim = t3.id_se_ri_phim where t1.quoc_tich = 'China' group by t2.tieu_de order by count ( distinct t1.ten ) desc limit 1	imdb
select t1.ten from phan_vai as t4 join dien_vien as t1 on t4.id_dien_vien = t1.id_dien_vien join bo_phim as t5 on t5.id_bo_phim = t4.id_se_ri_phim join dao_dien_boi as t2 on t5.id_bo_phim = t2.id_se_ri_phim join dao_dien as t3 on t3.id_dao_dien = t2.id_dao_dien where t3.ten = 'Quentin Tarantino' order by t5.nam_phat_hanh desc limit 1	imdb
select t3.ngan_sach , t3.tieu_de from dao_dien as t2 join dao_dien_boi as t1 on t2.id_dao_dien = t1.id_dao_dien join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t2.ten = 'Quentin Tarantino' order by t3.nam_phat_hanh desc limit 1	imdb
select t3.tieu_de from dao_dien as t2 join dao_dien_boi as t1 on t2.id_dao_dien = t1.id_dao_dien join bo_phim as t3 on t3.id_bo_phim = t1.id_se_ri_phim where t2.ten = 'Jim Jarmusch' order by t3.nam_phat_hanh desc limit 1	imdb
select t1.ten from dao_dien as t3 join dao_dien_boi as t2 on t3.id_dao_dien = t2.id_dao_dien join bo_phim as t4 on t4.id_bo_phim = t2.id_se_ri_phim join duoc_lam_boi as t5 on t4.id_bo_phim = t5.id_se_ri_phim join nha_san_xuat as t1 on t1.id_nha_san_xuat = t5.id_nha_san_xuat group by t1.ten order by count ( distinct t3.ten ) desc limit 1	imdb
select t1.ten from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien join bo_phim as t3 on t3.id_bo_phim = t2.id_se_ri_phim where t1.ten = 'Gabriele Ferzetti' order by t3.nam_phat_hanh desc limit 1	imdb
select chi_tiet_khach_hang from khach_hang order by chi_tiet_khach_hang	insurance_and_eClaims
select chi_tiet_khach_hang from khach_hang order by chi_tiet_khach_hang	insurance_and_eClaims
select ma_loai_chinh_sach from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.chi_tiet_khach_hang = 'Dayana Robel'	insurance_and_eClaims
select ma_loai_chinh_sach from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.chi_tiet_khach_hang = 'Dayana Robel'	insurance_and_eClaims
select ma_loai_chinh_sach from chinh_sach group by ma_loai_chinh_sach order by count ( * ) desc limit 1	insurance_and_eClaims
select ma_loai_chinh_sach from chinh_sach group by ma_loai_chinh_sach order by count ( * ) desc limit 1	insurance_and_eClaims
select ma_loai_chinh_sach from chinh_sach group by ma_loai_chinh_sach having count ( * ) > 2	insurance_and_eClaims
select ma_loai_chinh_sach from chinh_sach group by ma_loai_chinh_sach having count ( * ) > 2	insurance_and_eClaims
select sum ( so_tien_duoc_tra ) , avg ( so_tien_duoc_tra ) from tieu_de_cua_yeu_cau	insurance_and_eClaims
select sum ( so_tien_duoc_tra ) , avg ( so_tien_duoc_tra ) from tieu_de_cua_yeu_cau	insurance_and_eClaims
select sum ( t1.so_tien_duoc_yeu_cau ) from tieu_de_cua_yeu_cau as t1 join tai_lieu_cua_yeu_cau as t2 on t1.id_tieu_de_cua_yeu_cau = t2.id_yeu_cau where t2.ngay_tao_ra = ( select ngay_tao_ra from tai_lieu_cua_yeu_cau order by ngay_tao_ra limit 1 )	insurance_and_eClaims
select sum ( t1.so_tien_duoc_yeu_cau ) from tieu_de_cua_yeu_cau as t1 join tai_lieu_cua_yeu_cau as t2 on t1.id_tieu_de_cua_yeu_cau = t2.id_yeu_cau where t2.ngay_tao_ra = ( select ngay_tao_ra from tai_lieu_cua_yeu_cau order by ngay_tao_ra limit 1 )	insurance_and_eClaims
select t3.chi_tiet_khach_hang from tieu_de_cua_yeu_cau as t1 join chinh_sach as t2 on t1.id_chinh_sach = t2.id_chinh_sach join khach_hang as t3 on t2.id_khach_hang = t3.id_khach_hang where t1.so_tien_duoc_yeu_cau = ( select max ( so_tien_duoc_yeu_cau ) from tieu_de_cua_yeu_cau )	insurance_and_eClaims
select t3.chi_tiet_khach_hang from tieu_de_cua_yeu_cau as t1 join chinh_sach as t2 on t1.id_chinh_sach = t2.id_chinh_sach join khach_hang as t3 on t2.id_khach_hang = t3.id_khach_hang where t1.so_tien_duoc_yeu_cau = ( select max ( so_tien_duoc_yeu_cau ) from tieu_de_cua_yeu_cau )	insurance_and_eClaims
select t3.chi_tiet_khach_hang from tieu_de_cua_yeu_cau as t1 join chinh_sach as t2 on t1.id_chinh_sach = t2.id_chinh_sach join khach_hang as t3 on t2.id_khach_hang = t3.id_khach_hang where t1.so_tien_duoc_tra = ( select min ( so_tien_duoc_tra ) from tieu_de_cua_yeu_cau )	insurance_and_eClaims
select t3.chi_tiet_khach_hang from tieu_de_cua_yeu_cau as t1 join chinh_sach as t2 on t1.id_chinh_sach = t2.id_chinh_sach join khach_hang as t3 on t2.id_khach_hang = t3.id_khach_hang where t1.so_tien_duoc_tra = ( select min ( so_tien_duoc_tra ) from tieu_de_cua_yeu_cau )	insurance_and_eClaims
select chi_tiet_khach_hang from khach_hang except select t2.chi_tiet_khach_hang from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang	insurance_and_eClaims
select chi_tiet_khach_hang from khach_hang except select t2.chi_tiet_khach_hang from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang	insurance_and_eClaims
select count ( * ) from giai_doan_xu_ly_yeu_cau	insurance_and_eClaims
select count ( * ) from giai_doan_xu_ly_yeu_cau	insurance_and_eClaims
select t2.ten_tinh_trang_yeu_cau from xu_ly_yeu_cau as t1 join giai_doan_xu_ly_yeu_cau as t2 on t1.id_giai_doan_xu_ly_yeu_cau = t2.id_giai_doan_yeu_cau group by t1.id_giai_doan_xu_ly_yeu_cau order by count ( * ) desc limit 1	insurance_and_eClaims
select t2.ten_tinh_trang_yeu_cau from xu_ly_yeu_cau as t1 join giai_doan_xu_ly_yeu_cau as t2 on t1.id_giai_doan_xu_ly_yeu_cau = t2.id_giai_doan_yeu_cau group by t1.id_giai_doan_xu_ly_yeu_cau order by count ( * ) desc limit 1	insurance_and_eClaims
select chi_tiet_khach_hang from khach_hang where chi_tiet_khach_hang like '%Diana%'	insurance_and_eClaims
select chi_tiet_khach_hang from khach_hang where chi_tiet_khach_hang like '%Diana%'	insurance_and_eClaims
select distinct t2.chi_tiet_khach_hang from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ma_loai_chinh_sach = 'Deputy'	insurance_and_eClaims
select distinct t2.chi_tiet_khach_hang from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ma_loai_chinh_sach = 'Deputy'	insurance_and_eClaims
select distinct t2.chi_tiet_khach_hang from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ma_loai_chinh_sach = 'Deputy' or t1.ma_loai_chinh_sach = 'Uniform'	insurance_and_eClaims
select distinct t2.chi_tiet_khach_hang from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ma_loai_chinh_sach = 'Deputy' or t1.ma_loai_chinh_sach = 'Uniform'	insurance_and_eClaims
select chi_tiet_khach_hang from khach_hang union select chi_tiet_nhan_vien from nhan_vien	insurance_and_eClaims
select chi_tiet_khach_hang from khach_hang union select chi_tiet_nhan_vien from nhan_vien	insurance_and_eClaims
select ma_loai_chinh_sach , count ( * ) from chinh_sach group by ma_loai_chinh_sach	insurance_and_eClaims
select ma_loai_chinh_sach , count ( * ) from chinh_sach group by ma_loai_chinh_sach	insurance_and_eClaims
select t2.chi_tiet_khach_hang from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t2.chi_tiet_khach_hang order by count ( * ) desc limit 1	insurance_and_eClaims
select t2.chi_tiet_khach_hang from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t2.chi_tiet_khach_hang order by count ( * ) desc limit 1	insurance_and_eClaims
select mo_ta_ve_tinh_trang_yeu_cau from giai_doan_xu_ly_yeu_cau where ten_tinh_trang_yeu_cau = 'Open'	insurance_and_eClaims
select mo_ta_ve_tinh_trang_yeu_cau from giai_doan_xu_ly_yeu_cau where ten_tinh_trang_yeu_cau = 'Open'	insurance_and_eClaims
select count ( distinct ma_ket_qua_cua_yeu_cau ) from xu_ly_yeu_cau	insurance_and_eClaims
select count ( distinct ma_ket_qua_cua_yeu_cau ) from xu_ly_yeu_cau	insurance_and_eClaims
select t2.chi_tiet_khach_hang from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ngay_bat_dau = ( select max ( ngay_bat_dau ) from chinh_sach )	insurance_and_eClaims
select t2.chi_tiet_khach_hang from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ngay_bat_dau = ( select max ( ngay_bat_dau ) from chinh_sach )	insurance_and_eClaims
select t1.chi_tiet_su_kien from su_kien as t1 join dich_vu as t2 on t1.id_dich_vu = t2.id_dich_vu where t2.ma_loai_dich_vu = 'Marriage'	local_govt_in_alabama
select t1.id_su_kien , t1.chi_tiet_su_kien from su_kien as t1 join nguoi_tham_gia_su_kien as t2 on t1.id_su_kien = t2.id_su_kien group by t1.id_su_kien having count ( * ) > 1	local_govt_in_alabama
select t1.id_nguoi_tham_gia , t1.ma_loai_nguoi_tham_gia , count ( * ) from nguoi_tham_gia as t1 join nguoi_tham_gia_su_kien as t2 on t1.id_nguoi_tham_gia = t2.id_nguoi_tham_gia group by t1.id_nguoi_tham_gia	local_govt_in_alabama
select id_nguoi_tham_gia , ma_loai_nguoi_tham_gia , chi_tiet_nguoi_tham_gia from nguoi_tham_gia	local_govt_in_alabama
select count ( * ) from nguoi_tham_gia where ma_loai_nguoi_tham_gia = 'Organizer'	local_govt_in_alabama
select ma_loai_dich_vu from dich_vu order by ma_loai_dich_vu	local_govt_in_alabama
select id_dich_vu , chi_tiet_su_kien from su_kien	local_govt_in_alabama
select count ( * ) from nguoi_tham_gia as t1 join nguoi_tham_gia_su_kien as t2 on t1.id_nguoi_tham_gia = t2.id_nguoi_tham_gia where t1.chi_tiet_nguoi_tham_gia like '%Dr.%'	local_govt_in_alabama
select ma_loai_nguoi_tham_gia from nguoi_tham_gia group by ma_loai_nguoi_tham_gia order by count ( * ) desc limit 1	local_govt_in_alabama
select t3.id_dich_vu , t4.ma_loai_dich_vu from nguoi_tham_gia as t1 join nguoi_tham_gia_su_kien as t2 on t1.id_nguoi_tham_gia = t2.id_nguoi_tham_gia join su_kien as t3 on t2.id_su_kien = t3.id_su_kien join dich_vu as t4 on t3.id_dich_vu = t4.id_dich_vu group by t3.id_dich_vu order by count ( * ) asc limit 1	local_govt_in_alabama
select id_su_kien from nguoi_tham_gia_su_kien group by id_su_kien order by count ( * ) desc limit 1	local_govt_in_alabama
select id_su_kien from su_kien except select t1.id_su_kien from nguoi_tham_gia_su_kien as t1 join nguoi_tham_gia as t2 on t1.id_nguoi_tham_gia = t2.id_nguoi_tham_gia where chi_tiet_nguoi_tham_gia = 'Kenyatta Kuhn'	local_govt_in_alabama
select t1.ma_loai_dich_vu from dich_vu as t1 join su_kien as t2 on t1.id_dich_vu = t2.id_dich_vu where t2.chi_tiet_su_kien = 'Success' intersect select t1.ma_loai_dich_vu from dich_vu as t1 join su_kien as t2 on t1.id_dich_vu = t2.id_dich_vu where t2.chi_tiet_su_kien = 'Fail'	local_govt_in_alabama
select count ( * ) from su_kien where id_su_kien not in ( select id_su_kien from nguoi_tham_gia_su_kien )	local_govt_in_alabama
select count ( distinct id_nguoi_tham_gia ) from nguoi_tham_gia_su_kien	local_govt_in_alabama
select count ( * ) from ky_thuat_vien	machine_repair
select count ( * ) from ky_thuat_vien	machine_repair
select ten from ky_thuat_vien order by tuoi asc	machine_repair
select ten from ky_thuat_vien order by tuoi asc	machine_repair
select doi , nam_bat_dau from ky_thuat_vien	machine_repair
select doi , nam_bat_dau from ky_thuat_vien	machine_repair
select ten from ky_thuat_vien where doi != 'NYY'	machine_repair
select ten from ky_thuat_vien where doi != 'NYY'	machine_repair
select ten from ky_thuat_vien where tuoi = 36 or tuoi = 37	machine_repair
select ten from ky_thuat_vien where tuoi = 36 or tuoi = 37	machine_repair
select nam_bat_dau from ky_thuat_vien order by tuoi desc limit 1	machine_repair
select nam_bat_dau from ky_thuat_vien order by tuoi desc limit 1	machine_repair
select doi , count ( * ) from ky_thuat_vien group by doi	machine_repair
select doi , count ( * ) from ky_thuat_vien group by doi	machine_repair
select doi from ky_thuat_vien group by doi order by count ( * ) desc limit 1	machine_repair
select doi from ky_thuat_vien group by doi order by count ( * ) desc limit 1	machine_repair
select doi from ky_thuat_vien group by doi having count ( * ) >= 2	machine_repair
select doi from ky_thuat_vien group by doi having count ( * ) >= 2	machine_repair
select t3.ten , t2.loat_may from phan_cong_sua_chua as t1 join may_moc as t2 on t1.id_may = t2.id_may join ky_thuat_vien as t3 on t1.id_ky_thuat_vien = t3.id_ky_thuat_vien	machine_repair
select t3.ten , t2.loat_may from phan_cong_sua_chua as t1 join may_moc as t2 on t1.id_may = t2.id_may join ky_thuat_vien as t3 on t1.id_ky_thuat_vien = t3.id_ky_thuat_vien	machine_repair
select t3.ten from phan_cong_sua_chua as t1 join may_moc as t2 on t1.id_may = t2.id_may join ky_thuat_vien as t3 on t1.id_ky_thuat_vien = t3.id_ky_thuat_vien order by t2.xep_hang_chat_luong	machine_repair
select t3.ten from phan_cong_sua_chua as t1 join may_moc as t2 on t1.id_may = t2.id_may join ky_thuat_vien as t3 on t1.id_ky_thuat_vien = t3.id_ky_thuat_vien order by t2.xep_hang_chat_luong	machine_repair
select t3.ten from phan_cong_sua_chua as t1 join may_moc as t2 on t1.id_may = t2.id_may join ky_thuat_vien as t3 on t1.id_ky_thuat_vien = t3.id_ky_thuat_vien where t2.diem_gia_tri > 70	machine_repair
select t3.ten from phan_cong_sua_chua as t1 join may_moc as t2 on t1.id_may = t2.id_may join ky_thuat_vien as t3 on t1.id_ky_thuat_vien = t3.id_ky_thuat_vien where t2.diem_gia_tri > 70	machine_repair
select t2.ten , count ( * ) from phan_cong_sua_chua as t1 join ky_thuat_vien as t2 on t1.id_ky_thuat_vien = t2.id_ky_thuat_vien group by t2.ten	machine_repair
select t2.ten , count ( * ) from phan_cong_sua_chua as t1 join ky_thuat_vien as t2 on t1.id_ky_thuat_vien = t2.id_ky_thuat_vien group by t2.ten	machine_repair
select ten from ky_thuat_vien where id_ky_thuat_vien not in ( select id_ky_thuat_vien from phan_cong_sua_chua )	machine_repair
select ten from ky_thuat_vien where id_ky_thuat_vien not in ( select id_ky_thuat_vien from phan_cong_sua_chua )	machine_repair
select nam_bat_dau from ky_thuat_vien where doi = 'CLE' intersect select nam_bat_dau from ky_thuat_vien where doi = 'CWS'	machine_repair
select nam_bat_dau from ky_thuat_vien where doi = 'CLE' intersect select nam_bat_dau from ky_thuat_vien where doi = 'CWS'	machine_repair
select count ( * ) from ong_kinh_may_anh where do_dai_tieu_cu_theo_mm > 15	mountain_photos
select nhan_hieu , ten from ong_kinh_may_anh order by khau_do_toi_da desc	mountain_photos
select id , mau_sac , ten from anh	mountain_photos
select max ( chieu_cao ) , avg ( chieu_cao ) from nui	mountain_photos
select avg ( do_noi ) from nui where quoc_gia = 'Morocco'	mountain_photos
select ten , chieu_cao , do_noi from nui where day_nui != 'Aberdare Range'	mountain_photos
select t1.id , t1.ten from nui as t1 join anh as t2 on t1.id = t2.id_nui where t1.chieu_cao > 4000	mountain_photos
select t1.id , t1.ten from nui as t1 join anh as t2 on t1.id = t2.id_nui group by t1.id having count ( * ) >= 2	mountain_photos
select t2.ten from anh as t1 join ong_kinh_may_anh as t2 on t1.id_ong_kinh_may_anh = t2.id group by t2.id order by count ( * ) desc limit 1	mountain_photos
select t1.ten from ong_kinh_may_anh as t1 join anh as t2 on t2.id_ong_kinh_may_anh = t1.id where t1.nhan_hieu = 'Sigma' or t1.nhan_hieu = 'Olympus'	mountain_photos
select count ( distinct nhan_hieu ) from ong_kinh_may_anh	mountain_photos
select count ( * ) from ong_kinh_may_anh where id not in ( select id_ong_kinh_may_anh from anh )	mountain_photos
select count ( distinct t2.id_ong_kinh_may_anh ) from nui as t1 join anh as t2 on t1.id = t2.id_nui where t1.quoc_gia = 'Ethiopia'	mountain_photos
select t3.nhan_hieu from nui as t1 join anh as t2 on t1.id = t2.id_nui join ong_kinh_may_anh as t3 on t2.id_ong_kinh_may_anh = t3.id where t1.day_nui = 'Toubkal Atlas' intersect select t3.nhan_hieu from nui as t1 join anh as t2 on t1.id = t2.id_nui join ong_kinh_may_anh as t3 on t2.id_ong_kinh_may_anh = t3.id where t1.day_nui = 'Lasta Massif'	mountain_photos
select ten , do_noi from nui except select t1.ten , t1.do_noi from nui as t1 join anh as t2 on t1.id = t2.id_nui join ong_kinh_may_anh as t3 on t2.id_ong_kinh_may_anh = t3.id where t3.nhan_hieu = 'Sigma'	mountain_photos
select ten from ong_kinh_may_anh where ten like '%Digital%'	mountain_photos
select t1.ten , count ( * ) from ong_kinh_may_anh as t1 join anh as t2 on t1.id = t2.id_ong_kinh_may_anh group by t1.id order by count ( * )	mountain_photos
select count ( * ) from ban_nhac	music_2
select count ( * ) from ban_nhac	music_2
select distinct hang_thu_am from album	music_2
select distinct hang_thu_am from album	music_2
select * from album where nam = 2012	music_2
select * from album where nam = 2012	music_2
select distinct t1.vi_tri_tren_san_khau from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id where ten = 'Solveig'	music_2
select distinct t1.vi_tri_tren_san_khau from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id where ten = 'Solveig'	music_2
select count ( * ) from bai_hat	music_2
select count ( * ) from bai_hat	music_2
select t3.tieu_de from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t2.ho = 'Heilo'	music_2
select t3.tieu_de from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t2.ho = 'Heilo'	music_2
select count ( * ) from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t3.tieu_de = 'Flash'	music_2
select count ( * ) from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t3.tieu_de = 'Flash'	music_2
select t3.tieu_de from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t2.ten = 'Marianne'	music_2
select t3.tieu_de from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t2.ten = 'Marianne'	music_2
select t2.ten , t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t3.tieu_de = 'Badlands'	music_2
select t2.ten , t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t3.tieu_de = 'Badlands'	music_2
select t2.ten , t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t3.tieu_de = 'Badlands' and t1.vi_tri_tren_san_khau = 'back'	music_2
select t2.ten , t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t3.tieu_de = 'Badlands' and t1.vi_tri_tren_san_khau = 'back'	music_2
select count ( distinct hang_thu_am ) from album	music_2
select count ( distinct hang_thu_am ) from album	music_2
select hang_thu_am from album group by hang_thu_am order by count ( * ) desc limit 1	music_2
select hang_thu_am from album group by hang_thu_am order by count ( * ) desc limit 1	music_2
select t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat group by ho order by count ( * ) desc limit 1	music_2
select t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat group by ho order by count ( * ) desc limit 1	music_2
select t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id where vi_tri_tren_san_khau = 'back' group by ho order by count ( * ) desc limit 1	music_2
select t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id where vi_tri_tren_san_khau = 'back' group by ho order by count ( * ) desc limit 1	music_2
select tieu_de from bai_hat where tieu_de like '% the %'	music_2
select tieu_de from bai_hat where tieu_de like '% the %'	music_2
select distinct nhac_cu from nhac_cu	music_2
select distinct nhac_cu from nhac_cu	music_2
select t4.nhac_cu from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat join nhac_cu as t4 on t4.id_bai_hat = t3.id_bai_hat and t4.id_nghe_si_trong_ban_nhac = t2.id where t2.ho = 'Heilo' and t3.tieu_de = 'Le Pop'	music_2
select t4.nhac_cu from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat join nhac_cu as t4 on t4.id_bai_hat = t3.id_bai_hat and t4.id_nghe_si_trong_ban_nhac = t2.id where t2.ho = 'Heilo' and t3.tieu_de = 'Le Pop'	music_2
select nhac_cu from nhac_cu group by nhac_cu order by count ( * ) desc limit 1	music_2
select nhac_cu from nhac_cu group by nhac_cu order by count ( * ) desc limit 1	music_2
select count ( * ) from nhac_cu where nhac_cu = 'drums'	music_2
select count ( * ) from nhac_cu where nhac_cu = 'drums'	music_2
select nhac_cu from nhac_cu as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where tieu_de = 'Le Pop'	music_2
select nhac_cu from nhac_cu as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where tieu_de = 'Le Pop'	music_2
select count ( distinct nhac_cu ) from nhac_cu as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where tieu_de = 'Le Pop'	music_2
select count ( distinct nhac_cu ) from nhac_cu as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where tieu_de = 'Le Pop'	music_2
select count ( distinct nhac_cu ) from nhac_cu as t1 join ban_nhac as t2 on t1.id_nghe_si_trong_ban_nhac = t2.id where t2.ho = 'Heilo'	music_2
select count ( distinct nhac_cu ) from nhac_cu as t1 join ban_nhac as t2 on t1.id_nghe_si_trong_ban_nhac = t2.id where t2.ho = 'Heilo'	music_2
select nhac_cu from nhac_cu as t1 join ban_nhac as t2 on t1.id_nghe_si_trong_ban_nhac = t2.id where t2.ho = 'Heilo'	music_2
select nhac_cu from nhac_cu as t1 join ban_nhac as t2 on t1.id_nghe_si_trong_ban_nhac = t2.id where t2.ho = 'Heilo'	music_2
select tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat group by t1.id_bai_hat order by count ( * ) desc limit 1	music_2
select tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat group by t1.id_bai_hat order by count ( * ) desc limit 1	music_2
select loai from giong_hat group by loai order by count ( * ) desc limit 1	music_2
select loai from giong_hat group by loai order by count ( * ) desc limit 1	music_2
select loai from giong_hat as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id where ho = 'Heilo' group by loai order by count ( * ) desc limit 1	music_2
select loai from giong_hat as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id where ho = 'Heilo' group by loai order by count ( * ) desc limit 1	music_2
select loai from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where tieu_de = 'Le Pop'	music_2
select loai from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where tieu_de = 'Le Pop'	music_2
select count ( * ) from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where tieu_de = 'Demon Kitty Rag'	music_2
select count ( * ) from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where tieu_de = 'Demon Kitty Rag'	music_2
select count ( distinct tieu_de ) from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where loai = 'lead'	music_2
select count ( distinct tieu_de ) from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where loai = 'lead'	music_2
select loai from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat join ban_nhac as t3 on t1.nghe_si_trong_ban_nhac = t3.id where t3.ten = 'Solveig' and t2.tieu_de = 'A Bar In Amsterdam'	music_2
select loai from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat join ban_nhac as t3 on t1.nghe_si_trong_ban_nhac = t3.id where t3.ten = 'Solveig' and t2.tieu_de = 'A Bar In Amsterdam'	music_2
select distinct tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat except select t2.tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where loai = 'lead'	music_2
select distinct tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat except select t2.tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where loai = 'lead'	music_2
select distinct loai from giong_hat	music_2
select distinct loai from giong_hat	music_2
select * from album where nam = 2010	music_2
select * from album where nam = 2010	music_2
select t2.ten , t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t3.tieu_de = 'Le Pop'	music_2
select t2.ten , t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t3.tieu_de = 'Le Pop'	music_2
select t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat group by ho order by count ( * ) desc limit 1	music_2
select t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat group by ho order by count ( * ) desc limit 1	music_2
select t4.nhac_cu from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat join nhac_cu as t4 on t4.id_bai_hat = t3.id_bai_hat and t4.id_nghe_si_trong_ban_nhac = t2.id where t2.ho = 'Heilo' and t3.tieu_de = 'Badlands'	music_2
select t4.nhac_cu from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat join nhac_cu as t4 on t4.id_bai_hat = t3.id_bai_hat and t4.id_nghe_si_trong_ban_nhac = t2.id where t2.ho = 'Heilo' and t3.tieu_de = 'Badlands'	music_2
select count ( distinct nhac_cu ) from nhac_cu as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where tieu_de = 'Badlands'	music_2
select count ( distinct nhac_cu ) from nhac_cu as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where tieu_de = 'Badlands'	music_2
select loai from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where tieu_de = 'Badlands'	music_2
select loai from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where tieu_de = 'Badlands'	music_2
select count ( * ) from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where tieu_de = 'Le Pop'	music_2
select count ( * ) from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where tieu_de = 'Le Pop'	music_2
select count ( distinct tieu_de ) from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where loai = 'shared'	music_2
select count ( distinct tieu_de ) from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where loai = 'shared'	music_2
select distinct tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat except select t2.tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where loai = 'back'	music_2
select distinct tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat except select t2.tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where loai = 'back'	music_2
select loai from giong_hat as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id where ten = 'Solveig' group by loai order by count ( * ) desc limit 1	music_2
select loai from giong_hat as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id where ten = 'Solveig' group by loai order by count ( * ) desc limit 1	music_2
select loai from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat join ban_nhac as t3 on t1.nghe_si_trong_ban_nhac = t3.id where t3.ho = 'Heilo' and t2.tieu_de = 'Der Kapitan'	music_2
select loai from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat join ban_nhac as t3 on t1.nghe_si_trong_ban_nhac = t3.id where t3.ho = 'Heilo' and t2.tieu_de = 'Der Kapitan'	music_2
select t2.ten from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat group by ten order by count ( * ) desc limit 1	music_2
select t2.ten from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat group by ten order by count ( * ) desc limit 1	music_2
select loai from giong_hat as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id where ten = 'Marianne' group by loai order by count ( * ) desc limit 1	music_2
select loai from giong_hat as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id where ten = 'Marianne' group by loai order by count ( * ) desc limit 1	music_2
select t2.ten , t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t3.tieu_de = 'Der Kapitan' and t1.vi_tri_tren_san_khau = 'back'	music_2
select t2.ten , t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t3.tieu_de = 'Der Kapitan' and t1.vi_tri_tren_san_khau = 'back'	music_2
select distinct tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat except select t2.tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where loai = 'back'	music_2
select distinct tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat except select t2.tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where loai = 'back'	music_2
select t3.tieu_de from album as t1 join danh_sach_bai_hat as t2 on t1.id_album = t2.id_album join bai_hat as t3 on t2.id_bai_hat = t3.id_bai_hat where t1.tieu_de = 'A Kiss Before You Go: Live in Hamburg'	music_2
select t3.tieu_de from album as t1 join danh_sach_bai_hat as t2 on t1.id_album = t2.id_album join bai_hat as t3 on t2.id_bai_hat = t3.id_bai_hat where t1.tieu_de = 'A Kiss Before You Go: Live in Hamburg'	music_2
select t3.tieu_de from album as t1 join danh_sach_bai_hat as t2 on t1.id_album = t2.id_album join bai_hat as t3 on t2.id_bai_hat = t3.id_bai_hat where t1.hang_thu_am = 'Universal Music Group'	music_2
select t3.tieu_de from album as t1 join danh_sach_bai_hat as t2 on t1.id_album = t2.id_album join bai_hat as t3 on t2.id_bai_hat = t3.id_bai_hat where t1.hang_thu_am = 'Universal Music Group'	music_2
select count ( distinct t3.tieu_de ) from album as t1 join danh_sach_bai_hat as t2 on t1.id_album = t2.id_album join bai_hat as t3 on t2.id_bai_hat = t3.id_bai_hat where t1.loai = 'Studio'	music_2
select count ( distinct t3.tieu_de ) from album as t1 join danh_sach_bai_hat as t2 on t1.id_album = t2.id_album join bai_hat as t3 on t2.id_bai_hat = t3.id_bai_hat where t1.loai = 'Studio'	music_2
select t1.khach_hang_tot_hay_xau from khach_hang as t1 join phieu_giam_gia as t2 on t1.id_phieu_giam_gia = t2.id_phieu_giam_gia where t2.so_tien_giam_gia = 500	products_for_hire
select t1.id_khach_hang , t1.ten , count ( * ) from khach_hang as t1 join luot_dat_mua as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang	products_for_hire
select id_khach_hang , sum ( so_tien_da_tra ) from thanh_toan group by id_khach_hang order by sum ( so_tien_da_tra ) desc limit 1	products_for_hire
select t1.id_dat_mua , t1.so_tien_hoan_tra from luot_dat_mua as t1 join thanh_toan as t2 on t1.id_dat_mua = t2.id_dat_mua group by t1.id_dat_mua order by count ( * ) desc limit 1	products_for_hire
select id_san_pham from san_pham_duoc_dat group by id_san_pham having count ( * ) = 3	products_for_hire
select t2.mo_ta_san_pham from san_pham_duoc_dat as t1 join san_pham_cho_thue as t2 on t1.id_san_pham = t2.id_san_pham where t1.so_tien_da_dat = 102.76	products_for_hire
select t3.ngay_bat_dau_dat_mua , t3.ngay_ket_thuc_dat_mua from san_pham_cho_thue as t1 join san_pham_duoc_dat as t2 on t1.id_san_pham = t2.id_san_pham join luot_dat_mua as t3 on t2.id_dat_mua = t3.id_dat_mua where t1.ten_san_pham = 'Book collection A'	products_for_hire
select t2.ten_san_pham from san_pham_co_san as t1 join san_pham_cho_thue as t2 on t1.id_san_pham = t2.id_san_pham where t1.co_san_hay_khong = 1	products_for_hire
select count ( distinct ma_loai_san_pham ) from san_pham_cho_thue	products_for_hire
select ten , ho , gioi_tinh from khach_hang where khach_hang_tot_hay_xau = 'good' order by ho	products_for_hire
select avg ( so_tien_no ) from thanh_toan	products_for_hire
select max ( so_luong_dat_mua ) , min ( so_luong_dat_mua ) , avg ( so_luong_dat_mua ) from san_pham_duoc_dat	products_for_hire
select distinct ma_loai_thanh_toan from thanh_toan	products_for_hire
select chi_phi_thue_hang_ngay from san_pham_cho_thue where ten_san_pham like '%Book%'	products_for_hire
select count ( * ) from san_pham_cho_thue where id_san_pham not in ( select id_san_pham from san_pham_duoc_dat where so_tien_da_dat > 200 )	products_for_hire
select t1.so_tien_giam_gia from phieu_giam_gia as t1 join khach_hang as t2 on t1.id_phieu_giam_gia = t2.id_phieu_giam_gia where t2.khach_hang_tot_hay_xau = 'good' intersect select t1.so_tien_giam_gia from phieu_giam_gia as t1 join khach_hang as t2 on t1.id_phieu_giam_gia = t2.id_phieu_giam_gia where t2.khach_hang_tot_hay_xau = 'bad'	products_for_hire
select ngay_thanh_toan from thanh_toan where so_tien_da_tra > 300 or ma_loai_thanh_toan = 'Check'	products_for_hire
select ten_san_pham , mo_ta_san_pham from san_pham_cho_thue where ma_loai_san_pham = 'Cutlery' and chi_phi_thue_hang_ngay < 20	products_for_hire
select ten_nha_hang from nha_hang	restaurant_1
select dia_chi from nha_hang where ten_nha_hang = 'Subway'	restaurant_1
select danh_gia_xep_hang from nha_hang where ten_nha_hang = 'Subway'	restaurant_1
select ten_loai_nha_hang from loai_nha_hang	restaurant_1
select mo_ta_ve_loai_nha_hang from loai_nha_hang where ten_loai_nha_hang = 'Sandwich'	restaurant_1
select ten_nha_hang , danh_gia_xep_hang from nha_hang order by danh_gia_xep_hang desc limit 1	restaurant_1
select tuoi from sinh_vien where ten = 'Linda' and ho = 'Smith'	restaurant_1
select gioi_tinh from sinh_vien where ten = 'Linda' and ho = 'Smith'	restaurant_1
select ten , ho from sinh_vien where chuyen_nganh = 600	restaurant_1
select ma_thanh_pho from sinh_vien where ten = 'Linda' and ho = 'Smith'	restaurant_1
select count ( * ) from sinh_vien where co_van = 1121	restaurant_1
select co_van , count ( * ) from sinh_vien group by co_van order by count ( co_van ) desc limit 1	restaurant_1
select chuyen_nganh , count ( * ) from sinh_vien group by chuyen_nganh order by count ( chuyen_nganh ) asc limit 1	restaurant_1
select chuyen_nganh , count ( * ) from sinh_vien group by chuyen_nganh having count ( chuyen_nganh ) between 2 and 30	restaurant_1
select ten , ho from sinh_vien where tuoi > 18 and chuyen_nganh = 600	restaurant_1
select ten , ho from sinh_vien where tuoi > 18 and chuyen_nganh != 600 and gioi_tinh = 'F'	restaurant_1
select count ( * ) from nha_hang join loai_cua_nha_hang on nha_hang.id_nha_hang = loai_cua_nha_hang.id_nha_hang join loai_nha_hang on loai_cua_nha_hang.id_loai_nha_hang = loai_nha_hang.id_loai_nha_hang group by loai_cua_nha_hang.id_loai_nha_hang having loai_nha_hang.ten_loai_nha_hang = 'Sandwich'	restaurant_1
select sum ( thoi_gian_danh_ra ) from sinh_vien join luot_ghe_tham_nha_hang on sinh_vien.id_sinh_vien = luot_ghe_tham_nha_hang.id_sinh_vien where sinh_vien.ten = 'Linda' and sinh_vien.ho = 'Smith'	restaurant_1
select count ( * ) from sinh_vien join luot_ghe_tham_nha_hang on sinh_vien.id_sinh_vien = luot_ghe_tham_nha_hang.id_sinh_vien join nha_hang on luot_ghe_tham_nha_hang.id_nha_hang = nha_hang.id_nha_hang where sinh_vien.ten = 'Linda' and sinh_vien.ho = 'Smith' and nha_hang.ten_nha_hang = 'Subway'	restaurant_1
select thoi_gian from sinh_vien join luot_ghe_tham_nha_hang on sinh_vien.id_sinh_vien = luot_ghe_tham_nha_hang.id_sinh_vien join nha_hang on luot_ghe_tham_nha_hang.id_nha_hang = nha_hang.id_nha_hang where sinh_vien.ten = 'Linda' and sinh_vien.ho = 'Smith' and nha_hang.ten_nha_hang = 'Subway'	restaurant_1
select nha_hang.ten_nha_hang , sum ( luot_ghe_tham_nha_hang.thoi_gian_danh_ra ) from luot_ghe_tham_nha_hang join nha_hang on luot_ghe_tham_nha_hang.id_nha_hang = nha_hang.id_nha_hang group by nha_hang.id_nha_hang order by sum ( luot_ghe_tham_nha_hang.thoi_gian_danh_ra ) asc limit 1	restaurant_1
select sinh_vien.ten , sinh_vien.ho from sinh_vien join luot_ghe_tham_nha_hang on sinh_vien.id_sinh_vien = luot_ghe_tham_nha_hang.id_sinh_vien group by sinh_vien.id_sinh_vien order by count ( * ) desc limit 1	restaurant_1
select count ( distinct ho ) from dien_vien	sakila_1
select count ( distinct ho ) from dien_vien	sakila_1
select ten from dien_vien group by ten order by count ( * ) desc limit 1	sakila_1
select ten from dien_vien group by ten order by count ( * ) desc limit 1	sakila_1
select ten , ho from dien_vien group by ten , ho order by count ( * ) desc limit 1	sakila_1
select ten , ho from dien_vien group by ten , ho order by count ( * ) desc limit 1	sakila_1
select quan from dia_chi group by quan having count ( * ) >= 2	sakila_1
select quan from dia_chi group by quan having count ( * ) >= 2	sakila_1
select so_dien_thoai , ma_buu_dien from dia_chi where dia_chi = '1031 Daugavpils Parkway'	sakila_1
select so_dien_thoai , ma_buu_dien from dia_chi where dia_chi = '1031 Daugavpils Parkway'	sakila_1
select t2.thanh_pho , count ( * ) , t1.id_thanh_pho from dia_chi as t1 join thanh_pho as t2 on t1.id_thanh_pho = t2.id_thanh_pho group by t1.id_thanh_pho order by count ( * ) desc limit 1	sakila_1
select t2.thanh_pho , count ( * ) , t1.id_thanh_pho from dia_chi as t1 join thanh_pho as t2 on t1.id_thanh_pho = t2.id_thanh_pho group by t1.id_thanh_pho order by count ( * ) desc limit 1	sakila_1
select count ( * ) from dia_chi where quan = 'California'	sakila_1
select count ( * ) from dia_chi where quan = 'California'	sakila_1
select tieu_de , id_phim from phim where gia_cho_thue = 0.99 intersect select t1.tieu_de , t1.id_phim from phim as t1 join hang_ton_kho as t2 on t1.id_phim = t2.id_phim group by t1.id_phim having count ( * ) < 3	sakila_1
select tieu_de , id_phim from phim where gia_cho_thue = 0.99 intersect select t1.tieu_de , t1.id_phim from phim as t1 join hang_ton_kho as t2 on t1.id_phim = t2.id_phim group by t1.id_phim having count ( * ) < 3	sakila_1
select count ( * ) from thanh_pho as t1 join quoc_gia as t2 on t1.id_quoc_gia = t2.id_quoc_gia where t2.quoc_gia = 'Australia'	sakila_1
select count ( * ) from thanh_pho as t1 join quoc_gia as t2 on t1.id_quoc_gia = t2.id_quoc_gia where t2.quoc_gia = 'Australia'	sakila_1
select t2.quoc_gia from thanh_pho as t1 join quoc_gia as t2 on t1.id_quoc_gia = t2.id_quoc_gia group by t2.id_quoc_gia having count ( * ) >= 3	sakila_1
select t2.quoc_gia from thanh_pho as t1 join quoc_gia as t2 on t1.id_quoc_gia = t2.id_quoc_gia group by t2.id_quoc_gia having count ( * ) >= 3	sakila_1
select ngay_thanh_toan from khoan_thanh_toan where so_tien > 10 union select t1.ngay_thanh_toan from khoan_thanh_toan as t1 join nhan_vien as t2 on t1.id_nhan_vien = t2.id_nhan_vien where t2.ten = 'Elsa'	sakila_1
select ngay_thanh_toan from khoan_thanh_toan where so_tien > 10 union select t1.ngay_thanh_toan from khoan_thanh_toan as t1 join nhan_vien as t2 on t1.id_nhan_vien = t2.id_nhan_vien where t2.ten = 'Elsa'	sakila_1
select count ( * ) from khach_hang where co_hoat_dong_khong = '1'	sakila_1
select count ( * ) from khach_hang where co_hoat_dong_khong = '1'	sakila_1
select tieu_de , gia_cho_thue from phim order by gia_cho_thue desc limit 1	sakila_1
select tieu_de , gia_cho_thue from phim order by gia_cho_thue desc limit 1	sakila_1
select t2.tieu_de , t2.id_phim , t2.mo_ta from dien_vien_dien_anh as t1 join phim as t2 on t1.id_phim = t2.id_phim group by t2.id_phim order by count ( * ) desc limit 1	sakila_1
select t2.tieu_de , t2.id_phim , t2.mo_ta from dien_vien_dien_anh as t1 join phim as t2 on t1.id_phim = t2.id_phim group by t2.id_phim order by count ( * ) desc limit 1	sakila_1
select t2.ten , t2.ho , t2.id_dien_vien from dien_vien_dien_anh as t1 join dien_vien as t2 on t1.id_dien_vien = t2.id_dien_vien group by t2.id_dien_vien order by count ( * ) desc limit 1	sakila_1
select t2.ten , t2.ho , t2.id_dien_vien from dien_vien_dien_anh as t1 join dien_vien as t2 on t1.id_dien_vien = t2.id_dien_vien group by t2.id_dien_vien order by count ( * ) desc limit 1	sakila_1
select t2.ten , t2.ho from dien_vien_dien_anh as t1 join dien_vien as t2 on t1.id_dien_vien = t2.id_dien_vien group by t2.id_dien_vien having count ( * ) > 30	sakila_1
select t2.ten , t2.ho from dien_vien_dien_anh as t1 join dien_vien as t2 on t1.id_dien_vien = t2.id_dien_vien group by t2.id_dien_vien having count ( * ) > 30	sakila_1
select id_cua_hang from hang_ton_kho group by id_cua_hang order by count ( * ) desc limit 1	sakila_1
select id_cua_hang from hang_ton_kho group by id_cua_hang order by count ( * ) desc limit 1	sakila_1
select sum ( so_tien ) from khoan_thanh_toan	sakila_1
select sum ( so_tien ) from khoan_thanh_toan	sakila_1
select t1.ten , t1.ho , t1.id_khach_hang from khach_hang as t1 join khoan_thanh_toan as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang order by sum ( so_tien ) asc limit 1	sakila_1
select t1.ten , t1.ho , t1.id_khach_hang from khach_hang as t1 join khoan_thanh_toan as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang order by sum ( so_tien ) asc limit 1	sakila_1
select t1.ten from danh_muc as t1 join danh_muc_phim as t2 on t1.id_danh_muc = t2.id_danh_muc join phim as t3 on t2.id_phim = t3.id_phim where t3.tieu_de = 'HUNGER ROOF'	sakila_1
select t1.ten from danh_muc as t1 join danh_muc_phim as t2 on t1.id_danh_muc = t2.id_danh_muc join phim as t3 on t2.id_phim = t3.id_phim where t3.tieu_de = 'HUNGER ROOF'	sakila_1
select t2.ten , t1.id_danh_muc , count ( * ) from danh_muc_phim as t1 join danh_muc as t2 on t1.id_danh_muc = t2.id_danh_muc group by t1.id_danh_muc	sakila_1
select t2.ten , t1.id_danh_muc , count ( * ) from danh_muc_phim as t1 join danh_muc as t2 on t1.id_danh_muc = t2.id_danh_muc group by t1.id_danh_muc	sakila_1
select t1.tieu_de , t1.id_phim from phim as t1 join hang_ton_kho as t2 on t1.id_phim = t2.id_phim group by t1.id_phim order by count ( * ) desc limit 1	sakila_1
select t1.tieu_de , t1.id_phim from phim as t1 join hang_ton_kho as t2 on t1.id_phim = t2.id_phim group by t1.id_phim order by count ( * ) desc limit 1	sakila_1
select t1.tieu_de , t2.id_hang_ton_kho from phim as t1 join hang_ton_kho as t2 on t1.id_phim = t2.id_phim join luot_cho_thue as t3 on t2.id_hang_ton_kho = t3.id_hang_ton_kho group by t2.id_hang_ton_kho order by count ( * ) desc limit 1	sakila_1
select t1.tieu_de , t2.id_hang_ton_kho from phim as t1 join hang_ton_kho as t2 on t1.id_phim = t2.id_phim join luot_cho_thue as t3 on t2.id_hang_ton_kho = t3.id_hang_ton_kho group by t2.id_hang_ton_kho order by count ( * ) desc limit 1	sakila_1
select count ( distinct id_ngon_ngu ) from phim	sakila_1
select count ( distinct id_ngon_ngu ) from phim	sakila_1
select tieu_de from phim where danh_gia_xep_hang = 'R'	sakila_1
select tieu_de from phim where danh_gia_xep_hang = 'R'	sakila_1
select t2.dia_chi from cua_hang as t1 join dia_chi as t2 on t1.id_dia_chi = t2.id_dia_chi where id_cua_hang = 1	sakila_1
select t2.dia_chi from cua_hang as t1 join dia_chi as t2 on t1.id_dia_chi = t2.id_dia_chi where id_cua_hang = 1	sakila_1
select t1.ten , t1.ho , t1.id_nhan_vien from nhan_vien as t1 join khoan_thanh_toan as t2 on t1.id_nhan_vien = t2.id_nhan_vien group by t1.id_nhan_vien order by count ( * ) asc limit 1	sakila_1
select t1.ten , t1.ho , t1.id_nhan_vien from nhan_vien as t1 join khoan_thanh_toan as t2 on t1.id_nhan_vien = t2.id_nhan_vien group by t1.id_nhan_vien order by count ( * ) asc limit 1	sakila_1
select t2.ten from phim as t1 join ngon_ngu as t2 on t1.id_ngon_ngu = t2.id_ngon_ngu where t1.tieu_de = 'AIRPORT POLLOCK'	sakila_1
select t2.ten from phim as t1 join ngon_ngu as t2 on t1.id_ngon_ngu = t2.id_ngon_ngu where t1.tieu_de = 'AIRPORT POLLOCK'	sakila_1
select count ( * ) from cua_hang	sakila_1
select count ( * ) from cua_hang	sakila_1
select count ( distinct danh_gia_xep_hang ) from phim	sakila_1
select count ( distinct danh_gia_xep_hang ) from phim	sakila_1
select tieu_de from phim where tinh_nang_dac_biet like '%Deleted Scenes%'	sakila_1
select tieu_de from phim where tinh_nang_dac_biet like '%Deleted Scenes%'	sakila_1
select count ( * ) from hang_ton_kho where id_cua_hang = 1	sakila_1
select count ( * ) from hang_ton_kho where id_cua_hang = 1	sakila_1
select ngay_thanh_toan from khoan_thanh_toan order by ngay_thanh_toan asc limit 1	sakila_1
select ngay_thanh_toan from khoan_thanh_toan order by ngay_thanh_toan asc limit 1	sakila_1
select t2.dia_chi , t1.email from khach_hang as t1 join dia_chi as t2 on t2.id_dia_chi = t1.id_dia_chi where t1.ten = 'LINDA'	sakila_1
select t2.dia_chi , t1.email from khach_hang as t1 join dia_chi as t2 on t2.id_dia_chi = t1.id_dia_chi where t1.ten = 'LINDA'	sakila_1
select tieu_de from phim where thoi_luong_phim > 100 or danh_gia_xep_hang = 'PG' except select tieu_de from phim where gia_thay_the > 200	sakila_1
select tieu_de from phim where thoi_luong_phim > 100 or danh_gia_xep_hang = 'PG' except select tieu_de from phim where gia_thay_the > 200	sakila_1
select t1.ten , t1.ho from khach_hang as t1 join luot_cho_thue as t2 on t1.id_khach_hang = t2.id_khach_hang order by t2.ngay_cho_thue asc limit 1	sakila_1
select t1.ten , t1.ho from khach_hang as t1 join luot_cho_thue as t2 on t1.id_khach_hang = t2.id_khach_hang order by t2.ngay_cho_thue asc limit 1	sakila_1
select distinct t1.ten , t1.ho from nhan_vien as t1 join luot_cho_thue as t2 on t1.id_nhan_vien = t2.id_nhan_vien join khach_hang as t3 on t2.id_khach_hang = t3.id_khach_hang where t3.ten = 'APRIL' and t3.ho = 'BURNS'	sakila_1
select distinct t1.ten , t1.ho from nhan_vien as t1 join luot_cho_thue as t2 on t1.id_nhan_vien = t2.id_nhan_vien join khach_hang as t3 on t2.id_khach_hang = t3.id_khach_hang where t3.ten = 'APRIL' and t3.ho = 'BURNS'	sakila_1
select id_cua_hang from khach_hang group by id_cua_hang order by count ( * ) desc limit 1	sakila_1
select id_cua_hang from khach_hang group by id_cua_hang order by count ( * ) desc limit 1	sakila_1
select so_tien from khoan_thanh_toan order by so_tien desc limit 1	sakila_1
select so_tien from khoan_thanh_toan order by so_tien desc limit 1	sakila_1
select t2.dia_chi from nhan_vien as t1 join dia_chi as t2 on t1.id_dia_chi = t2.id_dia_chi where t1.ten = 'Elsa'	sakila_1
select t2.dia_chi from nhan_vien as t1 join dia_chi as t2 on t1.id_dia_chi = t2.id_dia_chi where t1.ten = 'Elsa'	sakila_1
select ten from khach_hang where id_khach_hang not in ( select id_khach_hang from luot_cho_thue where ngay_cho_thue > '2005-08-23 02:06:01' )	sakila_1
select ten from khach_hang where id_khach_hang not in ( select id_khach_hang from luot_cho_thue where ngay_cho_thue > '2005-08-23 02:06:01' )	sakila_1
select count ( * ) from tai_xe	school_bus
select ten , thanh_pho_que_huong , tuoi from tai_xe	school_bus
select dang , count ( * ) from tai_xe group by dang	school_bus
select ten from tai_xe order by tuoi desc	school_bus
select distinct thanh_pho_que_huong from tai_xe	school_bus
select thanh_pho_que_huong from tai_xe group by thanh_pho_que_huong order by count ( * ) desc limit 1	school_bus
select dang from tai_xe where thanh_pho_que_huong = 'Hartford' and tuoi > 40	school_bus
select thanh_pho_que_huong from tai_xe where tuoi > 40 group by thanh_pho_que_huong having count ( * ) >= 2	school_bus
select thanh_pho_que_huong from tai_xe except select thanh_pho_que_huong from tai_xe where tuoi > 40	school_bus
select ten from tai_xe where id_tai_xe not in ( select id_tai_xe from xe_buyt_cua_truong_hoc )	school_bus
select loai_hinh from truong_hoc group by loai_hinh having count ( * ) = 2	school_bus
select t2.truong_hoc , t3.ten from xe_buyt_cua_truong_hoc as t1 join truong_hoc as t2 on t1.id_truong_hoc = t2.id_truong_hoc join tai_xe as t3 on t1.id_tai_xe = t3.id_tai_xe	school_bus
select max ( so_nam_lam_viec ) , min ( so_nam_lam_viec ) , avg ( so_nam_lam_viec ) from xe_buyt_cua_truong_hoc	school_bus
select truong_hoc , loai_hinh from truong_hoc where id_truong_hoc not in ( select id_truong_hoc from xe_buyt_cua_truong_hoc )	school_bus
select t2.loai_hinh , count ( * ) from xe_buyt_cua_truong_hoc as t1 join truong_hoc as t2 on t1.id_truong_hoc = t2.id_truong_hoc group by t2.loai_hinh	school_bus
select count ( * ) from tai_xe where thanh_pho_que_huong = 'Hartford' or tuoi < 40	school_bus
select ten from tai_xe where thanh_pho_que_huong = 'Hartford' and tuoi < 40	school_bus
select t1.ten from tai_xe as t1 join xe_buyt_cua_truong_hoc as t2 on t1.id_tai_xe = t2.id_tai_xe order by so_nam_lam_viec desc limit 1	school_bus
select count ( * ) from truong_hoc	school_player
select count ( * ) from truong_hoc	school_player
select dia_diem from truong_hoc order by so_luong_nhap_hoc asc	school_player
select dia_diem from truong_hoc order by so_luong_nhap_hoc asc	school_player
select dia_diem from truong_hoc order by nam_thanh_lap desc	school_player
select dia_diem from truong_hoc order by nam_thanh_lap desc	school_player
select so_luong_nhap_hoc from truong_hoc where ton_giao != 'Catholic'	school_player
select so_luong_nhap_hoc from truong_hoc where ton_giao != 'Catholic'	school_player
select avg ( so_luong_nhap_hoc ) from truong_hoc	school_player
select avg ( so_luong_nhap_hoc ) from truong_hoc	school_player
select doi from cau_thu order by doi asc	school_player
select doi from cau_thu order by doi asc	school_player
select count ( distinct vi_tri ) from cau_thu	school_player
select count ( distinct vi_tri ) from cau_thu	school_player
select doi from cau_thu order by tuoi desc limit 1	school_player
select doi from cau_thu order by tuoi desc limit 1	school_player
select doi from cau_thu order by tuoi desc limit 5	school_player
select doi from cau_thu order by tuoi desc limit 5	school_player
select t1.doi , t2.dia_diem from cau_thu as t1 join truong_hoc as t2 on t1.id_truong = t2.id_truong	school_player
select t1.doi , t2.dia_diem from cau_thu as t1 join truong_hoc as t2 on t1.id_truong = t2.id_truong	school_player
select t2.dia_diem from cau_thu as t1 join truong_hoc as t2 on t1.id_truong = t2.id_truong group by t1.id_truong having count ( * ) > 1	school_player
select t2.dia_diem from cau_thu as t1 join truong_hoc as t2 on t1.id_truong = t2.id_truong group by t1.id_truong having count ( * ) > 1	school_player
select t2.ton_giao from cau_thu as t1 join truong_hoc as t2 on t1.id_truong = t2.id_truong group by t1.id_truong order by count ( * ) desc limit 1	school_player
select t2.ton_giao from cau_thu as t1 join truong_hoc as t2 on t1.id_truong = t2.id_truong group by t1.id_truong order by count ( * ) desc limit 1	school_player
select t1.dia_diem , t2.biet_danh from truong_hoc as t1 join chi_tiet_truong_hoc as t2 on t1.id_truong = t2.id_truong	school_player
select t1.dia_diem , t2.biet_danh from truong_hoc as t1 join chi_tiet_truong_hoc as t2 on t1.id_truong = t2.id_truong	school_player
select ton_giao , count ( * ) from truong_hoc group by ton_giao	school_player
select ton_giao , count ( * ) from truong_hoc group by ton_giao	school_player
select ton_giao , count ( * ) from truong_hoc group by ton_giao order by count ( * ) desc	school_player
select ton_giao , count ( * ) from truong_hoc group by ton_giao order by count ( * ) desc	school_player
select mau_cua_truong from truong_hoc order by so_luong_nhap_hoc desc limit 1	school_player
select mau_cua_truong from truong_hoc order by so_luong_nhap_hoc desc limit 1	school_player
select dia_diem from truong_hoc where id_truong not in ( select id_truong from cau_thu )	school_player
select dia_diem from truong_hoc where id_truong not in ( select id_truong from cau_thu )	school_player
select ton_giao from truong_hoc where nam_thanh_lap < 1890 intersect select ton_giao from truong_hoc where nam_thanh_lap > 1900	school_player
select ton_giao from truong_hoc where nam_thanh_lap < 1890 intersect select ton_giao from truong_hoc where nam_thanh_lap > 1900	school_player
select biet_danh from chi_tiet_truong_hoc where phan_hang != 'Division 1'	school_player
select biet_danh from chi_tiet_truong_hoc where phan_hang != 'Division 1'	school_player
select ton_giao from truong_hoc group by ton_giao having count ( * ) > 1	school_player
select ton_giao from truong_hoc group by ton_giao having count ( * ) > 1	school_player
select t1.ten , t2.ten from quoc_gia as t1 join giai_dau as t2 on t1.id = t2.id_quoc_gia	soccer_1
select count ( * ) from quoc_gia as t1 join giai_dau as t2 on t1.id = t2.id_quoc_gia where t1.ten = 'England'	soccer_1
select avg ( can_nang ) from cau_thu	soccer_1
select max ( can_nang ) , min ( can_nang ) from cau_thu	soccer_1
select distinct t1.ten_cau_thu from cau_thu as t1 join dac_diem_cua_cau_thu as t2 on t1.id_cau_thu_api = t2.id_cau_thu_api where t2.danh_gia_tong_the > ( select avg ( danh_gia_tong_the ) from dac_diem_cua_cau_thu )	soccer_1
select distinct t1.ten_cau_thu from cau_thu as t1 join dac_diem_cua_cau_thu as t2 on t1.id_cau_thu_api = t2.id_cau_thu_api where t2.re_bong = ( select max ( danh_gia_tong_the ) from dac_diem_cua_cau_thu )	soccer_1
select distinct t1.ten_cau_thu from cau_thu as t1 join dac_diem_cua_cau_thu as t2 on t1.id_cau_thu_api = t2.id_cau_thu_api where t2.tat_bong > 90 and t2.chan_thuan = 'right'	soccer_1
select distinct t1.ten_cau_thu from cau_thu as t1 join dac_diem_cua_cau_thu as t2 on t1.id_cau_thu_api = t2.id_cau_thu_api where t2.chan_thuan = 'left' and t2.danh_gia_tong_the >= 85 and t2.danh_gia_tong_the <= 90	soccer_1
select chan_thuan , avg ( danh_gia_tong_the ) from dac_diem_cua_cau_thu group by chan_thuan	soccer_1
select chan_thuan , count ( * ) from dac_diem_cua_cau_thu where danh_gia_tong_the > 80 group by chan_thuan	soccer_1
select id_cau_thu_api from cau_thu where chieu_cao >= 180 intersect select id_cau_thu_api from dac_diem_cua_cau_thu where danh_gia_tong_the > 85	soccer_1
select id_cau_thu_api from cau_thu where chieu_cao >= 180 and chieu_cao <= 190 intersect select id_cau_thu_api from dac_diem_cua_cau_thu where chan_thuan = 'left'	soccer_1
select distinct t1.ten_cau_thu from cau_thu as t1 join dac_diem_cua_cau_thu as t2 on t1.id_cau_thu_api = t2.id_cau_thu_api order by danh_gia_tong_the desc limit 3	soccer_1
select distinct t1.ten_cau_thu , t1.ngay_sinh from cau_thu as t1 join dac_diem_cua_cau_thu as t2 on t1.id_cau_thu_api = t2.id_cau_thu_api order by tiem_nang desc limit 5	soccer_1
select distinct ten_quan from quan order by dien_tich_cua_cac_thanh_pho desc	store_product
select distinct ten_quan from quan order by dien_tich_cua_cac_thanh_pho desc	store_product
select kich_thuoc_trang_toi_da from san_pham group by kich_thuoc_trang_toi_da having count ( * ) > 3	store_product
select kich_thuoc_trang_toi_da from san_pham group by kich_thuoc_trang_toi_da having count ( * ) > 3	store_product
select ten_quan , dan_so_thanh_pho from quan where dan_so_thanh_pho between 200000 and 2000000	store_product
select ten_quan , dan_so_thanh_pho from quan where dan_so_thanh_pho between 200000 and 2000000	store_product
select ten_quan from quan where dien_tich_cua_cac_thanh_pho > 10 or dan_so_thanh_pho > 100000	store_product
select ten_quan from quan where dien_tich_cua_cac_thanh_pho > 10 or dan_so_thanh_pho > 100000	store_product
select ten_quan from quan order by dan_so_thanh_pho desc limit 1	store_product
select ten_quan from quan order by dan_so_thanh_pho desc limit 1	store_product
select ten_quan from quan order by dien_tich_cua_cac_thanh_pho asc limit 1	store_product
select ten_quan from quan order by dien_tich_cua_cac_thanh_pho asc limit 1	store_product
select sum ( dan_so_thanh_pho ) from quan order by dien_tich_cua_cac_thanh_pho desc limit 3	store_product
select sum ( dan_so_thanh_pho ) from quan order by dien_tich_cua_cac_thanh_pho desc limit 3	store_product
select loai , count ( * ) from cua_hang group by loai	store_product
select loai , count ( * ) from cua_hang group by loai	store_product
select t1.ten_cua_hang from cua_hang as t1 join quan_cua_cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang join quan as t3 on t2.id_quan = t3.id_quan where t3.ten_quan = 'Khanewal District'	store_product
select t1.ten_cua_hang from cua_hang as t1 join quan_cua_cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang join quan as t3 on t2.id_quan = t3.id_quan where t3.ten_quan = 'Khanewal District'	store_product
select t1.ten_cua_hang from cua_hang as t1 join quan_cua_cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang where id_quan = ( select id_quan from quan order by dan_so_thanh_pho desc limit 1 )	store_product
select t1.ten_cua_hang from cua_hang as t1 join quan_cua_cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang where id_quan = ( select id_quan from quan order by dan_so_thanh_pho desc limit 1 )	store_product
select t3.thanh_pho_cua_cac_tru_so from cua_hang as t1 join quan_cua_cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang join quan as t3 on t2.id_quan = t3.id_quan where t1.ten_cua_hang = 'Blackville'	store_product
select t3.thanh_pho_cua_cac_tru_so from cua_hang as t1 join quan_cua_cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang join quan as t3 on t2.id_quan = t3.id_quan where t1.ten_cua_hang = 'Blackville'	store_product
select t3.thanh_pho_cua_cac_tru_so , count ( * ) from cua_hang as t1 join quan_cua_cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang join quan as t3 on t2.id_quan = t3.id_quan group by t3.thanh_pho_cua_cac_tru_so	store_product
select t3.thanh_pho_cua_cac_tru_so , count ( * ) from cua_hang as t1 join quan_cua_cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang join quan as t3 on t2.id_quan = t3.id_quan group by t3.thanh_pho_cua_cac_tru_so	store_product
select t3.thanh_pho_cua_cac_tru_so from cua_hang as t1 join quan_cua_cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang join quan as t3 on t2.id_quan = t3.id_quan group by t3.thanh_pho_cua_cac_tru_so order by count ( * ) desc limit 1	store_product
select t3.thanh_pho_cua_cac_tru_so from cua_hang as t1 join quan_cua_cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang join quan as t3 on t2.id_quan = t3.id_quan group by t3.thanh_pho_cua_cac_tru_so order by count ( * ) desc limit 1	store_product
select avg ( so_trang_mau_tren_tung_phut ) from san_pham	store_product
select avg ( so_trang_mau_tren_tung_phut ) from san_pham	store_product
select t1.san_pham from san_pham as t1 join san_pham_cua_cua_hang as t2 on t1.id_san_pham = t2.id_san_pham join cua_hang as t3 on t2.id_cua_hang = t3.id_cua_hang where t3.ten_cua_hang = 'Miramichi'	store_product
select t1.san_pham from san_pham as t1 join san_pham_cua_cua_hang as t2 on t1.id_san_pham = t2.id_san_pham join cua_hang as t3 on t2.id_cua_hang = t3.id_cua_hang where t3.ten_cua_hang = 'Miramichi'	store_product
select san_pham from san_pham where kich_thuoc_trang_toi_da = 'A4' and so_trang_mau_tren_tung_phut < 5	store_product
select san_pham from san_pham where kich_thuoc_trang_toi_da = 'A4' and so_trang_mau_tren_tung_phut < 5	store_product
select san_pham from san_pham where kich_thuoc_trang_toi_da = 'A4' or so_trang_mau_tren_tung_phut < 5	store_product
select san_pham from san_pham where kich_thuoc_trang_toi_da = 'A4' or so_trang_mau_tren_tung_phut < 5	store_product
select san_pham from san_pham where san_pham like '%Scanner%'	store_product
select san_pham from san_pham where san_pham like '%Scanner%'	store_product
select kich_thuoc_trang_toi_da from san_pham group by kich_thuoc_trang_toi_da order by count ( * ) desc limit 1	store_product
select kich_thuoc_trang_toi_da from san_pham group by kich_thuoc_trang_toi_da order by count ( * ) desc limit 1	store_product
select san_pham from san_pham where san_pham != ( select kich_thuoc_trang_toi_da from san_pham group by kich_thuoc_trang_toi_da order by count ( * ) desc limit 1 )	store_product
select san_pham from san_pham where san_pham != ( select kich_thuoc_trang_toi_da from san_pham group by kich_thuoc_trang_toi_da order by count ( * ) desc limit 1 )	store_product
select sum ( dan_so_thanh_pho ) from quan where dien_tich_cua_cac_thanh_pho > ( select avg ( dien_tich_cua_cac_thanh_pho ) from quan )	store_product
select sum ( dan_so_thanh_pho ) from quan where dien_tich_cua_cac_thanh_pho > ( select avg ( dien_tich_cua_cac_thanh_pho ) from quan )	store_product
select t3.ten_quan from cua_hang as t1 join quan_cua_cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang join quan as t3 on t2.id_quan = t3.id_quan where t1.loai = 'City Mall' intersect select t3.ten_quan from cua_hang as t1 join quan_cua_cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang join quan as t3 on t2.id_quan = t3.id_quan where t1.loai = 'Village Store'	store_product
select t3.ten_quan from cua_hang as t1 join quan_cua_cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang join quan as t3 on t2.id_quan = t3.id_quan where t1.loai = 'City Mall' intersect select t3.ten_quan from cua_hang as t1 join quan_cua_cua_hang as t2 on t1.id_cua_hang = t2.id_cua_hang join quan as t3 on t2.id_quan = t3.id_quan where t1.loai = 'Village Store'	store_product
select count ( * ) from khu_vuc	storm_record
select count ( * ) from khu_vuc	storm_record
select ma_khu_vuc , ten_khu_vuc from khu_vuc order by ma_khu_vuc	storm_record
select ma_khu_vuc , ten_khu_vuc from khu_vuc order by ma_khu_vuc	storm_record
select ten_khu_vuc from khu_vuc order by ten_khu_vuc	storm_record
select ten_khu_vuc from khu_vuc order by ten_khu_vuc	storm_record
select ten_khu_vuc from khu_vuc where ten_khu_vuc != 'Denmark'	storm_record
select ten_khu_vuc from khu_vuc where ten_khu_vuc != 'Denmark'	storm_record
select count ( * ) from bao where so_luong_nguoi_chet > 0	storm_record
select count ( * ) from bao where so_luong_nguoi_chet > 0	storm_record
select ten , ngay_hoat_dong , so_luong_nguoi_chet from bao where so_luong_nguoi_chet >= 1	storm_record
select ten , ngay_hoat_dong , so_luong_nguoi_chet from bao where so_luong_nguoi_chet >= 1	storm_record
select avg ( thiet_hai_theo_trieu_usd ) , max ( thiet_hai_theo_trieu_usd ) from bao where toc_do_toi_da > 1000	storm_record
select avg ( thiet_hai_theo_trieu_usd ) , max ( thiet_hai_theo_trieu_usd ) from bao where toc_do_toi_da > 1000	storm_record
select sum ( so_luong_nguoi_chet ) , sum ( thiet_hai_theo_trieu_usd ) from bao where toc_do_toi_da > ( select avg ( toc_do_toi_da ) from bao )	storm_record
select sum ( so_luong_nguoi_chet ) , sum ( thiet_hai_theo_trieu_usd ) from bao where toc_do_toi_da > ( select avg ( toc_do_toi_da ) from bao )	storm_record
select ten , thiet_hai_theo_trieu_usd from bao order by toc_do_toi_da desc	storm_record
select ten , thiet_hai_theo_trieu_usd from bao order by toc_do_toi_da desc	storm_record
select count ( distinct id_khu_vuc ) from khu_vuc_bi_anh_huong	storm_record
select count ( distinct id_khu_vuc ) from khu_vuc_bi_anh_huong	storm_record
select ten_khu_vuc from khu_vuc where id_khu_vuc not in ( select id_khu_vuc from khu_vuc_bi_anh_huong )	storm_record
select ten_khu_vuc from khu_vuc where id_khu_vuc not in ( select id_khu_vuc from khu_vuc_bi_anh_huong )	storm_record
select t1.ten_khu_vuc , count ( * ) from khu_vuc as t1 join khu_vuc_bi_anh_huong as t2 on t1.id_khu_vuc = t2.id_khu_vuc group by t1.id_khu_vuc	storm_record
select t1.ten_khu_vuc , count ( * ) from khu_vuc as t1 join khu_vuc_bi_anh_huong as t2 on t1.id_khu_vuc = t2.id_khu_vuc group by t1.id_khu_vuc	storm_record
select t1.ten , count ( * ) from bao as t1 join khu_vuc_bi_anh_huong as t2 on t1.id_con_bao = t2.id_bao group by t1.id_con_bao	storm_record
select t1.ten , count ( * ) from bao as t1 join khu_vuc_bi_anh_huong as t2 on t1.id_con_bao = t2.id_bao group by t1.id_con_bao	storm_record
select t1.ten , t1.toc_do_toi_da from bao as t1 join khu_vuc_bi_anh_huong as t2 on t1.id_con_bao = t2.id_bao group by t1.id_con_bao order by count ( * ) desc limit 1	storm_record
select t1.ten , t1.toc_do_toi_da from bao as t1 join khu_vuc_bi_anh_huong as t2 on t1.id_con_bao = t2.id_bao group by t1.id_con_bao order by count ( * ) desc limit 1	storm_record
select ten from bao where id_con_bao not in ( select id_bao from khu_vuc_bi_anh_huong )	storm_record
select ten from bao where id_con_bao not in ( select id_bao from khu_vuc_bi_anh_huong )	storm_record
select t1.ten from bao as t1 join khu_vuc_bi_anh_huong as t2 on t1.id_con_bao = t2.id_bao group by t1.id_con_bao having count ( * ) >= 2 intersect select t1.ten from bao as t1 join khu_vuc_bi_anh_huong as t2 on t1.id_con_bao = t2.id_bao group by t1.id_con_bao having sum ( t2.so_thanh_pho_bi_anh_huong ) >= 10	storm_record
select t1.ten from bao as t1 join khu_vuc_bi_anh_huong as t2 on t1.id_con_bao = t2.id_bao group by t1.id_con_bao having count ( * ) >= 2 intersect select t1.ten from bao as t1 join khu_vuc_bi_anh_huong as t2 on t1.id_con_bao = t2.id_bao group by t1.id_con_bao having sum ( t2.so_thanh_pho_bi_anh_huong ) >= 10	storm_record
select ten from bao except select t1.ten from bao as t1 join khu_vuc_bi_anh_huong as t2 on t1.id_con_bao = t2.id_bao group by t1.id_con_bao having count ( * ) >= 2	storm_record
select ten from bao except select t1.ten from bao as t1 join khu_vuc_bi_anh_huong as t2 on t1.id_con_bao = t2.id_bao group by t1.id_con_bao having count ( * ) >= 2	storm_record
select t2.ten_khu_vuc from khu_vuc_bi_anh_huong as t1 join khu_vuc as t2 on t1.id_khu_vuc = t2.id_khu_vuc join bao as t3 on t1.id_bao = t3.id_con_bao where t3.so_luong_nguoi_chet >= 10	storm_record
select t2.ten_khu_vuc from khu_vuc_bi_anh_huong as t1 join khu_vuc as t2 on t1.id_khu_vuc = t2.id_khu_vuc join bao as t3 on t1.id_bao = t3.id_con_bao where t3.so_luong_nguoi_chet >= 10	storm_record
select t3.ten from khu_vuc_bi_anh_huong as t1 join khu_vuc as t2 on t1.id_khu_vuc = t2.id_khu_vuc join bao as t3 on t1.id_bao = t3.id_con_bao where t2.ten_khu_vuc = 'Denmark'	storm_record
select t3.ten from khu_vuc_bi_anh_huong as t1 join khu_vuc as t2 on t1.id_khu_vuc = t2.id_khu_vuc join bao as t3 on t1.id_bao = t3.id_con_bao where t2.ten_khu_vuc = 'Denmark'	storm_record
select t1.ten_khu_vuc from khu_vuc as t1 join khu_vuc_bi_anh_huong as t2 on t1.id_khu_vuc = t2.id_khu_vuc group by t1.id_khu_vuc having count ( * ) >= 2	storm_record
select t1.ten_khu_vuc from khu_vuc as t1 join khu_vuc_bi_anh_huong as t2 on t1.id_khu_vuc = t2.id_khu_vuc group by t1.id_khu_vuc having count ( * ) >= 2	storm_record
select t2.ten_khu_vuc from khu_vuc_bi_anh_huong as t1 join khu_vuc as t2 on t1.id_khu_vuc = t2.id_khu_vuc join bao as t3 on t1.id_bao = t3.id_con_bao order by t3.so_luong_nguoi_chet desc limit 1	storm_record
select t2.ten_khu_vuc from khu_vuc_bi_anh_huong as t1 join khu_vuc as t2 on t1.id_khu_vuc = t2.id_khu_vuc join bao as t3 on t1.id_bao = t3.id_con_bao order by t3.so_luong_nguoi_chet desc limit 1	storm_record
select t3.ten from khu_vuc_bi_anh_huong as t1 join khu_vuc as t2 on t1.id_khu_vuc = t2.id_khu_vuc join bao as t3 on t1.id_bao = t3.id_con_bao where t2.ten_khu_vuc = 'Afghanistan' intersect select t3.ten from khu_vuc_bi_anh_huong as t1 join khu_vuc as t2 on t1.id_khu_vuc = t2.id_khu_vuc join bao as t3 on t1.id_bao = t3.id_con_bao where t2.ten_khu_vuc = 'Albania'	storm_record
select t3.ten from khu_vuc_bi_anh_huong as t1 join khu_vuc as t2 on t1.id_khu_vuc = t2.id_khu_vuc join bao as t3 on t1.id_bao = t3.id_con_bao where t2.ten_khu_vuc = 'Afghanistan' intersect select t3.ten from khu_vuc_bi_anh_huong as t1 join khu_vuc as t2 on t1.id_khu_vuc = t2.id_khu_vuc join bao as t3 on t1.id_bao = t3.id_con_bao where t2.ten_khu_vuc = 'Albania'	storm_record
select count ( * ) from danh_sach	student_1
select count ( * ) from danh_sach	student_1
select ho from danh_sach where phong_hoc = 111	student_1
select ho from danh_sach where phong_hoc = 111	student_1
select ten from danh_sach where phong_hoc = 108	student_1
select ten from danh_sach where phong_hoc = 108	student_1
select distinct ten from danh_sach where phong_hoc = 107	student_1
select distinct ten from danh_sach where phong_hoc = 107	student_1
select distinct phong_hoc , khoi_lop from danh_sach	student_1
select distinct phong_hoc , khoi_lop from danh_sach	student_1
select distinct khoi_lop from danh_sach where phong_hoc = 103	student_1
select distinct khoi_lop from danh_sach where phong_hoc = 103	student_1
select distinct khoi_lop from danh_sach where phong_hoc = 105	student_1
select distinct khoi_lop from danh_sach where phong_hoc = 105	student_1
select distinct phong_hoc from danh_sach where khoi_lop = 4	student_1
select distinct phong_hoc from danh_sach where khoi_lop = 4	student_1
select distinct phong_hoc from danh_sach where khoi_lop = 5	student_1
select distinct phong_hoc from danh_sach where khoi_lop = 5	student_1
select distinct t2.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where khoi_lop = 5	student_1
select distinct t2.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where khoi_lop = 5	student_1
select distinct t2.ten from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where khoi_lop = 1	student_1
select distinct t2.ten from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where khoi_lop = 1	student_1
select ten from giao_vien where phong_hoc = 110	student_1
select ten from giao_vien where phong_hoc = 110	student_1
select ho from giao_vien where phong_hoc = 109	student_1
select ho from giao_vien where phong_hoc = 109	student_1
select distinct ten , ho from giao_vien	student_1
select distinct ten , ho from giao_vien	student_1
select distinct ten , ho from danh_sach	student_1
select distinct ten , ho from danh_sach	student_1
select t1.ten , t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = 'OTHA' and t2.ho = 'MOYER'	student_1
select t1.ten , t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = 'OTHA' and t2.ho = 'MOYER'	student_1
select t1.ten , t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = 'MARROTTE' and t2.ho = 'KIRK'	student_1
select t1.ten , t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = 'MARROTTE' and t2.ho = 'KIRK'	student_1
select t2.ten , t2.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t1.ten = 'EVELINA' and t1.ho = 'BROMLEY'	student_1
select t2.ten , t2.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t1.ten = 'EVELINA' and t1.ho = 'BROMLEY'	student_1
select t2.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t1.ten = 'GELL' and t1.ho = 'TAMI'	student_1
select t2.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t1.ten = 'GELL' and t1.ho = 'TAMI'	student_1
select count ( * ) from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = 'LORIA' and t2.ho = 'ONDERSMA'	student_1
select count ( * ) from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = 'LORIA' and t2.ho = 'ONDERSMA'	student_1
select count ( * ) from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = 'KAWA' and t2.ho = 'GORDON'	student_1
select count ( * ) from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = 'KAWA' and t2.ho = 'GORDON'	student_1
select count ( * ) from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = 'TARRING' and t2.ho = 'LEIA'	student_1
select count ( * ) from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = 'TARRING' and t2.ho = 'LEIA'	student_1
select count ( * ) from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t1.ten = 'CHRISSY' and t1.ho = 'NABOZNY'	student_1
select count ( * ) from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t1.ten = 'CHRISSY' and t1.ho = 'NABOZNY'	student_1
select count ( * ) from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t1.ten = 'MADLOCK' and t1.ho = 'RAY'	student_1
select count ( * ) from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t1.ten = 'MADLOCK' and t1.ho = 'RAY'	student_1
select distinct t1.ten , t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t1.khoi_lop = 1 except select t1.ten , t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = 'OTHA' and t2.ho = 'MOYER'	student_1
select distinct t1.ten , t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t1.khoi_lop = 1 except select t1.ten , t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = 'OTHA' and t2.ho = 'MOYER'	student_1
select distinct t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t1.khoi_lop = 3 and t2.ten != 'COVIN' and t2.ho != 'JEROME'	student_1
select distinct t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t1.khoi_lop = 3 and t2.ten != 'COVIN' and t2.ho != 'JEROME'	student_1
select khoi_lop , count ( distinct phong_hoc ) , count ( * ) from danh_sach group by khoi_lop	student_1
select khoi_lop , count ( distinct phong_hoc ) , count ( * ) from danh_sach group by khoi_lop	student_1
select phong_hoc , count ( distinct khoi_lop ) from danh_sach group by phong_hoc	student_1
select phong_hoc , count ( distinct khoi_lop ) from danh_sach group by phong_hoc	student_1
select phong_hoc from danh_sach group by phong_hoc order by count ( * ) desc limit 1	student_1
select phong_hoc from danh_sach group by phong_hoc order by count ( * ) desc limit 1	student_1
select phong_hoc , count ( * ) from danh_sach group by phong_hoc	student_1
select phong_hoc , count ( * ) from danh_sach group by phong_hoc	student_1
select phong_hoc , count ( * ) from danh_sach where khoi_lop = '0' group by phong_hoc	student_1
select phong_hoc , count ( * ) from danh_sach where khoi_lop = '0' group by phong_hoc	student_1
select phong_hoc , count ( * ) from danh_sach where khoi_lop = '4' group by phong_hoc	student_1
select phong_hoc , count ( * ) from danh_sach where khoi_lop = '4' group by phong_hoc	student_1
select t2.ten , t2.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc group by t2.ten , t2.ho order by count ( * ) desc limit 1	student_1
select t2.ten , t2.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc group by t2.ten , t2.ho order by count ( * ) desc limit 1	student_1
select count ( * ) , phong_hoc from danh_sach group by phong_hoc	student_1
select count ( * ) , phong_hoc from danh_sach group by phong_hoc	student_1
select t1.ten_khoa_hoc from khoa_hoc as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc group by t1.id_khoa_hoc order by count ( * ) desc limit 1	student_assessment
select t1.ten_khoa_hoc from khoa_hoc as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc group by t1.id_khoa_hoc order by count ( * ) desc limit 1	student_assessment
select id_sinh_vien from luot_dang_ky_khoa_hoc_cua_sinh_vien group by id_sinh_vien order by count ( * ) limit 1	student_assessment
select id_sinh_vien from luot_dang_ky_khoa_hoc_cua_sinh_vien group by id_sinh_vien order by count ( * ) limit 1	student_assessment
select t2.ten , t2.ho from ung_cu_vien as t1 join ca_nhan as t2 on t1.id_ung_cu_vien = t2.id_ca_nhan	student_assessment
select t2.ten , t2.ho from ung_cu_vien as t1 join ca_nhan as t2 on t1.id_ung_cu_vien = t2.id_ca_nhan	student_assessment
select id_sinh_vien from sinh_vien where id_sinh_vien not in ( select id_sinh_vien from lan_tham_du_khoa_hoc_cua_sinh_vien )	student_assessment
select id_sinh_vien from sinh_vien where id_sinh_vien not in ( select id_sinh_vien from lan_tham_du_khoa_hoc_cua_sinh_vien )	student_assessment
select id_sinh_vien from lan_tham_du_khoa_hoc_cua_sinh_vien	student_assessment
select id_sinh_vien from lan_tham_du_khoa_hoc_cua_sinh_vien	student_assessment
select t1.id_sinh_vien , t2.ten_khoa_hoc from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join khoa_hoc as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc	student_assessment
select t2.chi_tiet_sinh_vien from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien order by t1.ngay_dang_ki desc limit 1	student_assessment
select t2.chi_tiet_sinh_vien from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien order by t1.ngay_dang_ki desc limit 1	student_assessment
select count ( * ) from khoa_hoc as t1 join lan_tham_du_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc where t1.ten_khoa_hoc = 'English'	student_assessment
select count ( * ) from khoa_hoc as t1 join lan_tham_du_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc where t1.ten_khoa_hoc = 'English'	student_assessment
select count ( * ) from khoa_hoc as t1 join lan_tham_du_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc where t2.id_sinh_vien = 171	student_assessment
select count ( * ) from khoa_hoc as t1 join lan_tham_du_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc where t2.id_sinh_vien = 171	student_assessment
select t2.id_ung_cu_vien from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ung_cu_vien where t1.dia_chi_email = 'stanley.monahan@example.org'	student_assessment
select t2.id_ung_cu_vien from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ung_cu_vien where t1.dia_chi_email = 'stanley.monahan@example.org'	student_assessment
select id_ung_cu_vien from danh_gia_ung_cu_vien order by ngay_danh_gia desc limit 1	student_assessment
select id_ung_cu_vien from danh_gia_ung_cu_vien order by ngay_danh_gia desc limit 1	student_assessment
select t1.chi_tiet_sinh_vien from sinh_vien as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien order by count ( * ) desc limit 1	student_assessment
select t1.chi_tiet_sinh_vien from sinh_vien as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien order by count ( * ) desc limit 1	student_assessment
select t1.id_sinh_vien , count ( * ) from sinh_vien as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien	student_assessment
select t1.id_sinh_vien , count ( * ) from sinh_vien as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien	student_assessment
select t3.ten_khoa_hoc , count ( * ) from sinh_vien as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien join khoa_hoc as t3 on t2.id_khoa_hoc = t3.id_khoa_hoc group by t2.id_khoa_hoc	student_assessment
select t3.ten_khoa_hoc , count ( * ) from sinh_vien as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien join khoa_hoc as t3 on t2.id_khoa_hoc = t3.id_khoa_hoc group by t2.id_khoa_hoc	student_assessment
select id_ung_cu_vien from danh_gia_ung_cu_vien where ma_ket_qua_danh_gia = 'Pass'	student_assessment
select id_ung_cu_vien from danh_gia_ung_cu_vien where ma_ket_qua_danh_gia = 'Pass'	student_assessment
select t3.so_di_dong from ung_cu_vien as t1 join danh_gia_ung_cu_vien as t2 on t1.id_ung_cu_vien = t2.id_ung_cu_vien join ca_nhan as t3 on t1.id_ung_cu_vien = t3.id_ca_nhan where t2.ma_ket_qua_danh_gia = 'Fail'	student_assessment
select t3.so_di_dong from ung_cu_vien as t1 join danh_gia_ung_cu_vien as t2 on t1.id_ung_cu_vien = t2.id_ung_cu_vien join ca_nhan as t3 on t1.id_ung_cu_vien = t3.id_ca_nhan where t2.ma_ket_qua_danh_gia = 'Fail'	student_assessment
select id_sinh_vien from lan_tham_du_khoa_hoc_cua_sinh_vien where id_khoa_hoc = 301	student_assessment
select id_sinh_vien from lan_tham_du_khoa_hoc_cua_sinh_vien where id_khoa_hoc = 301	student_assessment
select id_sinh_vien from lan_tham_du_khoa_hoc_cua_sinh_vien where id_khoa_hoc = 301 order by ngay_tham_du desc limit 1	student_assessment
select id_sinh_vien from lan_tham_du_khoa_hoc_cua_sinh_vien where id_khoa_hoc = 301 order by ngay_tham_du desc limit 1	student_assessment
select distinct t1.thanh_pho from dia_chi as t1 join dia_chi_ca_nhan as t2 on t1.id_dia_chi = t2.id_dia_chi	student_assessment
select distinct t1.thanh_pho from dia_chi as t1 join dia_chi_ca_nhan as t2 on t1.id_dia_chi = t2.id_dia_chi	student_assessment
select distinct t1.thanh_pho from dia_chi as t1 join dia_chi_ca_nhan as t2 on t1.id_dia_chi = t2.id_dia_chi join sinh_vien as t3 on t2.id_ca_nhan = t3.id_sinh_vien	student_assessment
select distinct t1.thanh_pho from dia_chi as t1 join dia_chi_ca_nhan as t2 on t1.id_dia_chi = t2.id_dia_chi join sinh_vien as t3 on t2.id_ca_nhan = t3.id_sinh_vien	student_assessment
select ten_khoa_hoc from khoa_hoc order by ten_khoa_hoc	student_assessment
select ten_khoa_hoc from khoa_hoc order by ten_khoa_hoc	student_assessment
select ten from ca_nhan order by ten	student_assessment
select ten from ca_nhan order by ten	student_assessment
select id_sinh_vien from luot_dang_ky_khoa_hoc_cua_sinh_vien union select id_sinh_vien from lan_tham_du_khoa_hoc_cua_sinh_vien	student_assessment
select id_sinh_vien from luot_dang_ky_khoa_hoc_cua_sinh_vien union select id_sinh_vien from lan_tham_du_khoa_hoc_cua_sinh_vien	student_assessment
select id_khoa_hoc from luot_dang_ky_khoa_hoc_cua_sinh_vien where id_sinh_vien = 121 union select id_khoa_hoc from lan_tham_du_khoa_hoc_cua_sinh_vien where id_sinh_vien = 121	student_assessment
select id_khoa_hoc from luot_dang_ky_khoa_hoc_cua_sinh_vien where id_sinh_vien = 121 union select id_khoa_hoc from lan_tham_du_khoa_hoc_cua_sinh_vien where id_sinh_vien = 121	student_assessment
select * from luot_dang_ky_khoa_hoc_cua_sinh_vien where id_sinh_vien not in ( select id_sinh_vien from lan_tham_du_khoa_hoc_cua_sinh_vien )	student_assessment
select * from luot_dang_ky_khoa_hoc_cua_sinh_vien where id_sinh_vien not in ( select id_sinh_vien from lan_tham_du_khoa_hoc_cua_sinh_vien )	student_assessment
select t2.id_sinh_vien from khoa_hoc as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc where t1.ten_khoa_hoc = 'statistics' order by t2.ngay_dang_ki	student_assessment
select t2.id_sinh_vien from khoa_hoc as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc where t1.ten_khoa_hoc = 'statistics' order by t2.ngay_dang_ki	student_assessment
select t2.id_sinh_vien from khoa_hoc as t1 join lan_tham_du_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc where t1.ten_khoa_hoc = 'statistics' order by t2.ngay_tham_du	student_assessment
select t2.id_sinh_vien from khoa_hoc as t1 join lan_tham_du_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc where t1.ten_khoa_hoc = 'statistics' order by t2.ngay_tham_du	student_assessment
select count ( * ) from luot_nop_bai	workshop_paper
select count ( * ) from luot_nop_bai	workshop_paper
select tac_gia from luot_nop_bai order by so_diem asc	workshop_paper
select tac_gia from luot_nop_bai order by so_diem asc	workshop_paper
select tac_gia , truong_dai_hoc from luot_nop_bai	workshop_paper
select tac_gia , truong_dai_hoc from luot_nop_bai	workshop_paper
select tac_gia from luot_nop_bai where truong_dai_hoc = 'Florida' or truong_dai_hoc = 'Temple'	workshop_paper
select tac_gia from luot_nop_bai where truong_dai_hoc = 'Florida' or truong_dai_hoc = 'Temple'	workshop_paper
select avg ( so_diem ) from luot_nop_bai	workshop_paper
select avg ( so_diem ) from luot_nop_bai	workshop_paper
select tac_gia from luot_nop_bai order by so_diem desc limit 1	workshop_paper
select tac_gia from luot_nop_bai order by so_diem desc limit 1	workshop_paper
select truong_dai_hoc , count ( * ) from luot_nop_bai group by truong_dai_hoc	workshop_paper
select truong_dai_hoc , count ( * ) from luot_nop_bai group by truong_dai_hoc	workshop_paper
select truong_dai_hoc from luot_nop_bai group by truong_dai_hoc order by count ( * ) desc limit 1	workshop_paper
select truong_dai_hoc from luot_nop_bai group by truong_dai_hoc order by count ( * ) desc limit 1	workshop_paper
select truong_dai_hoc from luot_nop_bai where so_diem > 90 intersect select truong_dai_hoc from luot_nop_bai where so_diem < 80	workshop_paper
select truong_dai_hoc from luot_nop_bai where so_diem > 90 intersect select truong_dai_hoc from luot_nop_bai where so_diem < 80	workshop_paper
select t2.tac_gia , t1.ket_qua from chap_thuan as t1 join luot_nop_bai as t2 on t1.id_luot_nop_bai = t2.id_luot_nop_bai	workshop_paper
select t2.tac_gia , t1.ket_qua from chap_thuan as t1 join luot_nop_bai as t2 on t1.id_luot_nop_bai = t2.id_luot_nop_bai	workshop_paper
select t1.ket_qua from chap_thuan as t1 join luot_nop_bai as t2 on t1.id_luot_nop_bai = t2.id_luot_nop_bai order by t2.so_diem desc limit 1	workshop_paper
select t1.ket_qua from chap_thuan as t1 join luot_nop_bai as t2 on t1.id_luot_nop_bai = t2.id_luot_nop_bai order by t2.so_diem desc limit 1	workshop_paper
select t2.tac_gia , count ( distinct t1.id_hoi_thao ) from chap_thuan as t1 join luot_nop_bai as t2 on t1.id_luot_nop_bai = t2.id_luot_nop_bai group by t2.tac_gia	workshop_paper
select t2.tac_gia , count ( distinct t1.id_hoi_thao ) from chap_thuan as t1 join luot_nop_bai as t2 on t1.id_luot_nop_bai = t2.id_luot_nop_bai group by t2.tac_gia	workshop_paper
select t2.tac_gia from chap_thuan as t1 join luot_nop_bai as t2 on t1.id_luot_nop_bai = t2.id_luot_nop_bai group by t2.tac_gia having count ( distinct t1.id_hoi_thao ) > 1	workshop_paper
select t2.tac_gia from chap_thuan as t1 join luot_nop_bai as t2 on t1.id_luot_nop_bai = t2.id_luot_nop_bai group by t2.tac_gia having count ( distinct t1.id_hoi_thao ) > 1	workshop_paper
select ngay , dia_diem from hoi_thao order by dia_diem	workshop_paper
select ngay , dia_diem from hoi_thao order by dia_diem	workshop_paper
select tac_gia from luot_nop_bai where id_luot_nop_bai not in ( select id_luot_nop_bai from chap_thuan )	workshop_paper
select tac_gia from luot_nop_bai where id_luot_nop_bai not in ( select id_luot_nop_bai from chap_thuan )	workshop_paper
