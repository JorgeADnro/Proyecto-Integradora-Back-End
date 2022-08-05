CREATE TABLE PERSONAS(
	cvePersona bigint NOT NULL,
	nombre varchar(50) NOT NULL,
	apellidoPat varchar(50) NOT NULL,
	apellidoMat varchar(50) NOT NULL,
	email varchar(150) NULL,
	facebook varchar(200) NULL,
	fechaNacimiento datetime NOT NULL,
	usuario varchar(20) NULL,
	tipoPersona smallint NULL,
	cveAreaAcademica int NULL,
 CONSTRAINT PK_PERSONAS PRIMARY KEY CLUSTERED (cvePersona)
);

CREATE TABLE GE_UNIDADES_ACADEMICAS(
	cveUnidadAcademica smallint NOT NULL,
	clave varchar(20) NULL,
	nombre varchar(200) NULL,
	abreviatura varchar(20) NULL,
	activo bit NULL,
 	CONSTRAINT PK_DIDACTIC PRIMARY KEY CLUSTERED (cveUnidadAcademica)
);

CREATE TABLE GE_PERIODOS(
	cvePeriodo int NOT NULL,
	fechaInicio datetime NULL,
	fechaFin datetime NULL,
	activo bit NULL,
 CONSTRAINT PK_GE_PERIODOS PRIMARY KEY CLUSTERED 
(cvePeriodo)
);
CREATE TABLE CURSO(
	cveCurso int NOT NULL AUTO_INCREMENT,
	cvePersona bigint NOT NULL,
	nombre varchar(250) NOT NULL,
	descripcion varchar(500) NOT NULL,
	numHoras bigint NOT NULL,
	activo bit NOT NULL,
	estatus smallint NULL,
	fechaCreado datetime NULL,
	fechaRevision datetime NULL,
	comentarios varchar(500) NULL,
	tipoCurso smallint NULL,
 CONSTRAINT PK_CURSO PRIMARY KEY CLUSTERED 
(cveCurso)
);

CREATE TABLE AREA_CONOCIMIENTO(
	cveArea int NOT NULL AUTO_INCREMENT,
	descripcion varchar(100) NOT NULL,
	activo bit NOT NULL,
 CONSTRAINT PK_AREA_CONOCIMIENTO PRIMARY KEY CLUSTERED 
(cveArea )
);

CREATE TABLE CE_PROGRAMAS_EDUCATIVOS(
	cvePrograma int NOT NULL,
	nombre varchar(200) NULL,
	abreviatura varchar(20) NULL,
 CONSTRAINT PK_CE_PROGRAMAS_EDUCATIVOS PRIMARY KEY CLUSTERED 
(cvePrograma)
);

CREATE TABLE TEMAS(
	cveTema int NOT NULL AUTO_INCREMENT,
	cveArea int NOT NULL,
	nombre varchar(100) NULL,
	descripcion varchar(250) NOT NULL,
	cvePersona bigint NOT NULL,
	activo bit NULL,
	base bit NULL,
 CONSTRAINT PK_TEMAS PRIMARY KEY CLUSTERED 
(cveTema)
);

CREATE TABLE CHAT(
	cveCreado bigint NOT NULL,
	cveDirigido bigint NOT NULL,
 CONSTRAINT PK_CHAT_1 PRIMARY KEY CLUSTERED 
(cveCreado , cveDirigido)
);

CREATE TABLE COMENTARIOS_FORO(
	cveComentario int NOT NULL AUTO_INCREMENT,
	cveCurso int NOT NULL,
	comentario varchar(500) NOT NULL,
	cvePersona bigint NOT NULL,
	fecha datetime NULL,
 CONSTRAINT PK_COMENTARIOS_FORO PRIMARY KEY CLUSTERED 
(
	cveComentario
));

CREATE TABLE ALUMNO_CURSO(
	cveAlumnoCurso int NOT NULL AUTO_INCREMENT,
	cveCurso int NOT NULL,
	cvePersona bigint NOT NULL,
	estatus smallint NOT NULL,
	calificacionCurso smallint NULL,
	comentarioCurso varchar(500) NULL,
	calificacionPlataforma smallint NULL,
	comentarioPlataforma varchar(500) NULL,
 CONSTRAINT PK_ALUMNO_CURSO_1 PRIMARY KEY CLUSTERED 
(cveAlumnoCurso)
);

