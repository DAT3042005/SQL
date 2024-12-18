---2.3. Hãy viết câu lệnh SQL để trả lời các câu hỏi sau:
---a. Tìm tên các báo/tập chí có đăng bài của tác giả Tô Phan. Cho biết đăng trên số
---nào? Được phát hành vào những ngày nào

SELECT DISTINCT TEN,TUA,SO_BAO_TC,NGAY
FROM dbo.BAO_TCHI A,dbo.BAIBAO B,dbo.VIETBAI C,dbo.PHATHANH D
WHERE BUT_HIEU='to phan'


---b.Nội dung của tập chí Kiến thức ngày nay Số 156 gồm những bài tựa gì? Đăng từ trang nào?
SELECT TEN,TUA,TRANG
FROM  dbo.BAO_TCHI a,dbo.BAIBAO b,dbo.DANG_BAI c
WHERE a.MA_BAO_TC='ktnn' and c.SO_BAO_TC='156'

---c. Cho biết tựa và thể loại tất cả các bài báo do tác giả Nguyễn Trọng Vinh sáng tác và đã được đăng trên các báo/tạp chí xuất bản hàng tuần. Cho biết đồng thời
---tên và số tờ báo/tạp chí tương ứng mỗi bài được đăng

SELECT a.TUA, b.DGIAI,d.TEN,SO_BAO_TC,BUT_HIEU
FROM dbo.BAIBAO a ,dbo.THE_LOAI b,dbo.VIETBAI c,dbo.BAO_TCHI d,dbo.DANG_BAI
WHERE BUT_HIEU='ng trong vinh' and DINH_KY='1 tuan'

select *
from dbo.DANG_BAI,dbo.PHATHANH




SELECT bb.TUA, tl.DGIAI, bt.TEN, db.SO_BAO_TC
FROM BAIBAO bb
JOIN VIETBAI vb ON bb.STT_BAI = vb.STT_BAI
JOIN THE_LOAI tl ON bb.MA_THLOAI = tl.MA
JOIN DANG_BAI db ON bb.STT_BAI = db.STT_BAI
JOIN BAO_TCHI bt ON db.MA_BAO_TC = bt.MA_BAO_TC
WHERE vb.BUT_HIEU = 'ng trong vinh' AND bt.DINH_KY = '1 tuan';


















