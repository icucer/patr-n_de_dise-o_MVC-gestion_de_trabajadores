CREATE DATABASE trabajadoresdb;

USE trabajadoresdb;

CREATE TABLE usuarios
(
    id int primary key auto_increment,
    correo varchar(255),
    creado timestamp,
    alias varchar(255),
    nombre varchar(255),
    contraseña varchar(255),
    peso int,
    modificado timestamp
);

CREATE TABLE roles
(
    id int primary key auto_increment,
    nombre varchar(50)
);

CREATE TABLE direcciones
(
    id int primary key auto_increment,
    direccion varchar(255),
    numero_construccion varchar(6),
    usuarios_id int,
    CONSTRAINT fk_usuarios_id
        FOREIGN KEY (usuarios_id)
            REFERENCES usuarios(id)
            ON DELETE CASCADE
);

CREATE TABLE roles_usuarios
(
    usuario_id int,
    rol_id int,
    CONSTRAINT fk_roles_usuarios_usuario_id
        FOREIGN KEY (usuario_id)
            REFERENCES usuarios(id)
            ON DELETE CASCADE,
    CONSTRAINT fk_roles_usuarios_rol_id
        FOREIGN KEY (rol_id)
            REFERENCES roles(id)
            ON DELETE CASCADE
);
