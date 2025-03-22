CREATE TABLE dbconstant
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    create_at  datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    name       VARCHAR(255)          NOT NULL,
    value      VARCHAR(255)          NULL,
    CONSTRAINT pk_dbconstant PRIMARY KEY (id)
);

ALTER TABLE dbconstant
    ADD CONSTRAINT uc_dbconstant_name UNIQUE (name);

ALTER TABLE booking
    DROP COLUMN booking_status;

ALTER TABLE booking
    ADD booking_status VARCHAR(255) NULL;

ALTER TABLE car
    DROP COLUMN car_type;

ALTER TABLE car
    ADD car_type VARCHAR(255) NULL;