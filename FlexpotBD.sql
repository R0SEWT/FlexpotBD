create database DeveloperSquad 
use DeveloperSquad

CREATE TABLE Usuario(
	ID_Usuario int NOT NULL PRIMARY KEY IDENTITY(10000, 1),
	Nombre varchar(255) NOT NULL,
	CorreoElectronico varchar(511) NOT NULL UNIQUE,
	Rol varchar(255) NOT NULL,
	EsActivo bit NOT NULL,
	
);

CREATE TABLE Mensaje (
    ID_Mensaje int NOT NULL PRIMARY KEY IDENTITY(1000, 1),
    Contenido varchar(500) NOT NULL,
    FechaEnvio datetime NOT NULL
);

CREATE TABLE Notificacion (
    ID_Notificacion int NOT NULL PRIMARY KEY IDENTITY(100000, 1),
    Mensaje varchar(500) NOT NULL,
    FechaEnvio datetime NOT NULL,
    EsLeido bit NOT NULL
);

CREATE TABLE Proyecto (
    ID_Proyecto int NOT NULL PRIMARY KEY IDENTITY(1000, 1),
    Nombre varchar(250) NOT NULL,
    FechaIncio datetime NOT NULL,
    FechaFin datetime NOT NULL,
    Descripcion varchar(1000) NOT NULL
);

CREATE TABLE Sala (
    ID_Sala int NOT NULL PRIMARY KEY IDENTITY(100, 1),
    Nombre varchar(250) NOT NULL,
    Capacidad int NOT NULL,
    Ubicacion varchar(250) NOT NULL
);

CREATE TABLE Tarea (
    ID_Tarea int NOT NULL PRIMARY KEY IDENTITY(1000, 1),
    Nombre varchar(250) NOT NULL,
    FechaEntrega datetime NOT NULL,
    FechaIncio datetime NOT NULL,
    Descripcion varchar(500) NOT NULL,
    Estado varchar(250) NOT NULL
);

CREATE TABLE Asistencia (
    ID_Asistencia int NOT NULL PRIMARY KEY IDENTITY(1000, 1),
    FechaRegistro datetime NOT NULL,
    Estado varchar(250) NOT NULL
);

CREATE TABLE Grabacion (
    ID_Grabacion int NOT NULL PRIMARY KEY IDENTITY(100, 1),
    NombreArchivo varchar(500) NOT NULL,
    FechaGrabacion datetime NOT NULL,
    Duracion TIME NOT NULL,
);

CREATE TABLE Informe (
    ID_Informe int NOT NULL PRIMARY KEY IDENTITY(100, 1),
	ID_Tarea int NOT NULL,
    Titulo varchar(500) NOT NULL,
    FechaCreacion datetime NOT NULL,
    Contenido varchar(4090) NOT NULL,
	FOREIGN KEY (ID_Tarea) REFERENCES Tarea(ID_Tarea),
);

CREATE TABLE Mensaje_Destinatario (
    ID_Mensaje int NOT NULL,
    ID_Usuario int NOT NULL,
	FOREIGN KEY (ID_Mensaje) REFERENCES Mensaje(ID_Mensaje),
	FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)

);

CREATE TABLE Mensaje_Remitente (
    ID_Usuario int NOT NULL,
    ID_Mensaje int NOT NULL
	FOREIGN KEY (ID_Mensaje) REFERENCES Mensaje(ID_Mensaje),
	FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);


CREATE TABLE Proyecto_Tarea (
    ID_Proyecto int NOT NULL,
    ID_Tarea int NOT NULL
	FOREIGN KEY (ID_Proyecto) REFERENCES Proyecto(ID_Proyecto),
	FOREIGN KEY (ID_Tarea) REFERENCES Tarea(ID_Tarea)
);


CREATE TABLE Sala_Asistencia (
    ID_Sala int NOT NULL,
    ID_Asistencia int NOT NULL
	FOREIGN KEY (ID_Sala) REFERENCES Sala(ID_Sala),
	FOREIGN KEY (ID_Asistencia) REFERENCES Asistencia(ID_Asistencia)
);


CREATE TABLE Tarea_Sala (
    ID_Tarea int NOT NULL,
    ID_Sala int NOT NULL
	FOREIGN KEY (ID_Sala) REFERENCES Sala(ID_Sala),
	FOREIGN KEY (ID_Tarea) REFERENCES Tarea(ID_Tarea)
);

