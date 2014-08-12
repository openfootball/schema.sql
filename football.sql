----------------------------------
-- football.db SQLite version
----------------------------------


-------------------------------------
-- person.db tables
-------------------------------------

CREATE TABLE persons (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  key varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  synonyms varchar (255),
  code varchar(255),
  born_at date,
  city_id integer,
  region_id integer,
  country_id integer,
  nationality_id integer,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL)
  ;


----------------------------------------
-- sport.db tables
----------------------------------------

CREATE TABLE assocs (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  key varchar(255) NOT NULL,
  title varchar(255) NOT NULL,
  since integer,
  web varchar(255),
  country_id integer,
  national boolean DEFAULT 'f' NOT NULL,
  continental boolean DEFAULT 'f' NOT NULL,
  intercontinental boolean DEFAULT 'f' NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE assocs_assocs (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  assoc1_id integer NOT NULL,
  assoc2_id integer NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE badges (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  team_id integer NOT NULL,
  league_id integer NOT NULL,
  season_id integer NOT NULL,
  title varchar(255) NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE events (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  key varchar(255) NOT NULL,
  league_id integer NOT NULL,
  season_id integer NOT NULL,
  start_at date NOT NULL,
  end_at date,
  team3 boolean DEFAULT 't' NOT NULL,
  sources varchar(255),
  config varchar(255),
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE events_grounds (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  event_id integer NOT NULL,
  ground_id integer NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE events_teams (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  event_id integer NOT NULL,
  team_id integer NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE games (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  key varchar(255),
  round_id integer NOT NULL,
  pos integer NOT NULL,
  group_id integer,
  team1_id integer NOT NULL,
  team2_id integer NOT NULL,
  play_at datetime NOT NULL,
  postponed boolean DEFAULT 'f' NOT NULL,
  play_at_v2 datetime,
  play_at_v3 datetime,
  ground_id integer,
  city_id integer,
  knockout boolean DEFAULT 'f' NOT NULL,
  home boolean DEFAULT 't' NOT NULL,
  score1 integer,
  score2 integer,
  score1et integer,
  score2et integer,
  score1p integer,
  score2p integer,
  score1i integer,
  score2i integer,
  score1ii integer,
  score2ii integer,
  next_game_id integer,
  prev_game_id integer,
  winner integer,
  winner90 integer,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE goals (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  person_id integer NOT NULL,
  game_id integer NOT NULL,
  team_id integer NOT NULL,
  minute integer,
  offset integer DEFAULT 0 NOT NULL,
  score1 integer,
  score2 integer,
  penalty boolean DEFAULT 'f' NOT NULL,
  owngoal boolean DEFAULT 'f' NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE grounds (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  key varchar(255) NOT NULL,
  title varchar(255) NOT NULL,
  synonyms varchar(255),
  country_id integer NOT NULL,
  city_id integer,
  since integer,
  capacity integer,
  address varchar(255),
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE groups (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  event_id integer NOT NULL,
  title varchar(255) NOT NULL,
  pos integer NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE groups_teams (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  group_id integer NOT NULL,
  team_id integer NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE leagues (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  key varchar(255) NOT NULL,
  title varchar(255) NOT NULL,
  country_id integer,
  club boolean DEFAULT 'f' NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE rosters (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  person_id integer NOT NULL,
  team_id integer NOT NULL,
  event_id integer,
  pos integer NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE rounds (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  event_id integer NOT NULL,
  title varchar(255) NOT NULL,
  title2 varchar(255),
  pos integer NOT NULL,
  knockout boolean DEFAULT 'f' NOT NULL,
  start_at date NOT NULL,
  end_at date,
  auto boolean DEFAULT 't' NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE seasons (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  key varchar(255) NOT NULL,
  title varchar(255) NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE teams (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  key varchar(255) NOT NULL,
  title varchar(255) NOT NULL,
  title2 varchar(255),
  code varchar(255),
  synonyms varchar(255),
  country_id integer NOT NULL,
  city_id integer,
  club boolean DEFAULT 'f' NOT NULL,
  since integer,
  address varchar(255),
  web varchar(255),
  assoc_id integer,
  national boolean DEFAULT 'f' NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

----------------------------------------
-- sport.db.stats.tables
----------------------------------------

CREATE TABLE alltime_standing_entries (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  alltime_standing_id integer NOT NULL,
  team_id integer NOT NULL,
  pos integer,
  played integer,
  won integer,
  lost integer,
  drawn integer,
  goals_for integer,
  goals_against integer,
  pts integer,
  recs integer,
  comments varchar(255),
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE alltime_standings (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  key varchar(255) NOT NULL,
  title varchar(255) NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE event_standing_entries (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  event_standing_id integer NOT NULL,
  team_id integer NOT NULL,
  pos integer,
  played integer,
  won integer,
  lost integer,
  drawn integer,
  goals_for integer,
  goals_against integer,
  pts integer,
  comments varchar(255),
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE event_standings (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  event_id integer NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE group_standing_entries (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  group_standing_id integer NOT NULL,
  team_id integer NOT NULL,
  pos integer,
  played integer,
  won integer,
  lost integer,
  drawn integer,
  goals_for integer,
  goals_against integer,
  pts integer,
  comments varchar(255),
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE group_standings (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  group_id integer NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );
