CREATE TABLE Stud_Marks(
    Roll_no int PRIMARY KEY,
    Name VARCHAR2(100),
    Total_Marks NUMBER
);

Create table Result(
    Roll_no int primary key,
    Name varchar(30),
    Class varchar(20),
    foreign key (Roll_no) references Stud_Marks(Roll_no)
);

INSERT INTO Stud_Marks (Roll_no, Name, Total_Marks) VALUES (1, 'Priti', 970);
INSERT INTO Stud_Marks(Roll_no, Name, Total_Marks) VALUES (2, 'Arti', 1220);
INSERT INTO Stud_Marks (Roll_no, Name, Total_Marks) VALUES (3, 'Nikita', 940);
INSERT INTO Stud_Marks (Roll_no, Name, Total_Marks) VALUES (4, 'Komal', 1200);

select * from Stud_Marks;

create or replace procedure proc_Grade as
begin
    for stud in (select Roll_no,Name,Total_Marks from Stud_Marks) loop
        declare v_class varchar2(20);

        begin
        -- dbms_output.put_line(stud.Name || stud.Total_Marks);
            if stud.Total_Marks <= 1500 and stud.Total_Marks >= 990 then                
                v_class := 'distinction';
            elsif stud.Total_Marks <= 989 and stud.Total_Marks >= 900 then
                v_class := 'first class';
            elsif stud.Total_Marks <= 899 and stud.Total_Marks >= 825 then
                v_class := 'higher secondary class';
            else
                v_class := 'not categorized';
            end if;

            insert into Result (Roll_no, Name, Class) values (stud.Roll_no,stud.Name,v_class);
        end;
    end loop;
end;
/

   
execute proc_Grade;

select * from Result;