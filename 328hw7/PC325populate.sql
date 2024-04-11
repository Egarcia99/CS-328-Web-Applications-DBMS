-- Autumn Young & Chad Bellinger
--Modified by Emilyo Garcia
--CS 328 - spring 2023
-- Feb 18 2023


delete from Customer;
delete from Event;
delete from Event_reg;
delete from Pet;
delete from Employee;
delete from Volunteer;


prompt Populating table Customer

insert into Customer
values (4111, 'Toni Collette', '123 Garden Dr');

insert into Customer
values (4222, 'Dakota Fanning', '555 Market St');

insert into Customer
values (4333, 'Alice Eve', '293 Lettuce Ln');

insert into Customer
values (4444, 'Patton Oswalt', '180 Spock St');

insert into Customer
values (4555, 'Camila Mendes', '122 Dozen Dr');

insert into Customer
values (4666, 'Aisha Dee', '826 Beth Blvd');

insert into Customer
values (4777, 'Daniel Radcliffe', '402 Mountain Ln');

insert into Customer
values (4888, 'Steve Buscemi', '340 Earth Ave');

insert into Customer
values (4999, 'Charles Melton', '300 Bella Ln');

insert into Customer
values (4000, 'Monica Byrne', '101 Actual St');


prompt Populating table Customer_phone

insert into Customer_phone
values (4111, '7078371950');

insert into Customer_phone
values (4222, '7078940295');

insert into Customer_phone
values (4222, '7079275945');

insert into Customer_phone
values (4333, '7072940572');

insert into Customer_phone
values (4333, '4055302919');

insert into Customer_phone
values (4444, '7072904920');

insert into Customer_phone
values (4555, '7072930592');

insert into Customer_phone
values (4666, '7071239050');

insert into Customer_phone
values (4777, '7071892049');

insert into Customer_phone
values (4777, '5109028399');

insert into Customer_phone
values (4777, '7072930500');

insert into Customer_phone
values (4888, '7071929499');

insert into Customer_phone
values (4999, '5102939922');

insert into Customer_phone
values (4000, '7071820499');


prompt Populating table Event

insert into Event
values (51111, 'Puppy Training 01', 'Yard 1', '07-JUN-2022');

insert into Event
values (52222, 'Pitbull Party', 'Yard 2', '10-JUN-2022');

insert into Event
values (53333, 'Senior Dog Party', 'Indoor/Outdoor Yard', '11-JUN-2022');

insert into Event
values (54444, 'Puppy Training 02', 'Yard 1', '14-JUN-2022');

insert into Event
values (55555, 'Adoption Event', 'Yard 2', '14-JUN-2022');

insert into Event
values (56666, 'Little Dog Party', 'Yard 1', '16-JUN-2022');

insert into Event
values (57777, 'Pool Party', 'Yard 1', '18-JUN-2022');

insert into Event
values (58888, 'Volunteer Training', 'Main Office', '19-JUN-2022');

insert into Event
values (59999, 'Puppy Training 03', 'Yard 1', '21-JUN-2022');

insert into Event
values (50000, 'Big Dog Party', 'Yard 2', '25-JUN-2022');

prompt Populating table Event_reg

insert into Event_reg
values (56666, 4222);

insert into Event_reg
values (57777, 4777);

insert into Event_reg
values (57777, 4111);

insert into Event_reg
values (57777, 4999);

insert into Event_reg
values (53333, 4444);

insert into Event_reg
values (51111, 4666);

insert into Event_reg
values (54444, 4666);

insert into Event_reg
values (59999, 4666);

insert into Event_reg
values (51111, 4777);

insert into Event_reg
values (50000, 4000);

insert into Event_reg
values (56666, 4444);

insert into Event_reg
values (50000, 4333);

insert into Event_reg
values (50000, 4888);

insert into Event_reg
values (56666, 4666);



prompt Populating table Pet

insert into Pet
values (611111, 'Banjo', 'Aus Cattle', 'Natures Variety', 4, 4111);

insert into Pet
values (622222, 'Pete', 'Chihuahua', 'Solid Gold', 3, 4222);

insert into Pet
values (633333, 'Zeus', 'Ger Shepherd', 'Hills Nutrition', 6, 4333);

insert into Pet
values (644444, 'Cupcake', 'Yorkshire Terrier', 'Natures Variety', 10, 4444);

insert into Pet
values (655555, 'Desdemona', 'Aus Shepherd', 'Solid Gold', 4, 4555);

insert into Pet
values (666666, 'Bella', 'Bulldog', 'Taste of the Wild', 2, 4666);

insert into Pet
values (677777, 'Manny', 'Bulldog', 'Taste of the Wild', 3, 4777);

insert into Pet
values (688888, 'Whiskey', 'Vizsla', 'Hills Nutrition', 5, 4888);

insert into Pet
values (699999, 'Reggie', 'Pitbull', 'Natures Variety', 4, 4999);

insert into Pet
values (600000, 'Toto', 'Goldendoodle', 'Solid Gold', 7, 4000);


prompt Populating table Employee

insert into Employee
values ('BP72', 'Birdie', 'Patel', 45000);

insert into Employee
values ('WF08', 'Wilson', 'Feldt', 45000);

insert into Employee
values ('AM34', 'Albie', 'Mathewson', 40000);

insert into Employee
values ('AP90', 'Aditi', 'Porcher', 50000);

insert into Employee
values ('TB87', 'Theodora', 'Becke', 45000);

insert into Employee
values ('LO10', 'Leah', 'Oliveri', 50000);

insert into Employee
values ('TS13', 'Turtle', 'Swift', 40000);

insert into Employee
values ('AH42', 'Amor', 'Hadaway', 45000);

insert into Employee
values ('LR25', 'Livy', 'Roscoe', 25000);

insert into Employee
values ('BH55', 'Barbara', 'Henrickson', 25000);


prompt Populating table Volunteer

insert into Volunteer
values ('123E', 'Erasmo', 'Croce', 45);

insert into Volunteer
values ('234T', 'Tyra', 'Read', 3);

insert into Volunteer
values ('345M', 'Morena', 'Dusek', 12);

insert into Volunteer
values ('456T', 'Theobald', 'Coupe', 39);

insert into Volunteer
values ('567S', 'Soili', 'Simpson', 70);

insert into Volunteer
values ('678L', 'Leonora', 'Ferri', 4);

insert into Volunteer
values ('789S', 'Sita', 'Tschida', 10);

insert into Volunteer
values ('890H', 'Hieronymous', 'Hyland', 56);

insert into Volunteer
values ('901L', 'Liliana', 'Bourke', 8);

insert into Volunteer
values ('012S', 'Santiago', 'Rog', 20);
