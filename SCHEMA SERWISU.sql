CREATE DATABASE serwisinternet
USE serwisinternet
ALTER DATABASE `serwisinternet` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci

CREATE TABLE użytkownicy 
	(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(255) UNIQUE NOT NULL,	
    kiedy_utworzony TIMESTAMP DEFAULT NOW()
    );

CREATE TABLE zdjęcia
	(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    url_zdjęcia VARCHAR(255) NOT NULL,
    id_użytkownika INTEGER NOT NULL,
    kiedy_stworzony TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(id_użytkownika) REFERENCES użytkownicy(id)
    );
    
CREATE TABLE komentarze 
	(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tekst VARCHAR(255) NOT NULL,
    id_zdjęcia INTEGER NOT NULL,
    id_użytkownika INTEGER NOT NULL,
    kiedy_stworzone TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(id_zdjęcia) REFERENCES zdjęcia(id),
    FOREIGN KEY(id_użytkownika) REFERENCES użytkownicy(id)
	);

CREATE TABLE polubienia
	( 
	id_użytkownika INTEGER NOT NULL,
    id_zdjęcia INTEGER NOT NULL,
    kiedy_stworzone TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY(id_użytkownika) REFERENCES użytkownicy(id),
    FOREIGN KEY(id_zdjęcia) REFERENCES zdjęcia(id),
    PRIMARY KEY(id_użytkownika,id_zdjęcia)
    );

CREATE TABLE obserwujący
	(
    id_obserwowanego INTEGER NOT NULL,
	id_obserwującego INTEGER NOT NULL,
    kiedy_stworzony TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(id_obserwowanego) REFERENCES użytkownicy(id),
    FOREIGN KEY(id_obserwującego) REFERENCES użytkownicy(id),
    PRIMARY KEY(id_obserwowanego, id_obserwującego)
    );
    
CREATE TABLE hashtagi 
	(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	nazwa_tagu VARCHAR(255) UNIQUE,
	kiedy_stworzony TIMESTAMP DEFAULT NOW()
	);
CREATE TABLE hashtagi_zdjęcia
	(
    id_zdjęcia INTEGER NOT NULL,
    id_hashtagu INTEGER NOT NULL,
    FOREIGN KEY(id_zdjęcia) REFERENCES zdjęcia(id),
    FOREIGN KEY(id_hashtagu) REFERENCES hashtagi(id),
    PRIMARY KEY(id_zdjęcia, id_hashtagu)
	);