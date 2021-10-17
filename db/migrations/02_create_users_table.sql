CREATE TABLE users (
  id SERIAL PRIMARY KEY, 
  email VARCHAR(60) UNIQUE, 
  password VARCHAR(60), 
  name VARCHAR(60), 
  username VARCHAR(20) UNIQUE
  );