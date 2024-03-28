USE [master]
GO
/****** Object:  Database [Faktura]    Script Date: 3/28/2024 12:52:49 AM ******/
CREATE DATABASE [Faktura]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Faktura1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MYSERVER\MSSQL\DATA\Faktura1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Faktura1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MYSERVER\MSSQL\DATA\Faktura1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Faktura] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Faktura].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Faktura] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Faktura] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Faktura] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Faktura] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Faktura] SET ARITHABORT OFF 
GO
ALTER DATABASE [Faktura] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Faktura] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Faktura] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Faktura] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Faktura] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Faktura] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Faktura] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Faktura] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Faktura] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Faktura] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Faktura] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Faktura] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Faktura] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Faktura] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Faktura] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Faktura] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Faktura] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Faktura] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Faktura] SET  MULTI_USER 
GO
ALTER DATABASE [Faktura] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Faktura] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Faktura] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Faktura] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Faktura] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Faktura] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Faktura] SET QUERY_STORE = ON
GO
ALTER DATABASE [Faktura] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Faktura]
GO
/****** Object:  Table [dbo].[Versandkosten]    Script Date: 3/28/2024 12:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Versandkosten](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Betrag] [float] NULL,
	[Bezeichnung] [nvarchar](50) NULL,
 CONSTRAINT [PK_Versandkosten] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rechnungen]    Script Date: 3/28/2024 12:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rechnungen](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KundenID] [int] NULL,
	[RechnungNr] [int] NULL,
	[VersandkostnID] [int] NULL,
	[SkontoID] [int] NULL,
	[RechnungsDatum] [datetime] NULL,
 CONSTRAINT [PK_Rechnungen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RechnungsDetails]    Script Date: 3/28/2024 12:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RechnungsDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RechnungsID] [int] NULL,
	[ArtikelID] [int] NULL,
	[MwStID] [int] NULL,
	[Menge] [float] NULL,
	[VK] [decimal](18, 2) NULL,
	[EK] [decimal](18, 2) NULL,
 CONSTRAINT [PK_RechnungsDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MwSt]    Script Date: 3/28/2024 12:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MwSt](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MwSt] [float] NULL,
	[aktive] [bit] NULL,
 CONSTRAINT [PK_MwSt] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artikel]    Script Date: 3/28/2024 12:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artikel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ArtikelNr] [nvarchar](50) NULL,
	[LagerID] [int] NULL,
	[ArtikelName] [nvarchar](50) NULL,
	[ArtikelBeschreibung] [ntext] NULL,
	[ArtikelVK] [decimal](18, 2) NULL,
	[ArtikelEK] [decimal](18, 2) NULL,
	[LagerBestand] [float] NULL,
	[Hoehe] [float] NULL,
	[Breite] [float] NULL,
	[Tiefe] [float] NULL,
	[Gewicht] [float] NULL,
 CONSTRAINT [PK_Artikel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kunden]    Script Date: 3/28/2024 12:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kunden](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlzID] [int] NULL,
	[AnredeID] [int] NULL,
	[Vorname] [nvarchar](50) NULL,
	[Nachname] [nvarchar](50) NULL,
	[Strasse] [nvarchar](50) NULL,
	[Hnr] [nvarchar](10) NULL,
 CONSTRAINT [PK_Kunden] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skonto]    Script Date: 3/28/2024 12:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skonto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Skonto] [float] NULL,
	[Bezeichnung] [nvarchar](50) NULL,
 CONSTRAINT [PK_SkontoTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[RechnungsSummenVIEW]    Script Date: 3/28/2024 12:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RechnungsSummenVIEW]
AS
SELECT        dbo.Rechnungen.ID AS RechnungsID, SUM(dbo.RechnungsDetails.Menge * dbo.RechnungsDetails.VK) AS GesamtNetto, SUM(dbo.RechnungsDetails.Menge * dbo.RechnungsDetails.VK * dbo.MwSt.MwSt) AS GesamtMwSt, 
                         SUM(dbo.RechnungsDetails.Menge * dbo.RechnungsDetails.VK * dbo.MwSt.MwSt + dbo.RechnungsDetails.Menge * dbo.RechnungsDetails.VK + dbo.Versandkosten.Betrag) AS GesamtBrutto, dbo.Skonto.Bezeichnung, 
                         SUM(dbo.Skonto.Skonto * (dbo.RechnungsDetails.Menge * dbo.RechnungsDetails.VK * dbo.MwSt.MwSt + dbo.RechnungsDetails.Menge * dbo.RechnungsDetails.VK)) AS SkontoBetrag
FROM            dbo.Rechnungen INNER JOIN
                         dbo.RechnungsDetails ON dbo.Rechnungen.ID = dbo.RechnungsDetails.RechnungsID INNER JOIN
                         dbo.MwSt ON dbo.RechnungsDetails.MwStID = dbo.MwSt.ID INNER JOIN
                         dbo.Kunden ON dbo.Rechnungen.KundenID = dbo.Kunden.ID INNER JOIN
                         dbo.Artikel ON dbo.RechnungsDetails.ArtikelID = dbo.Artikel.ID INNER JOIN
                         dbo.Skonto ON dbo.Rechnungen.SkontoID = dbo.Skonto.ID INNER JOIN
                         dbo.Versandkosten ON dbo.Rechnungen.VersandkostnID = dbo.Versandkosten.ID
GROUP BY dbo.Rechnungen.ID, dbo.Skonto.Bezeichnung
GO
/****** Object:  View [dbo].[RechnungsReportVIEW]    Script Date: 3/28/2024 12:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RechnungsReportVIEW]
AS
SELECT        dbo.Rechnungen.ID AS RechnungsID, dbo.Kunden.Vorname + N' ' + dbo.Kunden.Nachname AS Briefanrede, dbo.RechnungsDetails.Menge, dbo.Artikel.ArtikelName, dbo.Artikel.ArtikelBeschreibung, dbo.RechnungsDetails.VK, 
                         dbo.RechnungsDetails.Menge * dbo.RechnungsDetails.VK AS NettoZeile, dbo.RechnungsDetails.Menge * dbo.RechnungsDetails.VK * dbo.MwSt.MwSt AS MwStZeile, 
                         dbo.RechnungsDetails.Menge * dbo.RechnungsDetails.VK * dbo.MwSt.MwSt + dbo.RechnungsDetails.Menge * dbo.RechnungsDetails.VK AS BruttoZeile, dbo.RechnungsSummenVIEW.GesamtNetto, 
                         dbo.RechnungsSummenVIEW.GesamtMwSt, dbo.Versandkosten.Betrag AS Versandkosten, dbo.RechnungsSummenVIEW.GesamtBrutto
FROM            dbo.Rechnungen INNER JOIN
                         dbo.RechnungsDetails ON dbo.Rechnungen.ID = dbo.RechnungsDetails.RechnungsID INNER JOIN
                         dbo.MwSt ON dbo.RechnungsDetails.MwStID = dbo.MwSt.ID INNER JOIN
                         dbo.Kunden ON dbo.Rechnungen.KundenID = dbo.Kunden.ID INNER JOIN
                         dbo.Artikel ON dbo.RechnungsDetails.ArtikelID = dbo.Artikel.ID INNER JOIN
                         dbo.RechnungsSummenVIEW ON dbo.Rechnungen.ID = dbo.RechnungsSummenVIEW.RechnungsID INNER JOIN
                         dbo.Versandkosten ON dbo.Rechnungen.VersandkostnID = dbo.Versandkosten.ID
GO
/****** Object:  View [dbo].[AliasVIEW]    Script Date: 3/28/2024 12:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AliasVIEW]
AS
SELECT        K.ID AS KundenNr, R.ID, RD.Menge * RD.VK AS NettoBetrag, RD.Menge * RD.VK * M.MwSt AS MwSt
FROM            dbo.Kunden AS K INNER JOIN
                         dbo.Rechnungen AS R ON K.ID = R.KundenID INNER JOIN
                         dbo.RechnungsDetails AS RD ON R.ID = RD.RechnungsID INNER JOIN
                         dbo.MwSt AS M ON RD.MwStID = M.ID
GO
/****** Object:  Table [dbo].[Anrede]    Script Date: 3/28/2024 12:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anrede](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Anrede] [nvarchar](10) NULL,
	[Briefanrede] [nvarchar](30) NULL,
 CONSTRAINT [PK_Anrede] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plz]    Script Date: 3/28/2024 12:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plz](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Plz] [nvarchar](5) NULL,
	[Ort] [nvarchar](50) NULL,
	[Vorwahl] [nvarchar](10) NULL,
 CONSTRAINT [PK_Plz] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Anrede] ON 

INSERT [dbo].[Anrede] ([ID], [Anrede], [Briefanrede]) VALUES (1, N'Herr', N'Sehr geehrter Herr')
INSERT [dbo].[Anrede] ([ID], [Anrede], [Briefanrede]) VALUES (2, N'Frau', N'Sehr geehrte Frau')
INSERT [dbo].[Anrede] ([ID], [Anrede], [Briefanrede]) VALUES (3, N'Divers', N'Sehr geehrte ?')
SET IDENTITY_INSERT [dbo].[Anrede] OFF
GO
SET IDENTITY_INSERT [dbo].[Artikel] ON 

INSERT [dbo].[Artikel] ([ID], [ArtikelNr], [LagerID], [ArtikelName], [ArtikelBeschreibung], [ArtikelVK], [ArtikelEK], [LagerBestand], [Hoehe], [Breite], [Tiefe], [Gewicht]) VALUES (1, N'123456AA', 1, N'T-Shirt Blau', N'Sehr schönes T-Shirt für einen tollen Urlaub', CAST(10.00 AS Decimal(18, 2)), CAST(6.50 AS Decimal(18, 2)), 100, NULL, NULL, NULL, NULL)
INSERT [dbo].[Artikel] ([ID], [ArtikelNr], [LagerID], [ArtikelName], [ArtikelBeschreibung], [ArtikelVK], [ArtikelEK], [LagerBestand], [Hoehe], [Breite], [Tiefe], [Gewicht]) VALUES (2, N'126555BB', 1, N'Arbeitshose', NULL, CAST(25.00 AS Decimal(18, 2)), CAST(12.50 AS Decimal(18, 2)), 50, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Artikel] OFF
GO
SET IDENTITY_INSERT [dbo].[Kunden] ON 

INSERT [dbo].[Kunden] ([ID], [PlzID], [AnredeID], [Vorname], [Nachname], [Strasse], [Hnr]) VALUES (1, 1, 1, N'Martin', N'Mustermann', N'Mustergasse', N'12')
INSERT [dbo].[Kunden] ([ID], [PlzID], [AnredeID], [Vorname], [Nachname], [Strasse], [Hnr]) VALUES (2, 2, 2, N'Sabine', N'Musterfrau', N'Mustwerg', N'15 A')
SET IDENTITY_INSERT [dbo].[Kunden] OFF
GO
SET IDENTITY_INSERT [dbo].[MwSt] ON 

INSERT [dbo].[MwSt] ([ID], [MwSt], [aktive]) VALUES (1, 0.19, 1)
INSERT [dbo].[MwSt] ([ID], [MwSt], [aktive]) VALUES (2, 0.07, 1)
INSERT [dbo].[MwSt] ([ID], [MwSt], [aktive]) VALUES (3, 0.16, 0)
SET IDENTITY_INSERT [dbo].[MwSt] OFF
GO
SET IDENTITY_INSERT [dbo].[Plz] ON 

INSERT [dbo].[Plz] ([ID], [Plz], [Ort], [Vorwahl]) VALUES (1, N'79674', N'Todtnau', N'07671')
INSERT [dbo].[Plz] ([ID], [Plz], [Ort], [Vorwahl]) VALUES (2, N'79673', N'SChönau', N'07673')
SET IDENTITY_INSERT [dbo].[Plz] OFF
GO
SET IDENTITY_INSERT [dbo].[Rechnungen] ON 

INSERT [dbo].[Rechnungen] ([ID], [KundenID], [RechnungNr], [VersandkostnID], [SkontoID], [RechnungsDatum]) VALUES (1, 1, 12345, 3, 1, CAST(N'2025-12-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rechnungen] OFF
GO
SET IDENTITY_INSERT [dbo].[RechnungsDetails] ON 

INSERT [dbo].[RechnungsDetails] ([ID], [RechnungsID], [ArtikelID], [MwStID], [Menge], [VK], [EK]) VALUES (2, 1, 1, 1, 10, CAST(100.00 AS Decimal(18, 2)), CAST(78.25 AS Decimal(18, 2)))
INSERT [dbo].[RechnungsDetails] ([ID], [RechnungsID], [ArtikelID], [MwStID], [Menge], [VK], [EK]) VALUES (3, 1, 2, 1, 5, CAST(55.23 AS Decimal(18, 2)), CAST(35.23 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[RechnungsDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Skonto] ON 

INSERT [dbo].[Skonto] ([ID], [Skonto], [Bezeichnung]) VALUES (1, 0.03, N'3% Skonten bei Zahlung innerhalb von 7 Tagen')
INSERT [dbo].[Skonto] ([ID], [Skonto], [Bezeichnung]) VALUES (2, 0, N'Zahlung innerhalb von 14 tagen')
SET IDENTITY_INSERT [dbo].[Skonto] OFF
GO
SET IDENTITY_INSERT [dbo].[Versandkosten] ON 

INSERT [dbo].[Versandkosten] ([ID], [Betrag], [Bezeichnung]) VALUES (1, 0, N'keine Versandkosten')
INSERT [dbo].[Versandkosten] ([ID], [Betrag], [Bezeichnung]) VALUES (2, 4.5, N'kleines Paket')
INSERT [dbo].[Versandkosten] ([ID], [Betrag], [Bezeichnung]) VALUES (3, 7.5, N'mittleres Paket')
INSERT [dbo].[Versandkosten] ([ID], [Betrag], [Bezeichnung]) VALUES (4, 10.5, N'großes Paket')
INSERT [dbo].[Versandkosten] ([ID], [Betrag], [Bezeichnung]) VALUES (5, 50, N'2 Man handling')
SET IDENTITY_INSERT [dbo].[Versandkosten] OFF
GO
ALTER TABLE [dbo].[MwSt] ADD  CONSTRAINT [DF_MwSt_aktive]  DEFAULT ((1)) FOR [aktive]
GO
ALTER TABLE [dbo].[Kunden]  WITH CHECK ADD  CONSTRAINT [FK_Kunden_Anrede] FOREIGN KEY([AnredeID])
REFERENCES [dbo].[Anrede] ([ID])
GO
ALTER TABLE [dbo].[Kunden] CHECK CONSTRAINT [FK_Kunden_Anrede]
GO
ALTER TABLE [dbo].[Kunden]  WITH CHECK ADD  CONSTRAINT [FK_Kunden_Plz] FOREIGN KEY([PlzID])
REFERENCES [dbo].[Plz] ([ID])
GO
ALTER TABLE [dbo].[Kunden] CHECK CONSTRAINT [FK_Kunden_Plz]
GO
ALTER TABLE [dbo].[Rechnungen]  WITH CHECK ADD  CONSTRAINT [FK_Rechnungen_Kunden] FOREIGN KEY([KundenID])
REFERENCES [dbo].[Kunden] ([ID])
GO
ALTER TABLE [dbo].[Rechnungen] CHECK CONSTRAINT [FK_Rechnungen_Kunden]
GO
ALTER TABLE [dbo].[Rechnungen]  WITH CHECK ADD  CONSTRAINT [FK_Rechnungen_Skonto] FOREIGN KEY([SkontoID])
REFERENCES [dbo].[Skonto] ([ID])
GO
ALTER TABLE [dbo].[Rechnungen] CHECK CONSTRAINT [FK_Rechnungen_Skonto]
GO
ALTER TABLE [dbo].[Rechnungen]  WITH CHECK ADD  CONSTRAINT [FK_Rechnungen_Versandkosten] FOREIGN KEY([VersandkostnID])
REFERENCES [dbo].[Versandkosten] ([ID])
GO
ALTER TABLE [dbo].[Rechnungen] CHECK CONSTRAINT [FK_Rechnungen_Versandkosten]
GO
ALTER TABLE [dbo].[RechnungsDetails]  WITH CHECK ADD  CONSTRAINT [FK_RechnungsDetails_Artikel] FOREIGN KEY([ArtikelID])
REFERENCES [dbo].[Artikel] ([ID])
GO
ALTER TABLE [dbo].[RechnungsDetails] CHECK CONSTRAINT [FK_RechnungsDetails_Artikel]
GO
ALTER TABLE [dbo].[RechnungsDetails]  WITH CHECK ADD  CONSTRAINT [FK_RechnungsDetails_MwSt] FOREIGN KEY([MwStID])
REFERENCES [dbo].[MwSt] ([ID])
GO
ALTER TABLE [dbo].[RechnungsDetails] CHECK CONSTRAINT [FK_RechnungsDetails_MwSt]
GO
ALTER TABLE [dbo].[RechnungsDetails]  WITH CHECK ADD  CONSTRAINT [FK_RechnungsDetails_Rechnungen] FOREIGN KEY([RechnungsID])
REFERENCES [dbo].[Rechnungen] ([ID])
GO
ALTER TABLE [dbo].[RechnungsDetails] CHECK CONSTRAINT [FK_RechnungsDetails_Rechnungen]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relation zw Kunden und Plz' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kunden', @level2type=N'CONSTRAINT',@level2name=N'FK_Kunden_Plz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primärschlüssel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plz', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'das ist die Postleitzahl' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plz', @level2type=N'COLUMN',@level2name=N'Plz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Das ist der Ort Spalte' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plz', @level2type=N'COLUMN',@level2name=N'Ort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Das ist die Ortsvorwahl Spalte' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plz', @level2type=N'COLUMN',@level2name=N'Vorwahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "K"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "R"
            Begin Extent = 
               Top = 65
               Left = 290
               Bottom = 264
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RD"
            Begin Extent = 
               Top = 25
               Left = 547
               Bottom = 219
               Right = 717
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 6
               Left = 755
               Bottom = 119
               Right = 925
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 5760
         Alias = 1305
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AliasVIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AliasVIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[55] 4[20] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Rechnungen"
            Begin Extent = 
               Top = 10
               Left = 477
               Bottom = 202
               Right = 661
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "RechnungsDetails"
            Begin Extent = 
               Top = 7
               Left = 709
               Bottom = 170
               Right = 903
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MwSt"
            Begin Extent = 
               Top = 0
               Left = 958
               Bottom = 113
               Right = 1128
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kunden"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Artikel"
            Begin Extent = 
               Top = 140
               Left = 48
               Bottom = 303
               Right = 275
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Versandkosten"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RechnungsSummenVIEW"
            Begin Extent = 
               Top = 207
               Left = 482
               Bottom = 370
               Right = 676
            End
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RechnungsReportVIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 3000
         Width = 3135
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1200
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 9090
         Alias = 1860
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RechnungsReportVIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RechnungsReportVIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[28] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Rechnungen"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 262
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "RechnungsDetails"
            Begin Extent = 
               Top = 0
               Left = 304
               Bottom = 163
               Right = 498
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MwSt"
            Begin Extent = 
               Top = 7
               Left = 549
               Bottom = 148
               Right = 743
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kunden"
            Begin Extent = 
               Top = 7
               Left = 791
               Bottom = 170
               Right = 985
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Artikel"
            Begin Extent = 
               Top = 154
               Left = 549
               Bottom = 317
               Right = 776
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Skonto"
            Begin Extent = 
               Top = 157
               Left = 470
               Bottom = 298
               Right = 680
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Versandkosten"
            Begin Extent = 
               Top = 6
               Left = 1023
               Bottom = 119
               Right = 1209
            End
            DisplayF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RechnungsSummenVIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'lags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 3825
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 8625
         Alias = 1230
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RechnungsSummenVIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RechnungsSummenVIEW'
GO
USE [master]
GO
ALTER DATABASE [Faktura] SET  READ_WRITE 
GO
