-- Campus Lost & Found Management System
-- Database: lost_found_db
-- XAMPP / MariaDB compatible

CREATE DATABASE IF NOT EXISTS lost_found_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE lost_found_db;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS claims;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS users;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('user','admin') NOT NULL DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE items (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(100) NOT NULL,
    item_type ENUM('lost','found') NOT NULL,
    location VARCHAR(255) NOT NULL,
    item_date DATE NOT NULL,
    image VARCHAR(255) DEFAULT NULL,
    status ENUM('active','claimed','closed') NOT NULL DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_items_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX idx_items_user (user_id),
    INDEX idx_items_type (item_type),
    INDEX idx_items_category (category),
    INDEX idx_items_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE claims (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    item_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    message TEXT NOT NULL,
    status ENUM('pending','approved','rejected') NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_claims_item
        FOREIGN KEY (item_id) REFERENCES items(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_claims_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX idx_claims_item (item_id),
    INDEX idx_claims_user (user_id),
    INDEX idx_claims_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- No demo passwords are inserted here.
-- Register a normal account from the project first.
-- An administrator account can then be created by changing that user's
-- role from 'user' to 'admin' in phpMyAdmin.

-- Optional test item data can be added after registering a user.
-- Example:
-- INSERT INTO items
-- (user_id,title,description,category,item_type,location,item_date,status)
-- VALUES
-- (1,'Black Wallet','Black wallet lost near cafeteria','Wallet',
--  'lost','Central Cafeteria','2026-09-25','active');

-- End of database script.
