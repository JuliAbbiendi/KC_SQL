create schema practica_julietaabbiendi authorization vjvaldrj


create table practica_julietaabbiendi.car_group(
	id_group varchar (10) not null, --PK
	name_group varchar (25) not null,
	constraint car_group_pk primary key (id_group)
);

create table practica_julietaabbiendi.car_brands(
	id_brand varchar (10) not null, --PK
	id_group varchar (10) not null, --FK
	name_brand varchar (25) not null,
	constraint id_brand_pk primary key (id_brand),
	constraint id_group_fk foreign key (id_group)
	references practica_julietaabbiendi.car_group (id_group)
);


create table practica_julietaabbiendi.car_models (
	id_model varchar(10) not null, --PK
	id_brand varchar(10) not null, --FK 
	name_model varchar(10) not null,
	constraint id_model_pk primary key (id_model),
	constraint id_brand_fk foreign key (id_brand)
	references practica_julietaabbiendi.car_brands (id_brand)
);


create table practica_julietaabbiendi.currency (
	id_currency varchar (10) not null, --PK
	description varchar (25) not null,
	constraint id_currency_pk primary key (id_currency)
);


create table practica_julietaabbiendi.colors(
	id_color varchar (10) not null, --PK
	name_color varchar (25) not null,
	constraint id_color_pk primary key (id_color)
);


create table practica_julietaabbiendi.insurer (
	id_insurer varchar (10) not null, --PK
	insurer_company varchar(25) not null,
	constraint id_insurer_pk primary key (id_insurer)
);


create table practica_julietaabbiendi.cars (
	id_car varchar (10) not null, -- PK
	id_model varchar (10) not null, --FK
	id_color varchar (10) not null, -- FK
	total_kms integer not null,
	date_purchase date not null,
	id_insurer varchar (10) not null, --FK
	policy_number varchar (25) not null,
	car_number_plate varchar (25) not null,
	constraint id_car_pk primary key (id_car),
	constraint id_model_fk foreign key (id_model)
	references practica_julietaabbiendi.car_models (id_model),
	constraint id_color_fk foreign key (id_color)
	references practica_julietaabbiendi.colors (id_color),
	constraint id_insurer_fk foreign key (id_insurer)
	references practica_julietaabbiendi.insurer (id_insurer)
);


create table practica_julietaabbiendi.revisions (
	date_revision date not null, --PK
	id_car varchar (10) not null, --PK, FK
	kms_revision integer not null,
	cost_revision float not null,
	id_currency varchar(10) not null, --FK
	constraint revisions_pk primary key (date_revision, id_car),
	constraint id_car_fk foreign key (id_car)
	references practica_julietaabbiendi.cars (id_car),
	constraint id_currency_fk foreign key (id_currency)
	references practica_julietaabbiendi.currency (id_currency)
);


insert into practica_julietaabbiendi.colors 
(id_color, name_color)
values
(01,'Black'),
(02,'White'),
(03, 'Red'),
(04, 'Light Blue'),
(05, 'Dark Blue'),
(06,'Light Grey'),
(07, 'Dark Grey');


insert into practica_julietaabbiendi.insurer
(id_insurer, insurer_company)
values
(01, 'Mapfre'),
(02,'Allianz'),
(03, 'AXA '),
(04,'Helvetia'),
(05,'Qualitas Auto');



insert into practica_julietaabbiendi.currency
(id_currency, description)
values
('EUR', 'Euro'),
('USD', 'US Dollar'),
('ARS', 'Argentine pesos'),
('AUD','Australian Dollar'),
('GBP', 'Pound Sterling');


insert into practica_julietaabbiendi.car_group 
(id_group, name_group)
values
(01,'VAN'),
(02, 'PSA Group'),
(03, 'Hyundai'),
(04, 'General Motors'),
(05, 'FCA');



insert into practica_julietaabbiendi.car_brands 
(id_brand, id_group, name_brand)
values
(01, 01, 'Audi'),
(02, 01, 'Volkswagen'),
(03, 01, 'Seat'),
(04, 02, 'Peugeot'),
(05, 02, 'Citroen'),
(06, 04, 'Chevrolet'),
(07, 04, 'Cadillac');



insert into practica_julietaabbiendi.car_models 
(id_model, id_brand, name_model)
values
(01, 01, 'A1'),
(02, 01, 'TT'),
(03, 01, 'Q8'),
(04, 05, 'C4 Picasso'),
(05, 05, 'C3'),
(06, 03, 'Ibiza'),
(07, 03, 'Leon'),
(08, 06, 'Cruze'),
(09, 06, 'Orlando'),
(10, 04, '208');


insert into practica_julietaabbiendi.cars 
(id_car, id_model, id_color, total_kms, date_purchase, id_insurer, policy_number, car_number_plate)
values
(001, 01, 02, 5000, '2021/12/10', 02, '789123A', '6644 HJS'),
(002, 07, 03, 8000, '2021/04/22', 01, '456123B', '7894 JJJ'),
(003, 08, 06, 60000, '2016/03/20', 05, '753621C', '9977 IKJ'),
(004, 04, 07, 18000, '2020/01/30', 01, '546879D', '4163 ABC'),
(005, 06, 02, 10000, '2019/02/15', 03, '876411X', '8525 DEF'),
(006, 03, 01, 2000, '2022/10/01', 03, '657125Z', '7894 ORL');



insert into practica_julietaabbiendi.revisions 
(date_revision, id_car, kms_revision, cost_revision, id_currency)
values	
('2018/03/20', 003, 40000, 150, 'EUR'),
('2020/03/20', 003, 50000, 200, 'EUR'),
('2020/08/15', 005, 5000, 100, 'EUR'),
('2022/02/10', 004, 15000, 200, 'EUR'),
('2022/06/07', 002, 5000, 100, 'EUR');
