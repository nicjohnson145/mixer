BEGIN;

CREATE TABLE usr (
    username TEXT PRIMARY KEY,
    password TEXT NOT NULL
);

CREATE TABLE usr_setting (
    username TEXT NOT NULL,
    key TEXT NOT NULL,
    value TEXT NOT NULL,
    PRIMARY KEY(username, key)
);

CREATE TABLE drink (
    id SERIAL,
    name TEXT NOT NULL,
    username TEXT NOT NULL,
    primary_alcohol TEXT NOT NULL,
    preferred_glass TEXT,
    ingredients TEXT NOT NULL,
    instructions TEXT,
    notes TEXT,
    publicity INTEGER NOT NULL,
    under_development BOOLEAN NOT NULL,
    tags TEXT,
    favorite BOOLEAN NOT NULL,
    UNIQUE(name, username),
    FOREIGN KEY (username) REFERENCES usr(username) ON DELETE CASCADE ON UPDATE CASCADE
);

COMMIT;
