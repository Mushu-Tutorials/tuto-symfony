-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.1.38-MariaDB-0ubuntu0.18.10.2 - Ubuntu 18.10
-- SE du serveur:                debian-linux-gnu
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour agency
DROP DATABASE IF EXISTS `agency`;
CREATE DATABASE IF NOT EXISTS `agency` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `agency`;

-- Listage de la structure de la table agency. migration_versions
DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table agency.migration_versions : ~6 rows (environ)
DELETE FROM `migration_versions`;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
	('20200607153112', '2020-06-07 15:31:30'),
	('20200608120630', '2020-06-08 12:06:37'),
	('20200608120921', '2020-06-08 12:09:39'),
	('20200619081516', '2020-06-19 08:15:24'),
	('20200622081637', '2020-06-23 07:31:19'),
	('20200623114356', '2020-06-23 11:44:27'),
	('20200623123538', '2020-06-23 12:35:42');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;

-- Listage de la structure de la table agency. option
DROP TABLE IF EXISTS `option`;
CREATE TABLE IF NOT EXISTS `option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table agency.option : ~4 rows (environ)
DELETE FROM `option`;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
INSERT INTO `option` (`id`, `name`) VALUES
	(1, 'Balcon'),
	(2, 'Adapté PMR'),
	(3, 'Ascenseur');
/*!40000 ALTER TABLE `option` ENABLE KEYS */;

-- Listage de la structure de la table agency. property
DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `surface` int(11) NOT NULL,
  `rooms` int(11) NOT NULL,
  `bedrooms` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `heat` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sold` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table agency.property : ~99 rows (environ)
