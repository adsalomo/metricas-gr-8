create table rol(
rol_id int not null,
nombre varchar(100) not null, -- ADMIN, FREE, CONT
primary key(rol_id)
);


create table profesion(
profesion_id int not null,
nombre varchar(200) not null,
primary key(profesion_id)
);

create table usuario(
usuario_id int not null,
nombre varchar(200) not null,
email varchar(100) not null,
pass varchar(200) not null,
rol_id int not null,
primary key(usuario_id),
foreign key(rol_id) references rol(rol_id)
);

create table usuario_profesion(
usuario_id int not null,
profesion_id int not null,
primary key(usuario_id, profesion_id),
foreign key(usuario_id) references usuario(usuario_id),
foreign key(profesion_id) references profesion(profesion_id)
);

-- CREACION ROLES
INSERT INTO rol(rol_id, nombre) values (1, 'ADMIN');
INSERT INTO rol(rol_id, nombre) values (2, 'FREE');
INSERT INTO rol(rol_id, nombre) values (3, 'CONT');

SELECT * FROM rol;

-- CREACION DE USUARIOS
INSERT INTO usuario(usuario_id, nombre, email, pass, rol_id)
VALUES (1, 'ADRIAN', 'adrian@gmail.com', '123456', 1);

INSERT INTO usuario(usuario_id, nombre, email, pass, rol_id)
VALUES (2, 'BERNARDO', 'bernardo@gmail.com', '123456', 3);

INSERT INTO usuario(usuario_id, nombre, email, pass, rol_id)
VALUES (3, 'ELIANA', 'eliana@gmail.com', '123456', 2);

SELECT u.*, r.nombre rol 
FROM usuario u, rol r 
WHERE u.rol_id = r.rol_id 
AND u.rol_id = 1;

-- CREACION PROFESION
INSERT INTO profesion(profesion_id, nombre) 
values (1, 'INGENIERO');
INSERT INTO profesion(profesion_id, nombre) 
values (2, 'AGRONOMO');
INSERT INTO profesion(profesion_id, nombre) 
values (3, 'ELECTRICISTA');

select * from profesion;

-- usuario-profesion
INSERT INTO usuario_profesion(usuario_id, profesion_id)
VALUES (3, 1);
INSERT INTO usuario_profesion(usuario_id, profesion_id)
VALUES (3, 3);

SELECT u.*, p.nombre as nombre_prof
FROM usuario u
INNER JOIN usuario_profesion up on u.usuario_id = up.usuario_id
INNER JOIN profesion p on up.profesion_id = p.profesion_id