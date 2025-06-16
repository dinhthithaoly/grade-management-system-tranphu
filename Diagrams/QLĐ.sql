create database QL_Diem
use Ql_Diem

create table Lop
(
	TenLop nvarchar(50) NOT NULL,
	Khoi nvarchar(50),
	constraint PK_Lop primary key(TenLop),
);
create table GiaoVien
(
	MaGV nvarchar(50) NOT NULL,
	HoTen nvarchar(50),
	NgaySinh date,
	GioiTinh nchar(3),
	BoMon nvarchar(25),
	SDT numeric,
	DiaChi nvarchar(50),
	constraint PK_GiaoVien primary key(MaGV),
);
create table HocSinh
(
	MaHS nvarchar(50) NOT NULL,
	TenLop nvarchar(50),
	HovaTen nvarchar(50),
	NgaySinh date,
	GioiTinh nchar(3),
	DanToc nvarchar(50),
	DiaChi nvarchar(50),
	HoTenPhuHuynh nvarchar(50),
	SDTPhuHuynh numeric,
	constraint PK_HocSinh primary key(MaHS),
	constraint FK_HocSinh_Lop foreign key(TenLop) references Lop(TenLop),
);
create table MonHoc
(
	MaMH nvarchar(50) NOT NULL,
	MaHS nvarchar(50),
	TenMH nvarchar(50),
	constraint PK_MonHoc primary key(MaMH),
	constraint FK_MonHoc_HocSinh foreign key(MaHS) references HocSinh(MaHS),
);
create table KetQua
(
	MaKQ nvarchar(50) NOT NULL,
	MaHS nvarchar(50),
	DiemTBHK numeric,
	HanhKiem nvarchar(50),
	HocLuc nvarchar(50),
	XepLoai nvarchar(50),
	DanhHieu nvarchar(50),
	SLVang numeric,
	HocKy nvarchar(50),
	constraint PK_KetQua primary key(MaKQ),
	constraint FK_KetQua_HocSinh foreign key(MaHS) references HocSinh(MaHS),
);
create table BangDiemMonHoc
(
	MaBDMH nvarchar(50) NOT NULL,
	MaMH nvarchar(50),
	MaHS nvarchar(50),
	MaKQ nvarchar(50),
	HocKy nvarchar(50),
	NamHoc date,
	Diem15p float,
	DiemMieng float,
	DiemGK float,
	DiemCK float,
	DiemTBMon float,
	constraint PK_BangDiemMonHoc primary key(MaBDMH),
	constraint FK_BangDiemMonHoc_MonHoc foreign key(MaMH) references MonHoc(MaMH),
	constraint FK_BangDiemMonHoc_HocSinh foreign key(MaHS) references HocSinh(MaHS),
	constraint FK_BangDiemMonHoc_KetQua foreign key(MaKQ) references KetQua(MaKQ),
);
create table GiangDay
(
	MaGV nvarchar(50) NOT NULL,
	TenLop nvarchar(50) NOT NULL,
	MaMH nvarchar(50) NOT NULL,
	NamHoc date,
	HocKy nvarchar(50),
	constraint PK_GiangDay primary key(MaGV, TenLop, MaMH),
	constraint FK_GiangDay_GiaoVien foreign key(MaGV) references GiaoVien(MaGV),
	constraint FK_GiangDay_Lop foreign key(TenLop) references Lop(TenLop),
	constraint FK_GiangDay_MonHoc foreign key(MaMH) references MonHoc(MaMH),
);
