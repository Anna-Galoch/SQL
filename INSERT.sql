INSERT INTO Genres (genre_id, name) VALUES
(1, 'Pop'),
(2, 'R&B'),
(2, 'Folk'),
(2, 'Electropop');

INSERT INTO Singers (name) VALUES
('Ed Sheeran'),
('Shawn Mendes'),
('Dua Lipa'),
('Khalid');

INSERT INTO Albums (name, release_year) VALUES
('Divide', 2016),
('Wonder', 2017),
('Future Nostalgia', 2018),
('Free Spirit', 2019);

INSERT INTO Songs (album_id, name, duration) VALUES
(1, 'Shape of You', 234),
(1, 'Castle on the Hill', 261),
(2, 'Wonder', 168),
(2, 'My Monster', 178),
(3, 'Dont Start Now', 183),
(3, 'Physical', 194),
(4, 'Talk', 198),
(4, 'Better', 210);

INSERT INTO Collections (name, release_year) VALUES
('Collection Winter', 2019),
('Collection Spring', 2020),
('Collection Summer', 2021),
('Collection Autumn', 2022);

INSERT INTO GenresSingers (genre_id, singer_id) VALUES
(1, 1),
(3, 1),
(1, 2),
(1, 3),
(4, 3),
(2, 4),
(1, 4);

INSERT INTO SingersAlbums (singer_id, album_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO CollectionsSongs (collection_id, song_id) VALUES
(1, 5),
(1, 2),
(2, 2),
(2, 3),
(3, 5),
(3, 1),
(4, 6),
(4, 7);

INSERT INTO Albums (name, release_year) VALUES
('Mix', 2025);

INSERT INTO Songs (album_id, name, duration) VALUES
(5, 'Beautiful People', 198);

INSERT INTO SingersAlbums (singer_id, album_id) VALUES
(1, 5),
(4, 5);
