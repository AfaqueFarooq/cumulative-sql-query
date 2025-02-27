-- analytics.sql
SELECT player_name,
    (season_stats[cardinality(season_stats)]::season_stats).pts /
    CASE 
        WHEN (season_stats[1]::season_stats).pts = 0 THEN 1 
        ELSE (season_stats[1]::season_stats).pts 
    END AS improvement_ratio
FROM players
WHERE current_season = 2001
ORDER BY improvement_ratio DESC;