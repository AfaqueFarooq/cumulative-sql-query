# Cumulative SQL Query

This repository contains a powerful cumulative SQL query that incrementally builds up player history and allows for historical analysis. The query is designed to work with a `players` table, which stores player statistics year by year.

## Table Structure

The `players` table has the following structure:

- `player_name`: Name of the player.
- `height`: Height of the player.
- `college`: College attended by the player.
- `country`: Country of origin.
- `draft_year`: Year the player was drafted.
- `draft_round`: Draft round.
- `draft_number`: Draft number.
- `season_stats`: An array of `season_stats` type, which stores statistics for each season.
- `scoring_class`: An enumeration (`scoring_class`) that classifies players based on their scoring performance.
- `years_since_last_season`: Number of years since the last season played.
- `current_season`: The current season being processed.

## SQL Files

1. **`create_tables.sql`**  
   Contains the SQL code for creating the `season_stats` type, `scoring_class` enum, and `players` table.

2. **`insert_data.sql`**  
   Contains the cumulative SQL query that inserts data into the `players` table year by year.

3. **`analytics.sql`**  
   Contains SQL queries for performing analytics, such as calculating player improvement or retrieving the latest season stats.

4. **`unnest_example.sql`**  
   Contains the SQL query for unnesting the `season_stats` array to analyze individual seasons.
