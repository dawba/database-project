/*IF EXISTS(
    select *
from sys.databases
where name = 'Cinema'
) DROP DATABASE Cinema
CREATE DATABASE Cinema*/
IF OBJECT_ID(N'dbo.Movies', N'U') IS NOT NULL DROP TABLE [dbo].[Movies];
GO
CREATE TABLE [dbo].[Movies]
(
    [movieID] INT NOT NULL IDENTITY (1, 1) PRIMARY KEY,
    [movieTitle] VARCHAR(100) NOT NULL,
    [genre] VARCHAR(100) NOT NULL,
    [releaseYear] INT NOT NULL,
    [director] VARCHAR(100) NOT NULL,
    [length] INT NOT NULL,
    [country] VARCHAR(100) NOT NULL,
    [onDisplay] VARCHAR(3) NOT NULL
)
IF OBJECT_ID(N'dbo.Actors', N'U') IS NOT NULL DROP TABLE [dbo].[Actors];
GO
CREATE TABLE [dbo].[Actors]
(
    [actorID] INT NOT NULL IDENTITY (1, 1) PRIMARY KEY,
    [actorName] VARCHAR(100) NOT NULL,
    [actorSurname] VARCHAR(100) NOT NULL,
    [yearOfBirth] INT NOT NULL,
    [gender] VARCHAR(1) NOT NULL,
    [country] VARCHAR(100) NOT NULL,
)
IF OBJECT_ID(N'dbo.Cast', N'U') IS NOT NULL DROP TABLE [dbo].[Cast];
GO
CREATE TABLE [dbo].[Cast]
(
    [movieID] INT NOT NULL,
    [actorID] INT NOT NULL,
    [role] VARCHAR(100) NOT NULL
)
IF OBJECT_ID(N'dbo.Clients', N'U') IS NOT NULL DROP TABLE [dbo].[Clients];
GO
CREATE TABLE [dbo].[Clients]
(
    [clientID] INT NOT NULL IDENTITY (1, 1) PRIMARY KEY,
    [name] NVARCHAR(100) NOT NULL,
    [surname] NVARCHAR(100) NOT NULL,
    [email] VARCHAR(100),
    [phoneNumber] VARCHAR(9),
    [newsletter] BIT,
)
IF OBJECT_ID(N'dbo.Reservations', N'U') IS NOT NULL DROP TABLE [dbo].[Reservations];
GO
CREATE TABLE [dbo].[Reservations]
(
    [reservationID] INT NOT NULL IDENTITY (1, 1) PRIMARY KEY,
    [showingID] INT NOT NULL,
    [ticketType] VARCHAR(100) NOT NULL,
    [seatID] INT NOT NULL,
    [employeeID] INT,
    [sold] DATE NOT NULL,
    [clientID] INT NOT NULL,
)
IF OBJECT_ID(N'dbo.Seats', N'U') IS NOT NULL DROP TABLE [dbo].[Seats];
GO
CREATE TABLE [dbo].[Seats]
(
    [seatID] INT NOT NULL IDENTITY (1, 1) PRIMARY KEY,
    [hallID] INT NOT NULL,
    [row] INT NOT NULL,
    [seatNumber] INT NOT NULL,
)
IF OBJECT_ID(N'dbo.Employees', N'U') IS NOT NULL DROP TABLE [dbo].[Employees];
GO
CREATE TABLE [dbo].[Employees]
(
    [employeeID] INT NOT NULL IDENTITY (1, 1) PRIMARY KEY,
    [name] NVARCHAR(100) NOT NULL,
    [surname] NVARCHAR(100) NOT NULL,
    [sex] VARCHAR(1) NOT NULL,
    [dateOfBirth] DATE NOT NULL,
    [postID] INT NOT NULL,
)
IF OBJECT_ID(N'dbo.Shifts', N'U') IS NOT NULL DROP TABLE [dbo].[Shifts];
GO
CREATE TABLE [dbo].[Shifts]
(
    [employeeID] INT NOT NULL,
    [start] DATETIME NOT NULL,
    [end] DATETIME NOT NULL,
)
IF OBJECT_ID(N'dbo.Posts', N'U') IS NOT NULL DROP TABLE [dbo].[Posts];
GO
CREATE TABLE [dbo].[Posts]
(
    [postID] INT NOT NULL IDENTITY (1, 1) PRIMARY KEY,
    [post] VARCHAR(100) NOT NULL,
    [wage] INT NOT NULL,
)
IF OBJECT_ID(N'dbo.Showings', N'U') IS NOT NULL DROP TABLE [dbo].[Showings];
GO
CREATE TABLE [dbo].[Showings]
(
    [showingID] INT NOT NULL IDENTITY (1, 1) PRIMARY KEY,
    [hallID] INT NOT NULL,
    [movieID] INT NOT NULL,
    [date] DATETIME NOT NULL,
    [standardPrice] INT NOT NULL,
    [reducedPrice] INT NOT NULL,
    [ticketsBought] INT NOT NULL
)
IF OBJECT_ID(N'dbo.TransactionList', N'U') IS NOT NULL DROP TABLE [dbo].[TransactionList];
GO
CREATE TABLE [dbo].[TransactionList]
(
    [employeeID] INT NOT NULL,
    [date] DATE NOT NULL,
    [amount] INT NOT NULL,
    [productID] INT NOT NULL,
)
IF OBJECT_ID(N'dbo.Products', N'U') IS NOT NULL DROP TABLE [dbo].[Products];
GO
CREATE TABLE [dbo].[Products]
(
    [productID] INT NOT NULL IDENTITY (1, 1) PRIMARY KEY,
    [name] VARCHAR(100) NOT NULL,
    [retailPrice] INT NOT NULL,
    [wholesalePrice] INT NOT NULL,
    [pcsInStock] INT NOT NULL
)
IF OBJECT_ID(N'dbo.Studios', N'U') IS NOT NULL DROP TABLE [dbo].[Studios];
GO
CREATE TABLE [dbo].[Studios]
(
    [studioID] INT NOT NULL IDENTITY (1, 1) PRIMARY KEY,
    [studioName] VARCHAR(100) NOT NULL,
    [contactInfo] VARCHAR(100) NOT NULL
)
IF OBJECT_ID(N'dbo.Licenses', N'U') IS NOT NULL DROP TABLE [dbo].[Licenses];
GO
CREATE TABLE [dbo].[Licenses]
(
    [studioID] INT NOT NULL,
    [movieID] INT NOT NULL,
    [start] DATE NOT NULL,
    [finish] DATE NOT NULL,
    [price] INT NOT NULL
)
IF OBJECT_ID(N'dbo.Orders', N'U') IS NOT NULL DROP TABLE [dbo].[Orders];
GO
CREATE TABLE [dbo].[Orders]
(
    [productID] INT NOT NULL,
    [quantity] INT NOT NULL,
    [orderPrice] INT NOT NULL,
    [orderDate] DATE NOT NULL,
    [status] VARCHAR(20) NOT NULL
)
IF OBJECT_ID(N'dbo.Halls', N'U') IS NOT NULL DROP TABLE [dbo].[Halls];
GO
CREATE TABLE [dbo].[Halls]
(
    [hallID] INT NOT NULL IDENTITY (1, 1) PRIMARY KEY,
    [colour] VARCHAR(100) NOT NULL,
    [capacity] INT NOT NULL
)
INSERT INTO Movies
    ( movieTitle, genre, releaseYear, director, length, country, onDisplay )