CREATE TABLE CE_AREAS_ACADEMICAS(
	cveAreaAcademica int NOT NULL,
	cveUnidadAcademica smallint NULL,
	nombre varchar(150) NULL,
	abreviatura varchar(20) NULL,
	activo bit NULL,
	tipo smallint NULL,
 CONSTRAINT PK_CE_AREAS_ACADEMICAS PRIMARY KEY CLUSTERED 
(
	cveAreaAcademica
));

CREATE TABLE COMENTARIOS_TEMA(
	cveComentario int NOT NULL AUTO_INCREMENT,
	cveTema int NOT NULL,
	comentario varchar(500) NOT NULL,
	cvePersona bigint NOT NULL,
	fecha datetime NULL,
 CONSTRAINT PK_COMENTARIOS_TEMA PRIMARY KEY CLUSTERED 
(cveComentario)
);

CREATE TABLE CALIFICACION_TEMA(
	cveCalificacionTema int NOT NULL AUTO_INCREMENT,
	cveTema int NULL,
	calificacion smallint NULL,
	cveAlumnoCurso int NULL,
 CONSTRAINT PK_CALIFICACION_TEMA_1 PRIMARY KEY CLUSTERED 
(cveCalificacionTema)
);

CREATE TABLE ALUMNOS_TEMA(
	cveAlumnoTema int NOT NULL AUTO_INCREMENT,
	cveAlumnoCurso int NOT NULL,
	cveTema int NOT NULL,
	calificacion float NOT NULL,
	fechaInicio datetime NULL,
	estatus smallint NULL,
	tipo smallint NULL,
	prerequisito int NULL,
 CONSTRAINT PK_CALIFICACION_TEMA PRIMARY KEY CLUSTERED 
(cveAlumnoTema)
);

CREATE TABLE CE_PROGRAMAS_AREAS(
	cveProgramaArea int NOT NULL,
	cvePrograma int NULL,
	cveAreaAcademica int NULL,
 CONSTRAINT PK_CE_PROGRAMAS_AREAS PRIMARY KEY CLUSTERED 
(cveProgramaArea)
);

CREATE TABLE ACTIVIDADES(
	cveActividad int NOT NULL AUTO_INCREMENT,
	cveTema int NOT NULL,
	nombre varchar(250) NOT NULL,
	contenido varchar(1000) NOT NULL,
	tipo smallint NOT NULL,
	estatus bit NULL,
	cveTemaPrerequisito int NULL,
	orden smallint NULL,
	intentos int NULL,
 CONSTRAINT PK_ACTIVIDADES_TEMA PRIMARY KEY CLUSTERED 
(cveActividad)
);

CREATE TABLE COMENTARIOS_CHAT(
	cveComentario int NOT NULL AUTO_INCREMENT,
	cveCreado bigint NOT NULL,
	cveDirigido bigint NOT NULL,
	fecha datetime NULL,
	comentario varchar(250) NULL,
	cvePersona bigint NULL,
 CONSTRAINT PK_COMENTARIOS_CHAT_1 PRIMARY KEY CLUSTERED 
(cveComentario)
);

CREATE TABLE TEMAS_CURSO(
	cveCurso int NOT NULL,
	cveTema int NOT NULL,
	orden smallint NOT NULL,
 CONSTRAINT PK_TEMAS_CURSO PRIMARY KEY CLUSTERED 
(
	cveCurso,
	cveTema)
);

CREATE TABLE PREGUNTAS(
	cvePregunta int NOT NULL AUTO_INCREMENT,
	cveActividad int NOT NULL,
	descripcion varchar(250) NOT NULL,
	tipo smallint NOT NULL,
	nivel smallint NOT NULL,
 CONSTRAINT PK_PREGUNTAS PRIMARY KEY CLUSTERED 
(cvePregunta)
);

CREATE TABLE ALUMNO_ACTIVIDAD(
	cveAlumnoActividad int NOT NULL,
	cveAlumnoCurso int NULL,
	cveActividad int NULL,
	realizada bit NULL,
	intentos int NULL,
 CONSTRAINT PK_ALUMNO_ACTIVIDAD PRIMARY KEY CLUSTERED 
(cveAlumnoActividad)
);

CREATE TABLE OPCIONES_PREGUNTAS(
	cveOpcion int NOT NULL,
	cvePregunta int NOT NULL,
	descripcion varchar(250) NOT NULL,
	ponderacion smallint NOT NULL,
 CONSTRAINT PK_OPCIONES_PREGUNTAS PRIMARY KEY CLUSTERED 
(cveOpcion)
);


