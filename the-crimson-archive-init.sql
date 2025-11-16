begin;

-- create schema
drop schema if exists crimson cascade;
create schema crimson;
set search_path to crimson;

-- idependent root tables (games + users)

Create Table Games (
	gameID serial primary key, -- serial ki waja se auto increment hoga
	title varchar(100) not null,
	releaseDate date not null,
	multiplayerSupport boolean not null
);

-- users

Create table Users(
	userID serial primary key,
	username varchar(100) unique not null,
	displayName varchar(100),
	passwordHash varchar(255) not null,
	userType varchar(25), -- developer / casual browser
	accountCreationDate timestamp default now()
);

-- platforms

Create Table Platforms (
	platformID serial primary key,
	platformName varchar(50) unique not null
);

Create Table Games_Platforms( -- junction table b/w game and platforms
	gamePlatformID serial primary key,
	gameID int not null,
	platformID int not null,

	foreign key(gameID) references Games(gameID) on delete cascade, -- game delete hoga tou usko reference krne wali rows bhi iss table se chali jayengi
	foreign key(platformID) references Platforms(platformID) on delete cascade
);

-- characters

Create table InGameCharacters( -- renamed Character table from ERD to InGameCharacters b/c Characters cannot be an entity name
	characterID serial primary key,
	characterName varchar(100) not null,
	backstory text,
	description text,
	spriteURL varchar(2083)
);

Create table Games_Characters(
	gameCharID serial primary key,
	gameID int not null,
	characterID int not null,

	foreign key(gameID) references Games(gameID) on delete cascade,
	foreign key(characterID) references InGameCharacters(characterID) on delete cascade
);

-- appearances

Create table Appearances(
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

Create table Maps(
	mapID serial primary key,
	gameID int not null,
	mapName varchar(100) not null,
	locationType varchar(50),
	description text not null,

	foreign key(gameID) references Games(gameID) on delete cascade
);

Create table Mobs(
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

Create table Mob_Maps(
	mmID serial primary key,
	mobID int not null,
	mapID int not null,

	foreign key(mobID) references Mobs(mobID) on delete cascade,
	foreign key(mapID) references Maps(mapID) on delete cascade
);

-- story arcs

-- all self-referencing FKs are nullable!
-- prevArcID and nextArcID are optional for navigation BUT nullable

Create table StoryArcs(
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

Create table Roles(
	roleID serial primary key,
	roleName varchar(50) unique not null -- b/c having 2 roles both called 'writer' would make no sense
);

-- contributors

Create Table Contributors(
	contributorID serial primary key,
	contributorName varchar(100) unique not null,
	specialization varchar(100)
);

Create table Games_Contributors(
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

Create table Clips(
	clipID serial primary key,
	gameID int not null,
	clipTitle varchar(100) not null,
	clipURL varchar(2083) not null,
	mediaType varchar(50),

	foreign key(gameID) references Games(gameID) on delete cascade
);

-- ratings

Create table Ratings(
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
WHERE table_schema = 'public'  -- or your schema name
  AND table_type = 'BASE TABLE'
ORDER BY table_name;

-- see all foreign keys
SELECT conname AS constraint_name,
       conrelid::regclass AS table_from,
       confrelid::regclass AS table_to
FROM pg_constraint
WHERE contype = 'f';