DROP TABLE IF EXISTS users;

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  user_name text NOT NULL,
  email text NOT NULL UNIQUE,
  password_digest text NOT NULL
);