CREATE TABLE CALIFICACIONES_QUIZ(
	cveActividad int NOT NULL,
	cveAlumnoCurso int NOT NULL,
	cveOpcion int NOT NULL,
 CONSTRAINT PK_CALIFICACIONES_QUIZ PRIMARY KEY CLUSTERED 
(
	cveActividad,
	cveAlumnoCurso,
	cveOpcion 
)
);

ALTER TABLE ACTIVIDADES ADD CONSTRAINT FK_ACTIVIDADES_TEMA_TEMAS FOREIGN KEY(cveTema)
REFERENCES TEMAS (cveTema);

ALTER TABLE  ACTIVIDADES  ADD  CONSTRAINT FK_ACTIVIDADES_TEMAS FOREIGN KEY(cveTemaPrerequisito)
REFERENCES TEMAS (cveTema);

ALTER TABLE ALUMNO_ACTIVIDAD   ADD  CONSTRAINT FK_ALUMNO_ACTIVIDAD_ACTIVIDADES FOREIGN KEY(cveActividad)
REFERENCES ACTIVIDADES (cveActividad);

ALTER TABLE ALUMNO_ACTIVIDAD   ADD  CONSTRAINT FK_ALUMNO_ACTIVIDAD_ALUMNO_CURSO FOREIGN KEY(cveAlumnoCurso)
REFERENCES ALUMNO_CURSO (cveAlumnoCurso);

ALTER TABLE ALUMNO_CURSO   ADD  CONSTRAINT FK_ALUMNO_CURSO_CURSO FOREIGN KEY(cveCurso)
REFERENCES CURSO (cveCurso);

ALTER TABLE ALUMNO_CURSO   ADD  CONSTRAINT FK_ALUMNO_CURSO_PERSONAS FOREIGN KEY(cvePersona)
REFERENCES PERSONAS (cvePersona);

ALTER TABLE ALUMNOS_TEMA ADD  CONSTRAINT FK_CALIFICACION_TEMA_ALUMNO_CURSO FOREIGN KEY(cveAlumnoCurso)
REFERENCES ALUMNO_CURSO (cveAlumnoCurso);

ALTER TABLE ALUMNOS_TEMA   ADD  CONSTRAINT FK_CALIFICACION_TEMA_TEMAS FOREIGN KEY(cveTema)
REFERENCES TEMAS (cveTema);

ALTER TABLE CALIFICACION_TEMA ADD  CONSTRAINT FK_CALIFICACION_TEMA_ALUMNO_CURSO1 FOREIGN KEY(cveAlumnoCurso)
REFERENCES ALUMNO_CURSO (cveAlumnoCurso);

ALTER TABLE CALIFICACION_TEMA ADD  CONSTRAINT FK_CALIFICACION_TEMA_TEMAS1 FOREIGN KEY(cveTema)
REFERENCES TEMAS (cveTema);

ALTER TABLE CALIFICACIONES_QUIZ   ADD  CONSTRAINT FK_CALIFICACIONES_ACTIVIDADES_ACTIVIDADES_TEMA FOREIGN KEY(cveActividad)
REFERENCES ACTIVIDADES (cveActividad);

ALTER TABLE CALIFICACIONES_QUIZ   ADD  CONSTRAINT FK_CALIFICACIONES_QUIZ_ALUMNO_CURSO FOREIGN KEY (cveAlumnoCurso)
REFERENCES ALUMNO_CURSO (cveAlumnoCurso);

ALTER TABLE CALIFICACIONES_QUIZ   ADD  CONSTRAINT FK_CALIFICACIONES_QUIZ_OPCIONES_PREGUNTAS FOREIGN KEY(cveOpcion)
REFERENCES OPCIONES_PREGUNTAS(cveOpcion);

ALTER TABLE CE_AREAS_ACADEMICAS   ADD  CONSTRAINT FK_CE_AREAS_ACADEMICAS_GE_UNIDADES_ACADEMICAS FOREIGN KEY(cveUnidadAcademica)
REFERENCES GE_UNIDADES_ACADEMICAS (cveUnidadAcademica);

ALTER TABLE CE_PROGRAMAS_AREAS  ADD  CONSTRAINT FK_CE_PROGRAMAS_AREAS_CE_AREAS_ACADEMICAS FOREIGN KEY(cveAreaAcademica)
REFERENCES CE_AREAS_ACADEMICAS (cveAreaAcademica);

