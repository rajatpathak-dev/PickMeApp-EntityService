ALTER TABLE exact_location
DROP
FOREIGN KEY FK_EXACTLOCATION_ON_EXACT_LOCATION;

CREATE TABLE named_location
(
    id                BIGINT AUTO_INCREMENT NOT NULL,
    create_at         datetime NOT NULL,
    updated_at        datetime NOT NULL,
    exact_location_id BIGINT NULL,
    name              VARCHAR(255) NULL,
    zip_code          VARCHAR(255) NULL,
    city              VARCHAR(255) NULL,
    country           VARCHAR(255) NULL,
    state             VARCHAR(255) NULL,
    CONSTRAINT pk_namedlocation PRIMARY KEY (id)
);

ALTER TABLE named_location
    ADD CONSTRAINT FK_NAMEDLOCATION_ON_EXACT_LOCATION FOREIGN KEY (exact_location_id) REFERENCES exact_location (id);

ALTER TABLE exact_location
DROP
COLUMN city;

ALTER TABLE exact_location
DROP
COLUMN country;

ALTER TABLE exact_location
DROP
COLUMN dtype;

ALTER TABLE exact_location
DROP
COLUMN exact_location_id;

ALTER TABLE exact_location
DROP
COLUMN name;

ALTER TABLE exact_location
DROP
COLUMN state;

ALTER TABLE exact_location
DROP
COLUMN zip_code;

