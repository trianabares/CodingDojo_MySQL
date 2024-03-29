-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema normalizacion
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `normalizacion` ;

-- -----------------------------------------------------
-- Schema normalizacion
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `normalizacion` DEFAULT CHARACTER SET utf8 ;
USE `normalizacion` ;

-- -----------------------------------------------------
-- Table `normalizacion`.`dojos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `normalizacion`.`dojos` ;

CREATE TABLE IF NOT EXISTS `normalizacion`.`dojos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `location` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `normalizacion`.`students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `normalizacion`.`students` ;

CREATE TABLE IF NOT EXISTS `normalizacion`.`students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dojo_id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `address1` VARCHAR(255) NULL,
  `address2` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_students_dojos_idx` (`dojo_id` ASC) VISIBLE,
  CONSTRAINT `fk_students_dojos`
    FOREIGN KEY (`dojo_id`)
    REFERENCES `normalizacion`.`dojos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `normalizacion`.`interests`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `normalizacion`.`interests` ;

CREATE TABLE IF NOT EXISTS `normalizacion`.`interests` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `normalizacion`.`students_has_interests`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `normalizacion`.`students_has_interests` ;

CREATE TABLE IF NOT EXISTS `normalizacion`.`students_has_interests` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `interest_id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  INDEX `fk_students_has_interests_interests1_idx` (`interest_id` ASC) VISIBLE,
  INDEX `fk_students_has_interests_students1_idx` (`student_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_students_has_interests_students1`
    FOREIGN KEY (`student_id`)
    REFERENCES `normalizacion`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_has_interests_interests1`
    FOREIGN KEY (`interest_id`)
    REFERENCES `normalizacion`.`interests` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
