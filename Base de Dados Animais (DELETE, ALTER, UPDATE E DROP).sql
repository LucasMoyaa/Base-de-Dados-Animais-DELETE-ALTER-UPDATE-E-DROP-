CREATE TABLE especies (
    id_especie SERIAL PRIMARY KEY,
    nome_especie VARCHAR(50) NOT NULL
);

INSERT INTO especies (nome_especie) VALUES
('Cachorro'),
('Gato'),
('Passarinho');

CREATE TABLE animais (
    id_animal SERIAL PRIMARY KEY,
    nome_animal VARCHAR(50) NOT NULL,
    peso DECIMAL(5,2) NOT NULL,
    cor VARCHAR(20),
    data_nascimento DATE,
    id_especie INT REFERENCES especies(id_especie)
);

INSERT INTO animais (nome_animal, peso, cor, data_nascimento, id_especie) VALUES
('Pateta', 150, 'Amarelo', '2019-05-15', 1),
('Garfield', 8, 'Laranja', '2017-07-25', 2),
('Pluto', 100, 'Preto', '2015-02-10', 1),
('Tweety', 0.1, 'Amarelo', '2018-12-01', 3);

UPDATE animais SET nome_animal = 'Goofy' WHERE nome_animal = 'Pateta';

UPDATE animais SET peso = 10 WHERE nome_animal = 'Garfield';

UPDATE animais SET cor = 'Laranja' WHERE id_especie = 2;

ALTER TABLE animais ADD COLUMN altura DECIMAL(5,2);

ALTER TABLE animais ADD COLUMN observacao TEXT;

DELETE FROM animais WHERE peso > 200;

DELETE FROM animais WHERE nome_animal LIKE 'C%';

ALTER TABLE animais DROP COLUMN cor;

ALTER TABLE animais ALTER COLUMN nome_animal TYPE VARCHAR(80);

DELETE FROM animais WHERE id_especie IN (SELECT id_especie FROM especies WHERE nome_especie IN ('Cachorro', 'Gato'));

ALTER TABLE animais DROP COLUMN data_nascimento;

DELETE FROM animais;

DROP TABLE especies;
