-- @block COMPLEX QUERIES
-------------------------------------------------------------------------------------------------
---------------------------------------- complex queries ----------------------------------------
-- @block 1. Set operation (union)
-- retrieve a combined view of individual and team round scores
SELECT *
FROM part_round_score
UNION ALL
SELECT *
FROM team_round_score;
-- @block 2. Set operation (intersection)
--  find uni that hosted and won in the same year
SELECT uni_name,
    comp_year
FROM uni
    JOIN comp ON uni.uni_id = comp.current_host
WHERE uni.uni_id IN (
        SELECT prev_host
        FROM comp
    )
INTERSECT
SELECT uni_name,
    comp_year
FROM uni
    JOIN comp ON uni.uni_id = comp.prev_winner
WHERE uni.uni_id IN (
        SELECT prev_winner
        FROM comp
    );
-- @block 3. Set operation (difference)
-- finds participants who are NOT registered for the "Badminton" event.
SELECT participant_id,
    first_name,
    last_name
FROM participant
EXCEPT
SELECT p.participant_id,
    p.first_name,
    p.last_name
FROM participant p
    JOIN team t ON p.team_id = t.team_id
    JOIN events e ON t.events_id = e.events_id
    JOIN sport s ON e.sport_id = s.sport_id
WHERE s.sport_name = 'Karate';
-- @block 4. Set operation (division)
-- finds universities whose teams are participating in more than 1 distinct events
SELECT uni_name
FROM uni
WHERE uni_id IN (
        SELECT uni_id
        FROM team
        GROUP BY uni_id
        HAVING COUNT(DISTINCT events_id) > 1
    );
-- @block 5. Inner join
-- retrieve the no.of participants from each university for each sport
SELECT u.uni_id,
    u.uni_name,
    s.sport_name,
    COUNT(p.participant_id) AS num_participants
FROM uni u
    JOIN team t ON u.uni_id = t.uni_id
    JOIN participant p ON t.team_id = p.team_id
    JOIN events e ON t.events_id = e.events_id
    JOIN sport s ON e.sport_id = s.sport_id
GROUP BY u.uni_id,
    u.uni_name,
    s.sport_name;
-- @block 6. Natural join
-- retrieve participant information and their corresponding sport
SELECT participant.participant_id,
    participant.first_name,
    participant.last_name,
    sport.sport_name
FROM participant
    NATURAL JOIN team
    NATURAL JOIN events
    NATURAL JOIN sport;
-- @block 7. Left outer join
-- retrieves the number of participants from each university for each sport
-- even if a university has no teams in a particular sport
SELECT uni.uni_name,
    sport.sport_name,
    COUNT(participant.participant_id) AS Total_Participants
FROM uni
    LEFT JOIN team ON uni.uni_id = team.uni_id
    LEFT JOIN events ON team.events_id = events.events_id
    LEFT JOIN participant ON team.team_id = participant.team_id
    LEFT JOIN sport ON events.sport_id = sport.sport_id
GROUP BY uni.uni_name,
    sport.sport_name;
-- @block 8. Right outer join
-- retrieve all official names
-- even if they are not registered for any events
SELECT official.official_name,
    events.events_name
FROM official
    RIGHT OUTER JOIN events ON official.events_id = events.events_id;
-- @block 9. Outer union with user view
-- including participants with phone numbers from the "ParticipantContacts" view
-- combining them with those without phone numbers into a single result
SELECT participant_id,
    first_name,
    last_name,
    sport_name AS Viewed_Sport
FROM ParticipantContacts
UNION ALL
SELECT participant_id,
    first_name,
    last_name,
    sport_name
FROM participant
    JOIN team ON participant.team_id = team.team_id
    JOIN events ON team.events_id = events.events_id
    JOIN sport ON events.sport_id = sport.sport_id
WHERE participant.phone_number IS NULL;
-- @block 10. Nested query 1
-- calculates the average number of participants in an event 
SELECT AVG(num_participants) AS avg_part_per_event
FROM (
        SELECT events_id,
            COUNT(*) AS num_participants
        FROM team
        GROUP BY events_id
    ) AS event_participants;
-- @block 11. Nested query 2
--  retrieves the universities with their total no.of teams
SELECT uni.uni_name,
    (
        SELECT COUNT(*)
        FROM team t
            JOIN uni u ON t.uni_id = u.uni_id
        WHERE u.uni_id = uni.uni_id
    ) AS total_participants
FROM uni;
-- @block 12. Nested query 3
-- returns the winner if the competition
SELECT uni_id
FROM (
        -- Subquery to calculate the total points for each university
        SELECT ucp.uni_id
        FROM uni_comp_points ucp
            JOIN (
                -- Subquery to calculate the sum of points obtained by each university in every event
                SELECT u.uni_id,
                    SUM(tep.event_points) AS total_points
                FROM team_event_points tep
                    JOIN team t ON tep.team_id = t.team_id
                    JOIN uni u ON t.uni_id = u.uni_id
                GROUP BY u.uni_id
            ) AS uni_total_points ON ucp.uni_id = uni_total_points.uni_id
        ORDER BY uni_total_points.total_points DESC
        LIMIT 1
    ) AS winner;