ALTER TABLE CE_PROGRAMAS_AREAS   ADD  CONSTRAINT FK_CE_PROGRAMAS_AREAS_CE_PROGRAMAS_EDUCATIVOS FOREIGN KEY(cvePrograma)
REFERENCES CE_PROGRAMAS_EDUCATIVOS (cvePrograma);

ALTER TABLE CHAT  ADD  CONSTRAINT FK_CHAT_PERSONAS FOREIGN KEY(cveCreado)
REFERENCES PERSONAS (cvePersona);

ALTER TABLE CHAT   ADD  CONSTRAINT FK_CHAT_PERSONAS1 FOREIGN KEY(cveDirigido)
REFERENCES PERSONAS (cvePersona);

ALTER TABLE COMENTARIOS_CHAT   ADD  CONSTRAINT FK_COMENTARIOS_CHAT_CHAT1 FOREIGN KEY(cveCreado, cveDirigido)
REFERENCES CHAT (cveCreado, cveDirigido);

ALTER TABLE COMENTARIOS_CHAT   ADD  CONSTRAINT FK_COMENTARIOS_CHAT_PERSONAS FOREIGN KEY(cvePersona)
REFERENCES PERSONAS (cvePersona);

ALTER TABLE COMENTARIOS_FORO   ADD  CONSTRAINT FK_COMENTARIOS_FORO_CURSO FOREIGN KEY(cveCurso)
REFERENCES CURSO (cveCurso);

ALTER TABLE COMENTARIOS_FORO ADD  CONSTRAINT FK_COMENTARIOS_FORO_PERSONAS FOREIGN KEY(cvePersona)
REFERENCES PERSONAS (cvePersona);

ALTER TABLE COMENTARIOS_TEMA ADD  CONSTRAINT FK_COMENTARIOS_TEMA_PERSONAS FOREIGN KEY(cvePersona)
REFERENCES PERSONAS (cvePersona);

ALTER TABLE COMENTARIOS_TEMA   ADD  CONSTRAINT FK_COMENTARIOS_TEMA_TEMAS FOREIGN KEY(cveTema)
REFERENCES TEMAS (cveTema);

ALTER TABLE OPCIONES_PREGUNTAS   ADD  CONSTRAINT FK_OPCIONES_PREGUNTAS_PREGUNTAS FOREIGN KEY(cvePregunta)
REFERENCES PREGUNTAS (cvePregunta)
ON DELETE CASCADE;

ALTER TABLE PREGUNTAS  ADD  CONSTRAINT FK_PREGUNTAS_ACTIVIDADES_TEMA FOREIGN KEY(cveActividad)
REFERENCES ACTIVIDADES (cveActividad);

ALTER TABLE TEMAS  ADD  CONSTRAINT FK_TEMAS_AREA_CONOCIMIENTO FOREIGN KEY(cveArea)
REFERENCES AREA_CONOCIMIENTO (cveArea);

ALTER TABLE TEMAS   ADD  CONSTRAINT FK_TEMAS_PERSONAS FOREIGN KEY(cvePersona)
REFERENCES PERSONAS (cvePersona);

ALTER TABLE TEMAS_CURSO  ADD  CONSTRAINT FK_TEMAS_CURSO_CURSO FOREIGN KEY(cveCurso)
REFERENCES CURSO (cveCurso);

ALTER TABLE TEMAS_CURSO   ADD  CONSTRAINT FK_TEMAS_CURSO_TEMAS FOREIGN KEY(cveTema)
REFERENCES TEMAS (cveTema);

insert into AREA_CONOCIMIENTO(descripcion, activo)values('Programacion',1);
insert into AREA_CONOCIMIENTO( descripcion, activo)values('Base de Datos',1);
insert into AREA_CONOCIMIENTO(descripcion, activo)values('Calculo' ,1);
insert into AREA_CONOCIMIENTO( descripcion, activo)values('Algebra' ,1);
insert into AREA_CONOCIMIENTO( descripcion, activo)values('Formacion Socio Cultural',0);

insert into GE_UNIDADES_ACADEMICAS(cveUnidadAcademica, clave, nombre, abreviatura, activo)
values(1,'Dol','Unidad Academica Dolores Hidalgo','UADH',1);
insert into GE_UNIDADES_ACADEMICAS(cveUnidadAcademica, clave, nombre, abreviatura, activo)
values(2,'Vic','Unidad Academica Victoria','UAV',1);

