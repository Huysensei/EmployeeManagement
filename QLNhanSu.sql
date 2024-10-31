CREATE DATABASE QLNhanVien
USE QLNhanVien

CREATE TABLE TaiKhoanAdmin(
		maTK VARCHAR(20),
		tenDangNhap VARCHAR(50),
		matKhau Varchar(50),
)
CREATE TABLE PhongBan(
		maPhongBan VARCHAR(20),
		tenPhongBan NVARCHAR(70),
		CONSTRAINT PK_PhongBan PRIMARY KEY(maPhongBan)

)

CREATE TABLE ChucVu(
		maChucVu VARCHAR(20),
		tenChucVu NVARCHAR(70),
		maPhongBan VARCHAR(20),
		CONSTRAINT PK_ChucVu PRIMARY KEY(maChucVu),
		CONSTRAINT FK_ChucVu_PhongBan FOREIGN KEY (maPhongBan) REFERENCES PhongBan(maPhongBan)
)


CREATE TABLE NhanVien(
		maNV VARCHAR(20),
		hoTen NVARCHAR(40),
		diaChi NVARCHAR(300),
		sdt VARCHAR(11),
		cccd VARCHAR(15),
		mail VARCHAR(100),
		ngaySinh Date,
		ngayVaoCTy Date,
		gioiTinh NVARCHAR(3),
		maChucVu VARCHAR(20),
		CONSTRAINT PK_NhanVien PRIMARY KEY (maNV),
		CONSTRAINT FK_NhanVien_ChucVu FOREIGN KEY (maChucVu) REFERENCES ChucVu(maChucVu)
		)

CREATE TABLE NghiPhep(
		maNghiPhep VARCHAR(20),
		maNV VARCHAR(20),
		tuNgay Date,
		denNgay Date
		CONSTRAINT PK_NghiPhep PRIMARY KEY (maNghiPhep),
		CONSTRAINT FK_NghiPhep_NhanVien FOREIGN KEY (maNV) REFERENCES NhanVien(maNV)
)

CREATE TABLE Luong(
		maLuong VARCHAR(20),
		maNV VARCHAR(20),
		thangNam Varchar(10),
		luongCung MONEY,
		luongThuong MONEY,
		luongUngTruoc MONEY,
		phuCap MONEY,
		CONSTRAINT PK_Luong PRIMARY KEY (maLuong),
		CONSTRAINT FK_Luong_NhanVien FOREIGN KEY (maNV) REFERENCES NhanVien(maNV)
)

CREATE TABLE TaiKhoan(
		maTK VARCHAR(20),
		tenDangNhap VARCHAR(50),
		matKhau Varchar(50),
		maNV VARCHAR(20),
		loaiTK VARCHAR(20),
		CONSTRAINT PK_TaiKhoan PRIMARY KEY (maTK),
		CONSTRAINT FK_TaiKhoan_NhanVien FOREIGN KEY (maNV) REFERENCES NhanVien(maNV)
)

CREATE TABLE PhanHoi(
		maPhanHoi VARCHAR(20),
		maNV VARCHAR(20),
		noiDung VARCHAR(MAX),
		thoiGian DATETIME,
		CONSTRAINT PK_PhanHoi PRIMARY KEY (maPhanHoi),
		CONSTRAINT FK_PhanHoi_NhanVien FOREIGN KEY (maNV) REFERENCES NhanVien(maNV)
)

INSERT INTO TaiKhoanAdmin (maTK, tenDangNhap, matKhau)
VALUES ('AD01', 'ADMIN', 12345);

INSERT INTO PhongBan (maPhongBan, tenPhongBan)
VALUES ('PB01', N'Nhân sự'),
       ('PB02', N'Kinh doanh'), 
	   ('PB03', N'Công nghệ thông tin'),
	   ('PB04', N'Tài chính'),
	   ('PB05', N'Chăm sóc khách hàng'),
	   ('PB06', N'Nghiên cứu sản phẩm');

INSERT INTO ChucVu (maChucVu, tenChucVu, maPhongBan)
VALUEs ('CV01', N'Trưởng phòng nhân sự phòng nhân sự', 'PB01'),
       ('CV02', N'Nhân viên phòng nhân sự', 'PB01'),
	   ('CV03', N'Nhân viên phòng kinh doanh', 'PB02'),
	   ('CV04', N'Nhân viên phòng công nghệ thông tin', 'PB03'),
	   ('CV05', N'Nhân viên phòng tài chính', 'PB04'),
	   ('CV06', N'Nhân viên phòng chăm sóc khách hàng', 'PB05'),
	   ('CV07', N'Nhân viên phòng nghiên cứu sản phẩm', 'PB06');

