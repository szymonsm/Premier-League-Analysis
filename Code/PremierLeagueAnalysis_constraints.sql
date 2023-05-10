------------- FactMatch -------------

-- HomeScore CONSTRAINT
ALTER TABLE PremierLeagueAnalysis.dbo.FactMatch
ADD CONSTRAINT CHK_HomeScore_NonNegative CHECK (HomeScore >= 0);

-- AwayScore CONSTRAINT
ALTER TABLE PremierLeagueAnalysis.dbo.FactMatch
ADD CONSTRAINT CHK_AwayScore_NonNegative CHECK (AwayScore >= 0);

-- WinnerFlag TRIGGER
CREATE TRIGGER trg_UpdateWinnerFlag
ON PremierLeagueAnalysis.dbo.FactMatch
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE FactMatch
    SET WinnerFlag =
        CASE
            WHEN [FactMatch].HomeScore > [FactMatch].AwayScore THEN 1
            WHEN [FactMatch].AwayScore > [FactMatch].HomeScore THEN 2
            ELSE 0
        END
    FROM FactMatch
    INNER JOIN inserted
    ON FactMatch.MatchID = inserted.MatchID;
END

-- HomeXGScore CONSTRAINT
ALTER TABLE PremierLeagueAnalysis.dbo.FactMatch
ADD CONSTRAINT CHK_HomeXGScore_NonNegative CHECK (HomeXGScore >= 0);

-- AwayXGScore CONSTRAINT
ALTER TABLE PremierLeagueAnalysis.dbo.FactMatch
ADD CONSTRAINT CHK_AwayXGScore_NonNegative CHECK (AwayXGScore >= 0);

-- DifficultyHomeRating CONSTRAINT
ALTER TABLE PremierLeagueAnalysis.dbo.FactMatch
ADD CONSTRAINT CHK_DifficultyHomeRating_Valid CHECK (DifficultyHomeRating BETWEEN 1 AND 5);

-- DifficultyAwayRating CONSTRAINT
ALTER TABLE PremierLeagueAnalysis.dbo.FactMatch
ADD CONSTRAINT CHK_DifficultyAwayRating_Valid CHECK (DifficultyAwayRating BETWEEN 1 AND 5);

-- AttendanceMeasure CONSTRAINT
ALTER TABLE PremierLeagueAnalysis.dbo.FactMatch
ADD CONSTRAINT CHK_AttendanceMeasure_NonNegative CHECK (AttendanceMeasure >= 0);

-- MaxStadiumCapacityMeasure CONSTRAINT
ALTER TABLE PremierLeagueAnalysis.dbo.FactMatch
ADD CONSTRAINT CHK_MaxStadiumCapacityMeasure_NonNegative CHECK (MaxStadiumCapacityMeasure >= 0);

------------- FactBettingOdds -------------

