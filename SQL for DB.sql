-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema progress
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema progress
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `progress` DEFAULT CHARACTER SET utf8 ;
USE `progress` ;

-- -----------------------------------------------------
-- Table `progress`.`Факультет`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progress`.`Факультет` (
  `idФакультета` SMALLINT NOT NULL,
  `название` VARCHAR(255) NOT NULL,
  `Фамилия декана` VARCHAR(45) NOT NULL,
  `Имя декана` VARCHAR(45) NOT NULL,
  `Отчество декана` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idФакультета`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progress`.`Группа`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progress`.`Группа` (
  `idГруппы` SMALLINT NOT NULL,
  `название` VARCHAR(45) NOT NULL,
  `idФакультета` SMALLINT NOT NULL,
  `год создания` SMALLINT NULL,
  PRIMARY KEY (`idГруппы`),
  INDEX `fk_группа_факультет_idx` (`idФакультета` ASC) VISIBLE,
  CONSTRAINT `fk_группа_факультет`
    FOREIGN KEY (`idФакультета`)
    REFERENCES `progress`.`Факультет` (`idФакультета`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progress`.`Студент`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progress`.`Студент` (
  `номер зачетки` INT NOT NULL,
  `Фамилия` VARCHAR(100) NOT NULL,
  `Имя` VARCHAR(45) NOT NULL,
  `Отчество` VARCHAR(45) NULL,
  `idГруппы` SMALLINT NOT NULL,
  `тип обучения` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`номер зачетки`),
  INDEX `fk_студент_группа_idx` (`idГруппы` ASC) VISIBLE,
  CONSTRAINT `fk_студент_группа`
    FOREIGN KEY (`idГруппы`)
    REFERENCES `progress`.`Группа` (`idГруппы`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progress`.`Преподаватель`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progress`.`Преподаватель` (
  `idПреподавателя` SMALLINT NOT NULL,
  `Фамилия` VARCHAR(100) NOT NULL,
  `Имя` VARCHAR(45) NOT NULL,
  `Отчество` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `idФакультета` SMALLINT NOT NULL,
  PRIMARY KEY (`idПреподавателя`),
  INDEX `fk_преподаватель_факультет_idx` (`idФакультета` ASC) VISIBLE,
  CONSTRAINT `fk_преподаватель_факультет`
    FOREIGN KEY (`idФакультета`)
    REFERENCES `progress`.`Факультет` (`idФакультета`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progress`.`Дисциплина`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progress`.`Дисциплина` (
  `idДисциплины` SMALLINT NOT NULL,
  `название` VARCHAR(100) NOT NULL,
  `количество часов` SMALLINT NULL,
  `idФакультета` SMALLINT NOT NULL,
  PRIMARY KEY (`idДисциплины`),
  INDEX `fk_дисциплина_факультет_idx` (`idФакультета` ASC) VISIBLE,
  CONSTRAINT `fk_дисциплина_факультет`
    FOREIGN KEY (`idФакультета`)
    REFERENCES `progress`.`Факультет` (`idФакультета`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progress`.`Тип контроля`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progress`.`Тип контроля` (
  `idТипа` SMALLINT NOT NULL,
  `Название типа` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idТипа`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progress`.`Контроль дисциплины`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progress`.`Контроль дисциплины` (
  `idКонтрДисциплины` SMALLINT NOT NULL,
  `idДисциплины` SMALLINT NOT NULL,
  `idТипа` SMALLINT NOT NULL,
  INDEX `fk_контроль_тип_idx` (`idТипа` ASC) VISIBLE,
  PRIMARY KEY (`idКонтрДисциплины`),
  UNIQUE INDEX `index3` (`idДисциплины` ASC, `idТипа` ASC) INVISIBLE,
  CONSTRAINT `fk_контроль_дисциплина`
    FOREIGN KEY (`idДисциплины`)
    REFERENCES `progress`.`Дисциплина` (`idДисциплины`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_контроль_тип`
    FOREIGN KEY (`idТипа`)
    REFERENCES `progress`.`Тип контроля` (`idТипа`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progress`.`Проверочная работа`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progress`.`Проверочная работа` (
  `idРаботы` INT NOT NULL,
  `дата` DATE NOT NULL,
  `idКонтрДисциплины` SMALLINT NOT NULL,
  `номер зачетки` INT NOT NULL,
  `оценка` TINYINT NOT NULL,
  `idПреподавателя` SMALLINT NOT NULL,
  PRIMARY KEY (`idРаботы`),
  INDEX `fk_работа_студент_idx` (`номер зачетки` ASC) VISIBLE,
  INDEX `fk_работа_преподаватель_idx` (`idПреподавателя` ASC) VISIBLE,
  INDEX `fk_работа_контрольДисциплины_idx` (`idКонтрДисциплины` ASC) VISIBLE,
  CONSTRAINT `fk_работа_студент`
    FOREIGN KEY (`номер зачетки`)
    REFERENCES `progress`.`Студент` (`номер зачетки`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_работа_преподаватель`
    FOREIGN KEY (`idПреподавателя`)
    REFERENCES `progress`.`Преподаватель` (`idПреподавателя`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_работа_контрольДисциплины`
    FOREIGN KEY (`idКонтрДисциплины`)
    REFERENCES `progress`.`Контроль дисциплины` (`idКонтрДисциплины`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
