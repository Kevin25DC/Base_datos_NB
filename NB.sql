CREATE DATABASE NB;
GO

USE [NB]
GO

CREATE TABLE [dbo].[categoria](
	[catg_id] [varchar](50) NOT NULL,
	[catg_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[catg_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[fotos_productos](
	[id_fotProduct] [varchar](50) NOT NULL,
	[id_productos] [varchar](50) NOT NULL,
	[fotos] [varchar](50) NULL,
 CONSTRAINT [PK_fotos_productos] PRIMARY KEY CLUSTERED 
(
	[id_fotProduct] ASC,
	[id_productos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[ordenes](
	[ord_id] [varchar](50) NOT NULL,
	[ord_estado] [varchar](50) NULL,
	[ord_fec] [datetime2](7) NULL,
	[id_usuario] [uniqueidentifier] NULL,
	[id_categoria] [varchar](50) NULL,
	[id_productos] [varchar](50) NULL,
 CONSTRAINT [PK_ordenes] PRIMARY KEY CLUSTERED 
(
	[ord_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[product_ordenes](
	[product_idproductos] [varchar](50) NULL,
	[ordenes_idordenes] [varchar](50) NULL
) ON [PRIMARY]


CREATE TABLE [dbo].[Productos](
	[Pro_id] [varchar](50) NOT NULL,
	[Pro_name_products] [varchar](50) NULL,
	[Pro_price_products] [varchar](50) NULL,
	[Pro_foto] [varchar](50) NULL,
	[Pro_id_producto] [varchar](50) NULL,
	[Pro_estado_producs] [varchar](50) NULL,
	[id_categoria] [varchar](50) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[tipUsuarios](
	[id_tipo_usuario] [uniqueidentifier] NOT NULL,
	[nombre_tipo] [varchar](45) NOT NULL,
 CONSTRAINT [PK_tipUsuarios] PRIMARY KEY CLUSTERED 
(
	[id_tipo_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]




CREATE TABLE [dbo].[usuarios](
	[id_usuario] [uniqueidentifier] DEFAULT NEWID(),
	[usu_nombre] [varchar](40) NOT NULL,
	[usu_apellido] [varchar](45) NOT NULL,
	[usu_email] [varchar](45) NOT NULL,
	[usu_direccion] [varchar](45) NOT NULL,
	[usu_telefono] [varchar](10) NOT NULL,
	[usu_ID_tipe] [varchar](45) NOT NULL,
	[usu_identificacion] [varchar](10) NOT NULL,
	[usu_contraseña] [varchar](45) NOT NULL,
	[usu_alias_usuario] [varchar](45) NOT NULL,
	[usu_estado_usuario] [varchar](50) NOT NULL,
	[usu_fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



CREATE TABLE [dbo].[usuarios_tipo_rol](
	[id_usuario] [uniqueidentifier] NOT NULL,
	[tipo_id] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[tipo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[fotos_productos]  WITH CHECK ADD  CONSTRAINT [fk_id_productos] FOREIGN KEY([id_productos])
REFERENCES [dbo].[Productos] ([Pro_id])
GO
ALTER TABLE [dbo].[fotos_productos] CHECK CONSTRAINT [fk_id_productos]
GO
ALTER TABLE [dbo].[ordenes]  WITH CHECK ADD  CONSTRAINT [fk_categoria_id] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([catg_id])
GO
ALTER TABLE [dbo].[ordenes] CHECK CONSTRAINT [fk_categoria_id]
GO
ALTER TABLE [dbo].[ordenes]  WITH CHECK ADD  CONSTRAINT [fk_productos_id] FOREIGN KEY([id_productos])
REFERENCES [dbo].[Productos] ([Pro_id])
GO
ALTER TABLE [dbo].[ordenes] CHECK CONSTRAINT [fk_productos_id]
GO
ALTER TABLE [dbo].[ordenes]  WITH CHECK ADD  CONSTRAINT [fk_usuario_id] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[ordenes] CHECK CONSTRAINT [fk_usuario_id]
GO
ALTER TABLE [dbo].[product_ordenes]  WITH CHECK ADD  CONSTRAINT [fk_ordenes_id_productos] FOREIGN KEY([ordenes_idordenes])
REFERENCES [dbo].[ordenes] ([ord_id])
GO
ALTER TABLE [dbo].[product_ordenes] CHECK CONSTRAINT [fk_ordenes_id_productos]
GO
ALTER TABLE [dbo].[product_ordenes]  WITH CHECK ADD  CONSTRAINT [fk_producto_id_ordenes] FOREIGN KEY([product_idproductos])
REFERENCES [dbo].[Productos] ([Pro_id])
GO
ALTER TABLE [dbo].[product_ordenes] CHECK CONSTRAINT [fk_producto_id_ordenes]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [fk_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([catg_id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [fk_categoria]
GO
ALTER TABLE [dbo].[usuarios_tipo_rol]  WITH CHECK ADD  CONSTRAINT [fk_tipo_id_rol] FOREIGN KEY([tipo_id])
REFERENCES [dbo].[tipUsuarios] ([id_tipo_usuario])
GO
ALTER TABLE [dbo].[usuarios_tipo_rol] CHECK CONSTRAINT [fk_tipo_id_rol]
GO
ALTER TABLE [dbo].[usuarios_tipo_rol]  WITH CHECK ADD  CONSTRAINT [fk_usuario_id_rol] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[usuarios_tipo_rol] CHECK CONSTRAINT [fk_usuario_id_rol]
GO

/**---- insertar datos -------**/
INSERT INTO usuarios VALUES (kevin,hernandez, kevin@gmail.com, carrera 22D # 75 c 03,3013916533,admi,1192705128,ncwh251ebibfe38,elmejor,true,2007-05-08 12:35:29.123);
INSERT INTO usuarios VALUES (karina,orozco, kevin@gmail.com, carrera 22D # 75 c 03,3013916533,admi,1192705128,ncwh251ebibfe38,elmejor,true,2007-05-08 12:35:29.123);
INSERT INTO usuarios VALUES (mateo,morelo, kevin@gmail.com, carrera 22D # 75 c 03,3013916533,admi,1192705128,ncwh251ebibfe38,elmejor,true,2007-05-08 12:35:29.123);