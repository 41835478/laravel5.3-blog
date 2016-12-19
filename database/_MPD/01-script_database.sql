-- MySQL Script generated by MySQL Workbench
-- 12/19/16 11:40:10
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema blogdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `blogdb`;

-- -----------------------------------------------------
-- Schema blogdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blogdb` DEFAULT CHARACTER SET utf8 ;
USE `blogdb`;

-- -----------------------------------------------------
-- Table `users_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users_status` ;

CREATE TABLE IF NOT EXISTS `users_status` (
  `users_status_id` INT NOT NULL AUTO_INCREMENT,
  `users_status_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`users_status_id`),
  UNIQUE INDEX `users_status_name_UNIQUE` (`users_status_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `users_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users_role` ;

CREATE TABLE IF NOT EXISTS `users_role` (
  `users_role_id` INT NOT NULL AUTO_INCREMENT,
  `users_role_name` VARCHAR(45) NOT NULL,
  `users_role_slug` VARCHAR(20) NULL,
  PRIMARY KEY (`users_role_id`),
  UNIQUE INDEX `users_role_name_UNIQUE` (`users_role_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users` ;

CREATE TABLE IF NOT EXISTS `users` (
  `users_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `phone` VARCHAR(20) NULL,
  `remember_token` VARCHAR(100) NULL,
  `avatar` BLOB NULL,
  `seen` TINYINT(1) NOT NULL DEFAULT 0,
  `confirmed` TINYINT(1) NOT NULL DEFAULT 0,
  `confirmation_code` VARCHAR(255) NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` VARCHAR(45) NULL,
  `users_status_id` INT NOT NULL,
  `users_role_id` INT NOT NULL,
  PRIMARY KEY (`users_id`),
  INDEX `fk_users_users_status_idx` (`users_status_id` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_users_users_role1_idx` (`users_role_id` ASC),
  CONSTRAINT `fk_users_users_status`
    FOREIGN KEY (`users_status_id`)
    REFERENCES `users_status` (`users_status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_users_role1`
    FOREIGN KEY (`users_role_id`)
    REFERENCES `users_role` (`users_role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post` ;

CREATE TABLE IF NOT EXISTS `post` (
  `post_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) NOT NULL,
  `summary` TEXT NOT NULL,
  `content` TEXT NOT NULL,
  `seen` TINYINT(1) NOT NULL DEFAULT 0,
  `active` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `fk_post_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_post_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `users` (`users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag` ;

CREATE TABLE IF NOT EXISTS `tag` (
  `tag_id` INT NOT NULL AUTO_INCREMENT,
  `tag_name` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE INDEX `tag_name_UNIQUE` (`tag_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post_has_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post_has_tag` ;

CREATE TABLE IF NOT EXISTS `post_has_tag` (
  `post_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`post_id`, `tag_id`),
  INDEX `fk_post_has_tag_tag1_idx` (`tag_id` ASC),
  INDEX `fk_post_has_tag_post1_idx` (`post_id` ASC),
  CONSTRAINT `fk_post_has_tag_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`post_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_has_tag_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tag` (`tag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comments` ;

CREATE TABLE IF NOT EXISTS `comments` (
  `comments_id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `seen` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  `post_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`comments_id`),
  INDEX `fk_comments_post1_idx` (`post_id` ASC),
  INDEX `fk_comments_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_comments_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`post_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `views`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `views` ;

CREATE TABLE IF NOT EXISTS `views` (
  `post_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX `fk_views_post1_idx` (`post_id` ASC),
  INDEX `fk_views_users1_idx` (`users_id` ASC),
  PRIMARY KEY (`post_id`, `users_id`),
  CONSTRAINT `fk_views_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`post_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_views_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `message` ;

CREATE TABLE IF NOT EXISTS `message` (
  `message_id` INT NOT NULL AUTO_INCREMENT,
  `from_name` VARCHAR(45) NOT NULL,
  `from_email` VARCHAR(45) NOT NULL,
  `subject` VARCHAR(255) NULL,
  `message_text` TEXT NOT NULL,
  `seen` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  `users_id` INT NULL,
  PRIMARY KEY (`message_id`),
  INDEX `fk_message_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_message_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `users` (`users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `survey`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `survey` ;

CREATE TABLE IF NOT EXISTS `survey` (
  `survey_id` INT NOT NULL AUTO_INCREMENT,
  `question` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`survey_id`),
  UNIQUE INDEX `question_UNIQUE` (`question` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `response`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `response` ;

CREATE TABLE IF NOT EXISTS `response` (
  `response_id` INT NOT NULL AUTO_INCREMENT,
  `response_text` VARCHAR(45) NOT NULL,
  `survey_id` INT NOT NULL,
  PRIMARY KEY (`response_id`),
  INDEX `fk_response_survey1_idx` (`survey_id` ASC),
  CONSTRAINT `fk_response_survey1`
    FOREIGN KEY (`survey_id`)
    REFERENCES `survey` (`survey_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `users_survey`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users_survey` ;

CREATE TABLE IF NOT EXISTS `users_survey` (
  `users_id` INT NOT NULL,
  `response_id` INT NOT NULL,
  `seen` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  INDEX `fk_users_survey_users1_idx` (`users_id` ASC),
  INDEX `fk_users_survey_response1_idx` (`response_id` ASC),
  PRIMARY KEY (`users_id`, `response_id`),
  CONSTRAINT `fk_users_survey_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_survey_response1`
    FOREIGN KEY (`response_id`)
    REFERENCES `response` (`response_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
