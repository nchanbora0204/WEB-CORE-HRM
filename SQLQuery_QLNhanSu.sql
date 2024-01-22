USE [master]
GO
CREATE DATABASE QLNhanSu
GO

USE QLNhanSu
GO

CREATE TABLE [dbo].[tblBaoHiemXH](
	[MaBHXH] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[NgayCap] [datetime] NULL,
	[NoiCap] [nvarchar](50) NULL,
	[NoiDKKCB] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
) 
GO

CREATE TABLE [dbo].[tblTrinhDo](
	[MaTD] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[TenTrinhDo] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](100) NULL
);
GO

CREATE TABLE [dbo].[tblChuyenMon](
	[MaCM] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[TenCM] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](100) NULL
);
GO

CREATE TABLE [dbo].[tblDonVi](
	[MaDV] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[TenDV] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](100) NULL
);
GO

CREATE TABLE [dbo].[tblLuong](
	[MaLuong] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[MaCM] INT,
	[MaTD] INT,
	[MaDV] INT,
	[LuongCoBan] [int] NULL,
	[LuongCBMoi] [int] NULL,
	[NgayNhap] [datetime] NULL,
	[NgaySua] [datetime] NULL,
	[GhiChu] [nvarchar](100) NULL,

	CONSTRAINT FK_tblLuong_tblChuyenMon FOREIGN KEY ([MaCM]) REFERENCES [dbo].[tblChuyenMon]([MaCM]),
	CONSTRAINT FK_tblLuong_tblTrinhDo FOREIGN KEY ([MaTD]) REFERENCES [dbo].[tblTrinhDo]([MaTD]),
	CONSTRAINT FK_tblLuong_tblDonVi FOREIGN KEY ([MaDV]) REFERENCES [dbo].[tblDonVi]([MaDV])
);
GO



CREATE TABLE [dbo].[tblThueThuNhapCaNhan](
	[MaThue] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[CoQuanQuanLyThue] [nvarchar](100) NULL,
	[MaLuong] INT,
	[SoTien] [int] NULL,
	[NgayDangKi] [datetime] NULL,
	[GhiChu] [nvarchar](50) NULL,

	FOREIGN KEY ([MaLuong]) REFERENCES [dbo].[tblLuong]([MaLuong])
)
GO



CREATE TABLE [dbo].[tblTTNhanVien](
	[MaNV] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[HoTen] [nvarchar](30) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[CMND] [char](12) NULL,
	[NoiSinh] [nchar](10) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SDT] [char](12) NULL,
	[MaTD] INT,
	[MaBHXH] INT,
	[MaLuong] INT,
	[MaDV] INT,
	[MaThue] INT,
	[MaCM] INT,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](30) NULL,
	[PhanQuyen] [int] NOT NULL,
	[Anh] [nvarchar](MAX) NULL,
	[GhiChu] [nvarchar](100) NULL,
	[DanToc] [nvarchar](30) NULL,
	[TonGiao] [nvarchar](30) NULL,
	[QuocTich] [nvarchar](30) NULL,
	FOREIGN KEY ([MaTD]) REFERENCES [dbo].[tblTrinhDo]([MaTD]),
	FOREIGN KEY ([MaBHXH]) REFERENCES [dbo].[tblBaoHiemXH]([MaBHXH]),
	FOREIGN KEY ([MaLuong]) REFERENCES [dbo].[tblLuong]([MaLuong]),
	FOREIGN KEY ([MaDV]) REFERENCES [dbo].[tblDonVi]([MaDV]),
	FOREIGN KEY ([MaThue]) REFERENCES [dbo].[tblThueThuNhapCaNhan]([MaThue]),
	FOREIGN KEY ([MaCM]) REFERENCES [dbo].[tblChuyenMon]([MaCM]),
)
GO

CREATE TABLE [dbo].[tblThang](
	[MaThang] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[TenThang] Nvarchar(200) NOT NULL,
	[GhiChu] [nvarchar](200) NULL
) 
GO


