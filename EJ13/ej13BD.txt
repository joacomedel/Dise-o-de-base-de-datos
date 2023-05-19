CREATE TABLE MECANICO (
  tipoDoc VARCHAR(10),
  nroDoc INT,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  calificacion INT,
  ciudad VARCHAR(50),
  PRIMARY KEY (tipoDoc, nroDoc)
);

CREATE TABLE PROPIETARIO (
  tipoDoc VARCHAR(10),
  nroDoc INT,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  licencia VARCHAR(20),
  ciudad VARCHAR(50),
  PRIMARY KEY (tipoDoc, nroDoc)
);

CREATE TABLE VEHICULO (
  patente VARCHAR(10),
  marca VARCHAR(50),
  modelo VARCHAR(50),
  color VARCHAR(20),
  tipoDoc VARCHAR(10),
  nroDoc INT,
  PRIMARY KEY (patente),
  FOREIGN KEY (tipoDoc, nroDoc) REFERENCES PROPIETARIO(tipoDoc, nroDoc)
);

CREATE TABLE FABRICANTE (
  cuit VARCHAR(20),
  razonSocial VARCHAR(100),
  pais VARCHAR(50),
  PRIMARY KEY (cuit)
);

CREATE TABLE PARTE (
  cuit VARCHAR(20),
  idparte INT,
  nombre_parte VARCHAR(50),
  marca VARCHAR(50),
  modelo VARCHAR(50),
  PRIMARY KEY (cuit, idparte),
  FOREIGN KEY (cuit) REFERENCES FABRICANTE(cuit)
);

CREATE TABLE ACCIDENTE (
  nroAccidente INT,
  fecha DATE,
  ciudad VARCHAR(50),
  descripcion VARCHAR(200),
  PRIMARY KEY (nroAccidente)
);

CREATE TABLE PARTICIPA (
  nroAccidente INT,
  patente VARCHAR(10),
  PRIMARY KEY (nroAccidente, patente),
  FOREIGN KEY (nroAccidente) REFERENCES ACCIDENTE(nroAccidente),
  FOREIGN KEY (patente) REFERENCES VEHICULO(patente)
);

CREATE TABLE ARREGLA (
  patente VARCHAR(10),
  fecha DATE,
  cuit VARCHAR(20),
  idparte INT,
  tipoDoc VARCHAR(10),
  nroDoc INT,
  PRIMARY KEY (patente,fecha,cuit,idparte),
  FOREIGN KEY (cuit,idparte) REFERENCES PARTE(cuit,idparte),
  FOREIGN KEY (patente) REFERENCES VEHICULO(patente),
	
  FOREIGN KEY (tipoDoc, nroDoc) REFERENCES MECANICO(tipoDoc, nroDoc)
);

INSERT INTO MECANICO (tipoDoc, nroDoc, nombre, apellido, calificacion, ciudad) VALUES
('DNI', 12345678, 'Juan', 'Perez', 8, 'Ciudad A'),
('DNI', 23456789, 'Maria', 'Lopez', 10, 'Ciudad B'),
('DNI', 34567890, 'Carlos', 'Gomez', 3, 'Ciudad C'),
('DNI', 45678901, 'Laura', 'Rodriguez', 2, 'Ciudad A'),
('DNI', 56789012, 'Pedro', 'Sanchez', 4, 'Ciudad B'),
('DNI', 67890123, 'Ana', 'Torres', 5, 'Ciudad C'),
('DNI', 78901234, 'Luis', 'Fernandez', 3, 'Ciudad A'),
('DNI', 89012345, 'Marta', 'Garcia', 2, 'Ciudad B'),
('DNI', 90123456, 'Diego', 'Martinez', 4, 'Ciudad C'),
('DNI', 12345000, 'Lucia', 'Santos', 5, 'Ciudad A');

INSERT INTO PROPIETARIO (tipoDoc, nroDoc, nombre, apellido, licencia, ciudad) VALUES
('DNI', 11111111, 'Jose', 'Gonzalez', 'ABC123', 'Neuquen'),
('DNI', 22222222, 'Julia', 'Rodriguez', 'DEF456', 'Allen'),
('DNI', 33333333, 'Daniel', 'Hernandez', 'GHI789', 'Ciudad C'),
('DNI', 44444444, 'Silvia', 'Lopez', 'JKL012', 'Ciudad A'),
('DNI', 55555555, 'Raul', 'Fernandez', 'MNO345', 'Ciudad B'),
('DNI', 66666666, 'Carolina', 'Perez', 'PQR678', 'Ciudad C'),
('DNI', 77777777, 'Jorge', 'Martinez', 'STU901', 'Ciudad A'),
('DNI', 88888888, 'Valeria', 'Gomez', 'VWX234', 'Ciudad B'),
('DNI', 99999999, 'Roberto', 'Sanchez', 'YZA567', 'Ciudad C'),
('DNI', 10000000, 'Florencia', 'Torres', 'BCD890', 'Ciudad A');

