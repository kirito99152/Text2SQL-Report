# Error Analysis Report

**Total Errors**: 373

## Breakdown by Hardness
- **Easy**: 48 errors
- **Medium**: 142 errors
- **Hard**: 103 errors
- **Extra**: 80 errors

## Common Error Patterns
- **Select columns mismatch**: 256 times
- **Logic/Condition mismatch**: 46 times
- **Missing JOIN**: 26 times
- **Missing WHERE**: 12 times
- **Missing INTERSECT**: 11 times
- **Missing EXCEPT**: 8 times
- **Missing GROUP BY**: 6 times
- **Missing UNION**: 5 times
- **Missing ORDER BY**: 3 times

## Detailed Error Samples (Top 10)
### Sample 1 (Medium)
**Gold**: `select max ( t1.chieu_dai_theo_met ) , t2.ten from cau as t1 join kien_truc_su as t2 on t1.id_kien_truc_su = t2.id`

**Pred**: `SELECT T2.ten, T1.chieu_dai_theo_met FROM cau AS T1 JOIN kien_truc_su AS T2 ON T1.id_kien_truc_su = CAST(T2.id AS NUMBER) ORDER BY T1.chieu_dai_theo_met DESC LIMIT 1`

**Suspected Reason**: Select columns mismatch

### Sample 2 (Hard)
**Gold**: `select distinct t1.loai from nha_may as t1 join kien_truc_su as t2 on t1.id_kien_truc_su = t2.id where t2.quoc_tich = "American" or t2.quoc_tich = "Canadian"`

**Pred**: `SELECT DISTINCT T1.loai FROM nha_may AS T1 JOIN kien_truc_su AS T2 ON T1.id_kien_truc_su = CAST(T2.id AS NUMBER) WHERE T2.quoc_tich = 'Mỹ' OR T2.quoc_tich = 'Canada'`

**Suspected Reason**: Logic/Condition mismatch

### Sample 3 (Extra)
**Gold**: `select t1.id , t1.ten , t1.gioi_tinh from kien_truc_su as t1 join cau as t2 on t1.id = t2.id_kien_truc_su group by t1.id having count ( * ) = 2 union select t1.id , t1.ten , t1.gioi_tinh from kien_truc_su as t1 join nha_may as t2 on t1.id = t2.id_kien_truc_su group by t1.id having count ( * ) = 1`

**Pred**: `SELECT id, ten, gioi_tinh FROM kien_truc_su WHERE (SELECT COUNT(*) FROM cau WHERE id_kien_truc_su = kien_truc_su.id) >= 2 OR (SELECT COUNT(*) FROM nha_may WHERE id_kien_truc_su = kien_truc_su.id) >= 1`

**Suspected Reason**: Missing JOIN

### Sample 4 (Hard)
**Gold**: `select distinct t1.ten from nha_may as t1 join kien_truc_su as t2 on t1.id_kien_truc_su = t2.id join cau as t3 on t3.id_kien_truc_su = t2.id where t3.chieu_dai_theo_met > 80`

**Pred**: `SELECT DISTINCT nha_may.ten FROM nha_may JOIN kien_truc_su ON CAST(nha_may.id_kien_truc_su AS TEXT) = kien_truc_su.id JOIN cau ON kien_truc_su.id = cau.id_kien_truc_su WHERE cau.chieu_dai_theo_met > 80`

**Suspected Reason**: Select columns mismatch

### Sample 5 (Extra)
**Gold**: `select count ( * ) from kien_truc_su where id not in ( select id_kien_truc_su from nha_may where nam_xay_dung < 1850 )`

**Pred**: `SELECT COUNT(*) FROM kien_truc_su WHERE id_kien_truc_su NOT IN (SELECT id_kien_truc_su FROM nha_may WHERE nam_xay_dung < 1850)`

**Suspected Reason**: Select columns mismatch

### Sample 6 (Hard)
**Gold**: `select t1.ten from cau as t1 join kien_truc_su as t2 on t1.id_kien_truc_su = t2.id where t2.quoc_tich = "American" order by t1.chieu_dai_theo_feet`

**Pred**: `SELECT cau.ten FROM cau JOIN kien_truc_su ON cau.id_kien_truc_su = kien_truc_su.id WHERE kien_truc_su.quoc_tich = 'Mỹ' ORDER BY cau.chieu_dai_theo_met ASC`

**Suspected Reason**: Select columns mismatch

### Sample 7 (Hard)
**Gold**: `select dia_diem from rap_chieu_phim except select dia_diem from rap_chieu_phim where suc_chua > 800`

**Pred**: `SELECT dia_diem FROM rap_chieu_phim WHERE NOT EXISTS (SELECT 1 FROM rap_chieu_phim r2 WHERE r2.dia_diem = rap_chieu_phim.dia_diem AND r2.suc_chua > 800)`

**Suspected Reason**: Missing EXCEPT

### Sample 8 (Medium)
**Gold**: `select avg ( suc_chua ) , min ( suc_chua ) , max ( suc_chua ) from rap_chieu_phim where nam_mo_cua >= 2011`

**Pred**: `SELECT AVG(suc_chua), MIN(suc_chua), MAX(suc_chua) FROM rap_chieu_phim WHERE nam_mo_cua > 2011`

**Suspected Reason**: Select columns mismatch

### Sample 9 (Medium)
**Gold**: `select t2.ten , sum ( t1.so_luong_suat_chieu_moi_ngay ) from lich_chieu_phim as t1 join rap_chieu_phim as t2 on t1.id_rap_chieu_phim = t2.id_rap_chieu_phim group by t1.id_rap_chieu_phim`

**Pred**: `SELECT T1.id_rap_chieu_phim , SUM(T2.so_luong_suat_chieu_moi_ngay) FROM rap_chieu_phim AS T1 JOIN lich_chieu_phim AS T2 ON T1.id_rap_chieu_phim = T2.id_rap_chieu_phim GROUP BY T1.id_rap_chieu_phim`

**Suspected Reason**: Select columns mismatch

### Sample 10 (Medium)
**Gold**: `select t2.tieu_de , max ( t1.gia ) from lich_chieu_phim as t1 join phim as t2 on t1.id_phim = t2.id_phim group by t1.id_phim`

**Pred**: `SELECT phim.tieu_de, MAX(lich_chieu_phim.gia) FROM phim JOIN lich_chieu_phim ON phim.id_phim = lich_chieu_phim.id_phim GROUP BY phim.id_phim`

**Suspected Reason**: Select columns mismatch

