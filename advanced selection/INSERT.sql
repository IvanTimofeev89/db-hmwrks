/* Заполняем таблицу singers */
INSERT INTO singers(singer_name, singer_surname, pseudonym)
VALUES  ('Name_1','Surname_1','Pseudonym_1'),
		('Name_2','Surname_2','Pseudonym_2'),
		('Name_3','Surname_3','Pseudonym_3'),
		('Name_4','Surname_4','Pseudonym_4'),
		('Name_5','Surname_5','Pseudonym_5');

	
/* изменение имени исполнителя для выполнения Задания 2 */ 	
UPDATE singers 
	SET singer_name = 'Long Name_2'
 WHERE singer_id = 2;	
	
	
/* Заполняем таблицу genre */
INSERT INTO genre(genre_name)
VALUES ('genre_1'),
       ('genre_2'),
       ('genre_3'),
       ('genre_4');

/* Заполняем таблицу genresingers */
INSERT INTO genresingers(genre_id, singer_id)
VALUES (1, 2),
       (2, 1),
       (3, 4),
       (3, 5),
       (4, 3),
       (1, 3),
       (2, 5);
      
/* Заполняем таблицу albums */
INSERT INTO albums(album_name, release_date)
VALUES  ('album_1', '2018-01-01'),
		('album_2', '2019-01-01'),
		('album_3', '2020-01-01'),
		('album_4', '2021-01-01');
	
/* Заполняем таблицу singersalbums */	
INSERT INTO singersalbums(singer_id, album_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 4),
       (3, 1),
       (1, 2);	
	
/* Заполняем таблицу songs */
INSERT INTO songs(album_id, song_name, song_length)
VALUES  (1, 'Song_1', 10),
        (1, 'My song_2', 240),
		(2, 'Это мой трек_3', 180),
		(2, 'Song_4', 90),
		(3, 'Another my song_5', 380),
		(3, 'Song_6', 140),
		(3, 'Еще мой трек_7', 390),
		(4, 'Song_8', 10);

/* изменение имени трека для выполнения Задания 2 */ 	
UPDATE songs 
	SET song_name = 'Мой трек_7'
 WHERE song_id = 7;	

/* Добавляем в таблицу треки для выролнения задания 4 на невхождение в сборник */
INSERT INTO songs(album_id, song_name, song_length)
VALUES  (3, 'Without_collection_1', 360),
        (2, 'Without_collection_2', 220);
	
	
/* Заполняем таблицу collection */
INSERT INTO collection(collection_name, release_date)
VALUES  ('collection_1', '2019-01-01'),
		('collection_2', '2020-01-01'),
		('collection_3', '2020-01-01'),
		('collection_4', '2023-01-01');

/* Заполняем таблицу collectionsongs */
INSERT INTO collectionsongs(collection_id,song_id)
VALUES  (1, 3),
		(1, 5),
		(2, 4),
		(2, 8),
		(3, 3),
		(3, 1),
		(3, 7),
		(4, 2),
		(4, 6);
	
