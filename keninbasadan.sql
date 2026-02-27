-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 27 2026 г., 09:38
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

--
-- Дамп данных таблицы `Reminder`
--

INSERT INTO `Reminder` (`reminderId`, `reminderName`, `reminderDescription`, `reminderDate`, `reminderPriority`) VALUES
(1, '', NULL, '2026-02-19', 1),
(2, 'John needs to take his medication', 'He must take his stomach painkillers!', '2026-02-28', 3),
(3, 'John needs to play mobile legends', NULL, '2026-02-28', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `User`
--

CREATE TABLE `User` (
  `userId` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `totalReminders` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `User`
--

INSERT INTO `User` (`userId`, `name`, `totalReminders`) VALUES
(1, 'root', 1),
(2, 'John', 2);

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
-- Дамп данных таблицы `UserReminders`
--

INSERT INTO `UserReminders` (`id`, `userId`, `reminderId`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 3);

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
  ADD KEY `reminderId` (`reminderId`),
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Reminder`
--
ALTER TABLE `Reminder`
  MODIFY `reminderId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `User`
--
ALTER TABLE `User`
  MODIFY `userId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `UserReminders`
--
ALTER TABLE `UserReminders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `UserReminders`
--
ALTER TABLE `UserReminders`
  ADD CONSTRAINT `userreminders_ibfk_1` FOREIGN KEY (`reminderId`) REFERENCES `Reminder` (`reminderId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `userreminders_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
