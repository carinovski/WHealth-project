use ldao_db;
drop table if exists events;
drop table if exists institution;
drop table if exists person;
drop table if exists suggestion;
drop table if exists users;

CREATE TABLE users(
    name VARCHAR(30),
    email VARCHAR(100),
    password VARCHAR(30),
    PRIMARY KEY(email)
);

--Users search and suggest
CREATE TABLE suggestion(
    sid int, 
    name VARCHAR(100),
    address VARCHAR(200),
    phone CHAR(10),
    email VARCHAR(100),
    website VARCHAR(100),
    dateadded DATE,
    accomodating int,
    insurance ENUM("yes","no", "na"),
    pricerange VARCHAR(100),
    addedby VARCHAR(100),
    PRIMARY KEY(sid),
    FOREIGN KEY (addedby) REFERENCES users(email)
        on update RESTRICT
        on delete RESTRICT
);

CREATE TABLE person(
    pid int, 
    service VARCHAR(100),
    PRIMARY KEY(pid),
    FOREIGN KEY (pid) REFERENCES suggestion(sid)
        on update RESTRICT
        on delete RESTRICT
);

CREATE TABLE institution(
    tid int, 
    specialization VARCHAR(100),
    type VARCHAR(100),
    PRIMARY KEY(tid),
    FOREIGN KEY (tid) REFERENCES suggestion(sid)
        on update RESTRICT
        on delete RESTRICT
);

CREATE TABLE events(
    eid int, 
    date DATE,
    time CHAR(4),
    PRIMARY KEY(eid),
    FOREIGN KEY (eid) REFERENCES suggestion(sid)
        on update RESTRICT
        on delete RESTRICT
);