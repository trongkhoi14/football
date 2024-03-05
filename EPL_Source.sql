SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE DATABASE EPL
GO
USE EPL
GO

-- Tạo bảng `Team`
CREATE TABLE [Team] (
  [team_id] INT IDENTITY(1,1) NOT NULL,
  [name] VARCHAR(50) NOT NULL,
  [logo] VARCHAR(255) NULL,
  CONSTRAINT [PK_Team] PRIMARY KEY ([team_id])
);

-- Tạo bảng `Statistic`
CREATE TABLE [Statistic] (
  [statistic_id] INT IDENTITY(1,1) NOT NULL,
  [total_shot] INT NULL,
  [shot_on_target] INT NULL,
  [ball_control] INT NULL,
  [total_number_of_passes] INT NULL,
  [corner_kicks] INT NULL,
  [offside] INT NULL,
  CONSTRAINT [statistic_id] PRIMARY KEY ([statistic_id])
);

-- Tạo bảng `Match`
CREATE TABLE [Match] (
  [match_id] INT IDENTITY(1,1) NOT NULL,
  [date] DATETIME NOT NULL,
  [home_team_id] INT NOT NULL,
  [home_statistic_id] INT NOT NULL,
  [away_team_id] INT NOT NULL,
  [away_statistic_id] INT NOT NULL,
  [league_name] VARCHAR(50) NOT NULL,
  [season] VARCHAR(50) NOT NULL,
  CONSTRAINT [PK_Match] PRIMARY KEY ([match_id]),
  CONSTRAINT [FK_Match_HomeTeam] FOREIGN KEY ([home_team_id]) REFERENCES [Team] ([team_id]),
  CONSTRAINT [FK_Match_AwayTeam] FOREIGN KEY ([away_team_id]) REFERENCES [Team] ([team_id]),
  CONSTRAINT [FK_Match_HomeTeam_Statistic] FOREIGN KEY ([home_statistic_id]) REFERENCES [Statistic] ([statistic_id]),
  CONSTRAINT [FK_Match_AwayTeam_Statistic] FOREIGN KEY ([away_statistic_id]) REFERENCES [Statistic] ([statistic_id])
);

-- Tạo bảng `Event`
CREATE TABLE [Event] (
  [event_id] INT IDENTITY(1,1) NOT NULL,
  [event_name] VARCHAR(50) NOT NULL,
  [event_time] VARCHAR(20) NULL,
  [player_name] VARCHAR(50) NULL,
  [team_id] INT NOT NULL,
  [match_id] INT NOT NULL,
  CONSTRAINT [PK_Event] PRIMARY KEY ([event_id]),
  CONSTRAINT [FK_Event_Match] FOREIGN KEY ([match_id]) REFERENCES [Match] ([match_id]),
  CONSTRAINT [FK_Event_Team] FOREIGN KEY ([team_id]) REFERENCES [Team] ([team_id]),
  CONSTRAINT [CK_Event_Name] CHECK ([event_name] IN ('goal', 'red card', 'yellow card'))
);


-- Thêm thêm đội mới
INSERT INTO [Team] ([name], [logo])
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
INSERT INTO [Statistic] ([total_shot], [shot_on_target], [ball_control], [total_number_of_passes], [corner_kicks], [offside])
VALUES
(15, 7, 55, 120, 7, 2),
(12, 6, 65, 105, 6, 3),
(10, 5, 50, 90, 4, 1),
(10, 5, 50, 90, 4, 1),
(10, 5, 50, 90, 4, 1),
(10, 5, 50, 90, 4, 1),
(10, 5, 50, 90, 4, 1);

-- Thêm thêm trận đấu mới
INSERT INTO [Match] ([date], [home_team_id], [home_statistic_id],[away_team_id], [away_statistic_id],[league_name], [season])
VALUES
('2023-12-21 20:00:00', 1, 1, 2, 2, 'Premier League', '2023-2024'),
('2023-12-22 20:00:00', 3, 3, 4, 3, 'Premier League', '2023-2024'),
('2023-12-23 20:00:00', 5, 5, 6, 6, 'Premier League', '2023-2024');

-- Thêm thêm sự kiện mới
INSERT INTO [Event] ([event_name], [event_time], [player_name], [team_id], [match_id])
VALUES
('red card', '70:00', 'Bruno Fernandes', 1, 1),
('yellow card', '85:00', 'Harry Kane', 2, 1),
('goal', '90:00', 'Mohamed Salah', 1, 1);


