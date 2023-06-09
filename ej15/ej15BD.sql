
create table animal(idanimal int,
 nombre varchar(20),
 sexo varchar(9),
 fecha_nacimiento date,
 fecha_ingreso date,
 especie varchar(20),
primary key(idanimal));


create table habitat(idhabitat int,
capacidad int,
 tipo varchar(10),
primary key(idhabitat));


create table personal(tipodoc varchar(3),
 nrodoc varchar(9),
 nombre varchar(30),
 apellido varchar(30),
 fecha_ingreso date,
 genero varchar(9),
 localidad varchar(20),
 fecha_nacimiento date,
primary key(tipodoc,nrodoc));




create table veterinario(tipodoc varchar(3),
 nrodoc varchar(9),
 especialidad varchar(20),
primary key(tipodoc,nrodoc),
foreign key(tipodoc,nrodoc)references personal(tipodoc,nrodoc)on update cascade on delete cascade);



create table vive(idanimal int,
idhabitat int,
primary key(idanimal,idhabitat),
foreign key(idanimal)references animal(idanimal)on update cascade on delete restrict,
foreign key(idhabitat)references habitat(idhabitat)on update cascade on delete restrict);


create table atiende(tipodocPersonal varchar(3),
 nrodocPersonal varchar(9),
 idanimal int,
 fecha date,
 motivo varchar(20),
primary key(tipodocPersonal,nrodocPersonal,idanimal,fecha),
foreign key(tipodocPersonal,nrodocPersonal)references personal(tipodoc,nrodoc)on update cascade on delete restrict,
foreign key(idanimal)references animal(idanimal)on update cascade on delete restrict);

insert into animal(idanimal,nombre,sexo,fecha_nacimiento,fecha_ingreso,especie) values
(1,'cristina','femenino','2008-05-20','2010-09-20','águila'),
(2,'arturo','masculino','2005-04-10','2009-10-04','oso pardo'),
(3,'pepa','femenino','2005-07-24','2007-09-24','perico'),
(4,'pericles','masculino','2008-09-24','2008-09-24','perico'),
(5,'flora','femenino','2005-08-13','2007-11-24','jirafa'),
(6,'manuelita','femenino','2010-08-10','2010-08-10','tortuga terrestre'),
(7,'aruba','femenino','2013-02-12','2014-10-12','tortuga terrestre'),
(8,'juancho','masculino','2005-08-13','2007-11-24','jirafa'),
(9,'catalina','femenino','2009-04-10','2009-10-04','oso pardo'),
(10,'calva','masculino','2008-07-22','2010-08-24','águila'),
(11,'anita','femenino','2011-08-02','2011-09-02','víbora'),
(12,'loli','femenino','2011-09-02','2011-09-02','víbora'),
(13,'gaucho','masculino','2010-10-10','2011-09-02','víbora'),
(14,'fliper','masculino','2013-10-10','2014-09-02','delfin'),
(15,'voraz','masculino','2013-10-12','2014-09-22','cigueña blanca'),
(16,'viajera','femenino','2012-09-12','2014-09-22','cigueña blanca'),
(17,'clemente','masculino','2013-05-22','2014-09-22','cigueña blanca'),
(18,'clementina','femenino','2012-10-14','2013-09-22','cigueña blanca'),
(19,'jorge','masculino','2010-03-12','2010-03-12','orangután'),
(20,'lisa','femenino','2009-03-12','2009-03-12','orangután'),
(21,'quique','masculino','2006-02-05','2008-04-21','yacaré'),
(22,'quico','masculino','2006-03-05','2008-04-21','yacaré'),
(23,'cleto','masculino','1998-07-05','2000-07-27','tortuga acuática'),
(24,'acurina','femenino','1995-07-05','2000-07-27','tortuga acuática'),
(25,'gala','femenino','1993-07-05','2000-07-27','tortuga acuática');



insert into habitat(idhabitat,capacidad,tipo) values
(1,2,'terrestre'),
(2,2,'hídrido'),
(3,3,'hídrido'),
(4,4,'terrestre'),
(5,6,'terrestre'),
(6,2,'acuático'),
(7,3,'terrestre'),
(8,1,'acuático'),
(9,3,'acuático'),
(10,4,'hibrido');





