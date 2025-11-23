set search_path to crimson; -- run ts first always

insert into Games (gamecoverurl, gamelogourl, title, plotsummary, releasedate, multiplayersupport) values
(NULL, NULL, 'Resident Evil 7: Biohazard', 
'Set in modern day rural America and taking place after the dramatic events of Resident Evil® 6, 
players experience the terror directly from the first person perspective. Resident Evil 7 embodies 
the series'' signature gameplay elements of exploration and tense atmosphere that first coined 
“survival horror” some twenty years ago; meanwhile, a complete refresh of gameplay systems 
simultaneously propels the survival horror experience to the next level.', '2017-01-24', true);

insert into Games (gamecoverurl, gamelogourl, title, plotsummary, releasedate, multiplayersupport) values
(NULL, NULL, 'Resident Evil Village',
'Years after the tragic events of Resident Evil 7 biohazard, Ethan Winters has started over with 
his wife Mia, finally living in peace and putting the past behind them. However, Chris Redfield, 
the legendary hero from previous Resident Evil games, suddenly disrupts their life, throwing a 
devastated Ethan into a new and twisted nightmare in search of answers.', '2021-05-07', false);

UPDATE Games
SET gamecoverurl = 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Games/GameCovers/Re7_xone_cover.jpg'
WHERE gameID = 1;

UPDATE Games
SET gamelogourl = 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/The-Crimson-Archive/main/URLs/Games/GameLogos/Resident_Evil_7_logo.jpg'
WHERE gameID = 1;

UPDATE Games
SET gamecoverurl = 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Games/GameCovers/Resident_Evil_Village_NA_Cover_29.jpg'
WHERE gameID = 2;

UPDATE Games
SET gamelogourl = 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Games/GameLogos/RESIDENT_EVIL_VILLAGE_logo.jpg'
WHERE gameID = 2;

-- platforms

insert into Platforms (platformName) values
('PC'),
('PlayStation 4'),
('PlayStation 5'),
('Xbox One'),
('Xbox Series X/S'),
('Nintendo Switch'),
('iOS');

insert into Games_Platforms (gameID, platformID) values
(1, 1),  -- Resident Evil 7 on PC
(1, 2),  -- Resident Evil 7 on PlayStation 4
(1, 3),  -- Resident Evil 7 on PlayStation 5
(1, 4),  -- Resident Evil 7 on Xbox One
(1, 5),  -- Resident Evil 7 on Xbox Series X/S
(1, 6),  -- Resident Evil 7 on Nintendo Switch
(1, 7),  -- Resident Evil 7 on iOS
(2, 1),  -- Resident Evil Village on PC
(2, 2),  -- Resident Evil Village on PlayStation 4
(2, 3),  -- Resident Evil Village on PlayStation 5
(2, 4),  -- Resident Evil Village on Xbox One
(2, 5),  -- Resident Evil Village on Xbox Series X/S
(2, 6),  -- Resident Evil Village on Nintendo Switch
(2, 7);  -- Resident Evil Village on iOS

select * from games_platforms;

-- characters

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Ethan Winters',
'american systems engineer turned mold-infected survivor; husband of mia winters, father of rosemary winters. 
arrives in dulvey to find mia during the baker house incident, becomes entangled in the mold outbreak, 
fights the baker family and eveline to save his family, ultimately dies protecting mia and rosemary.',
'male, caucasian/american, 187 cm (6''2"), 75 kg (170 lb), born c.1984, died 10 february 2021. 
system engineer by occupation, trained as a mutant due to mold infection. married to mia winters, 
father of rosemary winters. courageous, determined, and resourceful under extreme bioweapon threats.',
'todd soley', 'hidenobu kiuchi', 'yaya chamki', '');

update ingamecharacters
set spriteURL = 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/InGameCharacters/ethan_re7.webp'
WHERE characterID = 1;

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),  -- gets the last inserted characterID
    true,
    true,
    'Ethan Winters appears as a rugged civilian in his early 30s, wearing a dark green jacket over a gray hoodie, blue jeans, and brown boots. He has short brown hair and a clean-shaven face. His outfit includes practical gear such as a flashlight and a weapons belt, and his animations display realistic weight and movement.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Mia Winters',
'former operative for The Connections; caretaker of Eveline; wife of Ethan Winters and mother of Rosemary. presumed dead after the Annabelle incident, later recovered by the Baker family. captured and influenced by Eveline, attacks Ethan under her control, but eventually assists him in defeating Eveline. after the incident, enters witness protection in Europe with Ethan and their daughter.',
'female, caucasian/american, born december 14, 1984; 170 cm (5''7"), 61 kg (134 lb). researcher for The Connections (2010 - 2014) and Eveline''s handler (2014). skilled in firearms and covert operations; protective, resourceful, and deeply committed to family.',
'katie o''hagan', 'akari higuchi', 'N/A', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/InGameCharacters/mia_re7.webp');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    true,
    'mia winters appears as a fit, determined woman in her early 30s, wearing tactical casual clothing: dark jacket, fitted pants, and boots. she has shoulder-length brown hair and a focused expression. animations reflect agility, firearm handling, and interaction with objects like the genome codex.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('David Anderson',
'african-american deputy sheriff assigned to patrol the dulvey bayou following a series of disappearances. investigates the baker house, encounters ethan winters, but is killed by jack baker early in the incident. his corpse becomes partially converted by mold and is used by lucas baker to manipulate ethan. his death is later covered up by the sheriff''s office and bsaa as a gas leak.',
'male, african-american, born c.1986; 175 cm (5''9"), 60 kg (130 lb). deputy sheriff by occupation; dutiful but skeptical and inexperienced when confronted with biohazard threats.',
'hari williams', 'minoru kawai', 'pierre dager', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/InGameCharacters/david_re7.png');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    false,
    'david anderson appears as a mid-30s african-american deputy in standard sheriff uniform with badge, belt, and holster. short black hair, clean-shaven, cautious posture, reflecting law enforcement training. seen mostly as a corpse with mold integration posthumously.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Zoe Baker',
'female from dulvey, louisiana; daughter of jack and marguerite baker, sister to lucas. involved in the dulvey incident as a captive resistant to eveline''s mind control. helps ethan winters navigate the baker estate, reattaches his hand, provides the genome codex, and guides him to cure her and mia. after being captured and partially calcified, she is rescued and quarantined, later gaining a new identity and working as a rookie reporter in new orleans while investigating the incident and the origins of eveline.',
'female, caucasian/american, born c.1994; 170 cm (5''7"), 58 kg (130 lb). resilient, intelligent, resourceful; skilled at surviving in extreme circumstances and assisting others under duress.',
'giselle gilbert', 'yu kobayashi', 'giselle gilbert', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/InGameCharacters/zoe_re7.webp');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    false,
    'zoe baker appears as a young woman in her early 20s, wearing casual clothes: t-shirt, jeans, sneakers. shoulder-length brown hair and expressive facial features convey intelligence and resilience. animations include crawling, running, and assisting ethan with puzzles and hand reattachment.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Chris Redfield',
