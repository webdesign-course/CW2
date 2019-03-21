CREATE TABLE countries(
name VARCHAR(50) PRIMARY KEY,
currency VARCHAR(50),
visaForWakandaCitizens TINYINT
)ENGINE=INNODB;

CREATE TABLE cities(
name VARCHAR(50) PRIMARY KEY,
country VARCHAR(50),
FOREIGN KEY (country) REFERENCES countries(name) 
)ENGINE=INNODB;

CREATE TABLE siteType(
id INT PRIMARY KEY,
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


INSERT INTO user VALUES('Abed', 'miss.nothit@tiktok.com');
INSERT INTO user VALUES('Ahsan', 'light.san@yahoo.com');
INSERT INTO user VALUES('Ashab', 'mightypeasant@gmail.com');
INSERT INTO user VALUES('Musa', 'anime.trash@gmail.com');
INSERT INTO user VALUES('Naofumi', 'n.hate@hotmail.com');

INSERT INTO countries VALUES('Georgia', 'Iari', 1);
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




