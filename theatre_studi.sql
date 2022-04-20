DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS showing_viewer;
DROP TABLE IF EXISTS viewer;
DROP TABLE IF EXISTS showing;
DROP TABLE IF EXISTS film;
DROP TABLE IF EXISTS room;
DROP TABLE IF EXISTS theatre;
DROP TABLE IF EXISTS rate;



CREATE OR REPLACE TABLE theatre (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    postcode INTEGER NOT NULL
)    
ENGINE = InnoDB;

CREATE OR REPLACE TABLE film (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL    
)
ENGINE = InnoDB;

CREATE OR REPLACE TABLE room (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    seats INTEGER NOT NULL , -- number of seats in the room
    room VARCHAR(255) NOT NULL,
    theatre_id INTEGER UNSIGNED,
    FOREIGN KEY (theatre_id) REFERENCES theatre(id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE OR REPLACE TABLE showing (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    schedule DATETIME NOT NULL, 
    reserved_seats INTEGER NOT NULL, 
    room_id INTEGER UNSIGNED,
    film_id INTEGER UNSIGNED,
    FOREIGN KEY (room_id) REFERENCES room(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (film_id) REFERENCES film(id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE OR REPLACE TABLE viewer (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    password VARCHAR(255),
    debit_card BIGINT UNSIGNED,
    seat_number INTEGER, 
    --numero du.des sieges
    places INTEGER NOT NULL 
    -- nombre de places
)ENGINE = InnoDB;

CREATE OR REPLACE TABLE showing_viewer (
    showing_id INTEGER UNSIGNED NOT NULL ,
    viewer_id INTEGER UNSIGNED NOT NULL ,
    FOREIGN KEY (showing_id) REFERENCES showing(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (viewer_id) REFERENCES viewer(id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE OR REPLACE TABLE rate (
    category VARCHAR(50) NOT NULL PRIMARY KEY,
    price FLOAT NOT NULL
)ENGINE = InnoDB;

CREATE OR REPLACE TABLE user (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    theatre_id INTEGER UNSIGNED, -- id du cinema pour lequel le user a des droits
    FOREIGN KEY (theatre_id) REFERENCES theatre(id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE USER IF NOT EXISTS 'db_admin'@'%' IDENTIFIED BY '$2y$10$MdHkfmo6yV3ze4IpDF4O1ehUbjtnZUpDHq5ilT2dtp0XpMYcRtKeG';

GRANT ALL PRIVILEGES ON *.* TO 'db_admin'@'%';
CREATE USER IF NOT EXISTS 'db_datawriter'@'%' IDENTIFIED BY '$2y$10$f5bLjvYi7peFLRYRLB7EeO3a/u8ey9BdVVYzi9zNpeGDqZrHYCjii';
GRANT DELETE on theatre_studi.room TO 'db_datawriter'@'%';
GRANT DELETE on theatre_studi.showing TO 'db_datawriter'@'%';
GRANT INSERT on theatre_studi.room TO 'db_datawriter'@'%';
GRANT INSERT on theatre_studi.showing TO 'db_datawriter'@'%';
GRANT UPDATE on theatre_studi.room TO 'db_datawriter'@'%';
GRANT UPDATE on theatre_studi.showing TO 'db_datawriter'@'%';
GRANT SELECT on theatre_studi.* TO 'db_datawriter'@'%';
CREATE USER IF NOT EXISTS 'db_readonly'@'%' IDENTIFIED BY '$2y$10$DmVF6rFeN7bEFIXEbo05o.bJbk4jfMcLyUn8Ykhlm3kaB7O0Ua/lG';
GRANT SELECT on theatre_studi.* TO 'db_datawriter'@'%';

--SELECT * FROM mysql.user;



insert into theatre (name, address, city, postcode) values ('Horseweed', '8517 Boyd Lane', 'Ina', 33354),('Holly Osmanthus', '08 Rieder Trail', 'Kréstena', 65616),('Burgess'' Skin Lichen', '03 Heffernan Alley', 'Debrecen', 14032),('Lavender', '55796 Reinke Way', 'Il’inskiy Pogost', 12511),('Waterwheel Plant', '6 Sachtjen Road', 'Göteborg', 45782),('Darrow''s Flavopunctelia Lichen', '4278 High Crossing Park', 'Jardia', 29208),('Spathulate Candle Snuffer Moss', '122 Elgar Place', 'Finzes', 92997),('Yankeeweed', '78 Pine View Point', 'Haoguantun', 99937),('Luna County Globemallow', '742 Armistice Drive', 'Mandaon', 42965),('San Luis Lupine', '2 Gateway Street', 'Bila', 50143);


--SELECT * FROM theatre;

insert into film (title) values ('Gabriel'),('In the Line of Fire'),('Shock Doctrine, The'),('Clifford'),('Short Circuit'),('Spring Break'),('Rebel Without a Cause'),('Mo'),('Manny'),('Men Who Tread on the Tiger''s Tail, The (Tora no o wo fumu otokotachi)');

--SELECT * FROM film;


insert into room (seats, room, theatre_id) values (188, 12, 8),(seats, room, theatre_id),(227, 12, 1),(seats, room, theatre_id),(80, 13, 5),(seats, room, theatre_id) , (53, 8, 7),(seats, room, theatre_id) , (330, 3, 7),(seats, room, theatre_id),(128, 5, 8),(seats, room, theatre_id),(88, 14, 2),(seats, room, theatre_id),(156, 18, 7),(seats, room, theatre_id),(360, 2, 3),(seats, room, theatre_id),(276, 18, 8);
--SELECT * FROM room;

insert into showing (schedule, reserved_seats, room_id, film_id) values ('2021-11-29 13:53:58', 8, 1, 4), ('2021-09-12 11:55:17', 26, 7, 1), ('2021-05-10 21:20:29', 19, 9, 2), ('2022-02-01 09:40:19', 29, 9, 7), ('2021-06-24 10:08:48', 1, 3, 9), ('2021-11-03 08:09:48', 35, 4, 8), ('2022-04-06 10:41:21', 6, 2, 1), ('2022-04-10 00:25:24', 34, 2, 9), ('2021-11-28 12:24:47', 36, 1, 10), ('2022-03-07 17:43:43', 8, 4, 8);
--SELECT * FROM showing;

insert into viewer (name, first_name, email, password, debit_card, seat_number, places) values ('Wankel', 'Maëlys', 'ewankel0@creativecommons.org', 'KUVT6Xa', '3569044418408857', null, 5),('Kock', 'Björn', 'ekock1@china.com.cn', 'iJPVX62SwMw', '3540698747883884', null, 1),('Aspinwall', 'Léonore', 'aaspinwall2@wordpress.com', 'eDGSc9tC', '56022511043703653', null, 3),('Hubble', 'Athéna', 'rhubble3@i2i.jp', 'jsZerGT', '372301585646245', null, 3),('Boncore', 'Marie-ève', 'fboncore4@jalbum.net', 'WHah1rRb', '4905380216894386539', null, 4),('Kort', 'Marie-thérèse', 'bkort5@fastcompany.com', 'widthzlCwNd', '3568334426623816', null, 3),('Sollner', 'André', 'msollner6@seesaa.net', 'u5rRWHCb', '3576159276801760', null, 3),('Tawton', 'Renée', 'etawton7@jigsy.com', 'jBy9Il3Bn', '3571531242737788', null, 3),('Bodham', 'Mélanie', 'hbodham8@wp.com', 'hx9kYSv', '6375850433301373', null, 5),('Gemlbett', 'Séverine', 'egemlbett9@wordpress.org', 'Auv6nbRl', '3560950126174657', 36, 2);

--SELECT * FROM viewer;

INSERT INTO rate (category, price) VALUES ('Plein tarif', 9.20), ('Étudiant', 7.60), ('Moins de 14 ans', 5.90);

--SELECT * FROM rate;

insert into user (name, first_name, role, password, theatre_id) values ('Clarae', 'Håkan', 'db_admin', 'XKujdsV705', null), ('Rangell', 'Inès', 'db_admin', '9blFgeaXADq', null), ('Mattimoe', 'Måns', 'db_admin', 'KLLThj', null), ('Rowntree', 'Liè', 'db_datawriter', 'kLS3iwC0AM', 1), ('Shrimplin', 'Cunégonde', 'db_datawriter', '86FAnr31', 10), ('Bindley', 'Lèi', 'db_datawriter', '1HNXppBV', 4), ('Whitloe', 'Vénus', 'db_datawriter', 'J0Jd4YPJ8Vd', 6), ('Karslake', 'Esbjörn', 'db_datawriter', 'cfbb7E', 7), ('Andrioni', 'Märta', 'db_datawriter', '2ChFwPgE', 9), ('Tather', 'Aurélie', 'db_datawriter', 'Mvpi0dP6OI', 3);

--SELECT * FROM user;