VALUES
    ( 'Godfather', 'crime', 1972, 'Francis Ford Coppola', 170, 'USA', 'YES' ),
    ( 'The Shawshank Redemption', 'drama', 1994, 'Frank Darabont', 142, 'USA', 'YES' ),
    ( 'Schindlers List', 'history', 1993, 'Steven Spielberg', 195, 'USA', 'YES' ),
    ( 'Forrest Gump', 'comedy', 1994, 'Robert Zemeckis', 142, 'USA', 'YES' ),
    ( '12 Angry Men', 'crime', 1957, 'Sidney Lumet', 96, 'USA', 'NO' ),
    ( 'Star Wars: Episode IV - A New Hope', 'Fantasy', 1977, 'George Lucas', 121, 'USA', 'YES' ),
    ( 'The Silence of the Lambs', 'thriller', 1991, 'Jonathan Demme', 118, 'USA', 'YES' ),
    ( 'Intouchables', 'comedy', 2011, 'Oliver Nakache', 112, 'France', 'NO' ),
    ( N'La vita è bella', 'war', 1997, 'Roberto Benigni', 116, 'Italy', 'YES'),
    ( 'Fight Club', 'thriller', 1999, 'David Fincher', 139, 'USA', 'NO' ),
    ( 'Joker', 'action', 2019, 'Todd Phillips', 122, 'USA', 'YES' ),
    ( 'Django Unchained', 'western', 2012, 'Quentin Tarantino', 165, 'USA', 'YES' ),
    ( 'Gran Torino', 'drama', 2008, 'Clint Eastwood', 116, 'USA', 'YES' ),
    ( 'Good Will Hunting', 'drama', 1997, 'Gus Van Sant', 124, 'USA', 'YES' ),
    ( N'Léon', 'thriller', 1994, 'Luc Besson', 110, 'France', 'NO'),
    ('The Good The Bad and The Ugly', 'western', 1966, 'Todd Phillips', 179, 'Italy', 'NO'),
    ('Inglourious Basterds', 'war', 2009, 'Quentin Tarantino', 170, 'USA', 'YES'),
    ('Avatar: The Way of Water', 'sci-fi', 2022, 'James Cameron', 192, 'USA', 'YES')
INSERT INTO Actors
    ( actorName, actorSurname, yearOfBirth, gender, country )
VALUES
    ('Marlon', 'Brando', 1924, 'M', 'USA'),
    ('Al', 'Pacino', 1940, 'M', 'USA'),
    ('Morgan', 'Freeman', 1937, 'M', 'USA'),
    ('Tim', 'Robbins', 1958, 'M', 'USA'),
    ('Liam', 'Neeson', 1952, 'M', 'USA'),
    ('Embeth', 'Davidtz', 1965, 'F', 'USA'),
    ('Tom', 'Hanks', 1956, 'M', 'USA'),
    ('Robin', 'Right', 1966, 'F', 'USA'),
    ('Mark', 'Hamill', 1951, 'M', 'USA'),
    ('Harrison', 'Ford', 1942, 'M', 'USA'),
    ('Carrie', 'Fisher', 1956, 'F', 'USA'),
    ('Anthony', 'Hopkins', 1937, 'M', 'USA'),
    ('Jodie', 'Foster', 1962, 'F', 'USA'),
    ('François', 'Cluzet', 1955, 'M', 'France'),
    ('Brad', 'Pitt', 1963, 'M', 'USA'),
    ('Robert', 'De Niro', 1943, 'M', 'USA'),
    ('Leonardo', 'Di Caprio', 1974, 'M', 'USA'),
    ('Clint', 'Eastwood', 1930, 'M', 'USA'),
    ('Matt', 'Damon', 1970, 'M', 'USA'),
    ('Jean', 'Reno', 1948, 'M', 'France'),
    ('Kate', 'Winslet', 1975, 'F', 'USA')
INSERT INTO Cast
    (movieID, actorID, role)
VALUES
    (1, 1, 'Michael Corleone'),
    (1, 2, 'Don Vito Corleone'),
    (2, 3, 'Ellis Boyd "Red" Redding '),
    (2, 4, 'Andy Dufresne'),
    (3, 5, 'Oskar Schindler'),
    (3, 6, 'Helen Hirsch'),
    (4, 7, 'Forrest Gump'),
    (4, 8, 'Jenny Curran'),
    (5, 9, 'Luke Skywalker'),
    (5, 10, 'Han Solo'),
    (5, 11, 'Princess Leia'),
    (6, 12, 'Dr Hannibal Lecter'),
    (6, 13, 'Clarice Starling'),
    (7, 14, 'Philippe'),
    (9, 15, 'Tyler Durden'),
    (10, 16, 'Murray Franklin'),
    (11, 17, 'Calvin Candie'),
    (12, 18, 'Walt Kowalski'),
    (13, 19, 'Will Hunting'),
    (14, 20, 'Leon'),
    (15, 18, 'the Man with No Name'),
    (16, 15, 'Lieutenant Aldo Raine'),
    (18, 21, 'Ronal')
INSERT INTO Products
    (name, retailPrice, wholesalePrice, pcsInStock)
VALUES
    ('fries', 15, 3, 784),
    ('popcorn', 12, 2, 1542),
    ('nachos', 23, 6, 422),
    ('salsa dip', 5, 1, 123),
    ('cheese dip', 6, 2, 45),
    ('coke', 7, 1, 4561),
    ('water', 5, 1, 7842)
INSERT INTO Studios
    (studioName, contactInfo)
VALUES
    ('Paramount Pictures', 'Carl Warback - 987883737'),
    ('Columbia Pictures', 'John Dew - 564206988'),
    (
        'Universal Pictures',
        'Grubolini Gruby - 42069999292'
    ),
    ('United Artists', 'Jan Kowalski - 12342534534'),
    ('Lucasfilms', 'Darth Vader - 666666666'),
    ('Orion Pictures', 'Hannie Lecture 452165154'),
    ('Gaumont', 'Adrian Nowak - 93883899823'),
    (
        'Melampo Cinematografica',
        'Zalno Adrian - 3259235'
    ),
    ('20th Century Fox', 'Patt Bridd - 983453452'),
    (
        'Warner Bros Pictures',
        'Matheo Moravietti - 298352983'
    ),
    ('Miramax Films', 'Matheo Demonno - 2123352983'),
    (
        'Les Films du Dauphin',
        'Bildung Ist - 1123352983'
    )


INSERT INTO Licenses
    (studioID, movieID, [start], finish, price)
VALUES
    (1, 1, '2020-10-10', '2023-12-15', 12000),
    (1, 4, '2017-01-10', '2023-12-09', 154200),
    (2, 2, '2015-01-10', '2022-11-12', 17500),
    (3, 3, '2021-01-17', '2023-05-17', 17125),
    (4, 5, '1999-01-10', '2017-02-19', 10000),
    (5, 6, '1978-01-10', '2018-02-19', 13000),
    (6, 7, '2013-01-10', '2019-03-29', 100400),
    (7, 8, '2014-01-10', '2016-03-29', 14400),
    (8, 9, '2003-01-10', '2021-03-29', 177400),
    (9, 10, '2013-01-10', '2022-03-29', 17400),
    (10, 11, '2019-01-10', '2022-03-19', 23400),
    (2, 12, '2012-01-10', '2024-03-19', 144300),
    (10, 13, '2014-01-12', '2023-05-19', 233400),
    (11, 14, '2012-02-12', '2023-10-19', 123400),
    (12, 15, '2022-04-12', '2023-10-19', 1234),
    (9, 16, '2008-03-12', '2022-10-19', 15234),
    (3, 17, '2018-07-12', '2022-10-19', 185234),
    (9, 18, '2018-07-12', '2022-10-19', 185234)


INSERT INTO Orders
    (productID, quantity, orderPrice, orderDate, [status])
VALUES
    (1, 790, 3 * 790, N'2022-01-15', '1'),
    (2, 1550, 3100, N'2022-01-15', '1'),
    (3, 430, 6 * 430, N'2022-01-15', '1'),
    (4, 125, 125, N'2022-01-15', '1'),
    (5, 50, 100, N'2022-01-15', '1'),
    (6, 4570, 4570, N'2022-01-15', '1'),
    (7, 7850, 7850, N'2022-01-15', '1')