'american special operations unit operator with bsaa; veteran bioweapon hunter. older brother of claire redfield, mentor to rosemary winters. in the dulvey incident (2017), he responds to blue umbrella''s request to apprehend lucas baker and contain the mold bioweapon. assists ethan winters and mia, eliminates mutant lucas baker, and later coordinates the rescue of zoe baker with her uncle joe.',
'male, caucasian/american, born c.1973; height varies between 181 - 185 cm (5''11" - 6''1"), mass 80 - 100 kg (176 - 220 lb). blood type o. highly skilled marksman, tactician, and hand-to-hand combatant; specializes in biohazard containment and bioweapon neutralization.',
'david vaughn', 'hiroki tōchi', 'david vaughn', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/InGameCharacters/chris_re7.webp');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    true,
    'chris redfield appears as a muscular veteran in his mid-40s, wearing tactical combat gear with chest rig, gloves, and boots. short brown hair, stubbled face, and stern expression. animations include combat, climbing, and weapon handling.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Alan Droney',
'special agent for the connections, assigned alongside mia winters to act as handler and parental figure for eveline. during transport on the ss annabelle, eveline''s mold infection overtakes the crew, including alan. after showing symptoms, he sends mia to subdue eveline, but eveline accelerates the mold inside him, killing him. he later appears in a group photo in miranda''s lab in resident evil village.',
'male, caucasian/american, born c.1961, died october 5, 2014 (aged 53). height 180 cm (5''11"), mass 80 kg (180 lb).',
'kip pardue', 'kyomitsu mizuuchi', 'mark hobart', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/InGameCharacters/alan_re7.webp');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    false,
    'alan droney appears as a middle-aged man in his early 50s, wearing a standard connections agent suit with tie and badge. short brown hair, clean-shaven, neutral expression. seen briefly and later in pre-death group photograph.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Lucas Baker',
'firstborn of jack and marguerite baker from dulvey, louisiana. infected by eveline''s mold, gains regenerative abilities and a sadistic streak, designing deadly puzzles to kill victims. acted as a researcher for the Connections syndicate, later betrays them and kills their scientists. mutates and is killed by chris redfield in the salt mines after attempting to sell eveline''s bioweapon data.',
'male, caucasian/american, height 182 cm (6''0"), mass 68 kg (150 lb), deceased. family: jack baker (father), marguerite baker (mother), joe baker (uncle), zoe baker (sister).',
'jesse pimentel', 'setsuji sato', 'jesse pimentel', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/InGameCharacters/lucas_re7.webp');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    false,
    'lucas baker appears as a lean man in his early 20s, wearing casual rugged clothes, often covered in mud or grime from traps. short dark hair, mischievous expression, frequently smiling sinisterly. animations emphasize trap setting, running, and attacking ethan.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Eveline',
'codenamed e-001; genetically engineered human bioweapon created by the Connections. possesses mind-control powers, manipulates the baker family and mia winters, abducts humans including ethan winters, and attempts to coerce them into joining her “ideal family.” serves as the main antagonist of resident evil 7: biohazard.',
'female, height 156 cm (5''1"), mass 45 kg, artificially aged to appear ten years old, deceased july 20, 2017 in dulvey parish, louisiana. first e-type bioweapon; merges with mold upon death.',
'patricia mcneely', 'yuri tabata', 'N/A', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/InGameCharacters/eveline_re7.webp');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    false,
    'eveline appears as a small girl in a wheelchair, with a pale, doll-like face, short blonde hair, and large, piercing eyes. dressed in a white child''s dress. her animations include subtle floating and hallucination effects, as well as controlling mold and manipulating environments.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Jack Baker',
'infected baker family patriarch; after eveline''s arrival, gained enhanced strength, speed, and near-immortality. along with his family, kidnapped and killed victims to expand eveline''s "family" until his death at the hands of ethan winters.',
'male, caucasian/american, height 190 cm (6''3"), mass 92 kg, deceased. member of the baker family in dulvey, louisiana.',
'jack brand', 'kazuhiro yamaji', 'jack brand', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/InGameCharacters/joe_re7.webp');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    false,
    'jack baker appears as a hulking man in his late 40s, wearing a torn white shirt and jeans, often covered in mold residue. receding brown hair, thick beard, and menacing expression. animations showcase immense strength, chasing ethan, wielding large weapons, and performing violent attacks.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Marguerite Baker',
'infected baker family matriarch; gained ability to control mutant insects, enhanced strength and speed after eveline''s infection. captured victims with family and tried to assimilate ethan and mia winters into eveline''s "family"; ultimately killed by ethan after mutating into a monstrous form.',
'female, caucasian/american, height 168 cm (5''6"), mass 70 kg, deceased. mother in the baker family of dulvey, louisiana.',
'sara coates', 'maki izawa', 'sara coates', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/InGameCharacters/marguerite_re7.webp');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    false,
    'marguerite baker appears as a tall woman in her late 40s, wearing tattered domestic clothes often soaked in mold fluids. long brown hair, gaunt face, grotesque post-mutation limbs, and insect-like features. animations include crawling, wall climbing, and releasing swarms of mutant insects.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Clancy Jarvis',
'cameraman for paranormal series Sewer Gators; investigates dulvey haunted house, captured and killed by lucas baker during deadly puzzles.',
'male, caucasian/american, born c.1982, died june 2, 2017; cameraman; deceased.',
'Tony Vogel', 'Yu Seki', 'N/A', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/InGameCharacters/clancy_re7.png');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    true,
    'clancy jarvis appears as a cameraman in his mid-30s, wearing casual rugged clothing with vest, camera harness, and gloves. short brown hair and unshaven, nervous expression. animations include camera handling, climbing, and interacting with puzzles.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Peter Walken',
'tv presenter for paranormal series Sewer Gators; investigates baker ranch with crew, killed by the bakers; death covered as natural gas accident.',
'male, caucasian/american, born c.1974; tv presenter; deceased.',
'Robert Vestal', 'N/A', 'N/A', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/InGameCharacters/peter_re7.png');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    false,
    'peter walken appears as a middle-aged man, wearing casual tv presenter clothing: button-up shirt, jeans. short dark hair, lightly tanned, calm and professional expression. mostly appears in cutscenes and photographs.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Andre Stickland',
'producer and showrunner of Sewer Gators; captured and murdered by jack baker during investigation of baker ranch; death covered as natural gas accident.',
'male, caucasian/american, born 1981; tv producer; deceased.',
'Christopher Ashman', 'N/A', 'N/A', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/InGameCharacters/andre_re7.png');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    false,
    'andre stickland appears as a man in his mid-30s, wearing casual business attire: collared shirt and trousers. short brown hair and clean-shaven, neutral expression. seen only in cutscenes and corpse state.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Hoffman',
'civilian victim captured by lucas baker; forced to participate in lucas'' deadly card game "21", endured electrocution and saw attacks, resulting in death.',
'male, caucasian/american, died june 2017; baker ranch, dulvey parish, louisiana; deceased.',
'N/A', 'N/A', 'N/A', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/InGameCharacters/hoffman_re7.png');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    false,
    'hoffman appears as a man in his 30s, wearing casual clothing appropriate for a civilian: shirt, pants, and shoes. medium-length brown hair, worried expression. animations only show his interactions as a participant in lucas'' card game, including electrocution and trap sequences.'
);

