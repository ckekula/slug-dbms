-- INSERTING VALUES
-- @block Insert Universities
INSERT INTO uni
VALUES ('uop', 'University of Peradeniya'),
    ('uoc', 'University of Colombo'),
    ('uok', 'University of Kelaniya'),
    ('usj', 'University of Sri Jayawardanapura'),
    ('uor', 'University of Ruhuna'),
    ('uom', 'University of Moratuwa'),
    ('eus', 'South Easteran University of Sri Lanka'),
    ('uoj', 'University of Jaffna'),
    ('sus', 'Sabaragamuwa University of Sri Lanka'),
    ('rus', 'Rajarata University of Sri Lanka'),
    ('wus', 'Wayamba University of Sri Lanka');
-- @block Update Uni table
UPDATE uni
SET uni_name = 'University of Sri Jayawardhanapura'
WHERE uni_id = 'usj';
UPDATE uni
SET uni_name = 'Eastern University of Sri Lanka'
WHERE uni_id = 'eus';
-- @block Delete Uni
DELETE FROM uni
WHERE uni_id = 'wus';
-- @block Insert comp
INSERT INTO comp
VALUES (
        'slug2024',
        'Sri Lanka University Games 2024',
        2024,
        '2024-07-08',
        '2024-09-08',
        'usj',
        'uor',
        'uoc'
    ),
    (
        'slug2023',
        'Sri Lanka University Games 2023',
        2023,
        '2023-07-08',
        '2023-09-08',
        'uom',
        'uok',
        'usj'
    ),
    (
        'slug2022',
        'Sri Lanka University Games 2022',
        2022,
        '2022-07-08',
        '2022-09-08',
        'uor',
        'usj',
        'uop'
    ),
    (
        'slug2021',
        'Sri Lanka University Games 2021',
        2021,
        '2021-07-08',
        '2021-09-08',
        'usj',
        'uok',
        'uom'
    ),
    (
        'slug2020',
        'Sri Lanka University Games 2020',
        2020,
        '2020-07-08',
        '2020-09-08',
        'uok',
        'uoc',
        'uor'
    ),
    (
        'slug2018',
        'Sri Lanka University Games 2019',
        2019,
        '2019-07-08',
        '2019-09-08',
        'uoc',
        'uop',
        'uok'
    );
-- @block Update comp table
UPDATE comp
SET comp_id = 'slug2019'
WHERE comp_id = 'slug2018';
UPDATE comp
SET begin_date = '2020-07-09'
WHERE comp_id = 'slug2020';
-- @block Delete comp
DELETE FROM comp
WHERE comp_id = 'slug2019';
-- @block insert Sports
INSERT INTO sport
VALUES ('krt', 'karate', 'slug2024', 1, 1),
    ('bkt', 'basketball', 'slug2024', 0, 0),
    ('crc', 'cricket', 'slug2024', 0, 0),
    ('rwg', 'rowing', 'slug2024', 0, 0),
    ('tt', 'table tennis', 'slug2024', 0, 0),
    ('wlf', 'weight lifting', 'slug2024', 0, 0),
    ('ftb', 'football', 'slug2024', 0, 0),
    ('vly', 'volleyball', 'slug2024', 0, 0),
    ('bdm', 'badminton', 'slug2024', 0, 0),
    ('swg', 'swimming', 'slug2024', 0, 0);
-- @block Update sport table
UPDATE sport
SET sport_id = 'tts'
WHERE sport_id = 'tt';
UPDATE sport
SET sport_id = 'wft'
WHERE sport_id = 'wlf';
-- @block Delete sport
DELETE FROM sport
WHERE sport_id = 'wft';
-- @block Insert weight classes
INSERT INTO weight_class
VALUES ('krt49', 'krt', 49),
    ('krt54', 'krt', 54),
    ('krt60', 'krt', 60),
    ('krt67', 'krt', 67),
    ('krt74', 'krt', 74),
    ('krt81', 'krt', 82);
