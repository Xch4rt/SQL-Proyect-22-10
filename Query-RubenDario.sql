-- Ejercicio 6: Sistema de Venta de Boletos del Teatro Nacional Rubén Darío
create database Teatro_Nacional
use Teatro_Nacional
/*
Para los eventos se necesita la fecha de realización, 
Salón  a  ocupar  (Cristales,  Salón  Principal,  Sala  Pequeña),  duración,  cantidad  de  participantes  y 
precio, el cual depende de la cantidad de personas
*/

create table Eventos(
	IdEvento int primary key identity (1,1),
	Fecha_Realizacion datetime,
	Salon varchar(10),
	Duracion time,
	Cantidad int,
	Precio float,
)

create table Ventas(
	IdVenta int primary key identity (1,1),
	Fecha_venta datetime,
	Cantidad_Boletos int
)

create table Boleto(
	IdBoleto int primary key identity (1,1)
)

create table Detalles_BCosto(
	IdDBoleto int primary key identity (1,1),
	Costo_Asiento float,
	Porcentaje_cliente float,
	Porcentaje_teatro float
)

create table Cliente(
	
)

create table Persona(
	NoCedula varchar (17) primary key,
	Nombres varchar (35),
	Apellidos varchar (45),
	Direccion varchar (75),
	Telefono int,
	Fecha_Nacimiento datetime
)

create table Entidad(
	NoRuc varchar(20) primary key,
	NoCedula varchar(17),
	Direccion varchar(75),
	Telefono int
)