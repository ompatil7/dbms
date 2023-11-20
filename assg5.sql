CREATE TABLE area (
    radius NUMBER,
    area NUMBER
);

DECLARE
    v_rad NUMBER;
    v_ar NUMBER;
BEGIN
    FOR v_rad IN 5..9 LOOP
        v_ar := 3.14 * v_rad * v_rad;
        INSERT INTO area (radius, area)
        VALUES (v_rad, v_ar);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Inserted in table.');
END;

select * from area;