INSERT INTO Halls
    (colour, capacity)
VALUES
    ('blue', 12),
    ('red', 20),
    ('green', 30)  

INSERT INTO Clients(name, surname, email, phoneNumber, newsletter)
VALUES ('Wojciech', 'Batkiewicz', 'greatestcinemafan@gmail.com', NULL, 1),
(N'Bartłomiej', 'Wywalko', 'bartwywal@tlen.pl', 772227412, 1),
('Tymoteusz', 'Tyrada', 'tyrada1@wp.pl', 664662123, 0),
('January', N'Tomaszewski-Żelazny', 'wielkieciastko31@gmail.com', 789213789, 1),
('Joanna', N'Tomaszewska-Żelazna', 'joasia@gmail.com', NULL, NULL),
(N'Rafał', 'Herbata', 'wiekimperium@gmail.com', 520505755, 1),
('Anna', 'Ziarno', 'anka123@gmail.com', NULL, 1),
(N'Stanisław', 'Noga', 'noga@wp.pl', NULL, 0),
('Krystyna', 'Cybusiewicz', 'k.cybus1963@gmail.com', 505608708, 1),
('Marzena', 'Pal', NULL, 567764123, NULL),
('Tomasz', 'Styczniowy', 'mniejszeciastko@gmail.com', NULL, 1),
('Patryk', 'Eter', 'eterium.rete@wp.pl', 512513789, 1),
('Barbara', N'Węgierska', 'sliwka@gmail.com', 821328623, 1),
('Jacob', 'Mathews', 'nopainnogain@ymail.com', NULL, 1),
('Peter', 'Pestka', NULL, NULL, 0),
('Matylda', N'Jeleń', 'matje@gmail.com', 504923861, 1),
('Andrzej', 'Piaskowski', 'piachu@onet.pl', 626767612, 1),
('Wiktor', 'Othner', 'wit.oth@gmail.com', 812815813, 1),
('Tymoteusz', N'Tytoń', 'tytus@gmail.com', 561123505, 1),
(N'Paweł', N'Bańka', 'messej1972@gmail.com', 551213512, 1),
('Marcin', 'Piecyk', 'niuniek@o2.pl', 772712643, 1),
('Jakub', 'Matjaszewski', 'mati99@gmail.com', NULL, 0),
(N'Stanisław', 'Midolinny', 'stan1988@gmail.com', NULL, 1),
('Adam', 'Las', 'topolka2004@gmail.com', NULL, 0),
('Marta', 'Cybusiewicz', 'ma.cy12bus@interia.eu', 761651551, 1),
('Tadeusz', 'Wajcha', 'wajda@tlen.pl', NULL, 0),
('Krystyna', 'Kris', 'krycha@tlen.pl', NULL, 0),
('Wojciech', 'Sobieradzi', 'wojciech.radzi@gmail.com', 612602712, 1),
('Ewelina', 'Lina', 'ewelka@onet.pl', NULL, 0),
('Kamila', 'Blich', 'krysztalek@tlen.pl', 515274407, 1)

