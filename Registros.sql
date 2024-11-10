create database Muunder;
use Muunder;
drop database Muunder;

create table registro_usario( -- Registro de usuarios. 
	id_usuario int PRIMARY KEY auto_increment,
    nombres varchar(20),
    apellido_pat varchar(20),
    apellido_mat varchar(20),    
    Fecha_nacimiento varchar(30),
    edad int, 
    correo varchar(30),
    telefono varchar(10),
    contrasena_codif varchar(15),
    ubicacion varchar(30),
    contrasena varchar(40)
    );
    
    insert into registro_usario (nombres, apellido_pat, apellido_mat, Fecha_nacimiento, correo, telefono, ubicacion, contrasena)
VALUES
('Juan', 'Pérez', 'González', '1990-01-15', 'juan.perez@mail.com', '1234567890', 'Ciudad A', 'password123'),
('María', 'López', 'Martínez', '1985-06-22',  'maria.lopez@mail.com', '0987654321', 'Ciudad B', 'password456');

 insert into registro_usario (nombres, contrasena, apellido_pat, apellido_mat, Fecha_nacimiento, correo, telefono, ubicacion)
VALUES (

Select * from registro_usario;
    
    Create table registro_animal( -- Registro de animales
	id_animal int PRIMARY KEY auto_increment,
    nombre varchar(20),
    raza varchar (20),
    peso decimal(5, 2),
    especie varchar(20),
    edad int,
    descripción varchar(60),
    sexo varchar(20),
	id_usuario int, 
    ubicacion varchar(30),
    FOREIGN KEY (id_usuario) REFERENCES registro_usario(id_usuario)
    );

drop table registro_animal;

INSERT INTO registro_animal (nombre, raza, peso, especie, edad, descripción, sexo, id_usuario, ubicacion)
VALUES
-- Animales para el usuario 1 (Juan Pérez)
	('Toro', 'Brahman', 850.5, 'Bovino', 5, 'Toro adulto reproductor', 'macho', 1, 'Guadalajara'),
	('Vaca', 'Holstein', 600.0, 'Bovino', 4, 'Vaca lechera', 'hembra', 1, 'Monterrey'),
	('Becerro', 'Angus', 150.0, 'Bovino', 1, 'Becerro joven', 'macho', 1, 'Monterrey'),

-- Animales para el usuario 2 (María López)
	('Toro', 'Charolais', 800.0, 'Bovino', 6, 'Toro adulto reproductor', 'macho', 2, 'Veracruz'),
	('Vaca', 'Jersey', 500.5, 'Bovino', 5, 'Vaca lechera de alta producción', 'hembra', 2, 'Puebla'),
	('Becerro', 'Limousin', 140.0, 'Bovino', 1, 'Becerro joven', 'macho', 2, 'Monterrey');    

CREATE TABLE solicitud_emparejamiento ( -- Las solicitudes para emparejar animales.
    id_solicitud INT PRIMARY KEY AUTO_INCREMENT,
    fecha_solicitud DATE,
    id_usuariosolicitante INT,  -- Usuario que solicita el emparejamiento
    id_usuarioreceptor INT, -- Usuario que recibe la solicitud
    id_animal_solicitante INT,
    id_animal_receptor INT,
    estado ENUM('pendiente', 'aceptada', 'rechazada') DEFAULT 'pendiente',
    FOREIGN KEY (id_usuariosolicitante) REFERENCES registro_usario(id_usuario),
    FOREIGN KEY (id_usuarioreceptor) REFERENCES registro_usario(id_usuario),
    FOREIGN KEY (id_animal_solicitante) REFERENCES registro_animal(id_animal),
    FOREIGN KEY (id_animal_receptor) REFERENCES registro_animal(id_animal)
    );

INSERT INTO solicitud_emparejamiento (fecha_solicitud, id_usuariosolicitante, id_usuarioreceptor, id_animal_solicitante, id_animal_receptor, estado)
VALUES
    ('2024-01-10', 1, 2, 1, 4, 'pendiente'), -- Solicitud pendiente de emparejamiento entre un animal de Juan Pérez y uno de María López
    ('2024-01-15', 1, 2, 2, 5, 'aceptada'),    -- Solicitud aceptada de emparejamiento entre animales de Juan Pérez y María López
    ('2024-02-01', 1, 2, 3, 6, 'rechazada'),    -- Solicitud rechazada de emparejamiento entre un becerro de Juan Pérez y un becerro de María López
    ('2024-02-05', 2, 1, 4, 2, 'pendiente');    -- Solicitud pendiente de emparejamiento entre otro toro de Juan Pérez y una vaca de María López



create table registro_apareamiento( -- Cuando las solicitudes son aceptadas, se hacen registros.
	id_registro int PRIMARY KEY auto_increment,
    fecha_apareamiento date,
    id_animal1 int,
    FOREIGN KEY (id_animal1) REFERENCES registro_animal(id_animal),
    id_animal2 int,
    FOREIGN KEY (id_animal2) REFERENCES registro_animal(id_animal),
    id_usuario1 int,  
    FOREIGN KEY (id_usuario1) REFERENCES registro_usario(id_usuario),
    id_usuario2 int,  
    FOREIGN KEY (id_usuario2) REFERENCES registro_usario(id_usuario),
    id_solicitud int,
    foreign key (id_solicitud) references solicitud_emparejamiento(id_solicitud)
    
    );
    
INSERT INTO registro_apareamiento (fecha_apareamiento, id_animal1, id_animal2, id_usuario1, id_usuario2)
	VALUES
	-- Registro de apareamiento entre animales de los usuarios 1 (Juan Pérez) y 2 (María López)
	('2024-01-15', 1, 4, 1, 2),
	('2024-02-10', 2, 5, 1, 2);
    
create table Concurso_animal( -- Si el animal ha participado en algun concurso, se registra aquí.
	id_concurso int PRIMARY KEY auto_increment,
    id_ganado int,
    fecha_concurso date,
    Estado varchar(25),
	ciudad varchar(40),
    resultado_concurso varchar(20)
    );
    
INSERT INTO Concurso_animal (id_ganado, fecha_concurso, Estado, ciudad, resultado_concurso)
	VALUES
-- Registros de participación en concursos de animales registrados
(1, '2024-03-15', 'Jalisco', 'Guadalajara', 'Primer lugar'),
(4, '2024-04-20', 'Nuevo León', 'Monterrey', 'Segundo lugar');

    
create table chats( -- Cuando la solicitud se acepta, se permite el chat entre usuarios. 
	id_chat int primary key auto_increment,
    id_solicitudemparejamiento int,
    FOREIGN KEY (id_solicitudemparejamiento) REFERENCES solicitud_emparejamiento(id_solicitud),
	id_usuario1 int,  
    FOREIGN KEY (id_usuario1) REFERENCES registro_usario(id_usuario),
    id_usuario2 int,  
    FOREIGN KEY (id_usuario2) REFERENCES registro_usario(id_usuario),
    estado varchar(15),
    fecha_habilitacion DATE
);





-- Subconsulta donde muestre a los animales que han ganado un concurso en primer lugar.
SELECT id_animal, nombre, id_usuario
FROM registro_animal
WHERE id_animal IN (
    SELECT id_ganado
    FROM Concurso_animal
    WHERE resultado_concurso = 'Primer lugar'
);




DELIMITER //

CREATE TRIGGER despues_aceptar_solicitud -- Trigger para anotar los apareamientos en la tabla de registro de apareamientos una vez que la solicitud sea aceptada
AFTER UPDATE on solicitud_emparejamiento -- despues de actualizar la tabla de solicitud de apareamiento
FOR EACH ROW
BEGIN
    -- Verificamos si la solicitud fue aceptada
    if new.estado = 'aceptada' THEN -- Si el nuevo estado es aceptado, entonces
        INSERT INTO registro_apareamiento (fecha_apareamiento, id_animal1, id_animal2, id_usuario1, id_usuario2, id_solicitud) -- En la tabla de registros de apareamiento, en esos campos-
        VALUES (NEW.fecha_solicitud, NEW.id_animal_solicitante, NEW.id_animal_receptor, NEW.id_usuariosolicitante, NEW.id_usuarioreceptor, NEW.id_solicitud); -- Se agregan los nuevos campos. Que son los usuarios, los animales y el numero de solicitud 
    end if;
end //

DELIMITER ;


DELIMITER //

CREATE TRIGGER habilitar_chat -- Para habilitar el chat. 
AFTER UPDATE ON solicitud_emparejamiento -- Despues de actualizar en la tabla de solicitud de emparejamiento. 
FOR EACH ROW
BEGIN
    -- Verificamos si la solicitud fue aceptada
    IF NEW.estado = 'aceptada' THEN -- Si el nuevo estado es aceptado, entonces
		INSERT INTO chat (id_solicitud, id_usuario1, id_usuario2, estado, fecha_habilitacion) -- En la tabla de chat, se actualizaran los id de estos usuarios.
        VALUES (NEW.id_solicitud, NEW.id_usuariosolicitante, NEW.id_usuarioreceptor, 'habilitado', NEW.fecha_solicitud); -- Los nuevos valores para el nuevo chat
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE obtener_info_usuario(IN p_id_usuario INT)
BEGIN
    -- Información básica del usuario
    SELECT id_usuario, nombres, apellido_pat, apellido_mat, Fecha_nacimiento, correo, telefono, ubicacion
    FROM registro_usario
    WHERE id_usuario = p_id_usuario;
    
    -- Animales del usuario
    SELECT id_animal, nombre, raza, peso, especie, edad, descripción, sexo, ubicacion
    FROM registro_animal
    WHERE id_usuario = p_id_usuario;
    
    -- Solicitudes de emparejamiento aceptadas para el usuario como solicitante o receptor
    SELECT se.id_solicitud, se.fecha_solicitud, 
           se.estado, 
           a1.nombre AS animal_solicitante, 
           a2.nombre AS animal_receptor
    FROM solicitud_emparejamiento se
    JOIN registro_animal a1 ON se.id_animal_solicitante = a1.id_animal
    JOIN registro_animal a2 ON se.id_animal_receptor = a2.id_animal
    WHERE (se.id_usuariosolicitante = p_id_usuario OR se.id_usuarioreceptor = p_id_usuario)
      AND se.estado = 'aceptada';

    -- Concursos en los que participaron los animales del usuario
    SELECT ca.id_concurso, ca.fecha_concurso, ca.Estado, ca.ciudad, ca.resultado_concurso
    FROM Concurso_animal ca
    JOIN registro_animal ra ON ca.id_ganado = ra.id_animal
    WHERE ra.id_usuario = p_id_usuario;
END //

DELIMITER ;

CALL obtener_info_usuario(1);

select id_usuario, contraseña from registro_usario; where nombre = 'Juan';





create table registro_usario( -- Registro de usuarios. 
	id_usuario int PRIMARY KEY auto_increment,
    nombres varchar(20),
    apellido_pat varchar(20),
    apellido_mat varchar(20),    
    Fecha_nacimiento varchar(30),
    edad int, 
    correo varchar(30),
    telefono varchar(10),
    contrasena_codif varchar(15),
    ubicacion varchar(30),
    contrasena varchar(40)
    );
    
-- Dos subconsultas, 
-- un procedimiento y
-- un trigger
    