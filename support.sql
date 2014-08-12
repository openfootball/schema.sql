
-------------------------------------
-- conf.db tables
-------------------------------------

CREATE TABLE props (
  id         INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  key        varchar(255) NOT NULL,
  value      varchar(255) NOT NULL,
  kind       varchar(255),
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );


-------------------------------------
-- log.db tables
-------------------------------------

CREATE TABLE logs (
  id         INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  msg        varchar(255) NOT NULL,
  level      varchar(255) NOT NULL,
  app        varchar(255),
  tag        varchar(255),
  pid        integer,
  tid        integer,
  ts         varchar(255),
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );


---------------------------------------------
-- tag.db tables (tagging & classification)
---------------------------------------------

CREATE TABLE tags (
  id         INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  key        varchar(255) NOT NULL,
  slug       varchar(255) NOT NULL,
  name       varchar(255),
  grade      integer DEFAULT 1 NOT NULL,
  parent_id  integer,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  );

CREATE TABLE taggings (
  id            INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  tag_id        integer NOT NULL,
  taggable_id   integer NOT NULL,
  taggable_type varchar(255) NOT NULL,
  created_at    datetime NOT NULL,
  updated_at    datetime NOT NULL
  );
