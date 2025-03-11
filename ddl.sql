create database if not exists sakilacampus;
use sakilacampus;

create table if not exists actor(
id_actor int primary key,
nombre varchar(45),
apellidos varchar(45),
ultima_actualizacion timestamp
);

create table if not exists pais(
id_pais int primary key,
nombre varchar(50),
ultima_actualizacion timestamp
);

create table if not exists ciudad (
id_ciudad int primary key,
nombre varchar(50),
id_pais int,
ultima_actualizacion timestamp,
foreign key  (id_pais) references pais (id_pais)
);


create table if not exists direccion (
id_direccion int primary key,
direccion varchar(50),
direccion2 varchar(50),
distrito varchar(20),
id_ciudad int,
codigo_postal varchar(10),
telefono varchar(20),
ultima_actualizacion timestamp,
foreign key (id_ciudad) references ciudad(id_ciudad)
);

-- verificar empleado almacen


create table if not exists idioma(
id_idioma int primary key,
nombre char(20),
ultima_actualizacion timestamp
);

create table if not exists pelicula (
id_pelicula int primary key,
titulo varchar(255),
descripcion text,
anyo_lanzamiento year,
id_idioma int,
id_idioma_original int,
duracion_alquiler int,
rental_date decimal(4,2),
duracion int,
replacement_cost decimal(5,2),
clasificacion enum("G","PG","PG-13","R","NC-17"),
caracteristicas_especiales 
set("Trailers","Commentaries","Deleted Scenes","Behind the Scenes"),
ultima_actualizacion timestamp,
foreign key(id_idioma) references idioma(id_idioma),
foreign key(id_idioma_original) references idioma(id_idioma)
);

create table if not exists pelicula_actor(
id_actor int,
id_pelicula int,
ultima_actulizacion timestamp,
foreign key (id_actor) references actor(id_actor),
foreign key (id_pelicula) references pelicula(id_pelicula)
);


create table if not exists categoria(
id_categoria int primary key,
nombre varchar(25),
ultima_actualizacion timestamp
);

create table if not exists pelicula_categoria(
id_pelicula int,
id_categoria int,
ultima_actualizacion timestamp,
foreign key (id_pelicula) references pelicula(id_pelicula),
foreign key (id_categoria) references categoria(id_categoria)
);

create table if not exists film_text(
film_id int primary key,
title varchar(255),
description text 
);

create table if not exists almacen(
id_almacen int primary key,
id_empleado_jefe int,
id_direccion int,
ultima_actualizacion timestamp,
foreign key (id_direccion) references direccion(id_direccion)
);

create table if not exists empleado(
id_empleado int primary key,
nombre varchar(45),
apellido varchar(45),
id_direccion int,
imagen blob,
email varchar(50),
id_almacen int,
activo tinyint(1),
username varchar(16),
password varchar(40),
ultima_actualizacion timestamp,
foreign key (id_direccion) references direccion(id_direccion),
foreign key(id_almacen) references almacen(id_almacen)
);


create table if not exists inventario (
id_inventario int primary key,
id_pelicula int,
id_almacen int,
utlima_actualizacion timestamp,
foreign key (id_pelicula) references pelicula (id_pelicula),
foreign key (id_almacen) references almacen (id_almacen)
);

create table if not exists cliente(
id_cliente int primary key,
id_almacen int,
nombre varchar(45),
apellido varchar(45),
email varchar(50),
id_direccion int,
activo tinyint(1),
fecha_creacion datetime,
ultima_actualizacion timestamp,
foreign key(id_almacen) references almacen(id_almacen)
);

create table if not exists alquiler (
id_alquiler int primary key,
fecha_alquiler datetime,
id_inventario int,
id_cliente int,
fecha_devolucion datetime,
id_empleado int,
ultima_actualizacion timestamp,
foreign key (id_inventario) references inventario(id_inventario),
foreign key (id_cliente) references cliente(id_cliente),
foreign key (id_empleado) references empleado(id_empleado)
);

create table if not exists pago(
id_pago int primary key,
id_cliente int,
id_empleado int,
id_alquiler int,
total decimal(5,2),
fecha_pago datetime,
ultima_actualizacion timestamp,
foreign key (id_cliente) references cliente (id_cliente),
foreign key (id_empleado) references empleado(id_empleado),
foreign key (id_alquiler) references alquiler (id_alquiler)
);


