-- @block Update weight class table
UPDATE weight_class
SET max_weight = 75
WHERE weight_class_id = 'krt74';
UPDATE weight_class
SET max_weight = 81
WHERE weight_class_id = 'krt81';
-- @block Delete weight_class
DELETE FROM weight_class
WHERE weight_class_id = 'krt81';
-- @block insert belts
INSERT INTO belt (belt_id, sport_id, color)
VALUES ('krtRed', 'krt', 'Redd'),
    ('krtBlue', 'krt', 'Bluee'),
    ('krtGreen', 'krt', 'Green'),
    ('krtYellow', 'krt', 'Yellow'),
    ('krtBrown', 'krt', 'Brown'),
    ('krtBlack', 'krt', 'Black');
-- @block Update belt table
UPDATE belt
SET color = 'Blue'
WHERE belt_id = 'krtBlue';
UPDATE belt
SET color = 'Red'
WHERE belt_id = 'krtRed';
-- @block Delete belt
DELETE FROM belt
WHERE belt_id = 'krtGreen';
-- @block insert events
INSERT INTO events
VALUES ('bktm', 'bkt', 'Basketball Mens', 'M'),
    ('krtw50', 'krt', 'Karate Womens below 50', 'W'),
    ('krtw55', 'krt', 'Karate Womens below 55', 'W'),
    ('krtw60', 'krt', 'Karate Womens below 60', 'W'),
    ('krtw67', 'krt', 'Karate Womens below 67', 'W'),
    ('krtw75', 'krt', 'Karate Womens below 75', 'W'),
    ('ftbm', 'ftb', 'Football Mens', 'M'),
    ('vlym', 'vly', 'Volleyball Mens', 'M'),
    (
        'swgmfs100',
        'swg',
        'Swimming mens freestyle 100m',
        'M'
    ),
    (
        'swgmfs200',
        'swg',
        'Swimming mens freestyle 200m',
        'M'
    ),
    (
        'swgwfs100',
        'swg',
        'Swimming womens freestyle 100m',
        'W'
    ),
    (
        'swgwfs200',
        'swg',
        'Swimming womens freestyle 200m',
        'W'
    );
-- @block Update events
UPDATE events
SET events_id = 'krtw61',
    events_name = 'Karate Womens below 61'
WHERE events_id = 'krtw60';
UPDATE events
SET events_id = 'krtw68',
    events_name = 'Karate Womens below 68'
WHERE events_id = 'krtw67';
-- @block Delete Events
DELETE FROM events
WHERE events_id = 'krtw75';
-- @block insert team
INSERT INTO team
VALUES ('uorbktm', 'uor', 'bktm'),
    ('uopbktm', 'uop', 'bktm'),
    ('uombktm', 'uom', 'bktm'),
    ('uockrtw50', 'uoc', 'krtw50'),
    ('uokkrtw50', 'uok', 'krtw50'),
    ('usjkrtw50', 'usj', 'krtw50'),
    ('uopkrtw50', 'uop', 'krtw50'),
    ('euslkrtw50', 'eus', 'krtw50'),
    ('uorftbm', 'uor', 'ftbm'),
    ('uopftbm', 'uop', 'ftbm'),
    ('uomvlym', 'uom', 'vlym'),
    ('uocvlym', 'uoc', 'vlym'),
    ('uorswgmfs100', 'uor', 'swgmfs100'),
    ('uopswgmfs100', 'uop', 'swgmfs100');
-- @block Update Team table
UPDATE team
SET team_id = 'uomkrtw50',
    uni_id = 'uom'
WHERE team_id = 'uopkrtw50';
UPDATE team
SET team_id = 'euskrtw50',
    uni_id = 'eus'
