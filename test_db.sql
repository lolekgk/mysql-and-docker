CREATE TABLE IF NOT EXISTS country (
	country_id INT AUTO_INCREMENT PRIMARY KEY,
	country VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS city (
	city_id INT AUTO_INCREMENT PRIMARY KEY,
	city VARCHAR(255),
	country_id INT NOT NULL,
	FOREIGN KEY (country_id)
		REFERENCES country (country_id)
);


CREATE TABLE IF NOT EXISTS address (
	address_id INT AUTO_INCREMENT PRIMARY KEY,
	address VARCHAR(255) NOT NULL,
	address2 VARCHAR(255),
	city_id INT NOT NULL,
	postal_code VARCHAR(7) NOT NULL,
	phone VARCHAR(12) NOT NULL,
	FOREIGN KEY (city_id)
		REFERENCES city (city_id)
	);


CREATE TABLE IF NOT EXISTS participator (
	participator_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(25) NOT NULL,
	surname VARCHAR(30) NOT NULL,
	email VARCHAR(50),
	address_id INT NOT NULL,
	FOREIGN KEY (address_id)
		REFERENCES address (address_id)
);


CREATE TABLE IF NOT EXISTS events (
	event_id INT AUTO_INCREMENT PRIMARY KEY,
	event_name VARCHAR(50) UNIQUE NOT NULL,
	start_date TIMESTAMP NOT NULL,
	end_date TIMESTAMP NOT NULL,
	participator_id INT NOT NULL,
	address_id INT NOT NULL,
	FOREIGN KEY (participator_id)
		REFERENCES participator (participator_id),
	FOREIGN KEY (address_id)
		REFERENCES address (address_id)
);