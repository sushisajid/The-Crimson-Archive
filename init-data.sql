SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

insert into Games (gamecoverurl, gamelogourl, title, plotsummary, releasedate, multiplayersupport) values
('D:\the-crimson-archive\URLs\Games\GameCovers\Re7_xone_cover.jpg', 
'D:\the-crimson-archive\URLs\Games\GameLogos\Resident_Evil_7_logo.jpg', 
'Resident Evil 7: Biohazard', 
'Set in modern day rural America and taking place after the dramatic events of Resident Evil® 6, 
players experience the terror directly from the first person perspective. Resident Evil 7 embodies 
the series'' signature gameplay elements of exploration and tense atmosphere that first coined 
“survival horror” some twenty years ago; meanwhile, a complete refresh of gameplay systems 
simultaneously propels the survival horror experience to the next level.', '24-01-2017', true);

insert into Games (gamecoverurl, gamelogourl, title, plotsummary, releasedate, multiplayersupport) values
('D:\the-crimson-archive\URLs\Games\GameCovers\Resident_Evil_Village_NA_Cover_29.jpg', 
'D:\the-crimson-archive\URLs\Games\GameLogos\RESIDENT_EVIL_VILLAGE_logo.jpg', 'Resident Evil Village', 
'Years after the tragic events of Resident Evil 7 biohazard, Ethan Winters has started over with 
his wife Mia, finally living in peace and putting the past behind them. However, Chris Redfield, 
the legendary hero from previous Resident Evil games, suddenly disrupts their life, throwing a 
devastated Ethan into a new and twisted nightmare in search of answers.', '07-05-2021', false);

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

-- appearances

insert into Appearances (gameID, characterID, firstAppearance, isPlayable, notes) VALUES (
    1,  -- this should match Ethan Winters' characterID after insertion
    currval('InGameCharacters_characterID_seq'),  -- gets the last inserted characterID
    true,
    true,
    '- infected by mold, giving him enhanced resilience.\n- involved with major bioterrorism incidents in dulvey parish (baker family, eveline).\n- receives aid and guidance from zoe baker.\n- uses weapons including axes, chainsaws, and experimental bsaa equipment (albert-01).\n- dies heroically while saving family.'
);