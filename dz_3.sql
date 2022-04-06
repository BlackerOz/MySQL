DROP TABLE IF EXISTS programs; -- программы (виджеты)
CREATE TABLE programs (
	id SERIAL, -- SERIAL = BIGINT UNSIGNED NOT NULL UNIQUE
	created_user_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(255),
    body TEXT,
    created_at DATETIME DEFAULT NOW(), 

    FOREIGN KEY (created_user_id) REFERENCES users(id),   
);
 
DROP TABLE IF EXISTS bookmarks; -- закладки
CREATE TABLE bookmars (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (user_id) REFERENCES users(id),   
    FOREIGN KEY (media_id) REFERENCES media(id)
);

 DROP TABLE IF EXISTS wallet; --  упрощенный кошелек
CREATE TABLE wallet (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
    coming INT(6), -- предположим, что максимальные поступления 6 значные
    expenditure INT(6), -- предположим, что максимальные расходы 6 значные
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (user_id) REFERENCES users(id),   
 );

