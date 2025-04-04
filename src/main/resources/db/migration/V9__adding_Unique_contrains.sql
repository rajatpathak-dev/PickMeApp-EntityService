ALTER TABLE driver
    ADD CONSTRAINT uc_driver_email UNIQUE (email);

ALTER TABLE driver
    ADD CONSTRAINT uc_driver_phone_no UNIQUE (phone_no);

ALTER TABLE passenger
    ADD CONSTRAINT uc_passenger_email UNIQUE (email);

ALTER TABLE passenger
    ADD CONSTRAINT uc_passenger_phone_no UNIQUE (phone_no);

