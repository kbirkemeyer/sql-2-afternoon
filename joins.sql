-- 1. Get all invoices where the `unit_price` on the `invoice_line` is greater than $0.99.

SELECT * FROM invoice inv
JOIN invoice_line invl ON inv.invoice_id = invl.invoice_id 
WHERE invl.unit_price > 0.99;

-- 2. Get the `invoice_date`, customer `first_name` and `last_name`, and `total` from all invoices.

SELECT inv.invoice_date, cus.first_name, cus.last_name, inv.total FROM invoice inv
JOIN customer cus ON inv.customer_id = cus.customer_id;

-- 3. Get the customer `first_name` and `last_name` and the support rep's `first_name` and `last_name` from all customers. 

SELECT c.first_name, c.last_name, e.first_name, e.last_name FROM customer c
JOIN employee e ON c.support_rep_id = e.employee_id;

-- 4. Get the album `title` and the artist `name` from all albums.

SELECT alb.title, art.name from album alb
JOIN artist art ON alb.artist_id = art.artist_id;

-- 5. Get all playlist_track track_ids where the playlist `name` is Music.

SELECT pt.track_id FROM playlist_track pt
JOIN playlist pl ON pl.playlist_id = pt.playlist_id
WHERE pl.name = 'Music';

-- 6. Get all track `name`s for `playlist_id` 5.

SELECT t.name from track t
JOIN playlist_track pt ON pt.track_id = t.track_id 
WHERE pt.playlist_id = 5;

-- 7. Get all track `name`s and the playlist `name` that they're on ( 2 joins ).

SELECT tr.name, pl.name FROM track tr
JOIN playlist_track pt ON tr.track_id = pt.track_id
JOIN playlist pl ON pt.playlist_id = pl.playlist_id;

-- 8. Get all track `name`s and album `title`s that are the genre `Alternative & Punk` ( 2 joins ).

SELECT tr.name, al.title FROM track tr
JOIN album al ON tr.album_id = al.album_id
JOIN genre g ON tr.genre_id = g.genre_id
WHERE g.name = 'Alternative & Punk';
