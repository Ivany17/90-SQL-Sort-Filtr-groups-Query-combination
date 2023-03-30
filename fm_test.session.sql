SELECT sum("quantity") -- посчитать телефоны, которые проданы
FROM "phones_to_orders";

SELECT sum("quantity") -- посчитать все телефоны, которые есть в магазине
FROM "phones";

SELECT avg("price") -- посчитать среднюю цену всех телефонов
FROM "phones";

SELECT avg("price"), "brand" -- посчитать среднюю цену телефонов каждого бренда
FROM "phones"
GROUP BY "brand";

SELECT count(*), "brand" -- посчитать количество моделей каждого бренда
FROM "phones"
GROUP BY "brand";

SELECT avg("price"), "brand" -- посчитать среднюю цену на Sony
FROM "phones"
WHERE "brand"='Sony'
GROUP BY "brand";


SELECT "id", "height"
FROM "users"
ORDER BY "height" ASC; --ASC - возрастание

SELECT "id", "height"
FROM "users"
ORDER BY "height" DESC; --DESC - убывание

SELECT "id", "height", "birthday"
FROM "users"
ORDER BY "height" ASC, "birthday" DESC;

SELECT * -- посчитать каких моделей телефонов осталось меньше всего в магазине
FROM "phones"
ORDER BY "quantity"
LIMIT 20;

SELECT extract('year' FROM age("birthday")) AS "Age", -- отсортировать пользователей по возрасту, а потом по фамилии
FROM "users"
ORDER BY "Age" ASC, "lastName" ASC;

SELECT extract('year' FROM age("birthday")) AS "Age", -- посчитать количество людей определенного возраста и вывести только те группы,где по одному человеку
count(*)
FROM "users"
GROUP BY "Age"
HAVING count(*)=1
ORDER BY "Age";

/* Поиск по шаблону
LIKE -- в соответствии с регистром
ILIKE -- без учета регистра
% -- любой символ сколько угодно раз
_ -- любой символ один раз
*/;

SELECT "id", concat("firstName", ' ', "lastName") -- найти пользователей, у которых имя начинается на А
FROM "users"
WHERE "firstName" LIKE 'A%a';

SELECT "id", concat("firstName", ' ', "lastName"), "email" -- найти пользователей, у которых email начинается на s
FROM "users"
WHERE "email" LIKE 's%'
AND length("email") BETWEEN 20 AND 30;


CREATE TABLE a(s VARCHAR(3), q int);
CREATE TABLE b(w VARCHAR(3));

INSERT INTO "a" VALUES ('qwe', 2), ('rty', 2), ('abc', 2);
INSERT INTO "b" VALUES ('asd'), ('ewq'), ('abc');
INSERT INTO "b" VALUES ('qwe');
SELECT * FROM "a", "b"; -- Decart multiply

SELECT "s" FROM "a"
UNION
SELECT "w" FROM "b";

SELECT "s" FROM "a"
INTERSECT
SELECT "w" FROM "b";

SELECT "s" FROM "a"
EXCEPT
SELECT "w" FROM "b";