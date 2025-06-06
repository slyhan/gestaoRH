-- MySQL Script generated by MySQL Workbench
-- Mon May 26 21:28:09 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `gestaorh` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gestaorh` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `gestaorh` ;

-- -----------------------------------------------------
-- Table `cargo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cargo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `cargo` (
  `idCargo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT NOT NULL,
  `salarioBase` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idCargo`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idCargo_UNIQUE` ON `cargo` (`idCargo` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `departamento` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `departamento` (
  `idDepartamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT NULL,
  PRIMARY KEY (`idDepartamento`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idDepartamento_UNIQUE` ON `departamento` (`idDepartamento` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `funcionarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `funcionarios` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `sexo` ENUM("F", "M") NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `dataAdmissao` DATE NOT NULL,
  `idCargo` INT NULL,
  `idDepart` INT NULL,
  `salarioAtual` DECIMAL(10,2) NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idfuncionarios_UNIQUE` ON `funcionarios` (`idFuncionario` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `cpf_UNIQUE` ON `funcionarios` (`cpf` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `historicoSalarial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `historicoSalarial` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `historicoSalarial` (
  `idHistSalarial` INT NOT NULL AUTO_INCREMENT,
  `idFuncionario` INT NULL,
  `salario` DECIMAL(10,2) NOT NULL,
  `dataAlteracao` DATE NOT NULL,
  `motivo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idHistSalarial`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idHistSalarial_UNIQUE` ON `historicoSalarial` (`idHistSalarial` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `avaliacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `avaliacao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `avaliacao` (
  `idAvaliacao` INT NOT NULL AUTO_INCREMENT,
  `idFuncionario` INT NULL,
  `dataAvaliacao` DATE NOT NULL,
  `nota` DECIMAL(3,2) NOT NULL,
  `comentario` TEXT NOT NULL,
  `avaliador` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idAvaliacao`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idAvaliacao_UNIQUE` ON `avaliacao` (`idAvaliacao` ASC) VISIBLE;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



