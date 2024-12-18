
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 18 déc. 2024 à 10:44
-- Version du serveur : 8.0.35
-- Version de PHP : 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `les4fantastiques`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_permission`
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
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$qR851SfXQlEs4PMUXhCCFd$CEqHnYgE+5saFtx+oO6PRclPLjwXlsagDsn5Ycbxwek=', '2024-12-18 10:33:58.437612', 0, 'emirtest', '', '', 'emir.metis.sen@gmail.com', 0, 1, '2024-12-18 08:35:29.030793');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Les4Fantastiques', '0001_initial', '2024-12-10 08:35:40.664070'),
(2, 'contenttypes', '0001_initial', '2024-12-10 08:35:40.710145'),
(3, 'auth', '0001_initial', '2024-12-10 08:35:41.270672'),
(4, 'admin', '0001_initial', '2024-12-10 08:35:41.465556'),
(5, 'admin', '0002_logentry_remove_auto_add', '2024-12-10 08:35:41.465556'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2024-12-10 08:35:41.483952'),
(7, 'contenttypes', '0002_remove_content_type_name', '2024-12-10 08:35:41.570508'),
(8, 'auth', '0002_alter_permission_name_max_length', '2024-12-10 08:35:41.615138'),
(9, 'auth', '0003_alter_user_email_max_length', '2024-12-10 08:35:41.661195'),
(10, 'auth', '0004_alter_user_username_opts', '2024-12-10 08:35:41.671889'),
(11, 'auth', '0005_alter_user_last_login_null', '2024-12-10 08:35:41.709583'),
(12, 'auth', '0006_require_contenttypes_0002', '2024-12-10 08:35:41.709583'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2024-12-10 08:35:41.723711'),
(14, 'auth', '0008_alter_user_username_max_length', '2024-12-10 08:35:41.765719'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2024-12-10 08:35:41.808576'),
(16, 'auth', '0010_alter_group_name_max_length', '2024-12-10 08:35:41.851497'),
(17, 'auth', '0011_update_proxy_permissions', '2024-12-10 08:35:41.853577'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2024-12-10 08:35:41.903448'),
(19, 'sessions', '0001_initial', '2024-12-10 08:35:41.953453'),
(20, 'Les4Fantastiques', '0002_rename_text_question_question_text_choice_and_more', '2024-12-10 13:13:59.565095'),
(21, 'Les4Fantastiques', '0003_question_category_question_correct_answer_and_more', '2024-12-18 10:40:16.016488');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('85chrc8uryism2nczs57q1fgpg8cosj9', '.eJyrVioszayKLyxNLS7JzM8rVrKKjtVRSi4tKkrNK4ELK1kZ6CiVFqcWxSfmFZenFgGVVdfqQLQWlyQWlaSmKFmVFJWm1gIAycAeQg:1tKzni:V3SQYCP1gFl2cqxhwhEg9jgJBCJVLA9KjinOWBiaVug', '2024-12-24 12:57:18.185500'),
('5ijq1l9r85hgja3scsl9uxfiu4dx2z36', '.eJxVjDsOwjAQBe_iGln-xD9Kes5g2btrHEC2FCcV4u4QKQW0b2bei8W0rTVug5Y4IzszyU6_W07woLYDvKd26xx6W5c5813hBx382pGel8P9O6hp1G9tTRbZERqvwAqvpShGaPAwOQWKMBltHakwBXRKJ1myRJLgtMi6gAzs_QHQVDeU:1tNpj9:RhryQtocCAARL7_E35kNBvTOl6rKEhzDm_kuEcW-Ooo', '2025-01-01 08:48:19.391262'),
('unjhu96oibuh0etdwafr0q2k533plwvp', '.eJxVT8lqxDAM_RedRfDu2Mfe-wWlBG9p0haH8UJhhvn3OmUo7emht0m6weJ625ZeU1n2CBYo4F_Ou_CR8inEd5ffjikcuZXdT6dleqh1ej5i-nx6eP8VbK5uI62kJ16nKGcWFJk5JaskPMxBaBZYik5ypRMzwkTNuKOrpzHRoDnxfA3UjNJL36_Lpafa9iNXsC8SORqkqJEhJahQ4PyKEHopKbdfK9ghws8xLtevVEb2BnLQCBysRDBgDY7PLRUIesCYGFjGB0kGzggKLGcIYoBCmMEKckeozZVz0X4F20pP92-rxWRg:1tNrVo:-Re4H7bxKyM4oOPjOEBA-OSUo6KHP96sVkBBj56WM28', '2025-01-01 10:42:40.578785');

-- --------------------------------------------------------

--
-- Structure de la table `les4fantastiques_choice`
--

CREATE TABLE `les4fantastiques_choice` (
  `id` bigint NOT NULL,
  `choice_text` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `question_id` bigint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `les4fantastiques_choice`
--

INSERT INTO `les4fantastiques_choice` (`id`, `choice_text`, `is_correct`, `question_id`) VALUES
(1, 'Peter Parker', 1, 1),
(2, 'Bruce Wayne', 0, 1),
(3, 'Clark Kent', 0, 1),
(4, 'Tony Stark', 0, 1),
(5, 'Vibranium', 1, 2),
(6, 'Adamantium', 0, 2),
(7, 'Titane', 0, 2),
(8, 'Fer', 0, 2),
(9, 'Vert', 1, 3),
(10, 'Rouge', 0, 3),
(11, 'Bleu', 0, 3),
(12, 'Jaune', 0, 3),
(13, 'New York', 1, 4),
(14, 'Los Angeles', 0, 4),
(15, 'Chicago', 0, 4),
(16, 'San Francisco', 0, 4),
(17, 'Thor', 1, 5),
(18, 'Loki', 0, 5),
(19, 'Odin', 0, 5),
(20, 'Hela', 0, 5),
(21, 'Wolverine', 1, 6),
(22, 'Deadpool', 0, 6),
(23, 'Black Panther', 0, 6),
(24, 'Cyclope', 0, 6),
(25, 'Green Goblin', 1, 7),
(26, 'Thanos', 0, 7),
(27, 'Ultron', 0, 7),
(28, 'Red Skull', 0, 7),
(29, 'Captain America', 1, 8),
(30, 'Iron Man', 0, 8),
(31, 'Thor', 0, 8),
(32, 'Black Widow', 0, 8),
(33, 'Les Quatre Fantastiques', 1, 9),
(34, 'Les X-Men', 0, 9),
(35, 'Les Gardiens de la Galaxie', 0, 9),
(36, 'Les Inhumains', 0, 9),
(37, 'Doctor Strange', 1, 10),
(38, 'Scarlet Witch', 0, 10),
(39, 'Vision', 0, 10),
(40, 'Loki', 0, 10);

-- --------------------------------------------------------

--
-- Structure de la table `les4fantastiques_question`
--

CREATE TABLE `les4fantastiques_question` (
  `id` bigint NOT NULL,
  `question_text` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `difficulty_level` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `les4fantastiques_question`
--

INSERT INTO `les4fantastiques_question` (`id`, `question_text`, `category`, `correct_answer`, `created_at`, `difficulty_level`) VALUES
(1, 'Quel est le vrai nom de Spider-Man ?', 'Héros', 'Peter Parker', '2024-11-25 13:39:12.000000', 'Facile'),
(2, 'Quel métal compose le bouclier de Captain America ?', 'Objets', 'Vibranium', '2024-12-10 10:34:20.000000', 'Facile'),
(3, 'Quelle est la couleur principale de Hulk ?', 'Héros', 'Vert', '2024-12-10 10:34:20.000000', 'Facile'),
(4, 'Quel est le nom de la ville où Iron Man opère principalement ?', 'Héros', 'New York', '2024-12-10 10:34:20.000000', ''),
(5, 'Qui est le dieu du tonnerre dans Marvel ?', 'Héros', 'Thor', '2024-12-10 10:34:20.000000', 'Facile'),
(6, 'Quel est le super-héros avec des griffes en adamantium ?', 'Héros', 'Wolverine', '2024-12-10 10:34:20.000000', ''),
(7, 'Quel est l’ennemi juré de Spider-Man ?', 'Ennemis', 'Green Goblin', '2024-12-10 10:34:20.000000', 'Difficile'),
(8, 'Qui est le chef des Avengers ?', 'Héros', 'Captain America', '2024-12-10 10:34:20.000000', ''),
(9, 'Quel est le nom de l’équipe de super-héros composée de quatre membres ?', 'Équipes', 'Les Quatre Fantastiques', '2024-12-10 10:34:20.000000', 'Facile'),
(10, 'Quel super-héros est surnommé \"Sorcerer Supreme\" ?', 'Héros', 'Doctor Strange', '2024-12-10 10:34:20.000000', 'Difficile');

-- --------------------------------------------------------

--
-- Structure de la table `Les4Fantastiques_score`
--

CREATE TABLE `Les4Fantastiques_score` (
  `id` bigint NOT NULL,
  `best_score` int NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Les4Fantastiques_score`
