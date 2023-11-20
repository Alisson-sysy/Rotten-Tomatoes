-- Create films examples

INSERT INTO films (title, description, score, cover, duration, releaseyear) 
	values ('THE HUNGER GAMES: THE BALLAD OF SONGBIRDS & SNAKES', 'this is a film', 67, 'caminha da img', 180, 2023);

--  create reviews examples

INSERT INTO reviews (i_review, title, analysis, score, name, img, i_film) 
	VALUES (1, 'this is definitely a movie', 'The Ballad of Songbirds & Snakes" takes us back to the dystopian world of Panem, exploring the origins of the Hunger Games and the rise of President Coriolanus Snow. Directed by Francis Lawrence, this prequel to the acclaimed Hunger Games series provides a fresh perspective on the Capitols dark history.', 4.5, 'jhonatas Junior', 'caminha da img do viado', 1);

-- create genres examples

INSERT INTO genres (name) VALUES
  ('Action'),
  ('Adventure'),
  ('Comedy'),
  ('Drama'),
  ('Horror'),
  ('Sci-Fi'),
  ('Thriller'),
  ('Fantasy'),
  ('Mystery'),
  ('Romance');

INSERT INTO genre_film VALUES (1,1);