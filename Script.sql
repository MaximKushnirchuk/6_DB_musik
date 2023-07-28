CREATE TABLE IF NOT EXISTS genries (
    id SERIAL PRIMARY KEY, 
    genre_name VARCHAR(40) UNIQUE NOT NULL
    );


CREATE table IF NOT EXISTS singers (
    id SERIAL PRIMARY KEY, 
    allias VARCHAR(40) UNIQUE NOT NULL
    );


CREATE TABLE IF NOT EXISTS singer_genre (
    id_genre INTEGER NOT NULL REFERENCES genries (id), 
    id_singer INTEGER NOT NULL REFERENCES singers (id),
    CONSTRAINT pk PRIMARY KEY (id_genre, id_singer)
    );


CREATE TABLE IF NOT EXISTS album (
    id SERIAL PRIMARY KEY, 
    album_name VARCHAR(40) UNIQUE NOT NULL,
    year_of_created SMALLINT NOT NULL
    );


CREATE TABLE IF NOT EXISTS singer_album (
    id_singer INTEGER NOT NULL REFERENCES singers (id), 
    id_album INTEGER NOT NULL REFERENCES album (id),
    CONSTRAINT pkk PRIMARY KEY (id_singer, id_album)
    );


CREATE TABLE IF NOT EXISTS tracks (
    id SERIAL PRIMARY KEY, 
    track_name VARCHAR(40) UNIQUE NOT NULL,
    long SMALLINT NOT NULL,
    album_name INTEGER NOT NULL REFERENCES album (id)
    );


CREATE TABLE IF NOT EXISTS collections (
    id SERIAL PRIMARY KEY, 
    collection_name VARCHAR(40) UNIQUE NOT NULL,
    year_of_created SMALLINT NOT NULL
    );


CREATE TABLE IF NOT EXISTS collections_tracks (
    id_track INTEGER NOT NULL REFERENCES tracks (id), 
    id_collection INTEGER NOT NULL REFERENCES collections (id),
    CONSTRAINT pkkk PRIMARY KEY (id_track, id_collection)
    );
