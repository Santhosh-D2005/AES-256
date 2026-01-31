-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 06, 2023 at 12:55 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forward_secure_public_key_encry`
--
CREATE DATABASE IF NOT EXISTS `forward_secure_public_key_encry` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `forward_secure_public_key_encry`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_group_create_details`
--

DROP TABLE IF EXISTS `admin_group_create_details`;
CREATE TABLE IF NOT EXISTS `admin_group_create_details` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` longtext NOT NULL,
  `group_location` varchar(50) NOT NULL,
  `group_Type` varchar(50) NOT NULL,
  `group_describtion` longtext NOT NULL,
  `group_reg_date` date DEFAULT NULL,
  `group_upload_image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_group_create_details`
--

INSERT INTO `admin_group_create_details` (`group_id`, `group_name`, `group_location`, `group_Type`, `group_describtion`, `group_reg_date`, `group_upload_image`) VALUES
(2, 'Educate India', 'Hyderabad', 'Education', 'we can educate using this platform we can share learning this on this platform', '2022-06-12', '800px_COLOURBOX4056380.jpg'),
(6, 'Sports India', 'Hyderabad', 'sports', 'Sport pertains to any form of competitive physical activity or game.', '2022-06-13', 'KKR-vs-KXIP_9aErQ7x.webp'),
(4, 'Entertaiment india', 'Hyderabad', 'Entertainment', 'Entertainment is a form of activity that holds the attention.', '2022-06-12', 'Children_watching_TV.jpg'),
(5, 'Movies India', 'Hyderabad', 'movies', 'A film – also called a movie, motion picture, moving picture, or photoplay.', '2022-06-12', 'e2c0e2d2cc07409250c5967a031925a7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
(25, 'Can add user registration model', 7, 'add_userregistrationmodel'),
(26, 'Can change user registration model', 7, 'change_userregistrationmodel'),
(27, 'Can delete user registration model', 7, 'delete_userregistrationmodel'),
(28, 'Can view user registration model', 7, 'view_userregistrationmodel'),
(29, 'Can add user upload file model', 8, 'add_useruploadfilemodel'),
(30, 'Can change user upload file model', 8, 'change_useruploadfilemodel'),
(31, 'Can delete user upload file model', 8, 'delete_useruploadfilemodel'),
(32, 'Can view user upload file model', 8, 'view_useruploadfilemodel'),
(33, 'Can add groupcreatemodel', 9, 'add_groupcreatemodel'),
(34, 'Can change groupcreatemodel', 9, 'change_groupcreatemodel'),
(35, 'Can delete groupcreatemodel', 9, 'delete_groupcreatemodel'),
(36, 'Can view groupcreatemodel', 9, 'view_groupcreatemodel'),
(37, 'Can add user group join', 10, 'add_usergroupjoin'),
(38, 'Can change user group join', 10, 'change_usergroupjoin'),
(39, 'Can delete user group join', 10, 'delete_usergroupjoin'),
(40, 'Can view user group join', 10, 'view_usergroupjoin'),
(41, 'Can add userdownloads', 11, 'add_userdownloads'),
(42, 'Can change userdownloads', 11, 'change_userdownloads'),
(43, 'Can delete userdownloads', 11, 'delete_userdownloads'),
(44, 'Can view userdownloads', 11, 'view_userdownloads'),
(45, 'Can add user feedbacks', 12, 'add_userfeedbacks'),
(46, 'Can change user feedbacks', 12, 'change_userfeedbacks'),
(47, 'Can delete user feedbacks', 12, 'delete_userfeedbacks'),
(48, 'Can view user feedbacks', 12, 'view_userfeedbacks');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$mwjwatDUgMiXdWUKEhXSs8$eDVkAeh+jB9XvrxYMMg8ndGECXO92zZZQvLFWuh3O+0=', '2022-06-10 08:05:48.838824', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-06-10 08:05:29.332106');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
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
(7, 'userapp', 'userregistrationmodel'),
(8, 'userapp', 'useruploadfilemodel'),
(9, 'adminapp', 'groupcreatemodel'),
(10, 'userapp', 'usergroupjoin'),
(11, 'userapp', 'userdownloads'),
(12, 'userapp', 'userfeedbacks');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'userapp', '0001_initial', '2022-06-06 06:46:26.530359'),
(2, 'contenttypes', '0001_initial', '2022-06-06 06:59:41.221576'),
(3, 'auth', '0001_initial', '2022-06-06 06:59:41.558112'),
(4, 'admin', '0001_initial', '2022-06-06 06:59:41.646822'),
(5, 'admin', '0002_logentry_remove_auto_add', '2022-06-06 06:59:41.650377'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-06 06:59:41.664440'),
(7, 'contenttypes', '0002_remove_content_type_name', '2022-06-06 06:59:41.718639'),
(8, 'auth', '0002_alter_permission_name_max_length', '2022-06-06 06:59:41.746882'),
(9, 'auth', '0003_alter_user_email_max_length', '2022-06-06 06:59:41.773207'),
(10, 'auth', '0004_alter_user_username_opts', '2022-06-06 06:59:41.780747'),
(11, 'auth', '0005_alter_user_last_login_null', '2022-06-06 06:59:41.807945'),
(12, 'auth', '0006_require_contenttypes_0002', '2022-06-06 06:59:41.811471'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2022-06-06 06:59:41.818718'),
(14, 'auth', '0008_alter_user_username_max_length', '2022-06-06 06:59:41.842244'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2022-06-06 06:59:41.867816'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-06-06 06:59:41.892552'),
(17, 'auth', '0011_update_proxy_permissions', '2022-06-06 06:59:41.903116'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-06-06 06:59:41.928608'),
(19, 'sessions', '0001_initial', '2022-06-06 06:59:41.965269'),
(20, 'adminapp', '0001_initial', '2022-06-06 07:00:10.763938'),
(21, 'userapp', '0002_userregistrationmodel_user_interest_and_more', '2022-06-06 07:50:23.312749'),
(22, 'userapp', '0003_usergroupjoin', '2022-06-07 06:16:11.277789'),
(23, 'userapp', '0004_rename_group_username_type_usergroupjoin_group_user_type', '2022-06-07 06:16:50.503650'),
(24, 'userapp', '0005_usergroupjoin_group_describtion_and_more', '2022-06-07 06:46:11.925337'),
(25, 'userapp', '0006_usergroupjoin_group_user_id_and_more', '2022-06-07 06:50:26.815306'),
(26, 'userapp', '0007_remove_useruploadfilemodel_upload_catagories_and_more', '2022-06-07 07:24:33.063971'),
(27, 'userapp', '0008_useruploadfilemodel_upload_user_name', '2022-06-07 09:34:21.051373'),
(28, 'userapp', '0009_useruploadfilemodel_upload_group_type', '2022-06-07 11:18:36.157548'),
(29, 'userapp', '0010_useruploadfilemodel_search_rank', '2022-06-07 11:27:01.604035'),
(30, 'userapp', '0011_userdownloads', '2022-06-09 07:23:56.849932'),
(31, 'userapp', '0012_userdownloads_download_user_id_and_more', '2022-06-09 07:49:23.982616'),
(32, 'userapp', '0013_useruploadfilemodel_upload_date_time', '2022-06-09 11:05:24.258355'),
(33, 'userapp', '0014_alter_useruploadfilemodel_search_rank', '2022-06-09 18:02:41.032494'),
(34, 'userapp', '0015_useruploadfilemodel_time', '2022-06-09 18:11:26.840507'),
(35, 'userapp', '0016_remove_useruploadfilemodel_time_and_more', '2022-06-10 10:03:16.217757'),
(36, 'userapp', '0017_alter_useruploadfilemodel_search_rank', '2022-06-10 18:02:30.313775'),
(37, 'userapp', '0018_userfeedbacks', '2022-06-10 19:52:36.295366'),
(38, 'userapp', '0019_userfeedbacks_user_feedback_group_name', '2022-06-10 20:06:51.365355'),
(39, 'userapp', '0020_useruploadfilemodel_upload_user_location', '2022-06-10 20:56:00.305226'),
(40, 'userapp', '0021_useruploadfilemodel_group_id', '2022-06-12 11:52:11.288514'),
(41, 'userapp', '0022_rename_group_id_useruploadfilemodel_group_id2', '2022-06-12 11:53:08.209238'),
(42, 'userapp', '0023_remove_useruploadfilemodel_group_id2_and_more', '2022-06-12 11:57:37.823978');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('56dabiq7ngc2tzz37iunbophclayhbd9', 'eyJ1c2VyX2lkIjozNn0:1o0mMX:AZbOZaxscMm-3iwO82Cx1wSuw7qhnCEFAr3JEw63EUE', '2022-06-27 15:52:21.124766'),
('snozoz5v9fylajvty9hdeev5p9kwoazn', 'eyJ1c2VyX2lkIjozMH0:1nyAZ5:KnH8QKQ_1ugg2zB1U7gbYMpR3Z8J7fa3ttq6RodgMfE', '2022-06-20 11:06:31.956482'),
('33jg7k8mnpbr2rxu92xshodhj2h5n6wf', '.eJxVjMsOgjAQRf9l1qbptAO0Lt3zDc30ZVFTEgor478rCTFhe8659w1bS4ubIly1vIDjbS3ujwDhxDyHZ6q7iA-u91mEua7L5MWeiMM2Mc4xvW5Hezoo3MpvLYekvCakMGRlvUJKZDhEa5GZOo9kDZGW1OuMgQ1yj6hyVpijNaaDzxePVTsC:1nziS1:URZe1H21q0TZgz5nG0Q0_YB8nxLcNhNc-9q00FkDsyo', '2022-06-24 17:29:37.165030'),
('wd7r5d0ck19f9kpmdrhj4juv6u9a96jq', 'eyJlbWFpbCI6ImNvZGVib29rLmluQGdtYWlsLmNvbSJ9:1qXKV6:qCFvBw3Moo8hNWE5qlmkNlzpkJd-OPXNGY4hirKmFA8', '2023-09-02 11:52:16.125202'),
('zx0jt7cj9qdzy3cfyduiwju9xlw2ro5r', 'e30:1qoYtY:N2Dg-EyplmgbZM7Y071U5132qASO_nJzlB1W9p1yJ9c', '2023-10-20 00:40:44.852120');

-- --------------------------------------------------------

--
-- Table structure for table `request_file`
--

DROP TABLE IF EXISTS `request_file`;
CREATE TABLE IF NOT EXISTS `request_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` varchar(50) DEFAULT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `file_size` longtext DEFAULT NULL,
  `screat_key` longtext DEFAULT NULL,
  `key` longtext DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `request_mail` varchar(100) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `user_file` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_file`
