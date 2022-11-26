create database db_a90645_libreriavenus
use db_a90645_libreriavenus

GO
/****** Object:  Table [dbo].[Categoria_Bookstore]    Script Date: 25/11/2022 06:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria_Bookstore](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuracion]    Script Date: 25/11/2022 06:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuracion](
	[recurso] [varchar](50) NULL,
	[propiedad] [varchar](50) NULL,
	[valor] [varchar](60) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta_Boostore]    Script Date: 25/11/2022 06:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta_Boostore](
	[idDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[marcaProducto] [varchar](100) NULL,
	[descripcionProducto] [varchar](100) NULL,
	[categoriaProducto] [varchar](100) NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](10, 2) NULL,
	[total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 25/11/2022 06:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[idMenu] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[idMenuPadre] [int] NULL,
	[icono] [varchar](30) NULL,
	[controlador] [varchar](30) NULL,
	[paginaAccion] [varchar](30) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Negocio_Bookstore]    Script Date: 25/11/2022 06:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Negocio_Bookstore](
	[idNegocio] [int] NOT NULL,
	[urlLogo] [varchar](500) NULL,
	[nombreLogo] [varchar](100) NULL,
	[numeroDocumento] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[porcentajeImpuesto] [decimal](10, 2) NULL,
	[simboloMoneda] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[idNegocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumeroCorrelativo]    Script Date: 25/11/2022 06:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumeroCorrelativo](
	[idNumeroCorrelativo] [int] IDENTITY(1,1) NOT NULL,
	[ultimoNumero] [int] NULL,
	[cantidadDigitos] [int] NULL,
	[gestion] [varchar](100) NULL,
	[fechaActualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idNumeroCorrelativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto_Bookstore]    Script Date: 25/11/2022 06:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto_Bookstore](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[codigoBarra] [varchar](50) NULL,
	[marca] [varchar](50) NULL,
	[descripcion] [varchar](100) NULL,
	[idCategoria] [int] NULL,
	[stock] [int] NULL,
	[urlImagen] [varchar](500) NULL,
	[nombreImagen] [varchar](100) NULL,
	[precio] [decimal](10, 2) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 25/11/2022 06:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolMenu]    Script Date: 25/11/2022 06:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolMenu](
	[idRolMenu] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NULL,
	[idMenu] [int] NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRolMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumentoVenta]    Script Date: 25/11/2022 06:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumentoVenta](
	[idTipoDocumentoVenta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoDocumentoVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 25/11/2022 06:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[telefono] [char](8) NULL,
	[idRol] [int] NULL,
	[urlFoto] [varchar](500) NULL,
	[nombreFoto] [varchar](100) NULL,
	[clave] [varchar](100) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta_Bookstore]    Script Date: 25/11/2022 06:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta_Bookstore](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[numeroVenta] [varchar](6) NULL,
	[idTipoDocumentoVenta] [int] NULL,
	[idUsuario] [int] NULL,
	[documentoCliente] [varchar](10) NULL,
	[nombreCliente] [varchar](20) NULL,
	[subTotal] [decimal](10, 2) NULL,
	[impuestoTotal] [decimal](10, 2) NULL,
	[Total] [decimal](10, 2) NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria_Bookstore] ON 
GO
INSERT [dbo].[Categoria_Bookstore] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (1, N'Libros', 1, CAST(N'2022-11-21T08:20:01.083' AS DateTime))
GO
INSERT [dbo].[Categoria_Bookstore] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (2, N'Cuadernos', 1, CAST(N'2022-11-21T08:20:01.083' AS DateTime))
GO
INSERT [dbo].[Categoria_Bookstore] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (3, N'Lapiceros', 1, CAST(N'2022-11-21T08:20:01.083' AS DateTime))
GO
INSERT [dbo].[Categoria_Bookstore] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (4, N'Lapices de Colores', 1, CAST(N'2022-11-21T08:20:01.083' AS DateTime))
GO
INSERT [dbo].[Categoria_Bookstore] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (5, N'Lápiz', 1, CAST(N'2022-11-24T23:25:47.943' AS DateTime))
GO
INSERT [dbo].[Categoria_Bookstore] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (6, N'Tajadores', 1, CAST(N'2022-11-24T23:25:57.137' AS DateTime))
GO
INSERT [dbo].[Categoria_Bookstore] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (7, N'Mina', 1, CAST(N'2022-11-24T23:27:45.083' AS DateTime))
GO
INSERT [dbo].[Categoria_Bookstore] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (8, N'Pizarra', 1, CAST(N'2022-11-25T00:27:39.327' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Categoria_Bookstore] OFF
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'correo', N'eddy200015blas@gmail.com')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'clave', N'algxhtuxjpybcuom')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'alias', N'libreriavenus.com')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'host', N'smtp.gmail.com')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'puerto', N'587')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'email', N'eddy200015blas@gmail.com')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'clave', N'eagbdmmm')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'ruta', N'libreriavenus-dab96.appspot.com')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'api_key', N'AIzaSyDLqz2ou4SSya_brjDaIt-G7IB3Z5RDSgU')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'carpeta_usuario', N'IMAGENES_USUARIO')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'carpeta_producto', N'IMAGENES_PRODUCTO')
GO
INSERT [dbo].[Configuracion] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'carpeta_logo', N'IMAGENES_LOGO')
GO
SET IDENTITY_INSERT [dbo].[DetalleVenta_Boostore] ON 
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (1, 1, 1, N'Lider', N'Libro de texto de Lengua y Literatura 8vo grado', N'Cuadernos', 2, CAST(18.50 AS Decimal(10, 2)), CAST(37.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (2, 2, 2, N'Nacional', N'Caligrafía No.0', N'Libros', 3, CAST(56.35 AS Decimal(10, 2)), CAST(169.05 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (3, 2, 1, N'Lider', N'Libro de texto de Lengua y Literatura 8vo grado', N'Cuadernos', 1, CAST(18.50 AS Decimal(10, 2)), CAST(18.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (4, 2, 27, N'Scribe', N'Cuaderno Universitario Cuadriculado 100H', N'Cuadernos', 8, CAST(35.50 AS Decimal(10, 2)), CAST(284.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (5, 3, 11, N'Larousse', N'Diccionario School Larousse Español-Ingles 800 pág.', N'Libros', 1, CAST(218.24 AS Decimal(10, 2)), CAST(218.24 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (6, 4, 9, N'Larousse', N'Diccionario Basico Larousse Lengua Española 728 pág.', N'Libros', 1, CAST(229.69 AS Decimal(10, 2)), CAST(229.69 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (7, 4, 42, N'Estilo', N'Cuaderno cosido grande 100H Rayado Fortnite', N'Cuadernos', 8, CAST(105.41 AS Decimal(10, 2)), CAST(843.28 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (8, 5, 49, N'Pentel', N'Lapicero Pentel Azul BK90-AN 0.7', N'Lapiceros', 5, CAST(19.97 AS Decimal(10, 2)), CAST(99.85 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (9, 5, 26, N'Scribe', N'Cuaderno Universitario Rayado 100H', N'Cuadernos', 7, CAST(35.50 AS Decimal(10, 2)), CAST(248.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (10, 5, 97, N'Pentel', N'Lapiz de Mecanico Energize Rosado 0.5', N'Lápiz', 1, CAST(65.40 AS Decimal(10, 2)), CAST(65.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (11, 6, 48, N'Pentel', N'Lapicero Pentel Negro BK90-AN 0.7', N'Lapiceros', 1, CAST(19.97 AS Decimal(10, 2)), CAST(19.97 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (12, 6, 49, N'Pentel', N'Lapicero Pentel Azul BK90-AN 0.7', N'Lapiceros', 1, CAST(19.97 AS Decimal(10, 2)), CAST(19.97 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (13, 6, 50, N'Pentel', N'Lapicero Pentel Rojo BK90-AN 0.7', N'Lapiceros', 1, CAST(19.97 AS Decimal(10, 2)), CAST(19.97 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (14, 6, 26, N'Scribe', N'Cuaderno Universitario Rayado 100H', N'Cuadernos', 8, CAST(35.50 AS Decimal(10, 2)), CAST(284.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (15, 7, 1, N'Lider', N'Libro de texto de Lengua y Literatura 8vo grado', N'Cuadernos', 1, CAST(18.50 AS Decimal(10, 2)), CAST(18.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (16, 7, 20, N'Larousse', N'Libro de Ejercicios y Problemas Matemáticos 1', N'Libros', 1, CAST(145.18 AS Decimal(10, 2)), CAST(145.18 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (17, 8, 27, N'Scribe', N'Cuaderno Universitario Cuadriculado 100H', N'Cuadernos', 8, CAST(35.50 AS Decimal(10, 2)), CAST(284.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (18, 9, 19, N'Larousse', N'Libro de Actividades Larousse Preescolar 3 Campos Formativos', N'Libros', 1, CAST(155.25 AS Decimal(10, 2)), CAST(155.25 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (19, 9, 69, N'Artesco', N'Lapiz de color Doble Punta 24 unid. 48 colores ', N'Lapices de Colores', 1, CAST(106.09 AS Decimal(10, 2)), CAST(106.09 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (20, 10, 7, N'Nacional', N'Caligrafía No.6', N'Libros', 2, CAST(60.86 AS Decimal(10, 2)), CAST(121.72 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (21, 10, 67, N'Artesco', N'Lapiz de color Doble Punta 12 unid. 24 colores', N'Lapices de Colores', 2, CAST(53.08 AS Decimal(10, 2)), CAST(106.16 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (22, 11, 29, N'Triton', N'Cuaderno Universitario 60H Cuadriculado Colores Varios', N'Cuadernos', 5, CAST(41.65 AS Decimal(10, 2)), CAST(208.25 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (23, 11, 48, N'Pentel', N'Lapicero Pentel Negro BK90-AN 0.7', N'Lapiceros', 1, CAST(19.97 AS Decimal(10, 2)), CAST(19.97 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (24, 11, 49, N'Pentel', N'Lapicero Pentel Azul BK90-AN 0.7', N'Lapiceros', 1, CAST(19.97 AS Decimal(10, 2)), CAST(19.97 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (25, 12, 30, N'Copan', N'Cuaderno Universitario 100H Rayado Unicornio', N'Cuadernos', 12, CAST(130.61 AS Decimal(10, 2)), CAST(1567.32 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (26, 13, 28, N'Triton', N'Cuaderno Universitario 60H Rayado Colores Varios', N'Cuadernos', 12, CAST(41.65 AS Decimal(10, 2)), CAST(499.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (27, 14, 19, N'Larousse', N'Libro de Actividades Larousse Preescolar 3 Campos Formativos', N'Libros', 2, CAST(155.25 AS Decimal(10, 2)), CAST(310.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (28, 15, 103, N'Nacional', N'Pizarra tamaño 20'' ancho y 25'' largo', N'Pizarra', 1, CAST(875.50 AS Decimal(10, 2)), CAST(875.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (29, 16, 24, N'Larousse', N'Libro de Ejercicios y Problemas Matemáticos 5', N'Libros', 12, CAST(143.28 AS Decimal(10, 2)), CAST(1719.36 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (30, 17, 103, N'Nacional', N'Pizarra tamaño 20'' ancho y 25'' largo', N'Pizarra', 2, CAST(875.50 AS Decimal(10, 2)), CAST(1751.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (31, 18, 7, N'Nacional', N'Caligrafía No.6', N'Libros', 6, CAST(60.86 AS Decimal(10, 2)), CAST(365.16 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (32, 19, 59, N'Pentel', N'Lapicero Pentel Solar Pop Amarillo Gel K96-F 0.6', N'Lapiceros', 12, CAST(40.31 AS Decimal(10, 2)), CAST(483.72 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (33, 20, 2, N'Nacional', N'Caligrafía No.0', N'Libros', 1, CAST(56.35 AS Decimal(10, 2)), CAST(56.35 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (34, 20, 4, N'Nacional', N'Caligrafía No.2', N'Libros', 1, CAST(60.86 AS Decimal(10, 2)), CAST(60.86 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (35, 20, 29, N'Triton', N'Cuaderno Universitario 60H Cuadriculado Colores Varios', N'Cuadernos', 2, CAST(41.65 AS Decimal(10, 2)), CAST(83.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (36, 21, 103, N'Nacional', N'Pizarra tamaño 20'' ancho y 25'' largo', N'Pizarra', 1, CAST(875.50 AS Decimal(10, 2)), CAST(875.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (37, 22, 13, N'Larousse', N'Libro de Texto Larousse Tengo Valores', N'Libros', 1, CAST(128.80 AS Decimal(10, 2)), CAST(128.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (38, 22, 20, N'Larousse', N'Libro de Ejercicios y Problemas Matemáticos 1', N'Libros', 1, CAST(145.18 AS Decimal(10, 2)), CAST(145.18 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (39, 23, 8, N'Larousse', N'Diccionario Pequeño Larousse ilustrado a color Edición 2015 1,888 pág.', N'Libros', 1, CAST(1527.55 AS Decimal(10, 2)), CAST(1527.55 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (40, 24, 55, N'Pentel', N'Lapicero Pentel Negro BLN25-A 0.5', N'Lapiceros', 4, CAST(42.83 AS Decimal(10, 2)), CAST(171.32 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (41, 25, 30, N'Copan', N'Cuaderno Universitario 100H Rayado Unicornio', N'Cuadernos', 4, CAST(130.61 AS Decimal(10, 2)), CAST(522.44 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (42, 26, 29, N'Triton', N'Cuaderno Universitario 60H Cuadriculado Colores Varios', N'Cuadernos', 2, CAST(41.65 AS Decimal(10, 2)), CAST(83.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (43, 27, 48, N'Pentel', N'Lapicero Pentel Negro BK90-AN 0.7', N'Lapiceros', 4, CAST(19.97 AS Decimal(10, 2)), CAST(79.88 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (44, 28, 32, N'Copan', N'Cuaderno Universitario 100H Rayado Salva mi vida', N'Cuadernos', 5, CAST(126.72 AS Decimal(10, 2)), CAST(633.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (45, 29, 36, N'Conquistador', N'Cuaderno cosido pequeño 100-200H Rayado Colores varios', N'Cuadernos', 2, CAST(40.50 AS Decimal(10, 2)), CAST(81.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (46, 29, 39, N'Conquistador', N'Cuaderno cosido grande  100-200H Cuadriculado Colores varios', N'Cuadernos', 1, CAST(60.01 AS Decimal(10, 2)), CAST(60.01 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (47, 30, 6, N'Nacional', N'Caligrafía No.4', N'Libros', 2, CAST(60.86 AS Decimal(10, 2)), CAST(121.72 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (48, 31, 78, N'Artesco', N'Lapiz de color Triangular Mina 48 unid. ', N'Lapices de Colores', 2, CAST(230.00 AS Decimal(10, 2)), CAST(460.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (49, 32, 81, N'Pentel', N'Minas Pentel 0.5', N'Mina', 5, CAST(15.63 AS Decimal(10, 2)), CAST(78.15 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (50, 33, 82, N'Pentel', N'Minas Pentel 0.9', N'Mina', 2, CAST(19.67 AS Decimal(10, 2)), CAST(39.34 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (51, 34, 104, N'Keyroad', N'Tarjador Keyroad Ripple 2 hueco', N'Tajadores', 2, CAST(26.52 AS Decimal(10, 2)), CAST(53.04 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (52, 35, 106, N'Keyroad', N'Tarjador Keyroad Tri-3 Jumbo 3 hueco con deposito', N'Tajadores', 2, CAST(36.75 AS Decimal(10, 2)), CAST(73.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (53, 36, 93, N'Pentel', N'Lapiz de Mecanico Metalico Negro 0.5', N'Lápiz', 10, CAST(115.76 AS Decimal(10, 2)), CAST(1157.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (54, 37, 3, N'Nacional', N'Caligrafía No.1', N'Libros', 2, CAST(60.86 AS Decimal(10, 2)), CAST(121.72 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (55, 38, 106, N'Keyroad', N'Tarjador Keyroad Tri-3 Jumbo 3 hueco con deposito', N'Tajadores', 12, CAST(36.75 AS Decimal(10, 2)), CAST(441.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (56, 39, 33, N'Copan', N'Cuaderno Universitario 100H Cuadriculado Salva mi vida', N'Cuadernos', 8, CAST(126.72 AS Decimal(10, 2)), CAST(1013.76 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (57, 40, 13, N'Larousse', N'Libro de Texto Larousse Tengo Valores', N'Libros', 1, CAST(128.80 AS Decimal(10, 2)), CAST(128.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (58, 41, 74, N'Stabilo', N'Lapiz de color Triangular Jumbo 12 unid. ', N'Lapices de Colores', 2, CAST(180.55 AS Decimal(10, 2)), CAST(361.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (59, 42, 50, N'Pentel', N'Lapicero Pentel Rojo BK90-AN 0.7', N'Lapiceros', 1, CAST(19.97 AS Decimal(10, 2)), CAST(19.97 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (60, 42, 9, N'Larousse', N'Diccionario Basico Larousse Lengua Española 728 pág.', N'Libros', 1, CAST(229.69 AS Decimal(10, 2)), CAST(229.69 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (61, 42, 48, N'Pentel', N'Lapicero Pentel Negro BK90-AN 0.7', N'Lapiceros', 1, CAST(19.97 AS Decimal(10, 2)), CAST(19.97 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (62, 43, 103, N'Nacional', N'Pizarra tamaño 20'' ancho y 25'' largo', N'Pizarra', 1, CAST(875.50 AS Decimal(10, 2)), CAST(875.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (63, 44, 77, N'Artesco', N'Lapiz de color Triangular Mina 36 unid. ', N'Lapices de Colores', 1, CAST(218.50 AS Decimal(10, 2)), CAST(218.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (64, 45, 78, N'Artesco', N'Lapiz de color Triangular Mina 48 unid. ', N'Lapices de Colores', 1, CAST(230.00 AS Decimal(10, 2)), CAST(230.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (65, 46, 29, N'Triton', N'Cuaderno Universitario 60H Cuadriculado Colores Varios', N'Cuadernos', 2, CAST(41.65 AS Decimal(10, 2)), CAST(83.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (66, 47, 36, N'Conquistador', N'Cuaderno cosido pequeño 100-200H Rayado Colores varios', N'Cuadernos', 4, CAST(40.50 AS Decimal(10, 2)), CAST(162.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (67, 48, 9, N'Larousse', N'Diccionario Basico Larousse Lengua Española 728 pág.', N'Libros', 1, CAST(229.69 AS Decimal(10, 2)), CAST(229.69 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (68, 49, 25, N'Larousse', N'Libro de Ejercicios y Problemas Matemáticos 6', N'Libros', 2, CAST(146.12 AS Decimal(10, 2)), CAST(292.24 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (69, 50, 76, N'Superior', N'Lapiz de color Borrables Hexagonal 12 unid. ', N'Lapices de Colores', 1, CAST(47.66 AS Decimal(10, 2)), CAST(47.66 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta_Boostore] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (70, 51, 28, N'Triton', N'Cuaderno Universitario 60H Rayado Colores Varios', N'Cuadernos', 1, CAST(41.65 AS Decimal(10, 2)), CAST(41.65 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[DetalleVenta_Boostore] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (1, N'DashBoard', 1, N'fas fa-fw fa-tachometer-alt', N'DashBoard', N'Index', 1, CAST(N'2022-11-24T21:27:59.340' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (2, N'Administración', 2, N'fas fa-fw fa-cog', NULL, NULL, 1, CAST(N'2022-11-24T21:29:08.840' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (3, N'Inventario', 3, N'fas fa-fw fa-clipboard-list', NULL, NULL, 1, CAST(N'2022-11-24T21:29:08.840' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (4, N'Ventas', 4, N'fas fa-fw fa-tags', NULL, NULL, 1, CAST(N'2022-11-24T21:29:08.840' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (5, N'Reportes', 5, N'fas fa-fw fa-chart-area', NULL, NULL, 1, CAST(N'2022-11-24T21:29:08.840' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (6, N'Usuarios', 2, NULL, N'Usuarios', N'Index', 1, CAST(N'2022-11-24T21:33:28.087' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (7, N'Negocio', 2, NULL, N'Negocio', N'Index', 1, CAST(N'2022-11-24T21:33:28.087' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (8, N'Categorias', 3, NULL, N'Categoria', N'Index', 1, CAST(N'2022-11-24T21:34:23.897' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (9, N'Productos', 3, NULL, N'Productos', N'Index', 1, CAST(N'2022-11-24T21:34:23.897' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (10, N'Nueva Venta', 4, NULL, N'Ventas', N'NewVenta', 1, CAST(N'2022-11-24T21:36:18.403' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (11, N'Historial Venta', 4, NULL, N'Ventas', N'HistorialVentas', 1, CAST(N'2022-11-24T21:36:18.403' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [icono], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (12, N'Reporte de Ventas', 5, NULL, N'Reporte', N'Index', 1, CAST(N'2022-11-24T21:37:03.463' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
INSERT [dbo].[Negocio_Bookstore] ([idNegocio], [urlLogo], [nombreLogo], [numeroDocumento], [nombre], [correo], [direccion], [telefono], [porcentajeImpuesto], [simboloMoneda]) VALUES (1, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_LOGO%2Fe49445001a1047c68191910edfd91b07.png?alt=media&token=b2e8fa8b-d952-4f18-bf2b-13d426744ad1', N'e49445001a1047c68191910edfd91b07.png', N'121212', N'Educación', N'eddy200015blas@gmail.com', N'Managua', N'78592915', CAST(15.00 AS Decimal(10, 2)), N'C$')
GO
SET IDENTITY_INSERT [dbo].[NumeroCorrelativo] ON 
GO
INSERT [dbo].[NumeroCorrelativo] ([idNumeroCorrelativo], [ultimoNumero], [cantidadDigitos], [gestion], [fechaActualizacion]) VALUES (1, 51, 6, N'venta', CAST(N'2022-11-25T02:24:59.343' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[NumeroCorrelativo] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto_Bookstore] ON 
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (1, N'111111127', N'Lider', N'Libro de texto de Lengua y Literatura 8vo grado', 2, 16, N'', N'', CAST(18.50 AS Decimal(10, 2)), 1, CAST(N'2022-11-21T10:33:51.883' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (2, N'111111126', N'Nacional', N'Caligrafía No.0', 1, 46, N'', N'', CAST(56.35 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (3, N'111111125', N'Nacional', N'Caligrafía No.1', 1, 58, N'', N'', CAST(60.86 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (4, N'11111124', N'Nacional', N'Caligrafía No.2', 1, 69, N'', N'', CAST(60.86 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (5, N'11111123', N'Nacional', N'Caligrafía No.3', 1, 77, N'', N'', CAST(60.86 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (6, N'111111122', N'Nacional', N'Caligrafía No.4', 1, 66, N'', N'', CAST(60.86 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (7, N'111111121', N'Nacional', N'Caligrafía No.6', 1, 82, N'', N'', CAST(60.86 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (8, N'111111120', N'Larousse', N'Diccionario Pequeño Larousse ilustrado a color Edición 2015 1,888 pág.', 1, 9, N'', N'', CAST(1527.55 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (9, N'111111119', N'Larousse', N'Diccionario Basico Larousse Lengua Española 728 pág.', 1, 197, N'', N'', CAST(229.69 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (10, N'111111118', N'Larousse', N'Diccionario Larousse Sinonimos y Antonimos 576 pág.', 1, 87, N'', N'', CAST(171.64 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (11, N'111111117', N'Larousse', N'Diccionario School Larousse Español-Ingles 800 pág.', 1, 48, N'', N'', CAST(218.24 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (12, N'111111116', N'Larousse', N'Diccionario Basico Larousse Español-Ingles 528 pág.', 1, 100, N'', N'', CAST(162.15 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (13, N'111111115', N'Larousse', N'Libro de Texto Larousse Tengo Valores', 1, 48, N'', N'', CAST(128.80 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (14, N'111111114', N'Larousse', N'Libro de Texto Larousse Primeras Lecturas Ricitos de Oro ', 1, 64, N'', N'', CAST(67.37 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (15, N'111111113', N'Larousse', N'Libro de Texto Larousse Primeras Lecturas Pinocho', 1, 59, N'', N'', CAST(67.37 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (16, N'111111112', N'Larousse', N'Libro de Texto Larousse Primeras Lecturas Los tres cochinitos', 1, 51, N'', N'', CAST(67.37 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (17, N'111111110', N'Larousse', N'Libro de Actividades Larousse Preescolar 1 Campos Formativos', 1, 40, N'', N'', CAST(155.25 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (18, N'11111119', N'Larousse', N'Libro de Actividades Larousse Preescolar 2 Campos Formativos', 1, 52, N'', N'', CAST(155.25 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (19, N'11111118', N'Larousse', N'Libro de Actividades Larousse Preescolar 3 Campos Formativos', 1, 48, N'', N'', CAST(155.25 AS Decimal(10, 2)), 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (20, N'11111117', N'Larousse', N'Libro de Ejercicios y Problemas Matemáticos 1', 1, 58, N'', N'', CAST(145.18 AS Decimal(10, 2)), 1, CAST(N'2022-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (21, N'11111116', N'Larousse', N'Libro de Ejercicios y Problemas Matemáticos 2', 1, 68, N'', N'', CAST(144.22 AS Decimal(10, 2)), 1, CAST(N'2022-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (22, N'11111115', N'Larousse', N'Libro de Ejercicios y Problemas Matemáticos 3', 1, 70, N'', N'', CAST(143.28 AS Decimal(10, 2)), 1, CAST(N'2022-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (23, N'11111114', N'Larousse', N'Libro de Ejercicios y Problemas Matemáticos 4', 1, 77, N'', N'', CAST(148.02 AS Decimal(10, 2)), 1, CAST(N'2022-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (24, N'11111113', N'Larousse', N'Libro de Ejercicios y Problemas Matemáticos 5', 1, 68, N'', N'', CAST(143.28 AS Decimal(10, 2)), 1, CAST(N'2022-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (25, N'11111112', N'Larousse', N'Libro de Ejercicios y Problemas Matemáticos 6', 1, 82, N'', N'', CAST(146.12 AS Decimal(10, 2)), 1, CAST(N'2022-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (26, N'101010', N'Scribe', N'Cuaderno Universitario Rayado 100H', 2, 0, N'', N'', CAST(35.50 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (27, N'111111187', N'Scribe', N'Cuaderno Universitario Cuadriculado 100H', 2, -1, N'', N'', CAST(35.50 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (28, N'111111186', N'Triton', N'Cuaderno Universitario 60H Rayado Colores Varios', 2, 27, N'', N'', CAST(41.65 AS Decimal(10, 2)), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (29, N'111111185', N'Triton', N'Cuaderno Universitario 60H Cuadriculado Colores Varios', 2, 34, N'', N'', CAST(41.65 AS Decimal(10, 2)), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (30, N'111111184', N'Copan', N'Cuaderno Universitario 100H Rayado Unicornio', 2, 19, N'', N'', CAST(130.61 AS Decimal(10, 2)), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (31, N'111111183', N'Copan', N'Cuaderno Universitario 100H Cuadriculado Unicornio', 2, 35, N'', N'', CAST(130.61 AS Decimal(10, 2)), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (32, N'111111182', N'Copan', N'Cuaderno Universitario 100H Rayado Salva mi vida', 2, 33, N'', N'', CAST(126.72 AS Decimal(10, 2)), 1, CAST(N'2022-11-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (33, N'111111181', N'Copan', N'Cuaderno Universitario 100H Cuadriculado Salva mi vida', 2, 30, N'', N'', CAST(126.72 AS Decimal(10, 2)), 1, CAST(N'2022-11-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (34, N'111111180', N'Copan', N'Cuaderno Universitario 100H Rayado Rayito de luz', 2, 28, N'', N'', CAST(126.72 AS Decimal(10, 2)), 1, CAST(N'2022-11-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (35, N'111111179', N'Copan', N'Cuaderno Universitario 100H Cuadriculado Rayito de luz', 2, 28, N'', N'', CAST(126.72 AS Decimal(10, 2)), 1, CAST(N'2022-11-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (36, N'111111178', N'Conquistador', N'Cuaderno cosido pequeño 100-200H Rayado Colores varios', 2, 144, N'', N'', CAST(40.50 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (37, N'111111197', N'Conquistador', N'Cuaderno cosido pequeño 100-200H Cuadriculado Colores varios', 2, 150, N'', N'', CAST(40.50 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (38, N'111111196', N'Conquistador', N'Cuaderno cosido grande  100-200H Rayado Colores varios', 2, 80, N'', N'', CAST(60.01 AS Decimal(10, 2)), 1, CAST(N'2022-11-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (39, N'111111195', N'Conquistador', N'Cuaderno cosido grande  100-200H Cuadriculado Colores varios', 2, 79, N'', N'', CAST(60.01 AS Decimal(10, 2)), 1, CAST(N'2022-11-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (40, N'111111194', N'Copan', N'Cuaderno cosido grande 100-200H Rayado Doctora Juguete', 2, 40, N'', N'', CAST(91.17 AS Decimal(10, 2)), 1, CAST(N'2022-11-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (41, N'111111193', N'Copan', N'Cuaderno cosido grande 100-200H Cuadriculado Doctora Juguete', 2, 40, N'', N'', CAST(91.17 AS Decimal(10, 2)), 1, CAST(N'2022-11-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (42, N'111111192', N'Estilo', N'Cuaderno cosido grande 100H Rayado Fortnite', 2, 22, N'', N'', CAST(105.41 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (43, N'11111191', N'Estilo', N'Cuaderno cosido grande 100H Cuadriculado Fortnite', 2, 30, N'', N'', CAST(105.41 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (44, N'111111190', N'Estilo', N'Cuaderno cosido grande 100H Doble Raya Barbie', 2, 65, N'', N'', CAST(147.55 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (45, N'111111189', N'Estilo', N'Cuaderno cosido grande 100H Cuadriculado Barbie', 2, 65, N'', N'', CAST(147.55 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (46, N'111111188', N'Scribe', N'Cuaderno cosido pequeño 100H Doble Raya Anota', 2, 88, N'', N'', CAST(35.36 AS Decimal(10, 2)), 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (47, N'111111177', N'Scribe', N'Cuaderno cosido pequeño 100H Cuadriculado Anota', 2, 88, N'', N'', CAST(35.36 AS Decimal(10, 2)), 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (48, N'111111176', N'Pentel', N'Lapicero Pentel Negro BK90-AN 0.7', 3, 143, N'', N'', CAST(19.97 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (49, N'111111175', N'Pentel', N'Lapicero Pentel Azul BK90-AN 0.7', 3, 123, N'', N'', CAST(19.97 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (50, N'111111174', N'Pentel', N'Lapicero Pentel Rojo BK90-AN 0.7', 3, 108, N'', N'', CAST(19.97 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (51, N'111111173', N'Pentel', N'Lapicero Pentel Rosado BK90-AN 0.7', 3, 120, N'', N'', CAST(19.97 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (52, N'111111172', N'Pentel', N'Lapicero Pentel Negro BLN15-AO 0.5', 3, 90, N'', N'', CAST(43.41 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (53, N'111111171', N'Pentel', N'Lapicero Pentel Rojo BLN15-AO 0.5', 3, 96, N'', N'', CAST(43.41 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (54, N'111111170', N'Pentel', N'Lapicero Pentel Azul BLN15-AO 0.5', 3, 87, N'', N'', CAST(43.41 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (55, N'111111169', N'Pentel', N'Lapicero Pentel Negro BLN25-A 0.5', 3, 86, N'', N'', CAST(42.83 AS Decimal(10, 2)), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (56, N'111111168', N'Pentel', N'Lapicero Pentel Rojo BLN25-A 0.5', 3, 85, N'', N'', CAST(42.83 AS Decimal(10, 2)), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (57, N'111111167', N'Pentel', N'Lapicero Pentel Azul BLN25-A 0.5', 3, 90, N'', N'', CAST(42.83 AS Decimal(10, 2)), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (58, N'111111166', N'Pentel', N'Lapicero Pentel Solar Pop Naranja Gel K96-F 0.6', 3, 50, N'', N'', CAST(40.31 AS Decimal(10, 2)), 1, CAST(N'2022-11-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (59, N'111111165', N'Pentel', N'Lapicero Pentel Solar Pop Amarillo Gel K96-F 0.6', 3, 38, N'', N'', CAST(40.31 AS Decimal(10, 2)), 1, CAST(N'2022-11-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (60, N'111111164', N'Pentel', N'Lapicero Pentel Solar Pop Verde Gel K96-F 0.6', 3, 50, N'', N'', CAST(40.31 AS Decimal(10, 2)), 1, CAST(N'2022-11-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (61, N'111111163', N'Pentel', N'Lapicero Pentel Solar Pop Rosado Gel K96-F 0.6', 3, 50, N'', N'', CAST(40.31 AS Decimal(10, 2)), 1, CAST(N'2022-11-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (62, N'111111162', N'Pentel', N'Lapicero Pentel Solar Pop Violeta Gel K96-F 0.6', 3, 50, N'', N'', CAST(40.31 AS Decimal(10, 2)), 1, CAST(N'2022-11-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (63, N'111111161', N'Papermate', N'Lapicero Papermate Negro Inkjoy 100 ST 1.0', 3, 100, N'', N'', CAST(5.91 AS Decimal(10, 2)), 1, CAST(N'2022-11-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (64, N'111111160', N'Papermate', N'Lapicero Papermate Azul Inkjoy 100 ST 1.0', 3, 100, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F9d8e85480a524726901fc20ca9140eec.jpg?alt=media&token=645eba44-63a7-488b-8647-412a40f747a3', N'9d8e85480a524726901fc20ca9140eec.jpg', CAST(5.91 AS Decimal(10, 2)), 1, CAST(N'2022-11-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (65, N'111111159', N'Papermate', N'Lapicero Papermate Rojo Inkjoy 100 ST 1.0', 3, 100, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F254775770ad7423ba7e64a42cc880953.png?alt=media&token=fe9c2635-da2d-4210-bfad-55cb93ff76da', N'254775770ad7423ba7e64a42cc880953.png', CAST(5.91 AS Decimal(10, 2)), 1, CAST(N'2022-11-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (66, N'111111158', N'Artesco', N'Lapiz de color Jumbo Mina 12 unid.', 4, 200, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F68c6f2bc5cd14cd1ba7ebe0c4db1d8d6.jpg?alt=media&token=df88c718-edd9-4a7f-b900-6738103091d3', N'68c6f2bc5cd14cd1ba7ebe0c4db1d8d6.jpg', CAST(115.00 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (67, N'111111157', N'Artesco', N'Lapiz de color Doble Punta 12 unid. 24 colores', 4, 148, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F9f22469853d24f259f6c428489dcab28.jpg?alt=media&token=386e162b-37a0-4441-9bfe-eedfd8467045', N'9f22469853d24f259f6c428489dcab28.jpg', CAST(53.08 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (68, N'111111156', N'Artesco', N'Lapiz de color Triangular Mina 12 unid. ', 4, 155, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2Fa2f90b095be445ac8c8864ed1de8b21f.jpg?alt=media&token=49f9d4c1-a8b6-473c-9d2e-3f8912194069', N'a2f90b095be445ac8c8864ed1de8b21f.jpg', CAST(66.05 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (69, N'111111155', N'Artesco', N'Lapiz de color Doble Punta 24 unid. 48 colores ', 4, 159, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2Fb093a6c248ff4efcb93bf7ecde6fef24.jpg?alt=media&token=84c1d02e-73ea-4046-b24d-470bd9c2f2ac', N'b093a6c248ff4efcb93bf7ecde6fef24.jpg', CAST(106.09 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (70, N'111111154', N'Artesco', N'Lapiz de color Triangular Mina 24 unid. ', 1, 130, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F694320bef10743ec9fc2d729bd52fff1.jpg?alt=media&token=8deb30c3-b338-422c-8a52-dd9b057228b0', N'694320bef10743ec9fc2d729bd52fff1.jpg', CAST(120.75 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (71, N'111111153', N'Artesco', N'Lapiz de color Borrables 12 unid. ', 4, 196, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2Fe4e31c9e3a5742b9b717855bd91d9729.jpg?alt=media&token=43345523-a5a3-4b28-bd57-46dc76b77364', N'e4e31c9e3a5742b9b717855bd91d9729.jpg', CAST(57.50 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (72, N'111111152', N'Stabilo', N'Lapiz de color Fluorescente 30 unid. ', 4, 150, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2Fec706dde424849c6a76705b230f614d3.jpg?alt=media&token=4af64175-6c72-47df-b6e5-762706c4c2bf', N'ec706dde424849c6a76705b230f614d3.jpg', CAST(218.50 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (73, N'111111151', N'Stabilo', N'Lapiz de color Nueva presentación 12 unid. ', 4, 95, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2Fa349a721816f4744a3810cc1e03fa194.jpg?alt=media&token=cf1e1092-06ca-4b95-955f-945daadec2f9', N'a349a721816f4744a3810cc1e03fa194.jpg', CAST(89.70 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (74, N'111111150', N'Stabilo', N'Lapiz de color Triangular Jumbo 12 unid. ', 4, 82, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F54f3718489324410b9820083108822d2.jpg?alt=media&token=d9d1f2c9-895d-4f72-91bd-3dfe455fcf7c', N'54f3718489324410b9820083108822d2.jpg', CAST(180.55 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (75, N'111111149', N'Superior', N'Lapiz de color Triangular 24 unid. ', 4, 74, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2Fb4b4bc1d710647119ce86891a82a23af.jpg?alt=media&token=7014c243-fb94-46fd-b093-ec21ec050bb5', N'b4b4bc1d710647119ce86891a82a23af.jpg', CAST(80.50 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (76, N'111111148', N'Superior', N'Lapiz de color Borrables Hexagonal 12 unid. ', 4, 71, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F8d070b4396ee46f191538877900e81d9.jpg?alt=media&token=c394fd8a-4bb1-4ce1-baa6-e59798c4aa1b', N'8d070b4396ee46f191538877900e81d9.jpg', CAST(47.66 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (77, N'111111147', N'Artesco', N'Lapiz de color Triangular Mina 36 unid. ', 4, 69, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F8ca223b35f2c498498e474c60b5ba231.jpg?alt=media&token=85cfd787-f629-4066-90ec-bbe4949855c6', N'8ca223b35f2c498498e474c60b5ba231.jpg', CAST(218.50 AS Decimal(10, 2)), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (78, N'111111146', N'Artesco', N'Lapiz de color Triangular Mina 48 unid. ', 4, 80, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F847fb4feeba94186a6be7a0cc04803b1.jpg?alt=media&token=8f12affb-b062-44c2-8437-880d59ea957d', N'847fb4feeba94186a6be7a0cc04803b1.jpg', CAST(230.00 AS Decimal(10, 2)), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (79, N'111111145', N'Artesco', N'Lapiz de color Triangular Mina 60 unid. ', 4, 89, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2Feb6de2bdcd704224b2041a21c36dac51.jpg?alt=media&token=392d896d-dfea-4f3c-8c6b-6c7659971a63', N'eb6de2bdcd704224b2041a21c36dac51.jpg', CAST(276.00 AS Decimal(10, 2)), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (80, N'111111144', N'Pentel', N'Minas Pentel 0.7', 7, 150, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2Fb14c88802a484272ae2854ca80c2c4f6.png?alt=media&token=148c5eec-47af-4c88-802d-4783bf68a4e2', N'b14c88802a484272ae2854ca80c2c4f6.png', CAST(17.40 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (81, N'111111143', N'Pentel', N'Minas Pentel 0.5', 7, 125, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F37409fd70dcd432291720393df3392e0.jpg?alt=media&token=72b993be-37aa-4fe6-b6cf-c255e61cdbb0', N'37409fd70dcd432291720393df3392e0.jpg', CAST(15.63 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (82, N'111111142', N'Pentel', N'Minas Pentel 0.9', 7, 108, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2Fb43d5299647142e5b02a9731bf08d61c.jpg?alt=media&token=dd3ffd87-5507-475c-82fb-54bde94d48a2', N'b43d5299647142e5b02a9731bf08d61c.jpg', CAST(19.67 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (89, N'111111141', N'Stabilo', N'Lapiz de Grafito Negro HB2 Con Borrador', 5, 250, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F3d79eebe2b3d47258cd8e96ece17d6a4.jpg?alt=media&token=fcab55d7-9302-4de6-bcb1-953fdb70f7ed', N'3d79eebe2b3d47258cd8e96ece17d6a4.jpg', CAST(7.71 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (90, N'111111140', N'Stabilo', N'Lapiz de Grafito Neon Verde HB Con Borrador', 5, 200, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2Fa80ec4ca857645f7836e7ba8eb8d6645.jpg?alt=media&token=6c67d903-2ae3-45a9-a4c8-4979f020f59e', N'a80ec4ca857645f7836e7ba8eb8d6645.jpg', CAST(10.50 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (91, N'111111139', N'Smart', N' Caja de Lapiz de Grafito Negro #2 HB Con Borrador 22 piezas', 5, 60, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F6a3132bb188343f6ad012f58e8c90ae9.jpg?alt=media&token=5f870700-2d73-4297-82a6-51c4536c3f04', N'6a3132bb188343f6ad012f58e8c90ae9.jpg', CAST(39.35 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (92, N'111111138', N'Smart', N' Caja de Lapiz de Grafito Amarillo #2 HB Con Borrador 12 piezas', 5, 80, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F40d3aed4349f4146ad8fbb58880cfaa7.jpg?alt=media&token=6cc15a83-498b-4e04-aef5-550ee0cc8c7e', N'40d3aed4349f4146ad8fbb58880cfaa7.jpg', CAST(25.03 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (93, N'111111137', N'Pentel', N'Lapiz de Mecanico Metalico Negro 0.5', 5, 140, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F524535d9f43348e784a4a5556ac00537.jpg?alt=media&token=7ff07f50-ad70-4e7c-8368-154803381125', N'524535d9f43348e784a4a5556ac00537.jpg', CAST(115.76 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (94, N'111111136', N'Pentel', N'Lapiz de Mecanico Cometz Violeta 0.9', 5, 100, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F736d7c628550489d9e387cce11560241.jpg?alt=media&token=11271bb4-2701-416c-8b9a-c24f8bfb1f7f', N'736d7c628550489d9e387cce11560241.jpg', CAST(21.41 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (95, N'111111135', N'Pentel', N'Lapiz de Mecanico Fiesta Negro 0.7', 5, 110, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2Ff5152a4b19044c20906cefaaf44ec283.jpg?alt=media&token=726b2210-cfa8-4ca8-a9a7-39f0b92bd8df', N'f5152a4b19044c20906cefaaf44ec283.jpg', CAST(15.92 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (96, N'111111134', N'Pentel', N'Lapiz de Mecanico Fiesta Azul 0.5', 5, 110, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F092ae0f1ec334f1181b8137a9a982c06.jpg?alt=media&token=6bf63140-a69f-4773-b4ed-a8d3644cbd22', N'092ae0f1ec334f1181b8137a9a982c06.jpg', CAST(15.92 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (97, N'111111133', N'Pentel', N'Lapiz de Mecanico Energize Rosado 0.5', 5, 89, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F78ce4aca5cc04f5a9b0a6e4b052921f5.jpg?alt=media&token=474a13b6-267b-4b2c-a803-03c90ea88796', N'78ce4aca5cc04f5a9b0a6e4b052921f5.jpg', CAST(65.40 AS Decimal(10, 2)), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (98, N'111111132', N'Pentel', N'Lapiz de Mecanico Energize Negro 0.7', 5, 95, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F48248b6c20294ceaae238582b42e1ea2.jpg?alt=media&token=dd442c82-2959-4172-a4b9-cd70d58595a8', N'48248b6c20294ceaae238582b42e1ea2.jpg', CAST(65.40 AS Decimal(10, 2)), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (99, N'111111131', N'Pentel', N'Lapiz de Mecanico Energize Rosado 0.7', 5, 95, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F95e7352178cf4528a085d07cfb1538d3.jpg?alt=media&token=1b996639-e188-4b3a-86ff-a3cb01fe26d9', N'95e7352178cf4528a085d07cfb1538d3.jpg', CAST(65.40 AS Decimal(10, 2)), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (100, N'111111130', N'Pentel', N'Lapiz de Mecanico Energize Celeste 0.7', 5, 95, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F6b85f44b0760407dbb2af4d0bba1cf4d.jpg?alt=media&token=361fad7e-1f92-4405-a99c-1fb4b5f38ed1', N'6b85f44b0760407dbb2af4d0bba1cf4d.jpg', CAST(65.40 AS Decimal(10, 2)), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (101, N'111111129', N'Pentel', N'Lapiz de Mecanico Energize Morado 0.7', 5, 95, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F78d8ced5c042435eaa2703a8e4ca8970.jpg?alt=media&token=45201cef-2fee-43d4-a23b-3cc0923283ed', N'78d8ced5c042435eaa2703a8e4ca8970.jpg', CAST(65.40 AS Decimal(10, 2)), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (102, N'111111128', N'Smart', N'Lapiz de Mecanico Space Colores Surtidos 0.7', 5, 100, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2Fe47c0f9cfb5a443d9f7310fa8546a9b3.png?alt=media&token=62273fb2-fe7b-4804-961b-246caa2bf1aa', N'e47c0f9cfb5a443d9f7310fa8546a9b3.png', CAST(3.31 AS Decimal(10, 2)), 1, CAST(N'2022-11-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (103, N'111111199', N'Nacional', N'Pizarra tamaño 20'' ancho y 25'' largo', 8, 5, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F3b389c903305472184d42c07a12fbfaa.jpg?alt=media&token=d25d48ca-b3ea-464a-8ff2-a37ae7eee401', N'3b389c903305472184d42c07a12fbfaa.jpg', CAST(875.50 AS Decimal(10, 2)), 1, CAST(N'2022-11-25T00:28:56.767' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (104, N'12121217', N'Keyroad', N'Tarjador Keyroad Ripple 2 hueco', 6, 98, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F28777b415e874fc88ff643b7f7fe241a.jpg?alt=media&token=ba869610-7db0-4f35-8e9f-e3429d213f51', N'28777b415e874fc88ff643b7f7fe241a.jpg', CAST(26.52 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (105, N'12121216', N'Keyroad', N'Tarjador Keyroad Cappy con borrador 1 hueco', 6, 90, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F46e74b15770a4b849fa7b7b7011ca0aa.jpg?alt=media&token=786b3ec3-f54e-4e0a-b453-328a0ca4d4b3', N'46e74b15770a4b849fa7b7b7011ca0aa.jpg', CAST(26.97 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (106, N'12121215', N'Keyroad', N'Tarjador Keyroad Tri-3 Jumbo 3 hueco con deposito', 6, 36, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2Fc9ea35909bfc4347930bdcbc66483e32.jpg?alt=media&token=1d6793c5-e337-4018-bd09-9a604549e67c', N'c9ea35909bfc4347930bdcbc66483e32.jpg', CAST(36.75 AS Decimal(10, 2)), 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (107, N'12121214', N'Pointer', N'Tarjador Pointer Lapiz con borrador', 6, 60, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2F20e74046dd0d4b679d9279d0913bb8e1.jpg?alt=media&token=1fa361fc-e4ee-4c0f-9aca-9927b62b8f81', N'20e74046dd0d4b679d9279d0913bb8e1.jpg', CAST(8.13 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (108, N'12121213', N'Pointer', N'Tarjador Pointer Hipopotamo', 6, 66, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2Fede87e1d3fc84f6998515fc74f504469.jpg?alt=media&token=4a1b6562-ecc0-4337-8536-27d58e5742b4', N'ede87e1d3fc84f6998515fc74f504469.jpg', CAST(9.55 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto_Bookstore] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (109, N'12121212', N'Pointer', N'Tarjador Pointer Cilindrico', 6, 40, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_PRODUCTO%2Fbd63cb2f57554092bfb30a0a224f68a2.jpg?alt=media&token=5f73dcc9-4164-48fd-bd83-bef2a1b84a98', N'bd63cb2f57554092bfb30a0a224f68a2.jpg', CAST(10.96 AS Decimal(10, 2)), 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Producto_Bookstore] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 
GO
INSERT [dbo].[Rol] ([idRol], [descripcion], [esActivo], [fechaRegistro]) VALUES (1, N'Administrador', 1, CAST(N'2022-11-21T08:19:41.730' AS DateTime))
GO
INSERT [dbo].[Rol] ([idRol], [descripcion], [esActivo], [fechaRegistro]) VALUES (2, N'Empleado', 1, CAST(N'2022-11-21T08:19:41.730' AS DateTime))
GO
INSERT [dbo].[Rol] ([idRol], [descripcion], [esActivo], [fechaRegistro]) VALUES (3, N'Supervisor', 1, CAST(N'2022-11-21T08:19:41.730' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[RolMenu] ON 
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (1, 1, 1, 1, CAST(N'2022-11-24T21:47:43.660' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (2, 1, 6, 1, CAST(N'2022-11-24T21:47:43.660' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (3, 1, 7, 1, CAST(N'2022-11-24T21:47:43.660' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (4, 1, 8, 1, CAST(N'2022-11-24T21:47:43.660' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (5, 1, 9, 1, CAST(N'2022-11-24T21:47:43.660' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (6, 1, 10, 1, CAST(N'2022-11-24T21:47:43.660' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (7, 1, 11, 1, CAST(N'2022-11-24T21:47:43.660' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (8, 1, 12, 1, CAST(N'2022-11-24T21:47:43.660' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (9, 2, 10, 1, CAST(N'2022-11-24T21:48:20.047' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (10, 2, 11, 1, CAST(N'2022-11-24T21:48:20.047' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (11, 3, 8, 1, CAST(N'2022-11-24T21:50:29.867' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (12, 3, 9, 1, CAST(N'2022-11-24T21:50:29.867' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (13, 3, 10, 1, CAST(N'2022-11-24T21:50:29.867' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (14, 3, 11, 1, CAST(N'2022-11-24T21:50:29.867' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (15, 3, 12, 1, CAST(N'2022-11-24T21:50:29.867' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[RolMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDocumentoVenta] ON 
GO
INSERT [dbo].[TipoDocumentoVenta] ([idTipoDocumentoVenta], [descripcion], [esActivo], [fechaRegistro]) VALUES (1, N'Boleta', 1, CAST(N'2022-11-21T08:20:23.770' AS DateTime))
GO
INSERT [dbo].[TipoDocumentoVenta] ([idTipoDocumentoVenta], [descripcion], [esActivo], [fechaRegistro]) VALUES (2, N'Factura', 1, CAST(N'2022-11-21T08:20:23.770' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TipoDocumentoVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [correo], [telefono], [idRol], [urlFoto], [nombreFoto], [clave], [esActivo], [fechaRegistro]) VALUES (1, N'Eddy Antonio Garcia Blas', N'eddy200015blas@gmail.com', N'78592915', 1, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_USUARIO%2Fbecc6bc2b91547b5a179cf72ef1ceed9.JPG?alt=media&token=b3f30a0b-85e9-49e8-b782-2b5e3eef2268', N'becc6bc2b91547b5a179cf72ef1ceed9.JPG', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1, CAST(N'2022-11-21T08:19:53.117' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [correo], [telefono], [idRol], [urlFoto], [nombreFoto], [clave], [esActivo], [fechaRegistro]) VALUES (2, N'Flavia ', N'flavia2800@gmail.com', N'55555555', 1, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_USUARIO%2F960168766f754773921271ecb3b06fd5.JPG?alt=media&token=125243a1-4358-489d-aaa2-78100b895540', N'960168766f754773921271ecb3b06fd5.JPG', N'1f6a747ca40714d1b6374eb4993d26e70ad9fac9e7d5ca9f1dec8f6e93b2cb8a', 1, CAST(N'2022-11-21T15:24:01.490' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [correo], [telefono], [idRol], [urlFoto], [nombreFoto], [clave], [esActivo], [fechaRegistro]) VALUES (3, N'Joseph Anthony Garcia', N'josephblas02@gmail.com', N'78592910', 2, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_USUARIO%2Fd288396d8edc4ca8bc884c643ffce03a.JPG?alt=media&token=1772a9ff-ff0e-4d74-9042-77e628a1a066', N'd288396d8edc4ca8bc884c643ffce03a.JPG', N'54e43a12bba4e195acebaae7b2f314b3d61db8da4ee119b57f33f13088f58eab', 1, CAST(N'2022-11-24T22:49:57.750' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [correo], [telefono], [idRol], [urlFoto], [nombreFoto], [clave], [esActivo], [fechaRegistro]) VALUES (4, N'Silvia Martínez Hernández', N'silviamartinezh171@gmail.com', N'55451234', 3, N'https://firebasestorage.googleapis.com/v0/b/libreriavenus-dab96.appspot.com/o/IMAGENES_USUARIO%2F0fbbf90939954072b61ebb7511d79325.JPG?alt=media&token=f0f303b4-451c-437b-881d-55fe9e74bc4b', N'0fbbf90939954072b61ebb7511d79325.JPG', N'39452e9d07139488030222273933af678597ac612f7084c07a8d2eb53e82047a', 1, CAST(N'2022-11-24T22:55:39.840' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Venta_Bookstore] ON 
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (1, N'000001', 1, 1, N'EDDY', N'121232', CAST(37.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(37.00 AS Decimal(10, 2)), CAST(N'2022-11-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (2, N'000002', 1, 1, N'1000000', N'María Martínez', CAST(410.04 AS Decimal(10, 2)), CAST(61.51 AS Decimal(10, 2)), CAST(471.55 AS Decimal(10, 2)), CAST(N'2022-11-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (3, N'000003', 1, 1, N'1000001', N'Bertha Mendez', CAST(189.77 AS Decimal(10, 2)), CAST(28.47 AS Decimal(10, 2)), CAST(218.24 AS Decimal(10, 2)), CAST(N'2022-11-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (4, N'000004', 1, 1, N'1000002', N'Luis Blas', CAST(933.02 AS Decimal(10, 2)), CAST(139.95 AS Decimal(10, 2)), CAST(1072.97 AS Decimal(10, 2)), CAST(N'2022-11-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (5, N'000005', 1, 1, N'1000003', N'Joseph García', CAST(359.78 AS Decimal(10, 2)), CAST(53.97 AS Decimal(10, 2)), CAST(413.75 AS Decimal(10, 2)), CAST(N'2022-11-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (6, N'000006', 1, 1, N'1000004', N'Margarita Peña', CAST(299.05 AS Decimal(10, 2)), CAST(44.86 AS Decimal(10, 2)), CAST(343.91 AS Decimal(10, 2)), CAST(N'2022-11-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (7, N'000007', 1, 1, N'1000005', N'Rosario Obregón', CAST(142.33 AS Decimal(10, 2)), CAST(21.35 AS Decimal(10, 2)), CAST(163.68 AS Decimal(10, 2)), CAST(N'2022-11-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (8, N'000008', 1, 1, N'1000006', N'Katherine Ocón', CAST(246.96 AS Decimal(10, 2)), CAST(37.04 AS Decimal(10, 2)), CAST(284.00 AS Decimal(10, 2)), CAST(N'2022-11-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (9, N'000009', 1, 1, N'1000007', N'Martha Rizo', CAST(227.25 AS Decimal(10, 2)), CAST(34.09 AS Decimal(10, 2)), CAST(261.34 AS Decimal(10, 2)), CAST(N'2022-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (10, N'000010', 1, 1, N'1000007', N'Rosa Aura Lira', CAST(198.16 AS Decimal(10, 2)), CAST(29.72 AS Decimal(10, 2)), CAST(227.88 AS Decimal(10, 2)), CAST(N'2022-11-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (11, N'000011', 1, 1, N'1000008', N'Luis Martínez', CAST(215.82 AS Decimal(10, 2)), CAST(32.37 AS Decimal(10, 2)), CAST(248.19 AS Decimal(10, 2)), CAST(N'2022-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (12, N'000012', 1, 1, N'1000009', N'Josefa Pérez', CAST(1362.89 AS Decimal(10, 2)), CAST(204.43 AS Decimal(10, 2)), CAST(1567.32 AS Decimal(10, 2)), CAST(N'2022-11-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (13, N'000013', 1, 1, N'1000010', N'José Sanchez', CAST(434.61 AS Decimal(10, 2)), CAST(65.19 AS Decimal(10, 2)), CAST(499.80 AS Decimal(10, 2)), CAST(N'2022-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (14, N'000014', 1, 1, N'1000011', N'Rosa Elena ', CAST(270.00 AS Decimal(10, 2)), CAST(40.50 AS Decimal(10, 2)), CAST(310.50 AS Decimal(10, 2)), CAST(N'2022-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (15, N'000015', 1, 1, N'1000011', N'Marcos Ruiz', CAST(761.30 AS Decimal(10, 2)), CAST(114.20 AS Decimal(10, 2)), CAST(875.50 AS Decimal(10, 2)), CAST(N'2022-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (16, N'000016', 1, 1, N'1000013', N'María Ochoa', CAST(1495.10 AS Decimal(10, 2)), CAST(224.26 AS Decimal(10, 2)), CAST(1719.36 AS Decimal(10, 2)), CAST(N'2022-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (17, N'000017', 1, 1, N'1000014', N'Rogelio Perez', CAST(1522.61 AS Decimal(10, 2)), CAST(228.39 AS Decimal(10, 2)), CAST(1751.00 AS Decimal(10, 2)), CAST(N'2022-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (18, N'000018', 1, 1, N'1000015', N'Laura Blas', CAST(317.53 AS Decimal(10, 2)), CAST(47.63 AS Decimal(10, 2)), CAST(365.16 AS Decimal(10, 2)), CAST(N'2022-11-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (19, N'000019', 1, 1, N'1000016', N'Laura Medina', CAST(420.63 AS Decimal(10, 2)), CAST(63.09 AS Decimal(10, 2)), CAST(483.72 AS Decimal(10, 2)), CAST(N'2022-11-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (20, N'000020', 1, 1, N'1000017', N'Litsy Sanchez', CAST(174.36 AS Decimal(10, 2)), CAST(26.15 AS Decimal(10, 2)), CAST(200.51 AS Decimal(10, 2)), CAST(N'2022-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (21, N'000021', 1, 1, N'1000018', N'Jason Mena', CAST(761.30 AS Decimal(10, 2)), CAST(114.20 AS Decimal(10, 2)), CAST(875.50 AS Decimal(10, 2)), CAST(N'2022-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (22, N'000022', 1, 1, N'1000019', N'Laura Blas', CAST(238.24 AS Decimal(10, 2)), CAST(35.74 AS Decimal(10, 2)), CAST(273.98 AS Decimal(10, 2)), CAST(N'2022-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (23, N'000023', 1, 1, N'1000022', N'Pablo Martínez', CAST(1328.30 AS Decimal(10, 2)), CAST(199.25 AS Decimal(10, 2)), CAST(1527.55 AS Decimal(10, 2)), CAST(N'2022-11-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (24, N'000024', 1, 1, N'1000023', N'Reinaldo ', CAST(148.97 AS Decimal(10, 2)), CAST(22.35 AS Decimal(10, 2)), CAST(171.32 AS Decimal(10, 2)), CAST(N'2022-11-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (25, N'000025', 1, 1, N'1000024', N'Rosario', CAST(454.30 AS Decimal(10, 2)), CAST(68.14 AS Decimal(10, 2)), CAST(522.44 AS Decimal(10, 2)), CAST(N'2022-11-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (26, N'000026', 1, 1, N'1000026', N'Andalucia Romero', CAST(72.43 AS Decimal(10, 2)), CAST(10.87 AS Decimal(10, 2)), CAST(83.30 AS Decimal(10, 2)), CAST(N'2022-11-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (27, N'000027', 1, 1, N'1000027', N'Ada Romero', CAST(69.46 AS Decimal(10, 2)), CAST(10.42 AS Decimal(10, 2)), CAST(79.88 AS Decimal(10, 2)), CAST(N'2022-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (28, N'000028', 1, 1, N'1000028', N'Roger', CAST(550.96 AS Decimal(10, 2)), CAST(82.64 AS Decimal(10, 2)), CAST(633.60 AS Decimal(10, 2)), CAST(N'2022-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (29, N'000029', 1, 1, N'1000027', N'Flavio', CAST(122.62 AS Decimal(10, 2)), CAST(18.39 AS Decimal(10, 2)), CAST(141.01 AS Decimal(10, 2)), CAST(N'2022-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (30, N'000030', 1, 1, N'1000030', N'Flavia', CAST(105.84 AS Decimal(10, 2)), CAST(15.88 AS Decimal(10, 2)), CAST(121.72 AS Decimal(10, 2)), CAST(N'2022-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (31, N'000031', 1, 1, N'1000031', N'Lucía', CAST(400.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), CAST(460.00 AS Decimal(10, 2)), CAST(N'2022-11-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (32, N'000032', 1, 1, N'1000032', N'Roberto', CAST(67.96 AS Decimal(10, 2)), CAST(10.19 AS Decimal(10, 2)), CAST(78.15 AS Decimal(10, 2)), CAST(N'2022-11-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (33, N'000033', 1, 1, N'1000032', N'Josefa', CAST(34.21 AS Decimal(10, 2)), CAST(5.13 AS Decimal(10, 2)), CAST(39.34 AS Decimal(10, 2)), CAST(N'2022-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (34, N'000034', 1, 1, N'1000034', N'Criany', CAST(46.12 AS Decimal(10, 2)), CAST(6.92 AS Decimal(10, 2)), CAST(53.04 AS Decimal(10, 2)), CAST(N'2022-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (35, N'000035', 1, 1, N'1000035', N'Cronos', CAST(63.91 AS Decimal(10, 2)), CAST(9.59 AS Decimal(10, 2)), CAST(73.50 AS Decimal(10, 2)), CAST(N'2022-11-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (36, N'000036', 1, 1, N'1000036', N'Silvia', CAST(1006.61 AS Decimal(10, 2)), CAST(150.99 AS Decimal(10, 2)), CAST(1157.60 AS Decimal(10, 2)), CAST(N'2022-11-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (37, N'000037', 1, 1, N'1000036', N'Maricela', CAST(105.84 AS Decimal(10, 2)), CAST(15.88 AS Decimal(10, 2)), CAST(121.72 AS Decimal(10, 2)), CAST(N'2022-11-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (38, N'000038', 1, 1, N'1000038', N'Rosalia', CAST(383.48 AS Decimal(10, 2)), CAST(57.52 AS Decimal(10, 2)), CAST(441.00 AS Decimal(10, 2)), CAST(N'2022-11-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (39, N'000039', 1, 1, N'1000039', N'Camilo', CAST(881.53 AS Decimal(10, 2)), CAST(132.23 AS Decimal(10, 2)), CAST(1013.76 AS Decimal(10, 2)), CAST(N'2022-11-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (40, N'000040', 1, 1, N'1000040', N'Camila', CAST(112.00 AS Decimal(10, 2)), CAST(16.80 AS Decimal(10, 2)), CAST(128.80 AS Decimal(10, 2)), CAST(N'2022-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (41, N'000041', 1, 1, N'1000041', N'Taylirs', CAST(314.00 AS Decimal(10, 2)), CAST(47.10 AS Decimal(10, 2)), CAST(361.10 AS Decimal(10, 2)), CAST(N'2022-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (42, N'000042', 1, 1, N'1000042', N'Rommel', CAST(234.46 AS Decimal(10, 2)), CAST(35.17 AS Decimal(10, 2)), CAST(269.63 AS Decimal(10, 2)), CAST(N'2022-11-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (43, N'000043', 1, 1, N'1000043', N'Jeferson', CAST(761.30 AS Decimal(10, 2)), CAST(114.20 AS Decimal(10, 2)), CAST(875.50 AS Decimal(10, 2)), CAST(N'2022-11-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (44, N'000044', 1, 1, N'1000044', N'Alejandra', CAST(190.00 AS Decimal(10, 2)), CAST(28.50 AS Decimal(10, 2)), CAST(218.50 AS Decimal(10, 2)), CAST(N'2022-11-25T01:40:24.800' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (45, N'000045', 1, 1, N'1000045', N'Alejandro', CAST(200.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), CAST(230.00 AS Decimal(10, 2)), CAST(N'2022-11-25T01:40:43.297' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (46, N'000046', 1, 1, N'1000046', N'Valeria', CAST(72.43 AS Decimal(10, 2)), CAST(10.87 AS Decimal(10, 2)), CAST(83.30 AS Decimal(10, 2)), CAST(N'2022-11-25T01:41:01.530' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (47, N'000047', 1, 1, N'1000046', N'Valerio', CAST(140.87 AS Decimal(10, 2)), CAST(21.13 AS Decimal(10, 2)), CAST(162.00 AS Decimal(10, 2)), CAST(N'2022-11-25T01:41:18.723' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (48, N'000048', 1, 1, N'1000048', N'Mario', CAST(199.73 AS Decimal(10, 2)), CAST(29.96 AS Decimal(10, 2)), CAST(229.69 AS Decimal(10, 2)), CAST(N'2022-11-25T01:41:39.410' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (49, N'000049', 1, 1, N'1000049', N'Edwin', CAST(254.12 AS Decimal(10, 2)), CAST(38.12 AS Decimal(10, 2)), CAST(292.24 AS Decimal(10, 2)), CAST(N'2022-11-25T01:41:59.250' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (50, N'000050', 1, 1, N'1000050', N'Pablo', CAST(41.44 AS Decimal(10, 2)), CAST(6.22 AS Decimal(10, 2)), CAST(47.66 AS Decimal(10, 2)), CAST(N'2022-11-25T01:42:18.790' AS DateTime))
GO
INSERT [dbo].[Venta_Bookstore] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (51, N'000051', 1, 4, N'1000051', N'Auxiliadora', CAST(36.22 AS Decimal(10, 2)), CAST(5.43 AS Decimal(10, 2)), CAST(41.65 AS Decimal(10, 2)), CAST(N'2022-11-25T02:24:59.450' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Venta_Bookstore] OFF
GO
ALTER TABLE [dbo].[Categoria_Bookstore] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Producto_Bookstore] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Rol] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[RolMenu] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[TipoDocumentoVenta] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Venta_Bookstore] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[DetalleVenta_Boostore]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta_Bookstore] ([idVenta])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([idMenuPadre])
REFERENCES [dbo].[Menu] ([idMenu])
GO
ALTER TABLE [dbo].[Producto_Bookstore]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categoria_Bookstore] ([idCategoria])
GO
ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD FOREIGN KEY([idMenu])
REFERENCES [dbo].[Menu] ([idMenu])
GO
ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Venta_Bookstore]  WITH CHECK ADD FOREIGN KEY([idTipoDocumentoVenta])
REFERENCES [dbo].[TipoDocumentoVenta] ([idTipoDocumentoVenta])
GO
ALTER TABLE [dbo].[Venta_Bookstore]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD CHECK  (([Telefono] like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
