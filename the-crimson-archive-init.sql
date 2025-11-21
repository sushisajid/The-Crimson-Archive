begin;

-- create schema
drop schema if exists crimson cascade;
create schema crimson;
set search_path to crimson;

-- idependent root tables (games + users)

create table Games (
	gameID serial primary key, -- serial ki waja se auto increment hoga
	gameCoverURL varchar(2083),
	gameLogoURL varchar(2083),
	title varchar(100) not null,
	plotSummary text,
	releaseDate date not null,
	multiplayerSupport boolean not null
);

-- users

create table Users(
	userID serial primary key,
	username varchar(100) unique not null,
	displayName varchar(100),
	passwordHash varchar(255) not null,
	userType varchar(25), -- developer / casual browser
	accountCreationDate timestamp default now()
);

-- platforms

create table Platforms (
	platformID serial primary key,
	platformName varchar(50) unique not null
);

create table Games_Platforms( -- junction table b/w game and platforms
	gamePlatformID serial primary key,
	gameID int not null,
	platformID int not null,

	foreign key(gameID) references Games(gameID) on delete cascade, -- game delete hoga tou usko reference krne wali rows bhi iss table se chali jayengi
	foreign key(platformID) references Platforms(platformID) on delete cascade
);

-- characters

create table InGameCharacters( -- renamed Character table from ERD to InGameCharacters b/c Characters cannot be an entity name
	characterID serial primary key,
	characterName varchar(100) not null,
	backstory text,
	description text,
	englishVA varchar(100),
	japaneseVA varchar(100),
	motionCapture varchar(100),
	spriteURL varchar(2083)
);

create table Games_Characters(
	gameCharID serial primary key,
	gameID int not null,
	characterID int not null,

	foreign key(gameID) references Games(gameID) on delete cascade,
	foreign key(characterID) references InGameCharacters(characterID) on delete cascade
);

-- appearances

create table Appearances(
	appearanceID serial primary key,
	gameID int not null,
	characterID int not null,
	firstAppearance boolean Default false,
	isPlayable boolean default false,
	notes text not null,

	foreign key(gameID) references Games(gameID) on delete cascade,
	foreign key(characterID) references InGameCharacters(characterID) on delete cascade
);

-- maps / mobs

create table Maps(
	mapID serial primary key,
	gameID int not null,
	mapName varchar(100) not null,
	locationType varchar(50),
	description text not null,

	foreign key(gameID) references Games(gameID) on delete cascade
);

create table Mobs(
	mobID serial primary key,
	gameID int not null,
	mobName varchar(100) not null,
	mobType varchar(50),
	description text,
	weakness text,
	mobSpriteURL varchar(2083),
	spawnNotes text,

	foreign key(gameID) references Games(gameID) on delete cascade
);

create table Mob_Maps(
	mmID serial primary key,
	mobID int not null,
	mapID int not null,

	foreign key(mobID) references Mobs(mobID) on delete cascade,
	foreign key(mapID) references Maps(mapID) on delete cascade
);

-- story arcs

-- all self-referencing FKs are nullable!
-- prevArcID and nextArcID are optional for navigation BUT nullable

create table StoryArcs(
	storyArcID serial primary key,
	gameID int not null,
	-- dropping these two cols since we can make do with just arcOrder to point in sequence
	-- prevArcID int,
	-- nextArcID int,

	arcTitle varchar(150) not null,
	arcOrder int, -- sequence of arcs in the game
	summary text,
	description text not null,
	isMainArc boolean,
	
	-- startArcID and endArcID can be handled using queries only
	-- startArcID int not null,
	-- endArcID int not null

	foreign key (gameID) references Games(gameID) on delete cascade
	-- "set null" used instead of "cascade"
	-- prevents a chain of arcs from being wiped out if one arc is deleted
	-- foreign key (prevArcID) references StoryArcs(storyArcID) on delete set null,
	-- foreign key (nextArcID) references StoryArcs(storyArcID) on delete set null
);

-- roles

create table Roles(
	roleID serial primary key,
	roleName varchar(50) unique not null -- b/c having 2 roles both called 'writer' would make no sense
);

-- contributors

create table Contributors(
	contributorID serial primary key,
	contributorName varchar(100) unique not null,
	specialization varchar(100)
);

create table Games_Contributors(
	gcID serial primary key,
	gameID int not null,
	contributorID int not null,
	roleID int not null,

	unique (gameID, contributorID, roleID),
	
	foreign key(gameID) references Games(gameID) on delete cascade,
	foreign key(contributorID) references Contributors(contributorID) on delete cascade,
	foreign key(roleID) references Roles(roleID) on delete cascade
);

-- clips

create table Clips(
	clipID serial primary key,
	gameID int not null,
	clipTitle varchar(100) not null,
	clipURL varchar(2083) not null,
	mediaType varchar(50),

	foreign key(gameID) references Games(gameID) on delete cascade
);

-- ratings

create table Ratings(
	ratingID serial primary key,
	gameID int not null,
	userID int not null,

	rating int not null,
	constraint rating_stars check (rating >= 1 AND rating <= 5), -- out of 5 stars
	
	review text, -- descriptive text ><
	reviewTimestamp timestamp default now(),
	
	personalBest varchar(5), -- a rank generated by the game (e.g. C, B, A, S, S+ or S++)
	constraint personalbest 

	unique (gameID, userID),

	foreign key (gameID) references Games(gameID) on delete cascade,
	foreign key (userID) references Users(userID) on delete cascade
);

commit;

-- verify schema existence
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'crimson'
ORDER BY table_name;

-- see all foreign keys
SELECT conname AS constraint_name,
       conrelid::regclass AS table_from,
       confrelid::regclass AS table_to
FROM pg_constraint
WHERE contype = 'f';

-- functions & triggers

-- StoryArcs - enforce arcOrder sequence

create or replace function enforce_arc_order()
returns trigger as $$
begin
  	-- shift existing arcs if arcOrder conflicts
  	update StoryArcs
  	set arcOrder = arcOrder + 1
  	where gameID = NEW.gameID
    and arcOrder >= NEW.arcOrder;
	return new;
end;
$$ language plpgsql;

create trigger trg_enforce_arc_order
before insert on StoryArcs
for each row
execute function enforce_arc_order();

-- Ratings – prevent duplicate ratings

create or replace function prevent_duplicate_ratings()
returns trigger as $$
begin
	if exists (
		select 1
    	from Ratings
    	where gameID = NEW.gameID
      	and userID = NEW.userID
  	) then
	  	raise exception 'User % has already rated game %', NEW.userID, NEW.gameID;
  	end if;
  	return new;
end;
$$ language plpgsql;

create trigger trg_prevent_duplicate_ratings
before insert on Ratings
for each row
execute function prevent_duplicate_ratings();

-- Games_Contributors – maintaining uniqueness

create or replace function prevent_duplicate_contributors()
returns trigger as $$
begin
	if exists (
    	select 1
    	from Games_Contributors
    	where gameID = NEW.gameID
      		and contributorID = NEW.contributorID
      		and roleID = NEW.roleID
  	) then
    	raise exception 'Contributor % with role % already assigned to game %',
        NEW.contributorID, NEW.roleID, NEW.gameID;
  	end if;
  	return new;
end;
$$ language plpgsql;

create trigger trg_prevent_duplicate_contributors
before insert on Games_Contributors
for each row
execute function prevent_duplicate_contributors();