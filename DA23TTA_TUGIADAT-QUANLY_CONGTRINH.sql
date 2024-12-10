--Cau 1:
select ct.TEN_THAU, ct.DCHI_THAU
from CHUTHAU ct
join CGTRINH cg on cg.TEN_THAU = ct.TEN_THAU
join THIETKE tk on tk.STT_CTR = cg.STT_CTR
where cg.TINH_THANH = 'can tho' and tk.HOTEN_KTS = 'le kim dung';
--Cau 2:
select kts.NOI_TN
from KTRUCSU kts
join THIETKE tk on tk.HOTEN_KTS = kts.HOTEN_KTS
join CGTRINH cg on cg.STT_CTR = tk.STT_CTR
where cg.STT_CTR = 1;
--Cau 3:
select cn.HOTEN_CN, cn.NAM_VAO_N
from CONGNHAN cn
join THAMGIA tg on tg.HOTEN_CN = cn.HOTEN_CN
join CGTRINH cg on cg.STT_CTR = tg.STT_CTR
where cg.TEN_THAU = 'le van son' and cn.CH_MON in ('han', 'dien');
--Cau 4:
select *
from CONGNHAN cn
join THAMGIA tg on tg.HOTEN_CN = cn.HOTEN_CN
where tg.STT_CTR = 1 and tg.NGAY_TGIA between '1994-12-15' and '1994-12-31';
--Cau 5:
select kt.HOTEN_KTS
from KTRUCSU kt 
join THIETKE tk on tk.HOTEN_KTS = kt.HOTEN_KTS
join CGTRINH cg on cg.STT_CTR = tk.STT_CTR
where kt.NOI_TN = 'tp hcm' and cg.KINH_PHI > 400;
--Cau 6:
select kt.HOTEN_KTS
from KTRUCSU kt
join THIETKE tk on tk.HOTEN_KTS = kt.HOTEN_KTS
join CGTRINH cg on cg.STT_CTR = tk.STT_CTR
where cg.TEN_THAU = 'phong dich vu so xd' 
  and cg.TEN_THAU = 'le van son'
--Cau 7:
select cg.TEN_CTR
from CGTRINH cg
where cg.KINH_PHI = (
   select MAX(cg.KINH_PHI)
   from CGTRINH cg 
);
--Cau 8:
select  distinct tg.HOTEN_CN
from THAMGIA tg 
join CGTRINH cg on cg.STT_CTR = tg.STT_CTR
where cg.TINH_THANH = 'can tho' 
         and tg.HOTEN_CN not in (
	     select tg.HOTEN_CN
		 from THAMGIA tg
		 join CGTRINH cg on cg.STT_CTR = tg.STT_CTR
		 where cg.TINH_THANH = 'vinh long'
	  );
--Cau 9:
select cg.TEN_THAU, sum(cg.KINH_PHI) TONG_KINH_PHI
from CGTRINH cg
group by cg.TEN_THAU
having sum(cg.KINH_PHI) > (
    select sum(cg.KINH_PHI)
	from CGTRINH cg
	where cg.TEN_THAU = 'phong dich vu so xd'
	group by cg.TEN_THAU
);
--Cau 10:
select tk.HOTEN_KTS
from THIETKE tk
where tk.THU_LAO < (
  select avg(tk.THU_LAO) 
  from THIETKE tk
);
--Cau 11:
select ct.TEN_THAU, ct.DCHI_THAU
from CHUTHAU ct
join CGTRINH cg on cg.TEN_THAU = ct.TEN_THAU
where cg.KINH_PHI = (
   select min(cg.KINH_PHI)
   from CGTRINH cg
);
--Cau 12:
select cn.HOTEN_CN, cn.CH_MON
from CONGNHAN cn 
join THAMGIA tg on tg.HOTEN_CN = cn.HOTEN_CN
join CGTRINH cg on cg.STT_CTR = tg.STT_CTR
where cg.STT_CTR in (1,7);
