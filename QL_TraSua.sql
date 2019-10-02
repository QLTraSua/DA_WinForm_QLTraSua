CREATE DATABASE QL_TraSua

ON  PRIMARY ( 
NAME = N'BTVeNha', 
FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BTVeNha.mdf', 
SIZE = 3072K, 
MAXSIZE = UNLIMITED, 
FILEGROWTH = 1024KB )
LOG ON ( 
NAME = N'BTVeNha_log', 
FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BTVeNha_log.ldf' , 
SIZE = 1024KB , 
MAXSIZE = 2048GB , 
FILEGROWTH = 10%)

use QL_TraSua

create table nhanvien
(
	MaNV int identity(1,1) primary key,
	TenNV nvarchar(50),
	SDT char(10),
	NgaySinh date,
	GioiTinh nvarchar(5),
)

create table dangnhap
(
	MaNV int identity(1,1) not null,
	MatKhau varchar(20) not null,
	primary key(Manv,MatKhau),
	foreign key (MaNV) references nhanvien(MaNV) 
)

create table hoadon
(
	MaHD int identity(1,1) primary key,
	NgayTao date,
	TongTien int,
	MaNV int,
	foreign key (MaNV) references nhanvien(MaNV)
)

create table loaisp
(
	MaLoai int identity(1,1) primary key,
	TenLoai nvarchar(20)
)

create table sanpham
(
	MaSP int identity(1,1) primary key,
	TenSP nvarchar(50),
	MaLoai int,
	DonGia int,
	foreign key (MaLoai) references loaisp(MaLoai)
)

create table cthd
(
	MaCTHD int identity(1,1) primary key,
	MaHD int,
	MaSP int,
	SoLuong int,
	ThanhTien int,
	MaTP int,
	foreign key (MaHD) references hoadon(MaHD),
	foreign key (MaSP) references sanpham(MaSP),
	foreign key (MaTP) references topping(MaTP)
)

create table topping
(
	MaTP int identity(1,1) primary key,
	TenTP nvarchar(20),
	DonGiaTP int
)

alter table sanpham
add MoTa nvarchar(50);