CREATE TABLE Usuario_Asistencia (
    ID_Usuario int NOT NULL,
    ID_Asistencia int NOT NULL
	FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
	FOREIGN KEY (ID_Asistencia) REFERENCES Asistencia(ID_Asistencia)
);

CREATE TABLE Usuario_Notificacion (
    ID_Usuario int NOT NULL,
    ID_Notificacion int NOT NULL
	FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
	FOREIGN KEY (ID_Notificacion) REFERENCES Notificacion(ID_Notificacion)
);

CREATE TABLE Usuario_Proyecto (
    ID_Usuario int NOT NULL,
    ID_Proyecto int NOT NULL
	FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
	FOREIGN KEY (ID_Proyecto) REFERENCES Proyecto(ID_Proyecto)
);

CREATE TABLE Usuario_Tarea (
    ID_Usuario int NOT NULL,
    ID_Tarea int NOT NULL
	FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
	FOREIGN KEY (ID_Tarea) REFERENCES Tarea(ID_Tarea)

);

CREATE TABLE Sala_Grabacion (
    ID_Sala int NOT NULL,
    ID_Grabacion int NOT NULL
	FOREIGN KEY (ID_Sala) REFERENCES Sala(ID_Sala),
	FOREIGN KEY (ID_Grabacion) REFERENCES Grabacion(ID_Grabacion)

);

///////SCRIPT PARA INSERCION DE DATOS/////
INSERT INTO dbo.Usuario(Nombre, CorreoElectronico, Rol, EsActivo)
VALUES('María López', 'marialopez@example.com', 'Administrador', 1),
('Javier García', 'javiergarcia@example.com', 'Usuario Regular', 1),
('Ana Martínez', 'anamartinez@example.com', 'Usuario Regular', 0),
('Carlos Rodríguez', 'carlosrodriguez@example.com', 'Moderador', 1),
('Sofía Pérez', 'sofiaperez@example.com', 'Usuario Regular', 1),
('Manuel Fernández', 'manuelfernandez@example.com', 'Moderador', 0),
('Laura González', 'lauragonzalez@example.com', 'Usuario Regular', 1),
('Antonio Torres', 'antoniotorres@example.com', 'Administrador', 0),
('Carmen Ramírez', 'carmenramirez@example.com', 'Usuario Regular', 1),
('Diego Sánchez', 'diegosanchez@example.com', 'Moderador', 1),
('Isabel Ruiz', 'isabelruiz@example.com', 'Administrador', 0),
('Juan Mendoza', 'juanmendoza@example.com', 'Moderador', 1),
('Lucía Morales', 'luciamorales@example.com', 'Usuario Regular', 0),
('José Castro', 'josecastro@example.com', 'Administrador', 1),
('Marta Herrera', 'martaherrera@example.com', 'Moderador', 0);

select * from Usuario


INSERT INTO Tarea (Nombre, FechaEntrega, FechaIncio, Descripcion, Estado)
VALUES
('Desarrollo de la función de registro', '2023-10-30 14:00:00', '2023-10-25 10:00:00', 'Implementación de la función de registro de usuarios en la aplicación.', 'En progreso'),
('Prueba de rendimiento del servidor', '2023-11-05 16:30:00', '2023-10-27 08:45:00', 'Realización de pruebas de carga para evaluar el rendimiento del servidor.', 'Pendiente'),
('Revisión de documentación técnica', '2023-11-10 13:15:00', '2023-10-29 11:20:00', 'Revisión de la documentación técnica de la aplicación para asegurarse de que esté actualizada.', 'Completada'),
('Desarrollo de la interfaz de usuario', '2023-11-15 09:45:00', '2023-10-31 14:30:00', 'Diseño e implementación de la interfaz de usuario de la aplicación.', 'En progreso'),
('Pruebas de usabilidad', '2023-11-20 12:30:00', '2023-11-02 07:55:00', 'Realización de pruebas de usabilidad con usuarios beta.', 'Pendiente'),
('Reunión de revisión del proyecto', '2023-11-25 15:20:00', '2023-11-04 10:15:00', 'Reunión de revisión del proyecto con el equipo de desarrollo.', 'Completada'),
('Optimización de base de datos', '2023-11-30 10:00:00', '2023-11-10 14:30:00', 'Optimización y ajuste de rendimiento de la base de datos del sistema.', 'Pendiente'),
('Desarrollo de módulo de notificaciones', '2023-12-05 11:45:00', '2023-11-15 09:30:00', 'Implementación del módulo de notificaciones para alertar a los usuarios.', 'En progreso'),
('Prueba de seguridad de la aplicación', '2023-12-10 14:30:00', '2023-11-20 08:15:00', 'Realización de pruebas de seguridad para identificar vulnerabilidades.', 'Pendiente'),
('Mejoras en la interfaz de usuario', '2023-12-15 09:15:00', '2023-11-25 13:45:00', 'Implementación de mejoras visuales en la interfaz de usuario.', 'En progreso'),
('Planificación de la próxima fase del proyecto', '2023-12-20 15:00:00', '2023-11-30 12:30:00', 'Reunión para planificar la siguiente etapa del proyecto.', 'Completada'),
('Revisión de informes de progreso', '2023-12-25 16:30:00', '2023-12-04 10:00:00', 'Revisión de informes de progreso del proyecto.', 'Pendiente'),
('Pruebas finales y ajustes', '2023-12-30 17:15:00', '2023-12-10 09:45:00', 'Realización de pruebas finales y ajustes antes del lanzamiento.', 'Pendiente');


