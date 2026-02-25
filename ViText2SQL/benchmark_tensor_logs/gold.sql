select count ( * ) from kien_truc_su where gioi_tinh = "female"	architecture
select ten , quoc_tich , id from kien_truc_su where gioi_tinh = "male" order by ten	architecture
select max ( t1.chieu_dai_theo_met ) , t2.ten from cau as t1 join kien_truc_su as t2 on t1.id_kien_truc_su = t2.id	architecture
select avg ( chieu_dai_theo_feet ) from cau	architecture
select ten , nam_xay_dung from nha_may where loai = "Grondzeiler"	architecture
select distinct t1.ten , t1.quoc_tich from kien_truc_su as t1 join nha_may as t2 on t1.id = t2.id_kien_truc_su	architecture
select ten from nha_may where dia_diem != "Donceel"	architecture
select distinct t1.loai from nha_may as t1 join kien_truc_su as t2 on t1.id_kien_truc_su = t2.id where t2.quoc_tich = "American" or t2.quoc_tich = "Canadian"	architecture
select t1.id , t1.ten from kien_truc_su as t1 join cau as t2 on t1.id = t2.id_kien_truc_su group by t1.id having count ( * ) >= 3	architecture
select t1.id , t1.ten , t1.quoc_tich from kien_truc_su as t1 join nha_may as t2 on t1.id = t2.id_kien_truc_su group by t1.id order by count ( * ) desc limit 1	architecture
select t1.id , t1.ten , t1.gioi_tinh from kien_truc_su as t1 join cau as t2 on t1.id = t2.id_kien_truc_su group by t1.id having count ( * ) = 2 union select t1.id , t1.ten , t1.gioi_tinh from kien_truc_su as t1 join nha_may as t2 on t1.id = t2.id_kien_truc_su group by t1.id having count ( * ) = 1	architecture
select dia_diem from cau where ten = "Kolob Arch" or ten = "Rainbow Bridge"	architecture
select ten from nha_may where ten like "%Moulin%"	architecture
select distinct t1.ten from nha_may as t1 join kien_truc_su as t2 on t1.id_kien_truc_su = t2.id join cau as t3 on t3.id_kien_truc_su = t2.id where t3.chieu_dai_theo_met > 80	architecture
select loai , count ( * ) from nha_may group by loai order by count ( * ) desc limit 1	architecture
select count ( * ) from kien_truc_su where id not in ( select id_kien_truc_su from nha_may where nam_xay_dung < 1850 )	architecture
select t1.ten from cau as t1 join kien_truc_su as t2 on t1.id_kien_truc_su = t2.id where t2.quoc_tich = "American" order by t1.chieu_dai_theo_feet	architecture
select dia_diem from rap_chieu_phim except select dia_diem from rap_chieu_phim where suc_chua > 800	cinema
select dia_diem from rap_chieu_phim where nam_mo_cua = 2010 intersect select dia_diem from rap_chieu_phim where nam_mo_cua = 2011	cinema
select count ( * ) from rap_chieu_phim	cinema
select count ( * ) from rap_chieu_phim	cinema
select ten , nam_mo_cua , suc_chua from rap_chieu_phim	cinema
select ten , dia_diem from rap_chieu_phim where suc_chua > ( select avg ( suc_chua ) from rap_chieu_phim )	cinema
select distinct dia_diem from rap_chieu_phim	cinema
select distinct dia_diem from rap_chieu_phim	cinema
select ten , nam_mo_cua from rap_chieu_phim order by nam_mo_cua desc	cinema
select ten , dia_diem from rap_chieu_phim order by suc_chua desc limit 1	cinema
select avg ( suc_chua ) , min ( suc_chua ) , max ( suc_chua ) from rap_chieu_phim where nam_mo_cua >= 2011	cinema
select dia_diem , count ( * ) from rap_chieu_phim group by dia_diem	cinema
select dia_diem from rap_chieu_phim where nam_mo_cua >= 2010 group by dia_diem order by count ( * ) desc limit 1	cinema
select dia_diem from rap_chieu_phim where suc_chua > 300 group by dia_diem having count ( * ) >= 2	cinema
select dia_diem from rap_chieu_phim where suc_chua > 300 group by dia_diem having count ( * ) >= 2	cinema
select tieu_de , duoc_dao_dien_boi from phim	cinema
select tieu_de , duoc_dao_dien_boi from phim	cinema
select distinct duoc_dao_dien_boi from phim	cinema
select distinct duoc_dao_dien_boi from phim	cinema
select duoc_dao_dien_boi , count ( * ) from phim group by duoc_dao_dien_boi	cinema
select t2.ten , sum ( t1.so_luong_suat_chieu_moi_ngay ) from lich_chieu_phim as t1 join rap_chieu_phim as t2 on t1.id_rap_chieu_phim = t2.id_rap_chieu_phim group by t1.id_rap_chieu_phim	cinema
select t2.tieu_de , max ( t1.gia ) from lich_chieu_phim as t1 join phim as t2 on t1.id_phim = t2.id_phim group by t1.id_phim	cinema
select t2.tieu_de , max ( t1.gia ) from lich_chieu_phim as t1 join phim as t2 on t1.id_phim = t2.id_phim group by t1.id_phim	cinema
select t3.ten , t2.tieu_de , t1.ngay , t1.gia from lich_chieu_phim as t1 join phim as t2 on t1.id_phim = t2.id_phim join rap_chieu_phim as t3 on t1.id_rap_chieu_phim = t3.id_rap_chieu_phim	cinema
select tieu_de , duoc_dao_dien_boi from phim where id_phim not in ( select id_phim from lich_chieu_phim )	cinema
select t2.duoc_dao_dien_boi from lich_chieu_phim as t1 join phim as t2 on t1.id_phim = t2.id_phim group by t2.duoc_dao_dien_boi order by sum ( t1.so_luong_suat_chieu_moi_ngay ) desc limit 1	cinema
select dia_diem from rap_chieu_phim where suc_chua > 300 group by dia_diem having count ( * ) > 1	cinema
select dia_diem from rap_chieu_phim where suc_chua > 300 group by dia_diem having count ( * ) > 1	cinema
select count ( * ) from phim where tieu_de like "%Dummy%"	cinema
select count ( * ) from phim where tieu_de like "%Dummy%"	cinema
select count ( * ) from khoa_hoc	college_3
select count ( * ) from khoa_hoc	college_3
select count ( * ) from khoa_hoc where so_luong_tin_chi > 2	college_3
select count ( * ) from khoa_hoc where so_luong_tin_chi > 2	college_3
select ten_khoa_hoc from khoa_hoc where so_luong_tin_chi = 1	college_3
select ten_khoa_hoc from khoa_hoc where so_luong_tin_chi = 1	college_3
select ten_khoa_hoc from khoa_hoc where ngay = "MTW"	college_3
select ten_khoa_hoc from khoa_hoc where ngay = "MTW"	college_3
select count ( * ) from khoa where bo_phan = "AS"	college_3
select count ( * ) from khoa where bo_phan = "AS"	college_3
select so_dien_thoai_khoa from khoa where phong = 268	college_3
select so_dien_thoai_khoa from khoa where phong = 268	college_3
select count ( distinct id_sinh_vien ) from dang_ky_khoa_hoc where diem = "B"	college_3
select count ( distinct id_sinh_vien ) from dang_ky_khoa_hoc where diem = "B"	college_3
select max ( diem_so ) , min ( diem_so ) from chuyen_doi_diem	college_3
select max ( diem_so ) , min ( diem_so ) from chuyen_doi_diem	college_3
select distinct ten from sinh_vien where ten like "%a%"	college_3
select distinct ten from sinh_vien where ten like "%a%"	college_3
select ten , ho from giang_vien where gioi_tinh = "M" and toa_nha = "NEB"	college_3
select ten , ho from giang_vien where gioi_tinh = "M" and toa_nha = "NEB"	college_3
select phong from giang_vien where ngach = "Professor" and toa_nha = "NEB"	college_3
select phong from giang_vien where ngach = "Professor" and toa_nha = "NEB"	college_3
select ten_khoa from khoa where toa_nha = "Mergenthaler"	college_3
select ten_khoa from khoa where toa_nha = "Mergenthaler"	college_3
select * from khoa_hoc order by so_luong_tin_chi	college_3
select * from khoa_hoc order by so_luong_tin_chi	college_3
select ten_khoa_hoc from khoa_hoc order by so_luong_tin_chi	college_3
select ten_khoa_hoc from khoa_hoc order by so_luong_tin_chi	college_3
select ten from sinh_vien order by tuoi desc	college_3
select ten from sinh_vien order by tuoi desc	college_3
select ho from sinh_vien where gioi_tinh = "F" order by tuoi desc	college_3
select ho from sinh_vien where gioi_tinh = "F" order by tuoi desc	college_3
select ho from giang_vien where toa_nha = "Barton" order by ho	college_3
select ho from giang_vien where toa_nha = "Barton" order by ho	college_3
select ten from giang_vien where ngach = "Professor" order by ten	college_3
select ten from giang_vien where ngach = "Professor" order by ten	college_3
select t1.ten_khoa from khoa as t1 join chuyen_nganh_phu as t2 on t1.ma_so_khoa = t2.ma_so_khoa group by t2.ma_so_khoa order by count ( * ) desc limit 1	college_3
select t1.ten_khoa from khoa as t1 join chuyen_nganh_phu as t2 on t1.ma_so_khoa = t2.ma_so_khoa group by t2.ma_so_khoa order by count ( * ) desc limit 1	college_3
select ten_khoa from khoa except select t1.ten_khoa from khoa as t1 join chuyen_nganh_phu as t2 on t1.ma_so_khoa = t2.ma_so_khoa	college_3
select ten_khoa from khoa except select t1.ten_khoa from khoa as t1 join chuyen_nganh_phu as t2 on t1.ma_so_khoa = t2.ma_so_khoa	college_3
select t1.ten_khoa from khoa as t1 join la_thanh_vien_cua as t2 on t1.ma_so_khoa = t2.ma_so_khoa group by t2.ma_so_khoa order by count ( * ) asc limit 1	college_3
select t1.ten_khoa from khoa as t1 join la_thanh_vien_cua as t2 on t1.ma_so_khoa = t2.ma_so_khoa group by t2.ma_so_khoa order by count ( * ) asc limit 1	college_3
select ngach from giang_vien group by ngach order by count ( * ) asc limit 1	college_3
select ngach from giang_vien group by ngach order by count ( * ) asc limit 1	college_3
select t2.ten , t2.ho from khoa_hoc as t1 join giang_vien as t2 on t1.nguoi_huong_dan = t2.id_giang_vien group by t1.nguoi_huong_dan order by count ( * ) desc limit 3	college_3
select t2.ten , t2.ho from khoa_hoc as t1 join giang_vien as t2 on t1.nguoi_huong_dan = t2.id_giang_vien group by t1.nguoi_huong_dan order by count ( * ) desc limit 3	college_3
select t2.toa_nha from khoa_hoc as t1 join giang_vien as t2 on t1.nguoi_huong_dan = t2.id_giang_vien group by t1.nguoi_huong_dan order by count ( * ) desc limit 1	college_3
select t2.toa_nha from khoa_hoc as t1 join giang_vien as t2 on t1.nguoi_huong_dan = t2.id_giang_vien group by t1.nguoi_huong_dan order by count ( * ) desc limit 1	college_3
select t1.ten_khoa_hoc from khoa_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.id_khoa_hoc = t2.ma_khoa_hoc group by t2.ma_khoa_hoc having count ( * ) >= 5	college_3
select t1.ten_khoa_hoc from khoa_hoc as t1 join dang_ky_khoa_hoc as t2 on t1.id_khoa_hoc = t2.ma_khoa_hoc group by t2.ma_khoa_hoc having count ( * ) >= 5	college_3
select t2.ten , t2.ho from khoa_hoc as t1 join giang_vien as t2 on t1.nguoi_huong_dan = t2.id_giang_vien where t1.ten_khoa_hoc = "COMPUTER LITERACY"	college_3
select t2.ten , t2.ho from khoa_hoc as t1 join giang_vien as t2 on t1.nguoi_huong_dan = t2.id_giang_vien where t1.ten_khoa_hoc = "COMPUTER LITERACY"	college_3
select t2.ten_khoa , t2.phong from khoa_hoc as t1 join khoa as t2 on t1.ma_so_khoa = t2.ma_so_khoa where t1.ten_khoa_hoc = "INTRODUCTION TO COMPUTER SCIENCE"	college_3
select t2.ten_khoa , t2.phong from khoa_hoc as t1 join khoa as t2 on t1.ma_so_khoa = t2.ma_so_khoa where t1.ten_khoa_hoc = "INTRODUCTION TO COMPUTER SCIENCE"	college_3
select t3.ten , t3.ho , t2.diem_so from dang_ky_khoa_hoc as t1 join chuyen_doi_diem as t2 join sinh_vien as t3 on t1.diem = t2.bang_diem and t1.id_sinh_vien = t3.id_sinh_vien	college_3
select t3.ten , t3.ho , t2.diem_so from dang_ky_khoa_hoc as t1 join chuyen_doi_diem as t2 join sinh_vien as t3 on t1.diem = t2.bang_diem and t1.id_sinh_vien = t3.id_sinh_vien	college_3
select distinct t3.ten from dang_ky_khoa_hoc as t1 join chuyen_doi_diem as t2 join sinh_vien as t3 on t1.diem = t2.bang_diem and t1.id_sinh_vien = t3.id_sinh_vien where t2.diem_so >= 3.8	college_3
select distinct t3.ten from dang_ky_khoa_hoc as t1 join chuyen_doi_diem as t2 join sinh_vien as t3 on t1.diem = t2.bang_diem and t1.id_sinh_vien = t3.id_sinh_vien where t2.diem_so >= 3.8	college_3
select t1.ten , t1.ho from giang_vien as t1 join la_thanh_vien_cua as t2 on t1.id_giang_vien = t2.id_giang_vien where t2.ma_so_khoa = 520	college_3
select t1.ten , t1.ho from giang_vien as t1 join la_thanh_vien_cua as t2 on t1.id_giang_vien = t2.id_giang_vien where t2.ma_so_khoa = 520	college_3
select t2.ten , t2.ho from chuyen_nganh_phu as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien where t1.ma_so_khoa = 140	college_3
select t2.ten , t2.ho from chuyen_nganh_phu as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien where t1.ma_so_khoa = 140	college_3
select t2.ho from khoa as t1 join giang_vien as t2 on t1.ma_so_khoa = t3.ma_so_khoa join la_thanh_vien_cua as t3 on t2.id_giang_vien = t3.id_giang_vien where t1.ten_khoa = "Computer Science"	college_3
select t2.ho from khoa as t1 join giang_vien as t2 on t1.ma_so_khoa = t3.ma_so_khoa join la_thanh_vien_cua as t3 on t2.id_giang_vien = t3.id_giang_vien where t1.ten_khoa = "Computer Science"	college_3
select avg ( t2.diem_so ) from dang_ky_khoa_hoc as t1 join chuyen_doi_diem as t2 join sinh_vien as t3 on t1.diem = t2.bang_diem and t1.id_sinh_vien = t3.id_sinh_vien where t3.ho = "Smith"	college_3
select avg ( t2.diem_so ) from dang_ky_khoa_hoc as t1 join chuyen_doi_diem as t2 join sinh_vien as t3 on t1.diem = t2.bang_diem and t1.id_sinh_vien = t3.id_sinh_vien where t3.ho = "Smith"	college_3
select max ( t2.diem_so ) , min ( t2.diem_so ) from dang_ky_khoa_hoc as t1 join chuyen_doi_diem as t2 join sinh_vien as t3 on t1.diem = t2.bang_diem and t1.id_sinh_vien = t3.id_sinh_vien where t3.ma_thanh_pho = "NYC"	college_3
select max ( t2.diem_so ) , min ( t2.diem_so ) from dang_ky_khoa_hoc as t1 join chuyen_doi_diem as t2 join sinh_vien as t3 on t1.diem = t2.bang_diem and t1.id_sinh_vien = t3.id_sinh_vien where t3.ma_thanh_pho = "NYC"	college_3
select ten_khoa_hoc from khoa_hoc where so_luong_tin_chi = 3 union select ten_khoa_hoc from khoa_hoc where so_luong_tin_chi = 1 and gio = 4	college_3
select ten_khoa_hoc from khoa_hoc where so_luong_tin_chi = 3 union select ten_khoa_hoc from khoa_hoc where so_luong_tin_chi = 1 and gio = 4	college_3
select ten_khoa from khoa where bo_phan = "AS" union select ten_khoa from khoa where bo_phan = "EN" and toa_nha = "NEB"	college_3
select ten_khoa from khoa where bo_phan = "AS" union select ten_khoa from khoa where bo_phan = "EN" and toa_nha = "NEB"	college_3
select ten from sinh_vien where id_sinh_vien not in ( select id_sinh_vien from dang_ky_khoa_hoc )	college_3
select ten from sinh_vien where id_sinh_vien not in ( select id_sinh_vien from dang_ky_khoa_hoc )	college_3
select count ( * ) from ca_si	concert_singer
select count ( * ) from ca_si	concert_singer
select ten , quoc_gia , tuoi from ca_si order by tuoi desc	concert_singer
select ten , quoc_gia , tuoi from ca_si order by tuoi desc	concert_singer
select avg ( tuoi ) , min ( tuoi ) , max ( tuoi ) from ca_si where quoc_gia = "France"	concert_singer
select avg ( tuoi ) , min ( tuoi ) , max ( tuoi ) from ca_si where quoc_gia = "France"	concert_singer
select ten_bai_hat , nam_phat_hanh_bai_hat from ca_si order by tuoi limit 1	concert_singer
select ten_bai_hat , nam_phat_hanh_bai_hat from ca_si order by tuoi limit 1	concert_singer
select distinct quoc_gia from ca_si where tuoi > 20	concert_singer
select distinct quoc_gia from ca_si where tuoi > 20	concert_singer
select quoc_gia , count ( * ) from ca_si group by quoc_gia	concert_singer
select quoc_gia , count ( * ) from ca_si group by quoc_gia	concert_singer
select ten_bai_hat from ca_si where tuoi > ( select avg ( tuoi ) from ca_si )	concert_singer
select ten_bai_hat from ca_si where tuoi > ( select avg ( tuoi ) from ca_si )	concert_singer
select dia_diem , ten from san_van_dong where suc_chua between 5000 and 10000	concert_singer
select dia_diem , ten from san_van_dong where suc_chua between 5000 and 10000	concert_singer
select avg ( suc_chua ) , max ( suc_chua ) from san_van_dong	concert_singer
select avg ( suc_chua ) , max ( suc_chua ) from san_van_dong	concert_singer
select ten , suc_chua from san_van_dong order by so_luong_tham_gia_trung_binh desc limit 1	concert_singer
select ten , suc_chua from san_van_dong order by so_luong_tham_gia_trung_binh desc limit 1	concert_singer
select count ( * ) from buoi_hoa_nhac where nam = 2014 or nam = 2015	concert_singer
select count ( * ) from buoi_hoa_nhac where nam = 2014 or nam = 2015	concert_singer
select t2.ten , count ( * ) from buoi_hoa_nhac as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id_san_van_dong group by t1.id_san_van_dong	concert_singer
select t2.ten , count ( * ) from buoi_hoa_nhac as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id_san_van_dong group by t1.id_san_van_dong	concert_singer
select t2.ten , t2.suc_chua from buoi_hoa_nhac as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id_san_van_dong where t1.nam >= 2014 group by t2.id_san_van_dong order by count ( * ) desc limit 1	concert_singer
select t2.ten , t2.suc_chua from buoi_hoa_nhac as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id_san_van_dong where t1.nam >= 2014 group by t2.id_san_van_dong order by count ( * ) desc limit 1	concert_singer
select nam from buoi_hoa_nhac group by nam order by count ( * ) desc limit 1	concert_singer
select nam from buoi_hoa_nhac group by nam order by count ( * ) desc limit 1	concert_singer
select ten from san_van_dong where id_san_van_dong not in ( select id_san_van_dong from buoi_hoa_nhac )	concert_singer
select ten from san_van_dong where id_san_van_dong not in ( select id_san_van_dong from buoi_hoa_nhac )	concert_singer
select quoc_gia from ca_si where tuoi > 40 intersect select quoc_gia from ca_si where tuoi < 30	concert_singer
select ten from san_van_dong except select t2.ten from buoi_hoa_nhac as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id_san_van_dong where t1.nam = 2014	concert_singer
select ten from san_van_dong except select t2.ten from buoi_hoa_nhac as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id_san_van_dong where t1.nam = 2014	concert_singer
select t2.ten_buoi_hoa_nhac , t2.chu_de , count ( * ) from ca_si_trong_buoi_hoa_nhac as t1 join buoi_hoa_nhac as t2 on t1.id_buoi_hoa_nhac = t2.id_buoi_hoa_nhac group by t2.id_buoi_hoa_nhac	concert_singer
select t2.ten_buoi_hoa_nhac , t2.chu_de , count ( * ) from ca_si_trong_buoi_hoa_nhac as t1 join buoi_hoa_nhac as t2 on t1.id_buoi_hoa_nhac = t2.id_buoi_hoa_nhac group by t2.id_buoi_hoa_nhac	concert_singer
select t2.ten , count ( * ) from ca_si_trong_buoi_hoa_nhac as t1 join ca_si as t2 on t1.id_ca_si = t2.id_ca_si group by t2.id_ca_si	concert_singer
select t2.ten , count ( * ) from ca_si_trong_buoi_hoa_nhac as t1 join ca_si as t2 on t1.id_ca_si = t2.id_ca_si group by t2.id_ca_si	concert_singer
select t2.ten from ca_si_trong_buoi_hoa_nhac as t1 join ca_si as t2 on t1.id_ca_si = t2.id_ca_si join buoi_hoa_nhac as t3 on t1.id_buoi_hoa_nhac = t3.id_buoi_hoa_nhac where t3.nam = 2014	concert_singer
select t2.ten from ca_si_trong_buoi_hoa_nhac as t1 join ca_si as t2 on t1.id_ca_si = t2.id_ca_si join buoi_hoa_nhac as t3 on t1.id_buoi_hoa_nhac = t3.id_buoi_hoa_nhac where t3.nam = 2014	concert_singer
select ten , quoc_gia from ca_si where ten_bai_hat like "%Hey%"	concert_singer
select ten , quoc_gia from ca_si where ten_bai_hat like "%Hey%"	concert_singer
select t2.ten , t2.dia_diem from buoi_hoa_nhac as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id_san_van_dong where t1.nam = 2014 intersect select t2.ten , t2.dia_diem from buoi_hoa_nhac as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id_san_van_dong where t1.nam = 2015	concert_singer
select t2.ten , t2.dia_diem from buoi_hoa_nhac as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id_san_van_dong where t1.nam = 2014 intersect select t2.ten , t2.dia_diem from buoi_hoa_nhac as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id_san_van_dong where t1.nam = 2015	concert_singer
select count ( * ) from buoi_hoa_nhac as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id_san_van_dong order by t2.suc_chua desc limit 1	concert_singer
select count ( * ) from buoi_hoa_nhac as t1 join san_van_dong as t2 on t1.id_san_van_dong = t2.id_san_van_dong order by t2.suc_chua desc limit 1	concert_singer
select count ( * ) from khu_nha	customers_campaigns_ecommerce
select distinct mau_cua_khu_nha from khu_nha	customers_campaigns_ecommerce
select mau_cua_khu_nha , chi_tiet_khu_nha from khu_nha order by mau_cua_khu_nha	customers_campaigns_ecommerce
select mau_cua_khu_nha , count ( * ) from khu_nha group by mau_cua_khu_nha	customers_campaigns_ecommerce
select danh_muc_san_pham , count ( * ) from chien_dich_gui_thu_quang_cao group by danh_muc_san_pham	customers_campaigns_ecommerce
select ten_khach_hang , so_dien_thoai_khach_hang from khach_hang where id_khach_hang not in ( select id_khach_hang from thu_quang_cao_gui_khach_hang )	customers_campaigns_ecommerce
select t1.ten_khach_hang , t1.so_dien_thoai_khach_hang from khach_hang as t1 join thu_quang_cao_gui_khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ma_ket_qua = "No Response"	customers_campaigns_ecommerce
select ma_ket_qua , count ( * ) from thu_quang_cao_gui_khach_hang group by ma_ket_qua	customers_campaigns_ecommerce
select t2.ten_khach_hang from thu_quang_cao_gui_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where ma_ket_qua = "Order" group by t1.id_khach_hang having count ( * ) >= 2	customers_campaigns_ecommerce
select t2.ten_khach_hang from thu_quang_cao_gui_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang order by count ( * ) desc limit 1	customers_campaigns_ecommerce
select t2.ten_khach_hang , t2.phuong_thuc_thanh_toan from thu_quang_cao_gui_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ma_ket_qua = "Order" intersect select t2.ten_khach_hang , t2.phuong_thuc_thanh_toan from thu_quang_cao_gui_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ma_ket_qua = "No Response"	customers_campaigns_ecommerce
select t2.mau_cua_khu_nha , t1.ma_loai_dia_chi from dia_chi_khach_hang as t1 join khu_nha as t2 on t1.id_khu_nha = t2.id_khu_nha	customers_campaigns_ecommerce
select distinct ma_loai_dia_chi from dia_chi_khach_hang	customers_campaigns_ecommerce
select phi_van_chuyen_don_hang , id_khach_hang from luot_dat_hang_cua_khach_hang where ma_trang_thai_don_hang = "Cancelled" or ma_trang_thai_don_hang = "Paid"	customers_campaigns_ecommerce
select t1.ten_khach_hang from khach_hang as t1 join luot_dat_hang_cua_khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where ma_phuong_thuc_van_chuyen = "FedEx" and ma_trang_thai_don_hang = "Paid"	customers_campaigns_ecommerce
select count ( * ) from tai_khoan	customers_card_transactions
select count ( * ) from tai_khoan	customers_card_transactions
select id_tai_khoan , id_khach_hang , ten_tai_khoan from tai_khoan	customers_card_transactions
select id_tai_khoan , id_khach_hang , ten_tai_khoan from tai_khoan	customers_card_transactions
select chi_tiet_khac_ve_tai_khoan from tai_khoan where ten_tai_khoan = "338"	customers_card_transactions
select chi_tiet_khac_ve_tai_khoan from tai_khoan where ten_tai_khoan = "338"	customers_card_transactions
select t2.ten_cua_khach_hang , t2.ho_cua_khach_hang , t2.so_dien_thoai_khach_hang from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ten_tai_khoan = "162"	customers_card_transactions
select t2.ten_cua_khach_hang , t2.ho_cua_khach_hang , t2.so_dien_thoai_khach_hang from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.ten_tai_khoan = "162"	customers_card_transactions
select count ( * ) from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten_cua_khach_hang = "Art" and t2.ho_cua_khach_hang = "Turcotte"	customers_card_transactions
select count ( * ) from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten_cua_khach_hang = "Art" and t2.ho_cua_khach_hang = "Turcotte"	customers_card_transactions
select id_khach_hang , count ( * ) from tai_khoan group by id_khach_hang	customers_card_transactions
select id_khach_hang , count ( * ) from tai_khoan group by id_khach_hang	customers_card_transactions
select id_khach_hang , count ( * ) from tai_khoan group by id_khach_hang order by count ( * ) desc limit 1	customers_card_transactions
select id_khach_hang , count ( * ) from tai_khoan group by id_khach_hang order by count ( * ) desc limit 1	customers_card_transactions
select t2.ten_cua_khach_hang , t2.ho_cua_khach_hang , t1.id_khach_hang from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang order by count ( * ) asc limit 1	customers_card_transactions
select t2.ten_cua_khach_hang , t2.ho_cua_khach_hang , t1.id_khach_hang from tai_khoan as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang order by count ( * ) asc limit 1	customers_card_transactions
select count ( * ) from khach_hang where id_khach_hang not in ( select id_khach_hang from tai_khoan )	customers_card_transactions
select count ( * ) from khach_hang where id_khach_hang not in ( select id_khach_hang from tai_khoan )	customers_card_transactions
select ten_cua_khach_hang , ho_cua_khach_hang from khach_hang except select t1.ten_cua_khach_hang , t1.ho_cua_khach_hang from khach_hang as t1 join tai_khoan as t2 on t1.id_khach_hang = t2.id_khach_hang	customers_card_transactions
select ten_cua_khach_hang , ho_cua_khach_hang from khach_hang except select t1.ten_cua_khach_hang , t1.ho_cua_khach_hang from khach_hang as t1 join tai_khoan as t2 on t1.id_khach_hang = t2.id_khach_hang	customers_card_transactions
select distinct t1.ten_cua_khach_hang , t1.ho_cua_khach_hang from khach_hang as t1 join tai_khoan as t2 on t1.id_khach_hang = t2.id_khach_hang	customers_card_transactions
select distinct t1.ten_cua_khach_hang , t1.ho_cua_khach_hang from khach_hang as t1 join tai_khoan as t2 on t1.id_khach_hang = t2.id_khach_hang	customers_card_transactions
select count ( distinct id_khach_hang ) from tai_khoan	customers_card_transactions
select count ( distinct id_khach_hang ) from tai_khoan	customers_card_transactions
select count ( * ) from khach_hang	customers_card_transactions
select count ( * ) from khach_hang	customers_card_transactions
select id_khach_hang , ten_cua_khach_hang , ho_cua_khach_hang , so_dien_thoai_khach_hang from khach_hang	customers_card_transactions
select id_khach_hang , ten_cua_khach_hang , ho_cua_khach_hang , so_dien_thoai_khach_hang from khach_hang	customers_card_transactions
select so_dien_thoai_khach_hang , email_cua_khach_hang from khach_hang where ten_cua_khach_hang = "Aniyah" and ho_cua_khach_hang = "Feest"	customers_card_transactions
select so_dien_thoai_khach_hang , email_cua_khach_hang from khach_hang where ten_cua_khach_hang = "Aniyah" and ho_cua_khach_hang = "Feest"	customers_card_transactions
select count ( * ) from the_khach_hang	customers_card_transactions
select count ( * ) from the_khach_hang	customers_card_transactions
select id_the , id_khach_hang , ma_loai_the , so_the from the_khach_hang	customers_card_transactions
select id_the , id_khach_hang , ma_loai_the , so_the from the_khach_hang	customers_card_transactions
select hop_le_tu_ngay , hop_le_den_ngay from the_khach_hang where so_the = "4560596484842"	customers_card_transactions
select hop_le_tu_ngay , hop_le_den_ngay from the_khach_hang where so_the = "4560596484842"	customers_card_transactions
select t2.ten_cua_khach_hang , t2.ho_cua_khach_hang , t2.so_dien_thoai_khach_hang from the_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.so_the = "4560596484842"	customers_card_transactions
select t2.ten_cua_khach_hang , t2.ho_cua_khach_hang , t2.so_dien_thoai_khach_hang from the_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t1.so_the = "4560596484842"	customers_card_transactions
select count ( * ) from the_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten_cua_khach_hang = "Art" and t2.ho_cua_khach_hang = "Turcotte"	customers_card_transactions
select count ( * ) from the_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten_cua_khach_hang = "Art" and t2.ho_cua_khach_hang = "Turcotte"	customers_card_transactions
select count ( * ) from the_khach_hang where ma_loai_the = "Debit"	customers_card_transactions
select count ( * ) from the_khach_hang where ma_loai_the = "Debit"	customers_card_transactions
select count ( * ) from the_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten_cua_khach_hang = "Blanche" and t2.ho_cua_khach_hang = "Huels" and t1.ma_loai_the = "Credit"	customers_card_transactions
select count ( * ) from the_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where t2.ten_cua_khach_hang = "Blanche" and t2.ho_cua_khach_hang = "Huels" and t1.ma_loai_the = "Credit"	customers_card_transactions
select id_khach_hang , count ( * ) from the_khach_hang group by id_khach_hang	customers_card_transactions
select id_khach_hang , count ( * ) from the_khach_hang group by id_khach_hang	customers_card_transactions
select id_khach_hang , count ( * ) from the_khach_hang group by id_khach_hang order by count ( * ) desc limit 1	customers_card_transactions
select id_khach_hang , count ( * ) from the_khach_hang group by id_khach_hang order by count ( * ) desc limit 1	customers_card_transactions
select t1.id_khach_hang , t2.ten_cua_khach_hang , t2.ho_cua_khach_hang from the_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang having count ( * ) >= 2	customers_card_transactions
select t1.id_khach_hang , t2.ten_cua_khach_hang , t2.ho_cua_khach_hang from the_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang having count ( * ) >= 2	customers_card_transactions
select t1.id_khach_hang , t2.ten_cua_khach_hang , t2.ho_cua_khach_hang from the_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang order by count ( * ) asc limit 1	customers_card_transactions
select t1.id_khach_hang , t2.ten_cua_khach_hang , t2.ho_cua_khach_hang from the_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang group by t1.id_khach_hang order by count ( * ) asc limit 1	customers_card_transactions
select ma_loai_the , count ( * ) from the_khach_hang group by ma_loai_the	customers_card_transactions
select ma_loai_the , count ( * ) from the_khach_hang group by ma_loai_the	customers_card_transactions
select ma_loai_the from the_khach_hang group by ma_loai_the order by count ( * ) desc limit 1	customers_card_transactions
select ma_loai_the from the_khach_hang group by ma_loai_the order by count ( * ) desc limit 1	customers_card_transactions
select ma_loai_the from the_khach_hang group by ma_loai_the having count ( * ) >= 5	customers_card_transactions
select ma_loai_the from the_khach_hang group by ma_loai_the having count ( * ) >= 5	customers_card_transactions
select ma_loai_the , count ( distinct id_khach_hang ) from the_khach_hang group by ma_loai_the	customers_card_transactions
select ma_loai_the , count ( distinct id_khach_hang ) from the_khach_hang group by ma_loai_the	customers_card_transactions
select id_khach_hang , ten_cua_khach_hang from khach_hang except select t1.id_khach_hang , t2.ten_cua_khach_hang from the_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where ma_loai_the = "Credit"	customers_card_transactions
select id_khach_hang , ten_cua_khach_hang from khach_hang except select t1.id_khach_hang , t2.ten_cua_khach_hang from the_khach_hang as t1 join khach_hang as t2 on t1.id_khach_hang = t2.id_khach_hang where ma_loai_the = "Credit"	customers_card_transactions
select distinct ma_loai_the from the_khach_hang	customers_card_transactions
select distinct ma_loai_the from the_khach_hang	customers_card_transactions
select count ( distinct ma_loai_the ) from the_khach_hang	customers_card_transactions
select count ( distinct ma_loai_the ) from the_khach_hang	customers_card_transactions
select distinct loai_giao_dich from giao_dich_tai_chinh	customers_card_transactions
select distinct loai_giao_dich from giao_dich_tai_chinh	customers_card_transactions
select count ( distinct loai_giao_dich ) from giao_dich_tai_chinh	customers_card_transactions
select count ( distinct loai_giao_dich ) from giao_dich_tai_chinh	customers_card_transactions
select avg ( so_tien_giao_dich ) , sum ( so_tien_giao_dich ) from giao_dich_tai_chinh	customers_card_transactions
select avg ( so_tien_giao_dich ) , sum ( so_tien_giao_dich ) from giao_dich_tai_chinh	customers_card_transactions
select t2.ma_loai_the , count ( * ) from giao_dich_tai_chinh as t1 join the_khach_hang as t2 on t1.id_the = t2.id_the group by t2.ma_loai_the	customers_card_transactions
select t2.ma_loai_the , count ( * ) from giao_dich_tai_chinh as t1 join the_khach_hang as t2 on t1.id_the = t2.id_the group by t2.ma_loai_the	customers_card_transactions
select loai_giao_dich , count ( * ) from giao_dich_tai_chinh group by loai_giao_dich	customers_card_transactions
select loai_giao_dich , count ( * ) from giao_dich_tai_chinh group by loai_giao_dich	customers_card_transactions
select loai_giao_dich from giao_dich_tai_chinh group by loai_giao_dich order by sum ( so_tien_giao_dich ) desc limit 1	customers_card_transactions
select loai_giao_dich from giao_dich_tai_chinh group by loai_giao_dich order by sum ( so_tien_giao_dich ) desc limit 1	customers_card_transactions
select id_tai_khoan , count ( * ) from giao_dich_tai_chinh group by id_tai_khoan	customers_card_transactions
select id_tai_khoan , count ( * ) from giao_dich_tai_chinh group by id_tai_khoan	customers_card_transactions
select ten_tai_lieu , so_luong_truy_cap from tai_lieu order by ten_tai_lieu	document_management
select ten_tai_lieu , so_luong_truy_cap from tai_lieu order by ten_tai_lieu	document_management
select ten_tai_lieu , so_luong_truy_cap from tai_lieu order by so_luong_truy_cap desc limit 1	document_management
select ten_tai_lieu , so_luong_truy_cap from tai_lieu order by so_luong_truy_cap desc limit 1	document_management
select ma_loai_tai_lieu from tai_lieu group by ma_loai_tai_lieu having count ( * ) > 4	document_management
select ma_loai_tai_lieu from tai_lieu group by ma_loai_tai_lieu having count ( * ) > 4	document_management
select sum ( so_luong_truy_cap ) from tai_lieu group by ma_loai_tai_lieu order by count ( * ) desc limit 1	document_management
select sum ( so_luong_truy_cap ) from tai_lieu group by ma_loai_tai_lieu order by count ( * ) desc limit 1	document_management
select avg ( so_luong_truy_cap ) from tai_lieu	document_management
select avg ( so_luong_truy_cap ) from tai_lieu	document_management
select t2.mo_ta_ve_cau_truc_tai_lieu from tai_lieu as t1 join cau_truc_tai_lieu as t2 on t1.ma_cau_truc_tai_lieu = t2.ma_cau_truc_tai_lieu group by t1.ma_cau_truc_tai_lieu order by count ( * ) desc limit 1	document_management
select t2.mo_ta_ve_cau_truc_tai_lieu from tai_lieu as t1 join cau_truc_tai_lieu as t2 on t1.ma_cau_truc_tai_lieu = t2.ma_cau_truc_tai_lieu group by t1.ma_cau_truc_tai_lieu order by count ( * ) desc limit 1	document_management
select ma_loai_tai_lieu from tai_lieu where ten_tai_lieu = "David CV"	document_management
select ma_loai_tai_lieu from tai_lieu where ten_tai_lieu = "David CV"	document_management
select ten_tai_lieu from tai_lieu group by ma_loai_tai_lieu order by count ( * ) desc limit 3 intersect select ten_tai_lieu from tai_lieu group by ma_cau_truc_tai_lieu order by count ( * ) desc limit 3	document_management
select ten_tai_lieu from tai_lieu group by ma_loai_tai_lieu order by count ( * ) desc limit 3 intersect select ten_tai_lieu from tai_lieu group by ma_cau_truc_tai_lieu order by count ( * ) desc limit 3	document_management
select ma_loai_tai_lieu from tai_lieu group by ma_loai_tai_lieu having sum ( so_luong_truy_cap ) > 10000	document_management
select ma_loai_tai_lieu from tai_lieu group by ma_loai_tai_lieu having sum ( so_luong_truy_cap ) > 10000	document_management
select t2.tieu_de_muc from tai_lieu as t1 join cac_muc_cua_tai_lieu as t2 on t1.ma_tai_lieu = t2.ma_tai_lieu where t1.ten_tai_lieu = "David CV"	document_management
select t2.tieu_de_muc from tai_lieu as t1 join cac_muc_cua_tai_lieu as t2 on t1.ma_tai_lieu = t2.ma_tai_lieu where t1.ten_tai_lieu = "David CV"	document_management
select ten_tai_lieu from tai_lieu where ma_tai_lieu not in ( select ma_tai_lieu from cac_muc_cua_tai_lieu )	document_management
select ten_tai_lieu from tai_lieu where ma_tai_lieu not in ( select ma_tai_lieu from cac_muc_cua_tai_lieu )	document_management
select ten_nguoi_dung , mat_khau from nguoi_dung group by ma_vai_tro order by count ( * ) desc limit 1	document_management
select ten_nguoi_dung , mat_khau from nguoi_dung group by ma_vai_tro order by count ( * ) desc limit 1	document_management
select avg ( t1.so_luong_truy_cap ) from tai_lieu as t1 join chuc_nang_phan_cua_tai_lieu as t2 on t1.ma_tai_lieu = t2.ma_tai_lieu join khu_vuc_chuc_nang as t3 on t2.ma_chuc_nang_phan = t3.ma_chuc_nang_phan where t3.mo_ta_ve_chuc_nang_phan = "Acknowledgement"	document_management
select avg ( t1.so_luong_truy_cap ) from tai_lieu as t1 join chuc_nang_phan_cua_tai_lieu as t2 on t1.ma_tai_lieu = t2.ma_tai_lieu join khu_vuc_chuc_nang as t3 on t2.ma_chuc_nang_phan = t3.ma_chuc_nang_phan where t3.mo_ta_ve_chuc_nang_phan = "Acknowledgement"	document_management
select ten_tai_lieu from tai_lieu except select t1.ten_tai_lieu from tai_lieu as t1 join cac_muc_cua_tai_lieu as t2 on t1.ma_tai_lieu = t2.ma_tai_lieu join hinh_anh_trong_cac_muc_cua_tai_lieu as t3 on t2.id_muc = t3.id_muc	document_management
select ten_tai_lieu from tai_lieu except select t1.ten_tai_lieu from tai_lieu as t1 join cac_muc_cua_tai_lieu as t2 on t1.ma_tai_lieu = t2.ma_tai_lieu join hinh_anh_trong_cac_muc_cua_tai_lieu as t3 on t2.id_muc = t3.id_muc	document_management
select t1.ten_tai_lieu from tai_lieu as t1 join cac_muc_cua_tai_lieu as t2 on t1.ma_tai_lieu = t2.ma_tai_lieu group by t1.ma_tai_lieu order by count ( * ) desc limit 1	document_management
select t1.ten_tai_lieu from tai_lieu as t1 join cac_muc_cua_tai_lieu as t2 on t1.ma_tai_lieu = t2.ma_tai_lieu group by t1.ma_tai_lieu order by count ( * ) desc limit 1	document_management
select ten_tai_lieu from tai_lieu where ten_tai_lieu like "%CV%"	document_management
select ten_tai_lieu from tai_lieu where ten_tai_lieu like "%CV%"	document_management
select count ( * ) from nguoi_dung where lan_dang_nhap_cua_nguoi_dung = 1	document_management
select count ( * ) from nguoi_dung where lan_dang_nhap_cua_nguoi_dung = 1	document_management
select mo_ta_ve_vai_tro from vai_tro where ma_vai_tro = ( select ma_vai_tro from nguoi_dung where lan_dang_nhap_cua_nguoi_dung = 1 group by ma_vai_tro order by count ( * ) desc limit 1 )	document_management
select mo_ta_ve_vai_tro from vai_tro where ma_vai_tro = ( select ma_vai_tro from nguoi_dung where lan_dang_nhap_cua_nguoi_dung = 1 group by ma_vai_tro order by count ( * ) desc limit 1 )	document_management
select avg ( so_luong_truy_cap ) from tai_lieu group by ma_cau_truc_tai_lieu order by count ( * ) asc limit 1	document_management
select avg ( so_luong_truy_cap ) from tai_lieu group by ma_cau_truc_tai_lieu order by count ( * ) asc limit 1	document_management
select ten_hinh_anh , duong_dan_cua_hinh_anh from hinh_anh order by ten_hinh_anh	document_management
select ten_hinh_anh , duong_dan_cua_hinh_anh from hinh_anh order by ten_hinh_anh	document_management
select count ( * ) , ma_vai_tro from nguoi_dung group by ma_vai_tro	document_management
select count ( * ) , ma_vai_tro from nguoi_dung group by ma_vai_tro	document_management
select ma_loai_tai_lieu from tai_lieu group by ma_loai_tai_lieu having count ( * ) > 2	document_management
select ma_loai_tai_lieu from tai_lieu group by ma_loai_tai_lieu having count ( * ) > 2	document_management
select count ( * ) from khoa_hoc	e_learning
select count ( * ) from khoa_hoc	e_learning
select mo_ta_ve_khoa_hoc from khoa_hoc where ten_khoa_hoc = "database"	e_learning
select mo_ta_ve_khoa_hoc from khoa_hoc where ten_khoa_hoc = "database"	e_learning
select dong_1_cua_dia_chi from tac_gia_khoa_hoc_va_nguoi_huong_dan where ten_ca_nhan = "Cathrine"	e_learning
select dong_1_cua_dia_chi from tac_gia_khoa_hoc_va_nguoi_huong_dan where ten_ca_nhan = "Cathrine"	e_learning
select dong_1_cua_dia_chi from tac_gia_khoa_hoc_va_nguoi_huong_dan	e_learning
select dong_1_cua_dia_chi from tac_gia_khoa_hoc_va_nguoi_huong_dan	e_learning
select ten_dang_nhap , ho from tac_gia_khoa_hoc_va_nguoi_huong_dan	e_learning
select ten_dang_nhap , ho from tac_gia_khoa_hoc_va_nguoi_huong_dan	e_learning
select ngay_ngay_dang_ky , ngay_hoan_thanh from luot_dang_ky_khoa_hoc_cua_sinh_vien	e_learning
select ngay_ngay_dang_ky , ngay_hoan_thanh from luot_dang_ky_khoa_hoc_cua_sinh_vien	e_learning
select count ( distinct id_sinh_vien ) from luot_dang_ky_khoa_hoc_cua_sinh_vien	e_learning
select count ( distinct id_sinh_vien ) from luot_dang_ky_khoa_hoc_cua_sinh_vien	e_learning
select count ( id_khoa_hoc ) from luot_dang_ky_khoa_hoc_cua_sinh_vien	e_learning
select count ( id_khoa_hoc ) from luot_dang_ky_khoa_hoc_cua_sinh_vien	e_learning
select ngay_lam_bai_kiem_tra from bai_kiem_tra_cua_sinh_vien where ket_qua_kiem_tra = "Pass"	e_learning
select ngay_lam_bai_kiem_tra from bai_kiem_tra_cua_sinh_vien where ket_qua_kiem_tra = "Pass"	e_learning
select count ( * ) from bai_kiem_tra_cua_sinh_vien where ket_qua_kiem_tra = "Fail"	e_learning
select count ( * ) from bai_kiem_tra_cua_sinh_vien where ket_qua_kiem_tra = "Fail"	e_learning
select ten_dang_nhap from sinh_vien where ho = "Ward"	e_learning
select ten_dang_nhap from sinh_vien where ho = "Ward"	e_learning
select ngay_dang_nhap_moi_nhat from sinh_vien where ho = "Jaskolski" or ho = "Langosh"	e_learning
select ngay_dang_nhap_moi_nhat from sinh_vien where ho = "Jaskolski" or ho = "Langosh"	e_learning
select count ( * ) from sinh_vien where ten_ca_nhan like "%son%"	e_learning
select count ( * ) from sinh_vien where ten_ca_nhan like "%son%"	e_learning
select ten_mon_hoc from mon_hoc	e_learning
select ten_mon_hoc from mon_hoc	e_learning
select * from tac_gia_khoa_hoc_va_nguoi_huong_dan order by ten_ca_nhan	e_learning
select * from tac_gia_khoa_hoc_va_nguoi_huong_dan order by ten_ca_nhan	e_learning
select ten_ca_nhan , ho from sinh_vien order by ho	e_learning
select ten_ca_nhan , ho from sinh_vien order by ho	e_learning
select ket_qua_kiem_tra , count ( * ) from bai_kiem_tra_cua_sinh_vien group by ket_qua_kiem_tra order by count ( * ) desc	e_learning
select ket_qua_kiem_tra , count ( * ) from bai_kiem_tra_cua_sinh_vien group by ket_qua_kiem_tra order by count ( * ) desc	e_learning
select t1.ten_dang_nhap from tac_gia_khoa_hoc_va_nguoi_huong_dan as t1 join khoa_hoc as t2 on t1.id_tac_gia = t2.id_tac_gia where t2.ten_khoa_hoc = "advanced database"	e_learning
select t1.ten_dang_nhap from tac_gia_khoa_hoc_va_nguoi_huong_dan as t1 join khoa_hoc as t2 on t1.id_tac_gia = t2.id_tac_gia where t2.ten_khoa_hoc = "advanced database"	e_learning
select t1.dong_1_cua_dia_chi from tac_gia_khoa_hoc_va_nguoi_huong_dan as t1 join khoa_hoc as t2 on t1.id_tac_gia = t2.id_tac_gia where t2.ten_khoa_hoc = "operating system" or t2.ten_khoa_hoc = "data structure"	e_learning
select t1.dong_1_cua_dia_chi from tac_gia_khoa_hoc_va_nguoi_huong_dan as t1 join khoa_hoc as t2 on t1.id_tac_gia = t2.id_tac_gia where t2.ten_khoa_hoc = "operating system" or t2.ten_khoa_hoc = "data structure"	e_learning
select t1.ten_ca_nhan , t1.ho , t2.id_tac_gia from tac_gia_khoa_hoc_va_nguoi_huong_dan as t1 join khoa_hoc as t2 on t1.id_tac_gia = t2.id_tac_gia group by t2.id_tac_gia order by count ( * ) desc limit 1	e_learning
select t1.ten_ca_nhan , t1.ho , t2.id_tac_gia from tac_gia_khoa_hoc_va_nguoi_huong_dan as t1 join khoa_hoc as t2 on t1.id_tac_gia = t2.id_tac_gia group by t2.id_tac_gia order by count ( * ) desc limit 1	e_learning
select t1.dong_1_cua_dia_chi , t2.id_tac_gia from tac_gia_khoa_hoc_va_nguoi_huong_dan as t1 join khoa_hoc as t2 on t1.id_tac_gia = t2.id_tac_gia group by t2.id_tac_gia having count ( * ) >= 2	e_learning
select t1.dong_1_cua_dia_chi , t2.id_tac_gia from tac_gia_khoa_hoc_va_nguoi_huong_dan as t1 join khoa_hoc as t2 on t1.id_tac_gia = t2.id_tac_gia group by t2.id_tac_gia having count ( * ) >= 2	e_learning
select t2.ten_khoa_hoc from tac_gia_khoa_hoc_va_nguoi_huong_dan as t1 join khoa_hoc as t2 on t1.id_tac_gia = t2.id_tac_gia where t1.ten_ca_nhan = "Julio"	e_learning
select t2.ten_khoa_hoc from tac_gia_khoa_hoc_va_nguoi_huong_dan as t1 join khoa_hoc as t2 on t1.id_tac_gia = t2.id_tac_gia where t1.ten_ca_nhan = "Julio"	e_learning
select t1.ten_khoa_hoc , t1.mo_ta_ve_khoa_hoc from khoa_hoc as t1 join mon_hoc as t2 on t1.id_mon_hoc = t2.id_mon_hoc where t2.ten_mon_hoc = "Computer Science"	e_learning
select t1.ten_khoa_hoc , t1.mo_ta_ve_khoa_hoc from khoa_hoc as t1 join mon_hoc as t2 on t1.id_mon_hoc = t2.id_mon_hoc where t2.ten_mon_hoc = "Computer Science"	e_learning
select t1.id_mon_hoc , t2.ten_mon_hoc , count ( * ) from khoa_hoc as t1 join mon_hoc as t2 on t1.id_mon_hoc = t2.id_mon_hoc group by t1.id_mon_hoc	e_learning
select t1.id_mon_hoc , t2.ten_mon_hoc , count ( * ) from khoa_hoc as t1 join mon_hoc as t2 on t1.id_mon_hoc = t2.id_mon_hoc group by t1.id_mon_hoc	e_learning
select t1.id_mon_hoc , t2.ten_mon_hoc , count ( * ) from khoa_hoc as t1 join mon_hoc as t2 on t1.id_mon_hoc = t2.id_mon_hoc group by t1.id_mon_hoc order by count ( * ) asc	e_learning
select t1.id_mon_hoc , t2.ten_mon_hoc , count ( * ) from khoa_hoc as t1 join mon_hoc as t2 on t1.id_mon_hoc = t2.id_mon_hoc group by t1.id_mon_hoc order by count ( * ) asc	e_learning
select t2.ngay_ngay_dang_ky from khoa_hoc as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc where t1.ten_khoa_hoc = "Spanish"	e_learning
select t2.ngay_ngay_dang_ky from khoa_hoc as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc where t1.ten_khoa_hoc = "Spanish"	e_learning
select t1.ten_khoa_hoc from khoa_hoc as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc group by t1.ten_khoa_hoc order by count ( * ) desc limit 1	e_learning
select t1.ten_khoa_hoc from khoa_hoc as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc group by t1.ten_khoa_hoc order by count ( * ) desc limit 1	e_learning
select t1.ten_khoa_hoc from khoa_hoc as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc group by t1.ten_khoa_hoc having count ( * ) = 1	e_learning
select t1.ten_khoa_hoc from khoa_hoc as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc group by t1.ten_khoa_hoc having count ( * ) = 1	e_learning
select t1.mo_ta_ve_khoa_hoc , t1.ten_khoa_hoc from khoa_hoc as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc group by t1.ten_khoa_hoc having count ( * ) > 2	e_learning
select t1.mo_ta_ve_khoa_hoc , t1.ten_khoa_hoc from khoa_hoc as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc group by t1.ten_khoa_hoc having count ( * ) > 2	e_learning
select t1.ten_khoa_hoc , count ( * ) from khoa_hoc as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc group by t1.ten_khoa_hoc	e_learning
select t1.ten_khoa_hoc , count ( * ) from khoa_hoc as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_khoa_hoc = t2.id_khoa_hoc group by t1.ten_khoa_hoc	e_learning
select t1.ngay_ngay_dang_ky from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join bai_kiem_tra_cua_sinh_vien as t2 on t1.id_dang_ky = t2.id_dang_ky where t2.ket_qua_kiem_tra = "Pass"	e_learning
select t1.ngay_ngay_dang_ky from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join bai_kiem_tra_cua_sinh_vien as t2 on t1.id_dang_ky = t2.id_dang_ky where t2.ket_qua_kiem_tra = "Pass"	e_learning
select t1.ngay_hoan_thanh from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join bai_kiem_tra_cua_sinh_vien as t2 on t1.id_dang_ky = t2.id_dang_ky where t2.ket_qua_kiem_tra = "Fail"	e_learning
select t1.ngay_hoan_thanh from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join bai_kiem_tra_cua_sinh_vien as t2 on t1.id_dang_ky = t2.id_dang_ky where t2.ket_qua_kiem_tra = "Fail"	e_learning
select t1.ngay_ngay_dang_ky , t1.ngay_hoan_thanh from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien where t2.ten_ca_nhan = "Karson"	e_learning
select t1.ngay_ngay_dang_ky , t1.ngay_hoan_thanh from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien where t2.ten_ca_nhan = "Karson"	e_learning
select t1.ngay_ngay_dang_ky , t1.ngay_hoan_thanh from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien where t2.ho = "Zieme" and t2.ten_ca_nhan = "Bernie"	e_learning
select t1.ngay_ngay_dang_ky , t1.ngay_hoan_thanh from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien where t2.ho = "Zieme" and t2.ten_ca_nhan = "Bernie"	e_learning
select t1.id_sinh_vien , t2.ten_dang_nhap from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien order by count ( * ) desc limit 1	e_learning
select t1.id_sinh_vien , t2.ten_dang_nhap from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien order by count ( * ) desc limit 1	e_learning
select t1.id_sinh_vien , t2.ten_ca_nhan from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien having count ( * ) >= 2	e_learning
select t1.id_sinh_vien , t2.ten_ca_nhan from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien having count ( * ) >= 2	e_learning
select t1.id_sinh_vien , t2.ten_dem from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien having count ( * ) <= 2	e_learning
select t1.id_sinh_vien , t2.ten_dem from luot_dang_ky_khoa_hoc_cua_sinh_vien as t1 join sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien group by t1.id_sinh_vien having count ( * ) <= 2	e_learning
select ten_ca_nhan from sinh_vien except select t1.ten_ca_nhan from sinh_vien as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien	e_learning
select ten_ca_nhan from sinh_vien except select t1.ten_ca_nhan from sinh_vien as t1 join luot_dang_ky_khoa_hoc_cua_sinh_vien as t2 on t1.id_sinh_vien = t2.id_sinh_vien	e_learning
select count ( * ) from sinh_vien where id_sinh_vien not in ( select id_sinh_vien from luot_dang_ky_khoa_hoc_cua_sinh_vien )	e_learning
select count ( * ) from sinh_vien where id_sinh_vien not in ( select id_sinh_vien from luot_dang_ky_khoa_hoc_cua_sinh_vien )	e_learning
select ten_dang_nhap from tac_gia_khoa_hoc_va_nguoi_huong_dan intersect select ten_dang_nhap from sinh_vien	e_learning
select ten_dang_nhap from tac_gia_khoa_hoc_va_nguoi_huong_dan intersect select ten_dang_nhap from sinh_vien	e_learning
select ten_ca_nhan from tac_gia_khoa_hoc_va_nguoi_huong_dan intersect select ten_ca_nhan from sinh_vien	e_learning
select ten_ca_nhan from tac_gia_khoa_hoc_va_nguoi_huong_dan intersect select ten_ca_nhan from sinh_vien	e_learning
select count ( * ) from trang_trai	farm
select count ( * ) from trang_trai	farm
select tong_so_ngua from trang_trai order by tong_so_ngua asc	farm
select tong_so_ngua from trang_trai order by tong_so_ngua asc	farm
select chu_nha from cuoc_thi_trang_trai where chu_de != "Aliens"	farm
select chu_nha from cuoc_thi_trang_trai where chu_de != "Aliens"	farm
select chu_de from cuoc_thi_trang_trai order by nam asc	farm
select chu_de from cuoc_thi_trang_trai order by nam asc	farm
select avg ( ngua_lam_viec ) from trang_trai where tong_so_ngua > 5000	farm
select avg ( ngua_lam_viec ) from trang_trai where tong_so_ngua > 5000	farm
select max ( bo_cai ) , min ( bo_cai ) from trang_trai	farm
select max ( bo_cai ) , min ( bo_cai ) from trang_trai	farm
select count ( distinct cap_bac ) from thanh_pho	farm
select count ( distinct cap_bac ) from thanh_pho	farm
select ten_chinh_thuc from thanh_pho order by dan_so desc	farm
select ten_chinh_thuc from thanh_pho order by dan_so desc	farm
select ten_chinh_thuc , cap_bac from thanh_pho order by dan_so desc limit 1	farm
select ten_chinh_thuc , cap_bac from thanh_pho order by dan_so desc limit 1	farm
select t2.nam , t1.ten_chinh_thuc from thanh_pho as t1 join cuoc_thi_trang_trai as t2 on t1.id_thanh_pho = t2.id_thanh_pho_chu_nha	farm
select t2.nam , t1.ten_chinh_thuc from thanh_pho as t1 join cuoc_thi_trang_trai as t2 on t1.id_thanh_pho = t2.id_thanh_pho_chu_nha	farm
select t1.ten_chinh_thuc from thanh_pho as t1 join cuoc_thi_trang_trai as t2 on t1.id_thanh_pho = t2.id_thanh_pho_chu_nha group by t2.id_thanh_pho_chu_nha having count ( * ) > 1	farm
select t1.ten_chinh_thuc from thanh_pho as t1 join cuoc_thi_trang_trai as t2 on t1.id_thanh_pho = t2.id_thanh_pho_chu_nha group by t2.id_thanh_pho_chu_nha having count ( * ) > 1	farm
select t1.cap_bac from thanh_pho as t1 join cuoc_thi_trang_trai as t2 on t1.id_thanh_pho = t2.id_thanh_pho_chu_nha group by t2.id_thanh_pho_chu_nha order by count ( * ) desc limit 1	farm
select t1.cap_bac from thanh_pho as t1 join cuoc_thi_trang_trai as t2 on t1.id_thanh_pho = t2.id_thanh_pho_chu_nha group by t2.id_thanh_pho_chu_nha order by count ( * ) desc limit 1	farm
select t2.chu_de from thanh_pho as t1 join cuoc_thi_trang_trai as t2 on t1.id_thanh_pho = t2.id_thanh_pho_chu_nha where t1.dan_so > 1000	farm
select t2.chu_de from thanh_pho as t1 join cuoc_thi_trang_trai as t2 on t1.id_thanh_pho = t2.id_thanh_pho_chu_nha where t1.dan_so > 1000	farm
select cap_bac , avg ( dan_so ) from thanh_pho group by cap_bac	farm
select cap_bac , avg ( dan_so ) from thanh_pho group by cap_bac	farm
select cap_bac from thanh_pho group by cap_bac order by count ( * ) asc	farm
select cap_bac from thanh_pho group by cap_bac order by count ( * ) asc	farm
select cap_bac from thanh_pho group by cap_bac order by count ( * ) desc limit 1	farm
select cap_bac from thanh_pho group by cap_bac order by count ( * ) desc limit 1	farm
select ten_chinh_thuc from thanh_pho where id_thanh_pho not in ( select id_thanh_pho_chu_nha from cuoc_thi_trang_trai )	farm
select ten_chinh_thuc from thanh_pho where id_thanh_pho not in ( select id_thanh_pho_chu_nha from cuoc_thi_trang_trai )	farm
select cap_bac from thanh_pho where dan_so > 1500 intersect select cap_bac from thanh_pho where dan_so < 500	farm
select cap_bac from thanh_pho where dan_so > 1500 intersect select cap_bac from thanh_pho where dan_so < 500	farm
select ten_chinh_thuc from thanh_pho where dan_so > 1500 or dan_so < 500	farm
select ten_chinh_thuc from thanh_pho where dan_so > 1500 or dan_so < 500	farm
select xep_hang_dieu_tra_dan_so from thanh_pho where cap_bac != "Village"	farm
select xep_hang_dieu_tra_dan_so from thanh_pho where cap_bac != "Village"	farm
select count ( * ) from chuyen_bay where van_toc > 200	flight_company
select so_hieu , ngay , phi_cong from chuyen_bay order by do_cao asc	flight_company
select id , quoc_gia , thanh_pho , ten from san_bay order by ten	flight_company
select max ( co_phan_nhom ) from cong_ty_dieu_hanh	flight_company
select avg ( van_toc ) from chuyen_bay where phi_cong = "Thompson"	flight_company
select t1.ten , t1.loai from cong_ty_dieu_hanh as t1 join chuyen_bay as t2 on t1.id = t2.id_cong_ty	flight_company
select ten from san_bay where quoc_gia != "Iceland"	flight_company
select distinct t1.loai from cong_ty_dieu_hanh as t1 join chuyen_bay as t2 on t1.id = t2.id_cong_ty where t2.van_toc < 200	flight_company
select t1.id , t1.ten from cong_ty_dieu_hanh as t1 join chuyen_bay as t2 on t1.id = t2.id_cong_ty group by t1.id having count ( * ) > 1	flight_company
select t1.id , t1.ten , t1.iata from san_bay as t1 join chuyen_bay as t2 on t1.id = t2.id_san_bay group by t2.id order by count ( * ) desc limit 1	flight_company
select distinct t2.phi_cong from san_bay as t1 join chuyen_bay as t2 on t1.id = t2.id_san_bay where t1.quoc_gia = "United States" or t1.ten = "Billund Airport"	flight_company
select loai , count ( * ) from cong_ty_dieu_hanh group by loai order by count ( * ) desc limit 1	flight_company
select count ( * ) from san_bay where id not in ( select id_san_bay from chuyen_bay where phi_cong = "Thompson" )	flight_company
select t2.phi_cong from cong_ty_dieu_hanh as t1 join chuyen_bay as t2 on t1.id = t2.id_cong_ty where t1.hoat_dong_chinh = "Cargo" intersect select t2.phi_cong from cong_ty_dieu_hanh as t1 join chuyen_bay as t2 on t1.id = t2.id_cong_ty where t1.hoat_dong_chinh = "Catering services"	flight_company
select ten from san_bay where ten like "%international%"	flight_company
select t3.id , count ( * ) from cong_ty_dieu_hanh as t1 join chuyen_bay as t2 on t1.id = t2.id_cong_ty join san_bay as t3 on t2.id_san_bay = t3.id group by t3.id	flight_company
select count ( * ) , quoc_gia from san_bay group by quoc_gia	flight_company
select quoc_gia from san_bay group by quoc_gia having count ( * ) > 2	flight_company
select phi_cong from chuyen_bay group by phi_cong order by count ( * ) desc limit 1	flight_company
select sum ( so_luong_bo_phan ) from do_noi_that	manufacturer
select ten , id_do_noi_that from do_noi_that order by lai_suat_thi_truong desc limit 1	manufacturer
select sum ( lai_suat_thi_truong ) from do_noi_that order by lai_suat_thi_truong desc limit 2	manufacturer
select so_luong_bo_phan , ten from do_noi_that where so_luong_bo_phan > 10	manufacturer
select ten , so_luong_bo_phan from do_noi_that order by lai_suat_thi_truong limit 1	manufacturer
select t1.ten from do_noi_that as t1 join xuong_san_xuat_do_noi_that as t2 on t1.id_do_noi_that = t2.id_do_noi_that where t2.gia_tinh_theo_do_la < ( select max ( gia_tinh_theo_do_la ) from xuong_san_xuat_do_noi_that )	manufacturer
select nam_mo_cua , ten from nha_san_xuat order by so_luong_cua_hang desc limit 1	manufacturer
select avg ( so_luong_nha_may ) from nha_san_xuat where so_luong_cua_hang > 20	manufacturer
select ten , id_nha_san_xuat from nha_san_xuat order by nam_mo_cua	manufacturer
select ten , nam_mo_cua from nha_san_xuat where so_luong_cua_hang > 10 or so_luong_nha_may < 10	manufacturer
select max ( so_luong_cua_hang ) , avg ( so_luong_nha_may ) from nha_san_xuat where nam_mo_cua < 1990	manufacturer
select t1.id_nha_san_xuat , t1.so_luong_cua_hang from nha_san_xuat as t1 join xuong_san_xuat_do_noi_that as t2 on t1.id_nha_san_xuat = t2.id_nha_san_xuat order by t2.gia_tinh_theo_do_la desc limit 1	manufacturer
select count ( * ) , t1.ten from nha_san_xuat as t1 join xuong_san_xuat_do_noi_that as t2 on t1.id_nha_san_xuat = t2.id_nha_san_xuat group by t1.id_nha_san_xuat	manufacturer
select t1.ten , t2.gia_tinh_theo_do_la from do_noi_that as t1 join xuong_san_xuat_do_noi_that as t2 on t1.id_do_noi_that = t2.id_do_noi_that	manufacturer
select lai_suat_thi_truong , ten from do_noi_that where id_do_noi_that not in ( select id_do_noi_that from xuong_san_xuat_do_noi_that )	manufacturer
select t3.ten from do_noi_that as t1 join xuong_san_xuat_do_noi_that as t2 on t1.id_do_noi_that = t2.id_do_noi_that join nha_san_xuat as t3 on t2.id_nha_san_xuat = t3.id_nha_san_xuat where t1.so_luong_bo_phan < 6 intersect select t3.ten from do_noi_that as t1 join xuong_san_xuat_do_noi_that as t2 on t1.id_do_noi_that = t2.id_do_noi_that join nha_san_xuat as t3 on t2.id_nha_san_xuat = t3.id_nha_san_xuat where t1.so_luong_bo_phan > 10	manufacturer
select count ( * ) from khach_tham_quan where tuoi < 30	museum_visit
select ten from khach_tham_quan where cap_do_thanh_vien > 4 order by cap_do_thanh_vien desc	museum_visit
select avg ( tuoi ) from khach_tham_quan where cap_do_thanh_vien <= 4	museum_visit
select ten , cap_do_thanh_vien from khach_tham_quan where cap_do_thanh_vien > 4 order by tuoi desc	museum_visit
select id_bao_tang , ten from bao_tang order by so_luong_nhan_vien desc limit 1	museum_visit
select avg ( so_luong_nhan_vien ) from bao_tang where nam_mo_cua < 2009	museum_visit
select so_luong_nhan_vien , nam_mo_cua from bao_tang where ten = "Plaza Museum"	museum_visit
select ten from bao_tang where so_luong_nhan_vien > ( select min ( so_luong_nhan_vien ) from bao_tang where nam_mo_cua > 2010 )	museum_visit
select t1.id_khach_tham_quan , t1.ten , t1.tuoi from khach_tham_quan as t1 join chuyen_tham as t2 on t1.id_khach_tham_quan = t2.id_khach_tham_quan group by t1.id_khach_tham_quan having count ( * ) > 1	museum_visit
select t2.id_khach_tham_quan , t1.ten , t1.cap_do_thanh_vien from khach_tham_quan as t1 join chuyen_tham as t2 on t1.id_khach_tham_quan = t2.id_khach_tham_quan group by t2.id_khach_tham_quan order by sum ( t2.tong_so_tien_da_chi ) desc limit 1	museum_visit
select t2.id_bao_tang , t1.ten from bao_tang as t1 join chuyen_tham as t2 on t1.id_bao_tang = t2.id_bao_tang group by t2.id_bao_tang order by count ( * ) desc limit 1	museum_visit
select ten from bao_tang where id_bao_tang not in ( select id_bao_tang from chuyen_tham )	museum_visit
select t1.ten , t1.tuoi from khach_tham_quan as t1 join chuyen_tham as t2 on t1.id_khach_tham_quan = t2.id_khach_tham_quan order by t2.so_luong_ve desc limit 1	museum_visit
select avg ( so_luong_ve ) , max ( so_luong_ve ) from chuyen_tham	museum_visit
select sum ( t2.tong_so_tien_da_chi ) from khach_tham_quan as t1 join chuyen_tham as t2 on t1.id_khach_tham_quan = t2.id_khach_tham_quan where t1.cap_do_thanh_vien = 1	museum_visit
select t1.ten from khach_tham_quan as t1 join chuyen_tham as t2 on t1.id_khach_tham_quan = t2.id_khach_tham_quan join bao_tang as t3 on t3.id_bao_tang = t2.id_bao_tang where t3.nam_mo_cua < 2009 intersect select t1.ten from khach_tham_quan as t1 join chuyen_tham as t2 on t1.id_khach_tham_quan = t2.id_khach_tham_quan join bao_tang as t3 on t3.id_bao_tang = t2.id_bao_tang where t3.nam_mo_cua > 2011	museum_visit
select count ( * ) from khach_tham_quan where id_khach_tham_quan not in ( select t2.id_khach_tham_quan from bao_tang as t1 join chuyen_tham as t2 on t1.id_bao_tang = t2.id_bao_tang where t1.nam_mo_cua > 2010 )	museum_visit
select count ( * ) from bao_tang where nam_mo_cua > 2013 or nam_mo_cua < 2008	museum_visit
select count ( * ) from hoc_sinh_trung_hoc	network_1
select count ( * ) from hoc_sinh_trung_hoc	network_1
select ten , khoi_lop from hoc_sinh_trung_hoc	network_1
select ten , khoi_lop from hoc_sinh_trung_hoc	network_1
select khoi_lop from hoc_sinh_trung_hoc	network_1
select khoi_lop from hoc_sinh_trung_hoc	network_1
select khoi_lop from hoc_sinh_trung_hoc where ten = "Kyle"	network_1
select khoi_lop from hoc_sinh_trung_hoc where ten = "Kyle"	network_1
select ten from hoc_sinh_trung_hoc where khoi_lop = 10	network_1
select ten from hoc_sinh_trung_hoc where khoi_lop = 10	network_1
select id from hoc_sinh_trung_hoc where ten = "Kyle"	network_1
select id from hoc_sinh_trung_hoc where ten = "Kyle"	network_1
select count ( * ) from hoc_sinh_trung_hoc where khoi_lop = 9 or khoi_lop = 10	network_1
select count ( * ) from hoc_sinh_trung_hoc where khoi_lop = 9 or khoi_lop = 10	network_1
select khoi_lop , count ( * ) from hoc_sinh_trung_hoc group by khoi_lop	network_1
select khoi_lop , count ( * ) from hoc_sinh_trung_hoc group by khoi_lop	network_1
select khoi_lop from hoc_sinh_trung_hoc group by khoi_lop order by count ( * ) desc limit 1	network_1
select khoi_lop from hoc_sinh_trung_hoc group by khoi_lop order by count ( * ) desc limit 1	network_1
select khoi_lop from hoc_sinh_trung_hoc group by khoi_lop having count ( * ) >= 4	network_1
select khoi_lop from hoc_sinh_trung_hoc group by khoi_lop having count ( * ) >= 4	network_1
