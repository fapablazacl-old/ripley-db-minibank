CREATE OR REPLACE PROCEDURE sp_register_user (
	rut int,
	name varchar(50),
	email varchar(25),
	password varchar(10)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO users(rut, name, email, password)
	VALUES (rut, name, email, password);

	INSERT INTO accounts(rut, balance)
	VALUES (rut, 0);
END; $$