CREATE TABLE [dbo].[tblThongKeLuong](
	[MaTKLuong] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[MaNV] INT NOT NULL,
	[MaThang] INT NOT NULL,
	[LuongCoBan] INT Null,
	[ThuePhaiDong] INT Null,
	[Thuong] INT Null,
	[Phat] INT Null,
	[TongLuong] INT Null,
	[GhiChu] [nvarchar](200) NULL,
	NgayTao datetime NULL,
	FOREIGN KEY ([MaNV]) REFERENCES [dbo].[tblTTNhanVien]([MaNV]),
	FOREIGN KEY ([MaThang]) REFERENCES [dbo].[tblThang]([MaThang])
) 
GO



INSERT [dbo].[tblThang] ( [TenThang],[GhiChu]) VALUES ( N'Tháng 1', N'Không')
INSERT [dbo].[tblThang] ( [TenThang],[GhiChu]) VALUES ( N'Tháng 2', N'Không')
INSERT [dbo].[tblThang] ( [TenThang],[GhiChu]) VALUES ( N'Tháng 3', N'Không')
INSERT [dbo].[tblThang] ( [TenThang],[GhiChu]) VALUES ( N'Tháng 4', N'Không')
INSERT [dbo].[tblThang] ( [TenThang],[GhiChu]) VALUES ( N'Tháng 5', N'Không')
INSERT [dbo].[tblThang] ( [TenThang],[GhiChu]) VALUES ( N'Tháng 6', N'Không')
INSERT [dbo].[tblThang] ( [TenThang],[GhiChu]) VALUES ( N'Tháng 7', N'Không')
INSERT [dbo].[tblThang] ( [TenThang],[GhiChu]) VALUES ( N'Tháng 8', N'Không')
INSERT [dbo].[tblThang] ( [TenThang],[GhiChu]) VALUES ( N'Tháng 9', N'Không')
INSERT [dbo].[tblThang] ( [TenThang],[GhiChu]) VALUES ( N'Tháng 10', N'Không')
INSERT [dbo].[tblThang] ( [TenThang],[GhiChu]) VALUES ( N'Tháng 11', N'Không')
INSERT [dbo].[tblThang] ( [TenThang],[GhiChu]) VALUES ( N'Tháng 12', N'Không')

INSERT INTO [dbo].[tblBaoHiemXH] ([NgayCap], [NoiCap], [NoiDKKCB], [GhiChu]) VALUES (CAST(0x0000A60E00000000 AS DateTime), N'TP HCM', N'BV Tân Phú', N'Không có')
INSERT INTO [dbo].[tblBaoHiemXH] ([NgayCap], [NoiCap], [NoiDKKCB], [GhiChu]) VALUES (CAST(0x0000A60100000000 AS DateTime), N'TP HCM', N'BV Tân Phú', N'Không có')
INSERT INTO [dbo].[tblBaoHiemXH] ([NgayCap], [NoiCap], [NoiDKKCB], [GhiChu]) VALUES (CAST(0x0000A69700000000 AS DateTime), N'TP HCM', N'BV Chợ Rẫy', N'Không có')
INSERT INTO [dbo].[tblBaoHiemXH] ([NgayCap], [NoiCap], [NoiDKKCB], [GhiChu]) VALUES (CAST(0x0000A60A00000000 AS DateTime), N'TP HCM', N'BV Nhi Đồng', N'Không có')
INSERT INTO [dbo].[tblBaoHiemXH] ([NgayCap], [NoiCap], [NoiDKKCB], [GhiChu]) VALUES (CAST(0x0000A58000000000 AS DateTime), N'TP HCM', N'BV Thống Nhất', N'BV Thống Nhất')

INSERT [dbo].[tblChuyenMon] ( [TenCM], [GhiChu]) VALUES ( N'Bán Hàng', N'Không')
INSERT [dbo].[tblChuyenMon] ( [TenCM], [GhiChu]) VALUES ( N'CEO', N'Không')
INSERT [dbo].[tblChuyenMon] ( [TenCM], [GhiChu]) VALUES ( N'Kế Toán', N'Không')
INSERT [dbo].[tblChuyenMon] ( [TenCM], [GhiChu]) VALUES ( N'Quản Lý', N'Không')

