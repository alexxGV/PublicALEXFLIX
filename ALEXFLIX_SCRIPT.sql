/*DROPS*/
DROP TABLE Generos;
DROP TABLE Peliculas;
DROP TABLE PeliculasActores;
DROP TABLE Actores;
DROP VIEW PELICULASACTORESUNION;
DROP TABLE Comentarios;
DROP TABLE GenerosUsers;
DROP TABLE Users;
DROP TABLE USUARIOSPELICULAS;

/****** Object:  Table [dbo].[Peliculas]    Script Date: 17/02/2021 14:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas](
	[IdPelicula] [int] NOT NULL,
	[Titulo] [nvarchar](50) NOT NULL,
	[IdGenero] [int] NOT NULL,
	[Sinopsis] [nvarchar](max) NULL,
	[Valoracion] [int] NOT NULL,
	[Duracion] [int] NOT NULL,
	[Imagen] [nvarchar](50) NULL,
	[Trailer] [nvarchar](50) NULL,
 CONSTRAINT [PK_Peliculas] PRIMARY KEY CLUSTERED 
(
	[IdPelicula] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeliculasActores]    Script Date: 17/02/2021 14:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeliculasActores](
	[IdPA] [int] NOT NULL,
	[IdPelicula] [int] NOT NULL,
	[IdActor] [int] NOT NULL,
 CONSTRAINT [PK_PeliculasActores] PRIMARY KEY CLUSTERED 
(
	[IdPA] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actores]    Script Date: 17/02/2021 14:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actores](
	[IdActor] [int] NOT NULL,
	[Actor] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Actores] PRIMARY KEY CLUSTERED 
(
	[IdActor] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PELICULASACTORESUNION]    Script Date: 17/02/2021 14:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PELICULASACTORESUNION]
AS
SELECT          pa.IdPA, p.IdPelicula, a.IdActor, a.Actor
FROM              dbo.Peliculas AS p INNER JOIN
                            dbo.PeliculasActores AS pa ON p.IdPelicula = pa.IdPelicula INNER JOIN
                            dbo.Actores AS a ON pa.IdActor = a.IdActor
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 17/02/2021 14:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios](
	[IdComentario] [int] NOT NULL,
	[IdPelicula] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Comentario] [varchar](255) NOT NULL,
	[Valoracion] [int] NOT NULL,
 CONSTRAINT [PK_Comentarios] PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 17/02/2021 14:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[IdGenero] [int] NOT NULL,
	[Genero] [nvarchar](50) NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[IdGenero] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenerosUsers]    Script Date: 17/02/2021 14:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenerosUsers](
	[IdUser] [int] NOT NULL,
	[IdGenero] [int] NOT NULL,
 CONSTRAINT [PK_GenerosUsers] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC,
	[IdGenero] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 17/02/2021 14:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRol] [int] NOT NULL,
	[Rol] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/02/2021 14:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUser] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[salt] [nvarchar](50) NOT NULL,
	[Password] [binary](32) NOT NULL,
	[Rol] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOSPELICULAS]    Script Date: 17/02/2021 14:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOSPELICULAS](
	[IdUP] [int] NOT NULL,
	[IdUsuario] [int] NULL,
	[IdPelicula] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUP] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Actores] ([IdActor], [Actor]) VALUES (0, N'Michael Jordan')
INSERT [dbo].[Actores] ([IdActor], [Actor]) VALUES (1, N'CONEJO')
INSERT [dbo].[Actores] ([IdActor], [Actor]) VALUES (2, N'Angelina Jolie')
GO
INSERT [dbo].[Comentarios] ([IdComentario], [IdPelicula], [IdUsuario], [Comentario], [Valoracion]) VALUES (0, 0, 0, N'Comentario 0', 4)
INSERT [dbo].[Comentarios] ([IdComentario], [IdPelicula], [IdUsuario], [Comentario], [Valoracion]) VALUES (1, 0, 0, N'Pelicula buenisima con la aparicion del segundo mejor jugador del mundo MJ', 5)
INSERT [dbo].[Comentarios] ([IdComentario], [IdPelicula], [IdUsuario], [Comentario], [Valoracion]) VALUES (2, 0, 0, N'Hola este comentario esta hecho desde el usuario', 5)
INSERT [dbo].[Comentarios] ([IdComentario], [IdPelicula], [IdUsuario], [Comentario], [Valoracion]) VALUES (3, 0, 1, N'COMENTARIO CREADO DESDE USUARIO', 2)
INSERT [dbo].[Comentarios] ([IdComentario], [IdPelicula], [IdUsuario], [Comentario], [Valoracion]) VALUES (4, 0, 0, N'Pelicula Buenisima, comentario creado por el usuario Alex', 5)
INSERT [dbo].[Comentarios] ([IdComentario], [IdPelicula], [IdUsuario], [Comentario], [Valoracion]) VALUES (5, 1, 0, N'Malefica un peliculon', 5)
INSERT [dbo].[Comentarios] ([IdComentario], [IdPelicula], [IdUsuario], [Comentario], [Valoracion]) VALUES (6, 2, 0, N'TEAM KONG SIEMPRE!!!', 5)
INSERT [dbo].[Comentarios] ([IdComentario], [IdPelicula], [IdUsuario], [Comentario], [Valoracion]) VALUES (7, 2, 1, N'Team cocodrillo', 3)
INSERT [dbo].[Comentarios] ([IdComentario], [IdPelicula], [IdUsuario], [Comentario], [Valoracion]) VALUES (8, 0, 1, N'Esta realizado desde la actualización de Usuarios con CONTEXT', 5)
INSERT [dbo].[Comentarios] ([IdComentario], [IdPelicula], [IdUsuario], [Comentario], [Valoracion]) VALUES (9, 0, 1, N'Comentario después de q las estrellas sean de color siempre', 4)
INSERT [dbo].[Comentarios] ([IdComentario], [IdPelicula], [IdUsuario], [Comentario], [Valoracion]) VALUES (10, 5, 1, N'La pelicula de mi vida', 5)
INSERT [dbo].[Comentarios] ([IdComentario], [IdPelicula], [IdUsuario], [Comentario], [Valoracion]) VALUES (11, 0, 10, N'Peliculon MJ el mejor', 3)
INSERT [dbo].[Comentarios] ([IdComentario], [IdPelicula], [IdUsuario], [Comentario], [Valoracion]) VALUES (12, 22, 0, N'ES una mierda', 1)
GO
INSERT [dbo].[Generos] ([IdGenero], [Genero]) VALUES (0, N'Dibujos')
INSERT [dbo].[Generos] ([IdGenero], [Genero]) VALUES (1, N'Accion')
INSERT [dbo].[Generos] ([IdGenero], [Genero]) VALUES (2, N'Terror')
INSERT [dbo].[Generos] ([IdGenero], [Genero]) VALUES (3, N'Ciencia Ficcion')
GO
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (0, N'Space Jam', 0, N'El Sr. Swackhammer, un tiránico alien dueño del parque de atracciones extraterrestre Montaña Tontolandia busca novedades para su parque. Por eso manda a un grupo de sirvientes, los Nerdlucks, un grupo de pequeños extraterrestres, para secuestrar a los Looney Tunes y convertirlos en la mayor atracción de todas.', 5, 88, N'SpaceJam2.jpg', N'space_jam.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (1, N'Malefica', 0, N'La joven Maléfica crece para proteger su pacífico reino de los invasores, pero una terrible traición transforma su corazón puro en una piedra y la convierte en una criatura en busca de venganza.', 5, 97, N'malefica.jpg', N'malefica_trailer.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (2, N'King Kong vs gozilla', 1, N'Godzilla y Kong, dos de las fuerzas más poderosas de un planeta habitado por aterradoras criaturas, se enfrentan en un espectacular combate que sacude los cimientos de la humanidad. Monarch se embarca en una misión de alto riesgo y pone rumbo hacia territorios inexplorados para descubrir los orígenes de estos dos titanes, en un último esfuerzo por tratar de salvar a dos bestias que parecen tener las horas contadas sobre la faz de la Tierra.', 5, 172, N'kongvsgozilla.jpg', N'Godzilla vs. Kong – Trailer Oficial.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (3, N'Up', 0, N'Carl Fredricksen es un vendedor de globos de 78 años de edad dispuesto a cumplir su sueño: atar miles de globos a su casa y volar a Sudamérica. Sin embargo, descubre demasiado tarde a un joven e inesperado polizón. Lo que en principio será recelo, acabará por tornarse simpatía hacia el muchacho mientras juntos pasan fascinantes aventuras en exóticos lugares.', 4, 96, N'up.jpg', N'up-trailer-oficial-disney-pixar-oficial.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (4, N'Los Increibles', 0, N'Un superhéroe retirado lucha contra el aburrimiento y, junto a su familia, tiene la oportunidad de salvar al mundo.', 4, 86, N'losincreibles.jpg', N'los-increibles-the-incredibles-2004-trailer-vo.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (5, N'Toy Story', 0, N'Toy Story es una serie de películas animadas por ordenador y la franquicia de medios de comunicación de Disney que comenzó con la película original de Toy Story, producida por Pixar Animation Studios y publicada por Walt Disney Pictures', 5, 77, N'toystory.jpg', N'toy-story-trailer-disney-pixar-oficial.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (6, N'WALL-E', 0, N'Luego de pasar años limpiando la Tierra desierta, el robot Wall-E conoce a EVA y la sigue por toda la galaxia.', 3, 103, N'walle.jpg', N'wall-e-trailer-espanol-hd.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (7, N'Monsters, Inc.', 0, N'Monstruos S.A. es la mayor empresa de miedo del mundo, y su principal misión es asustar a los niños entrando al mundo humano a través de sus armarios. Sulley, un imponente personaje de dos metros, piel azul y cuernos, posee el récord de mayor número de sustos a niños.', 4, 92, N'monsters-inc-serie.jpg', N'monsters-inc-3d-trailer-oficial.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (8, N'The Fast and the Furious', 1, N'Un policía encubierto se infiltra en una banda de carreras callejeras de Los Ángeles mientras investiga robos de automóviles.', 5, 107, N'Fast-Furious-1.jpg', N'Fast-Furious-1.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (9, N'The Fast and the Furious 2', 1, N'Un expolicía y su amigo se unen a un agente de aduanas para atrapar a un criminal de Miami conectado al lavado de dinero.', 5, 108, N'Fast-Furious-2.jpg', N'2-fast-2-furious-trailer-hd.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (10, N'The Fast and the Furious 3: Tokio Drift', 1, N'Sean Boswell siempre se ha sentido como un intruso, pero él se define a sí mismo a través de sus victorias como corredor callejero de autos. Su pasatiempo lo vuelve impopular con las autoridades, así que se va a vivir con su padre a Japón. Una vez allá, y aún más enajenado, Sean descubre un nuevo deporte emocionante, pero peligroso. Las apuestas son muy altas cuando Sean se enfrenta al campeón local y se enamora de su novia.', 5, 105, N'Fast-Furious-3.jpg', N'fast-furious-3-tokyo-race-trailer-espanol.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (11, N'The Fast and the Furious 4', 1, N'El exconvicto Dominic Toretto se une a su viejo adversario, Brian O''Conner, que ahora trabaja para el FBI en Los Ángeles, con el fin de infiltrarse en una organización criminal que se dedica a introducir heroína en la ciudad.', 5, 107, N'Fast-Furious-4.jpg', N'Fast-Furious-4.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (12, N'The Fast and the Furious 9', 1, N'La novena película Fast and Furious sigue las emocionantes aventuras y carreras del equipo de amigos, tras la traición de Dominic Toretto.', 4, 188, N'fast-furious-9.jpg', N'Fast-&-Furious-9.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (13, N'Vengadores Endgame', 1, N'Los Vengadores restantes deben encontrar una manera de recuperar a sus aliados para un enfrentamiento épico con Thanos, el malvado que diezmó el planeta y el universo.', 5, 182, N'vengadores-endgame.jpeg', N'endgame.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (14, N'SAW 1', 2, N'Adam y Lawrence se despiertan encadenados en un baño infecto con un cadáver entre ellos. Su secuestrador es un maniaco, cuyo juego consiste en forzar a sus cautivos a herirse a sí mismos o a otros para permanecer vivos.', 2, 103, N'saw-1.jpg', N'saw-1-trailer-oficial.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (15, N'SAW 2', 2, N'Un detective emprende una carrera contra el tiempo para salvar a su hijo de un demente que tiene secuestrado a varios.', 2, 105, N'saw-2.jpg', N'saw-2-trailer-espanol.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (16, N'Brightburn', 2, N'¿Qué ocurre si un niño extraterrestre aterriza en la Tierra? ¿Qué pasaría si este niño no se convierte en héroe sino en algo mucho más siniestro? Todas las plegarias de una pareja se verán truncadas cuando el niño use sus poderes de manera siniestra.', 4, 99, N'Brightburn.jpg', N'brightburn-official-trailer-hd.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (17, N'His House', 2, N'Una pareja de refugiados huye de Sudán del Sur, país devastado por la guerra. Ellos luchan por adaptarse a su nueva vida en una ciudad inglesa.', 3, 103, N'his-house.jpg', N'his-house-official-trailer-netflix.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (18, N'Star Wars: Episode IV - A New Hope', 3, N'La nave en la que viaja la princesa Leia es capturada por las tropas imperiales al mando del temible Darth Vader. Antes de ser atrapada, Leia consigue introducir un mensaje en su robot R2-D2, quien acompañado de su inseparable C-3PO logra escapar. Tras aterrizar en el planeta Tattooine son capturados y vendidos al joven Luke Skywalker, quien descubrirá el mensaje oculto que va destinado a Obi Wan Kenobi, maestro Jedi a quien Luke debe encontrar para salvar a la princesa.', 4, 125, N'Star-Wars-Episode-IV.jpg', N'star-wars-episode-iv-a-new-hope-trailer.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (19, N'El imperio contraataca', 3, N'Star Wars: Episodio V - El Imperio contraataca es una película del género space opera dirigida por Irvin Kershner y estrenada por primera vez en Estados Unidos el 21 de mayo de 1980. El guion, basado en una historia de George Lucas, fue escrito por Lawrence Kasdan y Leigh Brackett', 4, 127, N'El-imperio-contraataca.jpg', N'El-imperio-contraataca.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (20, N'El retorno del Jedi', 3, N'Luke Skywalker, ahora un experimentado caballero Jedi, intenta descubrir la identidad de Darth Vader.', 5, 136, N'starwars-el-retorno-del-jedi.jpg', N'El-retorno-del-Jedi.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (21, N'La amenaza fantasma', 3, N'Obi-Wan Kenobi es un joven aprendiz caballero Jedi bajo la tutela de Qui-Gon Jinn; Anakin Skywalker, quien después será padre de Luke Skywalker y se convertirá en Darth Vader, solamente es un niño de 9 años. Cuando la Federación de Comercio corta todas las rutas al planeta Naboo, Qui-Gon y Obi-Wan son asignados para solucionar el problema.', 5, 136, N'la-amenaza-fantasma.jpg', N'la-amenaza-fantasma.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (22, N'El ataque de los clones', 3, N'En el Senado Galáctico reina la inquietud. Varios miles de sistemas solares han declarado su intención de abandonar la República. La reina Amidala regresa al Senado para conseguir un ejército que ayude a los caballeros jedi.', 5, 142, N'El-ataque-de-los-clones.jpg', N'El-ataque-de-los-clones.mp4')
INSERT [dbo].[Peliculas] ([IdPelicula], [Titulo], [IdGenero], [Sinopsis], [Valoracion], [Duracion], [Imagen], [Trailer]) VALUES (23, N'La venganza de los Sith', 3, N'Seducido por el lado oscuro, Anakin Skywalker se rebela contra su mentor, Obi-Wan Kenobi, y se convierte en Darth Vader.', 5, 130, N'La-venganza-de-los-Sith.jpg', N'La-venganza-de-los-Sith.mp4')
GO
INSERT [dbo].[PeliculasActores] ([IdPA], [IdPelicula], [IdActor]) VALUES (1, 0, 0)
INSERT [dbo].[PeliculasActores] ([IdPA], [IdPelicula], [IdActor]) VALUES (2, 0, 1)
INSERT [dbo].[PeliculasActores] ([IdPA], [IdPelicula], [IdActor]) VALUES (3, 1, 2)
GO

ALTER TABLE [dbo].[GenerosUsers]  WITH CHECK ADD  CONSTRAINT [FK_GenerosUsers_Generos] FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Generos] ([IdGenero])
GO
ALTER TABLE [dbo].[GenerosUsers] CHECK CONSTRAINT [FK_GenerosUsers_Generos]
GO
ALTER TABLE [dbo].[GenerosUsers]  WITH CHECK ADD  CONSTRAINT [FK_GenerosUsers_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[GenerosUsers] CHECK CONSTRAINT [FK_GenerosUsers_Users]
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD  CONSTRAINT [FK_Peliculas_Generos] FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Generos] ([IdGenero])
GO
ALTER TABLE [dbo].[Peliculas] CHECK CONSTRAINT [FK_Peliculas_Generos]
GO
ALTER TABLE [dbo].[PeliculasActores]  WITH CHECK ADD  CONSTRAINT [FK_PeliculasActores_Actores] FOREIGN KEY([IdActor])
REFERENCES [dbo].[Actores] ([IdActor])
GO
ALTER TABLE [dbo].[PeliculasActores] CHECK CONSTRAINT [FK_PeliculasActores_Actores]
GO
ALTER TABLE [dbo].[PeliculasActores]  WITH CHECK ADD  CONSTRAINT [FK_PeliculasActores_Peliculas] FOREIGN KEY([IdPelicula])
REFERENCES [dbo].[Peliculas] ([IdPelicula])
GO
ALTER TABLE [dbo].[PeliculasActores] CHECK CONSTRAINT [FK_PeliculasActores_Peliculas]
GO
