--
-- Base de données: `event`
--

CREATE DATABASE IF NOT EXISTS event DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `event`;

--
-- Structure de la table `agenda`
--

CREATE TABLE IF NOT EXISTS agenda (
	`agenda_id` int auto_increment,
	`day` date NOT NULL,
	`start_hour` date NOT NULL,
	`end_hour` date NOT NULL,
	`description` varchar(255) DEFAULT NULL,
	`file_url` varchar(50) NOT NULL,
	`breaks` boolean DEFAULT FALSE,
	`end_day` boolean DEFAULT FALSE,
	PRIMARY KEY (agenda_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `event`
--

CREATE TABLE IF NOT EXISTS event(
	`event_id` int auto_increment,
	`name` varchar(50) NOT NULL,
	`start_date` date NOT NULL,
	`end_date` date DEFAULT NULL,
	`description` varchar(250) DEFAULT NULL,
	`place` varchar(100) NOT NULL,
	`one_day` boolean DEFAULT TRUE,
	PRIMARY KEY (event_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS user(
	`user_id` int auto_increment,
	`first_name` varchar(50) NOT NULL,
	`last_name` varchar(50) NOT NULL,
	`institution` varchar(100) DEFAULT NULL,
	`country` varchar(100) DEFAULT NULL,
	`email` varchar(255) NOT NULL,
	`special_menu` varchar(255) NOT NULL,
	`show` boolean DEFAULT TRUE,
	PRIMARY KEY (user_id),
	CONSTRAINT UNIQUE KEY UK_user_email (email)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `registration`
--

CREATE TABLE IF NOT EXISTS registration(
	`user_id` int NOT NULL,
	`event_id` int NOT NULL,
	`validate` boolean DEFAULT FALSE,
	PRIMARY KEY(user_id, event_id),
	CONSTRAINT FOREIGN KEY fk_registration_user_id (user_id) REFERENCES user(user_id),
	CONSTRAINT FOREIGN KEY fk_registration_event_id (event_id) REFERENCES event(event_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `menu`
--

CREATE TABLE IF NOT EXISTS menu(
	`menu_id` int auto_increment,
	`name` varchar(50) NOT NULL,
	`menu_url` varchar(50) NOT NULL,
	PRIMARY KEY (menu_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `page`
--

CREATE TABLE IF NOT EXISTS page(
	`page_id` int auto_increment,
	`menu_id` int NOT NULL,
	`event_id` int NOT NULL,
	`description` text DEFAULT NULL,
	PRIMARY KEY (page_id),
	CONSTRAINT FOREIGN KEY fk_page_menu_id (menu_id) REFERENCES menu(menu_id),
	CONSTRAINT FOREIGN KEY fk_page_event_id (event_id) REFERENCES event(event_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `active_menu`
--

CREATE TABLE IF NOT EXISTS active_menu(
	`menu_id` int NOT NULL,
	`event_id` int NOT NULL,
	PRIMARY KEY (menu_id, event_id),
	CONSTRAINT FOREIGN KEY fk_active_menu_menu_id (menu_id) REFERENCES menu(menu_id),
	CONSTRAINT FOREIGN KEY fk_active_menu_event_id (event_id) REFERENCES event(event_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



