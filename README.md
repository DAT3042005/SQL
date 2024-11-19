-- Tạo cơ sở dữ liệu
CREATE DATABASE QUANLY_DEAN;
USE QUANLY_DEAN;

-- Tạo bảng CHUYENMON
CREATE TABLE CHUYENMON (
    MaTDCM char(3) PRIMARY KEY NOT NULL,
    TenTDCM nvarchar(100)
);

-- Tạo bảng NHANVIEN
CREATE TABLE NHANVIEN (
    MaNV char(6) PRIMARY KEY NOT NULL,
    HoTenNV nvarchar(20),
    TenLotNV nvarchar(20),
    TenNV nvarchar(20),
    NgaySinh datetime,
    Phai nvarchar(3),
    DiaChi nvarchar(100),
    HeSoLuong dec(4,2),
    MaTDCM char(3) CONSTRAINT RB_TDCM FOREIGN KEY (MaTDCM) REFERENCES CHUYENMON (MaTDCM)
);

-- Tạo bảng PHONGBAN
CREATE TABLE PHONGBAN (
    MaPhong char(2) PRIMARY KEY NOT NULL,
    TenPhong nvarchar(100)
);

-- Tạo bảng NHIEMVU
CREATE TABLE NHIEMVU (
    MaNhiemVu char(2) PRIMARY KEY NOT NULL,
    TenNhiemVu nvarchar(100)
);

-- Tạo bảng NHAN_NHIEMVU
CREATE TABLE NHAN_NHIEMVU (
    MaNV char(6), 
    MaPhong char(2),
    MaNhiemVu char(2),
    NgayNhanNhiemVu datetime DEFAULT (GETDATE()),
    NgayKetThucNhiemVu datetime,
    CONSTRAINT KhoaChinh PRIMARY KEY (MaNV, MaPhong, MaNhiemVu)
);

-- Tạo bảng DEAN
CREATE TABLE DEAN (
    MaDA char(2) PRIMARY KEY NOT NULL,
    TenDA nvarchar(50),
    DiaDiemDA nvarchar(50),
    MaPhong char(2),
    NgayBatDau datetime,
    NgayKetThuc datetime
);

-- Tạo bảng PHANCONG
CREATE TABLE PHANCONG (
    MaNV char(6),
    MaDA char(2),
    ThoiGian DECIMAL(3,1),
    CONSTRAINT KhoaChinhh PRIMARY KEY (MaNV, MaDA)
);

Sp_rename'PHANCONG.ThoiGian','ThoiGianThucHien';

-- Nhập dữ liệu cho bảng CHUYENMON
INSERT INTO CHUYENMON (MaTDCM, TenTDCM) VALUES
('A01', N'Kỹ sư Công nghệ thông tin'),
('A02', N'Kỹ sư Mạng máy tính và truyền thông'),
('A03', N'Kỹ sư Công nghệ phần mềm'),
('A04', N'Kỹ sư Hệ thống thông tin'),
('B01', N'Kỹ sư Nông nghiệp'),
('C01', N'Cử nhân kế toán'),
('C02', N'Cử nhân Quản trị doanh nghiệp'),
('D01', N'Kỹ thuật viên thiết kế, cài đặt mạng'),
('D02', N'Kỹ thuật viên thiết kế đồ họa'),
('D03', N'Kỹ thuật viên thu thập số liệu');

-- Nhập dữ liệu cho bảng NHANVIEN
INSERT INTO NHANVIEN (MaNV, HoTenNV, TenLotNV, TenNV, NgaySinh, Phai, DiaChi, HeSoLuong, MaTDCM) VALUES
('A1.001', N'Nguyễn', N'Thanh', N'Tùng', '1965-08-12', N'Nam', N'Trà Vinh', 4.66, 'A01'),
('A1.002', N'Nguyễn', N'Mạnh', N'Hùng', '1962-09-15', N'Nam', N'Vĩnh Long', 4.33, 'A02'),
('A1.003', N'Trần', N'Thanh', N'Tâm', '1972-07-31', N'Nữ', N'Vĩnh Long', 3.99, 'A03'),
('A1.004', N'Bùi', N'Ngọc', N'Hằng', '1987-07-19', N'Nữ', N'Cần Thơ', 3.00, 'A04'),
('A1.005', N'Lê', N'Quỳnh', N'Như', '1971-07-20', N'Nữ', N'Trà Vinh', 4.33, 'B01'),
('A1.006', N'Trần', N'Thị', N'Hương', '1975-11-10', N'Nữ', N'Cần Thơ', 3.99, 'C01'),
('A1.007', N'Trần', N'Hồng', N'Quang', '1979-04-08', N'Nam', N'Trà Vinh', 3.66, 'C02'),
('A1.008', N'Phạm', N'Văn', N'Vinh', '1985-11-10', N'Nam', N'Vĩnh Long', 2.67, 'D01'),
('A2.001', N'Nguyễn', N'Hồng', N'Thanh', '1967-12-08', N'Nữ', N'Trà Vinh', 4.66, 'D02'),
('A2.002', N'Nguyễn', N'Mạnh', N'Hùng', '1962-09-15', N'Nam', N'Vĩnh Long', 4.33, 'D03'),
('A2.003', N'Trần', N'Thanh', N'Hưng', '1972-07-31', N'Nam', N'Vĩnh Long', 4.33, 'A01'),
('A2.004', N'Lê', N'Ngọc', N'Hằng', '1987-07-19', N'Nữ', N'Trà Vinh', 3.00, 'A02'),
('A2.005', N'Lê', N'Quỳnh', N'Hương', '1971-07-20', N'Nữ', N'Trà Vinh', 3.33, 'A03'),
('A2.006', N'Phan', N'Thị', N'Hương', '1985-11-10', N'Nữ', N'Cần Thơ', 3.99, 'C02'),
('A2.007', N'Trần', N'Vinh', N'Quang', '1979-04-08', N'Nam', N'Trà Vinh', 3.66, 'D01'),
('A2.008', N'Trần', N'Văn', N'Anh', '1994-11-10', N'Nam', N'Trà Vinh', 3.33, 'D03'),
('A2.009', N'Phạm', N'Văn', N'Viễn', '1995-11-10', N'Nam', N'Trà Vinh', 3.33, 'D02');

