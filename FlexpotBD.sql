

create database DeveloperSquad
use DeveloperSquad

CREATE TABLE Usuario (
    idUsuario INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(255),
    correoElectronico VARCHAR(255),
    fechaNacimiento DATE,
    rol VARCHAR(50),
    activo BIT
);
CREATE TABLE Sala (
    idSala INT NOT NULL PRIMARY KEY,
    idUsuario INT,
    nombre VARCHAR(255),
    capacidad INT,
    ubicacion VARCHAR(255),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);



CREATE TABLE Notificacion (
    idNotificacion INT NOT NULL PRIMARY KEY,
    mensaje VARCHAR(255),
    fechaEnvio DATETIME,
    leido BIT
);

CREATE TABLE UsuarioNotificacion (
    idUsuario INT NOT NULL,
    idNotificacion INT NOT NULL,
    PRIMARY KEY (idUsuario, idNotificacion),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idNotificacion) REFERENCES Notificacion(idNotificacion)
);

CREATE TABLE Proyecto (
    idProyecto INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(255),
    fechaInicio DATETIME,
    fechaFin DATETIME,
    descripcion TEXT,
    idUsuarioResponsable INT,
    FOREIGN KEY (idUsuarioResponsable) REFERENCES Usuario(idUsuario)
);

CREATE TABLE UsuarioProyecto (
    idUsuario INT NOT NULL,
    idProyecto INT NOT NULL,
    PRIMARY KEY (idUsuario, idProyecto),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idProyecto) REFERENCES Proyecto(idProyecto)
);

CREATE TABLE Asistencia (
    idAsistencia INT NOT NULL PRIMARY KEY,
    idUsuario INT,
    fechaRegistro DATETIME,
    estado VARCHAR(50),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Reunion (
    idReunion INT NOT NULL PRIMARY KEY,
    idSala INT,
    idUsuario INT,
	idAsistencia INT,
    fechaReunion DATETIME,
    duracionReunion INT,
    presencial BIT,
    FOREIGN KEY (idSala) REFERENCES Sala(idSala),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
	FOREIGN KEY (idAsistencia) REFERENCES Asistencia(idAsistencia)
);


CREATE TABLE Grabacion (
    idGrabacion INT NOT NULL PRIMARY KEY,
    nombreArchivo VARCHAR(255),
    fechaGrabacion DATETIME,
    duracion INT,
    idSala INT,
    idUsuario INT,
    FOREIGN KEY (idSala) REFERENCES Sala(idSala),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);



CREATE TABLE Informe (
    idInforme INT NOT NULL PRIMARY KEY,
    titulo VARCHAR(255),
    fechaCreacion DATETIME,
    contenido TEXT,
    idUsuario INT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);


CREATE TABLE Tarea (
    idTarea INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(255),
    fechaEntrega DATETIME,
    fechaInicio DATETIME,
    descripcion TEXT,
    estado VARCHAR(50),
    idInforme INT,
    FOREIGN KEY (idInforme) REFERENCES Informe(idInforme)
);

CREATE TABLE ProyectoTarea (
    idProyecto INT NOT NULL,
    idTarea INT NOT NULL,
    PRIMARY KEY (idProyecto, idTarea),
    FOREIGN KEY (idProyecto) REFERENCES Proyecto(idProyecto),
    FOREIGN KEY (idTarea) REFERENCES Tarea(idTarea)
);

CREATE TABLE Mensaje (
    idMensaje INT NOT NULL PRIMARY KEY,
    contenido TEXT,
    fechaEnvio DATETIME,
    idUsuario INT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);


CREATE TABLE Horario (
    idHorario INT NOT NULL PRIMARY KEY,
    idUsuario INT,
    horaInicio TIME,
    horaFin TIME,
    diaSemana VARCHAR(50),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);


CREATE TABLE ConfirmacionAsistencia (
    idConfirmacionAsistencia INT NOT NULL PRIMARY KEY,
    idReunion INT,
    pregunta VARCHAR(255),
    FOREIGN KEY (idReunion) REFERENCES Reunion(idReunion)
);

CREATE TABLE RespuestaAsistencia (
    idRespuestaAsistencia INT NOT NULL PRIMARY KEY,
    idUsuario INT NOT NULL,
    idConfirmacionAsistencia INT NOT NULL,
    respuesta VARCHAR(255),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idConfirmacionAsistencia) REFERENCES ConfirmacionAsistencia(idConfirmacionAsistencia)
);

