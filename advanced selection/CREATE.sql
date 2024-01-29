/* Создаём таблицу genre */
CREATE TABLE IF NOT EXISTS genre (
	PRIMARY KEY (genre_id),
	genre_id   SERIAL,
	genre_name VARCHAR(80) UNIQUE NOT NULL
);

/* Создаём таблицу singers */
CREATE TABLE IF NOT EXISTS singers (
	PRIMARY KEY(singer_id),
	singer_id      SERIAL,
	singer_name    VARCHAR(40) NOT NULL,
	singer_surname VARCHAR(80) NOT NULL,
	pseudonym      VARCHAR(40) 
);

/* Создаём таблицу genresingers */
CREATE TABLE IF NOT EXISTS genresingers (
	genre_id  INTEGER REFERENCES genre(genre_id),
	singer_id INTEGER REFERENCES singers(singer_id),
			  CONSTRAINT pk PRIMARY KEY (genre_id, singer_id)
);

/* Создаём таблицу albums */
CREATE TABLE IF NOT EXISTS albums(
	PRIMARY KEY(album_id),
	album_id     SERIAL,
	album_name   VARCHAR(128) NOT NULL,
	release_date DATE         NOT NULL, 
	             CHECK (release_date > '1900-01-01') 
);

/* Создаём таблицу singersalbums */
CREATE TABLE IF NOT EXISTS singersalbums(
	singer_id INTEGER REFERENCES singers(singer_id),
	album_id  INTEGER REFERENCES albums(album_id),
			  CONSTRAINT pk1 PRIMARY KEY (singer_id, album_id)
);

/* Создаём таблицу songs */
CREATE TABLE IF NOT EXISTS songs(
	PRIMARY KEY(song_id),
	song_id     SERIAL,
	album_id    INTEGER      NOT NULL REFERENCES albums(album_id),
	song_name   VARCHAR(128) NOT NULL,
	song_length INTEGER      NOT NULL,
			    CHECK(song_length BETWEEN 1 AND 500400)
);

/* Создаём таблицу collection */
CREATE TABLE IF NOT EXISTS collection(
	PRIMARY KEY(collection_id),
	collection_id   SERIAL,
	collection_name VARCHAR(128) NOT NULL,
	release_date    DATE         NOT NULL,
	                CHECK (release_date > '1900-01-01')
);

/* Создаём таблицу collectionsongs */
CREATE TABLE IF NOT EXISTS collectionsongs(
	collection_id INTEGER REFERENCES collection(collection_id),
	song_id       INTEGER REFERENCES songs(song_id),
				  CONSTRAINT pk2 PRIMARY KEY (collection_id, song_id)
);