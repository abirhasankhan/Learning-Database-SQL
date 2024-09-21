--BRANCH Table:
--1.
insert into OfficeBranch values ( 'B005', '22 Deer Rd', 'London', 'SW1 4EH');
insert into OfficeBranch values ( 'B007', '16 Argyll St', 'Aberdeen', 'AB2 3SU');
insert into OfficeBranch values ( 'B003', '163 Main St', 'Glasgow', 'G11 9QX');
insert into OfficeBranch values ( 'B004', '32 Manse Rd', 'Bristol', 'BS99 1NZ');
insert into OfficeBranch values ( 'B002', '56 Clover Dr', 'London', 'NW10 6EU');


--Staff Table:
--2.
insert into Staff values('SL21', 'John', 'White', 'Manager', 'M', '10/01/45', 30000,'B005');
insert into Staff values('SG37', 'Ann', 'Beech', 'Assistant', 'F', '11/10/60', 12000,'B003');
insert into Staff values('SG14', 'David', 'Ford', 'Supervisor', 'M', '03/24/58', 18000,'B003');
insert into Staff values('SA9', 'Mary', 'Howe', 'Assistant', 'F', '02/19/70', 9000,'B007');
insert into Staff values('SG5', 'Susan', 'Brand', 'Manager', 'F', '06/03/40', 24000,'B003');
insert into Staff values('SL41', 'Julie', 'Lee', 'Assistant', 'F', '06/13/65', 9000,'B005');


--Client Table
--3.
 insert into Client values ('CR76', 'John', 'Kay', '0207-774-5632', 'Flat', 425, 'john.kay@gmail.com');
 insert into Client values ('CR56', 'Aline', 'Stewart', '0141-848-1825', 'Flat', 350, 'astewart@hotmail.com');
 insert into Client values ('CR74', 'Mike', 'Ritchie', '01475-392178', 'House', 750, 'mritchie01@yahoo.co.uk');
 insert into Client values ('CR62', 'Mary', 'Tregear', '01224-196720', 'Flat', 600, 'maryt@hotmail.co.uk');

--PrivateOwner Table
--4.
 insert into PrivateOwner values('CO46', 'Joe', 'Keogh', '2 Fergus Dr, Aberdeen AB2 7SX', '01224-861212','jkeogh@lhh.com');
 insert into PrivateOwner values('CO87', 'Carol', 'Farrel', '6 Achray St, Glasgow G32 9DX', '0141-357-7419','cfarrel@gmail.com');
 insert into PrivateOwner values('CO40', 'Tina', 'Murphy', '63 Well St, Glasgow G42', '0141-943-1728','tinam@hotmail.com');
 insert into PrivateOwner values('CO93', 'Tony', 'Shaw', '12 Park Pl, Glasgow G4 0QR', '0141-225-7025','tony.shaw@ark.com');

--PropertyForRent
--5.
insert into PropertyForRent values ( 'PA14', '16b Holhead', 'Aberdeen', 'AB7 5SU', 'House', 6, 650, 'CO46', 'SA9', 'B007');
insert into PropertyForRent values ( 'PL94', '6 Argyll St', 'London', 'NW2', 'Flat', 4, 400, 'CO87', 'SL41', 'B005');
insert into PropertyForRent values ( 'PG4', '6 Lawrence St', 'Glasgow', 'G11 9QX', 'Flat', 3, 350, 'CO40', '', 'B003');
insert into PropertyForRent values ( 'PG36', '2 Manor Rd', 'Glasgow', 'G32 4QX', 'Flat', 3, 375, 'CO93', 'SG37', 'B003');
insert into PropertyForRent values ( 'PG21', '18 Dale Rd', 'Glasgow', 'G12', 'House', 4, 600, 'CO87', 'SG37', 'B003');
insert into PropertyForRent values ( 'PG16', '5 Novar Rd', 'Glasgow', 'G12 9QX', 'Flat', 4, 450, 'CO93', 'SG14', 'B003');


--Viewing Table
--6.
insert into Viewing values ( 'CR56', 'PA14', '05/24/13', 'too small');
insert into Viewing values ( 'CR76', 'PG4', '04/20/13', 'too remote');
insert into Viewing values ( 'CR56', 'PG4', '05/26/13', '');
insert into Viewing values ( 'CR62', 'PA14', '05/14/13', 'no dining room');
insert into Viewing values ( 'CR56', 'PG36', '04/28/13', '');

--Registration Table
--7.
insert into Registration values ('CR76', 'B005', 'SL41' , '01/02/13');
 insert into Registration values ('CR56', 'B003', 'SG37' , '04/11/12');
 insert into Registration values ('CR74', 'B003', 'SG37' , '11/16/11');
 insert into Registration values ('CR62', 'B007', 'SA9' , '03/07/12');

commit;



