-- showing ids : 1-10 and 20-30 for hall blue hall, 11-15 for red hall, 16-20 for green hall
INSERT INTO Reservations(showingID, ticketType, seatID, employeeID, sold, clientID)
VALUES (1, 'S', 1, 1, N'2022-01-01', 1),
       (1, 'S', 2, 1, N'2022-01-05', 1),
       (1, 'S', 3, 1, N'2022-01-15', 1),
       (1, 'R', 4, 1, N'2022-01-15', 1),
       (1, 'R', 5, 1, N'2022-01-15', 1),
       (1, 'R', 6, 1, N'2022-01-15', 1),
       (2, 'S', 7, 2, N'2022-01-20', 1),
       (3, 'R', 1, 1, N'2022-01-21', 1),
       (4, 'S', 6, 3, N'2022-01-23', 7),
       (4, 'R', 8, 3, N'2022-01-15', 1),
       (4, 'R', 9, 3, N'2022-01-15', 1),
       (5, 'R', 8, 3, N'2022-01-15', 12),
       (5, 'S', 9, NULL, N'2022-01-15', 4),
       (5, 'S', 1, 1, N'2022-01-15', 1),
       (5, 'S', 2, 1, N'2022-01-15', 3),
       (5, 'S', 3, 1, N'2022-01-15', 3),
       (5, 'S', 4, 1, N'2022-01-15', 3),
       (5, 'S', 5, 1, N'2022-01-15', 3),
       (5, 'S', 6, 1, N'2022-01-15', 3),
       (6, 'S', 1, 3, N'2022-01-15', 25),
       (6, 'S', 2, 3, N'2022-01-15', 23),
       (6, 'R', 4, 3, N'2022-01-15', 3),
       (6, 'R', 10, 3, N'2022-01-15', 1),
       (6, 'R', 5, 2, N'2022-01-15', 13),
       (6, 'S', 7, 2, N'2022-01-15', 18),
       (6, 'S', 8, 4, N'2022-01-15', 19),
       (6, 'S', 9, 5, N'2022-01-15', 23),
       (7, 'S', 1, 3, N'2022-01-15', 1),
       (7, 'S', 2, 2, N'2022-01-15', 3),
       (7, 'R', 3, 3, N'2022-01-15', 5),
       (7, 'S', 4, 3, N'2022-01-15', 7),
       (7, 'S', 5, 2, N'2022-01-15', 19),
       (7, 'R', 6, 3, N'2022-01-15', 21),
       (7, 'R', 7, 3, N'2022-01-15', 8),
       (7, 'S', 8, 1, N'2022-01-15', 6),
       (7, 'R', 9, 1, N'2022-01-15', 29),
       (7, 'S', 10, 3, N'2022-01-15', 14),
       (8, 'R', 1, 1, N'2022-01-15', 1),
       (8, 'S', 2, 2, N'2022-01-15', 3),
       (8, 'S', 3, NULL, N'2022-01-15', 5),
       (8, 'S', 4, 2, N'2022-01-15', 8),
       (8, 'S', 5, 3, N'2022-01-15', 19),
       (8, 'S', 6, 3, N'2022-01-15', 21),
       (8, 'S', 7, NULL, N'2022-01-15', 8),
       (9, 'R', 1, NULL, N'2022-01-15', 1),
       (9, 'S', 2, 2, N'2022-01-15', 2),
       (9, 'R', 3, 3, N'2022-01-15', 4),
       (9, 'S', 4, NULL, N'2022-01-15', 5),
       (9, 'S', 5, 3, N'2022-01-15', 6),
       (9, 'R', 6, 3, N'2022-01-15', 27),
       (9, 'S', 7, NULL, N'2022-01-15', 28),
       (9, 'S', 8, 3, N'2022-01-15', 30),
       (9, 'S', 9, NULL, N'2022-01-15', 8),
       (9, 'R', 10, 3, N'2022-01-15', 9),
       (10, 'R', 1, NULL, N'2022-01-15', 1),
       (10, 'S', 2, 2, N'2022-01-15', 10),
       (10, 'S', 3, 1, N'2022-01-15', 24),
       (10, 'R', 4, 3, N'2022-01-15', 25),
       (10, 'R', 5, 3, N'2022-01-15', 6),
       (10, 'R', 6, 1, N'2022-01-15', 27),
       (10, 'S', 7, NULL, N'2022-01-15', 8),
       (10, 'S', 8, 3, N'2022-01-15', 30),
       (11, 'S', 1, NULL, N'2022-01-15', 1),
       (11, 'S', 2, 2, N'2022-01-15', 3),
       (11, 'S', 3, 1, N'2022-01-15', 4),
       (11, 'R', 4, 3, N'2022-01-15', 5),
       (11, 'R', 5, 3, N'2022-01-15', 6),
       (11, 'S', 6, 1, N'2022-01-15', 7),
       (11, 'S', 7, NULL, N'2022-01-15', 11),
       (11, 'S', 12, 2, N'2022-01-15', 18),
       (11, 'S', 13, 1, N'2022-01-15', 19),
       (11, 'R', 14, 3, N'2022-01-15', 25),
       (11, 'R', 15, 3, N'2022-01-15', 26),
       (11, 'S', 16, 1, N'2022-01-15', 27),
       (11, 'S', 17, NULL, N'2022-01-15', 28),
       (11, 'S', 18, 3, N'2022-01-15', 30),
       (11, 'S', 1, NULL, N'2022-01-15', 1),
       (11, 'S', 2, 2, N'2022-01-15', 3),
       (11, 'S', 3, 1, N'2022-01-15', 4),
       (11, 'R', 4, 3, N'2022-01-15', 5),
       (11, 'R', 5, 3, N'2022-01-15', 6),
       (11, 'S', 6, 1, N'2022-01-15', 7),
       (11, 'S', 7, NULL, N'2022-01-15', 11),
       (11, 'S', 8, 3, N'2022-01-15', 14),
       (11, 'R', 9, NULL, N'2022-01-15', 15),
       (11, 'R', 10, NULL, N'2022-01-15', 18),
       (11, 'S', 11, NULL, N'2022-01-15', 18),
       (11, 'S', 12, 2, N'2022-01-15', 18),
       (12, 'S', 1, NULL, N'2022-01-15', 1),
       (12, 'S', 2, 2, N'2022-01-15', 5),
       (12, 'S', 3, 1, N'2022-01-15', 8),
       (12, 'R', 4, 3, N'2022-01-15', 9),
       (12, 'R', 5, 3, N'2022-01-15', 9),
       (12, 'S', 6, 1, N'2022-01-15', 9),
       (12, 'S', 7, 1, N'2022-01-15', 12),
       (12, 'S', 13, 1, N'2022-01-15', 21),
       (13, 'R', 1, NULL, N'2022-01-15', 1),
       (13, 'S', 2, NULL, N'2022-01-15', 3),
       (13, 'S', 3, 1, N'2022-01-15', 3),
       (13, 'R', 6, 1, N'2022-01-15', 5),
       (13, 'S', 7, 2, N'2022-01-15', 8),
       (13, 'S', 8, 3, N'2022-01-15', 8),
       (13, 'R', 9, 1, N'2022-01-15', 11),
       (13, 'R', 10, NULL, N'2022-01-15', 11),
       (13, 'R', 12, 2, N'2022-01-15', 19),
       (13, 'S', 13, 1, N'2022-01-15', 19),
       (13, 'R', 14, NULL, N'2022-01-15', 19),
       (13, 'R', 15, 3, N'2022-01-15', 19),
       (13, 'S', 16, 1, N'2022-01-15', 27),
       (13, 'R', 17, NULL, N'2022-01-15', 23),
       (14, 'S', 1, NULL, N'2022-01-15', 1),
       (14, 'S', 2, NULL, N'2022-01-15', 1),
       (14, 'S', 3, 1, N'2022-01-15', 2),
       (14, 'R', 4, 3, N'2022-01-15', 2),
       (14, 'S', 5, 3, N'2022-01-15', 2),
       (14, 'S', 7, 2, N'2022-01-15', 8),
       (14, 'S', 13, 1, N'2022-01-15', 16),
       (14, 'S', 14, NULL, N'2022-01-15', 3),
       (14, 'S', 17, NULL, N'2022-01-15', 6),
       (14, 'S', 18, 3, N'2022-01-15', 19),
       (14, 'S', 19, NULL, N'2022-01-15', 6),
       (14, 'S', 20, NULL, N'2022-01-15', 6),
       (15, 'R', 1, 1, N'2022-01-15', 1),
       (15, 'S', 2, NULL, N'2022-01-15', 3),
       (15, 'S', 3, 1, N'2022-01-15', 3),
       (15, 'R', 4, 3, N'2022-01-15', 3),
       (15, 'S', 8, 3, N'2022-01-15', 8),
       (15, 'R', 9, 1, N'2022-01-15', 11),
       (15, 'R', 10, NULL, N'2022-01-15', 11),
       (15, 'S', 11, 3, N'2022-01-15', 11),
       (15, 'R', 14, NULL, N'2022-01-15', 19),
       (15, 'R', 15, 3, N'2022-01-15', 19),
       (15, 'S', 16, 1, N'2022-01-15', 27),
       (15, 'R', 19, 1, N'2022-01-15', 22),
       (15, 'R', 20, 2, N'2022-01-15', 22),
       (16, 'S', 1, 1, N'2022-01-16', 1),
       (16, 'S', 2, NULL, N'2022-01-16', 3),
       (16, 'S', 3, 1, N'2022-01-16', 3),
       (16, 'S', 4, 3, N'2022-01-16', 4),
       (16, 'S', 5, 3, N'2022-01-16', 4),
       (16, 'S', 6, NULL, N'2022-01-16', 6),
       (16, 'S', 7, 2, N'2022-01-16', 6),
       (16, 'R', 10, NULL, N'2022-01-16', 9),
       (16, 'R', 11, 3, N'2022-01-16', 9),
       (16, 'S', 12, 2, N'2022-01-16', 18),
       (16, 'S', 16, 1, N'2022-01-16', 14),
       (16, 'S', 18, 3, N'2022-01-16', 23),
       (16, 'S', 19, 1, N'2022-01-16', 22),
       (16, 'S', 20, 2, N'2022-01-16', 22),
       (16, 'S', 21, 1, N'2022-01-16', 30),
       (16, 'S', 22, NULL, N'2022-01-16', 30),
       (16, 'S', 25, 3, N'2022-01-16', 25),
       (16, 'S', 26, NULL, N'2022-01-16', 25),
       (16, 'S', 27, 2, N'2022-01-16', 28),
       (16, 'S', 28, 3, N'2022-01-16', 29),
       (16, 'S', 29, 1, N'2022-01-16', 13),
       (16, 'S', 30, NULL, N'2022-01-16', 2),
       (17, 'R', 1, 1, N'2022-01-17', 1),
       (17, 'S', 2, 2, N'2022-01-17', 2),
       (17, 'S', 3, 1, N'2022-01-17', 4),
       (17, 'R', 4, 3, N'2022-01-17', 14),
       (17, 'R', 5, 3, N'2022-01-17', 15),
       (17, 'R', 6, 1, N'2022-01-17', 15),
       (17, 'S', 7, 2, N'2022-01-17', 15),
       (17, 'S', 8, 3, N'2022-01-17', 15),
       (17, 'R', 9, 1, N'2022-01-17', 16),
       (17, 'R', 10, 3, N'2022-01-17', 18),
       (17, 'S', 11, 3, N'2022-01-17', 21),
       (17, 'R', 12, 2, N'2022-01-17', 5),
       (17, 'S', 17, 1, N'2022-01-17', 9),
       (17, 'R', 14, 1, N'2022-01-17', 9),
       (17, 'R', 16, 3, N'2022-01-17', 9),
       (17, 'S', 17, 1, N'2022-01-17', 7),
       (17, 'R', 17, 2, N'2022-01-17', 3),
       (17, 'S', 18, 3, N'2022-01-17', 23),
       (17, 'R', 19, 1, N'2022-01-17', 22),
       (17, 'R', 20, 2, N'2022-01-17', 22),
       (17, 'R', 21, 3, N'2022-01-17', 11),
       (17, 'S', 22, 3, N'2022-01-17', 11),
       (17, 'R', 23, 2, N'2022-01-17', 19),
       (17, 'S', 24, 1, N'2022-01-17', 19),
       (17, 'R', 25, 1, N'2022-01-17', 19),
       (17, 'R', 26, 3, N'2022-01-17', 19),
       (17, 'S', 27, 1, N'2022-01-17', 27),
       (17, 'R', 28, 2, N'2022-01-17', 23),
       (17, 'S', 29, 3, N'2022-01-17', 23),
       (17, 'R', 30, 1, N'2022-01-17', 22),
       (18, 'R', 1, NULL, N'2022-01-18', 1),
       (18, 'S', 2, NULL, N'2022-01-18', 1),
       (18, 'S', 3, NULL, N'2022-01-18', 1),
       (18, 'R', 4, NULL, N'2022-01-18', 1),
       (18, 'R', 5, 3, N'2022-01-18', 4),
       (18, 'R', 6, 1, N'2022-01-18', 7),
       (18, 'S', 7, 2, N'2022-01-18', 15),
       (18, 'S', 8, 3, N'2022-01-18', 15),
       (18, 'R', 9, 1, N'2022-01-18', 16),
       (18, 'R', 10, 3, N'2022-01-18', 8),
       (18, 'S', 11, 3, N'2022-01-18', 21),
       (18, 'R', 12, NULL, N'2022-01-18', 5),
       (18, 'S', 18, 1, N'2022-01-18', 12),
       (18, 'R', 14, 1, N'2022-01-18', 12),
       (18, 'R', 16, 3, N'2022-01-18', 12),
       (18, 'S', 18, 1, N'2022-01-18', 12),
       (18, 'R', 18, 2, N'2022-01-18', 13),
       (18, 'S', 18, NULL, N'2022-01-18', 30),
       (18, 'R', 19, 1, N'2022-01-18', 29),
       (18, 'R', 20, 2, N'2022-01-18', 29),
       (18, 'R', 21, 3, N'2022-01-18', 29),
       (18, 'S', 22, NULL, N'2022-01-18', 19),
       (18, 'R', 23, NULL, N'2022-01-18', 19),
       (18, 'S', 24, NULL, N'2022-01-18', 19),
       (18, 'R', 25, NULL, N'2022-01-18', 19),
       (18, 'R', 26, NULL, N'2022-01-18', 19),
       (18, 'S', 27, 1, N'2022-01-18', 24),
       (18, 'R', 28, NULL, N'2022-01-18', 24),
       (18, 'S', 29, NULL, N'2022-01-18', 24),
       (18, 'R', 30, NULL, N'2022-01-18', 24),
       (19, 'R', 1, NULL, N'2022-01-19', 1),
       (19, 'S', 2, NULL, N'2022-01-19', 2),
       (19, 'S', 3, NULL, N'2022-01-19', 4),
       (19, 'R', 4, 3, N'2022-01-19', 14),
       (19, 'R', 5, 3, N'2022-01-19', 15),
       (19, 'R', 6, 1, N'2022-01-19', 15),
       (19, 'S', 7, NULL, N'2022-01-19', 15),
       (19, 'S', 8, 3, N'2022-01-19', 15),
       (19, 'R', 9, 1, N'2022-01-19', 16),
       (19, 'R', 10, 3, N'2022-01-19', 18),
       (19, 'S', 11, 3, N'2022-01-19', 21),
       (19, 'R', 12, 2, N'2022-01-19', 5),
       (19, 'S', 19, NULL, N'2022-01-19', 9),
       (19, 'R', 14, NULL, N'2022-01-19', 9),
       (19, 'R', 16, NULL, N'2022-01-19', 9),
       (19, 'S', 19, 1, N'2022-01-19', 7),
       (19, 'R', 19, 2, N'2022-01-19', 3),
       (19, 'S', 18, 3, N'2022-01-19', 23),
       (19, 'R', 19, 1, N'2022-01-19', 22),
       (19, 'R', 20, 2, N'2022-01-19', 22),
       (19, 'R', 21, 3, N'2022-01-19', 11),
       (19, 'S', 22, 3, N'2022-01-19', 11),
       (19, 'R', 23, NULL, N'2022-01-19', 19),
       (19, 'S', 24, NULL, N'2022-01-19', 19),
       (19, 'R', 25, NULL, N'2022-01-19', 19),
       (19, 'R', 26, NULL, N'2022-01-19', 19),
       (19, 'S', 27, 1, N'2022-01-19', 27),
       (19, 'R', 28, NULL, N'2022-01-19', 23),
       (19, 'S', 29, 3, N'2022-01-19', 23),
       (19, 'R', 30, 1, N'2022-01-19', 22),
       (20, 'R', 1, 1, N'2022-01-20', 1),
       (20, 'S', 2, 2, N'2022-01-20', 2),
       (20, 'S', 3, 1, N'2022-01-20', 2),
       (20, 'R', 4, 3, N'2022-01-20', 4),
       (20, 'S', 5, 3, N'2022-01-20', 5),
       (20, 'R', 6, 1, N'2022-01-20', 5),
       (20, 'S', 7, 2, N'2022-01-20', 5),
       (20, 'R', 8, 3, N'2022-01-20', 9),
       (20, 'S', 9, NULL, N'2022-01-20', 16),
       (20, 'R', 10, 3, N'2022-01-20', 16),
       (20, 'S', 11, 3, N'2022-01-20', 16),
       (20, 'S', 12, 2, N'2022-01-20', 25),
       (20, 'S', 20, NULL, N'2022-01-20', 23),
       (20, 'R', 14, NULL, N'2022-01-20', 23),
       (20, 'R', 16, NULL, N'2022-01-20', 23),
       (20, 'S', 20, 1, N'2022-01-20', 17),
       (20, 'R', 20, 2, N'2022-01-20', 13),
       (20, 'S', 18, NULL, N'2022-01-20', 24),
       (20, 'R', 20, 1, N'2022-01-20', 22),
       (20, 'R', 20, 2, N'2022-01-20', 27),
       (20, 'R', 21, NULL, N'2022-01-20', 11),
       (20, 'S', 22, NULL, N'2022-01-20', 11),
       (20, 'S', 23, 2, N'2022-01-20', 12),
       (20, 'S', 24, 1, N'2022-01-20', 20),
       (20, 'R', 25, NULL, N'2022-01-20', 29),
       (20, 'R', 26, NULL, N'2022-01-20', 29),
       (20, 'R', 27, 1, N'2022-01-20', 30),
       (20, 'R', 28, NULL, N'2022-01-20', 13),
       (20, 'S', 29, NULL ,N'2022-01-20', 13),
       (20, 'R', 30, 1, N'2022-01-20', 6),
       (21, 'R', 1, NULL, N'2022-01-15', 1),
       (21, 'S', 2, 2, N'2022-01-15', 2),
       (21, 'R', 3, 3, N'2022-01-15', 4),
       (21, 'R', 4, NULL, N'2022-01-15', 5),
       (21, 'R', 5, 3, N'2022-01-15', 6),
       (21, 'S', 6, 3, N'2022-01-15', 27),
       (21, 'R', 7, NULL, N'2022-01-15', 28),
       (21, 'S', 8, 3, N'2022-01-15', 30),
       (21, 'S', 9, NULL, N'2022-01-15', 8),
       (21, 'R', 10, 3, N'2022-01-15', 21),
       (22, 'R', 1, NULL, N'2022-01-15', 1),
       (22, 'S', 2, 2, N'2022-01-15', 5),
       (22, 'R', 3, 3, N'2022-01-15', 5),
       (22, 'S', 4, 1, N'2022-01-15', 7),
       (22, 'S', 5, 3, N'2022-01-15', 9),
       (22, 'R', 6, 3, N'2022-01-15', 21),
       (22, 'S', 7, NULL, N'2022-01-15', 28),
       (22, 'S', 8, 3, N'2022-01-15', 30),
       (22, 'S', 9, NULL, N'2022-01-15', 24),
       (22, 'R', 10, 3, N'2022-01-15', 21),
       (23, 'R', 1, NULL, N'2022-01-15', 1),
       (23, 'S', 2, 2, N'2022-01-15', 2),
       (23, 'R', 3, 3, N'2022-01-15', 4),
       (23, 'S', 4, 3, N'2022-01-15', 5),
       (23, 'S', 5, 3, N'2022-01-15', 6),
       (23, 'R', 6, 3, N'2022-01-15', 27),
       (23, 'S', 7, 1, N'2022-01-15', 28),
       (23, 'S', 8, 3, N'2022-01-15', 30),
       (23, 'S', 9, NULL, N'2022-01-15', 8),
       (23, 'R', 10, 3, N'2022-01-15', 23),
       (24, 'R', 1, 1, N'2022-01-15', 1),
       (24, 'S', 2, 2, N'2022-01-15', 8),
       (24, 'R', 3, 3, N'2022-01-15', 8),
       (24, 'S', 4, NULL, N'2022-01-15', 12),
       (24, 'S', 5, NULL, N'2022-01-15', 14),
       (24, 'R', 6, 3, N'2022-01-15', 14),
       (24, 'S', 7, NULL, N'2022-01-15', 15),
       (24, 'S', 8, 3, N'2022-01-15', 21),
       (24, 'S', 9, NULL, N'2022-01-15', 8),
       (24, 'R', 10, 3, N'2022-01-15', 24),
       (25, 'R', 1, NULL, N'2022-01-15', 1),
       (25, 'S', 2, 2, N'2022-01-15', 11),
       (25, 'R', 3, 3, N'2022-01-15', 11),
       (25, 'S', 4, NULL, N'2022-01-15', 15),
       (25, 'S', 5, 3, N'2022-01-15', 16),
       (25, 'R', 6, 3, N'2022-01-15', 27),
       (25, 'S', 7, NULL, N'2022-01-15', 28),
       (25, 'S', 8, 3, N'2022-01-15', 30),
       (25, 'S', 9, NULL, N'2022-01-15', 8),
       (25, 'R', 10, 3, N'2022-01-15', 25),
       (26, 'R', 1, NULL, N'2022-01-15', 1),
       (26, 'S', 2, 2, N'2022-01-15', 15),
       (26, 'R', 3, 3, N'2022-01-15', 15),
       (26, 'S', 4, NULL, N'2022-01-15', 19),
       (26, 'S', 5, 3, N'2022-01-15', 18),
       (26, 'R', 6, 3, N'2022-01-15', 18),
       (26, 'S', 7, NULL, N'2022-01-15', 28),
       (26, 'S', 8, 3, N'2022-01-15', 30),
       (26, 'S', 9, 1, N'2022-01-15', 21),
       (26, 'R', 10, 3, N'2022-01-15', 23),
       (27, 'R', 1, NULL, N'2022-01-15', 1),
       (27, 'S', 2, 2, N'2022-01-15', 5),
       (27, 'R', 3, 3, N'2022-01-15', 5),
       (27, 'S', 4, NULL, N'2022-01-15', 6),
       (27, 'S', 5, 3, N'2022-01-15', 8),
       (27, 'R', 6, 3, N'2022-01-15', 10),
       (27, 'S', 7, 1, N'2022-01-15', 11),
       (27, 'S', 8, 3, N'2022-01-15', 12),
       (27, 'S', 9, 3, N'2022-01-15', 13),
       (27, 'R', 10, 3, N'2022-01-15', 15),
       (28, 'R', 1, 1, N'2022-01-15', 1),
       (28, 'S', 2, NULL, N'2022-01-15', 2),
       (28, 'R', 3, 1, N'2022-01-15', 4),
       (28, 'S', 4, 1, N'2022-01-15', 5),
       (28, 'S', 5, 3, N'2022-01-15', 6),
       (28, 'R', 6, NULL, N'2022-01-15', 27),
       (28, 'S', 7, NULL, N'2022-01-15', 28),
       (28, 'S', 8, 3, N'2022-01-15', 30),
       (28, 'S', 9, NULL, N'2022-01-15', 8),
       (28, 'R', 10, 3, N'2022-01-15', 28),
       (29, 'R', 1, NULL, N'2022-01-15', 1),
       (29, 'S', 2, NULL, N'2022-01-15', 5),
       (29, 'R', 3, NULL, N'2022-01-15', 5),
       (29, 'S', 4, NULL, N'2022-01-15', 5),
       (29, 'S', 5, NULL, N'2022-01-15', 5),
       (29, 'R', 6, NULL, N'2022-01-15', 5),
       (29, 'S', 7, NULL, N'2022-01-15', 5),
       (29, 'S', 8, NULL, N'2022-01-15', 30),
       (29, 'S', 9, NULL, N'2022-01-15', 30),
       (29, 'R', 10, NULL, N'2022-01-15', 30),
       (30, 'R', 1, 1, N'2022-01-15', 1),
       (30, 'S', 2, 2, N'2022-01-15', 4),
       (30, 'R', 3, 3, N'2022-01-15', 12),
       (30, 'S', 4, 1, N'2022-01-15', 17),
       (30, 'S', 5, 1, N'2022-01-15', 16),
       (30, 'R', 6, 2, N'2022-01-15', 18),
       (30, 'S', 7, 2, N'2022-01-15', 23),
       (30, 'S', 8, 3, N'2022-01-15', 30),
       (30, 'S', 9, 3, N'2022-01-15', 26),
       (30, 'R', 10, 1, N'2022-01-15', 26)
    
    

