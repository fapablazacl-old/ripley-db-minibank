
CREATE OR REPLACE FUNCTION sp_get_movements(
    pRut INT
)
RETURNS refcursor 
LANGUAGE plpgsql
AS $$
DECLARE
    ref refcursor;
BEGIN
    OPEN ref FOR SELECT * FROM movements WHERE u.rut=pRut;
    RETURN ref;
END; $$
