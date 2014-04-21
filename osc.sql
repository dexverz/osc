-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Apr 21, 2014 at 10:06 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `osc`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `action_recorder`
-- 

CREATE TABLE `action_recorder` (
  `id` int(11) NOT NULL auto_increment,
  `module` varchar(255) collate utf8_unicode_ci NOT NULL,
  `user_id` int(11) default NULL,
  `user_name` varchar(255) collate utf8_unicode_ci default NULL,
  `identifier` varchar(255) collate utf8_unicode_ci NOT NULL,
  `success` char(1) collate utf8_unicode_ci default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_action_recorder_module` (`module`),
  KEY `idx_action_recorder_user_id` (`user_id`),
  KEY `idx_action_recorder_identifier` (`identifier`),
  KEY `idx_action_recorder_date_added` (`date_added`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `action_recorder`
-- 

INSERT INTO `action_recorder` VALUES (1, 'ar_admin_login', 1, 'dexverz', '127.0.0.1', '1', '2014-04-14 22:43:51');

-- --------------------------------------------------------

-- 
-- Table structure for table `address_book`
-- 

CREATE TABLE `address_book` (
  `address_book_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `entry_gender` char(1) collate utf8_unicode_ci default NULL,
  `entry_company` varchar(255) collate utf8_unicode_ci default NULL,
  `entry_firstname` varchar(255) collate utf8_unicode_ci NOT NULL,
  `entry_lastname` varchar(255) collate utf8_unicode_ci NOT NULL,
  `entry_street_address` varchar(255) collate utf8_unicode_ci NOT NULL,
  `entry_suburb` varchar(255) collate utf8_unicode_ci default NULL,
  `entry_postcode` varchar(255) collate utf8_unicode_ci NOT NULL,
  `entry_city` varchar(255) collate utf8_unicode_ci NOT NULL,
  `entry_state` varchar(255) collate utf8_unicode_ci default NULL,
  `entry_country_id` int(11) NOT NULL default '0',
  `entry_zone_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`address_book_id`),
  KEY `idx_address_book_customers_id` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `address_book`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `address_format`
-- 

CREATE TABLE `address_format` (
  `address_format_id` int(11) NOT NULL auto_increment,
  `address_format` varchar(128) collate utf8_unicode_ci NOT NULL,
  `address_summary` varchar(48) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`address_format_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `address_format`
-- 

INSERT INTO `address_format` VALUES (1, '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country', '$city / $country');
INSERT INTO `address_format` VALUES (2, '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country', '$city, $state / $country');
INSERT INTO `address_format` VALUES (3, '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country', '$state / $country');
INSERT INTO `address_format` VALUES (4, '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country');
INSERT INTO `address_format` VALUES (5, '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country');

-- --------------------------------------------------------

-- 
-- Table structure for table `administrators`
-- 

CREATE TABLE `administrators` (
  `id` int(11) NOT NULL auto_increment,
  `user_name` varchar(255) character set utf8 collate utf8_bin NOT NULL,
  `user_password` varchar(60) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `administrators`
-- 

INSERT INTO `administrators` VALUES (1, 0x6465787665727a, '$P$D6RIHBZxdsejmvnVHY5ZERLZwXssWl/');

-- --------------------------------------------------------

-- 
-- Table structure for table `banners`
-- 

CREATE TABLE `banners` (
  `banners_id` int(11) NOT NULL auto_increment,
  `banners_title` varchar(64) collate utf8_unicode_ci NOT NULL,
  `banners_url` varchar(255) collate utf8_unicode_ci NOT NULL,
  `banners_image` varchar(64) collate utf8_unicode_ci NOT NULL,
  `banners_group` varchar(10) collate utf8_unicode_ci NOT NULL,
  `banners_html_text` text collate utf8_unicode_ci,
  `expires_impressions` int(7) default '0',
  `expires_date` datetime default NULL,
  `date_scheduled` datetime default NULL,
  `date_added` datetime NOT NULL,
  `date_status_change` datetime default NULL,
  `status` int(1) NOT NULL default '1',
  PRIMARY KEY  (`banners_id`),
  KEY `idx_banners_group` (`banners_group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `banners`
-- 

INSERT INTO `banners` VALUES (1, 'osCommerce', 'http://www.oscommerce.com', 'banners/oscommerce.gif', 'footer', '', 0, NULL, NULL, '2014-04-14 22:41:27', NULL, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `banners_history`
-- 

CREATE TABLE `banners_history` (
  `banners_history_id` int(11) NOT NULL auto_increment,
  `banners_id` int(11) NOT NULL,
  `banners_shown` int(5) NOT NULL default '0',
  `banners_clicked` int(5) NOT NULL default '0',
  `banners_history_date` datetime NOT NULL,
  PRIMARY KEY  (`banners_history_id`),
  KEY `idx_banners_history_banners_id` (`banners_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `banners_history`
-- 

INSERT INTO `banners_history` VALUES (1, 1, 1, 0, '2014-04-14 22:44:22');

-- --------------------------------------------------------

-- 
-- Table structure for table `categories`
-- 

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL auto_increment,
  `categories_image` varchar(64) collate utf8_unicode_ci default NULL,
  `parent_id` int(11) NOT NULL default '0',
  `sort_order` int(3) default NULL,
  `date_added` datetime default NULL,
  `last_modified` datetime default NULL,
  PRIMARY KEY  (`categories_id`),
  KEY `idx_categories_parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

-- 
-- Dumping data for table `categories`
-- 

INSERT INTO `categories` VALUES (32, 'ACCESSORIES.jpg', 24, 0, '2014-04-14 23:35:20', NULL);
INSERT INTO `categories` VALUES (33, 'GAMES.jpg', 24, 0, '2014-04-14 23:35:32', NULL);
INSERT INTO `categories` VALUES (34, 'SYSTEM.jpg', 24, 0, '2014-04-14 23:36:10', NULL);
INSERT INTO `categories` VALUES (35, 'ACCESSORIES.jpg', 25, 0, '2014-04-14 23:41:49', NULL);
INSERT INTO `categories` VALUES (36, 'GAMES.jpg', 25, 0, '2014-04-14 23:42:02', NULL);
INSERT INTO `categories` VALUES (37, 'SYSTEM.jpg', 25, 0, '2014-04-14 23:42:12', NULL);
INSERT INTO `categories` VALUES (31, 'SYSTEM.jpg', 23, 0, '2014-04-14 23:16:22', NULL);
INSERT INTO `categories` VALUES (29, 'ACCESSORIES.jpg', 23, 0, '2014-04-14 23:15:59', NULL);
INSERT INTO `categories` VALUES (30, 'GAMES.jpg', 23, 0, '2014-04-14 23:16:09', NULL);
INSERT INTO `categories` VALUES (23, NULL, 0, 0, '2014-04-14 23:00:06', NULL);
INSERT INTO `categories` VALUES (24, NULL, 0, 0, '2014-04-14 23:00:50', NULL);
INSERT INTO `categories` VALUES (25, NULL, 0, 0, '2014-04-14 23:00:59', NULL);
INSERT INTO `categories` VALUES (26, 'zapak-playfect-gaming-accessories.jpg', 22, 0, '2014-04-14 23:01:19', '2014-04-14 23:07:04');
INSERT INTO `categories` VALUES (27, '5271d2f5697ab01bf3002d97._w.540_s.fit_.jpg', 22, 0, '2014-04-14 23:01:28', '2014-04-14 23:09:46');
INSERT INTO `categories` VALUES (28, 'GameConsoleRepair_wenbsite.jpg', 22, 0, '2014-04-14 23:01:35', '2014-04-14 23:10:53');
INSERT INTO `categories` VALUES (22, NULL, 0, 0, '2014-04-14 22:59:52', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `categories_description`
-- 

CREATE TABLE `categories_description` (
  `categories_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `categories_name` varchar(32) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`categories_id`,`language_id`),
  KEY `idx_categories_name` (`categories_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `categories_description`
-- 

INSERT INTO `categories_description` VALUES (34, 2, 'System Console');
INSERT INTO `categories_description` VALUES (30, 1, 'Games');
INSERT INTO `categories_description` VALUES (29, 1, 'Accesories');
INSERT INTO `categories_description` VALUES (32, 1, 'Accesories');
INSERT INTO `categories_description` VALUES (31, 1, 'System');
INSERT INTO `categories_description` VALUES (33, 1, 'Games');
INSERT INTO `categories_description` VALUES (29, 2, 'Accesories');
INSERT INTO `categories_description` VALUES (27, 1, 'Games');
INSERT INTO `categories_description` VALUES (28, 2, 'System');
INSERT INTO `categories_description` VALUES (24, 1, 'Playstation 4');
INSERT INTO `categories_description` VALUES (25, 2, 'Playstation Vita');
INSERT INTO `categories_description` VALUES (25, 1, 'Playstation Vita');
INSERT INTO `categories_description` VALUES (26, 2, 'Accesories');
INSERT INTO `categories_description` VALUES (30, 2, 'Games');
INSERT INTO `categories_description` VALUES (32, 2, 'Accesories');
INSERT INTO `categories_description` VALUES (31, 2, 'System');
INSERT INTO `categories_description` VALUES (33, 2, 'Games');
INSERT INTO `categories_description` VALUES (28, 1, 'System');
INSERT INTO `categories_description` VALUES (26, 1, 'Accesories');
INSERT INTO `categories_description` VALUES (27, 2, 'Games');
INSERT INTO `categories_description` VALUES (22, 1, 'Nintendo 3DS');
INSERT INTO `categories_description` VALUES (23, 2, 'Nintendo Wii U');
INSERT INTO `categories_description` VALUES (23, 1, 'Nintendo Wii U');
INSERT INTO `categories_description` VALUES (24, 2, 'Playstation 4');
INSERT INTO `categories_description` VALUES (22, 2, 'Nintendo 3DS');
INSERT INTO `categories_description` VALUES (34, 1, 'System Console');
INSERT INTO `categories_description` VALUES (35, 2, 'Accesories');
INSERT INTO `categories_description` VALUES (35, 1, 'Accesories');
INSERT INTO `categories_description` VALUES (36, 2, 'Games');
INSERT INTO `categories_description` VALUES (36, 1, 'Games');
INSERT INTO `categories_description` VALUES (37, 2, 'System');
INSERT INTO `categories_description` VALUES (37, 1, 'System');

-- --------------------------------------------------------

-- 
-- Table structure for table `configuration`
-- 

CREATE TABLE `configuration` (
  `configuration_id` int(11) NOT NULL auto_increment,
  `configuration_title` varchar(255) collate utf8_unicode_ci NOT NULL,
  `configuration_key` varchar(255) collate utf8_unicode_ci NOT NULL,
  `configuration_value` text collate utf8_unicode_ci NOT NULL,
  `configuration_description` varchar(255) collate utf8_unicode_ci NOT NULL,
  `configuration_group_id` int(11) NOT NULL,
  `sort_order` int(5) default NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  `use_function` varchar(255) collate utf8_unicode_ci default NULL,
  `set_function` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`configuration_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=265 ;

-- 
-- Dumping data for table `configuration`
-- 

INSERT INTO `configuration` VALUES (1, 'Store Name', 'STORE_NAME', 'Toko Semprul', 'The name of my store', 1, 1, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (2, 'Store Owner', 'STORE_OWNER', 'Bagus Prio', 'The name of my store owner', 1, 2, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (3, 'E-Mail Address', 'STORE_OWNER_EMAIL_ADDRESS', 'dexverz@gmail.com', 'The e-mail address of my store owner', 1, 3, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (4, 'E-Mail From', 'EMAIL_FROM', '"Bagus Prio" <dexverz@gmail.com>', 'The e-mail address used in (sent) e-mails', 1, 4, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (5, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br /><br /><strong>Note: Please remember to update the store zone.</strong>', 1, 6, NULL, '2014-04-14 22:41:27', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO `configuration` VALUES (6, 'Zone', 'STORE_ZONE', '18', 'The zone my store is located in', 1, 7, NULL, '2014-04-14 22:41:27', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list(');
INSERT INTO `configuration` VALUES (7, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''asc'', ''desc''), ');
INSERT INTO `configuration` VALUES (8, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''products_name'', ''date_expected''), ');
INSERT INTO `configuration` VALUES (9, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language''s currency when it is changed', 1, 10, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (10, 'Send Extra Order Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 1, 11, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (11, 'Use Search-Engine Safe URLs', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 1, 12, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (12, 'Display Cart After Adding Product', 'DISPLAY_CART', 'true', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (13, 'Allow Guest To Tell A Friend', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Allow guests to tell a friend about a product', 1, 15, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (14, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''and'', ''or''), ');
INSERT INTO `configuration` VALUES (15, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Store Name\nAddress\nCountry\nPhone', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 18, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_textarea(');
INSERT INTO `configuration` VALUES (16, 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', 1, 19, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (17, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (18, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (19, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (20, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (21, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (22, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (23, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (24, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Minimum length of company name', 2, 6, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (25, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (26, 'City', 'ENTRY_CITY_MIN_LENGTH', '3', 'Minimum length of city', 2, 8, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (27, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (28, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (29, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Minimum length of password', 2, 11, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (30, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (31, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (32, 'Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of review text', 2, 14, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (33, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (34, 'Also Purchased', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the ''This Customer Also Purchased'' box', 2, 16, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (35, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (36, 'Search Results', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Amount of products to list', 3, 2, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (37, 'Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of ''number'' links use for page-sets', 3, 3, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (38, 'Special Products', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Maximum number of products on special to display', 3, 4, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (39, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Maximum number of new products to display in a category', 3, 5, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (40, 'Products Expected', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Maximum number of products expected to display', 3, 6, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (41, 'Manufacturers List', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list', 3, 7, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (42, 'Manufacturers Select Size', 'MAX_MANUFACTURERS_LIST', '1', 'Used in manufacturers box; when this value is ''1'' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.', 3, 7, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (43, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display', 3, 8, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (44, 'New Reviews', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Maximum number of new reviews to display', 3, 9, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (45, 'Selection of Random Reviews', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'How many records to select from to choose one random product review', 3, 10, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (46, 'Selection of Random New Products', 'MAX_RANDOM_SELECT_NEW', '10', 'How many records to select from to choose one random new product to display', 3, 11, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (47, 'Selection of Products on Special', 'MAX_RANDOM_SELECT_SPECIALS', '10', 'How many records to select from to choose one random product special to display', 3, 12, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (48, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', 3, 13, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (49, 'New Products Listing', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Maximum number of new products to display in new products page', 3, 14, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (50, 'Best Sellers', 'MAX_DISPLAY_BESTSELLERS', '10', 'Maximum number of best sellers to display', 3, 15, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (51, 'Also Purchased', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Maximum number of products to display in the ''This Customer Also Purchased'' box', 3, 16, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (52, 'Customer Order History Box', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Maximum number of products to display in the customer order history box', 3, 17, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (53, 'Order History', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Maximum number of orders to display in the order history page', 3, 18, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (54, 'Product Quantities In Shopping Cart', 'MAX_QTY_IN_CART', '99', 'Maximum number of product quantities that can be added to the shopping cart (0 for no limit)', 3, 19, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (55, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '100', 'The pixel width of small images', 4, 1, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (56, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '80', 'The pixel height of small images', 4, 2, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (57, 'Heading Image Width', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images', 4, 3, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (58, 'Heading Image Height', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images', 4, 4, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (59, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', 4, 5, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (60, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'The pixel height of subcategory images', 4, 6, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (61, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', 4, 7, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (62, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (63, 'Gender', 'ACCOUNT_GENDER', 'true', 'Display gender in the customers account', 5, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (64, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth in the customers account', 5, 2, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (65, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company in the customers account', 5, 3, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (66, 'Suburb', 'ACCOUNT_SUBURB', 'true', 'Display suburb in the customers account', 5, 4, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (67, 'State', 'ACCOUNT_STATE', 'true', 'Display state in the customers account', 5, 5, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (68, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'cod.php;paypal_express.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cod.php;paypal_express.php)', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (69, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (70, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (71, 'Installed Modules', 'MODULE_ACTION_RECORDER_INSTALLED', 'ar_admin_login.php;ar_contact_us.php;ar_reset_password.php;ar_tell_a_friend.php', 'List of action recorder module filenames separated by a semi-colon. This is automatically updated. No need to edit.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (72, 'Installed Modules', 'MODULE_SOCIAL_BOOKMARKS_INSTALLED', 'sb_email.php;sb_facebook.php;sb_google_plus_share.php;sb_pinterest.php;sb_twitter.php', 'List of social bookmark module filenames separated by a semi-colon. This is automatically updated. No need to edit.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (73, 'Enable Cash On Delivery Module', 'MODULE_PAYMENT_COD_STATUS', 'True', 'Do you want to accept Cash On Delevery payments?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (74, 'Payment Zone', 'MODULE_PAYMENT_COD_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2014-04-14 22:41:27', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO `configuration` VALUES (75, 'Sort order of display.', 'MODULE_PAYMENT_COD_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (76, 'Set Order Status', 'MODULE_PAYMENT_COD_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2014-04-14 22:41:27', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO `configuration` VALUES (77, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (78, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (79, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2014-04-14 22:41:27', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
INSERT INTO `configuration` VALUES (80, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2014-04-14 22:41:27', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO `configuration` VALUES (81, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (82, 'Default Currency', 'DEFAULT_CURRENCY', 'IDR', 'Default Currency', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (83, 'Default Language', 'DEFAULT_LANGUAGE', 'id', 'Default Language', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (84, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (85, 'Display Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Do you want to display the order shipping cost?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (86, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '2', 'Sort order of display.', 6, 2, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (87, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (88, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2014-04-14 22:41:27', 'currencies->format', NULL);
INSERT INTO `configuration` VALUES (89, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''national'', ''international'', ''both''), ');
INSERT INTO `configuration` VALUES (90, 'Display Sub-Total', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Do you want to display the order sub-total cost?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (91, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Sort order of display.', 6, 2, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (92, 'Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Do you want to display the order tax value?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (93, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Sort order of display.', 6, 2, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (94, 'Display Total', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Do you want to display the total order value?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (95, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '4', 'Sort order of display.', 6, 2, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (96, 'Minimum Minutes Per E-Mail', 'MODULE_ACTION_RECORDER_CONTACT_US_EMAIL_MINUTES', '15', 'Minimum number of minutes to allow 1 e-mail to be sent (eg, 15 for 1 e-mail every 15 minutes)', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (97, 'Minimum Minutes Per E-Mail', 'MODULE_ACTION_RECORDER_TELL_A_FRIEND_EMAIL_MINUTES', '15', 'Minimum number of minutes to allow 1 e-mail to be sent (eg, 15 for 1 e-mail every 15 minutes)', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (98, 'Allowed Minutes', 'MODULE_ACTION_RECORDER_ADMIN_LOGIN_MINUTES', '5', 'Number of minutes to allow login attempts to occur.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (99, 'Allowed Attempts', 'MODULE_ACTION_RECORDER_ADMIN_LOGIN_ATTEMPTS', '3', 'Number of login attempts to allow within the specified period.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (100, 'Allowed Minutes', 'MODULE_ACTION_RECORDER_RESET_PASSWORD_MINUTES', '5', 'Number of minutes to allow password resets to occur.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (101, 'Allowed Attempts', 'MODULE_ACTION_RECORDER_RESET_PASSWORD_ATTEMPTS', '1', 'Number of password reset attempts to allow within the specified period.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (102, 'Enable E-Mail Module', 'MODULE_SOCIAL_BOOKMARKS_EMAIL_STATUS', 'True', 'Do you want to allow products to be shared through e-mail?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (103, 'Sort Order', 'MODULE_SOCIAL_BOOKMARKS_EMAIL_SORT_ORDER', '10', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (104, 'Enable Google+ Share Module', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_STATUS', 'True', 'Do you want to allow products to be shared through Google+?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (105, 'Annotation', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_ANNOTATION', 'None', 'The annotation to display next to the button.', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Inline'', ''Bubble'', ''Vertical-Bubble'', ''None''), ');
INSERT INTO `configuration` VALUES (106, 'Width', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_WIDTH', '', 'The maximum width of the button.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (107, 'Height', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_HEIGHT', '15', 'Sets the height of the button.', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''15'', ''20'', ''24'', ''60''), ');
INSERT INTO `configuration` VALUES (108, 'Alignment', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_ALIGN', 'Left', 'The alignment of the button assets.', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left'', ''Right''), ');
INSERT INTO `configuration` VALUES (109, 'Sort Order', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_SORT_ORDER', '20', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (110, 'Enable Facebook Module', 'MODULE_SOCIAL_BOOKMARKS_FACEBOOK_STATUS', 'True', 'Do you want to allow products to be shared through Facebook?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (111, 'Sort Order', 'MODULE_SOCIAL_BOOKMARKS_FACEBOOK_SORT_ORDER', '30', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (112, 'Enable Twitter Module', 'MODULE_SOCIAL_BOOKMARKS_TWITTER_STATUS', 'True', 'Do you want to allow products to be shared through Twitter?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (113, 'Sort Order', 'MODULE_SOCIAL_BOOKMARKS_TWITTER_SORT_ORDER', '40', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (114, 'Enable Pinterest Module', 'MODULE_SOCIAL_BOOKMARKS_PINTEREST_STATUS', 'True', 'Do you want to allow Pinterest Button?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (115, 'Layout Position', 'MODULE_SOCIAL_BOOKMARKS_PINTEREST_BUTTON_COUNT_POSITION', 'None', 'Horizontal or Vertical or None', 6, 2, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Horizontal'', ''Vertical'', ''None''), ');
INSERT INTO `configuration` VALUES (116, 'Sort Order', 'MODULE_SOCIAL_BOOKMARKS_PINTEREST_SORT_ORDER', '50', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (117, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2014-04-14 22:41:27', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO `configuration` VALUES (118, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.', 7, 2, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (119, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (120, 'Package Tare weight.', 'SHIPPING_BOX_WEIGHT', '3', 'What is the weight of typical packaging of small to medium packages?', 7, 4, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (121, 'Larger packages - percentage increase.', 'SHIPPING_BOX_PADDING', '10', 'For 10% enter 10', 7, 5, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (122, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (123, 'Display Product Manufacturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (124, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (125, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (126, 'Display Product Price', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price', 8, 5, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (127, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (128, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (129, 'Display Buy Now column', 'PRODUCT_LIST_BUY_NOW', '4', 'Do you want to display the Buy Now column?', 8, 8, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (130, 'Display Category/Manufacturer Filter (0=disable; 1=enable)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (131, 'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '2', 'Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 8, 10, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (132, 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', 9, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (133, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (134, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (135, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (136, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (137, 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', 10, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (138, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (139, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (140, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'true', 'Display the page parse time (store page parse time must be enabled)', 10, 4, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (141, 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log', 10, 5, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (142, 'Use Cache', 'USE_CACHE', 'false', 'Use caching features', 11, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (143, 'Cache Directory', 'DIR_FS_CACHE', 'D:/AppServ/www/osc/catalog/includes/work/', 'The directory where the cached files are saved', 11, 2, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (144, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'sendmail', 'Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.', 12, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''sendmail'', ''smtp''),');
INSERT INTO `configuration` VALUES (145, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''LF'', ''CRLF''),');
INSERT INTO `configuration` VALUES (146, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', 12, 3, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''),');
INSERT INTO `configuration` VALUES (147, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 12, 4, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (148, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (149, 'Enable download', 'DOWNLOAD_ENABLED', 'false', 'Enable the products download functions.', 13, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (150, 'Download by redirect', 'DOWNLOAD_BY_REDIRECT', 'false', 'Use browser redirection for download. Disable on non-Unix systems.', 13, 2, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (151, 'Expiry delay (days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2014-04-14 22:41:27', NULL, '');
INSERT INTO `configuration` VALUES (152, 'Maximum number of downloads', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2014-04-14 22:41:27', NULL, '');
INSERT INTO `configuration` VALUES (153, 'Enable GZip Compression', 'GZIP_COMPRESSION', 'false', 'Enable HTTP GZip compression.', 14, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` VALUES (154, 'Compression Level', 'GZIP_LEVEL', '5', 'Use this compression level 0-9 (0 = minimum, 9 = maximum).', 14, 2, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (155, 'Session Directory', 'SESSION_WRITE_DIRECTORY', 'D:/AppServ/www/osc/catalog/includes/work/', 'If sessions are file based, store them in this directory.', 15, 1, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (156, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (157, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (158, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (159, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (160, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'True', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (161, 'Recreate Session', 'SESSION_RECREATE', 'True', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (162, 'Last Update Check Time', 'LAST_UPDATE_CHECK_TIME', '', 'Last time a check for new versions of osCommerce was run', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (163, 'Enable PayPal Express Checkout', 'MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS', 'True', 'Do you want to accept PayPal Express Checkout payments?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (164, 'Seller Account', 'MODULE_PAYMENT_PAYPAL_EXPRESS_SELLER_ACCOUNT', 'dexverz@gmail.com', 'The email address of the seller account if no API credentials has been setup.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (165, 'API Username', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME', '', 'The username to use for the PayPal API service', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (166, 'API Password', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD', '', 'The password to use for the PayPal API service', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (167, 'API Signature', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE', '', 'The signature to use for the PayPal API service', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (168, 'Transaction Server', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER', 'Live', 'Use the live or testing (sandbox) gateway server to process transactions?', 6, 0, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Live'', ''Sandbox''), ');
INSERT INTO `configuration` VALUES (169, 'Transaction Method', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD', 'Sale', 'The processing method to use for each transaction.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Authorization'', ''Sale''), ');
INSERT INTO `configuration` VALUES (170, 'PayPal Account Optional', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ACCOUNT_OPTIONAL', 'False', 'This must also be enabled in your PayPal account, in Profile > Website Payment Preferences.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (171, 'PayPal Instant Update', 'MODULE_PAYMENT_PAYPAL_EXPRESS_INSTANT_UPDATE', 'True', 'Support PayPal shipping and tax calculations on the PayPal.com site during Express Checkout.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (172, 'PayPal Checkout Image', 'MODULE_PAYMENT_PAYPAL_EXPRESS_CHECKOUT_IMAGE', 'Static', 'Use static or dynamic Express Checkout image buttons. Dynamic images are used with PayPal campaigns.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Static'', ''Dynamic''), ');
INSERT INTO `configuration` VALUES (173, 'Debug E-Mail Address', 'MODULE_PAYMENT_PAYPAL_EXPRESS_DEBUG_EMAIL', '', 'All parameters of an invalid transaction will be sent to this email address.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (174, 'Payment Zone', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2014-04-14 22:41:27', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO `configuration` VALUES (175, 'Sort order of display.', 'MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (176, 'Set Order Status', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2014-04-14 22:41:27', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO `configuration` VALUES (177, 'PayPal Transactions Order Status Level', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTIONS_ORDER_STATUS_ID', '4', 'Include PayPal transaction information in this order status level', 6, 0, NULL, '2014-04-14 22:41:27', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO `configuration` VALUES (178, 'cURL Program Location', 'MODULE_PAYMENT_PAYPAL_EXPRESS_CURL', '/usr/bin/curl', 'The location to the cURL program application.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (179, 'Installed Modules', 'MODULE_HEADER_TAGS_INSTALLED', 'ht_canonical.php;ht_manufacturer_title.php;ht_category_title.php;ht_product_title.php;ht_robot_noindex.php', 'List of header tag module filenames separated by a semi-colon. This is automatically updated. No need to edit.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (180, 'Enable Category Title Module', 'MODULE_HEADER_TAGS_CATEGORY_TITLE_STATUS', 'True', 'Do you want to allow category titles to be added to the page title?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (181, 'Sort Order', 'MODULE_HEADER_TAGS_CATEGORY_TITLE_SORT_ORDER', '200', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (182, 'Enable Manufacturer Title Module', 'MODULE_HEADER_TAGS_MANUFACTURER_TITLE_STATUS', 'True', 'Do you want to allow manufacturer titles to be added to the page title?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (183, 'Sort Order', 'MODULE_HEADER_TAGS_MANUFACTURER_TITLE_SORT_ORDER', '100', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (184, 'Enable Product Title Module', 'MODULE_HEADER_TAGS_PRODUCT_TITLE_STATUS', 'True', 'Do you want to allow product titles to be added to the page title?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (185, 'Sort Order', 'MODULE_HEADER_TAGS_PRODUCT_TITLE_SORT_ORDER', '300', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (186, 'Enable Canonical Module', 'MODULE_HEADER_TAGS_CANONICAL_STATUS', 'True', 'Do you want to enable the Canonical module?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (187, 'Sort Order', 'MODULE_HEADER_TAGS_CANONICAL_SORT_ORDER', '400', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (188, 'Enable Robot NoIndex Module', 'MODULE_HEADER_TAGS_ROBOT_NOINDEX_STATUS', 'True', 'Do you want to enable the Robot NoIndex module?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (189, 'Pages', 'MODULE_HEADER_TAGS_ROBOT_NOINDEX_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_process.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;cookie_usage.php;create_account.php;create_account_success.php;login.php;logoff.php;password_forgotten.php;password_reset.php;product_reviews_write.php;shopping_cart.php;ssl_check.php;tell_a_friend.php', 'The pages to add the meta robot noindex tag to.', 6, 0, NULL, '2014-04-14 22:41:27', 'ht_robot_noindex_show_pages', 'ht_robot_noindex_edit_pages(');
INSERT INTO `configuration` VALUES (190, 'Sort Order', 'MODULE_HEADER_TAGS_ROBOT_NOINDEX_SORT_ORDER', '500', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (191, 'Installed Modules', 'MODULE_ADMIN_DASHBOARD_INSTALLED', 'd_total_revenue.php;d_total_customers.php;d_orders.php;d_customers.php;d_admin_logins.php;d_security_checks.php;d_latest_news.php;d_latest_addons.php;d_partner_news.php;d_version_check.php;d_reviews.php', 'List of Administration Tool Dashboard module filenames separated by a semi-colon. This is automatically updated. No need to edit.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (192, 'Enable Administrator Logins Module', 'MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_STATUS', 'True', 'Do you want to show the latest administrator logins on the dashboard?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (193, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_SORT_ORDER', '500', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (194, 'Enable Customers Module', 'MODULE_ADMIN_DASHBOARD_CUSTOMERS_STATUS', 'True', 'Do you want to show the newest customers on the dashboard?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (195, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_CUSTOMERS_SORT_ORDER', '400', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (196, 'Enable Latest Add-Ons Module', 'MODULE_ADMIN_DASHBOARD_LATEST_ADDONS_STATUS', 'True', 'Do you want to show the latest osCommerce Add-Ons on the dashboard?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (197, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_LATEST_ADDONS_SORT_ORDER', '800', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (198, 'Enable Latest News Module', 'MODULE_ADMIN_DASHBOARD_LATEST_NEWS_STATUS', 'True', 'Do you want to show the latest osCommerce News on the dashboard?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (199, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_LATEST_NEWS_SORT_ORDER', '700', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (200, 'Enable Orders Module', 'MODULE_ADMIN_DASHBOARD_ORDERS_STATUS', 'True', 'Do you want to show the latest orders on the dashboard?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (201, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_ORDERS_SORT_ORDER', '300', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (202, 'Enable Security Checks Module', 'MODULE_ADMIN_DASHBOARD_SECURITY_CHECKS_STATUS', 'True', 'Do you want to run the security checks for this installation?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (203, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_SECURITY_CHECKS_SORT_ORDER', '600', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (204, 'Enable Total Customers Module', 'MODULE_ADMIN_DASHBOARD_TOTAL_CUSTOMERS_STATUS', 'True', 'Do you want to show the total customers chart on the dashboard?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (205, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_TOTAL_CUSTOMERS_SORT_ORDER', '200', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (206, 'Enable Total Revenue Module', 'MODULE_ADMIN_DASHBOARD_TOTAL_REVENUE_STATUS', 'True', 'Do you want to show the total revenue chart on the dashboard?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (207, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_TOTAL_REVENUE_SORT_ORDER', '100', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (208, 'Enable Version Check Module', 'MODULE_ADMIN_DASHBOARD_VERSION_CHECK_STATUS', 'True', 'Do you want to show the version check results on the dashboard?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (209, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_VERSION_CHECK_SORT_ORDER', '900', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (210, 'Enable Latest Reviews Module', 'MODULE_ADMIN_DASHBOARD_REVIEWS_STATUS', 'True', 'Do you want to show the latest reviews on the dashboard?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (211, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_REVIEWS_SORT_ORDER', '1000', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (212, 'Enable Partner News Module', 'MODULE_ADMIN_DASHBOARD_PARTNER_NEWS_STATUS', 'True', 'Do you want to show the latest osCommerce Partner News on the dashboard?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (213, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_PARTNER_NEWS_SORT_ORDER', '820', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (214, 'Installed Modules', 'MODULE_BOXES_INSTALLED', 'bm_categories.php;bm_manufacturers.php;bm_search.php;bm_whats_new.php;bm_information.php;bm_shopping_cart.php;bm_manufacturer_info.php;bm_order_history.php;bm_best_sellers.php;bm_product_notifications.php;bm_product_social_bookmarks.php;bm_specials.php;bm_reviews.php;bm_languages.php;bm_currencies.php', 'List of box module filenames separated by a semi-colon. This is automatically updated. No need to edit.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (215, 'Enable Best Sellers Module', 'MODULE_BOXES_BEST_SELLERS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (216, 'Content Placement', 'MODULE_BOXES_BEST_SELLERS_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), ');
INSERT INTO `configuration` VALUES (217, 'Sort Order', 'MODULE_BOXES_BEST_SELLERS_SORT_ORDER', '5030', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (218, 'Enable Categories Module', 'MODULE_BOXES_CATEGORIES_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (219, 'Content Placement', 'MODULE_BOXES_CATEGORIES_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), ');
INSERT INTO `configuration` VALUES (220, 'Sort Order', 'MODULE_BOXES_CATEGORIES_SORT_ORDER', '1000', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (221, 'Enable Currencies Module', 'MODULE_BOXES_CURRENCIES_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (222, 'Content Placement', 'MODULE_BOXES_CURRENCIES_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), ');
INSERT INTO `configuration` VALUES (223, 'Sort Order', 'MODULE_BOXES_CURRENCIES_SORT_ORDER', '5090', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (224, 'Enable Information Module', 'MODULE_BOXES_INFORMATION_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (225, 'Content Placement', 'MODULE_BOXES_INFORMATION_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), ');
INSERT INTO `configuration` VALUES (226, 'Sort Order', 'MODULE_BOXES_INFORMATION_SORT_ORDER', '1050', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (227, 'Enable Languages Module', 'MODULE_BOXES_LANGUAGES_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (228, 'Content Placement', 'MODULE_BOXES_LANGUAGES_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), ');
INSERT INTO `configuration` VALUES (229, 'Sort Order', 'MODULE_BOXES_LANGUAGES_SORT_ORDER', '5080', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (230, 'Enable Manufacturer Info Module', 'MODULE_BOXES_MANUFACTURER_INFO_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (231, 'Content Placement', 'MODULE_BOXES_MANUFACTURER_INFO_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), ');
INSERT INTO `configuration` VALUES (232, 'Sort Order', 'MODULE_BOXES_MANUFACTURER_INFO_SORT_ORDER', '5010', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (233, 'Enable Manufacturers Module', 'MODULE_BOXES_MANUFACTURERS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (234, 'Content Placement', 'MODULE_BOXES_MANUFACTURERS_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), ');
INSERT INTO `configuration` VALUES (235, 'Sort Order', 'MODULE_BOXES_MANUFACTURERS_SORT_ORDER', '1020', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (236, 'Enable Order History Module', 'MODULE_BOXES_ORDER_HISTORY_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (237, 'Content Placement', 'MODULE_BOXES_ORDER_HISTORY_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), ');
INSERT INTO `configuration` VALUES (238, 'Sort Order', 'MODULE_BOXES_ORDER_HISTORY_SORT_ORDER', '5020', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (239, 'Enable Product Notifications Module', 'MODULE_BOXES_PRODUCT_NOTIFICATIONS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (240, 'Content Placement', 'MODULE_BOXES_PRODUCT_NOTIFICATIONS_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), ');
INSERT INTO `configuration` VALUES (241, 'Sort Order', 'MODULE_BOXES_PRODUCT_NOTIFICATIONS_SORT_ORDER', '5040', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (242, 'Enable Product Social Bookmarks Module', 'MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (243, 'Content Placement', 'MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), ');
INSERT INTO `configuration` VALUES (244, 'Sort Order', 'MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_SORT_ORDER', '5050', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (245, 'Enable Reviews Module', 'MODULE_BOXES_REVIEWS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (246, 'Content Placement', 'MODULE_BOXES_REVIEWS_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), ');
INSERT INTO `configuration` VALUES (247, 'Sort Order', 'MODULE_BOXES_REVIEWS_SORT_ORDER', '5070', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (248, 'Enable Search Module', 'MODULE_BOXES_SEARCH_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (249, 'Content Placement', 'MODULE_BOXES_SEARCH_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), ');
INSERT INTO `configuration` VALUES (250, 'Sort Order', 'MODULE_BOXES_SEARCH_SORT_ORDER', '1030', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (251, 'Enable Shopping Cart Module', 'MODULE_BOXES_SHOPPING_CART_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (252, 'Content Placement', 'MODULE_BOXES_SHOPPING_CART_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), ');
INSERT INTO `configuration` VALUES (253, 'Sort Order', 'MODULE_BOXES_SHOPPING_CART_SORT_ORDER', '5000', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (254, 'Enable Specials Module', 'MODULE_BOXES_SPECIALS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (255, 'Content Placement', 'MODULE_BOXES_SPECIALS_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), ');
INSERT INTO `configuration` VALUES (256, 'Sort Order', 'MODULE_BOXES_SPECIALS_SORT_ORDER', '5060', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (257, 'Enable What''s New Module', 'MODULE_BOXES_WHATS_NEW_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `configuration` VALUES (258, 'Content Placement', 'MODULE_BOXES_WHATS_NEW_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-04-14 22:41:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), ');
INSERT INTO `configuration` VALUES (259, 'Sort Order', 'MODULE_BOXES_WHATS_NEW_SORT_ORDER', '1040', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (260, 'Installed Template Block Groups', 'TEMPLATE_BLOCK_GROUPS', 'boxes;header_tags', 'This is automatically updated. No need to edit.', 6, 0, NULL, '2014-04-14 22:41:27', NULL, NULL);
INSERT INTO `configuration` VALUES (261, 'Display Featured Products', 'FEATURED_PRODUCTS_DISPLAY', 'true', 'Set to true or false in order to display featured.', 18, 1, '2014-04-14 22:44:18', '2014-04-14 22:44:18', NULL, 'tep_cfg_select_option(array(''true'', ''false''),');
INSERT INTO `configuration` VALUES (262, 'Maximum Display of Featured', 'MAX_DISPLAY_FEATURED_PRODUCTS', '6', 'This is the maximum amount of items to display on the front page.', 18, 2, '2014-04-14 22:44:18', '2014-04-14 22:44:18', NULL, NULL);
INSERT INTO `configuration` VALUES (263, 'Include Sub Categories When Displaying Featured Products', 'FEATURED_PRODUCTS_SUB_CATEGORIES', 'true', 'Set to true or false in order to display featured including sub categories.', 18, 3, '2014-04-14 22:44:18', '2014-04-14 22:44:18', NULL, 'tep_cfg_select_option(array(''true'', ''false''),');
INSERT INTO `configuration` VALUES (264, 'Specials Only When Displaying Featured Products', 'FEATURED_PRODUCTS_SPECIALS_ONLY', 'false', 'Set to true or false in order to display only on special featured products.', 18, 4, '2014-04-14 22:44:18', '2014-04-14 22:44:18', NULL, 'tep_cfg_select_option(array(''true'', ''false''),');

-- --------------------------------------------------------

-- 
-- Table structure for table `configuration_group`
-- 

CREATE TABLE `configuration_group` (
  `configuration_group_id` int(11) NOT NULL auto_increment,
  `configuration_group_title` varchar(64) collate utf8_unicode_ci NOT NULL,
  `configuration_group_description` varchar(255) collate utf8_unicode_ci NOT NULL,
  `sort_order` int(5) default NULL,
  `visible` int(1) default '1',
  PRIMARY KEY  (`configuration_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

-- 
-- Dumping data for table `configuration_group`
-- 

INSERT INTO `configuration_group` VALUES (1, 'My Store', 'General information about my store', 1, 1);
INSERT INTO `configuration_group` VALUES (2, 'Minimum Values', 'The minimum values for functions / data', 2, 1);
INSERT INTO `configuration_group` VALUES (3, 'Maximum Values', 'The maximum values for functions / data', 3, 1);
INSERT INTO `configuration_group` VALUES (4, 'Images', 'Image parameters', 4, 1);
INSERT INTO `configuration_group` VALUES (5, 'Customer Details', 'Customer account configuration', 5, 1);
INSERT INTO `configuration_group` VALUES (6, 'Module Options', 'Hidden from configuration', 6, 0);
INSERT INTO `configuration_group` VALUES (7, 'Shipping/Packaging', 'Shipping options available at my store', 7, 1);
INSERT INTO `configuration_group` VALUES (8, 'Product Listing', 'Product Listing    configuration options', 8, 1);
INSERT INTO `configuration_group` VALUES (9, 'Stock', 'Stock configuration options', 9, 1);
INSERT INTO `configuration_group` VALUES (10, 'Logging', 'Logging configuration options', 10, 1);
INSERT INTO `configuration_group` VALUES (11, 'Cache', 'Caching configuration options', 11, 1);
INSERT INTO `configuration_group` VALUES (12, 'E-Mail Options', 'General setting for E-Mail transport and HTML E-Mails', 12, 1);
INSERT INTO `configuration_group` VALUES (13, 'Download', 'Downloadable products options', 13, 1);
INSERT INTO `configuration_group` VALUES (14, 'GZip Compression', 'GZip compression options', 14, 1);
INSERT INTO `configuration_group` VALUES (15, 'Sessions', 'Session options', 15, 1);
INSERT INTO `configuration_group` VALUES (18, 'Featured', 'Featured Products Display', 18, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `counter`
-- 

CREATE TABLE `counter` (
  `startdate` char(8) collate utf8_unicode_ci default NULL,
  `counter` int(12) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `counter`
-- 

INSERT INTO `counter` VALUES ('20140414', 115);

-- --------------------------------------------------------

-- 
-- Table structure for table `counter_history`
-- 

CREATE TABLE `counter_history` (
  `month` char(8) collate utf8_unicode_ci default NULL,
  `counter` int(12) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `counter_history`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `countries`
-- 

CREATE TABLE `countries` (
  `countries_id` int(11) NOT NULL auto_increment,
  `countries_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `countries_iso_code_2` char(2) collate utf8_unicode_ci NOT NULL,
  `countries_iso_code_3` char(3) collate utf8_unicode_ci NOT NULL,
  `address_format_id` int(11) NOT NULL,
  PRIMARY KEY  (`countries_id`),
  KEY `IDX_COUNTRIES_NAME` (`countries_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=240 ;

-- 
-- Dumping data for table `countries`
-- 

INSERT INTO `countries` VALUES (1, 'Afghanistan', 'AF', 'AFG', 1);
INSERT INTO `countries` VALUES (2, 'Albania', 'AL', 'ALB', 1);
INSERT INTO `countries` VALUES (3, 'Algeria', 'DZ', 'DZA', 1);
INSERT INTO `countries` VALUES (4, 'American Samoa', 'AS', 'ASM', 1);
INSERT INTO `countries` VALUES (5, 'Andorra', 'AD', 'AND', 1);
INSERT INTO `countries` VALUES (6, 'Angola', 'AO', 'AGO', 1);
INSERT INTO `countries` VALUES (7, 'Anguilla', 'AI', 'AIA', 1);
INSERT INTO `countries` VALUES (8, 'Antarctica', 'AQ', 'ATA', 1);
INSERT INTO `countries` VALUES (9, 'Antigua and Barbuda', 'AG', 'ATG', 1);
INSERT INTO `countries` VALUES (10, 'Argentina', 'AR', 'ARG', 1);
INSERT INTO `countries` VALUES (11, 'Armenia', 'AM', 'ARM', 1);
INSERT INTO `countries` VALUES (12, 'Aruba', 'AW', 'ABW', 1);
INSERT INTO `countries` VALUES (13, 'Australia', 'AU', 'AUS', 1);
INSERT INTO `countries` VALUES (14, 'Austria', 'AT', 'AUT', 5);
INSERT INTO `countries` VALUES (15, 'Azerbaijan', 'AZ', 'AZE', 1);
INSERT INTO `countries` VALUES (16, 'Bahamas', 'BS', 'BHS', 1);
INSERT INTO `countries` VALUES (17, 'Bahrain', 'BH', 'BHR', 1);
INSERT INTO `countries` VALUES (18, 'Bangladesh', 'BD', 'BGD', 1);
INSERT INTO `countries` VALUES (19, 'Barbados', 'BB', 'BRB', 1);
INSERT INTO `countries` VALUES (20, 'Belarus', 'BY', 'BLR', 1);
INSERT INTO `countries` VALUES (21, 'Belgium', 'BE', 'BEL', 1);
INSERT INTO `countries` VALUES (22, 'Belize', 'BZ', 'BLZ', 1);
INSERT INTO `countries` VALUES (23, 'Benin', 'BJ', 'BEN', 1);
INSERT INTO `countries` VALUES (24, 'Bermuda', 'BM', 'BMU', 1);
INSERT INTO `countries` VALUES (25, 'Bhutan', 'BT', 'BTN', 1);
INSERT INTO `countries` VALUES (26, 'Bolivia', 'BO', 'BOL', 1);
INSERT INTO `countries` VALUES (27, 'Bosnia and Herzegowina', 'BA', 'BIH', 1);
INSERT INTO `countries` VALUES (28, 'Botswana', 'BW', 'BWA', 1);
INSERT INTO `countries` VALUES (29, 'Bouvet Island', 'BV', 'BVT', 1);
INSERT INTO `countries` VALUES (30, 'Brazil', 'BR', 'BRA', 1);
INSERT INTO `countries` VALUES (31, 'British Indian Ocean Territory', 'IO', 'IOT', 1);
INSERT INTO `countries` VALUES (32, 'Brunei Darussalam', 'BN', 'BRN', 1);
INSERT INTO `countries` VALUES (33, 'Bulgaria', 'BG', 'BGR', 1);
INSERT INTO `countries` VALUES (34, 'Burkina Faso', 'BF', 'BFA', 1);
INSERT INTO `countries` VALUES (35, 'Burundi', 'BI', 'BDI', 1);
INSERT INTO `countries` VALUES (36, 'Cambodia', 'KH', 'KHM', 1);
INSERT INTO `countries` VALUES (37, 'Cameroon', 'CM', 'CMR', 1);
INSERT INTO `countries` VALUES (38, 'Canada', 'CA', 'CAN', 1);
INSERT INTO `countries` VALUES (39, 'Cape Verde', 'CV', 'CPV', 1);
INSERT INTO `countries` VALUES (40, 'Cayman Islands', 'KY', 'CYM', 1);
INSERT INTO `countries` VALUES (41, 'Central African Republic', 'CF', 'CAF', 1);
INSERT INTO `countries` VALUES (42, 'Chad', 'TD', 'TCD', 1);
INSERT INTO `countries` VALUES (43, 'Chile', 'CL', 'CHL', 1);
INSERT INTO `countries` VALUES (44, 'China', 'CN', 'CHN', 1);
INSERT INTO `countries` VALUES (45, 'Christmas Island', 'CX', 'CXR', 1);
INSERT INTO `countries` VALUES (46, 'Cocos (Keeling) Islands', 'CC', 'CCK', 1);
INSERT INTO `countries` VALUES (47, 'Colombia', 'CO', 'COL', 1);
INSERT INTO `countries` VALUES (48, 'Comoros', 'KM', 'COM', 1);
INSERT INTO `countries` VALUES (49, 'Congo', 'CG', 'COG', 1);
INSERT INTO `countries` VALUES (50, 'Cook Islands', 'CK', 'COK', 1);
INSERT INTO `countries` VALUES (51, 'Costa Rica', 'CR', 'CRI', 1);
INSERT INTO `countries` VALUES (52, 'Cote D''Ivoire', 'CI', 'CIV', 1);
INSERT INTO `countries` VALUES (53, 'Croatia', 'HR', 'HRV', 1);
INSERT INTO `countries` VALUES (54, 'Cuba', 'CU', 'CUB', 1);
INSERT INTO `countries` VALUES (55, 'Cyprus', 'CY', 'CYP', 1);
INSERT INTO `countries` VALUES (56, 'Czech Republic', 'CZ', 'CZE', 1);
INSERT INTO `countries` VALUES (57, 'Denmark', 'DK', 'DNK', 1);
INSERT INTO `countries` VALUES (58, 'Djibouti', 'DJ', 'DJI', 1);
INSERT INTO `countries` VALUES (59, 'Dominica', 'DM', 'DMA', 1);
INSERT INTO `countries` VALUES (60, 'Dominican Republic', 'DO', 'DOM', 1);
INSERT INTO `countries` VALUES (61, 'East Timor', 'TP', 'TMP', 1);
INSERT INTO `countries` VALUES (62, 'Ecuador', 'EC', 'ECU', 1);
INSERT INTO `countries` VALUES (63, 'Egypt', 'EG', 'EGY', 1);
INSERT INTO `countries` VALUES (64, 'El Salvador', 'SV', 'SLV', 1);
INSERT INTO `countries` VALUES (65, 'Equatorial Guinea', 'GQ', 'GNQ', 1);
INSERT INTO `countries` VALUES (66, 'Eritrea', 'ER', 'ERI', 1);
INSERT INTO `countries` VALUES (67, 'Estonia', 'EE', 'EST', 1);
INSERT INTO `countries` VALUES (68, 'Ethiopia', 'ET', 'ETH', 1);
INSERT INTO `countries` VALUES (69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 1);
INSERT INTO `countries` VALUES (70, 'Faroe Islands', 'FO', 'FRO', 1);
INSERT INTO `countries` VALUES (71, 'Fiji', 'FJ', 'FJI', 1);
INSERT INTO `countries` VALUES (72, 'Finland', 'FI', 'FIN', 1);
INSERT INTO `countries` VALUES (73, 'France', 'FR', 'FRA', 1);
INSERT INTO `countries` VALUES (74, 'France, Metropolitan', 'FX', 'FXX', 1);
INSERT INTO `countries` VALUES (75, 'French Guiana', 'GF', 'GUF', 1);
INSERT INTO `countries` VALUES (76, 'French Polynesia', 'PF', 'PYF', 1);
INSERT INTO `countries` VALUES (77, 'French Southern Territories', 'TF', 'ATF', 1);
INSERT INTO `countries` VALUES (78, 'Gabon', 'GA', 'GAB', 1);
INSERT INTO `countries` VALUES (79, 'Gambia', 'GM', 'GMB', 1);
INSERT INTO `countries` VALUES (80, 'Georgia', 'GE', 'GEO', 1);
INSERT INTO `countries` VALUES (81, 'Germany', 'DE', 'DEU', 5);
INSERT INTO `countries` VALUES (82, 'Ghana', 'GH', 'GHA', 1);
INSERT INTO `countries` VALUES (83, 'Gibraltar', 'GI', 'GIB', 1);
INSERT INTO `countries` VALUES (84, 'Greece', 'GR', 'GRC', 1);
INSERT INTO `countries` VALUES (85, 'Greenland', 'GL', 'GRL', 1);
INSERT INTO `countries` VALUES (86, 'Grenada', 'GD', 'GRD', 1);
INSERT INTO `countries` VALUES (87, 'Guadeloupe', 'GP', 'GLP', 1);
INSERT INTO `countries` VALUES (88, 'Guam', 'GU', 'GUM', 1);
INSERT INTO `countries` VALUES (89, 'Guatemala', 'GT', 'GTM', 1);
INSERT INTO `countries` VALUES (90, 'Guinea', 'GN', 'GIN', 1);
INSERT INTO `countries` VALUES (91, 'Guinea-bissau', 'GW', 'GNB', 1);
INSERT INTO `countries` VALUES (92, 'Guyana', 'GY', 'GUY', 1);
INSERT INTO `countries` VALUES (93, 'Haiti', 'HT', 'HTI', 1);
INSERT INTO `countries` VALUES (94, 'Heard and Mc Donald Islands', 'HM', 'HMD', 1);
INSERT INTO `countries` VALUES (95, 'Honduras', 'HN', 'HND', 1);
INSERT INTO `countries` VALUES (96, 'Hong Kong', 'HK', 'HKG', 1);
INSERT INTO `countries` VALUES (97, 'Hungary', 'HU', 'HUN', 1);
INSERT INTO `countries` VALUES (98, 'Iceland', 'IS', 'ISL', 1);
INSERT INTO `countries` VALUES (99, 'India', 'IN', 'IND', 1);
INSERT INTO `countries` VALUES (100, 'Indonesia', 'ID', 'IDN', 1);
INSERT INTO `countries` VALUES (101, 'Iran (Islamic Republic of)', 'IR', 'IRN', 1);
INSERT INTO `countries` VALUES (102, 'Iraq', 'IQ', 'IRQ', 1);
INSERT INTO `countries` VALUES (103, 'Ireland', 'IE', 'IRL', 1);
INSERT INTO `countries` VALUES (104, 'Israel', 'IL', 'ISR', 1);
INSERT INTO `countries` VALUES (105, 'Italy', 'IT', 'ITA', 1);
INSERT INTO `countries` VALUES (106, 'Jamaica', 'JM', 'JAM', 1);
INSERT INTO `countries` VALUES (107, 'Japan', 'JP', 'JPN', 1);
INSERT INTO `countries` VALUES (108, 'Jordan', 'JO', 'JOR', 1);
INSERT INTO `countries` VALUES (109, 'Kazakhstan', 'KZ', 'KAZ', 1);
INSERT INTO `countries` VALUES (110, 'Kenya', 'KE', 'KEN', 1);
INSERT INTO `countries` VALUES (111, 'Kiribati', 'KI', 'KIR', 1);
INSERT INTO `countries` VALUES (112, 'Korea, Democratic People''s Republic of', 'KP', 'PRK', 1);
INSERT INTO `countries` VALUES (113, 'Korea, Republic of', 'KR', 'KOR', 1);
INSERT INTO `countries` VALUES (114, 'Kuwait', 'KW', 'KWT', 1);
INSERT INTO `countries` VALUES (115, 'Kyrgyzstan', 'KG', 'KGZ', 1);
INSERT INTO `countries` VALUES (116, 'Lao People''s Democratic Republic', 'LA', 'LAO', 1);
INSERT INTO `countries` VALUES (117, 'Latvia', 'LV', 'LVA', 1);
INSERT INTO `countries` VALUES (118, 'Lebanon', 'LB', 'LBN', 1);
INSERT INTO `countries` VALUES (119, 'Lesotho', 'LS', 'LSO', 1);
INSERT INTO `countries` VALUES (120, 'Liberia', 'LR', 'LBR', 1);
INSERT INTO `countries` VALUES (121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', 1);
INSERT INTO `countries` VALUES (122, 'Liechtenstein', 'LI', 'LIE', 1);
INSERT INTO `countries` VALUES (123, 'Lithuania', 'LT', 'LTU', 1);
INSERT INTO `countries` VALUES (124, 'Luxembourg', 'LU', 'LUX', 1);
INSERT INTO `countries` VALUES (125, 'Macau', 'MO', 'MAC', 1);
INSERT INTO `countries` VALUES (126, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', 1);
INSERT INTO `countries` VALUES (127, 'Madagascar', 'MG', 'MDG', 1);
INSERT INTO `countries` VALUES (128, 'Malawi', 'MW', 'MWI', 1);
INSERT INTO `countries` VALUES (129, 'Malaysia', 'MY', 'MYS', 1);
INSERT INTO `countries` VALUES (130, 'Maldives', 'MV', 'MDV', 1);
INSERT INTO `countries` VALUES (131, 'Mali', 'ML', 'MLI', 1);
INSERT INTO `countries` VALUES (132, 'Malta', 'MT', 'MLT', 1);
INSERT INTO `countries` VALUES (133, 'Marshall Islands', 'MH', 'MHL', 1);
INSERT INTO `countries` VALUES (134, 'Martinique', 'MQ', 'MTQ', 1);
INSERT INTO `countries` VALUES (135, 'Mauritania', 'MR', 'MRT', 1);
INSERT INTO `countries` VALUES (136, 'Mauritius', 'MU', 'MUS', 1);
INSERT INTO `countries` VALUES (137, 'Mayotte', 'YT', 'MYT', 1);
INSERT INTO `countries` VALUES (138, 'Mexico', 'MX', 'MEX', 1);
INSERT INTO `countries` VALUES (139, 'Micronesia, Federated States of', 'FM', 'FSM', 1);
INSERT INTO `countries` VALUES (140, 'Moldova, Republic of', 'MD', 'MDA', 1);
INSERT INTO `countries` VALUES (141, 'Monaco', 'MC', 'MCO', 1);
INSERT INTO `countries` VALUES (142, 'Mongolia', 'MN', 'MNG', 1);
INSERT INTO `countries` VALUES (143, 'Montserrat', 'MS', 'MSR', 1);
INSERT INTO `countries` VALUES (144, 'Morocco', 'MA', 'MAR', 1);
INSERT INTO `countries` VALUES (145, 'Mozambique', 'MZ', 'MOZ', 1);
INSERT INTO `countries` VALUES (146, 'Myanmar', 'MM', 'MMR', 1);
INSERT INTO `countries` VALUES (147, 'Namibia', 'NA', 'NAM', 1);
INSERT INTO `countries` VALUES (148, 'Nauru', 'NR', 'NRU', 1);
INSERT INTO `countries` VALUES (149, 'Nepal', 'NP', 'NPL', 1);
INSERT INTO `countries` VALUES (150, 'Netherlands', 'NL', 'NLD', 1);
INSERT INTO `countries` VALUES (151, 'Netherlands Antilles', 'AN', 'ANT', 1);
INSERT INTO `countries` VALUES (152, 'New Caledonia', 'NC', 'NCL', 1);
INSERT INTO `countries` VALUES (153, 'New Zealand', 'NZ', 'NZL', 1);
INSERT INTO `countries` VALUES (154, 'Nicaragua', 'NI', 'NIC', 1);
INSERT INTO `countries` VALUES (155, 'Niger', 'NE', 'NER', 1);
INSERT INTO `countries` VALUES (156, 'Nigeria', 'NG', 'NGA', 1);
INSERT INTO `countries` VALUES (157, 'Niue', 'NU', 'NIU', 1);
INSERT INTO `countries` VALUES (158, 'Norfolk Island', 'NF', 'NFK', 1);
INSERT INTO `countries` VALUES (159, 'Northern Mariana Islands', 'MP', 'MNP', 1);
INSERT INTO `countries` VALUES (160, 'Norway', 'NO', 'NOR', 1);
INSERT INTO `countries` VALUES (161, 'Oman', 'OM', 'OMN', 1);
INSERT INTO `countries` VALUES (162, 'Pakistan', 'PK', 'PAK', 1);
INSERT INTO `countries` VALUES (163, 'Palau', 'PW', 'PLW', 1);
INSERT INTO `countries` VALUES (164, 'Panama', 'PA', 'PAN', 1);
INSERT INTO `countries` VALUES (165, 'Papua New Guinea', 'PG', 'PNG', 1);
INSERT INTO `countries` VALUES (166, 'Paraguay', 'PY', 'PRY', 1);
INSERT INTO `countries` VALUES (167, 'Peru', 'PE', 'PER', 1);
INSERT INTO `countries` VALUES (168, 'Philippines', 'PH', 'PHL', 1);
INSERT INTO `countries` VALUES (169, 'Pitcairn', 'PN', 'PCN', 1);
INSERT INTO `countries` VALUES (170, 'Poland', 'PL', 'POL', 1);
INSERT INTO `countries` VALUES (171, 'Portugal', 'PT', 'PRT', 1);
INSERT INTO `countries` VALUES (172, 'Puerto Rico', 'PR', 'PRI', 1);
INSERT INTO `countries` VALUES (173, 'Qatar', 'QA', 'QAT', 1);
INSERT INTO `countries` VALUES (174, 'Reunion', 'RE', 'REU', 1);
INSERT INTO `countries` VALUES (175, 'Romania', 'RO', 'ROM', 1);
INSERT INTO `countries` VALUES (176, 'Russian Federation', 'RU', 'RUS', 1);
INSERT INTO `countries` VALUES (177, 'Rwanda', 'RW', 'RWA', 1);
INSERT INTO `countries` VALUES (178, 'Saint Kitts and Nevis', 'KN', 'KNA', 1);
INSERT INTO `countries` VALUES (179, 'Saint Lucia', 'LC', 'LCA', 1);
INSERT INTO `countries` VALUES (180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 1);
INSERT INTO `countries` VALUES (181, 'Samoa', 'WS', 'WSM', 1);
INSERT INTO `countries` VALUES (182, 'San Marino', 'SM', 'SMR', 1);
INSERT INTO `countries` VALUES (183, 'Sao Tome and Principe', 'ST', 'STP', 1);
INSERT INTO `countries` VALUES (184, 'Saudi Arabia', 'SA', 'SAU', 1);
INSERT INTO `countries` VALUES (185, 'Senegal', 'SN', 'SEN', 1);
INSERT INTO `countries` VALUES (186, 'Seychelles', 'SC', 'SYC', 1);
INSERT INTO `countries` VALUES (187, 'Sierra Leone', 'SL', 'SLE', 1);
INSERT INTO `countries` VALUES (188, 'Singapore', 'SG', 'SGP', 4);
INSERT INTO `countries` VALUES (189, 'Slovakia (Slovak Republic)', 'SK', 'SVK', 1);
INSERT INTO `countries` VALUES (190, 'Slovenia', 'SI', 'SVN', 1);
INSERT INTO `countries` VALUES (191, 'Solomon Islands', 'SB', 'SLB', 1);
INSERT INTO `countries` VALUES (192, 'Somalia', 'SO', 'SOM', 1);
INSERT INTO `countries` VALUES (193, 'South Africa', 'ZA', 'ZAF', 1);
INSERT INTO `countries` VALUES (194, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 1);
INSERT INTO `countries` VALUES (195, 'Spain', 'ES', 'ESP', 3);
INSERT INTO `countries` VALUES (196, 'Sri Lanka', 'LK', 'LKA', 1);
INSERT INTO `countries` VALUES (197, 'St. Helena', 'SH', 'SHN', 1);
INSERT INTO `countries` VALUES (198, 'St. Pierre and Miquelon', 'PM', 'SPM', 1);
INSERT INTO `countries` VALUES (199, 'Sudan', 'SD', 'SDN', 1);
INSERT INTO `countries` VALUES (200, 'Suriname', 'SR', 'SUR', 1);
INSERT INTO `countries` VALUES (201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', 1);
INSERT INTO `countries` VALUES (202, 'Swaziland', 'SZ', 'SWZ', 1);
INSERT INTO `countries` VALUES (203, 'Sweden', 'SE', 'SWE', 1);
INSERT INTO `countries` VALUES (204, 'Switzerland', 'CH', 'CHE', 1);
INSERT INTO `countries` VALUES (205, 'Syrian Arab Republic', 'SY', 'SYR', 1);
INSERT INTO `countries` VALUES (206, 'Taiwan', 'TW', 'TWN', 1);
INSERT INTO `countries` VALUES (207, 'Tajikistan', 'TJ', 'TJK', 1);
INSERT INTO `countries` VALUES (208, 'Tanzania, United Republic of', 'TZ', 'TZA', 1);
INSERT INTO `countries` VALUES (209, 'Thailand', 'TH', 'THA', 1);
INSERT INTO `countries` VALUES (210, 'Togo', 'TG', 'TGO', 1);
INSERT INTO `countries` VALUES (211, 'Tokelau', 'TK', 'TKL', 1);
INSERT INTO `countries` VALUES (212, 'Tonga', 'TO', 'TON', 1);
INSERT INTO `countries` VALUES (213, 'Trinidad and Tobago', 'TT', 'TTO', 1);
INSERT INTO `countries` VALUES (214, 'Tunisia', 'TN', 'TUN', 1);
INSERT INTO `countries` VALUES (215, 'Turkey', 'TR', 'TUR', 1);
INSERT INTO `countries` VALUES (216, 'Turkmenistan', 'TM', 'TKM', 1);
INSERT INTO `countries` VALUES (217, 'Turks and Caicos Islands', 'TC', 'TCA', 1);
INSERT INTO `countries` VALUES (218, 'Tuvalu', 'TV', 'TUV', 1);
INSERT INTO `countries` VALUES (219, 'Uganda', 'UG', 'UGA', 1);
INSERT INTO `countries` VALUES (220, 'Ukraine', 'UA', 'UKR', 1);
INSERT INTO `countries` VALUES (221, 'United Arab Emirates', 'AE', 'ARE', 1);
INSERT INTO `countries` VALUES (222, 'United Kingdom', 'GB', 'GBR', 1);
INSERT INTO `countries` VALUES (223, 'United States', 'US', 'USA', 2);
INSERT INTO `countries` VALUES (224, 'United States Minor Outlying Islands', 'UM', 'UMI', 1);
INSERT INTO `countries` VALUES (225, 'Uruguay', 'UY', 'URY', 1);
INSERT INTO `countries` VALUES (226, 'Uzbekistan', 'UZ', 'UZB', 1);
INSERT INTO `countries` VALUES (227, 'Vanuatu', 'VU', 'VUT', 1);
INSERT INTO `countries` VALUES (228, 'Vatican City State (Holy See)', 'VA', 'VAT', 1);
INSERT INTO `countries` VALUES (229, 'Venezuela', 'VE', 'VEN', 1);
INSERT INTO `countries` VALUES (230, 'Viet Nam', 'VN', 'VNM', 1);
INSERT INTO `countries` VALUES (231, 'Virgin Islands (British)', 'VG', 'VGB', 1);
INSERT INTO `countries` VALUES (232, 'Virgin Islands (U.S.)', 'VI', 'VIR', 1);
INSERT INTO `countries` VALUES (233, 'Wallis and Futuna Islands', 'WF', 'WLF', 1);
INSERT INTO `countries` VALUES (234, 'Western Sahara', 'EH', 'ESH', 1);
INSERT INTO `countries` VALUES (235, 'Yemen', 'YE', 'YEM', 1);
INSERT INTO `countries` VALUES (236, 'Yugoslavia', 'YU', 'YUG', 1);
INSERT INTO `countries` VALUES (237, 'Zaire', 'ZR', 'ZAR', 1);
INSERT INTO `countries` VALUES (238, 'Zambia', 'ZM', 'ZMB', 1);
INSERT INTO `countries` VALUES (239, 'Zimbabwe', 'ZW', 'ZWE', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `currencies`
-- 

CREATE TABLE `currencies` (
  `currencies_id` int(11) NOT NULL auto_increment,
  `title` varchar(32) collate utf8_unicode_ci NOT NULL,
  `code` char(3) collate utf8_unicode_ci NOT NULL,
  `symbol_left` varchar(12) collate utf8_unicode_ci default NULL,
  `symbol_right` varchar(12) collate utf8_unicode_ci default NULL,
  `decimal_point` char(1) collate utf8_unicode_ci default NULL,
  `thousands_point` char(1) collate utf8_unicode_ci default NULL,
  `decimal_places` char(1) collate utf8_unicode_ci default NULL,
  `value` float(13,8) default NULL,
  `last_updated` datetime default NULL,
  PRIMARY KEY  (`currencies_id`),
  KEY `idx_currencies_code` (`code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `currencies`
-- 

INSERT INTO `currencies` VALUES (1, 'U.S. Dollar', 'USD', '$', '', '.', ',', '2', 1.00000000, '2014-04-14 22:41:27');
INSERT INTO `currencies` VALUES (2, 'Euro', 'EUR', '', '€', '.', ',', '2', 1.00000000, '2014-04-14 22:41:27');
INSERT INTO `currencies` VALUES (4, 'Rupiah', 'IDR', 'Rp.', '-', ',', '.', '2', 10000.00000000, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `customers`
-- 

CREATE TABLE `customers` (
  `customers_id` int(11) NOT NULL auto_increment,
  `customers_gender` char(1) collate utf8_unicode_ci default NULL,
  `customers_firstname` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_lastname` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_dob` datetime NOT NULL default '0000-00-00 00:00:00',
  `customers_email_address` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_default_address_id` int(11) default NULL,
  `customers_telephone` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_fax` varchar(255) collate utf8_unicode_ci default NULL,
  `customers_password` varchar(60) collate utf8_unicode_ci NOT NULL,
  `customers_newsletter` char(1) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`customers_id`),
  KEY `idx_customers_email_address` (`customers_email_address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `customers`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `customers_basket`
-- 

CREATE TABLE `customers_basket` (
  `customers_basket_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext collate utf8_unicode_ci NOT NULL,
  `customers_basket_quantity` int(2) NOT NULL,
  `final_price` decimal(15,4) default NULL,
  `customers_basket_date_added` char(8) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`customers_basket_id`),
  KEY `idx_customers_basket_customers_id` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `customers_basket`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `customers_basket_attributes`
-- 

CREATE TABLE `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext collate utf8_unicode_ci NOT NULL,
  `products_options_id` int(11) NOT NULL,
  `products_options_value_id` int(11) NOT NULL,
  PRIMARY KEY  (`customers_basket_attributes_id`),
  KEY `idx_customers_basket_att_customers_id` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `customers_basket_attributes`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `customers_info`
-- 

CREATE TABLE `customers_info` (
  `customers_info_id` int(11) NOT NULL,
  `customers_info_date_of_last_logon` datetime default NULL,
  `customers_info_number_of_logons` int(5) default NULL,
  `customers_info_date_account_created` datetime default NULL,
  `customers_info_date_account_last_modified` datetime default NULL,
  `global_product_notifications` int(1) default '0',
  `password_reset_key` char(40) collate utf8_unicode_ci default NULL,
  `password_reset_date` datetime default NULL,
  PRIMARY KEY  (`customers_info_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `customers_info`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `featured`
-- 

CREATE TABLE `featured` (
  `featured_id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL default '0',
  `featured_date_added` datetime default NULL,
  `featured_last_modified` datetime default NULL,
  `expires_date` datetime default NULL,
  `date_status_change` datetime default NULL,
  `status` int(1) default '1',
  PRIMARY KEY  (`featured_id`),
  KEY `idx_products_id` (`products_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- 
-- Dumping data for table `featured`
-- 

INSERT INTO `featured` VALUES (1, 8, '2014-04-14 22:49:57', NULL, '0000-00-00 00:00:00', NULL, 1);
INSERT INTO `featured` VALUES (2, 20, '2014-04-14 22:50:02', NULL, '0000-00-00 00:00:00', NULL, 1);
INSERT INTO `featured` VALUES (3, 53, '2014-04-14 23:56:11', NULL, '0000-00-00 00:00:00', NULL, 1);
INSERT INTO `featured` VALUES (4, 43, '2014-04-14 23:57:04', '2014-04-15 00:04:44', NULL, NULL, 1);
INSERT INTO `featured` VALUES (5, 64, '2014-04-14 23:57:41', NULL, '0000-00-00 00:00:00', NULL, 1);
INSERT INTO `featured` VALUES (6, 34, '2014-04-14 23:58:01', NULL, '0000-00-00 00:00:00', '2014-04-15 00:06:30', 0);
INSERT INTO `featured` VALUES (7, 66, '2014-04-15 00:05:21', NULL, '0000-00-00 00:00:00', NULL, 1);
INSERT INTO `featured` VALUES (8, 68, '2014-04-15 00:05:34', NULL, '0000-00-00 00:00:00', NULL, 1);
INSERT INTO `featured` VALUES (9, 33, '2014-04-15 00:06:46', NULL, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `geo_zones`
-- 

CREATE TABLE `geo_zones` (
  `geo_zone_id` int(11) NOT NULL auto_increment,
  `geo_zone_name` varchar(32) collate utf8_unicode_ci NOT NULL,
  `geo_zone_description` varchar(255) collate utf8_unicode_ci NOT NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `geo_zones`
-- 

INSERT INTO `geo_zones` VALUES (1, 'Florida', 'Florida local sales tax zone', NULL, '2014-04-14 22:41:27');

-- --------------------------------------------------------

-- 
-- Table structure for table `languages`
-- 

CREATE TABLE `languages` (
  `languages_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) collate utf8_unicode_ci NOT NULL,
  `code` char(2) collate utf8_unicode_ci NOT NULL,
  `image` varchar(64) collate utf8_unicode_ci default NULL,
  `directory` varchar(32) collate utf8_unicode_ci default NULL,
  `sort_order` int(3) default NULL,
  PRIMARY KEY  (`languages_id`),
  KEY `IDX_LANGUAGES_NAME` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `languages`
-- 

INSERT INTO `languages` VALUES (1, 'English', 'en', 'icon.gif', 'english', 1);
INSERT INTO `languages` VALUES (2, 'Indonesia', 'id', 'icon.gif', 'indonesia', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `manufacturers`
-- 

CREATE TABLE `manufacturers` (
  `manufacturers_id` int(11) NOT NULL auto_increment,
  `manufacturers_name` varchar(32) collate utf8_unicode_ci NOT NULL,
  `manufacturers_image` varchar(64) collate utf8_unicode_ci default NULL,
  `date_added` datetime default NULL,
  `last_modified` datetime default NULL,
  PRIMARY KEY  (`manufacturers_id`),
  KEY `IDX_MANUFACTURERS_NAME` (`manufacturers_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

-- 
-- Dumping data for table `manufacturers`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `manufacturers_info`
-- 

CREATE TABLE `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `manufacturers_url` varchar(255) collate utf8_unicode_ci NOT NULL,
  `url_clicked` int(5) NOT NULL default '0',
  `date_last_click` datetime default NULL,
  PRIMARY KEY  (`manufacturers_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `manufacturers_info`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `newsletters`
-- 

CREATE TABLE `newsletters` (
  `newsletters_id` int(11) NOT NULL auto_increment,
  `title` varchar(255) collate utf8_unicode_ci NOT NULL,
  `content` text collate utf8_unicode_ci NOT NULL,
  `module` varchar(255) collate utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_sent` datetime default NULL,
  `status` int(1) default NULL,
  `locked` int(1) default '0',
  PRIMARY KEY  (`newsletters_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `newsletters`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `orders`
-- 

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `customers_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_company` varchar(255) collate utf8_unicode_ci default NULL,
  `customers_street_address` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_suburb` varchar(255) collate utf8_unicode_ci default NULL,
  `customers_city` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_postcode` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_state` varchar(255) collate utf8_unicode_ci default NULL,
  `customers_country` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_telephone` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_email_address` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_address_format_id` int(5) NOT NULL,
  `delivery_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `delivery_company` varchar(255) collate utf8_unicode_ci default NULL,
  `delivery_street_address` varchar(255) collate utf8_unicode_ci NOT NULL,
  `delivery_suburb` varchar(255) collate utf8_unicode_ci default NULL,
  `delivery_city` varchar(255) collate utf8_unicode_ci NOT NULL,
  `delivery_postcode` varchar(255) collate utf8_unicode_ci NOT NULL,
  `delivery_state` varchar(255) collate utf8_unicode_ci default NULL,
  `delivery_country` varchar(255) collate utf8_unicode_ci NOT NULL,
  `delivery_address_format_id` int(5) NOT NULL,
  `billing_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `billing_company` varchar(255) collate utf8_unicode_ci default NULL,
  `billing_street_address` varchar(255) collate utf8_unicode_ci NOT NULL,
  `billing_suburb` varchar(255) collate utf8_unicode_ci default NULL,
  `billing_city` varchar(255) collate utf8_unicode_ci NOT NULL,
  `billing_postcode` varchar(255) collate utf8_unicode_ci NOT NULL,
  `billing_state` varchar(255) collate utf8_unicode_ci default NULL,
  `billing_country` varchar(255) collate utf8_unicode_ci NOT NULL,
  `billing_address_format_id` int(5) NOT NULL,
  `payment_method` varchar(255) collate utf8_unicode_ci NOT NULL,
  `cc_type` varchar(20) collate utf8_unicode_ci default NULL,
  `cc_owner` varchar(255) collate utf8_unicode_ci default NULL,
  `cc_number` varchar(32) collate utf8_unicode_ci default NULL,
  `cc_expires` varchar(4) collate utf8_unicode_ci default NULL,
  `last_modified` datetime default NULL,
  `date_purchased` datetime default NULL,
  `orders_status` int(5) NOT NULL,
  `orders_date_finished` datetime default NULL,
  `currency` char(3) collate utf8_unicode_ci default NULL,
  `currency_value` decimal(14,6) default NULL,
  PRIMARY KEY  (`orders_id`),
  KEY `idx_orders_customers_id` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `orders`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `orders_products`
-- 

CREATE TABLE `orders_products` (
  `orders_products_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `products_model` varchar(12) collate utf8_unicode_ci default NULL,
  `products_name` varchar(64) collate utf8_unicode_ci NOT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `final_price` decimal(15,4) NOT NULL,
  `products_tax` decimal(7,4) NOT NULL,
  `products_quantity` int(2) NOT NULL,
  PRIMARY KEY  (`orders_products_id`),
  KEY `idx_orders_products_orders_id` (`orders_id`),
  KEY `idx_orders_products_products_id` (`products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `orders_products`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `orders_products_attributes`
-- 

CREATE TABLE `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `orders_products_id` int(11) NOT NULL,
  `products_options` varchar(32) collate utf8_unicode_ci NOT NULL,
  `products_options_values` varchar(32) collate utf8_unicode_ci NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`orders_products_attributes_id`),
  KEY `idx_orders_products_att_orders_id` (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `orders_products_attributes`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `orders_products_download`
-- 

CREATE TABLE `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL default '0',
  `orders_products_id` int(11) NOT NULL default '0',
  `orders_products_filename` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `download_maxdays` int(2) NOT NULL default '0',
  `download_count` int(2) NOT NULL default '0',
  PRIMARY KEY  (`orders_products_download_id`),
  KEY `idx_orders_products_download_orders_id` (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `orders_products_download`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `orders_status`
-- 

CREATE TABLE `orders_status` (
  `orders_status_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `orders_status_name` varchar(32) collate utf8_unicode_ci NOT NULL,
  `public_flag` int(11) default '1',
  `downloads_flag` int(11) default '0',
  PRIMARY KEY  (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name` (`orders_status_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `orders_status`
-- 

INSERT INTO `orders_status` VALUES (1, 1, 'Pending', 1, 0);
INSERT INTO `orders_status` VALUES (2, 1, 'Processing', 1, 1);
INSERT INTO `orders_status` VALUES (3, 1, 'Delivered', 1, 1);
INSERT INTO `orders_status` VALUES (4, 1, 'PayPal [Transactions]', 0, 0);
INSERT INTO `orders_status` VALUES (1, 2, 'Pending', 1, 0);
INSERT INTO `orders_status` VALUES (2, 2, 'Processing', 1, 0);
INSERT INTO `orders_status` VALUES (3, 2, 'Delivered', 1, 0);
INSERT INTO `orders_status` VALUES (4, 2, 'PayPal [Transactions]', 1, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `orders_status_history`
-- 

CREATE TABLE `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `orders_status_id` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  `customer_notified` int(1) default '0',
  `comments` text collate utf8_unicode_ci,
  PRIMARY KEY  (`orders_status_history_id`),
  KEY `idx_orders_status_history_orders_id` (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `orders_status_history`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `orders_total`
-- 

CREATE TABLE `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `title` varchar(255) collate utf8_unicode_ci NOT NULL,
  `text` varchar(255) collate utf8_unicode_ci NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `class` varchar(32) collate utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY  (`orders_total_id`),
  KEY `idx_orders_total_orders_id` (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `orders_total`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `products`
-- 

CREATE TABLE `products` (
  `products_id` int(11) NOT NULL auto_increment,
  `products_quantity` int(4) NOT NULL,
  `products_model` varchar(12) collate utf8_unicode_ci default NULL,
  `products_image` varchar(64) collate utf8_unicode_ci default NULL,
  `products_price` decimal(15,4) NOT NULL,
  `products_date_added` datetime NOT NULL,
  `products_last_modified` datetime default NULL,
  `products_date_available` datetime default NULL,
  `products_weight` decimal(5,2) NOT NULL,
  `products_status` tinyint(1) NOT NULL,
  `products_tax_class_id` int(11) NOT NULL,
  `manufacturers_id` int(11) default NULL,
  `products_ordered` int(11) NOT NULL default '0',
  PRIMARY KEY  (`products_id`),
  KEY `idx_products_model` (`products_model`),
  KEY `idx_products_date_added` (`products_date_added`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=71 ;

-- 
-- Dumping data for table `products`
-- 

INSERT INTO `products` VALUES (58, 0, '', 'img1533-1393042240.jpg', 45.0000, '2014-04-14 23:47:23', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (57, 0, '', 'img1521-1389257922.jpg', 46.5000, '2014-04-14 23:46:57', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (55, 0, '', 'img994-1370577980.jpg', 10.0000, '2014-04-14 23:45:50', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (56, 0, '', 'img1905-1393562355.jpg', 38.0000, '2014-04-14 23:46:24', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (45, 0, '', 'img1513-1387868828.jpg', 78.0000, '2014-04-14 23:37:21', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (46, 0, '', 'img1508-1387770225.jpg', 65.0000, '2014-04-14 23:37:49', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (47, 0, '', 'img1509-1387770241.jpg', 67.5000, '2014-04-14 23:38:13', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (48, 0, '', 'img1536-1395477076.jpg', 62.0000, '2014-04-14 23:38:39', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (49, 0, '', 'img1510-1387770254.jpg', 66.0000, '2014-04-14 23:38:58', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (50, 0, '', 'img1511-1387770286.jpg', 60.0000, '2014-04-14 23:39:23', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (51, 0, '', 'img1532-1392962784.jpg', 38.0000, '2014-04-14 23:39:46', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (52, 0, '', 'img1512-1387770310.jpg', 65.0000, '2014-04-14 23:40:12', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (53, 0, '', 'img1484-1387869980.jpg', 675.0000, '2014-04-14 23:41:08', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (54, 0, '', 'img995-1326771163.jpg', 15.0000, '2014-04-14 23:43:02', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (29, 0, '', 'img1366-1371702686.jpg', 10.0000, '2014-04-14 23:02:24', '2014-04-14 23:02:47', NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (30, 0, '', 'img1522-1389257975.jpg', 46.0000, '2014-04-14 23:13:01', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (31, 0, '', 'img1450-1380690172.jpg', 45.0000, '2014-04-14 23:13:30', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (32, 0, '', 'img1458-1380691843.jpg', 45.0000, '2014-04-14 23:13:55', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (33, 0, '', 'img1474-1382171526.jpg', 185.0000, '2014-04-14 23:14:58', '2014-04-14 23:15:13', NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (34, 0, '', 'img1278-1357805585.jpg', 280.0000, '2014-04-14 23:15:38', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (35, 0, '', 'img1273-1356492956.jpg', 15.0000, '2014-04-14 23:17:20', '2014-04-14 23:20:06', NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (36, 0, '', 'img1272-1356492929.jpg', 12.5000, '2014-04-14 23:21:36', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (37, 0, '', 'img1432-1380689570.jpg', 97.0000, '2014-04-14 23:22:18', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (38, 0, '', 'img1326-1364272265.jpg', 54.0000, '2014-04-14 23:22:52', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (39, 0, '', 'img1264-1354759678.jpg', 54.0000, '2014-04-14 23:23:23', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (40, 0, '', 'img1431-1380689518.jpg', 60.0000, '2014-04-14 23:26:31', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (41, 0, '', 'ZombiU_Box_Art_(Final).jpg', 54.0000, '2014-04-14 23:27:39', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (42, 0, '', 'img1463-1380869644.jpg', 54.0000, '2014-04-14 23:29:50', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (43, 0, '', 'img1265-1354960636.jpg', 470.0000, '2014-04-14 23:30:26', '2014-04-15 00:09:56', NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (44, 0, '', 'img1514-1387868837.jpg', 87.5000, '2014-04-14 23:36:54', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (59, 0, '', 'img1523-1389414388.jpg', 54.0000, '2014-04-14 23:47:48', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (60, 0, '', 'img1534-1393042309.jpg', 45.0000, '2014-04-14 23:48:11', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (61, 0, '', 'img1535-1394515791.jpg', 45.0000, '2014-04-14 23:48:36', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (62, 0, '', 'img1529-1392438138.jpg', 72.0000, '2014-04-14 23:49:01', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (63, 0, '', 'img1530-1392438181.jpg', 80.0000, '2014-04-14 23:49:28', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (64, 0, '', 'img1044-1331623800.jpg', 360.0000, '2014-04-14 23:51:03', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (65, 0, '', 'img1491-1386908690.jpg', 360.0000, '2014-04-14 23:51:42', '2014-04-14 23:52:41', NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (66, 0, '', 'img1492-1386908729.jpg', 360.0000, '2014-04-14 23:52:31', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (67, 0, '', 'img1468-1381556223.jpg', 360.0000, '2014-04-14 23:53:21', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (68, 0, '', 'img1467-1381556040.jpg', 360.0000, '2014-04-14 23:54:02', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (69, 0, '', 'img1469-1381556313.jpg', 360.0000, '2014-04-14 23:54:56', NULL, NULL, 0.00, 1, 0, 0, 0);
INSERT INTO `products` VALUES (70, 0, '', 'img1524-1390366502.jpeg', 210.0000, '2014-04-14 23:55:44', NULL, NULL, 0.00, 1, 0, 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `products_attributes`
-- 

CREATE TABLE `products_attributes` (
  `products_attributes_id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL,
  `options_id` int(11) NOT NULL,
  `options_values_id` int(11) NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`products_attributes_id`),
  KEY `idx_products_attributes_products_id` (`products_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

-- 
-- Dumping data for table `products_attributes`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `products_attributes_download`
-- 

CREATE TABLE `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL,
  `products_attributes_filename` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `products_attributes_maxdays` int(2) default '0',
  `products_attributes_maxcount` int(2) default '0',
  PRIMARY KEY  (`products_attributes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `products_attributes_download`
-- 

INSERT INTO `products_attributes_download` VALUES (26, 'unreal.zip', 7, 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `products_description`
-- 

CREATE TABLE `products_description` (
  `products_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL default '1',
  `products_name` varchar(64) collate utf8_unicode_ci NOT NULL default '',
  `products_description` text collate utf8_unicode_ci,
  `products_url` varchar(255) collate utf8_unicode_ci default NULL,
  `products_viewed` int(5) default '0',
  PRIMARY KEY  (`products_id`,`language_id`),
  KEY `products_name` (`products_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=71 ;

-- 
-- Dumping data for table `products_description`
-- 

INSERT INTO `products_description` VALUES (64, 1, 'Paket Hemat PS Vita Crystal Black 64gb (WIFI Model)', 'Isi Paket :\r\n1 x PS Vita WIFI model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 64gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case\r\n1 x Crystal Case ATAU Silicon Case (Plih Salah Satu)', '', 0);
INSERT INTO `products_description` VALUES (65, 2, 'Paket Hemat PS Vita PlayStation Vita New Slim Model (Black) 16gb', 'Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case', '', 0);
INSERT INTO `products_description` VALUES (65, 1, 'Paket Hemat PS Vita PlayStation Vita New Slim Model (Black) 16gb', 'Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case', '', 0);
INSERT INTO `products_description` VALUES (66, 2, 'Paket Hemat PS Vita PlayStation Vita New Slim Model (Khaki Black', 'Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case', '', 0);
INSERT INTO `products_description` VALUES (66, 1, 'Paket Hemat PS Vita PlayStation Vita New Slim Model (Khaki Black', 'Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case', '', 0);
INSERT INTO `products_description` VALUES (67, 2, 'Paket Hemat PS Vita PlayStation Vita New Slim Model (Light Blue ', 'Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case', '', 0);
INSERT INTO `products_description` VALUES (67, 1, 'Paket Hemat PS Vita PlayStation Vita New Slim Model (Light Blue ', 'Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case', '', 0);
INSERT INTO `products_description` VALUES (68, 2, 'Paket Hemat PS Vita PlayStation Vita New Slim Model (Lime Green ', 'Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case', '', 1);
INSERT INTO `products_description` VALUES (68, 1, 'Paket Hemat PS Vita PlayStation Vita New Slim Model (Lime Green ', 'Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case', '', 0);
INSERT INTO `products_description` VALUES (69, 2, 'Paket Hemat PS Vita PlayStation Vita New Slim Model (White) 16gb', 'Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case', '', 0);
INSERT INTO `products_description` VALUES (69, 1, 'Paket Hemat PS Vita PlayStation Vita New Slim Model (White) 16gb', 'Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case', '', 0);
INSERT INTO `products_description` VALUES (70, 2, 'PS Vita TV Value Pack (Reg 3) English', 'Box content :\r\n1 x ps vita tv\r\n1 x 8gb memory\r\n1 x dualshock 3\r\n1 x HDMI Cable\r\n1 x Power Adapter\r\n1 x Charger Cable\r\nfeatures\r\nCPU: ARM Cortex-A9 core (4core)\r\nWi-Fi: IEEE 802.11b/g/n (n=1×1)\r\n1 GB Internal Memory\r\ndescription\r\nAnother surprise reveal from Sony at the Pre TGS press con was the unvieling of the PS Vita TV, a brand new item in the growing Vita family. While the main idea of this tiny device is the ability to play Vita games on a television, the PS Vita TV is capable of a lot more.\r\n\r\nMeasuring 6cm by 10cm - making this the smallest PlayStation hardware ever, the PS Vita TV has 2 card slots: for Vita games and Vita Memory Cards; it will connect to the DualShock 3 controller with future support for the DualShock 4. While this may already be appealing for those who would enjoy the Vita experience on a bigger screen, the PS Vita extends it''s functionality by enabling video streaming services and more. PSone Classics and PSP games from a digital library can also be played; Remote Play with a PS4 is a definite possibility in the future as well.', '', 0);
INSERT INTO `products_description` VALUES (70, 1, 'PS Vita TV Value Pack (Reg 3) English', 'Box content :\r\n1 x ps vita tv\r\n1 x 8gb memory\r\n1 x dualshock 3\r\n1 x HDMI Cable\r\n1 x Power Adapter\r\n1 x Charger Cable\r\nfeatures\r\nCPU: ARM Cortex-A9 core (4core)\r\nWi-Fi: IEEE 802.11b/g/n (n=1×1)\r\n1 GB Internal Memory\r\ndescription\r\nAnother surprise reveal from Sony at the Pre TGS press con was the unvieling of the PS Vita TV, a brand new item in the growing Vita family. While the main idea of this tiny device is the ability to play Vita games on a television, the PS Vita TV is capable of a lot more.\r\n\r\nMeasuring 6cm by 10cm - making this the smallest PlayStation hardware ever, the PS Vita TV has 2 card slots: for Vita games and Vita Memory Cards; it will connect to the DualShock 3 controller with future support for the DualShock 4. While this may already be appealing for those who would enjoy the Vita experience on a bigger screen, the PS Vita extends it''s functionality by enabling video streaming services and more. PSone Classics and PSP games from a digital library can also be played; Remote Play with a PS4 is a definite possibility in the future as well.', '', 0);
INSERT INTO `products_description` VALUES (29, 2, '3DS XL Tough Case', '', '', 1);
INSERT INTO `products_description` VALUES (29, 1, '3DS XL Tough Case', '', '', 0);
INSERT INTO `products_description` VALUES (30, 2, 'Bravely Default (English)', '', '', 1);
INSERT INTO `products_description` VALUES (30, 1, 'Bravely Default (English)', '', '', 0);
INSERT INTO `products_description` VALUES (31, 2, 'ETRIAN ODYSSEY UNTOLD  THE MILLENIUM GIRL', '', '', 0);
INSERT INTO `products_description` VALUES (31, 1, 'ETRIAN ODYSSEY UNTOLD  THE MILLENIUM GIRL', '', '', 0);
INSERT INTO `products_description` VALUES (32, 2, 'Hometown Story', '', '', 0);
INSERT INTO `products_description` VALUES (32, 1, 'Hometown Story', '', '', 0);
INSERT INTO `products_description` VALUES (33, 2, 'Nintendo 2DS Blue', 'FEATURES\r\nCompatibility with all Nintendo 3DS and most Nintendo DS games\r\nAccess to the Nintendo eShop, with digital games, free demos, and special offers\r\nWireless connectivity for multiplayer and co-op play\r\nParental controls that let adults manage the system''s content\r\n\r\n\r\nDESCRIPTION \r\n \r\nOffering you additional variety and value in your handheld gaming options, the Nintendo 2DS is a streamlined version of the Nintendo 3DS that will play games available for Nintendo 3DS, as well as Nintendo DS in 2D.\r\n\r\nThe Nintendo 2DS retains many of the same hardware features as the Nintendo 3DS including the same Nintendo 3DS gameplay controls, backwards compatibility with the vast existing library of Nintendo DS games, as well as wireless connectivity features such as access to Nintendo eShop as well as StreetPass and SpotPass functionality. However the console takes on a new distinctive fixed, slate form design, and will play all packaged and download Nintendo 3DS games in 2D.\r\n\r\nThe new console is designed as an entry point into, or a new way to enjoy the Nintendo handheld experience and will be available at launch in two colour combinations, Black & Blue and White & Red, with a Nintendo 2DS Carrying Case (in either Blue or Red) that can be purchased separately.', '', 1);
INSERT INTO `products_description` VALUES (33, 1, 'Nintendo 2DS Blue', 'FEATURES\r\nCompatibility with all Nintendo 3DS and most Nintendo DS games\r\nAccess to the Nintendo eShop, with digital games, free demos, and special offers\r\nWireless connectivity for multiplayer and co-op play\r\nParental controls that let adults manage the system''s content\r\n\r\n\r\nDESCRIPTION \r\n \r\nOffering you additional variety and value in your handheld gaming options, the Nintendo 2DS is a streamlined version of the Nintendo 3DS that will play games available for Nintendo 3DS, as well as Nintendo DS in 2D.\r\n\r\nThe Nintendo 2DS retains many of the same hardware features as the Nintendo 3DS including the same Nintendo 3DS gameplay controls, backwards compatibility with the vast existing library of Nintendo DS games, as well as wireless connectivity features such as access to Nintendo eShop as well as StreetPass and SpotPass functionality. However the console takes on a new distinctive fixed, slate form design, and will play all packaged and download Nintendo 3DS games in 2D.\r\n\r\nThe new console is designed as an entry point into, or a new way to enjoy the Nintendo handheld experience and will be available at launch in two colour combinations, Black & Blue and White & Red, with a Nintendo 2DS Carrying Case (in either Blue or Red) that can be purchased separately.', '', 0);
INSERT INTO `products_description` VALUES (34, 2, 'Nintendo 3DS XL Red (Bonus Mario 3D Land Pre Installed)', '', '', 0);
INSERT INTO `products_description` VALUES (34, 1, 'Nintendo 3DS XL Red (Bonus Mario 3D Land Pre Installed)', '', '', 0);
INSERT INTO `products_description` VALUES (35, 2, 'WII U Gamepad Crystal Case', '', '', 4);
INSERT INTO `products_description` VALUES (35, 1, 'WII U Gamepad Crystal Case', '', '', 0);
INSERT INTO `products_description` VALUES (36, 2, 'WII U Gamepad Screen Guard (Project Design)', '', '', 0);
INSERT INTO `products_description` VALUES (36, 1, 'WII U Gamepad Screen Guard (Project Design)', '', '', 0);
INSERT INTO `products_description` VALUES (37, 2, '[WII U] DISNEY INFINITY', '', '', 1);
INSERT INTO `products_description` VALUES (37, 1, '[WII U] DISNEY INFINITY', '', '', 0);
INSERT INTO `products_description` VALUES (38, 2, '[WII U] Monster Hunter 3 Ultimate WII U', 'Hanya Tersedia untuk pembelian online saja.', '', 0);
INSERT INTO `products_description` VALUES (38, 1, '[WII U] Monster Hunter 3 Ultimate WII U', 'Hanya Tersedia untuk pembelian online saja.', '', 0);
INSERT INTO `products_description` VALUES (39, 2, '[WII U] New Super Mario Bros. U', '', '', 0);
INSERT INTO `products_description` VALUES (39, 1, '[WII U] New Super Mario Bros. U', '', '', 0);
INSERT INTO `products_description` VALUES (40, 2, '[WII U] TOM CLANCY''S SPLINTER CELL  BLACK LIST', 'Hanya Tersedia untuk pembelian online saja.', '', 0);
INSERT INTO `products_description` VALUES (40, 1, '[WII U] TOM CLANCY''S SPLINTER CELL  BLACK LIST', 'Hanya Tersedia untuk pembelian online saja.', '', 0);
INSERT INTO `products_description` VALUES (41, 2, '[WII U] Zombi U', '', '', 1);
INSERT INTO `products_description` VALUES (41, 1, '[WII U] Zombi U', '', '', 0);
INSERT INTO `products_description` VALUES (42, 2, 'The Legend of Zelda The Wind Waker HD', 'Hanya Tersedia untuk pembelian online saja.', '', 0);
INSERT INTO `products_description` VALUES (42, 1, 'The Legend of Zelda The Wind Waker HD', 'Hanya Tersedia untuk pembelian online saja.', '', 0);
INSERT INTO `products_description` VALUES (43, 2, 'Nintendo WII U Deluxe Set', 'Hanya Tersedia untuk pembelian online saja.\r\n\r\nKelengkapan :\r\n\r\nNintendo Wii U Console 32GB (Black)\r\nWii U GamePad\r\nAC Adapter for each\r\nWii U Sensor Bar\r\nWii U Sensor Bar\r\nGamePad Charging Cradle\r\nStands for GamePad and Console\r\nNintendo Land Video Game', '', 10);
INSERT INTO `products_description` VALUES (43, 1, 'Nintendo WII U Deluxe Set', 'Hanya Tersedia untuk pembelian online saja.\r\n\r\nKelengkapan :\r\n\r\nNintendo Wii U Console 32GB (Black)\r\nWii U GamePad\r\nAC Adapter for each\r\nWii U Sensor Bar\r\nWii U Sensor Bar\r\nGamePad Charging Cradle\r\nStands for GamePad and Console\r\nNintendo Land Video Game', '', 2);
INSERT INTO `products_description` VALUES (44, 2, 'PS4 Camera', '', '', 0);
INSERT INTO `products_description` VALUES (44, 1, 'PS4 Camera', '', '', 0);
INSERT INTO `products_description` VALUES (45, 2, 'PS4 Dualshock 4', '', '', 0);
INSERT INTO `products_description` VALUES (45, 1, 'PS4 Dualshock 4', '', '', 0);
INSERT INTO `products_description` VALUES (46, 2, 'Battlefield 4', '', '', 0);
INSERT INTO `products_description` VALUES (46, 1, 'Battlefield 4', '', '', 0);
INSERT INTO `products_description` VALUES (47, 2, 'Fifa 2014', '', '', 0);
INSERT INTO `products_description` VALUES (47, 1, 'Fifa 2014', '', '', 0);
INSERT INTO `products_description` VALUES (48, 2, 'Infamous Second Son', '', '', 0);
INSERT INTO `products_description` VALUES (48, 1, 'Infamous Second Son', '', '', 0);
INSERT INTO `products_description` VALUES (49, 2, 'Killzone Shadow Fall', '', '', 0);
INSERT INTO `products_description` VALUES (49, 1, 'Killzone Shadow Fall', '', '', 0);
INSERT INTO `products_description` VALUES (50, 2, 'Knack', '', '', 0);
INSERT INTO `products_description` VALUES (50, 1, 'Knack', '', '', 0);
INSERT INTO `products_description` VALUES (51, 2, 'Metal Gear Solid V Ground Zeroes', '', '', 0);
INSERT INTO `products_description` VALUES (51, 1, 'Metal Gear Solid V Ground Zeroes', '', '', 0);
INSERT INTO `products_description` VALUES (52, 2, 'Need For Speed Rivals', '', '', 0);
INSERT INTO `products_description` VALUES (52, 1, 'Need For Speed Rivals', '', '', 0);
INSERT INTO `products_description` VALUES (53, 2, 'Playstation 4', 'PS4 500gb HDD\r\nDualshock 4\r\nHDMI Cable\r\nPower Cable\r\nCharger Cable', '', 0);
INSERT INTO `products_description` VALUES (53, 1, 'Playstation 4', 'PS4 500gb HDD\r\nDualshock 4\r\nHDMI Cable\r\nPower Cable\r\nCharger Cable', '', 0);
INSERT INTO `products_description` VALUES (54, 2, 'PS Vita Car Holder', '', '', 0);
INSERT INTO `products_description` VALUES (54, 1, 'PS Vita Car Holder', '', '', 1);
INSERT INTO `products_description` VALUES (55, 2, 'PS Vita Flexible Handgrip', '', '', 0);
INSERT INTO `products_description` VALUES (55, 1, 'PS Vita Flexible Handgrip', '', '', 0);
INSERT INTO `products_description` VALUES (56, 2, 'PS Vita Power Grip (Nyko)', 'Get a new hold on PlayStation Vita with Nyko’s Power Grip. The Power Grip provides more play time for all your favorite PS Vita games and provides a better, more familiar and ergonomic grip to ease strain on hands. The grip features a sleek design for easy storage, a matching black finish to compliment the PS Vita, and a lightweight design that makes it ideal for travel. The Power Grip is great for longer, more comfortable gameplay sessions for any PS Vita owner.', '', 0);
INSERT INTO `products_description` VALUES (56, 1, 'PS Vita Power Grip (Nyko)', 'Get a new hold on PlayStation Vita with Nyko’s Power Grip. The Power Grip provides more play time for all your favorite PS Vita games and provides a better, more familiar and ergonomic grip to ease strain on hands. The grip features a sleek design for easy storage, a matching black finish to compliment the PS Vita, and a lightweight design that makes it ideal for travel. The Power Grip is great for longer, more comfortable gameplay sessions for any PS Vita owner.', '', 0);
INSERT INTO `products_description` VALUES (57, 2, 'Danganronpa Trigger Happy Havoc (Reg 1) English', '', '', 0);
INSERT INTO `products_description` VALUES (57, 1, 'Danganronpa Trigger Happy Havoc (Reg 1) English', '', '', 0);
INSERT INTO `products_description` VALUES (58, 2, 'Deception IV Blood Ties (Reg 3) English', 'Ready 25 Mar 2014', '', 0);
INSERT INTO `products_description` VALUES (58, 1, 'Deception IV Blood Ties (Reg 3) English', 'Ready 25 Mar 2014', '', 0);
INSERT INTO `products_description` VALUES (59, 2, 'Dragon Ball Z Battle of Z PS Vita (Reg 2) English', '', '', 0);
INSERT INTO `products_description` VALUES (59, 1, 'Dragon Ball Z Battle of Z PS Vita (Reg 2) English', '', '', 0);
INSERT INTO `products_description` VALUES (60, 2, 'Dynasty Warriors 8 Xtreme Legends Complete Edition PS Vita Reg 3', '', '', 0);
INSERT INTO `products_description` VALUES (60, 1, 'Dynasty Warriors 8 Xtreme Legends Complete Edition PS Vita Reg 3', '', '', 0);
INSERT INTO `products_description` VALUES (61, 2, 'Final Fantasy X  X-2 HD Remaster (Reg 1) English', 'Ready Maret 2014', '', 0);
INSERT INTO `products_description` VALUES (61, 1, 'Final Fantasy X  X-2 HD Remaster (Reg 1) English', 'Ready Maret 2014', '', 0);
INSERT INTO `products_description` VALUES (62, 2, 'Hatsunemiku Project Diva 2nd (Reg 3) JAPAN', '', '', 0);
INSERT INTO `products_description` VALUES (62, 1, 'Hatsunemiku Project Diva 2nd (Reg 3) JAPAN', '', '', 0);
INSERT INTO `products_description` VALUES (63, 2, 'J Star Victory (Reg 2) JAPAN', 'Ready Maret 2014', '', 0);
INSERT INTO `products_description` VALUES (63, 1, 'J Star Victory (Reg 2) JAPAN', 'Ready Maret 2014', '', 0);
INSERT INTO `products_description` VALUES (64, 2, 'Paket Hemat PS Vita Crystal Black 64gb (WIFI Model)', 'Isi Paket :\r\n1 x PS Vita WIFI model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 64gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case\r\n1 x Crystal Case ATAU Silicon Case (Plih Salah Satu)', '', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `products_images`
-- 

CREATE TABLE `products_images` (
  `id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL,
  `image` varchar(64) collate utf8_unicode_ci default NULL,
  `htmlcontent` text collate utf8_unicode_ci,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `products_images_prodid` (`products_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

-- 
-- Dumping data for table `products_images`
-- 

INSERT INTO `products_images` VALUES (15, 67, 'img1823-1381556254.jpg', '', 2);
INSERT INTO `products_images` VALUES (14, 67, 'img1468-1381556223.jpg', '', 1);
INSERT INTO `products_images` VALUES (13, 55, 'img1129-1326771110.jpg', '', 2);
INSERT INTO `products_images` VALUES (6, 35, 'img1592-1356492970.jpg', '', 1);
INSERT INTO `products_images` VALUES (7, 35, 'img1273-1356492956.jpg', '', 2);
INSERT INTO `products_images` VALUES (8, 54, 'img995-1326771163.jpg', '', 1);
INSERT INTO `products_images` VALUES (9, 54, 'img1131-1326771178.jpg', '', 2);
INSERT INTO `products_images` VALUES (10, 54, 'img1132-1326771187.jpg', '', 3);
INSERT INTO `products_images` VALUES (11, 54, 'img1133-1326771196.jpg', '', 4);
INSERT INTO `products_images` VALUES (12, 55, 'img994-1370577980.jpg', '', 1);
INSERT INTO `products_images` VALUES (16, 67, 'img1824-1381556263.jpg', '', 3);
INSERT INTO `products_images` VALUES (17, 68, 'img1467-1381556040.jpg', '', 1);
INSERT INTO `products_images` VALUES (18, 68, 'img1820-1381556055.jpg', '', 2);
INSERT INTO `products_images` VALUES (19, 68, 'img1821-1381556063.jpg', '', 3);
INSERT INTO `products_images` VALUES (20, 69, 'img1469-1381556313.jpg', '', 1);
INSERT INTO `products_images` VALUES (21, 69, 'img1826-1381556369.jpg', '', 2);
INSERT INTO `products_images` VALUES (22, 69, 'img1827-1381556376.jpg', '', 3);
INSERT INTO `products_images` VALUES (23, 70, 'img1524-1390366502.jpeg', '', 1);
INSERT INTO `products_images` VALUES (24, 70, 'img1893-1390366577.jpg', '', 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `products_notifications`
-- 

CREATE TABLE `products_notifications` (
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`products_id`,`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `products_notifications`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `products_options`
-- 

CREATE TABLE `products_options` (
  `products_options_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `products_options_name` varchar(32) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`products_options_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `products_options`
-- 

INSERT INTO `products_options` VALUES (1, 1, 'Color');
INSERT INTO `products_options` VALUES (2, 1, 'Size');
INSERT INTO `products_options` VALUES (3, 1, 'Model');
INSERT INTO `products_options` VALUES (4, 1, 'Memory');
INSERT INTO `products_options` VALUES (5, 1, 'Version');
INSERT INTO `products_options` VALUES (1, 2, 'Color');
INSERT INTO `products_options` VALUES (2, 2, 'Size');
INSERT INTO `products_options` VALUES (3, 2, 'Model');
INSERT INTO `products_options` VALUES (4, 2, 'Memory');
INSERT INTO `products_options` VALUES (5, 2, 'Version');

-- --------------------------------------------------------

-- 
-- Table structure for table `products_options_values`
-- 

CREATE TABLE `products_options_values` (
  `products_options_values_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `products_options_values_name` varchar(64) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`products_options_values_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `products_options_values`
-- 

INSERT INTO `products_options_values` VALUES (1, 1, '4 mb');
INSERT INTO `products_options_values` VALUES (2, 1, '8 mb');
INSERT INTO `products_options_values` VALUES (3, 1, '16 mb');
INSERT INTO `products_options_values` VALUES (4, 1, '32 mb');
INSERT INTO `products_options_values` VALUES (5, 1, 'Value');
INSERT INTO `products_options_values` VALUES (6, 1, 'Premium');
INSERT INTO `products_options_values` VALUES (7, 1, 'Deluxe');
INSERT INTO `products_options_values` VALUES (8, 1, 'PS/2');
INSERT INTO `products_options_values` VALUES (9, 1, 'USB');
INSERT INTO `products_options_values` VALUES (10, 1, 'Download: Windows - English');
INSERT INTO `products_options_values` VALUES (13, 1, 'Box: Windows - English');
INSERT INTO `products_options_values` VALUES (1, 2, '4 mb');
INSERT INTO `products_options_values` VALUES (2, 2, '8 mb');
INSERT INTO `products_options_values` VALUES (3, 2, '16 mb');
INSERT INTO `products_options_values` VALUES (4, 2, '32 mb');
INSERT INTO `products_options_values` VALUES (5, 2, 'Value');
INSERT INTO `products_options_values` VALUES (6, 2, 'Premium');
INSERT INTO `products_options_values` VALUES (7, 2, 'Deluxe');
INSERT INTO `products_options_values` VALUES (8, 2, 'PS/2');
INSERT INTO `products_options_values` VALUES (9, 2, 'USB');
INSERT INTO `products_options_values` VALUES (10, 2, 'Download: Windows - English');
INSERT INTO `products_options_values` VALUES (13, 2, 'Box: Windows - English');

-- --------------------------------------------------------

-- 
-- Table structure for table `products_options_values_to_products_options`
-- 

CREATE TABLE `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL auto_increment,
  `products_options_id` int(11) NOT NULL,
  `products_options_values_id` int(11) NOT NULL,
  PRIMARY KEY  (`products_options_values_to_products_options_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

-- 
-- Dumping data for table `products_options_values_to_products_options`
-- 

INSERT INTO `products_options_values_to_products_options` VALUES (1, 4, 1);
INSERT INTO `products_options_values_to_products_options` VALUES (2, 4, 2);
INSERT INTO `products_options_values_to_products_options` VALUES (3, 4, 3);
INSERT INTO `products_options_values_to_products_options` VALUES (4, 4, 4);
INSERT INTO `products_options_values_to_products_options` VALUES (5, 3, 5);
INSERT INTO `products_options_values_to_products_options` VALUES (6, 3, 6);
INSERT INTO `products_options_values_to_products_options` VALUES (7, 3, 7);
INSERT INTO `products_options_values_to_products_options` VALUES (8, 3, 8);
INSERT INTO `products_options_values_to_products_options` VALUES (9, 3, 9);
INSERT INTO `products_options_values_to_products_options` VALUES (10, 5, 10);
INSERT INTO `products_options_values_to_products_options` VALUES (13, 5, 13);

-- --------------------------------------------------------

-- 
-- Table structure for table `products_to_categories`
-- 

CREATE TABLE `products_to_categories` (
  `products_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY  (`products_id`,`categories_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `products_to_categories`
-- 

INSERT INTO `products_to_categories` VALUES (29, 26);
INSERT INTO `products_to_categories` VALUES (30, 27);
INSERT INTO `products_to_categories` VALUES (31, 27);
INSERT INTO `products_to_categories` VALUES (32, 27);
INSERT INTO `products_to_categories` VALUES (33, 28);
INSERT INTO `products_to_categories` VALUES (34, 28);
INSERT INTO `products_to_categories` VALUES (35, 29);
INSERT INTO `products_to_categories` VALUES (36, 29);
INSERT INTO `products_to_categories` VALUES (37, 30);
INSERT INTO `products_to_categories` VALUES (38, 30);
INSERT INTO `products_to_categories` VALUES (39, 30);
INSERT INTO `products_to_categories` VALUES (40, 30);
INSERT INTO `products_to_categories` VALUES (41, 30);
INSERT INTO `products_to_categories` VALUES (42, 30);
INSERT INTO `products_to_categories` VALUES (43, 31);
INSERT INTO `products_to_categories` VALUES (44, 32);
INSERT INTO `products_to_categories` VALUES (45, 32);
INSERT INTO `products_to_categories` VALUES (46, 33);
INSERT INTO `products_to_categories` VALUES (47, 33);
INSERT INTO `products_to_categories` VALUES (48, 33);
INSERT INTO `products_to_categories` VALUES (49, 33);
INSERT INTO `products_to_categories` VALUES (50, 33);
INSERT INTO `products_to_categories` VALUES (51, 33);
INSERT INTO `products_to_categories` VALUES (52, 33);
INSERT INTO `products_to_categories` VALUES (53, 34);
INSERT INTO `products_to_categories` VALUES (54, 35);
INSERT INTO `products_to_categories` VALUES (55, 35);
INSERT INTO `products_to_categories` VALUES (56, 35);
INSERT INTO `products_to_categories` VALUES (57, 36);
INSERT INTO `products_to_categories` VALUES (58, 36);
INSERT INTO `products_to_categories` VALUES (59, 36);
INSERT INTO `products_to_categories` VALUES (60, 36);
INSERT INTO `products_to_categories` VALUES (61, 36);
INSERT INTO `products_to_categories` VALUES (62, 36);
INSERT INTO `products_to_categories` VALUES (63, 36);
INSERT INTO `products_to_categories` VALUES (64, 37);
INSERT INTO `products_to_categories` VALUES (65, 37);
INSERT INTO `products_to_categories` VALUES (66, 37);
INSERT INTO `products_to_categories` VALUES (67, 37);
INSERT INTO `products_to_categories` VALUES (68, 37);
INSERT INTO `products_to_categories` VALUES (69, 37);
INSERT INTO `products_to_categories` VALUES (70, 37);

-- --------------------------------------------------------

-- 
-- Table structure for table `reviews`
-- 

CREATE TABLE `reviews` (
  `reviews_id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) default NULL,
  `customers_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `reviews_rating` int(1) default NULL,
  `date_added` datetime default NULL,
  `last_modified` datetime default NULL,
  `reviews_status` tinyint(1) NOT NULL default '0',
  `reviews_read` int(5) NOT NULL default '0',
  PRIMARY KEY  (`reviews_id`),
  KEY `idx_reviews_products_id` (`products_id`),
  KEY `idx_reviews_customers_id` (`customers_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `reviews`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `reviews_description`
-- 

CREATE TABLE `reviews_description` (
  `reviews_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `reviews_text` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`reviews_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `reviews_description`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `sec_directory_whitelist`
-- 

CREATE TABLE `sec_directory_whitelist` (
  `id` int(11) NOT NULL auto_increment,
  `directory` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

-- 
-- Dumping data for table `sec_directory_whitelist`
-- 

INSERT INTO `sec_directory_whitelist` VALUES (1, 'admin/backups');
INSERT INTO `sec_directory_whitelist` VALUES (2, 'admin/images/graphs');
INSERT INTO `sec_directory_whitelist` VALUES (3, 'images');
INSERT INTO `sec_directory_whitelist` VALUES (4, 'images/banners');
INSERT INTO `sec_directory_whitelist` VALUES (5, 'images/dvd');
INSERT INTO `sec_directory_whitelist` VALUES (6, 'images/gt_interactive');
INSERT INTO `sec_directory_whitelist` VALUES (7, 'images/hewlett_packard');
INSERT INTO `sec_directory_whitelist` VALUES (8, 'images/matrox');
INSERT INTO `sec_directory_whitelist` VALUES (9, 'images/microsoft');
INSERT INTO `sec_directory_whitelist` VALUES (10, 'images/samsung');
INSERT INTO `sec_directory_whitelist` VALUES (11, 'images/sierra');
INSERT INTO `sec_directory_whitelist` VALUES (12, 'includes/work');
INSERT INTO `sec_directory_whitelist` VALUES (13, 'pub');

-- --------------------------------------------------------

-- 
-- Table structure for table `sessions`
-- 

CREATE TABLE `sessions` (
  `sesskey` varchar(32) collate utf8_unicode_ci NOT NULL,
  `expiry` int(11) unsigned NOT NULL,
  `value` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`sesskey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `sessions`
-- 

INSERT INTO `sessions` VALUES ('b02e15e774e626e4b8fc47d85ffda43c', 1397496836, 'language|s:7:"english";languages_id|s:1:"1";admin|a:2:{s:2:"id";s:1:"1";s:8:"username";s:7:"dexverz";}');
INSERT INTO `sessions` VALUES ('036409800297b5c0e6fb9c8100ee7345', 1397496840, 'sessiontoken|s:32:"a951363ac6a7dafbb3263a0a4f83f31a";cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:9:"indonesia";languages_id|s:1:"2";currency|s:3:"IDR";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:4:{s:4:"page";s:25:"product_reviews_write.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:11:"products_id";s:2:"41";}s:4:"post";a:0:{}}}');
INSERT INTO `sessions` VALUES ('0f42ab1f788b9c5fa3ea0c8fc85fefab', 1398090587, 'sessiontoken|s:32:"eeffc1b36e0111ec3288fbdf142d029a";cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"IDR";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}');

-- --------------------------------------------------------

-- 
-- Table structure for table `specials`
-- 

CREATE TABLE `specials` (
  `specials_id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL,
  `specials_new_products_price` decimal(15,4) NOT NULL,
  `specials_date_added` datetime default NULL,
  `specials_last_modified` datetime default NULL,
  `expires_date` datetime default NULL,
  `date_status_change` datetime default NULL,
  `status` int(1) NOT NULL default '1',
  PRIMARY KEY  (`specials_id`),
  KEY `idx_specials_products_id` (`products_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `specials`
-- 

INSERT INTO `specials` VALUES (5, 53, 600.0000, '2014-04-14 23:41:21', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `tax_class`
-- 

CREATE TABLE `tax_class` (
  `tax_class_id` int(11) NOT NULL auto_increment,
  `tax_class_title` varchar(32) collate utf8_unicode_ci NOT NULL,
  `tax_class_description` varchar(255) collate utf8_unicode_ci NOT NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `tax_class`
-- 

INSERT INTO `tax_class` VALUES (1, 'Taxable Goods', 'The following types of products are included non-food, services, etc', '2014-04-14 22:41:27', '2014-04-14 22:41:27');

-- --------------------------------------------------------

-- 
-- Table structure for table `tax_rates`
-- 

CREATE TABLE `tax_rates` (
  `tax_rates_id` int(11) NOT NULL auto_increment,
  `tax_zone_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_priority` int(5) default '1',
  `tax_rate` decimal(7,4) NOT NULL,
  `tax_description` varchar(255) collate utf8_unicode_ci NOT NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`tax_rates_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `tax_rates`
-- 

INSERT INTO `tax_rates` VALUES (1, 1, 1, 1, 7.0000, 'FL TAX 7.0%', '2014-04-14 22:41:27', '2014-04-14 22:41:27');

-- --------------------------------------------------------

-- 
-- Table structure for table `whos_online`
-- 

CREATE TABLE `whos_online` (
  `customer_id` int(11) default NULL,
  `full_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `session_id` varchar(128) collate utf8_unicode_ci NOT NULL,
  `ip_address` varchar(15) collate utf8_unicode_ci NOT NULL,
  `time_entry` varchar(14) collate utf8_unicode_ci NOT NULL,
  `time_last_click` varchar(14) collate utf8_unicode_ci NOT NULL,
  `last_page_url` text collate utf8_unicode_ci NOT NULL,
  KEY `idx_whos_online_session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `whos_online`
-- 

INSERT INTO `whos_online` VALUES (0, 'Guest', '0f42ab1f788b9c5fa3ea0c8fc85fefab', '127.0.0.1', '1398089128', '1398089147', '/osc/catalog/');

-- --------------------------------------------------------

-- 
-- Table structure for table `zones`
-- 

CREATE TABLE `zones` (
  `zone_id` int(11) NOT NULL auto_increment,
  `zone_country_id` int(11) NOT NULL,
  `zone_code` varchar(32) collate utf8_unicode_ci NOT NULL,
  `zone_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`zone_id`),
  KEY `idx_zones_country_id` (`zone_country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=182 ;

-- 
-- Dumping data for table `zones`
-- 

INSERT INTO `zones` VALUES (1, 223, 'AL', 'Alabama');
INSERT INTO `zones` VALUES (2, 223, 'AK', 'Alaska');
INSERT INTO `zones` VALUES (3, 223, 'AS', 'American Samoa');
INSERT INTO `zones` VALUES (4, 223, 'AZ', 'Arizona');
INSERT INTO `zones` VALUES (5, 223, 'AR', 'Arkansas');
INSERT INTO `zones` VALUES (6, 223, 'AF', 'Armed Forces Africa');
INSERT INTO `zones` VALUES (7, 223, 'AA', 'Armed Forces Americas');
INSERT INTO `zones` VALUES (8, 223, 'AC', 'Armed Forces Canada');
INSERT INTO `zones` VALUES (9, 223, 'AE', 'Armed Forces Europe');
INSERT INTO `zones` VALUES (10, 223, 'AM', 'Armed Forces Middle East');
INSERT INTO `zones` VALUES (11, 223, 'AP', 'Armed Forces Pacific');
INSERT INTO `zones` VALUES (12, 223, 'CA', 'California');
INSERT INTO `zones` VALUES (13, 223, 'CO', 'Colorado');
INSERT INTO `zones` VALUES (14, 223, 'CT', 'Connecticut');
INSERT INTO `zones` VALUES (15, 223, 'DE', 'Delaware');
INSERT INTO `zones` VALUES (16, 223, 'DC', 'District of Columbia');
INSERT INTO `zones` VALUES (17, 223, 'FM', 'Federated States Of Micronesia');
INSERT INTO `zones` VALUES (18, 223, 'FL', 'Florida');
INSERT INTO `zones` VALUES (19, 223, 'GA', 'Georgia');
INSERT INTO `zones` VALUES (20, 223, 'GU', 'Guam');
INSERT INTO `zones` VALUES (21, 223, 'HI', 'Hawaii');
INSERT INTO `zones` VALUES (22, 223, 'ID', 'Idaho');
INSERT INTO `zones` VALUES (23, 223, 'IL', 'Illinois');
INSERT INTO `zones` VALUES (24, 223, 'IN', 'Indiana');
INSERT INTO `zones` VALUES (25, 223, 'IA', 'Iowa');
INSERT INTO `zones` VALUES (26, 223, 'KS', 'Kansas');
INSERT INTO `zones` VALUES (27, 223, 'KY', 'Kentucky');
INSERT INTO `zones` VALUES (28, 223, 'LA', 'Louisiana');
INSERT INTO `zones` VALUES (29, 223, 'ME', 'Maine');
INSERT INTO `zones` VALUES (30, 223, 'MH', 'Marshall Islands');
INSERT INTO `zones` VALUES (31, 223, 'MD', 'Maryland');
INSERT INTO `zones` VALUES (32, 223, 'MA', 'Massachusetts');
INSERT INTO `zones` VALUES (33, 223, 'MI', 'Michigan');
INSERT INTO `zones` VALUES (34, 223, 'MN', 'Minnesota');
INSERT INTO `zones` VALUES (35, 223, 'MS', 'Mississippi');
INSERT INTO `zones` VALUES (36, 223, 'MO', 'Missouri');
INSERT INTO `zones` VALUES (37, 223, 'MT', 'Montana');
INSERT INTO `zones` VALUES (38, 223, 'NE', 'Nebraska');
INSERT INTO `zones` VALUES (39, 223, 'NV', 'Nevada');
INSERT INTO `zones` VALUES (40, 223, 'NH', 'New Hampshire');
INSERT INTO `zones` VALUES (41, 223, 'NJ', 'New Jersey');
INSERT INTO `zones` VALUES (42, 223, 'NM', 'New Mexico');
INSERT INTO `zones` VALUES (43, 223, 'NY', 'New York');
INSERT INTO `zones` VALUES (44, 223, 'NC', 'North Carolina');
INSERT INTO `zones` VALUES (45, 223, 'ND', 'North Dakota');
INSERT INTO `zones` VALUES (46, 223, 'MP', 'Northern Mariana Islands');
INSERT INTO `zones` VALUES (47, 223, 'OH', 'Ohio');
INSERT INTO `zones` VALUES (48, 223, 'OK', 'Oklahoma');
INSERT INTO `zones` VALUES (49, 223, 'OR', 'Oregon');
INSERT INTO `zones` VALUES (50, 223, 'PW', 'Palau');
INSERT INTO `zones` VALUES (51, 223, 'PA', 'Pennsylvania');
INSERT INTO `zones` VALUES (52, 223, 'PR', 'Puerto Rico');
INSERT INTO `zones` VALUES (53, 223, 'RI', 'Rhode Island');
INSERT INTO `zones` VALUES (54, 223, 'SC', 'South Carolina');
INSERT INTO `zones` VALUES (55, 223, 'SD', 'South Dakota');
INSERT INTO `zones` VALUES (56, 223, 'TN', 'Tennessee');
INSERT INTO `zones` VALUES (57, 223, 'TX', 'Texas');
INSERT INTO `zones` VALUES (58, 223, 'UT', 'Utah');
INSERT INTO `zones` VALUES (59, 223, 'VT', 'Vermont');
INSERT INTO `zones` VALUES (60, 223, 'VI', 'Virgin Islands');
INSERT INTO `zones` VALUES (61, 223, 'VA', 'Virginia');
INSERT INTO `zones` VALUES (62, 223, 'WA', 'Washington');
INSERT INTO `zones` VALUES (63, 223, 'WV', 'West Virginia');
INSERT INTO `zones` VALUES (64, 223, 'WI', 'Wisconsin');
INSERT INTO `zones` VALUES (65, 223, 'WY', 'Wyoming');
INSERT INTO `zones` VALUES (66, 38, 'AB', 'Alberta');
INSERT INTO `zones` VALUES (67, 38, 'BC', 'British Columbia');
INSERT INTO `zones` VALUES (68, 38, 'MB', 'Manitoba');
INSERT INTO `zones` VALUES (69, 38, 'NF', 'Newfoundland');
INSERT INTO `zones` VALUES (70, 38, 'NB', 'New Brunswick');
INSERT INTO `zones` VALUES (71, 38, 'NS', 'Nova Scotia');
INSERT INTO `zones` VALUES (72, 38, 'NT', 'Northwest Territories');
INSERT INTO `zones` VALUES (73, 38, 'NU', 'Nunavut');
INSERT INTO `zones` VALUES (74, 38, 'ON', 'Ontario');
INSERT INTO `zones` VALUES (75, 38, 'PE', 'Prince Edward Island');
INSERT INTO `zones` VALUES (76, 38, 'QC', 'Quebec');
INSERT INTO `zones` VALUES (77, 38, 'SK', 'Saskatchewan');
INSERT INTO `zones` VALUES (78, 38, 'YT', 'Yukon Territory');
INSERT INTO `zones` VALUES (79, 81, 'NDS', 'Niedersachsen');
INSERT INTO `zones` VALUES (80, 81, 'BAW', 'Baden-Württemberg');
INSERT INTO `zones` VALUES (81, 81, 'BAY', 'Bayern');
INSERT INTO `zones` VALUES (82, 81, 'BER', 'Berlin');
INSERT INTO `zones` VALUES (83, 81, 'BRG', 'Brandenburg');
INSERT INTO `zones` VALUES (84, 81, 'BRE', 'Bremen');
INSERT INTO `zones` VALUES (85, 81, 'HAM', 'Hamburg');
INSERT INTO `zones` VALUES (86, 81, 'HES', 'Hessen');
INSERT INTO `zones` VALUES (87, 81, 'MEC', 'Mecklenburg-Vorpommern');
INSERT INTO `zones` VALUES (88, 81, 'NRW', 'Nordrhein-Westfalen');
INSERT INTO `zones` VALUES (89, 81, 'RHE', 'Rheinland-Pfalz');
INSERT INTO `zones` VALUES (90, 81, 'SAR', 'Saarland');
INSERT INTO `zones` VALUES (91, 81, 'SAS', 'Sachsen');
INSERT INTO `zones` VALUES (92, 81, 'SAC', 'Sachsen-Anhalt');
INSERT INTO `zones` VALUES (93, 81, 'SCN', 'Schleswig-Holstein');
INSERT INTO `zones` VALUES (94, 81, 'THE', 'Thüringen');
INSERT INTO `zones` VALUES (95, 14, 'WI', 'Wien');
INSERT INTO `zones` VALUES (96, 14, 'NO', 'Niederösterreich');
INSERT INTO `zones` VALUES (97, 14, 'OO', 'Oberösterreich');
INSERT INTO `zones` VALUES (98, 14, 'SB', 'Salzburg');
INSERT INTO `zones` VALUES (99, 14, 'KN', 'Kärnten');
INSERT INTO `zones` VALUES (100, 14, 'ST', 'Steiermark');
INSERT INTO `zones` VALUES (101, 14, 'TI', 'Tirol');
INSERT INTO `zones` VALUES (102, 14, 'BL', 'Burgenland');
INSERT INTO `zones` VALUES (103, 14, 'VB', 'Voralberg');
INSERT INTO `zones` VALUES (104, 204, 'AG', 'Aargau');
INSERT INTO `zones` VALUES (105, 204, 'AI', 'Appenzell Innerrhoden');
INSERT INTO `zones` VALUES (106, 204, 'AR', 'Appenzell Ausserrhoden');
INSERT INTO `zones` VALUES (107, 204, 'BE', 'Bern');
INSERT INTO `zones` VALUES (108, 204, 'BL', 'Basel-Landschaft');
INSERT INTO `zones` VALUES (109, 204, 'BS', 'Basel-Stadt');
INSERT INTO `zones` VALUES (110, 204, 'FR', 'Freiburg');
INSERT INTO `zones` VALUES (111, 204, 'GE', 'Genf');
INSERT INTO `zones` VALUES (112, 204, 'GL', 'Glarus');
INSERT INTO `zones` VALUES (113, 204, 'JU', 'Graubünden');
INSERT INTO `zones` VALUES (114, 204, 'JU', 'Jura');
INSERT INTO `zones` VALUES (115, 204, 'LU', 'Luzern');
INSERT INTO `zones` VALUES (116, 204, 'NE', 'Neuenburg');
INSERT INTO `zones` VALUES (117, 204, 'NW', 'Nidwalden');
INSERT INTO `zones` VALUES (118, 204, 'OW', 'Obwalden');
INSERT INTO `zones` VALUES (119, 204, 'SG', 'St. Gallen');
INSERT INTO `zones` VALUES (120, 204, 'SH', 'Schaffhausen');
INSERT INTO `zones` VALUES (121, 204, 'SO', 'Solothurn');
INSERT INTO `zones` VALUES (122, 204, 'SZ', 'Schwyz');
INSERT INTO `zones` VALUES (123, 204, 'TG', 'Thurgau');
INSERT INTO `zones` VALUES (124, 204, 'TI', 'Tessin');
INSERT INTO `zones` VALUES (125, 204, 'UR', 'Uri');
INSERT INTO `zones` VALUES (126, 204, 'VD', 'Waadt');
INSERT INTO `zones` VALUES (127, 204, 'VS', 'Wallis');
INSERT INTO `zones` VALUES (128, 204, 'ZG', 'Zug');
INSERT INTO `zones` VALUES (129, 204, 'ZH', 'Zürich');
INSERT INTO `zones` VALUES (130, 195, 'A Coruña', 'A Coruña');
INSERT INTO `zones` VALUES (131, 195, 'Alava', 'Alava');
INSERT INTO `zones` VALUES (132, 195, 'Albacete', 'Albacete');
INSERT INTO `zones` VALUES (133, 195, 'Alicante', 'Alicante');
INSERT INTO `zones` VALUES (134, 195, 'Almeria', 'Almeria');
INSERT INTO `zones` VALUES (135, 195, 'Asturias', 'Asturias');
INSERT INTO `zones` VALUES (136, 195, 'Avila', 'Avila');
INSERT INTO `zones` VALUES (137, 195, 'Badajoz', 'Badajoz');
INSERT INTO `zones` VALUES (138, 195, 'Baleares', 'Baleares');
INSERT INTO `zones` VALUES (139, 195, 'Barcelona', 'Barcelona');
INSERT INTO `zones` VALUES (140, 195, 'Burgos', 'Burgos');
INSERT INTO `zones` VALUES (141, 195, 'Caceres', 'Caceres');
INSERT INTO `zones` VALUES (142, 195, 'Cadiz', 'Cadiz');
INSERT INTO `zones` VALUES (143, 195, 'Cantabria', 'Cantabria');
INSERT INTO `zones` VALUES (144, 195, 'Castellon', 'Castellon');
INSERT INTO `zones` VALUES (145, 195, 'Ceuta', 'Ceuta');
INSERT INTO `zones` VALUES (146, 195, 'Ciudad Real', 'Ciudad Real');
INSERT INTO `zones` VALUES (147, 195, 'Cordoba', 'Cordoba');
INSERT INTO `zones` VALUES (148, 195, 'Cuenca', 'Cuenca');
INSERT INTO `zones` VALUES (149, 195, 'Girona', 'Girona');
INSERT INTO `zones` VALUES (150, 195, 'Granada', 'Granada');
INSERT INTO `zones` VALUES (151, 195, 'Guadalajara', 'Guadalajara');
INSERT INTO `zones` VALUES (152, 195, 'Guipuzcoa', 'Guipuzcoa');
INSERT INTO `zones` VALUES (153, 195, 'Huelva', 'Huelva');
INSERT INTO `zones` VALUES (154, 195, 'Huesca', 'Huesca');
INSERT INTO `zones` VALUES (155, 195, 'Jaen', 'Jaen');
INSERT INTO `zones` VALUES (156, 195, 'La Rioja', 'La Rioja');
INSERT INTO `zones` VALUES (157, 195, 'Las Palmas', 'Las Palmas');
INSERT INTO `zones` VALUES (158, 195, 'Leon', 'Leon');
INSERT INTO `zones` VALUES (159, 195, 'Lleida', 'Lleida');
INSERT INTO `zones` VALUES (160, 195, 'Lugo', 'Lugo');
INSERT INTO `zones` VALUES (161, 195, 'Madrid', 'Madrid');
INSERT INTO `zones` VALUES (162, 195, 'Malaga', 'Malaga');
INSERT INTO `zones` VALUES (163, 195, 'Melilla', 'Melilla');
INSERT INTO `zones` VALUES (164, 195, 'Murcia', 'Murcia');
INSERT INTO `zones` VALUES (165, 195, 'Navarra', 'Navarra');
INSERT INTO `zones` VALUES (166, 195, 'Ourense', 'Ourense');
INSERT INTO `zones` VALUES (167, 195, 'Palencia', 'Palencia');
INSERT INTO `zones` VALUES (168, 195, 'Pontevedra', 'Pontevedra');
INSERT INTO `zones` VALUES (169, 195, 'Salamanca', 'Salamanca');
INSERT INTO `zones` VALUES (170, 195, 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife');
INSERT INTO `zones` VALUES (171, 195, 'Segovia', 'Segovia');
INSERT INTO `zones` VALUES (172, 195, 'Sevilla', 'Sevilla');
INSERT INTO `zones` VALUES (173, 195, 'Soria', 'Soria');
INSERT INTO `zones` VALUES (174, 195, 'Tarragona', 'Tarragona');
INSERT INTO `zones` VALUES (175, 195, 'Teruel', 'Teruel');
INSERT INTO `zones` VALUES (176, 195, 'Toledo', 'Toledo');
INSERT INTO `zones` VALUES (177, 195, 'Valencia', 'Valencia');
INSERT INTO `zones` VALUES (178, 195, 'Valladolid', 'Valladolid');
INSERT INTO `zones` VALUES (179, 195, 'Vizcaya', 'Vizcaya');
INSERT INTO `zones` VALUES (180, 195, 'Zamora', 'Zamora');
INSERT INTO `zones` VALUES (181, 195, 'Zaragoza', 'Zaragoza');

-- --------------------------------------------------------

-- 
-- Table structure for table `zones_to_geo_zones`
-- 

CREATE TABLE `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL auto_increment,
  `zone_country_id` int(11) NOT NULL,
  `zone_id` int(11) default NULL,
  `geo_zone_id` int(11) default NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`association_id`),
  KEY `idx_zones_to_geo_zones_country_id` (`zone_country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `zones_to_geo_zones`
-- 

INSERT INTO `zones_to_geo_zones` VALUES (1, 223, 18, 1, NULL, '2014-04-14 22:41:27');
