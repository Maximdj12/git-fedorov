-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 27 2026 г., 09:07
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `keninbasadan`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Reminder`
--

CREATE TABLE `Reminder` (
  `reminderId` int NOT NULL,
  `reminderName` varchar(128) NOT NULL,
  `reminderDescription` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `reminderDate` date NOT NULL,
  `reminderPriority` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `User`
--

CREATE TABLE `User` (
  `userId` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `totalReminders` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `UserReminders`
--

CREATE TABLE `UserReminders` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `reminderId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Reminder`
--
ALTER TABLE `Reminder`
  ADD PRIMARY KEY (`reminderId`);

--
-- Индексы таблицы `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`userId`);

--
-- Индексы таблицы `UserReminders`
--
ALTER TABLE `UserReminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminderId` (`reminderId`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Reminder`
--
ALTER TABLE `Reminder`
  MODIFY `reminderId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `User`
--
ALTER TABLE `User`
  MODIFY `userId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `UserReminders`
--
ALTER TABLE `UserReminders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `UserReminders`
--
ALTER TABLE `UserReminders`
  ADD CONSTRAINT `userreminders_ibfk_1` FOREIGN KEY (`id`) REFERENCES `User` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `userreminders_ibfk_2` FOREIGN KEY (`reminderId`) REFERENCES `Reminder` (`reminderId`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
