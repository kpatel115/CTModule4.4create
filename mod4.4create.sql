-- Creating Car Dealership ERD 
-- table 1 Customer
create table c_customer (
	customer_id SERIAL primary key,
	fname VARCHAR(150),
	lname VARCHAR(150),
);
-- table 2 staff
create table staff (
	staff_id SERIAL primary key,
	staff_name VARCHAR(150),
	staff_type VARCHAR(100),
);
-- table 3 Cars
create table cars (
	car_vin SERIAL primary key,
	car_use VARCHAR(150),
	car_model VARCHAR(150),
	car_make VARCHAR(200),
	customer_id INTEGER not null,
	staff_id INTEGER not null,
	foreign key(customer_id) references c_customer(customer_id),
	foreign key(staff_id) references staff(staff_id),
);

-- table 4 Service
create table service (
	service_id SERIAL primary key,
	service_parts_req VARCHAR(100),
	service_type VARCHAR(200),
	car_vin INTEGER not null,
	staff_id INTEGER not null,
	foreign key(car_vin) references cars(car_vin),
	foreign key(staff_id) references staff(staff_id),
);

-- table 5 Sales
create table sales (
	sales_id SERIAL primary key,
	sales_price INTEGER,
	car_vin INTEGER not null,
	staff_id INTEGER not null,
	foreign key(car_vin) references cars(car_vin),
	foreign key(staff_id) references staff(staff_id),
);

-- table 6 Invoice
create table invoice (
	invoice_id SERIAL primary key,
	invoice_amount INTEGER,
	staff_id INTEGER not null,
	sales_id INTEGER not null,
	service_id INTEGER not null,
	customer_id INTEGER not null,
	foreign key(staff_id) references staff(staff_id),
	foreign key(sales_id) references sales(sales_id),
	foreign key(service_id) references service(service_id),
	foreign key(customer_id) references c_customer(customer_id)
);
