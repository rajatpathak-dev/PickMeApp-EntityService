CREATE TABLE exact_location
(
    id                BIGINT AUTO_INCREMENT NOT NULL,
    dtype             VARCHAR(31) NULL,
    create_at         datetime NOT NULL,
    updated_at        datetime NOT NULL,
    latitude DOUBLE NULL,
    longitude DOUBLE NULL,
    exact_location_id BIGINT NULL,
    name              VARCHAR(255) NULL,
    zip_code          VARCHAR(255) NULL,
    city              VARCHAR(255) NULL,
    country           VARCHAR(255) NULL,
    state             VARCHAR(255) NULL,
    CONSTRAINT pk_exactlocation PRIMARY KEY (id)
);

CREATE TABLE otp
(
    id             BIGINT AUTO_INCREMENT NOT NULL,
    create_at      datetime NOT NULL,
    updated_at     datetime NOT NULL,
    code           VARCHAR(255) NULL,
    sent_to_number VARCHAR(255) NULL,
    CONSTRAINT pk_otp PRIMARY KEY (id)
);

ALTER TABLE driver
    ADD active_city VARCHAR(255) NULL;

ALTER TABLE driver
    ADD driver_approval_status enum('APPROVED',
    'DENIED',
    'PENDING');

ALTER TABLE driver
    ADD home_id BIGINT NULL;

ALTER TABLE driver
    ADD last_known_location_id BIGINT NULL;

ALTER TABLE driver
    ADD rating DOUBLE NULL;

ALTER TABLE driver
    MODIFY rating DOUBLE NOT NULL;

ALTER TABLE driver
    ADD CONSTRAINT FK_DRIVER_ON_HOME FOREIGN KEY (home_id) REFERENCES exact_location (id);

ALTER TABLE driver
    ADD CONSTRAINT FK_DRIVER_ON_LAST_KNOWN_LOCATION FOREIGN KEY (last_known_location_id) REFERENCES exact_location (id);

ALTER TABLE exact_location
    ADD CONSTRAINT FK_EXACTLOCATION_ON_EXACT_LOCATION FOREIGN KEY (exact_location_id) REFERENCES exact_location (id);

ALTER TABLE driver
    ADD CONSTRAINT check_rating CHECK ( driver.rating >= 0 AND driver.rating <=5);

