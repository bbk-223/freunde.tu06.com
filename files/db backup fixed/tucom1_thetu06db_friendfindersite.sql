-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Erstellungszeit: 08. Dez 2024 um 23:20
-- Server-Version: 8.0.35
-- PHP-Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `tucom1_thetu06db_friendfindersite`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Daten für Tabelle `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20241202222355', '2024-12-02 22:28:44', 170);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `relationship` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_want_age` int DEFAULT NULL,
  `end_want_age` int DEFAULT NULL,
  `favorites` longtext COLLATE utf8mb4_unicode_ci,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `gender`, `birth`, `relationship`, `country`, `state`, `city`, `start_want_age`, `end_want_age`, `favorites`, `profile_picture`, `password`, `roles`) VALUES
(1, 'Eriberto Gerhold', 'glenda73@example.net', 'männlich', '1987-02-16', 'single', 'Deutschland', 'North Brett', 'Port Elisaville', 30, 42, 'Blanditiis qui omnis porro eaque quia ut. Rerum ab quos sit natus saepe nesciunt. Eos quibusdam dolorem sint fugiat rerum. Molestias qui ut quia cupiditate fugit. Ut repellendus temporibus corporis.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(2, 'Constance Wilkinson', 'verna88@example.org', 'weiblich', '1995-02-03', 'verheiratet', 'Deutschland', 'East Ashlee', 'Codymouth', 22, 43, 'Est id reiciendis ut similique aut esse. Quis explicabo est rerum consectetur voluptas maiores. Tempore esse id repellat blanditiis ipsa nobis.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(3, 'Bailey Von', 'alexanne30@example.com', 'männlich', '1981-05-20', 'geschieden', 'Deutschland', 'Ankundingtown', 'North Mariah', 29, 55, 'Qui adipisci deleniti cupiditate harum quaerat doloremque quisquam ex. Ratione nemo officiis cumque maxime. Est velit aut neque quis autem quia.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(4, 'Jamel McLaughlin Jr.', 'dolores.corwin@example.org', 'männlich', '1975-10-14', 'single', 'Deutschland', 'Lake Tylerview', 'Schowalterside', 25, 62, 'Enim doloribus molestias officia ratione quis animi modi. Facilis consequatur natus recusandae qui nihil est. Totam sunt sequi veniam nesciunt.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(5, 'Prof. Ocie Little', 'nhauck@example.com', 'weiblich', '1991-07-12', 'verheiratet', 'Deutschland', 'North Rebeka', 'Sageport', 25, 45, 'Laudantium est molestiae quae eos repellat perferendis. Quia fugiat magnam deleniti eveniet maxime et est architecto. Tempore enim quia ducimus dolor porro sequi.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(6, 'Kimberly Ruecker', 'marilou43@example.org', 'männlich', '1961-05-31', 'geschieden', 'Deutschland', 'Langworthfort', 'Garthmouth', 21, 58, 'Voluptates voluptatem recusandae provident voluptates ut aut. Sed unde aut omnis. Sunt amet sapiente aut perferendis.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(7, 'Ms. Rebecca Purdy', 'veum.karen@example.org', 'männlich', '1990-06-04', 'single', 'Deutschland', 'O\'Connerhaven', 'New Maia', 27, 59, 'Error dolorem id aut voluptas rem iste numquam. Minus eligendi animi iste aut dolorem molestias id. Delectus earum blanditiis alias quia voluptas tenetur. Eum laborum itaque tempore a repellendus.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(8, 'Mrs. Leann Hagenes III', 'lennie80@example.org', 'weiblich', '1966-12-14', 'verheiratet', 'Deutschland', 'Lake Keatonport', 'Port Cayla', 27, 53, 'Quam hic quia ex quo laboriosam eum delectus. At quaerat et ea inventore in commodi quo ipsa. Ratione hic molestias voluptates veritatis. Ipsa quo minus adipisci dicta voluptatum accusamus fugiat.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(9, 'Jayde Parker', 'robel.pierce@example.com', 'männlich', '1997-08-04', 'geschieden', 'Deutschland', 'South Francisca', 'South Ruth', 33, 58, 'Quam deserunt et voluptatem non. Eaque dolorem blanditiis in fuga. Ipsum odio voluptatem distinctio est repudiandae dolores et qui. Veniam cum dolorem fuga deserunt consequatur.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(10, 'Lucius Quitzon', 'liza79@example.net', 'männlich', '1988-09-21', 'single', 'Deutschland', 'Muellermouth', 'Jettton', 29, 36, 'Facere qui rerum qui ea eos porro adipisci. Id sequi vel exercitationem accusamus ut laudantium. Quidem facere vel minus quia cumque voluptas praesentium. Ipsa illo ut cum.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(11, 'Prof. Garnett Schneider', 'pouros.mazie@example.org', 'weiblich', '2003-11-10', 'verheiratet', 'Deutschland', 'New Cedrick', 'Port Devonte', 29, 41, 'Sequi sit assumenda quidem velit vel consequatur. Voluptatibus dolorem expedita et. Doloribus vel esse maiores sunt.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(12, 'Celia Wyman', 'robbie.carroll@example.net', 'männlich', '2003-09-25', 'geschieden', 'Deutschland', 'Goyettefort', 'Simoneshire', 18, 37, 'Sit enim et quasi ipsum. Eum quis velit sed cum qui ipsum sapiente. Accusamus nemo consectetur autem non dolor et.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(13, 'Mr. Tanner Jenkins', 'tjohnston@example.net', 'männlich', '1995-07-31', 'single', 'Deutschland', 'South Abrahamchester', 'Nolamouth', 22, 46, 'Et non et autem at eos similique. Libero et cum laboriosam earum odit. Aliquid eligendi ab qui omnis odio iste. Et voluptatem cumque enim enim fugiat minima totam.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(14, 'Merl Bartell', 'amelia92@example.com', 'weiblich', '1976-01-23', 'verheiratet', 'Deutschland', 'D\'Amoremouth', 'West Herbertport', 20, 65, 'Est modi illo quo consequuntur. Et nemo aliquam dicta voluptatem laudantium. Repellat aperiam quisquam eum voluptatem ut vel.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(15, 'Enid Bartoletti PhD', 'asenger@example.com', 'männlich', '1967-11-08', 'geschieden', 'Deutschland', 'Tillmanchester', 'Thielmouth', 24, 38, 'Et repellendus eos enim sit accusamus omnis. Nostrum ratione omnis nam molestiae quaerat animi voluptates. Voluptates ut porro ipsam sit incidunt commodi. Dignissimos nam eos et in omnis.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(16, 'Franz Zulauf', 'darrell.boyle@example.org', 'männlich', '1963-05-03', 'single', 'Deutschland', 'Hackettfurt', 'East Angelaburgh', 25, 44, 'Esse sunt sit et voluptatum rerum. Suscipit facilis modi quisquam et sint qui eos. Amet adipisci tenetur sunt sunt molestiae dolores labore. Rem at natus velit ad.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(17, 'Ophelia Larson', 'erdman.denis@example.org', 'weiblich', '2003-05-19', 'verheiratet', 'Deutschland', 'Jasperstad', 'South Janiya', 29, 49, 'Omnis magnam asperiores sapiente aspernatur et asperiores. Sint vel assumenda dolorem ducimus at quis. Laborum soluta explicabo fugiat et.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(18, 'Ida McCullough', 'reginald98@example.org', 'männlich', '1960-09-08', 'geschieden', 'Deutschland', 'McDermottburgh', 'Kyraborough', 23, 58, 'Consequatur sit dolores porro quia dolor quos ipsum. Non architecto error non sunt unde. Odio deserunt esse cupiditate qui. Sint alias placeat magni.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(19, 'Pansy Shanahan', 'walker.heidi@example.com', 'männlich', '1976-12-29', 'single', 'Deutschland', 'Kayleighland', 'West Adonismouth', 20, 52, 'Non explicabo voluptates ratione. Voluptatem ipsa recusandae sint id libero rem. Minima architecto natus ipsa rerum nihil ea.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(20, 'Broderick Streich', 'wiza.eugene@example.com', 'weiblich', '1997-04-16', 'verheiratet', 'Deutschland', 'West Bryanaburgh', 'South Germanburgh', 21, 61, 'Et maxime atque laudantium dolores. Deleniti corporis nisi inventore officiis ea nemo ut possimus. In ea consequuntur qui esse rerum est.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(21, 'Roxanne Ferry', 'eve93@example.org', 'männlich', '1987-10-27', 'geschieden', 'Deutschland', 'Elliotshire', 'Cummingsshire', 33, 52, 'Sint tenetur facilis architecto molestiae et et natus. Sit consequatur consequatur eum quos quo et quia. Assumenda blanditiis doloremque exercitationem eos minus quis dolorem.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(22, 'Madyson Dare', 'winona.abshire@example.net', 'männlich', '1986-09-15', 'single', 'Deutschland', 'North Waltertown', 'Port Jordaneside', 35, 56, 'Est voluptas temporibus quo assumenda ab aspernatur beatae perspiciatis. Pariatur asperiores beatae esse. Earum possimus eos vel est dolorum voluptatem quis. Molestias et voluptatum deserunt.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(23, 'Laurine Franecki', 'yhegmann@example.net', 'weiblich', '1961-07-31', 'verheiratet', 'Deutschland', 'Sanfordfort', 'Port Hassie', 29, 49, 'Quia qui ex totam. Aut ab beatae distinctio et. Est non quia explicabo libero.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(24, 'Bertrand Moore PhD', 'justine14@example.net', 'männlich', '1964-08-15', 'geschieden', 'Deutschland', 'Klockomouth', 'Emilioside', 31, 42, 'Voluptas consequatur expedita aut eveniet quasi ea omnis. Laborum laudantium deserunt mollitia aut id. Rerum dolor impedit debitis ut mollitia nisi quis. Distinctio voluptas nulla vel dolor.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(25, 'Domenica Kozey', 'prohaska.jack@example.org', 'männlich', '1999-06-21', 'single', 'Deutschland', 'Spencerfurt', 'Port Antonetteville', 25, 62, 'Similique et quos id aut minus consequuntur eius magnam. A aspernatur deleniti recusandae non est culpa. Quod in voluptatem autem laborum voluptatem doloremque.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(26, 'Dr. Asia Beer', 'witting.rodrick@example.org', 'weiblich', '1974-02-19', 'verheiratet', 'Deutschland', 'Port Harvey', 'Port Delbertbury', 23, 35, 'Ipsum fugiat nobis est veniam. Dolores natus iure corporis nulla. Vel nobis voluptas adipisci aut quas amet vero. Laudantium veniam sapiente explicabo numquam atque.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(27, 'Ethyl Jacobs', 'jerde.wyatt@example.net', 'männlich', '1977-10-29', 'geschieden', 'Deutschland', 'New Edytheville', 'Adolphushaven', 26, 48, 'Deserunt saepe eligendi facere saepe enim sunt reiciendis. Vero illum nulla est aliquid. Pariatur qui perspiciatis sunt ducimus laudantium.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(28, 'Kendrick Haley', 'yreinger@example.net', 'männlich', '1978-08-18', 'single', 'Deutschland', 'Port Eladiomouth', 'Haagstad', 22, 37, 'Architecto quia iusto aliquam nostrum perspiciatis commodi. Fugit est possimus molestiae aut eaque sequi.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(29, 'Junius Ondricka', 'kennedy30@example.com', 'weiblich', '1989-07-25', 'verheiratet', 'Deutschland', 'North Zackery', 'Port Ilianashire', 21, 41, 'Saepe praesentium architecto vel totam iusto voluptatem sed. Sed unde non cum esse sapiente eum ut quo. Minus dicta fugit est repudiandae.', 'test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '[]'),
(30, 'Babak', 'bbkddd@gmail.com', 'männlich', '1985-11-30', 'single', 'Deutschland', NULL, 'Dortmund', 43, 55, NULL, 'profile-images/profile-user-30.jpg', '$2y$10$R3XB4syapM3wcfj5Czka9uWyP7UgbHUwYyvtYx19vi.WmLQOFPRhq', '[]'),
(31, 'Kevin', 'kn.sarabi@gmail.com', 'männlich', NULL, 'geschieden', 'Deutschland', NULL, NULL, 45, 50, NULL, 'profile-images/profile-user-31.jpg', '$2y$10$lTKUoo4S7v9V3h3u29NVLeKpNSmHYnZBWTg1.tLblOIamYs6CFt4a', '[]'),
(32, 'Sara Bayati', '_firewall@yahoo.com', 'weiblich', '1975-07-19', 'single', 'Deutschland', NULL, 'munster', 20, 33, NULL, 'profile-images/profile-user-32.jpg', '$2y$10$PVE9sWO1V617vA3aZvI9.elr0FldPMBWkm/HkaeufxCxfnQK7fiaa', '[]'),
(33, 'Malihe', 'melobert@gmail.com', 'weiblich', '1982-06-22', 'single', 'Deutschland', NULL, NULL, 25, 40, NULL, 'profile-images/profile-user-33.jpg', '$2y$10$5Wwk2oipx8v0DFnv8cb8MOXwKBpgiyk2sqy8L038vvhudNz7j0sSy', '[]'),
(34, 'Saman', '7berjis@gmail.com', 'männlich', '1995-10-06', 'single', 'Deutschland', 'Niedersachsen', 'Munster', 20, 30, 'Fußball spielen, persische Musik, persische Serie,', 'profile-images/profile-user-34.jpg', '$2y$10$acITKnYYB4e2KCT9UqHebOHrZSsoO1OTaZjIzC37p11o.7RGV.GRa', '[]'),
(35, 'Shahin', 'shahin.sanayei.adesso+tu06@gmail.com', 'männlich', NULL, 'single', 'Deutschland', NULL, NULL, 27, 39, NULL, NULL, '$2y$10$KI8gXPYfsVrF7tEse.Ln/OQWxWnbRA1dbPqDlMJ9usHmY3rpiJrmC', '[]'),
(36, 'Arshia', 'arshianajafpour@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile-images/profile-user-36.jpg', '$2y$10$1m6WOjhF2yfnpE8PahUFP.dCevPKAeKlQTEXwNgtgc4C33JqBeTpm', '[]'),
(37, 'رومینا', 'rominanajafpour@gmail.com', 'weiblich', '2007-08-26', 'single', 'Deutschland', NULL, NULL, 24, 26, 'ورزش، موسیقی', 'profile-images/profile-user-37.jpg', '$2y$10$4os3QHgttGpj4fvsIyJY6eZauRnL8c4kZvKkQYdpmV/KRpAd8v/IO', '[]'),
(38, 'mohsen azizi', 'npsbabak@gmail.com', 'männlich', '1970-05-22', 'single', 'Deutschland', 'Nordrhein-Westfalen', 'Köln', 25, 37, 'Fußball spielen, Movie, Persische Musik', 'profile-images/profile-user-38.jpg', '$2y$10$zUQROOB3fiajYEX/GDdTOOEz2X5TDQO5pkIb7y6sRzCxZgxkWDJ9C', '[]'),
(39, 'مهرگان', 'melihaterl4@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile-images/profile-user-39.jpg', '$2y$10$WgYFeZCp5W9/umDC4iFiFOX3CA8dHvYfhv6.pUdyjFUntt0..9JX.', '[]'),
(40, 'Finch', 'finchzebra4477@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile-images/profile-user-40.jpg', '$2y$10$1wclGEv/eDKBE0BjaOmkU.ylxnoBlzfcQY460xjVgrVpgXm0269ue', '[]'),
(41, 'Mahtab', 'navyblueperl@gmail.com', 'weiblich', '1998-08-14', 'single', 'Deutschland', NULL, 'Frankfort', 20, 35, NULL, 'profile-images/profile-user-41.jpg', '$2y$10$hU8fDYor4/3fLiguN1TgteSAJHyD1tkjx4HOkBe0nq7UoI9ksimLq', '[]'),
(42, 'Neda', 'bakhshi-khadi@gmx.de', 'männlich', NULL, 'single', 'Deutschland', NULL, NULL, 18, 18, NULL, NULL, '$2y$10$UUo1h34Ut/w51EiNfxSwe.PrG2bFdK/8NY68Yu6cZksTttJWrj/dG', '[]'),
(43, 'Mehdi', 'mehdi.fasih20@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$NYgoSoUWC/xwJyU5o6P4d.La/uC6E2AxQ0KiBqu3lgGpGXZlV4C3.', '[]'),
(44, 'Shahin', 'shahination@yahoo.com', 'männlich', NULL, 'single', 'Deutschland', NULL, NULL, 18, 18, NULL, 'profile-images/profile-user-44.jpg', '$2y$10$1SUFmLlVi5jgP5GkdytBLuorjZlmK27l0mBCj2nJb1saOb9Cz42M.', '[]'),
(45, 'Mehrdad', 'misadyar@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$GE6.ZenHQRKTnVCEWbLV4u96h9mxX9iH4qoatfTUcDQew6rYE0lvi', '[]'),
(46, 'عسل', 'baharmashhadi9898@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$I7fjJg6lFx6DDUS8ta80fOpyQYXgyGiKzjqP86yJ4hp9FmIE/hNVy', '[]'),
(47, 'soheil', 'soheil.naderi79@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$9aJ4NT7ZFtlFpsrUsfr5uej/9KhC6KgHJ0nvrYsmljehQoQV.43Ly', '[]'),
(48, 'Edo', 'edo8ss88@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$06g/X9611XSXPVsnP7Qr9.y9.Shjm8JBWq0lNJnhycZNPgjtPtWoS', '[]'),
(49, 'Reza', 'khanireza5555@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$e2FeMl2N3iVLO1dc5f/nCuShZZVRpt3OXBlSrPjXYOsymn01z.0z2', '[]'),
(50, 'Aria', 'jobinromania@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$MBPg9P/PVS1yLaRH4eu/ZOLKre0PwTkp5jhc2mnYfrhSiXbW.QEbK', '[]'),
(51, 'Reza', 'rkh392653@gmail.com', 'männlich', '1966-03-16', 'single', 'Deutschland', 'NRW', 'Horstmar', 44, 57, 'sport\r\nswimming\r\nwalking', 'profile-images/profile-user-51.jpg', '$2y$10$OpQ8I1qKz079v7sl8l1VrO6G.UgloMKXu6kU0EP6dS8NM041CQgBy', '[]'),
(52, 'سحر', 'zaymanyt@gmail.com', 'weiblich', '1990-09-30', 'single', 'Deutschland', NULL, NULL, 18, 30, NULL, 'profile-images/profile-user-52.jpg', '$2y$10$wBatHFrplUA9cuOAiA0.OO157bL393PmqVEKRBhGRfD6idLs66Alu', '[]'),
(53, 'Mandana R', 'saymonette@gmail.com', 'weiblich', '1996-12-20', 'geschieden', 'Deutschland', NULL, NULL, 27, 36, NULL, 'profile-images/profile-user-53.jpg', '$2y$10$GRwp.Qu45/SKmesmQW5od.hKFLAfJqzc3D9zgkPXH5xzJqDFmobsa', '[]'),
(54, 'Ava', 'roobisay@gmail.com', 'weiblich', NULL, 'single', 'Deutschland', NULL, 'Dortmund', 18, 32, 'Sport\r\nFilm & Musik', 'profile-images/profile-user-54.jpg', '$2y$10$wyAANGKYpLF5wF9EBY5pDenqzVnQ.1faW7gNEDClYARoyqhHgbTyO', '[]'),
(55, 'Ehsan', 'mehrd69@gmail.com', 'männlich', '1988-01-01', 'single', 'Deutschland', 'Nordrhein-Westfalen', 'Essen', 25, 45, 'Schwimmen, Freunde treffen, badminton spielen, kochen, spazieren gehen, in Natur gehen, ins Kino gehen,..', 'profile-images/profile-user-55.jpg', '$2y$10$DVWMx6AIGiYQ/TO7sCl3h.UBo50SmxyNNA97a4wKExc9nGXJSBGXy', '[]'),
(56, 'Alireza', 'alireza_mo@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ZJMs.soeHx3zimwRXJqGxujuODuih.Xfojwa4NLN5f3eyr8rC//ae', '[]'),
(57, 'Mohammad', 'aliabarghi2054@yahoo.com', 'männlich', '1997-12-16', 'single', 'Deutschland', NULL, NULL, 18, 35, NULL, 'profile-images/profile-user-57.jpg', '$2y$10$uHO7av5jMsei.AjeZ3BjNOBvM5AnOf0wYD5VkePjzmw8ikf2OiSg2', '[]'),
(58, 'Pardis', 'prd_997@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$HdPdTi2sp4/M5gimTj0FOuLG.BR8V22pAHACr4OOer5sLvHRQ8vUi', '[]'),
(59, 'shahin', 'daryoushgheibi@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$OQmf1/56Zzk9zbQbl15AK.ALlbOyIgq0ufVyIoZpajwoXpVM9oBpm', '[]'),
(60, 'Ssina', 'mehdijalaly0@gmail.com', 'männlich', '1990-01-08', 'single', 'Deutschland', 'Nordrhein-Westfalen', 'Essen', 30, 45, 'Kochen.kuchen.reisen.bücher.', NULL, '$2y$10$dKkkoLo5KynBSruLrSFmNuDmLuipvxRLSJSC/qWiBETqkBVNOgFt6', '[]'),
(61, 'Mehran', 'amiramiri85520@gmail.com', 'männlich', '1985-05-20', 'verheiratet', 'Deutschland', NULL, 'Nürnberg', 20, 50, NULL, 'profile-images/profile-user-61.jpg', '$2y$10$zdJo/db0QZdlc/WFzyr4K.x5XDHyTdcsAD6W9cc./01haaIw9qoF6', '[]'),
(62, 'Po', 'pichkah.pooya82@gmail.com', 'männlich', '1982-10-14', 'geschieden', 'Deutschland', 'Nordrhein-Westfalen', 'Köln', 30, 50, NULL, 'profile-images/profile-user-62.jpg', '$2y$10$Lz0xidkbnm4yTKKp2cC7iui7tKWMmmjJn8ihy1By0AQcOWiNnmLGG', '[]'),
(63, 'Amir', 'yekttam001@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$NeZxj34g25ZBTR8uMRxCAu5Uy1BJH.BsO4IGQbDOCT57mjUkeaC/G', '[]'),
(64, 'Salah', 'salah0098biwer.21@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ZBO12oMXT.JLwPBviCntyumg30YGT3CPg.kg8O/gCrrorhlfUA3Mi', '[]'),
(65, 'Ahmadalon2', 'ar4489218@gmail.com', 'männlich', '1996-04-01', 'single', 'Deutschland', NULL, NULL, 18, 89, 'دوست دار یا رابطه پایدار و سالم صداقت راستی ‌وفا داری . هستم و شعر خوندن قدم زدن رو خیلی دوست دارم پیاده روی . آدم بااحترامی هستم . خوشحال میشم همکلام بشم با احترام کامل .', NULL, '$2y$10$CbT2KBNuAMo5Jw9zFDWdkeJ8CEsMss0dBxC2m77wqjM0XXXtP.kvq', '[]'),
(66, 'Omid', 'omidamini2721@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$5E67EHdXpThFDU7678kkg.UjhGCP0B1vgu6.XvsoiwyUv7wb7u9WG', '[]'),
(67, 'Ffsx', 'ardalanmjc@gmail.com', 'männlich', '1993-07-18', 'single', 'Deutschland', 'Hamburg', 'Hamburg', 18, 36, NULL, 'profile-images/profile-user-67.png', '$2y$10$ZbW1lf.5TSoTbGlUk/cvGeFENoGlKujHUGEE8N/ZGBDQ.4LDB6Pxy', '[]'),
(68, 'sayed.mesba@gmail.com', 'sayed.mesba@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$AjVis7JTbD4PTX3WvdbmFuibPYyzPwZiVMejpCBLJ8YLUotz1/udK', '[]'),
(69, 'Zkria', 'kabulandarab8@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$gRCG0VljB0rI04hhiDc6AuZvF/5aBab6nrXdwAC0F2TDUq1VJ.U3.', '[]'),
(70, 'Reza', 'razmara99@gmail.com', 'männlich', '1984-03-08', 'single', 'Deutschland', 'Bayern', 'Nürnberg', 32, 43, 'Musik,spazieren,movie', 'profile-images/profile-user-70.jpg', '$2y$10$o.lrJxChIYqUAHUa7VBmrOiOkFZ0o3ZRbR9dgJkuLneZAuLbo62jO', '[]'),
(71, 'Tanhaa', 'fath.ashrafi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$qtUZUeacVYG7uSLUkTCjIOncZ.odqI3fNnLKW6UzsmJ85CyA2IAPu', '[]'),
(72, 'Abas', 'kissmealwas@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$vFLLIeRz68A6BCjpmkks2.Vk5Vx56FG2blrptR5YdXCo.n/qxZPXu', '[]'),
(73, 'Sarah', 'nuristan1@web.de', 'weiblich', '1970-06-09', 'single', 'Deutschland', 'BW', 'Freiburg', 54, 59, 'نویسندگی ، فکرهای علمی ، فلسفه، روانشناسی ، هنر ، و غیره', NULL, '$2y$10$pRdn8xIhGJ60R7/F8h9uWeQSiR0gK87.ATu4P4q7KtIM0AqqHClya', '[]');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
