USE [PremierLeagueAnalysis]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 31.05.2023 22:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateID] [bigint] IDENTITY(1,1) NOT NULL,
	[Day] [smallint] NOT NULL,
	[Month] [smallint] NOT NULL,
	[Year] [int] NOT NULL,
	[IsWeekDay] [bit] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimGameweek]    Script Date: 31.05.2023 22:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimGameweek](
	[GameweekID] [bigint] IDENTITY(1,1) NOT NULL,
	[GameweekNumber] [int] NOT NULL,
	[SeasonYearStart] [int] NOT NULL,
	[SeasonYearEnd] [int] NOT NULL,
 CONSTRAINT [PK_DimGameweek] PRIMARY KEY CLUSTERED 
(
	[GameweekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimReferee]    Script Date: 31.05.2023 22:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimReferee](
	[RefereeID] [bigint] IDENTITY(1,1) NOT NULL,
	[RefereeFullName] [varchar](100) NOT NULL,
	[RefereeFirstName] [varchar](50) NOT NULL,
	[RefereeLastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DimReferee] PRIMARY KEY CLUSTERED 
(
	[RefereeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTeam]    Script Date: 31.05.2023 22:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTeam](
	[TeamID] [bigint] IDENTITY(1,1) NOT NULL,
	[ShortName] [varchar](3) NOT NULL,
	[BettingOddsTeamName] [varchar](50) NOT NULL,
	[TeamName] [varchar](100) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[StadiumName] [varchar](100) NOT NULL,
	[MaxStadiumCapacityMeasure] [bigint] NOT NULL,
	[StadiumCoordinates] [varchar](100) NOT NULL,
	[ValidFromDate] [datetime] NOT NULL,
	[ValidToDate] [datetime] NOT NULL,
	[ActiveFlag] [bit] NOT NULL,
 CONSTRAINT [PK_DimTeam] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTime]    Script Date: 31.05.2023 22:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTime](
	[TimeID] [bigint] IDENTITY(1,1) NOT NULL,
	[TimeHour] [smallint] NOT NULL,
	[TimeMinutes] [smallint] NOT NULL,
	[IsNightFlag] [bit] NOT NULL,
 CONSTRAINT [PK_DimTime] PRIMARY KEY CLUSTERED 
(
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactBettingOdds]    Script Date: 31.05.2023 22:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactBettingOdds](
	[BettingOddsID] [bigint] NOT NULL,
	[HomeTeamID] [bigint] NOT NULL,
	[AwayTeamID] [bigint] NOT NULL,
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
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_FactBettingOdds] PRIMARY KEY CLUSTERED 
(
	[BettingOddsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactBettingOddsStaging]    Script Date: 31.05.2023 22:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactBettingOddsStaging](
	[HomeTeamID] [bigint] NOT NULL,
	[AwayTeamID] [bigint] NOT NULL,
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
	[Timestamp] [datetime] NOT NULL,
	[BettingOddsID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BettingOddsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactMatch]    Script Date: 31.05.2023 22:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactMatch](
	[HomeTeamID] [bigint] NOT NULL,
	[AwayTeamID] [bigint] NOT NULL,
	[GameweekID] [bigint] NOT NULL,
	[DateID] [bigint] NOT NULL,
	[TimeID] [bigint] NOT NULL,
	[RefereeID] [bigint] NOT NULL,
	[HomeScore] [smallint] NOT NULL,
	[AwayScore] [smallint] NOT NULL,
	[WinnerFlag] [smallint] NOT NULL,
	[HomeXGScore] [float] NOT NULL,
	[AwayXGScore] [float] NOT NULL,
	[DifficultyHomeRating] [smallint] NOT NULL,
	[DifficultyAwayRating] [smallint] NOT NULL,
	[AttendanceMeasure] [bigint] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[MatchID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactMatchStaging]    Script Date: 31.05.2023 22:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactMatchStaging](
	[HomeTeamID] [bigint] NOT NULL,
	[AwayTeamID] [bigint] NOT NULL,
	[GameweekID] [bigint] NOT NULL,
	[DateID] [bigint] NOT NULL,
	[TimeID] [bigint] NOT NULL,
	[RefereeID] [bigint] NOT NULL,
	[HomeScore] [smallint] NOT NULL,
	[AwayScore] [smallint] NOT NULL,
	[WinnerFlag] [smallint] NOT NULL,
	[HomeXGScore] [float] NOT NULL,
	[AwayXGScore] [float] NOT NULL,
	[DifficultyHomeRating] [smallint] NOT NULL,
	[DifficultyAwayRating] [smallint] NOT NULL,
	[AttendanceMeasure] [bigint] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[MatchID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
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
