-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema eventos
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `eventos` ;

-- -----------------------------------------------------
-- Schema eventos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eventos` DEFAULT CHARACTER SET utf8 ;
USE `eventos` ;

-- -----------------------------------------------------
-- Table `eventos`.`eventos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eventos`.`eventos` ;

CREATE TABLE IF NOT EXISTS `eventos`.`eventos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NULL,
  `descripcion` VARCHAR(255) NULL,
  `ubicacion` VARCHAR(255) NULL,
  `fecha` DATE NULL,
  `hora_inicio` TIME NULL,
  `hora_finalizacion` TIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eventos`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eventos`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `eventos`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL,
  `direccion` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eventos`.`asistencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eventos`.`asistencia` ;

CREATE TABLE IF NOT EXISTS `eventos`.`asistencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `evento_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  `rsvp` TINYINT NULL,
  INDEX `fk_evnetros_has_usuarios_usuarios1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_evnetros_has_usuarios_evnetros_idx` (`evento_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_evnetros_has_usuarios_evnetros`
    FOREIGN KEY (`evento_id`)
    REFERENCES `eventos`.`eventos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evnetros_has_usuarios_usuarios1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `eventos`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
