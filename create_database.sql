-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema mysql-fun
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mysql-fun
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mysql-fun` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`evento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`evento` (
  `id` INT NOT NULL,
  `codigo_do_municipio` VARCHAR(45) NULL,
  `data_do_evento` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`portal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`portal` ;

CREATE TABLE IF NOT EXISTS `mydb`.`portal` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `website` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`autor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`autor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`autor` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`noticia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`noticia` ;

CREATE TABLE IF NOT EXISTS `mydb`.`noticia` (
  `id` INT NOT NULL,
  `portal_id` INT NOT NULL,
  `autor_id` INT NOT NULL,
  `tItulo` VARCHAR(45) NULL,
  `article` VARCHAR(45) NULL,
  `data_de_publicacao` VARCHAR(45) NULL,
  `last_update` VARCHAR(45) NULL,
  `url` VARCHAR(45) NULL,
  `relevancia` INT NULL,
  `data_de_classificacao_de_relevancia` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_noticia_portal1_idx` (`portal_id` ASC) VISIBLE,
  INDEX `fk_noticia_autor1_idx` (`autor_id` ASC) VISIBLE,
  CONSTRAINT `fk_noticia_portal1`
    FOREIGN KEY (`portal_id`)
    REFERENCES `mydb`.`portal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_noticia_autor1`
    FOREIGN KEY (`autor_id`)
    REFERENCES `mydb`.`autor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_de_crime`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tipo_de_crime` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tipo_de_crime` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`evento_noticia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`evento_noticia` ;

CREATE TABLE IF NOT EXISTS `mydb`.`evento_noticia` (
  `evento_id` INT NOT NULL,
  `noticia_id` INT NOT NULL,
  PRIMARY KEY (`evento_id`, `noticia_id`),
  INDEX `fk_evento_has_noticia_noticia1_idx` (`noticia_id` ASC) VISIBLE,
  INDEX `fk_evento_has_noticia_evento1_idx` (`evento_id` ASC) VISIBLE,
  CONSTRAINT `fk_evento_has_noticia_evento1`
    FOREIGN KEY (`evento_id`)
    REFERENCES `mydb`.`evento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_has_noticia_noticia1`
    FOREIGN KEY (`noticia_id`)
    REFERENCES `mydb`.`noticia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`evento_propriedade_titulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`evento_propriedade_titulo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`evento_propriedade_titulo` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`evento_propriedade_valor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`evento_propriedade_valor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`evento_propriedade_valor` (
  `id` INT NOT NULL,
  `valor` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`evento_propriedade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`evento_propriedade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`evento_propriedade` (
  `id` INT NOT NULL,
  `tipo_de_crime_id` INT NOT NULL,
  `evento_id` INT NOT NULL,
  `evento_propriedade_titulo_id` INT NOT NULL,
  `evento_propriedade_valor_id` INT NOT NULL,
  `valor` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `tipo_de_crime_id`, `evento_id`, `evento_propriedade_titulo_id`, `evento_propriedade_valor_id`),
  INDEX `fk_propriedade_do_crime_tipo_de_crime1_idx` (`tipo_de_crime_id` ASC) VISIBLE,
  INDEX `fk_propriedade_do_crime_evento1_idx` (`evento_id` ASC) VISIBLE,
  INDEX `fk_evento_propriedade_propriedades1_idx` (`evento_propriedade_titulo_id` ASC) VISIBLE,
  INDEX `fk_evento_propriedade_evento_propriedade_valor1_idx` (`evento_propriedade_valor_id` ASC) VISIBLE,
  CONSTRAINT `fk_propriedade_do_crime_tipo_de_crime1`
    FOREIGN KEY (`tipo_de_crime_id`)
    REFERENCES `mydb`.`tipo_de_crime` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_propriedade_do_crime_evento1`
    FOREIGN KEY (`evento_id`)
    REFERENCES `mydb`.`evento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_propriedade_propriedades1`
    FOREIGN KEY (`evento_propriedade_titulo_id`)
    REFERENCES `mydb`.`evento_propriedade_titulo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_propriedade_evento_propriedade_valor1`
    FOREIGN KEY (`evento_propriedade_valor_id`)
    REFERENCES `mydb`.`evento_propriedade_valor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`raspagem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`raspagem` ;

CREATE TABLE IF NOT EXISTS `mydb`.`raspagem` (
  `id` INT NOT NULL,
  `data_de_aquisicao` VARCHAR(45) NULL,
  `keywords` VARCHAR(45) NULL,
  `author` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`keyword` ;

CREATE TABLE IF NOT EXISTS `mydb`.`keyword` (
  `id` INT NOT NULL,
  `keyword` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`raspagem_keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`raspagem_keyword` ;

CREATE TABLE IF NOT EXISTS `mydb`.`raspagem_keyword` (
  `raspagem_id` INT NOT NULL,
  `keyword_id` INT NOT NULL,
  PRIMARY KEY (`raspagem_id`, `keyword_id`),
  INDEX `fk_raspagem_has_keyword_keyword1_idx` (`keyword_id` ASC) VISIBLE,
  INDEX `fk_raspagem_has_keyword_raspagem1_idx` (`raspagem_id` ASC) VISIBLE,
  CONSTRAINT `fk_raspagem_has_keyword_raspagem1`
    FOREIGN KEY (`raspagem_id`)
    REFERENCES `mydb`.`raspagem` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_raspagem_has_keyword_keyword1`
    FOREIGN KEY (`keyword_id`)
    REFERENCES `mydb`.`keyword` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`modelo_de_relevancia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`modelo_de_relevancia` ;

CREATE TABLE IF NOT EXISTS `mydb`.`modelo_de_relevancia` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`noticia_raspagem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`noticia_raspagem` ;

CREATE TABLE IF NOT EXISTS `mydb`.`noticia_raspagem` (
  `noticia_id` INT NOT NULL,
  `raspagem_id` INT NOT NULL,
  `modelo_de_relevancia_id` INT NOT NULL,
  PRIMARY KEY (`noticia_id`, `raspagem_id`, `modelo_de_relevancia_id`),
  INDEX `fk_noticia_has_raspagem_raspagem1_idx` (`raspagem_id` ASC) VISIBLE,
  INDEX `fk_noticia_has_raspagem_noticia1_idx` (`noticia_id` ASC) VISIBLE,
  INDEX `fk_noticia_raspagem_modelo_de_relevancia1_idx` (`modelo_de_relevancia_id` ASC) VISIBLE,
  CONSTRAINT `fk_noticia_has_raspagem_noticia1`
    FOREIGN KEY (`noticia_id`)
    REFERENCES `mydb`.`noticia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_noticia_has_raspagem_raspagem1`
    FOREIGN KEY (`raspagem_id`)
    REFERENCES `mydb`.`raspagem` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_noticia_raspagem_modelo_de_relevancia1`
    FOREIGN KEY (`modelo_de_relevancia_id`)
    REFERENCES `mydb`.`modelo_de_relevancia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tags` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tags` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `decricao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`noticia_tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`noticia_tags` ;

CREATE TABLE IF NOT EXISTS `mydb`.`noticia_tags` (
  `noticia_id` INT NOT NULL,
  `tags_id` INT NOT NULL,
  PRIMARY KEY (`noticia_id`, `tags_id`),
  INDEX `fk_noticia_has_tags_tags1_idx` (`tags_id` ASC) VISIBLE,
  INDEX `fk_noticia_has_tags_noticia1_idx` (`noticia_id` ASC) VISIBLE,
  CONSTRAINT `fk_noticia_has_tags_noticia1`
    FOREIGN KEY (`noticia_id`)
    REFERENCES `mydb`.`noticia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_noticia_has_tags_tags1`
    FOREIGN KEY (`tags_id`)
    REFERENCES `mydb`.`tags` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pais` ;

CREATE TABLE IF NOT EXISTS `mydb`.`pais` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`regiao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`regiao` ;

CREATE TABLE IF NOT EXISTS `mydb`.`regiao` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `pais_id` INT NOT NULL,
  PRIMARY KEY (`id`, `pais_id`),
  INDEX `fk_regiao_pais1_idx` (`pais_id` ASC) VISIBLE,
  CONSTRAINT `fk_regiao_pais1`
    FOREIGN KEY (`pais_id`)
    REFERENCES `mydb`.`pais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`estado` ;

CREATE TABLE IF NOT EXISTS `mydb`.`estado` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `regiao_id` INT NOT NULL,
  PRIMARY KEY (`id`, `regiao_id`),
  INDEX `fk_estado_regiao1_idx` (`regiao_id` ASC) VISIBLE,
  CONSTRAINT `fk_estado_regiao1`
    FOREIGN KEY (`regiao_id`)
    REFERENCES `mydb`.`regiao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`municipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`municipio` ;

CREATE TABLE IF NOT EXISTS `mydb`.`municipio` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `ibge_codigo_de_municipio` VARCHAR(45) NULL,
  `estado_id` INT NOT NULL,
  PRIMARY KEY (`id`, `estado_id`),
  INDEX `fk_municipio_estado1_idx` (`estado_id` ASC) VISIBLE,
  CONSTRAINT `fk_municipio_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `mydb`.`estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`location` ;

CREATE TABLE IF NOT EXISTS `mydb`.`location` (
  `id` INT NOT NULL,
  `latitude` VARCHAR(45) NULL,
  `longitude` VARCHAR(45) NULL,
  `municipio_id` INT NOT NULL,
  `estado_id` INT NOT NULL,
  `regiao_id` INT NOT NULL,
  `pais_id` INT NOT NULL,
  PRIMARY KEY (`id`, `municipio_id`),
  INDEX `fk_location_municipio1_idx` (`municipio_id` ASC) VISIBLE,
  INDEX `fk_location_estado1_idx` (`estado_id` ASC) VISIBLE,
  INDEX `fk_location_regiao1_idx` (`regiao_id` ASC) VISIBLE,
  INDEX `fk_location_pais1_idx` (`pais_id` ASC) VISIBLE,
  CONSTRAINT `fk_location_municipio1`
    FOREIGN KEY (`municipio_id`)
    REFERENCES `mydb`.`municipio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_location_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `mydb`.`estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_location_regiao1`
    FOREIGN KEY (`regiao_id`)
    REFERENCES `mydb`.`regiao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_location_pais1`
    FOREIGN KEY (`pais_id`)
    REFERENCES `mydb`.`pais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`location_evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`location_evento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`location_evento` (
  `location_id` INT NOT NULL,
  `evento_id` INT NOT NULL,
  PRIMARY KEY (`location_id`, `evento_id`),
  INDEX `fk_location_has_evento_evento1_idx` (`evento_id` ASC) VISIBLE,
  INDEX `fk_location_has_evento_location1_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `fk_location_has_evento_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `mydb`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_location_has_evento_evento1`
    FOREIGN KEY (`evento_id`)
    REFERENCES `mydb`.`evento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mysql-fun` ;

-- -----------------------------------------------------
-- Table `mysql-fun`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mysql-fun`.`user` ;

CREATE TABLE IF NOT EXISTS `mysql-fun`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mysql-fun`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mysql-fun`.`orders` ;

CREATE TABLE IF NOT EXISTS `mysql-fun`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `order_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mysql-fun`.`user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mysql-fun`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mysql-fun`.`products` ;

CREATE TABLE IF NOT EXISTS `mysql-fun`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mysql-fun`.`order_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mysql-fun`.`order_details` ;

CREATE TABLE IF NOT EXISTS `mysql-fun`.`order_details` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL DEFAULT '1',
  `price_at_time_of_order` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`),
  INDEX `fk_order_details_product_id` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_details_order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `mysql-fun`.`orders` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_order_details_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `mysql-fun`.`products` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mysql-fun`.`profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mysql-fun`.`profile` ;

CREATE TABLE IF NOT EXISTS `mysql-fun`.`profile` (
  `user_id` INT NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mysql-fun`.`user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
