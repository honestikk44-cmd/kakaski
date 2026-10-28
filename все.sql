-- ==========================================
-- Лабораторная работа. Вариант 34
-- ==========================================

-- 1. Создание главной таблицы Users (Пользователи)
CREATE TABLE Users (
    User_ID SERIAL PRIMARY KEY,                 -- Ограничение PRIMARY KEY (первичный ключ + автоинкремент)
    Email VARCHAR(100) NOT NULL UNIQUE,         -- Ограничение NOT NULL (обязательное) + UNIQUE (уникальное)
    Login VARCHAR(50) NOT NULL UNIQUE,          -- Ограничение NOT NULL + UNIQUE
    Password VARCHAR(100) NOT NULL,             -- Ограничение NOT NULL
    Nickname VARCHAR(50) NOT NULL,              -- Ограничение NOT NULL
    User_Level INT NOT NULL DEFAULT 1           -- Ограничение NOT NULL + значение по умолчанию
);

-- 2. Создание зависимой таблицы Characters (Персонажи)
CREATE TABLE Characters (
    Character_ID SERIAL PRIMARY KEY,            -- Ограничение PRIMARY KEY (первичный ключ + автоинкремент)
    User_ID INT NOT NULL,                       -- Ограничение NOT NULL
    Character_Name VARCHAR(50) NOT NULL,        -- Ограничение NOT NULL
    Character_Story TEXT,
    Character_Level INT NOT NULL DEFAULT 1,     -- Ограничение NOT NULL + значение по умолчанию
    Special_Skills TEXT,
    
    -- Ограничение FOREIGN KEY (ссылочная целостность) + Каскадное обновление и удаление
    CONSTRAINT fk_user
        FOREIGN KEY (User_ID) 
        REFERENCES Users (User_ID)
        ON UPDATE CASCADE                       
        ON DELETE CASCADE                       
);

-- 3. Заполнение таблицы Users (10 записей)
INSERT INTO Users (Email, Login, Password, Nickname, User_Level) VALUES
('ivan@mail.ru', 'ivan123', 'pass123', 'IvanTheGreat', 5),
('anna@mail.ru', 'anna_k', 'qwerty1', 'AnnaBanana', 12),
('petr@mail.ru', 'petr_p', 'password', 'PetrP', 3),
('olga@mail.ru', 'olga_98', 'secret98', 'Olya_Star', 8),
('maxim@mail.ru', 'max_im', 'maxim123', 'MaxPower', 20),
('elena@mail.ru', 'elena_v', 'elena2023', 'LenaFox', 7),
('dmitry@mail.ru', 'dima_d', 'dima_pass', 'Dimon', 15),
('kate@mail.ru', 'kate_m', 'katepass', 'KateCake', 2),
('sergey@mail.ru', 'sergey_s', 'sergey11', 'Sergo', 30),
('victor@mail.ru', 'victor_v', 'vitya999', 'VictorPro', 1);

-- 4. Заполнение таблицы Characters (10 записей)
INSERT INTO Characters (User_ID, Character_Name, Character_Story, Character_Level, Special_Skills) VALUES
(1, 'DragonSlayer', 'Великий воин, победивший дракона.', 10, 'Огненный удар'),
(2, 'ElvenArcher', 'Лучница из лесов Лотлориэна.', 15, 'Точный выстрел, Скрытность'),
(3, 'DarkMage', 'Маг, использующий темную магию.', 8, 'Вампиризм, Проклятие'),
(4, 'Healer', 'Добрый целитель, спасающий жизни.', 7, 'Массовое исцеление'),
(5, 'ShadowAssassin', 'Убийца, действующий из тени.', 20, 'Невидимость, Критический удар'),
(6, 'Paladin', 'Святой воин, защитник слабых.', 9, 'Божественный щит'),
(7, 'Necromancer', 'Повелитель мертвых.', 18, 'Призыв скелета, Смертельная аура'),
(8, 'Berserker', 'Яростный воин без страха.', 5, 'Берсерк, Ярость'),
(9, 'Elementalist', 'Маг, управляющий стихиями.', 25, 'Ледяная стрела, Огненный шторм'),
(10, 'Rogue', 'Ловкий вор и разведчик.', 2, 'Кража, Взлом замков');

-- 5. Проверка каскадного удаления (удаление пользователя VictorPro и его персонажа Rogue)
DELETE FROM Users WHERE User_ID = 10;