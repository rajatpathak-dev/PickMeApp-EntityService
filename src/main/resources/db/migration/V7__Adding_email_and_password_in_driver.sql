ALTER TABLE driver
    ADD email VARCHAR(255) NULL;

ALTER TABLE driver
    ADD password VARCHAR(255) NULL;

ALTER TABLE driver
    MODIFY email VARCHAR (255) NOT NULL;

ALTER TABLE driver
    MODIFY password VARCHAR (255) NOT NULL;

