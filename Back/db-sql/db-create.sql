create database rottentomatoes;

-- Se estiver criando o BD no servidor sem usuários, rodar:

create user postgres with encrypted password 'postgres'
grant all privileges on database rottentomatoes to postgres

create table if not exists films (
	i_film serial not null primary key,
	title varchar(200) not null,
	description varchar(500),
    original_language varchar(200),
    director varchar(200),
	score float,
	cover varchar(500),
	duration int,
	releaseYear smallint
);

create table if not exists reviews (
	i_review serial not null primary key,
	title varchar(200) not null,
	analysis varchar(500) not null,
	score float,
	name varchar(200),
	img varchar(500),
	i_film int,
	foreign key(i_film)
		references films(i_film)
);

create table if not exists genres (
	i_genre serial not null primary key,
	name varchar(200)
)

create table if not exists genre_film (
	i_film int,
	i_genre int,
	foreign key(i_film)
		references films(i_film),
	foreign key(i_genre)
		references genres(i_genre)
)

-- Versão das tabelas para rodar por meio do PSQL (shel do postgre)

create table if not exists films (i_film serial not null primary key,title varchar(200) not null,description varchar(500),original_language varchar(200),director varchar(200),note float,cover varchar(500),duration int,releaseYear smallint);

create table if not exists reviews (i_review serial not null primary key,title varchar(200) not null,analysis varchar(500) not null,score float,name varchar(200),img varchar(500),i_film int,foreign key(i_film) references films(i_film));

create table if not exists genres (i_genre serial not null primary key,name varchar(200));

create table if not exists genre_film (i_film int,i_genre int,foreign key(i_film) references films(i_film),foreign key(i_genre) references genres(i_genre));