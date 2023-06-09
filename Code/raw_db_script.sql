USE [master]
GO
/****** Object:  Database [PremierLeagueAnalysis_raw]    Script Date: 12.06.2023 16:44:16 ******/
CREATE DATABASE [PremierLeagueAnalysis_raw]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PremierLeagueAnalysis_raw', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PremierLeagueAnalysis_raw.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PremierLeagueAnalysis_raw_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PremierLeagueAnalysis_raw_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PremierLeagueAnalysis_raw].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET ARITHABORT OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET RECOVERY FULL 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET  MULTI_USER 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PremierLeagueAnalysis_raw', N'ON'
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET QUERY_STORE = OFF
GO
USE [PremierLeagueAnalysis_raw]
GO
/****** Object:  Table [dbo].[BettingOdds]    Script Date: 12.06.2023 16:44:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BettingOdds](
	[Date] [date] NULL,
	[Time] [time](7) NULL,
	[HomeTeam] [varchar](100) NULL,
	[AwayTeam] [varchar](100) NULL,
	[FTHG] [int] NULL,
	[FTAG] [int] NULL,
	[FTR] [varchar](100) NULL,
	[HTHG] [int] NULL,
	[HTAG] [int] NULL,
	[HTR] [varchar](100) NULL,
	[Referee] [varchar](100) NULL,
	[HS] [int] NULL,
	[AS] [int] NULL,
	[HST] [int] NULL,
	[AST] [int] NULL,
	[HF] [int] NULL,
	[AF] [int] NULL,
	[HC] [int] NULL,
	[AC] [int] NULL,
	[HY] [int] NULL,
	[AY] [int] NULL,
	[HR] [int] NULL,
	[AR] [int] NULL,
	[B365H] [float] NULL,
	[B365D] [float] NULL,
	[B365A] [float] NULL,
	[BWH] [float] NULL,
	[BWD] [float] NULL,
	[BWA] [float] NULL,
	[IWH] [float] NULL,
	[IWD] [float] NULL,
	[IWA] [float] NULL,
	[PSH] [float] NULL,
	[PSD] [float] NULL,
	[PSA] [float] NULL,
	[WHH] [float] NULL,
	[WHD] [float] NULL,
	[WHA] [float] NULL,
	[VCH] [float] NULL,
	[VCD] [float] NULL,
	[VCA] [float] NULL,
	[MaxH] [float] NULL,
	[MaxD] [float] NULL,
	[MaxA] [float] NULL,
	[AvgH] [float] NULL,
	[AvgD] [float] NULL,
	[AvgA] [float] NULL,
	[B365_Over25] [float] NULL,
	[B365_Under25] [float] NULL,
	[P_Over25] [float] NULL,
	[P_Under25] [float] NULL,
	[Max_Over25] [float] NULL,
	[Max_Under25] [float] NULL,
	[Avg_Over25] [float] NULL,
	[Avg_Under25] [float] NULL,
	[AHh] [float] NULL,
	[B365AHH] [float] NULL,
	[B365AHA] [float] NULL,
	[PAHH] [float] NULL,
	[PAHA] [float] NULL,
	[MaxAHH] [float] NULL,
	[MaxAHA] [float] NULL,
	[AvgAHH] [float] NULL,
	[AvgAHA] [float] NULL,
	[B365CH] [float] NULL,
	[B365CD] [float] NULL,
	[B365CA] [float] NULL,
	[BWCH] [float] NULL,
	[BWCD] [float] NULL,
	[BWCA] [float] NULL,
	[IWCH] [float] NULL,
	[IWCD] [float] NULL,
	[IWCA] [float] NULL,
	[PSCH] [float] NULL,
	[PSCD] [float] NULL,
	[PSCA] [float] NULL,
	[WHCH] [float] NULL,
	[WHCD] [float] NULL,
	[WHCA] [float] NULL,
	[VCCH] [float] NULL,
	[VCCD] [float] NULL,
	[VCCA] [float] NULL,
	[MaxCH] [float] NULL,
	[MaxCD] [float] NULL,
	[MaxCA] [float] NULL,
	[AvgCH] [float] NULL,
	[AvgCD] [float] NULL,
	[AvgCA] [float] NULL,
	[B365C_Over25] [float] NULL,
	[B365C_Under25] [float] NULL,
	[PC_Over25] [float] NULL,
	[PC_Under25] [float] NULL,
	[MaxC_Over25] [float] NULL,
	[MaxC_Under25] [float] NULL,
	[AvgC_Over25] [float] NULL,
	[AvgC_Under25] [float] NULL,
	[AHCh] [float] NULL,
	[B365CAHH] [float] NULL,
	[B365CAHA] [float] NULL,
	[PCAHH] [float] NULL,
	[PCAHA] [float] NULL,
	[MaxCAHH] [float] NULL,
	[MaxCAHA] [float] NULL,
	[AvgCAHH] [float] NULL,
	[AvgCAHA] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FantasyFixtures]    Script Date: 12.06.2023 16:44:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FantasyFixtures](
	[Date] [date] NULL,
	[HomeTeamName] [varchar](50) NULL,
	[HomeTeamShortName] [varchar](3) NULL,
	[AwayTeamName] [varchar](50) NULL,
	[AwayTeamShortName] [varchar](3) NULL,
	[HomeTeamDifficulty] [int] NULL,
	[AwayTeamDifficulty] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matches]    Script Date: 12.06.2023 16:44:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matches](
	[Wk] [int] NULL,
	[Day] [varchar](3) NULL,
	[Date] [date] NULL,
	[Time] [varchar](50) NULL,
	[Home] [varchar](100) NULL,
	[HomeXG] [decimal](4, 1) NULL,
	[AwayXG] [decimal](4, 1) NULL,
	[Away] [varchar](100) NULL,
	[Attendance] [int] NULL,
	[Venue] [varchar](100) NULL,
	[Referee] [varchar](100) NULL,
	[HomeScore] [int] NULL,
	[AwayScore] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 12.06.2023 16:44:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[ShortName] [varchar](3) NULL,
	[BettingOddsTeamName] [varchar](50) NULL,
	[MatchesTeamName] [varchar](50) NULL,
	[StadiumLocation] [varchar](50) NULL,
	[StadiumCoordinates] [varchar](100) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [PremierLeagueAnalysis_raw] SET  READ_WRITE 
GO
