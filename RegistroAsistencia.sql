USE [master]
GO
/****** Object:  Database [RegistroAsistencia]    Script Date: 2/13/2020 11:12:35 PM ******/
CREATE DATABASE [RegistroAsistencia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RegistroAsistencia', FILENAME = N'C:\DB\RegistroAsistencia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RegistroAsistencia_log', FILENAME = N'C:\Logs\RegistroAsistencia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RegistroAsistencia] MODIFY FILEGROUP [PRIMARY] AUTOGROW_ALL_FILES
GO
ALTER DATABASE [RegistroAsistencia] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RegistroAsistencia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RegistroAsistencia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET ARITHABORT OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RegistroAsistencia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RegistroAsistencia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RegistroAsistencia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RegistroAsistencia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RegistroAsistencia] SET  MULTI_USER 
GO
ALTER DATABASE [RegistroAsistencia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RegistroAsistencia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RegistroAsistencia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RegistroAsistencia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RegistroAsistencia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RegistroAsistencia] SET QUERY_STORE = OFF
GO
USE [RegistroAsistencia]
GO
/****** Object:  Table [dbo].[Asistencia]    Script Date: 2/13/2020 11:12:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asistencia](
	[IDMiembro] [int] NOT NULL,
	[IDEvento] [int] NOT NULL,
	[IDUsuario] [nvarchar](50) NOT NULL,
	[IDMesa] [int] NULL,
	[Fecha] [timestamp] NULL,
 CONSTRAINT [PK_Asistencia] PRIMARY KEY CLUSTERED 
(
	[IDMiembro] ASC,
	[IDEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 2/13/2020 11:12:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evento](
	[IDEvento] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Evento] PRIMARY KEY CLUSTERED 
(
	[IDEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 2/13/2020 11:12:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesa](
	[IDMesa] [int] NOT NULL,
	[IDUsuario] [nvarchar](50) NOT NULL,
	[Estado] [int] NOT NULL,
	[Registros] [int] NULL,
 CONSTRAINT [PK_Mesa] PRIMARY KEY CLUSTERED 
(
	[IDMesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Miembro]    Script Date: 2/13/2020 11:12:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Miembro](
	[IDMiembro] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Cedula] [nvarchar](15) NOT NULL,
	[Activo] [int] NOT NULL,
	[Confirmado] [int] NOT NULL,
	[Telefono] [nvarchar](15) NULL,
	[Correo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Miembro] PRIMARY KEY CLUSTERED 
(
	[IDMiembro] ASC,
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 2/13/2020 11:12:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[IDPerfil] [int] NOT NULL,
	[Nombre] [nvarchar](15) NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[IDPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 2/13/2020 11:12:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Usuario] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Contrasenna] [nvarchar](15) NOT NULL,
	[IDPerfil] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mesa] ADD  CONSTRAINT [DF_Mesa_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Mesa] ADD  CONSTRAINT [DF_Mesa_Registros]  DEFAULT ((0)) FOR [Registros]
GO
ALTER TABLE [dbo].[Miembro] ADD  CONSTRAINT [DF_Miembro_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Miembro] ADD  CONSTRAINT [DF_Miembro_Confirmado]  DEFAULT ((0)) FOR [Confirmado]
GO
ALTER TABLE [dbo].[Asistencia]  WITH CHECK ADD  CONSTRAINT [FK_Asistencia_Evento] FOREIGN KEY([IDEvento])
REFERENCES [dbo].[Evento] ([IDEvento])
GO
ALTER TABLE [dbo].[Asistencia] CHECK CONSTRAINT [FK_Asistencia_Evento]
GO
ALTER TABLE [dbo].[Asistencia]  WITH CHECK ADD  CONSTRAINT [FK_Asistencia_Mesa] FOREIGN KEY([IDMesa])
REFERENCES [dbo].[Mesa] ([IDMesa])
GO
ALTER TABLE [dbo].[Asistencia] CHECK CONSTRAINT [FK_Asistencia_Mesa]
GO
ALTER TABLE [dbo].[Asistencia]  WITH CHECK ADD  CONSTRAINT [FK_Asistencia_Usuario] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[Usuario] ([Usuario])
GO
ALTER TABLE [dbo].[Asistencia] CHECK CONSTRAINT [FK_Asistencia_Usuario]
GO
ALTER TABLE [dbo].[Mesa]  WITH CHECK ADD  CONSTRAINT [FK_Mesa_Usuario] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[Usuario] ([Usuario])
GO
ALTER TABLE [dbo].[Mesa] CHECK CONSTRAINT [FK_Mesa_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Perfil] FOREIGN KEY([IDPerfil])
REFERENCES [dbo].[Perfil] ([IDPerfil])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Perfil]
GO
USE [master]
GO
ALTER DATABASE [RegistroAsistencia] SET  READ_WRITE 
GO