-- czy seatID jest konieczny?? kluczem moze byc hallid+row+seat, mozna tez jakos fajniej chyba to wyznaczac typu hallid*100+...
INSERT INTO Seats(hallID, row, seatNumber)
VALUES
    (1, 1, 1),
    (1, 1, 2),
    (1, 1, 3),
    (1, 1, 4),
    (1, 2, 1),
    (1, 2, 2),
    (1, 2, 3),
    (1, 2, 4),
    (1, 3, 1),
    (1, 3, 2),
    (1, 3, 3),
    (1, 3, 4),
    (2, 1, 1),
    (2, 1, 2),
    (2, 1, 3),
    (2, 1, 4),
    (2, 2, 5),
    (2, 2, 6),
    (2, 2, 7),
    (2, 2, 8),
    (2, 2, 9),
    (2, 3, 1),
    (2, 3, 1),
    (2, 3, 1),
    (2, 3, 1),
    (2, 4, 1),
    (2, 4, 1),
    (2, 4, 1),
    (2, 4, 1),
    (2, 4, 1),
    (2, 5, 1),
    (2, 5, 1),
    (3, 1, 1),
    (3, 1, 2),
    (3, 1, 3),
    (3, 1, 4),
    (3, 1, 5),
    (3, 2, 1),
    (3, 2, 2),
    (3, 2, 3),
    (3, 2, 4),
    (3, 2, 5),
    (3, 3, 1),
    (3, 3, 2),
    (3, 3, 3),
    (3, 3, 4),
    (3, 3, 5),
    (3, 4, 1),
    (3, 4, 2),
    (3, 4, 3),
    (3, 4, 4),
    (3, 4, 5),
    (3, 5, 1),
    (3, 5, 2),
    (3, 5, 3),
    (3, 5, 4),
    (3, 5, 5),
    (3, 6, 1),
    (3, 6, 2),
    (3, 6, 3),
    (3, 6, 4),
    (3, 6, 5)
    