INSERT INTO NhanVien (maNV, hoTen, diaChi, sdt, cccd, mail, ngaySinh, ngayVaoCTy, gioiTinh, maChucVu)
VALUES ('NV01', N'Đặng Văn Khánh', N'Thái Bình', 0983878218, 010203002309, 'dvk1123@gmail.com', '1973-04-09', '2022-11-01','Nam', 'CV01'),
       ('NV02', N'Phùng Nguyễn Huy', N'Nghệ An', 0383174902, 020203002309, 'pnh5523@gmail.com', '1974-11-24', '2022-11-01','Nam', 'CV02'),
	   ('NV03', N'Trần Minh Hoàng', N'Nam Định', 0944202689, 030203002309, 'tmk2003@gmail.com', '1975-03-06', '2022-11-01','Nam', 'CV02'),
	   ('NV04', N'Lý Thị Khánh Huyền', N'Hà Nam', 0399720217, 040203002309, 'ltkh2003@gmail.com', '1973-06-21', '2022-11-01',N'Nữ', 'CV02'),
	   ('NV05', N'Bùi Duy Đạt', N'Bắc Giang', 0359398798, 010298702309, 'buidat04@gmail.com', '1989-12-07', '2022-11-01','Nam', 'CV02'),
	   ('NV06', N'Đoàn Công Trường', N'Hà Nội', 0394818444, 010756002309, 'dct19989@gmail.com', '1989-12-07', '2022-11-01','Nam', 'CV02'),
	   ('NV07', N'Bùi Quang Hiếu', N'Hải Dương', 0971071940, 025203002309, 'buiquanghieu@gmail.com', '1988-07-22', '2022-11-01','Nam', 'CV03'),
	   ('NV08', N'Bùi Quang Dương', N'Bắc Giang', 0359693129, 016203002309, 'buiduong@gmail.com', '1988-06-17', '2022-11-01','Nam', 'CV03'),
	   ('NV09', N'Trần Thanh Hà', N'Thái Bình', 0387287488, 014783002309, 'tahnhha@gmail.com', '1988-10-18', '2022-11-01','Nu', 'CV03'),
	   ('NV10', N'Hoàng Thanh Tuyền ', N'Bắc Giang', 0877154581, 010203036509, 'thanhtuyen@gmail.com', '1987-10-01', '2022-11-01',N'Nữ', 'CV03'),
	   ('NV11', N'Nguyễn Trung Trường', N'Hà Nội', 0968632337, 010201482309, 'trungtruongngo@gmail.com', '1988-08-26', '2022-11-01','Nam', 'CV04'),
	   ('NV12', N'Trần Doãn Hoàng', N'Nghệ An', 0359167096, 010204562309, 'daonhoagn12@gmail.com', '1986-06-09', '2022-11-01','Nam', 'CV04'),
	   ('NV13', N'Nguyễn Tuấn Thành', N'Hà Nội', 0343527006, 0102014502309, 'tuanthanhwer@gmail.com', '1987-04-20', '2022-11-01','Nam', 'CV04'),
	   ('NV14', N'Thái Anh Tiến', N'Hà Nam', 0325586460, 011453002309, 'thaianhtien12@gmail.com', '1988-10-15', '2022-11-01','Nam', 'CV04'),
	   ('NV15', N'Nguyễn Văn Tiến', N'Nghệ An', 0399776440, 014203002309, 'vantienling@gmail.com', '1988-03-03', '2022-11-01','Nam', 'CV04'),
	   ('NV16', N'Nguyễn Văn Linh', N'Vĩnh Phúc', 0967420951, 098203002309, 'linhgood@gmail.com', '1987-07-16', '2022-11-01',N'Nữ', 'CV05'),
	   ('NV17', N'Phạm Minh Quyến', N'Hải Dương', 0915620909, 010203002309, 'vanquyen@gmail.com', '1988-08-24', '2022-11-01','Nam', 'CV05'),
	   ('NV18', N'Nguyễn Quý Phú', N'Vĩnh Phúc', 0705961540, 0102343002309, 'quyphungu@gmail.com', '1987-04-13', '2022-11-01','Nam', 'CV05'),
	   ('NV19', N'Ngô Minh Quang', N'Hà Nam', 0945987441, 010223424002309, 'minhquang@gmail.com', '01-01-2003', '2022-11-01','Nam', 'CV05'),
	   ('NV20', N'Nguyễn Thanh Đức', N'Quảng Trị', 0352183147, 042503002329, 'thanhducl12@gmail.com', '1988-08-02', '2022-11-01','Nam', 'CV06'),
	   ('NV21', N'Nguyễn Minh Đức', N'Nghệ An', 0352183149, 042503002309, 'minhducl12@gmail.com', '1988-08-02', '2022-11-01','Nam', 'CV06'),
	   ('NV22', N'Vương Hồng Chính', N'Hà Nội', 0397491011, 010478002309, 'chinh123@gmail.com', '1988-01-18', '2022-11-01','Nam', 'CV06'),
	   ('NV23', N'Nguyễn Hoàng Tân', N'Ninh Bình', 0352465215, 010296302309, 'hoangtan124@gmail.com', '1990-06-24', '2022-11-01',N'Nữ', 'CV06'),
	   ('NV24', N'Trần Hữu Thái', N'Hà Nội', 0327771457, 0102030023741, 'huuthai09@gmail.com', '1991-10-21', '2022-11-01','Nam', 'CV06'),
	   ('NV25', N'Phạm Hồng Tình', N'Hà Nội', 0395114021, 010203078892309, 'hongtinh20314@gmail.com', '1994-12-01', '2022-11-01',N'Nữ', 'CV06'),
	   ('NV26', N'Nguyễn Đức Mạnh', N'Ninh Bình', 0961174700, 010203412309, 'ducmanhnguasc@gmail.com', '1984-03-12', '2022-11-01','Nam', 'CV07'),
	   ('NV27', N'Lê Quang Thảo ', N'Nghệ An', 0342266384, 010203365309, 'qunagthoa123@gmail.com', '1984-09-12', '2022-11-01',N'Nữ', 'CV07'),
	   ('NV28', N'Trần Anh Tuấn', N'Hải Dương', 0862153362, 0102035202309, 'anhtuan09@gmail.com', '1993-04-09', '2022-11-01','Nam', 'CV07'),
	   ('NV29', N'Trần Khánh Cường', N'Thái Bình', 0975376350, 010200882309, 'khanhcuong128@gmail.com', '1987-11-24', '2022-11-01','Nam', 'CV07'),
	   ('NV30', N'Cao Xuân Quý', N'Nghệ An', 0344188629, 0102030023789, 'xunaquyacvc@gmail.com', '1988-03-06', '2022-11-01',N'Nữ', 'CV07');
	
