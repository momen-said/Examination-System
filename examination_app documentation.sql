USE [master]
GO
/****** Object:  Database [Examination_System]    Script Date: 11/30/2021 12:27:13 AM ******/
CREATE DATABASE [Examination_System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'examination_system', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\examination_system.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'examination_system_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\examination_system_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Examination_System] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Examination_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Examination_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Examination_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Examination_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Examination_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Examination_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Examination_System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Examination_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Examination_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Examination_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Examination_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Examination_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Examination_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Examination_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Examination_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Examination_System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Examination_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Examination_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Examination_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Examination_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Examination_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Examination_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Examination_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Examination_System] SET RECOVERY FULL 
GO
ALTER DATABASE [Examination_System] SET  MULTI_USER 
GO
ALTER DATABASE [Examination_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Examination_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Examination_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Examination_System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Examination_System] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Examination_System', N'ON'
GO
ALTER DATABASE [Examination_System] SET QUERY_STORE = OFF
GO
USE [Examination_System]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Course_ID] [int] NOT NULL,
	[Course_Name] [nvarchar](50) NOT NULL,
	[Course_Hours] [float] NOT NULL,
	[Course_Category] [nvarchar](15) NULL,
	[Introduced_by] [nvarchar](20) NULL,
	[Department_ID] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses_selected]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses_selected](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_selected] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Department_ID] [int] NOT NULL,
	[Department_Name] [nvarchar](50) NOT NULL,
	[DB_Manager] [nvarchar](50) NOT NULL,
	[Instructor_ID] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Department_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Exam_ID] [int] NOT NULL,
	[Exam_Title] [nvarchar](50) NULL,
	[Student_ID] [int] NULL,
	[Course_ID] [int] NULL,
	[Total_Result] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam_Taken]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_Taken](
	[Exam_Taken_ID] [int] IDENTITY(1,1) NOT NULL,
	[Student_ID] [int] NULL,
	[Exam_ID] [int] NOT NULL,
	[Question_ID] [int] NOT NULL,
	[Student_Answer] [nvarchar](120) NOT NULL,
	[Result] [int] NULL,
 CONSTRAINT [PK_Exam_Taken] PRIMARY KEY CLUSTERED 
(
	[Exam_Taken_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[Instructor_ID] [int] NOT NULL,
	[Instructor_Fullname] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[DOB] [date] NULL,
	[Salary] [int] NULL,
	[Department_ID] [int] NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[Instructor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor_Course]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor_Course](
	[Instructor_ID] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
 CONSTRAINT [PK_Instructor_Course] PRIMARY KEY CLUSTERED 
(
	[Instructor_ID] ASC,
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login_user] [varchar](50) NULL,
	[password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Question_ID] [int] NOT NULL,
	[Question_Formulation] [varchar](200) NULL,
	[Question_Type] [nvarchar](20) NOT NULL,
	[Model_Answer] [nvarchar](120) NOT NULL,
	[Question_Score] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_Choices]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Choices](
	[Choice_ID] [int] NOT NULL,
	[Question_Choice1] [nvarchar](120) NOT NULL,
	[Question_Choice2] [nvarchar](120) NOT NULL,
	[Question_Choice3] [nvarchar](120) NULL,
	[Question_Choice4] [nvarchar](120) NULL,
	[Question_ID] [int] NOT NULL,
 CONSTRAINT [PK_Question_Choices_1] PRIMARY KEY CLUSTERED 
(
	[Choice_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_ID] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](20) NOT NULL,
	[Mname] [varchar](20) NOT NULL,
	[Lname] [varchar](20) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[DOB] [date] NULL,
	[City] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](50) NULL,
	[ZipCode] [int] NULL,
	[SocialAccount] [text] NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Department_ID] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Course]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Course](
	[Student_ID] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
 CONSTRAINT [PK_Student_Course] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC,
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Phone]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Phone](
	[Student_ID] [int] NOT NULL,
	[PhoneNo1] [int] NOT NULL,
	[PhoneNo2] [int] NULL,
 CONSTRAINT [PK_Student_Phone] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC,
	[PhoneNo1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[Topic_ID] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
	[Topic_Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[Topic_ID] ASC,
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam_Taken] ADD  CONSTRAINT [c1]  DEFAULT ((0)) FOR [Result]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Department] ([Department_ID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Instructor] FOREIGN KEY([Instructor_ID])
REFERENCES [dbo].[Instructor] ([Instructor_ID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Instructor]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Course]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Student]
GO
ALTER TABLE [dbo].[Exam_Taken]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Taken_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Exam_Taken] CHECK CONSTRAINT [FK_Exam_Taken_Exam]
GO
ALTER TABLE [dbo].[Exam_Taken]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Taken_Question] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Question] ([Question_ID])
GO
ALTER TABLE [dbo].[Exam_Taken] CHECK CONSTRAINT [FK_Exam_Taken_Question]
GO
ALTER TABLE [dbo].[Exam_Taken]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Taken_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Exam_Taken] CHECK CONSTRAINT [FK_Exam_Taken_Student]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Department] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Department] ([Department_ID])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Department]
GO
ALTER TABLE [dbo].[Instructor_Course]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Course_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Instructor_Course] CHECK CONSTRAINT [FK_Instructor_Course_Course]
GO
ALTER TABLE [dbo].[Instructor_Course]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Course_Instructor] FOREIGN KEY([Instructor_ID])
REFERENCES [dbo].[Instructor] ([Instructor_ID])
GO
ALTER TABLE [dbo].[Instructor_Course] CHECK CONSTRAINT [FK_Instructor_Course_Instructor]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Course]
GO
ALTER TABLE [dbo].[Question_Choices]  WITH CHECK ADD  CONSTRAINT [FK_Question_Choices_Question1] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Question] ([Question_ID])
GO
ALTER TABLE [dbo].[Question_Choices] CHECK CONSTRAINT [FK_Question_Choices_Question1]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Department] ([Department_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[Student_Course]  WITH CHECK ADD  CONSTRAINT [FK_Student_Course_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Student_Course] CHECK CONSTRAINT [FK_Student_Course_Course]
GO
ALTER TABLE [dbo].[Student_Course]  WITH CHECK ADD  CONSTRAINT [FK_Student_Course_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Student_Course] CHECK CONSTRAINT [FK_Student_Course_Student]
GO
ALTER TABLE [dbo].[Student_Phone]  WITH CHECK ADD  CONSTRAINT [FK_Student_Phone_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Student_Phone] CHECK CONSTRAINT [FK_Student_Phone_Student]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_Course]
GO
/****** Object:  StoredProcedure [dbo].[exam_name]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[exam_name] @z varchar(50) output
as
select top 1 course_selected from courses_selected order by id desc
GO
/****** Object:  StoredProcedure [dbo].[exam_name_out]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[exam_name_out]
as
declare @z varchar(50) 
execute exam_name @z out
print @z
GO
/****** Object:  StoredProcedure [dbo].[GetCourseTopics]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetCourseTopics] @CourseID INT
AS
	SELECT T.Topic_Name
	FROM Course C INNER JOIN Topic T
	ON C.Course_ID = T.Course_ID AND C.Course_ID = @CourseID
GO
/****** Object:  StoredProcedure [dbo].[GetExamQuestions]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetExamQuestions] @Exam_ID INT
as
select Question_Formulation ,  Question_Choice1, Question_Choice2, Question_Choice3, Question_Choice4 from Question, Question_Choices
where Question_Choices.Question_ID = Question.Question_ID and Question.Question_ID in
(select Question_ID from Exam_Taken where Exam_ID in (select  Exam_ID from Exam where Exam_ID = @Exam_ID))
GO
/****** Object:  StoredProcedure [dbo].[GetInstructorCoursesInfo]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetInstructorCoursesInfo] @Instructor_ID INT
AS
	SELECT C.Course_Name, COUNT(SC.Student_ID) AS NoOfStudents
	FROM Instructor_Course IC INNER JOIN Course C
	ON C.Course_ID = IC.Course_ID AND IC.Instructor_ID = @Instructor_ID
	INNER JOIN Student_Course SC
	ON C.Course_ID = SC.Course_ID
	GROUP BY C.Course_Name
GO
/****** Object:  StoredProcedure [dbo].[GetStudent_Grades]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetStudent_Grades] @Student_ID INT
AS
	SELECT CONCAT(S.Fname, ' ', S.Mname, ' ',S.Lname) AS Fullname , ET.total_result AS Grades
	FROM Student S INNER JOIN exam ET
	ON S.Student_ID = ET.Student_ID AND ET.Student_ID = @Student_ID and Total_Result is not null
GO
/****** Object:  StoredProcedure [dbo].[GetStudentExamAnswer]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetStudentExamAnswer] @Exam_ID INT, @Student_ID INT
AS
	SELECT Q.Question_Formulation, ch.Question_Choice1, ch.Question_Choice2, ch.Question_Choice3, ch.Question_Choice4,
    ET.Student_Answer
	FROM Exam_Taken ET INNER JOIN Question Q
	ON Q.Question_ID = Et.Question_ID AND ET.Exam_ID = @Exam_ID AND ET.Student_ID = @Student_ID
	LEFT JOIN Question_Choices CH
	ON Q.Question_ID = CH.Question_ID 
GO
/****** Object:  StoredProcedure [dbo].[GetStudentInfo1]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetStudentInfo1] @Department_ID INT
AS
	SELECT s.*
	FROM Student s inner join Department d
	on s.Department_ID = d.Department_ID  and d.Department_ID=@Department_ID
GO
/****** Object:  StoredProcedure [dbo].[insert_selected_course]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_selected_course] @course_name nvarchar(50)
as
INSERT INTO courses_selected values (@course_name)
GO
/****** Object:  StoredProcedure [dbo].[label_1]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[label_1] @z varchar(50) output
as
begin
select fname+' '+Mname+' '+Lname  from Student, login where Student.Login in
(select top 1 login.login_user from login order by id desc)
end
GO
/****** Object:  StoredProcedure [dbo].[label_1_1]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[label_1_1]
as
declare @z varchar(50) 
execute label_1 @z out
print @z
GO
/****** Object:  StoredProcedure [dbo].[login_ins]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[login_ins] @ins_name nvarchar(50), @ins_id int
as
select count(*) from Instructor where @ins_name = Instructor_Fullname and @ins_id = Instructor_ID
GO
/****** Object:  StoredProcedure [dbo].[login_user]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[login_user] @email varchar(50), @password varchar(50)
as
select count(*) from Student where login = @email and password = @password
GO
/****** Object:  StoredProcedure [dbo].[mgr_login]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mgr_login] @mgr_name nvarchar(50), @ins_id int
as
select count(*) from Department where @mgr_name = DB_Manager and @ins_id = Instructor_ID
GO
/****** Object:  StoredProcedure [dbo].[quest_sql]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[quest_sql] @z varchar(50) output
as
begin
select Question_Formulation from Question where Course_ID in
(select Course_ID from Course where Course_Name in 
(select top 1 course_selected from courses_selected order by id desc)) order by NEWID()
end 
GO
/****** Object:  StoredProcedure [dbo].[quest_sql_out]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[quest_sql_out]
as
declare @z varchar(50) 
execute quest_sql @z out
print @z
GO
/****** Object:  StoredProcedure [dbo].[question_choices_proc]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[question_choices_proc] @label varchar(200), @1st_choice nvarchar(120) output,
@2nd_choice nvarchar(120) output,
@3rd_choice nvarchar(120) output,
@4th_choice nvarchar(120) output
as
select @1st_choice = Question_Choice1 from Question_Choices where Question_ID in 
(select Question_ID from Question where Question_Formulation = @label)
select @2nd_choice = Question_Choice2 from Question_Choices where Question_ID in 
(select Question_ID from Question where Question_Formulation = @label)
select @3rd_choice = Question_Choice3 from Question_Choices where Question_ID in 
(select Question_ID from Question where Question_Formulation = @label)
select @4th_choice = Question_Choice4 from Question_Choices where Question_ID in 
(select Question_ID from Question where Question_Formulation = @label)
GO
/****** Object:  StoredProcedure [dbo].[saving_exam_id]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[saving_exam_id] @exam_id int
as
declare @email varchar(50)
select top 1 @email = login_user from login order by id desc
declare @exam_tit nvarchar(50)
select top 1 @exam_tit = course_selected from courses_selected order by id desc
insert into exam (exam_id,exam_title,student_id,course_id,total_result) values ((@exam_id),(@exam_tit),
(select student_id from Student where Login = @email),(select course_id from course where course_name = @exam_tit)
,(select sum(result) from exam_taken where exam_id = @exam_id))
GO
/****** Object:  StoredProcedure [dbo].[saving_ques]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[saving_ques] @question varchar(200), @answer nvarchar(120) --@exam_no int
as 
declare @email varchar(50)
declare @model_ans nvarchar(120)
select @model_ans = model_answer from Question where question_Formulation = @question 
select top 1 @email = login_user from login order by id desc
insert into Exam_Taken (Student_ID,exam_id,Question_ID,Student_Answer) values
((select student_id from Student where Login = @email),
(Select top 1 exam_id from exam order by id desc),
(select question_id from Question where Question_Formulation = @question),(@answer))
update Exam_Taken set result = 1 where Student_Answer in (select Student_Answer from Exam_Taken where Question_ID in 
(select Question_ID from Question where Question.Model_Answer = Exam_Taken.Student_Answer)) and question_id in
(select Question_ID from Question where Question.Model_Answer = Exam_Taken.Student_Answer)
GO
/****** Object:  StoredProcedure [dbo].[saving_regis_data]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[saving_regis_data] 
@fname varchar(20),
@mname varchar(20),
@lname varchar(20),
@gender varchar(20),
@city nvarchar(50),
@street nvarchar(50),
@login varchar(50),
@password varchar(50)
as
insert into student(Fname,Mname,Lname,Gender,City,Street,Login,Password)
values ((@fname),(@mname),(@lname),(@gender),(@city),(@street),(@login),(@password))
GO
/****** Object:  StoredProcedure [dbo].[saving_score]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[saving_score] @score int
as
update exam set Total_Result = @score where Exam_ID = (select top 1 Exam_ID from exam order by id desc)
GO
/****** Object:  StoredProcedure [dbo].[score]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[score] @z int output
as
select sum(Result)*10 from exam_taken group by Exam_ID having exam_id = (select top 1 Exam_ID from exam order by id desc)
GO
/****** Object:  StoredProcedure [dbo].[score_out]    Script Date: 11/30/2021 12:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[score_out]
as
declare @z int
execute score @z out
print @z
GO
USE [master]
GO
ALTER DATABASE [Examination_System] SET  READ_WRITE 
GO
