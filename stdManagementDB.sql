USE [master]
GO
/****** Object:  Database [Interview02062020Test_Dhanashree Nerkar]    Script Date: 06-08-2020 10:38:57 ******/
CREATE DATABASE [Interview02062020Test_Dhanashree Nerkar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Interview02062020Test_Dhanashree Nerkar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Interview02062020Test_Dhanashree Nerkar.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Interview02062020Test_Dhanashree Nerkar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Interview02062020Test_Dhanashree Nerkar_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Interview02062020Test_Dhanashree Nerkar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET ARITHABORT OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET  MULTI_USER 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Interview02062020Test_Dhanashree Nerkar]
GO
/****** Object:  StoredProcedure [dbo].[CheckIfStudentCourseExists]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CheckIfStudentCourseExists]
	-- Add the parameters for the stored procedure here
	@prm_sid int=0,
	@prm_cid int=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   IF EXISTS(SELECT sc.StudentCourseId FROM StudentCourse sc WHERE sc.StudentId = @prm_sid and sc.CourseId=@prm_cid)
      BEGIN
            SELECT 'TRUE'
      END
      ELSE
      BEGIN
            SELECT 'FALSE'
      END
	
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_DeleteStudent]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_DeleteStudent]
	-- Add the parameters for the stored procedure here
	@prm_sid int=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Student WHERE StudentId=@prm_sid
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_DeleteStudentCourse]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_DeleteStudentCourse] 
	-- Add the parameters for the stored procedure here
	@prm_scid int=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from StudentCourse 
	where StudentCourseId =@prm_scid
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertStudent]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_InsertStudent]
	-- Add the parameters for the stored procedure here
	@prm_snam nvarchar(50)=null,
	@prm_sdob nvarchar(50)=null,
	@prm_sgen nvarchar(50)=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Student(Name,DateOfBirth,Gender) VALUES(
	@prm_snam,
	@prm_sdob,
	@prm_sgen)
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertStudentCourse]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_InsertStudentCourse]
	-- Add the parameters for the stored procedure here
	 @prmsid int = 0,
	 @prmcid int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO StudentCourse(StudentId,CourseId) values(@prmsid,@prmcid)
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_PopulateCourse]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_PopulateCourse]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT c.CourseId,c.Course from Course c
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_PopulateStudent]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_PopulateStudent]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT s.StudentId,s.Name from Student s

	SELECT s.StudentId,s.Name FROM Student s 
	WHERE CONVERT(int,ROUND(DATEDIFF(hour,s.DateOfBirth,GETDATE())/8766.0,0)) >8
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_SelectAllStudent]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_SelectAllStudent] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Student
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_SelectAllStudentCourse]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_SelectAllStudentCourse]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sc.StudentCourseId,s.Name,c.Course from StudentCourse sc
	inner join Student s on s.StudentId=sc.StudentId 
	inner join Course c on c.CourseId=sc.CourseId
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_SelectAStudent]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_SelectAStudent] 
	-- Add the parameters for the stored procedure here
	@prm_sid int=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Student WHERE StudentId=@prm_sid
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_SelectAStudentCourse]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_SelectAStudentCourse] 
	-- Add the parameters for the stored procedure here
	@prm_scid int=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--select s.Name,c.Course from student s,Course c 
	--where s.StudentId in (SELECT sc.StudentId FROM StudentCourse sc  WHERE sc.StudentCourseId=@prm_scid) 
	--and c.CourseId in (SELECT sc.CourseId FROM StudentCourse sc  WHERE sc.StudentCourseId=@prm_scid) 
	select * from StudentCourse where StudentCourseId=@prm_scid
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_selectstudent]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_selectstudent]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Student
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_SelectStudentByGender]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_SelectStudentByGender]
	-- Add the parameters for the stored procedure here
	@prm_srch nvarchar(50)=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Student s where s.Gender=@prm_srch
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_SelectStudentByName]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_SelectStudentByName] 
	-- Add the parameters for the stored procedure here
	@prm_srch nvarchar(50)=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Student s where s.Name=@prm_srch
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateStudent]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_UpdateStudent] 
	-- Add the parameters for the stored procedure here
	@prm_sid int=0,
	@prm_snam nvarchar(50)=null,
	@prm_sdob nvarchar(50)=null,
	@prm_sgen nvarchar(50)=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Student 
	SET Name=@prm_snam, DateOfBirth=@prm_sdob, Gender=@prm_sgen 
	WHERE StudentId=@prm_sid 
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateStudentCourse]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_UpdateStudentCourse] 
	-- Add the parameters for the stored procedure here
	@prmscid int=0,
	@prmsid int=0,
	@prmcid int=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update StudentCourse 
	set StudentId=@prmsid,CourseId=@prmcid 
	where StudentCourseId=@prmscid
END

GO
/****** Object:  Table [dbo].[Course]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[Course] [nvarchar](50) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DateOfBirth] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 06-08-2020 10:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourse](
	[StudentCourseId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[CourseId] [int] NULL,
 CONSTRAINT [PK_StudentCouse] PRIMARY KEY CLUSTERED 
(
	[StudentCourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseId], [Course]) VALUES (1, N'Computer Science')
INSERT [dbo].[Course] ([CourseId], [Course]) VALUES (2, N'Biology')
INSERT [dbo].[Course] ([CourseId], [Course]) VALUES (3, N'Mechanical')
INSERT [dbo].[Course] ([CourseId], [Course]) VALUES (4, N'Electrical')
INSERT [dbo].[Course] ([CourseId], [Course]) VALUES (5, N'Civil')
INSERT [dbo].[Course] ([CourseId], [Course]) VALUES (6, N'ETC')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentId], [Name], [DateOfBirth], [Gender]) VALUES (2002, N'Raju', N'2013-01-30', N'Male')
INSERT [dbo].[Student] ([StudentId], [Name], [DateOfBirth], [Gender]) VALUES (2003, N'Anna', N'1996-06-11', N'Female')
INSERT [dbo].[Student] ([StudentId], [Name], [DateOfBirth], [Gender]) VALUES (2004, N'Nandini', N'2008-04-29', N'Female')
INSERT [dbo].[Student] ([StudentId], [Name], [DateOfBirth], [Gender]) VALUES (3002, N'Madhu', N'2015-08-11', N'Male')
INSERT [dbo].[Student] ([StudentId], [Name], [DateOfBirth], [Gender]) VALUES (5006, N'Dhanashree Nerkar', N'1996-05-25', N'Female')
INSERT [dbo].[Student] ([StudentId], [Name], [DateOfBirth], [Gender]) VALUES (5007, N'rav', N'2020-06-03', N'Female')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentCourse] ON 

INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (1, 2002, 1)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (3, 2003, 2)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (4, 2004, 1)
SET IDENTITY_INSERT [dbo].[StudentCourse] OFF
USE [master]
GO
ALTER DATABASE [Interview02062020Test_Dhanashree Nerkar] SET  READ_WRITE 
GO
