
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

