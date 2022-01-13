-- Comando 1 - Selezionare tutti gli stuendi nati nel 1990

SELECT * 
FROM `students` 
WHERE `date_of_birth` LIKE '1990%';

-- Comando 2 - Selezionare tutti i corsi che valgono più di 10 Crediti 

SELECT * 
FROM `courses` 
WHERE `cfu` > 10;

-- Comando 3 - Selezionare tutti gli stuendi che hanno più di 30 anni

SELECT *
FROM `students`
WHERE `date_of_birth` < DATE_SUB(CURRENT_DATE(), INTERVAL 30 YEAR);

-- Comando 4 - Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea

SELECT * 
FROM `courses` 
WHERE `period` = 'I semestre' 
AND `year`= 1;

--Comando 5 - Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020

SELECT *
FROM `exams`
WHERE `date` = '2020-06-20'
AND `hour` > '14:00:00';

-- Comando 6 - Selezionare tutti i corsi di laurea magistrale

SELECT *
FROM `degrees`
WHERE `level` = 'magistrale'

-- Comando 7 - Da quanti dipartimenti è composta l'università?

SELECT COUNT('id') AS 'departments_number'
FROM `departments`;

-- Comando 8 - Quanti sono gli insegnanti che non hanno un numero di telefono? 

SELECT *
FROM `teachers`
WHERE `phone` IS NULL
