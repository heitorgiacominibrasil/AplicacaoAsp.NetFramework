USE [master]
GO
/****** Object:  Database [TreinamentoH]    Script Date: 14/10/2021 14:00:35 ******/
CREATE DATABASE [TreinamentoH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TreinamentoH', FILENAME = N'D:\MSSQL11.MSSQLSERVER\MSSQL\DATA\TreinamentoH.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TreinamentoH_log', FILENAME = N'D:\MSSQL11.MSSQLSERVER\MSSQL\DATA\TreinamentoH_log.ldf' , SIZE = 84992KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TreinamentoH] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TreinamentoH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TreinamentoH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TreinamentoH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TreinamentoH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TreinamentoH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TreinamentoH] SET ARITHABORT OFF 
GO
ALTER DATABASE [TreinamentoH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TreinamentoH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TreinamentoH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TreinamentoH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TreinamentoH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TreinamentoH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TreinamentoH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TreinamentoH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TreinamentoH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TreinamentoH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TreinamentoH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TreinamentoH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TreinamentoH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TreinamentoH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TreinamentoH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TreinamentoH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TreinamentoH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TreinamentoH] SET RECOVERY FULL 
GO
ALTER DATABASE [TreinamentoH] SET  MULTI_USER 
GO
ALTER DATABASE [TreinamentoH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TreinamentoH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TreinamentoH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TreinamentoH] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TreinamentoH]
GO
/****** Object:  User [usr_heitor]    Script Date: 14/10/2021 14:00:35 ******/
CREATE USER [usr_heitor] FOR LOGIN [usr_heitor] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [usr_heitor]
GO
/****** Object:  UserDefinedDataType [dbo].[TipoVar]    Script Date: 14/10/2021 14:00:36 ******/
CREATE TYPE [dbo].[TipoVar] FROM [varchar](100) NOT NULL
GO
/****** Object:  UserDefinedTableType [dbo].[ItemCompraTipo]    Script Date: 14/10/2021 14:00:36 ******/
CREATE TYPE [dbo].[ItemCompraTipo] AS TABLE(
	[codProduto] [int] NULL,
	[Quantidade] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TabelaTipoItem]    Script Date: 14/10/2021 14:00:36 ******/
