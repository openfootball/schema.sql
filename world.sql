-------------------------------------
-- world.db tables
-------------------------------------

CREATE TABLE cities (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name varchar(255) NOT NULL,
  key varchar(255) NOT NULL,
  place_id integer NOT NULL,
  code varchar(255),
  alt_names varchar(255),
  country_id integer NOT NULL,
  region_id integer,
  city_id integer,
  pop integer,
  popm integer,
  area integer,
  m boolean DEFAULT 'f' NOT NULL,
  c boolean DEFAULT 'f' NOT NULL,
  d boolean DEFAULT 'f' NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE continents (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name varchar(255) NOT NULL,
  slug varchar(255) NOT NULL,
  key varchar(255) NOT NULL,
  place_id integer NOT NULL,
  alt_names varchar(255),
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE countries (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name varchar(255) NOT NULL,
  slug varchar(255) NOT NULL,
  key varchar(255) NOT NULL,
  place_id integer NOT NULL,
  code varchar(255) NOT NULL,
  alt_names varchar(255),
  pop integer NOT NULL,
  area integer NOT NULL,
  continent_id integer,
  country_id integer,
  s boolean DEFAULT 'f' NOT NULL,
  c boolean DEFAULT 'f' NOT NULL,
  d boolean DEFAULT 'f' NOT NULL,
  motor varchar(255),
  iso2 varchar(255),
  iso3 varchar(255),
  fifa varchar(255),
  net varchar(255),
  wikipedia varchar(255),
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE langs (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  key varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE names (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name varchar(255) NOT NULL,
  place_id integer NOT NULL,
  lang varchar(255) DEFAULT 'en' NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE places (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name varchar(255) NOT NULL,
  kind varchar(255) NOT NULL,
  lat float,
  lng float,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE regions (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name varchar(255) NOT NULL,
  key varchar(255) NOT NULL,
  place_id integer NOT NULL,
  code varchar(255),
  abbr varchar(255),
  iso varchar(255),
  nuts varchar(255),
  alt_names varchar(255),
  country_id integer NOT NULL,
  pop integer,
  area integer,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE usages (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  country_id integer NOT NULL,
  lang_id integer NOT NULL,
  official boolean DEFAULT 't' NOT NULL,
  minor boolean DEFAULT 'f' NOT NULL,
  percent float,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );
