CREATE TABLE cities(
name VARCHAR(50) PRIMARY KEY,
country VARCHAR(50),
FOREIGN KEY (country) REFERENCES countries(name)
)ENGINE=INNODB;

CREATE TABLE countries(
name VARCHAR(50) PRIMARY KEY,
currency VARCHAR(50)
visaForTheWakandaCitizens TINYINT 
)ENGINE=INNODB;

CREATE TABLE sites(
name VARCHAR(50) PRIMARY KEY,
city VARCHAR(50)
type INT(1),
FOREIGN KEY (city) REFERENCES cities(name),
FOREIGN KEY (type) REFERENCES siteType(id)
)ENGINE=INNODB;

CREATE TABLE siteType(
id INT(1) PRIMARY KEY,
type VARCHAR(50)
)ENGINE=INNODB;

CREATE TABLE user(
name VARCHAR(50) PRIMARY KEY,
email VARCHAR(100)
)

CREATE TABLE visit(
reviewId INT PRIMARY KEY,
siteName VARCHAR(100)
userName VARCHAR(50)
rating INT(1),
FOREIGN KEY (siteName) REFERENCES sites(name),
FOREIGN KEY (userName) REFERENCES user(name)
)ENGINE=INNODB;
