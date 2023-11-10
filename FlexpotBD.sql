create database DeveloperSquad 
use DeveloperSquad

CREATE TABLE Usuario(
	ID_Usuario int NOT NULL PRIMARY KEY IDENTITY(1, 1),
	Nombre varchar(255) NOT NULL,
	CorreoElectronico varchar(511) NOT NULL UNIQUE,
	Rol varchar(255) NOT NULL,
	EsActivo bit NOT NULL
	
);

CREATE TABLE Sala (
    ID_Sala INT PRIMARY KEY IDENTITY(1, 1),
    ID_Anfitrion INT NOT NULL,
    Nombre VARCHAR(250) NOT NULL,
    Capacidad INT NOT NULL,
    Ubicacion VARCHAR(250) NOT NULL,
    FOREIGN KEY (ID_Anfitrion) REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE Asistencia (
    ID_Asistencia int NOT NULL PRIMARY KEY IDENTITY(1, 1),
    ID_Usuario INT NOT NULL,
    FechaRegistro datetime NOT NULL,
    Estado varchar(250) NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE Grabacion (
    ID_Grabacion int NOT NULL PRIMARY KEY IDENTITY(1, 1),
    ID_Sala int NOT NULL,
    NombreArchivo varchar(500) NOT NULL,
    FechaGrabacion datetime NOT NULL,
    Duracion TIME NOT NULL,
    FOREIGN KEY (ID_Sala) REFERENCES Sala(ID_Sala)

);

CREATE TABLE Horario
 
	ID_Horario integer  PRIMARY KEY IDENTITY(1, 1),
	ID_Usuario integer  NOT NULL ,
	DiaSemana varchar(20) NOT NULL ,
	HoraInicio TIME  NOT NULL ,
	HoraFin TIME  NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)

;

CREATE TABLE Informe (
    ID_Informe int NOT NULL PRIMARY KEY IDENTITY(1, 1),
	ID_Tarea int NOT NULL,
    Titulo varchar(500) NOT NULL,
    FechaCreacion datetime NOT NULL,
    Contenido varchar(4090) NOT NULL,
	FOREIGN KEY (ID_Tarea) REFERENCES Tarea(ID_Tarea)
);

CREATE TABLE Mensaje (
    ID_Mensaje int NOT NULL PRIMARY KEY IDENTITY(1, 1),
    ID_Usuario int NOT NULL,
    Contenido varchar(500) NOT NULL,
    FechaEnvio datetime NOT NULL
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE Notificacion (
    ID_Notificacion int NOT NULL PRIMARY KEY IDENTITY(1, 1),
    Mensaje varchar(500) NOT NULL,
    FechaEnvio datetime NOT NULL,
    EsLeido bit NOT NULL
);

CREATE TABLE Proyecto (
    ID_Proyecto int NOT NULL PRIMARY KEY IDENTITY(1, 1),
    Nombre varchar(250) NOT NULL,
    FechaIncio datetime NOT NULL,
    FechaFin datetime NOT NULL,
    Descripcion varchar(1000) NOT NULL
);



CREATE TABLE Tarea (
    ID_Tarea int NOT NULL PRIMARY KEY IDENTITY(1, 1),
    Nombre varchar(250) NOT NULL,
    FechaEntrega datetime NOT NULL,
    FechaIncio datetime NOT NULL,
    Descripcion varchar(500) NOT NULL,
    Estado varchar(250) NOT NULL
);  

CREATE TABLE [Reunion]
( 
	[ID_Reunion]         integer PRIMARY KEY ,
	[ID_Sala]            integer  NOT NULL ,
	[fechaReunion]       datetime  NULL ,
	[duracionReunion]    varchar(20)  NULL,
    FOREIGN KEY (ID_Sala) REFERENCES Sala(ID_Sala)
)
go

CREATE TABLE [RepuestaAsistencia] (
    [ID_RespuestaAsistencia] int NOT NULL PRIMARY KEY IDENTITY(1, 1),
    [ID_FomularioAsistencia] int NOT NULL,
    [ID_Usuario]         integer  NOT NULL ,
	FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)

);

CREATE TABLE Proyecto_Tarea (
    ID_Proyecto int NOT NULL,
    ID_Tarea int NOT NULL,
	FOREIGN KEY (ID_Proyecto) REFERENCES Proyecto(ID_Proyecto),
	FOREIGN KEY (ID_Tarea) REFERENCES Tarea(ID_Tarea)
);

CREATE TABLE [Reunion_Asistencia]
( 
	[ID_Reunion]         integer  NOT NULL ,
	[ID_Asistencia]      integer  NOT NULL,
    FOREIGN KEY (ID_Reunion) REFERENCES Reunion(ID_Reunion),
    FOREIGN KEY (ID_Asistencia) REFERENCES Asistencia(ID_Asistencia)
)
go

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

///////SCRIPT PARA INSERCION DE DATOS falta modificar/////
INSERT INTO dbo.Usuario(Nombre, CorreoElectronico, Rol, EsActivo)
VALUES('Mar�a L�pez', 'marialopez@example.com', 'Administrador', 1),
('Javier Garc�a', 'javiergarcia@example.com', 'Usuario Regular', 1),
('Ana Mart�nez', 'anamartinez@example.com', 'Usuario Regular', 0),
('Carlos Rodr�guez', 'carlosrodriguez@example.com', 'Moderador', 1),
('Sof�a P�rez', 'sofiaperez@example.com', 'Usuario Regular', 1),
('Manuel Fern�ndez', 'manuelfernandez@example.com', 'Moderador', 0),
('Laura Gonz�lez', 'lauragonzalez@example.com', 'Usuario Regular', 1),
('Antonio Torres', 'antoniotorres@example.com', 'Administrador', 0),
('Carmen Ram�rez', 'carmenramirez@example.com', 'Usuario Regular', 1),
('Diego S�nchez', 'diegosanchez@example.com', 'Moderador', 1),
('Isabel Ruiz', 'isabelruiz@example.com', 'Administrador', 0),
('Juan Mendoza', 'juanmendoza@example.com', 'Moderador', 1),
('Luc�a Morales', 'luciamorales@example.com', 'Usuario Regular', 0),
('Jos� Castro', 'josecastro@example.com', 'Administrador', 1),
('Marta Herrera', 'martaherrera@example.com', 'Moderador', 0);

select * from Usuario


INSERT INTO Tarea (Nombre, FechaEntrega, FechaIncio, Descripcion, Estado)
VALUES
('Desarrollo de la funci�n de registro', '2023-10-30 14:00:00', '2023-10-25 10:00:00', 'Implementaci�n de la funci�n de registro de usuarios en la aplicaci�n.', 'En progreso'),
('Prueba de rendimiento del servidor', '2023-11-05 16:30:00', '2023-10-27 08:45:00', 'Realizaci�n de pruebas de carga para evaluar el rendimiento del servidor.', 'Pendiente'),
('Revisi�n de documentaci�n t�cnica', '2023-11-10 13:15:00', '2023-10-29 11:20:00', 'Revisi�n de la documentaci�n t�cnica de la aplicaci�n para asegurarse de que est� actualizada.', 'Completada'),
('Desarrollo de la interfaz de usuario', '2023-11-15 09:45:00', '2023-10-31 14:30:00', 'Dise�o e implementaci�n de la interfaz de usuario de la aplicaci�n.', 'En progreso'),
('Pruebas de usabilidad', '2023-11-20 12:30:00', '2023-11-02 07:55:00', 'Realizaci�n de pruebas de usabilidad con usuarios beta.', 'Pendiente'),
('Reuni�n de revisi�n del proyecto', '2023-11-25 15:20:00', '2023-11-04 10:15:00', 'Reuni�n de revisi�n del proyecto con el equipo de desarrollo.', 'Completada'),
('Optimizaci�n de base de datos', '2023-11-30 10:00:00', '2023-11-10 14:30:00', 'Optimizaci�n y ajuste de rendimiento de la base de datos del sistema.', 'Pendiente'),
('Desarrollo de m�dulo de notificaciones', '2023-12-05 11:45:00', '2023-11-15 09:30:00', 'Implementaci�n del m�dulo de notificaciones para alertar a los usuarios.', 'En progreso'),
('Prueba de seguridad de la aplicaci�n', '2023-12-10 14:30:00', '2023-11-20 08:15:00', 'Realizaci�n de pruebas de seguridad para identificar vulnerabilidades.', 'Pendiente'),
('Mejoras en la interfaz de usuario', '2023-12-15 09:15:00', '2023-11-25 13:45:00', 'Implementaci�n de mejoras visuales en la interfaz de usuario.', 'En progreso'),
('Planificaci�n de la pr�xima fase del proyecto', '2023-12-20 15:00:00', '2023-11-30 12:30:00', 'Reuni�n para planificar la siguiente etapa del proyecto.', 'Completada'),
('Revisi�n de informes de progreso', '2023-12-25 16:30:00', '2023-12-04 10:00:00', 'Revisi�n de informes de progreso del proyecto.', 'Pendiente'),
('Pruebas finales y ajustes', '2023-12-30 17:15:00', '2023-12-10 09:45:00', 'Realizaci�n de pruebas finales y ajustes antes del lanzamiento.', 'Pendiente');


select * from Tarea


INSERT INTO Mensaje (Contenido, FechaEnvio)
VALUES
('Reuni�n de equipo a las 11 AM para discutir el progreso del proyecto.', '2023-10-30 10:30:00'),
('Nueva actualizaci�n del software se lanzar� la pr�xima semana. Aseg�rate de que todas las pruebas est�n completas.', '2023-11-05 14:15:00'),
('Se requiere una revisi�n del c�digo para la funcionalidad de inicio de sesi�n.', '2023-11-10 09:00:00'),
('�Buen trabajo en la correcci�n de errores en el m�dulo de pagos!', '2023-11-15 16:00:00'),
('La reuni�n de planificaci�n del proyecto se pospone para ma�ana a las 2 PM.', '2023-11-20 13:30:00'),
('Por favor, aseg�rense de documentar cualquier cambio importante en el repositorio de c�digo.', '2023-11-25 12:45:00'),
('El cliente ha solicitado una demostraci�n del producto para la pr�xima semana. Preparen una presentaci�n.', '2023-12-01 11:15:00'),
('Nueva contrataci�n: Bienvenido Juan P�rez, nuestro nuevo desarrollador junior.', '2023-12-05 10:00:00'),
('Recordatorio: Actualiza tus horas trabajadas en el sistema de seguimiento de proyectos.', '2023-12-10 15:30:00'),
('El servidor de pruebas estar� en mantenimiento esta noche de 9 PM a 11 PM.', '2023-12-15 08:20:00'),
('Reuni�n de sprint a las 3 PM para discutir los objetivos de la pr�xima iteraci�n.', '2023-12-20 14:45:00'),
('Se requiere retroalimentaci�n sobre la interfaz de usuario del nuevo m�dulo de administraci�n.', '2023-12-25 10:10:00'),
('Por favor, aseg�rense de que todos los informes de errores est�n actualizados antes del lanzamiento.', '2023-12-30 16:30:00'),
('Necesitamos cubrir el turno de guardia para el soporte al cliente esta noche. �Qui�n puede hacerlo?', '2024-01-05 11:45:00'),
('Recuerda la capacitaci�n de seguridad programada para ma�ana a las 9 AM.', '2024-01-10 12:55:00');

select * from Mensaje

INSERT INTO Notificacion (Mensaje, FechaEnvio, EsLeido)
VALUES
('Recuerda completar tu informe de progreso antes del fin de semana.', '2023-10-30 10:00:00', 1),
('La reuni�n semanal de equipo es a las 3 PM. �No faltes!', '2023-11-05 14:30:00', 0),
('Tus horas trabajadas para este proyecto deben registrarse hoy.', '2023-11-10 09:15:00', 1),
('El cliente ha solicitado una demostraci�n del producto para la pr�xima semana.', '2023-11-15 16:15:00', 0),
('�No olvides revisar los comentarios en el c�digo antes de la revisi�n de pares!', '2023-11-20 13:45:00', 1),
('Revisi�n urgente del informe de errores para el m�dulo de facturaci�n.', '2023-11-25 12:55:00', 1),
('Recuerda la capacitaci�n de seguridad programada para ma�ana a las 9 AM.', '2023-12-01 10:10:00', 0),
('Recordatorio: Actualiza tus horas trabajadas en el sistema de seguimiento de proyectos.', '2023-12-05 11:00:00', 1),
('Nueva actualizaci�n del software se lanzar� la pr�xima semana. Aseg�rate de que todas las pruebas est�n completas.', '2023-12-10 15:45:00', 0),
('Reuni�n de sprint a las 3 PM para discutir los objetivos de la pr�xima iteraci�n.', '2023-12-15 08:30:00', 1),
('Se requiere retroalimentaci�n sobre la interfaz de usuario del nuevo m�dulo de administraci�n.', '2023-12-20 14:50:00', 1),
('El servidor de pruebas estar� en mantenimiento esta noche de 9 PM a 11 PM.', '2023-12-25 10:30:00', 0),
('Necesitamos cubrir el turno de guardia para el soporte al cliente esta noche. �Qui�n puede hacerlo?', '2023-12-30 16:00:00', 1),
('Por favor, aseg�rense de documentar cualquier cambio importante en el repositorio de c�digo.', '2024-01-05 11:35:00', 1),
('Nueva contrataci�n: Bienvenido Juan P�rez, nuestro nuevo desarrollador junior.', '2024-01-10 13:10:00', 0);
select * from Notificacion

INSERT INTO Proyecto (Nombre, FechaIncio, FechaFin, Descripcion)
VALUES
('Desarrollo de una aplicaci�n de gesti�n de proyectos', '2023-10-30 00:00:00', '2023-11-30 23:59:59', 'Desarrollo de una aplicaci�n completa para gestionar proyectos y tareas.'),
('Migraci�n a la nube de un sistema de gesti�n empresarial', '2023-11-01 00:00:00', '2023-12-01 23:59:59', 'Migraci�n de un sistema empresarial a la nube para mejorar la escalabilidad.'),
('Desarrollo de una plataforma de comercio electr�nico', '2023-11-15 00:00:00', '2023-12-15 23:59:59', 'Creaci�n de una plataforma de comercio electr�nico para una tienda en l�nea.'),
('Optimizaci�n de una base de datos de gran escala', '2023-11-30 00:00:00', '2023-12-30 23:59:59', 'Mejora del rendimiento y escalabilidad de una base de datos empresarial.'),
('Desarrollo de una aplicaci�n m�vil de salud', '2023-12-01 00:00:00', '2024-01-01 23:59:59', 'Creaci�n de una aplicaci�n m�vil para el seguimiento de la salud y el estado f�sico.'),
('Implementaci�n de un sistema de gesti�n de contenidos', '2023-12-15 00:00:00', '2024-01-15 23:59:59', 'Desarrollo e implementaci�n de un CMS para un sitio web.'),
('Desarrollo de un motor de recomendaci�n de contenido', '2024-01-01 00:00:00', '2024-02-01 23:59:59', 'Creaci�n de un motor de recomendaci�n de contenido personalizado.'),
('Creaci�n de una aplicaci�n de an�lisis de datos', '2024-01-15 00:00:00', '2024-02-15 23:59:59', 'Desarrollo de una aplicaci�n para analizar grandes conjuntos de datos.'),
('Mejora de la seguridad de una aplicaci�n de banca en l�nea', '2024-02-01 00:00:00', '2024-03-01 23:59:59', 'Revisi�n y mejora de la seguridad de una aplicaci�n financiera en l�nea.'),
('Desarrollo de un sistema de gesti�n de recursos humanos', '2024-02-15 00:00:00', '2024-03-15 23:59:59', 'Creaci�n de un sistema de gesti�n de RRHH para una empresa.'),
('Optimizaci�n de la infraestructura de servidor', '2024-03-01 00:00:00', '2024-04-01 23:59:59', 'Mejora del rendimiento y la eficiencia de los servidores de la empresa.'),
('Desarrollo de un portal de e-learning', '2024-03-15 00:00:00', '2024-04-15 23:59:59', 'Creaci�n de un portal de educaci�n en l�nea para cursos y capacitaci�n.'),
('Migraci�n a una plataforma de gesti�n de proyectos', '2024-04-01 00:00:00', '2024-05-01 23:59:59', 'Migraci�n a una nueva plataforma para la gesti�n de proyectos y colaboraci�n.'),
('Desarrollo de un sistema de informaci�n geogr�fica', '2024-04-15 00:00:00', '2024-05-15 23:59:59', 'Creaci�n de un sistema para la visualizaci�n y an�lisis de datos geoespaciales.'),
('Implementaci�n de un sistema de chat en tiempo real', '2024-05-01 00:00:00', '2024-06-01 23:59:59', 'Integraci�n de un sistema de chat en tiempo real en una aplicaci�n existente.');

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
(1000, 'Informe de avance de desarrollo', '2023-10-30 14:15:00', 'Hoy se completaron las primeras etapas del desarrollo del m�dulo de autenticaci�n.'),
(1001, 'Informe de pruebas de migraci�n', '2023-11-05 10:30:00', 'Se realizaron pruebas de migraci�n a la nube y se identificaron algunas �reas de mejora.'),
(1002, 'Informe de lanzamiento de plataforma', '2023-11-10 13:20:00', 'La plataforma de comercio electr�nico se lanzar� oficialmente la pr�xima semana.'),
(1003, 'Informe de revisi�n de base de datos', '2023-11-15 09:45:00', 'Se complet� la revisi�n de la base de datos y se implementaron las mejoras necesarias.'),
(1004, 'Informe de pruebas de aplicaci�n m�vil', '2023-11-20 12:00:00', 'Se realizaron pruebas exhaustivas en la aplicaci�n m�vil de salud y se corrigieron errores identificados.'),
(1005, 'Informe de lanzamiento de CMS', '2023-11-25 16:10:00', 'El sistema de gesti�n de contenidos se lanz� con �xito y est� funcionando correctamente.'),
(1006, 'Informe de retroalimentaci�n de usuarios', '2023-12-01 11:30:00', 'Los usuarios proporcionaron retroalimentaci�n positiva sobre la interfaz de usuario del nuevo m�dulo de administraci�n.'),
(1007, 'Informe de capacitaci�n de seguridad', '2023-12-05 14:00:00', 'La capacitaci�n de seguridad se llev� a cabo seg�n lo programado y se cubrieron temas importantes.'),
(1008, 'Informe de pruebas de seguridad', '2023-12-10 09:15:00', 'Se completaron las pruebas de seguridad en la aplicaci�n de banca en l�nea y se identificaron vulnerabilidades menores.'),
(1009, 'Informe de lanzamiento de RRHH', '2023-12-15 12:45:00', 'El sistema de gesti�n de recursos humanos se lanz� con �xito y se brind� capacitaci�n al personal.'),
(1010, 'Informe de mantenimiento de servidores', '2023-12-20 16:20:00', 'Se realiz� el mantenimiento programado de los servidores y se mejor� el rendimiento.')


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


