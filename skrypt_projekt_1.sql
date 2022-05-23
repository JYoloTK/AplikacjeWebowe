-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rpg
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `rpg` ;

-- -----------------------------------------------------
-- Schema rpg
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rpg` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci ;
USE `rpg` ;

-- -----------------------------------------------------
-- Table `rpg`.`lokacja`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpg`.`lokacja` ;

CREATE TABLE IF NOT EXISTS `rpg`.`lokacja` (
  `idlokacja` INT NOT NULL,
  `nazwa` VARCHAR(45) NOT NULL,
  `wielkosc` VARCHAR(45) NOT NULL,
  `biom` VARCHAR(45) NULL,
  PRIMARY KEY (`idlokacja`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpg`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpg`.`user` ;

CREATE TABLE IF NOT EXISTS `rpg`.`user` (
  `iduser` INT NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `haslo` VARCHAR(45) NOT NULL,
  `rola` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpg`.`postac`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpg`.`postac` ;

CREATE TABLE IF NOT EXISTS `rpg`.`postac` (
  `idpostac` INT NOT NULL,
  `nazwa` VARCHAR(45) NOT NULL,
  `rasa` VARCHAR(45) NOT NULL,
  `klasa` VARCHAR(45) NOT NULL,
  `level` VARCHAR(45) NOT NULL,
  `wiek` VARCHAR(45) NULL,
  `idlokacja` INT NOT NULL,
  `iduser` INT NOT NULL,
  PRIMARY KEY (`idpostac`),
  INDEX `fk_postac_lokacja1_idx` (`idlokacja` ASC),
  INDEX `fk_postac_user1_idx` (`iduser` ASC),
  CONSTRAINT `fk_postac_lokacja1`
    FOREIGN KEY (`idlokacja`)
    REFERENCES `rpg`.`lokacja` (`idlokacja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_postac_user1`
    FOREIGN KEY (`iduser`)
    REFERENCES `rpg`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpg`.`npc`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpg`.`npc` ;

CREATE TABLE IF NOT EXISTS `rpg`.`npc` (
  `idnpc` INT NOT NULL,
  `nazwa` VARCHAR(45) NOT NULL,
  `rasa` VARCHAR(45) NOT NULL,
  `idlokacja` INT NOT NULL,
  PRIMARY KEY (`idnpc`),
  INDEX `fk_npc_lokacja1_idx` (`idlokacja` ASC),
  CONSTRAINT `fk_npc_lokacja1`
    FOREIGN KEY (`idlokacja`)
    REFERENCES `rpg`.`lokacja` (`idlokacja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpg`.`potwor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpg`.`potwor` ;

CREATE TABLE IF NOT EXISTS `rpg`.`potwor` (
  `idpotwor` INT NOT NULL,
  `rasa` VARCHAR(45) NOT NULL,
  `idlokacja` INT NOT NULL,
  PRIMARY KEY (`idpotwor`),
  INDEX `fk_potwor_lokacja1_idx` (`idlokacja` ASC),
  CONSTRAINT `fk_potwor_lokacja1`
    FOREIGN KEY (`idlokacja`)
    REFERENCES `rpg`.`lokacja` (`idlokacja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
