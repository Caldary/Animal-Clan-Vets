DROP TABLE animals;
DROP TABLE vets;

CREATE TABLE vets(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    qualifications VARCHAR(255)
);

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth VARCHAR(255),
    type VARCHAR(255),
    owner_name VARCHAR(255),
    notes VARCHAR(255),
    vet_id INT REFERENCES vets(id)
);