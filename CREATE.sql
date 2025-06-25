CREATE TABLE IF NOT EXISTS Genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Singers (
    singer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
    album_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL CHECK (
        release_year >= 1000 AND release_year <= 9999
    )
);

CREATE TABLE IF NOT EXISTS Collections (
    collection_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL CHECK (
        release_year >= 1000 AND release_year <= 9999
    )
);

CREATE TABLE IF NOT EXISTS Songs (
    song_id SERIAL PRIMARY KEY,
    album_id INTEGER NOT NULL REFERENCES Albums(album_id),
    name VARCHAR(100) NOT NULL,
duration INTEGER NOT NULL CHECK (
    duration <= 300
)
);

CREATE TABLE IF NOT EXISTS GenresSingers (
    genre_id INTEGER REFERENCES Genres(genre_id),
    singer_id INTEGER REFERENCES Singers(singer_id),
    CONSTRAINT pk_genre_singer PRIMARY KEY (genre_id, singer_id)
);

CREATE TABLE IF NOT EXISTS SingersAlbums (
    singer_id INTEGER REFERENCES Singers(singer_id),
    album_id INTEGER REFERENCES Albums(album_id),
    CONSTRAINT pk_singer_album PRIMARY KEY (singer_id, album_id)
);

CREATE TABLE IF NOT EXISTS CollectionsSongs (
    collection_id INTEGER REFERENCES Collections(collection_id),
    song_id INTEGER REFERENCES Songs(song_id),
    CONSTRAINT pk_collection_song PRIMARY KEY (collection_id, song_id)
);