--

INSERT INTO `request_file` (`id`, `file_id`, `file_name`, `file_type`, `file_size`, `screat_key`, `key`, `status`, `request_mail`, `user_id`, `user_file`) VALUES
(6, '7', 'cloud', '.txt', '1.88 KB.', 'h2oas5w1y0', '__ThddnX_M5exVlyYyJ7_CQnkpBA0FdyFgnQPuUqixI=', 'Accept', 'fazalsirprojects@gmail.com', '3', 'User/Files/codebook.txt');

-- --------------------------------------------------------

--
-- Table structure for table `request_token`
--

DROP TABLE IF EXISTS `request_token`;
CREATE TABLE IF NOT EXISTS `request_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `request_token` varchar(50) DEFAULT NULL,
  `post_token` varchar(50) NOT NULL,
  `datetime_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_token`
--

INSERT INTO `request_token` (`id`, `user_name`, `user_email`, `request_token`, `post_token`, `datetime_created`) VALUES
(3, 'codebook', 'fazalsirmail@gmail.com', 'srq1is', 'srq1is', '2023-10-06 06:01:50.107632'),
(4, 'fazalsir', 'fazalsirprojects@gmail.com', '9xf4mh', '9xf4mh', '2023-10-06 06:05:29.084556');

-- --------------------------------------------------------

--
-- Table structure for table `upload_file`
--

DROP TABLE IF EXISTS `upload_file`;
CREATE TABLE IF NOT EXISTS `upload_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `file_size` longtext DEFAULT NULL,
  `key` longtext DEFAULT NULL,
  `file_data` longtext DEFAULT NULL,
  `decription` longtext DEFAULT NULL,
  `user_file` varchar(100) NOT NULL,
  `datetime_created` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Upload_file_user_id_79fc73e1` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload_file`