update appearances
set notes ='ethan winters appears as a rugged civilian in his early 30s, wearing a dark green jacket over a gray hoodie, blue jeans, and brown boots. he has short brown hair and a clean-shaven face. his outfit includes practical gear such as a flashlight and a weapons belt, and his animations display realistic weight and movement.'
where characterID = 1;

-- games_characters

insert into Games_Characters (gameID, characterID) values
(1, 1),  -- ethan winters
(1, 2),  -- mia winters
(1, 3),  -- david anderson
(1, 4),  -- zoe baker
(1, 5),  -- chris redfield
(1, 6),  -- alan droney
(1, 7),  -- lucas baker
(1, 8),  -- eveline
(1, 9),  -- jack baker
(1, 10), -- marguerite baker
(1, 11), -- clancy jarvis
(1, 12), -- peter walken
(1, 13), -- andre stickland
(1, 14); -- hoffman

-- maps
-- ref: https://www.evilresource.com/resident-evil-7/maps

-- guest house maps
insert into Maps (gameID, mapName, floorName, description, mapURL) values
(1, 'Guest House', '1F', 'first floor of the guest house in the baker estate, includes main living area, dining, and hallway.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/ghouse_1f.png'),
(1, 'Guest House', '2F', 'second floor of the guest house, includes bedrooms and bathroom.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/ghouse_2f.png'),
(1, 'Guest House', '3F', 'third floor of the guest house, attic storage and additional rooms.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/ghouse_3f.png'),
(1, 'Guest House', 'B1', 'basement of the guest house, storage and access to hidden areas.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/ghouse_b1.png');

-- main house maps
insert into Maps (gameID, mapName, floorName, description, mapURL) values
(1, 'Main House', '1F', 'first floor of the main house, includes kitchen, living room, and foyer.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/mhouse_1f.png'),
(1, 'Main House', '2F', 'second floor of the main house, bedrooms and study areas.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/mhouse_2f.png'),
(1, 'Main House', 'Attic', 'attic of the main house, storage area with hidden secrets.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/mhouse_attic.png'),
(1, 'Main House', 'Processing Area', 'processing area of the main house, contains Eveline containment and lab equipment.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/mhouse_processingArea.png');

-- yard maps
insert into Maps (gameID, mapName, floorName, description, mapURL) values
(1, 'Yard', NULL, 'outdoor area of the baker estate connecting multiple buildings, includes trailer and path to old house.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/yard.png');

-- old house maps
insert into Maps (gameID, mapName, floorName, description, mapURL) values
(1, 'Old House', '1F', 'first floor of the old house, includes kitchen, cellar, and dining area.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/ohouse_1f.png'),
(1, 'Old House', '2F', 'second floor of the old house, bedrooms and storage areas.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/ohouse_2f.png'),
(1, 'Old House', '1F (WEST)', 'western first-floor section of the old house, includes altar access and crawl spaces.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/ohouse_1f_west.png'),
(1, 'Old House', '2F (WEST)', 'western second-floor area of the old house, connected to secret passages.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/ohouse_2f_west.png');

-- testing area maps
insert into Maps (gameID, mapName, floorName, description, mapURL) values
(1, 'Testing Area', '1F', 'first floor of the testing area, contains traps, puzzle rooms, and control rooms.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/testingarea_1f.png'),
(1, 'Testing Area', '2F', 'second floor of the testing area, includes barn arena and combat zones.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/testingarea_2f.png');

-- boat house maps
insert into Maps (gameID, mapName, floorName, description, mapURL) values
(1, 'Boat House', '1F', 'first floor of the boat house, dock and access to swamp.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/boathouse_1f.png'),
(1, 'Boat House', '1F (STORAGE)', 'storage section of the first floor of the boat house.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/boathouse_storage_1f.png'),
(1, 'Boat House', '2F (STORAGE)', 'storage upper level with access to machinery and balcony.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/boathouse_storage_2f.png');

-- wrecked ship maps
insert into Maps (gameID, mapName, floorName, description, mapURL) values
(1, 'Wrecked Ship', 'S3', 'third submerged level of the wrecked ship, flooded corridors and cargo.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/wrecked_ship_s3.png'),
(1, 'Wrecked Ship', 'S2', 'second submerged level of the wrecked ship, engine room and crew storage.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/wrecked_ship_s2.png'),
(1, 'Wrecked Ship', 'S1', 'first submerged level of the wrecked ship, maintenance access and labs.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/wrecked_ship_s1.png'),
(1, 'Wrecked Ship', '1F', 'first floor of the wrecked ship, main hall and control rooms.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/wrecked_ship_1f.png'),
(1, 'Wrecked Ship', '2F', 'second floor of the wrecked ship, sleeping quarters and cafeteria.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/wrecked_ship_2f.png'),
(1, 'Wrecked Ship', '3F', 'third floor of the wrecked ship, command deck and captain''s cabin.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/wrecked_ship_3f.png'),
(1, 'Wrecked Ship', '4F', 'fourth floor of the wrecked ship, radio tower and escape point.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/wrecked_ship_4f.png');

-- ship maps
insert into Maps (gameID, mapName, floorName, description, mapURL) values
(1, 'Ship', '2F', 'second floor of the tanker ship, crew rooms and hallways.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/ship_2f.png'),
(1, 'Ship', 'S2', 'second submerged level of the ship, engine pumps and storage.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/ship_s2.png'),
(1, 'Ship', '3F', 'third floor of the ship, communications and weapons storage.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/ship_3f.png');

-- salt mine maps
insert into Maps (gameID, mapName, floorName, description, mapURL) values
(1, 'Salt Mine', 'Swamp', 'entrance area of the salt mine connected through the swamp region.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/swamp.png'),
(1, 'Salt Mine', 'B3', 'third basement level of the salt mine, mining tunnels and control rooms.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/salt_mine_b3.png'),
(1, 'Salt Mine', 'B2', 'second basement level of the salt mine, experimentation chambers and cargo zones.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/salt_mine_b2.png'),
(1, 'Salt Mine', 'B1', 'first basement level of the salt mine, access to final confrontation rooms.', 'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Maps/salt_mine_b1.png');

-- mobs
-- standard molded
insert into Mobs (gameID, mobName, mobType, description, weakness, mobSpriteURL, spawnNotes) values
(1, 'Molded', 'standard',
'tall, flexible humanoid bioweapons fully warped by black mold fungus. bodies are veiny, skeletal structures barely visible under the fungal mass. heads melted into a huge gaping mouth full of spike-like teeth. claws extend from arms, allowing slashing and long-range thrust attacks. animalistic but intelligent enough to track prey, hunt in groups, crawl through vents, and ambush from mold-covered environments. extremely durable exterior mold holds the body together — when pushed past its durability limit, the internal organs burst into sludge.',
'general damage to the mold exterior — shredding the outer mold structure causes the internal organs to collapse instantly. arms and legs can be destroyed to cripple them. white molded/fumers are immune to normal bullets, explosives, and fire — weakness is anti-regen ramrod ammo only.',
'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Mobs/molded_re7.webp',
'created when corpses are consumed by mold through exposure to an E-Type subject; spawn throughout mold-rich environments. despawn when entering safe rooms, may respawn upon exit.');