WHERE team_id = 'euslkrtw50';
-- @block Delete Team
DELETE FROM team
WHERE team_id = uomkrtw50;
-- @block Insert Participants 
INSERT INTO participant
VALUES (
        'uorbktm1',
        'Kavisha',
        'Siriwardana',
        'M',
        'uorbktm',
        '+94-123456789'
    ),
    (
        'uorbktm2',
        'Nadeesh',
        'Madhushanka',
        'M',
        'uorbktm',
        '+94-987654321'
    ),
    (
        'uopbktm1',
        'Dilan',
        'Shanaka',
        'M',
        'uorbktm',
        NULL
    ),
    (
        'uopbktm2',
        'Supun',
        'Priyantha',
        'M',
        'uorbktm',
        '+94-789012345'
    ),
    (
        'uombktm1',
        'Malith',
        'Kumara',
        'M',
        'uorbktm',
        '+94-567890123'
    ),
    (
        'uombktm2',
        'Chamara',
        'Bandara',
        'M',
        'uopbktm',
        '+94-123456789'
    ),
    (
        'uockrtw501',
        'Hasintha',
        'Perera',
        'W',
        'uockrtw50',
        '+94-987654321'
    ),
    (
        'uockrtw502',
        'Akashi',
        'Rathnayake',
        'W',
        'uockrtw50',
        '+94-112233445'
    ),
    (
        'uokkrtw501',
        'Nirmalani',
        'Jayasinghe',
        'W',
        'uokkrtw50',
        '+94-789012345'
    ),
    (
        'uokkrtw502',
        'Praveena',
        'Mendis',
        'W',
        'uokkrtw50',
        '+94-567890123'
    ),
    (
        'usjkrtw501',
        'Sachinthani',
        'Wickramasinghe',
        'W',
        'usjkrtw50',
        NULL
    ),
    (
        'usjkrtw502',
        'Udithara',
        'Gunawardena',
        'W',
        'usjkrtw50',
        '+94-987654321'
    ),
    (
        'usjkrtw503',
        'Lahiruni',
        'Herath',
        'W',
        'usjkrtw50',
        '+94-112233445'
    ),
    (
        'usjkrtw504',
        'Lahiruni',
        'Herath',
        'W',
        'usjkrtw50',
        '+94-112233445'
    ),
    (
        'usjkrtw505',
        'Lahiruni',
        'Herath',
        'W',
        'usjkrtw50',
        '+94-112233445'
    ),
    -- Football
    (
        'uorftbm1',
        'Saman',
        'Perera',
        'M',
        'uorftbm',
        NULL
    ),
    (
        'uopftbm1',
        'Nilmini',
        'Fernando',
        'M',
        'uopftbm',
        NULL
    ),
    (
        'uorftbm2',
        'Chamara',
        'Silva',
        'M',
        'uorftbm',
        NULL
    ),
    (
        'uopftbm2',
        'Nirosha',
        'Ratnayake',
        'M',
        'uopftbm',
        NULL
    ),
    -- Volleyball
    (
        'uomvlym1',
        'Ranjan',
        'Jayawardena',
        'M',
        'uomvlym',
        NULL
    ),
    (
        'uocvlym1',
        'Dilrukshi',
        'Perera',
        'M',
        'uocvlym',
        NULL
    ),
    (
        'uomvlym2',
        'Nuwan',
        'Fernando',
        'M',
        'uomvlym',
        NULL
    ),
    (
        'uocvlym2',
        'Kamal',
        'De Silva',
        'M',
        'uocvlym',
        NULL
    );
INSERT INTO participant
VALUES -- swimming
    (
        'uorswgmfs1001',
        'Kavisha',
        'Siriwardana',
        'M',
        'uorswgmfs100',
        '+94-123456789'
    ),
    (
        'uorswgmfs1002',
        'Nadeesh',
        'Madhushanka',
        'M',
        'uorswgmfs100',
        '+94-987654321'
    ),
    (
        'uopswgmfs1001',
        'Dilan',
        'Shanaka',
        'M',
        'uopswgmfs100',
        NULL
    ),
    (
        'uopswgmfs1002',
        'Supun',
        'Priyantha',
        'M',
        'uopswgmfs100',
        '+94-789012345'
    );
-- @block Update Participants table
UPDATE participant
SET phone_number = '+94-142536789'
WHERE participant_id = 'uombktm2';
UPDATE participant
SET phone_number = '+94-7789456231'
WHERE participant_id = 'usjkrtw504';
-- @block Delete Participants
DELETE FROM participant
WHERE participant_id = 'usjkrtw505';
-- @block Insert belt participant
INSERT INTO belt_participant (participant_id, belt_id)
SELECT participant_id,
    'krtBlack'
