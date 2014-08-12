
----
-- use like e.g. list english teams
--
--  SELECT *
--    FROM teams_list
--   WHERE country_key = 'en';

CREATE VIEW teams_list AS
       SELECT c."key" AS country_key,
              c.name  AS country_name,
              t.*
         FROM teams t
              INNER JOIN countries c ON c.id = t.country_id;


-----------------------------------
--
--  todo: add some examples ??

-- todo: fix: add (optional) group ??


CREATE VIEW games_list AS
SELECT e."key" AS event_key,
  ---    e.name  AS event_name   -- fix: add to schema or use league.title + season.title ??
       l."key" AS league_key,
       l.title AS league_name,
       s."key" AS season_key,
       s.title AS season_name,
       c."key" AS country_key,
       c.name  AS country_name,
       r.title AS round_name,
  --   r.pos   AS round_num,
       t1.title AS team1_name,
       t1."key" AS team1_key,
       t2.title AS team2_name,
       t2."key" AS team2_key,
       g.*
  FROM games g
   LEFT OUTER JOIN teams t1 ON t1.id = g.team1_id
   LEFT OUTER JOIN teams t2 ON t2.id = g.team2_id
   INNER JOIN rounds r ON r.id = g.round_id
   INNER JOIN events e ON e.id = r.event_id
   INNER JOIN leagues l ON l.id = e.league_id
   INNER JOIN seasons s ON s.id = e.season_id
   INNER JOIN countries c ON c.id = l.country_id;


----
-- use like e.g. list German Bundesliga seasons
--
--  SELECT *
--    FROM events_list
--   WHERE league_key = 'de';
--
--  or list all German seasons (incl. 2. Liga, 3. Liga, DFB Pokal etc.)
--
--  SELECT *
--    FROM events_list
--   WHERE country_key = 'de';

CREATE VIEW events_list AS
       SELECT s."key" AS season_key,
              s.title AS season_name,
              l."key" AS league_key,
              l.title AS league_name,
              c."key" AS country_key,
              c.name  AS country_name,
              e.*
         FROM events e
              INNER JOIN seasons s ON s.id = e.season_id
              INNER JOIN leagues l ON l.id = e.league_id
              INNER JOIN countries c ON c.id = l.country_id;

---
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

---
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

