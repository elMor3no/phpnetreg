SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`CLibertad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CLibertad` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `mydb`.`CLibertad` (
  `idCLibertad` INT(11) NOT NULL AUTO_INCREMENT ,
  `local` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idCLibertad`) ,
  UNIQUE INDEX `local_unique` (`local` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Area` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `mydb`.`Area` (
  `idArea` INT(11) NOT NULL AUTO_INCREMENT ,
  `Nombrearea` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish2_ci' NOT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  `CLibertad_idCLibertad` INT(11) NOT NULL ,
  PRIMARY KEY (`idArea`) ,
  INDEX `fk_Area_CLibertad` (`CLibertad_idCLibertad` ASC) ,
  CONSTRAINT `fk_Area_CLibertad`
    FOREIGN KEY (`CLibertad_idCLibertad` )
    REFERENCES `mydb`.`CLibertad` (`idCLibertad` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Subnet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Subnet` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `mydb`.`Subnet` (
  `idSubnet` INT(11) NOT NULL AUTO_INCREMENT ,
  `mask` INT(11) NOT NULL COMMENT 'Mascara de red' ,
  `ipaddr` INT(45) NOT NULL ,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`idSubnet`) ,
  UNIQUE INDEX `rango_UNIQUE` (`ipaddr` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`IP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`IP` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `mydb`.`IP` (
  `idIP` INT(11) NOT NULL AUTO_INCREMENT ,
  `ipnum` VARCHAR(45) NOT NULL ,
  `used` TINYINT(1) NOT NULL DEFAULT '0' ,
  `Subnet_idSubnet` INT(11) NOT NULL ,
  PRIMARY KEY (`idIP`) ,
  UNIQUE INDEX `ipnum_UNIQUE` (`ipnum` ASC) ,
  INDEX `fk_IP_Subnet1` (`Subnet_idSubnet` ASC) ,
  CONSTRAINT `fk_IP_Subnet1`
    FOREIGN KEY (`Subnet_idSubnet` )
    REFERENCES `mydb`.`Subnet` (`idSubnet` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1017
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`TipoDispositivo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TipoDispositivo` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `mydb`.`TipoDispositivo` (
  `idTipoDispositivo` INT(11) NOT NULL AUTO_INCREMENT ,
  `TipoDispositivo` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`idTipoDispositivo`) ,
  UNIQUE INDEX `TipoDispositivo_UNIQUE` (`TipoDispositivo` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`VRectoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`VRectoria` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `mydb`.`VRectoria` (
  `idVRectoria` INT(11) NOT NULL AUTO_INCREMENT ,
  `VRNombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish2_ci' NOT NULL ,
  PRIMARY KEY (`idVRectoria`) ,
  UNIQUE INDEX `VRNombre_UNIQUE` (`VRNombre` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Dispositivo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Dispositivo` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `mydb`.`Dispositivo` (
  `idDispositivo` INT(11) NOT NULL AUTO_INCREMENT ,
  `NombDisp` VARCHAR(45) NOT NULL ,
  `mac` VARCHAR(255) NOT NULL ,
  `responsable` VARCHAR(45) NOT NULL ,
  `observacion` VARCHAR(45) NULL DEFAULT NULL ,
  `finsercion` DATE NOT NULL ,
  `fcaducidad` DATE NOT NULL ,
  `feliminacion` DATE NOT NULL ,
  `disponible` TINYINT NOT NULL ,
  `VRectoria_idVRectoria` INT(11) NOT NULL ,
  `TipoDispositivo_idTipoDispositivo` INT(11) NOT NULL ,
  `Area_idArea` INT(11) NOT NULL ,
  `IP_idIP` INT(11) NOT NULL ,
  PRIMARY KEY (`idDispositivo`, `VRectoria_idVRectoria`, `TipoDispositivo_idTipoDispositivo`, `Area_idArea`, `IP_idIP`) ,
  UNIQUE INDEX `NombDisp_UNIQUE` (`NombDisp` ASC) ,
  UNIQUE INDEX `mac_UNIQUE` (`mac` ASC) ,
  INDEX `fk_Dispositivo_VRectoria1` (`VRectoria_idVRectoria` ASC) ,
  INDEX `fk_Dispositivo_TipoDispositivo1` (`TipoDispositivo_idTipoDispositivo` ASC) ,
  INDEX `fk_Dispositivo_Area1` (`Area_idArea` ASC) ,
  INDEX `fk_Dispositivo_IP1` (`IP_idIP` ASC) ,
  UNIQUE INDEX `IP_idIP_UNIQUE` (`IP_idIP` ASC) ,
  CONSTRAINT `fk_Dispositivo_Area1`
    FOREIGN KEY (`Area_idArea` )
    REFERENCES `mydb`.`Area` (`idArea` )
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Dispositivo_IP1`
    FOREIGN KEY (`IP_idIP` )
    REFERENCES `mydb`.`IP` (`idIP` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Dispositivo_TipoDispositivo1`
    FOREIGN KEY (`TipoDispositivo_idTipoDispositivo` )
    REFERENCES `mydb`.`TipoDispositivo` (`idTipoDispositivo` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Dispositivo_VRectoria1`
    FOREIGN KEY (`VRectoria_idVRectoria` )
    REFERENCES `mydb`.`VRectoria` (`idVRectoria` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`roles` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `mydb`.`roles` (
  `idroles` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombrol` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`idroles`) ,
  UNIQUE INDEX `nombrol_UNIQUE` (`nombrol` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`usuarios` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `idusuarios` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de usuario' ,
  `user` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `apellido` VARCHAR(45) NULL DEFAULT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  `roles_idroles` INT(11) NOT NULL ,
  PRIMARY KEY (`idusuarios`, `roles_idroles`) ,
  UNIQUE INDEX `idusuarios_UNIQUE` (`idusuarios` ASC) ,
  UNIQUE INDEX `user_UNIQUE` (`user` ASC) ,
  INDEX `fk_usuarios_roles` (`roles_idroles` ASC) ,
  CONSTRAINT `fk_usuarios_roles`
    FOREIGN KEY (`roles_idroles` )
    REFERENCES `mydb`.`roles` (`idroles` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
