-- Ejercicio 6: Sistema de Venta de Boletos del Teatro Nacional Rubén Darío
create database Teatro_Nacional
use Teatro_Nacional
/*
Para los eventos se necesita la fecha de realización, 
Salón  a  ocupar  (Cristales,  Salón  Principal,  Sala  Pequeña),  duración,  cantidad  de  participantes  y 
precio, el cual depende de la cantidad de personas
*/


create table Eventos(
	IdEvento int primary key ,
	Fecha_Realizacion datetime,
	Salon varchar(10),
	Duracion time,
	Cantidad int,
	Precio float,
	-- FKs
	IdCliente int foreign key references Cliente(IdCLiente)
	IdBoleto int foreign key references Boleto(IdBoleto),
	IdSalon int foreign key references Salon(IdSalon)
)

create table Boleto(
	IdBoleto int primary key
)

create table Ventas(
	IdVentas int primary key,
	Fecha_Venta datetime,
	Cantidad_Boletos int,
	-- Fks
	IdBoleto int foreign key references Boleto(IdBoleto)
)

create table Detalles_Costos(
	IdDBoleto int primary key ,
	CostoAsiento float,
	Porcentaje_Cliente float, 
	Porcentaje_Teatro float
)


create table Salon(
	IdSalon int primary key ,
	TipoSalon varchar (40)
)

create table Detalles_BCosto(
	IdDBoleto int primary key ,
	Costo_Asiento float,
	Porcentaje_cliente float,
	Porcentaje_teatro float
)

create table Cliente(
	IdCliente int primary key ,
	--Fks
	NoCedula varchar(17) foreign key references Persona(NoCedula),
	NoRuc varchar(20) foreign key references Entidad(NoRuc)
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
	Direccion varchar(75),
	Telefono int,
	--Fks
	NoCedula varchar(17) foreign key references Representante(NoCedula),
)

create table Servicio(
	IdServicio int primary key ,
	TipoServicio varchar (35),
	Precio float
)

create table DetalleServicio(
	Descripcion varchar (100),
	Cantidad int
	--Fks
	IdServicio int foreign key references Servicio(IdServicio)
)

create table Representante(
	NoCedula varchar(17) primary key,
	Nombres varchar (35),
	Apellidos varchar (45),
	Direccion varchar (75),
	Telefono int,
	Fecha_Nacimiento datetime
)

create table Factura(
	IdFactura int primary key ,
	PrecioAlquiler float,
	SubTotal float,
	Total float,
	--Fks
	IdServicio int foreign key references Servicio(IdServicio)
)

create table Mantenimiento(
	IdMantenimiento int primary key ,
	-- Fks
	IdSalon int foreign key references Salon(IdSalon),
	IdEmpresaM int foreign key references EmpresaMantenimiento(IdEmpresaM),
	IdSupervisor int foreign key references SupervisorMantenimiento(IdSupervisor)
)

create table SupervisorMantenimiento (
	IdSupervisor int primary key,
	Nombres varchar (35),
	Apellidos varchar (35),
	Telefono int
)

create table EmpresaMantenimiento(
	IdEmpresaM int primary key ,
	NombreEmpresa varchar (45),
	Direccion varchar (100),
	Telefono int
)