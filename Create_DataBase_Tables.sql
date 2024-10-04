-- Create Database
CREATE DATABASE OnlineShoppingBook; 

-- Create Table
--Kind(Used for UserActivity)
CREATE TABLE [dbo].[Kind](
	[KindID] [int] IDENTITY(1,1) NOT NULL,
	[KindName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Kind] PRIMARY KEY CLUSTERED 
(
	[KindID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--OnlineBookGenre
CREATE TABLE [dbo].[OnlineBookGenre](
	[BookGenreID] [int] IDENTITY(1,1) NOT NULL,
	[BookGenrename] [nvarchar](500) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_BookGenre] PRIMARY KEY CLUSTERED 
(
	[BookGenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--OnlineBooks
CREATE TABLE [dbo].[OnlineBooks] (
	[BookID] [int] NOT NULL,
	[BookTitle] [nvarchar](255) NOT NULL,
	[BookAuthor] [nvarchar](255) NOT NULL,
	[BookPrice] [decimal](18, 3) NOT NULL,
	[BookPublisher] [nvarchar](255) NOT NULL,
	[BookGenreID] [int] IDENTITY(1,1) NOT NULL,
	[BookCount] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_OnlineBooks] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE [dbo].[OnlineBooks]  WITH CHECK ADD  CONSTRAINT [FK_OnlineBooks_BookGenre] FOREIGN KEY([BookID])
REFERENCES [dbo].[OnlineBookGenre] ([BookGenreID])
ALTER TABLE [dbo].[OnlineBooks] CHECK CONSTRAINT [FK_OnlineBooks_BookGenre]

--OnlineCustomers
CREATE TABLE [dbo].[OnlineCustomers](
	[OnlineCustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFirstName] [nvarchar](50) NOT NULL,
	[CustomerLastName] [nvarchar](50) NOT NULL,
	[CustomerTelephone] [int] NOT NULL,
	[CustomerEmail] [nvarchar](50) NULL,
	[CustomerAddress] [nvarchar](50) NULL,
	[CustomerStatus] [int] NOT NULL,
	[CustomerGender] [bit] NOT NULL,
	[CustomerBirthDay] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[OnlineCustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--OnlineUserActivity
CREATE TABLE [dbo].[OnlineUserActivity](
	[RowID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[KindID] [int] IDENTITY(1,1) NOT NULL,
	[TimeActivity] [char](8) NOT NULL,
	[DateActivity] [char](10) NOT NULL,
	[MainKey1] [int] NOT NULL,
	[MainKey2] [int] NULL,
	[MainKey3] [int] NULL,
 CONSTRAINT [PK_OnlineUserActivity] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF
ALTER TABLE [dbo].[OnlineUserActivity]  WITH CHECK ADD  CONSTRAINT [FK_OnlineUserActivity_OnlineKind] FOREIGN KEY([KindID])
REFERENCES [dbo].[Kind] ([KindID])
ALTER TABLE [dbo].[OnlineUserActivity] CHECK CONSTRAINT [FK_OnlineUserActivity_OnlineKind]
ALTER TABLE [dbo].[OnlineUserActivity]  WITH CHECK ADD  CONSTRAINT [FK_OnlineUserActivity_OnlineUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[OnlineUsers] ([OnlineUserID])
ALTER TABLE [dbo].[OnlineUserActivity] CHECK CONSTRAINT [FK_OnlineUserActivity_OnlineUsers]


--OnlineUserDetails
CREATE TABLE [dbo].[OnlineUserDetails](
	[OnlineUserID] [int] IDENTITY(1,1) NOT NULL,
	[UserFirstName] [nvarchar](50) NOT NULL,
	[UserLastName] [nvarchar](50) NOT NULL,
	[UserTellphone] [int] NOT NULL,
	[UserAddress] [nvarchar](500) NOT NULL,
	[UserBirthDay] [nvarchar](50) NOT NULL,
	[UserEmail] [nvarchar](50) NULL,
 CONSTRAINT [PK_OnlineUserDetails] PRIMARY KEY CLUSTERED 
(
	[OnlineUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE [dbo].[OnlineUserDetails]  WITH CHECK ADD  CONSTRAINT [FK_OnlineUserDetails_OnlineUsers] FOREIGN KEY([OnlineUserID])
REFERENCES [dbo].[OnlineUsers] ([OnlineUserID])
ALTER TABLE [dbo].[OnlineUserDetails] CHECK CONSTRAINT [FK_OnlineUserDetails_OnlineUsers]

--OnlineUsers
CREATE TABLE [dbo].[OnlineUsers](
	[OnlineUserID] [int] IDENTITY(1,1) NOT NULL,
	[OnlineUserName] [nvarchar](50) NOT NULL,
	[OnlineUserPass] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_OnlineUsers] PRIMARY KEY CLUSTERED 
(
	[OnlineUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


--OnlineOrders
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderDate] [char](10) NOT NULL,
	[OrderReturnDate] [char](10) NOT NULL,
	[OrderActive] [bit] NOT NULL,
	[OrderVersionNumber] [int] NOT NULL,
	[OrderUserID] [int] NOT NULL,
	[OrderTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[OrderVersionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[OnlineCustomers] ([OnlineCustomerID])
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([OrderUserID])
REFERENCES [dbo].[OnlineUsers] ([OnlineUserID])
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]

--Suborders
CREATE TABLE [dbo].[SubOrders](
	[OrderID] [int] NOT NULL,
	[OrderVersionNumber] [int] IDENTITY(1,1) NOT NULL,
	[LineNumber] [int] NOT NULL,
	[OnlineBookID] [int] NOT NULL,
	[OnlineBookCount_SO] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_SubOrders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[OrderVersionNumber] ASC,
	[LineNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE [dbo].[SubOrders]  WITH CHECK ADD  CONSTRAINT [FK_SubOrders_Book] FOREIGN KEY([OnlineBookID])
REFERENCES [dbo].[OnlineBooks] ([BookID])
ALTER TABLE [dbo].[SubOrders] CHECK CONSTRAINT [FK_SubOrders_Book]
ALTER TABLE [dbo].[SubOrders]  WITH CHECK ADD  CONSTRAINT [FK_SubOrders_Orders] FOREIGN KEY([OrderID], [OrderVersionNumber])
REFERENCES [dbo].[Orders] ([OrderID], [OrderVersionNumber])
ALTER TABLE [dbo].[SubOrders] CHECK CONSTRAINT [FK_SubOrders_Orders]






