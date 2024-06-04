--DESARROLLO EJERCICIO 1 

--FUNDAMENTOS DE BASES DE DATOS RELACIONALES

-- Creacion de tabla pelicula
create table pelicula (
    pelicula_id serial primary key,
    nombre varchar(255) not null,
    anno integer not null
);

--Insercion de datos (5 peliculas)
insert into pelicula(nombre,anno) values ('Shrek', 2001);
insert into pelicula(nombre,anno) values ('La Monja', 2018);
insert into pelicula(nombre,anno) values ('Spider-Man: lejos de casa', 2019);
insert into pelicula(nombre,anno) values ('Mi villano favorito', 2010);
insert into pelicula(nombre,anno) values ('Rapido y furioso 10', 2023);

--Visualizar informacion de la tabla
select * from pelicula;

--Creacion tabla Tag
create table  tag (
    tag_id serial primary key,
    clasificacion varchar(32) not null
);

--Insercion de datos
insert into tag(clasificacion) values ('Accion');
insert into tag(clasificacion) values ('Animacion');
insert into tag(clasificacion) values ('Aventura');
insert into tag(clasificacion) values ('Drama');
insert into tag(clasificacion) values ('Terror');

--Visualizar informacion de la tabla
select * from tag;

--Creacion de tabla intermedia que une peliculas y tags
create table pelicula_tag(
    pelicula_tag_id serial primary key,
    pelicula_id integer,
    tag_id integer,
    foreign key(pelicula_id) references pelicula(pelicula_id),
    foreign key(tag_id) references tag(tag_id)
);

-- Insercion de datos para la primera pelicula (sherk) tenga 3 tag asociados (Accion, Animacion y aventura)
insert into pelicula_tag (pelicula_id, tag_id) values (1,1);
insert into pelicula_tag (pelicula_id, tag_id) values (1,2);
insert into pelicula_tag (pelicula_id, tag_id) values (1,3);

-- Insercion de datos para la segunda pelicula (La Monja) (Drama y Terror)
insert into pelicula_tag (pelicula_id, tag_id) values (2,4);
insert into pelicula_tag (pelicula_id, tag_id) values (2,5);

--Visualizar informacion de la tabla
select * from pelicula_tag;

--Contar la cantidad de tag de las peliculas
select pelicula.nombre,
count(tag.tag_id) as numero_tags
from pelicula
left join pelicula_tag on pelicula.pelicula_id = pelicula_tag.pelicula_id
left join tag on pelicula_tag.tag_id = tag.tag_id
group by pelicula.nombre
order by numero_tags asc;

----------------------------------------------------------------------------------

--DESARROLLO EJERCICIO 2

--FUNDAMENTOS DE BASES DE DATOS RELACIONALES