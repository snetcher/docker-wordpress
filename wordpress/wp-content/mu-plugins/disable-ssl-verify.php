<?php
/**
 * Plugin Name: Disable SSL Verify for Localhost
 * Description: Disables SSL verification for local development on localhost.
 * Version: 1.0
 * Author: Your Name
 */

// Проверяем, что мы находимся на локальном хосте.
if (strpos($_SERVER['HTTP_HOST'], 'localhost') !== false) {
    // Отключаем верификацию SSL для REST API и loopback-запросов в WordPress.
    add_filter('https_ssl_verify', '__return_false');
    add_filter('https_local_ssl_verify', '__return_false');
}

// Отключаем верификацию SSL для всех исходящих HTTP-запросов в WordPress.
add_filter('http_request_args', function ($args, $url) {
    // Важно, что это изменение влияет на все запросы, идущие из WordPress,
    // поэтому его использование ограничено только локальной разработкой.
    $args['sslverify'] = false;
    return $args;
}, 10, 2);