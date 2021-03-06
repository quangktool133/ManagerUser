USE [Manager_Users]
GO
/****** Object:  Table [dbo].[promotion]    Script Date: 5/27/2022 12:50:29 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotion_history]    Script Date: 5/27/2022 12:50:29 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_user]    Script Date: 5/27/2022 12:50:29 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 5/27/2022 12:50:29 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[promotion] ON 

INSERT [dbo].[promotion] ([id], [userID], [promotion]) VALUES (7, 1013, 5)
INSERT [dbo].[promotion] ([id], [userID], [promotion]) VALUES (8, 1007, 5)
INSERT [dbo].[promotion] ([id], [userID], [promotion]) VALUES (9, 1008, 5)
SET IDENTITY_INSERT [dbo].[promotion] OFF
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
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (23, 1, N'admin added admin10 to the list', 1653586369177)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (24, 1, N'admin added test1 to the list', 1653586376731)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (25, 1, N'admin added test2 to the list', 1653586382229)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (26, 1, N'admin changed test2''s promotion to the list', 1653586697581)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (27, 1, N'admin has removed  test2 from the list', 1653586702498)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (28, 1, N'admin has removed  test1 from the list', 1653586791904)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (29, 1, N'admin added abc to the list', 1653586820698)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (30, 1, N'admin has removed  test1 from the list', 1653586825111)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (31, 1, N'admin added test2 to the list', 1653586910469)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (32, 1, N'admin added test4 to the list', 1653586916018)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (33, 1, N'admin added test to the list', 1653586920995)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (34, 1, N'admin has removed  test from the list', 1653586954153)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (35, 1, N'admin has removed  test from the list', 1653586958266)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (36, 1, N'admin has removed  test from the list', 1653586961050)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (37, 1, N'admin added abc10 to the list', 1653587200470)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (38, 1, N'admin added abc11 to the list', 1653587212044)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (39, 1, N'admin added test1 to the list', 1653587217623)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (40, 1, N'admin added test2 to the list', 1653587223854)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (41, 1, N'admin has removed  test1 from the list', 1653587235590)
INSERT [dbo].[promotion_history] ([id], [userId], [status], [date_update]) VALUES (42, 1, N'admin has removed  abc11 from the list', 1653587238630)
SET IDENTITY_INSERT [dbo].[promotion_history] OFF
SET IDENTITY_INSERT [dbo].[role_user] ON 

INSERT [dbo].[role_user] ([id], [name_role], [decription]) VALUES (1, N'admin', NULL)
INSERT [dbo].[role_user] ([id], [name_role], [decription]) VALUES (2, N'Phòng Nhân Sự', N'test')
INSERT [dbo].[role_user] ([id], [name_role], [decription]) VALUES (1006, N'Phòng Kinh Doanh', N'')
INSERT [dbo].[role_user] ([id], [name_role], [decription]) VALUES (1007, N'hello', N'')
INSERT [dbo].[role_user] ([id], [name_role], [decription]) VALUES (1008, N'new role', N'day la role test')
SET IDENTITY_INSERT [dbo].[role_user] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1, N'admin', N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', NULL, NULL, NULL, 1, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (7, N'abc', N'abc', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', NULL, NULL, NULL, 2, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (8, N'alo', N'alo', N'alo', N'alo', N'alo', N'alo', 1, 0)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (9, N'abc5', N'abc3', N'597cd4440c04db870e9450eaaefad4a4a07e8d7d9a197635de720bc0c4703621', N'1-1473661316600.png', N'', N'', 1006, 0)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (10, N'admin2', N'admin2', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'iphone-13-pro-max-xanh-1-40141709818800.jpg', N'admin2', N'0123456789', 1, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1005, N'xyz', N'xyz', N'3608bca1e44ea6c4d268eb6db02260269892c0b42b86bbf1e77a6fa16c3c9282', N'31-5961152335400.png', N'', N'', 1006, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1006, N'abc8', N'abc8', N'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad', N'1-5811529288400.png', N'', N'0123456789', 1006, 0)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1007, N'abc10', N'abc10', N'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad', N'2-6043930990900.png', N'', N'', 2, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1008, N'abc11', N'abc11', N'c0f852a67830b3fb052513573b07057974eba4efd30675780affbc5ac374ae3c', N'1-7329677390200.png', N'', N'', 2, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1009, N'abc12', N'abc12', N'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad', N'33-7409713294500.png', N'', N'0123456789', 1007, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1011, N'admin', N'admin5', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'', N'admin', N'', 1, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1012, N'admin10', N'admin10', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'', N'', N'', 1, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1013, N'test', N'test', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'', N'test', N'123', 1, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1014, N'test1', N'test1', N'96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', N'', N'test', N'123', 1008, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1015, N'test2', N'test2', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'', N'test2', N'123', 1, 1)
INSERT [dbo].[users] ([id], [fullname], [username], [password], [image], [email], [phone], [role_id], [status]) VALUES (1016, N'test4', N'test4', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'AC 1-301085545583500.png', N'test', N'123', 1008, 1)
SET IDENTITY_INSERT [dbo].[users] OFF