select * from Tarea


INSERT INTO Mensaje (Contenido, FechaEnvio)
VALUES
('Reunión de equipo a las 11 AM para discutir el progreso del proyecto.', '2023-10-30 10:30:00'),
('Nueva actualización del software se lanzará la próxima semana. Asegúrate de que todas las pruebas estén completas.', '2023-11-05 14:15:00'),
('Se requiere una revisión del código para la funcionalidad de inicio de sesión.', '2023-11-10 09:00:00'),
('¡Buen trabajo en la corrección de errores en el módulo de pagos!', '2023-11-15 16:00:00'),
('La reunión de planificación del proyecto se pospone para mañana a las 2 PM.', '2023-11-20 13:30:00'),
('Por favor, asegúrense de documentar cualquier cambio importante en el repositorio de código.', '2023-11-25 12:45:00'),
('El cliente ha solicitado una demostración del producto para la próxima semana. Preparen una presentación.', '2023-12-01 11:15:00'),
('Nueva contratación: Bienvenido Juan Pérez, nuestro nuevo desarrollador junior.', '2023-12-05 10:00:00'),
('Recordatorio: Actualiza tus horas trabajadas en el sistema de seguimiento de proyectos.', '2023-12-10 15:30:00'),
('El servidor de pruebas estará en mantenimiento esta noche de 9 PM a 11 PM.', '2023-12-15 08:20:00'),
('Reunión de sprint a las 3 PM para discutir los objetivos de la próxima iteración.', '2023-12-20 14:45:00'),
('Se requiere retroalimentación sobre la interfaz de usuario del nuevo módulo de administración.', '2023-12-25 10:10:00'),
('Por favor, asegúrense de que todos los informes de errores estén actualizados antes del lanzamiento.', '2023-12-30 16:30:00'),
('Necesitamos cubrir el turno de guardia para el soporte al cliente esta noche. ¿Quién puede hacerlo?', '2024-01-05 11:45:00'),
('Recuerda la capacitación de seguridad programada para mañana a las 9 AM.', '2024-01-10 12:55:00');

select * from Mensaje

INSERT INTO Notificacion (Mensaje, FechaEnvio, EsLeido)
VALUES
('Recuerda completar tu informe de progreso antes del fin de semana.', '2023-10-30 10:00:00', 1),
('La reunión semanal de equipo es a las 3 PM. ¡No faltes!', '2023-11-05 14:30:00', 0),
('Tus horas trabajadas para este proyecto deben registrarse hoy.', '2023-11-10 09:15:00', 1),
('El cliente ha solicitado una demostración del producto para la próxima semana.', '2023-11-15 16:15:00', 0),
('¡No olvides revisar los comentarios en el código antes de la revisión de pares!', '2023-11-20 13:45:00', 1),
('Revisión urgente del informe de errores para el módulo de facturación.', '2023-11-25 12:55:00', 1),
('Recuerda la capacitación de seguridad programada para mañana a las 9 AM.', '2023-12-01 10:10:00', 0),
('Recordatorio: Actualiza tus horas trabajadas en el sistema de seguimiento de proyectos.', '2023-12-05 11:00:00', 1),
('Nueva actualización del software se lanzará la próxima semana. Asegúrate de que todas las pruebas estén completas.', '2023-12-10 15:45:00', 0),
('Reunión de sprint a las 3 PM para discutir los objetivos de la próxima iteración.', '2023-12-15 08:30:00', 1),
('Se requiere retroalimentación sobre la interfaz de usuario del nuevo módulo de administración.', '2023-12-20 14:50:00', 1),
('El servidor de pruebas estará en mantenimiento esta noche de 9 PM a 11 PM.', '2023-12-25 10:30:00', 0),
('Necesitamos cubrir el turno de guardia para el soporte al cliente esta noche. ¿Quién puede hacerlo?', '2023-12-30 16:00:00', 1),
('Por favor, asegúrense de documentar cualquier cambio importante en el repositorio de código.', '2024-01-05 11:35:00', 1),
('Nueva contratación: Bienvenido Juan Pérez, nuestro nuevo desarrollador junior.', '2024-01-10 13:10:00', 0);
select * from Notificacion

