-- Создаём таблицу Genre
CREATE TABLE IF NOT EXISTS Genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(80) NOT NULL
);

-- Создаём таблицу Singers
CREATE TABLE IF NOT EXISTS Singers (
	singer_id SERIAL PRIMARY KEY,
	singer_name VARCHAR(40) NOT NULL,
	singer_surname VARCHAR(80) NOT NULL,
	pseudonym VARCHAR(80) NULL
);

-- Создаём таблицу GenreSingers
CREATE TABLE IF NOT EXISTS GenreSingers (
	genre_id INTEGER REFERENCES Genre(genre_id),
	singer_id INTEGER REFERENCES Singers(singer_id),
	CONSTRAINT pk PRIMARY KEY (genre_id, singer_id)
);

-- Создаём таблицу Albums
CREATE TABLE IF NOT EXISTS Albums(
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(128) NOT NULL,
	release_date DATE NOT NULL
);

-- Создаём таблицу SingersAlbums
CREATE TABLE IF NOT EXISTS SingersAlbums(
	singer_id INTEGER REFERENCES Singers(singer_id),
	album_id INTEGER REFERENCES Albums(album_id),
	CONSTRAINT pk1 PRIMARY KEY (singer_id, album_id)
);

-- Создаём таблицу Songs
CREATE TABLE IF NOT EXISTS Songs(
	song_id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES Albums(album_id),
	song_name VARCHAR(128) NOT NULL,
	song_length TIME NOT NULL
);

-- Создаём таблицу Collection
CREATE TABLE IF NOT EXISTS Collection(
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(128) NOT NULL,
	release_date DATE NOT NULL
);

-- Создаём таблицу CollectionSongs
CREATE TABLE IF NOT EXISTS CollectionSongs(
	collection_id INTEGER REFERENCES Collection(collection_id),
	song_id INTEGER REFERENCES Songs(song_id),
	CONSTRAINT pk2 PRIMARY KEY (collection_id, song_id)
);