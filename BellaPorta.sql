create table job
(
	jobId serial primary key not null,
	titleJob varchar(50) unique not null,
	jobDescription varchar(500) not null
);

create table client
(
	clientId serial primary key not null,
	clientFIO varchar(150) not null,
	clientPhone VARCHAR(12) unique not null default '+7(999)999-99-99',
	clientAdress varchar(500) not null,
	dateOfBirth date not null
);

create table payment
(
	paymentId serial primary key not null,
	paymentMethods varchar(50) not null	
);

create table suppliers
(
	suppliersId serial primary key not null,
	suppliersTitle varchar(500) unique not null,
	suppliersAdress varchar(500) not null,
	suppliersPhone VARCHAR(12) unique not null default '+7(999)999-99-99'
);

create table doorСolor
(
	doorColorId serial primary key not null,
	doorColorTitle varchar(100) unique not null
);

create table penСolor
(
	penСolorId serial primary key not null,
	penСolorTitle varchar(100) unique not null
);

create table glassСolor
(
	glassСolorId serial primary key not null,
	glassСolorTitle varchar(100) unique not null
); 

create table door
(
	doorId serial primary key not null,
	doorTitle varchar(100) not null,
	doorModel varchar(100) not null,
	doorCost money not null,
	NumberOfDoors integer not null,
	doorColor varchar(100) not null,
	doorGlass bool, 
	vendorCodeDoor varchar(10) not null
);

create table pen
(
	penId serial primary key not null,
	penTitle varchar(100) not null,
	penCost money not null,
	NumberOfPen integer not null,
	penColor varchar(100) not null,
	vendorCodePen varchar(10) not null
);

create table sale
(
	saleId serial primary key not null,
	buyer varchar(100) not null,
	salesman varchar(100) not null,
	saleDoor varchar(100) not null,
	saleDoorColor varchar(100) not null,
	salePen varchar(100) not null,
	salePenColor  varchar(100) not null,
	saleGlassColor varchar(100) not null,
	salePayment varchar(100) not null,
	saleCost money not null,
	foreign key (buyer) references client (clientFIO),
	foreign key (salesman) references employee (employeeFIO),
	foreign key (saleDoor) references door (doorId),
	foreign key (saleDoorColor) references doorСolor (doorColorId),
	foreign key (salePen) references pen (penId),
	foreign key (salePenColor) references penСolor (penСolorId),
	foreign key (saleGlassColor) references glassСolor (glassСolorId),
	foreign key (salePayment) references payment (paymentId)
);

create table employee
(
	employeeId serial primary key not null,
	employeeFIO varchar(150) not null,
	employeeImage text not null,
	serialNumber varchar(10) unique not null default 'xxxxx xxxxx',
	dateOfissue date not null,
	divisionСode varchar(7) not null default '666-666',
	employeePhone VARCHAR(12) unique not null default '+7(999)999-99-99',
	employeeAdress varchar(500) not null,
	employeeJobTitle varchar(50) unique not null,
	employeeWage money not null,
	login varchar(50) unique not null default 'xxxxxx.xxx@gmail.com',
	passwordEmployee varchar(50) unique not null,
	serialNumberEmployee varchar(4) unique not null,
	foreign key (employeeId) references client (clientId),
	foreign key (employeeJobTitle) references job (titleJob),
	foreign key (employeeId) references sale (saleId)
); 