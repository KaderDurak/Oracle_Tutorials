/* BASEBALL TEAM*/

create table teams(
    id number(3) constraint team_idk_pk primary key,
    name varchar2(50) constraint team_name_nn not null,
    city varchar2(50) constraint team_city_nn not null,
    state varchar2(2) constraint team_state_nn not null
    );

create table players(
    id number(3) constraint players_id_pk primary key,
    jersey number(2) constraint players_jersey_nn not null,
    fname varchar2(50) constraint player_fname_nn not null,
    lname varchar2(50) constraint players_lname_nn not null,
    height varchar2(5) constraint players_height_nn not null,
    weight number(3) constraint players_weight_nn not null,
    dob date constraint players_dob_nn not null,
    position varchar2(20) constraint players_position_nn not null,
    constraint players_position_ck check(position in ('Pitcher','Catcher', 'Infielder', 'Outfielder', 'Designated Hitter')),
    team_id number(3) constraint players_team_id_fk references teams(id),
    constraint players_jersey_team_id_uk unique(jersey, team_id)
	);

INSERT INTO teams VALUES(1, 'Royals', 'Kansas City', 'MO');
INSERT INTO teams VALUES(2, 'Giants', 'San Francisco', 'CA');
INSERT INTO players VALUES (1, 62, 'Aaron', 'Brooks', '6-4', 220, '27/Apr/1990', 'Pitcher', 1);
INSERT INTO players VALUES (2, 67, 'Francisley', 'Bueno', '5-11', 205, '5/Mar/1981', 'Pitcher', 1);
INSERT INTO players VALUES (3, 25, 'Casey', 'Coleman', '6-0', 185, '3/Jul/1987', 'Pitcher', 1);
INSERT INTO players VALUES (4, 31, 'Louis', 'Coleman', '6-4', 205, '4/Apr/1986', 'Pitcher', 1);
INSERT INTO players VALUES (5, 55, 'Tim', 'Collins', '5-7', 170, '21/Aug/1989', 'Pitcher', 1);
INSERT INTO players VALUES (6, 43, 'Aaron', 'Crow', '6-3', 195, '10/Nov/1986', 'Pitcher', 1);
INSERT INTO players VALUES (7, 17, 'Wade', 'Davis', '6-5', 220, '7/Sep/1985', 'Pitcher', 1);
INSERT INTO players VALUES (8, 37, 'Scott', 'Downs', '6-2', 220, '17/Mar/1976', 'Pitcher', 1);
INSERT INTO players VALUES (9, 41, 'Danny', 'Duffy', '6-3', 205, '21/Dec/1988', 'Pitcher', 1);
INSERT INTO players VALUES (10, 27, 'Brandon', 'Finnegan', '5-11', 185, '14/Apr/1993', 'Pitcher', 1);
INSERT INTO players VALUES (11, 54, 'Jason', 'Frasor', '5-9', 180, '9/Aug/1977', 'Pitcher', 1);
INSERT INTO players VALUES (12, 11, 'Jeremy', 'Guthrie', '6-1', 205, '8/Apr/1979', 'Pitcher', 1);
INSERT INTO players VALUES (13, 40, 'Kelvin', 'Herrara', '5-10', 200, '31/Dec/1989', 'Pitcher', 1);
INSERT INTO players VALUES (14, 44, 'Luke', 'Hochevar', '6-5', 225, '15/Sep/1983', 'Pitcher', 1);
INSERT INTO players VALUES (15, 56, 'Greg', 'Holland', '5-10', 205, '20/Nov/1985', 'Pitcher', 1);
INSERT INTO players VALUES (16, 38, 'John', 'Lamb', '6-4', 205, '10/Jul/1990', 'Pitcher', 1);
INSERT INTO players VALUES (17, 48, 'Michael', 'Mariot', '6-0', 190, '20/Oct/1988', 'Pitcher', 1);
INSERT INTO players VALUES (18, 33, 'James', 'Shields', '6-3', 215, '20/Dec/1981', 'Pitcher', 1);
INSERT INTO players VALUES (19, 51, 'Jason', 'Vargas', '6-0', 215, '2/Feb/1983', 'Pitcher', 1);
INSERT INTO players VALUES (20, 30, 'Yordano', 'Ventura', '6-0', 180, '3/Jun/1991', 'Pitcher', 1);
INSERT INTO players VALUES (21, 19, 'Erik', 'Kratz', '6-4', 240, '15/Jun/1980', 'Catcher', 1);
INSERT INTO players VALUES (22, 26, 'Francisco', 'Pena', '6-2', 230, '12/Oct/1989', 'Catcher', 1);
INSERT INTO players VALUES (23, 13, 'Salvador', 'Perez', '6-3', 240, '10/May/1990', 'Catcher', 1);
INSERT INTO players VALUES (24, 24, 'Christian', 'Colon', '5-10', 190, '14/May/1989', 'Infielder', 1);
INSERT INTO players VALUES (25, 61, 'Cheslor', 'Cuthbert', '6-1', 190, '16/Nov/1992', 'Infielder', 1);
INSERT INTO players VALUES (26, 2, 'Alcides', 'Escobar', '6-1', 185, '16/Dec/1986', 'Infielder', 1);
INSERT INTO players VALUES (27, 9, 'Johnny', 'Giavotella', '5-8', 185, '10/Jul/1987', 'Infielder', 1);
INSERT INTO players VALUES (28, 35, 'Eric', 'Hosmer', '6-4', 225, '24/Oct/1989', 'Infielder', 1);
INSERT INTO players VALUES (29, 14, 'Omar', 'Infante', '5-11', 195, '26/Dec/1981', 'Infielder', 1);