-- blade molded
insert into Mobs (gameID, mobName, mobType, description, weakness, mobSpriteURL, spawnNotes) values
(1, 'Blade Molded', 'standard',
'mutated molded variant with right arm transformed into massive cluster of organic spiked blades. shields head and strikes at long range. movement, intelligence, and aggression match regular molded but faster and relentless when crawling.',
'headshots still work, require more firepower due to shield and higher health. shotgun blast to head can one-shot. crippling legs increases aggression.',
'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Mobs/blade_molded_re7.webp',
'first encountered in processing area (normal), old house (madhouse). natural evolution of molded infection; rarer than regular molded.');

-- quick molded
insert into Mobs (gameID, mobName, mobType, description, weakness, mobSpriteURL, spawnNotes) values
(1, 'Quick Molded', 'standard',
'lean, smaller molded variant, runs and fights on all fours with extra-long limbs for speed and agility. cannot bite; offense from claw strikes.',
'low durability — 2 - 3 handgun headshots or 1 shotgun blast. speed makes landing hits difficult. crouching improves aim.',
'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Mobs/quick_molded_re7.webp',
'appears after Marguerite''s defeat en route to dissection room. Madhouse versions appear earlier; faster and more aggressive.');

-- fat molded
insert into Mobs (gameID, mobName, mobType, description, weakness, mobSpriteURL, spawnNotes) values
(1, 'Fat Molded', 'standard',
'massive, bloated molded variant powered by corrosive bile. extremely slow, durable, vomit-based ranged attacks, grabs, charges, explodes on death.',
'shotgun to legs slows it; remote bombs in mouth = instant kill; keep distance and use cover.',
'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Mobs/fat_molded_re7.webp',
'first major encounter in barn; appears later in other locations including Mia''s sections. death explosion requires spacing.');

-- man-eating spider
insert into Mobs (gameID, mobName, mobType, description, weakness, mobSpriteURL, spawnNotes) values
(1, 'Man-Eating Spider', 'standard',
'colonies of mold-generated spider imitations that nest on doors, cabinets, chokepoints. hyper-aggressive jump attackers with strong fangs; behave like living locks.',
'very low hp; knife and burner kill instantly. must eliminate full cluster to open blocked paths.',
'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Mobs/spider_re7.webp',
'found only in Old House before Marguerite. spawn in groups; despawn permanently after area completion.');

-- insect hive
insert into Mobs (gameID, mobName, mobType, description, weakness, mobSpriteURL, spawnNotes) values
(1, 'Insect Hive', 'standard',
'stationary mold-grown hives that release swarms of man-eating insects when disturbed. danger is in swarms and blocking progression.',
'fire deletes them (burner/grenade), shotguns effective but insects may body-block. destroying small hives during Marguerite fight stops additional swarms.',
'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Mobs/hive_re7.jpg',
'first appear in Old House; one must be destroyed to reach Cellar. additional hives spawn dynamically during Marguerite fight.');

-- boss: Mia Winters (infected)
insert into Mobs (gameID, mobName, mobType, description, weakness, mobSpriteURL, spawnNotes) values
(1, 'Mia Winters (Infected)', 'boss',
'violent corrupted puppet of Eveline, flips between loving wife and rabid bio-weapon. superhuman strength, speed, and resistance to pain.',
'standard weapons stagger; openings during post-rage cooldowns; melee works first encounter; chainsaw phase requires distance and shots.',
'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Mobs/mia_infected_re7.webp',
'triggered after Ethan leaves Mia alone in guest house. includes stair ambush, wall throw + axe, attic power return → chainsaw phase. ends when defeated, mutters "I love you".');

-- boss: Jack Baker (infected)
insert into Mobs (gameID, mobName, mobType, description, weakness, mobSpriteURL, spawnNotes) values
(1, 'Jack Baker (Infected)', 'boss',
'heavily mutated Jack Baker, reptilian mass of molded flesh with multiple eyes. extremely strong, highly aggressive, can throw player.',
'destroying eyes deals high damage and staggers; cannot be killed normally; only serum works.',
'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/InGameCharacters/jack_re7.webp',
'appears in boathouse during escape with Mia and Zoe. fight ends when immobilized and injected with serum.');

-- boss: Marguerite Baker (infected)
insert into Mobs (gameID, mobName, mobType, description, weakness, mobSpriteURL, spawnNotes) values
(1, 'Marguerite Baker (Infected)', 'boss',
'fully mutated by Eveline, elongated limbs, demonic eyes, crawls along walls. abdomen is insect hive releasing swarms. fast, strong, highly aggressive.',
'primary weak point is abdomen hive; vulnerable to fire and concentrated attacks on limbs/abdomen; high-damage weapons recommended.',
'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Mobs/marguerite_infected_re7.webp',
'appears in greenhouse for final confrontation; stalks Ethan in Old House. fight triggers automatically with lantern.');

-- boss: Eveline
insert into Mobs (gameID, mobName, mobType, description, weakness, mobSpriteURL, spawnNotes) values
(1, 'Eveline', 'boss',
'bioweapon child with mold-based powers, capable of hallucinations, telekinesis, and mind control. can manipulate mold, summon minions, attack from distance. transforms into massive mold monstrosity when weakened.',
'e-necrotoxin incapacitates powers and triggers physical target form; heavy firepower, explosives, ramrods effective on limbs/weak points.',
'https://raw.githubusercontent.com/sushisajid/The-Crimson-Archive/main/URLs/Mobs/eviler_eveline_re7.png',
'appears in guest house attic for final confrontation; appears earlier as hallucinations, mold constructs, minions; creates environmental and mental hazards.');

select * from Mobs;

-- Molded (appears in multiple floors: Guest House 1F, 2F, 3F, Main House Processing Area)
insert into Mob_Maps (mobID, mapID) values
(1, 1),
(1, 2),
(1, 3),
(1, 8);

-- Blade Molded (Main House Processing Area, maybe also old house if you track it)
insert into Mob_Maps (mobID, mapID) values
(2, 8);

-- Quick Molded (Guest House 2F → path to dissection room / Old House hallway)
insert into Mob_Maps (mobID, mapID) values
(3, 2),
(3, 6),
(3, 8);

-- Insect Hive (Old House, tied to Marguerite)
insert into Mob_Maps (mobID, mapID) values
(6, 6);

-- Mia Winters (Infected) (Guest House 1F, 2F, Attic)
insert into Mob_Maps (mobID, mapID) values
(7, 1),
(7, 2),
(7, 3);

-- Jack Baker (Infected)
insert into Mob_Maps (mobID, mapID) values
(8, 5),
(8, 6);

-- Marguerite Baker (Infected) (Greenhouse → Main House 2F)
insert into Mob_Maps (mobID, mapID) values
(9, 5);

-- storyArcs
-- ref: https://www.polygon.com/resident-evil-7-guide/2017/1/26/14401532/walkthrough/

-- 1. Guest House

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    null,
    'Guest House',
    1,
    'Ethan enters the property and reaches the guest house, beginning his search for Mia.',
    'Ethan follows a forest path into the Baker property and reaches the seemingly abandoned guest house, setting the stage for the horrors ahead.',
    true
);