-- Nhập dữ liệu cho bảng PHONGBAN
INSERT INTO PHONGBAN (MaPhong, TenPhong) VALUES 
('KT', N'Kỹ thuật'),
('KD', N'Kinh doanh'),
('SX', N'Sản xuất');

-- Nhập dữ liệu cho bảng NHIEMVU
INSERT INTO NHIEMVU (MaNhiemVu, TenNhiemVu) VALUES 
('A1', N'Tổ trưởng tổ kỹ thuật'),
('A2', N'Phó tổ trưởng tổ kỹ thuật'),
('A3', N'Tổ trưởng tổ sản xuất'),
('A4', N'Phó tổ trưởng tổ sản xuất'),
('A5', N'Tổ trưởng tổ kinh doanh'),
('A6', N'Phó tổ trưởng tổ kinh doanh'),
('B1', N'Kỹ thuật viên thiết kế, cài đặt mạng'),
('B2', N'Kỹ thuật viên thiết kế đồ họa'),
('B3', N'Kỹ thuật viên thu thập số liệu');

-- Nhập dữ liệu cho bảng NHAN_NHIEMVU
INSERT INTO NHAN_NHIEMVU (MaNV, MaPhong, MaNhiemVu, NgayNhanNhiemVu, NgayKetThucNhiemVu) VALUES
('A1.001', 'KT', 'A1', '2023-01-01', '2023-01-10'),
('A1.002', 'KT', 'A2', '2023-01-02', '2023-01-11'),
('A1.003', 'KT', 'A3', '2023-01-03', '2023-01-12'),
('A1.004', 'SX', 'A4', '2023-01-04', '2023-01-13'),
('A1.005', 'SX', 'A5', '2023-01-05', '2023-01-14'),
('A1.006', 'SX', 'A6', '2023-01-06', '2023-01-15'),
('A1.007', 'SX', 'A1', '2023-01-07', '2023-01-16'),
('A1.008', 'KT', 'B1', '2023-01-08', '2023-01-17'),
('A2.001', 'KT', 'B2', '2023-01-09', '2023-01-18'),
('A2.002', 'KT', 'B3', '2023-01-10', '2023-01-19'),
('A2.003', 'KD', 'A2', '2023-01-11', '2023-01-20'),
('A2.004', 'KD', 'A3', '2023-01-12', '2023-01-21'),
('A2.005', 'KD', 'A4', '2023-01-13', '2023-01-22'),
('A2.006', 'KD', 'A5', '2023-01-14', '2023-01-23'),
('A2.007', 'KD', 'B1', '2023-01-15', '2023-01-24'),
('A2.008', 'KD', 'B2', '2023-01-16', '2023-01-25'),
('A2.009', 'KD', 'B3', '2023-01-17', '2023-01-26');

-- Nhập dữ liệu cho bảng DEAN
INSERT INTO DEAN (MaDA, TenDA, DiaDiemDA, MaPhong, NgayBatDau, NgayKetThuc) VALUES
('A1', N'Dự án IoT nông nghiệp', N'Trà Vinh', 'KT', '2019-07-30', '2020-07-30'),
('B2', N'Dự án hạ tầng viễn thông', N'Vĩnh Long', 'KD', '2020-07-01', '2021-04-30'),
('C3', N'Dự án phát triển phần mềm', N'Cần Thơ', 'SX', '2020-05-02', '2021-12-30');

