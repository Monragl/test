-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 19 2022 г., 14:14
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sdo`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `question_id` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `scaleKey` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `organization_info`
--

CREATE TABLE `organization_info` (
  `id` int(11) NOT NULL,
  `descriptions` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `organization_profession`
--

CREATE TABLE `organization_profession` (
  `id` int(11) NOT NULL,
  `profession_id` varchar(255) NOT NULL,
  `organizationProfessionKey` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `parser`
--

CREATE TABLE `parser` (
  `id` int(11) NOT NULL,
  `users_id` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `parser_scale`
--

CREATE TABLE `parser_scale` (
  `id` int(11) NOT NULL,
  `parser_id` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `passing_test`
--

CREATE TABLE `passing_test` (
  `id` int(11) NOT NULL,
  `users_id` int(255) NOT NULL,
  `data` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `profession`
--

CREATE TABLE `profession` (
  `id` int(11) NOT NULL,
  `profession_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `profession_scale`
--

CREATE TABLE `profession_scale` (
  `id` int(11) NOT NULL,
  `scale_id` varchar(255) NOT NULL,
  `values_scale` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `test_id` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `parser_id` varchar(255) NOT NULL,
  `test_id` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `scale`
--

CREATE TABLE `scale` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `suggestion`
--

CREATE TABLE `suggestion` (
  `id` int(11) NOT NULL,
  `organizationProfession_id` varchar(255) NOT NULL,
  `result_key` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `suggest_visit`
--

CREATE TABLE `suggest_visit` (
  `id` int(11) NOT NULL,
  `organization_profession_id` varchar(255) NOT NULL,
  `result_key` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `creatorKey` varchar(255) NOT NULL,
  `testName` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `rolekey` varchar(255) NOT NULL,
  `userkey` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `organization_info`
--
ALTER TABLE `organization_info`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `organization_profession`
--
ALTER TABLE `organization_profession`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `parser`
--
ALTER TABLE `parser`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `passing_test`
--
ALTER TABLE `passing_test`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `profession`
--
ALTER TABLE `profession`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `profession_scale`
--
ALTER TABLE `profession_scale`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `scale`
--
ALTER TABLE `scale`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `suggestion`
--
ALTER TABLE `suggestion`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `suggest_visit`
--
ALTER TABLE `suggest_visit`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `organization_info`
--
ALTER TABLE `organization_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `organization_profession`
--
ALTER TABLE `organization_profession`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `parser`
--
ALTER TABLE `parser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `passing_test`
--
ALTER TABLE `passing_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `profession`
--
ALTER TABLE `profession`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `profession_scale`
--
ALTER TABLE `profession_scale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `scale`
--
ALTER TABLE `scale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `suggestion`
--
ALTER TABLE `suggestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `suggest_visit`
--
ALTER TABLE `suggest_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
