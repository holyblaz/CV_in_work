
-- Создаем таблицу "users" --

CREATE TABLE users (
  id SERIAL NOT NULL, 
  user_name VARCHAR(60) NOT NULL, 
  level_id INT, 
  skill INT,
  PRIMARY KEY(id)   
);


-- Создаем таблицу "levels" --

CREATE TABLE levels (
   id SERIAL NOT NULL,
   level_name VARCHAR(60) NOT NULL,
   PRIMARY KEY(id)        
);


-- Добавялем пользователей в таблицу "users" --

INSERT INTO users (id, user_name, level_id, skill) 
VALUES 
  (DEFAULT, 'Anton', 1, 900000), 
  (DEFAULT, 'Denis', 3, 4000), 
  (DEFAULT, 'Petr', 2, 50000), 
  (DEFAULT, 'Andrey', 4, 20), 
  (DEFAULT, 'Olga', 1, 600000), 
  (DEFAULT, 'Anna', 1, 1600000);


-- Добавляем данные об уровнях пользователей в таблицу "levels" --

INSERT INTO levels (level_name) 
VALUES 
  (DEFAULT, 'admin'),    
  (DEFAULT, 'power_user'), 
  (DEFAULT, 'user'), 
  (DEFAULT, 'guest');

-- Отобрать из таблицы user всех пользователей, у которых 'level_id' = 1, 'skill' > 799000 и в имени встречается буква 'а' --								

SELECT 
  user_name 
FROM 
  users 
WHERE 
  level_id = 1 
  AND skill > 799000 
  AND user_name LIKE '%a%';


-- Удаляем всех пользователей, у которых 'skill' меньше 100000 --

DELETE FROM 
  users 
WHERE 
  skill < 100000;


-- Добавить в таблицу "user" нового пользователя по имени 'Oleg', с уровнем '4' и 'skill' = 10 --								

INSERT INTO users (id, user_name, level_id, skill) 
VALUES 
  (DEFAULT, 'Oleg', 4, 10); 


-- Обновить данные в таблице "user" - для пользователей с 'level_id' меньше 2, проставить 'skill' 2000000 --								

UPDATE 
  users 
SET 
  skill = 2000000 
WHERE 
  level_id < 2;


-- Выбрать 'user_name' всех пользователей уровня 'admin' используя подзапрос --								

SELECT 
  user_name
FROM users
WHERE level_id = (
    SELECT 
      id 
    FROM 
      levels 
    WHERE 
      level_name = 'admin'
  );


-- Выбрать 'user_name' всех пользователей уровня 'admin' используя оператор 'join' -- 							

SELECT 
  user_name 
from 
  users 
  INNER JOIN levels ON users.level_id = levels.id 
WHERE 
  level_name = 'admin';

************************

-- Произвольный запрос для демонстрации GROUP BY + HAVING -- (дать название и расположить в середине)

SELECT 
  avg(skill), user_name
FROM 
  users 
WHERE 
  user_name LIKE 'A%' 
GROUP BY 
  user_name 
HAVING 
  avg(skill) > 50000;

-- Произовольный запрос для демонстрации ORDER BY и LIMIT -- (дать название и расположить в середине)

SELECT 
  * 
FROM 
  users 
WHERE 
  level_id > 1 
GROUP BY 
  level_id 
ORDER BY 
  skill DESC 
LIMIT 3;