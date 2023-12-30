Создание таблицы "Товары"
CREATE TABLE Товары (
    ID_Товара INT PRIMARY KEY,
    Название VARCHAR(255),
    Описание TEXT,
    Цена DECIMAL(10, 2),
    Производитель VARCHAR(100),
    Модель VARCHAR(50),
    Гарантия INT,
    Количество_в_наличии INT
);

-- Создание таблицы "Категории_Товаров"
CREATE TABLE Категории_Товаров (
    ID_Категории INT PRIMARY KEY,
    Название VARCHAR(255),
    Описание TEXT
);

-- Создание таблицы "Поставщики"
CREATE TABLE Поставщики (
    ID_Поставщика INT PRIMARY KEY,
    Название_Компании VARCHAR(255),
    Контактная_Информация VARCHAR(255),
    Рейтинг_Поставщика INT
);

-- Создание таблицы "Заказы"
CREATE TABLE Заказы (
    ID_Заказа INT PRIMARY KEY,
    Дата_Заказа DATE,
    Статус_Заказа VARCHAR(50),
    Общая_Сумма DECIMAL(10, 2),
    Способ_Оплаты VARCHAR(50),
    Статус_Оплаты VARCHAR(50)
);

-- Создание таблицы "Покупатели"
CREATE TABLE Покупатели (
    ID_Покупателя INT PRIMARY KEY,
    Имя VARCHAR(50),
    Фамилия VARCHAR(50),
    Адрес TEXT,
    Контактная_Информация VARCHAR(255)
);

-- Создание таблицы "Оплата"
CREATE TABLE Оплата (
    ID_Операции INT PRIMARY KEY,
    Способ_Оплаты VARCHAR(50),
    Сумма DECIMAL(10, 2),
    Дата DATE
);

-- Создание таблицы "Доставка"
CREATE TABLE Доставка (
    ID_Доставки INT PRIMARY KEY,
    Адрес_Доставки TEXT,
    Статус_Доставки VARCHAR(50),
    Дата_Доставки DATE
);

-- Создание таблицы "Отзывы"
CREATE TABLE Отзывы (
    ID_Отзыва INT PRIMARY KEY,
    Текст_Отзыва TEXT,
    Рейтинг INT,
    Дата_Отзыва DATE
);

-- Создание таблицы "Корзины"
CREATE TABLE Корзины (
    ID_Корзины INT PRIMARY KEY,
    Дата_Создания DATE,
    Общая_Стоимость DECIMAL(10, 2),
    Статус VARCHAR(50)
);

-- Создание таблицы "Избранное"
CREATE TABLE Избранное (
    ID_Избранного INT PRIMARY KEY,
    Дата_Добавления DATE
);

-- Создание таблицы "Детали_Заказа"
CREATE TABLE Детали_Заказа (
    ID_Детали_Заказа INT PRIMARY KEY,
    ID_Заказа INT,
    ID_Товара INT,
    Количество INT,
    Цена_на_момент_Добавления DECIMAL(10, 2),
    FOREIGN KEY (ID_Заказа) REFERENCES Заказы(ID_Заказа),
    FOREIGN KEY (ID_Товара) REFERENCES Товары(ID_Товара)
);

-- Создание таблицы "Корзина_Товары"
CREATE TABLE Корзина_Товары (
    ID_Корзины INT,
    ID_Товара INT,
    Количество INT,
    Цена_на_момент_Добавления DECIMAL(10, 2),
    PRIMARY KEY (ID_Корзины, ID_Товара),
    FOREIGN KEY (ID_Корзины) REFERENCES Корзины(ID_Корзины),
    FOREIGN KEY (ID_Товара) REFERENCES Товары(ID_Товара)
);

-- Создание таблицы "Избранное_Товары"
CREATE TABLE Избранное_Товары (
    ID_Избранного INT,
    ID_Товара INT,
    Дата_Добавления DATE,
    PRIMARY KEY (ID_Избранного, ID_Товара),
    FOREIGN KEY (ID_Избранного) REFERENCES Избранное(ID_Избранного),
    FOREIGN KEY (ID_Товара) REFERENCES Товары(ID_Товара)
);