--
-- File: init.sql
-- Database Initialization Script for AHHH HA! Coffee Shop Menu
--

-- 1. DROP TABLES (Optional: Use only if tables exist and you want to reset the database)
-- SET FOREIGN_KEY_CHECKS = 0;
-- DROP TABLE IF EXISTS `OrderDetails`;
-- DROP TABLE IF EXISTS `Orders`;
-- DROP TABLE IF EXISTS `AddOns`;
-- DROP TABLE IF EXISTS `MenuPrices`;
-- DROP TABLE IF EXISTS `Menu`;
-- SET FOREIGN_KEY_CHECKS = 1;

-- **************************************
-- 2. CREATE TABLES & PRIMARY KEYS
-- **************************************

-- 2.1. Main table for all menu items (Parent Table)
CREATE TABLE `Menu` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(191) NOT NULL,
  `category` VARCHAR(50) NOT NULL, -- e.g., Coffee, Bakery, Water
  `notes` VARCHAR(191) DEFAULT NULL -- Used for fixed price items (Bakery, Water)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Define Primary Key and Auto-Increment for Menu (Must be done before creating MenuPrices)
ALTER TABLE `Menu`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `Menu`
  MODIFY `id` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

-- 2.2. Prices table for drinks (Child Table with Foreign Key)
CREATE TABLE `MenuPrices` (
  `menu_id` INT(11) NOT NULL,
  `serving_type` VARCHAR(10) NOT NULL, -- Hot, Iced, Frappe
  `price` DECIMAL(5, 2) NOT NULL,
  PRIMARY KEY (`menu_id`, `serving_type`),
  FOREIGN KEY (`menu_id`) REFERENCES `Menu`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2.3. Table for Add-ons
CREATE TABLE `AddOns` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `price` DECIMAL(5, 2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Define Primary Key and Auto-Increment for AddOns
ALTER TABLE `AddOns`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `AddOns`
  MODIFY `id` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


-- **************************************
-- 3. INSERT DATA
-- **************************************

-- 3.1. Insert into `Menu` (ID 1-33)
INSERT INTO `Menu` (`id`, `name`, `category`, `notes`) VALUES
-- Coffee 
(1, 'Americano', 'Coffee', NULL), (2, 'Latte', 'Coffee', NULL), (3, 'Es-Yen', 'Coffee', NULL), 
(4, 'Mocha', 'Coffee', NULL), (5, 'Ovaltine Mocha', 'Coffee', NULL), (6, 'Cappuccino', 'Coffee', NULL), 
(7, 'Caramel Macchiato', 'Coffee', NULL), (8, 'Hazelnut Coffee', 'Coffee', NULL), (9, 'Apple Coffee', 'Coffee', NULL), 
(10, 'Orange Coffee', 'Coffee', NULL), (11, 'Dirty', 'Coffee', NULL),
-- Non-Coffee/Soda/Matcha
(12, 'Chocolate', 'Non-Coffee', NULL), (13, 'Pinky Milk', 'Non-Coffee', NULL), (14, 'Cha-Thai', 'Non-Coffee', NULL), 
(15, 'Caramel Milk', 'Non-Coffee', NULL), (16, 'Cocoa Lava', 'Non-Coffee', NULL), (17, 'Yuzu Soda', 'Soda', NULL), 
(18, 'Leechy Soda', 'Soda', NULL), (19, 'Matcha Latte', 'Matcha', NULL),
-- Bakery 
(20, 'Almond Chocchip Cookie', 'Cookie', '49 BAHT'), (21, 'Whitechoc Cranberry Cookie', 'Cookie', '49 BAHT'), 
(22, 'Classic Chocchip Cookie', 'Cookie', '49 BAHT'), (23, 'Chocolate Lava Cookie', 'Cookie', '59 BAHT'), 
(24, 'Plain Croissant', 'Croissant', '60 BAHT'), (25, 'Danish Custard', 'Danish', '70 BAHT'), 
(26, 'Pain Au Raisin', 'Danish', '70 BAHT'), (27, 'Pain Au Chocolaté', 'Croissant', '75 BAHT'), 
(28, 'Ham & Cheese Croissant', 'Croissant', '90 BAHT'), (29, 'Almond Croissant', 'Croissant', '100 BAHT'), 
(30, 'Briache Nutella', 'Bread', '100 BAHT'), (31, 'Cinnamon Butterfly', 'Bread', '100 BAHT'),
-- Water 
(32, 'Fiji 500ml', 'Water', '89 BAHT'), (33, 'Voss 375ml', 'Water', '120 BAHT');


-- 3.2. Insert into `MenuPrices` (Drink Prices)
INSERT INTO `MenuPrices` (`menu_id`, `serving_type`, `price`) VALUES
(1, 'Hot', 65.00), (1, 'Iced', 65.00), (2, 'Hot', 70.00), (2, 'Iced', 70.00), (2, 'Frappe', 95.00),
(3, 'Iced', 70.00), (3, 'Frappe', 95.00), (4, 'Hot', 70.00), (4, 'Iced', 70.00), (4, 'Frappe', 95.00),
(5, 'Hot', 80.00), (5, 'Iced', 80.00), (5, 'Frappe', 105.00), (6, 'Hot', 85.00), (6, 'Iced', 80.00),
(7, 'Hot', 85.00), (7, 'Iced', 85.00), (7, 'Frappe', 110.00), (8, 'Hot', 85.00), (8, 'Iced', 85.00),
(8, 'Frappe', 110.00), (9, 'Iced', 85.00), (10, 'Iced', 85.00), (11, 'Iced', 125.00),
(12, 'Hot', 60.00), (12, 'Iced', 60.00), (12, 'Frappe', 85.00), (13, 'Hot', 60.00), (13, 'Iced', 60.00),
(13, 'Frappe', 85.00), (14, 'Hot', 60.00), (14, 'Iced', 60.00), (14, 'Frappe', 85.00), (15, 'Hot', 65.00),
(15, 'Iced', 65.00), (15, 'Frappe', 90.00), (16, 'Hot', 65.00), (16, 'Iced', 65.00), (16, 'Frappe', 90.00),
(17, 'Iced', 70.00), (18, 'Iced', 70.00), (19, 'Hot', 80.00), (19, 'Iced', 80.00), (19, 'Frappe', 110.00);

-- 3.3. Insert into `AddOns`
INSERT INTO `AddOns` (`id`, `name`, `price`) VALUES
(1, 'Oat milk', 15.00),
(2, 'Extra shot', 20.00),
(3, 'Matcha shot', 20.00),
(4, 'Whipped cream', 15.00);