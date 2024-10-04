-- Create Database
CREATE DATABASE OnlineShoppingBook; 

-- Create Table
CREATE TABLE [dbo].[OnlineBooks](
	[BookID] [int] NOT NULL,
	[BookTitle] [nvarchar](255) NOT NULL,
	[BookAuthor] [nvarchar](255) NOT NULL,
	[BookPrice] [decimal](18, 3) NOT NULL,
	[BookPublisher] [nvarchar](255) NOT NULL,
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[BookCount] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_OnlineBooks] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