--

INSERT INTO `upload_file` (`id`, `user_name`, `file_name`, `file_type`, `file_size`, `key`, `file_data`, `decription`, `user_file`, `datetime_created`, `user_id`) VALUES
(6, 'codebook', 'mypic', '.jpg', '11.45 KB.', 'MT3yTrNQWgxHRpO7Kxd-EhlQXoScPd8iTlLBuz27XAg=', 'none', 'my profile picture', 'User/Files/face4.jpg', '2023-10-06 05:59:45.675965', 3),
(7, 'codebook', 'cloud', '.txt', '1.88 KB.', '__ThddnX_M5exVlyYyJ7_CQnkpBA0FdyFgnQPuUqixI=', 'gAAAAABlH1VX7r90_q6_29zxhTSlg6sX5zHdVsNGlowuCy_iDE1AAwOblPTF_awxAEDx35AZEC-pIxTsMgh9VfMnbXv10W6Lv4bq3LHrf29cVCjs5HuHsQzlNSX43p2Qwj7ij5DMRtuaXUSFRg-FBVqjSsVqZ0YIbTRDMx7bx412_TVPsqLnGymMquM6ByfIpT4EaAM2e09iP3b4kctkVTlw8jDw7X-BzwUxrOpv-HoynNrXpJHrlZzLhYJ01t9PJbvsJnZhOtoVgfUhlslqj_SL1gKVhTR0sDy2RarET1nrSQbWXjEO5_ytcSrTga97c3HboY2WAzfjpKNT09rK8Q3SKkEfpesdXXAH5rPI3wkDVpDlTRAxxbWY1CItzmrhcsx2QpoTwFc8RG82idrx_XQWl64Zsh-wPy0MSptrM45cpHWf_9aeP3DrIX2l-6Ce8j0SbD4aSQDZ9Ss7lmOw2IQ9NU9RbHrB5v6xgiNrfAsinhPM_weFvCTVmb9KNSBGlV6NN_YqI4HHIj5JDkjIp3GdnDjAOK5Xg8uEGLxnVmsWwL0INpH3Jl1uPGlyh-L-dvfZjWFHAMsSzbcnNYEZuzgGOUqIH5yy3rWEruSeojvy3cApd80mCY-2Cpn7FqI6MFVi0xAY3LakS-_xbiZlTbmvos_cXy9N6pseprVsji0x_xD6mrMENW-D0UbppoZ2vtLXV5BHgomr0fsW-icx_poGiC_J0FOT3Ira2XNuN6XNxP_-BprUbBVEvT3i53o6F7IdE1yklJKx3LLIXnQ4CjfncyHdWSsi4Xk8R-HBg2TcT9YlMJBTr777wE7UzvwK-yvvanfl4ZTawnpGIVtxgtlCaGn1c9IAdUld68nQuKGxbAx0notFSaoV6oe_getGNAyvgG6teaiodpBe3kIp2OSr1YCb7aIDXC-zlMAYjw9MHO2tbmoY9GedEedW9cGIWxE2K-rMYuGpBUVKQBZXH3H0YYEk8nfkQGD4GhqZjh7FGroiC85V3EaKmyEY9fZy7yBhcZ6YjJpk9vuR_BM22KIhbIXF5fwI6Xbety2scCOVg15GxhOwpnelUqIZaxgS4iGPfWfcIbsUW_TnVIDKMWXkQQ-7c0yQlGXq5t7YbrqVlueRWSnFkYokBv7Pbc_vgUtuOC6viWViN-RGzm04FeIgN3g6hSvzflsZBoTRCth5TWtsxKAfidCAYbct-tnGsIfl7zu5GSmlDg3sk26PTPv-Loce5czzNnPRKu3iCT3XzlRT67GicY489C08ld-IAY0qnQ1hwTGG925Bx9buglPHjcZL4AyZlSXRUwWUJvxpD0NEHl7qrfgZDUwvV5oSYxthI1eKpfpPnNBbk5o7zh6dl_m1hmD9rpB8ZfvVilYaDULLagQyAmZGejGX5_FaTijg6sM_nm9japJTNeKyrUIvIJfzbKzEGnHbqYxHgMRUFht0kang-fGbyLZY5I2PJ-fXaYWeqB_6C3iOAzFLJuw1aevmYCHbFWwbkt5zt6g3ZFNB_ZrQ6us7d93mdYsh7xiGsRyppGEAyO_fZ0j_D_jKSmXd63D1NPpDDEID7cF6lboOzmiKR847RV2r8lO1dO6zqeD_I7PgpNgaoD3WVev5qXAd9m4qtDUOCHto0RktQa_UDOuOP5DLVuAg_6izvxKXYZ4khiIFBv_p0CWD_cSYwNjsTABDn8sjeIewX-RwzFclUzUkrDh-mz-bdODJCF2K4u7ku0O7t9Z0d6oatZH-oqVj0fGJKQq6H-HUvSM2T2mY3Qs9v0vI4nj7f_AUqJ47YSFnbYx2uUamc05FY_564lgrQZFBjmnnOzzHotpvFghngUHecDFD78hUibHuZZDfv2uu4BfSIKf7wtbeccGKA1plI_4JbirXTHiukf8GxubM_f_Dpp3r5y_tD0vvZY1AgTwjSsOkWgWAhiT0gpvzeN78EJHXn8pRy82vTU8osc0cj7huirZHR3TCym-wfpRfUJfOqKfffjmzJVaXf9Pl1nvVC7yV0gi-c0vUW_QCWjDJXxq5urh1U2zvNXLCB7620rE9lEr31Su1FxnQ6XNeiURNnQqRK0DlkguNXcUqTR4zjEZ4pJ1GbSssbfySDB-sownUd6fu0IV2epX2bPV8CTKhPsy0ZJ7JQhikMPrHYaJs3Wf5mBwdq-6DJiF6Hkkmq903JGWVsr90aEeLRa5s2hCX48QNNV_Q1xKkPK_oqYqLqTHN61fyDA5NXDdjmYIA1s9j5C3jyo16yJnjNj4fo4irCGUiZood_v7CDS9pHviz_uL10RU_JVMFVEFt8cbJ4As8lToTZqAYPOHOtPDXDF0k1eyMvCdmCh1NXx7Z1CLi6d_LSAGJc4rW7P9R8PSBDXeOfEyTZ62a-CAQkxseYmiuFH0PZ-CoEOS12__ALgD3EpJu5mO1WkFGI7EioB47r6cwdcQBL_aF8SW4IsKUqDrxX2covUYxr2SstdvCcbRK5pxE6eSe7a_XU6WKtTFiCsq0h8TSTWa4k5TLpNFFKZJqlC071JXxRq2WtLtdGuQgnPNeqKj9vdxtPvmD6NfT7sWESo5hnvQPOROTvV-OpxtVS_HFTFx5dDSYPrA8Ek4t_pG3sNVUT9WkL-JaQk-Mq8FtGkVQnmxfDt_Gj1vdXxmHQ-riKg==', 'cloud data storage details', 'User/Files/codebook.txt', '2023-10-06 06:01:19.822592', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_download_details`
--

DROP TABLE IF EXISTS `user_download_details`;
CREATE TABLE IF NOT EXISTS `user_download_details` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `downloads` varchar(50) DEFAULT NULL,
  `download_user_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_download_details`
--

INSERT INTO `user_download_details` (`download_id`, `downloads`, `download_user_id`) VALUES
(67, '18', '36'),
(66, '17', '36'),
(65, '17', '36'),
(64, '17', '36');

-- --------------------------------------------------------

--
-- Table structure for table `user_feeback_details`
--

DROP TABLE IF EXISTS `user_feeback_details`;
CREATE TABLE IF NOT EXISTS `user_feeback_details` (
  `user_feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_feeback_name` varchar(50) DEFAULT NULL,
  `user_feedback_email` varchar(50) DEFAULT NULL,
  `user_feedback_describtion` longtext DEFAULT NULL,
  `user_feedback_group_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_feedback_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_join_groups_details`
--

DROP TABLE IF EXISTS `user_join_groups_details`;
CREATE TABLE IF NOT EXISTS `user_join_groups_details` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_username` longtext NOT NULL,
  `group_user_type` longtext NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `group_user_join_date` date DEFAULT NULL,
  `group_status` varchar(200) NOT NULL,
  `group_user_image` varchar(50) DEFAULT NULL,
  `group_describtion` longtext DEFAULT NULL,
  `group_image` varchar(50) DEFAULT NULL,
  `group_type` varchar(200) NOT NULL,
  `group_user_id` varchar(200) DEFAULT NULL,
  `group_user_email` varchar(200) DEFAULT NULL,
  `group_id2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_register`
--

DROP TABLE IF EXISTS `user_register`;
CREATE TABLE IF NOT EXISTS `user_register` (
  `assign_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_lastname` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `addres` varchar(50) NOT NULL,
  `pincode` varchar(50) NOT NULL,
  `user_phone` bigint(20) NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_pwd` varchar(100) NOT NULL,
  `user_image` varchar(100) NOT NULL,
  `datetime_created` datetime(6) NOT NULL,
  PRIMARY KEY (`assign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_register`
--

INSERT INTO `user_register` (`assign_id`, `user_name`, `user_lastname`, `gender`, `country`, `state`, `city`, `date_of_birth`, `addres`, `pincode`, `user_phone`, `user_email`, `user_pwd`, `user_image`, `datetime_created`) VALUES
(3, 'codebook', 'projects', 'Male', 'india', 'telangana', 'hyd', '2000-01-01', 'hyderabad', '12345', 8555887986, 'fazalsirmail@gmail.com', 'codebook', 'User/Profile-image/face8.jpg', '2023-10-06 05:57:29.024055'),
(4, 'fazalsir', 'projects', 'Male', 'india', 'telangana', 'hyd', '2000-01-01', 'hyderabad', '12345', 9912221087, 'fazalsirprojects@gmail.com', 'fazal', 'User/Profile-image/face9.jpg', '2023-10-06 06:04:34.947496');

-- --------------------------------------------------------

--
-- Table structure for table `user_registration_details`
--

DROP TABLE IF EXISTS `user_registration_details`;
CREATE TABLE IF NOT EXISTS `user_registration_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` longtext NOT NULL,
  `user_location` longtext NOT NULL,
  `user_mobilenumber` bigint(20) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(200) DEFAULT NULL,
  `user_reg_date` date DEFAULT NULL,
  `user_status` varchar(200) NOT NULL,
  `user_upload_image` varchar(50) DEFAULT NULL,
  `user_interest` varchar(200) DEFAULT NULL,
  `user_type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_registration_details`
--

INSERT INTO `user_registration_details` (`user_id`, `user_name`, `user_location`, `user_mobilenumber`, `user_email`, `user_password`, `user_reg_date`, `user_status`, `user_upload_image`, `user_interest`, `user_type`) VALUES
(37, 'john', 'Hyderabad', 8789587854, 'john@gmail.com', 'john', '2022-06-12', 'Accepted', 'Education-in-india.jpg', 'Entertaiment', 'Employee'),
(36, 'abhinav', 'Hyderabad', 9876543210, 'mark@gmail.com', 'mark123', '2022-06-12', 'Accepted', 'passport_lyZMo2t.jpg', 'sports', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `user_upload_file_details`
--

DROP TABLE IF EXISTS `user_upload_file_details`;
CREATE TABLE IF NOT EXISTS `user_upload_file_details` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_post_name` longtext NOT NULL,
  `upload_describtion` longtext NOT NULL,
  `upload_date` date DEFAULT NULL,
  `upload_status` varchar(200) NOT NULL,
  `upload_File` varchar(50) DEFAULT NULL,
  `upload_group_name` varchar(200) DEFAULT NULL,
  `upload_user_id` varchar(200) DEFAULT NULL,
  `upload_user_view` varchar(50) DEFAULT NULL,
  `upload_user_name` varchar(200) DEFAULT NULL,
  `upload_group_type` varchar(200) DEFAULT NULL,
  `search_rank` bigint(20) NOT NULL,
  `upload_date_time` datetime(6) DEFAULT NULL,
  `admin_user_id` varchar(200) DEFAULT NULL,
  `upload_user_email` varchar(200) DEFAULT NULL,
  `upload_user_location` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_upload_file_details`
--

INSERT INTO `user_upload_file_details` (`upload_id`, `upload_post_name`, `upload_describtion`, `upload_date`, `upload_status`, `upload_File`, `upload_group_name`, `upload_user_id`, `upload_user_view`, `upload_user_name`, `upload_group_type`, `search_rank`, `upload_date_time`, `admin_user_id`, `upload_user_email`, `upload_user_location`) VALUES
(17, 'Avengers', '\r\nThe Avengers are a fictional team of superheroes and the protagonists of the Marvel Cinematic Universe (MCU) media franchise, based on the Marvel Comics team of the same name created by Stan Lee and Jack Kirby in 1963. ', '2022-06-12', 'Accepted', 'Avengers-featured-image.webp', 'Movies India', '36', 'Public', 'abhinav', 'movies', 24, '2022-06-12 10:07:24.966841', '17', 'mark@gmail.com', 'Hyderabad'),
(18, 'jokes india', 'A joke is a display of humour in which words are used within a specific and well-defined narrative structure to make people laugh and is usually not meant to be taken seriously. Usually it takes the form of a story, often with dialogue, and ends in a punch line. ', '2022-06-12', 'Accepted', 'engagement-invitation-template-vector.jpg', 'Entertainment india', '36', 'Public', 'abhinav', 'Entertainment', 3, '2022-06-12 12:09:01.487200', '18', 'mark@gmail.com', 'Hyderabad'),
(19, 'ipl match', 'The Indian Premier League (IPL), also officially known as TATA IPL for sponsorship reasons is a professional men\'s Twenty20 cricket league, contested by ten teams based out of seven Indian cities and three Indian states', '2022-06-12', 'Accepted', 'KKR-vs-KXIP.webp', 'Sports India', '36', 'Public', 'abhinav', 'sports', 7, '2022-06-12 12:11:25.409479', '19', 'mark@gmail.com', 'Hyderabad'),
(20, 'education', 'Education is the process of facilitating learning, or the acquisition of knowledge, skills, values, morals, beliefs, habits, and personal development.[1] Education originated as transmission of cultural heritage from one generation to the next. ', '2022-06-12', 'Accepted', '800px_COLOURBOX4056380_5eV60oS.jpg', 'Educate India', '36', 'Public', 'abhinav', 'Education', 11, '2022-06-12 12:12:31.417884', '20', 'mark@gmail.com', 'Hyderabad'),
(21, 'resume', 'my resume photo', '2022-06-12', 'Accepted', 'shutterstock_418212442-scaled_jbjqp1a.jpg', 'Sports India', '36', 'Private', 'abhinav', 'sports', 1, '2022-06-12 12:35:38.659268', '21', 'mark@gmail.com', 'Hyderabad');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