INSERT INTO Employees(name, surname, sex, dateOfBirth, postID)
VALUES
    ('Anna', 'Karbecka', 'K', '1997-05-01', 1),
    ('Katzper', 'Machaj', 'M', '2001-08-09', 1),
    ('Tomasz', 'Zmazur', 'M', '2002-04-28', 1),
    ('Ewa', 'Dubielewicz', 'K', '2000-07-18', 2),
    ('Krzysztof', 'Chmiel', 'M', '1996-05-21', 2),
    ('Witold', 'Tostch', 'M', '1982-12-23', 2),
    ('Krystyna', N'Bożko', 'K', '1968-01-14', 3),
    ('Kazimiera', N'Kazań', 'K', '1974-06-15', 3),
    ('Marcin', 'Kucharczyk', 'M', '1984-05-12', 4),
    (N'Stanisław', 'Szef', 'M', '1977-11-12', 5),
    ('Zygmunt', 'Dzwon', 'M', '1988-10-28', 6)

INSERT INTO Posts(post, wage)
VALUES
    ('Cashier', 17),
    ('Equipment Operator', 20),
    ('Cleaning lady', 17),
    ('Social media manager', 17),
    ('Shift manager', 22),
    ('Supplier', 17)

INSERT INTO Shifts(employeeID, [start], [end])
VALUES
    (1, '2022-01-04 11:00:00', '2022-01-04 19:00:00'),
    (1, '2022-01-05 12:00:00', '2022-01-05 19:00:00'),
    (1, '2022-01-06 12:00:00', '2022-01-06 19:00:00'),
    (1, '2022-01-07 12:00:00', '2022-01-07 19:00:00'),
    (1, '2022-01-08 13:00:00', '2022-01-08 20:00:00'),
    (1, '2022-01-09 13:00:00', '2022-01-09 22:00:00'),
    (1, '2022-01-10 11:00:00', '2022-01-10 15:00:00'),
    (1, '2022-01-13 08:00:00', '2022-01-13 15:00:00'),
    (1, '2022-01-15 10:00:00', '2022-01-15 17:00:00'),
    (1, '2022-01-21 12:00:00', '2022-01-21 19:30:00'),
    (1, '2022-01-22 11:00:00', '2022-01-22 19:00:00'),
    (1, '2022-01-23 10:00:00', '2022-01-23 19:00:00'),
    (1, '2022-01-24 11:00:00', '2022-01-24 19:00:00'),
    (1, '2022-01-26 11:00:00', '2022-01-26 19:00:00'),
    (1, '2022-01-27 13:00:00', '2022-01-27 22:00:00'),
    (1, '2022-01-28 11:00:00', '2022-01-28 19:00:00'),
    (2, '2022-01-04 11:00:00', '2022-01-04 19:00:00'),
    (2, '2022-01-05 12:00:00', '2022-01-05 19:00:00'),
    (2, '2022-01-06 12:00:00', '2022-01-06 19:00:00'),
    (2, '2022-01-07 12:00:00', '2022-01-07 19:00:00'),
    (2, '2022-01-08 13:00:00', '2022-01-08 20:00:00'),
    (2, '2022-01-09 13:00:00', '2022-01-09 22:00:00'),
    (2, '2022-01-23 10:00:00', '2022-01-23 19:00:00'),
    (2, '2022-01-24 11:00:00', '2022-01-24 19:00:00'),
    (2, '2022-01-26 11:00:00', '2022-01-26 19:00:00'),
    (2, '2022-01-27 13:00:00', '2022-01-27 22:00:00'),
    (2, '2022-01-28 11:00:00', '2022-01-28 19:00:00'),
    (3, '2022-01-14 10:00:00', '2022-01-14 15:00:00'),
    (3, '2022-01-14 19:00:00', '2022-01-14 23:30:00'),
    (3, '2022-01-18 11:00:00', '2022-01-18 15:00:00'),
    (3, '2022-01-20 12:00:00', '2022-01-20 19:30:00'),
    (3, '2022-01-21 12:00:00', '2022-01-21 19:30:00'),
    (3, '2022-01-22 11:00:00', '2022-01-22 19:00:00'),
    (3, '2022-01-23 10:00:00', '2022-01-23 19:00:00'),
    (3, '2022-01-24 11:00:00', '2022-01-24 19:00:00'),
    (3, '2022-01-26 11:00:00', '2022-01-26 19:00:00'),
    (3, '2022-01-27 18:00:00', '2022-01-28 02:30:00'),
    (4, '2022-01-04 11:00:00', '2022-01-04 19:00:00'),
    (5, '2022-01-05 12:00:00', '2022-01-05 19:00:00'),
    (6, '2022-01-06 12:00:00', '2022-01-06 19:00:00'),
    (4, '2022-01-07 12:00:00', '2022-01-07 19:00:00'),
    (4, '2022-01-08 13:00:00', '2022-01-08 20:00:00'),
    (5, '2022-01-09 13:00:00', '2022-01-09 22:00:00'),
    (5, '2022-01-10 11:00:00', '2022-01-10 15:00:00'),
    (4, '2022-01-13 08:00:00', '2022-01-13 15:00:00'),
    (6, '2022-01-14 10:00:00', '2022-01-14 17:00:00'),
    (6, '2022-01-15 10:00:00', '2022-01-15 17:00:00'),
    (5, '2022-01-17 11:00:00', '2022-01-17 15:00:00'),
    (6, '2022-01-18 11:00:00', '2022-01-18 15:00:00'),
    (6, '2022-01-23 10:00:00', '2022-01-23 19:00:00'),
    (6, '2022-01-24 11:00:00', '2022-01-24 19:00:00'),
    (4, '2022-01-26 11:00:00', '2022-01-26 19:00:00'),
    (6, '2022-01-27 13:00:00', '2022-01-27 22:00:00'),
    (7, '2022-01-08 10:00:00', '2022-01-08 13:00:00'),
    (7, '2022-01-09 08:30:00', '2022-01-09 12:00:00'),
    (7, '2022-01-10 10:00:00', '2022-01-10 15:00:00'),
    (7, '2022-01-13 07:00:00', '2022-01-13 12:00:00'),
    (7, '2022-01-21 07:00:00', '2022-01-21 12:30:00'),
    (7, '2022-01-22 07:00:00', '2022-01-22 12:00:00'),
    (7, '2022-01-26 11:00:00', '2022-01-26 12:00:00'),
    (7, '2022-01-27 13:00:00', '2022-01-27 12:00:00'),
    (7, '2022-01-28 11:00:00', '2022-01-28 12:00:00'),
    (8, '2022-01-04 19:00:00', '2022-01-04 22:00:00'),
    (8, '2022-01-05 19:00:00', '2022-01-05 22:00:00'),
    (8, '2022-01-06 19:45:00', '2022-01-06 22:00:00'),
    (8, '2022-01-07 19:30:00', '2022-01-04 22:30:00'),
    (8, '2022-01-08 19:00:00', '2022-01-08 22:00:00'),
    (8, '2022-01-09 19:30:00', '2022-01-09 22:00:00'),
    (8, '2022-01-10 19:00:00', '2022-01-10 22:00:00'),
    (8, '2022-01-18 19:45:00', '2022-01-18 22:00:00'),
    (8, '2022-01-20 19:00:00', '2022-01-20 21:30:00'),
    (8, '2022-01-26 19:00:00', '2022-01-26 21:00:00'),
    (8, '2022-01-27 19:45:00', '2022-01-27 21:00:00'),
    (8, '2022-01-28 19:45:00', '2022-01-28 22:00:00'),
    (9, '2022-01-04 11:00:00', '2022-01-04 13:00:00'),
    (9, '2022-01-05 12:00:00', '2022-01-05 13:00:00'),
    (9, '2022-01-06 12:00:00', '2022-01-06 13:00:00'),
    (9, '2022-01-09 13:00:00', '2022-01-09 14:00:00'),
    (9, '2022-01-10 11:00:00', '2022-01-10 13:00:00'),
    (9, '2022-01-13 08:00:00', '2022-01-13 10:00:00'),
    (9, '2022-01-14 10:00:00', '2022-01-14 13:00:00'),
    (9, '2022-01-15 10:00:00', '2022-01-15 13:00:00'),
    (9, '2022-01-17 11:00:00', '2022-01-17 13:00:00'),
    (9, '2022-01-18 11:00:00', '2022-01-18 14:00:00'),
    (10, '2022-01-04 11:00:00', '2022-01-04 13:00:00'),
    (10, '2022-01-12 12:00:00', '2022-01-12 13:00:00'),
    (10, '2022-01-17 12:00:00', '2022-01-17 16:00:00'),
    (10, '2022-01-24 13:00:00', '2022-01-24 16:00:00')

