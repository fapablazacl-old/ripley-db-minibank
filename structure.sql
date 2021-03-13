/**
 *
 */

CREATE DATABASE minibank;


create table users(
	rut INT not null,
	name VARCHAR(50) not null,
	email VARCHAR(25) not null,
	password VARCHAR(10) not null,
	primary key (rut)
);



create table accounts(
	rut INT not null,
	balance int not null,
	primary key (rut),
	
	constraint fk_account foreign key(rut) references users(rut)
);


create table movements(
	id int GENERATED ALWAYS AS IDENTITY,
	rut INT not null,
	amount int not null,
	type char not null,
	account_origin INT,
	account_destination INT ,
	primary key (id),
	
	constraint fk_account foreign key(rut) references accounts(rut)	
);
