-- Задание 2

-- 1.Название и продолжительность самого длинного трека.
SELECT name, duration
FROM Songs
ORDER BY duration DESC
LIMIT 1;

-- 2.Название треков, продолжительность которых не менее 3,5 минут.
SELECT name
FROM Songs
WHERE duration >= 210;

-- 3.Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name
FROM Collections
WHERE release_year BETWEEN 2018 AND 2020;

-- 4.Исполнители, чьё имя состоит из одного слова.
SELECT name
FROM Singers
WHERE name NOT LIKE '% %';

-- 5.Названия треков, в которых есть слово «мой» или «my».
SELECT name 
FROM songs
WHERE name ILIKE 'my %'
OR name ILIKE '% my %'
OR name ILIKE '% my' 
OR name ILIKE 'my'
OR name ILIKE 'мой %'
OR name ILIKE '% мой %'
OR name ILIKE '% мой' 
OR name ILIKE 'мой'; 

-- ЗАДАНИЕ 3

-- 1.Количество исполнителей в каждом жанре.
SELECT g.name, COUNT(gs.singer_id) AS singer_count
FROM genres g
LEFT JOIN genres_singers gs ON g.genre_id = gs.genre_id
GROUP BY g.name;

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(t.song_id) AS song_count
FROM songs t
JOIN albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- 3. Средняя продолжительность треков в каждом альбоме.
SELECT a.name AS album_name, AVG(t.duration) AS avg_duration 
FROM albums a
JOIN songs t ON a.album_id = t.album_id
GROUP BY a.name

-- 4.Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT DISTINCT s.name
FROM singers s
WHERE s.singer_id NOT IN (
    SELECT sa.singer_id
    FROM singers_albums sa
    JOIN albums a ON sa.album_id = a.album_id
    WHERE a.release_year = 2020
);

--5.Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT c.name
FROM collections c
JOIN collections_songs cs ON c.collection_id = cs.collection_id
JOIN songs t ON cs.song_id = t.song_id
JOIN albums a ON t.album_id = a.album_id
JOIN singers_albums sa ON a.album_id = sa.album_id
JOIN singers s ON sa.singer_id = s.singer_id
WHERE s.name = 'Ed Sheeran';

-- Задание 4
-- 1. Названия альбомов, в которых представлены исполнители более чем одного жанра.
SELECT DISTINCT a.name
FROM albums a
JOIN singers_albums sa ON a.album_id = sa.album_id
JOIN (
    SELECT singer_id
    FROM genres_singers
    GROUP BY singer_id
    HAVING COUNT(genre_id) > 1
) AS universal_singers ON sa.singer_id = universal_singers.singer_id;

-- 2. Названия треков, которые не входят в сборники.
SELECT t.name
FROM songs t
LEFT JOIN collections_songs cs ON t.song_id = cs.song_id
WHERE cs.song_id IS NULL;


-- 3. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT s.name
FROM singers s
JOIN singers_albums sa ON s.singer_id = sa.singer_id
JOIN songs t ON sa.album_id = t.album_id
WHERE t.duration = (SELECT MIN(duration) FROM Songs);

--4.Названия альбомов с наименьшим количеством треков.
SELECT a.name 
FROM albums a JOIN songs t ON a.album_id = t.album_id
GROUP BY a.album_id
HAVING COUNT(t.song_id) = (
    SELECT COUNT(song_id) FROM songs 
    GROUP BY album_id 
    ORDER BY 1 
    LIMIT 1 
);
