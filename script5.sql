USE [master]
GO

IF EXISTS(select * from sys.databases where name='HOTEL')
DROP DATABASE HOTEL

/****** Object:  Database [HOTEL]    Script Date: 2018-07-13 23:00:57 ******/
CREATE DATABASE [HOTEL]
 --CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'HOTEL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HOTEL.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
-- LOG ON 
--( NAME = N'HOTEL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HOTEL_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
--ALTER DATABASE [HOTEL] SET COMPATIBILITY_LEVEL = 120
--GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HOTEL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HOTEL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HOTEL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HOTEL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HOTEL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HOTEL] SET ARITHABORT OFF 
GO
ALTER DATABASE [HOTEL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HOTEL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HOTEL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HOTEL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HOTEL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HOTEL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HOTEL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HOTEL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HOTEL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HOTEL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HOTEL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HOTEL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HOTEL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HOTEL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HOTEL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HOTEL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HOTEL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HOTEL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HOTEL] SET  MULTI_USER 
GO
ALTER DATABASE [HOTEL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HOTEL] SET DB_CHAINING OFF 
GO
--ALTER DATABASE [HOTEL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
--GO
--ALTER DATABASE [HOTEL] SET TARGET_RECOVERY_TIME = 0 SECONDS 
--GO
--ALTER DATABASE [HOTEL] SET DELAYED_DURABILITY = DISABLED 
--GO
USE [HOTEL]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[IDAccount] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[CMND] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[IDRole] [int] NULL,
	[State] [tinyint] NULL,
	[Description] [nvarchar](max) NULL,
	[Avatar] [nvarchar](500) NULL,
	[Birthday] [date] NULL,
	[QueQuan] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[IDAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTieu]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTieu](
	[IDChiTieu] [int] IDENTITY(1,1) NOT NULL,
	[SoTien] [decimal](18, 0) NULL,
	[NoiDung] [nvarchar](2000) NULL,
	[NgayChi] [date] NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [int] NULL,
	[GhiChu] [nvarchar](2000) NULL,
	[IDLoaiChiPhi] [int] NULL,
	[State] [tinyint] NULL,
 CONSTRAINT [PK_ChiTieu] PRIMARY KEY CLUSTERED 
(
	[IDChiTieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DefaultPermistionRole]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefaultPermistionRole](
	[IDDPR] [int] IDENTITY(1,1) NOT NULL,
	[IDRole] [int] NULL,
	[IDPermistion] [int] NULL,
 CONSTRAINT [PK_DefaultPermistionRole] PRIMARY KEY CLUSTERED 
(
	[IDDPR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[IDDichVu] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[State] [tinyint] NULL,
	[IDLoaiDichVu] [int] NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[IDDonVi] [int] NULL,
	[HinhAnh] [nvarchar](500) NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[IDDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DichVuBanLe]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVuBanLe](
	[IDDVBL] [int] IDENTITY(1,1) NOT NULL,
	[IDHoaDonBanLe] [int] NULL,
	[IDDichVu] [int] NULL,
	[SoLuong] [int] NULL,
	[GiaTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_DichVuBanLe] PRIMARY KEY CLUSTERED 
(
	[IDDVBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DichVuSuDung]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVuSuDung](
	[IDDVSD] [int] IDENTITY(1,1) NOT NULL,
	[IDDichVu] [int] NULL,
	[IDThuePhong] [int] NULL,
	[SoLuong] [int] NULL,
	[GiaTien] [decimal](18, 0) NULL,
	[NVGoi] [int] NULL,
	[CapNhatLuc] [datetime] NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[IDDVSD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonVi]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonVi](
	[IDDonVi] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[State] [tinyint] NULL,
 CONSTRAINT [PK_DonVi] PRIMARY KEY CLUSTERED 
(
	[IDDonVi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HDBanLe]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HDBanLe](
	[IDHoaDonBanLe] [int] IDENTITY(1,1) NOT NULL,
	[NVBanHang] [int] NULL,
	[TongTien] [decimal](18, 0) NULL,
	[KhachThanhToan] [decimal](18, 0) NULL,
	[PhuThu] [decimal](18, 0) NULL,
	[LiDoPhuThu] [nvarchar](1000) NULL,
	[GiamGia] [decimal](18, 0) NULL,
	[LiDoGiamGia] [nvarchar](1000) NULL,
	[NgayTao] [datetime] NULL,
	[State] [tinyint] NULL,
	[GhiChu] [nvarchar](1000) NULL,
	[ConNo] [decimal](18, 0) NULL,
	[IDKhachHang] [int] NULL,
 CONSTRAINT [PK_HDBanLe] PRIMARY KEY CLUSTERED 
(
	[IDHoaDonBanLe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InfoHotel]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoHotel](
	[IDInfoHotel] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Logo] [nvarchar](500) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_InfoHotel] PRIMARY KEY CLUSTERED 
(
	[IDInfoHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[IDKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[CMND] [nvarchar](50) NULL,
	[GioiTinh] [bit] NULL,
	[Email] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](2000) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[IDKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhuVuc]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuVuc](
	[IDKhuVuc] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[State] [tinyint] NULL,
	[MoTa] [nvarchar](1000) NULL,
 CONSTRAINT [PK_KhuVuc] PRIMARY KEY CLUSTERED 
(
	[IDKhuVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiChiPhi]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiChiPhi](
	[IDLoaiChiPhi] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[State] [tinyint] NULL,
	[Mota] [nvarchar](500) NULL,
 CONSTRAINT [PK_LoaiChiPhi] PRIMARY KEY CLUSTERED 
(
	[IDLoaiChiPhi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiDichVu]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDichVu](
	[IDLoaiDichVu] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[State] [tinyint] NULL,
	[MoTa] [nvarchar](2000) NULL,
 CONSTRAINT [PK_LoaiDichVu] PRIMARY KEY CLUSTERED 
(
	[IDLoaiDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[IDLoaiPhong] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[State] [tinyint] NULL,
	[GhiChu] [nvarchar](1000) NULL,
	[TGBatDauTinhTien] [int] NULL,
	[TGTre] [int] NULL,
	[Gio_MinTG] [int] NULL,
	[Gio_GiaMinTG] [decimal](18, 0) NULL,
	[Gio_MaxTG] [int] NULL,
	[Gio_Gia1h] [decimal](18, 0) NULL,
	[Dem_Start] [time](7) NULL,
	[Dem_End] [time](7) NULL,
	[Dem_GiaQuaDem] [decimal](18, 0) NULL,
	[Dem_TienVaoSom1h] [decimal](18, 0) NULL,
	[Dem_MaxhVaoSom] [int] NULL,
	[Dem_TienRaMuon1h] [decimal](18, 0) NULL,
	[Dem_MaxhRaMuon] [int] NULL,
	[NgayDem_MocChot] [time](7) NULL,
	[NgayDem_Gia1NgayDem] [decimal](18, 0) NULL,
	[NgayDem_TienVaoSom1h] [decimal](18, 0) NULL,
	[NgayDem_TienRaMuon1h] [decimal](18, 0) NULL,
 CONSTRAINT [PK_LoaiPhong] PRIMARY KEY CLUSTERED 
(
	[IDLoaiPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permistion]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permistion](
	[IDPermistion] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Permistion] PRIMARY KEY CLUSTERED 
(
	[IDPermistion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PermistionAccount]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermistionAccount](
	[IDPA] [int] IDENTITY(1,1) NOT NULL,
	[IDPermistion] [int] NULL,
	[IDAccount] [int] NULL,
 CONSTRAINT [PK_PermistionAccount] PRIMARY KEY CLUSTERED 
(
	[IDPA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[IDPhieuNhap] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[State] [tinyint] NULL,
	[IDNguoiNhap] [int] NULL,
	[ThanhToan] [decimal](18, 0) NULL,
	[TongTien] [decimal](18, 0) NULL,
	[NgayNhap] [datetime] NULL,
	[GhiChu] [nvarchar](2000) NULL,
	[ConNo] [decimal](18, 0) NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[IDPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phong]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[IDPhong] [int] IDENTITY(1,1) NOT NULL,
	[IDLoaiPhong] [int] NULL,
	[IDKhuVuc] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[State] [tinyint] NULL,
	[Time] [datetime] NULL,
	[Code] [nvarchar](50) NULL,
	[IDThuePhong] [int] NULL,
	[SoNguoiToiDa] [int] NULL,
	[Status] [tinyint] NULL,
	[SoNguoiThue] [int] NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[IDPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IDRole] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[State] [tinyint] NULL,
	[Description] [nvarchar](max) NULL,
	[Level] [int] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[IDRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[IDSanPham] [int] IDENTITY(1,1) NOT NULL,
	[IDDichVu] [int] NULL,
	[IDPhieuNhap] [int] NULL,
	[SoLuong] [int] NULL,
	[GiaTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuePhong]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuePhong](
	[IDThuePhong] [int] IDENTITY(1,1) NOT NULL,
	[IDPhong] [int] NULL,
	[CheckIn] [datetime] NULL,
	[CheckOut] [datetime] NULL,
	[SoGio] [float] NULL,
	[TienPhong] [decimal](18, 0) NULL,
	[SoNguoi] [int] NULL,
	[GhiChu] [nvarchar](1000) NULL,
	[PhuThu] [decimal](18, 0) NULL,
	[LiDoPhuThu] [nvarchar](1000) NULL,
	[GiamGia] [decimal](18, 0) NULL,
	[LiDoGiamGia] [nvarchar](1000) NULL,
	[TongThanhToan] [decimal](18, 0) NULL,
	[KhachThanhToan] [decimal](18, 0) NULL,
	[TienTraLai] [decimal](18, 0) NULL,
	[State] [tinyint] NULL,
	[NVChoThue] [int] NULL,
	[LamTronGio] [int] NULL,
	[NVThuTien] [int] NULL,
	[IDKhachHang] [int] NULL,
	[TienChuyenPhong] [decimal](18, 0) NULL,
	[TienDichVu] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietThuePhong] PRIMARY KEY CLUSTERED 
(
	[IDThuePhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [FullName], [CMND], [Phone], [IDRole], [State], [Description], [Avatar], [Birthday], [QueQuan], [Address], [Email]) VALUES (3012, N'admin', N'admin', N'admin', N'', N'', 1, 1, N'admin', N'', CAST(N'2018-07-11' AS Date), N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[DefaultPermistionRole] ON 

INSERT [dbo].[DefaultPermistionRole] ([IDDPR], [IDRole], [IDPermistion]) VALUES (108, 1, 36)
INSERT [dbo].[DefaultPermistionRole] ([IDDPR], [IDRole], [IDPermistion]) VALUES (109, 1, 37)
INSERT [dbo].[DefaultPermistionRole] ([IDDPR], [IDRole], [IDPermistion]) VALUES (110, 1, 38)
INSERT [dbo].[DefaultPermistionRole] ([IDDPR], [IDRole], [IDPermistion]) VALUES (111, 1, 39)
INSERT [dbo].[DefaultPermistionRole] ([IDDPR], [IDRole], [IDPermistion]) VALUES (112, 1, 40)
INSERT [dbo].[DefaultPermistionRole] ([IDDPR], [IDRole], [IDPermistion]) VALUES (113, 1, 41)
INSERT [dbo].[DefaultPermistionRole] ([IDDPR], [IDRole], [IDPermistion]) VALUES (114, 1, 42)
INSERT [dbo].[DefaultPermistionRole] ([IDDPR], [IDRole], [IDPermistion]) VALUES (115, 1, 43)
INSERT [dbo].[DefaultPermistionRole] ([IDDPR], [IDRole], [IDPermistion]) VALUES (116, 1, 44)
INSERT [dbo].[DefaultPermistionRole] ([IDDPR], [IDRole], [IDPermistion]) VALUES (117, 1, 45)
INSERT [dbo].[DefaultPermistionRole] ([IDDPR], [IDRole], [IDPermistion]) VALUES (118, 1, 46)
INSERT [dbo].[DefaultPermistionRole] ([IDDPR], [IDRole], [IDPermistion]) VALUES (119, 1, 47)
INSERT [dbo].[DefaultPermistionRole] ([IDDPR], [IDRole], [IDPermistion]) VALUES (120, 1, 48)
INSERT [dbo].[DefaultPermistionRole] ([IDDPR], [IDRole], [IDPermistion]) VALUES (121, 1, 49)
SET IDENTITY_INSERT [dbo].[DefaultPermistionRole] OFF
SET IDENTITY_INSERT [dbo].[DichVu] ON 

INSERT [dbo].[DichVu] ([IDDichVu], [Name], [Code], [State], [IDLoaiDichVu], [SoLuong], [GiaBan], [IDDonVi], [HinhAnh]) VALUES (9, N'Nước sting', N'STING', NULL, 7, 0, CAST(15000 AS Decimal(18, 0)), 7, NULL)
INSERT [dbo].[DichVu] ([IDDichVu], [Name], [Code], [State], [IDLoaiDichVu], [SoLuong], [GiaBan], [IDDonVi], [HinhAnh]) VALUES (10, N'Mì tôm', N'MI TOM', NULL, 8, 0, CAST(10000 AS Decimal(18, 0)), 8, NULL)
INSERT [dbo].[DichVu] ([IDDichVu], [Name], [Code], [State], [IDLoaiDichVu], [SoLuong], [GiaBan], [IDDonVi], [HinhAnh]) VALUES (11, N'Thuốc lá 333', N'333', NULL, 9, 0, CAST(30000 AS Decimal(18, 0)), 8, NULL)
INSERT [dbo].[DichVu] ([IDDichVu], [Name], [Code], [State], [IDLoaiDichVu], [SoLuong], [GiaBan], [IDDonVi], [HinhAnh]) VALUES (12, N'Thuốc lá Vinataba', N'VINATABA', NULL, 9, 0, CAST(20000 AS Decimal(18, 0)), 8, NULL)
SET IDENTITY_INSERT [dbo].[DichVu] OFF
SET IDENTITY_INSERT [dbo].[DonVi] ON 

INSERT [dbo].[DonVi] ([IDDonVi], [Name], [Code], [State]) VALUES (7, N'Chai', N'Chai', 1)
INSERT [dbo].[DonVi] ([IDDonVi], [Name], [Code], [State]) VALUES (8, N'Gói', N'Gói', 1)
INSERT [dbo].[DonVi] ([IDDonVi], [Name], [Code], [State]) VALUES (9, N'Bao', N'Bao', 1)
SET IDENTITY_INSERT [dbo].[DonVi] OFF
SET IDENTITY_INSERT [dbo].[InfoHotel] ON 

INSERT [dbo].[InfoHotel] ([IDInfoHotel], [Name], [Address], [Logo], [Phone], [Email]) VALUES (2, N'Khách sạn ROYAL HOTEL', N'Đường ABC, Hà Nội', NULL, N'0987654321 - 0842315697', N'royalhotel@gmail.com')
SET IDENTITY_INSERT [dbo].[InfoHotel] OFF
SET IDENTITY_INSERT [dbo].[KhuVuc] ON 

INSERT [dbo].[KhuVuc] ([IDKhuVuc], [Name], [Code], [State], [MoTa]) VALUES (21, N'Tầng 1', N'T1', 1, NULL)
INSERT [dbo].[KhuVuc] ([IDKhuVuc], [Name], [Code], [State], [MoTa]) VALUES (22, N'Tầng 2', N'T2', 1, NULL)
SET IDENTITY_INSERT [dbo].[KhuVuc] OFF
SET IDENTITY_INSERT [dbo].[LoaiDichVu] ON 

INSERT [dbo].[LoaiDichVu] ([IDLoaiDichVu], [Name], [Code], [State], [MoTa]) VALUES (7, N'Nước uống', N'NUOC', 1, N'')
INSERT [dbo].[LoaiDichVu] ([IDLoaiDichVu], [Name], [Code], [State], [MoTa]) VALUES (8, N'Thức ăn', N'THUC AN', 1, N'')
INSERT [dbo].[LoaiDichVu] ([IDLoaiDichVu], [Name], [Code], [State], [MoTa]) VALUES (9, N'Hàng hóa', N'HANG HOA', 1, N'')
SET IDENTITY_INSERT [dbo].[LoaiDichVu] OFF
SET IDENTITY_INSERT [dbo].[LoaiPhong] ON 

INSERT [dbo].[LoaiPhong] ([IDLoaiPhong], [Name], [Code], [State], [GhiChu], [TGBatDauTinhTien], [TGTre], [Gio_MinTG], [Gio_GiaMinTG], [Gio_MaxTG], [Gio_Gia1h], [Dem_Start], [Dem_End], [Dem_GiaQuaDem], [Dem_TienVaoSom1h], [Dem_MaxhVaoSom], [Dem_TienRaMuon1h], [Dem_MaxhRaMuon], [NgayDem_MocChot], [NgayDem_Gia1NgayDem], [NgayDem_TienVaoSom1h], [NgayDem_TienRaMuon1h]) VALUES (3, N'Phòng VIP', N'VIP', 1, NULL, 10, 15, 2, CAST(30000 AS Decimal(18, 0)), 8, CAST(20000 AS Decimal(18, 0)), CAST(N'21:00:00' AS Time), CAST(N'10:00:00' AS Time), NULL, CAST(30000 AS Decimal(18, 0)), 2, CAST(20000 AS Decimal(18, 0)), 2, CAST(N'12:00:00' AS Time), NULL, CAST(20000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[LoaiPhong] ([IDLoaiPhong], [Name], [Code], [State], [GhiChu], [TGBatDauTinhTien], [TGTre], [Gio_MinTG], [Gio_GiaMinTG], [Gio_MaxTG], [Gio_Gia1h], [Dem_Start], [Dem_End], [Dem_GiaQuaDem], [Dem_TienVaoSom1h], [Dem_MaxhVaoSom], [Dem_TienRaMuon1h], [Dem_MaxhRaMuon], [NgayDem_MocChot], [NgayDem_Gia1NgayDem], [NgayDem_TienVaoSom1h], [NgayDem_TienRaMuon1h]) VALUES (4, N'Phòng VIP', N'VIP', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[LoaiPhong] ([IDLoaiPhong], [Name], [Code], [State], [GhiChu], [TGBatDauTinhTien], [TGTre], [Gio_MinTG], [Gio_GiaMinTG], [Gio_MaxTG], [Gio_Gia1h], [Dem_Start], [Dem_End], [Dem_GiaQuaDem], [Dem_TienVaoSom1h], [Dem_MaxhVaoSom], [Dem_TienRaMuon1h], [Dem_MaxhRaMuon], [NgayDem_MocChot], [NgayDem_Gia1NgayDem], [NgayDem_TienVaoSom1h], [NgayDem_TienRaMuon1h]) VALUES (5, N'Phòng đơn', N'Đơn', 1, NULL, 15, 15, 2, CAST(30000 AS Decimal(18, 0)), 8, CAST(20000 AS Decimal(18, 0)), CAST(N'21:00:00' AS Time), CAST(N'10:00:00' AS Time), NULL, CAST(30000 AS Decimal(18, 0)), 2, CAST(20000 AS Decimal(18, 0)), 2, CAST(N'12:00:00' AS Time), NULL, CAST(20000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[LoaiPhong] ([IDLoaiPhong], [Name], [Code], [State], [GhiChu], [TGBatDauTinhTien], [TGTre], [Gio_MinTG], [Gio_GiaMinTG], [Gio_MaxTG], [Gio_Gia1h], [Dem_Start], [Dem_End], [Dem_GiaQuaDem], [Dem_TienVaoSom1h], [Dem_MaxhVaoSom], [Dem_TienRaMuon1h], [Dem_MaxhRaMuon], [NgayDem_MocChot], [NgayDem_Gia1NgayDem], [NgayDem_TienVaoSom1h], [NgayDem_TienRaMuon1h]) VALUES (6, N'Phòng Đôi', N'Đôi', 1, NULL, 15, 15, 2, CAST(30000 AS Decimal(18, 0)), 8, CAST(20000 AS Decimal(18, 0)), CAST(N'21:00:00' AS Time), CAST(N'10:00:00' AS Time), NULL, CAST(30000 AS Decimal(18, 0)), 2, CAST(20000 AS Decimal(18, 0)), 2, CAST(N'12:00:00' AS Time), NULL, CAST(20000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[LoaiPhong] ([IDLoaiPhong], [Name], [Code], [State], [GhiChu], [TGBatDauTinhTien], [TGTre], [Gio_MinTG], [Gio_GiaMinTG], [Gio_MaxTG], [Gio_Gia1h], [Dem_Start], [Dem_End], [Dem_GiaQuaDem], [Dem_TienVaoSom1h], [Dem_MaxhVaoSom], [Dem_TienRaMuon1h], [Dem_MaxhRaMuon], [NgayDem_MocChot], [NgayDem_Gia1NgayDem], [NgayDem_TienVaoSom1h], [NgayDem_TienRaMuon1h]) VALUES (7, N'Phòng Ba', N'Ba', 1, NULL, 15, 15, 2, CAST(30000 AS Decimal(18, 0)), 8, CAST(20000 AS Decimal(18, 0)), CAST(N'21:00:00' AS Time), CAST(N'10:00:00' AS Time), NULL, CAST(30000 AS Decimal(18, 0)), 2, CAST(20000 AS Decimal(18, 0)), 2, CAST(N'12:00:00' AS Time), NULL, CAST(20000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[LoaiPhong] OFF
SET IDENTITY_INSERT [dbo].[Permistion] ON 

INSERT [dbo].[Permistion] ([IDPermistion], [Name], [Description]) VALUES (36, N'BanHangLe', N'Bán hàng lẻ cho khách')
INSERT [dbo].[Permistion] ([IDPermistion], [Name], [Description]) VALUES (37, N'ChiTieu', N'Quản lý chi tiêu')
INSERT [dbo].[Permistion] ([IDPermistion], [Name], [Description]) VALUES (38, N'DoanhThu', N'Quản lý doanh thu')
INSERT [dbo].[Permistion] ([IDPermistion], [Name], [Description]) VALUES (39, N'DonVi', N'Quản lý đơn vị hàng hóa, dịch vụ')
INSERT [dbo].[Permistion] ([IDPermistion], [Name], [Description]) VALUES (40, N'GiaPhong', N'Thiết lập loại phòng, giá từng loại phòng')
INSERT [dbo].[Permistion] ([IDPermistion], [Name], [Description]) VALUES (41, N'GuiBaoCao', N'Thiết lập gửi báo cáo qua Enail')
INSERT [dbo].[Permistion] ([IDPermistion], [Name], [Description]) VALUES (42, N'KhachSan', N'Thiết lập thông tin khách sạn')
INSERT [dbo].[Permistion] ([IDPermistion], [Name], [Description]) VALUES (43, N'NhanVien', N'Quản lý, phần quyền nhân viên')
INSERT [dbo].[Permistion] ([IDPermistion], [Name], [Description]) VALUES (44, N'NhapKho', N'Nhập hàng hóa vào kho')
INSERT [dbo].[Permistion] ([IDPermistion], [Name], [Description]) VALUES (45, N'Phong', N'Thiết lập danh sách phòng')
INSERT [dbo].[Permistion] ([IDPermistion], [Name], [Description]) VALUES (46, N'QLHoaDon', N'Quản lý danh sách hóa đơn')
INSERT [dbo].[Permistion] ([IDPermistion], [Name], [Description]) VALUES (47, N'QLKho', N'Quản lý hàng hóa trong kho')
INSERT [dbo].[Permistion] ([IDPermistion], [Name], [Description]) VALUES (48, N'QLNhapKho', N'Quản lý lịch sử nhập kho')
INSERT [dbo].[Permistion] ([IDPermistion], [Name], [Description]) VALUES (49, N'ThuePhong', N'Cho phép đặt phòng ')
SET IDENTITY_INSERT [dbo].[Permistion] OFF
SET IDENTITY_INSERT [dbo].[PermistionAccount] ON 

INSERT [dbo].[PermistionAccount] ([IDPA], [IDPermistion], [IDAccount]) VALUES (1, 36, 3012)
INSERT [dbo].[PermistionAccount] ([IDPA], [IDPermistion], [IDAccount]) VALUES (2, 37, 3012)
INSERT [dbo].[PermistionAccount] ([IDPA], [IDPermistion], [IDAccount]) VALUES (3, 38, 3012)
INSERT [dbo].[PermistionAccount] ([IDPA], [IDPermistion], [IDAccount]) VALUES (4, 39, 3012)
INSERT [dbo].[PermistionAccount] ([IDPA], [IDPermistion], [IDAccount]) VALUES (5, 40, 3012)
INSERT [dbo].[PermistionAccount] ([IDPA], [IDPermistion], [IDAccount]) VALUES (6, 41, 3012)
INSERT [dbo].[PermistionAccount] ([IDPA], [IDPermistion], [IDAccount]) VALUES (7, 42, 3012)
INSERT [dbo].[PermistionAccount] ([IDPA], [IDPermistion], [IDAccount]) VALUES (8, 43, 3012)
INSERT [dbo].[PermistionAccount] ([IDPA], [IDPermistion], [IDAccount]) VALUES (9, 44, 3012)
INSERT [dbo].[PermistionAccount] ([IDPA], [IDPermistion], [IDAccount]) VALUES (10, 45, 3012)
INSERT [dbo].[PermistionAccount] ([IDPA], [IDPermistion], [IDAccount]) VALUES (11, 46, 3012)
INSERT [dbo].[PermistionAccount] ([IDPA], [IDPermistion], [IDAccount]) VALUES (12, 47, 3012)
INSERT [dbo].[PermistionAccount] ([IDPA], [IDPermistion], [IDAccount]) VALUES (13, 48, 3012)
INSERT [dbo].[PermistionAccount] ([IDPA], [IDPermistion], [IDAccount]) VALUES (14, 49, 3012)
SET IDENTITY_INSERT [dbo].[PermistionAccount] OFF
SET IDENTITY_INSERT [dbo].[Phong] ON 

INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (10, 7, 21, N'Ba101', 1, CAST(N'2018-07-01 16:03:17.230' AS DateTime), N'Ba101', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (11, 7, 21, N'Ba102', 1, CAST(N'2018-07-01 16:50:47.493' AS DateTime), N'Ba102', 37, 2, 0, 0)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (12, 7, 21, N'Ba103', 1, CAST(N'2018-07-11 03:37:42.047' AS DateTime), N'Ba103', 1, 2, 0, 0)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (13, 6, 21, N'Đôi104', 1, CAST(N'2018-07-11 03:31:23.617' AS DateTime), N'Đôi104', 2, 2, 0, 0)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (14, 6, 21, N'Đôi105', 1, CAST(N'2018-07-01 16:04:04.810' AS DateTime), N'Đôi105', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (15, 6, 21, N'Đôi106', 1, CAST(N'2018-07-01 16:04:11.043' AS DateTime), N'Đôi106', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (16, 5, 22, N'Đơn201', 1, CAST(N'2018-07-01 16:04:27.650' AS DateTime), N'Đơn201', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (17, 7, 22, N'Đơn202', 1, CAST(N'2018-07-01 16:04:36.397' AS DateTime), N'Đơn202', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (18, 7, 22, N'Đơn203', 1, CAST(N'2018-07-01 16:04:44.387' AS DateTime), N'Đơn203', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (19, 3, 22, N'VIP204', 1, CAST(N'2018-07-01 16:09:20.577' AS DateTime), N'VIP204', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (20, 7, 22, N'VIP205', 1, CAST(N'2018-07-01 16:09:28.217' AS DateTime), N'VIP205', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (21, 7, 22, N'VIP206', 1, CAST(N'2018-07-01 16:09:33.133' AS DateTime), N'VIP206', NULL, 2, 0, NULL)
SET IDENTITY_INSERT [dbo].[Phong] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([IDRole], [Name], [State], [Description], [Level]) VALUES (1, N'Admin', 1, N'Admin', 0)
SET IDENTITY_INSERT [dbo].[Role] OFF

ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([IDRole])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[ChiTieu]  WITH CHECK ADD  CONSTRAINT [FK_ChiTieu_Account] FOREIGN KEY([NguoiTao])
REFERENCES [dbo].[Account] ([IDAccount])
GO
ALTER TABLE [dbo].[ChiTieu] CHECK CONSTRAINT [FK_ChiTieu_Account]
GO
ALTER TABLE [dbo].[ChiTieu]  WITH CHECK ADD  CONSTRAINT [FK_ChiTieu_LoaiChiPhi] FOREIGN KEY([IDLoaiChiPhi])
REFERENCES [dbo].[LoaiChiPhi] ([IDLoaiChiPhi])
GO
ALTER TABLE [dbo].[ChiTieu] CHECK CONSTRAINT [FK_ChiTieu_LoaiChiPhi]
GO
ALTER TABLE [dbo].[DefaultPermistionRole]  WITH CHECK ADD  CONSTRAINT [FK_DefaultPermistionRole_Permistion] FOREIGN KEY([IDPermistion])
REFERENCES [dbo].[Permistion] ([IDPermistion])
GO
ALTER TABLE [dbo].[DefaultPermistionRole] CHECK CONSTRAINT [FK_DefaultPermistionRole_Permistion]
GO
ALTER TABLE [dbo].[DefaultPermistionRole]  WITH CHECK ADD  CONSTRAINT [FK_DefaultPermistionRole_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([IDRole])
GO
ALTER TABLE [dbo].[DefaultPermistionRole] CHECK CONSTRAINT [FK_DefaultPermistionRole_Role]
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD  CONSTRAINT [FK_DichVu_DonVi] FOREIGN KEY([IDDonVi])
REFERENCES [dbo].[DonVi] ([IDDonVi])
GO
ALTER TABLE [dbo].[DichVu] CHECK CONSTRAINT [FK_DichVu_DonVi]
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD  CONSTRAINT [FK_DichVu_LoaiDichVu] FOREIGN KEY([IDLoaiDichVu])
REFERENCES [dbo].[LoaiDichVu] ([IDLoaiDichVu])
GO
ALTER TABLE [dbo].[DichVu] CHECK CONSTRAINT [FK_DichVu_LoaiDichVu]
GO
ALTER TABLE [dbo].[DichVuBanLe]  WITH CHECK ADD  CONSTRAINT [FK_DichVuBanLe_DichVu] FOREIGN KEY([IDDichVu])
REFERENCES [dbo].[DichVu] ([IDDichVu])
GO
ALTER TABLE [dbo].[DichVuBanLe] CHECK CONSTRAINT [FK_DichVuBanLe_DichVu]
GO
ALTER TABLE [dbo].[DichVuBanLe]  WITH CHECK ADD  CONSTRAINT [FK_DichVuBanLe_HDBanLe] FOREIGN KEY([IDHoaDonBanLe])
REFERENCES [dbo].[HDBanLe] ([IDHoaDonBanLe])
GO
ALTER TABLE [dbo].[DichVuBanLe] CHECK CONSTRAINT [FK_DichVuBanLe_HDBanLe]
GO
ALTER TABLE [dbo].[DichVuSuDung]  WITH CHECK ADD  CONSTRAINT [FK_DichVuSuDung_ThuePhong] FOREIGN KEY([IDThuePhong])
REFERENCES [dbo].[ThuePhong] ([IDThuePhong])
GO
ALTER TABLE [dbo].[DichVuSuDung] CHECK CONSTRAINT [FK_DichVuSuDung_ThuePhong]
GO
ALTER TABLE [dbo].[DichVuSuDung]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_DichVu] FOREIGN KEY([IDDichVu])
REFERENCES [dbo].[DichVu] ([IDDichVu])
GO
ALTER TABLE [dbo].[DichVuSuDung] CHECK CONSTRAINT [FK_HangHoa_DichVu]
GO
ALTER TABLE [dbo].[HDBanLe]  WITH CHECK ADD  CONSTRAINT [FK_HDBanLe_Account] FOREIGN KEY([NVBanHang])
REFERENCES [dbo].[Account] ([IDAccount])
GO
ALTER TABLE [dbo].[HDBanLe] CHECK CONSTRAINT [FK_HDBanLe_Account]
GO
ALTER TABLE [dbo].[HDBanLe]  WITH CHECK ADD  CONSTRAINT [FK_HDBanLe_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[KhachHang] ([IDKhachHang])
GO
ALTER TABLE [dbo].[HDBanLe] CHECK CONSTRAINT [FK_HDBanLe_KhachHang]
GO
ALTER TABLE [dbo].[PermistionAccount]  WITH CHECK ADD  CONSTRAINT [FK_PermistionAccount_Account] FOREIGN KEY([IDAccount])
REFERENCES [dbo].[Account] ([IDAccount])
GO
ALTER TABLE [dbo].[PermistionAccount] CHECK CONSTRAINT [FK_PermistionAccount_Account]
GO
ALTER TABLE [dbo].[PermistionAccount]  WITH CHECK ADD  CONSTRAINT [FK_PermistionAccount_Permistion] FOREIGN KEY([IDPermistion])
REFERENCES [dbo].[Permistion] ([IDPermistion])
GO
ALTER TABLE [dbo].[PermistionAccount] CHECK CONSTRAINT [FK_PermistionAccount_Permistion]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_Account] FOREIGN KEY([IDNguoiNhap])
REFERENCES [dbo].[Account] ([IDAccount])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_Account]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_KhuVuc] FOREIGN KEY([IDKhuVuc])
REFERENCES [dbo].[KhuVuc] ([IDKhuVuc])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_KhuVuc]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_LoaiPhong] FOREIGN KEY([IDLoaiPhong])
REFERENCES [dbo].[LoaiPhong] ([IDLoaiPhong])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_LoaiPhong]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DichVu] FOREIGN KEY([IDDichVu])
REFERENCES [dbo].[DichVu] ([IDDichVu])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DichVu]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_PhieuNhap] FOREIGN KEY([IDPhieuNhap])
REFERENCES [dbo].[PhieuNhap] ([IDPhieuNhap])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_PhieuNhap]
GO
ALTER TABLE [dbo].[ThuePhong]  WITH CHECK ADD  CONSTRAINT [FK_ThuePhong_Account] FOREIGN KEY([NVThuTien])
REFERENCES [dbo].[Account] ([IDAccount])
GO
ALTER TABLE [dbo].[ThuePhong] CHECK CONSTRAINT [FK_ThuePhong_Account]
GO
ALTER TABLE [dbo].[ThuePhong]  WITH CHECK ADD  CONSTRAINT [FK_ThuePhong_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[KhachHang] ([IDKhachHang])
GO
ALTER TABLE [dbo].[ThuePhong] CHECK CONSTRAINT [FK_ThuePhong_KhachHang]
GO
ALTER TABLE [dbo].[ThuePhong]  WITH CHECK ADD  CONSTRAINT [FK_ThuePhong_Phong] FOREIGN KEY([IDPhong])
REFERENCES [dbo].[Phong] ([IDPhong])
GO
ALTER TABLE [dbo].[ThuePhong] CHECK CONSTRAINT [FK_ThuePhong_Phong]
GO
/****** Object:  StoredProcedure [dbo].[SP_DefaultPermistionRole_JoinAll]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DefaultPermistionRole_JoinAll]
AS BEGIN

SELECT  Permistion.Name AS PermistionName, Permistion.Description , Role.Name AS RoleName, IDDPR, Role.IDRole, Permistion.IDPermistion FROM dbo.Permistion 
JOIN dbo.Role ON 1=1 
LEFT JOIN dbo.DefaultPermistionRole 
	ON DefaultPermistionRole.IDRole = Role.IDRole 
	AND DefaultPermistionRole.IDPermistion = Permistion.IDPermistion
	WHERE State <> 0 OR State IS NULL
ORDER BY Permistion.IDPermistion

end




GO
/****** Object:  StoredProcedure [dbo].[SP_DichVuBanle_Insert]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROC [dbo].[SP_DichVuBanle_Insert]
@IDHoaDonBanLe  INT,
@IDDichVu  INT,
@SoLuong int,
@GiaTien  decimal
AS BEGIN

INSERT INTO dbo.DichVuBanLe

        ( IDHoaDonBanLe ,
          IDDichVu ,
          SoLuong ,
          GiaTien
        )
VALUES  ( @IDHoaDonBanLe , -- IDHoaDonBanLe - int
          @IDDichVu , -- IDDichVu - int
          @SoLuong , -- SoLuong - int
          @GiaTien  -- GiaTien - decimal
        )

UPDATE dbo.DichVu SET	 SoLuong = SoLuong - @SoLuong WHERE IDDichVu = @IDDichVu

END



GO
/****** Object:  StoredProcedure [dbo].[SP_DichVuSuDung_ByIDThuePhong]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DichVuSuDung_ByIDThuePhong]
@IDThuePhong INT
AS BEGIN

SELECT sd.SoLuong, sd.GiaTien, dv.Name AS DichVu_Name, dv.Code AS DichVu_Code,dv.GiaBan,donvi.Name AS DonVi_Name,donvi.Code AS DonVi_Code FROM dbo.DichVuSuDung sd
JOIN	dbo.DichVu dv ON dv.IDDichVu = sd.IDDichVu
JOIN dbo.DonVi donvi ON donvi.IDDonVi = dv.IDDonVi
WHERE IDThuePhong = @IDThuePhong

end



GO
/****** Object:  StoredProcedure [dbo].[SP_LoaiPhong_Copy]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROC [dbo].[SP_LoaiPhong_Copy]
@IDLoaiPhong_Cu INT,
@IDLoaiPhong_Moi INT
AS BEGIN

	UPDATE A
	SET	TGBatDauTinhTien = B.TGBatDauTinhTien
		, TGTre = B.TGTre
		, Gio_MinTG = B.Gio_MinTG
		, [Gio_GiaMinTG] = B.[Gio_GiaMinTG]
		, [Gio_MaxTG] = B.[Gio_MaxTG]
		, [Gio_Gia1h] = B.[Gio_Gia1h]
		, [Dem_Start] = B.[Dem_Start]
		, [Dem_End] = B.[Dem_End]
		, [Dem_GiaQuaDem] = B.[Dem_GiaQuaDem]
		, [Dem_TienVaoSom1h] = B.[Dem_TienVaoSom1h]
		, [Dem_MaxhVaoSom] = B.[Dem_MaxhVaoSom]
		, [Dem_TienRaMuon1h] = B.[Dem_TienRaMuon1h]
		, [Dem_MaxhRaMuon] = B.[Dem_MaxhRaMuon]
		, [NgayDem_MocChot] = B.[NgayDem_MocChot]
		, [NgayDem_Gia1NgayDem] = B.[NgayDem_Gia1NgayDem]
		, [NgayDem_TienVaoSom1h] = B.[NgayDem_TienVaoSom1h]
		, [NgayDem_TienRaMuon1h] = B.[NgayDem_TienRaMuon1h]
	FROM dbo.LoaiPhong B
		JOIN dbo.LoaiPhong A
		ON A.IDLoaiPhong = @IDLoaiPhong_Cu AND B.IDLoaiPhong = @IDLoaiPhong_Moi

END




GO
/****** Object:  StoredProcedure [dbo].[SP_PermistionAccount_ByIDAccount]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_PermistionAccount_ByIDAccount]
@IDAccount INT
AS BEGIN
SELECT Permistion.IDPermistion , Name,IDPA, @IDAccount AS IDAccount,Description FROM dbo.Permistion
LEFT JOIN dbo.PermistionAccount ON PermistionAccount.IDPermistion = Permistion.IDPermistion AND IDAccount = @IDAccount 
END



GO
/****** Object:  StoredProcedure [dbo].[SP_PermistionAccount_SetByDefault]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_PermistionAccount_SetByDefault]
@IDAccount INT AS BEGIN

DECLARE @IDRole INT = (SELECT IDRole FROM dbo.Account WHERE IDAccount=@IDAccount)

-- insert
INSERT INTO dbo.PermistionAccount ( IDPermistion, IDAccount )
SELECT b.IDPermistion, @IDAccount FROM (SELECT * FROM dbo.PermistionAccount WHERE IDAccount = @IDAccount) a
RIGHT JOIN (SELECT * FROM dbo.DefaultPermistionRole WHERE IDRole = @IDRole) b ON  b.IDPermistion = a.IDPermistion
WHERE a.IDPA IS NULL


--delete
DELETE dbo.PermistionAccount
FROM (SELECT * FROM dbo.PermistionAccount WHERE IDAccount = @IDAccount) a
LEFT JOIN (SELECT * FROM dbo.DefaultPermistionRole WHERE IDRole = @IDRole) b ON b.IDPermistion = a.IDPermistion
WHERE b.IDDPR IS NULL

END



GO
/****** Object:  StoredProcedure [dbo].[SP_Phong_ChuyenPhong]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Phong_ChuyenPhong]
@IDPhong_Cu INT,
@IDPhong_Moi INT,
@TienChuyenPhong DECIMAL,
@GhiChu NVARCHAR(2000),
@NVChoThue INT
AS BEGIN

	DECLARE @IDThuePhong INT = (SELECT IDThuePhong FROM	 dbo.Phong WHERE IDPhong = @IDPhong_Cu);

	UPDATE dbo.Phong SET Time = GETDATE(), Status = 20, IDThuePhong = @IDThuePhong WHERE IDPhong = @IDPhong_Moi;
	UPDATE dbo.Phong SET Time = GETDATE(), Status = 10, IDThuePhong = 1 WHERE IDPhong = @IDPhong_Cu;
	
	UPDATE dbo.ThuePhong SET 
		IDPhong = @IDPhong_Moi, 
		CheckIn = GETDATE(), 
		GhiChu = GhiChu + @GhiChu, 
		TienChuyenPhong = TienChuyenPhong + @TienChuyenPhong, 
		NVChoThue = NVChoThue
	WHERE IDThuePhong = @IDThuePhong

END




GO
/****** Object:  StoredProcedure [dbo].[SP_ResetDatabase]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ResetDatabase]
AS BEGIN

-- disable referential integrity
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL' 


EXEC sp_MSForEachTable 'DELETE FROM ?' 


-- enable referential integrity again 
EXEC sp_MSForEachTable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL' 


DBCC CHECKIDENT ('[Role]', RESEED, 0);


INSERT INTO dbo.Role
        ( Name, State, Description, Level )
VALUES  ( N'Admin', -- Name - nvarchar(50)
          1, -- State - tinyint
          N'Admin', -- Description - nvarchar(max)
          0  -- Level - int
          )

INSERT INTO dbo.Account
        ( Username ,
          Password ,
          FullName ,
          CMND ,
          Phone ,
          IDRole ,
          State ,
          Description ,
          Avatar ,
          Birthday ,
          QueQuan ,
          Address ,
          Email
        )
VALUES  ( N'admin' , -- Username - nvarchar(50)
          N'admin' , -- Password - nvarchar(50)
          N'admin' , -- FullName - nvarchar(50)
          N'' , -- CMND - nvarchar(50)
          N'' , -- Phone - nvarchar(50)
          1 , -- IDRole - int
          1 , -- State - tinyint
          N'admin' , -- Description - nvarchar(max)
          N'' , -- Avatar - nvarchar(500)
          GETDATE() , -- Birthday - date
          N'' , -- QueQuan - nvarchar(50)
          N'' , -- Address - nvarchar(500)
          N''  -- Email - nvarchar(50)
        )

		SET IDENTITY_INSERT [dbo].[LoaiDichVu] ON 

INSERT [dbo].[LoaiDichVu] ([IDLoaiDichVu], [Name], [Code], [State], [MoTa]) VALUES (7, N'Nước uống', N'NUOC', 1, N'')
INSERT [dbo].[LoaiDichVu] ([IDLoaiDichVu], [Name], [Code], [State], [MoTa]) VALUES (8, N'Thức ăn', N'THUC AN', 1, N'')
INSERT [dbo].[LoaiDichVu] ([IDLoaiDichVu], [Name], [Code], [State], [MoTa]) VALUES (9, N'Hàng hóa', N'HANG HOA', 1, N'')
SET IDENTITY_INSERT [dbo].[LoaiDichVu] OFF

		SET IDENTITY_INSERT [dbo].[DonVi] ON 

INSERT [dbo].[DonVi] ([IDDonVi], [Name], [Code], [State]) VALUES (7, N'Chai', N'Chai', 1)
INSERT [dbo].[DonVi] ([IDDonVi], [Name], [Code], [State]) VALUES (8, N'Gói', N'Gói', 1)
INSERT [dbo].[DonVi] ([IDDonVi], [Name], [Code], [State]) VALUES (9, N'Bao', N'Bao', 1)
SET IDENTITY_INSERT [dbo].[DonVi] OFF

SET IDENTITY_INSERT [dbo].[DichVu] ON 

INSERT [dbo].[DichVu] ([IDDichVu], [Name], [Code], [State], [IDLoaiDichVu], [SoLuong], [GiaBan], [IDDonVi], [HinhAnh]) VALUES (9, N'Nước sting', N'STING', NULL, 7, 0, CAST(15000 AS Decimal(18, 0)), 7, NULL)
INSERT [dbo].[DichVu] ([IDDichVu], [Name], [Code], [State], [IDLoaiDichVu], [SoLuong], [GiaBan], [IDDonVi], [HinhAnh]) VALUES (10, N'Mì tôm', N'MI TOM', NULL, 8, 0, CAST(10000 AS Decimal(18, 0)), 8, NULL)
INSERT [dbo].[DichVu] ([IDDichVu], [Name], [Code], [State], [IDLoaiDichVu], [SoLuong], [GiaBan], [IDDonVi], [HinhAnh]) VALUES (11, N'Thuốc lá 333', N'333', NULL, 9, 0, CAST(30000 AS Decimal(18, 0)), 8, NULL)
INSERT [dbo].[DichVu] ([IDDichVu], [Name], [Code], [State], [IDLoaiDichVu], [SoLuong], [GiaBan], [IDDonVi], [HinhAnh]) VALUES (12, N'Thuốc lá Vinataba', N'VINATABA', NULL, 9, 0, CAST(20000 AS Decimal(18, 0)), 8, NULL)
SET IDENTITY_INSERT [dbo].[DichVu] OFF

SET IDENTITY_INSERT [dbo].[InfoHotel] ON 

INSERT [dbo].[InfoHotel] ([IDInfoHotel], [Name], [Address], [Logo], [Phone], [Email]) VALUES (2, N'Khách sạn ROYAL HOTEL', N'Đường ABC, Hà Nội', NULL, N'0987654321 - 0842315697', N'royalhotel@gmail.com')
SET IDENTITY_INSERT [dbo].[InfoHotel] OFF
SET IDENTITY_INSERT [dbo].[KhuVuc] ON 

INSERT [dbo].[KhuVuc] ([IDKhuVuc], [Name], [Code], [State], [MoTa]) VALUES (21, N'Tầng 1', N'T1', 1, NULL)
INSERT [dbo].[KhuVuc] ([IDKhuVuc], [Name], [Code], [State], [MoTa]) VALUES (22, N'Tầng 2', N'T2', 1, NULL)
SET IDENTITY_INSERT [dbo].[KhuVuc] OFF

SET IDENTITY_INSERT [dbo].[LoaiPhong] ON 

INSERT [dbo].[LoaiPhong] ([IDLoaiPhong], [Name], [Code], [State], [GhiChu], [TGBatDauTinhTien], [TGTre], [Gio_MinTG], [Gio_GiaMinTG], [Gio_MaxTG], [Gio_Gia1h], [Dem_Start], [Dem_End], [Dem_GiaQuaDem], [Dem_TienVaoSom1h], [Dem_MaxhVaoSom], [Dem_TienRaMuon1h], [Dem_MaxhRaMuon], [NgayDem_MocChot], [NgayDem_Gia1NgayDem], [NgayDem_TienVaoSom1h], [NgayDem_TienRaMuon1h]) VALUES (3, N'Phòng VIP', N'VIP', 1, NULL, 10, 15, 2, CAST(30000 AS Decimal(18, 0)), 8, CAST(20000 AS Decimal(18, 0)), CAST(N'21:00:00' AS Time), CAST(N'10:00:00' AS Time), NULL, CAST(30000 AS Decimal(18, 0)), 2, CAST(20000 AS Decimal(18, 0)), 2, CAST(N'12:00:00' AS Time), NULL, CAST(20000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[LoaiPhong] ([IDLoaiPhong], [Name], [Code], [State], [GhiChu], [TGBatDauTinhTien], [TGTre], [Gio_MinTG], [Gio_GiaMinTG], [Gio_MaxTG], [Gio_Gia1h], [Dem_Start], [Dem_End], [Dem_GiaQuaDem], [Dem_TienVaoSom1h], [Dem_MaxhVaoSom], [Dem_TienRaMuon1h], [Dem_MaxhRaMuon], [NgayDem_MocChot], [NgayDem_Gia1NgayDem], [NgayDem_TienVaoSom1h], [NgayDem_TienRaMuon1h]) VALUES (4, N'Phòng VIP', N'VIP', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[LoaiPhong] ([IDLoaiPhong], [Name], [Code], [State], [GhiChu], [TGBatDauTinhTien], [TGTre], [Gio_MinTG], [Gio_GiaMinTG], [Gio_MaxTG], [Gio_Gia1h], [Dem_Start], [Dem_End], [Dem_GiaQuaDem], [Dem_TienVaoSom1h], [Dem_MaxhVaoSom], [Dem_TienRaMuon1h], [Dem_MaxhRaMuon], [NgayDem_MocChot], [NgayDem_Gia1NgayDem], [NgayDem_TienVaoSom1h], [NgayDem_TienRaMuon1h]) VALUES (5, N'Phòng đơn', N'Đơn', 1, NULL, 15, 15, 2, CAST(30000 AS Decimal(18, 0)), 8, CAST(20000 AS Decimal(18, 0)), CAST(N'21:00:00' AS Time), CAST(N'10:00:00' AS Time), NULL, CAST(30000 AS Decimal(18, 0)), 2, CAST(20000 AS Decimal(18, 0)), 2, CAST(N'12:00:00' AS Time), NULL, CAST(20000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[LoaiPhong] ([IDLoaiPhong], [Name], [Code], [State], [GhiChu], [TGBatDauTinhTien], [TGTre], [Gio_MinTG], [Gio_GiaMinTG], [Gio_MaxTG], [Gio_Gia1h], [Dem_Start], [Dem_End], [Dem_GiaQuaDem], [Dem_TienVaoSom1h], [Dem_MaxhVaoSom], [Dem_TienRaMuon1h], [Dem_MaxhRaMuon], [NgayDem_MocChot], [NgayDem_Gia1NgayDem], [NgayDem_TienVaoSom1h], [NgayDem_TienRaMuon1h]) VALUES (6, N'Phòng Đôi', N'Đôi', 1, NULL, 15, 15, 2, CAST(30000 AS Decimal(18, 0)), 8, CAST(20000 AS Decimal(18, 0)), CAST(N'21:00:00' AS Time), CAST(N'10:00:00' AS Time), NULL, CAST(30000 AS Decimal(18, 0)), 2, CAST(20000 AS Decimal(18, 0)), 2, CAST(N'12:00:00' AS Time), NULL, CAST(20000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[LoaiPhong] ([IDLoaiPhong], [Name], [Code], [State], [GhiChu], [TGBatDauTinhTien], [TGTre], [Gio_MinTG], [Gio_GiaMinTG], [Gio_MaxTG], [Gio_Gia1h], [Dem_Start], [Dem_End], [Dem_GiaQuaDem], [Dem_TienVaoSom1h], [Dem_MaxhVaoSom], [Dem_TienRaMuon1h], [Dem_MaxhRaMuon], [NgayDem_MocChot], [NgayDem_Gia1NgayDem], [NgayDem_TienVaoSom1h], [NgayDem_TienRaMuon1h]) VALUES (7, N'Phòng Ba', N'Ba', 1, NULL, 15, 15, 2, CAST(30000 AS Decimal(18, 0)), 8, CAST(20000 AS Decimal(18, 0)), CAST(N'21:00:00' AS Time), CAST(N'10:00:00' AS Time), NULL, CAST(30000 AS Decimal(18, 0)), 2, CAST(20000 AS Decimal(18, 0)), 2, CAST(N'12:00:00' AS Time), NULL, CAST(20000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[LoaiPhong] OFF
SET IDENTITY_INSERT [dbo].[Phong] ON 

INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (10, 7, 21, N'Ba101', 1, CAST(N'2018-07-01 16:03:17.230' AS DateTime), N'Ba101', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (11, 7, 21, N'Ba102', 1, CAST(N'2018-07-01 16:50:47.493' AS DateTime), N'Ba102', 37, 2, 0, 0)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (12, 7, 21, N'Ba103', 1, CAST(N'2018-07-01 16:50:31.383' AS DateTime), N'Ba103', 36, 2, 0, 0)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (13, 6, 21, N'Đôi104', 1, CAST(N'2018-07-01 16:03:54.160' AS DateTime), N'Đôi104', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (14, 6, 21, N'Đôi105', 1, CAST(N'2018-07-01 16:04:04.810' AS DateTime), N'Đôi105', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (15, 6, 21, N'Đôi106', 1, CAST(N'2018-07-01 16:04:11.043' AS DateTime), N'Đôi106', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (16, 5, 22, N'Đơn201', 1, CAST(N'2018-07-01 16:04:27.650' AS DateTime), N'Đơn201', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (17, 7, 22, N'Đơn202', 1, CAST(N'2018-07-01 16:04:36.397' AS DateTime), N'Đơn202', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (18, 7, 22, N'Đơn203', 1, CAST(N'2018-07-01 16:04:44.387' AS DateTime), N'Đơn203', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (19, 3, 22, N'VIP204', 1, CAST(N'2018-07-01 16:09:20.577' AS DateTime), N'VIP204', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (20, 7, 22, N'VIP205', 1, CAST(N'2018-07-01 16:09:28.217' AS DateTime), N'VIP205', NULL, 2, 0, NULL)
INSERT [dbo].[Phong] ([IDPhong], [IDLoaiPhong], [IDKhuVuc], [Name], [State], [Time], [Code], [IDThuePhong], [SoNguoiToiDa], [Status], [SoNguoiThue]) VALUES (21, 7, 22, N'VIP206', 1, CAST(N'2018-07-01 16:09:33.133' AS DateTime), N'VIP206', NULL, 2, 0, NULL)
SET IDENTITY_INSERT [dbo].[Phong] OFF

END




GO
/****** Object:  StoredProcedure [dbo].[SP_SanPham_Insert]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SanPham_Insert]
@IDDichVu int
,@IDPhieuNhap  int
,@SoLuong  int
,@GiaTien  decimal
AS BEGIN
INSERT INTO dbo.SanPham
        ( IDDichVu ,
          IDPhieuNhap ,
          SoLuong ,
          GiaTien
        )
VALUES  ( @IDDichVu , -- IDDichVu - int
          @IDPhieuNhap , -- IDPhieuNhap - int
          @SoLuong , -- SoLuong - int
          @GiaTien  -- GiaTien - decimal
        )

UPDATE dbo.DichVu SET SoLuong = SoLuong + @SoLuong WHERE IDDichVu = @IDDichVu

end



GO
/****** Object:  StoredProcedure [dbo].[SP_SetFullPermistionForAdmin]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SetFullPermistionForAdmin]
AS BEGIN

DECLARE @IDAccount INT = (SELECT TOP 1 IDAccount FROM dbo.Account JOIN dbo.Role ON Role.IDRole = Account.IDRole WHERE Name = N'Admin')
DECLARE @IDRole INT = (SELECT TOP 1 IDRole FROM dbo.Account)

INSERT INTO dbo.DefaultPermistionRole
        ( IDRole, IDPermistion )
SELECT @IDRole , IDPermistion FROM dbo.Permistion

EXEC dbo.SP_PermistionAccount_SetByDefault @IDAccount


END



GO
/****** Object:  StoredProcedure [dbo].[SP_ThuePhong_Insert]    Script Date: 2018-07-13 23:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ThuePhong_Insert]
@IDPhong INT,
@NVChoThue INT,
@IDKhachHang INT,
@SoNguoi int
AS BEGIN

--thêm thue phòng
DECLARE @INSERT TABLE(IDThuePhong INT, CheckIn DATETIME, IDPhong INT, SoNguoi INT)

INSERT INTO dbo.ThuePhong
        ( IDPhong ,
          CheckIn ,
          CheckOut ,
          SoGio ,
          TienPhong ,
          SoNguoi ,
          GhiChu ,
          PhuThu ,
          LiDoPhuThu ,
          GiamGia ,
          LiDoGiamGia ,
          TongThanhToan ,
          KhachThanhToan ,
          TienTraLai ,
          State ,
          NVChoThue ,
          LamTronGio ,
          NVThuTien ,
          IDKhachHang ,
          TienChuyenPhong
        )
OUTPUT Inserted.IDThuePhong
,Inserted.CheckIn 
,Inserted.IDPhong
,Inserted.SoNguoi
INTO @INSERT
VALUES  ( @IDPhong , -- IDPhong - int
          GETDATE() , -- CheckIn - datetime
          NULL , -- CheckOut - datetime
          0 , -- SoGio - time
          0 , -- TienPhong - decimal
          @SoNguoi , -- SoNguoi - int
          N'' , -- GhiChu - nvarchar(1000)
          0 , -- PhuThu - decimal
          N'' , -- LiDoPhuThu - nvarchar(1000)
          0 , -- GiamGia - decimal
          N'' , -- LiDoGiamGia - nvarchar(1000)
          0 , -- TongThanhToan - decimal
          0 , -- KhachThanhToan - decimal
          0 , -- TienTraLai - decimal
          1 , -- State - tinyint
          @NVChoThue , -- NVChoThue - int
          0 , -- LamTronGio - int
          NULL , -- NVThuTien - int
          @IDKhachHang , -- IDKhachHang - int
          0  -- TienChuyenPhong - decimal
        )

--update phòng
UPDATE dbo.Phong SET 
Status = 20,
IDThuePhong = [@INSERT].IDThuePhong,
[Time] = [@INSERT].CheckIn,
SoNguoiThue = [@INSERT].SoNguoi
FROM dbo.Phong phong
JOIN @INSERT ON [@INSERT].IDPhong = phong.IDPhong

END



GO
USE [master]
GO
ALTER DATABASE [HOTEL] SET  READ_WRITE 
GO
