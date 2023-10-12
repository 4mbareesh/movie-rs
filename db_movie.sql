-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2023 at 08:04 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_movie`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(21, 'Can add category', 6, 'add_category'),
(22, 'Can change category', 6, 'change_category'),
(23, 'Can delete category', 6, 'delete_category'),
(24, 'Can view category', 6, 'view_category'),
(25, 'Can add login', 7, 'add_login'),
(26, 'Can change login', 7, 'change_login'),
(27, 'Can delete login', 7, 'delete_login'),
(28, 'Can view login', 7, 'view_login'),
(29, 'Can add movie', 8, 'add_movie'),
(30, 'Can change movie', 8, 'change_movie'),
(31, 'Can delete movie', 8, 'delete_movie'),
(32, 'Can view movie', 8, 'view_movie'),
(33, 'Can add movie_person', 9, 'add_movie_person'),
(34, 'Can change movie_person', 9, 'change_movie_person'),
(35, 'Can delete movie_person', 9, 'delete_movie_person'),
(36, 'Can view movie_person', 9, 'view_movie_person'),
(37, 'Can add production', 10, 'add_production'),
(38, 'Can change production', 10, 'change_production'),
(39, 'Can delete production', 10, 'delete_production'),
(40, 'Can view production', 10, 'view_production'),
(41, 'Can add user', 11, 'add_user'),
(42, 'Can change user', 11, 'change_user'),
(43, 'Can delete user', 11, 'delete_user'),
(44, 'Can view user', 11, 'view_user'),
(45, 'Can add reviews', 12, 'add_reviews'),
(46, 'Can change reviews', 12, 'change_reviews'),
(47, 'Can delete reviews', 12, 'delete_reviews'),
(48, 'Can view reviews', 12, 'view_reviews'),
(49, 'Can add rating', 13, 'add_rating'),
(50, 'Can change rating', 13, 'change_rating'),
(51, 'Can delete rating', 13, 'delete_rating'),
(52, 'Can view rating', 13, 'view_rating'),
(53, 'Can add move_category', 14, 'add_move_category'),
(54, 'Can change move_category', 14, 'change_move_category'),
(55, 'Can delete move_category', 14, 'delete_move_category'),
(56, 'Can view move_category', 14, 'view_move_category'),
(57, 'Can add history', 15, 'add_history'),
(58, 'Can change history', 15, 'change_history'),
(59, 'Can delete history', 15, 'delete_history'),
(60, 'Can view history', 15, 'view_history'),
(61, 'Can add crew', 16, 'add_crew'),
(62, 'Can change crew', 16, 'change_crew'),
(63, 'Can delete crew', 16, 'delete_crew'),
(64, 'Can view crew', 16, 'view_crew'),
(65, 'Can add session', 17, 'add_session'),
(66, 'Can change session', 17, 'change_session'),
(67, 'Can delete session', 17, 'delete_session'),
(68, 'Can view session', 17, 'view_session'),
(69, 'Can add theatre', 18, 'add_theatre'),
(70, 'Can change theatre', 18, 'change_theatre'),
(71, 'Can delete theatre', 18, 'delete_theatre'),
(72, 'Can view theatre', 18, 'view_theatre'),
(73, 'Can add staff', 19, 'add_staff'),
(74, 'Can change staff', 19, 'change_staff'),
(75, 'Can delete staff', 19, 'delete_staff'),
(76, 'Can view staff', 19, 'view_staff'),
(77, 'Can add show', 20, 'add_show'),
(78, 'Can change show', 20, 'change_show'),
(79, 'Can delete show', 20, 'delete_show'),
(80, 'Can view show', 20, 'view_show'),
(81, 'Can add booking', 21, 'add_booking'),
(82, 'Can change booking', 21, 'change_booking'),
(83, 'Can delete booking', 21, 'delete_booking'),
(84, 'Can view booking', 21, 'view_booking');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_booking`
--