insert into CE_PROGRAMAS_EDUCATIVOS(cvePrograma, nombre, abreviatura)
values(1,'TSU en Desarrollo de software Multiplataforma','TSUDS');
insert into CE_PROGRAMAS_EDUCATIVOS(cvePrograma, nombre, abreviatura)
values(2,'TSU en Insfraestructura de Redes Digitales','TSUIRD');
insert into CE_PROGRAMAS_EDUCATIVOS(cvePrograma, nombre, abreviatura)
values(3,'TSU en Entornos Virtuales y Negocios Digitales ','TSUEVND');
insert into CE_PROGRAMAS_EDUCATIVOS(cvePrograma, nombre, abreviatura)
values(4,'TSU en Diseño digital','TSUDD');

insert into CE_AREAS_ACADEMICAS(cveAreaAcademica, cveUnidadAcademica, nombre, abreviatura, activo, tipo)
values(1,1,'Tecnologías de la Información y Comunicación','TIC',1,1);
insert into CE_AREAS_ACADEMICAS(cveAreaAcademica, cveUnidadAcademica, nombre, abreviatura, activo, tipo)
values(2,1,'Económico Administrativo','EA',1,1);
insert into CE_AREAS_ACADEMICAS(cveAreaAcademica, cveUnidadAcademica, nombre, abreviatura, activo, tipo)
values(3,1,'Industrial,Eléctrica y Electrónica','IEE',1,1);

Insert Into PERSONAS(cvePersona, nombre, apellidoPat, apellidoMat, email, facebook, fechaNacimiento, usuario, tipoPersona,cveAreaAcademica)
values (1221100879,'Itzel Alessandra', 'Fuentes', 'Cabrera', 'itzelfuentescabrera@gmail.com',null,'2002/03/04','alessafuentes',1,1);

Insert Into PERSONAS(cvePersona, nombre, apellidoPat, apellidoMat, email, facebook, fechaNacimiento, usuario, tipoPersona,cveAreaAcademica)
values (1221100305,'Jorge Luis', 'Ayala', 'Manrique', 'jorgelamanrique@gmail.com',null,'2003/06/04','jorgea',1,1);

Insert Into PERSONAS(cvePersona, nombre, apellidoPat, apellidoMat, email, facebook, fechaNacimiento, usuario, tipoPersona,cveAreaAcademica)
values (1221100720,'Daniel Alexander', 'Gutiérrez', 'Alcaraz','danielgutierrezalcaraz@gmail.com',null,'2003/01/09','daniel',1,1);

insert into PERSONAS(cvePersona, nombre, apellidoPat, apellidoMat, email, facebook, fechaNacimiento, usuario, tipoPersona, cveAreaAcademica)
values (1221100328,'Cruz Estrella ','Juarez','Soto','estrellajuarez8sot@gmail.com',null,'2003/06/30','estrellasoto',1,1);

insert into PERSONAS(cvePersona, nombre, apellidoPat, apellidoMat, email, facebook, fechaNacimiento, usuario, tipoPersona, cveAreaAcademica)
values (1221100353,'Angel Gerardo','Velazquez','Salasar','angelgerardovelazquez05@gmail.com',null,'2003/01/27','angel02',1,1);

insert into PERSONAS(cvePersona, nombre, apellidoPat, apellidoMat, email, facebook, fechaNacimiento, usuario, tipoPersona, cveAreaAcademica)
values (1221100342,'Cesar Alegandro','Ordoñez','Osorio','ordonezosoriocesar@gmail.com',null,'1999/11/18','disxon03',1,1);

insert into PERSONAS(cvePersona, nombre, apellidoPat, apellidoMat, email, facebook, fechaNacimiento, usuario, tipoPersona, cveAreaAcademica)
values (1221100300,'Jose Manuel','Sanchez','Arredondo','ordonezosoriocesar@gmail.com',null,'1999/10/20','Jsanchez',1,1);

insert into PERSONAS(cvePersona, nombre, apellidoPat, apellidoMat, email, facebook, fechaNacimiento, usuario, tipoPersona, cveAreaAcademica)
values (1221100674,'Juan Antonio','Rincon','Torres','ordonezosoriocesar@gmail.com',null,'2003/06/10','JuanAntonio',1,1);

insert into PERSONAS(cvePersona, nombre, apellidoPat, apellidoMat, email, facebook, fechaNacimiento, usuario, tipoPersona, cveAreaAcademica)
values (500,'Ricardo','Muro','Gomez','ricardomurog1@gmail.com',null,'1972/06/08','rmuro',2,1);

