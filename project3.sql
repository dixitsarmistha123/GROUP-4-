-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2021 at 02:55 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project3`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('linktoDashboard','linkToCrud','linkToRoute','section') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `name`, `icon`, `type`, `entity_path`, `status`, `created`, `updated`, `role`) VALUES
(1, NULL, 'Dashboard', 'fa fa-home', 'linktoDashboard', 'App\\Entity\\User', 1, '2021-01-16 15:13:46', '2021-01-16 15:13:46', 'ROLE_ADMIN'),
(2, NULL, 'Main', 'fa-info', 'section', 'App\\Entity\\User', 1, '2021-01-16 15:19:11', '2021-01-16 15:19:11', 'ROLE_ADMIN'),
(3, NULL, 'User', 'fa-user', 'linkToCrud', 'App\\Entity\\User', 1, '2021-01-16 15:22:04', '2021-01-16 15:22:04', 'ROLE_ADMIN'),
(4, NULL, 'Menu', 'fas fa-list', 'linkToCrud', 'App\\Entity\\Menu', 1, '2021-01-16 15:24:58', '2021-01-16 15:24:58', 'ROLE_ADMIN'),
(5, NULL, 'Blog', 'fas fa-circle', 'section', 'App\\Entity\\User', 1, '2021-01-16 15:26:23', '2021-01-16 15:26:23', 'ROLE_ADMIN'),
(6, NULL, 'Category', 'fa-Category', 'linkToCrud', 'App\\Entity\\PostCategory', 1, '2021-01-16 15:27:47', '2021-01-16 15:27:47', 'ROLE_AUTHOR'),
(7, NULL, 'Post', 'fa-hashtag', 'linkToCrud', 'App\\Entity\\Post', 1, '2021-01-16 15:28:53', '2021-01-16 15:28:53', 'ROLE_ADMIN'),
(9, NULL, 'Category', 'fa-tree', 'linkToCrud', 'App\\Entity\\PostCategory', 1, '2021-01-17 07:54:59', '2021-01-17 07:54:59', 'ROLE_ADMIN'),
(10, NULL, 'Post', 'fa-pencil', 'linkToCrud', 'App\\Entity\\Post', 1, '2021-01-17 08:13:27', '2021-01-17 08:13:27', 'ROLE_AUTHOR'),
(11, NULL, 'Comment', 'fa-tree', 'linkToCrud', 'App\\Entity\\Comment', 1, '2021-01-17 11:16:23', '2021-01-17 11:16:23', 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `post_author_id` int(11) DEFAULT NULL,
  `post_category_id` int(11) DEFAULT NULL,
  `post_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_type` enum('post','page') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_status` enum('draft','pending','active','inactive',' Uncategorized') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `post_author_id`, `post_category_id`, `post_title`, `post_slug`, `post_content`, `post_type`, `post_status`, `post_thumbnail`, `created`, `updated`) VALUES
(1, 2, 1, 'this is post to show', 'this-is-post-to-show', '<div>this is&nbsp;</div>', 'post', 'active', 'Screenshot (2).png', '2021-01-17 07:51:16', '2021-01-17 07:51:16');

-- --------------------------------------------------------

--
-- Table structure for table `post_category`
--

CREATE TABLE `post_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_category`
--

INSERT INTO `post_category` (`id`, `parent_id`, `category_name`, `description`, `status`, `created`, `updated`) VALUES
(1, NULL, 'sports', '<div>this is</div>', 1, '2021-01-17 07:09:49', '2021-01-17 07:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `regenrate`
--

CREATE TABLE `regenrate` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','active','inactive','trashed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `roles`, `password`, `mobile`, `dob`, `gender`, `status`, `created`, `updated`) VALUES
(1, 'sarmistha', 'dixit', 'dixit@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$M0h0UFl6WFVSWE1sYjBScQ$HMSKg7gL/V+/I05U6XiXXp1otXhsgN7MK54SsBjbbGI', '789456', '1999-08-31', 'female', 'active', '2021-01-15 16:02:37', '2021-01-15 16:02:37'),
(2, 'shrey', 'singh', 'singh@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$MVNmU3RjUjR0a2J1Qy5vNw$JWg1N7cYHJUQwRPWyp1YJfkq5cuQYOW5HXTAqCWtGvo', '458275425', '1998-07-27', 'male', 'active', '2021-01-16 14:54:27', '2021-01-16 14:54:27'),
(3, 'kajal', 'khanna', 'kajalkhanna803@gmail.com', '[\"ROLE_AUTHOR\"]', '$argon2id$v=19$m=65536,t=4,p=1$MlhlTC5PbDZURlRJYy5JSw$z68QTFaFmD4YETDQb3b2WLXQUmmvXAifjKNWjjqh9hA', '789456123', '1999-08-31', 'female', 'active', '2021-01-17 07:39:52', '2021-01-17 07:39:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526CA76ED395` (`user_id`),
  ADD KEY `IDX_9474526C4B89032C` (`post_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7D053A93727ACA70` (`parent_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5A8A6C8D571B8DEC` (`post_author_id`),
  ADD KEY `IDX_5A8A6C8DFE0617CD` (`post_category_id`);

--
-- Indexes for table `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B9A19060727ACA70` (`parent_id`);

--
-- Indexes for table `regenrate`
--
ALTER TABLE `regenrate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post_category`
--
ALTER TABLE `post_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `regenrate`
--
ALTER TABLE `regenrate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FK_7D053A93727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8D571B8DEC` FOREIGN KEY (`post_author_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_5A8A6C8DFE0617CD` FOREIGN KEY (`post_category_id`) REFERENCES `post_category` (`id`);

--
-- Constraints for table `post_category`
--
ALTER TABLE `post_category`
  ADD CONSTRAINT `FK_B9A19060727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `post_category` (`id`);

--
-- Constraints for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
