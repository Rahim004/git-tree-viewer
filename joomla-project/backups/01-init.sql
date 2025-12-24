-- SQL скрипт для инициализации базы данных Joomla
-- Этот скрипт выполнится автоматически при первом запуске MySQL

-- Создаем пользователя если не существует
CREATE USER IF NOT EXISTS 'joomla_user'@'%' IDENTIFIED BY 'UserPassword123!';

-- Даем все права на базу данных joomla_db
GRANT ALL PRIVILEGES ON joomla_db.* TO 'joomla_user'@'%';

-- Обновляем привилегии
FLUSH PRIVILEGES;

-- Создаем базу данных если не существует
CREATE DATABASE IF NOT EXISTS joomla_db 
  CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci;
