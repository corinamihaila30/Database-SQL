CREATE TABLE `client` (
	`id_client` varchar NOT NULL UNIQUE,
	`nume` varchar(250) NOT NULL,
	`prenume` varchar(250) NOT NULL,
	`email` varchar(2100) NOT NULL,
	`telefon` varchar(215) NOT NULL,
	`observatii` varchar(2255) NOT NULL,
	PRIMARY KEY (`id_client`)
);

CREATE TABLE `camera` (
	`id_camera` number NOT NULL UNIQUE,
	`tip_camera` varchar(250) NOT NULL,
	`pret` INT NOT NULL,
	PRIMARY KEY (`id_camera`)
);

CREATE TABLE `discount` (
	`id_discount` number NOT NULL,
	`tip_discount` varchar(250) NOT NULL,
	`procent_discount` number NOT NULL,
	PRIMARY KEY (`id_discount`)
);

CREATE TABLE `rezervare` (
	`id_rezervare` number NOT NULL UNIQUE,
	`data_inceput` DATE NOT NULL,
	`data_sfarsit` DATE NOT NULL,
	`id_camera` number NOT NULL,
	`id_discount` INT(23) NOT NULL,
	`id_client` INT NOT NULL UNIQUE,
	`id_angajat` INT NOT NULL,
	PRIMARY KEY (`id_rezervare`)
);

CREATE TABLE `serviciu` (
	`id_serviciu` number NOT NULL,
	`nume_serviciu` varchar(2100) NOT NULL,
	`cost` number NOT NULL,
	PRIMARY KEY (`id_serviciu`)
);

CREATE TABLE `factura` (
	`id_factura` number NOT NULL,
	`data_emiterii` DATE NOT NULL,
	`suma_totala` number NOT NULL,
	`plata_partiala` number NOT NULL,
	`modalitate_plata` varchar(250) NOT NULL,
	`id_client` INT NOT NULL,
	PRIMARY KEY (`id_factura`)
);

CREATE TABLE `feedback` (
	`id_feedback` number NOT NULL,
	`comentariu` varchar(21000) NOT NULL,
	`nota` number NOT NULL,
	`id_client` INT NOT NULL,
	PRIMARY KEY (`id_feedback`)
);

CREATE TABLE `angajat` (
	`id_angajat` number NOT NULL,
	`nume` varchar(250) NOT NULL,
	`prenume` varchar(250) NOT NULL,
	`functie` varchar(250) NOT NULL,
	PRIMARY KEY (`id_angajat`)
);

CREATE TABLE `client_serviciu` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_client` INT NOT NULL AUTO_INCREMENT,
	`id_serviciu` INT NOT NULL,
	PRIMARY KEY (`id`,`id_client`)
);

ALTER TABLE `rezervare` ADD CONSTRAINT `rezervare_fk0` FOREIGN KEY (`id_camera`) REFERENCES `camera`(`id_camera`);

ALTER TABLE `rezervare` ADD CONSTRAINT `rezervare_fk1` FOREIGN KEY (`id_discount`) REFERENCES `discount`(`id_discount`);

ALTER TABLE `rezervare` ADD CONSTRAINT `rezervare_fk2` FOREIGN KEY (`id_client`) REFERENCES `client`(`id_client`);

ALTER TABLE `rezervare` ADD CONSTRAINT `rezervare_fk3` FOREIGN KEY (`id_angajat`) REFERENCES `angajat`(`id_angajat`);

ALTER TABLE `factura` ADD CONSTRAINT `factura_fk0` FOREIGN KEY (`id_client`) REFERENCES `client`(`id_client`);

ALTER TABLE `feedback` ADD CONSTRAINT `feedback_fk0` FOREIGN KEY (`id_client`) REFERENCES `client`(`id_client`);

ALTER TABLE `client_serviciu` ADD CONSTRAINT `client_serviciu_fk0` FOREIGN KEY (`id_client`) REFERENCES `client`(`id_client`);

ALTER TABLE `client_serviciu` ADD CONSTRAINT `client_serviciu_fk1` FOREIGN KEY (`id_serviciu`) REFERENCES `serviciu`(`id_serviciu`);










