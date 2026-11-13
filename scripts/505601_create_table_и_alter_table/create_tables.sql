create table users
(
	id BIGINT generated always as identity PRIMARY key,
	name TEXT not null,
	email TEXT not null unique, 
	created_at TIMESTAMPTZ not null default now()
);
