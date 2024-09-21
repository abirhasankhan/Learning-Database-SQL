drop table Registration cascade constraints;
drop table Viewing cascade constraints;
drop table PropertyForRent cascade constraints;
drop table PrivateOwner cascade constraints;
drop table Client cascade constraints;
drop table Staff cascade constraints;
drop table OfficeBranch cascade constraints;


create table OfficeBranch (
    branchNo char(4),
    street varchar2(20),
    city varchar2(10),
    postcode varchar2(20),
    constraint OfficeBranch_pk primary key (branchNo)
    );
    
create table Staff (
    staffNo varchar2(10),
    fName varchar2(10),
    lName varchar2(10),
    position varchar2(10),
    sex char(1),
    DOB date,
    salary NUMBER(8,2),
    branchNo char(4),
    constraint Staff_pk primary key(staffNo),
    constraint Staff_fk foreign key (branchNo) references OfficeBranch on delete set null
    );

create table Client (
    clientNo char(4),
    fName varchar2(10),
    lName varchar2(10),
    telNo varchar2(20),
    prefType varchar2(10),
    maxRent number (6,2),
    eMail varchar2(30),
    constraint Client_pk primary key (clientNo)
    );
    
create table PrivateOwner (
    ownerNo char(4),
    fName varchar2(10),
    lName varchar2(10),
    address varchar2(40),
    telNo varchar2(20),
    eMail varchar2(30),
    constraint PrivateOwner_pk primary key(ownerNo)
    );
    
create table PropertyForRent (
    propertyNo varchar2(10),
    street varchar2(20),
    city varchar2(10),
    postcode varchar2(20),
    type varchar2(10),
    rooms number(2,0),
    rent number(6,2),
    ownerNo char(4),
    staffNo varchar2(10),
    branchNo char(4),
    constraint PropertyForRent_pk primary key(propertyNo),
    constraint PropertyForRent_fk1 foreign key(ownerNo) references PrivateOwner on delete set null,
    constraint PropertyForRent_fk2 foreign key(staffNo) references Staff on delete set null,
    constraint PropertyForRent_fk3 foreign key(branchNo) references OfficeBranch on delete cascade
    );
    
create table Viewing (
    clientNo char(4),
    propertyNo varchar2(10),
    viewDate date,
    comments varchar2(20),
    constraint Viewing_pk primary key(clientNo, propertyNo),
    constraint Viewing_fk1 foreign key (clientNo) references Client on delete cascade,
    constraint Viewing_fk2 foreign key (propertyNo) references PropertyForRent on delete set null
    );
    
    
create table Registration (
    clientNo char(4),
    branchNo char(4),
    staffNo varchar2(10),
    dateJoined date,
    constraint Registration_pk primary key(clientNo, branchNo),
    constraint Registration_fk1 foreign key (clientNo) references Client on delete cascade,
    constraint Registration_fk2 foreign key (branchNo) references OfficeBranch on delete set null,
    constraint Registration_fk3 foreign key (staffNo) references Staff on delete set null
    );
    
commit;
    