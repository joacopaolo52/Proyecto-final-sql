SELECT @@AUTOCOMMIT ; -- VER VALOR (POR DEFECTO = 1)
SELECT @@foreign_key_checks;
SET @@AUTOCOMMIT = 1 ; -- Para todas las sentencias DML hay un commit por defecto.


SET @@AUTOCOMMIT = 0 ; -- Por cada sentencia DML hay que hacer el COMMIT.

SET @@foreign_key_checks = 0;

START TRANSACTION;

DELETE FROM sql_coderhouse.continents WHERE continent_id IN (1, 3, 5);
SELECT * FROM sql_coderhouse.continents;
-- ROLLBACK;
-- COMMIT;



-- DATOS IMPORTANTES (INSERTAR NUEVAMENTE)

/*

		INSERT INTO CONTINENTS (continent_id , continent_name)
		VALUES 	(1 ,'America'),
				(3 , 'Asia'),
				(5 , 'Oceania') ;
        
         */
         
         
-- INSERTA 8 REGISTROS, AGREGAR UN SAVEPOINT A POSTERIOR DEL REGISTRO #4 Y OTRO A POSTERIOR DEL REGISTRO #8. ELIMINAR EL SAVEPOINT DE LOS PRIMEROS 4 REGISTROS
         
         
INSERT INTO TEAMS (team_name, country_tournament_id, continental_tournament_id) VALUES ('Tigres Rojos', 1, 101);
INSERT INTO TEAMS  VALUES ('Leones Azules', 32, 5);
INSERT INTO TEAMS  VALUES ('Águilas Verdes', 13, 4);
INSERT INTO TEAMS  VALUES ('Panteras Negras', 11, 2);
savepoint SP1;
INSERT INTO TEAMS  VALUES ('Delfines Amarillos', 22, 4);
INSERT INTO TEAMS  VALUES ('Tiburones Blancos', 31, 4);
INSERT INTO TEAMS  VALUES ('Cobras Naranjas', 11, 2);
INSERT INTO TEAMS  VALUES ('Jaguares Rosados', 24, 1);
savepoint SP2;
RELEASE savepoint SP1; -- ELIMINAR SAVEPOINT

-- COMMIT;


        