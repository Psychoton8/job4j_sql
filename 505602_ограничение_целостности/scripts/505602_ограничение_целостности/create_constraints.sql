CREATE TABLE roles
(
	id BIGINT generated always as identity primary key,
	name TEXT not null unique 
);

CREATE TABLE users
(
	id BIGINT generated always as identity primary key,
	login TEXT not null unique,
	password_hash TEXT not null,
	role_id BIGINT not null references roles (id),
	created_at TIMESTAMPTZ not null default now()
);

CREATE TABLE states
(
  id BIGINT generated always as identity primary key,
	name TEXT not null unique 
);

CREATE TABLE categories
(
  id BIGINT generated always as identity primary key,
  name TEXT not null unique 
);

CREATE TABLE items
(
  id BIGINT generated always as identity primary key,
  title TEXT not null,
  description TEXT not null,
  author_id BIGINT not null references users (id),
  state_id BIGINT not null references states (id),
  category_id BIGINT not null references categories (id),
  created_at TIMESTAMPTZ not null default now()
);

CREATE TABLE comments
(
  id BIGINT generated always as identity primary key,
  text TEXT not null,
  item_id BIGINT not null references items (id) on delete cascade,
  author_id BIGINT not null references users (id),
  created_at TIMESTAMPTZ not null default now()
);
