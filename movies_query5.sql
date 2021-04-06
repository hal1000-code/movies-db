use movies;
SELECT distinct FirstName, Actors.LastName, Movies.CountryCode
FROM Actors LEFT JOIN 
Movies
ON Actors.CountryCode = Movies.CountryCode;