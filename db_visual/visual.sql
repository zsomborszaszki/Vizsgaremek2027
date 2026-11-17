START TRANSACTION;

CREATE TABLE `role` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL
);

CREATE TABLE `user` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `firstname` VARCHAR(255) NULL,
  `lastname` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL UNIQUE,
  `is_email_verified` BOOLEAN NULL,
  `email_verification_token` VARCHAR(255) NULL UNIQUE,
  `password_reset_token` VARCHAR(255) NULL UNIQUE,
  `password_hash` VARCHAR(255) NULL UNIQUE,
  `profile_pic` INTEGER NULL,
  `telephone_number` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `leagues` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `age_group` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `sport` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `positions` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE,
  `sport_id` INTEGER NULL
);

CREATE TABLE `team_status` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `team` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE,
  `short_name` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL UNIQUE,
  `city` VARCHAR(255) NULL,
  `age_group_id` INTEGER NULL,
  `sport_id` INTEGER NULL,
  `created_at` DATETIME NULL,
  `team_status_id` INTEGER NULL
);

CREATE TABLE `team_league` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `leagues_id` INTEGER NULL UNIQUE,
  `season` VARCHAR(255) NULL UNIQUE,
  `team_id` INTEGER NULL UNIQUE
);

CREATE TABLE `user__team__role` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `role_id` INTEGER NULL,
  `user_id` INTEGER NULL UNIQUE,
  `team_id` INTEGER NULL UNIQUE
);

CREATE TABLE `invitation_status` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `team_invitations` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `team_id` INTEGER NULL,
  `invitation_token` VARCHAR(255) NULL UNIQUE,
  `user_id` INTEGER NULL UNIQUE,
  `role_id` INTEGER NULL UNIQUE,
  `invited_by_user_id` INTEGER NULL,
  `invitation_status_id` INTEGER NULL,
  `created_at` DATETIME NULL
);

CREATE TABLE `players` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `firstname` VARCHAR(255) NULL,
  `lastname` VARCHAR(255) NULL,
  `birth_date` DATE NULL,
  `profile_pic` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL UNIQUE,
  `telephone_number` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `team_players` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `team_id` INTEGER NULL UNIQUE,
  `players_id` INTEGER NULL UNIQUE,
  `positions_id` INTEGER NULL,
  `shirt_number` INTEGER NULL UNIQUE
);

CREATE TABLE `exercise_tools` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `exercise_categories` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `exercise_dictionary` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE,
  `exercise_categories_id` INTEGER NULL,
  `description` VARCHAR(255) NULL,
  `min_players` INTEGER NULL,
  `field_size` FLOAT NULL,
  `team_id` INTEGER NULL UNIQUE
);

CREATE TABLE `exercise` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `excercise_dictionary_id` INTEGER NULL,
  `exercise_tools_id` INTEGER NULL,
  `description` VARCHAR(255) NULL,
  `repetition` INTEGER NULL,
  `sets` INTEGER NULL,
  `duration` INTEGER NULL,
  `intensity` INTEGER NULL
);

CREATE TABLE `exercise_favorites` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `user_id` INTEGER NULL UNIQUE,
  `team_id` INTEGER NULL UNIQUE,
  `exercise_id` INTEGER NULL UNIQUE
);

CREATE TABLE `appaered_status` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `event_status` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `training_type` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `training` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` INTEGER NULL,
  `team_id` INTEGER NULL UNIQUE,
  `start_datetime` DATETIME NULL,
  `length` INTEGER NULL,
  `end_datetime` DATETIME NULL,
  `location` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `event_status_id` INTEGER NULL,
  `training_type_id` INTEGER NULL
);

CREATE TABLE `training_attendance` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `team_players_id` INTEGER NULL UNIQUE,
  `training_id` INTEGER NULL UNIQUE,
  `appaered_status_id` INTEGER NULL UNIQUE
);

CREATE TABLE `individual_trainings` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `token_hash` VARCHAR(255) NULL UNIQUE,
  `note` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  `team_players_id` INTEGER NULL,
  `training_type_id` INTEGER NULL,
  `created_at` DATETIME NULL,
  `deadline` DATETIME NULL
);

CREATE TABLE `training__exercise` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `excercise_id` INTEGER NULL,
  `is_excercise_finished` BOOLEAN NULL,
  `training_id` INTEGER NULL,
  `individual_trainings_id` INTEGER NULL,
  `order` INTEGER NULL
);

CREATE TABLE `match_event_list` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `formation` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` INTEGER NULL UNIQUE
);

