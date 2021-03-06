USE [master]
GO
/****** Object:  Database [WebsiteAdmission]    Script Date: 07/01/2019 00:22:01  ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 07/01/2019 00:22:02  ******/
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
/****** Object:  Table [dbo].[ParentCategory]    Script Date: 07/01/2019 00:22:02  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParentCategory](
	[ParentCatPath] [varchar](50) NOT NULL,
	[NameParentCat] [nvarchar](250) NOT NULL,
	[Position] [int] NOT NULL,
	[Status] [bit] NULL CONSTRAINT [DF_ParentCategory_Status]  DEFAULT ((0)),
 CONSTRAINT [PK__ParentCa__1544DF413F2565D4] PRIMARY KEY CLUSTERED 
(
	[ParentCatPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Post]    Script Date: 07/01/2019 00:22:02  ******/
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
/****** Object:  Table [dbo].[Privilege]    Script Date: 07/01/2019 00:22:02  ******/
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
/****** Object:  Table [dbo].[SlideImage]    Script Date: 07/01/2019 00:22:02  ******/
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
/****** Object:  Table [dbo].[SubCategory]    Script Date: 07/01/2019 00:22:02  ******/
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
	[Position] [int] NOT NULL,
	[ParentCategory_ParentCatPath] [varchar](50) NOT NULL,
 CONSTRAINT [PK__SubCateg__26BE5BF9B4322FF4] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 07/01/2019 00:22:02  ******/
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
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'gioi-thieu', N'GIỚI THIỆU', 2, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'hoc-tai-hce', N'HỌC TẠI HCE', 6, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'khoa', N'KHOA - NGÀNH ĐÀO TẠO', 4, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'tin-tuc', N'TIN TỨC - THÔNG BÁO', 3, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'trang-chu', N'TRANG CHỦ', 1, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'tu-van', N'TƯ VẤN', 5, 1)
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (1, N'Thông báo tuyển sinh đợt 2-2018 hệ văn bằng 2, liên thông từ cao đẳng lên Đại học', N'<p>Thông báo tuyển sinh đợt 2-2018 hệ văn bằng 2, liên thông từ cao đẳng lên Đại học</p><figure class="image ck-widget" contenteditable="false"><img src="/Content/images/posts/1/1_1.jpg"><figcaption class="ck-editor__editable ck-editor__nested-editable" contenteditable="true" data-placeholder="Enter image caption">anh dep</figcaption></figure>', N'1.png', NULL, CAST(N'2019-01-06 20:20:07.800' AS DateTime), CAST(N'2019-01-06 20:20:07.800' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (3, N'Danh sách thí sinh trúng tuyển hệ đại học chính quy năm 2018 vào Trường Đại học kinh tế Huế', N'<p><strong>Danh sách thí sinh trúng tuyển hệ đại học chính quy năm 2018 vào Trường Đại học kinh tế Huế</strong></p>', N'3.jpg', NULL, CAST(N'2019-01-06 20:20:23.267' AS DateTime), CAST(N'2019-01-06 20:20:23.267' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (4, N'Danh sách thí sinh trúng tuyển hệ đại học chính quy năm 2018 vào Trường Đại học kinh tế Huế', N'<p>temp</p>', N'4.png', NULL, CAST(N'2019-01-06 20:20:18.533' AS DateTime), CAST(N'2019-01-06 20:20:18.533' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (5, N'Thông báo về việc xét tuyển bổ sung đợt 1 vào đại học hệ chính quy năm 2018', N'<p><strong>Thông báo về việc xét tuyển bổ sung đợt 1 vào đại học hệ chính quy năm 2018</strong></p>', N'5.jpg', NULL, CAST(N'2019-01-06 20:20:13.560' AS DateTime), CAST(N'2019-01-06 20:20:13.560' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (6, N'Công bố thông tin mới nhất về thi, tuyển sinh', N'<p>Sau đó, chương trình sẽ tiếp tục diễn ra tại Trường ĐH Thủ Dầu Một (số 6 Trần Văn Ơn, Phú Hòa, TP Thủ Dầu Một, Bình Dương) lúc 14h cùng ngày.</p><p>Chương trình do báo Tuổi Trẻ, Vụ Giáo dục ĐH (Bộ GD-ĐT), Tổng cục Giáo dục nghề nghiệp (Bộ LĐ-TB&amp;XH) phối hợp tổ chức với sự đồng hành của Tập đoàn Vingroup.&nbsp;</p><p>Tại mỗi chương trình tư vấn còn có sự phối hợp tổ chức của sở GD-ĐT và tỉnh đoàn địa phương. Dự kiến hơn 3.000 học sinh, phụ huynh đến tham dự tại mỗi chương trình.</p><p>Trong hai buổi tư vấn đầu tiên này, đại diện Bộ GD-ĐT, các chuyên gia tư vấn cũng như đại diện các trường ĐH, CĐ sẽ công bố những thông tin mới nhất về kỳ thi THPT quốc gia năm 2019, đặc biệt là những điểm mới về đề thi, cách thức tính điểm xét tốt nghiệp, cách thức đăng ký xét tuyển, cách thức chọn ngành học phù hợp với năng lực và sở thích bản thân...</p><figure class="image ck-widget ck-widget_selected" contenteditable="false"><img src="/Content/images/posts/6/6_1.jpg"><figcaption class="ck-editor__editable ck-editor__nested-editable ck-placeholder" contenteditable="true" data-placeholder="Enter image caption"><br data-cke-filler="true"></figcaption></figure><div style="position: fixed; top: 0px; left: -9999px; width: 42px;">image widget</div>', N'6.jpg', NULL, CAST(N'2019-01-06 20:08:19.083' AS DateTime), CAST(N'2019-01-06 20:08:19.083' AS DateTime), 1, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (7, N'Học sinh có học lực giỏi mới được xét tuyển ngành y?', N'<p style="text-align:justify;"><strong>Dự kiến có học lực lớp 12 xếp loại giỏi mới được xét tuyển ngành y</strong></p><p style="text-align:justify;">Đây là một trong những thông tin đáng chú ý được đại diện Bộ GD-ĐT công bố tại chương trình tư vấn tuyển sinh - hướng nghiệp 2019 diễn ra sáng nay 6-1.</p><p style="text-align:justify;">Hơn 3.000 học sinh tỉnh Tây Ninh đang có mặt tại Trường CĐ Sư phạm Tây Ninh tham dự buổi tư vấn đầu tiên của chương trình tư vấn tuyển sinh - hướng nghiệp năm 2019.</p><p style="text-align:justify;">Chương trình do báo&nbsp;<i>Tuổi Trẻ</i>, Vụ Giáo dục đại học (Bộ GD-ĐT), Tổng cục Giáo dục nghề nghiệp (Bộ Lao động - thương binh và xã hội), Sở GD-ĐT Tây Ninh và Tỉnh đoàn Tây Ninh phối hợp tổ chức với sự đồng hành của Tập đoàn Vingroup.</p><p style="text-align:justify;"><strong>Đề thi chủ yếu nằm trong chương trình lớp 12</strong></p><p style="text-align:justify;">ThS Nguyễn Đức Trung - chuyên viên chính Vụ Giáo dục đại học, Bộ GD-ĐT - đã cung cấp những thông tin chung nhất về kỳ thi THPT quốc gia và tuyển sinh ĐH năm 2019.</p><p style="text-align:justify;">Ông Trung khẳng định: "Bộ GD-ĐT sẽ tiếp tục tổ chức kỳ thi THPT quốc gia năm 2019 theo hướng giữ ổn định về phương thức tổ chức như hai năm trước; đồng thời thực hiện một số điều chỉnh kỹ thuật trong quy trình tổ chức thi nhằm khắc phục các hạn chế, bất cập để đảm bảo tổ chức kỳ thi nghiêm túc, khách quan, an toàn".</p>', N'7.jpg', NULL, CAST(N'2019-01-06 20:10:32.947' AS DateTime), CAST(N'2019-01-06 20:10:32.947' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (8, N'Thông báo tuyển sinh HCE thông báo tuyển sinh đai học chính quy năm 2018 các thí sinh cập nhật', N'<figure class="image ck-widget ck-widget_selected" contenteditable="false"><img src="/Content/images/posts/8/8_1.jpg"><figcaption class="ck-editor__editable ck-editor__nested-editable" contenteditable="true" data-placeholder="Enter image caption"><br><br data-cke-filler="true"></figcaption></figure><p>HCE thông báo tuyển sinh đai học chính quy năm 2018 các thí sinh cập nhật</p>', N'8.jpg', NULL, CAST(N'2019-01-06 21:11:59.883' AS DateTime), CAST(N'2019-01-06 21:11:59.883' AS DateTime), NULL, 1, 19)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (9, N'Chương trình tuyển sinh đại học chính quy 2018', N'<p><strong>Chương trình tuyển sinh đại học chính quy 2018</strong><br><br><br data-cke-filler="true"></p><figure class="image ck-widget" contenteditable="false"><img src="/Content/images/posts/9/9_1.jpg"><figcaption class="ck-editor__editable ck-editor__nested-editable" contenteditable="true" data-placeholder="Enter image caption"><br><br data-cke-filler="true"></figcaption></figure><p>image widget</p>', N'9.jpg', NULL, CAST(N'2019-01-06 21:16:51.133' AS DateTime), CAST(N'2019-01-06 21:16:51.133' AS DateTime), NULL, 1, 19)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (10, N'Chương trình tiên tiến', N'<p>Chương trình tiên tiến</p><figure class="image ck-widget" contenteditable="false"><img src="/Content/images/posts/10/10_1.jpg"><figcaption class="ck-editor__editable ck-editor__nested-editable" contenteditable="true" data-placeholder="Enter image caption"><br><br data-cke-filler="true"></figcaption></figure><p>image widget</p>', N'10.jpg', NULL, CAST(N'2019-01-06 21:21:26.133' AS DateTime), CAST(N'2019-01-06 21:21:26.133' AS DateTime), NULL, 1, 7)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (11, N'Chương trình Rennes', N'<p>Chương trình Rennes</p><figure class="image ck-widget" contenteditable="false"><img src="/Content/images/posts/11/11_1.JPG"><figcaption class="ck-editor__editable ck-editor__nested-editable" contenteditable="true" data-placeholder="Enter image caption"><br><br data-cke-filler="true"></figcaption></figure><p>image widget</p>', N'11.JPG', NULL, CAST(N'2019-01-06 21:23:13.433' AS DateTime), CAST(N'2019-01-06 21:23:13.433' AS DateTime), NULL, 1, 7)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (12, N'Chương trình Taillaght', N'<figure class="image ck-widget ck-widget_selected" contenteditable="false"><img src="/Content/images/posts/12/12_1.jpg"><figcaption class="ck-editor__editable ck-editor__nested-editable" contenteditable="true" data-placeholder="Enter image caption"><br><br><br><br><br data-cke-filler="true"></figcaption></figure><p>Chương trình Taillaght</p>', N'12.jpg', NULL, CAST(N'2019-01-06 22:27:06.457' AS DateTime), CAST(N'2019-01-06 22:27:06.457' AS DateTime), NULL, 1, 7)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (13, N'Chọn Trường Đại học kinh tế Huế, tại sao?', N'<figure class="media ck-widget ck-widget_selected" contenteditable="false"><div class="ck-media__wrapper" data-oembed-url="https://youtu.be/FfYYTegj-Fo"><div style="position: relative; padding-bottom: 100%; height: 0; padding-bottom: 56.2493%;"><iframe src="https://www.youtube.com/embed/FfYYTegj-Fo" style="position: absolute; width: 100%; height: 100%; top: 0; left: 0;" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen=""></iframe></div></div></figure><div style="position: fixed; top: 0px; left: -9999px; width: 42px;">media widget</div>', N'', NULL, CAST(N'2019-01-06 23:02:02.093' AS DateTime), CAST(N'2019-01-06 23:02:02.093' AS DateTime), NULL, 1, 25)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (14, N'Học phải ngành, hành đúng nghề!', N'<figure class="image ck-widget ck-widget_selected" contenteditable="false"><img src="/Content/images/posts/14/14_1.jpg"><figcaption class="ck-editor__editable ck-editor__nested-editable" contenteditable="true" data-placeholder="Enter image caption"><br><br><br data-cke-filler="true"></figcaption></figure><div style="position: fixed; top: 0px; left: -9999px; width: 42px;">image widget</div>', N'', NULL, CAST(N'2019-01-06 23:01:31.883' AS DateTime), CAST(N'2019-01-06 23:01:31.883' AS DateTime), NULL, 1, 25)
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[Privilege] ON 

INSERT [dbo].[Privilege] ([PrivilegeID], [Name], [Description]) VALUES (1, N'Admin', N'Toàn quyền quản lý.')
INSERT [dbo].[Privilege] ([PrivilegeID], [Name], [Description]) VALUES (2, N'Supermode', N'Quản lí Mode và có thể thực hiện thêm, sửa và xóa bài của Mode')
INSERT [dbo].[Privilege] ([PrivilegeID], [Name], [Description]) VALUES (3, N'Mode', N'Cung cấp thông tin vể viết Post chỉ được thêm và sửa bài Post')
INSERT [dbo].[Privilege] ([PrivilegeID], [Name], [Description]) VALUES (4, N'User', NULL)
SET IDENTITY_INSERT [dbo].[Privilege] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (1, N'TIN TUYỂN SINH', N'_TrangChu_Row1', 2, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (2, N'Phương thức tuyển sinh', N'_TrangChu_Row2', 11, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (3, N'Nộp hồ sơ', N'_TrangChu_Row1', 5, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (4, N'Thi năng khiếu', N'_TrangChu_Row1', 6, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (5, N'Ngành tuyển sinh', N'_TrangChu_Row3', 7, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (6, N'Kết quả tuyển sinh', N'_TrangChu_Row1', 8, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (7, N'LIÊN KẾT ĐÀO TẠO', N'_TrangChu_Row3', 4, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (8, N'Thông tin cần biết', N'_TrangChu_Row1', 9, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (9, N'Học tại HCE', N'_TrangChu_Row1', 10, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (10, N'Khoa kinh tế chính trị', N'_TrangChu_Row1', 1, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (11, N'Khoa tài chính ngân hàng', N'_TrangChu_Row1', 2, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (12, N'Khoa kế toán kiểm toán', N'_TrangChu_Row1', 3, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (13, N'Khoa quản trị kinh doanh', N'_TrangChu_Row1', 4, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (14, N'Khoa kinh tế phát triển', N'_TrangChu_Row1', 5, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (15, N'Kế hoạch đầu tư', N'_TrangChu_Row1', 6, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (16, N'Khoa hệ thống thông tin kinh tế', N'_TrangChu_Row1', 7, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (17, N'Khoa hệ thống thông tin kinh tế', N'_TrangChu_Row1', 8, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (18, N'Về đại học kinh tế Huế', N'_TrangChu_Row1', 1, N'tu-van')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (19, N'TUYỂN SINH ĐẠI HỌC', N'_TrangChu_Row2', 3, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (20, N'Chương trình liên kết', N'_TrangChu_Row1', 3, N'tu-van')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (21, N'Tra cứu và đăng kí xét tuyển', N'_TrangChu_Row1', 4, N'tu-van')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (22, N'Tư vấn hướng nghiệp', N'_TrangChu_Row1', 5, N'tu-van')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (23, N'Tư vấn hướng nghiệp2', N'_TrangChu_Row1', 6, N'tu-van')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (24, N'Slides', N'_TrangChu_Slide', 1, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (25, N'Youtube', N'_TrangChu_Youtube', 12, N'trang-chu')
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