--

INSERT INTO `Les4Fantastiques_score` (`id`, `best_score`, `updated_at`, `user_id`) VALUES
(1, 0, '2024-12-18 10:42:40.611068', 1);

-- --------------------------------------------------------

--
-- Structure de la table `personnage`
--

CREATE TABLE `personnage` (
  `id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `serie`
--

CREATE TABLE `serie` (
  `id` int NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  ADD KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  ADD KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  ADD KEY `auth_user_groups_group_id_97559544` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  ADD KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `les4fantastiques_choice`
--
ALTER TABLE `les4fantastiques_choice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Les4Fantastiques_choice_question_id_977e08b4` (`question_id`);

--
-- Index pour la table `les4fantastiques_question`
--
ALTER TABLE `les4fantastiques_question`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Les4Fantastiques_score`
--
ALTER TABLE `Les4Fantastiques_score`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Index pour la table `personnage`
--
ALTER TABLE `personnage`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `les4fantastiques_choice`
--
ALTER TABLE `les4fantastiques_choice`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `les4fantastiques_question`
--
ALTER TABLE `les4fantastiques_question`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `Les4Fantastiques_score`
--
ALTER TABLE `Les4Fantastiques_score`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `personnage`
--
ALTER TABLE `personnage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `serie`
--
ALTER TABLE `serie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
