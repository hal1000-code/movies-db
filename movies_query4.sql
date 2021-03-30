use movies;
SELECT Actors.FirstName, Actors.LastName, Country.CountryName
FROM Country INNER JOIN Actors ON Country.CountryCode = Actors.CountryCode
WHERE (Country.CountryName)="Great Britain";