--------------------------------------------------
INSERT INTO dbo.Usuario(idUsuario,nombre, correoElectronico, rol, activo)
VALUES
(1,'Maria Lopez', 'marialopez@example.com', 'Administrador', 1),
(2,'Javier Garcia', 'javiergarcia@example.com', 'Usuario Regular', 1),
(3,'Ana Martinez', 'anamartinez@example.com', 'Usuario Regular', 0),
(4,'Carlos Rodriguez', 'carlosrodriguez@example.com', 'Moderador', 1),
(5,'Sofia Perez', 'sofiaperez@example.com', 'Usuario Regular', 1),
(6,'Manuel Fernandez', 'manuelfernandez@example.com', 'Moderador', 0),
(7,'Laura Gonzalez', 'lauragonzalez@example.com', 'Usuario Regular', 1),
(8,'Antonio Torres', 'antoniotorres@example.com', 'Administrador', 0),
(9,'Carmen Ramirez', 'carmenramirez@example.com', 'Usuario Regular', 1),
(10,'Diego Sanchez', 'diegosanchez@example.com', 'Moderador', 1)

select * from Usuario


INSERT INTO Informe (idInforme, titulo, fechaCreacion, contenido, idUsuario)
VALUES
(1, 'Informe Mensual de Proyectos', '2023-11-01 09:30:00', 'Resumen mensual de avances y desafíos en los proyectos actuales.', 1),
(2, 'Informe de Calidad de Software', '2023-11-05 14:15:00', 'Evaluación de la calidad del software con recomendaciones para mejoras.', 2),
(3, 'Informe de Marketing Digital', '2023-11-10 11:45:00', 'Resultados de la campaña de marketing digital del último trimestre.', 3),
(4, 'Informe de Ventas Mensual', '2023-11-15 13:20:00', 'Análisis de las ventas mensuales con proyecciones para el próximo año.', 4),
(5, 'Informe de Seguridad de la Red', '2023-11-20 10:00:00', 'Evaluación de la seguridad de la red y medidas recomendadas para fortalecerla.', 5),
(6, 'Informe de Desempeño del Equipo', '2023-11-25 15:30:00', 'Revisión del desempeño individual y colectivo del equipo de trabajo.', 6),
(7, 'Informe de Capacitación Interna', '2023-12-01 12:00:00', 'Efectividad de la capacitación interna y áreas de mejora identificadas.', 7),
(8, 'Informe de Incidentes de Seguridad', '2023-12-05 14:45:00', 'Registro de incidentes de seguridad y acciones tomadas para abordarlos.', 8),
(9, 'Informe de Satisfacción del Cliente', '2023-12-10 09:15:00', 'Resultados de encuestas de satisfacción del cliente y planes de mejora.', 9),
(10, 'Informe de Presupuesto Anual', '2023-12-15 16:00:00', 'Desglose del presupuesto anual y seguimiento del gasto real.', 10);

select * from Informe