FROM participant
WHERE participant_id LIKE 'u_krtw50';
-- @block Update belt participant
UPDATE belt_participant
SET belt_id = 'krtBrown'
WHERE participant_id = 'usjkrtw504';
UPDATE belt_participant
SET belt_id = 'krtBrown'
WHERE participant_id = 'usjkrtw503';
-- @block Insert weight participant
INSERT INTO weight_participant (participant_id, weight_class_id)
SELECT participant_id,
    'krt49'
FROM participant
WHERE participant_id LIKE 'u_krtw50';
-- @block Update weight participants
UPDATE weight_participant
SET weight_class_id = 'krt54'
WHERE participant_id = 'usjkrtw504';
UPDATE weight_participant
SET weight_class_id = 'krt54'
WHERE participant_id = 'usjkrtw503';
-- @block DELETE weight participants
DELETE FROM weight_participant
WHERE participant_id = 'usjkrtw504';
-- @block DELETE belt participants
DELETE FROM belt_participant
WHERE participant_id = 'usjkrtw504';
-- @block Insert Official
INSERT INTO official
VALUES ('bktm1', 'Johnson', 'bktm', NULL),
    ('bktm2', 'Brown', 'bktm', 'bktm1'),
    ('bktm3', 'Alex', 'bktm', 'bktm1'),
    ('krtw501', 'Sarah', 'krtw50', NULL),
    ('krtw502', 'Emily', 'krtw50', NULL),
    ('krtw503', 'Scarlett', 'krtw50', 'krtw501');
-- @block Update Officials table
UPDATE official
SET official_name = 'John'
WHERE official_id = 'bktm1';
UPDATE official
SET supervisor_id = 'krtw501'
WHERE official_id = 'krtw502';
-- @block Delete Officials
DELETE FROM official
WHERE official_id = 'bktm3';
-- @block Insert Rounds for Basketball
INSERT INTO rounds
VALUES ('bktmr1', 'bktm', 'Mens Basketball Round 1'),
    ('bktmr2', 'bktm', 'Mens Basetball Round 2'),
    ('bktmr3', 'bktm', 'Mens Baseball Round 3'),
    ('bktmr4', 'bktm', 'Mens BasketBall Round 4');
-- @block Insert Rounds for karate
INSERT INTO rounds
VALUES (
        'krtw50sp',
        'krtw50',
        'Womens Karate below 50kg Sparring'
    ),
    (
        'krtw50ip',
        'krtw50',
        'Womens Karate below 50kg individual poomsae'
    );
-- @block Insert Rounds for football
INSERT INTO rounds
VALUES ('ftbmr1', 'ftbm', 'Mens Football Round 1'),
    ('ftbmr2', 'ftbm', 'Mens Football Round 2');
-- @block Update rounds 
UPDATE rounds
SET rounds_name = 'Mens Basketball Round 2'
WHERE rounds_id = 'bktmr2';
UPDATE rounds
SET rounds_name = 'Mens Basketball Round 3'
WHERE rounds_id = 'bktmr3';
-- @block delete rounds
DELETE FROM rounds
WHERE rounds_id = 'bktmr4';
-- @block Insert round_teams for basketball
INSERT INTO round_teams
VALUES ('bktmr11uor', 'uorbktm', 'bktmr1'),
    ('bktmr1uopp', 'uopbktm', 'bktmr1'),
    ('bktmr2uor', 'uorbktm', 'bktmr2'),
    ('bktmr2uom', 'uombktm', 'bktmr2'),
    ('bktmr3uop', 'uopbktm', 'bktmr3'),
    ('bktmr3uom', 'uombktm', 'bktmr3');
-- @block Insert round_teams for karate
INSERT INTO round_teams
VALUES ('krtw50spuok', 'uokkrtw50', 'krtw50sp'),
    ('krtw50spuoc', 'uockrtw50', 'krtw50sp'),
    ('krtw50spusj', 'usjkrtw50', 'krtw50sp'),
    ('krtw50ipuok', 'uokkrtw50', 'krtw50ip'),
    ('krtw50ipuoc', 'uockrtw50', 'krtw50ip'),
    ('krtw50ipusj', 'usjkrtw50', 'krtw50ip');
