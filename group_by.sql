-- 1. Find a count of how many tracks there are per genre. Display the genre name with the count.

SELECT COUNT (*), g.name
FROM track tr
JOIN genre g ON tr.genre_id = g.genre_id
GROUP BY g.name;

-- 2. Find a count of how many tracks are the `"Pop"` genre and how many tracks are the `"Rock"` genre.

SELECT COUNT(*), g.name
FROM track tr
JOIN genre g ON tr.genre_id = g.genre_id
WHERE g.name = 'Pop' OR g.name = 'Rock'
GROUP BY g.name;

-- 3. Find a list of all artists and how many albums they have.

SELECT art.name, COUNT(*)
FROM album alb
JOIN artist art ON art.artist_id = alb.artist_id
GROUP BY art.name;