INSERT INTO NghiPhep (maNghiPhep, maNV, tuNgay, denNgay)
VALUES ('NP01', 'NV05', '2022-12-05', '2022-12-06'),
	   ('NP02', 'NV10', '2022-12-20', '2022-12-22'),
	   ('NP03', 'NV15', '2023-01-20', '2022-01-21'),
	   ('NP04', 'NV20', '2023-02-11', '2022-02-12'),
	   ('NP05', 'NV25', '2023-04-17', '2022-04-19'),
	   ('NP06', 'NV05', '2023-06-02', '2022-06-03'),
	   ('NP07', 'NV25', '2023-08-21', '2022-08-23'),
	   ('NP08', 'NV03', '2023-10-02', '2022-10-03'),
	   ('NP09', 'NV17', '2023-10-14', '2022-10-17'),
	   ('NP10', 'NV05', '2023-10-17', '2022-10-20');

INSERT INTO Luong (maLuong, maNV, thangNam, luongCung, luongThuong, luongUngTruoc, phuCap)
VALUES 

('LU01', 'NV01', '2022-11', '25000000', '2000000', '1500000', '0'),
('LU02', 'NV02', '2022-11', '20000000', '2000000', '0', '0'),
('LU03', 'NV03', '2022-11', '20000000', '2000000', '1000000', '0'),
('LU04', 'NV04', '2022-11', '20000000', '2000000', '0', '0'),
('LU05', 'NV05', '2022-11', '20000000', '2000000', '500000', '0'),
('LU06', 'NV06', '2022-11', '20000000', '2000000', '0', '0'),
('LU07', 'NV07', '2022-11', '5000000', '2000000', '0', '0'),
('LU08', 'NV08', '2022-11', '5000000', '2000000', '500000', '0'),
('LU09', 'NV09', '2022-11', '5000000', '2000000', '0', '0'),
('LU10', 'NV10', '2022-11', '5000000', '2000000', '0', '0'),
('LU11', 'NV11', '2022-11', '15000000', '2000000', '0', '200000'),
('LU12', 'NV12', '2022-11', '15000000', '2000000', '0', '200000'),
('LU13', 'NV13', '2022-11', '15000000', '2000000', '0', '200000'),
('LU14', 'NV14', '2022-11', '15000000', '2000000', '0', '200000'),
('LU15', 'NV15', '2022-11', '15000000', '2000000', '0', '200000'),
('LU16', 'NV16', '2022-11', '10000000', '2000000', '0', '200000'),
('LU17', 'NV17', '2022-11', '10000000', '2000000', '0', '0'),
('LU18', 'NV18', '2022-11', '10000000', '2000000', '300000', '0'),
('LU19', 'NV19', '2022-11', '10000000', '2000000', '0', '0'),
('LU20', 'NV20', '2022-11', '10000000', '2000000', '0', '0'),
('LU21', 'NV21', '2022-11', '10000000', '2000000', '500000', '0'),
('LU22', 'NV22', '2022-11', '10000000', '2000000', '0', '0'),
('LU23', 'NV23', '2022-11', '10000000', '2000000', '0', '0'),
('LU24', 'NV24', '2022-11', '10000000', '2000000', '1000000', '0'),
('LU25', 'NV25', '2022-11', '10000000', '2000000', '0', '0'),
('LU26', 'NV26', '2022-11', '10000000', '2000000', '1000000', '0'),
('LU27', 'NV27', '2022-11', '10000000', '2000000', '0', '500000'),
('LU28', 'NV28', '2022-11', '10000000', '2000000', '0', '500000'),
('LU29', 'NV29', '2022-11', '10000000', '2000000', '0', '500000'),
('LU30', 'NV30', '2022-11', '10000000', '2000000', '0', '500000');

