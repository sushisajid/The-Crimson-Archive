-- remove existing views if they exist :p

drop view if exists vw_top_rated_games cascade;
drop view if exists vw_game_ratings_summary cascade;
drop view if exists vw_playable_characters cascade;
drop view if exists vw_user_ratings cascade;
drop view if exists vw_contributor_roles cascade;
drop view if exists vw_mobs_by_map cascade;
drop view if exists vw_story_arcs_sequence cascade;
drop view if exists vw_character_appearances cascade;
drop view if exists vw_games_overview cascade;

-- game overviews along with their supported platforms

create or replace view vw_games_overview as
select
    g.gameid,
    g.title,
    g.releasedate,
    g.multiplayersupport,
    p.platformname
from games g
join games_platforms gp on g.gameid = gp.gameid
join platforms p on gp.platformid = p.platformid
order by g.title;

-- character appearances in games

create or replace view vw_character_appearances as
select
    c.charactername,
    g.title as gametitle,
    a.firstappearance,
    a.isplayable
from appearances a
join ingamecharacters c on a.characterid = c.characterid
join games g on a.gameid = g.gameid;

-- story arc sequence for each game

create or replace view vw_story_arcs_sequence as
select
    g.title as gametitle,
    sa.arctitle,
    sa.arcorder,
    sa.ismainarc,
    sa.summary
from storyarcs sa
join games g on sa.gameid = g.gameid
order by g.gameid, sa.arcorder;  -- game + arc order sequencing

-- mobs by map along with their spawn notes

create or replace view vw_mobs_by_map as
select
    g.title as gametitle,
    m2.mapname,
    m.mobname,
    m.mobtype,
    m.weakness,
    m.spawnnotes
from mob_maps mm
join mobs m on mm.mobid = m.mobid
join maps m2 on mm.mapid = m2.mapid
join games g on m2.gameid = g.gameid;

-- contributor roles in games

create or replace view vw_contributor_roles as
select
    g.title as gametitle,
    c.contributorname,
    r.rolename, -- e.g., Developer, VA, Artist, Writer
    c.specialization -- e.g., Programming, 3D Modeling, Voice Acting
from games_contributors gc
join contributors c on gc.contributorid = c.contributorid
join roles r on gc.roleid = r.roleid
join games g on gc.gameid = g.gameid;

-- user ratings + reviews for games

create or replace view vw_user_ratings as
select
    u.username,
    g.title as gametitle,
    r.rating,
    r.review,
    r.personalbest,
    r.reviewtimestamp
from ratings r
join users u on r.userid = u.userid
join games g on r.gameid = g.gameid;

-- playable characters by game

create or replace view vw_playable_characters as
select
    g.title as gametitle,
    c.charactername
from appearances a
join ingamecharacters c on a.characterid = c.characterid
join games g on a.gameid = g.gameid
where a.isplayable = true;

-- rating summaries with avg rating and total number of ratings

create or replace view vw_game_ratings_summary as
select
    g.title as gametitle,
    avg(r.rating) as avgrating,
    count(r.rating) as totalratings
from ratings r
join games g on r.gameid = g.gameid
group by g.gameid, g.title;

-- top rated games from average ratings and review counts per game

create or replace view vw_top_rated_games as
select *
from vw_game_ratings_summary
where avgrating >= 4 and totalratings >= 10
order by avgrating desc, totalratings desc;