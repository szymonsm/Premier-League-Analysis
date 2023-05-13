## Inserting Data from CSV Files

### Overview

The goal is to insert rows of data from CSV files (located in the Data directory) into the empty tables in a database created by the *RawData_create_database.sql* script. There are three tables:

* Matches - containing general information about each match. This table will be filled with rows from files following the naming pattern: *scores-fixtures-\<season years>.csv*.
* BettingOdds - containing ~100 columns of information regarding the betting for each match. This table will be filled with rows from files following the naming pattern: *betting-odds-\<season years>.csv*.
* FantasyFixtures - containing information regarding the strength of both teams participating in a match. This data is taken from an official Premier League game, and changes throughout the season depending on the outcomes.

### How to make it work?
Here are the steps you can follow to achieve the desired outcome:

1. Run the *RawData_create_database.sql* script in order to create an SQL database with empty tables to store raw data, which will be inserted from CSV files.  
2. Install the necessary python packages from the *environment.yml* file. The required packages are: *numpy*, *pandas*, *pyodbc* and *sqlalchemy* on Python version 3.11.3 (or at least this version is known to work). If you're using conda, you can probably just run:
```python
conda env create -f environment.yml
conda activate hurtownia
```
4. In the *insert_csv.py* script, find the line in the `main()` function which states the server name: `server = '<some server name>'` and replace it with your own SQL server name.
3. Run the *insert_csv.py* script. If you're using conda, you might want to execute it by running `conda run -n hurtownia python insert_csv.py`.

---

### *insert_csv.py* documentation
The insert_scores_fixtures() function reads a CSV file containing football match results and cleans it up. The function removes unnecessary columns, renames some columns, and splits the Score column into HomeScore and AwayScore columns. Finally, it writes the processed data into the Matches table of the SQL Server database.

The insert_betting_odds() function reads a CSV file containing betting odds for football matches and cleans it up. The function removes unnecessary columns, renames some columns, and converts the Date column into the datetime format. Finally, it writes the processed data into the BettingOdds table of the SQL Server database.

The insert_fantasy_fixtures() function reads two CSV files, one containing team names and another containing football fixtures, and cleans them up. The function merges the two dataframes, renames some columns, and converts the kickoff_time column into the datetime format. Finally, it writes the processed data into the FantasyFixtures table of the SQL Server database.

The main() function creates a connection to the SQL Server database, gets the file paths of the CSV files to be processed, and calls the three data processing functions for each file. The handles files for multiple seasons of the English Premier League.