CREATE TABLE `formation_positions` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `formation_id` INTEGER NULL UNIQUE,
  `positions_id` INTEGER NULL UNIQUE
);

CREATE TABLE `result` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `match` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `team_leagues_id` INTEGER NULL,
  `team_id` INTEGER NULL,
  `time` TIME NULL,
  `date` DATE NULL,
  `location` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `opponent_team` VARCHAR(255) NULL,
  `event_status_id` INTEGER NULL,
  `result_id` INTEGER NULL,
  `is_home` BOOLEAN NULL,
  `own_goal_count` INTEGER NULL,
  `opponent_goal_count` INTEGER NULL,
  `formation_id` INTEGER NULL
);

CREATE TABLE `match_lineup` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `team_players_id` INTEGER NULL UNIQUE,
  `match_id` INTEGER NULL UNIQUE,
  `is_starter` BOOLEAN NULL,
  `formation_positions_id` INTEGER NULL UNIQUE
);

CREATE TABLE `match__match_event_list` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `match_id` INTEGER NULL,
  `match_event_list_id` INTEGER NULL,
  `minute` INTEGER NULL,
  `side` VARCHAR(255) NULL,
  `primary_match_lineup_id` INTEGER NULL,
  `secondary_match_lineup_id` INTEGER NULL
);

CREATE TABLE `match_players_periods` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `event_time` INTEGER NULL,
  `match_event_list_id` INTEGER NULL,
  `match__match_event_list_id` INTEGER NULL
);

CREATE TABLE `calendar_event_list` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `team_special_events` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE,
  `description` VARCHAR(255) NULL,
  `date` DATE NULL,
  `team_id` INTEGER NULL,
  `location` VARCHAR(255) NULL
);

CREATE TABLE `calendar` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL,
  `date` DATETIME NULL UNIQUE,
  `match_id` INTEGER NULL UNIQUE,
  `training_id` INTEGER NULL UNIQUE,
  `team_special_events_id` INTEGER NULL UNIQUE,
  `calendar_event_list_id` INTEGER NULL UNIQUE
);

CREATE TABLE `calendar_status` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NULL UNIQUE
);

CREATE TABLE `calendar_export` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `calendar_status_id` INTEGER NULL,
  `created_at` DATETIME NULL
);

CREATE TABLE `calendar_export_event` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `calendar_export_id` INTEGER NULL,
  `calendar_id` INTEGER NULL
);

CREATE TABLE `calendar_export_recipients` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `calendar_export_id` INTEGER NULL,
  `team_players_id` INTEGER NULL
);

CREATE TABLE `team_monthly_stats` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `team_id` INTEGER NULL UNIQUE,
  `date` DATETIME NULL UNIQUE,
  `match_count` INTEGER NULL,
  `win_count` INTEGER NULL,
  `loss_count` INTEGER NULL,
  `draw_count` INTEGER NULL,
  `conceded_goal_count` INTEGER NULL,
  `goal_count` INTEGER NULL,
  `training_count` INTEGER NULL,
  `training_avg_appaerence` INTEGER NULL
);

CREATE TABLE `players_monthly_stats` (
  `id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `team_players_id` INTEGER NULL UNIQUE,
  `date` DATETIME NULL UNIQUE,
  `match_played_count` INTEGER NULL,
  `played_minutes` INTEGER NULL,
  `goal_count` INTEGER NULL,
  `yellow_card_count` INTEGER NULL,
  `red_card_count` INTEGER NULL,
  `training_appaerence` INTEGER NULL,
  `physical_load` INTEGER NULL
);

COMMIT;
