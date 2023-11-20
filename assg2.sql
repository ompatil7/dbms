MySQL  localhost:3306 ssl  company2  SQL > create table dept(deptno int, name varchar(50), location varchar(10),managerempid int);
Query OK, 0 rows affected (0.1455 sec)


 MySQL  localhost:3306 ssl  company2  SQL > alter table dept add primary key (deptno);
Query OK, 0 rows affected (0.1169 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  company2  SQL > create table employees(name varchar(50),empid int,adr varchar(50),dob date,doj date,gender char,salary int,deptno int);
Query OK, 0 rows affected (0.0272 sec)

 
 MySQL  localhost:3306 ssl  company2  SQL > alter table employees add foreign key (deptno) references dept(deptno);
Query OK, 0 rows affected (0.1846 sec)

Records: 0  Duplicates: 0  Warnings: 0


 MySQL  localhost:3306 ssl  company2  SQL > create table project(projectid int primary key,title varchar(50),city varchar(50));
Query OK, 0 rows affected (0.0241 sec)


 
 MySQL  localhost:3306 ssl  company2  SQL > CREATE TABLE works (
                                         ->     empid INT PRIMARY KEY,
                                         ->     projectid INT,
                                         ->     city VARCHAR(50),
                                         ->     totalhrs INT,
                                         ->     FOREIGN KEY (projectid) REFERENCES project(projectid)
                                         -> );
Query OK, 0 rows affected (0.0304 sec)
 MySQL  localhost:3306 ssl  company2  SQL > alter table employees add constraint check_gender check (gender in ('M','F'));

alter table employees add column mobnum varchar(15) after doj;
Query OK, 0 rows affected (0.0344 sec)

Records: 0  Duplicates: 0  Warnings: 0
 SQL > update employees set mobnum = '1234567890' where empid = 101;
 SQL > delete from project where title = 'Testing Project';
 SQL > select *  from employees where name like 'E%';

select * from employees where year(doj) between 2019 and 2020;


select employees.name from employees inner join dept where dept.managerempid = employees.empid; 


select * from employees order by name desc;


SELECT name, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age FROM Employees;