CREATE TABLE `blog_booking` (
  `booking_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `tickets` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_booking`
--

INSERT INTO `blog_booking` (`booking_id`, `show_id`, `user_id`, `amount`, `tickets`) VALUES
(2, 1, 1, '350', '2'),
(3, 2, 1, '525', '3');

-- --------------------------------------------------------

--
-- Table structure for table `blog_category`
--

CREATE TABLE `blog_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_category`
--

INSERT INTO `blog_category` (`category_id`, `category_name`) VALUES
(2, 'SiFi'),
(3, 'classic'),
(4, 'crime thrilar'),
(5, 'romantic'),
(6, 'ficition'),
(7, 'Comady'),
(8, 'action'),
(9, 'drama '),
(10, 'horror');

-- --------------------------------------------------------

--
-- Table structure for table `blog_crew`
--

CREATE TABLE `blog_crew` (
  `crew_id` int(11) NOT NULL,
  `person_role` varchar(100) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_history`
--

CREATE TABLE `blog_history` (
  `hist_id` int(11) NOT NULL,
  `date` varchar(100) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_history`
--

INSERT INTO `blog_history` (`hist_id`, `date`, `movie_id`, `user_id`) VALUES
(1, '2023-03-21', 1, 1),
(2, '2023-03-23', 1, 3),
(3, '2023-03-26', 1, 5),
(4, '2023-03-27', 9, 1),
(5, '2023-04-01', 7, 1),
(6, '2023-04-10', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_login`
--

CREATE TABLE `blog_login` (
  `log_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_login`
--

INSERT INTO `blog_login` (`log_id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'user', '123', 'user'),
(3, 'abukk', '123456', 'user'),
(4, 'hhh', '123', 'user'),
(5, 'a', 'a', 'user'),
(6, 'user1', '123', 'user'),
(8, 'rajtheatre@gmail.com', '123', 'theatre'),
(9, 'staff1@gmail.com', '123', 'staff'),
(10, 'staff2@gmail.com', '123', 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `blog_move_category`
--

CREATE TABLE `blog_move_category` (
  `movie_catid` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `move_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_move_category`
--

INSERT INTO `blog_move_category` (`movie_catid`, `category_id`, `move_id`) VALUES
(2, 8, 7),
(3, 9, 7),
(4, 4, 8),
(5, 8, 8),
(6, 3, 9),
(7, 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `blog_movie`
--

CREATE TABLE `blog_movie` (
  `movie_id` int(11) NOT NULL,
  `movie_name` varchar(200) NOT NULL,
  `language` varchar(200) NOT NULL,
  `poster` varchar(200) NOT NULL,
  `movie_description` varchar(1000) NOT NULL,
  `release_date` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `production_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_movie`
--

INSERT INTO `blog_movie` (`movie_id`, `movie_name`, `language`, `poster`, `movie_description`, `release_date`, `status`, `production_id`) VALUES
(1, 'Neelavelicham', 'Malayalam', 'download.jpg', 'upcoming Indian Malayalam language romantic-horror drama film directed and co-produced by Aashiq Abu under his banner OPM Cinemas. It stars Tovino Thomas, Rima Kallingal and Roshan Mathew in lead roles, with Shine Tom Chacko, Rajesh Madhavan, Abhiram Radhakrishnan and Pramod Veliyanad in supporting roles. The film is based on Vaikom Muhammad Basheer\'s renowned short story of the same name.', '2023-04-23', 'upcoming', 8),
(7, 'Wood', 'English', 'download.jpg', 'wood description', '2023-03-24', 'active', 1),
(8, 'Kaapa', 'Malayalam', 'images.jpg', 'Kaapa description', '2023-03-22', 'active', 7),
(9, 'Aami', 'Malayalam', 'download (5).jpg', 'Aami movie', '2023-03-21', 'active', 6),
(10, 'Nizhal', 'Malayalam', 'download (4).jpg', 'Nizhal', '2023-03-24', 'active', 3);

-- --------------------------------------------------------

--
-- Table structure for table `blog_movie_person`
--

CREATE TABLE `blog_movie_person` (
  `person_id` int(11) NOT NULL,
  `person_name` varchar(200) NOT NULL,
  `person_photo` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_movie_person`
--

INSERT INTO `blog_movie_person` (`person_id`, `person_name`, `person_photo`) VALUES
(2, 'Mohanlal', 'lal.jpeg'),
(3, 'Lal jose', 'lal2.jpeg'),
(4, 'Aleksa Muhammed Fazil ', '330px-Fazil.jpg'),
(5, 'Sreenivasan', '330px-Sreenivasan_2008.jpg'),
(6, 'Priyadarshan', 'Priyadarshan_at_a_press_conference_for_‘Kamaal_Dhamaal_Malamaal’_(cropped).jpg'),
(7, 'Matthew McConaughey', 'Matthew_McConaughey_2019_(48648344772).jpg'),
(8, 'Christopher Nolan', '330px-Christopher_Nolan_Cannes_2018.jpg'),
(9, 'Prithviraj Sukumaran', '330px-Prithviraj_oil_paint_2019.jpg'),
(10, 'Tanu Balak', 'tanu.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `blog_production`
--

CREATE TABLE `blog_production` (
  `production_id` int(11) NOT NULL,
  `banner_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_production`
--

INSERT INTO `blog_production` (`production_id`, `banner_name`) VALUES
(1, 'FOX'),
(3, 'Shirdi Sai Creations'),
(4, 'Fazils'),
(5, 'Paramount Pictures'),
(6, 'Anto Joseph Film Company'),
(7, 'Aashirvad Cinemas'),
(8, 'OPM Cinemas');

-- --------------------------------------------------------

--
-- Table structure for table `blog_rating`
--

CREATE TABLE `blog_rating` (
  `rating_id` int(11) NOT NULL,
  `rating` varchar(100) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_rating`
--

INSERT INTO `blog_rating` (`rating_id`, `rating`, `movie_id`, `user_id`) VALUES
(2, '3', 1, 1),
(3, '5', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `blog_reviews`
--

CREATE TABLE `blog_reviews` (
  `reviewid` int(11) NOT NULL,
  `review` varchar(1000) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_reviews`
--

INSERT INTO `blog_reviews` (`reviewid`, `review`, `movie_id`, `user_id`) VALUES
(2, 'sdfsdfdsf', 1, 1),
(3, 'sdfsdacvrfgrgrgv', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `blog_show`
--

CREATE TABLE `blog_show` (
  `showid` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `theatre_id` int(11) NOT NULL,
  `showtime` varchar(100) NOT NULL,
  `rate` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `seats` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_show`
--

INSERT INTO `blog_show` (`showid`, `movie_id`, `theatre_id`, `showtime`, `rate`, `date`, `status`, `seats`) VALUES
(1, 7, 1, '09:30', '175', '2023-04-20', 'active', '248'),
(2, 7, 1, '12:00', '175', '2023-04-20', 'active', '247');

-- --------------------------------------------------------

--
-- Table structure for table `blog_staff`
--

CREATE TABLE `blog_staff` (
  `staffid` int(11) NOT NULL,
  `staffname` varchar(200) NOT NULL,
  `staffimage` varchar(100) NOT NULL,
  `staffphone` bigint(20) NOT NULL,
  `staffemail` varchar(254) NOT NULL,
  `login_id` int(11) NOT NULL,
  `thtr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_staff`
--

INSERT INTO `blog_staff` (`staffid`, `staffname`, `staffimage`, `staffphone`, `staffemail`, `login_id`, `thtr_id`) VALUES
(1, 'Staff1', 'images/men1.jpg', 9526358746, 'staff1@gmail.com', 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_theatre`
--

CREATE TABLE `blog_theatre` (
  `theatreid` int(11) NOT NULL,
  `theatre_name` varchar(200) NOT NULL,
  `theatre_place` varchar(200) NOT NULL,
  `login_id` int(11) NOT NULL,
  `reg_num` varchar(200) NOT NULL,
  `address` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_theatre`
--

INSERT INTO `blog_theatre` (`theatreid`, `theatre_name`, `theatre_place`, `login_id`, `reg_num`, `address`) VALUES
(1, 'Raj', 'Paripally Junction', 8, 'raj/123/1978', 'Raj,\r\nParipally');

-- --------------------------------------------------------

--
-- Table structure for table `blog_user`
--

CREATE TABLE `blog_user` (
  `User_id` int(11) NOT NULL,
  `User_name` varchar(200) NOT NULL,
  `User_email` varchar(100) NOT NULL,
  `User_phone` varchar(100) NOT NULL,
  `Log_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_user`
--

INSERT INTO `blog_user` (`User_id`, `User_name`, `User_email`, `User_phone`, `Log_id_id`) VALUES
(1, 'arun', 'arun@gmail.com', '9089786756', 2),
(2, 'abu', 'abu@gmail.com', '9898987878', 3),
(3, 'kakhu', 'kkk@gmail.com', '9089786787', 4),
(4, 'a', 'aa', '21', 5),
(5, 'user1', 'user1@gmail.com', '9747562345', 6);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(21, 'blog', 'booking'),
(6, 'blog', 'category'),
(16, 'blog', 'crew'),
(15, 'blog', 'history'),
(7, 'blog', 'login'),
(14, 'blog', 'move_category'),
(8, 'blog', 'movie'),
(9, 'blog', 'movie_person'),
(10, 'blog', 'production'),
(13, 'blog', 'rating'),
(12, 'blog', 'reviews'),
(20, 'blog', 'show'),
(19, 'blog', 'staff'),
(18, 'blog', 'theatre'),
(11, 'blog', 'user'),
(5, 'contenttypes', 'contenttype'),
(17, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'blog', '0001_initial', '2023-02-16 06:07:10.105602'),
(2, 'contenttypes', '0001_initial', '2023-02-16 06:08:14.697639'),
(3, 'auth', '0001_initial', '2023-02-16 06:08:15.029678'),
(4, 'admin', '0001_initial', '2023-02-16 06:08:15.126232'),
(5, 'admin', '0002_logentry_remove_auto_add', '2023-02-16 06:08:15.137415'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-16 06:08:15.146472'),
(7, 'contenttypes', '0002_remove_content_type_name', '2023-02-16 06:08:23.306318'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-02-16 06:08:23.352530'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-02-16 06:08:23.368822'),
(10, 'auth', '0004_alter_user_username_opts', '2023-02-16 06:08:23.376429'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-02-16 06:08:23.417395'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-02-16 06:08:23.417395'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-02-16 06:08:23.435844'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-02-16 06:08:23.449514'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-02-16 06:08:23.467165'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-02-16 06:08:23.482040'),
(17, 'auth', '0011_update_proxy_permissions', '2023-02-16 06:08:23.498688'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-02-16 06:08:23.517752'),
(19, 'sessions', '0001_initial', '2023-02-16 06:08:52.533849'),
(20, 'blog', '0002_theatre_staff', '2023-03-26 02:13:35.402836'),
(21, 'blog', '0003_theatre_reg_num', '2023-03-26 03:04:13.294821'),
(22, 'blog', '0004_staff_thtr_theatre_add', '2023-03-26 03:04:31.014492'),
(23, 'blog', '0005_rename_add_theatre_address', '2023-03-26 03:35:04.814196'),
(24, 'blog', '0006_show', '2023-03-26 19:12:51.752431'),
(25, 'blog', '0007_show_showtime', '2023-04-01 18:29:25.290448'),
(26, 'blog', '0008_show_rate', '2023-04-01 18:34:10.507581'),
(27, 'blog', '0009_show_enddate_show_startdate_show_status', '2023-04-08 19:29:46.063508'),
(28, 'blog', '0010_rename_teatre_show_theatre', '2023-04-08 19:30:46.565540'),
(29, 'blog', '0011_show_seats', '2023-04-08 19:58:37.176197'),
(30, 'blog', '0012_rename_enddate_show_date_remove_show_startdate', '2023-04-10 13:15:48.002973'),
(31, 'blog', '0013_booking', '2023-04-10 14:53:25.622046'),
(32, 'blog', '0014_booking_amount_booking_tickets', '2023-04-10 14:55:39.607623');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0pcflx3vqwavcingnvpo3mest4ryle81', '.eJyrViotTi3KS8xNVbICM5V0lIryc5B4mSlKVka1ABbJDOI:1plriN:RGl72PS_b22jBMXi1BQPUHoJPZmgT-1PVJL4_T3ZHbQ', '2023-04-24 13:37:47.204596'),
('0sj6fbd4lwtixvcy7j3ren7c5c14tqxp', '.eJyrViotTi3KS8xNVbJSSkzJzcxT0lEqys9B5mamKFkZ1gIAMM4NdQ:1mQ1uS:NV005DvwBk-QSCcI_G7MseGsrCiSSgnUgifDZb_tj04', '2021-09-28 06:27:12.069440'),
('4gjnywg2ralg2b3l8covu6extsciplfb', '.eJyrViotTi3KS8xNVbICM5V0lIryc5B4mSlKVka1ABbJDOI:1pfJUN:FxirDLqawC_g38R6eFa8RgKz675pLwUhA5kTZAxMWyg', '2023-04-06 11:52:15.388032'),
('4r92er2odercwbqsg3shbznotvp1xjux', '.eJyrViotTi3KS8xNVbICM5V0lIryc5B4mSlKVka1ABbJDOI:1plpMq:7cEiAyJYL2plUuusdXM01l6oRzIGkuVMJBBri-svb3s', '2023-04-24 11:07:24.363549'),
('65h1rg8e3b4kqdis99y0sezbjbyrjout', '.eJyrViotTi3KS8xNVbJSSkzJzcxT0lEqys9B5mamKFkZ1gIAMM4NdQ:1mQ3Zc:vP_KDp-Mohu3uoPcRM7HJkX4AlpTu3AVVzYOWbUfyaE', '2021-09-28 08:13:48.703243'),
('9st3l2g2ul0r31r621csno0s9rqp9ofv', 'eyJ1c2VybmFtZSI6ImEiLCJyb2xlIjoidXNlciIsImlkIjo1fQ:1pfJYd:8mD_CmoWD1Gatalzx0MurS5EXgPqtUliKimNCXWpAjQ', '2023-04-06 11:56:39.178875'),
('amo9l218mgadkg2yl7bnlih0uxxs19wz', '.eJyrViotTi3KS8xNVbICM5V0lIryc5B4mSlKVka1ABbJDOI:1peStx:6CWk0CA0DxrjB44k6GD9JOBnnnmAlXR-iZ0jy-czJyU', '2023-04-04 03:43:09.101747'),
('cd2ht6vap925d5ocfxoba335sv2qgaos', 'eyJ1c2VybmFtZSI6ImFidWtrIiwicm9sZSI6InVzZXIiLCJpZCI6M30:1mXNM4:5A11LVuUw7Elv948p5ZRWpN_82CT0qX6bVtWwA0lkpc', '2021-10-18 12:46:04.163318'),
('cek2ds3vosvohpjjs9vgv061it92wr7z', 'e30:1pgVvc:Gehp_4IEvthO0hzIWuo9032NIWOISc-53VOIE_n8Oqs', '2023-04-09 19:21:20.207999'),
('jlesdxisehccfb6m8ayswnf51e079v8l', '.eJyrViotTi3KS8xNVbICM5V0lIryc5B4mSlKVka1ABbJDOI:1peSuG:U1vZ8KRjrgkQ0uv82Pc-73tZ9vVbEYGbmCCQZaVDhRM', '2023-04-04 03:43:28.162001'),
('lfew48u925ah7vy277zvy1dloo2xhxsc', 'eyJ1c2VybmFtZSI6InN0YWZmMUBnbWFpbC5jb20iLCJyb2xlIjoic3RhZmYiLCJpZCI6OX0:1pifob:pYKAgnbt-PJhHfa-PPnjAZC1EXBX0k-X84KXPE6i9j4', '2023-04-15 18:19:01.187232'),
('ltmwdu3lxqjleo4hqp5xbb0o2zh3mt0g', '.eJyrViotTi3KS8xNVbJSSkzJzcxT0lEqys9B5mamKFkZ1gIAMM4NdQ:1pgIW6:M_kGOINYGoWTvmm41ZNEe80Nil4JeYKsiVLp2uzrZks', '2023-04-09 05:02:06.264059'),
('slbhcpxxn1fqdtohqz1uua92bribc3yu', '.eJyrViotTi3KS8xNVbICM5V0lIryc5B4mSlKVka1ABbJDOI:1pfPI9:hWIjOl50F-uw-dExvBlhsab4wA8R8GQIMYJM-6MU66A', '2023-04-06 18:04:01.850045'),
('td151htny1dpxr5rdq0g6jg5kjt2tbg9', '.eJyrViotTi3KS8xNVbICM5V0lIryc5B4mSlKVka1ABbJDOI:1mXiV4:9Lm5OMei_y9m6PvY210C9WoiexHhzZpFDtAGbN6kAtI', '2021-10-19 11:20:46.315793'),
('w2ht2qs2rz6s60mecg6ip136ueoidwcp', 'eyJ1c2VybmFtZSI6InN0YWZmMUBnbWFpbC5jb20iLCJyb2xlIjoic3RhZmYiLCJpZCI6OX0:1pirzk:__XkEG0I0BeRb0tdKb16StK3goJBJyx6Jl6H6XSFOYg', '2023-04-16 07:19:20.542891'),
('x520tficgi2bxmcrp5rbg96m8tortf4g', '.eJyrViotTi3KS8xNVbJSSkzJzcxT0lEqys9B5mamKFkZ1gIAMM4NdQ:1mP2Wp:FVRQWNIFmfYh1rObZ2PqumNz9TutUYuOEWjIfWUl-6g', '2021-09-25 12:54:43.317911');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cate_id` int(11) NOT NULL,
  `cate_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cate_id`, `cate_name`) VALUES
(1, 'Malayalam'),
(2, 'South'),
(3, 'Bollywood'),
(4, 'Hollywood'),
(5, 'OTT/ Webseries'),
(6, 'Lifestyle'),
(7, 'World'),
(8, 'Food'),
(9, 'Trending');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_data_details`
--

CREATE TABLE `tbl_data_details` (
  `data_id` int(11) NOT NULL,
  `data_category_id` int(11) NOT NULL,
  `data_subcategory` int(11) DEFAULT NULL,
  `keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `title_tag` text NOT NULL,
  `headings` text NOT NULL,
  `home_img` text NOT NULL,
  `home_img_link` text NOT NULL,
  `first_inner_img` text NOT NULL,
  `first_img_link` text NOT NULL,
  `first_inner_content` text NOT NULL,
  `second_inner_img` text NOT NULL,
  `second_img_link` text NOT NULL,
  `second_inner_content` text NOT NULL,
  `third_img` text NOT NULL,
  `third_img_link` text NOT NULL,
  `third_inner_content` text NOT NULL,
  `data_status` varchar(60) NOT NULL,
  `rdate` date NOT NULL,
  `editer_log` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_data_details`
--

INSERT INTO `tbl_data_details` (`data_id`, `data_category_id`, `data_subcategory`, `keywords`, `meta_description`, `title_tag`, `headings`, `home_img`, `home_img_link`, `first_inner_img`, `first_img_link`, `first_inner_content`, `second_inner_img`, `second_img_link`, `second_inner_content`, `third_img`, `third_img_link`, `third_inner_content`, `data_status`, `rdate`, `editer_log`) VALUES
(1, 1, 0, 'sM X 56', 'ghdshjsj cjhcs 						', 'BMANS', 'MNAS ASDC', '1_home_wal3.jpg', 'https://twitter.com/ANI/status/1427846620083752963?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1427846620083752963%7Ctwgr%5E%7Ctwcon%5Es1_&ref_url=https%3A%2F%2Fwww.pinkvilla.com%2Ftrending%2Findia%2Fpm-narendra-modi-offers-ice-cream-medallist-pv-sindhu-post-her-win-tokyo-olympics-2020-862326					  					  ', '1_first_logoexamapp.png', 'https://twitter.com/ANI/status/1427846620083752963?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1427846620083752963%7Ctwgr%5E%7Ctwcon%5Es1_&ref_url=https%3A%2F%2Fwww.pinkvilla.com%2Ftrending%2Findia%2Fpm-narendra-modi-offers-ice-cream-medallist-pv-sindhu-post-her-win-tokyo-olympics-2020-862326					  					  ', '<p>zxz&nbsp; &nbsp; DADASD 67</p>', '1_second_01.PNG', 'https://twitter.com/ANI/status/1427846620083752963?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1427846620083752963%7Ctwgr%5E%7Ctwcon%5Es1_&amp;ref_url=https%3A%2F%2Fwww.pinkvilla.com%2Ftrending%2Findia%2Fpm-narendra-modi-offers-ice-cream-medallist-pv-sindhu-post-her-win-tokyo-olympics-2020-862326', '<p>ASDF 123</p>', '1_logoexamapp.png', 'https://twitter.com/ANI/status/1427846620083752963?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1427846620083752963%7Ctwgr%5E%7Ctwcon%5Es1_&amp;ref_url=https%3A%2F%2Fwww.pinkvilla.com%2Ftrending%2Findia%2Fpm-narendra-modi-offers-ice-cream-medallist-pv-sindhu-post-her-win-tokyo-olympics-2020-862326', '<p>ZXC nghlk nh</p>', '0', '2021-08-24', 0),
(2, 6, 1, 'ncksdj', 'bsah', 'svjhzX', 'bxjc', '', 'kajsf', '', 'ajsdkk', '<p>kjjjsda</p>', '', '', '', '', '', '', '0', '2021-08-25', 0),
(3, 1, 0, 'hcudhscudfhss dsfhuds', 'mohanlal', 'jjcdcisfj', 'njcsncsddfssdj', '3_home_ban-grid1.jpg', '', '3_first_ban-grid1.jpg', '', '<p>jnhwsuwds udshfusdfu isfusidfj fsdfjisfj</p>', '3_second_ban-grid2.jpg', '', '<p>uhufsf dusudjsif jsifisf ifsjfisjfi</p>', '', '', '', '0', '2021-08-25', 0),
(4, 1, 0, 'jZXHC', 'mzbxc', 'kjzbjxc', 'mjhzcxv', '', 'xzc', '', 'zxc', '<p>zxc</p>', '', '', '', '', '', '', '0', '2021-08-25', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `emp_id` int(5) NOT NULL,
  `emp_login_id` int(11) DEFAULT NULL,
  `e_first_name` text NOT NULL,
  `e_address` mediumtext DEFAULT NULL,
  `e_mobile` varchar(25) DEFAULT NULL,
  `e_code` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`emp_id`, `emp_login_id`, `e_first_name`, `e_address`, `e_mobile`, `e_code`, `status`) VALUES
(2, NULL, 'Rahul Raj', '', '', 'adv-klmktm-02', 'active'),
(3, NULL, 'Jyothish', '', '', 'supr-klmktm-01', 'active'),
(4, NULL, 'Vishnu B', '', '', 'tech-klmktm-01', 'active'),
(5, NULL, 'Vishnu VR', '', '', 'tech-klmktm-02', 'active'),
(6, NULL, 'Arun AV', '', '', 'tech-klmktm-03', 'active'),
(7, NULL, 'Jackson', '', '', 'tech-klmktm-04', 'active'),
(8, NULL, 'Sreejith', '', '', 'tech-klmktm-05', 'active'),
(9, 2, 'Nija', 'klm', '9947268965', 'bill-klmktm-01', 'active'),
(10, NULL, 'Gopan', '', '', 'tech-atl-01', 'active'),
(11, NULL, 'Vinu', '', '', 'tech-atl-02', 'active'),
(12, NULL, 'Leyon', '', '', 'adv-atl-01', 'active'),
(13, 3, 'Leyon', 'klm', '9947366665', 'bill-atl-01', 'active'),
(14, NULL, 'SivaPrasad', '', '', 'tech-knp-01', 'active'),
(15, NULL, 'Khalid', '', '', 'tech-knp-02', 'active'),
(16, 4, 'Sudheesh', 'test', '6787676767', 'bill-knp-01', 'active'),
(17, NULL, 'VISHNU', 'KNP', '', 'adv-ktm-knp', 'active'),
(18, NULL, 'BELTON. S', 'ATL', '', 'TECH-ATL', 'active'),
(19, NULL, 'AKASH.R', 'ATL', '', 'ADV-ATL', 'active'),
(20, NULL, 'AKASH.R', 'ATL', '', 'ADV-ATL', 'active'),
(21, NULL, 'AJITH LAL  A', '', '9526296665', 'EMP-KTM-01', 'active'),
(22, NULL, 'VISHNU. R', 'KNP', '', 'KTM-KNP-ADV', 'active'),
(23, NULL, 'ABHISHEK. S', 'KNP', '', 'KTM-KNP-TECH', 'active'),
(24, NULL, 'SAJIN S', 'KLM', '', 'KTM-EMP-1', 'active'),
(25, NULL, 'JACKSON HARRY', 'KNP', '', 'EMP-KNP-1', 'active'),
(26, NULL, 'GOPAKUMAR G', 'ATL', '', 'ATL-ADV-NEW', 'active'),
(27, NULL, 'AMAL AJI', '', '', 'TECH-NEW', 'active'),
(28, NULL, 'AKHIL DEV', '', '', 'KTM-ATL-01', 'active'),
(29, NULL, 'SREEJITH R', '', '', 'KTM-ATL-01', 'active'),
(30, NULL, 'ARUN AV', '', '', 'adv-atl-new', 'active'),
(31, NULL, 'VINU K', '', '', 'Tech-klm-ktm', 'active'),
(32, NULL, 'VISHNU U', 'KNP', '', 'TECH-KNP-KTM', 'active'),
(33, NULL, 'MITHUN M', 'KLM', '', 'EMP-KLM-ADV', 'active'),
(34, NULL, 'BIBIN RAJ', 'ATL', '', 'EMP-TECH-ATL', 'active'),
(35, NULL, 'VISHNU B', 'KLM', '', 'KTM-ADV-VIS', 'active'),
(36, NULL, 'MITHUN M', 'KNP', '', 'EMP-KTMKNP-1', 'active'),
(37, NULL, 'SUJITH S', 'KNP', '', 'EMP-KTMKNP-2', 'active'),
(39, NULL, 'BIBIN RAJ', 'KLM', '', 'EMP-KTMKLM-1', 'active'),
(40, 6, 'sarath', 'test address', '8157077650', 'bill-klm-02', 'active'),
(41, 7, 'abhilash', 'test address', '4562312523', 'c123', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `login_id` int(20) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `pwd` text NOT NULL,
  `role` int(20) NOT NULL COMMENT '1-Admin,2-Staff',
  `role_des` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`login_id`, `uname`, `pwd`, `role`, `role_des`) VALUES
(1, 'admin', '$2y$10$ZeSTl.s17EOna0SaGQ6PV.Yd8KMSRm57xLZhBUuTQjw/Ck7fxSOa2', 1, 'admin'),
(2, 'd13177.sarathy', '$2y$10$9vOkaNp3TxZKur7NM06/0uJVQl2cCa.INjbwvZ4Mb1CHJHwT.AWxG', 2, 'employee'),
(3, 'd13177.attingal', '$2y$10$Q9INhUBLtdu1dsOO4vnbDuZps0qQFXBgVKxVyovtLN274wE6s.OHm', 2, 'employee'),
(4, 'd13177.knp', '$2y$10$4LGPG5oSJYUSFWUoXUHPwutPrhVQMSD7GE1rFqazGe/jpsesePI.u', 2, 'employee'),
(6, 'sarath', '$2y$10$sA1E.cdfNBa.HUGSJH6mhen7nkYixQfPLpg2qC.2HqrD7TwptIA6y', 2, 'employee'),
(7, 'abhi', '$2y$10$kgR13hnrz68G8eJcPTlyae8ztRcMimIPiERw5q/JpNjjs4A5ojNFe', 2, 'employee');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategory`
--

CREATE TABLE `tbl_subcategory` (
  `sub_id` int(11) NOT NULL,
  `scate_id` int(11) NOT NULL,
  `sub_menu_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_subcategory`
--

INSERT INTO `tbl_subcategory` (`sub_id`, `scate_id`, `sub_menu_name`) VALUES
(1, 6, 'Fashion'),
(2, 6, 'Wellness'),
(3, 7, 'Entertainment'),
(4, 7, 'Sports');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_video`
--

CREATE TABLE `tbl_video` (
  `vid` int(11) NOT NULL,
  `video_titile` text NOT NULL,
  `video_details` text NOT NULL,
  `video_link` text NOT NULL,
  `editer_log` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_video`
--

INSERT INTO `tbl_video` (`vid`, `video_titile`, `video_details`, `video_link`, `editer_log`) VALUES
(1, 'Twinning and winning! Katrina Kaif\'s white corset lehenga or Vicky Kaushal\'scasual look? ', 'Twinning and winning! Katrina Kaif\'s white corset lehenga or Vicky Kaushal\'s casual look? The internet couldn\'t get enough of engagement rumours about Katrina Kaif and Vicky Kaushal yesterday, which were later clarified by the actress\' team. Today we have this throwback video from Bollywood last glamorous Holi Party before the pandemic where Katrina looked stunning in a white corset lehenga while her rumoured boyfriend opted for a casual look. Whose style did you like better? COMMENT.', '7czQN10JhaU', 0),
(2, 'Twinning and winning! Katrina Kaif\'s white corset lehenga or Vicky Kaushal\'s casual look?', 'Twinning and winning! Katrina Kaif\'s white corset lehenga or Vicky Kaushal\'s casual look?', 'BnDMmGxXn6g', 0),
(4, 'kjsdkf', '', 'sdfg', 0),
(5, 'dfg', '', 'sdfg', 0),
(6, 'ksdf', '', 'kaskdf', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `blog_booking`
--
ALTER TABLE `blog_booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `blog_booking_show_id_78f08e9e_fk_blog_show_showid` (`show_id`),
  ADD KEY `blog_booking_user_id_d2634e46_fk_blog_user_User_id` (`user_id`);

--
-- Indexes for table `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `blog_crew`
--
ALTER TABLE `blog_crew`
  ADD PRIMARY KEY (`crew_id`),
  ADD KEY `blog_crew_movie_id_c077231c_fk_blog_movie_movie_id` (`movie_id`),
  ADD KEY `blog_crew_person_id_5fbbf873_fk_blog_movie_person_person_id` (`person_id`);

--
-- Indexes for table `blog_history`
--
ALTER TABLE `blog_history`
  ADD PRIMARY KEY (`hist_id`),
  ADD KEY `blog_history_movie_id_2f49c131_fk_blog_movie_movie_id` (`movie_id`),
  ADD KEY `blog_history_user_id_190f53f8_fk_blog_user_User_id` (`user_id`);

--
-- Indexes for table `blog_login`
--
ALTER TABLE `blog_login`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `blog_move_category`
--
ALTER TABLE `blog_move_category`
  ADD PRIMARY KEY (`movie_catid`),
  ADD KEY `blog_move_category_category_id_282ab571_fk_blog_cate` (`category_id`),
  ADD KEY `blog_move_category_move_id_fa49711d_fk_blog_movie_movie_id` (`move_id`);

--
-- Indexes for table `blog_movie`
--
ALTER TABLE `blog_movie`
  ADD PRIMARY KEY (`movie_id`),
  ADD KEY `blog_movie_production_id_423992d8_fk_blog_prod` (`production_id`);

--
-- Indexes for table `blog_movie_person`
--
ALTER TABLE `blog_movie_person`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `blog_production`
--
ALTER TABLE `blog_production`
  ADD PRIMARY KEY (`production_id`);

--
-- Indexes for table `blog_rating`
--
ALTER TABLE `blog_rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `blog_rating_movie_id_8e666a69_fk_blog_movie_movie_id` (`movie_id`),
  ADD KEY `blog_rating_user_id_60d77f53_fk_blog_user_User_id` (`user_id`);

--
-- Indexes for table `blog_reviews`
--
ALTER TABLE `blog_reviews`
  ADD PRIMARY KEY (`reviewid`),
  ADD KEY `blog_reviews_movie_id_af03d4c8_fk_blog_movie_movie_id` (`movie_id`),
  ADD KEY `blog_reviews_user_id_9245770e_fk_blog_user_User_id` (`user_id`);

--
-- Indexes for table `blog_show`
--
ALTER TABLE `blog_show`
  ADD PRIMARY KEY (`showid`),
  ADD KEY `blog_show_movie_id_b0eb8cca_fk_blog_movie_movie_id` (`movie_id`),
  ADD KEY `blog_show_theatre_id_ef23f3c5_fk_blog_theatre_theatreid` (`theatre_id`);

--
-- Indexes for table `blog_staff`
--
ALTER TABLE `blog_staff`
  ADD PRIMARY KEY (`staffid`),
  ADD KEY `blog_staff_login_id_c1c6f217_fk_blog_login_log_id` (`login_id`),
  ADD KEY `blog_staff_thtr_id_0dce6c9f_fk_blog_theatre_theatreid` (`thtr_id`);

--
-- Indexes for table `blog_theatre`
--
ALTER TABLE `blog_theatre`
  ADD PRIMARY KEY (`theatreid`),
  ADD KEY `blog_theatre_login_id_00af0404_fk_blog_login_log_id` (`login_id`);

--
-- Indexes for table `blog_user`
--
ALTER TABLE `blog_user`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `blog_user_Log_id_id_b8e04f17_fk_blog_login_log_id` (`Log_id_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `tbl_data_details`
--
ALTER TABLE `tbl_data_details`
  ADD PRIMARY KEY (`data_id`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  ADD PRIMARY KEY (`sub_id`);

--
-- Indexes for table `tbl_video`
--
ALTER TABLE `tbl_video`
  ADD PRIMARY KEY (`vid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_booking`
--
ALTER TABLE `blog_booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `blog_crew`
--
ALTER TABLE `blog_crew`
  MODIFY `crew_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_history`
--
ALTER TABLE `blog_history`
  MODIFY `hist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blog_login`
--
ALTER TABLE `blog_login`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `blog_move_category`
--
ALTER TABLE `blog_move_category`
  MODIFY `movie_catid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `blog_movie`
--
ALTER TABLE `blog_movie`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `blog_movie_person`
--
ALTER TABLE `blog_movie_person`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `blog_production`
--
ALTER TABLE `blog_production`
  MODIFY `production_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `blog_rating`
--
ALTER TABLE `blog_rating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_reviews`
--
ALTER TABLE `blog_reviews`
  MODIFY `reviewid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_show`
--
ALTER TABLE `blog_show`
  MODIFY `showid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_staff`
--
ALTER TABLE `blog_staff`
  MODIFY `staffid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_theatre`
--
ALTER TABLE `blog_theatre`
  MODIFY `theatreid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_user`
--
ALTER TABLE `blog_user`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_data_details`
--
ALTER TABLE `tbl_data_details`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `emp_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `login_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_video`
--
ALTER TABLE `tbl_video`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `blog_booking`
--
ALTER TABLE `blog_booking`
  ADD CONSTRAINT `blog_booking_show_id_78f08e9e_fk_blog_show_showid` FOREIGN KEY (`show_id`) REFERENCES `blog_show` (`showid`),
  ADD CONSTRAINT `blog_booking_user_id_d2634e46_fk_blog_user_User_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`User_id`);

--
-- Constraints for table `blog_crew`
--
ALTER TABLE `blog_crew`
  ADD CONSTRAINT `blog_crew_movie_id_c077231c_fk_blog_movie_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `blog_movie` (`movie_id`),
  ADD CONSTRAINT `blog_crew_person_id_5fbbf873_fk_blog_movie_person_person_id` FOREIGN KEY (`person_id`) REFERENCES `blog_movie_person` (`person_id`);

--
-- Constraints for table `blog_history`
--
ALTER TABLE `blog_history`
  ADD CONSTRAINT `blog_history_movie_id_2f49c131_fk_blog_movie_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `blog_movie` (`movie_id`),
  ADD CONSTRAINT `blog_history_user_id_190f53f8_fk_blog_user_User_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`User_id`);

--
-- Constraints for table `blog_move_category`
--
ALTER TABLE `blog_move_category`
  ADD CONSTRAINT `blog_move_category_category_id_282ab571_fk_blog_cate` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`category_id`),
  ADD CONSTRAINT `blog_move_category_move_id_fa49711d_fk_blog_movie_movie_id` FOREIGN KEY (`move_id`) REFERENCES `blog_movie` (`movie_id`);

--
-- Constraints for table `blog_movie`
--
ALTER TABLE `blog_movie`
  ADD CONSTRAINT `blog_movie_production_id_423992d8_fk_blog_prod` FOREIGN KEY (`production_id`) REFERENCES `blog_production` (`production_id`);

--
-- Constraints for table `blog_rating`
--
ALTER TABLE `blog_rating`
  ADD CONSTRAINT `blog_rating_movie_id_8e666a69_fk_blog_movie_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `blog_movie` (`movie_id`),
  ADD CONSTRAINT `blog_rating_user_id_60d77f53_fk_blog_user_User_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`User_id`);

--
-- Constraints for table `blog_reviews`
--
ALTER TABLE `blog_reviews`
  ADD CONSTRAINT `blog_reviews_movie_id_af03d4c8_fk_blog_movie_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `blog_movie` (`movie_id`),
  ADD CONSTRAINT `blog_reviews_user_id_9245770e_fk_blog_user_User_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`User_id`);

--
-- Constraints for table `blog_show`
--
ALTER TABLE `blog_show`
  ADD CONSTRAINT `blog_show_movie_id_b0eb8cca_fk_blog_movie_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `blog_movie` (`movie_id`),
  ADD CONSTRAINT `blog_show_theatre_id_ef23f3c5_fk_blog_theatre_theatreid` FOREIGN KEY (`theatre_id`) REFERENCES `blog_theatre` (`theatreid`);

--
-- Constraints for table `blog_staff`
--
ALTER TABLE `blog_staff`
  ADD CONSTRAINT `blog_staff_login_id_c1c6f217_fk_blog_login_log_id` FOREIGN KEY (`login_id`) REFERENCES `blog_login` (`log_id`),
  ADD CONSTRAINT `blog_staff_thtr_id_0dce6c9f_fk_blog_theatre_theatreid` FOREIGN KEY (`thtr_id`) REFERENCES `blog_theatre` (`theatreid`);

--
-- Constraints for table `blog_theatre`
--
ALTER TABLE `blog_theatre`
  ADD CONSTRAINT `blog_theatre_login_id_00af0404_fk_blog_login_log_id` FOREIGN KEY (`login_id`) REFERENCES `blog_login` (`log_id`);

--
-- Constraints for table `blog_user`
--
ALTER TABLE `blog_user`
  ADD CONSTRAINT `blog_user_Log_id_id_b8e04f17_fk_blog_login_log_id` FOREIGN KEY (`Log_id_id`) REFERENCES `blog_login` (`log_id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