-- All FactBettingOdds CONSTRAINTS
ALTER TABLE PremierLeagueAnalysis.dbo.FactBettingOdds
ADD CONSTRAINT CHK_HomeOdd_NonNegative CHECK (HomeOdd >= 1),
    CONSTRAINT CHK_DrawOdd_NonNegative CHECK (DrawOdd >= 1),
    CONSTRAINT CHK_AwayOdd_NonNegative CHECK (AwayOdd >= 1),
    CONSTRAINT CHK_MaxHomeOdd_NonNegative CHECK (MaxHomeOdd >= 1),
    CONSTRAINT CHK_MaxDrawOdd_NonNegative CHECK (MaxDrawOdd >= 1),
    CONSTRAINT CHK_MaxAwayOdd_NonNegative CHECK (MaxAwayOdd >= 1),
    CONSTRAINT CHK_AvgHomeOdd_NonNegative CHECK (AvgHomeOdd >= 1),
    CONSTRAINT CHK_AvgDrawOdd_NonNegative CHECK (AvgDrawOdd >= 1),
    CONSTRAINT CHK_AvgAwayOdd_NonNegative CHECK (AvgAwayOdd >= 1),
    CONSTRAINT CHK_MoreThanTwoGoalsOdd_NonNegative CHECK (MoreThanTwoGoalsOdd >= 1),
    CONSTRAINT CHK_LessThanThreeGoalsOdd_NonNegative CHECK (LessThanThreeGoalsOdd >= 1),
    CONSTRAINT CHK_MaxMoreThanTwoGoalsOdd_NonNegative CHECK (MaxMoreThanTwoGoalsOdd >= 1),
    CONSTRAINT CHK_AvgMoreThanTwoGoalsOdd_NonNegative CHECK (AvgMoreThanTwoGoalsOdd >= 1),
    CONSTRAINT CHK_MaxLessThanThreeGoalsOdd_NonNegative CHECK (MaxLessThanThreeGoalsOdd >= 1),
    CONSTRAINT CHK_AvgLessThanThreeGoalsOdd_NonNegative CHECK (AvgLessThanThreeGoalsOdd >= 1),
    CONSTRAINT CHK_AsianHandicapHomeOdd_NonNegative CHECK (AsianHandicapHomeOdd >= 1),
    CONSTRAINT CHK_AsianHandicapAwayOdd_NonNegative CHECK (AsianHandicapAwayOdd >= 1),
    CONSTRAINT CHK_MaxAsianHandicapHomeOdd_NonNegative CHECK (MaxAsianHandicapHomeOdd >= 1),
    CONSTRAINT CHK_MaxAsianHandicapAwayOdd_NonNegative CHECK (MaxAsianHandicapAwayOdd >= 1),
    CONSTRAINT CHK_AvgAsianHandicapHomeOdd_NonNegative CHECK (AvgAsianHandicapHomeOdd >= 1),
    CONSTRAINT CHK_AvgAsianHandicapAwayOdd_NonNegative CHECK (AvgAsianHandicapAwayOdd >= 1);

CREATE TRIGGER trg_CalculatePercentages
ON PremierLeagueAnalysis.dbo.FactBettingOdds
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.FactBettingOdds
    SET HomePercent = 1.0 / inserted.HomeOdd,
        DrawPercent = 1.0 / inserted.DrawOdd,
        AwayPercent = 1.0 / inserted.AwayOdd
    FROM inserted
    WHERE inserted.BettingOddsID = dbo.FactBettingOdds.BettingOddsID;
END;

-- Calculated columns CONSTRAINTS
ALTER TABLE PremierLeagueAnalysis.dbo.FactBettingOdds
ADD CONSTRAINT CHK_HomePercent_Between_0_And_1 CHECK (HomePercent BETWEEN 0.0 AND 1.0),
    CONSTRAINT CHK_DrawPercent_Between_0_And_1 CHECK (DrawPercent BETWEEN 0.0 AND 1.0),
    CONSTRAINT CHK_AwayPercent_Between_0_And_1 CHECK (AwayPercent BETWEEN 0.0 AND 1.0);

------------- DimSeason -------------

ALTER TABLE PremierLeagueAnalysis.dbo.DimSeason
ADD CONSTRAINT CHK_SeasonYearStart_NonNegative CHECK (SeasonYearStart >= 0),
    CONSTRAINT CHK_SeasonYearEnd_NonNegative CHECK (SeasonYearEnd >= 0),
    CONSTRAINT CHK_Start_Less_Than_End CHECK (SeasonYearStart <= SeasonYearEnd);

------------- DimDate -------------

-- HERE: CONSIDER TRANSFORMING TO DATE DATA TYPE
ALTER TABLE PremierLeagueAnalysis.dbo.DimDate
ADD CONSTRAINT CHK_Day_Valid CHECK (Day BETWEEN 1 AND 31),
    CONSTRAINT CHK_Month_Valid CHECK (Month BETWEEN 1 AND 12),
    CONSTRAINT CHK_Year_Valid CHECK (Year BETWEEN 1800 AND 2100);

------------- DimGameweek -------------

ALTER TABLE PremierLeagueAnalysis.dbo.DimGameweek
ADD CONSTRAINT CHK_GameweekNumber_Valid CHECK (GameweekNumber BETWEEN 1 AND 38);

------------- DimTime -------------

ALTER TABLE PremierLeagueAnalysis.dbo.DimTime
ADD CONSTRAINT CHK_TimeHour_NonNegative CHECK (TimeHour >= 0),
    CONSTRAINT CHK_TimeMinutes_NonNegative CHECK (TimeMinutes >= 0);