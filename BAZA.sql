-- MySQL Script generated by MySQL Workbench
-- Sun Dec 16 23:24:56 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`SUBJECTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SUBJECTS` (
  `subject_id` INT NOT NULL AUTO_INCREMENT,
  `subject_name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(500) NULL,
  PRIMARY KEY (`subject_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PERSONS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PERSONS` (
  `person_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(55) NOT NULL,
  `pesel` VARCHAR(11) NOT NULL,
  `ADDRESSES_address_id` INT NOT NULL,
  PRIMARY KEY (`person_id`, `ADDRESSES_address_id`),
  INDEX `fk_PERSONS_ADDRESSES1_idx` (`ADDRESSES_address_id` ASC),
  INDEX `inx_name` (`first_name` ASC, `last_name` ASC),
  CONSTRAINT `fk_PERSONS_ADDRESSES1`
    FOREIGN KEY (`ADDRESSES_address_id`)
    REFERENCES `mydb`.`ADDRESSES` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ADDRESSES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ADDRESSES` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(75) NOT NULL,
  `building_number` VARCHAR(5) NOT NULL,
  `apartament_number` VARCHAR(5) NOT NULL,
  `zip_code` VARCHAR(6) NOT NULL,
  `city` VARCHAR(31) NOT NULL,
  PRIMARY KEY (`address_id`),
  INDEX `inx_street` (`street` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TEACHERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TEACHERS` (
  `teacher_id` INT NOT NULL AUTO_INCREMENT,
  `PERSONS_person_id` INT NOT NULL,
  PRIMARY KEY (`teacher_id`, `PERSONS_person_id`),
  INDEX `fk_TEACHERS_PERSONS1_idx` (`PERSONS_person_id` ASC),
  CONSTRAINT `fk_TEACHERS_PERSONS1`
    FOREIGN KEY (`PERSONS_person_id`)
    REFERENCES `mydb`.`PERSONS` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CLASSES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CLASSES` (
  `class_id` INT NOT NULL AUTO_INCREMENT,
  `class_title` VARCHAR(50) NOT NULL,
  `start_year` INT NOT NULL,
  `end_year` INT NOT NULL,
  `TEACHERS_teacher_id` INT NOT NULL,
  PRIMARY KEY (`classs_id`, `TEACHERS_teacher_id`),
  INDEX `fk_CLASSES_TEACHERS1_idx` (`TEACHERS_teacher_id` ASC),
  CONSTRAINT `fk_CLASSES_TEACHERS1`
    FOREIGN KEY (`TEACHERS_teacher_id`)
    REFERENCES `mydb`.`TEACHERS` (`teacher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LESSONS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LESSONS` (
  `lesson_id` INT NOT NULL AUTO_INCREMENT,
  `SUBJECTS_subject_id` INT NOT NULL,
  `lesson_datetime` DATETIME NOT NULL,
  `topic` VARCHAR(100) NULL,
  `room` VARCHAR(4) NOT NULL,
  `CLASSES_class_id` INT NOT NULL,
  `TEACHERS_teacher_id` INT NOT NULL,
  PRIMARY KEY (`lesson_id`, `SUBJECTS_subject_id`, `CLASSES_class_id`, `TEACHERS_teacher_id`),
  INDEX `fk_LESSONS_SUBJECTS_idx` (`SUBJECTS_subject_id` ASC),
  INDEX `fk_LESSONS_CLASSES1_idx` (`CLASSES_class_id` ASC),
  INDEX `fk_LESSONS_TEACHERS1_idx` (`TEACHERS_teacher_id` ASC),
  INDEX `idx_lesson_time` (`lesson_datetime` ASC),
  CONSTRAINT `fk_LESSONS_SUBJECTS`
    FOREIGN KEY (`SUBJECTS_subject_id`)
    REFERENCES `mydb`.`SUBJECTS` (`subject_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LESSONS_CLASSES1`
    FOREIGN KEY (`CLASSES_class_id`)
    REFERENCES `mydb`.`CLASSES` (`classs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LESSONS_TEACHERS1`
    FOREIGN KEY (`TEACHERS_teacher_id`)
    REFERENCES `mydb`.`TEACHERS` (`teacher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PARENTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PARENTS` (
  `parent_id` INT NOT NULL AUTO_INCREMENT,
  `PERSONS_person_id` INT NOT NULL,
  PRIMARY KEY (`parent_id`, `PERSONS_person_id`),
  INDEX `fk_PARENTS_PERSONS1_idx` (`PERSONS_person_id` ASC),
  CONSTRAINT `fk_PARENTS_PERSONS1`
    FOREIGN KEY (`PERSONS_person_id`)
    REFERENCES `mydb`.`PERSONS` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`STUDENTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`STUDENTS` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `PERSONS_person_id` INT NOT NULL,
  `PARENTS_parent_id` INT NOT NULL,
  `CLASSES_class_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `PERSONS_person_id`, `PARENTS_parent_id`, `CLASSES_class_id`),
  INDEX `fk_STUDENTS_PERSONS1_idx` (`PERSONS_person_id` ASC),
  INDEX `fk_STUDENTS_PARENTS1_idx` (`PARENTS_parent_id` ASC),
  INDEX `fk_STUDENTS_CLASSES1_idx` (`CLASSES_class_id` ASC),
  CONSTRAINT `fk_STUDENTS_PERSONS1`
    FOREIGN KEY (`PERSONS_person_id`)
    REFERENCES `mydb`.`PERSONS` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STUDENTS_PARENTS1`
    FOREIGN KEY (`PARENTS_parent_id`)
    REFERENCES `mydb`.`PARENTS` (`parent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STUDENTS_CLASSES1`
    FOREIGN KEY (`CLASSES_class_id`)
    REFERENCES `mydb`.`CLASSES` (`classs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GRADEDEF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GRADEDEF` (
  `gradedef_id` INT NOT NULL AUTO_INCREMENT,
  `grade` DECIMAL(3,2) NOT NULL,
  `grade_name` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`gradedef_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GRADES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GRADES` (
  `grade_id` INT NOT NULL AUTO_INCREMENT,
  `grade_scale` INT NOT NULL,
  `grade_type` VARCHAR(10) NOT NULL,
  `GRADEDEF_gradedef_id` INT NOT NULL,
  `STUDENTS_student_id` INT NOT NULL,
  `TEACHERS_teacher_id` INT NOT NULL,
  `SUBJECTS_subject_id` INT NOT NULL,
  `grade_datetime` DATETIME NOT NULL,
  PRIMARY KEY (`grade_id`, `GRADEDEF_gradedef_id`, `STUDENTS_student_id`, `TEACHERS_teacher_id`, `SUBJECTS_subject_id`),
  INDEX `fk_GRADES_GRADEDEF1_idx` (`GRADEDEF_gradedef_id` ASC),
  INDEX `fk_GRADES_STUDENTS1_idx` (`STUDENTS_student_id` ASC),
  INDEX `fk_GRADES_TEACHERS1_idx` (`TEACHERS_teacher_id` ASC),
  INDEX `fk_GRADES_SUBJECTS1_idx` (`SUBJECTS_subject_id` ASC),
  INDEX `idx_grades_time` (`grade_datetime` ASC),
  CONSTRAINT `fk_GRADES_GRADEDEF1`
    FOREIGN KEY (`GRADEDEF_gradedef_id`)
    REFERENCES `mydb`.`GRADEDEF` (`gradedef_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GRADES_STUDENTS1`
    FOREIGN KEY (`STUDENTS_student_id`)
    REFERENCES `mydb`.`STUDENTS` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GRADES_TEACHERS1`
    FOREIGN KEY (`TEACHERS_teacher_id`)
    REFERENCES `mydb`.`TEACHERS` (`teacher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
 CONSTRAINT `fk_GRADES_SUBJECTS1`
    FOREIGN KEY (`SUBJECTS_subject_id`)
	REFERENCES `mydb`.`SUBJECTS` (`subject_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ABSENCES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ABSENCES` (
  `absence_id` INT NOT NULL AUTO_INCREMENT,
  `excused` CHAR(1) NOT NULL,
  `STUDENTS_student_id` INT NOT NULL,
  `LESSONS_lesson_id` INT NOT NULL,
  PRIMARY KEY (`absence_id`, `STUDENTS_student_id`, `LESSONS_lesson_id`),
  INDEX `fk_ABSENCES_STUDENTS1_idx` (`STUDENTS_student_id` ASC),
  INDEX `fk_ABSENCES_LESSONS1_idx` (`LESSONS_lesson_id` ASC),
  INDEX `idx_excused` (`excused` ASC),
  CONSTRAINT `fk_ABSENCES_STUDENTS1`
    FOREIGN KEY (`STUDENTS_student_id`)
    REFERENCES `mydb`.`STUDENTS` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ABSENCES_LESSONS1`
    FOREIGN KEY (`LESSONS_lesson_id`)
    REFERENCES `mydb`.`LESSONS` (`lesson_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BEHAVIORS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BEHAVIORS` (
  `behavior_id` INT NOT NULL AUTO_INCREMENT,
  `behavior` VARCHAR(200) NOT NULL,
  `behavior_type` VARCHAR(10) NOT NULL,
  `STUDENTS_student_id` INT NOT NULL,
  PRIMARY KEY (`behavior_id`, `STUDENTS_student_id`),
  INDEX `fk_BEHAVIORS_STUDENTS1_idx` (`STUDENTS_student_id` ASC),
  CONSTRAINT `fk_BEHAVIORS_STUDENTS1`
    FOREIGN KEY (`STUDENTS_student_id`)
    REFERENCES `mydb`.`STUDENTS` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS GRADE_LOGS (
	
log_date TIMESTAMP,
 who varchar(50),
change_type varchar(20)
)

ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS ABSENCES_LOGS (
	
log_date TIMESTAMP,
 who varchar(50),
change_type varchar(20)
)

ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS BEHAVIORS_LOGS (
	
log_date TIMESTAMP,
 who varchar(50),
change_type varchar(20)
)

ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- TRIGGERS
CREATE TRIGGER T_GRADE_LOGS_I
AFTER INSERT
ON GRADES 
FOR EACH ROW
INSERT INTO GRADE_LOGS(log_date,who,change_type) VALUES(now(),'TEACHER','INSERT');

CREATE TRIGGER T_GRADE_LOGS_U
AFTER UPDATE
ON GRADES
FOR EACH ROW
INSERT INTO GRADE_LOGS(log_date,who,change_type) VALUES(now(),'TEACHER','UPDATE');   

CREATE TRIGGER T_GRADE_LOGS_D
AFTER DELETE  
ON GRADES 
FOR EACH ROW
INSERT INTO GRADE_LOGS(log_date,who,change_type) VALUES(now(),'EDUCATOR','DELETE');

CREATE TRIGGER T_ABSENCES_I
AFTER INSERT
ON ABSENCES
FOR EACH ROW
INSERT INTO ABSENCES_LOGS(log_date,who,change_type) VALUES(now(),'TEACHER','INSERT');

CREATE TRIGGER T_ABSENCES_U
AFTER DELETE  
ON ABSENCES
FOR EACH ROW
INSERT INTO ABSENCES_LOGS(log_date,who,change_type) VALUES(now(),'EDUCATOR','DELETE'); 

CREATE TRIGGER T_ABSENCES_D
AFTER UPDATE
ON ABSENCES
FOR EACH ROW  
INSERT INTO ABSENCES_LOGS(log_date,who,change_type) VALUES(now(),'EDUCATOR','UPDATE');

CREATE TRIGGER T_BEHAVIORS_I
AFTER INSERT
ON BEHAVIORS
FOR EACH ROW
INSERT INTO BEHAVIORS_LOGS(log_date,who,change_type) VALUES(now(),'TEACHER','INSERT');

CREATE TRIGGER T_BEHAVIORS_U
AFTER DELETE  
ON BEHAVIORS
FOR EACH ROW
INSERT INTO BEHAVIORS_LOGS(log_date,who,change_type) VALUES(now(),'TEACHER','DELETE'); 

CREATE TRIGGER T_BEHAVIORS_D
AFTER UPDATE
ON BEHAVIORS
FOR EACH ROW  
INSERT INTO behaviors_logs(log_date,who,change_type) VALUES(now(),'EDUCATOR','UPDATE'); 

-- VIEWS
CREATE VIEW TIMETABLE AS
SELECT s.subject_name, l.lesson_datetime, l.room, p.first_name, p.last_name
FROM LESSONS l
       JOIN SUBJECTS s ON l.SUBJECTS_subject_id = s.subject_id
       JOIN TEACHERS t ON l.TEACHERS_teacher_id = t.teacher_id
       JOIN PERSONS p ON t.PERSONS_person_id = p.person_id
WHERE CLASSES_class_id =1
ORDER BY `lesson_datetime` ASC;

CREATE VIEW TIMETABLE2 AS
SELECT s.subject_name, l.lesson_datetime, l.room, p.first_name, p.last_name
FROM LESSONS l
            JOIN SUBJECTS s ON l.SUBJECTS_subject_id = s.subject_id
            JOIN TEACHERS t ON l.TEACHERS_teacher_id = t.teacher_id
            JOIN PERSONS p ON t.PERSONS_person_id = p.person_id
WHERE CLASSES_class_id =2
ORDER BY `lesson_datetime` ASC;

CREATE VIEW ABSENCES1 AS
SELECT a.excused, l.lesson_datetime, p.first_name, p.last_name
FROM ABSENCES a
JOIN LESSONS l ON a.LESSONS_lesson_id = l.lesson_id
JOIN STUDENTS s ON a.STUDENTS_student_id = s.student_id
JOIN PERSONS p ON s.PERSONS_person_id = p.person_id
ORDER BY `lesson_datetime` ASC;

CREATE VIEW REPORT_CARD1 AS
SELECT s.subject_name, SUM(g.grade_scale * gg.grade)/ COUNT(g.STUDENTS_student_id) AS `srednia`
FROM GRADES g
JOIN SUBJECTS s ON g.SUBJECTS_subject_id = s.subject_id
JOIN STUDENTS st ON g.STUDENTS_student_id = st.student_id
JOIN GRADEDEF gg ON gg.gradedef_id = g.GRADEDEF_gradedef_id
WHERE st.student_id = 1
GROUP BY `subject_name`
ORDER BY `subject_name` ASC;

-- GRANTS
CREATE USER 'educator'@'127.0.0.1' IDENTIFIED BY 'educator';
CREATE USER 'teacher'@'127.0.0.1' IDENTIFIED BY 'teacher';

GRANT all privileges ON GRADES TO 'educator'@'localhost';
GRANT all privileges ON ABSENCES TO 'educator'@'localhost';
GRANT all privileges ON BEHAVIORS TO 'educator'@'localhost';
GRANT SELECT, UPDATE ON LESSONS TO 'educator'@'localhost';
GRANT SELECT, UPDATE ON PERSONS TO 'educator'@'localhost';

GRANT SELECT, INSERT, UPDATE ON GRADES TO 'teacher'@'localhost';
GRANT SELECT, INSERT ON ABSENCES TO 'teacher'@'localhost';
GRANT SELECT, INSERT, UPDATE ON BEHAVIORS TO 'teacher'@'localhost';
GRANT SELECT, UPDATE ON LESSONS TO 'teacher'@'localhost';
GRANT SELECT ON PERSONS TO 'teacher'@'localhost';