---3.1. Tìm tên và địa chỉ liên lạc các chủ thầu thi công công trình ở Cần Thơ do kiến trúc sư Lê Kim Dung thiết kế.
SELECT C.TEN_THAU, DCHI_THAU
FROM CHUTHAU A,KTRUCSU B ,CGTRINH C
WHERE HOTEN_KTS  LIKE N'le kim dung' AND TINH_THANH LIKE 'can tho'

---3.2. Cho biết nơi tốt nghiệp của các kiến trúc sư đã thiết kế công trình Khách sạn quốc tế Cần Thơ.
SELECT NOI_TN
FROM KTRUCSU A,CGTRINH B
WHERE TEN_CTR LIKE N'khach san quoc te' AND TINH_THANH LIKE N'can tho'

---3.3. Cho biết họ tên năm vào nghề của các công nhân có chuyên môn hành hoặc điện đã tham gia các công trình mà chủ thầu Lê Văn Son đã trúng thầu
 SELECT HOTEN_CN, NAM_VAO_N
 FROM CONGNHAN A ,CHUTHAU B
 WHERE TEN_THAU LIKE N'le van son'

---3.4. Tìm thông tin các công nhân đã bắt đầu tham gia công trình Khách sạn Quốctế ở Cần Thơ trong giai đoạn từ ngày 15/12/94 đến 31/12/94.
SELECT HOTEN_CN,NAMS_CN,NAM_VAO_N,CH_MON
FROM  CONGNHAN A,CGTRINH B
WHERE TEN_CTR LIKE 'khach san quoc te' AND TINH_THANH LIKE 'can tho' AND NGAY_BD BETWEEN '1994-12-13'  and '1994-12-31' 

---3.5. Cho biết họ tên, năm sinh của các kiến trúc sư đã tốt nghiệp ở Thành phố Hồ Chí Minh và đã thiết kế ít nhất một công trình có kinh phí đầu tư trên 400 triệu đồng
SELECT HOTEN_KTS, NAMS_KTS,KINH_PHI
FROM KTRUCSU A,CGTRINH B
WHERE NOI_TN LIKE 'tp hcm' AND KINH_PHI > '400' 

---3.6. Cho biết họ tên các kiến trúc sư vừa thiết kế các công trình do Phòng Dịch vụ Sở Xây dựng thi công, vừa thiết kế các công trình do chủ thầu Lê Văn Son thi công



