DELETE FROM `property`;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` (`id`, `title`, `description`, `surface`, `rooms`, `bedrooms`, `floor`, `price`, `heat`, `city`, `address`, `zipcode`, `sold`, `created_at`, `filename`, `updated_at`) VALUES
	(105, 'et inventore magnie', 'Et hic aliquid quia id aspernatur dolorem provident. Aut consectetur dolores placeat qui tempora iste. Ad porro suscipit ut non.', 181, 10, 6, 3, 708882, 1, 'Delaunay-sur-Lopes', '11, boulevard de Germain79 241 Bouvet-sur-Philippe', '03573', 0, '2020-06-19 13:55:58', '5ef33d7539f26950523133.jpg', '2020-06-24 13:48:05'),
	(109, 'hic ut quas', 'Modi expedita voluptas impedit nobis earum nihil provident eaque. Praesentium ipsa corporis similique dolores. Aut sint et et tenetur tempora laboriosam.', 29, 4, 6, 15, 594376, 0, 'Guillonboeuf', '9, chemin Maury01569 Rodriguez', '58003', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(110, 'eaque assumenda est', 'Consequatur voluptas excepturi corporis dolorem harum. Expedita a et autem modi ducimus. Aliquid mollitia vitae facere incidunt omnis eos laboriosam.', 212, 5, 5, 3, 882309, 0, 'Mathieu', '54, place de Millet\n79039 Olivierboeuf', '48 364', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(111, 'et natus quas', 'Iste animi sit ducimus veritatis. Ipsum necessitatibus ipsa nostrum reprehenderit repudiandae possimus aut. Nobis et numquam non est dignissimos.', 336, 6, 8, 0, 919210, 1, 'Roy', '94, place de Legendre\n87975 Coulon-sur-Berthelot', '55 911', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(112, 'quos quasi officiis', 'Vel nihil consequatur consequatur similique. Facere id eligendi voluptas eum. Rerum nostrum itaque non qui sunt officia nostrum.', 141, 5, 6, 9, 259010, 0, 'Levy', '13, place Martine Perrier\n42 952 Morenoboeuf', '20 915', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(113, 'fugiat earum ut', 'Perferendis esse ad earum nam et quidem. Quo laborum dicta quam delectus. Beatae et nihil officia qui debitis velit maiores.', 229, 9, 5, 10, 559808, 0, 'Marie', 'rue Nathalie Lemonnier\n00 049 De Oliveira', '23 320', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(114, 'harum dolorem perferendis', 'Sint qui cum quas aut fugiat. Et fugit et delectus laudantium sit. Corporis consequatur consequuntur impedit.', 115, 7, 3, 15, 899162, 0, 'Mahedan', '969, rue Susan Dupuis\n38 215 Perrot', '06274', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(115, 'eius et debitis', 'Itaque tempore architecto laboriosam eaque asperiores. Iure odio temporibus iure nulla beatae. Non totam pariatur rerum eveniet.', 189, 7, 5, 10, 469558, 1, 'MartinezVille', '35, boulevard Thierry\n75 231 Moreno', '23137', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(116, 'quas iure blanditiis', 'Pariatur et et nisi quia dolorum corrupti. Et eligendi et quasi. Qui est eos dolorum et autem aspernatur.', 188, 7, 3, 0, 330017, 1, 'SeguinVille', 'place de Vaillant\n61 037 Perrot-les-Bains', '87188', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(117, 'iure amet nisi', 'Et rerum consequatur natus nihil. Aspernatur delectus est fugit quo rerum est. Nesciunt sed et iste non nam voluptas incidunt et.', 80, 2, 7, 0, 496551, 1, 'Fabrenec', '87, boulevard Gaillard\n53495 MalletVille', '18594', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(118, 'voluptatem qui cum', 'Tempore asperiores natus illo eum minus. Error nobis ut et et eos a. Ut aut repudiandae soluta rerum et itaque.', 28, 2, 9, 7, 322674, 0, 'Breton', '81, chemin Éric Louis\n63 899 Courtois-sur-Mer', '98 504', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(119, 'dolores eveniet in', 'Molestiae dolores eos officia sit minus tempore eligendi veritatis. Aperiam nobis ipsam ab nostrum voluptate. Ut fugit consectetur fugit.', 88, 9, 8, 4, 834353, 1, 'Charpentier', '8, place Franck Mendes\n23506 Peltier-sur-Bourgeois', '85 422', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(120, 'perferendis corrupti distinctio', 'Ut consectetur ab sapiente quisquam cumque. Odio ducimus sunt ut provident. Quia est iste doloremque ut cupiditate blanditiis.', 329, 5, 4, 7, 304850, 1, 'Lemonnier-sur-Guerin', '2, rue Thibaut Brunet\n22 394 Etienne-sur-Mer', '75616', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(121, 'est quo asperiores', 'Et maxime eos occaecati minus. Vitae illum error qui ea fuga. Molestiae sint assumenda qui velit inventore doloremque.', 90, 9, 5, 1, 988279, 1, 'Gimeneznec', '190, impasse Margaud Dupuis\n83474 SalmonBourg', '29012', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(122, 'perferendis id et', 'Nihil magnam repellat a. Aut alias quis ipsam non. Officia est non vitae odio perspiciatis minima accusamus reiciendis.', 305, 6, 2, 3, 913047, 1, 'Olivier-la-Forêt', '292, impasse Thibaut Laporte\n62 136 Boutin-sur-Lebon', '04 995', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(123, 'ut saepe eos', 'Consequatur corporis commodi quaerat veniam qui. Vitae sint ducimus excepturi ad occaecati. Eveniet ea assumenda voluptatem nesciunt voluptas nemo doloremque omnis.', 117, 6, 5, 5, 405707, 1, 'Moreaudan', '23, rue Audrey Bigot\n05544 Fernandes', '24 259', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(124, 'officia et ullam', 'Quasi voluptas pariatur maiores mollitia omnis qui praesentium enim. Quod ab optio vero dolorum et iure officia. Est et sit laborum qui totam repellendus id soluta.', 317, 9, 4, 9, 157725, 0, 'Texier', '2, avenue Thibault\n17 855 Bonneau', '03083', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(125, 'ab necessitatibus laudantium', 'Dolores saepe consequatur ipsam impedit ut excepturi architecto. Ut enim sequi porro iure id expedita eos. Quidem consequuntur ipsa voluptatem animi.', 331, 6, 8, 1, 467554, 1, 'Robert', '60, rue Moulin\n64 497 Pichon', '03113', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(126, 'ducimus laboriosam delectus', 'Cupiditate beatae mollitia quasi esse asperiores iusto in. Eligendi nemo deleniti ut at iusto. Dicta eligendi amet qui corrupti ut.', 159, 7, 7, 9, 643980, 1, 'Lacombeboeuf', 'rue de Leduc\n68 919 Petitjean', '68 800', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(127, 'quas rerum harum', 'Quasi odit reiciendis aut quod doloribus. Et voluptatem doloremque eveniet est. In aliquid ut fugit qui nostrum non.', 313, 6, 1, 1, 966400, 0, 'Collin', '5, chemin de Imbert\n39 451 Lefevre', '19355', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(128, 'iusto architecto perferendis', 'Ab consequatur vel pariatur beatae non. Consequatur et molestiae qui ab non aut illo. Laborum fugiat harum aspernatur impedit.', 51, 5, 5, 13, 152871, 1, 'Bourgeois-sur-Tanguy', '786, rue Daniel Coste\n56822 Le Goff-sur-Langlois', '72051', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(129, 'facilis rerum maiores', 'Ex exercitationem nihil ducimus quam quod sunt rem. Voluptatibus inventore tenetur dolor consequatur magnam. Necessitatibus est quisquam in asperiores qui libero.', 105, 5, 7, 7, 977059, 1, 'Maillot-sur-Briand', '6, boulevard Théophile Lombard\n78 228 Tessier', '06 830', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(130, 'molestias non amet', 'Aut eius sit magnam similique. Numquam ad maxime saepe labore amet. Nihil veritatis illum saepe maxime.', 167, 10, 5, 3, 933388, 0, 'Picard', '59, rue de Hubert\n87367 Chevalier', '25 532', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(131, 'fugiat excepturi exercitationem', 'Rerum perferendis dolores impedit et tenetur excepturi. Dolorem est dolorum rerum. Nisi voluptates molestias velit omnis quibusdam et sunt.', 308, 8, 1, 15, 986085, 1, 'Leveque', '5, place de Guyot\n12549 Boulaynec', '36322', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(132, 'assumenda incidunt iusto', 'Natus quia minus repellendus iusto ab sunt esse. Quibusdam rerum modi eos nihil. Quam omnis est aut accusantium quidem sed quia.', 334, 4, 4, 7, 834076, 0, 'Laporte', '76, place Élodie Bonnin\n55456 Le Goff', '81928', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(133, 'magnam ut totam', 'Molestiae dolorem eveniet alias et. Aliquid pariatur adipisci neque. Tempore dolores quibusdam maxime suscipit ad ut rerum consectetur.', 125, 5, 8, 15, 375056, 1, 'Nicolas', '94, chemin de Hoarau\n52243 Paris-les-Bains', '63 729', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(134, 'esse est atque', 'Aut officia possimus eum dolorem facere provident neque. Voluptas quia voluptatibus non. Ea omnis exercitationem et et.', 70, 8, 4, 1, 876047, 1, 'Lejeune', '50, place de Guyot\n02453 Ferreira-sur-Jean', '39794', 0, '2020-06-19 13:55:58', '', '0000-00-00 00:00:00'),
	(135, 'sunt qui vel', 'Et impedit nesciunt voluptatem quidem autem. Et ipsa sint unde officiis esse eveniet veritatis mollitia. Ullam sit velit in asperiores voluptatem.', 327, 7, 6, 13, 399570, 1, 'Buisson', '35, impasse de Perrier\n42 619 SimonVille', '95 994', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(136, 'dolores quis harum', 'Qui in totam non delectus excepturi tempora. Qui distinctio et accusamus et et. Repellat est est eos.', 327, 6, 5, 7, 192080, 0, 'Labbe', '47, rue de Foucher\n76364 Robert-sur-Mer', '95048', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(137, 'aut voluptatibus modi', 'Vitae reprehenderit consectetur quia nulla excepturi. Et quas animi quibusdam dolores. Deserunt qui occaecati blanditiis voluptas beatae qui temporibus reiciendis.', 212, 9, 9, 15, 743455, 0, 'Legrand', '268, rue Alexandre Charpentier\n90 880 Louis-sur-Mer', '12 829', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(138, 'fuga dignissimos aut', 'Possimus atque consequatur praesentium ipsam iusto iste ipsam. Voluptatem ut ipsam non aut deserunt exercitationem sint. Assumenda laboriosam quos quo et placeat.', 339, 10, 6, 1, 989718, 1, 'Lejeune', '14, impasse Corinne Hoarau\n23 719 Augerdan', '15 796', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(139, 'animi ut architecto', 'Dolorum facilis quasi et qui illum perferendis. Omnis deleniti repellat alias eum tempore. Facilis officiis accusamus quam totam asperiores enim.', 122, 7, 1, 7, 256011, 0, 'Grenier', '1, rue de Masse\n01737 Vaillant', '57 700', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(140, 'veniam voluptatum explicabo', 'Rem natus quo quo et provident blanditiis. Non eligendi ratione dolorem blanditiis quae delectus tenetur. Quis repellendus deserunt architecto error reprehenderit blanditiis.', 341, 4, 9, 3, 511394, 1, 'Boyer-sur-Legendre', '83, chemin Laurent Cordier\n22 732 Dupont', '92 223', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(141, 'quae nesciunt qui', 'Sunt reiciendis et sed ratione architecto molestias. Et sit ullam aut nulla ut. Et officia nam recusandae velit sapiente mollitia quia.', 27, 3, 8, 11, 516170, 0, 'Delattre-la-Forêt', 'rue Salmon\n73 948 LetellierBourg', '61 093', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(142, 'sit aliquid tempore', 'Sunt mollitia voluptates porro et iure qui similique. Accusantium eveniet et quae distinctio. Quisquam aperiam ipsa voluptatem perspiciatis.', 120, 3, 3, 4, 521322, 0, 'PetitVille', '9, boulevard Camille Torres\n70907 SchmittBourg', '80 530', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(143, 'vel voluptatum cumque', 'Accusantium sequi minima assumenda est explicabo. Rerum placeat vitae unde accusamus. Distinctio accusantium ipsa sint.', 166, 10, 5, 15, 754585, 1, 'Morin', '49, rue de Pages\n98867 Vincentnec', '35674', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(144, 'inventore est ullam', 'Recusandae magnam adipisci dolorem dolores corporis ut eligendi. Iure voluptatem quis sit quos. Maiores nam nam voluptatem.', 232, 2, 7, 4, 401022, 0, 'Ruiz', '38, rue Valette\n08313 Albert', '33 885', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(145, 'rerum quia maxime', 'Praesentium vero sapiente possimus at qui. Atque expedita architecto dignissimos dolorem consectetur sequi est. Error perferendis est tenetur nihil magnam sint repellendus cumque.', 35, 5, 1, 15, 499867, 1, 'Guerin', '31, rue Élodie Laine\n36 231 Gonzalez', '87 483', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(146, 'omnis illum distinctio', 'Distinctio possimus quam vero inventore nostrum maiores neque. Alias facilis facilis temporibus nam vel nemo voluptatem iusto. Quia aut sunt unde ut.', 296, 6, 2, 4, 775892, 1, 'Merlenec', '49, rue de Paris\n64209 Bouvier', '09 440', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(147, 'consequatur molestias quia', 'Nostrum id deserunt aliquam recusandae possimus repellat aliquid. Qui recusandae odio sint maiores sit. Eum quidem laudantium porro cumque fugiat soluta neque.', 83, 8, 8, 0, 469430, 0, 'Le Goffdan', '88, avenue de Torres\n59 776 Carlier', '01882', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(148, 'ad tempora est', 'Sed illo debitis at velit sit. Id accusantium dolores aut minus quis. Ratione vero ipsam aliquid illum.', 168, 3, 4, 7, 954477, 1, 'RobinVille', '48, impasse Courtois\n76 330 Guyot-la-Forêt', '79720', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(149, 'ullam porro velit', 'Voluptatem consequatur molestias enim maxime ex quis nisi. At veniam est repellat iste. Rerum labore beatae at totam.', 96, 7, 1, 5, 731852, 0, 'Garcia', '5, impasse Fernandes\n30 108 Duhamel-sur-Mendes', '07 616', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(150, 'voluptatem vitae doloremque', 'Fuga dolor facere ut aspernatur qui et non doloribus. Ipsa ullam quo sed deleniti. Impedit fugit rem architecto ut doloribus.', 202, 6, 1, 4, 731461, 0, 'VerdierBourg', '48, boulevard Lucie Chartier\n74967 FerrandBourg', '69 769', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(151, 'possimus consequatur ea', 'Tempora officiis culpa fuga est aspernatur. Rerum omnis dignissimos excepturi aut magni. Debitis ut sint maxime soluta et accusantium.', 301, 4, 7, 14, 949755, 1, 'Munoz', '31, impasse Marcelle Poulain\n63 157 Morin', '16762', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(152, 'doloribus voluptas perspiciatis', 'Est dolores iste consequatur rerum. Rerum dolor ad aut suscipit consequatur et. Doloribus tempore eligendi excepturi deleniti sunt eius.', 166, 3, 8, 10, 381180, 0, 'Camus', '4, rue David Durand\n62327 Le Goff', '99340', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(153, 'omnis est error', 'Vitae sapiente iusto nam ipsa repellat. Facilis praesentium non et. Voluptatum est et optio officia sit in.', 350, 4, 9, 7, 188595, 0, 'Bonnet', '14, place Nathalie Bonneau\n50 712 Gimenez-sur-Jacques', '66878', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(154, 'quia fuga quia', 'Autem vero iusto rerum dolore asperiores molestiae sequi ex. Eum unde voluptate nam perferendis. Perspiciatis nesciunt saepe qui id quam saepe iste veniam.', 245, 2, 8, 3, 486494, 0, 'Leveque', '4, avenue Chantal Michaud\n23091 Rogernec', '51 561', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(155, 'optio maiores voluptatibus', 'Architecto atque illum id consequatur qui dolores. Quasi totam quia et possimus possimus. Magnam voluptatem quidem cupiditate molestiae impedit sequi.', 254, 2, 1, 9, 194793, 0, 'LecoqBourg', '468, rue Richard Morvan\n18867 Bessondan', '56252', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(156, 'fugiat quia molestiae', 'Quasi occaecati a vel molestias. Est ad libero in quo iure magni sed. Adipisci nisi veniam tempora non voluptate.', 210, 9, 7, 14, 574696, 1, 'GuilletVille', '9, boulevard Lenoir\n22 087 Devauxdan', '95 984', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(157, 'eos molestiae ullam', 'Ea est est omnis accusamus laboriosam et at. Quia pariatur qui perferendis enim libero. Sit et asperiores consequatur fuga.', 35, 2, 8, 9, 534506, 0, 'Bernard', 'impasse de Lelievre\n34860 Colin-sur-Pichon', '85 256', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(158, 'fugit ad explicabo', 'Eum odit fugit et sapiente. Vero inventore facilis ipsam fugiat iste temporibus nihil. Excepturi repudiandae et hic nobis blanditiis quasi.', 181, 9, 4, 12, 337338, 1, 'LetellierBourg', '5, avenue de Maillard\n62 454 Pascal', '72799', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(159, 'aperiam ut incidunt', 'Est fugiat natus qui ex quaerat. Impedit perferendis maxime quas nemo. Qui harum minima pariatur est nihil quasi voluptas magni.', 128, 9, 5, 13, 495766, 1, 'Rousset', '176, place Chantal Bodin\n10 313 Jacquet-sur-Maurice', '55759', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(160, 'expedita adipisci aut', 'Dignissimos iure iste officia voluptatem ut non laudantium. Ex maiores ipsum tempora quod ab dolore. Voluptas nemo quia est adipisci quia beatae.', 294, 7, 6, 3, 428124, 1, 'Brun', '207, chemin Rémy Caron\n99297 Joly-sur-Collin', '78573', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(161, 'eos id quo', 'Tempora quis a earum. Explicabo possimus consequatur quia. Doloremque ex voluptatem magnam.', 155, 4, 4, 11, 260556, 1, 'Devaux', '86, place Leclerc\n41246 Fernandez', '16751', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(162, 'nemo quia harum', 'Deserunt quam nulla rerum nesciunt. Voluptas aut et laboriosam et corporis quidem nobis. Inventore maiores laborum eos.', 302, 5, 2, 2, 271981, 0, 'HerveVille', '461, place Sébastien Vaillant\n84 262 PrevostVille', '40 959', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(163, 'fuga dolor recusandae', 'Voluptatum quos quod quia. Explicabo illo ea excepturi saepe ipsum. Sunt qui laudantium nostrum voluptatem vitae.', 165, 2, 2, 10, 371275, 1, 'Leroynec', '1, avenue De Oliveira\n17 680 Fontaine', '37038', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(164, 'qui ipsum harum', 'Consequuntur et saepe sapiente est. Laboriosam distinctio illum nobis quod nisi. Tenetur et omnis odit ullam molestias fugiat illum sed.', 65, 6, 1, 10, 667418, 0, 'Raynaud-les-Bains', '571, boulevard de Pichon\n43149 Valettenec', '10818', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(165, 'quae et laboriosam', 'Natus ut explicabo aspernatur iusto eos et. Nobis dolore ducimus nulla numquam rem nam tempora cum. Debitis vitae officiis fugiat minus.', 142, 9, 4, 13, 140779, 1, 'Boucher', '40, rue Turpin\n71 009 Albert', '82164', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(166, 'ratione nemo sint', 'Sit ea deserunt sit sit corrupti. Autem voluptates id in aut quas. Ullam doloribus itaque eum sint.', 183, 4, 6, 5, 403214, 0, 'Seguinboeuf', '559, impasse Bruneau\n97 365 DumontBourg', '04655', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(167, 'doloremque inventore enim', 'Veritatis non asperiores alias non. Dicta ipsa iste architecto autem est laboriosam. Labore dicta repellat assumenda.', 172, 2, 5, 14, 250810, 0, 'NicolasBourg', '338, boulevard de Auger\n86794 Thibault', '62123', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(168, 'expedita et ipsa', 'Ea quis cumque ea nemo voluptas. Odio repudiandae saepe iste qui quaerat unde autem. Et ea eligendi voluptatibus ut dolores eius.', 120, 9, 1, 5, 624726, 0, 'Rousset-les-Bains', '11, boulevard Guillaume Tessier\n27 411 Benoit-sur-Langlois', '49 050', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(169, 'et quos recusandae', 'Vitae harum quo voluptatum voluptatum aut impedit. Itaque reiciendis neque placeat dignissimos autem. Est veniam rerum et odit provident.', 294, 2, 6, 6, 223647, 0, 'Monnierdan', '398, boulevard Michel Poirier\n63308 Laine-la-Forêt', '09 434', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(170, 'consequatur dolores debitis', 'Et aperiam doloremque repellat omnis est in. Ipsa officia dignissimos excepturi ut molestias. Quos ex accusantium quibusdam.', 297, 8, 2, 4, 917605, 0, 'GomezVille', '63, place de Barthelemy\n94 909 Renaud', '01 235', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(171, 'in nisi eum', 'Iure autem et est ipsum. Quae ad enim ut. Officia maiores fugit ad nostrum quos explicabo provident.', 23, 10, 8, 8, 670341, 1, 'Bousquet-sur-Mer', '7, avenue Dupre\n83 163 Gilles-la-Forêt', '31 579', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(172, 'occaecati dolores aut', 'Dolor vel dignissimos molestias est aut tempora cum. Et sit vel ut omnis. Aut dolor reprehenderit minima omnis voluptatem delectus voluptatem aut.', 245, 4, 9, 7, 107853, 1, 'Perret-sur-Mer', '55, impasse Auger\n45 803 Gros', '50 624', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(173, 'odio cum et', 'Labore cupiditate placeat odio tenetur. Nulla eos iste veniam quos atque veniam. Deserunt magnam qui corrupti cupiditate velit.', 278, 8, 4, 15, 558216, 1, 'Fouquet', 'avenue Lucas Lucas\n30 754 Gimenez', '00643', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(174, 'rem vel officiis', 'Enim dignissimos sed expedita ut. Fuga et qui molestias sint qui cupiditate et ab. Quis dolor voluptates expedita corrupti quis iusto illo officiis.', 287, 9, 1, 2, 689396, 0, 'Menard', 'avenue de Cohen\n39645 Antoinedan', '51 445', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(175, 'adipisci molestiae architecto', 'Ad nisi beatae atque. Aspernatur nulla non repudiandae. Animi molestias provident consequatur dolore numquam.', 244, 8, 6, 3, 444545, 1, 'Grenierdan', 'place de Pruvost\n88335 Pasquier-la-Forêt', '25649', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(176, 'rerum cum ea', 'Repellat minus aperiam consequuntur. Fuga qui qui id distinctio ea ab minus. Fuga et et doloremque et.', 114, 7, 2, 10, 818171, 0, 'Vallet', 'boulevard Richard\n96 940 Alexandre', '96 030', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(177, 'sint id eos', 'Ut libero modi libero eius fuga. Totam ut aspernatur et odio quod corrupti. Exercitationem deserunt porro quam non vero.', 258, 5, 9, 7, 363927, 1, 'Fabre', '85, rue Thierry Vallee\n10104 Michaud-sur-Buisson', '89412', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(178, 'ut dolor enim', 'Eos occaecati autem voluptatibus ut modi ipsam quibusdam. Blanditiis molestias optio quisquam vero. Delectus sint vero odit.', 118, 8, 3, 13, 275285, 1, 'FernandesBourg', 'impasse Ramos\n51 479 Gonzalezboeuf', '27649', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(179, 'dolores doloribus quibusdam', 'Et aspernatur et sapiente quas et occaecati. Est non illum nihil non minus. Quae consequatur neque ad placeat omnis.', 47, 5, 1, 13, 446879, 1, 'Lemoine', '72, chemin Allain\n68 324 Thierry', '35 445', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(180, 'quas atque reprehenderit', 'Nesciunt qui fuga consectetur deleniti. Et impedit aut culpa voluptas et qui. Ipsa nostrum minus ducimus.', 112, 5, 5, 0, 360400, 1, 'Begueboeuf', '91, chemin de Ollivier\n52905 Jourdandan', '18936', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(181, 'et ab quis', 'Quos corrupti consequatur atque omnis voluptas ratione. Vitae aperiam laboriosam dolorem qui. Aliquid eligendi eius eum sequi.', 272, 6, 2, 2, 337341, 1, 'Levy', '918, rue Etienne\n87 250 Mercier', '85 797', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(182, 'animi iusto repellat', 'Optio sapiente id voluptatem. Fugit fugiat aperiam facilis itaque. Qui quia voluptatem tempora tempore beatae recusandae.', 258, 4, 3, 7, 999261, 1, 'David', 'rue Zacharie Legendre\n94821 Mahedan', '26 354', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(183, 'tenetur quod fuga', 'Aut sequi numquam qui beatae sint aut temporibus. Fuga provident aut rerum culpa voluptas. Et eveniet officiis ab repellat.', 284, 8, 4, 4, 359757, 1, 'Remy', '32, rue René Martin\n93216 Julien', '96 073', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(184, 'consequatur eos dolore', 'Voluptatem est dolore a officia dolores. Repudiandae vel beatae est accusantium. Sunt facere quae culpa quo cupiditate labore.', 166, 10, 6, 9, 337069, 0, 'Giraud', '16, place de Boutin\n63 800 Garnier', '44 005', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(185, 'et voluptatum aut', 'Rerum quos harum inventore odio. Et voluptatem sit dolorem dolore et saepe laudantium. Voluptates magni illum laudantium quasi adipisci non soluta.', 39, 3, 1, 2, 526099, 0, 'Lesage', 'impasse Jacques\n60716 Bousquet', '31348', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(186, 'molestiae esse eos', 'Officiis harum neque deleniti voluptates. Magnam ex impedit maiores sed optio. Ipsum nesciunt harum aut reiciendis ut.', 51, 2, 8, 2, 577120, 1, 'MoulinVille', 'rue Brigitte Maury\n48075 Lesage-sur-Olivier', '74 268', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(187, 'est magnam sed', 'Aliquam quos sapiente suscipit molestias consequatur atque. Cumque ipsam voluptas et repellat dolorem. Possimus eum vel est blanditiis debitis.', 332, 2, 3, 7, 306742, 1, 'Leleu', '654, rue Ribeiro\n11 820 Bouvet', '82243', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(188, 'vel maiores rem', 'Consequatur vel molestiae eligendi rerum consequatur. Non nesciunt quo eos ipsum repellat. Ut molestias non non esse culpa illo.', 312, 2, 3, 15, 454041, 1, 'Poulain', '79, chemin de Pereira\n92 105 RodriguezVille', '20479', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(189, 'animi saepe qui', 'Quibusdam consequatur ducimus eos illum. Libero occaecati quasi impedit consequuntur sit nihil. Nihil architecto quae ut molestiae et nihil molestiae.', 134, 4, 8, 7, 281089, 1, 'Jolydan', '2, rue de Pascal\n34 213 Vallet', '46892', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(190, 'molestiae expedita culpa', 'Enim facere voluptas rerum. Temporibus et ut omnis. Quo et autem ut porro.', 72, 2, 8, 11, 232398, 0, 'Guilbert-sur-Mer', '52, boulevard Martin Gosselin\n94 728 Carre-sur-Coste', '63765', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(191, 'cum in nihil', 'Enim quos ex et error minus inventore voluptatem architecto. Possimus et ea numquam atque. Aperiam eveniet voluptatem sint velit aut.', 155, 8, 7, 14, 446615, 0, 'Bazin', '7, boulevard Madeleine Maillot\n33 961 Mendes', '41 217', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(192, 'odit cumque doloribus', 'Reiciendis et cumque voluptate similique et. Corrupti eum tempore magnam expedita aut consequatur ex itaque. Pariatur nulla corporis ut sapiente voluptas.', 127, 4, 2, 0, 747129, 0, 'Letellier-sur-Duval', '59, place de Dupuy\n09647 Muller', '30 368', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(193, 'quos quod consequatur', 'Cupiditate maxime molestiae officiis sint et ab. Quis nihil veniam nihil autem reprehenderit odit. Nesciunt laudantium saepe qui aperiam cumque.', 127, 4, 7, 0, 369673, 1, 'Albert-sur-Julien', '49, boulevard de Dijoux\n33 487 Dupuyboeuf', '19 868', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(194, 'inventore rerum omnis', 'Est sequi illum occaecati rerum fugiat neque sed. A accusamus inventore ratione. Sit aut qui repudiandae accusamus.', 162, 10, 8, 10, 149583, 0, 'Perrot', '29, impasse de Chauveau\n73944 Guichard', '91 947', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(195, 'eveniet aspernatur ut', 'Quo illum pariatur ipsum tenetur voluptas. Velit culpa itaque nisi incidunt minima doloribus. Dolorem autem explicabo consectetur dicta error nihil ducimus.', 195, 10, 5, 4, 222211, 1, 'Chauvet', '420, rue René Renard\n06 223 Caron', '23396', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(196, 'nobis illo omnis', 'Beatae voluptas nobis doloribus animi. Beatae ea maiores maxime autem voluptas. Voluptas eos aperiam explicabo voluptatem suscipit.', 96, 5, 6, 3, 910487, 1, 'Paris-sur-Mer', '57, boulevard Édouard Samson\n81031 Marin-sur-Roux', '39186', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(197, 'officia aut et', 'Quia est nostrum laudantium et odio. Repellat ducimus animi quia. Non atque incidunt nobis rerum aliquam.', 84, 6, 7, 6, 669367, 0, 'Jourdan-sur-Albert', 'avenue Leroy\n60 271 Salmon-sur-Barbier', '34 023', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(198, 'voluptate consectetur illo', 'Adipisci quasi qui natus quasi omnis similique. Voluptas et voluptatem aut in quibusdam beatae laudantium. Ab optio voluptatum fugiat aliquam temporibus magnam.', 287, 7, 8, 9, 778712, 1, 'DialloBourg', '81, place Cécile Lombard\n50566 PichonBourg', '50 000', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(199, 'provident maiores sit', 'Asperiores iusto ipsum maiores voluptatem dolores. Non tenetur alias omnis ab. Voluptates et ducimus aut sunt necessitatibus doloribus perferendis.', 206, 10, 2, 14, 210623, 1, 'Dupuy', '26, chemin Marine Dumas\n25 452 Potier', '76600', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(200, 'assumenda repudiandae porro', 'Temporibus doloribus praesentium autem necessitatibus dolor repudiandae id porro. Quo nam ut suscipit quia et itaque. Illo et beatae aut rem.', 221, 8, 1, 14, 337541, 1, 'Marin', '8, chemin Thérèse Pascal\n69 601 David-les-Bains', '87 231', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(201, 'ad modi repudiandae', 'Quod voluptate sit magnam omnis sit aut expedita. Dolorem inventore minus harum officiis possimus qui molestias. Incidunt totam et fuga enim quis sed.', 257, 4, 4, 2, 165068, 1, 'Lambert', '332, place Corinne Lacroix\n27 901 Delannoydan', '99397', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(202, 'sapiente blanditiis beatae', 'Et ab laborum quos beatae temporibus. Sed illo qui aut quis. Nisi assumenda id perferendis.', 49, 7, 3, 7, 218949, 1, 'Maillard', '53, impasse Reynaud\n82 558 LedouxBourg', '90 986', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(203, 'a eum animi', 'Vitae repellendus cumque sed maiores. At pariatur rerum repellat soluta nihil. Totam iure pariatur rerum totam autem aut temporibus.', 270, 3, 5, 2, 583991, 0, 'Dubois', '80, rue de Dijoux\n39860 Perrot', '42 828', 0, '2020-06-19 13:55:59', '', '0000-00-00 00:00:00'),
	(204, 'Palais des lacs', '4444', 400, 4, 4, 4, 444444, 0, 'Montagne des Koalas', 'Zone des lacs Koala', '44444', 0, '2020-06-23 09:34:36', '', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `property` ENABLE KEYS */;

-- Listage de la structure de la table agency. property_option
DROP TABLE IF EXISTS `property_option`;
CREATE TABLE IF NOT EXISTS `property_option` (
  `property_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`property_id`,`option_id`),
  KEY `IDX_24F16FCC549213EC` (`property_id`),
  KEY `IDX_24F16FCCA7C41D6F` (`option_id`),
  CONSTRAINT `FK_24F16FCC549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_24F16FCCA7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `option` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table agency.property_option : ~6 rows (environ)
DELETE FROM `property_option`;
/*!40000 ALTER TABLE `property_option` DISABLE KEYS */;
INSERT INTO `property_option` (`property_id`, `option_id`) VALUES
	(105, 1),
	(105, 2),
	(105, 3),
	(109, 1),
	(204, 1),
	(204, 2),
	(204, 3);
/*!40000 ALTER TABLE `property_option` ENABLE KEYS */;

-- Listage de la structure de la table agency. user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table agency.user : ~1 rows (environ)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`) VALUES
	(6, 'demo', '$2y$12$57DTUSC7ZrIKxl7C.n29D.xlrBaUhbVuYh5pd/O64RHfnW..bcuYC');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
