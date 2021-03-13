CREATE OR REPLACE PROCEDURE sp_transfer_funds (
	origin_rut int,
	destination_rut int,
	desired_amount int
)
LANGUAGE plpgsql
AS $$
DECLARE
	temp_balance int;
BEGIN
	temp_balance := (SELECT balance - desired_amount FROM accounts WHERE rut=origin_rut);

	IF (temp_balance < 0) THEN
		RAISE EXCEPTION 'No hay fondos suficientes en la cuenta para realizar la operacion'; 
	END IF;
	
	-- retirar fondos de la cuenta
	UPDATE accounts SET balance = balance - desired_amount WHERE rut=origin_rut;
	INSERT INTO movements (rut, amount, "type") VALUES (origin_rut, -desired_amount, 'w');

	-- traspasarlos a la otra cuenta
	UPDATE accounts SET balance = balance + desired_amount WHERE rut=destination_rut;
	INSERT INTO movements (rut, amount, "type") VALUES (destination_rut, desired_amount, 'd');
END; $$
