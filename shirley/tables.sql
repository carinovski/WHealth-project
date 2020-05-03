use whealth_db;
/* 
drop table if exists events;
drop table if exists institution;
drop table if exists person; */
drop table if exists credit;
drop table if exists suggestion;
drop table if exists users;
 
CREATE TABLE users( 
    email VARCHAR(30) PRIMARY KEY,
    name VARCHAR(30),
    password VARCHAR(30)
);
 
--Users search and suggest
CREATE TABLE suggestion(
    name VARCHAR(30),
    type set("Person", "Institution", "Event"),
    specialization VARCHAR(30), 
    address VARCHAR(30),
    phone CHAR(10),
    email VARCHAR(30),
    date DATE,
    time CHAR(4),
    accomodating set('yes', 'no', 'depends'),
    insurance set("yes","no", "N/A"),
    addedby VARCHAR(30),
    PRIMARY KEY (name, address),
    FOREIGN KEY (addedby) REFERENCES users(email)
        on update RESTRICT
        on delete RESTRICT
);
 
CREATE TABLE credit(
    suggestor VARCHAR(30),
    name VARCHAR(30),
    address VARCHAR(30),
    PRIMARY KEY (suggestor, name, address),
    FOREIGN KEY (suggestor) REFERENCES users(email),
    FOREIGN KEY (name, address) REFERENCES suggestion(name, address)
)