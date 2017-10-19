
/*
* Queries for assignment 3
* Dr. Fries COSC 341
* Author: Nathaniel Churchill
*
*/
pause Query 1;
select fname, lname from employee where dno = 5;

pause Query 2;
select fname, lname, dname from employee, department
    where employee.dno = department.dnumber;

pause Query 3;
select fname, lname, dname from employee, department
    where employee.dno = department.dnumber
    order by department.dname;

pause Query 4;
select fname, lname from employee, works_on
    where employee.ssn = works_on.essn
    and pno = 1
    and hours > 10
    and dno = 5;

pause Query 5;
select fname, lname from employee
    where super_ssn = 333445555;

pause Query 6;
select fname, lname from employee, dept_locations
    where employee.dno = dept_locations.dnumber
    and dept_locations.dlocation = 'Houston';

pause Query 7;
select pname, sum(works_on.hours) from project, works_on
    where project.pnumber = works_on.pno
    group by pname;

pause Query 8;
select dname, avg(employee.salary) from department, employee
    where department.dnumber = employee.dno
    group by dname;
