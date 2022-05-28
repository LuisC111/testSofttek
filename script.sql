CREATE DATABASE SOFTTEK;
USE SOFTTEK;

CREATE TABLE tipoRol(
idRol int primary key auto_increment,
nombreRol varchar (15)
);


CREATE TABLE usuario(
idUsuario int primary key auto_increment,
cedulaUsuario int (12),
nombreUsuario varchar(25),
apellidoUsuario varchar (25),
correoUsuario varchar (100),
fechaRegistro date,
idRol int,
passUsuario varchar(32),
FOREIGN KEY(idRol) REFERENCES tipoRol (idRol));



insert into tipoRol (idRol,nombreRol) 
values 
(1,'usuario'),(2,'administrador');

DELIMITER $$
 
CREATE PROCEDURE registrarUsuario
(
in cedula int(12),
in nombre varchar(25),
in apellido varchar (25),
in correo varchar (100),
in fecha date,
in idR int,
in pass varchar(32)
)
BEGIN
insert into usuario(cedulaUsuario,nombreUsuario,apellidoUsuario,correoUsuario,fechaRegistro,idRol,passUsuario) 
values(cedula,nombre,apellido,correo,fecha,idR,pass);
END

CALL registrarUsuario('1090272162','Luis Carlos','Martinez Guzman','luisomg111@gmail.com','2022-05-25','2','25d55ad283aa400af464c76d713c07ad');

CALL registrarUsuario('9755155','Harold','Ortiz Guzman','harold@gmail.com','2022-05-27','2','25d55ad283aa400af464c76d713c07ad');

CALL registrarUsuario('1002458749','Carlos Andres','Suarez Lopez','carlos@gmail.com','2021-03-21','1','25d55ad283aa400af464c76d713c07ad');

CALL registrarUsuario('10005874214','Pepe Salomon','Suarez Sanchez','pepe@gmail.com','2021-03-27','1','25d55ad283aa400af464c76d713c07ad');