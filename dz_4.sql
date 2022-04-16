/*  2. Задание. Написать скрипт, возвращающий список имен (только firstname) 
пользователей без повторений в алфавитном порядке */

SELECT DISTINCT 
	firstname 
FROM 
	users 
order by
	firstname 
	
/* 3. Задание. Написать скрипт, отмечающий несовершеннолетних пользователей как 
неактивных (поле is_active = false). Предварительно добавить такое поле 
в таблицу profiles со значением по умолчанию = true (или 1) */

ALTER TABLE -- добавляю столбец is_active со значением 1
	profiles
add
	is_active BOOL default 1 
	
update 
	profiles  
set 
	is_active = 0
WHERE 
	DATEDIFF(CURRENT_DATE(),birthday) < 6574 -- примим, что 18 лет это 6574 дня
	
/* 4. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней) */
	
DELETE 
FROM
	messages
WHERE 
	now() < created_at 