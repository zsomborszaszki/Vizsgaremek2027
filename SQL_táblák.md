|role|
|:---:|
|id -- int -- primary|
|name -- varchar(255) -- unique|

|user|
|:---:|
|id -- int -- primary|
|firstname -- varchar(255)|
|lastname -- varchar(255)|
|email -- varchar(255) -- unique|
|is_email_verified -- bool|
|password -- varchar(255)|
|profile_pic|
|telephone_number -- varchar(255) -- unique|


|leagues|
|:---:|
| id -- int -- primary|
|name -- varchar(255) -- unique|


| age_group|
|:---:|
| id -- int -- primary|
| name -- varchar(255) -- unique|


| sport|
|:---:|
| id -- int -- primary|
| name -- varchar(255) unique|


| positions|
|:---:|
| id -- int -- primary|
| name -- varchar(255) -- unique|
| sport_id -- int -- foreign|


| team_status|
|:---:|
| id -- int -- primary|
| name -- varchar(255) -- unique|


|team_league|
|:---:|
|id -- int -- primary|
|league_id -- int -- foreign|
|season -- int|


|team|
|:---:|
|id -- int -- primary|
|name -- varchar(255)|
|short_name -- varchar(255)|
|email -- varchar(255) -- unique|
|team_league_id -- int -- foreign|
|city -- varchar(255)|
|age_group_id -- int -- foreign|
|sport_id -- int -- foreign|
|created_at -- datetime|
|team_status_id -- int- foreign|


|user-team-role|
|:---:|
|id -- int -- primary|
|role_id -- int -- foreign|
|user_id -- int -- foreign|
|team_id -- int -- foreign|


|invitation_status|
|:---:|
|id -- int -- primary|
|name -- varchar(255) -- unique|

|team_invitations|
|:---:|
|id -- int -- primary|
|team_id -- int -- foreign|
|invited_email -- varchar(255)|
|role_id -- int -- foreign|
|invited_by_user_id -- int -- foreign|
|invitation_status_id -- int -- foreign|
|created_at -- datetime|

|players|
|:---:|
|id -- int -- primary|
|firstname -- varchar(255)|
|lastname -- varchar(255)|
|birth_date -- datetime|
|profile_pic|
|email -- varchar(255) -- unique|
|telephone_number -- varchar(255) -- unique|

|team_player|
|:---:|
|id -- int -- primary|
|team_id -- int -- foreign|
|player_id -- int -- foreign|
|position_id -- int -- foreign|
|shirt_number -- int -- unique|

|exercise_tools|
|:---:|
|id -- int -- primary|
|name -- varchar(255) -- unique|

|exercise_categories|
|:---:|
|id -- int -- primary|
|name -- varchar(255) -- unique|

|exercise_dictionary|
|:---:|
|id -- int -- primary|
|name -- varchar(255) -- unique|
|exercise_category_id -- int -- foreign|
|description -- varchar(255)|
|min_players -- int|
|exercise_tool_id -- int -- foreign|
|field_size -- float|

|appaered_status|
|:---:|
|id -- int -- primary|
|name -- varchar(255) -- unique|

|training_attendance|
|:---:|
|id -- int -- primary|
|team_player_id -- int -- foreign|
|training_id -- int -- foreign|
|appaered_status_id -- int -- foreign|

|event_status|
|:---:|
|id -- int -- foreign|
|name -- varchar(255) -- unique|

|training_type|
|:---:|
|id -- int -- primary|
|name -- varchar(255) -- unique|

|training-exercise_dictionary|
|:---:|
|id -- int -- primary|
|excercise_dictionary_id -- int -- foreign|
|is_excercise_finished -- int -- foreign|
|order -- int|
|length -- int|
|intensity -- int|

|training|
|:---:|
|id -- int -- primary|
|name -- varchar(255)|
|start_datetime -- datetime|
|length -- int|
|end_datetime -- datetime|
|location -- varchar(255)|
|description -- varchar(255)|
|event_status_id -- int -- foreign|
|training_type_id -- int -- foreign|
|training-exercise_dictionary_id -- int --  foreign|

|individual_trainings|
|:---:|
|id -- int -- primary|
|name -- varchar(255)|
|description -- varchar(255)|
|team_player_id -- int -- foreign|
|training_type_id -- int -- foreign|
|training-exercise_dictionary_id -- int -- foreign|

|match_event_list|
|:---:|
|id -- int -- primary|
|name -- varchar(255) -- unique|

|formation|
|:---:|
|id -- int -- primary|
|name -- varchar(255)|
|position_id -- int -- foreign|

|match_lineup|
|:---:|
|id -- int -- primary|
|team_player_id -- int -- foreign|
|match_id -- int --  foreign|
|is_starter -- bool|
|position_id -- int -- foreign|

|result|
|:---:|
|id -- int -- primary|
|name -- varchar(255) -- unique|

|match|
|:---:|
|id -- int -- primary|
|league_id -- int --  foreign|
|team_id -- int --  foreign|
|time -- time|
|date -- date|
|location -- varchar(255)|
|description -- varchar(255)|
|opponent_team -- varchar(255)|
|event_status_id -- int --  foreign|
|result_id -- int --  foreign|
|is_home -- bool|
|own_goal_count -- int|
|opponent_goal_count -- int|
|formation_id -- int --  foreign|

|match-match_event_list|
|:---:|
|id -- int -- primary|
|match_id -- int --  foreign|
|match_event_list_id -- int --  foreign|
|minute -- int|
|side -- varchar(255)|
|primary_match_lineup_id -- int --  foreign|
|secondary_match_lineup_id -- int --  foreign|

|match_player_periods|
|:---:|
|id -- int -- primary|
|event_time -- int|
|match_event_list_id -- int --  foreign|
|match-match_event_list_id -- int --  foreign|


|calendar_event_list|
|:---:|
|id -- int -- primary|
|name -- varchar(255) -- unique|

|team_special_events|
|:---:|
|id -- int -- primary|
|name -- varchar(255) -- unique|
|description -- varchar(255)|
|date -- date|
|team_id -- int --  foreign|
|location -- varchar(255)|


|calendar|
|:---:|
|id -- int -- primary|
|name -- varchar(255)|
|year -- int|
|month -- int|
|match_id -- int --  foreign|
|training_id -- int --  foreign|
|team_special_event_id -- int --  foreign|
|calendar_event_list_id -- int --  foreign|

---


|calendar_export|
|:---:|
|id -- int -- primary|
|status|
|created_at -- datetime|

|calendar_export_event|
|:---:|
|id -- int -- primary|
|calendar_export_id -- int --  foreign|
|calendar_id -- int --  foreign|

|calendar_export_recipients|
|:---:|
|id -- int -- primary|
|calendar_export_id -- int --  foreign|
|team_players_id -- int --  foreign|

---


|team_stats|
|:---:|
|team_id|
|match_count|
|win_count|
|loss_count|
|draw_count|
|conceded_goal_count|
|goal_count|
|training_count|
|training_avg_appaerence|

|player_stats|
|:---:|
|player_id|
|match_played_count|
|played_minutes|
|goal_count|
|yellow_card_count|
|red_card_count|
|training_appaerence|
|physical_load|
