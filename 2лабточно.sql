--Вывести логины и никнеймы всех пользователей,
--в логинах которых присутствует повторяющаяся дважды подряд последовательность символов (например, «ivanivan» или «abcabc»).
SELECT 
    Login AS "Логин",
    Nickname AS "Никнейм"
FROM Users
WHERE Login ~ '(.+)\1';
--Вывести никнеймы и электронные почты пользователей, 
--у которых есть хотя бы один персонаж, в имени которого содержится никнейм этого пользователя.
SELECT DISTINCT
    u.Nickname AS "Никнейм пользователя",
    u.Email AS "Электронная почта"
FROM Users u
JOIN Characters c ON u.User_ID = c.User_ID
WHERE c.Character_Name LIKE '%' || u.Nickname || '%';
--Создать новую таблицу Full_Info, которая будет содержать данные из предыдущего запроса
--(никнейм пользователя и его персонажей), чтобы сохранить эту информацию в базе.
-- Создаем новую таблицу и сразу заполняем её данными из запроса
SELECT 
    u.User_ID,
    u.Nickname AS "Никнейм пользователя", 
    u.Email AS "Электронная почта",
    c.Character_Name AS "Имя персонажа", 
    c.Character_Level AS "Уровень",
    c.Special_Skills AS "Особые умения"
INTO Full_Info
FROM Users u
JOIN Characters c ON u.User_ID = c.User_ID;