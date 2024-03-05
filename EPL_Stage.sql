SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE DATABASE Stage_FOOTBALL
GO
USE Stage_FOOTBALL
GO

-- Tạo bảng `Team`
CREATE TABLE [Team_EPL_Stage] (
  [team_id] INT,
  [name] VARCHAR(50),
  [logo] VARCHAR(255),
  CONSTRAINT [PK_Team_EPL_Stage] PRIMARY KEY ([team_id])
);

-- Tạo bảng `Statistic`
CREATE TABLE [Statistic_EPL_Stage] (
  [statistic_id] INT,
  [total_shot] INT ,
  [shot_on_target] INT,
  [ball_control] INT,
  [total_number_of_passes] INT,
  [corner_kicks] INT,
  [offside] INT,
  CONSTRAINT [PK_Statistic_EPL_Stage_id] PRIMARY KEY ([statistic_id])
);

-- Tạo bảng `Match`
CREATE TABLE [Match_EPL_Stage] (
  [match_id] INT,
  [date] DATETIME,
  [home_team_id] INT,
  [home_statistic_id] INT,
  [away_team_id] INT,
  [away_statistic_id] INT,
  [league_name] VARCHAR(50),
  [season] VARCHAR(50),
  CONSTRAINT [PK_Match_EPL_Stage] PRIMARY KEY ([match_id]),
);

-- Tạo bảng `Event`
CREATE TABLE [Event_EPL_Stage] (
  [event_id] INT,
  [event_name] VARCHAR(50),
  [event_time] VARCHAR(20),
  [player_name] VARCHAR(50),
  [team_id] INT,
  [match_id] INT,
  CONSTRAINT [PK_Event_EPL_Stage] PRIMARY KEY ([event_id])
);


-- Thêm thêm đội mới
INSERT INTO [Team_EPL_Stage] ([name], [logo])
VALUES
('Manchester United', 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a9/Manchester_United_FC_logo.svg/1200px-Manchester_United_FC_logo.svg.png'),
('Arsenal', 'https://upload.wikimedia.org/wikipedia/en/thumb/b/b2/Arsenal_FC_logo.svg/1200px-Arsenal_FC_logo.svg.png'),
('Liverpool', 'https://upload.wikimedia.org/wikipedia/en/thumb/e/ef/Liverpool_FC_logo.svg/1200px-Liverpool_FC_logo.svg.png'),
('Tottenham Hotspur', 'https://upload.wikimedia.org/wikipedia/en/thumb/5/52/Tottenham_Hotspur_FC_logo.svg/1200px-Tottenham_Hotspur_FC_logo.svg.png'),
('Manchester City', 'https://upload.wikimedia.org/wikipedia/en/thumb/c/c0/Manchester_City_FC_logo.svg/1200px-Manchester_City_FC_logo.svg.png'),
('Aston Villa', 'https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Aston_Villa_FC_logo.svg/1200px-Aston_Villa_FC_logo.svg.png'),
('Brighton & Hove Albion', 'https://upload.wikimedia.org/wikipedia/en/thumb/9/9c/Brighton_and_Hove_Albion_FC_logo.svg/1200px-Brighton_and_Hove_Albion_FC_logo.svg.png'),
('Leicester City', 'https://upload.wikimedia.org/wikipedia/en/thumb/0/0c/Leicester_City_FC_logo.svg/1200px-Leicester_City_FC_logo.svg.png'),
('Newcastle United', 'https://upload.wikimedia.org/wikipedia/en/thumb/0/02/Newcastle_United_FC_logo.svg/1200px-Newcastle_United_FC_logo.svg.png'),
('West Ham United', 'https://upload.wikimedia.org/wikipedia/en/thumb/e/e3/West_Ham_United_FC_logo.svg/1200px-West_Ham_United_FC_logo.svg.png');

-- Thêm thêm thống kê mới
INSERT INTO [Statistic_EPL_Stage] ([total_shot], [shot_on_target], [ball_control], [total_number_of_passes], [corner_kicks], [offside])
VALUES
(15, 7, 55, 120, 7, 2),
(12, 6, 65, 105, 6, 3),
(10, 5, 50, 90, 4, 1),
(10, 5, 50, 90, 4, 1),
(10, 5, 50, 90, 4, 1),
(10, 5, 50, 90, 4, 1),
(10, 5, 50, 90, 4, 1);

-- Thêm thêm trận đấu mới
INSERT INTO [Match_EPL_Stage] ([date], [home_team_id], [home_statistic_id],[away_team_id], [away_statistic_id],[league_name], [season])
VALUES
('2023-12-21 20:00:00', 1, 1, 2, 2, 'Premier League', '2023-2024'),
('2023-12-22 20:00:00', 3, 3, 4, 3, 'Premier League', '2023-2024'),
('2023-12-23 20:00:00', 5, 5, 6, 6, 'Premier League', '2023-2024');

-- Thêm thêm sự kiện mới
INSERT INTO [Event_EPL_Stage] ([event_name], [event_time], [player_name], [team_id], [match_id])
VALUES
('red card', '70:00', 'Bruno Fernandes', 1, 1),
('yellow card', '85:00', 'Harry Kane', 2, 1),
('goal', '90:00', 'Mohamed Salah', 1, 1);


