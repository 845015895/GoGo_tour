CREATE TABLE [dbo].[tour_user] (
    [userName] VARCHAR (50) NOT NULL,
    [password] VARCHAR (50) NULL,
    [viewName] VARCHAR (50) NULL,
    CONSTRAINT [PK_tour_user] PRIMARY KEY CLUSTERED ([userName] ASC)
);