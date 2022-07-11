USE [master]
GO
/****** Object:  Database [Manager_Users]    Script Date: 5/25/2022 11:03:27 PM ******/
CREATE DATABASE [Manager_Users]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Manager_Users', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Manager_Users.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Manager_Users_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Manager_Users_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Manager_Users] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Manager_Users].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Manager_Users] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Manager_Users] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Manager_Users] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Manager_Users] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Manager_Users] SET ARITHABORT OFF 
GO
ALTER DATABASE [Manager_Users] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Manager_Users] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Manager_Users] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Manager_Users] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Manager_Users] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Manager_Users] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Manager_Users] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Manager_Users] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Manager_Users] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Manager_Users] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Manager_Users] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Manager_Users] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Manager_Users] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Manager_Users] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Manager_Users] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Manager_Users] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Manager_Users] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Manager_Users] SET RECOVERY FULL 
GO
ALTER DATABASE [Manager_Users] SET  MULTI_USER 
GO
ALTER DATABASE [Manager_Users] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Manager_Users] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Manager_Users] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Manager_Users] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Manager_Users] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Manager_Users', N'ON'
GO
ALTER DATABASE [Manager_Users] SET QUERY_STORE = OFF
GO
USE [Manager_Users]
GO
/****** Object:  Table [dbo].[promotion]    Script Date: 5/25/2022 11:03:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[promotion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotion_history]    Script Date: 5/25/2022 11:03:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotion_history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[status] [nvarchar](512) NULL,
	[date_update] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_user]    Script Date: 5/25/2022 11:03:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_role] [nvarchar](256) NOT NULL,
	[decription] [nvarchar](512) NULL,
 CONSTRAINT [PK_role_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 5/25/2022 11:03:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](256) NOT NULL,
	[username] [nvarchar](256) NOT NULL,
	[password] [nvarchar](256) NOT NULL,
	[image] [nvarchar](256) NULL,
	[email] [nvarchar](256) NULL,
	[phone] [nvarchar](12) NULL,
	[role_id] [int] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[promotion] ON 

INSERT [dbo].[promotion] ([id], [userID], [promotion]) VALUES (1, 9, 4)
INSERT [dbo].[promotion] ([id], [userID], [promotion]) VALUES (8, 1007, 10)
INSERT [dbo].[promotion] ([id], [userID], [promotion]) VALUES (13, 1008, 5)
INSERT [dbo].[promotion] ([id], [userID], [promotion]) VALUES (15, 10, 5)
SET IDENTITY_INSERT [dbo].[promotion] OFF
GO
SET IDENTITY_INSERT [dbo].[promotion_history] ON 

INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (1, 1, N'null added  to the list', 1653292497413)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (2, 1, N'admin added xyz to the list', 1653293805810)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (3, 1, N'admin changed abc''s promotion to the list', 1653294989681)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (4, 1, N'admin has removed  abc from the list', 1653296077038)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (5, 1, N'admin has removed  abc5 from the list', 1653300969215)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (6, 1, N'admin changed admin''s promotion to the list', 1653301007093)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (7, 1, N'admin added abc10 to the list', 1653324975413)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (8, 1, N'admin changed alo''s promotion to the list', 1653324988613)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (9, 1, N'admin added abc12 to the list', 1653326279042)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (10, 1, N'admin added admin to the list', 1653357843125)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (11, 1, N'admin has removed  abc12 from the list', 1653357859700)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (12, 1, N'admin added alo to the list', 1653452774998)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (13, 1, N'admin has removed  alo from the list', 1653452867545)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (14, 1, N'admin has removed  abc10 from the list', 1653452893316)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (15, 1, N'admin added abc to the list', 1653453300413)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (16, 1, N'admin has removed  abc10 from the list', 1653453961225)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (17, 1, N'admin added abc11 to the list', 1653453994515)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (18, 1, N'admin changed abc11''s promotion to the list', 1653483746222)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (19, 10, N'admin2 added abc12 to the list', 1653490389137)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (20, 10, N'admin2 changed abc12''s promotion to the list', 1653490448885)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (21, 10, N'admin2 has removed  abc11 from the list', 1653490466347)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (22, 1, N'admin added admin2 to the list', 1653492606413)
SET IDENTITY_INSERT [dbo].[promotion_history] OFF
GO
SET IDENTITY_INSERT [dbo].[role_user] ON 

INSERT [dbo].[role_user] ([id], [name_role], [decription]) VALUES (1, N'admin', NULL)
INSERT [dbo].[role_user] ([id], [name_role], [decription]) VALUES (2, N'Phòng Nhân S?', NULL)
INSERT [dbo].[role_user] ([id], [name_role], [decription]) VALUES (1006, N'Phòng Kinh Doanh', N'')
INSERT [dbo].[role_user] ([id], [name_role], [decription]) VALUES (1007, N'hello', N'')
SET IDENTITY_INSERT [dbo].[role_user] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1, N'admin', N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', NULL, NULL, NULL, 1, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (7, N'abc', N'abc', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', NULL, NULL, NULL, 2, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (8, N'alo', N'alo', N'alo', N'alo', N'alo', N'alo', 1, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (9, N'abc5', N'abc3', N'597cd4440c04db870e9450eaaefad4a4a07e8d7d9a197635de720bc0c4703621', N'1-1473661316600.png', N'', N'', 1006, 0)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (10, N'admin2', N'admin2', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'iphone-13-pro-max-xanh-1-40141709818800.jpg', N'admin2', N'0123456789', 1, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1005, N'xyz', N'xyz', N'3608bca1e44ea6c4d268eb6db02260269892c0b42b86bbf1e77a6fa16c3c9282', N'31-5961152335400.png', N'', N'', 1006, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1006, N'abc8', N'abc8', N'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad', N'1-5811529288400.png', N'', N'0123456789', 1006, 0)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1007, N'abc10', N'abc10', N'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad', N'2-6043930990900.png', N'', N'', 2, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1008, N'abc11', N'abc11', N'c0f852a67830b3fb052513573b07057974eba4efd30675780affbc5ac374ae3c', N'1-7329677390200.png', N'', N'', 2, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1009, N'abc12', N'abc12', N'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad', N'33-7409713294500.png', N'', N'0123456789', 1007, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1010, N'admin2', N'admin2', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'', N'', N'', 1, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1011, N'admin', N'admin5', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'', N'admin', N'', 1, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1012, N'admin10', N'admin10', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'', N'', N'', 1, 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[promotion]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[promotion_history]  WITH CHECK ADD  CONSTRAINT [FK_promotion_history] FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[promotion_history] CHECK CONSTRAINT [FK_promotion_history]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [fk_id_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[role_user] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [fk_id_role]
GO
USE [master]
GO
ALTER DATABASE [Manager_Users] SET  READ_WRITE 
GO