-- 1-1 Getting to the Guest House

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    1,
    '1-1 Getting to the Guest House',
    1.1,
    'Ethan navigates the woods, investigates the abandoned van, and finds the back entrance to the guest house.',
    $$
    After the intro cutscenes, Ethan arrives at the Baker property and follows the forest path past the chained gate. After investigating the abandoned Sewer Gators van and walking through the "ACCEPT HER GIFT" sign area, he reaches the backyard and finds Mia''s driver''s license near a smoldering fire pit. Ethan enters the guest house through the back door, triggering the start of the nightmare.
    $$
    ,
    false
);

-- 2. Main House

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    null,
    'Main House',
    2,
    'Ethan survives the dinner, escapes Jack''s pursuit, unlocks the Main Hall, explores the house, and collects all three Dog Head Emblems required to escape to the yard.',
    $$
    Ethan wakes up at the Baker dinner table and escapes the family. He sneaks through the Main House while being hunted by Jack, navigating the Dining Area, Kitchen, Garage, Main Hall, Recreation Room, Bathroom, and Basement. After accessing Mia''s tape and solving environmental puzzles, Ethan collects the three Dog Head Emblems required to open the Cerberus door to the yard.
    $$,
    true
);

-- 2-1 to 2-4

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    3,
    '2-1 The Garage',
    2.1,
    'Ethan escapes Jack''s chase, reaches the Garage, and defeats Jack in a brutal fight.',
    $$
    Ethan sneaks through the Dining Area and Hallways while Jack stalks him relentlessly. After obtaining the Hatch Key and crawling into the Laundry Room, Ethan reaches the Garage and attempts to warn the deputy. Jack kills him and forces Ethan into a life-or-death fight involving a patrol car, melee weapons, and improvised combat.
    $$,
    false
);

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    3,
    '2-2 Mia''s Tape',
    2.2,
    'Ethan opens the Main Hall, explores new rooms, and learns important clues from Mia''s tape.',
    $$
    After using the Ox Statuette to enter the Main Hall, Ethan collects items, interacts with Zoe via phone, and views Mia''s VHS tape. In the tape, Mia sneaks through the Old House while avoiding Marguerite, revealing the first major shadow puzzle and hinting at the lantern mechanic.
    $$,
    false
);

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    3,
    '2-3 Jack''s Back',
    2.3,
    'Jack returns, forcing Ethan into the basement and Morgue while Molded enemies appear for the first time.',
    $$
    Ethan unlocks the Dissection Room area beneath the house and encounters Molded creatures for the first time. He searches the Processing Area for the Relief key and pushes deeper into the Morgue while Jack reappears and stalks him again.
    $$,
    false
);

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    3,
    '2-4 Final Dog''s Head',
    2.4,
    'Ethan secures the final Dog''s Head Emblem and defeats Jack in the chainsaw arena.',
    $$
    Ethan retrieves the final Dog''s Head Emblem in the Morgue but is ambushed by Jack, triggering a close-quarters arena fight. Using body bags, blocking, and the chainsaw, Ethan dismembers Jack and ends the confrontation. With all three Dog Heads collected, Ethan unlocks the Cerberus Door and escapes into the Yard.
    $$,
    false
);

-- 3. Old House

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    null,
    'Old House',
    3,
    'Ethan explores the backyard, trailer, old house, and cellar, gathering items and preparing for upcoming challenges.',
    $$
    After leaving the guest house, Ethan navigates the backyard. He collects supplies including herbs, gunpowder, and chem fluid, while investigating the trailer in the middle of the yard. The area contains multiple collectible items, safe rooms, and preparation opportunities for the challenges ahead. Ethan also retraces Mia''s path through the old house and discovers the cellar, assembling new weapons and uncovering more about the Baker family''s horrors.
    $$,
    true
);

-- 3-1 to 3-3

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    8,
    '3-1 Backyard, Trailer, Old House, and Cellar',
    3.1,
    'Ethan completes objectives in the backyard, upgrades his weapons in the trailer, navigates the old house, and explores the cellar.',
    $$
    Ethan installs the red dog''s head into the Cerberus door to access the backyard. He collects herbs, gunpowder, antique coins, chem fluid, and separating agents, and uses the trailer as a safe room to repair weapons and spend antique coins. Following Mia''s footsteps, he navigates the old house, combats giant bugs, collects ammo and fuel, and assembles a flamethrower. In the cellar, he burns bug nests, gathers more resources, discovers collectible items, and finally confronts Mia, leading to a tense encounter.
    $$,
    false
);

-- 3-2 The Venomous Predator Puzzle, Crow Key, and Marguerite Fight

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    8,
    '3-2 The Venomous Predator Puzzle, Crow Key, and Marguerite',
    3.2,
    'Ethan solves the Venomous Predator shadow puzzle, navigates the crawlspace and outhouse, acquires the crow key and grenade launcher, and battles Marguerite.',
    $$
    Ethan returns to the old house and uses the statue in the gallery to cast a spider-shaped shadow, opening a hidden passage. He traverses a bug-filled crawlspace, collects solid fuel, green herbs, and psychostimulants, and reaches the outhouse using the crank to raise bridges. Inside, he gathers burner fuel, antique coins, and the crow key, then backtracks to the drawing room to unlock the crow door and obtain the grenade launcher. Marguerite confronts Ethan, but he uses his flamethrower, handgun, and shotgun to defeat her. After the fight, he explores the altar, collects notes, diaries, and antique coins, and prepares to enter the greenhouse.
    $$,
    false
);

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    8,
    '3-3 The Greenhouse, Lantern Puzzle, and D-Series Arm',
    3.3,
    'Ethan navigates the greenhouse, solves the lantern puzzle, collects the D-Series arm, and escapes while fighting molded enemies.',
    $$
    Ethan prepares for the greenhouse by stocking up on weapons, flame rounds, and healing items. He enters through the second floor, collects collectible items including green herbs, chem fluid, solid fuel, and flame rounds, and uses the lock pick to open locked drawers. Marguerite returns for a major fight, during which Ethan uses his burner, shotgun, and grenade launcher to defeat her and retrieve the lantern. Following this, Ethan solves the greenhouse collectibles, completes the lantern puzzle at the front door, and navigates through black-mold filled rooms. He discovers the D-Series arm in Eveline''s bedroom via a secret passage, then fights molded enemies while retracing his path to escape back to the trailer to meet Zoe.
    $$,
    false
);