INSERT INTO TaiKhoan (maTK, tenDangNhap, matKhau, maNV, loaiTK)
VALUES ('TK01', 'NV01', 12345, 'NV01', 'QuanLi'),
	   ('TK02', 'NV02', 12345, 'NV02', 'QuanLi'),
	   ('TK03', 'NV03', 12345, 'NV03', 'QuanLi'),
	   ('TK04', 'NV04', 12345, 'NV04', 'QuanLi'),
	   ('TK05', 'NV05', 12345, 'NV05', 'QuanLi'),
	   ('TK06', 'NV06', 12345, 'NV06', 'QuanLi'),
	   ('TK07', 'NV07', 12345, 'NV07', 'NhanVien'),
	   ('TK08', 'NV08', 12345, 'NV08', 'NhanVien'),
	   ('TK09', 'NV09', 12345, 'NV09', 'NhanVien'),
	   ('TK10', 'NV10', 12345, 'NV10', 'NhanVien'),
	   ('TK11', 'NV11', 12345, 'NV11', 'NhanVien'),
	   ('TK12', 'NV12', 12345, 'NV12', 'NhanVien'),
	   ('TK13', 'NV13', 12345, 'NV13', 'NhanVien'),
	   ('TK14', 'NV14', 12345, 'NV14', 'NhanVien'),
	   ('TK15', 'NV15', 12345, 'NV15', 'NhanVien'),
	   ('TK16', 'NV16', 12345, 'NV16', 'NhanVien'),
	   ('TK17', 'NV17', 12345, 'NV17', 'NhanVien'),
	   ('TK18', 'NV18', 12345, 'NV18', 'NhanVien'),
	   ('TK19', 'NV19', 12345, 'NV19', 'NhanVien'),
	   ('TK20', 'NV20', 12345, 'NV20', 'NhanVien'),
	   ('TK21', 'NV21', 12345, 'NV21', 'NhanVien'),
	   ('TK22', 'NV22', 12345, 'NV22', 'NhanVien'),
	   ('TK23', 'NV23', 12345, 'NV23', 'NhanVien'),
	   ('TK24', 'NV24', 12345, 'NV24', 'NhanVien'),
	   ('TK25', 'NV25', 12345, 'NV25', 'NhanVien'),
	   ('TK26', 'NV26', 12345, 'NV26', 'NhanVien'),
	   ('TK27', 'NV27', 12345, 'NV27', 'NhanVien'),
	   ('TK28', 'NV28', 12345, 'NV28', 'NhanVien'),
	   ('TK29', 'NV29', 12345, 'NV29', 'NhanVien'),
	   ('TK30', 'NV30', 12345, 'NV30', 'NhanVien');

INSERT INTO PhanHoi (maPhanHoi, maNV, noiDung, thoiGian)
VALUES ('PH01', 'NV01', N'Quản lí Đặng Văn Khánh xấu trai mà để gmail là khanhdepzai!!!', '2023-04-19'),
	   ('PH02', 'NV10', N'Quản lí Đặng Văn Khánh đã xấu mà còn đi tán tỉnh nhân viên', '2023-06-25'),
       ('PH03', 'NV11', N'Quản lí Đặng Văn Khánh rất khó tính, bắt nhân viên làm quá nhiều','2023-08-01');
