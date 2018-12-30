USE [master]
GO
/****** Object:  Database [WebsiteAdmission]    Script Date: 30/12/2018 12:00:03  ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 30/12/2018 12:00:03  ******/
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
/****** Object:  Table [dbo].[ParentCategory]    Script Date: 30/12/2018 12:00:03  ******/
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
/****** Object:  Table [dbo].[Post]    Script Date: 30/12/2018 12:00:03  ******/
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
/****** Object:  Table [dbo].[Privilege]    Script Date: 30/12/2018 12:00:03  ******/
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
/****** Object:  Table [dbo].[SlideImage]    Script Date: 30/12/2018 12:00:03  ******/
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
/****** Object:  Table [dbo].[SubCategory]    Script Date: 30/12/2018 12:00:03  ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 30/12/2018 12:00:03  ******/
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
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (17, N's', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (18, N'ds', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (19, N's', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (20, N'asdsadas', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (21, N'asdsadas', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (22, N'5', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (23, N'2', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (24, N'ád', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (25, N'd', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (26, N'dsa', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (27, N'tét', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (28, N'2', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (29, N'3', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (30, N'3', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (32, N'3', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (33, N'3', N'temp', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (34, N'123', N'<figure class="image ck-widget ck-widget_selected" contenteditable="false"><img src="34_1.png"><figcaption class="ck-editor__editable ck-editor__nested-editable ck-placeholder" contenteditable="true" data-placeholder="Enter image caption"><br data-cke-filler="true"></figcaption></figure>', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (35, N'123123123123', N'<figure class="image ck-widget ck-widget_selected" contenteditable="false"><img src="~/Content/images/posts/35_1.png"><figcaption class="ck-editor__editable ck-editor__nested-editable ck-placeholder" contenteditable="true" data-placeholder="Enter image caption"><br data-cke-filler="true"></figcaption></figure><div style="position: fixed; top: 0px; left: -9999px; width: 42px;">image widget</div>', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (36, N'ádasdasd', N'<figure class="image ck-widget ck-widget_selected" contenteditable="false"><img src="/Content/images/posts/36_1.png"><figcaption class="ck-editor__editable ck-editor__nested-editable ck-placeholder" contenteditable="true" data-placeholder="Enter image caption"><br data-cke-filler="true"></figcaption></figure>', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (37, N'hâtf', N'<figure class="image ck-widget" contenteditable="false"><img src="/Content/images/posts/37/37_1.png"><figcaption class="ck-editor__editable ck-editor__nested-editable" contenteditable="true" data-placeholder="Enter image caption"><br><br data-cke-filler="true"></figcaption></figure><figure class="image ck-widget" contenteditable="false"><img src="/Content/images/posts/37/37_1.jpg"><figcaption class="ck-editor__editable ck-editor__nested-editable ck-placeholder ck-hidden" contenteditable="true" data-placeholder="Enter image caption"><br data-cke-filler="true"></figcaption></figure><p><br data-cke-filler="true"></p>', NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (38, N'2', N'temp', N'', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (39, N'asdasd', N'temp', N'', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (40, N'qweqwe', N'temp', N'', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (41, N'1231312', N'<p>123</p>', N'41.png', NULL, NULL, NULL, NULL, 1, 1)
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
