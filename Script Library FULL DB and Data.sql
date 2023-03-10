USE [master]
GO
/****** Object:  Database [LIBRARY]    Script Date: 27/2/2023 16:54:19 ******/
CREATE DATABASE [LIBRARY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LIBRARY', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LIBRARY.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LIBRARY_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LIBRARY_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LIBRARY] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LIBRARY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LIBRARY] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LIBRARY] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LIBRARY] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LIBRARY] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LIBRARY] SET ARITHABORT OFF 
GO
ALTER DATABASE [LIBRARY] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LIBRARY] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LIBRARY] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LIBRARY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LIBRARY] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LIBRARY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LIBRARY] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LIBRARY] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LIBRARY] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LIBRARY] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LIBRARY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LIBRARY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LIBRARY] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LIBRARY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LIBRARY] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LIBRARY] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LIBRARY] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LIBRARY] SET RECOVERY FULL 
GO
ALTER DATABASE [LIBRARY] SET  MULTI_USER 
GO
ALTER DATABASE [LIBRARY] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LIBRARY] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LIBRARY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LIBRARY] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LIBRARY] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LIBRARY', N'ON'
GO
USE [LIBRARY]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 27/2/2023 16:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[IdAutor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](200) NOT NULL,
	[Nacionalidad] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 27/2/2023 16:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiante](
	[IdLector] [int] IDENTITY(1,1) NOT NULL,
	[CI] [nvarchar](200) NOT NULL,
	[Nombre] [nvarchar](200) NOT NULL,
	[Direccion] [nvarchar](200) NOT NULL,
	[Carrera] [nvarchar](200) NOT NULL,
	[Edad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LibAut]    Script Date: 27/2/2023 16:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibAut](
	[IdAutor] [int] NOT NULL,
	[IdLibro] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Libro]    Script Date: 27/2/2023 16:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[IdLibro] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](200) NOT NULL,
	[Editorial] [nvarchar](200) NOT NULL,
	[Area] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 27/2/2023 16:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamo](
	[IdLector] [int] NOT NULL,
	[IdLibro] [int] NOT NULL,
	[FechaPrestamo] [date] NOT NULL,
	[FechaDevolucion] [date] NOT NULL,
	[Devuelto] [bit] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Autor] ON 

INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Nacionalidad]) VALUES (1, N'Julian Templeman', N'Ingles')
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Nacionalidad]) VALUES (2, N'David Vitter', N'Estadounidense')
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Nacionalidad]) VALUES (3, N'Pedro Pascal', N'Irlandes')
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Nacionalidad]) VALUES (4, N'Eric Matthes', N'Portugues')
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Nacionalidad]) VALUES (5, N'Fabian Lopez', N'Costarricense')
SET IDENTITY_INSERT [dbo].[Autor] OFF
SET IDENTITY_INSERT [dbo].[Estudiante] ON 

INSERT [dbo].[Estudiante] ([IdLector], [CI], [Nombre], [Direccion], [Carrera], [Edad]) VALUES (1, N'115230265', N'Fabian Lopez Quesada', N'Cartago', N'Computacion', 30)
INSERT [dbo].[Estudiante] ([IdLector], [CI], [Nombre], [Direccion], [Carrera], [Edad]) VALUES (2, N'113330827', N'Jennifer Valverde Ramirez', N'San Jose', N'Arquitectura', 35)
INSERT [dbo].[Estudiante] ([IdLector], [CI], [Nombre], [Direccion], [Carrera], [Edad]) VALUES (3, N'305180531', N'Ivette Jimenez Quiros', N'Alajuela', N'Biologia', 48)
INSERT [dbo].[Estudiante] ([IdLector], [CI], [Nombre], [Direccion], [Carrera], [Edad]) VALUES (5, N'604367812', N'Sergio Gutierrez Calderon', N'Puntarenas', N'Derecho', 37)
INSERT [dbo].[Estudiante] ([IdLector], [CI], [Nombre], [Direccion], [Carrera], [Edad]) VALUES (6, N'602431352', N'Gabrial Garcia Morales', N'Limon', N'Odontologia', 44)
SET IDENTITY_INSERT [dbo].[Estudiante] OFF
INSERT [dbo].[LibAut] ([IdAutor], [IdLibro]) VALUES (1, 1)
INSERT [dbo].[LibAut] ([IdAutor], [IdLibro]) VALUES (2, 1)
INSERT [dbo].[LibAut] ([IdAutor], [IdLibro]) VALUES (3, 2)
INSERT [dbo].[LibAut] ([IdAutor], [IdLibro]) VALUES (4, 2)
INSERT [dbo].[LibAut] ([IdAutor], [IdLibro]) VALUES (5, 1)
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([IdLibro], [Titulo], [Editorial], [Area]) VALUES (1, N'Visual Studio Net', N'Microsoft Books', N'Tecnologia')
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [Editorial], [Area]) VALUES (2, N'Python Para Todos', N'Python ORG', N'Tecnologia')
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [Editorial], [Area]) VALUES (3, N'SQL Microsoft', N'Microsoft Books', N'Base de Datos')
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [Editorial], [Area]) VALUES (4, N'MySQL', N'Sun MS', N'Base de Datos')
SET IDENTITY_INSERT [dbo].[Libro] OFF
INSERT [dbo].[Prestamo] ([IdLector], [IdLibro], [FechaPrestamo], [FechaDevolucion], [Devuelto]) VALUES (1, 1, CAST(N'2007-03-10' AS Date), CAST(N'2007-04-10' AS Date), 0)
INSERT [dbo].[Prestamo] ([IdLector], [IdLibro], [FechaPrestamo], [FechaDevolucion], [Devuelto]) VALUES (2, 2, CAST(N'2007-03-10' AS Date), CAST(N'2007-05-21' AS Date), 0)
INSERT [dbo].[Prestamo] ([IdLector], [IdLibro], [FechaPrestamo], [FechaDevolucion], [Devuelto]) VALUES (3, 4, CAST(N'2022-01-01' AS Date), CAST(N'2022-03-04' AS Date), 1)
INSERT [dbo].[Prestamo] ([IdLector], [IdLibro], [FechaPrestamo], [FechaDevolucion], [Devuelto]) VALUES (3, 3, CAST(N'2021-03-12' AS Date), CAST(N'2022-03-29' AS Date), 1)
ALTER TABLE [dbo].[LibAut]  WITH CHECK ADD  CONSTRAINT [FK_IdAutor] FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Autor] ([IdAutor])
GO
ALTER TABLE [dbo].[LibAut] CHECK CONSTRAINT [FK_IdAutor]
GO
ALTER TABLE [dbo].[LibAut]  WITH CHECK ADD  CONSTRAINT [FK_IdLibro] FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
ALTER TABLE [dbo].[LibAut] CHECK CONSTRAINT [FK_IdLibro]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [FK_IdLector] FOREIGN KEY([IdLector])
REFERENCES [dbo].[Estudiante] ([IdLector])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [FK_IdLector]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [FK_IdLibros] FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [FK_IdLibros]
GO
USE [master]
GO
ALTER DATABASE [LIBRARY] SET  READ_WRITE 
GO