INSERT INTO Tarea (idTarea,idInforme,nombre, fechaEntrega, fechaInicio, descripcion, estado)
VALUES
(1,1,'Desarrollo de la función de registro', '2023-10-30 14:00:00', '2023-10-25 10:00:00', 'Implementación de la función de registro de usuarios en la aplicación.', 'En progreso'),
(2,2,'Prueba de rendimiento del servidor', '2023-11-05 16:30:00', '2023-10-27 08:45:00', 'Realización de pruebas de carga para evaluar el rendimiento del servidor.', 'Pendiente'),
(3,3,'Revisión de documentación técnica', '2023-11-10 13:15:00', '2023-10-29 11:20:00', 'Revisión de la documentación técnica de la aplicación para asegurarse de que esté actualizada.', 'Completada'),
(4,4,'Desarrollo de la interfaz de usuario', '2023-11-15 09:45:00', '2023-10-31 14:30:00', 'Diseño e implementación de la interfaz de usuario de la aplicación.', 'En progreso'),
(5,5,'Pruebas de usabilidad', '2023-11-20 12:30:00', '2023-11-02 07:55:00', 'Realización de pruebas de usabilidad con usuarios beta.', 'Pendiente'),
(6,6,'Reunión de revisión del proyecto', '2023-11-25 15:20:00', '2023-11-04 10:15:00', 'Reunión de revisión del proyecto con el equipo de desarrollo.', 'Completada'),
(7,7,'Optimización de base de datos', '2023-11-30 10:00:00', '2023-11-10 14:30:00', 'Optimización y ajuste de rendimiento de la base de datos del sistema.', 'Pendiente'),
(8,8,'Desarrollo de módulo de notificaciones', '2023-12-05 11:45:00', '2023-11-15 09:30:00', 'Implementación del módulo de notificaciones para alertar a los usuarios.', 'En progreso'),
(9,9,'Prueba de seguridad de la aplicación', '2023-12-10 14:30:00', '2023-11-20 08:15:00', 'Realización de pruebas de seguridad para identificar vulnerabilidades.', 'Pendiente'),
(10,10,'Mejoras en la interfaz de usuario', '2023-12-15 09:15:00', '2023-11-25 13:45:00', 'Implementación de mejoras visuales en la interfaz de usuario.', 'En progreso')

select * from Tarea


INSERT INTO Sala (idSala, idUsuario, nombre, capacidad, ubicacion)
VALUES
(1, 1, 'Sala1', 20, 'Piso 5, Ala A'),
(2, 2, 'Sala2', 15, 'Piso 3, Ala B'),
(3, 3, 'Sala3', 30, 'Piso 2, Ala C'),
(4, 4, 'Sala4', 25, 'Piso 4, Ala A'),
(5, 5, 'Sala5', 18, 'Piso 1, Ala B'),
(6, 6, 'Sala6', 22, 'Piso 6, Ala C'),
(7, 7, 'Sala7', 28, 'Piso 3, Ala A'),
(8, 8, 'Sala8', 35, 'Piso 2, Ala B'),
(9, 9, 'Sala9', 16, 'Piso 4, Ala C'),
(10, 10, 'Sala10', 40, 'Piso 1, Ala A');
select * from Sala


INSERT INTO Asistencia (idAsistencia, idUsuario, fechaRegistro, estado)
VALUES
(1, 1, '2023-01-01 08:00:00', 'Presente'),
(2, 2, '2023-02-01 09:30:00', 'Ausente'),
(3, 3, '2023-03-01 10:45:00', 'Tardío'),
(4, 4, '2023-04-01 11:15:00', 'Presente'),
(5, 5, '2023-05-01 12:30:00', 'Ausente'),
(6, 6, '2023-06-01 13:45:00', 'Tardío'),
(7, 7, '2023-07-01 14:00:00', 'Presente'),
(8, 8, '2023-08-01 15:15:00', 'Ausente'),
(9, 9, '2023-09-01 16:30:00', 'Tardío'),
(10, 10, '2023-10-01 17:45:00', 'Presente');

select * from Asistencia


INSERT INTO Reunion (idReunion, idSala, idUsuario,idAsistencia, fechaReunion, duracionReunion, presencial)
VALUES
(1, 1, 1, 1,'2023-11-01 09:00:00', 60, 1),
(2, 2, 2, 2,'2023-11-02 14:30:00', 45, 0),
(3, 3, 3, 3,'2023-11-03 11:15:00', 90, 1),
(4, 4, 4, 4,'2023-11-04 10:00:00', 75, 0),
(5, 5, 5, 5,'2023-11-05 13:45:00', 120, 1),
(6, 6, 6, 6,'2023-11-06 16:30:00', 30, 0),
(7, 7, 7, 7,'2023-11-07 12:20:00', 45, 1),
(8, 8, 8, 8,'2023-11-08 09:45:00', 60, 0),
(9, 9, 9, 9,'2023-11-09 15:15:00', 90, 1),
(10, 10, 10, 10,'2023-11-10 14:00:00', 75, 0);

