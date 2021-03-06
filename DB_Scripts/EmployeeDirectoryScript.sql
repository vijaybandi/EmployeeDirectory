USE [master]
GO
/****** Object:  Database [EmployeeDirectory]    Script Date: 6/6/2014 3:23:48 PM ******/
CREATE DATABASE [EmployeeDirectory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeDirectory', FILENAME = N'c:\SQL\MSSQL11.SQLEXPRESS\MSSQL\DATA\EmployeeDirectory.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EmployeeDirectory_log', FILENAME = N'c:\SQL\MSSQL11.SQLEXPRESS\MSSQL\DATA\EmployeeDirectory_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EmployeeDirectory] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeDirectory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeDirectory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeDirectory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeDirectory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeDirectory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeDirectory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeDirectory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeDirectory] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeDirectory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeDirectory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeDirectory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeDirectory] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [EmployeeDirectory]
GO
/****** Object:  User [EmployeeDirectoryUser]    Script Date: 6/6/2014 3:23:48 PM ******/
CREATE USER [EmployeeDirectoryUser] FOR LOGIN [EmployeeDirectoryUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [EmployeeDirectoryUser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [EmployeeDirectoryUser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [EmployeeDirectoryUser]
GO
/****** Object:  Table [dbo].[Certifications]    Script Date: 6/6/2014 3:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Certifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[abbreviation] [varchar](10) NOT NULL,
	[full_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Certifications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 6/6/2014 3:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 6/6/2014 3:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](30) NOT NULL,
	[mid_initial] [char](1) NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[birth_date] [date] NULL,
	[start_date] [date] NOT NULL,
	[has_picture] [bit] NOT NULL,
	[has_certification] [bit] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeesCertifications]    Script Date: 6/6/2014 3:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesCertifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee] [int] NOT NULL,
	[certification] [int] NOT NULL,
 CONSTRAINT [PK_EmployeesCertifications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeesLocations]    Script Date: 6/6/2014 3:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesLocations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee] [int] NOT NULL,
	[location] [int] NOT NULL,
 CONSTRAINT [PK_EmployeesLocations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeesPhones]    Script Date: 6/6/2014 3:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesPhones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee] [int] NOT NULL,
	[phone] [int] NOT NULL,
 CONSTRAINT [PK_EmployeesPhones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeesTitles]    Script Date: 6/6/2014 3:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesTitles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee] [int] NOT NULL,
	[title] [int] NOT NULL,
 CONSTRAINT [PK_EmployeesTitles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Locations]    Script Date: 6/6/2014 3:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Locations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[abbreviation] [varchar](10) NOT NULL,
	[full_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Phones]    Script Date: 6/6/2014 3:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Phones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [int] NOT NULL,
	[number] [char](10) NOT NULL,
 CONSTRAINT [PK_Phones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhonesTypes]    Script Date: 6/6/2014 3:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhonesTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PhonesTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Titles]    Script Date: 6/6/2014 3:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Titles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[description] [varchar](150) NULL,
	[department] [int] NOT NULL,
 CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Phones]    Script Date: 6/6/2014 3:23:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Phones] ON [dbo].[Phones]
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeesCertifications]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesCertifications_Certifications] FOREIGN KEY([certification])
REFERENCES [dbo].[Certifications] ([id])
GO
ALTER TABLE [dbo].[EmployeesCertifications] CHECK CONSTRAINT [FK_EmployeesCertifications_Certifications]
GO
ALTER TABLE [dbo].[EmployeesCertifications]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesCertifications_Employees] FOREIGN KEY([employee])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[EmployeesCertifications] CHECK CONSTRAINT [FK_EmployeesCertifications_Employees]
GO
ALTER TABLE [dbo].[EmployeesLocations]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesLocations_Employees] FOREIGN KEY([employee])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[EmployeesLocations] CHECK CONSTRAINT [FK_EmployeesLocations_Employees]
GO
ALTER TABLE [dbo].[EmployeesLocations]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesLocations_Locations] FOREIGN KEY([location])
REFERENCES [dbo].[Locations] ([id])
GO
ALTER TABLE [dbo].[EmployeesLocations] CHECK CONSTRAINT [FK_EmployeesLocations_Locations]
GO
ALTER TABLE [dbo].[EmployeesPhones]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesPhones_Employees] FOREIGN KEY([employee])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[EmployeesPhones] CHECK CONSTRAINT [FK_EmployeesPhones_Employees]
GO
ALTER TABLE [dbo].[EmployeesPhones]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesPhones_Phones] FOREIGN KEY([phone])
REFERENCES [dbo].[Phones] ([id])
GO
ALTER TABLE [dbo].[EmployeesPhones] CHECK CONSTRAINT [FK_EmployeesPhones_Phones]
GO
ALTER TABLE [dbo].[EmployeesTitles]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesTitles_Employees] FOREIGN KEY([employee])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[EmployeesTitles] CHECK CONSTRAINT [FK_EmployeesTitles_Employees]
GO
ALTER TABLE [dbo].[EmployeesTitles]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesTitles_Titles] FOREIGN KEY([title])
REFERENCES [dbo].[Titles] ([id])
GO
ALTER TABLE [dbo].[EmployeesTitles] CHECK CONSTRAINT [FK_EmployeesTitles_Titles]
GO
ALTER TABLE [dbo].[Phones]  WITH CHECK ADD  CONSTRAINT [FK_Phones_PhonesTypes] FOREIGN KEY([type])
REFERENCES [dbo].[PhonesTypes] ([id])
GO
ALTER TABLE [dbo].[Phones] CHECK CONSTRAINT [FK_Phones_PhonesTypes]
GO
ALTER TABLE [dbo].[Titles]  WITH CHECK ADD  CONSTRAINT [FK_Titles_Departments] FOREIGN KEY([department])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[Titles] CHECK CONSTRAINT [FK_Titles_Departments]
GO
USE [master]
GO
ALTER DATABASE [EmployeeDirectory] SET  READ_WRITE 
GO
