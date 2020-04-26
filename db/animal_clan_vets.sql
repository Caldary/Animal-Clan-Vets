DROP TABLE animals;
DROP TABLE vets;

CREATE TABLE vets(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    qualifications VARCHAR(255),
    registered_animals INT 
);

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth VARCHAR(255),
    animal_type VARCHAR(255),
    owner_name VARCHAR(255),
    notes VARCHAR(255)
);