select * from Reunion

INSERT INTO Notificacion (idNotificacion, mensaje, fechaEnvio, leido)
VALUES
(1, 'Notificación 1', '2023-11-01 08:00:00', 0),
(2, 'Notificación 2', '2023-11-02 10:30:00', 1),
(3, 'Notificación 3', '2023-11-03 14:15:00', 0),
(4, 'Notificación 4', '2023-11-04 11:45:00', 1),
(5, 'Notificación 5', '2023-11-05 09:30:00', 0),
(6, 'Notificación 6', '2023-11-06 16:00:00', 1),
(7, 'Notificación 7', '2023-11-07 12:45:00', 0),
(8, 'Notificación 8', '2023-11-08 14:30:00', 1),
(9, 'Notificación 9', '2023-11-09 10:15:00', 0),
(10, 'Notificación 10', '2023-11-10 13:00:00', 1);

select * from Notificacion

INSERT INTO UsuarioNotificacion (idUsuario, idNotificacion)
VALUES
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

select * from UsuarioNotificacion

INSERT INTO Proyecto (idProyecto, nombre, fechaInicio, fechaFin, descripcion, idUsuarioResponsable)
VALUES
(1, 'Proyecto A', '2023-01-01 08:00:00', '2023-12-31 17:00:00', 'Descripción del Proyecto A.', 1),
(2, 'Proyecto B', '2023-02-01 09:30:00', '2023-11-30 16:45:00', 'Descripción del Proyecto B.', 2),
(3, 'Proyecto C', '2023-03-01 10:45:00', '2023-10-31 15:30:00', 'Descripción del Proyecto C.', 3),
(4, 'Proyecto D', '2023-04-01 11:15:00', '2023-09-30 14:20:00', 'Descripción del Proyecto D.', 4),
(5, 'Proyecto E', '2023-05-01 12:30:00', '2023-08-31 13:00:00', 'Descripción del Proyecto E.', 5),
(6, 'Proyecto F', '2023-06-01 13:45:00', '2023-07-31 12:45:00', 'Descripción del Proyecto F.', 6),
(7, 'Proyecto G', '2023-07-01 14:00:00', '2023-06-30 11:30:00', 'Descripción del Proyecto G.', 7),
(8, 'Proyecto H', '2023-08-01 15:15:00', '2023-05-31 10:15:00', 'Descripción del Proyecto H.', 8),
(9, 'Proyecto I', '2023-09-01 16:30:00', '2023-04-30 09:30:00', 'Descripción del Proyecto I.', 9),
(10, 'Proyecto J', '2023-10-01 17:45:00', '2023-03-31 08:45:00', 'Descripción del Proyecto J.', 10);

select * from Proyecto

INSERT INTO UsuarioProyecto (idUsuario, idProyecto)
VALUES
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

select * from UsuarioProyecto



INSERT INTO Grabacion (idGrabacion, nombreArchivo, fechaGrabacion, duracion, idSala, idUsuario)
VALUES
(1, 'Grabacion_A.mp4', '2023-01-01 08:00:00', 60, 1, 1),
(2, 'Grabacion_B.mp4', '2023-02-01 09:30:00', 45, 2, 2),
(3, 'Grabacion_C.mp4', '2023-03-01 10:45:00', 30, 3, 3),
(4, 'Grabacion_D.mp4', '2023-04-01 11:15:00', 75, 4, 4),
(5, 'Grabacion_E.mp4', '2023-05-01 12:30:00', 50, 5, 5),
(6, 'Grabacion_F.mp4', '2023-06-01 13:45:00', 40, 6, 6),
(7, 'Grabacion_G.mp4', '2023-07-01 14:00:00', 55, 7, 7),
(8, 'Grabacion_H.mp4', '2023-08-01 15:15:00', 65, 8, 8),
(9, 'Grabacion_I.mp4', '2023-09-01 16:30:00', 70, 9, 9),
(10, 'Grabacion_J.mp4', '2023-10-01 17:45:00', 80, 10, 10);

select * from Grabacion