INSERT INTO Proyecto (Nombre, FechaIncio, FechaFin, Descripcion)
VALUES
('Desarrollo de una aplicación de gestión de proyectos', '2023-10-30 00:00:00', '2023-11-30 23:59:59', 'Desarrollo de una aplicación completa para gestionar proyectos y tareas.'),
('Migración a la nube de un sistema de gestión empresarial', '2023-11-01 00:00:00', '2023-12-01 23:59:59', 'Migración de un sistema empresarial a la nube para mejorar la escalabilidad.'),
('Desarrollo de una plataforma de comercio electrónico', '2023-11-15 00:00:00', '2023-12-15 23:59:59', 'Creación de una plataforma de comercio electrónico para una tienda en línea.'),
('Optimización de una base de datos de gran escala', '2023-11-30 00:00:00', '2023-12-30 23:59:59', 'Mejora del rendimiento y escalabilidad de una base de datos empresarial.'),
('Desarrollo de una aplicación móvil de salud', '2023-12-01 00:00:00', '2024-01-01 23:59:59', 'Creación de una aplicación móvil para el seguimiento de la salud y el estado físico.'),
('Implementación de un sistema de gestión de contenidos', '2023-12-15 00:00:00', '2024-01-15 23:59:59', 'Desarrollo e implementación de un CMS para un sitio web.'),
('Desarrollo de un motor de recomendación de contenido', '2024-01-01 00:00:00', '2024-02-01 23:59:59', 'Creación de un motor de recomendación de contenido personalizado.'),
('Creación de una aplicación de análisis de datos', '2024-01-15 00:00:00', '2024-02-15 23:59:59', 'Desarrollo de una aplicación para analizar grandes conjuntos de datos.'),
('Mejora de la seguridad de una aplicación de banca en línea', '2024-02-01 00:00:00', '2024-03-01 23:59:59', 'Revisión y mejora de la seguridad de una aplicación financiera en línea.'),
('Desarrollo de un sistema de gestión de recursos humanos', '2024-02-15 00:00:00', '2024-03-15 23:59:59', 'Creación de un sistema de gestión de RRHH para una empresa.'),
('Optimización de la infraestructura de servidor', '2024-03-01 00:00:00', '2024-04-01 23:59:59', 'Mejora del rendimiento y la eficiencia de los servidores de la empresa.'),
('Desarrollo de un portal de e-learning', '2024-03-15 00:00:00', '2024-04-15 23:59:59', 'Creación de un portal de educación en línea para cursos y capacitación.'),
('Migración a una plataforma de gestión de proyectos', '2024-04-01 00:00:00', '2024-05-01 23:59:59', 'Migración a una nueva plataforma para la gestión de proyectos y colaboración.'),
('Desarrollo de un sistema de información geográfica', '2024-04-15 00:00:00', '2024-05-15 23:59:59', 'Creación de un sistema para la visualización y análisis de datos geoespaciales.'),
('Implementación de un sistema de chat en tiempo real', '2024-05-01 00:00:00', '2024-06-01 23:59:59', 'Integración de un sistema de chat en tiempo real en una aplicación existente.');

select * from Proyecto

