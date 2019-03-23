DROP DATABASE travel;

CREATE DATABASE travel;

use travel;

CREATE TABLE countries(
name VARCHAR(50) PRIMARY KEY,
currency VARCHAR(50),
visaForWakanda TINYINT
)ENGINE=INNODB;

CREATE TABLE cities(
name VARCHAR(50) PRIMARY KEY,
country VARCHAR(50),
FOREIGN KEY (country) REFERENCES countries(name) 
)ENGINE=INNODB;

CREATE TABLE siteType(
id INT AUTO_INCREMENT PRIMARY KEY,
type VARCHAR(30)
)ENGINE=INNODB;

CREATE TABLE sites(
name VARCHAR(50) PRIMARY KEY,
city VARCHAR(50),
type INT,
FOREIGN KEY (city) REFERENCES cities(name),
FOREIGN KEY (type) REFERENCES siteType(id)
)ENGINE=INNODB;

CREATE TABLE visit(
reviewId INT AUTO_INCREMENT PRIMARY KEY,	
siteName VARCHAR(100),
userName VARCHAR(50),
rating INT,
FOREIGN KEY (siteName) REFERENCES sites(name) 
)ENGINE=INNODB;

CREATE TABLE user(
name VARCHAR(30) PRIMARY KEY,
email VARCHAR(30)
)ENGINE=INNODB;


INSERT INTO countries VALUES('Georgia', 'Iari',1);
INSERT INTO countries VALUES('Honduras', 'Iempira', 0);
INSERT INTO countries VALUES('Kazakhstan', 'Tenge', 1);
INSERT INTO countries VALUES('Mongolia', 'Togrog', 0);
INSERT INTO countries VALUES('Tanzania', 'Shilling', 1);

INSERT INTO cities VALUES('Tbilisi', 'Georgia');
INSERT INTO cities VALUES('Batumi', 'Georgia');
INSERT INTO cities VALUES('Tegucigalpa', 'Honduras');
INSERT INTO cities VALUES('San Pedro Sula', 'Honduras');
INSERT INTO cities VALUES('Astana', 'Kazakhstan');
INSERT INTO cities VALUES('Almaty', 'Kazakhstan');
INSERT INTO cities VALUES('UlaanBaatar', 'Mongolia');
INSERT INTO cities VALUES('Darkhan', 'Mongolia');
INSERT INTO cities VALUES('Dodoma', 'Tanzania');
INSERT INTO cities VALUES('Zanzibar', 'Tanzania');

INSERT INTO siteType (type) VALUES ('Food & Drink');
INSERT INTO siteType (type) VALUES ('Zoo');
INSERT INTO siteType (type) VALUES ('Museum');
INSERT INTO siteType (type) VALUES ('Park');
INSERT INTO siteType (type) VALUES ('Architect');


INSERT INTO sites (name,city,type) VALUES ('Almaty Zoo','Almaty',2);
INSERT INTO sites (name,city,type) VALUES ('Baiterek Tower','Astana',5);
INSERT INTO sites (name,city,type) VALUES ('Batumi City Zoo','Batumi',2);
INSERT INTO sites (name,city,type) VALUES ('Cerveceria La 20','San Pedro Sula',1);
INSERT INTO sites (name,city,type) VALUES ('Dino Park Almaty','Almaty',4);
INSERT INTO sites (name,city,type) VALUES ('Gaddafi Mosque','Dodoma',5);
INSERT INTO sites (name,city,type) VALUES ('Gandantegchinlen Monastery','UlaanBaatar',5);
INSERT INTO sites (name,city,type) VALUES ('Heart Of Batumi','Batumi',1);
INSERT INTO sites (name,city,type) VALUES ('Jozani Chwaka Bay','Zanzibar',4);
INSERT INTO sites (name,city,type) VALUES ('Kharaagiin Khiid','Darkhan',5);
INSERT INTO sites (name,city,type) VALUES ('La Tiagra National Park','Tegucigalpa',4);
INSERT INTO sites (name,city,type) VALUES ('Mtatsminda Park','Tbilisi',4);
INSERT INTO sites (name,city,type) VALUES ('Museum of Darkhan-Uul','Darkhan',3);
INSERT INTO sites (name,city,type) VALUES ('Narikala','Tbilisi',5);
INSERT INTO sites (name,city,type) VALUES ('National Museum','Astana',3);
INSERT INTO sites (name,city,type) VALUES ('Old Fort Of Zanzibar','Zanzibar',5);
INSERT INTO sites (name,city,type) VALUES ('Restaurante La Cumbre','Tegucigalpa',1);
INSERT INTO sites (name,city,type) VALUES ('Sipe','Dodoma',1);
INSERT INTO sites (name,city,type) VALUES ('Soup Bar Restaurant','UlaanBaatar',1);
INSERT INTO sites (name,city,type) VALUES ('Zizima Eco Water Park','San Pedro Sula',4);


INSERT INTO visit (siteName,userName,rating) VALUES ('Old Fort Of Zanzibar','Naofumi',2);
INSERT INTO visit (siteName,userName,rating) VALUES ('Old Fort Of Zanzibar','Ashab',4);
INSERT INTO visit (siteName,userName,rating) VALUES ('Batumi City Zoo','Musa',3);
INSERT INTO visit (siteName,userName,rating) VALUES ('Gaddafi Mosque','Musa',5);
INSERT INTO visit (siteName,userName,rating) VALUES ('Gandantegchinlen Monastery','Ahsan',5);
INSERT INTO visit (siteName,userName,rating) VALUES ('Jozani Chwaka Bay','Abed',2);
INSERT INTO visit (siteName,userName,rating) VALUES ('Jozani Chwaka Bay','Naofumi',3);
INSERT INTO visit (siteName,userName,rating) VALUES ('Mtatsminda Park','Ashab',5);
INSERT INTO visit (siteName,userName,rating) VALUES ('Narikala','Musa',3);
INSERT INTO visit (siteName,userName,rating) VALUES ('National Museum','Naofumi',2);
INSERT INTO visit (siteName,userName,rating) VALUES ('Restaurante La Cumbre','Ahsan',3);
INSERT INTO visit (siteName,userName,rating) VALUES ('Sipe','Abed',4);
INSERT INTO visit (siteName,userName,rating) VALUES ('Zizima Eco Water Park','Ahsan',3);
INSERT INTO visit (siteName,userName,rating) VALUES ('Zizima Eco Water Park','Musa',1);
INSERT INTO visit (siteName,userName,rating) VALUES ('Almaty Zoo','Naofumi',1);
INSERT INTO visit (siteName,userName,rating) VALUES ('Baiterek Tower','Abed',3);
INSERT INTO visit (siteName,userName,rating) VALUES ('Dino Park Almaty','Ashab',5);
INSERT INTO visit (siteName,userName,rating) VALUES ('Kharaagiin Khiid','Musa',3);
INSERT INTO visit (siteName,userName,rating) VALUES ('Museum of Darkhan-Uul','Abed',2);
INSERT INTO visit (siteName,userName,rating) VALUES ('Cerveceria La 20','Ahsan',4);

INSERT INTO user VALUES('Abed', 'miss.nothit@tiktok.com');
INSERT INTO user VALUES('Ahsan', 'light.san@yahoo.com');
INSERT INTO user VALUES('Ashab', 'mightypeasant@gmail.com');
INSERT INTO user VALUES('Musa', 'anime.trash@gmail.com');
INSERT INTO user VALUES('Naofumi', 'n.hate@hotmail.com');