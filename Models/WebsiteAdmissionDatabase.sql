USE [master]
GO
/****** Object:  Database [WebsiteAdmission]    Script Date: 29/12/2018 17:28:20  ******/
CREATE DATABASE [WebsiteAdmission]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebsiteAdmission', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WebsiteAdmission.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebsiteAdmission_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WebsiteAdmission_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebsiteAdmission] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebsiteAdmission].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebsiteAdmission] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebsiteAdmission] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebsiteAdmission] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebsiteAdmission] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebsiteAdmission] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebsiteAdmission] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebsiteAdmission] SET  MULTI_USER 
GO
ALTER DATABASE [WebsiteAdmission] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebsiteAdmission] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebsiteAdmission] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WebsiteAdmission] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WebsiteAdmission]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 29/12/2018 17:28:21  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](250) NOT NULL,
	[User_UserID] [int] NOT NULL,
	[Post_PostID] [int] NOT NULL,
 CONSTRAINT [PK__FeedBack__E2CB3867E74439FA] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParentCategory]    Script Date: 29/12/2018 17:28:21  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParentCategory](
	[ParentCatPath] [varchar](50) NOT NULL,
	[NameParentCat] [nvarchar](250) NOT NULL,
	[Position] [int] NULL CONSTRAINT [DF_ParentCategory_Position]  DEFAULT (ident_current('ParentCategory')),
	[Status] [bit] NULL CONSTRAINT [DF_ParentCategory_Status]  DEFAULT ((0)),
 CONSTRAINT [PK__ParentCa__1544DF413F2565D4] PRIMARY KEY CLUSTERED 
(
	[ParentCatPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Post]    Script Date: 29/12/2018 17:28:21  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Body] [ntext] NOT NULL,
	[CoverImage] [varchar](250) NULL,
	[Author] [nvarchar](250) NULL,
	[CreatedTime] [datetime] NULL CONSTRAINT [DF_Post_CreationTime]  DEFAULT (getdate()),
	[PublishedTime] [datetime] NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Post_Status]  DEFAULT ((0)),
	[User_UserID] [int] NOT NULL,
	[SubCategory_SubCategoryID] [int] NOT NULL,
 CONSTRAINT [PK__Post__AA1260385F5BE46D] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Privilege]    Script Date: 29/12/2018 17:28:21  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privilege](
	[PrivilegeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK__Privileg__B3E77E3C9FD3198A] PRIMARY KEY CLUSTERED 
(
	[PrivilegeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SlideImage]    Script Date: 29/12/2018 17:28:21  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SlideImage](
	[SlideImageID] [int] IDENTITY(1,1) NOT NULL,
	[Url] [varchar](250) NOT NULL,
	[Descri] [nvarchar](250) NULL,
 CONSTRAINT [PK__SlideIma__A93DC186AD16FF6A] PRIMARY KEY CLUSTERED 
(
	[SlideImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 29/12/2018 17:28:21  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[ViewName] [varchar](250) NOT NULL,
	[Position] [int] NULL CONSTRAINT [DF_SubCategory_Position]  DEFAULT (ident_current('SubCategory')),
	[ParentCategory_ParentCatPath] [varchar](50) NOT NULL,
 CONSTRAINT [PK__SubCateg__26BE5BF9B4322FF4] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 29/12/2018 17:28:21  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[PassWord] [varchar](50) NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Address] [nvarchar](4000) NOT NULL,
	[Status] [bit] NULL CONSTRAINT [DF_User_Status]  DEFAULT ((0)),
	[Privilege_PrivilegeID] [int] NOT NULL,
 CONSTRAINT [PK__User__1788CCAC928FA22C] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackID], [Content], [User_UserID], [Post_PostID]) VALUES (1, N'đăng kí nhập học ở đâu, học phí như thế nào', 3, 1)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [User_UserID], [Post_PostID]) VALUES (2, N'tại sao nên chonj đại học kinh tế huế', 4, 2)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [User_UserID], [Post_PostID]) VALUES (3, N'quy tắc học vụ của trường là gì', 3, 1)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [User_UserID], [Post_PostID]) VALUES (4, N'thông tin về học bổng của trường', 4, 2)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [User_UserID], [Post_PostID]) VALUES (5, N'các cuộc thi năng khiếu của trường', 4, 2)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'7', N'Test', 7, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'gioi-thieu', N'GIỚI THIỆU', 2, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'hoc-tai-hce', N'HỌC TẠI HCE', 6, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'khoa', N'KHOA - NGÀNH ĐÀO TẠO', 4, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'tin-tuc', N'TIN TỨC - THÔNG BÁO', 3, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'trang-chu', N'TRANG CHỦ', 1, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'tu-van', N'TƯ VẤN', 5, 1)
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (1, N'Đào tạo nhân lực chất lượng cao', N'Đào tạo nhân lực chất lượng cao và phát triển nhân tài từ học sinh,	từ đội ngũ công nhân-lao động thành phố, và cả nước; thực hiện nghiên	cứu ứng dụng, nghiên cứu khoa học ngày càng hiệu quả để góp phần phát	triển đất nước trong dài hạn; cam kết cống hiến ngày càng nhiều và hiệu	quả hơn cho sự nghiệp phát triển con người, sự nghiệp phát triển đất 	nước Việt Nam phồn vinh, ổn định và bền vững.', N'tb.png', N'hồng trinh', NULL, NULL, 1, 1, 5)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (2, N'Titile', N'Body', N'tb.png', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (3, N'Title', N'1', N'tb.png', N'3', CAST(N'2018-12-24 00:10:15.000' AS DateTime), CAST(N'2018-12-24 00:10:21.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (4, N'123213', N'213123', N'tb.png', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (5, N'123123', N'123213213', N'tb.png', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (6, N'fsdfsdf', N'sdfsdfsdf', N'tb.png', NULL, NULL, NULL, NULL, 1, 2)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (7, N'123123', N'asdasd', NULL, NULL, NULL, NULL, NULL, 1, 2)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (8, N'312312', N'3123', NULL, NULL, NULL, NULL, NULL, 1, 10)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (9, N'112312', N'123123', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (10, N'12312123', N'<p>asdasd</p><h1><strong>asdasd</strong></h1><p>asdsad</p><p>&nbsp;</p>', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (11, N'123123', N'dasdasdasd', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (12, N's', N'<p><br data-cke-filler="true"></p>', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (14, N's', N'<p>s</p>', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (15, N'title test', N'<p>tét</p>', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (16, N'té', N'<figure class="image ck-widget ck-widget_selected" contenteditable="false"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAMAAABrrFhUAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAACiFBMVEUAAAAfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxckfxcn///+ZKq3UAAAA1nRSTlMAAQMFAgQODEqFs9bw8fLqzqt5PgY2l+XahiExrvz++/33HAqK+e1lIsuqP+bNQPrTGy3ozBCpkkPnIMKYUSWxg/bYa6UH2Rf0zzNHCS5ET2RigH9oGUYfbpGvSUt83DoNRcEdFV6h4bJU76hTsI/jeAhWvAtvw3BfOdCsWddcwLUPjiTHTt9N4p1a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"><figcaption class="ck-editor__editable ck-editor__nested-editable ck-placeholder" contenteditable="true" data-placeholder="Enter image caption"><br data-cke-filler="true"></figcaption></figure><div style="position: fixed; top: 0px; left: -9999px; width: 42px;">image widget</div>', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (17, N's', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (18, N'ds', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (19, N's', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (20, N'asdsadas', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (21, N'asdsadas', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (22, N'5', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[Privilege] ON 

INSERT [dbo].[Privilege] ([PrivilegeID], [Name], [Description]) VALUES (1, N'Admin', N'Toàn quyền quản lý.')
INSERT [dbo].[Privilege] ([PrivilegeID], [Name], [Description]) VALUES (2, N'Supermode', N'Quản lí Mode và có thể thực hiện thêm, sửa và xóa bài của Mode')
INSERT [dbo].[Privilege] ([PrivilegeID], [Name], [Description]) VALUES (3, N'Mode', N'Cung cấp thông tin vể viết Post chỉ được thêm và sửa bài Post')
INSERT [dbo].[Privilege] ([PrivilegeID], [Name], [Description]) VALUES (4, N'User', NULL)
SET IDENTITY_INSERT [dbo].[Privilege] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (1, N'Thông báo tuyển sinh', N'_TrangChu_Row1', 1, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (2, N'Phương thức tuyển sinh', N'_TrangChu_Row2', 2, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (3, N'Nộp hồ sơ', N'_TrangChu_Row1', 3, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (4, N'Thi năng khiếu', N'_TrangChu_Row1', 4, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (5, N'Ngành tuyển sinh', N'_TrangChu_Row3', 5, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (6, N'Kết quả tuyển sinh', N'_TrangChu_Row1', 6, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (7, N'Liên kết đào tạo', N'_TrangChu_Row1', 7, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (8, N'Thông tin cần biết', N'_TrangChu_Row1', 8, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (9, N'Học tại HCE', N'_TrangChu_Row1', 9, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (10, N'Khoa kinh tế chính trị', N'_TrangChu_Row1', 10, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (11, N'Khoa tài chính ngân hàng', N'_TrangChu_Row1', 11, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (12, N'Khoa kế toán kiểm toán', N'_TrangChu_Row1', 12, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (13, N'Khoa quản trị kinh doanh', N'_TrangChu_Row1', 13, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (14, N'Khoa kinh tế phát triển', N'_TrangChu_Row1', 14, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (15, N'Kế hoạch đầu tư', N'_TrangChu_Row1', 15, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (16, N'Khoa hệ thống thông tin kinh tế', N'_TrangChu_Row1', 16, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (17, N'Khoa hệ thống thông tin kinh tế', N'_TrangChu_Row1', 17, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (18, N'Về đại học kinh tế Huế', N'_TrangChu_Row1', 18, N'tu-van')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (19, N'Tuyển sinh Đại học', N'_TrangChu_Row1', 19, N'tu-van')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (20, N'Chương trình liên kết', N'_TrangChu_Row1', 20, N'tu-van')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (21, N'Tra cứu và đăng kí xét tuyển', N'_TrangChu_Row1', 21, N'tu-van')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (22, N'Tư vấn hướng nghiệp', N'_TrangChu_Row1', 22, N'tu-van')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (23, N'Tư vấn hướng nghiệp2', N'_TrangChu_Row1', 23, N'tu-van')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (24, NULL, N'_TrangChu_Slide', 0, N'trang-chu')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Email], [Address], [Status], [Privilege_PrivilegeID]) VALUES (1, N'hongtrinh', N'12345', N'Nguyễn Thị Hồng Trinh', N'htrinhpadu@gmail.com', N'phú hòa phú yên', 1, 1)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Email], [Address], [Status], [Privilege_PrivilegeID]) VALUES (2, N'huynhnhi', N'12345', N'Hoàng Thị Huỳnh Nhi', N'nhi@gmail.com', N'đông hà quảng trị', 1, 2)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Email], [Address], [Status], [Privilege_PrivilegeID]) VALUES (3, N'trieuhuy', N'12345', N'Phan Mai Triều Huy', N'huy@gmail.com', N'hải phòng', 1, 3)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Email], [Address], [Status], [Privilege_PrivilegeID]) VALUES (4, N'namnguyen', N'12345', N'Đoàn Văn Nam', N'nam@gmail.com', N'hà tĩnh', 1, 3)
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Index [IX_ParentCategory_PositionUNIQUE]    Script Date: 29/12/2018 17:28:21  ******/
ALTER TABLE [dbo].[ParentCategory] ADD  CONSTRAINT [IX_ParentCategory_PositionUNIQUE] UNIQUE NONCLUSTERED 
(
	[Position] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubCategory_PositionUNIQUE]    Script Date: 29/12/2018 17:28:21  ******/
ALTER TABLE [dbo].[SubCategory] ADD  CONSTRAINT [IX_SubCategory_PositionUNIQUE] UNIQUE NONCLUSTERED 
(
	[Position] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_User] FOREIGN KEY([User_UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_FeedBack_User]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_SubCategory] FOREIGN KEY([SubCategory_SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_SubCategory]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([User_UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_ParentCategory] FOREIGN KEY([ParentCategory_ParentCatPath])
REFERENCES [dbo].[ParentCategory] ([ParentCatPath])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_ParentCategory]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Privilege] FOREIGN KEY([Privilege_PrivilegeID])
REFERENCES [dbo].[Privilege] ([PrivilegeID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Privilege]
GO
USE [master]
GO
ALTER DATABASE [WebsiteAdmission] SET  READ_WRITE 
GO
