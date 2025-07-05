INSERT INTO genres (name) VALUES
('Pop'),
('R&B'),
('Folk'),
('Electropop');

INSERT INTO singers (name) VALUES
('Ed Sheeran'),
('Shawn Mendes'),
('Dua Lipa'),
('Khalid'),
('Singer X'),
('The Band');

INSERT INTO albums (name, release_year) VALUES
('Divide', 2016),
('Wonder', 2017),
('Future Nostalgia', 2018),
('Free Spirit', 2019),
('Mix', 2025),
('Only good music', 2020);

INSERT INTO songs (album_id, name, duration) VALUES
(1, 'Shape of You', 234),
(1, 'Castle on the Hill', 261),
(2, 'Wonder MYSELF', 168),
(2, 'MyMonster', 178),
(3, 'Don''t Start Now', 183),
(3, 'Physicalmy', 194),
(4, 'Talk', 198),
(4, 'Better МОЙ', 210),
(5, 'Beautiful People', 198),
(5, 'my', 201),
(5, 'oh my god', 200),
(6, 'own my', 202),
(6, 'my own', 203),
(6, 'myself', 204),
(6, 'bemy self', 205),
(6, 'myself by', 206),
(6, 'by myself by', 207),
(6, 'beemy', 208),
(6, 'premyne', 209),
(5, 'Мой', 127),
(5, 'oh мой god', 164),
(5, 'Мой день', 168),
(5, 'МОЙ', 179),
(5, 'Будьмой', 197),
(5, 'Мойпосуду', 206),
(5, 'Посудомойка', 222);

INSERT INTO collections (name, release_year) VALUES
('Collection Winter', 2017),
('Collection Spring', 2018),
('Collection Summer', 2021),
('Collection Autumn', 2020);

INSERT INTO genres_singers (genre_id, singer_id) VALUES
(1, 1),
(3, 1),
(1, 2),
(1, 3),
(4, 3),
(2, 4),
(1, 4),
(4, 5),
(2, 6);

INSERT INTO singers_albums (singer_id, album_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(1, 5),
(4, 5);


INSERT INTO collections_songs (collection_id, song_id) VALUES
(1, 5),
(1, 2),
(2, 2),
(2, 3),
(3, 5),
(3, 1),
(4, 6),
(4, 7);