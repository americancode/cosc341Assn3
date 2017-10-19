--Drop Assignment 3 tables
alter table employee
    drop constraint fk_1
    drop constraint fk_2;

alter table department
    drop constraint fk_3;

alter table dept_locations
    drop constraint fk_4;

alter table project
    drop constraint fk_5;

alter table works_on
    drop constraint fk_6
    drop constraint fk_7;

drop table employee;
drop table project;
drop table dept_locations;
drop table works_on;
drop table department;
