CREATE TABLE ZONA (
  idzona INT PRIMARY KEY,
  ubicaciongeografica VARCHAR(100)
);
CREATE TABLE EVENTO_CLIMATOLOGICO (
  idevento INT PRIMARY KEY,
  fechainicio DATE,
  fechafin DATE,
  idzona INT,
  FOREIGN KEY (idzona) REFERENCES ZONA(idzona)
);

CREATE TABLE VIENTO (
  idevento INT,
  km_h INT,
  PRIMARY KEY (idevento),
  FOREIGN KEY (idevento) REFERENCES EVENTO_CLIMATOLOGICO(idevento)
);

CREATE TABLE LLUVIA (
  idevento INT,
  mm_minuto INT,
  PRIMARY KEY (idevento),
  FOREIGN KEY (idevento) REFERENCES EVENTO_CLIMATOLOGICO(idevento)
);

CREATE TABLE CIUDAD (
  idciudad INT PRIMARY KEY,
  nombre VARCHAR(100)
);

CREATE TABLE ACCION_DE_EMERGENCIA (
  idaccion INT PRIMARY KEY,
  descripcion VARCHAR(100),
  categoria VARCHAR(100)
);

CREATE TABLE PERSONA (
  tipodoc VARCHAR(50),
  nrodoc INT,
  nombre VARCHAR(100),
  apellido VARCHAR(100),
  genero VARCHAR(50),
  idciudad INT,
  PRIMARY KEY (tipodoc, nrodoc),
  FOREIGN KEY (idciudad) REFERENCES CIUDAD(idciudad)
);

CREATE TABLE SE_REALIZA (
  idevento INT,
  tipodoc VARCHAR(50),
  nrodoc INT,
  idaccion INT,
  PRIMARY KEY (idevento, tipodoc, nrodoc, idaccion),
  FOREIGN KEY (idevento) REFERENCES EVENTO_CLIMATOLOGICO(idevento),
  FOREIGN KEY (tipodoc, nrodoc) REFERENCES PERSONA(tipodoc, nrodoc),
  FOREIGN KEY (idaccion) REFERENCES ACCION_DE_EMERGENCIA(idaccion)
);

CREATE TABLE PERTENECE (
  idzona INT,
  idciudad INT,
  PRIMARY KEY (idzona, idciudad),
  FOREIGN KEY (idzona) REFERENCES ZONA(idzona),
  FOREIGN KEY (idciudad) REFERENCES CIUDAD(idciudad)
);


-- Insertar datos en la tabla ZONA
INSERT INTO ZONA (idzona, ubicaciongeografica) VALUES
  (1, 'Ciudad A'),
  (2, 'Ciudad B'),
  (3, 'Ciudad C'),
  (4, 'Ciudad D'),
  (5, 'Ciudad E'),
  (6, 'Ciudad F'),
  (7, 'Ciudad G'),
  (8, 'Ciudad H'),
  (9, 'Ciudad I'),
  (10, 'Ciudad J');

-- Insertar datos en la tabla CIUDAD
INSERT INTO CIUDAD (idciudad, nombre) VALUES
  (1, 'Ciudad A'),
  (2, 'Ciudad B'),
  (3, 'Ciudad C'),
  (4, 'Ciudad D'),
  (5, 'Ciudad E'),
  (6, 'Ciudad F'),
  (7, 'Ciudad G'),
  (8, 'Ciudad H'),
  (9, 'Ciudad I'),
  (10, 'Ciudad J');

-- Insertar datos en la tabla EVENTO_CLIMATOLOGICO
INSERT INTO EVENTO_CLIMATOLOGICO (idevento, fechainicio, fechafin, idzona) VALUES
  (1, '2013-01-01', '2014-01-03', 1),
  (2, '2003-02-01', '2000-02-05', 2),
  (3, '2003-03-01', '2003-03-08', 3),
  (4, '2023-04-01', '2023-04-10', 4),
  (5, '2023-05-01', '2023-05-15', 5),
  (6, '2023-06-01', '2023-06-18', 6),
  (7, '2023-07-01', '2023-07-20', 7),
  (8, '2023-08-01', '2023-08-25', 8),
  (9, '2023-09-01', '2023-09-30', 9),
  (10, '2023-10-01', '2023-10-31', 10);

-- Insertar datos en la tabla VIENTO
INSERT INTO VIENTO (idevento, km_h) VALUES
  (1, 50),
  (2, 40),
  (3, 60),
  (4, 70),
  (9, 58),
  (10, 42);

-- Insertar datos en la tabla LLUVIA
INSERT INTO LLUVIA (idevento, mm_minuto) VALUES
  (1, 5),
  (2, 8),
  (3, 12),
  (4, 15),
  (5, 6),
  (6, 10),
  (7, 20);

-- Insertar datos en la tabla ACCION_DE_EMERGENCIA
INSERT INTO ACCION_DE_EMERGENCIA (idaccion, descripcion, categoria) VALUES
  (1, 'Evacuación de la zona', 'Evacuación'),
  (2, 'Distribución de suministros', 'Suministros'),
  (3, 'Rescate de personas atrapadas', 'Rescate'),
  (4, 'Cierre de carreteras', 'Tráfico'),
  (5, 'Asistencia médica', 'Salud'),
  (6, 'Restablecimiento del suministro eléctrico', 'Electricidad'),
  (7, 'Comunicación de emergencia', 'Comunicación'),
  (8, 'Coordinación de refugios', 'Refugios'),
  (9, 'Prevención de incendios', 'Prevención'),
  (10, 'Control de inundaciones', 'Inundaciones');

-- Insertar datos en la tabla PERSONA
INSERT INTO PERSONA (tipodoc, nrodoc, nombre, apellido, genero, idciudad) VALUES
  ('DNI', 123, 'Juan', 'Pérez', 'Masculino', 1),
  ('DNI', 456, 'María', 'Gómez', 'Femenino', 4),
  ('DNI', 789, 'Carlos', 'López', 'Masculino', 1),
  ('DNI', 987, 'Laura', 'Torres', 'Femenino', 2),
  ('DNI', 654, 'Pedro', 'Rodríguez', 'Masculino', 5),
  ('DNI', 321, 'Ana', 'Sánchez', 'Femenino', 6),
  ('DNI', 951, 'Miguel', 'García', 'Masculino', 7),
  ('DNI', 753, 'Luisa', 'Fernández', 'Femenino', 8),
  ('DNI', 852, 'Sofía', 'Martínez', 'Femenino', 9),
  ('DNI', 159, 'Diego', 'Hernández', 'Masculino', 9);

-- Insertar datos en la tabla SE_REALIZA
INSERT INTO SE_REALIZA (idevento, tipodoc, nrodoc, idaccion) VALUES
  (1, 'DNI', 123, 1),
  (1, 'DNI', 789, 2),
  (3, 'DNI', 789, 3),
  (4, 'DNI', 987, 4),
  (5, 'DNI', 654, 5),
  (6, 'DNI', 321, 6),
  (7, 'DNI', 951, 7),
  (8, 'DNI', 753, 8),
  (9, 'DNI', 852, 9),
  (10, 'DNI', 159, 10);

-- Insertar datos en la tabla PERTENECE
INSERT INTO PERTENECE (idzona, idciudad) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);
