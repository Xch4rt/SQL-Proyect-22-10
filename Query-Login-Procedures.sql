use Teatro_Nacional
-- Creando usuarios
go
Create login adminAriel with password = 'ArSi23.2021!'
go
Create Login adminPablo with password = 'PaGu23.2021#'
go

sp_adduser adminAriel, adminAriel

sp_adduser adminPablo, adminPablo


-- Creando Login

Create table Usuario (IdUsuario int primary key identity(1,1),
usuario varchar(80),
contraseña varchar(80),
rol varchar(80),
estado varchar(80))


Create table Usuario (IdUsuario int primary key identity(1,1),
usuario varchar(80),
contraseña varchar(80),
rol varchar(80),
estado varchar(80))
--- Procedimiento almacenado para insertar el usuario

Create procedure [dbo].[Insertar_Usuario]
 @usuario varchar(50), @contraseña varchar(50), @rol varchar(50)
 as
 insert into Usuario(usuario, contraseña, rol, Estado) values
 (@usuario, ENCRYPTBYPASSPHRASE( @contraseña,  @contraseña), @rol, 'Habilitado')

 --insert into Usuario(usuario, contraseña, rol, estado)
 --values ('uni', 'sistemas2021', 'Administrador')

 Execute dbo.Insertar_Usuario 'Ariel.exe', '1234prueba', 'Administrador'
 Select * from Usuario
 update Usuario set estado = 'Habilitado' where IdUsuario = 1




 ----------------------------------------
Create procedure [dbo].[Validar_Acceso]
@usuario varchar(50),
@contraseña varchar(50)
as
if exists (Select usuario from Usuario
            where  cast (DECRYPTBYPASSPHRASE(@contraseña, contraseña) as Varchar(100)) = @contraseña
			 and usuario = @Usuario and Estado = 'Habilitado' )
			 select 'Acceso Exitoso' as Resultado, c.primernombre +' '+c.primerapellido, rol
			 from Usuario u
			 inner join Colaborador c
			 on c.IdColaborador = u.IdColaborador
			  where  cast (DECRYPTBYPASSPHRASE(@contraseña, u.contraseña) as Varchar(100)) = @contraseña
			 and u.usuario = @Usuario and u.Estado = 'Habilitado'

			 else
			 Select 'Acceso Denegado' as Resultado


			 Execute dbo.Validar_Acceso 'uni', 'sistemas2021'

			 Select @@SERVERNAME


