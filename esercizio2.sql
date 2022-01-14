--Comandi JOIN



-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT *
FROM `students`
INNER JOIN `degrees` ON `students`.`degree_id`= `degrees`.`id`
WHERE `degrees`.`name`= 'Corso di Laurea in Economia'

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT *
FROM `degrees`
INNER JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name`= 'Dipartimento di Neuroscienze'

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT *
FROM `courses`
INNER JOIN `course_teacher` on `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `teachers` on `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `teachers`.`id`= 44

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`name`,`students`.`surname`, `departments`.`name` AS 'department_name',`degrees`.`name`AS 'degree_name'
FROM `students` 
INNER JOIN `degrees` ON `degrees`.`id` = `students`.`degree_id`
INNER JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`surname`,`students`.`name`;



-- Comandi GROUPBY



-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(`students`.`id`), YEAR(`students`.`enrolment_date`)
FROM `students`
GROUP BY YEAR(`students`.`enrolment_date`)

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(`id`), `teachers`.`office_address`
FROM `teachers`
GROUP BY `teachers`.`office_address`

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`)
FROM `exam_student`
GROUP BY (`exam_id`)

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(`degrees`.`id`), `department_id`
FROM `degrees`
GROUP BY(`department_id`)