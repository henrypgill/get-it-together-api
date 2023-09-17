
DROP TABLE IF EXISTS event_dates;
DROP TABLE IF EXISTS event_users;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS auth_ids;
DROP TABLE IF EXISTS auth_providers;
DROP TABLE IF EXISTS users;


-- non-dependent tables
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	display_name VARCHAR(255) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE events (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	owner_id SERIAL REFERENCES users(id)
);


CREATE TABLE event_users (
	user_id SERIAL NOT NULL,
	user_id SERIAL NOT NULL,
	PRIMARY KEY (user_id, event_id),
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
	FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
);

CREATE TABLE event_dates (
	user_id SERIAL NOT NULL,
	user_id SERIAL NOT NULL,
	date DATE NOT NULL,
	PRIMARY KEY (user_id, event_id)
);


CREATE TABLE auth_providers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);


CREATE TABLE auth_ids (
	auth_id SERIAL NOT NULL,
	user_id SERIAL NOT NULL,
	uid VARCHAR(255) NOT NULL,
	PRIMARY KEY (auth_id, user_id),
	FOREIGN KEY (auth_id) REFERENCES auth(id) ON DELETE CASCADE,
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);