INSERT INTO ProyectoTarea (idProyecto, idTarea)
VALUES
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

select * from ProyectoTarea

INSERT INTO Mensaje (idMensaje, contenido, fechaEnvio, idUsuario)
VALUES
(1, 'Hola, ¿cómo estás?', '2023-11-01 09:30:00', 1),
(2, 'Recuerda la reunión de mañana.', '2023-11-05 14:15:00', 2),
(3, '¡Buen trabajo en el proyecto!', '2023-11-10 11:45:00', 3),
(4, 'Tenemos una nueva actualización disponible.', '2023-11-15 13:20:00', 4),
(5, '¿Puedes revisar este informe?', '2023-11-20 10:00:00', 5),
(6, 'Confirmado para la reunión de la próxima semana.', '2023-11-25 15:30:00', 6),
(7, 'Se ha enviado la documentación necesaria.', '2023-12-01 12:00:00', 7),
(8, 'Importante: Cambio en la fecha de entrega.', '2023-12-05 14:45:00', 8),
(9, '¡Felices fiestas a todos!', '2023-12-10 09:15:00', 9),
(10, 'Revisemos estos problemas en la llamada.', '2023-12-15 16:00:00', 10);

select * from Mensaje

INSERT INTO Horario (idHorario, idUsuario, horaInicio, horaFin, diaSemana)
VALUES
(1, 1, '08:00:00', '17:00:00', 'Lunes'),
(2, 2, '09:00:00', '18:00:00', 'Martes'),
(3, 3, '10:00:00', '19:00:00', 'Miércoles'),
(4, 4, '08:30:00', '17:30:00', 'Jueves'),
(5, 5, '11:00:00', '20:00:00', 'Viernes'),
(6, 6, '08:00:00', '17:00:00', 'Lunes'),
(7, 7, '09:30:00', '18:30:00', 'Martes'),
(8, 8, '10:30:00', '19:30:00', 'Miércoles'),
(9, 9, '08:45:00', '17:45:00', 'Jueves'),
(10, 10, '11:30:00', '20:30:00', 'Viernes');

select * from Horario

INSERT INTO ConfirmacionAsistencia (idConfirmacionAsistencia, idReunion, pregunta)
VALUES
(1, 1, '¿Confirmarás tu asistencia a la reunión?'),
(2, 2, '¿Tienes algún tema específico que te gustaría tratar en la reunión?'),
(3, 3, '¿Necesitarás algún material adicional para la reunión?'),
(4, 4, '¿Tienes alguna restricción alimentaria para el catering de la reunión?'),
(5, 5, '¿Puedes proporcionar una breve actualización sobre tu área de trabajo?'),
(6, 6, '¿Hay algún impedimento para tu participación en la reunión de la próxima semana?'),
(7, 7, '¿Confirmas tu disponibilidad para la capacitación interna?'),
(8, 8, '¿Has identificado algún riesgo de seguridad que debamos abordar?'),
(9, 9, '¿Cómo calificarías tu nivel de satisfacción con los últimos cambios en el proyecto?'),
(10, 10, '¿Necesitas algún soporte técnico antes de la llamada programada?');

select * from ConfirmacionAsistencia

INSERT INTO RespuestaAsistencia (idRespuestaAsistencia, idUsuario, idConfirmacionAsistencia, respuesta)
VALUES
(1, 1, 1, 'Sí, confirmaré mi asistencia.'),
(2, 2, 2, 'No, no tengo temas específicos para tratar.'),
(3, 3, 3, 'No necesitaré material adicional.'),
(4, 4, 4, 'No tengo restricciones alimentarias.'),
(5, 5, 5, 'Proporcionaré una actualización detallada.'),
(6, 6, 6, 'Confirmo mi disponibilidad para la próxima reunión.'),
(7, 7, 7, 'Sí, confirmo mi participación en la capacitación.'),
(8, 8, 8, 'No he identificado riesgos de seguridad.'),
(9, 9, 9, 'Estoy satisfecho con los cambios en el proyecto.'),
(10, 10, 10, 'No necesito soporte técnico previo a la llamada.');
select * from RespuestaAsistencia


