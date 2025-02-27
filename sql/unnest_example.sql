---TO UNEST THE TEMPORAL PIECES
with unnested as(
select player_name ,
	unnest(season_stats) as season_stats
	from players 
where current_season = 1997 
and player_name = 'Michael Jordan'
)
select player_name , (season_stats::season_stats).*
from unnested