insert into personal(tipodoc,nrodoc,nombre,apellido,fecha_ingreso,genero,localidad,fecha_nacimiento) values
('dni','28567123','Pedro','Guerra','2010-10-10','masculino','Neuquén', '1982-10-18'),
('dni','12345098','Juana','Avila','2003-04-20','femenino','General Roca','1965-05-30'),
('li','02345000','Luis','Lopez','2005-06-17','masculino','Cipolletti','1970-07-07'),
('dni','18897234','Tomas','Lincoln','2009-03-14','masculino','Allen','1984-06-13'),
('li','15876209','Jonhatan','Rambert','2010-08-22','masculino','Plottier','1986-10-11'),
('dni','25344207','Ana','Guerra','2009-05-15','femenino','Neuquén','1981-03-26'),
('ce','30129303','Justin','Gathlin','2014-03-20','masculino','General Roca','1987-09-08'),
('dni','22248765','Erik','Kynard','2014-08-14','masculino','Cipolletti','1977-06-27'),
('dni','13409257','Usain','Bolt','2013-05-27','masculino','Allen','1974-04-12'),
('dni','23667780','Yoana','Blake','2012-04-18','femenino','Plottier','1990-02-12'),
('ce','05256238','Cristian','Brown','2012-03-22','masculino','Neuquén','1983-02-15'),
('dni','29467888','Lucas','Nino','2013-10-09','masculino','Cinco Saltos','1989-10-02'),
('li','23456712','Mariana','Farah','2011-09-19','femenino','General Roca','1992-03-04'),
('ce','12223098','Miguel','Tisnado','2011-01-30','masculino','Cipolletti','1981-08-19'),
('dni','28777098','Diana','Chavez','2008-07-29','femenino','Plottier','1993-10-18'),
('li','38876543','Zoe','Gonzalez','2007-05-17','femenino','Allen','1995-11-11'),
('ce','09333765','Fabio','Garcia','2007-11-21','masculino','General Roca','1985-10-10'),
('dni','25612333','Raul','Rodriguez','2005-12-13','masculino','Cipolletti','1989-10-26'),
('dni','15334567','Lorena','Maida','2003-11-03','femenino','Neuquén','1990-12-31'),
('dni','05334534','Laura','Maidana','2003-04-16','femenino','General Roca','1992-07-15'),
('dni','21123233','Ramon','Fernandez','2001-03-03','masculino','Neuquén','1993-12-01'),
('dni','23456123','Renata','Lopez','2014-11-10','femenino','Plottier','1970-10-13'),
('dni','25780006','Marcos','Cruce','2013-09-21','masculino','Cinco Saltos','1979-09-30');

insert into veterinario(tipodoc,nrodoc,especialidad) values
('dni','28567123','simios'),
('dni','25344207','equinos'),
('dni','22248765','ovinos'),
('dni','29467888','bobinos'),
('dni','21123233','pequeños animales'),
('dni','25780006','anatopatología');



insert into vive(idanimal,idhabitat) values
(1,1),
(2,4),
(3,10),
(4,10),
(5,2),
(6,3),
(7,3),
(8,2),
(9,4),
(10,1),
(11,9),
(12,9),
(13,8),
(14,6),
(15,10),
(16,10),
(17,10),
(18,10),
(19,5),
(20,5),
(21,9),
(22,9),
(23,3),
(24,3),
(25,3);


