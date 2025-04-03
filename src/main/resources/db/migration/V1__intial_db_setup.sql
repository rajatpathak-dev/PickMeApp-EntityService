CREATE TABLE booking
(
    id             BIGINT AUTO_INCREMENT NOT NULL,
    create_at      datetime NOT NULL,
    updated_at     datetime NOT NULL,
    booking_status ENUM('SCHEDULED', 'CANCEL', 'ASSIGNING_DRIVER',
        'CAB_REACHED', 'IN_RIDE', 'COMPLETED') NULL,
    start          datetime NULL,
    end            datetime NULL,
    distance       BIGINT NULL,
    driver_id      BIGINT NULL,
    passenger_id   BIGINT NULL,
    CONSTRAINT pk_booking PRIMARY KEY (id)
);

CREATE TABLE booking_reviews
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    create_at  datetime NOT NULL,
    updated_at datetime NOT NULL,
    content    VARCHAR(255) NULL,
    rating DOUBLE NOT NULL,
    booking_id BIGINT   NOT NULL,
    CONSTRAINT pk_booking_reviews PRIMARY KEY (id)
);

CREATE TABLE driver
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    create_at  datetime     NOT NULL,
    updated_at datetime     NOT NULL,
    name       VARCHAR(255) NULL,
    phone_no   VARCHAR(255) NULL,
    license_no VARCHAR(255) NOT NULL,
    CONSTRAINT pk_driver PRIMARY KEY (id)
);

CREATE TABLE passenger
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    create_at  datetime     NOT NULL,
    updated_at datetime     NOT NULL,
    name       VARCHAR(255) NOT NULL,
    email      VARCHAR(255) NOT NULL,
    phone_no   VARCHAR(255) NOT NULL,
    password   VARCHAR(255) NOT NULL,
    CONSTRAINT pk_passenger PRIMARY KEY (id)
);

CREATE TABLE passenger_review
(
    id                       BIGINT NOT NULL,
    passenger_review_content VARCHAR(255) NULL,
    passenger_rating DOUBLE NOT NULL,
    CONSTRAINT pk_passengerreview PRIMARY KEY (id)
);

ALTER TABLE booking_reviews
    ADD CONSTRAINT uc_booking_reviews_booking UNIQUE (booking_id);

ALTER TABLE driver
    ADD CONSTRAINT uc_driver_license_no UNIQUE (license_no);

ALTER TABLE booking
    ADD CONSTRAINT FK_BOOKING_ON_DRIVER FOREIGN KEY (driver_id) REFERENCES driver (id);

ALTER TABLE booking
    ADD CONSTRAINT FK_BOOKING_ON_PASSENGER FOREIGN KEY (passenger_id) REFERENCES passenger (id);

ALTER TABLE booking_reviews
    ADD CONSTRAINT FK_BOOKING_REVIEWS_ON_BOOKING FOREIGN KEY (booking_id) REFERENCES booking (id);

ALTER TABLE passenger_review
    ADD CONSTRAINT FK_PASSENGERREVIEW_ON_ID FOREIGN KEY (id) REFERENCES booking_reviews (id);