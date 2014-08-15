----------------------
-- use like e.g list World Cup Brazil 2014 teams:
--
--  SELECT *
--    FROM events_teams_list
--   WHERE event_key = 'world.2014';

CREATE VIEW events_teams_list AS
       SELECT e."key" AS event_key,
              e.title AS event_name,
              t.*
         FROM teams t
              INNER JOIN events_teams et ON et.team_id = t.id
              INNER JOIN events e ON e.id = et.event_id;



------------------------
-- use like e.g. list World Cup Brazil 2014 Games
--
--  SELECT *
--    FROM events_games_list
--   WHERE event_key = 'world.2014'

-- todo: fix: add (optional) group ??


CREATE VIEW events_games_list AS
SELECT e."key" AS event_key,
  ---    e.name  AS event_name   -- fix: add to schema or use league.title + season.title ??
       r.title AS round_name,
  --   r.pos   AS round_num,
       groups.title AS group_name,
       t1.title AS team1_name,
       t1."key" AS team1_key,
       t2.title AS team2_name,
       t2."key" AS team2_key,
       g.*
  FROM games g
    INNER JOIN teams t1 ON t1.id = g.team1_id
    INNER JOIN teams t2 ON t2.id = g.team2_id
    INNER JOIN rounds r ON r.id = g.round_id
    INNER JOIN events e ON e.id = r.event_id
    LEFT OUTER JOIN groups ON groups.id = g.group_id     -- note: group for match table is optional
    ;


-------------------------
-- use like e.g list World Cup Brazil 2014 rounds:
--
--  SELECT *
--    FROM events_rounds_list
--   WHERE event_key = 'world.2014';

CREATE VIEW events_rounds_list AS
       SELECT e."key" AS event_key,
              e.title AS event_name,
              r.*
         FROM rounds r
              INNER JOIN events e ON e.id = r.event_id;


-------------------------------
--  use like e.g. list World Cup Brazil 2014 Groups
--
--  SELECT *
--    FROM events_groups_list
--   WHERE event_key = 'world.2014'

CREATE VIEW events_groups_list AS
SELECT e."key" AS event_key,
  ---    e.name  AS event_name   -- fix: add to schema or use league.title + season.title ??
       g.*
  FROM groups g
   INNER JOIN events e ON e.id = g.event_id;

