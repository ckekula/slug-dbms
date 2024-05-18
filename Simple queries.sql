-- @block simple queries
------------------------------------------------------------------------------------------------
---------------------------------------- simple queries ----------------------------------------
-- @block 1. select operation
-- retrieve participant information who are registered for the "Basketball" sport.
SELECT participant_id,
    first_name,
    last_name,
    sport_name
FROM participant
    JOIN team ON participant.team_id = team.team_id
    JOIN events ON team.events_id = events.events_id
    JOIN sport ON events.sport_id = sport.sport_id
WHERE sport_name = 'Basketball';
-- @block 2. project operation
-- project the event name and calculate the total no.of participants registered for each event.
SELECT events_name,
    COUNT(participant_id) AS total_participants
FROM participant
    JOIN team ON participant.team_id = team.team_id
    JOIN events ON team.events_id = events.events_id
GROUP BY events_name;
-- @block 3. cartesian product (cross join) operation
-- returns all possible combinations of competitions and sport names
SELECT comp.comp_name,
    sport.sport_name
FROM comp
    CROSS JOIN sport;
-- @block 4. create user view
-- create a user view named "ParticipantContacts" that shows participants with phone numbers 
-- and then retrieves all data from the view.
CREATE VIEW ParticipantContacts AS
SELECT participant_id,
    first_name,
    last_name,
    sport_name
FROM participant
    JOIN team ON participant.team_id = team.team_id
    JOIN events ON team.events_id = events.events_id
    JOIN sport ON events.sport_id = sport.sport_id
WHERE participant.phone_number IS NOT NULL;
SELECT *
FROM ParticipantContacts;
-- @block 5. rename operation
-- create a new column "Full_Name" that combines first and last names
SELECT participant_id,
    CONCAT(first_name, ' ', last_name) AS Full_Name,
    sport_name
FROM participant
    JOIN team ON participant.team_id = team.team_id
    JOIN events ON team.events_id = events.events_id
    JOIN sport ON events.sport_id = sport.sport_id
ORDER BY Full_Name;
-- @block 6. like keyword
-- calculate the total score for each team in each round
SELECT tr.rounds_id,
    tr.team_id,
    SUM(prs.participant_score) AS total_score
FROM round_teams tr
    INNER JOIN part_round_score prs ON tr.rounds_id = prs.rounds_id
    INNER JOIN participant p ON prs.participant_id = p.participant_id
WHERE p.participant_id LIKE CONCAT(tr.team_id, '%')
GROUP BY tr.rounds_id,
    tr.team_id;
-- @block 7. aggregation function
-- get the team_id with the maximum score for each round
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
WHERE s.total_score = s.max_score;