--HERE WE CREATE A STRUCT SEASON_STATS WHHICH WILL BE OF TYPE SEASON_STATS
create type season_stats as (
					season INTEGER,
					gp INTEGER,
					pts real,
					reb real,
					ast real		
)


--Here we create new type called scoring_class
--this enumeration will have only these values.
create type scoring_class as ENUM('star','good','average','bad');


--HERE WE WILL CREATE PLAYERS TABLE WHICH WILL BE OUR SEED POINT OF CUMULATIVE TABLE
create table players (
				player_name TEXT,
				height TEXT,
				college TEXT,
				country TEXT,
				draft_year TEXT,
				draft_round TEXT,
				draft_number TEXT,
				season_stats season_stats[],
				scoring_class scoring_CLASS,
				years_since_last_season integer,
				current_season INTEGER,
				PRIMARY KEY (player_name, current_season)
)