-- 4. Testing Area

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    null,
    'Testing Area',
    4,
    'Ethan explores the Testing Area, including Lucas'' traps, VHS tapes, and the journey to the boathouse, uncovering more horrors and puzzles.',
    $$
    After leaving the old house, Ethan enters the Testing Area, a series of interconnected rooms and challenges set up by Lucas. He navigates the dissection room, master bedroom, and Lucas'' personal rooms, including the attic and backyard, encountering deadly traps and uncovering disturbing clues. Ethan finds the Happy Birthday VHS tape, experiences Lucas'' twisted party setup, and ultimately makes his way toward the boathouse, facing both puzzles and enemies while piecing together the Baker family''s sinister plans.
    $$,
    true
);

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    12,
    '4-1 Dissection Room, Master Bedroom, Lucas'' Room, Attic and The Backyard',
    4.1,
    'Ethan navigates Lucas'' traps, collects items, solves puzzles, and encounters new enemies in the Testing Area.',
    $$
    Ethan follows Lucas'' instructions into the dissection room, finding the rest of the deputy''s body and obtaining the snake key while facing crawling molded enemies. 
    He proceeds to the master bedroom, collecting herbs, ammo, a lock pick, and solving a clock puzzle to reveal a hidden staircase. The attached storage room provides additional treasures and backpack upgrades. 
    In Lucas'' room, Ethan gathers more ammo, chem fluid, supplements, and a green herb while discovering a button that lowers the attic ladder. 
    In the attic, he finds a Mr. Everywhere, the Happy Birthday VHS tape, toy weapons, and a shadow puzzle that unlocks a blue keycard. 
    Back in the backyard, Ethan deals with crawling molded, completes another shadow puzzle with the wooden axe to obtain a stabilizer shot, and prepares to watch the VHS tape.
    $$,
    false
);

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    12,
    '4-2 Happy Birthday VHS Tape',
    4.2,
    'Ethan watches the disturbing Happy Birthday tape, completing Lucas'' twisted puzzles and collecting key items to progress.',
    $$
    Safe in the trailer, Ethan watches the Happy Birthday VHS tape, which details Clancy''s harrowing fate under Lucas'' twisted test. 
    He approaches the corpse-clown and retrieves a candle, navigates sprayers that extinguish it, and grabs a winding key from a barrel. 
    Ethan discovers a dirty telescope in the bathroom, cleans it using water from the test area, and uses it to decipher glyphs on the monitors. 
    Back in the cake room, he solves puzzles using the candle, straw doll, quill pen, and dummy finger, ultimately obtaining the password to a locked hallway door. 
    Ethan retrieves the valve handle from the newly unlocked room and installs it in the pipe to disable the water sprayers, allowing him to complete the puzzle and save Clancy''s progress. 
    After finishing the tape, he records his progress and prepares for Lucas'' upcoming party.
    $$,
    false
);

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    12,
    '4-3 Lucas'' Party',
    4.3,
    'Ethan navigates Lucas'' deadly party, avoiding tripwires and traps, gathering key items, and defeating the barn molded to progress.',
    $$
    Ethan installs the red and blue keycards and enters Lucas'' party. He watches a welcome message on the TV, then proceeds through hallways filled with explosive tripwires, ducking or shooting them to avoid damage. 
    Along the way, he collects herbs, handgun ammo, and discovers a repair kit for his broken shotgun, upgrading it to an M21. Cautious navigation through storage rooms nets antique coins, steroids, chem fluid, and strong chem fluid. 

    Ethan ascends to the barn area, gathering gunpowder, shotgun shells, and batteries, while avoiding traps and defeating wandering molded. 
    After installing the battery in a machine, Lucas triggers the barn fight: Ethan faces a vomiting, fat molded with new projectile attacks. Using cover and focused shotgun shots to the face, Ethan defeats it, then uses the elevator to continue to the next hallway, ready for the challenges ahead.
    $$,
    false
);

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    12,
    '4-4 To the Boathouse',
    4.4,
    'Ethan navigates Lucas'' testing area, solves puzzles, gathers key items, and makes his way through the swamp to reach the boathouse safe room.',
    $$
    After surviving Lucas'' party, Ethan rides the elevator to a new hallway and gathers supplements and chem fluid while checking the charred corpse with a note revealing the PIN to Lucas'' room. 
    Using the keypad, he reenacts the Happy Birthday tape sequence, skipping repetitive steps but following the key actions: burning the rope lock, dialing 'LOSER,' installing the valve handle, and placing the candle on the cake.

    Ethan uses a bomb to open a new path, enters Lucas'' room, retrieves the Testing Area map and the D-Series head, and collects his inventory from the box. 
    Moving outside onto the docks, he picks up shotgun shells and handgun ammo while using the crank to raise walkways through the swamp.

    Along the piers, Ethan encounters crawling and walking molded enemies emerging from the water. He reaches the boathouse, finding a safe room stocked with green herbs, flame rounds, psychostimulants, chem fluid, strong chem fluid, separating agent, and gunpowder. 
    After saving, he prepares for the upcoming fight, ensuring sufficient healing items and ammunition, and grabs the D-Series arm before heading upstairs.
    $$,
    false
);

-- 5. Boathouse

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    null,
    'Boathouse',
    5.0,
    'Ethan reaches the boathouse area after completing Lucas'' tests, preparing for the upcoming confrontation and final sequences.',
    $$
    After completing the Testing Area challenges, Ethan heads to the boathouse. Use the crank to raise walkways and navigate through the swamp, picking up ammo, chem fluid, and supplies along the way. Be alert for crawling and walking molded that attack from the water and pier. 

    Inside the boathouse, find a safe room stocked with herbs, ammo, chem fluid, and other useful items. Save your progress and organize your inventory, as a major fight is imminent. Collect the D-Series arm and head, then head upstairs to advance the storyline.
    $$,
    true
);

-- 5-1

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    17,
    '5-1 Making the Serum',
    5.1,
    'Ethan helps Zoe craft the serum, battles Jack in his monstrous form, and chooses who receives the serum, determining the ending.',
    $$
    Before leaving the boathouse safe room, ensure your inventory is ready: have the D-Series arm and head, plenty of first aid meds, and all ammo for your handgun, shotgun, and burner. Leave the grenade launcher behind.

    Head upstairs to cut both girls free and give Zoe the D-Series head and arm. While she makes the serum, Jack returns as a massive, slime-covered monster with glowing yellow eyes. The fight spans two floors, with wide, sweeping attacks. Focus on shooting all his eyes, including hidden ones. 

    When the last eye is destroyed, Jack burrows and resurfaces; finish him with your strongest weapon. A brief encore occurs, but Zoe uses one dose of the serum, finally ending him.

    Afterward, follow Zoe to the pier. Choose who to give the serum to, which determines the game''s ending. Regardless of choice, you board the boat and sail away.
    $$,
    false
);

-- 6. Wrecked Ship

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    null,
    'Wrecked Ship',
    6,
    'After the showdown at the boathouse, Ethan and his partner crash near a massive derelict ship where the nightmare continues.',
    $$
    The escape by boat takes a dark turn when a massive black ooze and Eveline interrupt the plan. The vessel runs aground, flinging Ethan and his partner into the rotting hulk of an abandoned ship stranded in the swamp. Once inside, the story takes a sharp shift — the environment is dark, claustrophobic, and crawling with molded.

    The wrecked ship hides key revelations about the origins of Eveline, the Bakers, and the bioweapon program. Resources are scarce, the molded are more aggressive, and the layout is confusing and multi-leveled. The search to regroup — and survive — begins.
    $$,
    true
);

