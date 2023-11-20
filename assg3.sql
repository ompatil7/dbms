--JAN BUDDAY
select * from Employees where month(dob) = 1;


select * from Employees E join Works W on E.empid =W.empidjoin Project P on W.projectid=P.projectid  where P.Title="ERP System";


select * from Employees e inner join Works w on e.empid = w.empid inner join Project p on w.projectid = p.projectid where p.title = 'Banking Project';

select * from Employees e join Works w on e.empid = w.empid join Project p on w.projectid = p.projectid where title = 'Banking Project';

select e.name from employees e join works w on w.empid = e.empid join project p on p.projectid = w.projectid  and p.city = e.city;

