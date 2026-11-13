create table users
(
	id BIGINT generated always as identity PRIMARY key,
	name TEXT not null,
	email TEXT not null unique, 
	created_at TIMESTAMPTZ not null default now()
);

create table products
(
	id BIGINT generated always as identity primary key,
	name TEXT not null,
	price NUMERIC(12,2) not null check (price > 0),
	is_active BOOLEAN not null default true,
	created_at TIMESTAMPTZ not null default now()
);