-- 6-1 to 6-4

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    19,
    '6-1 Into the Wrecked Ship',
    6.1,
    'After the boat crash, Mia enters the eerie wrecked ship to search for Ethan — unarmed, disoriented, and stalked by molded.',
    $$
    The ship section begins immediately after the crash. Mia wakes up on shore and follows the only path forward into the rusted hull. A brief reunion with Ethan is cut short as Eveline drags him away, forcing Mia deeper into the ship alone.

    Navigation is mostly linear at first — climbing staircases and following long, twisting corridors — punctuated by hallucinations that point the way. Hidden in crawlspaces and flooded rooms are two easy-to-miss Antique Coins, rewarding players who investigate corners instead of rushing forward.

    Eventually, Mia encounters locked doors that require a fuse, and molded enemies start appearing. With no weapons, confrontation isn''t an option. Players must run, dodge, and memorize the route. A green herb and chem fluid can be combined to make a First Aid Med, crucial for survival. Sprinting to the fuse triggers a molded ambush, but a fast retreat avoids damage.

    After installing the fuse, Mia gains access to the upper floors where Eveline sits watching a TV. She demands that Mia watch the old videotape — marking the transition to the next major story section.
    $$,
    false
);

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    19,
    '6-2 Old Videotape',
    6.2,
    'Inside the videotape, Mia relives the doomed mission to contain Eveline aboard the tanker — armed with a P19 and hunted by molded while trying to fix the elevator and reach Alan.',
    $$
    The videotape throws players into Mia''s past on the ship, revealing that she was part of a mission to transport and observe Eveline. Unlike before, Mia starts this sequence fully armed — inventory box by the TV, machine gun ammo on the desk, and the P19 machine gun ready to use.

    The route through the ship winds from the bunk room to the dining hall and kitchen, building up supplies — supplements, herbs, chem fluid, and machine gun rounds — while molded attacks become frequent. The machine gun''s recoil is wild, forcing the player to either chest-spray until recoil drifts to the head or fire controlled bursts under pressure.

    The first major objective is calling the elevator. After looping back to the elevator and killing the molded that drops inside, Mia descends to S2 in search of corrosive — the key item required to melt open locked doors and cabinets throughout the ship.

    S2 is a gauntlet of tight corridors, molded ambushes, item stashes and remote bomb opportunities. The corrosive in the luggage room becomes the turning point, allowing access to all previously blocked doors. Backtracking through the ship unlocks upgrades, ammo and more corrosive, while Eveline mocks Mia through phone calls and hallucinations.

    Eventually, Mia restores access to the upper floors and chases Eveline toward the elevator once again. She reaches the third floor only to find Alan terminally infected. The mission collapses from here: Eveline loses control, the ship becomes overwhelmed with mold, and Alan dies.

    The tape ends with Mia being consumed by Eveline''s outburst — setting up the present-day disaster and explaining how the Baker outbreak began.
    $$,
    false
);

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    19,
    '6-3 Looking for Ethan',
    6.3,
    'Mia searches the wrecked ship for Ethan, navigating molded attacks, scavenging weapons and corrosives, and restoring elevator access.',
    $$
    After the videotape ends, Mia confronts Eveline and finds herself stranded aboard the ruined tanker — unarmed, wounded and desperate to locate Ethan. The elevator becomes the core of the mission, but the elevator car is inaccessible from below, forcing Mia to climb the ladder up the shaft and drop through a hatch into the ship''s bridge.

    The bridge becomes a key navigation hub. The security monitors confirm Ethan is still alive, trapped elsewhere on the ship. Mia collects a ship map and the lug wrench from the captain''s cabin before pushing deeper into the wreckage.

    The ship begins to feel like a scavenger hunt from hell: green herbs in lockers, gunpowder in desk drawers, remote bombs hidden near molded ambush points, and a frustrating locked box hiding an antique coin that Mia can''t reach yet. The elevator doors can be forced open, but the car is missing both a fuse and a cable — meaning Mia will have to explore multiple floors and every dark corner of the ship to restore power.

    Before searching for parts, Mia prioritizes survival. She climbs to the second floor and retrieves a survival knife, sneaks around an armless molded guarding the hall, and reaches a safe room with corrosive and handgun ammo. Using the corrosive, she enters the bunk room and finds the captain''s cabin locker key — the only path to meaningful firepower.

    Returning to the bridge, she unlocks the cabin locker and arms herself with the P19 machine gun, triggering a frantic molded attack the moment she grabs it. From that point on, the wrecked ship segment transforms into a mobile war zone: tight hallways, breakable crates, bombs used as improvised traps, and molded stalking Mia across previously “safe” rooms.

    A puzzle room with mismatched paintings rewards Mia with three more corrosives — essential for reaching hidden upgrades and shortcuts — while the rest of the ship bridges into a loop of gathering ammo, blowing threats away with remote bombs and carving her path back toward the elevator shaft.

    The section ends after assembling enough supplies and mobility to finally commit to repairing the elevator — fuse and cable are now the last missing pieces standing between Mia and Ethan.
    $$,
    false
);

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    19,
    '6-4 Fixing the Elevator & Rescuing Ethan',
    6.4,
    'Mia retrieves the elevator cable and fuse while surviving heavy molded attacks, repairs the lift, and fights her way through S2 to reach Ethan.',
    $$
    Mia returns to the elevator shaft with one clear objective — get it working and reach Ethan. Climbing to the third floor leads her into the control room, where she unlocks a toolbox for an antique coin before burning open a sealed door. The walkway from the old videotape becomes real again, ending in the sick bay where the elevator cable sits waiting. The moment Mia detaches it, a massive fat molded ambushes her. Landing remote bombs ends the threat, allowing Mia to grab the cable, a corrosive, and more bombs before escaping.

    Back at the elevator, Mia installs the cable and drops to the first floor to hunt down the fuse. Molded enemies patrol relentlessly, but Mia detours into the maintenance room to pick up the MPM handgun and save her progress. After retrieving the fuse from its original slot near Eveline''s door, she raids the recreation room for machine gun ammo, herbs, bombs, corrosive, and the final inventory backpack upgrade. More collectibles and diary pages lie ahead, along with another ambush from the crawling molded.

    With the fuse finally installed, Mia hits the S2 button and descends into the mold-covered depths. The path becomes a gauntlet of molded ambushes: surprise attacks from above, waves from the hallway, and close-quarters combat in the two-level arena room. Remote bombs and the machine gun become the only reliable way to survive. A fat molded blocks the staircase, requiring traps or bombs to kill. Past that, Mia raids more cabinets and explosives, even grabbing the last antique coin from a locked corrosive cabinet in the hallway.

    The final sequence leads Mia into the cargo bay — the birthplace of her corrosive supply — for two more remote bombs. Reinforced and running low on time, Mia pushes through the last hallway door and finally confronts Eveline. The scene that follows brings Mia and Ethan back together and launches the next phase of their nightmare.
    $$,
    false
);

-- 7. Salt Mines and the Final Battle

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    null,
    'Salt Mines & Final Battle',
    7,
    'Ethan fights his way through the salt mines and confronts Eveline in the ultimate showdown to end the nightmare.',
    $$
    After escaping the wrecked ship, Ethan regains control and descends into the salt mines — a maze of tunnels infested with molded and controlled by Eveline. As he advances through abandoned mining routes, research labs, and armed militia remnants, Ethan uncovers the truth behind Eveline’s origin and the Baker family’s corruption. With weapons, supplies, and intel scattered through the mines, Ethan pushes deeper toward the heart of the infection and prepares for the decisive confrontation that will determine whether he and his family survive.
    $$,
    true
);

