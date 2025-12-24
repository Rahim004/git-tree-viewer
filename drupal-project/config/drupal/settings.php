<?php

/**
 * Настройки базы данных для Docker
 */
$databases['default']['default'] = [
    'database' => getenv('DRUPAL_DATABASE_NAME') ?: 'drupaldb',
    'username' => getenv('DRUPAL_DATABASE_USERNAME') ?: 'drupaluser',
    'password' => getenv('DRUPAL_DATABASE_PASSWORD') ?: 'DrupalPass123!',
    'host' => getenv('DRUPAL_DATABASE_HOST') ?: 'postgres',
    'port' => getenv('DRUPAL_DATABASE_PORT') ?: '5432',
    'driver' => getenv('DRUPAL_DATABASE_DRIVER') ?: 'pgsql',
    'prefix' => '',
    'collation' => 'utf8mb4_general_ci',
];

/**
 * Соль для хэширования (уникальная для каждого сайта)
 */
$settings['hash_salt'] = 'CHANGE_THIS_TO_UNIQUE_STRING_FOR_YOUR_SITE';

/**
 * Доверенные хосты (защита от подделки заголовков Host)
 */

$settings['trusted_host_patterns'] = [
    // Локальные адреса
    '^localhost$',
    '^127\.0\.0\.1$',
    '^\[::1\]$',  
];/**
 * Пути для файлов
 */
$settings['file_public_path'] = 'sites/default/files';
$settings['file_private_path'] = '../private';
$settings['file_temp_path'] = '/tmp';

/**
 * Конфигурация синхронизации
 */
$settings['config_sync_directory'] = '../config/sync';

/**
 * Отладка (для разработки)
 */
# $config['system.logging']['error_level'] = 'verbose';
# $settings['container_yamls'][] = $app_root . '/' . $site_path . '/development.services.yml';

/**
 * Отключение кэширования для разработки
 */
# $settings['cache']['bins']['render'] = 'cache.backend.null';
# $settings['cache']['bins']['dynamic_page_cache'] = 'cache.backend.null';
# $settings['cache']['bins']['page'] = 'cache.backend.null';

/**
 * Настройки для продакшена (раскомментировать после разработки)
 */
$config['system.performance']['css']['preprocess'] = TRUE;
$config['system.performance']['js']['preprocess'] = TRUE;
$config['system.performance']['css']['gzip'] = TRUE;
$config['system.performance']['js']['gzip'] = TRUE;
$config['system.performance']['response']['gzip'] = TRUE;

/**
 * Временная зона
 */
date_default_timezone_set('Europe/Moscow');