insert into atiende(tipodocPersonal,nrodocPersonal,idanimal,fecha,motivo) values
('dni','28567123',19,'2014-10-09','curación herida'),
('dni','28567123',20,'2014-10-19','desparasitación'),
('dni','28567123',19,'2013-10-19','desparasitación'),
('dni','28567123',10,'2013-12-21','corte de uñas'),
('dni','28567123',17,'2013-12-21','corte de uñas'),
('dni','12345098',1,'2014-10-22','alimentación'),
('dni','12345098',1,'2014-10-23','alimentación'),
('dni','12345098',1,'2014-10-24','alimentación'),
('dni','12345098',10,'2014-10-23','alimentación'),
('dni','12345098',12,'2014-10-23','alimentación'),
('dni','12345098',14,'2014-10-25','alimentación'),
('li','02345000',1,'2014-11-01','limpieza'),
('li','02345000',2,'2014-11-01','limpieza'),
('li','02345000',3,'2014-11-01','limpieza'),
('li','02345000',4,'2014-11-01','limpieza'),
('li','02345000',5,'2014-11-02','limpieza'),
('li','02345000',6,'2014-11-02','limpieza'),
('li','02345000',7,'2014-11-02','limpieza'),
('li','02345000',8,'2014-11-03','limpieza'),
('li','02345000',9,'2013-11-03','limpieza'),
('li','02345000',10,'2012-11-03','limpieza'),
('li','02345000',11,'2014-01-01','limpieza'),
('li','02345000',12,'2014-01-01','limpieza'),
('li','02345000',13,'2014-01-01','limpieza'),
('li','02345000',14,'2014-01-01','limpieza'),
('li','02345000',15,'2014-01-02','limpieza'),
('li','02345000',16,'2014-01-05','limpieza'),
('li','02345000',17,'2014-10-05','limpieza'),
('li','02345000',18,'2013-12-03','limpieza'),
('li','02345000',19,'2013-08-03','limpieza'),
('li','02345000',20,'2012-09-13','limpieza'),
('li','02345000',21,'2012-09-13','limpieza'),
('li','02345000',22,'2012-09-13','limpieza'),
('li','02345000',23,'2012-09-25','limpieza'),
('li','02345000',24,'2012-09-30','limpieza'),
('li','02345000',25,'2012-09-24','limpieza'),
('dni','18897234',4,'2012-09-07','adiestramiento'),
('dni','18897234',6,'2012-07-07','adiestramiento'),
('dni','18897234',9,'2012-06-17','adiestramiento'),
('dni','18897234',15,'2012-04-05','adiestramiento'),
('dni','18897234',25,'2011-09-07','adiestramiento'),
('dni','18897234',18,'2011-06-17','adiestramiento'),
('dni','18897234',13,'2011-06-17','limpieza'),
('dni','18897234',17,'2011-06-17','limpieza'),
('dni','18897234',25,'2011-06-17','limpieza'),
('li','15876209',12,'2013-04-12','alimentación'),
('li','15876209',13,'2012-06-19','alimentación'),
('li','15876209',23,'2012-06-20','alimentación'),
('li','15876209',23,'2012-06-02','limpieza'),
('li','15876209',24,'2013-04-12','limpieza'),
('dni','25344207',19,'2014-11-09','curación herida'),
('dni','25344207',20,'2014-08-19','desparasitación'),
('dni','25344207',19,'2014-07-19','desparasitación'),
('dni','25344207',10,'2013-11-21','corte de uñas'),
('dni','25344207',17,'2013-10-20','corte de uñas'),
('dni','25344207',15,'2013-09-20','deshidratación'),
('dni','25344207',16,'2013-09-20','deshidratación'),
('dni','13409257',1,'2013-10-01','limpieza'),
('dni','13409257',2,'2013-10-02','limpieza'),
('dni','13409257',3,'2013-10-03','limpieza'),
('dni','13409257',4,'2013-10-01','limpieza'),
('dni','13409257',5,'2013-12-01','limpieza'),
('dni','13409257',6,'2013-12-01','limpieza'),
('dni','13409257',7,'2013-12-01','limpieza'),
('dni','13409257',8,'2013-12-01','limpieza'),
('dni','13409257',9,'2012-10-03','limpieza'),
('dni','13409257',10,'2012-09-03','limpieza'),
('dni','13409257',11,'2013-01-01','limpieza'),
('dni','13409257',12,'2013-01-01','limpieza'),
('dni','13409257',13,'2013-01-01','limpieza'),
('dni','13409257',14,'2013-01-01','limpieza'),
('dni','13409257',15,'2013-01-02','limpieza'),
('dni','13409257',16,'2013-01-05','limpieza'),
('dni','13409257',17,'2013-10-05','limpieza'),
('dni','13409257',18,'2012-12-03','limpieza'),
('dni','13409257',19,'2011-08-03','limpieza'),
('dni','13409257',20,'2011-06-13','limpieza'),
('dni','13409257',21,'2011-06-13','limpieza'),
('dni','13409257',22,'2011-05-13','limpieza'),
('dni','13409257',23,'2010-07-25','limpieza'),
('dni','13409257',24,'2010-08-30','limpieza'),
('dni','13409257',25,'2010-09-24','limpieza'),
('dni','23667780',9,'2012-06-17','adiestramiento'),
('dni','23667780',5,'2012-04-05','adiestramiento'),
('dni','23667780',9,'2011-09-07','adiestramiento'),
('dni','23667780',18,'2011-06-17','adiestramiento'),
('dni','23667780',12,'2013-04-12','alimentación'),
('dni','23667780',13,'2012-06-19','alimentación'),
('dni','23667780',23,'2012-06-20','alimentación'),
('dni','29467888',20,'2013-11-13','desparasitación'),
('dni','29467888',19,'2013-11-13','desparasitación'),
('dni','29467888',17,'2013-11-13','desparasitación'),
('dni','29467888',16,'2013-11-13','desparasitación'),
('dni','29467888',15,'2013-11-13','desparasitación'),
('li','23456712',23,'2009-07-22','limpieza'),
('li','23456712',24,'2009-08-23','limpieza'),
('li','23456712',25,'2011-09-20','limpieza'),
('ce','12223098',14,'2013-09-17','adiestramiento'),
('ce','12223098',14,'2012-06-17','adiestramiento'),
('ce','12223098',14,'2012-04-17','limpieza'),
('dni','28777098',4,'2011-06-19','alimentación'),
('dni','28777098',3,'2011-07-20','alimentación'),
('dni','28777098',3,'2011-08-20','alimentación'),
('dni','28777098',13,'2012-06-20','alimentación'),
('li','38876543',14,'2014-06-17','limpieza'),
('ce','09333765',21,'2014-05-17','limpieza'),
('ce','09333765',21,'2014-03-19','limpieza'),
('dni','25612333',2,'2013-11-21','corte de uñas'),
('dni','25612333',2,'2012-10-10','corte de uñas'),
('dni','15334567',15,'2011-06-17','adiestramiento'),
('dni','15334567',15,'2010-06-17','limpieza'),
('dni','21123233',18,'2011-07-09','curación herida'),
('dni','21123233',15,'2011-08-19','desparasitación'),
('dni','21123233',10,'2011-05-09','curación herida'),
('dni','21123233',2,'2011-11-19','desparasitación'),
('dni','25780006',23,'2012-09-20','deshidratación'),
('dni','25780006',24,'2012-09-20','deshidratación');
