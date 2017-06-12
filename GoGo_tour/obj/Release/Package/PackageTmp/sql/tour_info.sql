CREATE TABLE tour_info
(
	[id] INT NOT NULL PRIMARY KEY, 
    [name] VARCHAR(10) NOT NULL, 
    [introduce] VARCHAR(30) NOT NULL, 
    [addr] VARCHAR(30) NOT NULL, 
    [rank] FLOAT NOT NULL, 
    [newPrice] INT NOT NULL, 
    [oldPrice] INT NOT NULL, 
    [msg] TEXT NOT NULL
)
