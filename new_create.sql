CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE singers (
    singer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL CHECK (
        release_year >= 1000 AND release_year <= 9999
    )
);

CREATE TABLE collections (
    collection_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL CHECK (
        release_year >= 1000 AND release_year <= 9999
    )
);

CREATE TABLE songs (
    song_id SERIAL PRIMARY KEY,
    album_id INTEGER NOT NULL REFERENCES albums(album_id),
    name VARCHAR(100) NOT NULL,
    duration INTEGER NOT NULL CHECK (duration <= 300)
);

CREATE TABLE genres_singers (
    genre_id INTEGER REFERENCES genres(genre_id),
    singer_id INTEGER REFERENCES singers(singer_id),
    CONSTRAINT pk_genre_singer PRIMARY KEY (genre_id, singer_id)
);

CREATE TABLE singers_albums (
    singer_id INTEGER REFERENCES singers(singer_id),
    album_id INTEGER REFERENCES albums(album_id),
    CONSTRAINT pk_singer_album PRIMARY KEY (singer_id, album_id)
);

CREATE TABLE collections_songs (
    collection_id INTEGER REFERENCES collections(collection_id),
    song_id INTEGER REFERENCES songs(song_id),
    CONSTRAINT pk_collection_song PRIMARY KEY (collection_id, song_id)
);