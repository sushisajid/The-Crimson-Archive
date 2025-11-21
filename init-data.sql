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
SET gamecoverurl = 'https://raw.githubusercontent.com/sushisajid/URLs/Games/GameCovers/Re7_xone_cover.jpg'
WHERE gameID = 1;

UPDATE Games
SET gamelogourl = 'https://raw.githubusercontent.com/sushisajid/URLs/Games/GameLogos/Resident_Evil_7_logo.jpg'
WHERE gameID = 1;

UPDATE Games
SET gamecoverurl = 'https://raw.githubusercontent.com/sushisajid/URLs/Games/GameCovers/Resident_Evil_Village_NA_Cover_29.jpg'
WHERE gameID = 2;

UPDATE Games
SET gamelogourl = 'https://raw.githubusercontent.com/sushisajid/URLs/Games/GameLogos/RESIDENT_EVIL_VILLAGE_logo.jpg'
WHERE gameID = 2;

select * from games;

-- platforms

insert into Platforms (platformName) values
('PC'),
('PlayStation 4'),
('PlayStation 5'),
('Xbox One'),
('Xbox Series X/S'),
('Nintendo Switch'),
('iOS');

select * from platforms;

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
set spriteURL = 'https://raw.githubusercontent.com/sushisajid/URLs/InGameCharacters/ethan_re7.webp'
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
'katie o''hagan', 'akari higuchi', 'N/A', 'https://raw.githubusercontent.com/sushisajid/URLs/InGameCharacters/mia_re7.webp');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    true,
    'mia winters appears as a fit, determined woman in her early 30s, wearing tactical casual clothing: dark jacket, fitted pants, and boots. she has shoulder-length brown hair and a focused expression. animations reflect agility, firearm handling, and interaction with objects like the genome codex.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('David Anderson',
'african-american deputy sheriff assigned to patrol the dulvey bayou following a series of disappearances. investigates the baker house, encounters ethan winters, but is killed by jack baker early in the incident. his corpse becomes partially converted by mold and is used by lucas baker to manipulate ethan. his death is later covered up by the sheriff’s office and bsaa as a gas leak.',
'male, african-american, born c.1986; 175 cm (5''9"), 60 kg (130 lb). deputy sheriff by occupation; dutiful but skeptical and inexperienced when confronted with biohazard threats.',
'hari williams', 'minoru kawai', 'pierre dager', 'https://raw.githubusercontent.com/sushisajid/URLs/InGameCharacters/david_re7.png');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    false,
    'david anderson appears as a mid-30s african-american deputy in standard sheriff uniform with badge, belt, and holster. short black hair, clean-shaven, cautious posture, reflecting law enforcement training. seen mostly as a corpse with mold integration posthumously.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Zoe Baker',
'female from dulvey, louisiana; daughter of jack and marguerite baker, sister to lucas. involved in the dulvey incident as a captive resistant to eveline’s mind control. helps ethan winters navigate the baker estate, reattaches his hand, provides the genome codex, and guides him to cure her and mia. after being captured and partially calcified, she is rescued and quarantined, later gaining a new identity and working as a rookie reporter in new orleans while investigating the incident and the origins of eveline.',
'female, caucasian/american, born c.1994; 170 cm (5''7"), 58 kg (130 lb). resilient, intelligent, resourceful; skilled at surviving in extreme circumstances and assisting others under duress.',
'giselle gilbert', 'yu kobayashi', 'giselle gilbert', 'https://raw.githubusercontent.com/sushisajid/URLs/InGameCharacters/zoe_re7.webp');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    false,
    'zoe baker appears as a young woman in her early 20s, wearing casual clothes: t-shirt, jeans, sneakers. shoulder-length brown hair and expressive facial features convey intelligence and resilience. animations include crawling, running, and assisting ethan with puzzles and hand reattachment.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Chris Redfield',
'american special operations unit operator with bsaa; veteran bioweapon hunter. older brother of claire redfield, mentor to rosemary winters. in the dulvey incident (2017), he responds to blue umbrella’s request to apprehend lucas baker and contain the mold bioweapon. assists ethan winters and mia, eliminates mutant lucas baker, and later coordinates the rescue of zoe baker with her uncle joe.',
'male, caucasian/american, born c.1973; height varies between 181 - 185 cm (5''11" - 6''1"), mass 80 - 100 kg (176 - 220 lb). blood type o. highly skilled marksman, tactician, and hand-to-hand combatant; specializes in biohazard containment and bioweapon neutralization.',
'david vaughn', 'hiroki tōchi', 'david vaughn', 'https://raw.githubusercontent.com/sushisajid/URLs/InGameCharacters/chris_re7.webp');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    true,
    'chris redfield appears as a muscular veteran in his mid-40s, wearing tactical combat gear with chest rig, gloves, and boots. short brown hair, stubbled face, and stern expression. animations include combat, climbing, and weapon handling.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Alan Droney',