insert into PERSONAS(cvePersona, nombre, apellidoPat, apellidoMat, email, facebook, fechaNacimiento, usuario, tipoPersona, cveAreaAcademica)
values (501,'Maria Teresa','Diaz','Robledo','teresadiaz@utng.edu.mx',null,'1972/06/08','tdiaz',2,1);

insert into PERSONAS(cvePersona, nombre, apellidoPat, apellidoMat, email, facebook, fechaNacimiento, usuario, tipoPersona, cveAreaAcademica)
values (502,'Apolinar','Trejo','Cuevas','apolinartrejo@utng.edu.mx',null,'1967/06/25','atrejo',2,1);

insert into PERSONAS(cvePersona, nombre, apellidoPat, apellidoMat, email, facebook, fechaNacimiento, usuario, tipoPersona, cveAreaAcademica)
values (600,'Administrador','utng','Dolores',null,null,'2022/07/21','admin',3,1);

ALTER TABLE CURSO  ADD  CONSTRAINT FK_Persona FOREIGN KEY(cvePersona)
REFERENCES PERSONAS (cvePersona);

insert into CURSO(cvePersona, nombre, descripcion, numHoras, activo, estatus, fechaCreado, fechaRevision, comentarios, tipoCurso)
values(500,'Base de Datos Relacionales','Comandos Básicos de sql server',20,1,1,'2022/07/21','2022/07/21',null,1);

insert into CURSO(cvePersona, nombre, descripcion, numHoras, activo, estatus, fechaCreado, fechaRevision, comentarios, tipoCurso)
values(501,'Aplicaciones Web','Programación Web',90,1,0,'2022/07/21',null,null,1);

insert into CE_PROGRAMAS_AREAS(cveProgramaArea, cvePrograma, cveAreaAcademica) values (1,1,1);

insert into CE_PROGRAMAS_AREAS(cveProgramaArea, cvePrograma, cveAreaAcademica) values (2,2,1);

insert into CE_PROGRAMAS_AREAS(cveProgramaArea, cvePrograma, cveAreaAcademica) values (3,3,1);

insert into CE_PROGRAMAS_AREAS(cveProgramaArea, cvePrograma, cveAreaAcademica) values (4,4,1);


insert into GE_PERIODOS(cvePeriodo, fechaInicio, fechaFin, activo) values (1,'2022/05/02','2022/08/12',1);

insert into GE_PERIODOS(cvePeriodo, fechaInicio, fechaFin, activo) values (2,'2022/08/29','2022/12/09',1);

insert into GE_PERIODOS(cvePeriodo, fechaInicio, fechaFin, activo) values (3,'2023/01/09','2023/04/14',1);

insert into TEMAS( cveArea, nombre, descripcion, cvePersona, activo, base) 
values (2,'Procedimientos Alamacenados','Realizar soluciones logicas atravez de procedimientos almacenados',500,1,1);

insert into TEMAS( cveArea, nombre, descripcion, cvePersona, activo, base)
values (1,'Programacion orientada a objetos ','Paradigma de programacion POO',502,1,1);

insert into ACTIVIDADES(cveTema, nombre, contenido, tipo, estatus, cveTemaPrerequisito, orden, intentos)
values(2,'Diseño de Clases','Diseñar clases de objetos usando UML',1,1,null,1,3);

insert into ACTIVIDADES(cveTema, nombre, contenido, tipo, estatus, cveTemaPrerequisito, orden, intentos)
values(2,'Codificación de clases','Codificar clases usando Java ',1,1,null,2,3);

insert into TEMAS_CURSO(cveCurso, cveTema, orden) values (2,1,1);

insert into TEMAS_CURSO(cveCurso, cveTema, orden) values (2,2,2);

insert into ALUMNO_CURSO(cveCurso, cvePersona, estatus, calificacionCurso, comentarioCurso, calificacionPlataforma, comentarioPlataforma)
values(1,1221100879,1,0,null,0,null);

insert into ALUMNO_CURSO(cveCurso, cvePersona, estatus, calificacionCurso, comentarioCurso, calificacionPlataforma, comentarioPlataforma)
values(1,1221100305,1,0,null,0,null);

insert into ALUMNO_CURSO(cveCurso, cvePersona, estatus, calificacionCurso, comentarioCurso, calificacionPlataforma, comentarioPlataforma)
values(1,1221100720,1,0,null,0,null);