-- Nhập dữ liệu cho bảng PHANCONG
INSERT INTO PHANCONG (MaNV, MaDA, ThoiGian) VALUES
('A1.001', 'A1', 32.5),
('A1.002', 'A1', 7.5),
('A1.003', 'B2', 40.0),
('A1.004', 'A1', 40.0),
('A1.005', 'B2', 20.0),
('A1.006', 'C3', 20.0),
('A1.007', 'A1', 30.0),
('A1.008', 'B2', 50.0),
('A2.001', 'C3', 20.0),
('A2.002', 'A1', 20.0),
('A2.003', 'B2', 20.0),
('A2.004', 'B2', 30.0),
('A2.005', 'A1', 50.0),
('A2.006', 'B2', 20.0),
('A2.007', 'C3', 30.0),
('A2.008', 'B2', 50.0),
('A2.009', 'C3', 20.0);

-- Cập nhật dữ liệu cho bảng CHUYENMON
UPDATE CHUYENMON SET TenTDCM = N'Kỹ sư Công nghệ thông tin' WHERE MaTDCM = 'A01';
UPDATE CHUYENMON SET TenTDCM = N'Kỹ sư Mạng máy tính và truyền thông' WHERE MaTDCM = 'A02';
UPDATE CHUYENMON SET TenTDCM = N'Kỹ sư Công nghệ phần mềm' WHERE MaTDCM = 'A03';
UPDATE CHUYENMON SET TenTDCM = N'Kỹ sư Hệ thống thông tin' WHERE MaTDCM = 'A04';
UPDATE CHUYENMON SET TenTDCM = N'Kỹ sư Nông nghiệp' WHERE MaTDCM = 'B01';
UPDATE CHUYENMON SET TenTDCM = N'Cử nhân kế toán' WHERE MaTDCM = 'C01';
UPDATE CHUYENMON SET TenTDCM = N'Cử nhân Quản trị doanh nghiệp' WHERE MaTDCM = 'C02';
UPDATE CHUYENMON SET TenTDCM = N'Kỹ thuật viên thiết kế, cài đặt mạng' WHERE MaTDCM = 'D01';
UPDATE CHUYENMON SET TenTDCM = N'Kỹ thuật viên thiết kế đồ họa' WHERE MaTDCM = 'D02';
UPDATE CHUYENMON SET TenTDCM = N'Kỹ thuật viên thu thập số liệu' WHERE MaTDCM = 'D03';

-- Cập nhật dữ liệu cho bảng NHANVIEN
UPDATE NHANVIEN SET HoTenNV = N'Nguyễn Thanh Tùng', TenLotNV = N'Thanh', TenNV = N'Tùng', NgaySinh = '1965-08-12', Phai = N'Nam', DiaChi = N'Trà Vinh', HeSoLuong = 4.66, MaTDCM = 'A01' WHERE MaNV = 'A1.001';
UPDATE NHANVIEN SET HoTenNV = N'Nguyễn Mạnh Hùng', TenLotNV = N'Mạnh', TenNV = N'Hùng', NgaySinh = '1962-09-15', Phai = N'Nam', DiaChi = N'Vĩnh Long', HeSoLuong = 4.33, MaTDCM = 'A02' WHERE MaNV = 'A1.002';
-- Tiếp tục cập nhật cho các bản ghi khác tương tự...

-- Cập nhật dữ liệu cho bảng PHONGBAN
UPDATE PHONGBAN SET TenPhong = N'Kỹ thuật' WHERE MaPhong = 'KT';
UPDATE PHONGBAN SET TenPhong = N'Kinh doanh' WHERE MaPhong = 'KD';
UPDATE PHONGBAN SET TenPhong = N'Sản xuất' WHERE MaPhong = 'SX';

-- Cập nhật dữ liệu cho bảng NHIEMVU
UPDATE NHIEMVU SET TenNhiemVu = N'Tổ trưởng tổ kỹ thuật' WHERE MaNhiemVu = 'A1';
-- Tiếp tục cập nhật cho các bản ghi khác tương tự...

-- Cập nhật dữ liệu cho bảng NHAN_NHIEMVU
UPDATE NHAN_NHIEMVU SET NgayKetThucNhiemVu = '2023-12-31' WHERE MaNV = 'A1.001';
-- Tiếp tục cập nhật cho các bản ghi khác tương tự...

-- Xóa các bản ghi không đúng mẫu trong bảng NHANVIEN
DELETE FROM NHANVIEN WHERE MaNV = 'A1.002Trang 33'; -- Ví dụ bản ghi không đúng mẫu

-- Xóa các bản ghi không đúng mẫu trong bảng PHANCONG
DELETE FROM PHANCONG WHERE MaNV = 'A2.001 A1'; -- Ví dụ bản ghi không đúng mẫu

SELECT *
FROM CHUYENMON

SELECT *
FROM NHANVIEN

SELECT *
FROM PHONGBAN

SELECT *
FROM NHIEMVU

SELECT *
FROM NHAN_NHIEMVU

SELECT *
FROM DEAN

SELECT *
FROM PHANCONG
