# role
### id
### name

# user
### id
### firstname
### lastname
### email
### password
### profile_pic
### telephone_number

# leagues
### id
### name

# age_group
### id
### name

# sport
### id
### name

# positions
### id
### name
### sport_id

# team
### id
### name
### short_name
### email
### league_id
### city
### age_group_id
### sport_id

# user-team-role
### id
### role_id
### user_id
### team_id

# players
### id
### firstname
### lastname
### shirt_number
### team_id
### position_id
### birth_date
### profile_pic
### email
### telephone_number

# exercise_tools
### id
### name

# exercise_categories
### id
### name

# exercise_dictionary
### id
### name
### exercise_category_id
### description
### min_players
### exercise_tool_id
### field_size

# appaered_status
### id
### name

# training_lineup
### id
### player_id
### training_id
### appaered_status_id

# training_status
### id
### name

# training_type
### id
### name

# training
### id
### name
### start_datetime
### length
### end_datetime
### location
### goal
### description
### training_status_id
### training_type_id

# training-exercise_dictionary
### id
### training_id
### excercise_dictionary_id
### is_excercise_finished
### length
### intensity

# match_events_list
### id
### name

# formation
### id 
### name
### position_id

# team_lineup
### id
### player_id
### match_id
### formation_id
### is_starter
### position_id

# result
### id
### name

# match
### id
### league_id
### team_id
### date
### description
### away_team
### is_finished
### result_id

# match-match_events_list
### id
### match_id
### match_event_list_id
### minute
### side
### main_team_lineup_id
### secondary_team_lineup_id

# eldöntendő kérdés: hogy a meccs és az edzés id rögzítsük-e a naptári esemény létrehozásakor és/vagy ezeket exportálni lehessen így a játékosoknak

# calendar_event_list
### id
### name

# calendar
### id

# team_stats
### team_id
### match_count
### win_count
### loss_count
### draw_count
### conceded_goal_count
### goal_count
### training_count
### training_avg_appaerence

# player_stats
### player_id
### match_played_count
### played_minutes
### goal_count
### yellow_card_count
### red_card_count
### training_appaerence
### tension (training-exercise_dictionary.intensity, training-exercise_dictionary.length) kell az a képlet



