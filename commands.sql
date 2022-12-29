CREATE TABLE blogs (
	id SERIAL PRIMARY KEY,
	author TEXT,
	url TEXT NOT NULL,
	title TEXT NOT NULL,
	likes INTEGER DEFAULT 0	
);

INSERT INTO blogs (author, url, title) values ('Bob Loblaw', 'www.bobloblaw.com', 'Law Blog');

INSERT INTO blogs (author, url, title, likes) values ('Jane Doe', 'www.janedoe.com', 'Murder Mysteries Are the New Soaps', 3);
