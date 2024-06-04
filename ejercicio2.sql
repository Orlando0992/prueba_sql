--DESARROLLO EJERCICIO 12

--FUNDAMENTOS DE BASES DE DATOS RELACIONALES

-- Creacion de tabla pregunta
create table pregunta (
    pregunta_id serial primary key,
    pregunta varchar(255),
    respuesta_correcta varchar
);

--Insercion de datos (5 preguntas)
insert into pregunta(pregunta, respuesta_correcta) values ('¿Ultima pelicula que viste?', 'Saw X: el juego del miedo');
insert into pregunta(pregunta, respuesta_correcta) values ('¿Cual es la capital de Chile?', 'Santiago de Chile');
insert into pregunta(pregunta, respuesta_correcta) values ('¿En qué ciudad se encuentra el Taj Mahal?', 'Agra, India');
insert into pregunta(pregunta, respuesta_correcta) values ('¿Qué país es conocido como la Tierra del Sol Naciente?', 'Japón');
insert into pregunta(pregunta, respuesta_correcta) values ('¿Cuál es el proceso mediante el cual las células se dividen para formar dos células hijas idénticas?', 'Mitosis');


--Visualizar informacion de la tabla
select * from pregunta;

-- Creacion de tabla usuario
create table usuario (
    usuario_id serial primary key,
    nombre varchar(255),
    edad integer
);

--Añadir 5 personas a tabla usuario
insert into  usuario (nombre, edad) values ('Pepe',30);
insert into  usuario (nombre, edad) values ('Natalia',31);
insert into  usuario (nombre, edad) values ('Felipe',28);
insert into  usuario (nombre, edad) values ('Sofia',35);
insert into  usuario (nombre, edad) values ('Maximiliano',22);

-- Visualizar informacion de la tabla
select * from usuario;

--Creacion de tabla respuesta
create table respuesta (
    respuesta_id serial primary key,
    usuario_id integer,
    pregunta_id integer,
    respuesta varchar(255),
    foreign key (usuario_id) references usuario(usuario_id),
    foreign key (pregunta_id) references pregunta(pregunta_id)
);

--Agrego informacion a la tabla
insert into respuesta (usuario_id, pregunta_id, respuesta) values (1, 1, 'Saw X: el juego del miedo');
insert into respuesta (usuario_id, pregunta_id, respuesta) values (4, 1, 'Saw X: el juego del miedo');
insert into respuesta (usuario_id, pregunta_id, respuesta) values (3, 2, 'Santiago de Chile');
insert into respuesta (usuario_id, pregunta_id, respuesta) values (5, 2, 'Santiago de Chile');
insert into respuesta (usuario_id, pregunta_id, respuesta) values (2, 2, 'Santiago de Chile');

-- Visualizar informacion de la tabla
select * from respuesta;

--Contar las respuesta correctas por usuario (R6)
select usuario.nombre, count(*) as respuestas_correctas from usuario
inner join respuesta on usuario.usuario_id = respuesta.usuario_id
inner join pregunta on respuesta.pregunta_id = pregunta.pregunta_id
where  respuesta.respuesta = pregunta.respuesta_correcta
group by usuario.usuario_id;

--Pregunta 7
--Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios tuvieron larespuesta correcta
select pregunta.pregunta, count(*) as respuestas_correctas from pregunta
inner join respuesta on pregunta.pregunta_id = respuesta.pregunta_id
where respuesta.respuesta = pregunta.respuesta_correcta
group by pregunta.pregunta_id;

--Pregunta 8
--Implementa borrado en cascada de las respuestas al borrar un usuario y borrar el primer usuario para probar la implementación.
--Alterar la tabla respuesta

alter table respuesta
drop constraint respuesta_usuario_id_fkey,
add  constraint respuesta_usuario_id_fkey 
foreign key (usuario_id) references usuario(usuario_id)
on delete cascade;

--Verificamos y borramos el primer usuario
delete from usuario where usuario_id = 1;

--Revisamos tabla usuario
select * from  usuario;

--Pregunta 9
--Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos.
alter table usuario
add constraint mayor_de_edad check (edad >= 18);

--Pregunta 10
-- Altera la tabla existente de usuarios agregando el campo email con la restricción de único.

alter table usuario
add column email varchar(50) unique;

--verificacion de informacion
select * from usuario



