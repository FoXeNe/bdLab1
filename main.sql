CREATE TABLE planets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    climat VARCHAR(50)
);

CREATE TABLE creatures (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    is_venomus BOOLEAN,
    bite_size INTEGER,
    planet_id INTEGER REFERENCES planets(id)
);

CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    planet_id INTEGER REFERENCES planets(id)
);

CREATE TABLE people (
    people_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    is_bitten BOOLEAN DEFAULT FALSE,
    city_id INTEGER REFERENCES cities(id)
);

CREATE TABLE incidents (
    incident_id SERIAL PRIMARY KEY,
    creature_id INTEGER REFERENCES creatures(id),
    bitten_id INTEGER REFERENCES people(people_id),
    bite_size INTEGER,
    location VARCHAR(50)
);

CREATE TABLE bioservice_db (
    id SERIAL PRIMARY KEY,
    city_id INTEGER REFERENCES cities(id)
);

CREATE TABLE bioservice_record (
    record_id SERIAL PRIMARY KEY,
    incident_id INTEGER REFERENCES incidents(incident_id),
    is_hospitalized BOOLEAN,
    bioservice_id INTEGER REFERENCES bioservice_db(id)
);

CREATE TABLE library (
    id SERIAL PRIMARY KEY,
    city_id INTEGER REFERENCES cities(id)
);

CREATE TABLE library_records (
    record_id SERIAL PRIMARY KEY,
    incident_id INTEGER REFERENCES incidents(incident_id),
    is_hospitalized BOOLEAN,
    library_id INTEGER REFERENCES library(id)
);
