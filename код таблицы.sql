-- 1. Создание главной таблицы Users со всеми ограничениями
CREATE TABLE Users (
    User_ID SERIAL PRIMARY KEY,                 -- Ограничение PRIMARY KEY (первичный ключ) + автоинкремент
    Email VARCHAR(100) NOT NULL UNIQUE,         -- Ограничение NOT NULL (обязательное) + UNIQUE (уникальное)
    Login VARCHAR(50) NOT NULL UNIQUE,          -- Ограничение NOT NULL + UNIQUE
    Password VARCHAR(100) NOT NULL,             -- Ограничение NOT NULL
    Nickname VARCHAR(50) NOT NULL,              -- Ограничение NOT NULL
    User_Level INT NOT NULL DEFAULT 1,          -- Ограничение NOT NULL + DEFAULT (значение по умолчанию)
    
    -- Ограничение CHECK (проверка на допустимые значения)
    CONSTRAINT check_user_level CHECK (User_Level >= 1 AND User_Level <= 100) 
);

-- 2. Создание зависимой таблицы Characters со всеми ограничениями
CREATE TABLE Characters (
    Character_ID SERIAL PRIMARY KEY,            -- Ограничение PRIMARY KEY (первичный ключ) + автоинкремент
    User_ID INT NOT NULL,                       -- Ограничение NOT NULL (внешний ключ не может быть пустым)
    Character_Name VARCHAR(50) NOT NULL,        -- Ограничение NOT NULL
    Character_Story TEXT,
    Character_Level INT NOT NULL DEFAULT 1,     -- Ограничение NOT NULL + DEFAULT
    Special_Skills TEXT,
    
    -- Ограничение CHECK (проверка уровня персонажа)
    CONSTRAINT check_char_level CHECK (Character_Level >= 1),
    
    -- Ограничение FOREIGN KEY (ссылочная целостность) + каскадное обновление и удаление
    CONSTRAINT fk_user
        FOREIGN KEY (User_ID) 
        REFERENCES Users (User_ID)
        ON UPDATE CASCADE                       -- Каскадное обновление
        ON DELETE CASCADE                       -- Каскадное удаление
);