-- @block Insert round_teams for football
INSERT INTO round_teams
VALUES ('ftbmr1uor', 'uorftbm', 'ftbmr1'),
    ('ftbmr1uop', 'uopftbm', 'ftbmr1'),
    ('ftbmr2uor', 'uorftbm', 'ftbmr2'),
    ('ftbmr2uop', 'uopftbm', 'ftbmr2');
-- @block Update round_teams table
UPDATE round_teams
SET round_teams_id = 'bktmr1uor'
WHERE round_teams_id = 'bktmr11uor';
UPDATE round_teams
SET round_teams_id = 'bktmr1uop'
WHERE round_teams_id = 'bktmr1uopp';
-- @block delete round_teams table
-- DELETE FROM round_teams
-- WHERE round_teams_id = 'bktmr4uop';
-- @block Insert Part round Score for basketball
INSERT INTO part_round_score
VALUES -- round 1
    ('bktmr1uor1', 'uorbktm1', 'bktmr1', 20),
    ('bktmr1uor2', 'uorbktm2', 'bktmr1', 40),
    ('bktmr1uop1', 'uopbktm1', 'bktmr1', 10),
    ('bktmr1uop2', 'uopbktm2', 'bktmr1', 10),
    -- round 2
    ('bktmr2uor1', 'uorbktm1', 'bktmr2', 30),
    ('bktmr2uor2', 'uorbktm2', 'bktmr2', 30),
    ('bktmr2uom1', 'uombktm1', 'bktmr2', 10),
    ('bktmr2uom2', 'uombktm2', 'bktmr2', 20),
    -- round 3
    ('bktmr3uop1', 'uopbktm1', 'bktmr3', 40),
    ('bktmr3uop2', 'uopbktm2', 'bktmr3', 5),
    ('bktmr3uom1', 'uombktm1', 'bktmr3', 20),
    ('bktmr3uom2', 'uombktm2', 'bktmr3', 30);
-- @block Insert Part Round Scores for karate
INSERT INTO part_round_score
VALUES -- Sparring
    ('krtw50spuok1', 'uokkrtw501', 'krtw50sp', 10),
    ('krtw50spuok2', 'uokkrtw502', 'krtw50sp', 20),
    ('krtw50spuoc1', 'uockrtw501', 'krtw50sp', 30),
    ('krtw50spuoc2', 'uockrtw502', 'krtw50sp', 40),
    ('krtw50spusj1', 'usjkrtw501', 'krtw50sp', 50),
    ('krtw50spusj2', 'usjkrtw502', 'krtw50sp', 60),
    -- Individual Poomsae
    ('krtw50ipuok1', 'uokkrtw501', 'krtw50ip', 30),
    ('krtw50ipuok2', 'uokkrtw502', 'krtw50ip', 30),
    ('krtw50ipuoc1', 'uockrtw501', 'krtw50ip', 30),
    ('krtw50ipuoc2', 'uockrtw502', 'krtw50ip', 30),
    ('krtw50ipusj1', 'usjkrtw501', 'krtw50ip', 30),
    ('krtw50ipusj2', 'usjkrtw502', 'krtw50ip', 30);
-- @block Insert part_round_score for football
INSERT INTO part_round_score
VALUES ('ftbmr1uor1', 'uorftbm1', 'ftbmr1', 85),
    ('ftbmr1uop1', 'uopftbm1', 'ftbmr1', 75),
    ('ftbmr2uor2', 'uorftbm2', 'ftbmr2', 80),
    ('ftbmr2uop2', 'uopftbm2', 'ftbmr2', 68);
-- @block Update Part Round Scores
UPDATE part_round_score
SET participant_score = 15
WHERE prs_id = 'bktmr1uop1';
UPDATE part_round_score
SET participant_score = 20
WHERE prs_id = 'bktmr1uop2';
-- @block Insert Team Round Score
INSERT INTO team_round_score (trs_id, rounds_id, team_id, team_score)
SELECT round_teams_id,
    rounds_id,
    team_id,
    NULL
FROM round_teams;
-- The remaining columns will be inerted using queries
-- @block Insert Team Round Points
INSERT INTO team_round_points (trp_id, rounds_id, team_id, team_points)
SELECT round_teams_id,
    rounds_id,
    team_id,
    0
