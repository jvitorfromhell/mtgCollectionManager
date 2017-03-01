INSERT INTO Usuario VALUES
	('jvitorfromhell', 'Jose Vitor Schneid', 'jvitor.schneid@gmail.com'),
    ('anaLegs', 'Ana Pernas', 'anaLegs@inf.ufpel.edu.br');
    
INSERT INTO Carta VALUES
	('Floresta', 'Terreno Basico', 'C', 0);

INSERT INTO Armazenamento (dono, tipo, limite) VALUES
	('jvitorfromhell', 'Pasta', 180),
    ('anaLegs', 'Pasta', 180);
    
INSERT INTO CopiaCarta (nomeCarta, Usuario, Armazenamento) VALUES
	('Floresta', 'jvitorfromhell', 1),
    ('Floresta', 'anaLegs', 2);