use movies;
SELECT Actors.LastName, Actors.FirstName, Movies.MovieName, Movies.ReleaseDate
FROM Movies INNER JOIN (Actors INNER JOIN Movie_Actor ON Actors.Actor_ID = Movie_Actor.Actor_ID) ON Movies.Movie_ID = Movie_Actor.Movie_ID
WHERE (((Movies.ReleaseDate)>='1950-01-01'))
ORDER BY Actors.LastName;