INSERT INTO VEHICULO (patente, marca, modelo, color, tipoDoc, nroDoc) VALUES
('ABC123', 'Ford', 'Focus', 'Rojo', 'DNI', 11111111),
('DEF456', 'Chevrolet', '2005', 'Negro', 'DNI', 22222222),
('GHI789', 'Toyota', 'Corolla', 'Blanco', 'DNI', 33333333),
('JKL012', 'Volkswagen', 'Golf', 'Gris', 'DNI', 44444444),
('MNO345', 'Renault', 'Clio', 'Azul', 'DNI', 55555555),
('PQR678', 'Fiat', 'Punto', 'Verde', 'DNI', 66666666),
('STU901', 'Honda', 'Civic', 'Plateado', 'DNI', 77777777),
('VWX234', 'Hyundai', 'Elantra', 'Dorado', 'DNI', 88888888),
('YZA567', 'Kia', 'Rio', 'Plateado', 'DNI', 99999999),
('BCD890', 'Peugeot', '308', 'Gris', 'DNI', 10000000);

INSERT INTO FABRICANTE (cuit, razonSocial, pais) VALUES
('12345678901', 'Fabricante A', 'Argentina'),
('23456789012', 'Fabricante B', 'Argentina'),
('34567890123', 'Fabricante C', 'Argentina'),
('45678901234', 'Fabricante D', 'Argentina'),
('56789012345', 'Fabricante E', 'Argentina'),
('67890123456', 'Fabricante F', 'Argentina'),
('78901234567', 'Fabricante G', 'País G'),
('89012345678', 'Fabricante H', 'País H'),
('90123456789', 'Fabricante I', 'País I'),
('01234567890', 'Fabricante J', 'País J');

INSERT INTO PARTE (cuit, idparte, nombre_parte, marca, modelo) VALUES
('12345678901', 1, 'Motor', 'Marca A', 'Modelo A'),
('23456789012', 2, 'Motor', 'Marca B', 'Modelo B'),
('23456789012', 3, 'Motor', 'Marca B', 'Modelo B'),
('34567890123', 3, 'Parte C', 'Marca C', 'Modelo C'),
('45678901234', 4, 'Parte D', 'Marca D', 'Modelo D'),
('56789012345', 5, 'Parte E', 'Marca E', 'Modelo E'),
('67890123456', 6, 'Parte F', 'Marca F', 'Modelo F'),
('78901234567', 7, 'Parte G', 'Marca G', 'Modelo G'),
('89012345678', 8, 'Parte H', 'Marca H', 'Modelo H'),
('90123456789', 9, 'Parte I', 'Marca I', 'Modelo I'),
('01234567890', 10, 'Parte J', 'Marca J', 'Modelo J');

INSERT INTO ACCIDENTE (nroAccidente, fecha, ciudad, descripcion) VALUES
(1, '2023-10-01', 'neuquen', 'Accidente 1'),
(2, '2023-02-02', 'Ciudad B', 'Accidente 2'),
(3, '2023-03-03', 'Ciudad C', 'Accidente 3'),
(4, '2023-04-04', 'Ciudad A', 'Accidente 4'),
(5, '2023-05-05', 'Ciudad B', 'Accidente 5'),
(6, '2023-06-06', 'Ciudad C', 'Accidente 6'),
(7, '2023-07-07', 'Ciudad A', 'Accidente 7'),
(8, '2023-08-08', 'Ciudad B', 'Accidente 8'),
(9, '2023-09-09', 'Ciudad C', 'Accidente 9'),
(10, '2023-10-10', 'Ciudad A', 'Accidente 10');

INSERT INTO PARTICIPA (nroAccidente, patente) VALUES
(1, 'ABC123'),
(2, 'DEF456'),
(3, 'GHI789'),
(4, 'JKL012'),
(5, 'MNO345'),
(6, 'PQR678'),
(7, 'STU901'),
(8, 'VWX234'),
(9, 'YZA567'),
(10, 'BCD890');

INSERT INTO ARREGLA (patente, fecha, cuit, idparte, tipoDoc, nroDoc) VALUES
('ABC123', '2023-01-01', '12345678901', 1, 'DNI', 12345678),
('DEF456', '2023-02-02', '23456789012', 2, 'DNI', 23456789),
('DEF456', '2023-02-02', '23456789012', 3, 'DNI', 23456789),
('GHI789', '2023-03-03', '34567890123', 3, 'DNI', 34567890),
('JKL012', '2023-04-04', '45678901234', 4, 'DNI', 45678901),
('MNO345', '2023-05-05', '56789012345', 5, 'DNI', 56789012),
('PQR678', '2023-06-06', '67890123456', 6, 'DNI', 67890123),
('STU901', '2023-07-07', '78901234567', 7, 'DNI', 78901234),
('VWX234', '2023-08-08', '89012345678', 8, 'DNI', 89012345),
('YZA567', '2023-09-09', '90123456789', 9, 'DNI', 90123456),
('BCD890', '2023-10-10', '01234567890', 10, 'DNI', 12345000);