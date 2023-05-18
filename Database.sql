USE master;

IF EXISTS
(
    SELECT name
    FROM master.dbo.sysdatabases
    WHERE name = N'DashiCinema'
)
BEGIN
    ALTER DATABASE [DashiCinema] SET OFFLINE WITH ROLLBACK IMMEDIATE;
    ALTER DATABASE [DashiCinema] SET ONLINE;
    DROP DATABASE [DashiCinema];
END;
GO

CREATE DATABASE DashiCinema;
GO

USE DashiCinema;
GO

CREATE TABLE [USER]
(
    UserID INT IDENTITY(1, 1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    Email VARCHAR(50),
    Password VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Genre
(
    GenreID INT IDENTITY(1, 1) PRIMARY KEY,
    GenreName NVARCHAR(100) NOT NULL
);

CREATE TABLE Movie
(
    MovieID INT IDENTITY(1, 1) PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    Imageurl VARCHAR(420),
    ReleaseDate DATE NOT NULL,
    Director NVARCHAR(200),
    [Actor] NVARCHAR(200),
    [Length] INT NOT NULL,
    Sypnosis NVARCHAR(1000) NOT NULL,
);
GO

CREATE TABLE MovieGenres
(
    MovieID INT
        FOREIGN KEY REFERENCES dbo.Movie (MovieID),
    GenreID INT
        FOREIGN KEY REFERENCES dbo.Genre (GenreID),
    PRIMARY KEY (
                    MovieID,
                    GenreID
                )
);

CREATE TABLE Hall(
	HallNumber INT PRIMARY KEY
)

CREATE TABLE SeatInfo
(
   SeatID INT IDENTITY(1,1) PRIMARY KEY,
   SeatNumber INT,
   HallNumber INT FOREIGN KEY REFERENCES dbo.Hall(HallNumber)  
);

CREATE TABLE Showtime
(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    MovieID INT
        FOREIGN KEY REFERENCES dbo.Movie (MovieID),
    StartTime DATETIME NOT NULL,
    EndTime DATETIME NOT NULL,
	HallNumber INT FOREIGN KEY REFERENCES dbo.Hall(HallNumber)
);
GO

CREATE TABLE Ticket
(
    TicketID INT IDENTITY(1, 1) PRIMARY KEY,
    SeatID INT
        FOREIGN KEY REFERENCES dbo.SeatInfo (SeatID),
    ShowID INT
        FOREIGN KEY REFERENCES dbo.Showtime (id),
    UnitPrice MONEY NOT NULL,
);
GO

CREATE TABLE [Order]
(
    OrderID INT IDENTITY(1, 1) PRIMARY KEY,
    UserID INT
        FOREIGN KEY REFERENCES dbo.[USER] (UserID),
    OrderDate DATETIME DEFAULT GETDATE(),
    [Status] BIT NOT NULL
        DEFAULT 0
);
GO

CREATE TABLE OrderDetail
(
    OrderID INT
        FOREIGN KEY REFERENCES dbo.[Order] (OrderID) ON DELETE CASCADE,
    TicketID INT
        FOREIGN KEY REFERENCES dbo.Ticket (TicketID),
);
INSERT INTO dbo.Hall VALUES (1)
INSERT INTO dbo.Hall VALUES (2)
INSERT INTO dbo.Hall VALUES (3)
INSERT INTO dbo.Hall VALUES (4)


INSERT INTO SeatInfo
VALUES
(1, 1);
INSERT INTO SeatInfo
VALUES
(2, 1);
INSERT INTO SeatInfo
VALUES
(3, 1);
INSERT INTO SeatInfo
VALUES
(4, 1);
INSERT INTO SeatInfo
VALUES
(5, 1);
INSERT INTO SeatInfo
VALUES
(6, 1);
INSERT INTO SeatInfo
VALUES
(7, 1);
INSERT INTO SeatInfo
VALUES
(8, 1);
INSERT INTO SeatInfo
VALUES
(9, 1);
INSERT INTO SeatInfo
VALUES
(10, 1);
INSERT INTO SeatInfo
VALUES
(11, 1);
INSERT INTO SeatInfo
VALUES
(12, 1);
INSERT INTO SeatInfo
VALUES
(13, 1);
INSERT INTO SeatInfo
VALUES
(14, 1);
INSERT INTO SeatInfo
VALUES
(15, 1);
INSERT INTO SeatInfo
VALUES
(16, 1);
INSERT INTO SeatInfo
VALUES
(17, 1);
INSERT INTO SeatInfo
VALUES
(18, 1);
INSERT INTO SeatInfo
VALUES
(19, 1);
INSERT INTO SeatInfo
VALUES
(20, 1);
INSERT INTO SeatInfo
VALUES
(21, 1);
INSERT INTO SeatInfo
VALUES
(22, 1);
INSERT INTO SeatInfo
VALUES
(23, 1);
INSERT INTO SeatInfo
VALUES
(24, 1);
INSERT INTO SeatInfo
VALUES
(25, 1);
INSERT INTO SeatInfo
VALUES
(26, 1);
INSERT INTO SeatInfo
VALUES
(27, 1);
INSERT INTO SeatInfo
VALUES
(28, 1);
INSERT INTO SeatInfo
VALUES
(29, 1);
INSERT INTO SeatInfo
VALUES
(30, 1);
INSERT INTO SeatInfo
VALUES
(31, 1);
INSERT INTO SeatInfo
VALUES
(32, 1);
INSERT INTO SeatInfo
VALUES
(33, 1);
INSERT INTO SeatInfo
VALUES
(34, 1);
INSERT INTO SeatInfo
VALUES
(35, 1);
INSERT INTO SeatInfo
VALUES
(36, 1);
INSERT INTO SeatInfo
VALUES
(37, 1);
INSERT INTO SeatInfo
VALUES
(38, 1);
INSERT INTO SeatInfo
VALUES
(39, 1);
INSERT INTO SeatInfo
VALUES
(40, 1);
INSERT INTO SeatInfo
VALUES
(1, 2);
INSERT INTO SeatInfo
VALUES
(2, 2);
INSERT INTO SeatInfo
VALUES
(3, 2);
INSERT INTO SeatInfo
VALUES
(4, 2);
INSERT INTO SeatInfo
VALUES
(5, 2);
INSERT INTO SeatInfo
VALUES
(6, 2);
INSERT INTO SeatInfo
VALUES
(7, 2);
INSERT INTO SeatInfo
VALUES
(8, 2);
INSERT INTO SeatInfo
VALUES
(9, 2);
INSERT INTO SeatInfo
VALUES
(10, 2);
INSERT INTO SeatInfo
VALUES
(11, 2);
INSERT INTO SeatInfo
VALUES
(12, 2);
INSERT INTO SeatInfo
VALUES
(13, 2);
INSERT INTO SeatInfo
VALUES
(14, 2);
INSERT INTO SeatInfo
VALUES
(15, 2);
INSERT INTO SeatInfo
VALUES
(16, 2);
INSERT INTO SeatInfo
VALUES
(17, 2);
INSERT INTO SeatInfo
VALUES
(18, 2);
INSERT INTO SeatInfo
VALUES
(19, 2);
INSERT INTO SeatInfo
VALUES
(20, 2);
INSERT INTO SeatInfo
VALUES
(21, 2);
INSERT INTO SeatInfo
VALUES
(22, 2);
INSERT INTO SeatInfo
VALUES
(23, 2);
INSERT INTO SeatInfo
VALUES
(24, 2);
INSERT INTO SeatInfo
VALUES
(25, 2);
INSERT INTO SeatInfo
VALUES
(26, 2);
INSERT INTO SeatInfo
VALUES
(27, 2);
INSERT INTO SeatInfo
VALUES
(28, 2);
INSERT INTO SeatInfo
VALUES
(29, 2);
INSERT INTO SeatInfo
VALUES
(30, 2);
INSERT INTO SeatInfo
VALUES
(31, 2);
INSERT INTO SeatInfo
VALUES
(32, 2);
INSERT INTO SeatInfo
VALUES
(33, 2);
INSERT INTO SeatInfo
VALUES
(34, 2);
INSERT INTO SeatInfo
VALUES
(35, 2);
INSERT INTO SeatInfo
VALUES
(36, 2);
INSERT INTO SeatInfo
VALUES
(37, 2);
INSERT INTO SeatInfo
VALUES
(38, 2);
INSERT INTO SeatInfo
VALUES
(39, 2);
INSERT INTO SeatInfo
VALUES
(40, 2);
INSERT INTO SeatInfo
VALUES
(1, 3);
INSERT INTO SeatInfo
VALUES
(2, 3);
INSERT INTO SeatInfo
VALUES
(3, 3);
INSERT INTO SeatInfo
VALUES
(4, 3);
INSERT INTO SeatInfo
VALUES
(5, 3);
INSERT INTO SeatInfo
VALUES
(6, 3);
INSERT INTO SeatInfo
VALUES
(7, 3);
INSERT INTO SeatInfo
VALUES
(8, 3);
INSERT INTO SeatInfo
VALUES
(9, 3);
INSERT INTO SeatInfo
VALUES
(10, 3);
INSERT INTO SeatInfo
VALUES
(11, 3);
INSERT INTO SeatInfo
VALUES
(12, 3);
INSERT INTO SeatInfo
VALUES
(13, 3);
INSERT INTO SeatInfo
VALUES
(14, 3);
INSERT INTO SeatInfo
VALUES
(15, 3);
INSERT INTO SeatInfo
VALUES
(16, 3);
INSERT INTO SeatInfo
VALUES
(17, 3);
INSERT INTO SeatInfo
VALUES
(18, 3);
INSERT INTO SeatInfo
VALUES
(19, 3);
INSERT INTO SeatInfo
VALUES
(20, 3);
INSERT INTO SeatInfo
VALUES
(21, 3);
INSERT INTO SeatInfo
VALUES
(22, 3);
INSERT INTO SeatInfo
VALUES
(23, 3);
INSERT INTO SeatInfo
VALUES
(24, 3);
INSERT INTO SeatInfo
VALUES
(25, 3);
INSERT INTO SeatInfo
VALUES
(26, 3);
INSERT INTO SeatInfo
VALUES
(27, 3);
INSERT INTO SeatInfo
VALUES
(28, 3);
INSERT INTO SeatInfo
VALUES
(29, 3);
INSERT INTO SeatInfo
VALUES
(30, 3);
INSERT INTO SeatInfo
VALUES
(31, 3);
INSERT INTO SeatInfo
VALUES
(32, 3);
INSERT INTO SeatInfo
VALUES
(33, 3);
INSERT INTO SeatInfo
VALUES
(34, 3);
INSERT INTO SeatInfo
VALUES
(35, 3);
INSERT INTO SeatInfo
VALUES
(36, 3);
INSERT INTO SeatInfo
VALUES
(37, 3);
INSERT INTO SeatInfo
VALUES
(38, 3);
INSERT INTO SeatInfo
VALUES
(39, 3);
INSERT INTO SeatInfo
VALUES
(40, 3);
INSERT INTO SeatInfo
VALUES
(1, 4);
INSERT INTO SeatInfo
VALUES
(2, 4);
INSERT INTO SeatInfo
VALUES
(3, 4);
INSERT INTO SeatInfo
VALUES
(4, 4);
INSERT INTO SeatInfo
VALUES
(5, 4);
INSERT INTO SeatInfo
VALUES
(6, 4);
INSERT INTO SeatInfo
VALUES
(7, 4);
INSERT INTO SeatInfo
VALUES
(8, 4);
INSERT INTO SeatInfo
VALUES
(9, 4);
INSERT INTO SeatInfo
VALUES
(10, 4);
INSERT INTO SeatInfo
VALUES
(11, 4);
INSERT INTO SeatInfo
VALUES
(12, 4);
INSERT INTO SeatInfo
VALUES
(13, 4);
INSERT INTO SeatInfo
VALUES
(14, 4);
INSERT INTO SeatInfo
VALUES
(15, 4);
INSERT INTO SeatInfo
VALUES
(16, 4);
INSERT INTO SeatInfo
VALUES
(17, 4);
INSERT INTO SeatInfo
VALUES
(18, 4);
INSERT INTO SeatInfo
VALUES
(19, 4);
INSERT INTO SeatInfo
VALUES
(20, 4);
INSERT INTO SeatInfo
VALUES
(21, 4);
INSERT INTO SeatInfo
VALUES
(22, 4);
INSERT INTO SeatInfo
VALUES
(23, 4);
INSERT INTO SeatInfo
VALUES
(24, 4);
INSERT INTO SeatInfo
VALUES
(25, 4);
INSERT INTO SeatInfo
VALUES
(26, 4);
INSERT INTO SeatInfo
VALUES
(27, 4);
INSERT INTO SeatInfo
VALUES
(28, 4);
INSERT INTO SeatInfo
VALUES
(29, 4);
INSERT INTO SeatInfo
VALUES
(30, 4);
INSERT INTO SeatInfo
VALUES
(31, 4);
INSERT INTO SeatInfo
VALUES
(32, 4);
INSERT INTO SeatInfo
VALUES
(33, 4);
INSERT INTO SeatInfo
VALUES
(34, 4);
INSERT INTO SeatInfo
VALUES
(35, 4);
INSERT INTO SeatInfo
VALUES
(36, 4);
INSERT INTO SeatInfo
VALUES
(37, 4);
INSERT INTO SeatInfo
VALUES
(38, 4);
INSERT INTO SeatInfo
VALUES
(39, 4);
INSERT INTO SeatInfo
VALUES
(40, 4);
INSERT INTO dbo.Genre
VALUES
(N'Cao Bồi');
INSERT INTO dbo.Genre
VALUES
(N'Chiến Tranh');
INSERT INTO dbo.Genre
VALUES
(N'Gia Đình');
INSERT INTO dbo.Genre
VALUES
(N'Giả Tưởng');
INSERT INTO dbo.Genre
VALUES
(N'Giật Gân');
INSERT INTO dbo.Genre
VALUES
(N'Hài');
INSERT INTO dbo.Genre
VALUES
(N'Hành Động');
INSERT INTO dbo.Genre
VALUES
(N'Hình Sự');
INSERT INTO dbo.Genre
VALUES
(N'Hoạt Hình');
INSERT INTO dbo.Genre
VALUES
(N'Kinh Dị');
INSERT INTO dbo.Genre
VALUES
(N'Lãng Mạn');
INSERT INTO dbo.Genre
VALUES
(N'Lịch Sử');
INSERT INTO dbo.Genre
VALUES
(N'Ly Kì');
INSERT INTO dbo.Genre
VALUES
(N'Nhạc Kịch');
INSERT INTO dbo.Genre
VALUES
(N'Phiêu Lưu');
INSERT INTO dbo.Genre
VALUES
(N'Tài Liệu');
INSERT INTO dbo.Genre
VALUES
(N'Tâm Lý');
INSERT INTO dbo.Genre
VALUES
(N'Thần Thoại');
INSERT INTO dbo.Genre
VALUES
(N'Thể Thao');
INSERT INTO dbo.Genre
VALUES
(N'Tiểu Sử');
INSERT INTO dbo.Genre
VALUES
(N'Tình Cảm');
INSERT INTO dbo.Genre
VALUES
(N'Tội Phạm');

INSERT INTO dbo.Movie
VALUES
(   N'KHẮC TINH CỦA QUỶ',        -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/4/16/1200x1800_1681579561708.jpg',         -- Imageurl - varchar(420)
    '2023-4-12',  -- ReleaseDate - date
    N'Julius Avery',        -- Director - nvarchar(50)
    N'Franco Nero, Russell Crowe',        -- Actor - nvarchar(100)
    104, -- Length - int
    N'Lấy cảm hứng từ những hồ sơ có thật của Cha Gabriele Amorth, Trưởng Trừ Tà của Vatican (Russell Crowe, đoạt giải Oscar), bộ phim "The Pope''s Exorcist" theo chân Amorth trong cuộc điều tra về vụ quỷ ám kinh hoàng của một cậu bé và dần khám phá ra những bí mật hàng thế kỷ mà Vatican đã cố gắng giấu kín.'          -- Sypnosis - text
)

INSERT INTO dbo.MovieGenres
VALUES
(   1, -- MovieID - int
    10  -- GenreID - int
    )

INSERT INTO dbo.Movie
VALUES
(   N'CHUYỆN TÔI VÀ MA QUỶ THÀNH NGƯỜI MỘT NHÀ',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/3/28/marry-my-dead-body_1679989191948.jpg',        -- Imageurl - varchar(420)
    '2023-4-7', -- ReleaseDate - date
    N'Cheng Wei Hao',       -- Director - nvarchar(50)
    N'Lâm Bách Hồng, Hứa Quang Hán',       -- Actor - nvarchar(100)
    130,         -- Length - int
    N'Ming-Han là một cảnh sát nhiệt huyết. Một ngày nọ, trong quá trình truy bắt tội phạm cùng người đồng nghiệp xinh đẹp Zi-Qing, Ming-Han vô tình nhặt được một phong bao màu đỏ, và một nhóm người bất ngờ nhảy ra gọi anh là "con rể". Họ yêu cầu anh ta kết hôn với đứa con đã chết của họ. Ming-Han không thể chấp nhận quyết định này. Tuy nhiên, anh ấy sau đó anh ta gặp phải vô số sự cố xui xẻo. Điều đáng sợ hơn nữa là anh ta bắt đầu nhìn thấy người chồng ma Mao-Mao của mình. Vì vậy, Ming-Han đã tìm đến thầy để tìm cách. Để thoát khỏi Mao-Mao, Ming-Han không còn cách nào khác ngoài việc giúp anh ta thực hiện mọi mong muốn của mình. Nếu không, Mao-Mao sẽ theo anh ta mãi mãi.Đồng thời, Mao-Mao cũng đóng vai trò là đối tác của Ming-Han để giúp anh ta điều tra vụ buôn lậu ma túy. Một cuộc hành trình giả tưởng đầy tiếng cười và nước mắt giữa một người đàn ông thẳng thắn và một con ma đồng tính đã bắt đầu.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(2, 7)
INSERT INTO dbo.MovieGenres VALUES(2, 6)

INSERT INTO dbo.Movie
VALUES
(   N'PHIM ANH EM SUPER MARIO',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/3/31/300x450_1680235003011.jpg',        -- Imageurl - varchar(420)
    '2023-4-7', -- ReleaseDate - date
    N'Michael Jelenic, Aaron Horvath',       -- Director - nvarchar(50)
    N'Chris Pratt, Jack Black, Keegan-Michael Key, Anya Taylor-Joy',       -- Actor - nvarchar(100)
    93,         -- Length - int
    N'The Super Mario Bros. Movie xoay quanh cuộc phiêu lưu ở thế giới Vương quốc Nấm của anh em thợ sửa ống nước Mario và Luigi. Sau khi tình cờ bước tới vùng đất lạ từ một ống nước, Luigi đã bị chia tách với Mario và rơi vào tay quái vật rùa xấu xa Bowser, hắn đang âm mưu độc chiếm thế giới. Trong lúc cố gắng tìm kiếm người anh em của mình, Mario đã chạm mặt anh bạn nấm Toad và công chúa Peach. Từ đây họ sát cánh bên nhau trên hành trình ngăn chặn thế lực hắc ám.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(3, 9)
INSERT INTO dbo.MovieGenres VALUES(3, 15)

INSERT INTO dbo.Movie
VALUES
(   N'PHIM CÚ ÚP RỔ ĐẦU TIÊN',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/3/27/230317---the-first-slam-dunk---key-visual---ol---1_1679908002211.jpg',        -- Imageurl - varchar(420)
    '2023-4-14', -- ReleaseDate - date
    N'Yasuyuki Ebara, Takehiko Inoue',       -- Director - nvarchar(50)
    N'Yoshiaki Hasegawa, Masaya Fukunishi, Hōki Katsuhisa',       -- Actor - nvarchar(100)
    124,         -- Length - int
    N'The First Slam Dunk - phiên bản điện ảnh đầu tiên của loạt phim/truyện đình đám này sẽ do đích thân tác giả Inoue Takehiko chỉ đạo. Tuy nhiên lần này, câu chuyện sẽ được kể từ góc nhìn của chàng hậu vệ nhỏ con Miyagi Ryota, thay vì anh chàng tóc đỏ xốc nổi Hanamichi. Lấy bối cảnh trận đấu quan trọng giữa Shohoku và Sannoh - đội bóng top 10 toàn quốc, phim đan xen câu chuyện quá khứ của từng thành viên, đặc biệt là Ryota, cùng những diễn biến của trận đấu. Từ đó, tác giả Inoue Takehiko thành công khắc họa việc bóng rổ có ảnh hưởng to lớn như thế nào đến sự trưởng thành của mỗi thành viên Shohoku.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(4, 17)
INSERT INTO dbo.MovieGenres VALUES(4, 6)
INSERT INTO dbo.MovieGenres VALUES(4, 9)

INSERT INTO dbo.Movie
VALUES
(   N'ÂM VỰC CHẾT',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/4/8/sound-of-silence-4_1680939874843.jpg',        -- Imageurl - varchar(420)
    '2023-4-19', -- ReleaseDate - date
    N'Alessandro Antonaci',       -- Director - nvarchar(50)
    N'Penelope Sangiorgi, Lucia Caporaso',       -- Actor - nvarchar(100)
    93,         -- Length - int
    N'Sau cái chết của cha, Emma (Penelope Sangiorgi) vội vã bay từ New York về quê nhà ở Ý để lo hậu sự. Trong thời gian diễn ra tang lễ, Emma ở một mình trong căn nhà mà cha mẹ để lại. Lúc này, cô bị buộc phải đối mặt với một thực thể tà ác có khả năng kết nối thông qua một chiếc radio bị nguyền rủa. Để sống sót và bảo vệ những người mình yêu thương, Emma phải tìm ra bí mật đen tối ẩn sau chiếc radio ma quỷ kia…'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(5, 10)

INSERT INTO dbo.Movie
VALUES
(   N'CHÀNG TRAI XINH ĐẸP CỦA TÔI',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/4/13/my-beautiful-man-3_1681357225558.jpg',        -- Imageurl - varchar(420)
    '2023-4-14', -- ReleaseDate - date
    N'Sakai Mai',       -- Director - nvarchar(50)
    N'Yagi Yusei, Hagiwara Riku',       -- Actor - nvarchar(100)
    132,         -- Length - int
    N'Chàng Trai Xinh Đẹp Của Tôi xoay quanh chuyện tình thanh xuân tươi đẹp giữa 2 cậu bạn cùng lớp Hira và Kiyoi. Với tính cách khép kín, Hira hay trở thành mục tiêu bắt nạt, sai bảo của bạn bè cùng lớp. Trong khi đó, Kiyoi là mỹ nam hàng đầu với vẻ đẹp “như vị thần”, song cũng là người thường xuyên sai vặt Hira. Nhận ra mình thích Kiyoi từ cái nhìn đầu tiên, Hira làm mọi thứ vì cậu và mối quan hệ của cả hai dần thắt chặt sau khi Hira thấy Kiyoi tập nhảy để thi làm idol. Hira hứa giữ bí mật này cho Kiyoi và dần dà, những bức ảnh trong máy của Hira đều toàn là Kiyoi - người mà cậu tôn thờ và là “chàng trai xinh đẹp nhất”. Trong khi đó, Kiyoi cũng có tình cảm với Hira nhưng ngoài mặt vẫn lạnh lùng, miệng lại “hỗn”. Liệu cả hai sẽ tìm cách gì để bày tỏ lòng mình cho đối phương, và cuộc sống tình cảm của 2 con người trái dấu này có gì thú vị?'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(6, 21)

INSERT INTO dbo.Movie
VALUES
(   N'THE GHOST WITHIN',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/4/7/300x450_1680840617286.jpg',        -- Imageurl - varchar(420)
    '2023-4-14', -- ReleaseDate - date
    N'Lawrence Fowler',       -- Director - nvarchar(50)
    N'Tom Millen, Rebecca Phillipson, Michaela Longden',       -- Actor - nvarchar(100)
    102,         -- Length - int
    N'Đã 20 năm nhưng bí ẩn về cái ch.ế.t của người em gái vẫn chưa có lời giải đáp. Sự thật về bi kịch gia đình đã khiến thời khắc kinh hoàng lại xuất hiện đúng lúc đồng hồ điểm 09:09 mỗi đêm. Duy nhất một cơ hội để biết toàn bộ sự thật hoặc chỉ có thể để hận thù chôn vùi nó mãi mãi.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(7, 10)

INSERT INTO dbo.Movie
VALUES
(   N'AIR: THEO ĐUỔI MỘT HUYỀN THOẠI',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/4/13/air-5_1681358565090.jpg',        -- Imageurl - varchar(420)
    '2023-4-14', -- ReleaseDate - date
    N'Ben Affleck',       -- Director - nvarchar(50)
    N'Ben Affleck, Matt Damon, Jason Bateman',       -- Actor - nvarchar(100)
    112,         -- Length - int
    N'Từ đạo diễn đã từng đoạt giải thưởng Ben Affleck, AIR hé lộ mối quan hệ đột phá giữa huyền thoại Michael Jordan khi mới bắt đầu sự nghiệp và bộ phận bóng rổ còn non trẻ của Nike, đã làm thay đổi thế giới thể thao và văn hóa đương đại với thương hiệu Air Jordan. Câu chuyện cảm động này kể về sự đánh cược khi đặt lên bàn cân tình hình kinh doanh của cả công ty, tầm nhìn vĩ đại của một người mẹ biết giá trị và tài năng của con trai mình, và một siêu sao bóng rổ đã trở thành huyền thoại.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(8, 17)

INSERT INTO dbo.Movie
VALUES
(   N'RENFIELD TAY SAI CỦA QUỶ',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/4/7/300wx450h_1680836930537.jpg',        -- Imageurl - varchar(420)
    '2023-4-14', -- ReleaseDate - date
    N'Chris McKay',       -- Director - nvarchar(50)
    N'Nicolas Cage, Nicholas Hoult, Awkwafina',       -- Actor - nvarchar(100)
	92,         -- Length - int
    N'Renfield phát ốm vì mối quan hệ đồng phụ thuộc kéo dài hàng thế kỷ với Dracula. Với hy vọng tạo dựng một cuộc sống mới ở thế giới con người, tại New Orleans thời hiện đại, cuộc sống của Renfield trở nên phức tạp hơn khi anh phải lòng một cảnh sát giao thông. Mà trong lúc đó, anh ta vẫn phải đối phó với những yêu cầu, đòi hỏi quái lạ từ Dracula - một ông chủ thực sự đến từ địa ngục.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(9, 6)
INSERT INTO dbo.MovieGenres VALUES(9, 4)
INSERT INTO dbo.MovieGenres VALUES(9, 10)

INSERT INTO dbo.Movie
VALUES
(   N'TRI KỶ',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/3/9/300x450_1678335153444.jpg',        -- Imageurl - varchar(420)
    '2023-3-24', -- ReleaseDate - date
    N'Min Young Keun',       -- Director - nvarchar(50)
    N'Jeon So Nee, Kim Da Mi',       -- Actor - nvarchar(100)
    124,         -- Length - int
    N'Soulmate là câu chuyện về Mi So (Kim Da Mi thủ vai) và Ha Eun (Jeon So Nee thủ vai) trong một mối quan hệ chồng chéo chất chứa những hạnh phúc, nỗi buồn, rung động và cả biệt ly. Từ giây phút đầu tiên gặp nhau dưới mái trường tiểu học, giữa hai cô gái đã hình thành một sợi dây liên kết đặc biệt. Và khi Ham Jin Woo (Byun Woo Seok thủ vai) bước vào giữa cả hai, đó cũng là lúc những vết nứt trong mối quan hệ của Mi So và Ha Eun xuất hiện.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(10, 21)
INSERT INTO dbo.MovieGenres VALUES(10, 11)
INSERT INTO dbo.MovieGenres VALUES(10, 17)

INSERT INTO dbo.Movie
VALUES
(   N'NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/3/27/300x450_1679912896245.jpg',        -- Imageurl - varchar(420)
    '2023-4-21', -- ReleaseDate - date
    N'Jonathan Goldstein, John Francis Daley',       -- Director - nvarchar(50)
    N'Chris Pine, Mayte Michelle Rodríguez',       -- Actor - nvarchar(100)
    124,         -- Length - int
    N'Theo chân một tên trộm quyến rũ và một nhóm những kẻ bịp bợm nghiệp dư thực hiện vụ trộm sử thi nhằm lấy lại một di vật đã mất, nhưng mọi thứ trở nên nguy hiểm khó lường hơn bao giờ hết khi họ đã chạm trán nhầm người. Ngục Tối Và Rồng: Danh Dự Của Kẻ Trộm mang thế giới huyền ảo của trò chơi nhập vai huyền thoại lên màn ảnh rộng bằng một cuộc phiêu lưu tràn ngập các màn hành động đã mắt cùng màu sắc hài hước, vui nhộn.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(11, 15)
INSERT INTO dbo.MovieGenres VALUES(11, 4)
INSERT INTO dbo.MovieGenres VALUES(11, 7)

INSERT INTO dbo.Movie
VALUES
(   N'KHẾ ƯỚC',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/4/7/300wx450h_1680836893795.jpg',        -- Imageurl - varchar(420)
    '2023-4-21', -- ReleaseDate - date
    N'Guy Ritchie',       -- Director - nvarchar(50)
    N'Antony Starr, Alexander Ludwig, Jake Gyllenhaal',       -- Actor - nvarchar(100)
    120,         -- Length - int
    N'Bối cảnh phim Khế Ước diễn ra tại chiến trường Afghanistan. Trong nhiệm vụ cuối cùng, Trung sĩ John Kinley (Jake Gyllenhaal thủ vai) cùng đội với phiên dịch viên bản địa Ahmed (Dal Salim thủ vai). Khi đơn vị của họ bị phục kích, John và Ahmed là 2 người sống sót duy nhất. Bị kẻ địch truy đuổi, Ahmed liều mạng đưa John đang bị thương băng qua nhiều dặm đường địa hình khắc nghiệt đến nơi an toàn. Trở về Mỹ, John biết rằng Ahmed và gia đình không được cấp giấy thông hành tới Mỹ như đã hứa. Quyết tâm bảo vệ bạn mình và đền ơn cứu mạng, John trở lại chiến trường để giúp Ahmed và gia đình trước khi lực lượng phiến quân phát hiện ra họ.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(12, 7)
INSERT INTO dbo.MovieGenres VALUES(12, 17)

INSERT INTO dbo.Movie
VALUES
(   N'ĐẦU GẤU ĐỤNG ĐẦU ĐẤT',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/4/11/300x450_1681196696751.png',        -- Imageurl - varchar(420)
    '2023-4-21', -- ReleaseDate - date
    N'Park Sung Kwang',       -- Director - nvarchar(50)
    N'Yeom Hye Ran, Lee Yi Kyung, Park Sung Woong',       -- Actor - nvarchar(100)
    98,         -- Length - int
    N'Đầu Gấu Đụng Đầu Đất dựa trên câu chuyện thần thoại nổi tiếng tại Hàn Quốc về hai chú gấu sinh đôi hoá thành người sau khi ăn tỏi và ngải cứu trong 100 ngày. Chú gấu ăn tỏi trở thành Na Woong-nam, được một cặp vợ chồng nhà khoa học mang về nuôi nấng, tuy chỉ mới 25 tuổi nhưng lại sở hữu “giao diện” của một ông chú 52 với cái “đầu đất” ngây thơ, hiền lành. Trong khi đó, chú gấu ăn ngải cứu trở thành “đầu gấu” Lee Jeong-hak, được một tên trùm tổ chức tội phạm mang về nuôi và bị lợi dụng như một món “vũ khí” phòng vệ. 

Trong một tình huống bất đắc dĩ, Na Woong-nam đã trực tiếp đối đầu cùng anh em song sinh Lee Jeong-hak để ngăn chặn một vụ khủng bố virus có tầm lây lan mạnh. Sức mạnh của loài gấu bộc phát sẽ đẩy cuộc đụng độ của cặp gấu song sinh hoá người đi đến hồi kết nào?'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(13, 7)
INSERT INTO dbo.MovieGenres VALUES(13, 6)

INSERT INTO dbo.Movie
VALUES
(   N'MÈO SIÊU QUẬY Ở VIỆN BẢO TÀNG',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/4/13/img-1_1681380030925.jpg',        -- Imageurl - varchar(420)
    '2023-4-28', -- ReleaseDate - date
    N'Vasiliy Rovenskiy',       -- Director - nvarchar(50)
    N'Aleksandr Gavrilin, Polina Gagarina, Anton Eldarov',       -- Actor - nvarchar(100)
    120,         -- Length - int
    N'Chuyện phim xoay quanh chú mèo Vincent bắt tay cùng chú chuột Maurice để cố gắng thoát khỏi lũ lụt trong một chiếc đàn piano cũ. Một nhóm thủy thủ đã vô tình lấy được cây đàn và gửi nó đến viện bảo tàng. Tại đây, Vincent gặp một đội mèo ưu tú, làm nhiệm vụ bảo vệ những kiệt tác khỏi các loài gặm nhấm và sâu bọ khác trong nhiều năm qua. Mặc dù khao khát tìm được một mái ấm, Vincent buộc phải giấu tất cả về sự tồn tại của Maurice. 

Mọi chuyện trở nên phức tạp khi một trong những bức tranh vĩ đại nhất thế giới được đưa đến viện bảo tàng. Một thế lực bí ẩn đang cố gắng đánh cắp bức tranh, buộc Vincent, Maurice và hội mèo tinh hoa phải cùng nhau làm tất cả để bảo vệ kiệt tác này… Liệu Vincent và đồng đội của mình có đủ can đảm và trí thông minh để cứu lấy những kiệt tác của Da Vinci và bảo vệ danh tiếng cho bảo tàng không?'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(14, 15)
INSERT INTO dbo.MovieGenres VALUES(14, 9)
INSERT INTO dbo.MovieGenres VALUES(14, 6)

INSERT INTO dbo.Movie
VALUES
(   N'TRẠM TÀU MA',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/4/14/300x450_1681459257447.jpg',        -- Imageurl - varchar(420)
	'2023-4-27', -- ReleaseDate - date
    N'Jeong Yong Ki',       -- Director - nvarchar(50)
    N'Kim Jae Hyun, Kim Bo Ra',       -- Actor - nvarchar(100)
    90,         -- Length - int
    N'Lời đồn ma ám về nhà ga Oksu ngày càng nhiều khi những vụ án kinh hoàng liên tục xảy ra. Một đường ray cũ kỹ, một chiếc giếng bỏ hoang, những con số gây ám ảnh hay những vết thương kỳ dị trên thi thể người xấu số... Tất cả dẫn đến một bí mật đau lòng bị chôn vùi nhiều năm trước.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(15, 10)
INSERT INTO dbo.MovieGenres VALUES(15, 13)

INSERT INTO dbo.Movie
VALUES
(   N'VỆ BINH DẢI NGÂN HÀ 3',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/2/24/300x450_1677210047165.jpg',        -- Imageurl - varchar(420)
    '2023-5-5', -- ReleaseDate - date
    N'James Gunn',       -- Director - nvarchar(50)
    N'Bradley Cooper, Vin Diesel, Chris Pratt, Karen Gillan, Zoe Saldana, Dave Bautista',       -- Actor - nvarchar(100)
    126,         -- Length - int
    N'Trong phần phim thứ 3 về Vệ Binh Dải Ngân Hà, biệt đội mà chúng ta từng biết sẽ có một vài sự thay đổi. Peter Quill vẫn đang chìm đắm trong nỗi đau mất đi Gamora nhưng vẫn phải làm tròn trách nhiệm tập hợp cả đội để bảo vệ toàn vũ trụ. Họ phải đối mặt với một nhiệm vụ cam go và nếu như  thất bại, đội Vệ Binh có thể phải kết thúc sứ mệnh của họ.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(16, 7)
INSERT INTO dbo.MovieGenres VALUES(16, 15)
INSERT INTO dbo.MovieGenres VALUES(16, 6)

INSERT INTO dbo.Movie
VALUES
(   N'FAST & FURIOUS 10',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/2/14/tmp-w10gds-35978e81b8840468-unnamed-9-_1676385191286.webp',        -- Imageurl - varchar(420)
    '2023-5-19', -- ReleaseDate - date
    N'Louis Leterrier',       -- Director - nvarchar(50)
    N'Helen Mirren, Scott Eastwood, Vin Diesel, Mayte Michelle Rodríguez, Jason Momoa, Charlize Theron, Brie Larson, Jason Statham',       -- Actor - nvarchar(100)
    135,         -- Length - int
    N'Trong Fast Five (2011), Dom và nhóm của anh đã tiêu diệt trùm ma túy người Brazil Hernan Reyes ở Rio De Janeiro. Điều họ không biết là con trai của Reyes, Dante đã chứng kiến tất cả và dành 12 năm qua để lên một kế hoạch “hoàn hảo” sẽ khiến gia đình Dom phải trả giá đắt. Trải qua nhiều nhiệm vụ khó khăn tưởng chừng như bất khả thi nhưng Dom Toretto và gia đình của anh ấy đều đã vượt qua. Họ đánh bại mọi kẻ thù trên hành trình hơn 20 năm qua. Nhưng giờ đây, Dante được đánh giá là kẻ nguy hiểm nhất mà họ sẽ đối mặt: một mối đe dọa đáng sợ xuất hiện từ bóng tối của quá khứ, một kẻ thù đẫm máu, với quyết tâm phá tan gia đình và phá hủy mọi thứ mà Dom yêu thương mãi mãi.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(17, 7)
INSERT INTO dbo.MovieGenres VALUES(17, 22)

INSERT INTO dbo.Movie
VALUES
(   N'NÀNG TIÊN CÁ',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/4/11/the-little-mermaid-2023-teaser-poster_1681185929196.jpg',        -- Imageurl - varchar(420)
    '2023-5-26', -- ReleaseDate - date
    N'Rob Marshall, Blake Harris',       -- Director - nvarchar(50)
    N'Jonah Hauer-King, William Moseley, Poppy Drayton, Melissa McCarthy, Halle Bailey',       -- Actor - nvarchar(100)
    120,         -- Length - int
    N'“Nàng Tiên Cá” là câu chuyện được yêu thích về Ariel - một nàng tiên cá trẻ xinh đẹp và mạnh mẽ với khát khao phiêu lưu. Ariel là con gái út của Vua Triton và cũng là người ngang ngạnh nhất, nàng khao khát khám phá về thế giới bên kia đại dương. Trong một lần ghé thăm đất liền, nàng đã phải lòng Hoàng tử Eric bảnh bao. Trong khi tiên cá bị cấm tiếp xúc với con người, Ariel đã làm theo trái tim mình. Nàng đã thỏa thuận với phù thủy biển Ursula hung ác để cơ hội sống cuộc sống trên đất liền. Nhưng cuối cùng việc này lại đe dọa tới mạng sống của Ariel và vương miện của cha nàng.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(18, 17)
INSERT INTO dbo.MovieGenres VALUES(18, 4)
INSERT INTO dbo.MovieGenres VALUES(18, 18)
INSERT INTO dbo.MovieGenres VALUES(18, 15)

INSERT INTO dbo.Movie
VALUES
(   N'OÁN HỒN',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/4/13/oan-hon-du-kien-khoi-chieu-26-05-2023_1681379006801.jpg',        -- Imageurl - varchar(420)
    '2023-5-26', -- ReleaseDate - date
    N'Jamie Hooper',       -- Director - nvarchar(50)
    N'Sophie Thompson, Taliyah Blair, Riann Steele',       -- Actor - nvarchar(100)
    110,         -- Length - int
    N'Trải nghiệm thời thơ ấu đau thương, Anna trở về căn nhà xưa để chăm sóc người bà ốm yếu. Từ đó, những điều kỳ lạ bắt đầu xảy ra và các sự kiện kỳ quái dần xuất hiện cho đến khi Anna phát hiện ra mọi việc có liên quan đến một quá khứ bi thảm đã ám lên các thành viên trong gia đình. Điều gì sẽ xảy ra với Anna khi mọi oán niệm được ẩn giấu phía sau ngôi nhà và người bà kỳ lạ?'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(19, 10)
INSERT INTO dbo.MovieGenres VALUES(19, 17)

INSERT INTO dbo.Movie
VALUES
(   N'NGƯỜI NHỆN: DU HÀNH VŨ TRỤ NHỆN',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/4/4/sv2-intl-online-1080x1350-01_1680600731173.jpg',        -- Imageurl - varchar(420)
    '2023-6-1', -- ReleaseDate - date
    N'Justin K. Thompson, Kemp Powers, Joaquim Dos Santos',       -- Director - nvarchar(50)
    N'Oscar Isaac, Shameik Moore, Hailee Steinfeld, Jake Johnson',       -- Actor - nvarchar(100)
    130,         -- Length - int
    N'Miles Morales tái xuất trong phần tiếp theo của bom tấn hoạt hình từng đoạt giải Oscar - Spider-Man: Across the Spider-Verse. Sau khi gặp lại Gwen Stacy, chàng Spider-Man thân thiện đến từ Brooklyn phải du hành qua đa vũ trụ và gặp một nhóm Người Nhện chịu trách nhiệm bảo vệ các thế giới song song. Nhưng khi nhóm siêu anh hùng xung đột về cách xử lý một mối đe dọa mới, Miles buộc phải đọ sức với các Người Nhện khác và phải xác định lại ý nghĩa của việc trở thành một người hùng để có thể cứu những người cậu yêu thương nhất.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(20, 9)
INSERT INTO dbo.MovieGenres VALUES(20, 4)

INSERT INTO dbo.Movie
VALUES
(   N'TRANSFORMERS: QUÁI THÚ TRỖI DẬY',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/3/31/mv5bnznlyzrknwutmwjlys00njdiltgyyzqtzjzhythmmwnhzwexxkeyxkfqcgdeqxvyodk4otc3mty--v1-_1680257342289.jpg',        -- Imageurl - varchar(420)
    '2023-6-9', -- ReleaseDate - date
    N'Steven Caple Jr.',       -- Director - nvarchar(50)
    N'Ron Perlman, Dominique Fishback, Dương Tử Quỳnh',       -- Actor - nvarchar(100)
    120,         -- Length - int
    N'Transfromers: Rise Of The Beasts lấy bối cảnh vào năm 1994, khoảng thời gian tiếp sau khi Bumblebee xuất hiện. Như tựa đề đã thể hiện, phần phim này dựa theo bộ truyện Beast Wars cực kỳ ăn khách vào thập niên 1990. Đây cũng là lần đầu tiên, một nhóm robot mới xuất hiện, có khả năng biến mình thành động vật thay vì ôtô như trước đó.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(21, 4)
INSERT INTO dbo.MovieGenres VALUES(21, 7)

INSERT INTO dbo.Movie
VALUES
(   N'THE FLASH',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/3/28/theflash-flash-2023_1679973838201.jpg',        -- Imageurl - varchar(420)
    '2023-6-16', -- ReleaseDate - date
    N'James Gunn',       -- Director - nvarchar(50)
    N'Ben Affleck, Ezra Miller',       -- Actor - nvarchar(100)
    135,         -- Length - int
    N'Câu chuyện của Flash bắt đầu khi Barry Allen (Ezra Miller thủ vai) sử dụng siêu năng lực của mình để du hành thời gian nhằm thay đổi những sự kiện trong quá khứ. Nhưng khi nỗ lực cứu lấy gia đình mình vô tình thay đổi tương lai, Barry bị kẹt lại trong một thực tại, nơi tướng Zod tái xuất và đe dọa hủy diệt tất cả, nhưng không có bất cứ siêu anh hùng nào đứng ra giải cứu… Trừ khi Barry có thể thuyết phục một Batman rất khác và giải cứu một cư dân Kryptonian đang bị cầm tù… dẫu có thể đó không phải người mà anh thực sự tìm kiếm. Để giải cứu thế giới hiện tại cũng như trở lại tương lai mình từng biết, niềm hy vọng duy nhất của Barry là phải chạy đua vì cuộc đời mình. Vậy nhưng, sự hy sinh tuyệt đối đó có là đủ để đưa thế giới về lại như ban đầu?'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(22, 4)
INSERT INTO dbo.MovieGenres VALUES(22, 7)

INSERT INTO dbo.Movie
VALUES
(   N'XỨ SỞ CÁC NGUYÊN TỐ',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/3/29/elemental-teaser-poster-vietnam_1680061071873.jpg',        -- Imageurl - varchar(420)
    '2023-6-16', -- ReleaseDate - date
    N'Peter Sohn',       -- Director - nvarchar(50)
    N'Mamoudou Athie, Leah Lewis, Wendi McLendon-Covey',       -- Actor - nvarchar(100)
    100,         -- Length - int
    N'Bộ phim sẽ là hành trình xoay quanh mối quan hệ giữa cô nàng guyên tố lửa, Ember (do Lewis lồng tiếng) và chàng trai nguyên tố nước, Wade (do Athie lồng tiếng), những cá thể không thể chạm được đến nhau; nhưng cùng nhau khám phá xem họ có bao nhiêu điểm chung giống nhau.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(23, 15)
INSERT INTO dbo.MovieGenres VALUES(23, 6)
INSERT INTO dbo.MovieGenres VALUES(23, 9)

INSERT INTO dbo.Movie
VALUES
(   N'VÚ EM DẠY “YÊU”',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/3/28/poster-large_1679990721945.jpg',        -- Imageurl - varchar(420)
    '2023-6-23', -- ReleaseDate - date
    N'Genedy Tartakovsky',       -- Director - nvarchar(50)
    N'Ebon Moss-Bachrach, Natalie Morales, Jennifer Lawrence',       -- Actor - nvarchar(100)
    105,         -- Length - int
    N'rong phim, Jennifer Lawrence thủ vai một cô gái lẳng lơ, sống này đây mai đó với đủ loại công việc. Cho tới một ngày, một cặp vợ chồng trung niên tìm tới và thuê cô quyến rũ cậu con trai 19 tuổi của mình. Thế là hành trình của bà cô U40 đi cò cưa trai trẻ bắt đầu, đầy khó khăn với biết bao tình huống khó đỡ, éo le.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(24, 6)

INSERT INTO dbo.Movie
VALUES
(   N'INDIANA JONES VÀ VÒNG QUAY ĐỊNH MỆNH',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/3/28/mv5bytyyy2jkowmtmdnjzc00ztgzlwjhndatm2yzmwy3mjm2n2vjxkeyxkfqcgdeqxvymtkxnjuynq--v1-_1679975073236.jpg',        -- Imageurl - varchar(420)
    '2023-6-30', -- ReleaseDate - date
    N'James Mangold',       -- Director - nvarchar(50)
    N'Antonio Banderas, Harrison Ford, Mads Mikkelsen',       -- Actor - nvarchar(100)
    110,         -- Length - int
    N'Trong chuyến phiêu lưu cuối cùng này, Indiana Jones cùng con gái nuôi Helena sẽ phải đối đầu với những tên phát xít hiểm ác. Indiana Jones 5 cũng sẽ là phần phim cuối cùng mà Harrison Ford hóa thân thành nhà khảo cổ học Indiana Jones - vai diễn làm nên tên tuổi và gắn liền với ông trong suốt hơn 40 năm.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(25, 7)
INSERT INTO dbo.MovieGenres VALUES(25, 15)

INSERT INTO dbo.Movie
VALUES
(   N'BARBIE',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/3/28/mv5bmzq3ntrjzdutngvhys00owq0ltljmjetyzjkogjhywvinjixxkeyxkfqcgdeqxvymdm2ndm2mq--v1-_1679989184765.jpg',        -- Imageurl - varchar(420)
    '2023-7-21', -- ReleaseDate - date
    N'Greta Gerwig',       -- Director - nvarchar(50)
    N'Simu Liu, Emma Mackey, Ryan Gosling, Margot Robbie',       -- Actor - nvarchar(100)
    107,         -- Length - int
    N'Nàng Barbie là phim điện ảnh thuộc thể loại hài lãng mạn. Bộ phim do Greta Gerwig làm đạo diễn kiêm viết kịch bản với Noah Baumbach. Đây là tác phẩm điện ảnh đầu tiên về búp bê Barbie do người thật đóng, với sự kết hợp bởi nữ diên viên Margot Robbie và nam thần Ryan Gosling hóa thân thành 2 nhân vật chính Barbie và Ken.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(26, 4)
INSERT INTO dbo.MovieGenres VALUES(26, 15)
INSERT INTO dbo.MovieGenres VALUES(26, 6)

INSERT INTO dbo.Movie
VALUES
(   N'BLUE BEETLE',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/4/4/mv5bmjy4oda0zwmtngy2oc00njuxlthiogqtnjayzjdhnjmyzwy4xkeyxkfqcgdeqxvyodk4otc3mty--v1-_1680580348614.jpg',        -- Imageurl - varchar(420)
    '2023-8-18', -- ReleaseDate - date
    N'Angel Manuel Soto',       -- Director - nvarchar(50)
    N'Xolo Maridueña, Bruna Marquezine, George Lopez',       -- Actor - nvarchar(100)
    120,         -- Length - int
    N'Xoay quanh thế hệ thứ 3 của siêu anh hùng này - anh chàng vừa tốt nghiệp Jamie Reyes. Anh trở về nhà với tràn trề niềm tin và hy vọng về tương lai, để rồi nhận ra quê nhà đã thay đổi rất nhiều so với trước đây. Khi tìm kiếm mục đích sống trên thế giới này, Jamie đối mặt với bước ngoặt cuộc đời khi anh nhận ra mình sở hữu một di sản cổ đại của công nghệ sinh học ngoài hành tinh: Scarab. Khi Scarab chọn Jamie trở thành vật chủ, anh được ban tặng một bộ áo giáp với siêu sức mạnh đáng kinh ngạc không ai có thể lường trước. Số phận của Jamie hoàn toàn thay đổi khi giờ đây, anh đã là siêu anh hùng Blue Beetle.'         -- Sypnosis - text
    )
INSERT INTO dbo.MovieGenres VALUES(27, 4)
INSERT INTO dbo.MovieGenres VALUES(27, 15)
INSERT INTO dbo.MovieGenres VALUES(27, 7)

INSERT INTO dbo.Movie
VALUES
(   N'Quỷ Lùn Tinh Nghịch: Đồng Tâm Hiệp Nhạc',       -- Title - nvarchar(100)
    'https://cdn.galaxycine.vn/media/2023/3/29/mv5bmgjkyjbmowytmmnlyy00yzdllwi5zdqtytnkyzblnzbioty0xkeyxkfqcgdeqxvymta5odeyntc5--v1-fmjpg-ux1000-_1680062908492.jpg',        -- Imageurl - varchar(420)
    '2023-11-17', -- ReleaseDate - date
    N'Tim Heitz, Walt Dohrn',       -- Director - nvarchar(50)
    N'Anna Kendrick, Zooey Deschanel, Daveed Diggs',       -- Actor - nvarchar(100)
    120,         -- Length - int
    N'John Dory cùng với bốn người anh em khác của Branch đã từng là một ban nhạc nam nổi tiếng, kể cả Poppy cũng đã vô cùng yêu mến - BroZone. BroZone tan rã khi Branch vẫn còn là một đứa bé, và gia đình cũng cứ như vậy mà tan theo. Branch không hề gặp lại họ kể từ đó, và những người này cũng trở thành “đã từng” là anh trai của Branch. Nhưng khi John đề nghị Branch về việc tìm lại các anh em để có thể tiếp tục cùng nhau làm một ban nhạc như xưa, cùng với sự hào hứng của Poppy, anh đã bất đắ dĩ đồng ý. Ba chú Troll, cùng với sự trợ giúp của Tí Kim Cương, cùng nhau lên đường thực hiện chuyến phiêu lưu âm nhạc đầy cảm xúc, tràn trề hi vọng về một cuộc sum họp gia đình tuyệt với nhất.'         -- Sypnosis - text
  )
INSERT INTO dbo.MovieGenres VALUES(28, 6)
INSERT INTO dbo.MovieGenres VALUES(28, 9)

INSERT INTO dbo.Showtime
VALUES
(   1,         -- MovieID - int
    '20230424 07:00:00 AM', -- StartTime - datetime
    '20230424 08:30:00 AM', -- EndTime - datetime
    1          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   2,         -- MovieID - int
    '20230424 07:00:00 AM', -- StartTime - datetime
    '20230424 08:30:00 AM', -- EndTime - datetime
    2          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   3,         -- MovieID - int
    '20230424 07:00:00 AM', -- StartTime - datetime
    '20230424 08:30:00 AM', -- EndTime - datetime
    3          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   4,         -- MovieID - int
    '20230424 07:00:00 AM', -- StartTime - datetime
    '20230424 08:30:00 AM', -- EndTime - datetime
    4          -- HallNumber - int
    )

INSERT INTO dbo.Showtime
VALUES
(   5,         -- MovieID - int
    '20230424 08:30:00 AM', -- StartTime - datetime
    '20230424 10:00:00 AM', -- EndTime - datetime
    1          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   6,         -- MovieID - int
    '20230424 08:30:00 AM', -- StartTime - datetime
    '20230424 10:00:00 AM', -- EndTime - datetime
    2          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   7,         -- MovieID - int
    '20230424 08:30:00 AM', -- StartTime - datetime
    '20230424 10:00:00 AM', -- EndTime - datetime
    3          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   8,         -- MovieID - int
    '20230424 08:30:00 AM', -- StartTime - datetime
    '20230424 10:00:00 AM', -- EndTime - datetime
    4          -- HallNumber - int
    )

INSERT INTO dbo.Showtime
VALUES
(   1,         -- MovieID - int
    '20230424 10:00:00 AM', -- StartTime - datetime
    '20230424 11:30:00 AM', -- EndTime - datetime
    1          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   2,         -- MovieID - int
    '20230424 10:00:00 AM', -- StartTime - datetime
    '20230424 11:30:00 AM', -- EndTime - datetime
    2          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   3,         -- MovieID - int
    '20230424 10:00:00 AM', -- StartTime - datetime
    '20230424 11:30:00 AM', -- EndTime - datetime
    3          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   4,         -- MovieID - int
    '20230424 10:00:00 AM', -- StartTime - datetime
    '20230424 11:30:00 AM', -- EndTime - datetime
    4          -- HallNumber - int
    )

INSERT INTO dbo.Showtime
VALUES
(   5,         -- MovieID - int
    '20230424 10:00:00 AM', -- StartTime - datetime
    '20230424 11:30:00 AM', -- EndTime - datetime
    1          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   6,         -- MovieID - int
    '20230424 10:00:00 AM', -- StartTime - datetime
    '20230424 11:30:00 AM', -- EndTime - datetime
    2          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   7,         -- MovieID - int
    '20230424 10:00:00 AM', -- StartTime - datetime
    '20230424 11:30:00 AM', -- EndTime - datetime
    3          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   8,         -- MovieID - int
    '20230424 10:00:00 AM', -- StartTime - datetime
    '20230424 11:30:00 AM', -- EndTime - datetime
    4          -- HallNumber - int
    )

INSERT INTO dbo.Showtime
VALUES
(   1,         -- MovieID - int
    '20230424 12:00:00 PM', -- StartTime - datetime
    '20230424 1:30:00 PM', -- EndTime - datetime
    1          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   2,         -- MovieID - int
    '20230424 12:00:00 PM', -- StartTime - datetime
    '20230424 1:30:00 PM', -- EndTime - datetime
    2          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   3,         -- MovieID - int
    '20230424 12:00:00 PM', -- StartTime - datetime
    '20230424 1:30:00 PM', -- EndTime - datetime
    3          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   4,         -- MovieID - int
    '20230424 12:00:00 PM', -- StartTime - datetime
    '20230424 1:30:00 PM', -- EndTime - datetime
    4          -- HallNumber - int
    )

INSERT INTO dbo.Showtime
VALUES
(   5,         -- MovieID - int
    '20230424 1:30:00 PM', -- StartTime - datetime
    '20230424 3:00:00 PM', -- EndTime - datetime
    1          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   6,         -- MovieID - int
    '20230424 1:30:00 PM', -- StartTime - datetime
    '20230424 3:00:00 PM', -- EndTime - datetime
    2          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   7,         -- MovieID - int
    '20230424 1:30:00 PM', -- StartTime - datetime
    '20230424 3:00:00 PM', -- EndTime - datetime
    3          -- HallNumber - int
    )
INSERT INTO dbo.Showtime
VALUES
(   8,         -- MovieID - int
    '20230424 1:30:00 PM', -- StartTime - datetime
    '20230424 3:00:00 PM', -- EndTime - datetime
    4          -- HallNumber - int
    )


SELECT Movie.MovieID, Title, Imageurl, ReleaseDate, Director, Actor, Length, Sypnosis, STRING_AGG(GenreName, ',' )AS genre FROM dbo.Movie JOIN dbo.MovieGenres ON MovieGenres.MovieID = Movie.MovieID JOIN dbo.Genre ON Genre.GenreID = MovieGenres.GenreID WHERE GETDATE() >= ReleaseDate GROUP BY Movie.MovieID, Title, Imageurl, ReleaseDate, Director, Actor, Length, Sypnosis 
SELECT * FROM dbo.SeatInfo
SELECT * FROM dbo.Showtime

INSERT INTO dbo.Ticket
(
    SeatID,
    ShowID,
    UnitPrice
)
VALUES
(   2,   -- SeatID - int
    2,   -- ShowID - int
    75000 -- UnitPrice - money
    )
	/*
SELECT * FROM dbo.Showtime JOIN dbo.Ticket ON Ticket.ShowID = Showtime.id RIGHT JOIN dbo.SeatInfo ON SeatInfo.SeatID = Ticket.SeatID WHERE SeatInfo.HallNumber = 1 AND (dbo.Ticket.ShowID = 9 OR dbo.Ticket.ShowID IS NULL )
SELECT * FROM dbo.Showtime WHERE MovieID = 1
SELECT dbo.SeatInfo.SeatID FROM dbo.Showtime JOIN dbo.Ticket ON Ticket.ShowID = Showtime.id RIGHT JOIN dbo.SeatInfo ON SeatInfo.SeatID = Ticket.SeatID WHERE SeatInfo.HallNumber = 1 AND (id = 1 OR id IS NULL )
SELECT Ticket.SeatID FROM dbo.Showtime JOIN dbo.Ticket ON Ticket.ShowID = Showtime.id RIGHT JOIN dbo.SeatInfo ON SeatInfo.SeatID = Ticket.SeatID WHERE SeatInfo.HallNumber = 1 AND id = 1 

INSERT INTO dbo.Ticket
(
    SeatID,
    ShowID,
    UnitPrice
)
VALUES
(   0,   -- SeatID - int
    0,   -- ShowID - int
    NULL -- UnitPrice - money
    )
SELECT * FROM dbo.Ticket WHERE SeatID = 1 AND ShowID = 1 
SELECT Ticket.SeatID FROM dbo.Ticket RIGHT JOIN dbo.SeatInfo ON SeatInfo.SeatID = Ticket.SeatID WHERE ShowID = 9


SELECT [Order].OrderID, UserID, OrderDate, Imageurl, Title, StartTime, STRING_AGG(CAST(Ticket.SeatID AS VARCHAR) , ', ')AS[Seats], HallNumber, SUM(UnitPrice) AS [Total Price] FROM dbo.[Order] JOIN dbo.OrderDetail ON OrderDetail.OrderID = [Order].OrderID JOIN dbo.Ticket ON Ticket.TicketID = OrderDetail.TicketID JOIN dbo.Showtime ON Showtime.id = Ticket.ShowID JOIN dbo.Movie ON Movie.MovieID = Showtime.MovieID WHERE UserID = 1 GROUP BY [Order].OrderID, UserID, OrderDate, Imageurl, Title, StartTime, HallNumber ORDER BY SUM(UnitPrice) desc
SELECT [Order].OrderID, UserID, OrderDate, Imageurl, Title, StartTime, STRING_AGG(CAST(Ticket.SeatID AS VARCHAR) , ', ')AS[Seats], HallNumber, SUM(UnitPrice) AS [Total Price] FROM dbo.[Order] JOIN dbo.OrderDetail ON OrderDetail.OrderID = [Order].OrderID JOIN dbo.Ticket ON Ticket.TicketID = OrderDetail.TicketID JOIN dbo.Showtime ON Showtime.id = Ticket.ShowID JOIN dbo.Movie ON Movie.MovieID = Showtime.MovieID WHERE UserID = 1 GROUP BY [Order].OrderID, UserID, OrderDate, Imageurl, Title, StartTime, HallNumber
SELECT * FROM dbo.Showtime WHERE MovieID = 1 AND StartTime > GETDATE()
DELETE  FROM dbo.Ticket WHERE TicketID IN (SELECT TicketID FROM dbo.OrderDetail WHERE OrderID = 1)
DELETE FROM dbo.[Order] WHERE OrderID = ?;
SELECT Ticket.TicketID FROM dbo.OrderDetail JOIN dbo.Ticket ON Ticket.TicketID = OrderDetail.TicketID WHERE OrderID = 1
DELETE FROM dbo.Ticket WHERE TicketID = ?
*/
INSERT INTO dbo.[Order]
(
    UserID,
    OrderDate,
    Status
)
VALUES
(   1,         -- UserID - int
    GETDATE(), -- OrderDate - datetime
    1       -- Status - bit
    )
INSERT INTO dbo.Ticket
(
    SeatID,
    ShowID,
    UnitPrice
)
VALUES
(   1,   -- SeatID - int
    1,   -- ShowID - int
    75000 -- UnitPrice - money
    )
INSERT INTO dbo.OrderDetail
VALUES
(   3, -- OrderID - int
    6  -- TicketID - int
    )
SELECT * FROM dbo.Ticket