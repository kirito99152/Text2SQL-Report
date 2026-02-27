select t1.ten_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where ma_khoa_hoc = "cis-220" intersect select t1.ten_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su where ma_khoa_hoc = "qm-261"	college_1
select count ( distinct ma_tien_te ) from nhom_hoi_thao_kich	cre_Drama_Workshop_Groups
select t1.ma_san_bay from san_bay as t1 join chuyen_bay as t2 on t1.ma_san_bay = t2.san_bay_dich or t1.ma_san_bay = t2.san_bay_khoi_hanh group by t1.ma_san_bay order by count ( * ) desc limit 1	flight_2
select distinct ten from danh_sach where phong_hoc = 107	student_1
select distinct t1.ten , t1.ho from nhan_vien as t1 join luot_cho_thue as t2 on t1.id_nhan_vien = t2.id_nhan_vien join khach_hang as t3 on t2.id_khach_hang = t3.id_khach_hang where t3.ten = "april" and t3.ho = "burns"	sakila_1
select distinct vi_tri from tran_dau_trong_mua_giai where truong_dai_hoc = "ucla" or truong_dai_hoc = "duke"	match_season
select id_san_pham from hoa_don group by id_san_pham order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat group by ho order by count ( * ) desc limit 1	music_2
select count ( * ) from khach_hang_1	cre_Drama_Workshop_Groups
select t1.ten_khu_pho_lan_can from khu_vuc_lan_can as t1 join doanh_nghiep as t2 on t1.id_doanh_nghiep = t2.id_doanh_nghiep where t2.thanh_pho = "madison" group by t1.ten_khu_pho_lan_can order by count ( distinct t2.ten ) desc limit 1	yelp
select sum ( dan_so_thanh_pho ) from quan where dien_tich_cua_cac_thanh_pho > ( select avg ( dien_tich_cua_cac_thanh_pho ) from quan )	store_product
select count ( * ) from hang_ton_kho where id_cua_hang = 1	sakila_1
select t4.ten from le_cuoi as t1 join ca_nhan as t2 on t1.id_nam = t2.id_ca_nhan join ca_nhan as t3 on t1.id_nu = t3.id_ca_nhan join nha_tho as t4 on t4.id_nha_tho = t1.id_nha_tho where t2.tuoi > 30 or t3.tuoi > 30	wedding
select t1.ten from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t1.gioi_tinh = "f" order by t1.ten	candidate_poll
select ten_viet_tat from hang_hang_khong where ten_hang_hang_khong = "jetblue airways"	flight_2
select distinct hang_thu_am from album	music_2
select ten from nha_tho except select t1.ten from nha_tho as t1 join le_cuoi as t2 on t1.id_nha_tho = t2.id_nha_tho where t2.nam = 2015	wedding
select ten from dai_dien where dang != "republican"	election_representative
select id_sinh_vien from lan_tham_du_khoa_hoc_cua_sinh_vien where id_khoa_hoc = 301 order by ngay_tham_du desc limit 1	student_assessment
select ten_nguoi_quan_ly , quan from cua_hang order by so_luong_san_pham desc limit 1	employee_hire_evaluation
select count ( distinct ngay_xuat_ban ) from an_pham	book_2
select ten , quoc_gia from ca_nhan where tuoi < ( select avg ( tuoi ) from ca_nhan )	wedding
select count ( * ) from quoc_gia	match_season
select count ( * ) from nhan_vien	cre_Doc_Control_Systems
select t1.ten , t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = "marrotte" and t2.ho = "kirk"	student_1
select * from album where nam = 2010	music_2
select t3.chi_tiet_khach_hang from tieu_de_cua_yeu_cau as t1 join chinh_sach as t2 on t1.id_chinh_sach = t2.id_chinh_sach join khach_hang as t3 on t2.id_khach_hang = t3.id_khach_hang where t1.so_tien_duoc_tra = ( select min ( so_tien_duoc_tra ) from tieu_de_cua_yeu_cau )	insurance_and_eClaims
select count ( * ) from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where t2.ten_khoa = "accounting" or t2.ten_khoa = "biology"	college_1
select count ( * ) from giao_su where bang_cap_cao_nhat = "ph.d."	college_1
select count ( * ) from tau_hoa where ten like "%express%"	station_weather
select nam_bat_dau from ky_thuat_vien where doi = "cle" intersect select nam_bat_dau from ky_thuat_vien where doi = "cws"	machine_repair
select vi_tri , count ( * ) from tran_dau_trong_mua_giai group by vi_tri	match_season
select t1.chi_tiet_sinh_vien from sinh_vien as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien order by count ( * ) desc limit 1	student_assessment
select t1.thanh_pho from san_bay as t1 join chuyen_bay as t2 on t1.ma_san_bay = t2.san_bay_dich group by t1.thanh_pho order by count ( * ) desc limit 1	flight_2
select t1.ten_cua_sinh_vien from sinh_vien as t1 join dang_ky_khoa_hoc as t2 on t1.ma_so_sinh_vien = t2.ma_so_sinh_vien join lop_hoc as t3 on t2.ma_lop = t3.ma_lop_hoc where t3.ma_khoa_hoc = "acct-211" and t1.ho_cua_sinh_vien like "s%"	college_1
select t1.mo_ta_ve_loai_dich_vu , t1.ma_loai_dich_vu from loai_dich_vu as t1 join dich_vu as t2 on t1.ma_loai_dich_vu = t2.ma_loai_dich_vu group by t1.ma_loai_dich_vu order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select ten from doanh_nghiep where anh_gia_xep_hang = 3.5	yelp
select chi_tiet_khach_hang from khach_hang where chi_tiet_khach_hang like "%diana%"	insurance_and_eClaims
select t4.tieu_de from phan_vai as t5 join dien_vien as t1 on t5.id_dien_vien = t1.id_dien_vien join bo_phim as t4 on t4.id_bo_phim = t5.id_se_ri_phim join phan_vai as t3 on t4.id_bo_phim = t3.id_se_ri_phim join dien_vien as t2 on t3.id_dien_vien = t2.id_dien_vien where t1.ten = "woody strode" and t2.ten = "jason robards"	imdb
select t3.ten from dao_dien as t3 join dao_dien_boi as t2 on t3.id_dao_dien = t2.id_dao_dien join bo_phim as t4 on t4.id_bo_phim = t2.id_se_ri_phim join nhan as t5 on t5.id_se_ri_phim = t4.id_bo_phim join tu_khoa as t1 on t5.id_tu_khoa = t1.id where t1.tu_khoa = "nuclear weapons"	imdb
select t1.ten_khach_hang , t1.dien_thoai_khach_hang from khach_hang as t1 join luot_dat_hang_cua_khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang join mat_hang_duoc_dat as t3 on t3.id_don_hang = t2.id_don_hang group by t1.id_khach_hang order by sum ( t3.so_luong_dat_hang ) desc limit 1	customers_and_products_contacts
select truong_dai_hoc from tran_dau_trong_mua_giai where vi_tri = "midfielder" intersect select truong_dai_hoc from tran_dau_trong_mua_giai where vi_tri = "defender"	match_season
select t2.ten from anh as t1 join ong_kinh_may_anh as t2 on t1.id_ong_kinh_may_anh = t2.id group by t2.id order by count ( * ) desc limit 1	mountain_photos
select distinct t1.ten , t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t1.khoi_lop = 1 except select t1.ten , t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = "otha" and t2.ho = "moyer"	student_1
select t1.thanh_pho from thanh_pho as t1 join nhiet_do as t2 on t1.id_thanh_pho = t2.id_thanh_pho order by t2.thang_hai desc limit 1	city_record
select t3.ten_cua_nhan_vien , t3.ho_cua_nhan_vien from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa join nhan_vien as t3 on t1.ma_so_nhan_vien = t3.ma_so_nhan_vien where ten_khoa = "biology"	college_1
select tieu_de from phim where thoi_luong_phim > 100 or danh_gia_xep_hang = "pg" except select tieu_de from phim where gia_thay_the > 200	sakila_1
select t1.ten , t1.ho , t1.id_khach_hang from khach_hang as t1 join khoan_thanh_toan as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang order by sum ( so_tien ) asc limit 1	sakila_1
select ten from giao_vien where id_giao_vien not in ( select id_giao_vien from sap_xep_khoa_hoc )	course_teach
select t4.ten_khoa from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join khoa_hoc as t3 on t1.ma_khoa_hoc = t3.ma_khoa_hoc join khoa as t4 on t3.ma_khoa = t4.ma_khoa group by t3.ma_khoa order by count ( * ) desc limit 1	college_1
select t1.mua_giai from tran_dau as t1 join chan_thuong as t2 on t1.id = t2.id_tran_dau where t2.cau_thu = "walter samuel"	game_injury
select t2.ten , t2.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc group by t2.ten , t2.ho order by count ( * ) desc limit 1	student_1
select id_cua_hang from hang_ton_kho group by id_cua_hang order by count ( * ) desc limit 1	sakila_1
select t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id where vi_tri_tren_san_khau = "back" group by ho order by count ( * ) desc limit 1	music_2
select t2.ten , t2.ho from dien_vien_dien_anh as t1 join dien_vien as t2 on t1.id_dien_vien = t2.id_dien_vien group by t2.id_dien_vien having count ( * ) > 30	sakila_1
select count ( distinct t3.ten ) from anh_gia as t2 join doanh_nghiep as t1 on t2.id_doanh_nghiep = t1.id_doanh_nghiep join nguoi_tieu_dung as t3 on t3.id_nguoi_tieu_dung = t2.id_nguoi_tieu_dung where t1.ten = "bistro di napoli" and t2.nam = 2015	yelp
select t1.ngach , count ( * ) from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van group by t1.ngach	activity_1
select ten_loai_nha_hang from loai_nha_hang	restaurant_1
select ten_dai_ly_van_chuyen from dai_ly_van_chuyen_tai_lieu	cre_Doc_Control_Systems
select so_luong_nguoi_tham_du_trung_binh from san_van_dong where phan_tram_suc_chua > 100	game_injury
select count ( * ) from hang_hang_khong as t1 join chuyen_bay as t2 on t2.hang_hang_khong = t1.id_hang_hang_khong where t1.ten_hang_hang_khong = "united airlines" and t2.san_bay_khoi_hanh = "ahd"	flight_2
select t1.ten_cua_nhan_vien , t2.van_phong_giao_su from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t3.ma_khoa = t2.ma_khoa where t3.ten_khoa = "history" and t2.bang_cap_cao_nhat = "ph.d."	college_1
select id_tai_lieu , count ( so_luong_ban_sao ) from ban_sao group by id_tai_lieu order by count ( so_luong_ban_sao ) desc limit 1	cre_Doc_Control_Systems
select t1.ten from loai_hinh as t2 join doanh_nghiep as t1 on t2.id_doanh_nghiep = t1.id_doanh_nghiep where t1.anh_gia_xep_hang > 3.5 and t2.ten_loai_hinh = "restaurant"	yelp
select id_cau_thu_api from cau_thu where chieu_cao >= 180 and chieu_cao <= 190 intersect select id_cau_thu_api from dac_diem_cua_cau_thu where chan_thuan = "left"	soccer_1
select t1.thanh_pho from thanh_pho as t1 join thanh_pho_chu_nha as t2 on t1.id_thanh_pho = t2.thanh_pho_chu_nha group by t2.thanh_pho_chu_nha order by count ( * ) desc limit 1	city_record
select loai from giong_hat as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id where ho = "heilo" group by loai order by count ( * ) desc limit 1	music_2
select t2.ten , t2.ho from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van where t1.ten = "michael" and t1.ho = "goodrich"	activity_1
select t1.id_khach_hang , t2.ten_khach_hang , t2.ho_cua_khach_hang from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang order by count ( * ) desc limit 1	customers_and_invoices
select san_pham from san_pham where kich_thuoc_trang_toi_da = "a4" and so_trang_mau_tren_tung_phut < 5	store_product
select ten_khoa_hoc from khoa_hoc order by ten_khoa_hoc	student_assessment
select count ( * ) from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where t2.ten_khoa = "accounting" or t2.ten_khoa = "biology"	college_1
select count ( * ) from nha_hang join loai_cua_nha_hang on nha_hang.id_nha_hang = loai_cua_nha_hang.id_nha_hang join loai_nha_hang on loai_cua_nha_hang.id_loai_nha_hang = loai_nha_hang.id_loai_nha_hang group by loai_cua_nha_hang.id_loai_nha_hang having loai_nha_hang.ten_loai_nha_hang = "sandwich"	restaurant_1
select t4.nhac_cu from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat join nhac_cu as t4 on t4.id_bai_hat = t3.id_bai_hat and t4.id_nghe_si_trong_ban_nhac = t2.id where t2.ho = "heilo" and t3.tieu_de = "le pop"	music_2
select t2.chi_tiet_sinh_vien from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien order by t1.ngay_dang_ki desc limit 1	student_assessment
select so_dien_thoai , ma_buu_dien from dia_chi where dia_chi = "1031 daugavpils parkway"	sakila_1
select t2.ten , t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t3.tieu_de = "badlands" and t1.vi_tri_tren_san_khau = "back"	music_2
select ngach from giang_vien group by ngach order by count ( * ) asc limit 1	activity_1
select so_luong_tin_chi_cua_khoa_hoc , mo_ta_ve_khoa_hoc from khoa_hoc where ma_khoa_hoc = "cis-220"	college_1
select ngay from toi_pham order by so_nguoi_bi_giet desc	perpetrator
select distinct kich_thuoc_san_pham from san_pham	customers_and_invoices
select sum ( dan_so_thanh_pho ) from quan order by dien_tich_cua_cac_thanh_pho desc limit 3	store_product
select t1.id_bai_giang from bai_giang as t1 join nhan_vien as t2 on t1.id_nhan_vien = t2.id_nhan_vien where t2.ten = "janessa" and t2.ho = "sawayn" and biet_danh like "%s%"	driving_school
select t1.id_ky_su , t1.ten , t1.ho from ky_su_bao_tri as t1 join chuyen_tham_cua_ky_su as t2 group by t1.id_ky_su order by count ( * ) desc limit 1	assets_maintenance
select count ( distinct dia_diem ) from cua_hang	employee_hire_evaluation
select doi from cau_thu order by doi asc	school_player
select distinct t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien join hoat_dong as t3 on t2.id_hoat_dong = t2.id_hoat_dong where t3.ten_hoat_dong = "canoeing" or t3.ten_hoat_dong = "kayaking"	activity_1
select t1.ten from phan_vai as t4 join dien_vien as t1 on t4.id_dien_vien = t1.id_dien_vien join bo_phim as t5 on t5.id_bo_phim = t4.id_se_ri_phim join dao_dien_boi as t2 on t5.id_bo_phim = t2.id_se_ri_phim join dao_dien as t3 on t3.id_dao_dien = t2.id_dao_dien where t3.ten = "quentin tarantino" order by t5.nam_phat_hanh desc limit 1	imdb
select t2.ten from tran_dau as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id join chan_thuong as t3 on t1.id = t3.id_tran_dau where t3.cau_thu = "walter samuel" intersect select t2.ten from tran_dau as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id join chan_thuong as t3 on t1.id = t3.id_tran_dau where t3.cau_thu = "thiago motta"	game_injury
select ten , ngay_mo_cua from nha_tho order by ngay_mo_cua desc limit 3	wedding
select sum ( t1.so_luot_thich ) from nguoi_tieu_dung as t2 join khoan_tien_boa as t1 on t2.id_nguoi_tieu_dung = t1.id_nguoi_tieu_dung where t2.ten = "niloofar"	yelp
select distinct hang_thu_am from album	music_2
select avg ( so_luong_dat_hang ) from hoa_don where ma_phuong_thuc_thanh_toan = "mastercard"	cre_Drama_Workshop_Groups
select chi_tiet_khach_hang from khach_hang except select t2.chi_tiet_khach_hang from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang	insurance_and_eClaims
select t1.so_tien_giam_gia from phieu_giam_gia as t1 join khach_hang as t2 on t1.id_phieu_giam_gia = t2.id_phieu_giam_gia where t2.khach_hang_tot_hay_xau = "good" intersect select t1.so_tien_giam_gia from phieu_giam_gia as t1 join khach_hang as t2 on t1.id_phieu_giam_gia = t2.id_phieu_giam_gia where t2.khach_hang_tot_hay_xau = "bad"	products_for_hire
select nam_bat_dau from ky_thuat_vien where doi = "cle" intersect select nam_bat_dau from ky_thuat_vien where doi = "cws"	machine_repair
select ten from ca_nhan order by ten	student_assessment
select distinct t2.chi_tiet_khach_hang from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ma_loai_chinh_sach = "deputy" or t1.ma_loai_chinh_sach = "uniform"	insurance_and_eClaims
select ten from doi where id_doi not in ( select doi from tran_dau_trong_mua_giai )	match_season
select phong_hoc , count ( distinct khoi_lop ) from danh_sach group by phong_hoc	student_1
select t2.ten_khoa from sinh_vien as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa order by gpa_cua_sinh_vien limit 1	college_1
select ten from ca_nhan where id_ca_nhan not in ( select id_ca_nhan from ung_cu_vien )	candidate_poll
select id_san_pham from san_pham_duoc_dat group by id_san_pham having count ( * ) = 3	products_for_hire
select count ( * ) from khoa_hoc as t1 join lan_tham_du_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc where t1.ten_khoa_hoc = "english"	student_assessment
select so_dien_thoai_khach_hang from nguoi_bieu_dien where ten_khach_hang = "ashley"	cre_Drama_Workshop_Groups
select t3.ten_khoa from khoa_hoc as t1 join lop_hoc as t2 on t1.ma_khoa_hoc = t2.ma_khoa_hoc join khoa as t3 on t1.ma_khoa = t3.ma_khoa group by t1.ma_khoa order by sum ( t1.so_luong_tin_chi_cua_khoa_hoc ) desc limit 1	college_1
select t4.ten from loai_hinh as t2 join doanh_nghiep as t1 on t2.id_doanh_nghiep = t1.id_doanh_nghiep join anh_gia as t3 on t3.id_doanh_nghiep = t1.id_doanh_nghiep join nguoi_tieu_dung as t4 on t4.id_nguoi_tieu_dung = t3.id_nguoi_tieu_dung where t2.ten_loai_hinh = "restaurant" and t3.nam = 2010	yelp
select ten from doi	match_season
select count ( distinct t3.van_ban ) from loai_hinh as t2 join doanh_nghiep as t1 on t2.id_doanh_nghiep = t1.id_doanh_nghiep join anh_gia as t3 on t3.id_doanh_nghiep = t1.id_doanh_nghiep where t1.ten = "cafe zinho" and t1.tieu_bang = "texas" and t2.ten_loai_hinh = "restaurant"	yelp
select t3.chi_tiet_khach_hang from tieu_de_cua_yeu_cau as t1 join chinh_sach as t2 on t1.id_chinh_sach = t2.id_chinh_sach join khach_hang as t3 on t2.id_khach_hang = t3.id_khach_hang where t1.so_tien_duoc_yeu_cau = ( select max ( so_tien_duoc_yeu_cau ) from tieu_de_cua_yeu_cau )	insurance_and_eClaims
select t1.ten , t1.ho from khach_hang as t1 join luot_cho_thue as t2 on t1.id_khach_hang = t2.id_khach_hang order by t2.ngay_cho_thue asc limit 1	sakila_1
select doi from ky_thuat_vien group by doi order by count ( * ) desc limit 1	machine_repair
select count ( * ) from nhan_vien	employee_hire_evaluation
select distinct t2.chi_tiet_khach_hang from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ma_loai_chinh_sach = "deputy" or t1.ma_loai_chinh_sach = "uniform"	insurance_and_eClaims
select t3.tieu_de from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat where t2.ho = "heilo"	music_2
select distinct mau_san_pham from san_pham	customers_and_invoices
select ma_cong_viec_cua_nhan_vien , count ( * ) from nhan_vien group by ma_cong_viec_cua_nhan_vien order by count ( * ) desc limit 1	college_1
select t1.ten_quoc_gia from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.vi_tri = "forward" intersect select t1.ten_quoc_gia from quoc_gia as t1 join tran_dau_trong_mua_giai as t2 on t1.id_quoc_gia = t2.quoc_gia where t2.vi_tri = "defender"	match_season
select count ( distinct id_khu_vuc ) from khu_vuc_bi_anh_huong	storm_record
select count ( distinct dia_chi_khoa ) from khoa where ma_truong = "bus"	college_1
select count ( * ) from nha_tho where ngay_mo_cua < 1850	wedding
select id_sinh_vien from tham_gia_vao intersect select id_sinh_vien from sinh_vien where tuoi < 20	activity_1
select t1.ten , t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = "otha" and t2.ho = "moyer"	student_1
select dia_diem from truong_hoc where id_truong not in ( select id_truong from cau_thu )	school_player
select t3.ten from khu_vuc_bi_anh_huong as t1 join khu_vuc as t2 on t1.id_khu_vuc = t2.id_khu_vuc join bao as t3 on t1.id_con_bao = t3.id_con_bao where t2.ten_khu_vuc = "afghanistan" intersect select t3.ten from khu_vuc_bi_anh_huong as t1 join khu_vuc as t2 on t1.id_khu_vuc = t2.id_khu_vuc join bao as t3 on t1.id_con_bao = t3.id_con_bao where t2.ten_khu_vuc = "albania"	storm_record
select t1.ma_truong from khoa as t1 join giao_su as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_truong order by count ( * ) limit 1	college_1
select id_giang_vien from giang_vien except select id_giang_vien from giang_vien_tham_gia_vao	activity_1
select truong_dai_hoc from tran_dau_trong_mua_giai group by truong_dai_hoc order by count ( * ) desc limit 3	match_season
select count ( * ) from giang_vien where gioi_tinh = "f" and ngach = "professor"	activity_1
select distinct mau_ma_tai_san from tai_san	assets_maintenance
select t2.ton_giao from cau_thu as t1 join truong_hoc as t2 on t1.id_truong = t2.id_truong group by t1.id_truong order by count ( * ) desc limit 1	school_player
select t2.id_sinh_vien from khoa_hoc as t1 join lan_tham_du_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc where t1.ten_khoa_hoc = "statistics" order by t2.ngay_tham_du	student_assessment
select count ( * ) from hoat_dong	activity_1
select t1.thanh_pho_thi_tran from dia_chi as t1 join cua_hang as t2 on t1.id_dia_chi = t2.id_dia_chi where t2.ten_cua_hang = "fja filming"	cre_Drama_Workshop_Groups
select sum ( so_luong_nguoi_chet ) , sum ( thiet_hai_theo_trieu_usd ) from bao where toc_do_toi_da > ( select avg ( toc_do_toi_da ) from bao )	storm_record
select thanh_pho , quoc_gia from san_bay where ten_san_bay = "alton"	flight_2
select t2.ten_khoa , t2.dia_chi_khoa from sinh_vien as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_khoa order by count ( * ) desc limit 1	college_1
select truong_dai_hoc from tran_dau_trong_mua_giai group by truong_dai_hoc order by count ( * ) desc limit 3	match_season
select ten from ca_nhan where id_ca_nhan not in ( select id_ca_nhan from toi_pham )	perpetrator
select distinct ten , ho from danh_sach	student_1
select toa_nha , count ( * ) from giang_vien group by toa_nha	activity_1
select t2.ten , t1.ngay from cuoc_bau_cu as t1 join dai_dien as t2 on t1.id_dai_dien = t2.id_dai_dien	election_representative
select t1.id_sinh_vien , count ( * ) from sinh_vien as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien	student_assessment
select distinct t1.ten_lanh_dao from truong_dai_hoc as t1 join thanh_vien as t2 on t1.id_dai_hoc = t2.id_dai_hoc where t2.quoc_gia = "canada"	decoration_competition
select t1.ma_loai_dich_vu from dich_vu as t1 join su_kien as t2 on t1.id_dich_vu = t2.id_dich_vu where t2.chi_tiet_su_kien = "success" intersect select t1.ma_loai_dich_vu from dich_vu as t1 join su_kien as t2 on t1.id_dich_vu = t2.id_dich_vu where t2.chi_tiet_su_kien = "fail"	local_govt_in_alabama
select count ( * ) from ban_nhac	music_2
select count ( * ) , t3.ma_truong from lop_hoc as t1 join khoa_hoc as t2 on t1.ma_khoa_hoc = t2.ma_khoa_hoc join khoa as t3 on t2.ma_khoa = t3.ma_khoa group by t3.ma_truong	college_1
select t1.thanh_pho , count ( * ) from dia_chi as t1 join nhan_vien as t2 on t1.id_dia_chi = t2.id_dia_chi_nhan_vien group by t1.thanh_pho order by count ( * ) desc limit 1	driving_school
select t1.ten from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t1.gioi_tinh = "f" order by t1.ten	candidate_poll
select t1.ten , t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = "otha" and t2.ho = "moyer"	student_1
select truong_dai_hoc from tran_dau_trong_mua_giai group by truong_dai_hoc having count ( * ) >= 2	match_season
select ten from bao where id_con_bao not in ( select id_bao from khu_vuc_bi_anh_huong )	storm_record
select t1.ten_tai_khoan , t1.chi_tiet_khac_ve_tai_khoan from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten_khach_hang = "meaghan" and t2.ho_cua_khach_hang = "keeling"	customers_and_invoices
select distinct t1.ten_cau_thu from cau_thu as t1 join dac_diem_cua_cau_thu as t2 on t1.id_cau_thu_api = t2.id_cau_thu_api where t2.chan_thuan = "left" and t2.danh_gia_tong_the >= 85 and t2.danh_gia_tong_the <= 90	soccer_1
select thanh_pho from thanh_pho where dan_so_khu_vuc > 10000000 union select thanh_pho from thanh_pho where dan_so_khu_vuc < 5000000	city_record
select count ( * ) , id_khach_hang from tai_khoan group by id_khach_hang	customers_and_invoices
select ma_khu_vuc_tiep_thi from nhom_hoi_thao_kich group by ma_khu_vuc_tiep_thi order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select distinct t2.chi_tiet_khach_hang from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ma_loai_chinh_sach = "deputy"	insurance_and_eClaims
select ten from ky_thuat_vien where tuoi = 36 or tuoi = 37	machine_repair
select distinct toa_nha from giang_vien	activity_1
select id_cau_thu_api from cau_thu where chieu_cao >= 180 intersect select id_cau_thu_api from dac_diem_cua_cau_thu where danh_gia_tong_the > 85	soccer_1
select gioi_tinh from nhan_vien group by gioi_tinh order by count ( * ) desc limit 1	assets_maintenance
select count ( distinct danh_gia_xep_hang ) from phim	sakila_1
select t1.thanh_pho from san_bay as t1 join chuyen_bay as t2 on t1.ma_san_bay = t2.san_bay_khoi_hanh group by t1.thanh_pho order by count ( * ) desc limit 1	flight_2
select t1.ten , t1.ho from sinh_vien as t1 join tham_gia_vao as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien order by count ( * ) desc limit 1	activity_1
select ma_trang_thai_khach_hang , so_dien_thoai_di_dong , dia_chi_email from khach_hang where ten = "marina" or ho = "kohler"	driving_school
select t2.ho from buoi_bieu_dien as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id join bai_hat as t3 on t3.id_bai_hat = t1.id_bai_hat group by ho order by count ( * ) desc limit 1	music_2
select id_giang_vien from giang_vien except select co_van from sinh_vien	activity_1
select t2.tieu_de , t2.id_phim , t2.mo_ta from dien_vien_dien_anh as t1 join phim as t2 on t1.id_phim = t2.id_phim group by t2.id_phim order by count ( * ) desc limit 1	sakila_1
select ma_loai_san_pham , ten_san_pham from san_pham where gia_san_pham > 1000 or gia_san_pham < 500	customers_and_products_contacts
select t2.dia_diem from cau_thu as t1 join truong_hoc as t2 on t1.id_truong = t2.id_truong group by t1.id_truong having count ( * ) > 1	school_player
select t1.ten from loai_hinh as t2 join doanh_nghiep as t1 on t2.id_doanh_nghiep = t1.id_doanh_nghiep join loai_hinh as t3 on t3.id_doanh_nghiep = t1.id_doanh_nghiep where t1.thanh_pho = "los angeles" and t2.ten_loai_hinh = "seafood" and t3.ten_loai_hinh = "restaurant"	yelp
select tieu_de from phim where danh_gia_xep_hang = "r"	sakila_1
select id_sinh_vien from luot_dang_ky_khoa_hoc_cua_sinh_vien union select id_sinh_vien from lan_tham_du_khoa_hoc_cua_sinh_vien	student_assessment
select count ( distinct t1.van_ban ) from nguoi_tieu_dung as t2 join anh_gia as t1 on t2.id_nguoi_tieu_dung = t1.id_nguoi_tieu_dung where t1.nam = 2015 and t2.ten = "niloofar"	yelp
select t1.ten from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien join bo_phim as t3 on t3.id_bo_phim = t2.id_se_ri_phim where t1.ten = "gabriele ferzetti" order by t3.nam_phat_hanh desc limit 1	imdb
select id_sinh_vien from sinh_vien where id_sinh_vien not in ( select id_sinh_vien from lan_tham_du_khoa_hoc_cua_sinh_vien )	student_assessment
select ten from cua_hang where so_luong_san_pham > ( select avg ( so_luong_san_pham ) from cua_hang )	employee_hire_evaluation
select mo_ta_ve_khu_vuc_tiep_thi from khu_vuc_tiep_thi where ten_khu_vuc_tiep_thi = "china"	cre_Drama_Workshop_Groups
select ngay_mua_tai_san from tai_san order by ngay_mua_tai_san asc limit 1	assets_maintenance
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong where t2.san_bay_dich = "ahd"	flight_2
select chi_tiet_khach_hang from khach_hang order by chi_tiet_khach_hang	insurance_and_eClaims
select id_sinh_vien from sinh_vien except select id_sinh_vien from tham_gia_vao	activity_1
select id_khoa_hoc from luot_dang_ky_khoa_hoc_cua_sinh_vien where id_sinh_vien = 121 union select id_khoa_hoc from lan_tham_du_khoa_hoc_cua_sinh_vien where id_sinh_vien = 121	student_assessment
select tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat group by t1.id_bai_hat order by count ( * ) desc limit 1	music_2
select t1.ten from phan_vai as t2 join dien_vien as t1 on t2.id_dien_vien = t1.id_dien_vien join bo_phim as t3 on t3.id_bo_phim = t2.id_se_ri_phim where t2.vai_dien = "alan turing" and t3.tieu_de = "the imitation game"	imdb
select ngay_thanh_toan from khoan_thanh_toan where so_tien > 10 union select t1.ngay_thanh_toan from khoan_thanh_toan as t1 join nhan_vien as t2 on t1.id_nhan_vien = t2.id_nhan_vien where t2.ten = "elsa"	sakila_1
select t1.id_giang_vien , count ( * ) from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van group by t1.id_giang_vien	activity_1
select t1.id_tai_san , t1.chi_tiet_tai_san from tai_san as t1 join bo_phan_cua_tai_san as t2 on t1.id_tai_san = t2.id_tai_san group by t1.id_tai_san having count ( * ) = 2 intersect select t1.id_tai_san , t1.chi_tiet_tai_san from tai_san as t1 join nhat_ky_loi as t2 on t1.id_tai_san = t2.id_tai_san group by t1.id_tai_san having count ( * ) < 2	assets_maintenance
select id from xe	driving_school
select ngay_xuat_ban from an_pham order by gia_ban asc limit 3	book_2
select t1.ten , t1.toc_do_toi_da from bao as t1 join khu_vuc_bi_anh_huong as t2 on t1.id_con_bao = t2.id_bao group by t1.id_con_bao order by count ( * ) desc limit 1	storm_record
select count ( * ) from chuyen_bay as t1 join san_bay as t2 on t1.san_bay_dich = t2.ma_san_bay where t2.thanh_pho = "aberdeen" or t2.thanh_pho = "abilene"	flight_2
select count ( distinct dia_diem ) from toi_pham	perpetrator
select t1.quoc_gia , t1.tieu_bang from dia_chi as t1 join nhan_vien as t2 on t1.id_dia_chi = t2.id_dia_chi_nhan_vien where t2.ten = "janessa" and t2.ho = "sawayn"	driving_school
select count ( distinct t1.van_ban ) from nguoi_tieu_dung as t2 join anh_gia as t1 on t2.id_nguoi_tieu_dung = t1.id_nguoi_tieu_dung where t2.ten = "adrienne"	yelp
select ton_giao from truong_hoc group by ton_giao having count ( * ) > 1	school_player
select t2.dia_chi from nhan_vien as t1 join dia_chi as t2 on t1.id_dia_chi = t2.id_dia_chi where t1.ten = "elsa"	sakila_1
select t2.chi_tiet_khach_hang from chinh_sach as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t2.chi_tiet_khach_hang order by count ( * ) desc limit 1	insurance_and_eClaims
select truong_dai_hoc from luot_nop_bai where so_diem > 90 intersect select truong_dai_hoc from luot_nop_bai where so_diem < 80	workshop_paper
select min ( ti_le_phieu_bau ) , max ( ti_le_phieu_bau ) from cuoc_bau_cu	election_representative
select t2.ten_cua_nhan_vien , t1.van_phong_giao_su from giao_su as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t1.ma_khoa = t3.ma_khoa where t3.ten_khoa = "history" and t1.bang_cap_cao_nhat != "ph.d."	college_1
select id_su_kien from nguoi_tham_gia_su_kien group by id_su_kien order by count ( * ) desc limit 1	local_govt_in_alabama
select id_ung_cu_vien from danh_gia_ung_cu_vien where ma_ket_qua_danh_gia = "pass"	student_assessment
select avg ( nhiet_do_cao ) , ngay_trong_tuan from thoi_tiet_hang_tuan group by ngay_trong_tuan	station_weather
select ten , dang from dai_dien	election_representative
select avg ( so_luong_nhan_vien ) from cac_bo where xep_hang between 10 and 15	department_management
select t2.ten_khoa , t1.ma_khoa from giao_su as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa where t1.bang_cap_cao_nhat = "ph.d." group by t1.ma_khoa order by count ( * ) desc limit 1	college_1
select ma_loai_chinh_sach from chinh_sach group by ma_loai_chinh_sach order by count ( * ) desc limit 1	insurance_and_eClaims
select ma_loai_chinh_sach from chinh_sach group by ma_loai_chinh_sach having count ( * ) > 2	insurance_and_eClaims
select t3.ten_khoa , t2.van_phong_giao_su from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t2.ma_khoa = t3.ma_khoa where t1.ho_cua_nhan_vien = "heffington"	college_1
select t2.ten , t2.ho , t2.id_dien_vien from dien_vien_dien_anh as t1 join dien_vien as t2 on t1.id_dien_vien = t2.id_dien_vien group by t2.id_dien_vien order by count ( * ) desc limit 1	sakila_1
select dang , count ( * ) from dai_dien group by dang order by count ( * ) desc limit 1	election_representative
select dia_diem from toi_pham order by so_nguoi_bi_giet desc limit 1	perpetrator
select t1.thanh_pho_thi_tran from dia_chi as t1 join khach_hang_1 as t2 on t1.id_dia_chi = t2.id_dia_chi except select t1.thanh_pho_thi_tran from dia_chi as t1 join nguoi_bieu_dien as t2 on t1.id_dia_chi = t2.id_dia_chi	cre_Drama_Workshop_Groups
select avg ( so_diem ) from luot_nop_bai	workshop_paper
select t1.thanh_pho from loai_hinh as t2 join doanh_nghiep as t1 on t2.id_doanh_nghiep = t1.id_doanh_nghiep where t1.ten = "mgm grand buffet" and t1.tieu_bang = "texas" and t2.ten_loai_hinh = "restaurant"	yelp
select t1.id_sinh_vien from tham_gia_vao as t1 join hoat_dong as t2 on t2.id_hoat_dong = t2.id_hoat_dong where t2.ten_hoat_dong = "canoeing" intersect select t1.id_sinh_vien from tham_gia_vao as t1 join hoat_dong as t2 on t2.id_hoat_dong = t2.id_hoat_dong where t2.ten_hoat_dong = "kayaking"	activity_1
select chi_tiet_khach_hang from khach_hang order by chi_tiet_khach_hang	insurance_and_eClaims
select ten from nhan_vien except select t2.ten from bai_giang as t1 join nhan_vien as t2 on t1.id_nhan_vien = t2.id_nhan_vien	driving_school
select t1.ten_cua_nhan_vien from nhan_vien as t1 join giao_su as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien join khoa as t3 on t2.ma_khoa = t3.ma_khoa where t3.ten_khoa = "history" except select t4.ten_cua_nhan_vien from nhan_vien as t4 join lop_hoc as t5 on t4.ma_so_nhan_vien = t5.ma_so_nhan_vien_cua_giao_su	college_1
select t3.ten , t2.khoa_hoc from sap_xep_khoa_hoc as t1 join khoa_hoc as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc join giao_vien as t3 on t1.id_giao_vien = t3.id_giao_vien	course_teach
select distinct t1.ten , t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t1.khoi_lop = 1 except select t1.ten , t1.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t2.ten = "otha" and t2.ho = "moyer"	student_1
select ten from cua_hang where so_luong_san_pham > ( select avg ( so_luong_san_pham ) from cua_hang )	employee_hire_evaluation
select count ( distinct noi_sinh ) from ca_nhan	body_builder
select t2.ten , t1.dia_diem_truong_dai_hoc from truong_dai_hoc as t1 join thanh_vien as t2 on t1.id_dai_hoc = t2.id_dai_hoc order by t2.ten asc	decoration_competition
select chi_tiet_khach_hang from khach_hang union select chi_tiet_nhan_vien from nhan_vien	insurance_and_eClaims
select count ( * ) , t3.ma_truong from lop_hoc as t1 join khoa_hoc as t2 on t1.ma_khoa_hoc = t2.ma_khoa_hoc join khoa as t3 on t2.ma_khoa = t3.ma_khoa group by t3.ma_truong	college_1
select ten from dien_vien group by ten order by count ( * ) desc limit 1	sakila_1
select t1.ten , t1.ho from giang_vien as t1 join giang_vien_tham_gia_vao as t2 on t1.id_giang_vien = t2.id_giang_vien group by t1.id_giang_vien order by count ( * ) desc limit 1	activity_1
select cau_thu from tran_dau_trong_mua_giai order by truong_dai_hoc asc	match_season
select t2.ten_cua_nhan_vien , t1.phong_hoc from lop_hoc as t1 join nhan_vien as t2 on t1.ma_so_nhan_vien_cua_giao_su = t2.ma_so_nhan_vien join giao_su as t3 on t2.ma_so_nhan_vien = t3.ma_so_nhan_vien join khoa as t4 on t4.ma_khoa = t3.ma_khoa where t4.ten_khoa = "accounting"	college_1
select ma_trang_thai from luot_dat_hang group by ma_trang_thai order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select distinct tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat except select t2.tieu_de from giong_hat as t1 join bai_hat as t2 on t1.id_bai_hat = t2.id_bai_hat where loai = "back"	music_2
select t1.ma_san_bay from san_bay as t1 join chuyen_bay as t2 on t1.ma_san_bay = t2.san_bay_dich or t1.ma_san_bay = t2.san_bay_khoi_hanh group by t1.ma_san_bay order by count ( * ) limit 1	flight_2
select chinh_quyen_dia_phuong , dich_vu from nha_ga	station_weather
select count ( * ) from giao_dich_tai_chinh	customers_and_invoices
select ten from dao_dien where quoc_tich = "afghanistan"	imdb
select biet_danh from chi_tiet_truong_hoc where phan_hang != "division 1"	school_player
select t2.van_ban from khoan_tien_boa as t2 join doanh_nghiep as t1 on t2.id_doanh_nghiep = t1.id_doanh_nghiep where t1.ten = "cafe zinho" and t1.tieu_bang = "texas"	yelp
select count ( * ) from tran_dau where mua_giai > 2007	game_injury
select count ( distinct id_giang_vien ) from giang_vien_tham_gia_vao	activity_1
select t1.ten_cong_ty from cong_ty_ben_thu_ba as t1 join hop_dong_bao_tri as t2 on t1.id_cong_ty = t2.id_hop_dong_bao_tri_cua_cong_ty order by t2.ngay_ket_thuc_hop_dong desc limit 1	assets_maintenance
select count ( distinct ma_tien_te ) from nhom_hoi_thao_kich	cre_Drama_Workshop_Groups
select sum ( t4.so_luong ) from loai_hinh as t2 join doanh_nghiep as t1 on t2.id_doanh_nghiep = t1.id_doanh_nghiep join loai_hinh as t3 on t3.id_doanh_nghiep = t1.id_doanh_nghiep join luot_ang_ky as t4 on t4.id_doanh_nghiep = t1.id_doanh_nghiep where t1.thanh_pho = "los angeles" and t2.ten_loai_hinh = "moroccan" and t3.ten_loai_hinh = "restaurant" and t4.ngay = "friday"	yelp
select ngon_ngu_ban_dia_chinh_thuc from quoc_gia where ngon_ngu_ban_dia_chinh_thuc like "%english%"	match_season
select ten_san_pham from san_pham except select t1.ten_san_pham from san_pham as t1 join mat_hang_duoc_dat as t2 on t1.id_san_pham = t2.id_san_pham	customers_and_invoices
select t2.can_nang from nguoi_luyen_the_hinh as t1 join ca_nhan as t2 on t1.id_ca_nhan = t2.id_ca_nhan where t1.cu_giat > 140 or t2.chieu_cao > 200	body_builder
select ten_khach_hang , dien_thoai_khach_hang from khach_hang where id_khach_hang not in ( select id_khach_hang from lich_su_dia_chi_khach_hang )	customers_and_products_contacts
select t2.id_ung_cu_vien from ca_nhan as t1 join ung_cu_vien as t2 on t1.id_ca_nhan = t2.id_ung_cu_vien where t1.dia_chi_email = "stanley.monahan@example.org"	student_assessment
select count ( * ) from nhan_vien	driving_school
select ten_nhan_vien from nhan_vien except select nhan_vien.ten_nhan_vien from nhan_vien join lich_su_luu_hanh on lich_su_luu_hanh.id_nhan_vien = nhan_vien.id_nhan_vien	cre_Doc_Control_Systems
select tac_gia from sach order by tac_gia asc	book_2
select t1.tieu_de from duoc_viet_boi as t3 join bo_phim as t1 on t3.id_se_ri_phim = t1.id_bo_phim join nha_viet_kich_ban as t2 on t3.id_nha_viet_kich_ban = t2.id_nha_viet_kich_ban where t2.ten = "matt damon"	imdb
select loai_hinh from truong_hoc group by loai_hinh having count ( * ) = 2	school_bus
select distinct ten from danh_sach where phong_hoc = 107	student_1
select ten from dien_vien where quoc_tich = "afghanistan"	imdb
select t2.ten_khoa , avg ( t1.gpa_cua_sinh_vien ) from sinh_vien as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_khoa order by avg ( t1.gpa_cua_sinh_vien ) desc limit 1	college_1
select t2.ten , t2.ho from danh_sach as t1 join giao_vien as t2 on t1.phong_hoc = t2.phong_hoc where t1.ten = "evelina" and t1.ho = "bromley"	student_1
select count ( distinct dia_diem ) from cua_hang	employee_hire_evaluation
select t2.id , t2.chinh_quyen_dia_phuong from thoi_tiet_hang_tuan as t1 join nha_ga as t2 on t1.id_nha_ga = t2.id group by t1.id_nha_ga order by avg ( nhiet_do_cao ) desc limit 1	station_weather
select t1.ten_bo_phan from bo_phan as t1 join dia_diem_cua_bo_phan as t2 on t1.ma_so_bo_phan = t2.ma_so_bo_phan where t2.dia_diem_bo_phan = "houston"	company_1
select count ( * ) from ung_cu_vien	candidate_poll
select cau_thu from tran_dau_trong_mua_giai where truong_dai_hoc = "ucla"	match_season
select * from ca_nhan	candidate_poll
select ho from khach_hang intersect select ho from nhan_vien	driving_school
select sum ( so_tien ) from khoan_thanh_toan	sakila_1
select id_cua_hang from khach_hang group by id_cua_hang order by count ( * ) desc limit 1	sakila_1
select count ( distinct id_khach_hang ) from tai_khoan	customers_and_invoices
select t2.id_sinh_vien from giang_vien as t1 join sinh_vien as t2 on t1.id_giang_vien = t2.co_van where t1.ngach = "professor"	activity_1
select count ( * ) from khach_hang where id_khach_hang not in ( select id_khach_hang from tai_khoan )	customers_and_invoices
select ten_san_pham from cac_san_pham group by ten_san_pham having avg ( gia_san_pham ) < 1000000	cre_Drama_Workshop_Groups
select t2.ten_khu_vuc from khu_vuc_bi_anh_huong as t1 join khu_vuc as t2 on t1.id_khu_vuc = t2.id_khu_vuc join bao as t3 on t1.id_con_bao = t3.id_con_bao order by t3.so_luong_nguoi_chet desc limit 1	storm_record
select avg ( can_nang ) , min ( can_nang ) , gioi_tinh from ca_nhan group by gioi_tinh	candidate_poll
select ten_cua_nhan_vien from nhan_vien where ma_cong_viec_cua_nhan_vien = "prof" except select t1.ten_cua_nhan_vien from nhan_vien as t1 join lop_hoc as t2 on t1.ma_so_nhan_vien = t2.ma_so_nhan_vien_cua_giao_su	college_1
select tieu_de , id_phim from phim where gia_cho_thue = 0.99 intersect select t1.tieu_de , t1.id_phim from phim as t1 join hang_ton_kho as t2 on t1.id_phim = t2.id_phim group by t1.id_phim having count ( * ) < 3	sakila_1
select ten , ho from dien_vien group by ten , ho order by count ( * ) desc limit 1	sakila_1
select quoc_tich from dien_vien where ten = "christoph waltz"	imdb
select loai from giong_hat group by loai order by count ( * ) desc limit 1	music_2
select count ( * ) from ban_sao where id_tai_lieu = 2	cre_Doc_Control_Systems
select ten_san_pham from san_pham except select t1.ten_san_pham from san_pham as t1 join mat_hang_duoc_dat as t2 on t1.id_san_pham = t2.id_san_pham	customers_and_invoices
select t2.ten_khoa , t2.dia_chi_khoa from sinh_vien as t1 join khoa as t2 on t1.ma_khoa = t2.ma_khoa group by t1.ma_khoa order by count ( * ) desc limit 1	college_1
select max ( can_nang ) , min ( can_nang ) from cau_thu	soccer_1
select count ( distinct doi ) from tran_dau_trong_mua_giai	match_season
select id_su_kien from su_kien except select t1.id_su_kien from nguoi_tham_gia_su_kien as t1 join nguoi_tham_gia as t2 on t1.id_nguoi_tham_gia = t2.id_nguoi_tham_gia where chi_tiet_nguoi_tham_gia = "kenyatta kuhn"	local_govt_in_alabama
select ma_san_bay , ten_san_bay from san_bay where thanh_pho = "anthony"	flight_2
select count ( * ) from san_pham where id_san_pham not in ( select id_san_pham from mat_hang_duoc_dat )	customers_and_invoices
select loai from giong_hat as t1 join ban_nhac as t2 on t1.nghe_si_trong_ban_nhac = t2.id where ten = "solveig" group by loai order by count ( * ) desc limit 1	music_2
select ten from san_van_dong where ten like "%bank%"	game_injury
select phong_hoc , count ( * ) from danh_sach group by phong_hoc	student_1
select mo_ta_ve_tinh_trang_yeu_cau from giai_doan_xu_ly_yeu_cau where ten_tinh_trang_yeu_cau = "open"	insurance_and_eClaims
select t1.ma_khoa_hoc from lop_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.ma_lop_hoc = t2.ma_lop join sinh_vien as t3 on t3.ma_so_sinh_vien = t2.ma_so_sinh_vien where t3.ho_cua_sinh_vien = "smithson"	college_1
select count ( distinct nguon_thong_tin ) from chan_thuong	game_injury
select t1.ten_nhan_vien , t1.id_nhan_vien from nhan_vien as t1 join nhat_ky_loi as t2 on t1.id_nhan_vien = t2.duoc_ghi_lai_boi_nhan_vien_co_id except select t3.ten_nhan_vien , t3.id_nhan_vien from nhan_vien as t3 join chuyen_tham_cua_ky_su as t4 on t3.id_nhan_vien = t4.id_nhan_vien_lien_lac	assets_maintenance
select ten_san_bay from san_bay where ma_san_bay = "ako"	flight_2
select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong where t2.san_bay_khoi_hanh = "cvo" except select t1.ten_hang_hang_khong from hang_hang_khong as t1 join chuyen_bay as t2 on t1.id_hang_hang_khong = t2.hang_hang_khong where t2.san_bay_khoi_hanh = "apg"	flight_2
select id_giao_dich from giao_dich_tai_chinh where so_tien_giao_dich > ( select avg ( so_tien_giao_dich ) from giao_dich_tai_chinh )	customers_and_invoices
select t2.tieu_de from phan_vai as t3 join dien_vien as t1 on t3.id_dien_vien = t1.id_dien_vien join bo_phim as t2 on t2.id_bo_phim = t3.id_se_ri_phim where t1.quoc_tich = "china" group by t2.tieu_de order by count ( distinct t1.ten ) desc limit 1	imdb
