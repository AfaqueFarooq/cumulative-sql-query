insert into players
with yesterday as (
	select * from players
	where current_season = 2000
),
	today as (
	select * from player_seasons
	where season = 2001
	) 

select 
		coalesce (t.player_name , y.player_name) as player_name,
		coalesce (t.height , y.height) as height,
		coalesce (t.college , y.college) as college,
		coalesce (t.country , y.country) as country,
		coalesce (t.draft_year , y.draft_year) as draft_year,
		coalesce (t.draft_round , y.draft_round) as draft_round,
		coalesce (t.draft_number , y.draft_number) as draft_number,
		CASE 
			when y.season_stats is null then
				 Array[row(
					t.season,
					t.gp,
					t.pts,
					t.reb,
					t.ast
				)::season_stats]
			when t.season is not null then
			y.season_stats || Array[row(
					t.season,
					t.gp,
					t.pts,
					t.reb,
					t.ast
				)::season_stats] 
			else 
				y.season_stats
			end as season_stats,
			case 
				WHEN t.season is not null then
				 case when t.pts > 20 then 'star'
				 	when t.pts > 15 then 'good'
					 when t.pts > 10 then 'average'
					 else 'bad'
				end::scoring_class
				else y.scoring_class
			end,
			case WHEN
				t.season is not null then 0
				else y.years_since_last_season + 1
			end as years_since_last_season,
			Coalesce(t.season , y.current_season + 1) as current_season
	from today t 
	full outer join yesterday y
		on t.player_name = y.player_name;