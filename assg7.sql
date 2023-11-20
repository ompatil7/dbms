create table TE1(
    roll int,
    div varchar2(20),
    name varchar2(20),
    marks int
);

insert into TE1  values(1,'A','Riya',89);
insert into TE1  values(2,'A','teena',98);
insert into TE1  values(3,'A','sonu',79);
insert into TE1  values(1,'B','Rocky',55);
insert into TE1  values(2,'B','Neeta',92);
insert into TE1  values(2,'B','Anvi',82);

DECLARE
    -- Declare cursors for divisions TEA and TEB
    CURSOR tea_cursor IS
        SELECT name, marks
        FROM TE1
        WHERE div = 'A'
        ORDER BY marks DESC;
    
    CURSOR teb_cursor IS
        SELECT name, marks
        FROM TE1
        WHERE div = 'B'
        ORDER BY marks DESC;

    -- Variables to store topper details
    tea_topper_name TE1.name%TYPE;
    tea_topper_marks TE1.marks%TYPE;

    teb_topper_name TE1.name%TYPE;
    teb_topper_marks TE1.marks%TYPE;
BEGIN
    -- Open TEA cursor and fetch the first row
    OPEN tea_cursor;
    FETCH tea_cursor INTO tea_topper_name, tea_topper_marks;

    -- Display TEA division topper
    DBMS_OUTPUT.PUT_LINE('TEA Division Topper:');
    DBMS_OUTPUT.PUT_LINE('Name: ' || tea_topper_name);
    DBMS_OUTPUT.PUT_LINE('Marks: ' || tea_topper_marks);
    DBMS_OUTPUT.PUT_LINE('');

    -- Close TEA cursor
    CLOSE tea_cursor;
    -- Open TEB cursor and fetch the first row
    OPEN teb_cursor;
    FETCH teb_cursor INTO teb_topper_name, teb_topper_marks;

    -- Display TEB division topper
    DBMS_OUTPUT.PUT_LINE('TEB Division Topper:');
    DBMS_OUTPUT.PUT_LINE('Name: ' || teb_topper_name);
    DBMS_OUTPUT.PUT_LINE('Marks: ' || teb_topper_marks);
    DBMS_OUTPUT.PUT_LINE('');

    -- Close TEB cursor
    CLOSE teb_cursor;
END;

select * from TE1;