--trigger sprawdzajacy przy dodawaniu seansu, czy na dany film jest wykupiona licencja 

IF OBJECT_ID ('LicenseCheck', 'TR') IS NOT NULL  
   DROP TRIGGER LicenseCheck;  
GO
CREATE TRIGGER LicenseCheck
ON Showings
INSTEAD OF INSERT
AS
BEGIN
    IF
    ( (SELECT finish FROM Licenses L JOIN INSERTED I  ON L.movieID = I.movieID ) > (SELECT [date] from inserted))
      INSERT INTO Showings  
      (hallID,movieID,[date],standardPrice,reducedPrice,ticketsBought) 
      SELECT hallID,movieID,[date],standardPrice,reducedPrice,ticketsBought FROM INSERTED
     ELSE 
     PRINT('License for this movie has expired!')
END
GO

INSERT INTO Showings  
      (hallID,movieID,[date],standardPrice,reducedPrice,ticketsBought) 
      VALUES
      (1,1,'2022-01-16 12:32',25,20,0) 

--trigger obnizajacy stan magazynowy danego produktu  po transakcji
 IF OBJECT_ID ('ProductSold', 'TR') IS NOT NULL  
   DROP TRIGGER ProductSold;  
GO
CREATE TRIGGER ProductSold
ON TransactionList
AFTER INSERT 
AS 
BEGIN
UPDATE Products 
SET pcsInStock = (pcsInStock - (SELECT amount FROM inserted)) 
WHERE Products.productID = (SELECT productID from inserted)
END 
GO 
--trigger zwiekszajacy stan produktu po zamowieniu 
 IF OBJECT_ID ('ProductOrdered', 'TR') IS NOT NULL  
   DROP TRIGGER ProductOrdered;  
