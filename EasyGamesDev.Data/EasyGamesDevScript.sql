CREATE DATABASE EasyGamesDevDB -- run first then comment out to create db.
USE [EasyGamesDevDB]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 2022/11/21 21:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[ClientBalance] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 2022/11/21 21:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[TransactionID] [bigint] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransactionTypeID] [smallint] NOT NULL,
	[ClientID] [int] NOT NULL,
	[Comment] [nvarchar](100) NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 2022/11/21 21:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[TransactionTypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[TransactionTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (1, N'Bobby', N'Hodges', CAST(1010.21 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (2, N'Reynard', N'Mendez', CAST(2000.52 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (3, N'Dudley', N'Gordon', CAST(0.02 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (4, N'Osbert', N'Ogley', CAST(10000.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (5, N'Matilda', N'Schwartz', CAST(80000.25 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (6, N'Ed', N'Norris', CAST(550000.15 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (7, N'Kennard', N'Schneider', CAST(3610558.02 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (8, N'Oscar', N'Rowe', CAST(210042.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (9, N'Garrick', N'Moore', CAST(1201020.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (10, N'Vincent', N'Cooper', CAST(475778578.35 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (11, N'Errol', N'Rice', CAST(-1999.73 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (12, N'Darlene', N'Alvarado', CAST(4214242.63 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (13, N'Ingram', N'Marshall', CAST(74754427.85 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (14, N'Noah', N'Reyes', CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (15, N'Tamara', N'Elledge', CAST(4275278.52 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (16, N'John', N'Frazier', CAST(24240785.48 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (17, N'Alma', N'Ortega', CAST(5277820.63 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (18, N'Miranda', N'Herrera', CAST(446.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ClientBalance]) VALUES (19, N'Viresh', N'Hemraj', CAST(19500.01 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction] ON 
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (1, CAST(315.00 AS Decimal(18, 2)), 1, 2, NULL)
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (2, CAST(-315.00 AS Decimal(18, 2)), 2, 2, NULL)
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (3, CAST(500.00 AS Decimal(18, 2)), 1, 3, NULL)
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (4, CAST(-250.00 AS Decimal(18, 2)), 2, 19, N'Lost this round.')
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (5, CAST(20000.00 AS Decimal(18, 2)), 1, 19, N'won some cash 1')
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (9, CAST(200.00 AS Decimal(18, 2)), 1, 19, NULL)
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (10, CAST(-1500.00 AS Decimal(18, 2)), 2, 19, N'lost cash again.
')
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (11, CAST(-250.00 AS Decimal(18, 2)), 2, 19, N'Lost cash 2')
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (12, CAST(100.00 AS Decimal(18, 2)), 1, 18, N'winning 1')
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (13, CAST(100.00 AS Decimal(18, 2)), 1, 18, N'winning 2')
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (14, CAST(200.00 AS Decimal(18, 2)), 1, 18, N'winning 3')
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (15, CAST(-200.00 AS Decimal(18, 2)), 2, 18, N'lost cash 1.')
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (16, CAST(-10.00 AS Decimal(18, 2)), 2, 18, N'lost cash 2.')
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (17, CAST(1000.00 AS Decimal(18, 2)), 1, 3, N'won a grand')
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (18, CAST(-4500.84 AS Decimal(18, 2)), 2, 3, N'lost it all.')
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (27, CAST(-25427.59 AS Decimal(18, 2)), 2, 14, NULL)
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (28, CAST(1000.00 AS Decimal(18, 2)), 1, 19, N'Won again')
GO
INSERT [dbo].[Transaction] ([TransactionID], [Amount], [TransactionTypeID], [ClientID], [Comment]) VALUES (29, CAST(-20000.00 AS Decimal(18, 2)), 2, 11, NULL)
GO
SET IDENTITY_INSERT [dbo].[Transaction] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionType] ON 
GO
INSERT [dbo].[TransactionType] ([TransactionTypeID], [TransactionTypeName]) VALUES (1, N'Debit')
GO
INSERT [dbo].[TransactionType] ([TransactionTypeID], [TransactionTypeName]) VALUES (2, N'Credit')
GO
SET IDENTITY_INSERT [dbo].[TransactionType] OFF
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Client]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_TransactionType] FOREIGN KEY([TransactionTypeID])
REFERENCES [dbo].[TransactionType] ([TransactionTypeID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_TransactionType]
GO
/****** Object:  StoredProcedure [dbo].[Client_List]    Script Date: 2022/11/21 21:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Author:    Viresh Hemraj
-- Create date: <19 November 2022>
-- Description: Return list of all Clients or client information by ClientID
-- ==========================================================================================
CREATE       PROCEDURE [dbo].[Client_List]( 
@ClientID INT = NULL
)
AS
  BEGIN
    SELECT c.ClientID, c.[Name] AS "Name", c.Surname, c.ClientBalance
	FROM dbo.Client c
	WHERE c.ClientID = ISNULL(@ClientID, c.ClientID)
  END 
GO
/****** Object:  StoredProcedure [dbo].[Transaction_Add]    Script Date: 2022/11/21 21:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:    Viresh Hemraj
-- Create date: <19 November 2022>
-- Description: Add Transaction for a client
-- =============================================

CREATE   PROCEDURE [dbo].[Transaction_Add] ( 
@ClientID INT, 
@Amount DECIMAL (18, 2), 
@TransactionTypeID SMALLINT,
@Comment NVARCHAR (100) = NULL
)
AS
    BEGIN
        BEGIN TRY
            BEGIN TRANSACTION;
            DECLARE @DebitTransactionType INT = 1;

            IF ( @TransactionTypeID = @DebitTransactionType )
                BEGIN
					INSERT INTO dbo.[Transaction] ( Amount, TransactionTypeID, ClientID, Comment )
					VALUES (+@Amount, @TransactionTypeID, @ClientID, @Comment );

                    UPDATE dbo.Client
                    SET ClientBalance = ( ClientBalance + @Amount )
                    WHERE ClientID = @ClientID;
                END;
            ELSE
                BEGIN --CreditTransactionType
					INSERT INTO dbo.[Transaction] ( Amount, TransactionTypeID, ClientID, Comment )
					VALUES ( -@Amount, @TransactionTypeID, @ClientID, @Comment );

                    UPDATE dbo.Client
                    SET ClientBalance = ( ClientBalance - @Amount )
                    WHERE ClientID = @ClientID;
                END;

			COMMIT;
        END TRY
        BEGIN CATCH
            IF @@trancount > 0 
			ROLLBACK;
			RAISERROR('Failed.', 16, 1);
			RETURN 50000;
        END CATCH;
    END;
GO
/****** Object:  StoredProcedure [dbo].[Transaction_List]    Script Date: 2022/11/21 21:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:    Viresh Hemraj
-- Create date: <19 November 2022>
-- Description: Return list of all Transactions for a client
-- =============================================
CREATE       PROCEDURE [dbo].[Transaction_List] (
@ClientID INT =NULL
)
AS
  BEGIN
    SELECT t.TransactionID, t.Amount, t.ClientID, c.[Name], c.Surname, t.Comment, t.TransactionTypeID, tt.TransactionTypeName
	FROM dbo.[Transaction] t
	RIGHT JOIN dbo.Client c ON c.ClientID = t.ClientID
	RIGHT JOIN dbo.TransactionType tt ON tt.TransactionTypeID = t.TransactionTypeID
	WHERE t.ClientID = ISNULL(@ClientID, t.ClientID) 
  END 
GO
/****** Object:  StoredProcedure [dbo].[Transaction_Update]    Script Date: 2022/11/21 21:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:    Viresh Hemraj
-- Create date: <19 November 2022>
-- Description: Add comment for Transaction
-- =============================================

CREATE   PROCEDURE [dbo].[Transaction_Update] ( 
@TransactionID INT, 
@Comment NVARCHAR (100) = NULL
)
AS
BEGIN     
	UPDATE dbo.[Transaction]
	SET Comment = @Comment
	WHERE TransactionID = @TransactionID       
END;
GO
