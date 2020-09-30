-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 23, 2019 at 06:13 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookmymeal`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add register', 7, 'add_register'),
(26, 'Can change register', 7, 'change_register'),
(27, 'Can delete register', 7, 'delete_register'),
(28, 'Can view register', 7, 'view_register'),
(29, 'Can add addcategory', 8, 'add_addcategory'),
(30, 'Can change addcategory', 8, 'change_addcategory'),
(31, 'Can delete addcategory', 8, 'delete_addcategory'),
(32, 'Can view addcategory', 8, 'view_addcategory'),
(33, 'Can add addsubcat', 9, 'add_addsubcat'),
(34, 'Can change addsubcat', 9, 'change_addsubcat'),
(35, 'Can delete addsubcat', 9, 'delete_addsubcat'),
(36, 'Can view addsubcat', 9, 'view_addsubcat'),
(37, 'Can add managepack', 10, 'add_managepack'),
(38, 'Can change managepack', 10, 'change_managepack'),
(39, 'Can delete managepack', 10, 'delete_managepack'),
(40, 'Can view managepack', 10, 'view_managepack'),
(41, 'Can add managemenu', 11, 'add_managemenu'),
(42, 'Can change managemenu', 11, 'change_managemenu'),
(43, 'Can delete managemenu', 11, 'delete_managemenu'),
(44, 'Can view managemenu', 11, 'view_managemenu'),
(45, 'Can add managepackages', 12, 'add_managepackages'),
(46, 'Can change managepackages', 12, 'change_managepackages'),
(47, 'Can delete managepackages', 12, 'delete_managepackages'),
(48, 'Can view managepackages', 12, 'view_managepackages');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `book_register`
--

DROP TABLE IF EXISTS `book_register`;
CREATE TABLE IF NOT EXISTS `book_register` (
  `regid` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `confirm_password` varchar(50) NOT NULL,
  `mobile_number` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `select_city` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `role` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`regid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_register`
--

INSERT INTO `book_register` (`regid`, `full_name`, `email`, `password`, `confirm_password`, `mobile_number`, `gender`, `dob`, `select_city`, `address`, `role`, `status`) VALUES
(9, 'Siddhant', 'siddhantsoni2695@gmail.com', 'Demo@1234', 'Demo@1234', '9826469628', 'male', '1995-06-26', 'Bhopal', 'Ews-344 kotra', 'user', 1),
(3, 'shivam admin', 'admin@gmail.com', '180', '180', '9584673606', 'male', '12/8/1996', 'bhopal', 'mp nagar', 'admin', 1),
(14, 'shivam', 'shivamchourasiya180@gmail.com', '12345', '12345', '8982725691', 'male', '1995-07-03', 'Bhopal', 'Malviya Nagar, nbhiihoa ', 'user', 1),
(16, 'nick', 'nickyadav57@gmail.com', '7999', '7999', '8889747548', 'male', '1998-05-09', 'Indore', 'Vijay Nagar', 'user', 1),
(17, 'book', 'bookmymeal123@gmail.com', '1234', '1234', '8982725697', 'male', '1996-12-04', 'Mumbai', 'mumbai ', 'user', 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'book', 'register'),
(8, 'myadmin', 'addcategory'),
(9, 'myadmin', 'addsubcat'),
(10, 'myadmin', 'managepack'),
(11, 'myadmin', 'managemenu'),
(12, 'myadmin', 'managepackages');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-04-03 15:27:24.043616'),
(2, 'auth', '0001_initial', '2019-04-03 15:27:26.418062'),
(3, 'admin', '0001_initial', '2019-04-03 15:27:27.089773'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-04-03 15:27:27.121012'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-04-03 15:27:27.136668'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-04-03 15:27:27.402210'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-04-03 15:27:27.495965'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-04-03 15:27:27.605275'),
(9, 'auth', '0004_alter_user_username_opts', '2019-04-03 15:27:27.620893'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-04-03 15:27:27.698998'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-04-03 15:27:27.698998'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-04-03 15:27:27.730241'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-04-03 15:27:27.855225'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-04-03 15:27:27.933322'),
(15, 'sessions', '0001_initial', '2019-04-03 15:27:28.136433'),
(16, 'book', '0001_initial', '2019-04-03 15:28:03.503087'),
(17, 'myadmin', '0001_initial', '2019-04-10 08:05:24.746920'),
(18, 'myadmin', '0002_addsubcat', '2019-04-10 11:52:32.899293'),
(19, 'myadmin', '0003_auto_20190411_1245', '2019-04-11 07:15:46.355322'),
(20, 'myadmin', '0004_auto_20190418_1623', '2019-04-18 10:54:09.034087'),
(21, 'myadmin', '0004_auto_20190419_0137', '2019-04-18 20:07:55.369224');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('wuvx9jnxqtsjqolt253lvt65jlfd13kz', 'NThkNTllMjcxNmU2ODA4ZDMwOTA4OGQxOTg4N2ZiMzcyZmQxMzRjOTp7InN1bm0iOiJzaGl2YW1jaG91cmFzaXlhMTgwQGdtYWlsLmNvbSIsInNyb2xlIjoidXNlciJ9', '2019-05-07 05:58:50.530269');

-- --------------------------------------------------------

--
-- Table structure for table `myadmin_addcategory`
--

DROP TABLE IF EXISTS `myadmin_addcategory`;
CREATE TABLE IF NOT EXISTS `myadmin_addcategory` (
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  `catnm` varchar(50) NOT NULL,
  `catdisc` varchar(1000) NOT NULL,
  `caticon` varchar(100) NOT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `myadmin_addcategory`
--

INSERT INTO `myadmin_addcategory` (`catid`, `catnm`, `catdisc`, `caticon`) VALUES
(2, 'Indian', 'The traditional food of India has been widely appreciated for its fabulous use of herbs and spices. ', 'DSCN2037-1_yGuRnEO.jpg'),
(3, 'Italian', 'Traditional Central Italian cuisine uses ingredients such as tomatoes, all kinds of meat.', 'image8_TV4A4c4.jpg'),
(5, 'Chinese', 'A typical Chinese meal will have two things - a carbohydrate or starch like noodles, rice or buns', '1473934428-open-house-rev-1_xKdZbQU.jpg'),
(6, 'Amarican', ' American cuisine refers to a type of fusion cuisine which assimilates flavors from the melting.', '5fc4cfe09f9d22a5d2b02f1ef66fc889_YQoqkrQ.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `myadmin_addsubcategory`
--

DROP TABLE IF EXISTS `myadmin_addsubcategory`;
CREATE TABLE IF NOT EXISTS `myadmin_addsubcategory` (
  `subcatid` int(11) NOT NULL AUTO_INCREMENT,
  `subcatnm` varchar(50) NOT NULL,
  `catnm` varchar(50) NOT NULL,
  `subcatdisc` varchar(1000) NOT NULL,
  `subcaticon` varchar(100) NOT NULL,
  `subcatprice` varchar(50) NOT NULL,
  PRIMARY KEY (`subcatid`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `myadmin_addsubcategory`
--

INSERT INTO `myadmin_addsubcategory` (`subcatid`, `subcatnm`, `catnm`, `subcatdisc`, `subcaticon`, `subcatprice`) VALUES
(3, 'Dal Bafle', 'Indian', 'Tasty & spicy Dal & Bafle With Churma', 'images.jpg', '70'),
(4, 'Aloo Tikki', 'Indian', 'Tasty & spicy Aloo Tikki [2 tikki With Ketchup]', 'aloo-tikki-recipe-1.jpg', '80'),
(5, 'Makki Ki Roti', 'Indian', 'Tasty & spicy Makki ki Roti [2 Roti With Sarso da sag]', 'Makki-Ki-Roti-Recipe.jpg', '100'),
(6, 'Dosa', 'Indian', 'Tasty & spicy Masala Dosa [One large Dosa with Two Chatni]', '61879742.jpg', '100'),
(7, 'Italian Pizza', 'Italian', 'Italian Pizza With Olives & multiple Vegitables', 'pizza.jpeg', '100'),
(8, 'Lasagune', 'Italian', 'Tasty Lasagune Food ', 'img.finedininglovers.com.jpg', '110'),
(9, 'Risotto', 'Italian', 'Tasty Risotto Food ', 'xl_9604_risotto-finedininglovers-TP.jpg', '90'),
(10, 'Arancini', 'Italian', 'Tasty & spicy Aloo Tikki [2 Arancihi With Ketchup]', 'ggc.jpg', '90'),
(11, 'Chinese Noodles', 'Chinese', 'Tasty Chinese Noodels with Fresh Vegitable', '52566811.cms.jpg', '90'),
(12, 'Tofu', 'Chinese', 'Tasty Tofu Food', 'honey-garlic-tofu-recipe-5.jpg', '100'),
(13, 'Red braised pork belly', 'Chinese', 'Tasty Red braised pork belly', 'Szechuan-Braised-Pork-Belly1.jpg', '80'),
(14, 'Dragon\'s beard candy', 'Chinese', 'Tasty Dragon\'s beard candy [2 Candy]', 'dragonbeardcandy.jpg', '90'),
(15, 'Apple Pie', 'Amarican', 'Food Apple Pie Dish', 'apple.jpg', '90'),
(16, 'Homburger', 'Amarican', 'Tasty & Fresh Burger Food', 'Shack burger, Shake Shack5.jpeg', '100'),
(17, ' Chicago-style pizza', 'Amarican', 'Tasty  Chicago-style pizza', 'Illinois-Deep-Dish-Pizza.jpg', '120'),
(18, 'Clam chowder', 'Amarican', 'Tasty and Sweet Clam chowder', 'D0OeRKrX0Ag4aYl.jpg', '90');

-- --------------------------------------------------------

--
-- Table structure for table `myadmin_managemenu`
--

DROP TABLE IF EXISTS `myadmin_managemenu`;
CREATE TABLE IF NOT EXISTS `myadmin_managemenu` (
  `mealid` int(11) NOT NULL AUTO_INCREMENT,
  `mealnm` varchar(50) NOT NULL,
  `mealprice` varchar(50) NOT NULL,
  `mealdisc` varchar(50) NOT NULL,
  `mealimg` varchar(50) NOT NULL,
  `mealcatnm` varchar(50) NOT NULL,
  PRIMARY KEY (`mealid`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `myadmin_managemenu`
--

INSERT INTO `myadmin_managemenu` (`mealid`, `mealnm`, `mealprice`, `mealdisc`, `mealimg`, `mealcatnm`) VALUES
(5, 'Tost ,Omlatte', '70', 'Fresh &Teasty Food', 'Western-Omelette.jpg', 'break'),
(6, 'Tost Eag', '40', 'Tost & Eag Combination ', '1426623863-love-toast.jpg', 'break'),
(7, 'Bread Omlatte', '50', 'Bread & omlatte', 'maxresdefault.jpg', 'break'),
(8, 'SandWich', '50', 'Fresh &Teasty sandwich', 'sand.jpg', 'break'),
(9, 'Hot Sandwich', '60', 'Hot-dog Sandwich', 'hot.jpg', 'break'),
(11, 'Poha', '40', 'Fresh &Teasty Poha.', '62336036.cms.jpg', 'break'),
(12, 'Cappuccino Coffee', '50', 'Teasty Coffee ', 'cappuccino-small.jpg', 'coffee'),
(13, 'Espresso Coffee', '60', 'Teasty Coffee', 'affè_a_Ventimiglia.jpg', 'coffee'),
(14, 'Latte', '60', 'Teasty Coffee', 'Protein.jpg', 'coffee'),
(15, 'Caffe Mocha', '70', 'Teasty Coffee', 'vgvh.jpg', 'coffee'),
(16, 'Green Tea', '40', 'Teasty Tea ', 'green.jpg', 'coffee'),
(17, 'Tea', '40', 'Teasty Tea', 'trakm.jpg', 'coffee'),
(18, 'Aloo Gobi', '60', 'teasty Vegitable Food', 'aloo.jpg', 'lunch'),
(19, 'Butter Chicken', '70', 'Teasty Butter Chiken food with Vagitable', '53205522.cms.jpg', 'lunch'),
(20, 'Matar Paneer', '80', 'Tasty matar paneer ', '53251884.cms.gif', 'lunch'),
(21, 'Sahi paneer', '100', 'Yummy sahi paneer with extra dry fruits', 'sahi paneer.jpg', 'lunch'),
(23, 'Roti', '10', 'Fresh Butter Roti  [Per Roti]', 'roti.jpg', 'lunch'),
(24, 'Dum Aloo', '60', 'Tasty & spicy Dum Aloo', 'dum.jpg', 'dinner'),
(25, 'Dal Makhani', '60', 'testy & spicy Dal Makhni ', 'dal.jpg', 'dinner'),
(26, 'Kabab', '70', 'Healthy ,Fresh & Tasty Kabab', 'kab.jpg', 'dinner'),
(27, 'Samosa', '10', 'Tasty Samosa With Ketchup[Per Samosa]', 'samosa.jpg', 'snaks'),
(28, 'Kachori', '10', 'Tasty Kachori With Ketchup[Per Samosa]', 'kachori.gif', 'snaks'),
(29, 'Chicken Tikka', '70', 'tasty Chicken Tikka', 'Chicken_Tikka_Recipe_.jpg', 'snaks'),
(30, 'Veg Cutlet', '60', 'tasty Veg-Cutlet food', 'index.jpg', 'snaks'),
(31, 'Panipuri', '50', 'Tasty & spicy Panipuri', 'pani.jpg', 'snaks');

-- --------------------------------------------------------

--
-- Table structure for table `myadmin_managepackages`
--

DROP TABLE IF EXISTS `myadmin_managepackages`;
CREATE TABLE IF NOT EXISTS `myadmin_managepackages` (
  `packid` int(11) NOT NULL AUTO_INCREMENT,
  `packnm` varchar(50) NOT NULL,
  `packprice` varchar(50) NOT NULL,
  `packdisc` varchar(50) NOT NULL,
  `packimag` varchar(50) NOT NULL,
  `packduration` varchar(50) NOT NULL,
  PRIMARY KEY (`packid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `myadmin_managepackages`
--

INSERT INTO `myadmin_managepackages` (`packid`, `packnm`, `packprice`, `packdisc`, `packimag`, `packduration`) VALUES
(3, 'Veg Food', '2000', '5-Roti,2-vegitable,dal-chaval,salad,one sweet', '2.jpg', 'only one Month(2 times)'),
(4, 'Non-Veg Food', '2500', '5-Roti,chiken,kari,leg-pice,chaval,salad', '958311717.jpg.png', 'Only One Month(2 times)'),
(5, 'Healthy Food', '1000', 'Vegitables,fruits,Eag', 'fresh.jpg', '1 Month Only (1 times)'),
(6, 'Junk Food', '1000', '1-Burger,tomato Sose,Salide', 'junck.jpg', '1 Month Only (1 times)');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