'special agent for the connections, assigned alongside mia winters to act as handler and parental figure for eveline. during transport on the ss annabelle, eveline’s mold infection overtakes the crew, including alan. after showing symptoms, he sends mia to subdue eveline, but eveline accelerates the mold inside him, killing him. he later appears in a group photo in miranda’s lab in resident evil village.',
'male, caucasian/american, born c.1961, died october 5, 2014 (aged 53). height 180 cm (5''11"), mass 80 kg (180 lb).',
'kip pardue', 'kyomitsu mizuuchi', 'mark hobart', 'https://raw.githubusercontent.com/sushisajid/URLs/InGameCharacters/alan_re7.webp');

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,
    currval('InGameCharacters_characterID_seq'),
    true,
    false,
    'alan droney appears as a middle-aged man in his early 50s, wearing a standard connections agent suit with tie and badge. short brown hair, clean-shaven, neutral expression. seen briefly and later in pre-death group photograph.'
);

insert into InGameCharacters (characterName, backstory, description, englishVA, japaneseVA, motionCapture, spriteURL) values
('Lucas Baker',
'firstborn of jack and marguerite baker from dulvey, louisiana. infected by eveline’s mold, gains regenerative abilities and a sadistic streak, designing deadly puzzles to kill victims. acted as a researcher for the Connections syndicate, later betrays them and kills their scientists. mutates and is killed by chris redfield in the salt mines after attempting to sell eveline’s bioweapon data.',
'male, caucasian/american, height 182 cm (6''0"), mass 68 kg (150 lb), deceased. family: jack baker (father), marguerite baker (mother), joe baker (uncle), zoe baker (sister).',
'jesse pimentel', 'setsuji sato', 'jesse pimentel', 'https://raw.githubusercontent.com/sushisajid/URLs/InGameCharacters/lucas_re7.webp');

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
'patricia mcneely', 'yuri tabata', 'N/A', 'https://raw.githubusercontent.com/sushisajid/URLs/InGameCharacters/eveline_re7.webp');

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
'jack brand', 'kazuhiro yamaji', 'jack brand', 'https://raw.githubusercontent.com/sushisajid/URLs/InGameCharacters/joe_re7.webp');

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
'sara coates', 'maki izawa', 'sara coates', 'https://raw.githubusercontent.com/sushisajid/URLs/InGameCharacters/marguerite_re7.webp');

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
'Tony Vogel', 'Yu Seki', 'N/A', 'https://raw.githubusercontent.com/sushisajid/URLs/InGameCharacters/clancy_re7.png');

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
'Robert Vestal', 'N/A', 'N/A', 'https://raw.githubusercontent.com/sushisajid/URLs/InGameCharacters/peter_re7.png');

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
'Christopher Ashman', 'N/A', 'N/A', 'https://raw.githubusercontent.com/sushisajid/URLs/InGameCharacters/andre_re7.png');

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
'N/A', 'N/A', 'N/A', 'https://raw.githubusercontent.com/sushisajid/URLs/InGameCharacters/hoffman_re7.png');

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

select * from ingamecharacters;
select * from appearances;

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

select characterID, characterName from InGameCharacters;

-- mobs and maps
-- ref: https://www.evilresource.com/resident-evil-7/maps

-- guest house maps
insert into Maps (gameID, mapName, floorName, description, mapURL) values
(1, 'Guest House', '1F', 'first floor of the guest house in the baker estate, includes main living area, dining, and hallway.', NULL),
(1, 'Guest House', '2F', 'second floor of the guest house, includes bedrooms and bathroom.', NULL),
(1, 'Guest House', '3F', 'third floor of the guest house, attic storage and additional rooms.', NULL),
(1, 'Guest House', 'B1', 'basement of the guest house, storage and access to hidden areas.', NULL);

-- main house maps
insert into Maps (gameID, mapName, floorName, description, mapURL) values
(1, 'Main House', '1F', 'first floor of the main house, includes kitchen, living room, and foyer.', NULL),
(1, 'Main House', '2F', 'second floor of the main house, bedrooms and study areas.', NULL),
(1, 'Main House', 'Attic', 'attic of the main house, storage area with hidden secrets.', NULL),
(1, 'Main House', 'Processing Area', 'processing area of the main house, contains Eveline containment and lab equipment.', NULL);

select * from Maps;