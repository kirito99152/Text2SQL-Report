select ten from du_an where so_gio between 100 and 300	scientist_1
select ten_khoa_hoc from khoa_hoc order by so_luong_tin_chi	college_3
select distinct dia_diem from rap_chieu_phim	cinema
select distinct nam from cuoc_thi where loai_cuoc_thi != "Tournament"	sports_competition
select ma_loai_tai_lieu from tai_lieu group by ma_loai_tai_lieu having count ( * ) > 2	document_management
select avg ( so_luong_truy_cap ) from tai_lieu	document_management
select distinct loai_giao_dich from giao_dich_tai_chinh	customers_card_transactions
select count ( * ) from khu_nha	customers_campaigns_ecommerce
select avg ( vang ) from thu_hang_cua_cau_lac_bo	sports_competition
select * from khoa_hoc order by so_luong_tin_chi	college_3
select ten from tau where quoc_tich != "United States"	ship_mission
select ten_giai_dau from tran_dau group by ten_giai_dau having count ( * ) > 10	wta_1
select count ( * ) from toa_hoa	train_station
select ten from dien_thoai order by gia_ban asc	phone_market
select count ( distinct id_sinh_vien ) from dang_ky_khoa_hoc where diem = "B"	college_3
select ten_muc_nhap_cua_danh_muc from noi_dung_danh_muc where id_muc_nhap_tiep_theo > 8	product_catalog
select xep_hang_dieu_tra_dan_so from thanh_pho where cap_bac != "Village"	farm
select distinct duoc_dao_dien_boi from phim	cinema
select distinct duoc_dao_dien_boi from phim	cinema
select ten_khoa from khoa where toa_nha = "Mergenthaler"	college_3
select count ( distinct ma_loai_the ) from the_khach_hang	customers_card_transactions
select count ( distinct loai_giao_dich ) from giao_dich_tai_chinh	customers_card_transactions
select id from hoc_sinh_trung_hoc where ten = "Kyle"	network_1
select count ( * ) from nha_khoa_hoc	scientist_1
select ten_giai_dau from tran_dau group by ten_giai_dau having count ( * ) > 10	wta_1
select ten_muc_nhap_cua_danh_muc from noi_dung_danh_muc where chieu_dai < 3 or chieu_rong > 5	product_catalog
select id_the , id_khach_hang , ma_loai_the , so_the from the_khach_hang	customers_card_transactions
select t2.chi_tiet_ve_cac_lot from nha_dau_tu as t1 join lot as t2 on t1.id_nha_dau_tu = t2.id_nha_dau_tu where t1.chi_tiet_ve_nha_dau_tu = "l"	tracking_share_transactions
select t1.ten from ca_si as t1 join bai_hat as t2 on t1.id_ca_si = t2.id_ca_si group by t1.ten having count ( * ) > 1	singer
select t4.ten from van_dong_vien_boi as t1 join ho_so as t2 on t1.id = t2.id_van_dong_vien_boi join su_kien as t3 on t2.id_su_kien = t3.id join san_van_dong as t4 on t4.id = t3.id_san_van_dong where t1.quoc_tich = "Australia"	swimming
select ten_muc_nhap_cua_danh_muc from noi_dung_danh_muc order by chieu_cao desc limit 1	product_catalog
select id_bao_tang , ten from bao_tang order by so_luong_nhan_vien desc limit 1	museum_visit
select id_khach_hang , count ( * ) from the_khach_hang group by id_khach_hang	customers_card_transactions
select t2.ten , count ( * ) from ban_be as t1 join hoc_sinh_trung_hoc as t2 on t1.id_hoc_sinh = t2.id group by t1.id_hoc_sinh	network_1
select loai , quoc_tich from tau	ship_mission
select ten_dang_nhap , ho from tac_gia_khoa_hoc_va_nguoi_huong_dan	e_learning
select avg ( xep_hang ) , t1.ten from nguoi_choi as t1 join xep_hang as t2 on t1.id_nguoi_choi = t2.id_nguoi_choi group by t1.ten	wta_1
select distinct t1.ten , t1.quoc_tich from kien_truc_su as t1 join nha_may as t2 on t1.id = t2.id_kien_truc_su	architecture
select t2.ten , t3.ten from nha_ga_tau_hoa as t1 join nha_ga as t2 on t1.id_nha_ga = t2.id_ga_tau join toa_hoa as t3 on t3.id_tau = t1.id_tau	train_station
select ten_nguoi_chien_thang , ten_nguoi_thua_cuoc from tran_dau order by phut desc limit 1	wta_1
select mau_cua_khu_nha , count ( * ) from khu_nha group by mau_cua_khu_nha	customers_campaigns_ecommerce
select t1.ten , t1.suc_chua from san_van_dong as t1 join su_kien as t2 on t1.id = t2.id_san_van_dong where t2.ten = "World Junior"	swimming
select t1.id_khach_tham_quan , t1.ten , t1.tuoi from khach_tham_quan as t1 join chuyen_tham as t2 on t1.id_khach_tham_quan = t2.id_khach_tham_quan group by t1.id_khach_tham_quan having count ( * ) > 1	museum_visit
select t1.ngay_ngay_dang_ky , t1.ngay_hoan_thanh from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien where t2.ten_ca_nhan = "Karson"	e_learning
select ten , quoc_gia from ca_si where ten_bai_hat like "%Hey%"	concert_singer
select count ( * ) from the_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten_cua_khach_hang = "Blanche" and t2.ho_cua_khach_hang = "Huels" and t1.ma_loai_the = "Credit"	customers_card_transactions
select ten , dia_diem from nha_ga order by so_luong_xuat_canh_hang_nam , so_luong_trao_doi_hang_nam	train_station
select t1.ngay_hoan_thanh from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join bai_kiem_tra_cua_sinh_vien as t2 on t1.id_dang_ky = t2.id_dang_ky where t2.ket_qua_kiem_tra = "Fail"	e_learning
select t2.ho from khoa as t1 join giang_vien as t2 on t1.ma_so_khoa = t3.ma_so_khoa join la_thanh_vien_cua as t3 on t2.id_giang_vien = t3.id_giang_vien where t1.ten_khoa = "Computer Science"	college_3
select t3.ten , t3.ho , t2.diem_so from dang_ky_khoa_hoc as t1 join chuyen_doi_diem as t2 join sinh_vien as t3 on t1.diem = t2.bang_diem and t1.id_sinh_vien = t3.id_sinh_vien	college_3
select nha_mang from dien_thoai where bo_nho_theo_g < 32 intersect select nha_mang from dien_thoai where bo_nho_theo_g > 64	phone_market
select nam from buoi_hoa_nhac group by nam order by count ( * ) desc limit 1	concert_singer
select quoc_tich from nguoi_to_chuc group by quoc_tich order by count ( * ) desc limit 1	party_host
select avg ( khoi_lop ) from hoc_sinh_trung_hoc where id in ( select t1.id_hoc_sinh from ban_be as t1 join hoc_sinh_trung_hoc as t2 on t1.id_hoc_sinh = t2.id )	network_1
select avg ( tong_so_hanh_khach ) , max ( tong_so_hanh_khach ) from nha_ga where dia_diem = "London" or dia_diem = "Glasgow"	train_station
select cap_bac from thanh_pho where dan_so > 1500 intersect select cap_bac from thanh_pho where dan_so < 500	farm
select avg ( t2.diem_so ) from dang_ky_khoa_hoc as t1 join chuyen_doi_diem as t2 join sinh_vien as t3 on t1.diem = t2.bang_diem and t1.id_sinh_vien = t3.id_sinh_vien where t3.ho = "Smith"	college_3
select loai from tau group by loai order by count ( * ) desc limit 1	ship_mission
select quoc_gia from cuoc_thi where loai_cuoc_thi = "Friendly" intersect select quoc_gia from cuoc_thi where loai_cuoc_thi = "Tournament"	sports_competition
select count ( * ) from buoi_hoa_nhac as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id_san_van_dong order by t2.suc_chua desc limit 1	concert_singer
select nha_mang from dien_thoai group by nha_mang order by count ( * ) desc limit 1	phone_market
select ten from sinh_vien where id_sinh_vien not in ( select id_sinh_vien from dang_ky_khoa_hoc )	college_3
select ten from san_van_dong where suc_chua < ( select avg ( suc_chua ) from san_van_dong )	swimming
select t1.ten , t1.tuoi from khach_tham_quan as t1 join chuyen_tham as t2 on t1.id_khach_tham_quan = t2.id_khach_tham_quan order by t2.so_luong_ve desc limit 1	museum_visit
select ten from nha_ga where id_ga_tau not in ( select id_nha_ga from nha_ga_tau_hoa )	train_station
select quoc_tich from nguoi_to_chuc where tuoi > 45 intersect select quoc_tich from nguoi_to_chuc where tuoi < 35	party_host
select ten from van_dong_vien_boi where id not in ( select id_van_dong_vien_boi from ho_so )	swimming
select mo_ta_ve_vai_tro from vai_tro where ma_vai_tro = ( select ma_vai_tro from nguoi_dung where lan_dang_nhap_cua_nguoi_dung = 1 group by ma_vai_tro order by count ( * ) desc limit 1 )	document_management
select ten_khoa from khoa where bo_phan = "AS" union select ten_khoa from khoa where bo_phan = "EN" and toa_nha = "NEB"	college_3
select ten_nguoi_chien_thang , diem_xep_hang_cua_nguoi_chien_thang from tran_dau group by ten_nguoi_chien_thang order by count ( * ) desc limit 1	wta_1
select ten_ca_nhan from sinh_vien except select t1.ten_ca_nhan from sinh_vien as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien	e_learning
select ten from bao_tang where id_bao_tang not in ( select id_bao_tang from chuyen_tham )	museum_visit
select t1.ma_quoc_gia , t1.ten from nguoi_choi as t1 join xep_hang as t2 on t1.id_nguoi_choi = t2.id_nguoi_choi order by t2.tour_du_dau desc limit 1	wta_1
select ten_dang_nhap from tac_gia_khoa_hoc_va_nguoi_huong_dan intersect select ten_dang_nhap from sinh_vien	e_learning
select ten from san_van_dong where id_san_van_dong not in ( select id_san_van_dong from buoi_hoa_nhac )	concert_singer
select t1.id_sinh_vien , t2.ten_dang_nhap from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien order by count ( * ) desc limit 1	e_learning
select ten_tai_lieu from tai_lieu group by ma_loai_tai_lieu order by count ( * ) desc limit 3 intersect select ten_tai_lieu from tai_lieu group by ma_cau_truc_tai_lieu order by count ( * ) desc limit 3	document_management
select lai_suat_thi_truong , ten from do_noi_that where id_do_noi_that not in ( select id_do_noi_that from xuong_san_xuat_do_noi_that )	manufacturer
select count ( * ) from nha_khoa_hoc where ssn not in ( select nha_khoa_hoc from phan_cong_du_an )	scientist_1
select t1.ngay_ngay_dang_ky , t1.ngay_hoan_thanh from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien where t2.ho = "Zieme" and t2.ten_ca_nhan = "Bernie"	e_learning
select t2.ten_khach_hang from thu_quang_cao_gui_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang order by count ( * ) desc limit 1	customers_campaigns_ecommerce
select t1.id_sinh_vien , t2.ten_dang_nhap from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien order by count ( * ) desc limit 1	e_learning
select t1.ngay_ngay_dang_ky , t1.ngay_hoan_thanh from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien where t2.ho = "Zieme" and t2.ten_ca_nhan = "Bernie"	e_learning
select count ( * ) from khach_hang where id_khach_hang not in ( select id_khach_hang from tai_khoan )	customers_card_transactions
select quoc_gia from cuoc_thi where loai_cuoc_thi = "Tournament" group by quoc_gia order by count ( * ) desc limit 1	sports_competition
select t2.mo_ta_ve_cau_truc_tai_lieu from tai_lieu as t1 join cau_truc_tai_lieu as t2 on t1.ma_cau_truc_tai_lieu = t2.ma_cau_truc_tai_lieu group by t1.ma_cau_truc_tai_lieu order by count ( * ) desc limit 1	document_management
select t3.ten from ho_so as t1 join su_kien as t2 on t1.id_su_kien = t2.id join san_van_dong as t3 on t3.id = t2.id_san_van_dong group by t2.id_san_van_dong order by count ( * ) desc limit 1	swimming
select t1.ten from van_dong_vien_boi as t1 join ho_so as t2 on t1.id = t2.id_van_dong_vien_boi group by t2.id_van_dong_vien_boi order by count ( * ) desc limit 1	swimming
select t2.ten , t3.ten from phan_cong_du_an as t1 join du_an as t2 on t1.du_an = t2.ma join nha_khoa_hoc as t3 on t1.nha_khoa_hoc = t3.ssn where t2.so_gio = ( select min ( so_gio ) from du_an )	scientist_1
select t1.ten_khoa from khoa as t1 join la_thanh_vien_cua as t2 on t1.ma_so_khoa = t2.ma_so_khoa group by t2.ma_so_khoa order by count ( * ) asc limit 1	college_3
select t3.ten from phan_cong_du_an as t1 join du_an as t2 on t1.du_an = t2.ma join nha_khoa_hoc as t3 on t1.nha_khoa_hoc = t3.ssn where t2.ten = "Matter of Time" intersect select t3.ten from phan_cong_du_an as t1 join du_an as t2 on t1.du_an = t2.ma join nha_khoa_hoc as t3 on t1.nha_khoa_hoc = t3.ssn where t2.ten = "A Puzzling Parallax"	scientist_1
select t1.ma_vung from ma_vung_cua_tieu_bang as t1 join phieu_bau as t2 on t1.tieu_bang = t2.tieu_bang group by t1.ma_vung order by count ( * ) desc limit 1	voter_1
select t2.ten_khach_hang , t2.phuong_thuc_thanh_toan from thu_quang_cao_gui_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ma_ket_qua = "Order" intersect select t2.ten_khach_hang , t2.phuong_thuc_thanh_toan from thu_quang_cao_gui_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ma_ket_qua = "No Response"	customers_campaigns_ecommerce
select min ( khoi_lop ) from hoc_sinh_trung_hoc where id not in ( select t1.id_hoc_sinh from ban_be as t1 join hoc_sinh_trung_hoc as t2 on t1.id_hoc_sinh = t2.id )	network_1
select id_khach_hang , ten_cua_khach_hang from khach_hang except select t1.id_khach_hang , t2.ten_cua_khach_hang from the_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where ma_loai_the = "Credit"	customers_card_transactions
select t1.ma_so_thi_sinh , t1.ten_thi_sinh from thi_sinh as t1 join phieu_bau as t2 on t1.ma_so_thi_sinh = t2.ma_so_thi_sinh group by t1.ma_so_thi_sinh order by count ( * ) asc limit 1	voter_1
select t3.ten from do_noi_that as t1 join xuong_san_xuat_do_noi_that as t2 on t1.id_do_noi_that = t2.id_do_noi_that join nha_san_xuat as t3 on t2.id_nha_san_xuat = t3.id_nha_san_xuat where t1.so_luong_bo_phan < 6 intersect select t3.ten from do_noi_that as t1 join xuong_san_xuat_do_noi_that as t2 on t1.id_do_noi_that = t2.id_do_noi_that join nha_san_xuat as t3 on t2.id_nha_san_xuat = t3.id_nha_san_xuat where t1.so_luong_bo_phan > 10	manufacturer
select t1.ma_quoc_gia , t1.ten from nguoi_choi as t1 join tran_dau as t2 on t1.id_nguoi_choi = t2.id_cua_nguoi_chien_thang where t2.ten_giai_dau = "WTA Championships" intersect select t1.ma_quoc_gia , t1.ten from nguoi_choi as t1 join tran_dau as t2 on t1.id_nguoi_choi = t2.id_cua_nguoi_chien_thang where t2.ten_giai_dau = "Australian Open"	wta_1
select t2.id_nha_dau_tu , t1.chi_tiet_ve_nha_dau_tu from nha_dau_tu as t1 join giao_dich as t2 on t1.id_nha_dau_tu = t2.id_nha_dau_tu group by t2.id_nha_dau_tu order by count ( * ) desc limit 1	tracking_share_transactions
select nam_dau_tien , nam_cuoi_cung from bua_tiec where chu_de_bua_tiec = "Spring" or chu_de_bua_tiec = "Teqnology"	party_host
