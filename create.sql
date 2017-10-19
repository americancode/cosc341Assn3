/* This script makes the tables for the Company and populates them.
* Dr. Fries COSC 341
* Author: Nathaniel Churchill
*
*/

--Create the employee table
create table employee (
    fname varchar(25),
    lname varchar(25),
    ssn char(9) primary key,
    sex char,
    salary decimal(30,2),
    super_ssn char(9),
    dno int
);

--Create the department table
create table department (
    dname varchar(25),
    dnumber int primary key,
    mgr_ssn char(9),
    mgr_start_date date
);

--Create the dept_locations table
create table dept_locations (
    dnumber int,
    dlocation varchar(25),
    primary key (dnumber, dlocation)
);

--Create the works_on table
create table works_on (
    essn char(9),
    pno int,
    hours decimal(3,1),
    primary key (essn, pno)
);

--Create the project table
create table project (
    pname varchar(25),
    pnumber int primary key,
    plocation varchar(25),
    dnum int
);

--Fill the employee table
insert into employee values('John', 'Smith', 123456789, 'M', 30000, 333445555, 5);
insert into employee values('Franklin', 'Wong', 333445555, 'M', 40000, 888665555, 5);
insert into employee values('Alicia', 'Zelaya', 999887777, 'F', 25000, 987654321, 4);
insert into employee values('Jennifer', 'Wallace', 987654321, 'F', 43000, 888665555, 4);
insert into employee values('Ramesh', 'Narayan', 666884444, 'M', 38000, 333445555, 5);
insert into employee values('Joyce', 'English', 453453453, 'F', 25000, 333445555, 5);
insert into employee values('Ahmad', 'Jabbar', 987987987, 'M', 25000, 987654321, 4);
insert into employee values('James', 'Borg', 888665555, 'M', 55000, NULL, 1);

--Fill the department table
insert into department values('Research', 5, 333445555, TO_DATE('1988-05-22', 'yyyy-mm-dd'));
insert into department values('Administration', 4, 987654321, TO_DATE('1995-01-01', 'yyyy-mm-dd'));
insert into department values('Headquarters', 1, 888665555, TO_DATE('1981-06-19', 'yyyy-mm-dd'));

--Fill the dept_locations table
insert into dept_locations values(1, 'Houston');
insert into dept_locations values(4, 'Stafford');
insert into dept_locations values(5, 'Bellaire');
insert into dept_locations values(5, 'Sugarland');
insert into dept_locations values(5, 'Houston');

--Fill the works_on tables
insert into works_on values(123456789, 1, 32.5);
insert into works_on values(123456789, 2, 7.5);
insert into works_on values(666884444, 3, 40.0);
insert into works_on values(453453453, 1, 20.0);
insert into works_on values(453453453, 2, 20.0);
insert into works_on values(333445555, 2, 10.0);
insert into works_on values(333445555, 3, 10.0);
insert into works_on values(333445555, 10, 10.0);
insert into works_on values(333445555, 20, 10.0);
insert into works_on values(999887777, 30, 30.0);
insert into works_on values(999887777, 10, 10.0);
insert into works_on values(987987987, 10, 35.0);
insert into works_on values(987987987, 30, 5.0);
insert into works_on values(987654321, 30, 20.0);
insert into works_on values(987654321, 20, 15.0);
insert into works_on values(888665555, 20, NULL);

--Fill the project table
insert into project values('ProductX', 1, 'Bellaire', 5);
insert into project values('ProductY', 2, 'Sugarland', 5);
insert into project values('ProductZ', 3, 'Houston', 5);
insert into project values('Computerization', 10, 'Stafford', 4);
insert into project values('Reorganization', 20, 'Houston', 1);
insert into project values('Newbenefits', 30, 'Stafford', 4);

--referential integrity
alter table employee
    add (constraint fk_1
    foreign key (dno) references department(dnumber),
    constraint fk_2
    foreign key (super_ssn) references employee(ssn));

alter table department
    add constraint fk_3
    foreign key (mgr_ssn) references employee(ssn);

alter table dept_locations
    add constraint fk_4
    foreign key (dnumber) references department(dnumber);

alter table project
    add constraint fk_5
    foreign key (dnum) references department(dnumber);

alter table works_on
    add (constraint fk_6
    foreign key (essn) references employee(ssn),
    constraint fk_7
    foreign key (pno) references project(pnumber));
