
-----------------------
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


---------------------
--
-- todo: add some examples ??


CREATE VIEW games_list AS
SELECT e."key" AS event_key,
  ---    e.name  AS event_name   -- fix: add to schema or use league.title + season.title ??
       l."key" AS league_key,
       l.title AS league_name,
       s."key" AS season_key,
       s.title AS season_name,
       c."key" AS country_key,
       c.name  AS country_name,
       groups.title AS group_name,
  --   groups.pos  AS group_num, ???
       r.title AS round_name,
  --   r.pos   AS round_num, ???
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
    INNER JOIN leagues l ON l.id = e.league_id
    INNER JOIN seasons s ON s.id = e.season_id
    LEFT OUTER JOIN countries c ON c.id = l.country_id  -- note: countries for league table is optional (that is, might be null/empty)
    LEFT OUTER JOIN groups ON groups.id = g.group_id     -- note: group for match table is optional
    ;

-------------------------------
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
              LEFT OUTER JOIN countries c ON c.id = l.country_id   -- note: countries for league table is optional (that is, might be null/empty)
              ;