CREATE TYPE [dbo].[TabelaTipoItem] AS TABLE(
	[codItem] [int] NULL,
	[codCompra] [int] NULL,
	[codProduto] [int] NULL,
	[Quantidade] [int] NULL,
	[ValorUnitario] [decimal](18, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TabelaUsarioTipoItem]    Script Date: 14/10/2021 14:00:36 ******/
CREATE TYPE [dbo].[TabelaUsarioTipoItem] AS TABLE(
	[codItem] [int] NULL,
	[codCompra] [int] NULL,
	[codProduto] [int] NULL,
	[Quantidade] [int] NULL
)
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 14/10/2021 14:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](max) NOT NULL,
	[DataNascimento] [date] NULL,
	[CPF] [varchar](11) NOT NULL,
	[Endereco] [varchar](max) NULL,
	[Excluido] [bit] NULL,
	[DataExclusao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 14/10/2021 14:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodCliente] [int] NOT NULL,
	[DataCompra] [datetime] NULL,
	[ValorTotal] [decimal](18, 2) NULL,
	[Excluido] [bit] NULL,
	[DataExclusao] [datetime] NULL,
 CONSTRAINT [pkCodigo] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemCompra]    Script Date: 14/10/2021 14:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemCompra](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[codProduto] [int] NOT NULL,
	[codCompra] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
	[Excluido] [bit] NULL,
	[DataExclusao] [datetime] NULL,
	[SubTotal] [decimal](18, 2) NULL,
 CONSTRAINT [pkItem] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemComprateste]    Script Date: 14/10/2021 14:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemComprateste](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[codProduto] [int] NOT NULL,
	[codCompra] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
	[Excluido] [bit] NULL,
	[DataExclusao] [datetime] NULL,
	[Valor] [decimal](18, 2) NULL,
 CONSTRAINT [pkItemtest] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 14/10/2021 14:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produto](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[DataCriacao] [datetime] NULL,
	[Descricao] [varchar](max) NULL,
	[ValorUnitario] [decimal](18, 2) NULL,
	[Excluido] [bit] NULL,
	[DataExclusao] [datetime] NULL,
 CONSTRAINT [pkProduto] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[testeitem]    Script Date: 14/10/2021 14:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[testeitem](
	[codItem] [int] NULL,
	[codCompra] [int] NULL,
	[codProduto] [int] NULL,
	[Quantidade] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BrazilCustomers]    Script Date: 14/10/2021 14:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[BrazilCustomers] AS
SELECT *
FROM ItemCompra
GO
ALTER TABLE [dbo].[Cliente] ADD  DEFAULT ((0)) FOR [Excluido]
GO
ALTER TABLE [dbo].[Compra] ADD  CONSTRAINT [DF_Compra_DataCompra]  DEFAULT (getdate()) FOR [DataCompra]
GO
ALTER TABLE [dbo].[Compra] ADD  CONSTRAINT [DF_Compra_Excluido]  DEFAULT (NULL) FOR [Excluido]
GO
ALTER TABLE [dbo].[ItemCompra] ADD  DEFAULT ((0)) FOR [Excluido]
GO
ALTER TABLE [dbo].[Produto] ADD  DEFAULT (getdate()) FOR [DataCriacao]
GO
ALTER TABLE [dbo].[Produto] ADD  DEFAULT ((0)) FOR [Excluido]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [fkCliente] FOREIGN KEY([CodCliente])
REFERENCES [dbo].[Cliente] ([Codigo])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [fkCliente]
GO
ALTER TABLE [dbo].[ItemCompra]  WITH CHECK ADD  CONSTRAINT [fkCompra] FOREIGN KEY([codCompra])
REFERENCES [dbo].[Compra] ([Codigo])
GO
ALTER TABLE [dbo].[ItemCompra] CHECK CONSTRAINT [fkCompra]
GO
ALTER TABLE [dbo].[ItemCompra]  WITH CHECK ADD  CONSTRAINT [fkProduto] FOREIGN KEY([codProduto])
REFERENCES [dbo].[Produto] ([Codigo])
GO
ALTER TABLE [dbo].[ItemCompra] CHECK CONSTRAINT [fkProduto]
GO
/****** Object:  StoredProcedure [dbo].[AtualizarCompra]    Script Date: 14/10/2021 14:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AtualizarCompra] (
	@CodCompra int,
	@CodCliente int,
	@meusitensdacompra TabelaTipoItem readonly
) 
AS BEGIN
	BEGIN TRY
		BEGIN TRANSACTION		
		--SELECT ItemCompra.* FROM ItemCompra LEFT JOIN ItemComprateste 
		--ON ItemCompra.codProduto = ItemComprateste.codProduto WHERE ItemComprateste.codProduto IS NULL;

		--PRiMEIRA PARTE REMOVER OS EXCLUIDOS
		--DESATIVAR AS COMPRAS QUE ESTAO NA TABELA MAS NAO ESTAO NA NOVA LISTA
		UPDATE ItemCompra 
			SET Excluido = 1, 
				DataExclusao = GETDATE()
			FROM (
			SELECT ItemCompra.* FROM ItemCompra LEFT JOIN @meusitensdacompra as aliasitem  
			ON ItemCompra.Codigo = aliasitem.codItem WHERE aliasitem.codItem IS NULL
					) AS Resultado
			WHERE ItemCompra.Codigo = Resultado.Codigo AND ItemCompra.codCompra = @CodCompra;
		--SEGUNDA PARTE EDITAR OS ANTIGOS
		UPDATE ItemCompra 
			SET 
			Quantidade = Resultado.Quantidade
			FROM (
				SELECT aliasitem.* FROM @meusitensdacompra as aliasitem Inner JOIN ItemCompra  
				ON aliasitem.codItem = ItemCompra.Codigo
			) AS Resultado
			WHERE 
				ItemCompra.Codigo = Resultado.codItem;
		--TERCEIRA PARTE ADICIONAR OS NOVOS
		Insert into ItemCompra (codProduto, codCompra, Quantidade, SubTotal)
				SELECT
					Resultado.codProduto,@CodCompra, Resultado.Quantidade,cast((Resultado.ValorUnitario*Resultado.Quantidade) as decimal(18,2)) 
				FROM
					(SELECT aliasitem.*
			FROM @meusitensdacompra as aliasitem LEFT JOIN ItemCompra 
			ON aliasitem.codItem = ItemCompra.Codigo
			WHERE ItemCompra.Codigo IS NULL)
			as Resultado;
		--QUARTA PARTE ATUALIZAR O TOTAL DA COMPRA
		UPDATE Compra 
			SET ValorTotal = (
				SELECT SUM(SubTotal)
				FROM ItemCompra
				WHERE ItemCompra.codCompra = @CodCompra AND ItemCompra.Excluido = 0   
			)
			WHERE 
				Compra.Codigo = @CodCompra;
		--Mudar quantidade para subtotal
		--FIM

		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
		
		DECLARE @message VARCHAR(MAX)
		DECLARE @sv INT
		DECLARE @st INT
		select @message = ERROR_MESSAGE() , @sv = ERROR_SEVERITY(),  @st = ERROR_STATE()	
		--INSERT INTO log (texto, data) values (@message, GETDATE())	
		--RAISERROR ('DEU ERRO', 17, 0)
		RAISERROR (@message, @sv, @st)
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DesativarCompra]    Script Date: 14/10/2021 14:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DesativarCompra] (
	@CodCompra int
) 
as begin
	BEGIN TRY
		BEGIN TRANSACTION	
			UPDATE Compra SET Excluido = 1 , DataExclusao= getDate() Where Codigo = @CodCompra
			UPDATE ItemCompra SET Excluido = 1 , DataExclusao= getDate() Where codCompra = @CodCompra
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION 		
		DECLARE @message VARCHAR(MAX)
		DECLARE @sv INT
		DECLARE @st INT
		select @message = ERROR_MESSAGE() , @sv = ERROR_SEVERITY(),  @st = ERROR_STATE()	
		--INSERT INTO log (texto, data) values (@message, GETDATE())	
		--RAISERROR ('DEU ERRO', 17, 0)
		RAISERROR (@message, @sv, @st)
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[LerTodasCompra]    Script Date: 14/10/2021 14:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[LerTodasCompra]
	@IdCompra int = NULL
AS BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION	
			if (@IdCompra IS NULL)
				begin
					Select Compra.Codigo,CodCliente, Nome ,DataCompra,ValorTotal
						From Compra Inner Join Cliente 
						on Compra.CodCliente= Cliente.Codigo 
						Where Compra.Excluido is null OR Compra.Excluido = 0;

					Select ItemCompra.Codigo,
						ItemCompra.codCompra,
						ItemCompra.codProduto,
						Produto.Descricao,
						Produto.ValorUnitario,
						ItemCompra.Quantidade,
						ItemCompra.SubTotal,
						ItemCompra.Quantidade
						From ItemCompra Inner join Produto
						on ItemCompra.codProduto = Produto.Codigo
						Where ItemCompra.Excluido is null OR ItemCompra.Excluido = 0 ;	
				end
			else
				begin
					Select Compra.Codigo,CodCliente, Nome ,DataCompra,ValorTotal
						From Compra Inner Join Cliente 
						on Compra.CodCliente= Cliente.Codigo 
						Where (Compra.Excluido is null OR Compra.Excluido = 0) AND Compra.Codigo = @IdCompra;

					Select ItemCompra.Codigo,
						ItemCompra.codCompra,
						ItemCompra.codProduto,
						Produto.Descricao,
						Produto.ValorUnitario,
						ItemCompra.Quantidade,
						ItemCompra.SubTotal,
						ItemCompra.Quantidade
						From ItemCompra Inner join Produto
						on ItemCompra.codProduto = Produto.Codigo
						Where (ItemCompra.Excluido is null OR ItemCompra.Excluido = 0) AND ItemCompra.CodCompra = @IdCompra;
				end
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION 		
		DECLARE @message VARCHAR(MAX)
		DECLARE @sv INT
		DECLARE @st INT
		select @message = ERROR_MESSAGE() , @sv = ERROR_SEVERITY(),  @st = ERROR_STATE()	
		--INSERT INTO log (texto, data) values (@message, GETDATE())	
		--RAISERROR ('DEU ERRO', 17, 0)
		RAISERROR (@message, @sv, @st)
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[SalvarCompra]    Script Date: 14/10/2021 14:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SalvarCompra] (
	@CodCliente int, 
	@ValorTotal decimal(18,2),
	@items ItemCompraTipo readonly
) 
as begin
	BEGIN TRY
		BEGIN TRANSACTION	
			Insert into Compra (CodCliente, ValorTotal) values (@CodCliente, @ValorTotal);
			declare @CodigoCompra int = SCOPE_IDENTITY();
			insert into ItemCompra(codProduto,codCompra,Quantidade, SubTotal)
				select  codProduto,@CodigoCompra,Quantidade,Quantidade*Produto.ValorUnitario from @items as meuitem 
					Inner Join Produto on meuitem.codProduto = Produto.Codigo;
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION 		
		DECLARE @message VARCHAR(MAX)
		DECLARE @sv INT
		DECLARE @st INT
		select @message = ERROR_MESSAGE() , @sv = ERROR_SEVERITY(),  @st = ERROR_STATE()	
		--INSERT INTO log (texto, data) values (@message, GETDATE())	
		--RAISERROR ('DEU ERRO', 17, 0)
		RAISERROR (@message, @sv, @st)
	END CATCH
end
GO
USE [master]
GO
ALTER DATABASE [TreinamentoH] SET  READ_WRITE 
GO
