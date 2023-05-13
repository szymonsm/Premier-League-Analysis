import pandas as pd
from sqlalchemy import create_engine
import os
import numpy as np




def insert_scores_fixtures(file_name, base_dir, engine):
    file_path = os.path.join(base_dir, 'Data', file_name)
    df =  pd.read_csv(file_path).rename(columns={"xG": "HomeXG","xG.1": "AwayXG", "Match Report": "MatchReport"})
    df["HomeScore"] = df["Score"].apply(lambda x: None if not isinstance(x,str) else x.split("–")[0])
    df["AwayScore"] = df["Score"].apply(lambda x: None if not isinstance(x,str) else x.split("–")[1])
    df["Time"] = df["Time"].str.split(" ", expand = True)[0]
    df["Attendance"].fillna(0, inplace = True)
    df.drop(columns = ["MatchReport", "Notes", "Score"], inplace = True)
    df.to_sql('Matches', engine, if_exists='append', index=False)



def insert_betting_odds(file_name, base_dir, engine):
    file_path = os.path.join(base_dir, 'Data', file_name)
    df = pd.read_csv(file_path).drop(columns = ["Div"])
    df.rename(columns={
        "B365>2.5" :  "B365_Over25",
        "B365<2.5" :  "B365_Under25",
        "P>2.5" :  "P_Over25",
        "P<2.5" :  "P_Under25",
        "Max>2.5" :  "Max_Over25",
        "Max<2.5" :  "Max_Under25",
        "Avg>2.5" :  "Avg_Over25",
        "Avg<2.5" :  "Avg_Under25",
        "B365C>2.5" : "B365C_Over25",
        "B365C<2.5" : "B365C_Under25",
        "PC>2.5" : "PC_Over25",
        "PC<2.5" : "PC_Under25",
        "MaxC>2.5" : "MaxC_Over25",
        "MaxC<2.5" : "MaxC_Under25",
        "AvgC>2.5" : "AvgC_Over25",
        "AvgC<2.5" : "AvgC_Under25", 
    },inplace=True)
    df["Date"] = pd.to_datetime(df["Date"], format='%d/%m/%Y')
    df.to_sql('BettingOdds', engine, if_exists='append', index=False)




def insert_fantasy_fixtures(season, base_dir, engine):
    teams_file_path = os.path.join(base_dir, 'Data', f'fantasy-teams-{season}.csv')
    teams = pd.read_csv(teams_file_path)[["id","name","short_name"]]
    
    fixtures_file_path = os.path.join(base_dir, 'Data', f'fantasy-fixtures-{season}.csv')
    fixtures = pd.read_csv(fixtures_file_path)[["kickoff_time","team_h","team_a","team_h_difficulty","team_a_difficulty"]]
    fixtures["Date"] = pd.to_datetime(fixtures["kickoff_time"], format='%Y-%m-%dT%H:%M:%SZ').dt.date
    

    fixtures = fixtures.merge(teams, left_on = "team_h", right_on = "id", how = "left").drop(columns = ["id","team_h"]).rename(columns = {"name":"HomeTeamName","short_name":"HomeTeamShortName"})
    fixtures = fixtures.merge(teams, left_on = "team_a", right_on = "id", how = "left").drop(columns = ["id","team_a"]).rename(columns = {"name":"AwayTeamName","short_name":"AwayTeamShortName"})
    fixtures = fixtures[["Date","HomeTeamName","HomeTeamShortName","AwayTeamName","AwayTeamShortName","team_h_difficulty","team_a_difficulty"]].rename(columns = {"team_h_difficulty":"HomeTeamDifficulty","team_a_difficulty":"AwayTeamDifficulty"})
    fixtures.to_sql('FantasyFixtures', engine, if_exists='append', index=False)




def main():
    server = 'DESKTOP-CBA20L1' # this is the name of your server in SQL Server Management Studio
    database = 'PremierLeagueAnalysis_raw'
    db_connection_string = f'mssql+pyodbc://{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server'
    engine = create_engine(db_connection_string)
    
    current_dir = os.getcwd()
    base_dir = os.path.dirname(os.path.dirname(current_dir))
    
    score_fixtures_names = ["scores-fixtures-19-20.csv", "scores-fixtures-20-21.csv", "scores-fixtures-21-22.csv", "scores-fixtures-22-23.csv"]
    for file_name in score_fixtures_names:
        insert_scores_fixtures(file_name, base_dir, engine)
    
    betting_odds_names = ["betting-odds-19-20.csv", "betting-odds-20-21.csv", "betting-odds-21-22.csv", "betting-odds-22-23.csv"]
    for file_name in betting_odds_names:
        insert_betting_odds(file_name, base_dir, engine)
        
    seasons = ["19-20", "20-21", "21-22", "22-23"]    
    for season in seasons:
        insert_fantasy_fixtures(season, base_dir, engine)
        
    print("Insertion complete")
    
if __name__ == "__main__":
    main()