GO
CREATE TRIGGER ProductOrdered
ON Orders
AFTER INSERT 
AS 
BEGIN
UPDATE Products 
SET pcsInStock = (pcsInStock + (SELECT quantity FROM inserted)) 
WHERE Products.productID = (SELECT productID from inserted)
END 
GO 
--trigger zwiekszajacy liczbe kjupionych biletow po dokonaniu rezerwacji
IF OBJECT_ID ('TicketSold', 'TR') IS NOT NULL  
   DROP TRIGGER TicketSold;  --do zrobienia sprawdzanie czy sawolne miejsca, czy dane miejsce jest wolne
GO
CREATE TRIGGER TicketSold
ON Reservations
AFTER INSERT 
AS 
BEGIN
UPDATE Showings 
SET ticketsBought = (ticketsBought + 1) 
WHERE Showings.showingID = (SELECT showingID from inserted)
END 
GO  

--funkcja pokazująca repertuar kina w danym przedziale czasowym
DROP FUNCTION IF EXISTS dbo.cinemaRepertoire;
GO 
CREATE FUNCTION cinemaRepertoire (@start DATE, @finish DATE)
RETURNS @repertoire TABLE
(
	[Date] DATETIME,
	Movie NVARCHAR(50),
	Hall NVARCHAR(10),
	noOfFreeSeats INT
)
AS
BEGIN
	INSERT INTO @repertoire 
        SELECT S.[date],M.movieTitle,H.colour,H.capacity - S.ticketsBought 
        FROM Showings S JOIN Movies M ON S.movieID = M.movieID
        JOIN Halls H ON H.hallID = S.hallID 
        WHERE S.[date] BETWEEN @start AND @finish 
	RETURN
END 
GO 

SELECT * FROM cinemaRepertoire('2022-01-12','2023-12-03')

--funkcja pokazujaca rozklad wolnych miejsc na dany seans  


IF OBJECT_ID(N'dbo.Test', N'U') IS NOT NULL DROP TABLE [dbo].[Test];
GO
CREATE TABLE [dbo].[Test]
(
    [Row] VARCHAR(3)
)
INSERT INTO Test 
SELECT S.row as [Row] FROM Seats S 
WHERE S.hallID = 1  
GROUP BY S.row 
DECLARE @X INT 
SET @X = 1 
DECLARE @addcol VARCHAR(100)
WHILE(@X <= (SELECT MAX(S.seatNumber) FROM Seats S WHERE hallID = 1 ))
    BEGIN
        SET @addcol = 'ALTER TABLE Test ADD ' + CONCAT('S',CAST(@X AS VARCHAR)) + ' INT' 
        SET @X = @X +1 
        exec(@addcol)
    END 
SET @X = 1
DECLARE @altercol VARCHAR(1000)
WHILE(@X <= (SELECT MAX(S.seatNumber) FROM Seats S WHERE hallID = 1 ))
    BEGIN
        SET @altercol = 
        'UPDATE Test SET TEST.[S' + CAST(@X AS VARCHAR) + '] = (SELECT S.seatID FROM Seats S WHERE S.hallID = 1 AND S.seatNumber = '+CAST(@X AS VARCHAR)+' AND S.[row] = Test.[Row] )'
        exec(@altercol)
        SET @altercol = 'UPDATE Test SET Test.[S'+ CAST(@X AS VARCHAR) +'] = -1
                        WHERE EXISTS(SELECT * FROM Reservations R WHERE R.showingID = 1 AND R.seatID = Test.[S'+ CAST(@X AS VARCHAR) +'] )'
        exec(@altercol)
        SET @X = @X +1 
    END 


SELECT * FROM Test  
SELECT * FROM Seats
SELECT S.row,S.seatNumber FROM Seats S WHERE hallID = 1  
SELECT * FROM Reservations WHERE showingID = 1
/*GO 
CREATE PROC freeSeats 
(@showingID INT)
AS 
DECLARE @hall INT
SET @hall = (SELECT DISTINCT  S.hallID FROM Showings S WHERE S.showingID = @showingID)
IF OBJECT_ID(N'dbo.Test', N'U') IS NOT NULL DROP TABLE [dbo].[Test];
GO
CREATE TABLE [dbo].[Test]
(
    [Row] VARCHAR(3)
)
INSERT INTO Test 
SELECT S.row as [Row] FROM Seats S 
WHERE S.hallID = 1  
GROUP BY S.row 
DECLARE @X INT 
SET @X = 1 
DECLARE @addcol VARCHAR(100)
WHILE(@X <= (SELECT MAX(S.seatNumber) FROM Seats S WHERE hallID = @hall ))
    BEGIN
        SET @addcol = 'ALTER TABLE Test ADD ' + CONCAT('S',CAST(@X AS VARCHAR)) + ' INT' 
        SET @X = @X +1 
        exec(@addcol)
    END 
SET @X = 1
DECLARE @altercol VARCHAR(1000)
WHILE(@X <= (SELECT MAX(S.seatNumber) FROM Seats S WHERE hallID = @hall ))
    BEGIN
        SET @altercol = 
        'UPDATE Test SET TEST.[S' + CAST(@X AS VARCHAR) + '] = (SELECT S.seatID FROM Seats S WHERE S.hallID = 1 AND S.seatNumber = '+CAST(@X AS VARCHAR)+' AND S.[row] = Test.[Row] )'
        exec(@altercol)
        SET @altercol = 'UPDATE Test SET Test.[S'+ CAST(@X AS VARCHAR) +'] = -1
                        WHERE EXISTS(SELECT * FROM Reservations R WHERE R.showingID = @showingID AND R.seatID = Test.[S'+ CAST(@X AS VARCHAR) +'] )'
        exec(@altercol)
        SET @X = @X +1 
    END 


SELECT * FROM Test 
GO */