USE SQL_CODER;

-- FUNCIÓN PROMEDIO DE GOLES POR PARTIDO.

DROP FUNCTION IF EXISTS FN_GOALS_AVG;

DELIMITER $$
CREATE FUNCTION FN_GOALS_AVG (
								P_GOALS INT,
								P_GAMES INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN

DECLARE V_GOALS INT;
DECLARE V_GAMES INT;
DECLARE AVERAGE FLOAT;
SET V_GOALS = P_GOALS;
SET V_GAMES = P_GAMES;
SET AVERAGE = ( P_GOALS / P_GAMES );
RETURN AVERAGE;
END$$ 
DELIMITER ;

-- PROMEDIO DE GOLES POR PARTIDO DEL JUGADOR CON ID 7.

SELECT FN_GOALS_AVG ( (SELECT goals FROM statistics WHERE player_id = 7), ((SELECT games FROM statistics WHERE player_id = 7))
) AS GOALS_AVG ;



-- FUNCIÓN PROMEDIO DE EXPULSIONES.

DROP FUNCTION IF EXISTS FN_RED_CARDS_AVG


DELIMITER $$
CREATE FUNCTION FN_RED_CARDS_AVG (
								P_RED_CARDS INT,
								P_GAMES INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN

DECLARE V_RED_CARDS INT;
DECLARE V_GAMES INT;
DECLARE AVERAGE FLOAT;
SET V_RED_CARDS = P_RED_CARDS;
SET V_GAMES = P_GAMES;
SET AVERAGE = ( P_RED_CARDS / P_GAMES );
RETURN AVERAGE;
END$$ 
DELIMITER ;


-- PROMEDIO DE EXPULSIONESDEL JUGADOR CON ID 10.

SELECT FN_RED_CARDS_AVG ( (SELECT red_cards FROM statistics WHERE player_id = 10),(SELECT games FROM statistics WHERE player_id = 10)
) AS RED_CARDS_AVG ;


-- FUNCIÓN PARA SABER POSICIÓN POR ID DEL JUGADOR.

DROP FUNCTION IF EXISTS FN_POSITIONS

DELIMITER $$
CREATE FUNCTION FN_POSITIONS 
						( P_POSITION VARCHAR(40))
RETURNS VARCHAR(40)
DETERMINISTIC
BEGIN

DECLARE player_position VARCHAR(40);

SET player_position = P_POSITION;

CASE

WHEN P_POSITION = 'Forward' THEN
		SET player_position = 'ES DELANTERO'; 

WHEN P_POSITION = 'Midfielder' THEN
		SET player_position = 'ES MEDIOCENTRO'; 

WHEN P_POSITION = 'Defender' THEN
		SET player_position = 'ES DEFENSOR';
        
WHEN P_POSITION = 'Goalkeeper' THEN
		SET player_position = 'ES ARQUERO';

END CASE;


RETURN player_position;
END$$ 
DELIMITER ;

-- POSICIÓN DEL JUGADOR CON ID '56' --
SELECT FN_POSITIONS ( (SELECT player_position FROM  players WHERE player_id = 56)
) AS POSITION_PLAYER;


