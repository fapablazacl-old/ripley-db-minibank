
CREATE OR REPLACE FUNCTION sp_get_user(
    pRut INT
)
RETURNS refcursor 
LANGUAGE plpgsql
AS $$
DECLARE
    ref refcursor;
BEGIN
    OPEN ref FOR SELECT * FROM users u INNER JOIN accounts a ON u.rut=a.rut WHERE u.rut=pRut;
    RETURN ref;
END; $$
