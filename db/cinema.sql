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
  category_id INT4 REFERENCES prices(id) ON DELETE CASCADE,
  cash INT4 
);

CREATE TABLE screenings (
  id SERIAL4 PRIMARY KEY,
  show_date DATE,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE,
  amount_tickets INT4 CHECK (amount_tickets > 0)
);

CREATE TABLE tickets (
  id SERIAL4 PRIMARY KEY,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE,
  screening_id INT4 REFERENCES screenings(id) ON DELETE CASCADE,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  price_id INT4 REFERENCES prices(id) ON DELETE CASCADE
);

CREATE FUNCTION amount_tic(screening_id_no INT4)
RETURNS INT4
AS 
BEGIN 
  -- SELECT amount_tickets
  -- FROM screenings
  -- WHERE id = screening_id_no
  -- RETURN (amount_tickets)
  RETURN (SELECT 1)
END;

CREATE FUNCTION tickets_existing(screening_id_no INT4)
RETURNS INT4 
AS
BEGIN
  -- SELECT COUNT(id) 
  -- FROM tickets 
  -- WHERE screening_id = screening_id_no
  RETURN (SELECT 3)
END;

ALTER TABLE tickets 
ADD CONSTRAINT amount_tickets_available
CHECK (tickets_existing(1) < amount_tic(1));


-- tickets_existing(screening_id) < amount_tic
-- CREATE FUNCTION get_bal(acc_no IN NUMBER) 
--    RETURN NUMBER 
--    IS acc_bal NUMBER(11,2);
--    BEGIN 
--       SELECT order_total 
--       INTO acc_bal 
--       FROM orders 
--       WHERE customer_id = acc_no; 
--       RETURN(acc_bal); 
--     END;
-- -----------
--     create function myudf(@id int)
--     returns bit
--     as
--     begin
--         return coalesce((select top 1 1 from Table2 where ColY = @id),0)
--     end
-- -------------

--     create function dbo.CheckFunction()
--     returns int
--     as begin
--         return (select 1)
--     end

