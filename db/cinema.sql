DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS prices;

CREATE TABLE prices (
  id SERIAL4 PRIMARY KEY,
  category VARCHAR(255),
  price INT4
);

CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255) DEFAULT 'not specified'
);

CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  category_id INT4 REFERENCES prices(id) ON DELETE CASCADE
);

CREATE TABLE screenings (
  id SERIAL4 PRIMARY KEY,
  show_time DATE,         --year, month, and day values
  amount_tickets INT4 CHECK (amount_tickets > 0)
);

CREATE TABLE tickets (
  id SERIAL4 PRIMARY KEY,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE,
  screening_id INT4 REFERENCES screenings(id) ON DELETE CASCADE,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  price_id INT4 REFERENCES prices(id) ON DELETE CASCADE
);