INSERT INTO Sala (Nombre, Capacidad, Ubicacion)
VALUES
('Sala de Reuniones 1', 10, 'Planta 5, Edificio A'),
('Sala de Conferencias 1', 50, 'Planta 2, Edificio B'),
('Sala de Entrenamiento 1', 30, 'Planta 1, Edificio C'),
('Sala de Juntas 1', 12, 'Planta 4, Edificio A'),
('Sala de Videoconferencias 1', 20, 'Planta 3, Edificio D'),
('Sala de Entrevistas 1', 5, 'Planta 2, Edificio C'),
('Sala de Desarrollo 1', 15, 'Planta 6, Edificio B'),
('Sala de Descanso 1', 8, 'Planta 1, Edificio D'),
('Sala de Reuniones 2', 12, 'Planta 3, Edificio A'),
('Sala de Conferencias 2', 60, 'Planta 2, Edificio D'),
('Sala de Entrenamiento 2', 35, 'Planta 4, Edificio C'),
('Sala de Juntas 2', 8, 'Planta 5, Edificio B'),
('Sala de Videoconferencias 2', 25, 'Planta 6, Edificio A'),
('Sala de Entrevistas 2', 6, 'Planta 2, Edificio A'),
('Sala de Desarrollo 2', 20, 'Planta 4, Edificio B');

select * from Sala

INSERT INTO Asistencia (FechaRegistro, Estado)
VALUES
('2023-10-30 09:00:00', 'Presente'),
('2023-10-31 09:15:00', 'Tarde'),
('2023-11-01 09:10:00', 'Presente'),
('2023-11-02 09:05:00', 'Licencia'),
('2023-11-03 09:20:00', 'Presente'),
('2023-11-04 09:30:00', 'Presente'),
('2023-11-05 09:25:00', 'Tarde'),
('2023-11-06 09:45:00', 'Licencia'),
('2023-11-07 09:40:00', 'Tarde'),
('2023-11-08 09:35:00', 'Presente'),
('2023-11-09 09:50:00', 'Ausente'),
('2023-11-10 09:55:00', 'Presente'),
('2023-11-11 09:00:00', 'Licencia'),
('2023-11-12 09:15:00', 'Tarde'),
('2023-11-13 09:10:00', 'Licencia');

select * from Asistencia


INSERT INTO Grabacion (NombreArchivo, FechaGrabacion, Duracion)
VALUES
('grabacion_001.mp4', '2023-10-30 14:15:00', '00:15:30'),
('grabacion_002.mp4', '2023-11-05 10:30:00', '00:12:45'),
('grabacion_003.mp4', '2023-11-10 13:20:00', '00:18:00'),
('grabacion_004.mp4', '2023-11-15 09:45:00', '00:14:15'),
('grabacion_005.mp4', '2023-11-20 12:00:00', '00:16:30'),
('grabacion_006.mp4', '2023-11-25 16:10:00', '00:19:45'),
('grabacion_007.mp4', '2023-12-01 11:30:00', '00:22:30'),
('grabacion_008.mp4', '2023-12-05 14:00:00', '00:20:15'),
('grabacion_009.mp4', '2023-12-10 09:15:00', '00:17:45'),
('grabacion_010.mp4', '2023-12-15 12:45:00', '00:14:30'),
('grabacion_011.mp4', '2023-12-20 16:20:00', '00:13:45'),
('grabacion_012.mp4', '2023-12-25 10:30:00', '00:16:00'),
('grabacion_013.mp4', '2023-12-30 15:00:00', '00:20:30'),
('grabacion_014.mp4', '2024-01-05 13:45:00', '00:15:15'),
('grabacion_015.mp4', '2024-01-10 10:10:00', '00:18:45');

select * from Grabacion

INSERT INTO Informe (ID_Tarea, Titulo, FechaCreacion, Contenido)
VALUES
(1000, 'Informe de avance de desarrollo', '2023-10-30 14:15:00', 'Hoy se completaron las primeras etapas del desarrollo del módulo de autenticación.'),
(1001, 'Informe de pruebas de migración', '2023-11-05 10:30:00', 'Se realizaron pruebas de migración a la nube y se identificaron algunas áreas de mejora.'),
(1002, 'Informe de lanzamiento de plataforma', '2023-11-10 13:20:00', 'La plataforma de comercio electrónico se lanzará oficialmente la próxima semana.'),
(1003, 'Informe de revisión de base de datos', '2023-11-15 09:45:00', 'Se completó la revisión de la base de datos y se implementaron las mejoras necesarias.'),
(1004, 'Informe de pruebas de aplicación móvil', '2023-11-20 12:00:00', 'Se realizaron pruebas exhaustivas en la aplicación móvil de salud y se corrigieron errores identificados.'),
(1005, 'Informe de lanzamiento de CMS', '2023-11-25 16:10:00', 'El sistema de gestión de contenidos se lanzó con éxito y está funcionando correctamente.'),
(1006, 'Informe de retroalimentación de usuarios', '2023-12-01 11:30:00', 'Los usuarios proporcionaron retroalimentación positiva sobre la interfaz de usuario del nuevo módulo de administración.'),
(1007, 'Informe de capacitación de seguridad', '2023-12-05 14:00:00', 'La capacitación de seguridad se llevó a cabo según lo programado y se cubrieron temas importantes.'),
(1008, 'Informe de pruebas de seguridad', '2023-12-10 09:15:00', 'Se completaron las pruebas de seguridad en la aplicación de banca en línea y se identificaron vulnerabilidades menores.'),
(1009, 'Informe de lanzamiento de RRHH', '2023-12-15 12:45:00', 'El sistema de gestión de recursos humanos se lanzó con éxito y se brindó capacitación al personal.'),
(1010, 'Informe de mantenimiento de servidores', '2023-12-20 16:20:00', 'Se realizó el mantenimiento programado de los servidores y se mejoró el rendimiento.')


