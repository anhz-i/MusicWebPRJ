USE [PRJ301_SE1624]
GO
/****** Object:  Table [dbo].[albums_HE163253]    Script Date: 7/19/2022 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[albums_HE163253](
	[id] [int] NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[describe] [nvarchar](1000) NULL,
	[imgUrl] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favorite_HE163253]    Script Date: 7/19/2022 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favorite_HE163253](
	[userName] [nvarchar](100) NOT NULL,
	[songId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userName] ASC,
	[songId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[performedBy_HE163253]    Script Date: 7/19/2022 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[performedBy_HE163253](
	[songId] [int] NOT NULL,
	[singerId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[songId] ASC,
	[singerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[singers_HE163253]    Script Date: 7/19/2022 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[singers_HE163253](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[imgUrl] [nvarchar](200) NULL,
	[describe] [nvarchar](1000) NULL,
	[gender] [bit] NULL,
	[dob] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[songs_HE163253]    Script Date: 7/19/2022 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songs_HE163253](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[songUrl] [nvarchar](500) NOT NULL,
	[pubYear] [int] NULL,
	[authorName] [nvarchar](100) NULL,
	[lyrics] [nvarchar](2000) NULL,
	[albumId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_HE163253]    Script Date: 7/19/2022 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_HE163253](
	[userName] [nvarchar](100) NOT NULL,
	[fname] [nvarchar](50) NOT NULL,
	[lname] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](500) NULL,
	[imgUrl] [nvarchar](200) NULL,
	[pass] [nvarchar](50) NOT NULL,
	[role] [tinyint] NOT NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (1, N'Hương Mùa Hè', N'EP.02 - Hoàng Dũng, Suni Hạ Linh, Orange, V.A', N'poster1_ziou.jpg')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (3, N'Em Và Trịnh', N'Em Và Trịnh Original Soundtrack/ Vol.1', N'em-va-trinh-top-1-jpeg-1654694-7133-2145-1654694985.jpg')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (4, N'Ocean like me', N'Original Web Drama Soundtrack', N'ab67616d0000b273cb3c93f435f8157476e22cc7.jpg')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (5, N'Có Nhau Có Cả Thế Giới', N'Thanh Hà, Phương Uyên', N'486ae5d43431c2a752f5423c8ca4709f.jpg')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (6, N'The First Show', N'The First Show - Trịnh Thăng Bình', N'162270.jpg')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (8, N'Girls', N'(The 2nd Mini Album) - aespa', N'a599355988a9aff3f12332f704671777.jpg')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (9, N'Finally Enough Love', N'Madonna', N'Madonna - Finally Enough Love.jpg')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (10, N'Harry''s House', N'Harry Styles', N'Harry_Styles_-_Harry''s_House.jpg')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (18, N'V-POP 2022: Hot Comeback ', N'', N'Image__4_.jpg')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (19, N'K-Pop Daebak', N'', N'EXPLOSIONS-IN-THE-SKY-1-PHOTO-BY-Jared-Ryan-Rezel-Axel-Serik-and-Rueven-Tan.jpg')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (20, N'Nhạc Mới Phát Hành 2022 ', N'', N'maxresdefault.jpg')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (21, N'Summer Viral Hits 2022', N'', N'211213_r39542.webp')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (22, N'Tropical House Feelings', N'', N'Image__4_.jpg')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (23, N'100% Gây Nghiện', N'', N'default.jpg')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (24, N'Summer Boys ', N'', N'images.jpg')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (25, N'Hit-Maker Việt', N'', N'african-forum-on-music-480x480.jpg')
INSERT [dbo].[albums_HE163253] ([id], [name], [describe], [imgUrl]) VALUES (200, N'Viral Summer Hits ', N'', N'Ashvin-Harrison-Art-Music-Me-scaled.jpg')
GO
INSERT [dbo].[performedBy_HE163253] ([songId], [singerId]) VALUES (1, 1)
INSERT [dbo].[performedBy_HE163253] ([songId], [singerId]) VALUES (1, 3)
INSERT [dbo].[performedBy_HE163253] ([songId], [singerId]) VALUES (3, 4)
INSERT [dbo].[performedBy_HE163253] ([songId], [singerId]) VALUES (4, 2)
GO
INSERT [dbo].[singers_HE163253] ([id], [name], [imgUrl], [describe], [gender], [dob]) VALUES (1, N'Adele', N'482216347x.jpg', N'', 0, CAST(N'1990-12-28' AS Date))
INSERT [dbo].[singers_HE163253] ([id], [name], [imgUrl], [describe], [gender], [dob]) VALUES (2, N'katy perry', N'Image__4_.jpg', N'hello maii', 1, CAST(N'2022-07-11' AS Date))
INSERT [dbo].[singers_HE163253] ([id], [name], [imgUrl], [describe], [gender], [dob]) VALUES (3, N'miley cyrus', N'null', N'', 0, NULL)
INSERT [dbo].[singers_HE163253] ([id], [name], [imgUrl], [describe], [gender], [dob]) VALUES (4, N'taylor', N'shutterstock_1827102173-1.png', N'', 0, NULL)
INSERT [dbo].[singers_HE163253] ([id], [name], [imgUrl], [describe], [gender], [dob]) VALUES (15, N'dé', N'', N'', 1, CAST(N'2022-07-06' AS Date))
GO
INSERT [dbo].[songs_HE163253] ([id], [name], [songUrl], [pubYear], [authorName], [lyrics], [albumId]) VALUES (1, N'Ánh Sao Và Bầu Trời', N'AnhSaoVaBauTroi-TRI-7085073.mp3', 2010, N'NULL', N'NULL', 1)
INSERT [dbo].[songs_HE163253] ([id], [name], [songUrl], [pubYear], [authorName], [lyrics], [albumId]) VALUES (2, N'Baby có thấy em không', N'BabyCoThayEmKhong-MaiAmNhacFreaky-7486914.mp3', 0, N'null', N'null', 1)
INSERT [dbo].[songs_HE163253] ([id], [name], [songUrl], [pubYear], [authorName], [lyrics], [albumId]) VALUES (3, N'Du hành vào tâm trí', N'DuHanhVaoTamTri-GiGiHuongGiangKICM-7187402.mp3', NULL, NULL, NULL, NULL)
INSERT [dbo].[songs_HE163253] ([id], [name], [songUrl], [pubYear], [authorName], [lyrics], [albumId]) VALUES (4, N'Hai mươi hai (22)', N'HaiMuoiHai22-HuaKimTuyenAMEE-7231237.mp3', NULL, NULL, NULL, NULL)
INSERT [dbo].[songs_HE163253] ([id], [name], [songUrl], [pubYear], [authorName], [lyrics], [albumId]) VALUES (6, N'Simple Love', N'SimpleLove-GREYDDoanTheLan-7584568.mp3', 0, N'', N'', 1)
INSERT [dbo].[songs_HE163253] ([id], [name], [songUrl], [pubYear], [authorName], [lyrics], [albumId]) VALUES (7, N'Tìm', N'Tim-Orange-7584562.mp3', 2019, N'Hoàng Tôn, GREY-D (Đoàn Thế Lân)', N'Chiều hoàng hôn buông đang dần phai
Cô đơn lang thang trôi qua hết tháng ngày dài
Khi trong thâm tâm ta luôn biết chẳng có ai
Kề sát vai mỗi khi buồn vui đau đớn gì
Cuộc đời đã cho tôi niềm tin
Nhưng đôi khi mang luôn đi hết chẳng giữ gì
Lặng thầm nhìn về một hình bóng đã xa rồi, đã xa rồi
Để mình tôi lạnh đôi môi nhạt nhòa thôi

Rồi một mùa thu đã dần qua
Đông đến cùng ta
Mang những lạnh giá
Vì một người ra đi vội vã để tôi đi tìm
Trong đêm tôi vẫn đi tìm

Tìm hoài để thấy thấy để để thấy được tình yêu ấy ấy
Mãi vẫn mãi luôn còn trong tim này
Những ký ứ cấy vẫn trong tim này
Dù lòng vẫn biết biết biết vẫn biết ai chẳng hề nhớ
Nhớ nhớ nhớ đến yêu thương bao giờ
Nhưng con tim ấy vẫn luôn mong chờ

Ánh sáng xung quanh dần mờ
Có một người ngồi thẩn thơ
Nhớ nhớ nhung nhung đợi chờ
Với những hy vọng dù nhỏ bé
Nhưng vẫn sẽ hoá thành đôi cánh của loài chim
bay vút lên cao
Lặng thầm ôm bao yêu thương
Lang thang đại dương đi kiếm tìm
Càng vào sâu trong tâm tư
Em mới biết rằng em đang đắm chìm trong quá khứ
Còn nhiều điều em muốn giữ
Mà chẳng biết đang ở đâu

Chờ một cuộc tình đã mất từ lâu
Chờ một kỉ niệm đã lỡ nhạt màu
Còn lại điều gì khi kí ức đã vỡ tan
Heh yeah ih yeah ih yeah ih yeah
Từng ngày từng ngày trống vắng quanh hiu
(Lòng còn ngập tràn mênh mang nỗi nhớ)
Để rồi vẫn thấy luôn chơ vơ ta với ta
Heh eh yeah eh yeah eh yeah
Tìm hoài để thấy thấy để để thấy được tình yêu ấy ấy
Mãi vẫn mãi luôn còn trong tim này
Những ký ức ấy vẫn trong tim này
Dù lòng vẫn biết biết biết vẫn biết ai chẳng hề nhớ nhớ
Nhớ nhớ đến yêu thương bao giờ
Nhưng con tim ấy vẫn luôn mong chờ
Chờ ai hoo uh yeah
Chờ ai..', 1)
INSERT [dbo].[songs_HE163253] ([id], [name], [songUrl], [pubYear], [authorName], [lyrics], [albumId]) VALUES (10, N'''yêu yêu yêu'' mashup', N'yeuYeuYeuMashup-SuniHaLinhHoangDungTheVoiceGREYDDoanTheLanOrangeTDK-7584538.mp3', 2021, N'Rhymastic, JustaTee, Kimmese, Tiên Tiên, ViruSs', N'Cuz baby it’s always you-ooh-ooh
Ooh ooh-ooh-ooh-ooh
It''s always you-ooh-ooh
Ooh ooh-ooh-ooh-ooh
it’s always you-ooh-ooh
Ooh ooh-ooh-ooh-ooh
It''s always you
It’s always you

GREY-D:
Xin những bối rối này cứ thế lên ngôi
Xin con tim rẽ lối tìm giây phút nghẹn lời
Cho thêm chơi vơi,để những ánh mắt đôi môi,
Chạm nhau mang theo gọi mời

Hoàng Dũng:
Xin cho ta tan vào những đắm đuối miên man
Khi em ghé ngang đời chợt mang sắc hương thiên đàng
Và cho những ấm áp lại đến lấp kín nhân gian
Ngày ta yên vui cùng nàng
Hoo-ooh-oh-oh

TDK:
Nhẹ nhàng âu yếm giữa chốn mơ
Cùng tìm kiếm bao ý thơ
Để đắm say trong tiếng nhạc du dương
Hồn sa theo bước ta ngẩn ngơ
Dù ngàn kiếp ta vẫn chờ
Chỉ cần có phút giây này trao yêu thương

GREY-D & TDK:
Cuz baby it’s always you-ooh-ooh
Ooh ooh-ooh-ooh-ooh
It''s always you-ooh-ooh
Ooh ooh-ooh-ooh-ooh
it’s always you-ooh-ooh
Ooh ooh-ooh-ooh-ooh
It''s always you
It’s always you

Orange:
Lỡ buông lời yêu anh sợ anh xa lánh
Biết sao giờ vì chỉ thấy nắng trong tim mình
Say you do you do

Suni Hạ Linh:
Lỡ mai mình yêu nhau
Đừng cho em ngóng những trưa hẹn
Dù trời nắng hay mưa trên đầu

Orange:
Say you do say you do
say you do

GREY-D & TDK:
Người sẽ bên anh nhé
Chẳng bao giờ cách xa
Người sẽ bên anh mãi
Chẳng điều gì có thể sánh vai
Trái tim nay thề suốt kiếp
Mình bước tiếp tình yêu này sẽ thành câu
Nắng mưa nhuộm màu nối tiếp
Lời sẽ hết dù đâu ai biết được
Người chẳng bên ai khác
Đừng bao giờ đổi thay
Nhìn em “Yêu biết mấy!”
Mệnh đôi ta như trời với mây
Nắm tay em mặc váy cưới
Nguyện ước tiếp từ bây giờ đến về sau
Với anh khi này chỉ có
Dù sóng gió làm em vui mỗi ngày

GREY-D:
Ta-da-ta-da-da
Ta-da-da
Ta-da-da-da-Ta-da-da
Ta-da-da

GREY-D & Hoàng Dũng &TDK:
Ta-da-da-da-da
Ta-da-da
Ta-da-da', 1)
INSERT [dbo].[songs_HE163253] ([id], [name], [songUrl], [pubYear], [authorName], [lyrics], [albumId]) VALUES (16, N'Hương Mùa Hè ', N'HuongMuaHe-SuniHaLinhHoangDungTheVoice-7584571.mp3', 2022, N'GREY-D (Đoàn Thế Lân)', N'SUNI:
Bánh xe đạp lăn trong chiều,lăn theo chiều nắng tắt
Lá me phủ lên mặt đường, hương mùa hè đâu đây
Tóc anh màu nâu hơi đậm, đạp xe ngược chiều ah, tự nhiên tim lại bối rối ghê
Thế thôi mà bỗng chốc lại yêu khi mùa hè thơm hương

DŨNG:
Tình yêu ấy đến nhanh ơi là nhanh
Mùa hạ ấy của em với anh
Chẳng cần nói, chỉ nhìn trời xanh
Cảm xúc ấy ngân vang xung quanh

DŨNG & SUNI:
Sẽ luôn thầm nhớ đến lúc bên người
Mùa hạ rực sáng như cách em cười
Dù biết sẽ cách xa nhau
Vẫn cứ rong chơi mãi
Rất lâu thật lâu đến mãi sau này
Nhìn về lúc ấy vẫn thấy nhớ thương
Vì đã sống hết phút giây
Với trái tim nồng say

SUNI:
Cơn mưa hôm nay rơi nhẹ nhàng tí tách trên đường
Làm anh nhớ về ngày tháng đó khi ta chung hướng
Sáng sớm thức giấc nghe nhịp yêu thoáng bay trong sương
Chỉ muốn nói với anh biết bao lời thương thương

DŨNG:
Dịu dàng như vạt nắng vuốt nhẹ lên trên tóc mây này
Là cơn gió mát thơm khẽ lướt qua đôi bày tay ấy
Ngọt ngào như nụ hôn trao vội khi lá bay
Lưu hương trái cây

DŨNG & SUNI:
Sẽ luôn thầm nhớ đến lúc bên người
Mùa hạ rực sáng như cách em cười
Dù biết sẽ cách xa nhau
Vẫn cứ rong chơi mãi
Rất lâu thật lâu đến mãi sau này
Nhìn về lúc ấy vẫn thấy nhớ thương
Vì đã sống hết phút giây
Với trái tim nồng say

DŨNG:
Làm sao ta biết khoảnh khắc có nhau
Mùa hè ấy vương hoài đến mãi sau

DŨNG & SUNI:
Chỉ cần mình mãi được cùng bên nhau
Chẳng cần gì nữa đâu

SUNI:
Sẽ luôn thầm nhớ đến lúc bên người
Mùa hạ rực sáng như cách em cười
Dù biết sẽ cách xa nhau
Vẫn cứ rong chơi mãi
Rất lâu thật lâu đến mãi sau này

DŨNG & SUNI:
Nhìn về lúc ấy vẫn thấy nhớ thương
Vì đã sống hết phút giây
Với trái tim nồng say
Lalalalalalalalala
Lalalalallalalalala
Với trái tim nồng say', NULL)
INSERT [dbo].[songs_HE163253] ([id], [name], [songUrl], [pubYear], [authorName], [lyrics], [albumId]) VALUES (200, N'Ánh Sao Và Bầu Trời', N'AnhSaoVaBauTroi-TRI-7085073.mp3', 2000, N'', N'', NULL)
GO
INSERT [dbo].[users_HE163253] ([userName], [fname], [lname], [gender], [email], [phone], [address], [imgUrl], [pass], [role], [active]) VALUES (N'1', N'ko', N's', 1, N'hieu', N'', N'', N'26_gubar_music-videoSixteenByNineJumbo1600.jpg', N'2', 1, 0)
INSERT [dbo].[users_HE163253] ([userName], [fname], [lname], [gender], [email], [phone], [address], [imgUrl], [pass], [role], [active]) VALUES (N'2', N's', N's', 0, N'hi', N'q', N'q', N'', N'2', 1, 0)
INSERT [dbo].[users_HE163253] ([userName], [fname], [lname], [gender], [email], [phone], [address], [imgUrl], [pass], [role], [active]) VALUES (N'3', N'mai', N'Doe', 0, N'maintthe163253@fpt.edu.vn', N'q', N'q', N'', N'3', 1, 0)
INSERT [dbo].[users_HE163253] ([userName], [fname], [lname], [gender], [email], [phone], [address], [imgUrl], [pass], [role], [active]) VALUES (N'7777', N'mai', N'Doe', 0, N'maintthe163253@fpt.edu.vn', N'', N'', N'', N'7', 1, 0)
INSERT [dbo].[users_HE163253] ([userName], [fname], [lname], [gender], [email], [phone], [address], [imgUrl], [pass], [role], [active]) VALUES (N'a', N'ko', N's', 1, N'hieu', N'', N'', N'', N'000', 1, 0)
INSERT [dbo].[users_HE163253] ([userName], [fname], [lname], [gender], [email], [phone], [address], [imgUrl], [pass], [role], [active]) VALUES (N'admin', N'admin', N'admin', 1, N'admin@gmail.com', NULL, NULL, NULL, N'admin', 0, 1)
INSERT [dbo].[users_HE163253] ([userName], [fname], [lname], [gender], [email], [phone], [address], [imgUrl], [pass], [role], [active]) VALUES (N'lannt', N'lan', N'nguyen', 0, N'lan123@gmail.com', NULL, NULL, NULL, N'lan123', 1, 1)
INSERT [dbo].[users_HE163253] ([userName], [fname], [lname], [gender], [email], [phone], [address], [imgUrl], [pass], [role], [active]) VALUES (N'maintt', N'mai', N'nguyen', 0, N'mai123@gmail.com', N'0941166160', N'kim tan, lao cai', N'Harry_Styles_-_Harry''s_House.jpg', N'mai123', 1, 1)
GO
ALTER TABLE [dbo].[favorite_HE163253]  WITH CHECK ADD  CONSTRAINT [fk_sgId] FOREIGN KEY([songId])
REFERENCES [dbo].[songs_HE163253] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[favorite_HE163253] CHECK CONSTRAINT [fk_sgId]
GO
ALTER TABLE [dbo].[favorite_HE163253]  WITH CHECK ADD  CONSTRAINT [fk_uName] FOREIGN KEY([userName])
REFERENCES [dbo].[users_HE163253] ([userName])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[favorite_HE163253] CHECK CONSTRAINT [fk_uName]
GO
ALTER TABLE [dbo].[performedBy_HE163253]  WITH CHECK ADD  CONSTRAINT [fk_singerId] FOREIGN KEY([singerId])
REFERENCES [dbo].[singers_HE163253] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[performedBy_HE163253] CHECK CONSTRAINT [fk_singerId]
GO
ALTER TABLE [dbo].[performedBy_HE163253]  WITH CHECK ADD  CONSTRAINT [fk_songId] FOREIGN KEY([songId])
REFERENCES [dbo].[songs_HE163253] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[performedBy_HE163253] CHECK CONSTRAINT [fk_songId]
GO
ALTER TABLE [dbo].[songs_HE163253]  WITH CHECK ADD  CONSTRAINT [fk_albumid] FOREIGN KEY([albumId])
REFERENCES [dbo].[albums_HE163253] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[songs_HE163253] CHECK CONSTRAINT [fk_albumid]
GO
