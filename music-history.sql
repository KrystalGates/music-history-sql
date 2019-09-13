--Query all of the entries in the Genre table
SELECT "label"
FROM Genre;

-- Query song table for title and songlength
SELECT "Title", "SongLength"
FROM Song;

--Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistId, ArtistName, YearEstablished)
Values (null, "Joe Lizzo", 2019);

--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES (null, "SQL Burning", "08/13/19", 2435, "NSS", 28, 13); 

UPDATE Album
SET ReleaseDate = "08/13/2019"
WHERE AlbumId = 23;

DELETE
FROM Album
WHERE AlbumId = 24;

--Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (null, "That Python", 543, "08/15/2019", 13, 28, 23); 

INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (null, "Steve", 543, "10/18/2019", 13, 28, 23); 

INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (null, "Hit ya with the dad jokes", 543, "12/25/2019", 13, 28, 23); 


--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

SELECT s.Title, a.Title, aa.ArtistName
From Song s
LEFT JOIN Album a
ON s.AlbumId = a.AlbumId
LEFT JOIN Artist aa
ON s.ArtistId = aa.ArtistId 
WHERE s.ArtistId = 28;

SELECT a.Title, s.Title 
FROM Album a 
LEFT JOIN Song s 
ON s.AlbumId = a.AlbumId;

SELECT a.Title, s.Title 
FROM Song s 
LEFT JOIN Album a 
ON s.AlbumId = a.AlbumId;

--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(AlbumId), AlbumId
FROM Song
GROUP BY AlbumId;

--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(ArtistId), ArtistId
FROM Song
GROUP BY ArtistId;

--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(GenreId), GenreId
FROM Song 
GROUP BY GenreId;

--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT MAX(AlbumLength) 
AS LongestDuration, Title
FROM Album;

--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT MAX(SongLength)
AS LongestDuration, Title
FROM Song;

--Modify the previous query to also display the title of the album.
SELECT MAX(SongLength)
AS LongestDuration, a.Title
FROM Song s
JOIN Album a
ON s.AlbumId = a.AlbumId;