INSERT [dbo].[tblDonVi] ( [TenDV], [GhiChu]) VALUES ( N'Văn Phòng', N'Không')
INSERT [dbo].[tblDonVi] ( [TenDV], [GhiChu]) VALUES ( N'Phòng Tổ chức lao động', N'Không')
INSERT [dbo].[tblDonVi] ( [TenDV], [GhiChu]) VALUES ( N'Phòng Kế toán - Tài chính', N'Không')
INSERT [dbo].[tblDonVi] ( [TenDV], [GhiChu]) VALUES ( N'Phòng Vật tư', N'Không')
INSERT [dbo].[tblDonVi] ( [TenDV], [GhiChu]) VALUES ( N'Phòng Kế hoạch - Tiêu thụ', N'Không')
INSERT [dbo].[tblDonVi] ( [TenDV], [GhiChu]) VALUES ( N'Phòng Điều hành sản xuất', N'Không')
INSERT [dbo].[tblDonVi] ( [TenDV], [GhiChu]) VALUES ( N'Phòng Kinh Doanh', N'Không')

INSERT [dbo].[tblTrinhDo] ([TenTrinhDo], [GhiChu]) VALUES (N'CĐ', N'Cao Đẳng')
INSERT [dbo].[tblTrinhDo] ([TenTrinhDo], [GhiChu]) VALUES (N'CH', N'Cao Học')
INSERT [dbo].[tblTrinhDo] ([TenTrinhDo], [GhiChu]) VALUES (N'ĐH', N'Đại Học')

INSERT [dbo].[tblLuong] ([MaCM], [LuongCoBan], [MaTD], [NgayNhap], [LuongCBMoi], [NgaySua], [GhiChu], [MaDV]) VALUES ( 1, 45000000, 1, CAST(0x0000A60E00000000 AS DateTime), 0, CAST(0x0000A60E00000000 AS DateTime), N'Không',1)
INSERT [dbo].[tblLuong] ([MaCM], [LuongCoBan], [MaTD], [NgayNhap], [LuongCBMoi], [NgaySua], [GhiChu], [MaDV]) VALUES (2, 10000000, 2, CAST(0x0000A60100000000 AS DateTime), 15000000, CAST(0x0000A60200000000 AS DateTime), N'Lên Chức',2)
INSERT [dbo].[tblLuong] ([MaCM], [LuongCoBan], [MaTD], [NgayNhap], [LuongCBMoi], [NgaySua], [GhiChu], [MaDV]) VALUES ( 3, 6000000, 1, CAST(0x0000A60100000000 AS DateTime), 12000000, CAST(0x0000A60100000000 AS DateTime), N'Xấu trai',3)
INSERT [dbo].[tblLuong] ([MaCM], [LuongCoBan], [MaTD], [NgayNhap], [LuongCBMoi], [NgaySua], [GhiChu], [MaDV]) VALUES ( 4, 8000000, 1, CAST(0x0000A58000000000 AS DateTime), 0, CAST(0x0000A58000000000 AS DateTime), N'Không',4)

INSERT [dbo].[tblThueThuNhapCaNhan] ([CoQuanQuanLyThue], [MaLuong], [SoTien], [NgayDangKi], [GhiChu]) VALUES ( N'Cục Thuế Hà Nội', 1, 8000000, CAST(0x0000A60E00000000 AS DateTime), N'Không Có')
INSERT [dbo].[tblThueThuNhapCaNhan] ([CoQuanQuanLyThue], [MaLuong], [SoTien], [NgayDangKi], [GhiChu]) VALUES (N'Cục Thuế TPHCM', 2, 750000, CAST(0x0000A6DA00000000 AS DateTime), N'Không Có')
INSERT [dbo].[tblThueThuNhapCaNhan] ([CoQuanQuanLyThue], [MaLuong], [SoTien], [NgayDangKi], [GhiChu]) VALUES (N'Cục Thuế TPHCM', 3, 350000, CAST(0x0000A6DA00000000 AS DateTime), N'Không Có')
INSERT [dbo].[tblThueThuNhapCaNhan] ([CoQuanQuanLyThue], [MaLuong], [SoTien], [NgayDangKi], [GhiChu]) VALUES (N'Cục Thuế TPHCM', 4, 550000, CAST(0x0000A6DA00000000 AS DateTime), N'Không Có')

