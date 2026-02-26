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
select tieu_de from sach where tac_gia != "elaine lee"	book_2
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
select gia_ban from an_pham where nha_xuat_ban = "person" or nha_xuat_ban = "wiley"	book_2
select ten_bo_phan from bo_phan order by ngay_bat_dau_quan_ly	company_1
select ten_nguoi_phu_thuoc from nguoi_phu_thuoc where moi_quan_he = "spouse"	company_1
select count ( * ) from nguoi_phu_thuoc where gioi_tinh = "f"	company_1
select t1.ten_bo_phan from bo_phan as t1 join dia_diem_cua_bo_phan as t2 on t1.ma_so_bo_phan = t2.ma_so_bo_phan where t2.dia_diem_bo_phan = "houston"	company_1
select ten , ho from nhan_vien where luong > 30000	company_1
select count ( * ) , gioi_tinh from nhan_vien where luong < 50000 group by gioi_tinh	company_1
select ten , ho , dia_chi from nhan_vien order by ngay_sinh	company_1
select count ( * ) from giao_vien	course_teach
select count ( * ) from giao_vien	course_teach
select ten from giao_vien order by tuoi asc	course_teach
select ten from giao_vien order by tuoi asc	course_teach
select tuoi , que_quan from giao_vien	course_teach
select tuoi , que_quan from giao_vien	course_teach
select ten from giao_vien where que_quan != "little lever urban distric"	course_teach
select ten from giao_vien where que_quan != "little lever urban distric"	course_teach
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
select t3.ten from sap_xep_khoa_hoc as t1 join khoa_hoc as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc join giao_vien as t3 on t1.id_giao_vien = t3.id_giao_vien where t2.khoa_hoc = "math"	course_teach
select t3.ten from sap_xep_khoa_hoc as t1 join khoa_hoc as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc join giao_vien as t3 on t1.id_giao_vien = t3.id_giao_vien where t2.khoa_hoc = "math"	course_teach
select t2.ten , count ( * ) from sap_xep_khoa_hoc as t1 join giao_vien as t2 on t1.id_giao_vien = t2.id_giao_vien group by t2.ten	course_teach
select t2.ten , count ( * ) from sap_xep_khoa_hoc as t1 join giao_vien as t2 on t1.id_giao_vien = t2.id_giao_vien group by t2.ten	course_teach
select t2.ten from sap_xep_khoa_hoc as t1 join giao_vien as t2 on t1.id_giao_vien = t2.id_giao_vien group by t2.ten having count ( * ) >= 2	course_teach
select t2.ten from sap_xep_khoa_hoc as t1 join giao_vien as t2 on t1.id_giao_vien = t2.id_giao_vien group by t2.ten having count ( * ) >= 2	course_teach
select ten from giao_vien where id_giao_vien not in ( select id_giao_vien from sap_xep_khoa_hoc )	course_teach
select ten from giao_vien where id_giao_vien not in ( select id_giao_vien from sap_xep_khoa_hoc )	course_teach
select count ( * ) from thanh_vien	decoration_competition
select ten from thanh_vien order by ten asc	decoration_competition
select ten , quoc_gia from thanh_vien	decoration_competition
select ten from thanh_vien where quoc_gia = "united states" or quoc_gia = "canada"	decoration_competition
select quoc_gia , count ( * ) from thanh_vien group by quoc_gia	decoration_competition
select quoc_gia from thanh_vien group by quoc_gia order by count ( * ) desc limit 1	decoration_competition
select quoc_gia from thanh_vien group by quoc_gia having count ( * ) > 2	decoration_competition
select ten_lanh_dao , dia_diem_truong_dai_hoc from truong_dai_hoc	decoration_competition
select t2.ten , t1.ten from truong_dai_hoc as t1 join thanh_vien as t2 on t1.id_dai_hoc = t2.id_dai_hoc	decoration_competition
select t2.ten , t1.dia_diem_truong_dai_hoc from truong_dai_hoc as t1 join thanh_vien as t2 on t1.id_dai_hoc = t2.id_dai_hoc order by t2.ten asc	decoration_competition
select distinct t1.ten_lanh_dao from truong_dai_hoc as t1 join thanh_vien as t2 on t1.id_dai_hoc = t2.id_dai_hoc where t2.quoc_gia = "canada"	decoration_competition
select t1.ten , t2.chu_de_trang_tri from thanh_vien as t1 join vong as t2 on t1.id_thanh_vien = t2.id_thanh_vien	decoration_competition
select t1.ten from thanh_vien as t1 join vong as t2 on t1.id_thanh_vien = t2.id_thanh_vien where t2.xep_hang_tung_vong > 3	decoration_competition
select t1.ten from thanh_vien as t1 join vong as t2 on t1.id_thanh_vien = t2.id_thanh_vien order by xep_hang_tung_vong asc	decoration_competition
select ten from thanh_vien where id_thanh_vien not in ( select id_thanh_vien from vong )	decoration_competition
select count ( * ) from cuoc_bau_cu	election_representative
select so_luong_phieu_bau from cuoc_bau_cu order by so_luong_phieu_bau desc	election_representative
select ngay , ti_le_phieu_bau from cuoc_bau_cu	election_representative
select min ( ti_le_phieu_bau ) , max ( ti_le_phieu_bau ) from cuoc_bau_cu	election_representative
select ten , dang from dai_dien	election_representative
select ten from dai_dien where dang != "republican"	election_representative
select tuoi_tho from dai_dien where tieu_bang = "new york" or tieu_bang = "indiana"	election_representative
select t2.ten , t1.ngay from cuoc_bau_cu as t1 join dai_dien as t2 on t1.id_dai_dien = t2.id_dai_dien	election_representative
select t2.ten from cuoc_bau_cu as t1 join dai_dien as t2 on t1.id_dai_dien = t2.id_dai_dien where so_luong_phieu_bau > 10000	election_representative
select t2.ten from cuoc_bau_cu as t1 join dai_dien as t2 on t1.id_dai_dien = t2.id_dai_dien order by so_luong_phieu_bau desc	election_representative
select t2.dang from cuoc_bau_cu as t1 join dai_dien as t2 on t1.id_dai_dien = t2.id_dai_dien order by so_luong_phieu_bau asc limit 1	election_representative
select t2.tuoi_tho from cuoc_bau_cu as t1 join dai_dien as t2 on t1.id_dai_dien = t2.id_dai_dien order by ti_le_phieu_bau desc	election_representative
select avg ( t1.so_luong_phieu_bau ) from cuoc_bau_cu as t1 join dai_dien as t2 on t1.id_dai_dien = t2.id_dai_dien where t2.dang = "republican"	election_representative
select dang , count ( * ) from dai_dien group by dang	election_representative
select dang , count ( * ) from dai_dien group by dang order by count ( * ) desc limit 1	election_representative
select dang from dai_dien group by dang having count ( * ) >= 3	election_representative
select tieu_bang from dai_dien group by tieu_bang having count ( * ) >= 2	election_representative
select ten from dai_dien where id_dai_dien not in ( select id_dai_dien from cuoc_bau_cu )	election_representative
select dang from dai_dien where tieu_bang = "new york" intersect select dang from dai_dien where tieu_bang = "pennsylvania"	election_representative
select count ( distinct dang ) from dai_dien	election_representative
select count ( * ) from quoc_gia	match_season
select count ( * ) from quoc_gia	match_season
select ten_quoc_gia , thu_do from quoc_gia	match_season
select ten_quoc_gia , thu_do from quoc_gia	match_season
select ngon_ngu_ban_dia_chinh_thuc from quoc_gia where ngon_ngu_ban_dia_chinh_thuc like "%english%"	match_season
select ngon_ngu_ban_dia_chinh_thuc from quoc_gia where ngon_ngu_ban_dia_chinh_thuc like "%english%"	match_season
select distinct vi_tri from tran_dau_trong_mua_giai	match_season
select distinct vi_tri from tran_dau_trong_mua_giai	match_season
select cau_thu from tran_dau_trong_mua_giai where truong_dai_hoc = "ucla"	match_season
select cau_thu from tran_dau_trong_mua_giai where truong_dai_hoc = "ucla"	match_season
select distinct vi_tri from tran_dau_trong_mua_giai where truong_dai_hoc = "ucla" or truong_dai_hoc = "duke"	match_season
select distinct vi_tri from tran_dau_trong_mua_giai where truong_dai_hoc = "ucla" or truong_dai_hoc = "duke"	match_season
select ma_so_tuyen_chon_tan_binh , mua_tuyen_chon from tran_dau_trong_mua_giai where vi_tri = "defender"	match_season
select ma_so_tuyen_chon_tan_binh , mua_tuyen_chon from tran_dau_trong_mua_giai where vi_tri = "defender"	match_season
select count ( distinct doi ) from tran_dau_trong_mua_giai	match_season
select count ( distinct doi ) from tran_dau_trong_mua_giai	match_season
select cau_thu , so_nam_da_choi from cau_thu	match_season
select cau_thu , so_nam_da_choi from cau_thu	match_season
select ten from doi	match_season
select ten from doi	match_season
select t2.mua_giai , t2.cau_thu , t1.ten_quoc_gia from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia	match_season
select t2.mua_giai , t2.cau_thu , t1.ten_quoc_gia from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia	match_season
select t2.cau_thu from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t1.ten_quoc_gia = "indonesia"	match_season
select t2.cau_thu from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t1.ten_quoc_gia = "indonesia"	match_season
select distinct t2.vi_tri from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t1.thu_do = "dublin"	match_season
select distinct t2.vi_tri from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t1.thu_do = "dublin"	match_season
select t1.ngon_ngu_ban_dia_chinh_thuc from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.truong_dai_hoc = "maryland" or t2.truong_dai_hoc = "duke"	match_season
select t1.ngon_ngu_ban_dia_chinh_thuc from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.truong_dai_hoc = "maryland" or t2.truong_dai_hoc = "duke"	match_season
select count ( distinct t1.ngon_ngu_ban_dia_chinh_thuc ) from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.vi_tri = "defender"	match_season
select count ( distinct t1.ngon_ngu_ban_dia_chinh_thuc ) from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.vi_tri = "defender"	match_season
select t1.mua_giai , t1.cau_thu , t2.ten from tran_dau_trong_mua_giai as t1 join doi as t2 on t1.doi = t2.id_doi	match_season
select t1.mua_giai , t1.cau_thu , t2.ten from tran_dau_trong_mua_giai as t1 join doi as t2 on t1.doi = t2.id_doi	match_season
select t1.vi_tri from tran_dau_trong_mua_giai as t1 join doi as t2 on t1.doi = t2.id_doi where t2.ten = "ryley goldner"	match_season
select t1.vi_tri from tran_dau_trong_mua_giai as t1 join doi as t2 on t1.doi = t2.id_doi where t2.ten = "ryley goldner"	match_season
select count ( distinct t1.truong_dai_hoc ) from tran_dau_trong_mua_giai as t1 join doi as t2 on t1.doi = t2.id_doi where t2.ten = "columbus crew"	match_season
select count ( distinct t1.truong_dai_hoc ) from tran_dau_trong_mua_giai as t1 join doi as t2 on t1.doi = t2.id_doi where t2.ten = "columbus crew"	match_season
select t1.cau_thu , t1.so_nam_da_choi from cau_thu as t1 join doi as t2 on t1.doi = t2.id_doi where t2.ten = "columbus crew"	match_season
select t1.cau_thu , t1.so_nam_da_choi from cau_thu as t1 join doi as t2 on t1.doi = t2.id_doi where t2.ten = "columbus crew"	match_season
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
select t1.ten_quoc_gia from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.vi_tri = "forward" intersect select t1.ten_quoc_gia from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.vi_tri = "defender"	match_season
select t1.ten_quoc_gia from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.vi_tri = "forward" intersect select t1.ten_quoc_gia from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.vi_tri = "defender"	match_season
select truong_dai_hoc from tran_dau_trong_mua_giai where vi_tri = "midfielder" intersect select truong_dai_hoc from tran_dau_trong_mua_giai where vi_tri = "defender"	match_season
select truong_dai_hoc from tran_dau_trong_mua_giai where vi_tri = "midfielder" intersect select truong_dai_hoc from tran_dau_trong_mua_giai where vi_tri = "defender"	match_season
select count ( * ) from toi_pham	perpetrator
select ngay from toi_pham order by so_nguoi_bi_giet desc	perpetrator
select so_nguoi_bi_thuong from toi_pham order by so_nguoi_bi_thuong asc	perpetrator
select avg ( so_nguoi_bi_thuong ) from toi_pham	perpetrator
select dia_diem from toi_pham order by so_nguoi_bi_giet desc limit 1	perpetrator
select ten from ca_nhan order by chieu_cao asc	perpetrator
select t1.ten from ca_nhan as t1 join toi_pham as t2 on t1.id_ca_nhan = t2.id_ca_nhan	perpetrator
select t1.ten from ca_nhan as t1 join toi_pham as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t2.quoc_gia != "china"	perpetrator
select t1.ten from ca_nhan as t1 join toi_pham as t2 on t1.id_ca_nhan = t2.id_ca_nhan order by t1.can_nang desc limit 1	perpetrator
select sum ( t2.so_nguoi_bi_giet ) from ca_nhan as t1 join toi_pham as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t1.chieu_cao > 1.84	perpetrator
select t1.ten from ca_nhan as t1 join toi_pham as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t2.quoc_gia = "china" or t2.quoc_gia = "japan"	perpetrator
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
select thoi_gian , so_hieu_tau from tau_hoa where diem_den = "chennai" order by thoi_gian	station_weather
select count ( * ) from tau_hoa where ten like "%express%"	station_weather
select so_hieu_tau , thoi_gian from tau_hoa where diem_khoi_hanh = "chennai" and diem_den = "guruvayur"	station_weather
select diem_khoi_hanh , count ( * ) from tau_hoa group by diem_khoi_hanh	station_weather
select t1.ten from tau_hoa as t1 join lo_trinh as t2 on t1.id = t2.id_tau group by t2.id_tau order by count ( * ) desc limit 1	station_weather
select count ( * ) , t1.ten_mang_luoi , t1.dich_vu from nha_ga as t1 join lo_trinh as t2 on t1.id = t2.id_nha_ga group by t2.id_nha_ga	station_weather
select avg ( nhiet_do_cao ) , ngay_trong_tuan from thoi_tiet_hang_tuan group by ngay_trong_tuan	station_weather
select max ( t1.nhiet_do_thap ) , avg ( t1.luong_mua ) from thoi_tiet_hang_tuan as t1 join nha_ga as t2 on t1.id_nha_ga = t2.id where t2.ten_mang_luoi = "amersham"	station_weather
select t3.ten , t3.thoi_gian from nha_ga as t1 join lo_trinh as t2 on t1.id = t2.id_nha_ga join tau_hoa as t3 on t2.id_tau = t3.id where t1.chinh_quyen_dia_phuong = "chiltern"	station_weather
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
select count ( * ) from ca_nhan where la_nam_hay_nu = "f" and tuoi > 30	wedding
select quoc_gia from ca_nhan where tuoi < 25 intersect select quoc_gia from ca_nhan where tuoi > 30	wedding
select min ( tuoi ) , max ( tuoi ) , avg ( tuoi ) from ca_nhan	wedding
select ten , quoc_gia from ca_nhan where tuoi < ( select avg ( tuoi ) from ca_nhan )	wedding
select t2.ten , t3.ten from le_cuoi as t1 join ca_nhan as t2 on t1.id_nam = t2.id_ca_nhan join ca_nhan as t3 on t1.id_nu = t3.id_ca_nhan where t1.nam > 2014	wedding
select ten , tuoi from ca_nhan where la_nam_hay_nu = "t" and id_ca_nhan not in ( select id_nam from le_cuoi )	wedding
select ten from nha_tho except select t1.ten from nha_tho as t1 join le_cuoi as t2 on t1.id_nha_tho = t2.id_nha_tho where t2.nam = 2015	wedding
select t1.ten from nha_tho as t1 join le_cuoi as t2 on t1.id_nha_tho = t2.id_nha_tho group by t1.id_nha_tho having count ( * ) >= 2	wedding
select t2.ten from le_cuoi as t1 join ca_nhan as t2 on t1.id_nu = t2.id_ca_nhan where t1.nam = 2016 and t2.la_nam_hay_nu = "f" and t2.quoc_gia = "canada"	wedding
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
select ten , ho , so_dien_thoai from giang_vien where gioi_tinh = "f"	activity_1
select ten , ho , so_dien_thoai from giang_vien where gioi_tinh = "f"	activity_1
select id_giang_vien from giang_vien where gioi_tinh = "m"	activity_1
select id_giang_vien from giang_vien where gioi_tinh = "m"	activity_1
select count ( * ) from giang_vien where gioi_tinh = "f" and ngach = "professor"	activity_1
select count ( * ) from giang_vien where gioi_tinh = "f" and ngach = "professor"	activity_1
select so_dien_thoai , so_phong , toa_nha from giang_vien where ten = "jerry" and ho = "prince"	activity_1
select so_dien_thoai , so_phong , toa_nha from giang_vien where ten = "jerry" and ho = "prince"	activity_1
select count ( * ) from giang_vien where ngach = "professor" and toa_nha = "neb"	activity_1
select count ( * ) from giang_vien where ngach = "professor" and toa_nha = "neb"	activity_1
select ten , ho from giang_vien where ngach = "instructor"	activity_1
select ten , ho from giang_vien where ngach = "instructor"	activity_1
select toa_nha , count ( * ) from giang_vien group by toa_nha	activity_1
select toa_nha , count ( * ) from giang_vien group by toa_nha	activity_1
select toa_nha from giang_vien group by toa_nha order by count ( * ) desc limit 1	activity_1
select toa_nha from giang_vien group by toa_nha order by count ( * ) desc limit 1	activity_1
select toa_nha from giang_vien where ngach = "professor" group by toa_nha having count ( * ) >= 10	activity_1
select toa_nha from giang_vien where ngach = "professor" group by toa_nha having count ( * ) >= 10	activity_1
select ngach , count ( * ) from giang_vien group by ngach	activity_1
select ngach , count ( * ) from giang_vien group by ngach	activity_1
select ngach , gioi_tinh , count ( * ) from giang_vien group by ngach , gioi_tinh	activity_1
select ngach , gioi_tinh , count ( * ) from giang_vien group by ngach , gioi_tinh	activity_1
select ngach from giang_vien group by ngach order by count ( * ) asc limit 1	activity_1
select ngach from giang_vien group by ngach order by count ( * ) asc limit 1	activity_1
select gioi_tinh , count ( * ) from giang_vien where ngach = "asstprof" group by gioi_tinh	activity_1
select gioi_tinh , count ( * ) from giang_vien where ngach = "asstprof" group by gioi_tinh	activity_1
select t1.ten , t1.ho from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van where t2.ten = "linda" and t2.ho = "smith"	activity_1
select t1.ten , t1.ho from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van where t2.ten = "linda" and t2.ho = "smith"	activity_1
select t2.id_sinh_vien from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van where t1.ngach = "professor"	activity_1
select t2.id_sinh_vien from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van where t1.ngach = "professor"	activity_1
select t2.ten , t2.ho from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van where t1.ten = "michael" and t1.ho = "goodrich"	activity_1
select t2.ten , t2.ho from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van where t1.ten = "michael" and t1.ho = "goodrich"	activity_1
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
select count ( * ) from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien where t1.ten = "mark" and t1.ho = "giuliano"	activity_1
select count ( * ) from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien where t1.ten = "mark" and t1.ho = "giuliano"	activity_1
select t3.ten_hoat_dong from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t3.id_hoat_dong = t2.id_hoat_dong where t1.ten = "mark" and t1.ho = "giuliano"	activity_1
select t3.ten_hoat_dong from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t3.id_hoat_dong = t2.id_hoat_dong where t1.ten = "mark" and t1.ho = "giuliano"	activity_1
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
select distinct t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = "canoeing" or t3.ten_hoat_dong = "kayaking"	activity_1
select distinct t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = "canoeing" or t3.ten_hoat_dong = "kayaking"	activity_1
select ho from giang_vien where ngach = "professor" except select distinct t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = "canoeing" or t3.ten_hoat_dong = "kayaking"	activity_1
select ho from giang_vien where ngach = "professor" except select distinct t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = "canoeing" or t3.ten_hoat_dong = "kayaking"	activity_1
select t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = "canoeing" intersect select t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = "kayaking"	activity_1
select t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = "canoeing" intersect select t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = "kayaking"	activity_1
select t1.id_sinh_vien from tham_gia_vao as t1 join hoat_dong as t2 on t2.id_hoat_dong = t2.id_hoat_dong where t2.ten_hoat_dong = "canoeing" intersect select t1.id_sinh_vien from tham_gia_vao as t1 join hoat_dong as t2 on t2.id_hoat_dong = t2.id_hoat_dong where t2.ten_hoat_dong = "kayaking"	activity_1
select t1.id_sinh_vien from tham_gia_vao as t1 join hoat_dong as t2 on t2.id_hoat_dong = t2.id_hoat_dong where t2.ten_hoat_dong = "canoeing" intersect select t1.id_sinh_vien from tham_gia_vao as t1 join hoat_dong as t2 on t2.id_hoat_dong = t2.id_hoat_dong where t2.ten_hoat_dong = "kayaking"	activity_1
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
select t1.tong from nguoi_luyen_the_hinh as t1 join ca_nhan as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t2.ngay_sinh like "%january%"	body_builder
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
select avg ( chieu_cao ) , avg ( can_nang ) from ca_nhan where gioi_tinh = "m"	candidate_poll
select avg ( chieu_cao ) , avg ( can_nang ) from ca_nhan where gioi_tinh = "m"	candidate_poll
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
select t1.ten from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t1.gioi_tinh = "f" order by t1.ten	candidate_poll
select t1.ten from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t1.gioi_tinh = "f" order by t1.ten	candidate_poll
select ten from ca_nhan where chieu_cao < ( select avg ( chieu_cao ) from ca_nhan )	candidate_poll
select ten from ca_nhan where chieu_cao < ( select avg ( chieu_cao ) from ca_nhan )	candidate_poll
select * from ca_nhan	candidate_poll
select * from ca_nhan	candidate_poll
select thanh_pho_chu_nha from thanh_pho_chu_nha order by nam desc limit 1	city_record
select thanh_pho_chu_nha from thanh_pho_chu_nha order by nam desc limit 1	city_record
select id_tran_dau from tran_dau where giai_dau = "1994 fifa world cup qualification"	city_record
select id_tran_dau from tran_dau where giai_dau = "1994 fifa world cup qualification"	city_record
select t1.thanh_pho from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha where t2.nam > 2010	city_record
select t1.thanh_pho from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha where t2.nam > 2010	city_record
select t1.thanh_pho from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha group by t2.thanh_pho_chu_nha order by count ( * ) desc limit 1	city_record
select t1.thanh_pho from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha group by t2.thanh_pho_chu_nha order by count ( * ) desc limit 1	city_record
select t3.dia_diem from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha join tran_dau as t3 on t2.id_tran_dau = t3.id_tran_dau where t1.thanh_pho = "nanjing ( jiangsu )" and t3.giai_dau = "1994 fifa world cup qualification"	city_record
select t3.dia_diem from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha join tran_dau as t3 on t2.id_tran_dau = t3.id_tran_dau where t1.thanh_pho = "nanjing ( jiangsu )" and t3.giai_dau = "1994 fifa world cup qualification"	city_record
select t2.thang_mot from thanh_pho as t1 join nhiet_do as t2 on t1.id_thanh_pho = t2.id_thanh_pho where t1.thanh_pho = "shanghai"	city_record
select t2.thang_mot from thanh_pho as t1 join nhiet_do as t2 on t1.id_thanh_pho = t2.id_thanh_pho where t1.thanh_pho = "shanghai"	city_record
select t2.nam from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha where t1.thanh_pho = "taizhou ( zhejiang )"	city_record
select t2.nam from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha where t1.thanh_pho = "taizhou ( zhejiang )"	city_record
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
select count ( * ) from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where ten_khoa = "accounting"	college_1
select count ( * ) from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where ten_khoa = "accounting"	college_1
select count ( distinct ma_so_nhan_vien_cua_giao_su ) from lop_hoc where ma_khoa_hoc = "acct-211"	college_1
select count ( distinct ma_so_nhan_vien_cua_giao_su ) from lop_hoc where ma_khoa_hoc = "acct-211"	college_1
select t3.ten_cua_nhan_vien , t3.ho_cua_nhan_vien from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa join nhan_vien as t3 on t1.ma_so_nhan_vien = t3.ma_so_nhan_vien where ten_khoa = "biology"	college_1
select t3.ten_cua_nhan_vien , t3.ho_cua_nhan_vien from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa join nhan_vien as t3 on t1.ma_so_nhan_vien = t3.ma_so_nhan_vien where ten_khoa = "biology"	college_1
select distinct t1.ten_cua_nhan_vien , t1.ngay_sinh_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where ma_khoa_hoc = "acct-211"	college_1
select distinct t1.ten_cua_nhan_vien , t1.ngay_sinh_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where ma_khoa_hoc = "acct-211"	college_1
select count ( * ) from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where t1.ho_cua_nhan_vien = "graztevski"	college_1
select count ( * ) from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where t1.ho_cua_nhan_vien = "graztevski"	college_1
select ma_truong from khoa where ten_khoa = "accounting"	college_1
select ma_truong from khoa where ten_khoa = "accounting"	college_1
select so_luong_tin_chi_cua_khoa_hoc , mo_ta_ve_khoa_hoc from khoa_hoc where ma_khoa_hoc = "cis-220"	college_1
select so_luong_tin_chi_cua_khoa_hoc , mo_ta_ve_khoa_hoc from khoa_hoc where ma_khoa_hoc = "cis-220"	college_1
select dia_chi_khoa from khoa where ten_khoa = "history"	college_1
select dia_chi_khoa from khoa where ten_khoa = "history"	college_1
select count ( distinct dia_chi_khoa ) from khoa where ma_truong = "bus"	college_1
select count ( distinct dia_chi_khoa ) from khoa where ma_truong = "bus"	college_1
select count ( distinct dia_chi_khoa ) , ma_truong from khoa group by ma_truong	college_1
select count ( distinct dia_chi_khoa ) , ma_truong from khoa group by ma_truong	college_1
select so_luong_tin_chi_cua_khoa_hoc , mo_ta_ve_khoa_hoc from khoa_hoc where ma_khoa_hoc = "qm-261"	college_1
select so_luong_tin_chi_cua_khoa_hoc , mo_ta_ve_khoa_hoc from khoa_hoc where ma_khoa_hoc = "qm-261"	college_1
select count ( distinct ten_khoa ) , ma_truong from khoa group by ma_truong	college_1
select count ( distinct ten_khoa ) , ma_truong from khoa group by ma_truong	college_1
select count ( distinct ten_khoa ) , ma_truong from khoa group by ma_truong having count ( distinct ten_khoa ) < 5	college_1
select count ( distinct ten_khoa ) , ma_truong from khoa group by ma_truong having count ( distinct ten_khoa ) < 5	college_1
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
select count ( * ) , ma_khoa from giao_su where bang_cap_cao_nhat = "ph.d." group by ma_khoa	college_1
select count ( * ) , ma_khoa from giao_su where bang_cap_cao_nhat = "ph.d." group by ma_khoa	college_1
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
select count ( * ) from khoa as t1 join khoa_hoc as t2 on t1.ma_khoa = t2.ma_khoa where ten_khoa = "computer info. systems"	college_1
select count ( * ) from khoa as t1 join khoa_hoc as t2 on t1.ma_khoa = t2.ma_khoa where ten_khoa = "computer info. systems"	college_1
select count ( distinct lop_hoc_phan ) from lop_hoc where ma_khoa_hoc = "acct-211"	college_1
select count ( distinct lop_hoc_phan ) from lop_hoc where ma_khoa_hoc = "acct-211"	college_1
select sum ( t1.so_luong_tin_chi_cua_khoa_hoc ) , t1.ma_khoa from khoa_hoc as t1 join lop_hoc as t2 on t1.ma_khoa_hoc = t2.ma_khoa_hoc group by t1.ma_khoa	college_1
select sum ( t1.so_luong_tin_chi_cua_khoa_hoc ) , t1.ma_khoa from khoa_hoc as t1 join lop_hoc as t2 on t1.ma_khoa_hoc = t2.ma_khoa_hoc group by t1.ma_khoa	college_1
select t3.ten_khoa from khoa_hoc as t1 join lop_hoc as t2 on t1.ma_khoa_hoc = t2.ma_khoa_hoc join khoa as t3 on t1.ma_khoa = t3.ma_khoa group by t1.ma_khoa order by sum ( t1.so_luong_tin_chi_cua_khoa_hoc ) desc limit 1	college_1
select t3.ten_khoa from khoa_hoc as t1 join lop_hoc as t2 on t1.ma_khoa_hoc = t2.ma_khoa_hoc join khoa as t3 on t1.ma_khoa = t3.ma_khoa group by t1.ma_khoa order by sum ( t1.so_luong_tin_chi_cua_khoa_hoc ) desc limit 1	college_1
select count ( * ) from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop where t1.ma_khoa_hoc = "acct-211"	college_1
select count ( * ) from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop where t1.ma_khoa_hoc = "acct-211"	college_1
select t3.ten_cua_sinh_vien from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t2.ma_so_sinh_vien = t3.ma_so_sinh_vien where t1.ma_khoa_hoc = "acct-211"	college_1
select t3.ten_cua_sinh_vien from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t2.ma_so_sinh_vien = t3.ma_so_sinh_vien where t1.ma_khoa_hoc = "acct-211"	college_1
select t3.ten_cua_sinh_vien from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t2.ma_so_sinh_vien = t3.ma_so_sinh_vien where t1.ma_khoa_hoc = "acct-211" and t2.diem_so = "c"	college_1
select t3.ten_cua_sinh_vien from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t2.ma_so_sinh_vien = t3.ma_so_sinh_vien where t1.ma_khoa_hoc = "acct-211" and t2.diem_so = "c"	college_1
select count ( * ) from nhan_vien	college_1
select count ( * ) from giao_su where bang_cap_cao_nhat = "ph.d."	college_1
select count ( * ) from giao_su where bang_cap_cao_nhat = "ph.d."	college_1
select count ( * ) from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join khoa_hoc as t3 on t1.ma_khoa_hoc = t3.ma_khoa_hoc join khoa as t4 on t3.ma_khoa = t4.ma_khoa where t4.ten_khoa = "accounting"	college_1
select count ( * ) from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join khoa_hoc as t3 on t1.ma_khoa_hoc = t3.ma_khoa_hoc join khoa as t4 on t3.ma_khoa = t4.ma_khoa where t4.ten_khoa = "accounting"	college_1
select t4.ten_khoa from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join khoa_hoc as t3 on t1.ma_khoa_hoc = t3.ma_khoa_hoc join khoa as t4 on t3.ma_khoa = t4.ma_khoa group by t3.ma_khoa order by count ( * ) desc limit 1	college_1
select t4.ten_khoa from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join khoa_hoc as t3 on t1.ma_khoa_hoc = t3.ma_khoa_hoc join khoa as t4 on t3.ma_khoa = t4.ma_khoa group by t3.ma_khoa order by count ( * ) desc limit 1	college_1
select ten_khoa from khoa order by ten_khoa	college_1
select ten_khoa from khoa order by ten_khoa	college_1
select ma_lop_hoc from lop_hoc where phong_hoc = "klr209"	college_1
select ma_lop_hoc from lop_hoc where phong_hoc = "klr209"	college_1
select ten_cua_nhan_vien from nhan_vien where ma_cong_viec_cua_nhan_vien = "prof" order by ngay_sinh_cua_nhan_vien	college_1
select ten_cua_nhan_vien from nhan_vien where ma_cong_viec_cua_nhan_vien = "prof" order by ngay_sinh_cua_nhan_vien	college_1
select t2.ten_cua_nhan_vien , t1.van_phong_giao_su from giao_su as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien order by t2.ten_cua_nhan_vien	college_1
select t2.ten_cua_nhan_vien , t1.van_phong_giao_su from giao_su as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien order by t2.ten_cua_nhan_vien	college_1
select ten_cua_nhan_vien , ho_cua_nhan_vien from nhan_vien order by ngay_sinh_cua_nhan_vien limit 1	college_1
select ten_cua_nhan_vien , ho_cua_nhan_vien from nhan_vien order by ngay_sinh_cua_nhan_vien limit 1	college_1
select ten_cua_sinh_vien , ho_cua_sinh_vien , gpa_cua_sinh_vien from sinh_vien where gpa_cua_sinh_vien > 3 order by ngay_sinh_cua_sinh_vien desc limit 1	college_1
select ten_cua_sinh_vien , ho_cua_sinh_vien , gpa_cua_sinh_vien from sinh_vien where gpa_cua_sinh_vien > 3 order by ngay_sinh_cua_sinh_vien desc limit 1	college_1
select distinct ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien where diem_so = "c"	college_1
select distinct ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien where diem_so = "c"	college_1
select t2.ten_khoa from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_khoa order by count ( * ) limit 1	college_1
select t2.ten_khoa from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_khoa order by count ( * ) limit 1	college_1
select t2.ten_khoa , t1.ma_khoa from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where t1.bang_cap_cao_nhat = "ph.d." group by t1.ma_khoa order by count ( * ) desc limit 1	college_1
select t2.ten_khoa , t1.ma_khoa from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where t1.bang_cap_cao_nhat = "ph.d." group by t1.ma_khoa order by count ( * ) desc limit 1	college_1
select ten_cua_nhan_vien from nhan_vien where ma_cong_viec_cua_nhan_vien = "prof" except select t1.ten_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su	college_1
select ten_cua_nhan_vien from nhan_vien where ma_cong_viec_cua_nhan_vien = "prof" except select t1.ten_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su	college_1
select t1.ten_cua_nhan_vien from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t2.ma_khoa = t3.ma_khoa where t3.ten_khoa = "history" except select t4.ten_cua_nhan_vien from nhan_vien as t4 join lop_hoc as t5 on t4.ma_so_nhan_vien = t5.ma_so_nhan_vien_cua_giao_su	college_1
select t1.ten_cua_nhan_vien from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t2.ma_khoa = t3.ma_khoa where t3.ten_khoa = "history" except select t4.ten_cua_nhan_vien from nhan_vien as t4 join lop_hoc as t5 on t4.ma_so_nhan_vien = t5.ma_so_nhan_vien_cua_giao_su	college_1
select t1.ho_cua_nhan_vien , t2.van_phong_giao_su from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t2.ma_khoa = t3.ma_khoa where t3.ten_khoa = "history"	college_1
select t1.ho_cua_nhan_vien , t2.van_phong_giao_su from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t2.ma_khoa = t3.ma_khoa where t3.ten_khoa = "history"	college_1
select t3.ten_khoa , t2.van_phong_giao_su from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t2.ma_khoa = t3.ma_khoa where t1.ho_cua_nhan_vien = "heffington"	college_1
select t3.ten_khoa , t2.van_phong_giao_su from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t2.ma_khoa = t3.ma_khoa where t1.ho_cua_nhan_vien = "heffington"	college_1
select t1.ho_cua_nhan_vien , t1.ngay_bat_dau_cong_viec_cua_nhan_vien from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien where t2.van_phong_giao_su = "dre 102"	college_1
select t1.ho_cua_nhan_vien , t1.ngay_bat_dau_cong_viec_cua_nhan_vien from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien where t2.van_phong_giao_su = "dre 102"	college_1
select t1.ma_khoa_hoc from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t3.ma_so_sinh_vien = t2.ma_so_sinh_vien where t3.ho_cua_sinh_vien = "smithson"	college_1
select t1.ma_khoa_hoc from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t3.ma_so_sinh_vien = t2.ma_so_sinh_vien where t3.ho_cua_sinh_vien = "smithson"	college_1
select t4.mo_ta_ve_khoa_hoc , t4.so_luong_tin_chi_cua_khoa_hoc from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t3.ma_so_sinh_vien = t2.ma_so_sinh_vien join khoa_hoc as t4 on t4.ma_khoa_hoc = t1.ma_khoa_hoc where t3.ho_cua_sinh_vien = "smithson"	college_1
select t4.mo_ta_ve_khoa_hoc , t4.so_luong_tin_chi_cua_khoa_hoc from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t3.ma_so_sinh_vien = t2.ma_so_sinh_vien join khoa_hoc as t4 on t4.ma_khoa_hoc = t1.ma_khoa_hoc where t3.ho_cua_sinh_vien = "smithson"	college_1
select count ( * ) from giao_su where bang_cap_cao_nhat = "ph.d." or bang_cap_cao_nhat = "ma"	college_1
select count ( * ) from giao_su where bang_cap_cao_nhat = "ph.d." or bang_cap_cao_nhat = "ma"	college_1
select count ( * ) from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where t2.ten_khoa = "accounting" or t2.ten_khoa = "biology"	college_1
select count ( * ) from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where t2.ten_khoa = "accounting" or t2.ten_khoa = "biology"	college_1
select t1.ten_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where ma_khoa_hoc = "cis-220" intersect select t1.ten_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where ma_khoa_hoc = "qm-261"	college_1
select t1.ten_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where ma_khoa_hoc = "cis-220" intersect select t1.ten_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where ma_khoa_hoc = "qm-261"	college_1
select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t2.ma_lop = t3.ma_lop_hoc join khoa_hoc as t4 on t3.ma_khoa_hoc = t4.ma_khoa_hoc join khoa as t5 on t5.ma_khoa = t4.ma_khoa where t5.ten_khoa = "accounting" intersect select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t2.ma_lop = t3.ma_lop_hoc join khoa_hoc as t4 on t3.ma_khoa_hoc = t4.ma_khoa_hoc join khoa as t5 on t5.ma_khoa = t4.ma_khoa where t5.ten_khoa = "computer info. systems"	college_1
select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t2.ma_lop = t3.ma_lop_hoc join khoa_hoc as t4 on t3.ma_khoa_hoc = t4.ma_khoa_hoc join khoa as t5 on t5.ma_khoa = t4.ma_khoa where t5.ten_khoa = "accounting" intersect select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t2.ma_lop = t3.ma_lop_hoc join khoa_hoc as t4 on t3.ma_khoa_hoc = t4.ma_khoa_hoc join khoa as t5 on t5.ma_khoa = t4.ma_khoa where t5.ten_khoa = "computer info. systems"	college_1
select avg ( t2.gpa_cua_sinh_vien ) from dang_ky_khoa_hoc as t1 join sinh_vien as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t1.ma_lop = t3.ma_lop_hoc where t3.ma_khoa_hoc = "acct-211"	college_1
select avg ( t2.gpa_cua_sinh_vien ) from dang_ky_khoa_hoc as t1 join sinh_vien as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t1.ma_lop = t3.ma_lop_hoc where t3.ma_khoa_hoc = "acct-211"	college_1
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
select t1.ten_cua_nhan_vien , t2.van_phong_giao_su from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t3.ma_khoa = t2.ma_khoa where t3.ten_khoa = "history" and t2.bang_cap_cao_nhat = "ph.d."	college_1
select t1.ten_cua_nhan_vien , t2.van_phong_giao_su from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t3.ma_khoa = t2.ma_khoa where t3.ten_khoa = "history" and t2.bang_cap_cao_nhat = "ph.d."	college_1
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
select t1.ten_cua_sinh_vien , t1.ho_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien where t2.diem_so = "c" or t2.diem_so = "a"	college_1
select t1.ten_cua_sinh_vien , t1.ho_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien where t2.diem_so = "c" or t2.diem_so = "a"	college_1
select t2.ten_cua_nhan_vien , t1.phong_hoc from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien join giao_su as t3 on t2.ma_so_nhan_vien = t3.ma_so_nhan_vien join khoa as t4 on t4.ma_khoa = t3.ma_khoa where t4.ten_khoa = "accounting"	college_1
select t2.ten_cua_nhan_vien , t1.phong_hoc from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien join giao_su as t3 on t2.ma_so_nhan_vien = t3.ma_so_nhan_vien join khoa as t4 on t4.ma_khoa = t3.ma_khoa where t4.ten_khoa = "accounting"	college_1
select distinct t2.ten_cua_nhan_vien , t3.bang_cap_cao_nhat from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien join giao_su as t3 on t2.ma_so_nhan_vien = t3.ma_so_nhan_vien join khoa as t4 on t4.ma_khoa = t3.ma_khoa where t4.ten_khoa = "computer info. systems"	college_1
select distinct t2.ten_cua_nhan_vien , t3.bang_cap_cao_nhat from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien join giao_su as t3 on t2.ma_so_nhan_vien = t3.ma_so_nhan_vien join khoa as t4 on t4.ma_khoa = t3.ma_khoa where t4.ten_khoa = "computer info. systems"	college_1
select t1.ho_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien where t2.diem_so = "a" and t2.ma_lop = 10018	college_1
select t1.ho_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien where t2.diem_so = "a" and t2.ma_lop = 10018	college_1
select t2.ten_cua_nhan_vien , t1.van_phong_giao_su from giao_su as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t1.ma_khoa = t3.ma_khoa where t3.ten_khoa = "history" and t1.bang_cap_cao_nhat != "ph.d."	college_1
select t2.ten_cua_nhan_vien , t1.van_phong_giao_su from giao_su as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t1.ma_khoa = t3.ma_khoa where t3.ten_khoa = "history" and t1.bang_cap_cao_nhat != "ph.d."	college_1
select t2.ten_cua_nhan_vien from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien group by t1.ma_so_nhan_vien_cua_giao_su having count ( * ) > 1	college_1
select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien group by t2.ma_so_sinh_vien having count ( * ) = 1	college_1
select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien group by t2.ma_so_sinh_vien having count ( * ) = 1	college_1
select t2.ten_khoa from khoa_hoc as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where t1.mo_ta_ve_khoa_hoc like "%statistics%"	college_1
select t2.ten_khoa from khoa_hoc as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where t1.mo_ta_ve_khoa_hoc like "%statistics%"	college_1
select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t2.ma_lop = t3.ma_lop_hoc where t3.ma_khoa_hoc = "acct-211" and t1.ho_cua_sinh_vien like "s%"	college_1
select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t2.ma_lop = t3.ma_lop_hoc where t3.ma_khoa_hoc = "acct-211" and t1.ho_cua_sinh_vien like "s%"	college_1
select ma_trang_thai_tai_lieu from trang_thai_cua_tai_lieu	cre_Doc_Control_Systems
select mo_ta_ve_trang_thai_tai_lieu from trang_thai_cua_tai_lieu where ma_trang_thai_tai_lieu = "working"	cre_Doc_Control_Systems
select ma_loai_tai_lieu from loai_tai_lieu	cre_Doc_Control_Systems
select mo_ta_ve_loai_tai_lieu from loai_tai_lieu where ma_loai_tai_lieu = "paper"	cre_Doc_Control_Systems
select ma_dai_ly_van_chuyen from dai_ly_van_chuyen_tai_lieu where ten_dai_ly_van_chuyen = "ups"	cre_Doc_Control_Systems
select ma_vai_tro from vai_tro	cre_Doc_Control_Systems
select mo_ta_ve_vai_tro from vai_tro where ma_vai_tro = "ed"	cre_Doc_Control_Systems
select count ( * ) from nhan_vien	cre_Doc_Control_Systems
select t1.mo_ta_ve_vai_tro from vai_tro as t1 join nhan_vien as t2 on t1.ma_vai_tro = t2.ma_vai_tro where t2.ten_nhan_vien = "koby"	cre_Doc_Control_Systems
select id_tai_lieu , ngay_lap_bien_lai from tai_lieu	cre_Doc_Control_Systems
select t1.mo_ta_ve_vai_tro , t2.ma_vai_tro , count ( * ) from vai_tro as t1 join nhan_vien as t2 on t1.ma_vai_tro = t2.ma_vai_tro group by t2.ma_vai_tro	cre_Doc_Control_Systems
select vai_tro.mo_ta_ve_vai_tro , count ( nhan_vien.id_nhan_vien ) from vai_tro join nhan_vien on nhan_vien.ma_vai_tro = vai_tro.ma_vai_tro group by nhan_vien.ma_vai_tro having count ( nhan_vien.id_nhan_vien ) > 1	cre_Doc_Control_Systems
select trang_thai_cua_tai_lieu.mo_ta_ve_trang_thai_tai_lieu from trang_thai_cua_tai_lieu join tai_lieu on tai_lieu.ma_trang_thai_tai_lieu = trang_thai_cua_tai_lieu.ma_trang_thai_tai_lieu where tai_lieu.id_tai_lieu = 1	cre_Doc_Control_Systems
select ma_loai_tai_lieu from tai_lieu where id_tai_lieu = 2	cre_Doc_Control_Systems
select id_tai_lieu from tai_lieu where ma_trang_thai_tai_lieu = "done" and ma_loai_tai_lieu = "paper"	cre_Doc_Control_Systems
select dai_ly_van_chuyen_tai_lieu.ten_dai_ly_van_chuyen from dai_ly_van_chuyen_tai_lieu join tai_lieu on tai_lieu.ma_dai_ly_van_chuyen = dai_ly_van_chuyen_tai_lieu.ma_dai_ly_van_chuyen where tai_lieu.id_tai_lieu = 2	cre_Doc_Control_Systems
