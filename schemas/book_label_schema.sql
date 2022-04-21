CREATE TABLE Book (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
  genre_id int,
  author_id int,
  source_id int,
  label_id int REFERENCES Label (id),
  publish_date date,
  archived boolean,
  publisher varchar(50),
  cover_state varchar(10)
);

CREATE TABLE Label (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
  title varchar(50)
  color varchar(10)
  items integer[]
);