INSERT [dbo].[tblTTNhanVien] ([HoTen], [NgaySinh], [GioiTinh], [CMND], [NoiSinh], [DiaChi], [SDT], [MaTD], [MaBHXH], [MaLuong], [MaDV], [MaThue], [MaCM], [Email], [GhiChu], [DanToc], [TonGiao], [QuocTich], [Password],[PhanQuyen]) 
VALUES (N'Nam Trung', CAST(0x0000884600000000 AS DateTime), N'Nam', N'215487745   ', N'Phú Thọ', N'TP HCM', N'01256985471 ', 3, 1, 1, 2, 1, 1, N'namtrung@gmail.com', N'Đẹp Trai ', N'Kinh', N'Không', N'Việt Nam', '123456',1)
INSERT [dbo].[tblTTNhanVien] ([HoTen], [NgaySinh], [GioiTinh], [CMND], [NoiSinh], [DiaChi], [SDT], [MaTD], [MaBHXH], [MaLuong], [MaDV], [MaThue], [MaCM], [Email], [GhiChu], [DanToc], [TonGiao], [QuocTich], [Password],[PhanQuyen]) 
VALUES (N'Vũ Như Tuấn Hùng', CAST(0x0000A60100000000 AS DateTime), N'Nam', N'242523652   ', N'Hưng Yên', N'TP HCM', N'01665655214 ', 3, 2, 2, 3, 2,2, N'vuhung@gmail.com', N'Không', N'Kinh', N'Không', N'Việt Nam', '123456',1)
INSERT [dbo].[tblTTNhanVien] ([HoTen], [NgaySinh], [GioiTinh], [CMND], [NoiSinh], [DiaChi], [SDT], [MaTD], [MaBHXH], [MaLuong], [MaDV], [MaThue], [MaCM], [Email], [GhiChu], [DanToc], [TonGiao], [QuocTich], [Password],[PhanQuyen]) 
VALUES (N'Nguyễn Thị Mạnh Hùng', CAST(0x0000806800000000 AS DateTime), N'Nữ', N'212823367   ', N'Phú Thọ', N'Hà Nội', N'01667899877 ', 3, 3, 3, 1, 3, 3, N'thihung@gmail.com', N'Không', N'Kinh', N'Không', N'Việt Nam','123456',3)
INSERT [dbo].[tblTTNhanVien] ([HoTen], [NgaySinh], [GioiTinh], [CMND], [NoiSinh], [DiaChi], [SDT], [MaTD], [MaBHXH], [MaLuong], [MaDV], [MaThue], [MaCM], [Email], [GhiChu], [DanToc], [TonGiao], [QuocTich], [Password],[PhanQuyen]) 
VALUES (N'Nguyễn Thị Đạt', CAST(0x0000806800000000 AS DateTime), N'Nữ', N'212823367   ', N'Hưng Yên', N'Hà Nội', N'01667899877 ', 3, 4, 4, 7, 4, 4, N'dat@gmail.com', N'Không', N'Kinh', N'Không', N'Việt Nam', '123456',2)

--INSERT [dbo].[tblUser] ([Email], [Password], [PhanQuyen]) VALUES (N'dung@gmail.com', N'admin', 1)
--INSERT [dbo].[tblUser] ([Email], [Password], [PhanQuyen]) VALUES (N'vuhung@gmail.com', N'admin', 2)
--INSERT [dbo].[tblUser] ([Email], [Password], [PhanQuyen]) VALUES (N'thihung@gmail.com', N'admin', 3)
--INSERT [dbo].[tblUser] ([Email], [Password], [PhanQuyen]) VALUES (N'dat@gmail.com', N'admin', 1)

