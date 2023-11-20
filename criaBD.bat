::comando utiizando para ignorar alguns logs ao executar o script

@echo off

::Set postgres settings
set DB_USER=postgres
set DB_PASSWORD=postgres
set DB_NAME=testebat

::Path to PSQL
set PSQL_PATH="C:\Program Files\PostgreSQL\11\bin\psql.exe"

%PSQL_PATH% -U postgres -c "CREATE DATABASE %DB_NAME%;"
%PSQL_PATH% -U postgres -d %DB_NAME% -c "create table if not exists films (i_film serial not null primary key,title varchar(200) not null,description varchar(500),original_language varchar(200),director varchar(200),score float,cover varchar(500),duration int,releaseYear smallint);"
%PSQL_PATH% -U postgres -d %DB_NAME% -c "create table if not exists reviews (i_review serial not null primary key,title varchar(200) not null,analysis varchar(500) not null,score float,name varchar(200),img varchar(500),i_film int,foreign key(i_film) references films(i_film));"
%PSQL_PATH% -U postgres -d %DB_NAME% -c "create table if not exists genres (i_genre serial not null primary key,name varchar(200));"
%PSQL_PATH% -U postgres -d %DB_NAME% -c "create table if not exists genre_film (i_film int,i_genre int,foreign key(i_film) references films(i_film),foreign key(i_genre) references genres(i_genre));"

:: Ad data examples
%PSQL_PATH% -U postgres -d %DB_NAME% -c "INSERT INTO films (title, description, original_language, director, score, cover, duration, releaseYear) VALUES ('The Shawshank Redemption', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 'English', 'Frank Darabont', 9.3, 'shawshank_redemption.jpg', 142, 1994),('The Godfather', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 'English', 'Francis Ford Coppola', 9.2, 'godfather.jpg', 175, 1972),('The Dark Knight', 'When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.', 'English', 'Christopher Nolan', 9.0, 'dark_knight.jpg', 152, 2008),('Pulp Fiction', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 'English', 'Quentin Tarantino', 8.9, 'pulp_fiction.jpg', 154, 1994),('Schindler''s List', 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.', 'English', 'Steven Spielberg', 8.9, 'schindlers_list.jpg', 195, 1993)"
%PSQL_PATH% -U postgres -d %DB_NAME% -c "INSERT INTO reviews (title, analysis, score, name, img, i_film)VALUES ('Great Redemption', 'A masterpiece that explores the power of redemption and friendship.', 9.5, 'Critic A', 'criticA.jpg', 1),('Epic Mafia Saga', 'A gripping tale of family, loyalty, and power in the world of organized crime.', 9.2, 'Critic B', 'criticB.jpg', 2),('Unforgettable Joker', 'Heath Ledger's portrayal of The Joker is simply mind-blowing. A dark and intense masterpiece.', 9.0, 'Critic C', 'criticC.jpg', 3),('Quirky and Stylish', 'Tarantino's unique storytelling and the ensemble cast make Pulp Fiction a one-of-a-kind cinematic experience.', 8.8, 'Critic D', 'criticD.jpg', 4),('Powerful and Heartbreaking', 'Schindler's List is a haunting and powerful depiction of the atrocities of the Holocaust.', 9.1, 'Critic E', 'criticE.jpg', 5)"