select * from Informe


INSERT INTO Mensaje_Destinatario (ID_Mensaje, ID_Usuario)
VALUES
(1000, 10000), 
(1001, 10001), 
(1001, 10002), 
(1002, 10003), 
(1002, 10004), 
(1003, 10005), 
(1004, 10006), 
(1005, 10007), 
(1006, 10008), 
(1007, 10009), 
(1008, 10010), 
(1008, 10011), 
(1009, 10012), 
(1010, 10013), 
(1011, 10014); 

select * from Mensaje_Destinatario

INSERT INTO Mensaje_Remitente (ID_Usuario, ID_Mensaje)
VALUES
(10000, 1000), 
(10001, 1001), 
(10003, 1002), 
(10006, 1004), 
(10009, 1006), 
(10012, 1008), 
(10015, 1010), 
(10002, 1003), 
(10004, 1005), 
(10007, 1007), 
(10010, 1009), 
(10013, 1011), 
(10005, 1004), 
(10008, 1006), 
(10011, 1008); 

select * from Mensaje_Remitente

INSERT INTO Proyecto_Tarea (ID_Proyecto, ID_Tarea)
VALUES
(1000, 1000), (1000, 1001), (1000, 1002), (1000, 1003), (1000, 1004),
(1001, 1005), (1001, 1006), (1001, 1007), (1001, 1008), (1001, 1009);

select * from Proyecto_Tarea

INSERT INTO Sala_Asistencia (ID_Sala, ID_Asistencia)--
VALUES
(100, 1006), (100, 1007), (100, 1008), (100, 1009), (100, 1010),
(101, 1011), (101, 1012), (101, 1013), (101, 1014), (101, 1015);

select * from Sala_Asistencia

select * from Usuario
select * from Asistencia

INSERT INTO Usuario_Asistencia (ID_Usuario, ID_Asistencia)
VALUES
(10000, 1010), (10001, 1011), (10002, 1012), (10003, 1013), (10004, 1014),
(10005, 1012), (10001, 1011), (10007, 1002), (10008, 1004), (10009, 1007);

select * from Usuario_Asistencia



INSERT INTO Usuario_Notificacion (ID_Usuario, ID_Notificacion)
VALUES
(10000, 100010), (10000, 100011), (10000, 100012), (10000, 100013), (10000, 100014),
(10001, 100005), (10001, 100006), (10001, 100011), (10001, 100010), (10001, 100009);

select * from Usuario_Notificacion--


INSERT INTO Usuario_Proyecto (ID_Usuario, ID_Proyecto)
VALUES
(10000, 1010), (10000, 1011), (10000, 1012), (10000, 1013), (10000, 1014),
(10001, 1005), (10001, 1006), (10001, 1007), (10001, 1008), (10001, 1009);

select * from Usuario_Proyecto

INSERT INTO Usuario_Tarea (ID_Usuario, ID_Tarea)
VALUES
(10000, 1000), (10000, 1001), (10000, 1002), (10000, 1003), (10000, 1004),
(10001, 1005), (10001, 1006), (10001, 1007), (10001, 1008), (10001, 1009);

INSERT INTO Sala_Grabacion (ID_Sala, ID_Grabacion)
VALUES
(100, 110), (100, 101), (100, 102), (100, 103), (100, 104),
(101, 105), (101, 106), (101, 107), (101, 108), (101, 109);


