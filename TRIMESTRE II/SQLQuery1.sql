create database bd_escuela
go
use bd_escuela
go
create table cargo
(car_cod int not null primary key,
car_des varchar (50) not null
)
go
create table usuario 
(usu_cod int not null primary key,
usu_nom varchar (90) not null,
car_cod int not null references cargo
)
go

insert into cargo(car_cod, car_des) values (1,'Administrador');
insert into cargo(car_cod, car_des) values (2,'Auxiliar');
insert into cargo(car_cod, car_des) values (3,'Soporte');

insert into usuario(usu_cod, usu_nom, car_cod) values (1,'Mateo',1);
insert into usuario(usu_cod, usu_nom, car_cod) values (2,'Kevin',2);
insert into usuario(usu_cod, usu_nom, car_cod) values (3,'Carolina',3);