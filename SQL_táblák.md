# role
### id
### name

# user
### id
### firstname
### lastname
### email
### is_email_verified
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


# team_status
### id
### name


# team
### id
### name
### short_name
### email
### team_league_id
### city
### age_group_id
### sport_id
### created_at
### team_status_id

# team_league
### id
### league_id
### season

# user-team-role
### id
### role_id
### user_id
### team_id


# invitation_status
### id
### name

# team_invitations
### id
### team_id
### invited_email
### role_id
### invited_by_user_id
### invitation_status_id
### created_at

# players
### id
### firstname
### lastname
### birth_date
### profile_pic
### email
### telephone_number

# team_player
### id
### team_id
### player_id
### position_id
### shirt_number

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

# training_attendance
### id
### team_player_id
### training_id
### appaered_status_id

# event_status
### id
### name

# training_type
### id
### name

# training-exercise_dictionary
### id
### excercise_dictionary_id
### is_excercise_finished
### order
### length
### intensity

# training
### calendar_training_id
### name
### start_datetime
### length
### end_datetime
### location
### description
### event_status_id
### training_type_id
### training-exercise_dictionary_id

# individual_trainings
### id
### name
### description
### team_player_id
### training_type_id
### training-exercise_dictionary_id

# match_events_list
### id
### name

# formation
### id 
### name
### position_id

# match_lineup
### id
### team_player_id
### match_id
### is_starter
### position_id

# result
### id
### name

# match
### calendar_match_id
### league_id
### team_id
### time
### date
### location
### description
### away_team
### event_status_id
### result_id
### is_home
### own_goal_count
### opponent_goal_count
### formation_id

# match-match_events_list
### id
### match_calendar_match_id
### match_event_list_id
### minute
### side
### main_match_lineup_id
### secondary_match_lineup_id

# calendar_event_list
### id
### name

# calendar
### id
### name
### date
### time
### match_id
### training_id
### calendar_event_list_id

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
### physical_load
