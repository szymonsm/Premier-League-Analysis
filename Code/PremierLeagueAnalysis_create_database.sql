USE [master]
GO
/****** Object:  Database [PremierLeagueAnalysis]    Script Date: 10.05.2023 21:03:33 ******/
CREATE DATABASE [PremierLeagueAnalysis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PremierLeagueAnalysis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PremierLeagueAnalysis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PremierLeagueAnalysis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PremierLeagueAnalysis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PremierLeagueAnalysis] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PremierLeagueAnalysis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PremierLeagueAnalysis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET ARITHABORT OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET RECOVERY FULL 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET  MULTI_USER 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PremierLeagueAnalysis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PremierLeagueAnalysis] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PremierLeagueAnalysis', N'ON'
GO
ALTER DATABASE [PremierLeagueAnalysis] SET QUERY_STORE = OFF
GO
USE [PremierLeagueAnalysis]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 10.05.2023 21:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateID] [bigint] NOT NULL,
	[Day] [smallint] NOT NULL,
	[Month] [smallint] NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimGameweek]    Script Date: 10.05.2023 21:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimGameweek](
	[GameweekID] [bigint] NOT NULL,
	[GameweekNumber] [int] NOT NULL,
 CONSTRAINT [PK_DimGameweek] PRIMARY KEY CLUSTERED 
(
	[GameweekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimReferee]    Script Date: 10.05.2023 21:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimReferee](
	[RefereeID] [bigint] NOT NULL,
	[RefereeName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_DimReferee] PRIMARY KEY CLUSTERED 
(
	[RefereeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSeason]    Script Date: 10.05.2023 21:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSeason](
	[SeasonID] [bigint] NOT NULL,
	[SeasonYearStart] [int] NOT NULL,
	[SeasonYearEnd] [int] NOT NULL,
 CONSTRAINT [PK_DimSeason] PRIMARY KEY CLUSTERED 
(
	[SeasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTeam]    Script Date: 10.05.2023 21:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTeam](
	[TeamID] [bigint] NOT NULL,
	[TeamName] [varchar](100) NOT NULL,
	[City] [varchar](100) NOT NULL,
 CONSTRAINT [PK_DimTeam] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTime]    Script Date: 10.05.2023 21:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTime](
	[TimeID] [bigint] NOT NULL,
	[TimeHour] [smallint] NOT NULL,
	[TimeMinutes] [smallint] NOT NULL,
 CONSTRAINT [PK_DimTime] PRIMARY KEY CLUSTERED 
(
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactBettingOdds]    Script Date: 10.05.2023 21:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactBettingOdds](
	[BettingOddsID] [bigint] NOT NULL,
	[HomeTeamID] [bigint] NOT NULL,
	[AwayTeamID] [bigint] NOT NULL,
	[SeasonID] [bigint] NOT NULL,
	[GameweekID] [bigint] NOT NULL,
	[DateID] [bigint] NOT NULL,
	[HomeOdd] [float] NOT NULL,
	[DrawOdd] [float] NOT NULL,
	[AwayOdd] [float] NOT NULL,
	[HomePercent] [decimal](5, 4) NOT NULL,
	[DrawPercent] [decimal](5, 4) NOT NULL,
	[AwayPercent] [decimal](5, 4) NOT NULL,
	[MaxHomeOdd] [float] NOT NULL,
	[MaxDrawOdd] [float] NOT NULL,
	[MaxAwayOdd] [float] NOT NULL,
	[AvgHomeOdd] [float] NOT NULL,
	[AvgDrawOdd] [float] NOT NULL,
	[AvgAwayOdd] [float] NOT NULL,
	[MoreThanTwoGoalsOdd] [float] NOT NULL,
	[LessThanThreeGoalsOdd] [float] NOT NULL,
	[MaxMoreThanTwoGoalsOdd] [float] NOT NULL,
	[AvgMoreThanTwoGoalsOdd] [float] NOT NULL,
	[MaxLessThanThreeGoalsOdd] [float] NOT NULL,
	[AvgLessThanThreeGoalsOdd] [float] NOT NULL,
	[AsianHandicapHomeOdd] [float] NOT NULL,
	[AsianHandicapAwayOdd] [float] NOT NULL,
	[MaxAsianHandicapHomeOdd] [float] NOT NULL,
	[MaxAsianHandicapAwayOdd] [float] NOT NULL,
	[AvgAsianHandicapHomeOdd] [float] NOT NULL,
	[AvgAsianHandicapAwayOdd] [float] NOT NULL,
 CONSTRAINT [PK_FactBettingOdds] PRIMARY KEY CLUSTERED 
(
	[BettingOddsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactMatch]    Script Date: 10.05.2023 21:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactMatch](
	[MatchID] [bigint] NOT NULL,
	[HomeTeamID] [bigint] NOT NULL,
	[AwayTeamID] [bigint] NOT NULL,
	[SeasonID] [bigint] NOT NULL,
	[GameweekID] [bigint] NOT NULL,
	[DateID] [bigint] NOT NULL,
	[TimeID] [bigint] NOT NULL,
	[RefereeID] [bigint] NOT NULL,
	[StadiumName] [varchar](100) NOT NULL,
	[HomeScore] [smallint] NOT NULL,
	[AwayScore] [smallint] NOT NULL,
	[WinnerFlag] [smallint] NOT NULL,
	[HomeXGScore] [float] NOT NULL,
	[AwayXGScore] [float] NOT NULL,
	[DifficultyHomeRating] [smallint] NOT NULL,
	[DifficultyAwayRating] [smallint] NOT NULL,
	[AttendanceMeasure] [bigint] NOT NULL,
	[MaxStadiumCapacityMeasure] [bigint] NOT NULL,
 CONSTRAINT [PK_FactMatch] PRIMARY KEY CLUSTERED 
(
	[MatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactBettingOdds]  WITH CHECK ADD  CONSTRAINT [FK_FactBettingOdds_DimDate] FOREIGN KEY([DateID])
REFERENCES [dbo].[DimDate] ([DateID])
GO
ALTER TABLE [dbo].[FactBettingOdds] CHECK CONSTRAINT [FK_FactBettingOdds_DimDate]
GO
ALTER TABLE [dbo].[FactBettingOdds]  WITH CHECK ADD  CONSTRAINT [FK_FactBettingOdds_DimGameweek] FOREIGN KEY([GameweekID])
REFERENCES [dbo].[DimGameweek] ([GameweekID])
GO
ALTER TABLE [dbo].[FactBettingOdds] CHECK CONSTRAINT [FK_FactBettingOdds_DimGameweek]
GO
ALTER TABLE [dbo].[FactBettingOdds]  WITH CHECK ADD  CONSTRAINT [FK_FactBettingOdds_DimSeason] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[DimSeason] ([SeasonID])
GO
ALTER TABLE [dbo].[FactBettingOdds] CHECK CONSTRAINT [FK_FactBettingOdds_DimSeason]
GO
ALTER TABLE [dbo].[FactBettingOdds]  WITH CHECK ADD  CONSTRAINT [FK_FactBettingOdds_DimTeam] FOREIGN KEY([HomeTeamID])
REFERENCES [dbo].[DimTeam] ([TeamID])
GO
ALTER TABLE [dbo].[FactBettingOdds] CHECK CONSTRAINT [FK_FactBettingOdds_DimTeam]
GO
ALTER TABLE [dbo].[FactBettingOdds]  WITH CHECK ADD  CONSTRAINT [FK_FactBettingOdds_DimTeam1] FOREIGN KEY([AwayTeamID])
REFERENCES [dbo].[DimTeam] ([TeamID])
GO
ALTER TABLE [dbo].[FactBettingOdds] CHECK CONSTRAINT [FK_FactBettingOdds_DimTeam1]
GO
ALTER TABLE [dbo].[FactMatch]  WITH CHECK ADD  CONSTRAINT [FK_FactMatch_DimDate] FOREIGN KEY([DateID])
REFERENCES [dbo].[DimDate] ([DateID])
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [FK_FactMatch_DimDate]
GO
ALTER TABLE [dbo].[FactMatch]  WITH CHECK ADD  CONSTRAINT [FK_FactMatch_DimGameweek] FOREIGN KEY([GameweekID])
REFERENCES [dbo].[DimGameweek] ([GameweekID])
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [FK_FactMatch_DimGameweek]
GO
ALTER TABLE [dbo].[FactMatch]  WITH CHECK ADD  CONSTRAINT [FK_FactMatch_DimReferee] FOREIGN KEY([RefereeID])
REFERENCES [dbo].[DimReferee] ([RefereeID])
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [FK_FactMatch_DimReferee]
GO
ALTER TABLE [dbo].[FactMatch]  WITH CHECK ADD  CONSTRAINT [FK_FactMatch_DimSeason] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[DimSeason] ([SeasonID])
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [FK_FactMatch_DimSeason]
GO
ALTER TABLE [dbo].[FactMatch]  WITH CHECK ADD  CONSTRAINT [FK_FactMatch_DimTeam] FOREIGN KEY([HomeTeamID])
REFERENCES [dbo].[DimTeam] ([TeamID])
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [FK_FactMatch_DimTeam]
GO
ALTER TABLE [dbo].[FactMatch]  WITH CHECK ADD  CONSTRAINT [FK_FactMatch_DimTeam1] FOREIGN KEY([AwayTeamID])
REFERENCES [dbo].[DimTeam] ([TeamID])
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [FK_FactMatch_DimTeam1]
GO
ALTER TABLE [dbo].[FactMatch]  WITH CHECK ADD  CONSTRAINT [FK_FactMatch_DimTime] FOREIGN KEY([TimeID])
REFERENCES [dbo].[DimTime] ([TimeID])
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [FK_FactMatch_DimTime]
GO
ALTER TABLE [dbo].[DimDate]  WITH CHECK ADD  CONSTRAINT [CHK_Day_Valid] CHECK  (([Day]>=(1) AND [Day]<=(31)))
GO
ALTER TABLE [dbo].[DimDate] CHECK CONSTRAINT [CHK_Day_Valid]
GO
ALTER TABLE [dbo].[DimDate]  WITH CHECK ADD  CONSTRAINT [CHK_Month_Valid] CHECK  (([Month]>=(1) AND [Month]<=(12)))
GO
ALTER TABLE [dbo].[DimDate] CHECK CONSTRAINT [CHK_Month_Valid]
GO
ALTER TABLE [dbo].[DimDate]  WITH CHECK ADD  CONSTRAINT [CHK_Year_Valid] CHECK  (([Year]>=(1800) AND [Year]<=(2100)))
GO
ALTER TABLE [dbo].[DimDate] CHECK CONSTRAINT [CHK_Year_Valid]
GO
ALTER TABLE [dbo].[DimGameweek]  WITH CHECK ADD  CONSTRAINT [CHK_GameweekNumber_Valid] CHECK  (([GameweekNumber]>=(1) AND [GameweekNumber]<=(38)))
GO
ALTER TABLE [dbo].[DimGameweek] CHECK CONSTRAINT [CHK_GameweekNumber_Valid]
GO
ALTER TABLE [dbo].[DimSeason]  WITH CHECK ADD  CONSTRAINT [CHK_SeasonYearEnd_NonNegative] CHECK  (([SeasonYearEnd]>=(0)))
GO
ALTER TABLE [dbo].[DimSeason] CHECK CONSTRAINT [CHK_SeasonYearEnd_NonNegative]
GO
ALTER TABLE [dbo].[DimSeason]  WITH CHECK ADD  CONSTRAINT [CHK_SeasonYearStart_NonNegative] CHECK  (([SeasonYearStart]>=(0)))
GO
ALTER TABLE [dbo].[DimSeason] CHECK CONSTRAINT [CHK_SeasonYearStart_NonNegative]
GO
ALTER TABLE [dbo].[DimSeason]  WITH CHECK ADD  CONSTRAINT [CHK_Start_Less_Than_End] CHECK  (([SeasonYearStart]<=[SeasonYearEnd]))
GO
ALTER TABLE [dbo].[DimSeason] CHECK CONSTRAINT [CHK_Start_Less_Than_End]
GO
ALTER TABLE [dbo].[DimTime]  WITH CHECK ADD  CONSTRAINT [CHK_TimeHour_NonNegative] CHECK  (([TimeHour]>=(0)))
GO
ALTER TABLE [dbo].[DimTime] CHECK CONSTRAINT [CHK_TimeHour_NonNegative]
GO
ALTER TABLE [dbo].[DimTime]  WITH CHECK ADD  CONSTRAINT [CHK_TimeMinutes_NonNegative] CHECK  (([TimeMinutes]>=(0)))
GO
ALTER TABLE [dbo].[DimTime] CHECK CONSTRAINT [CHK_TimeMinutes_NonNegative]
GO
ALTER TABLE [dbo].[FactBettingOdds]  WITH CHECK ADD  CONSTRAINT [CHK_AwayPercent_Between_0_And_1] CHECK  (([AwayPercent]>=(0.0) AND [AwayPercent]<=(1.0)))
GO
ALTER TABLE [dbo].[FactBettingOdds] CHECK CONSTRAINT [CHK_AwayPercent_Between_0_And_1]
GO
ALTER TABLE [dbo].[FactBettingOdds]  WITH CHECK ADD  CONSTRAINT [CHK_DrawPercent_Between_0_And_1] CHECK  (([DrawPercent]>=(0.0) AND [DrawPercent]<=(1.0)))
GO
ALTER TABLE [dbo].[FactBettingOdds] CHECK CONSTRAINT [CHK_DrawPercent_Between_0_And_1]
GO
ALTER TABLE [dbo].[FactBettingOdds]  WITH CHECK ADD  CONSTRAINT [CHK_HomePercent_Between_0_And_1] CHECK  (([HomePercent]>=(0.0) AND [HomePercent]<=(1.0)))
GO
ALTER TABLE [dbo].[FactBettingOdds] CHECK CONSTRAINT [CHK_HomePercent_Between_0_And_1]
GO
ALTER TABLE [dbo].[FactMatch]  WITH CHECK ADD  CONSTRAINT [CHK_AttendanceMeasure_NonNegative] CHECK  (([AttendanceMeasure]>=(0)))
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [CHK_AttendanceMeasure_NonNegative]
GO
ALTER TABLE [dbo].[FactMatch]  WITH CHECK ADD  CONSTRAINT [CHK_AwayScore_NonNegative] CHECK  (([AwayScore]>=(0)))
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [CHK_AwayScore_NonNegative]
GO
ALTER TABLE [dbo].[FactMatch]  WITH CHECK ADD  CONSTRAINT [CHK_AwayXGScore_NonNegative] CHECK  (([AwayXGScore]>=(0)))
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [CHK_AwayXGScore_NonNegative]
GO
ALTER TABLE [dbo].[FactMatch]  WITH CHECK ADD  CONSTRAINT [CHK_DifficultyAwayRating_Valid] CHECK  (([DifficultyAwayRating]>=(1) AND [DifficultyAwayRating]<=(5)))
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [CHK_DifficultyAwayRating_Valid]
GO
ALTER TABLE [dbo].[FactMatch]  WITH CHECK ADD  CONSTRAINT [CHK_DifficultyHomeRating_Valid] CHECK  (([DifficultyHomeRating]>=(1) AND [DifficultyHomeRating]<=(5)))
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [CHK_DifficultyHomeRating_Valid]
GO
ALTER TABLE [dbo].[FactMatch]  WITH CHECK ADD  CONSTRAINT [CHK_HomeScore_NonNegative] CHECK  (([HomeScore]>=(0)))
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [CHK_HomeScore_NonNegative]
GO
ALTER TABLE [dbo].[FactMatch]  WITH CHECK ADD  CONSTRAINT [CHK_HomeXGScore_NonNegative] CHECK  (([HomeXGScore]>=(0)))
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [CHK_HomeXGScore_NonNegative]
GO
ALTER TABLE [dbo].[FactMatch]  WITH CHECK ADD  CONSTRAINT [CHK_MaxStadiumCapacityMeasure_NonNegative] CHECK  (([MaxStadiumCapacityMeasure]>=(0)))
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [CHK_MaxStadiumCapacityMeasure_NonNegative]
GO
USE [master]
GO
ALTER DATABASE [PremierLeagueAnalysis] SET  READ_WRITE 
GO