FROM round_teams;
-- The remaining columns will be inserted using queries
-- @block Insert Team Event Points
INSERT INTO team_event_points (tep_id, events_id, team_id, event_points)
SELECT t.team_id,
    t.events_id,
    t.team_id,
    0
FROM team AS t
    INNER JOIN events AS e ON t.events_id = e.events_id;
-- The remaining columns will be inserted using queries
-- @block Insert Uni Comp Points
INSERT INTO uni_comp_points (ucp_id, uni_id, comp_id, uni_points)
SELECT UUID(),
    t.uni_id,
    s.comp_id,
    0
FROM events AS e
    INNER JOIN team AS t ON t.events_id = e.events_id
    INNER JOIN sport AS s ON s.sport_id = e.sport_id;
-- The remaining columns will be inserted using queries
-- @block Automate Team Round Score
-- Define a subquery to get the list of teams and rounds from the round_teams table
WITH team_rounds AS (
    SELECT rt.rounds_id,
        rt.team_id
    FROM round_teams rt
),
-- Define a subquery to calculate the total score for each team in each round
team_scores AS (
    SELECT tr.rounds_id,
        tr.team_id,
        SUM(prs.participant_score) AS total_score
    FROM team_rounds tr
        INNER JOIN part_round_score prs ON tr.rounds_id = prs.rounds_id
        INNER JOIN participant p ON prs.participant_id = p.participant_id
    WHERE p.participant_id LIKE CONCAT(tr.team_id, '%')
    GROUP BY tr.rounds_id,
        tr.team_id
) -- Update the team_round_score table with the calculated total scores
UPDATE team_round_score trs
    INNER JOIN team_scores ts ON trs.rounds_id = ts.rounds_id
    AND trs.team_id = ts.team_id
SET trs.team_score = ts.total_score;
-- @block Automate Team Round Points
-- Update team_round_points table to add 10 points to the team with the highest score in each round
UPDATE team_round_points trp
    JOIN (
        -- Subquery to get the team_id with the maximum score for each round
        SELECT s.rounds_id,
            s.team_id,
            s.max_score
        FROM (
                SELECT tr.rounds_id,
                    tr.team_id,
                    SUM(prs.participant_score) AS total_score,
                    MAX(SUM(prs.participant_score)) OVER (PARTITION BY tr.rounds_id) AS max_score
                FROM round_teams tr
                    JOIN part_round_score prs ON tr.rounds_id = prs.rounds_id
                    JOIN participant p ON prs.participant_id = p.participant_id
                WHERE p.participant_id LIKE CONCAT(tr.team_id, '%')
                GROUP BY tr.rounds_id,
                    tr.team_id
            ) AS s
        WHERE s.total_score = s.max_score
    ) AS max_scores ON trp.rounds_id = max_scores.rounds_id
    AND trp.team_id = max_scores.team_id
SET trp.team_points = trp.team_points + 10;
-- @block Automate Team Event Points
-- Update team_event_points table to add the sum of points obtained by each team in every round
UPDATE team_event_points tep
    JOIN (
        -- Subquery to calculate the sum of points obtained by each team in every round
        SELECT trp.team_id,
            SUM(trp.team_points) AS total_points
        FROM team_round_points trp
        GROUP BY trp.team_id
    ) AS team_total_points ON tep.team_id = team_total_points.team_id
SET tep.event_points = tep.event_points + team_total_points.total_points;
-- @block Automate Uni Comp Points
-- Update uni_comp_points table to add the sum of points obtained by each university in every event
UPDATE uni_comp_points ucp
    JOIN (
        -- Subquery to calculate the sum of points obtained by each university in every event
        SELECT u.uni_id,
            SUM(tep.event_points) AS total_points
        FROM team_event_points tep
            JOIN team t ON tep.team_id = t.team_id
            JOIN uni u ON t.uni_id = u.uni_id
        GROUP BY u.uni_id
    ) AS uni_total_points ON ucp.uni_id = uni_total_points.uni_id
SET ucp.uni_points = ucp.uni_points + uni_total_points.total_points;