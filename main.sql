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

INSERT INTO planets (name, climat) VALUES ('Earth', 'Tropical');

INSERT INTO cities (name, planet_id) VALUES ('Carara', 1);

INSERT INTO creatures (name, is_venomus, bite_size, planet_id) VALUES
('Lizard', TRUE, 5, 1),
('Vasilisk', TRUE, 2, 1);

INSERT INTO people (name, is_bitten, city_id) VALUES ('Bowman', TRUE, 1);

INSERT INTO incidents (creature_id, bitten_id, bite_size, location) VALUES (1, 1, 10, 'Carara');

INSERT INTO bioservice_db (city_id) VALUES (1);
INSERT INTO library (city_id) VALUES (1);

INSERT INTO bioservice_record (incident_id, is_hospitalized, bioservice_id) VALUES (1, FALSE, 1);
INSERT INTO library_records (incident_id, is_hospitalized, library_id) VALUES (1, FALSE, 1);
