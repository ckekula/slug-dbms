-- @block 
drop database dbms;
-- @block
CREATE DATABASE dbms;
USE dbms;
-- @block Uni Table
CREATE TABLE uni (
    uni_id VARCHAR(5) PRIMARY KEY,
    uni_name VARCHAR(50) NOT NULL
);
-- @block Comp Table
CREATE TABLE comp (
    comp_id VARCHAR(10) PRIMARY KEY,
    comp_name VARCHAR(50) NOT NULL,
    comp_year YEAR NOT NULL,
    begin_date DATE NOT NULL,
    end_date DATE NOT NULL,
    current_host VARCHAR(10) NOT NULL,
    prev_host VARCHAR(10),
    prev_winner VARCHAR(10),
    FOREIGN KEY (current_host) REFERENCES uni(uni_id),
    FOREIGN KEY (prev_host) REFERENCES uni(uni_id),
    FOREIGN KEY (prev_winner) REFERENCES uni(uni_id)
);
-- @block Sport Table
CREATE TABLE sport (
    sport_id VARCHAR(5) PRIMARY KEY,
    sport_name VARCHAR(20) NOT NULL,
    comp_id VARCHAR(10) NOT NULL,
    has_weights BOOLEAN NOT NULL,
    has_belts BOOLEAN NOT NULL,
    FOREIGN KEY (comp_id) REFERENCES comp(comp_id)
);
-- @block Events Table
CREATE TABLE events (
    events_id VARCHAR(10) PRIMARY KEY,
    sport_id VARCHAR(3) NOT NULL,
    events_name VARCHAR(50) NOT NULL,
    gender VARCHAR(1) NOT NULL,
    FOREIGN KEY (sport_id) REFERENCES sport(sport_id)
);
-- @block Weight Class Table
CREATE TABLE weight_class (
    weight_class_id VARCHAR(10) PRIMARY KEY,
    sport_id VARCHAR(3) NOT NULL,
    max_weight INT NOT NULL,
    FOREIGN KEY (sport_id) REFERENCES sport(sport_id)
);
-- @block Belt Table
CREATE TABLE belt (
    belt_id VARCHAR(10) PRIMARY KEY,
    sport_id VARCHAR(3) NOT NULL,
    color VARCHAR(10) NOT NULL,
    FOREIGN KEY (sport_id) REFERENCES sport(sport_id)
);
-- @block Official Table
CREATE TABLE official (
    official_id VARCHAR(10) PRIMARY KEY,
    official_name VARCHAR(50) NOT NULL,
    events_id VARCHAR(10) NOT NULL,
    supervisor_id VARCHAR(10),
    FOREIGN KEY (events_id) REFERENCES events(events_id),
    FOREIGN KEY (supervisor_id) REFERENCES official(official_id)
);
-- @block Team Table
CREATE TABLE team (
    team_id VARCHAR(15) PRIMARY KEY,
    uni_id varchar(5) NOT NULL,
    events_id VARCHAR(15) NOT NULL,
    FOREIGN KEY (uni_id) REFERENCES uni(uni_id),
    FOREIGN KEY (events_id) REFERENCES events(events_id)
);
-- @block Participant Table
CREATE TABLE participant (
    participant_id VARCHAR(15) PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    gender VARCHAR(1) NOT NULL,
    team_id VARCHAR(15) NOT NULL,
    phone_number VARCHAR(15),
    FOREIGN KEY (team_id) REFERENCES team(team_id)
);
-- @block Weight Participant Table (Weak Entity)
CREATE TABLE weight_participant (
    participant_id VARCHAR(10) PRIMARY KEY,
    weight_class_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (participant_id) REFERENCES participant(participant_id),
    FOREIGN KEY (weight_class_id) REFERENCES weight_class(weight_class_id)
);
-- @block Belt Participant Table (Weak Entity)
CREATE TABLE belt_participant (
    participant_id VARCHAR(10) PRIMARY KEY,
    belt_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (participant_id) REFERENCES participant(participant_id),
    FOREIGN KEY (belt_id) REFERENCES belt(belt_id)
);
-- @block Rounds Table
CREATE TABLE rounds (
    rounds_id VARCHAR(15) PRIMARY KEY,
    events_id VARCHAR(10) NOT NULL,
    rounds_name VARCHAR(50),
    FOREIGN KEY (events_id) REFERENCES events(events_id)
);
-- @block Part Round Score Table
CREATE TABLE part_round_score (
    prs_id VARCHAR(20) PRIMARY KEY,
    participant_id VARCHAR(10) NOT NULL,
    rounds_id VARCHAR(15) NOT NULL,
    participant_score INT,
    FOREIGN KEY (participant_id) REFERENCES participant(participant_id),
    FOREIGN KEY (rounds_id) REFERENCES rounds(rounds_id)
);
-- @block Team Round Score Table
CREATE TABLE team_round_score (
    trs_id VARCHAR(20) PRIMARY KEY,
    team_id VARCHAR(15) NOT NULL,
    rounds_id VARCHAR(15) NOT NULL,
    team_score INT,
    FOREIGN KEY (team_id) REFERENCES team(team_id),
    FOREIGN KEY (rounds_id) REFERENCES rounds(rounds_id)
);
-- @block Team Round Points Table
CREATE TABLE team_round_points (
    trp_id VARCHAR(20) PRIMARY KEY,
    team_id VARCHAR(15) NOT NULL,
    rounds_id VARCHAR(15) NOT NULL,
    team_points INT,
    FOREIGN KEY (team_id) REFERENCES team(team_id),
    FOREIGN KEY (rounds_id) REFERENCES rounds(rounds_id)
);
-- @block Team Event Points Table
CREATE TABLE team_event_points (
    tep_id VARCHAR(20) PRIMARY KEY,
    team_id VARCHAR(15) NOT NULL,
    events_id varchar(10) NOT NULL,
    event_points INT,
    FOREIGN KEY (team_id) REFERENCES team(team_id),
    FOREIGN KEY (events_id) REFERENCES events(events_id)
);
-- @block Uni Comp Points Table
CREATE TABLE uni_comp_points (
    ucp_id VARCHAR(255) PRIMARY KEY,
    uni_id VARCHAR(5) NOT NULL,
    comp_id VARCHAR(10) NOT NULL,
    uni_points INT,
    FOREIGN KEY (uni_id) REFERENCES uni(uni_id),
    FOREIGN KEY (comp_id) REFERENCES comp(comp_id)
);
-- @block round team Table
CREATE TABLE round_teams(
    round_teams_id VARCHAR(20) PRIMARY KEY,
    team_id VARCHAR(20) NOT NULL,
    rounds_id VARCHAR(20) NOT NULL,
    FOREIGN KEY (team_id) REFERENCES team(team_id),
    FOREIGN KEY (rounds_id) REFERENCES rounds(rounds_id)
);