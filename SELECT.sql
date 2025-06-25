# Задание 2

# 1. Название и продолжительность самого длинного трека.
SELECT name, duration
FROM Songs
ORDER BY duration DESC
LIMIT 1;

# 2. Название треков, продолжительность которых не менее 3,5 минут.
SELECT name
FROM Songs
WHERE duration >= 210;

# 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name 
FROM Collections
WHERE release_year BETWEEN 2018 AND 2020;

# 4. Исполнители, чьё имя состоит из одного слова.

SELECT name
FROM Singers
WHERE name NOT LIKE '% %';

# 5. Названия треков, в которых есть слово «мой» или «my».
SELECT name
FROM Songs
WHERE name LIKE '%мой%' OR name LIKE '%my%' OR name LIKE '%Mой%' OR name LIKE '%My%';


# ЗАДАНИЕ 3

# 1. Количество исполнителей в каждом жанре.
SELECT g.name, COUNT(gs.singer_id) AS singer_count
FROM Genres g
LEFT JOIN GenresSingers gs ON g.genre_id = gs.genre_id
GROUP BY g.name;

# 2. Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(t.song_id) AS song_count
FROM Songs t
JOIN Albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

# 3.Средняя продолжительность треков в каждом альбоме.
SELECT a.name AS album_name, AVG(t.duration) AS avg_duration 
FROM Albums a
JOIN Songs t ON a.album_id = t.album_id
GROUP BY a.name

# 4.Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT DISTINCT s.name
FROM Singers s
WHERE s.singer_id NOT IN (
    SELECT sa.singer_id
    FROM SingersAlbums sa
    JOIN Albums a ON sa.album_id = a.album_id
    WHERE a.release_year = 2020
);
# 5.Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT c.name
FROM Collections c
JOIN CollectionsSongs cs ON c.collection_id = cs.collection_id
JOIN Songs t ON cs.song_id = t.song_id
JOIN Albums a ON t.album_id = a.album_id
JOIN SingersAlbums sa ON a.album_id = sa.album_id
JOIN Singers s ON sa.singer_id = s.singer_id
WHERE s.name = 'Ed Sheeran';


Задание 4

# 1. Названия альбомов, в которых представлены исполнители более чем одного жанра.
SELECT DISTINCT a.name
FROM Albums a
JOIN SingersAlbums sa ON a.album_id = sa.album_id
JOIN (
    SELECT singer_id
    FROM GenresSingers
    GROUP BY singer_id
    HAVING COUNT(genre_id) > 1
) AS universal_singers ON sa.singer_id = universal_singers.singer_id;

# 2. Названия треков, которые не входят в сборники.
SELECT s.name
FROM Songs t
LEFT JOIN CollectionsSongs cs ON t.song_id = cs.song_id
WHERE cs.song_id IS NULL;

# 3. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT s.name
FROM Singers s
JOIN SingersAlbums sa ON s.singer_id = sa.singer_id
JOIN Songs t ON sa.album_id = t.album_id
WHERE t.duration = (SELECT MIN(duration) FROM Songs);

#4.Названия альбомов с наименьшим количеством треков.
SELECT a.name, COUNT(t.song_id) AS song_count
FROM Albums a
LEFT JOIN Songs t ON a.album_id = t.album_id
GROUP BY a.name
ORDER BY song_count ASC
LIMIT 1;
