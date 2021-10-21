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

