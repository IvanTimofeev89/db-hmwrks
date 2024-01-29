/* Задание 2 Название и продолжительность самого длительного трека */
SELECT  song_name, song_length
  FROM songs
 WHERE song_length = (SELECT MAX(song_length) FROM songs);
 

/* Задание 2 Название треков, продолжительность которых не менее 3,5 минут */
SELECT song_name
  FROM songs
 WHERE song_length >= 210;

 
/*Задание 2 Названия сборников, вышедших в период с 2018 по 2020 год включительно*/
SELECT collection_name
  FROM collection
 WHERE EXTRACT(YEAR FROM release_date) BETWEEN 2018 AND 2020;

 
/*Задание 2 Исполнители, чьё имя состоит из одного слова.*/
SELECT singer_name
  FROM singers
 WHERE singer_name LIKE '% %';


/* Задание 2 Название треков, которые содержат слово «мой» или «my» */
SELECT song_name
  FROM songs 
 WHERE song_name LIKE '%мой%'
    OR song_name LIKE 'Мой%'
    OR song_name LIKE '%my%'
    OR song_name LIKE 'My%';

   
/* Задание 3 Количество исполнителей в каждом жанре */
SELECT g.genre_name, COUNT(s.singer_id) singers_amount
  FROM genre g 
  	INNER JOIN genresingers g2 
	ON g.genre_id = g2.genre_id 
	INNER JOIN singers s 
	ON g2.singer_id = s.singer_id		
  GROUP BY g.genre_name
  ORDER BY g.genre_name; 
  
 
/*Задание 3 Количество треков, вошедших в альбомы 2019–2020 годов*/
SELECT COUNT(s.song_id) songs_amount
  FROM songs s 
  	INNER JOIN albums a 
  	ON s.album_id = a.album_id 
 WHERE EXTRACT(YEAR FROM a.release_date) BETWEEN 2019 AND 2020;
 

/*Задание 3 Средняя продолжительность треков по каждому альбому */
SELECT a.album_name, AVG(s.song_length) avg_duration_sec
  FROM albums a 
    INNER JOIN songs s 
    ON a.album_id = s.album_id
  GROUP BY a.album_name 
  ORDER BY a.album_name; 
 
 
/*Задание 3 Все исполнители, которые не выпустили альбомы в 2020 году*/
SELECT s.singer_name
  FROM singers s 
 WHERE s.singer_name NOT IN 
    (SELECT s.singer_name 
      FROM singers s 
        INNER JOIN singersalbums s2 
        ON s.singer_id = s2.singer_id
        INNER JOIN albums a 
        ON a.album_id = s2.album_id 
      WHERE EXTRACT(YEAR FROM a.release_date) = 2020); 
     
     
/*Задание 3 Названия сборников, в которых присутствует Name_3*/
SELECT DISTINCT c.collection_name
  FROM collection c 
    INNER JOIN collectionsongs c2 
    ON c.collection_id = c2.collection_id 
    INNER JOIN songs s 
    ON s.song_id = c2.song_id  
    INNER JOIN singersalbums s2 
    ON s2.album_id = s.album_id 
    INNER JOIN singers s3 
    ON s2.singer_id = s3.singer_id 
  WHERE s3.singer_name = 'Name_3'
  ORDER BY c.collection_name;

 
 /* Задание 4 Названия альбомов, в которых присутствуют исполнители более чем одного жанра*/
SELECT a.album_name
  FROM albums a  
    INNER JOIN singersalbums s 
    ON s.album_id = a.album_id 
    INNER JOIN singers s2 
    ON s.singer_id = s2.singer_id 
  WHERE s2.singer_id IN (SELECT g.singer_id
                          FROM genresingers g 
                         GROUP BY g.singer_id
                         HAVING COUNT(g.genre_id) > 1)
 ORDER BY a.album_name; 


/* Задание 4 Наименования треков, которые не входят в сборники */
SELECT s.song_name 
  FROM songs s 
  LEFT JOIN collectionsongs c 
  ON s.song_id = c.song_id 
 WHERE c.song_id IS NULL;


/*Задание 4 Исполнители, написавшие самый короткий по продолжительности трек */
SELECT s.singer_name
  FROM singers s 
    INNER JOIN singersalbums s2 
    ON s.singer_id = s2.singer_id  
    INNER JOIN songs s3 
    ON s3.album_id = s2.album_id 
 WHERE song_length = (SELECT MIN(song_length) FROM songs); 


/*Задание 4 Названия альбомов, содержащих наименьшее количество треков */

SELECT a.album_name 
  FROM albums a 
    INNER JOIN songs s
    ON a.album_id = s.album_id 
 WHERE a.album_id IN (SELECT album_id  
                        FROM songs s 
                      GROUP BY album_id
                      HAVING COUNT(s.song_id) = (SELECT MIN(count) 
                     							  FROM (SELECT COUNT(s.song_id) 
                     							        FROM songs s 
                     							        GROUP BY s.album_id) AS t));


 