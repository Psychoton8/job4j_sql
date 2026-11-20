DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

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

create table orders
(
	id BIGINT generated always as identity primary key,
	user_id BIGINT not null references users (id),
	status TEXT not null,
	created_at TIMESTAMPTZ not null default now()
);

create table order_items
(
	id BIGINT generated always as identity primary key,
	order_id BIGINT not null references orders (id),
	product_id BIGINT not null references products (id),
	quantity INT not null check (quantity > 0 ),
	unit_price NUMERIC(12, 2) not null check (unit_price > 0)
);
