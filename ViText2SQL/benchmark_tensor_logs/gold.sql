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