-- 7-1 to 7-2

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    24,
    '7-1 Into the Depths',
    7.1,
    'Ethan returns to shore, regroups at the shack, gears up, and fights his way into the salt mines to begin the final stretch of the nightmare.',
    $$
    After the confrontation on the wrecked ship, Ethan regains consciousness with a single goal — finish this once and for all. He pushes through the swamp and reaches a lonely shack, scavenging supplies and discovering a radio message hinting that he’s being tracked. Inside the safe room, he finally recovers all of his and Mia’s gear and prepares for the toughest battles ahead, choosing weapons and items wisely before heading out.

    Once ready, Ethan enters the salt mines, where molded swarm relentlessly and resources are scattered between ambushes and traps. Tripwires, explosive barrels, and tight tunnels force Ethan to fight smart while navigating branching tunnels, minecart tracks, and makeshift workstations. Throughout the descent, he finds research logs and reports revealing Eveline’s origin as a bio-weapon and the collapse of her sanity. With the necrotoxin nearly complete and the tunnel system opening into massive caverns, Ethan pushes deeper toward the heart of the mold infection — and toward Eveline.
    $$,
    false
);

insert into StoryArcs (
    gameID, parentArcID, arcTitle, arcOrder, summary, description, isMainArc
) values (
    1,
    24,
    '7-2 Finding Eveline and the Final Battle',
    7.2,
    'Ethan navigates the mines, confronts hallucinations, and finally faces eveline in her monstrous final form to end the nightmare.',
    $$
    After surviving the treacherous salt mines, Ethan pushes onward, fighting waves of molded and carefully managing scarce ammo. He crawls through flooded tunnels, ambushes, and traps, collecting supplies like enhanced handgun ammo, remote bombs, and 44 MAG rounds. Eventually, he reaches the guest house, now twisted by Eveline’s psychic hallucinations. Ignoring the illusions, he makes his way to the attic.

    There, Eveline unleashes her full psychic power, knocking Ethan around but causing no direct harm. Ethan injects her with the serum, triggering her final mutation into a massive abomination. The fight escalates through three phases: first, he unloads his most powerful weapons in a confined room; next, he continues the battle outside from the ground, dodging attacks; and finally, he grabs the Albert-01 and takes out Eveline while avoiding her flailing tentacles. With the threat eliminated, the evacuation helicopter arrives — who accompanies Ethan depends on the serum decision made at the boathouse, providing a slightly different ending.
    $$,
    false
);

-- roles and contributors
-- refs: https://residentevil.fandom.com/wiki/Resident_Evil_7:_Biohazard/credits

insert into Roles (roleName) values
('Director'),
('Art Director'),
('Presentation Director'),
('Cinematic Director'),
('Technical Art Director'),
('Audio Director'),
('Lead Composer'),
('Scenario Director'),
('Localization Director'),
('Narrative Consultant'),
('Lead Programmer'),
('Lead Level Designer'),
('Lead Character Artist'),
('Lead Game Designer'),
('Lead Gameplay Animator'),
('Lead Presentation Animator'),
('Lead Lighting Artist'),
('Lead VFX Artist'),
('Lead UX Designer'),
('Project Manager'),
('Senior Project Manager');

insert into Contributors (contributorName, specialization) values
('Koshi Nakanishi', 'Director'),
('Tomonori Takano', 'Art Director'),
('Toshihiko Tsuda', 'Art Director'),
('Hiroyuki Chi', 'Art Director'),
('Masato Miyazaki', 'Presentation Director'),
('Navid Khonsari', 'Cinematic Director'),
('Makoto Fukui', 'Technical Art Director'),
('Wataru Hachisako', 'Audio Director'),
('Akiyuki Morimoto', 'Lead Composer'),
('Morimasa Sato', 'Scenario Director'),
('Mark Reichwein', 'Localization Director'),
('Richard Pearsey', 'Narrative Consultant'),
('Yusuke Noro', 'Lead Programmer'),
('Tomofumi Ishida', 'Lead Programmer'),
('Tomohiro Shingu', 'Lead Level Designer'),
('Hirotada Miyatake', 'Lead Level Designer'),
('Yuya Kuroyabu', 'Lead Character Artist'),
('Hajime Horiuchi', 'Lead Game Designer'),
('Keisuke Yamakawa', 'Lead Game Designer'),
('Yuki Yanagimoto', 'Lead Gameplay Animator'),
('Toshiya Kotani', 'Lead Presentation Animator'),
('Tsuyoshi Irie', 'Lead Presentation Animator'),
('Yuka Chi', 'Lead Lighting Artist'),
('Kazumasa Kuroda', 'Lead VFX Artist'),
('Masahiro Takayama', 'Lead UX Designer'),
('Makoto Kadono', 'Project Manager'),
('Yoshizumi Hori', 'Senior Project Manager');

-- games_contributors relation

-- Resident Evil 7 contributors

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Koshi Nakanishi' and Roles.roleName = 'Director';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Tomonori Takano' and Roles.roleName = 'Art Director';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Toshihiko Tsuda' and Roles.roleName = 'Art Director';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Hiroyuki Chi' and Roles.roleName = 'Art Director';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Masato Miyazaki' and Roles.roleName = 'Presentation Director';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Navid Khonsari' and Roles.roleName = 'Cinematic Director';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Makoto Fukui' and Roles.roleName = 'Technical Art Director';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Wataru Hachisako' and Roles.roleName = 'Audio Director';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Akiyuki Morimoto' and Roles.roleName = 'Lead Composer';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Morimasa Sato' and Roles.roleName = 'Scenario Director';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Mark Reichwein' and Roles.roleName = 'Localization Director';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Richard Pearsey' and Roles.roleName = 'Narrative Consultant';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Yusuke Noro' and Roles.roleName = 'Lead Programmer';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Tomofumi Ishida' and Roles.roleName = 'Lead Programmer';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Tomohiro Shingu' and Roles.roleName = 'Lead Level Designer';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Hirotada Miyatake' and Roles.roleName = 'Lead Level Designer';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Yuya Kuroyabu' and Roles.roleName = 'Lead Character Artist';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Hajime Horiuchi' and Roles.roleName = 'Lead Game Designer';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Keisuke Yamakawa' and Roles.roleName = 'Lead Game Designer';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Yuki Yanagimoto' and Roles.roleName = 'Lead Gameplay Animator';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Toshiya Kotani' and Roles.roleName = 'Lead Presentation Animator';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Tsuyoshi Irie' and Roles.roleName = 'Lead Presentation Animator';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Yuka Chi' and Roles.roleName = 'Lead Lighting Artist';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Kazumasa Kuroda' and Roles.roleName = 'Lead VFX Artist';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Masahiro Takayama' and Roles.roleName = 'Lead UX Designer';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Makoto Kadono' and Roles.roleName = 'Project Manager';

insert into Games_Contributors (gameID, contributorID, roleID)
select 1, contributorID, roleID from Contributors, Roles where Contributors.contributorName = 'Yoshizumi Hori' and Roles.roleName = 'Senior Project Manager';

-- reviewing data

select * from games;
select * from platforms;
select * from games_platforms;
select * from ingamecharacters;
select * from appearances;
select characterID, characterName from InGameCharacters;
select * from maps;
select * from mobs;
select * from mob_maps;
select * from storyarcs;
select * from roles;
select * from contributors;
select * from games_contributors;