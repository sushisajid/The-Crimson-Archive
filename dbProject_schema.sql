GRANT CONNECT ON DATABASE "DBProject" TO user1;
GRANT CREATE ON DATABASE "DBProject" TO user1;

-- Allow the user to create tables inside the public schema
GRANT ALL PRIVILEGES ON SCHEMA public TO user1;
ALTER SCHEMA public OWNER TO user1;


Create Table Games (
	gameID serial primary key, --serial ki waja se auto increment hoga.
	title varchar(100) not null,
	releaseDate date not null,
	multiplayerSupport boolean not null
);

--platforms
Create Table Platforms (
	platformID serial primary key,
	platformName varchar(50) unique not null
);
Create Table Game_Platforms( --junction table bw game and platforms
	gamePlatformID serial primary key,
	gameID int not null,
	platformID int not null,

	foreign key(gameID) references Games(gameID) on delete cascade, --game delete hoga tou usko reference krne wali rows bhi iss table se chali jayengi
	foreign key(platformID) references Platforms(platformID) on delete cascade
);

--characters
Create table Characterss( --Note: end mei ss isliye bcs Characters cant be used as an entity name
	characterID serial primary key,
	characterName varchar(100) not null,
	backstory text,
	description text,
	sprite_URL varchar(2083)
);
Create table Games_Characterss(
	gameCharID serial primary key,
	gameID int not null,
	characterID int not null,

	foreign key(gameID) references Games(gameID) on delete cascade,
	foreign key(characterID) references Characterss(characterID) on delete cascade
);

--appearances
Create table Appearances(
	appearanceID serial primary key,
	characterID int not null,
	firstAppearance boolean Default false,
	isPlayable boolean default false,
	notes text not null,

	foreign key(characterID) references Characterss(characterID) on delete cascade
);

--maps and mobs
Create table Maps(
	mapID serial primary key,
	gameID int not null,
	mapName varchar(100) not null,
	locationType varchar(50),
	description text not null

	foreign key(gameID) references Games(gameID) on delete cascade
);
Create table Mobs(
	mobID serial primary key,
	mobName varchar(100) not null,
	mobType varchar(50),
	description text,
	weakness text,
	mobSpriteURL varchar(2083),
	spawnNotes text
);
Create table Maps_Mob(
	mmid serial primary key,
	mobID int not null,
	mapID int not null

	foreign key(mobID) references Mobs(mobID) on delete cascade,
	foreign key(mapID) references Maps(mapID) on delete cascade
);

--Story Arcs
Create table StoryArcs(
	storyArc serial primary key,
	gameID int not null,
	prevArcID int not null,
	nextArcID int not null,

	arcTitle varchar(150) not null,
	arcOrder int,
	summary Text,
	description text not null,
	isMainArc boolean,
	startArcID int not null,
	endArcID int not null

	foreign key(gameID) references Games(gameID) on delete cascade,
	foreign key(prevArcID) references storyArc(storyArc) on delete cascade,
	foreign key(nextArcID) references storyArc(storyArc) on delete cascade

);

--Roles
Create table Roles(
	roleID serial primary key,
	roleName varchar(50) not null
);

--Contributors
Create Table Contributors(
	contrinutorID serial primary key,
	contributoName varchar(100) unique not null,
	specialisation varchar(100)
);
Create table Game_Contributors(
	gcID serial primary key,
	gameID int not null,
	contributorID int not null,
	roleID int not null,
	foreign key(gameID) references Games(gameID) on delete cascade,
	foreign key(contributorID) references Contributors(contributorID) on delete cascade,
	foreign key(roleID) references Roles(roleID) on delete cascade
);

--Clips
Create table Clips(
	clipID serial primary key,
	gameID int not null,
	clipTitle varchar(100) not null,
	clipURL varchar(2083) not null,
	mediaType varchar(50),

	foreign key(gameID) references Games(gameID)
);

--Users
Create table Users(
	userID serial primary key,
	username varchar(100) unique not null,
	displayName varchar(100),
	passwordHash varchar(255) not null,
	userType varchar(25),
	accountCreationDate timestamp default now()
);

--Ratings
Create table Ratings(
	ratingID serial primary key,
	gameID int not null,
	userID int not null,

	rating int not null,
	review text,
	--timestamp date, timestamp is alr a datatype
	personalBest varchar(50),

	foreign key(gameID) references Games(gameID),
	foreign key (userID) references Users(userID)
);