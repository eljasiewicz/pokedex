CREATE DATABASE pokedex;
USE pokedex;
DROP TABLE national_unova;
CREATE table national_unova
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Per DEC(5,1),
    Nat INT,
    Pokemon CHAR(30),
    HP INT,
    Atk INT,
    Def INT,
    SpA INT,
    SpD INT,
    Spe INT,
    Total INT,
    Type_I CHAR(11),
    Type_II CHAR(11),
    Tier CHAR(5),
    Ability_I CHAR(30),
    Ability_II CHAR(30),
    Hidden_Ability CHAR(30),
    Mass DEC(5,1),
    LK_GK INT,
    EV_Worth CHAR(20),
    EXPV INT,
    Color CHAR(10),
    Hatch INT,
    Gender CHAR(20),
    Egg_Group_I CHAR(20),
    Egg_Group_II CHAR(20),
    Catch INT,
    EXP INT,
    Evolve CHAR(35),
    Joh INT DEFAULT(NULL),
    Hoe INT DEFAULT(NULL),
    Sin INT DEFAULT(NULL),
    Un INT DEFAULT(NULL)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\pokemon.csv'
INTO TABLE national_unova
CHARACTER SET utf8
FIELDS TERMINATED BY ','
OPTIONALLY enclosed by '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(Per, Nat, Pokemon, HP, Atk, Def, SpA, SpD, Spe, Total, Type_I, @Type_II, Tier, Ability_I, @Ability_II, @Hidden_Ability, Mass, LK_GK, EV_Worth, EXPV, Color, @Hatch, Gender, Egg_Group_I, @Egg_Group_II, Catch, EXP, Evolve, @Per, @Nat, @Joh, @Hoe, @Sin, @Un, @Pokemon)
SET 
Joh = NULLIF(@joh, ''),
Hoe = NULLIF(@hoe, ''),
Sin = NULLIF(@sin, ''),
UN = NULLIF(@un, ''),
Hatch = CASE
	WHEN @hatch = '' THEN null
    WHEN @hatch = 'NONE' THEN null
    ELSE @hatch
    END,
Egg_Group_II = NULLIF(@egg_group_ii, ''),
Type_II = NULLIF(@type_ii, '')
;

CREATE TABLE attackdex_vii
( 
	ID INT auto_increment primary key,
	attack_name VARCHAR(27),
    attack_type VARCHAR(10),
    category VARCHAR (10),
    power INT,
    accuracy INT,
    pp INT,
    effect VARCHAR(155),
    prob INT
    );
    
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Attackdex.csv'
INTO TABLE attackdex_vii
CHARACTER SET UTF8
FIELDS TERMINATED BY ','
OPTIONALLY enclosed by '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(attack_name, attack_type, category, @power, @accuracy, @pp, @tm, effect, @prob) -- tm is empty in file
SET
power = NULLIF(@power, '—'),
pp = NULLIF(@pp, '—'),
prob = NULLIF(@prob, '—'),
accuracy = CASE
	WHEN @accuracy = '—' THEN NULL
	WHEN @accuracy = '∞' THEN NULL
	ELSE @accuracy
	END
;
