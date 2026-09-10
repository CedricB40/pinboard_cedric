-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 10 sep. 2026 à 12:52
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pinboard_cedric_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20260910074019', '2026-09-10 07:43:46', 36),
('DoctrineMigrations\\Version20260910081256', '2026-09-10 08:17:35', 49),
('DoctrineMigrations\\Version20260910082623', '2026-09-10 08:28:29', 48),
('DoctrineMigrations\\Version20260910091739', '2026-09-10 09:19:35', 71);

-- --------------------------------------------------------

--
-- Structure de la table `pins`
--

DROP TABLE IF EXISTS `pins`;
CREATE TABLE IF NOT EXISTS `pins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext,
  `image_name` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3F0FE980A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `pins`
--

INSERT INTO `pins` (`id`, `title`, `description`, `image_name`, `created_at`, `updated_at`, `user_id`) VALUES
(6, 'Sorbet à la fraise', 'Quand il fait chaud dehors et que les enfants réclament quelque chose de sucré, ce sorbet est la solution idéale. Sans sucre, facile à préparer et avec le parfum fruité du thé glacé à la fraise, il est tout simplement irrésistible.\n\n \n\nIngrédients (pour 4 portions)\n\n500 ml de thé glacé intense à la fraise (double quantité infusion)\n300 g de fraises fraîches\n2 cuillères à soupe de jus de citron\nMenthe fraîche pour la garniture\nPréparation\n\nPréparez un thé glacé à la fraise bien concentré : utilisez le double de la quantité indiquée sur infusion et laissez infuser pendant 1 heure.\nLavez les fraises, équeutez-les et coupez-les en gros morceaux.\nMixer finement les fraises, le thé glacé et le jus de citron dans un mixeur.\nVerser la préparation dans un bac à glace plat et mettre au congélateur pendant environ 4 heures.\nRemuez toutes les 45 minutes à l\'aide d\'une fourchette : cela rendra le sorbet bien onctueux.\nDisposer dans des bols et garnir de menthe fraîche.', 'capture-d-ecran-2026-09-10-140216-6aa29c644786c055608448.png', '2026-09-10 12:02:44', '2026-09-10 12:02:44', 7),
(7, 'Sorbet aux citron', 'Préparation\nPréparer le sirop de sucre : mettre 200 g de sucre dans un verre doseur gradué et ajouter de l\'eau jusqu\'au trait \"Liquide 1/2 l\". Faire chauffer 4 à 5 min jusqu\'à ce que tout le sucre se dissolve. Laisser refroidir\nPresser les 3 citrons dans un bol pour en extraire le jus et râper le zeste d\'un des citrons. Mélanger le jus des citrons et le zeste avec le sirop de sucre\nMettre en sorbetière\nAjouter le blanc d\'œuf monté en neige ferme dans la sorbetière à la fin (= quand le sorbet commence à prendre)', 'capture-d-ecran-2026-09-10-140408-6aa29d109a4fa503910592.png', '2026-09-10 12:05:36', '2026-09-10 12:05:36', 7),
(8, 'Sorbet à la goyave', 'Difficulté facile\n Temps de Préparation	25 minutes\n Temps de Cuisson	10 minutes\n Temps d\'Attente	40 minutes (Temps de tournage à la sorbetière)\n Portions	\n1\n litre de sorbet\nIngrédients\n1 kilos de goyaves coupées en morceaux Info\n350 ml d’eau\n300 g de sucre blanc\nsorbetière traditionnelle Acheter\nDe la glace (mettre des bouteilles à congeler la veille)\nDu gros sel (0.5 kilo devrait suffire) Acheter', 'capture-d-ecran-2026-09-10-140621-6aa29d6700480581640400.png', '2026-09-10 12:07:02', '2026-09-10 12:07:03', 7),
(9, 'Sorbet à la framboise', 'Préparation\nTemps total : 10 min\nPréparation :\n10 min\nRepos :\n-\nCuisson :\n-\nétape 1\nframboises\nPasser environ 1 min les framboises au micro-ondes (afin qu\'elles se mélangent facilement dans le blender).\n\nétape 2\nElles seront encore un peu surgelées ce qui est normal et il faut qu\'elles le soient.\n\nétape 3\nframboises\nPasser tous les ingrédients au mixeur blender, arrêter régulièrement le blender afin de tasser les framboises pour aider le mixeur a bien tout mélanger.\n\nétape 4\nUne fois le mélange bien homogène, le mettre dans un récipient et au congélateur jusqu’à obtention de la consistance souhaitée.\n\nAnonyme\nNote de l\'auteur :\n« Vous obtenez un sorbet onctueux et riche en fruit ! Un délice avec les beaux jours qui arrivent... Ou tout simplement pour assouvir une envie gourmande de fruits! Vous pouvez le faire également avec tous les fruits en sirop du supermarché! »', 'capture-d-ecran-2026-09-10-140906-6aa29dec4eab0437203107.png', '2026-09-10 12:09:16', '2026-09-10 12:09:16', 7),
(10, 'Gateau aux chocolats', 'Préparation\nTemps total : 40 min\nPréparation :\n10 min\nRepos :\n-\nCuisson :\n30 min\nétape 1\nbeurre\nchocolat pâtissier\nPréchauffez votre four à 180°C (thermostat 6). Dans une casserole, faites fondre le chocolat et le beurre coupé en morceaux à feu très doux.\n\nétape 2\nfarine\noeuf\nsucre en poudre\nDans un saladier, ajoutez le sucre, les oeufs, la farine. Mélangez.\n\nétape 3\nbeurre\nchocolat pâtissier\nAjoutez le mélange chocolat/beurre. Mélangez bien.\n\nétape 4\nbeurre\nfarine\nBeurrez à l\'aide d\'une feuille de papier essuie-tout et farinez votre moule puis y versez la pâte à gâteau.\n\nétape 5\nFaites cuire au four environ 20 minutes.\n\nétape 6\nA la sortie du four le gâteau ne paraît pas assez cuit. C\'est normal, laissez-le refroidir puis démoulez- le.', 'capture-d-ecran-2026-09-10-141301-6aa29f13b105c534671885.png', '2026-09-10 12:14:11', '2026-09-10 12:14:11', 6),
(11, 'Gateau au yaourt', 'Préparation\nTemps total : 35 min\nPréparation :\n5 min\nRepos :\n-\nCuisson :\n30 min\nétape 1\nsucre vanillé\nyaourt nature\nMettre dans cet ordre un pot de yaourt nature, la farine, le sucre, le sucre vanillé et mélanger.\n\nétape 2\noeuf\nRajouter les 3 oeufs, mélanger.\n\nétape 3\nlevure\nMettre l\'huile, mélanger et ajouter le sachet de levure.\n\nétape 4\nMélanger encore, la pâte doit être lisse.\n\nétape 5\nBeurrer un moule à manqué et y verser la pâte.\n\nétape 6\nMettre au four 30 min à 180°C (thermostat 6), en surveillant régulièrement.', 'capture-d-ecran-2026-09-10-141610-6aa29f94b9b14065260659.png', '2026-09-10 12:16:20', '2026-09-10 12:16:20', 6),
(12, 'Gateau aux fruits', 'Préparation\nTemps total : 1h10\nPréparation :\n20 min\nRepos :\n-\nCuisson :\n50 min\nétape 1\nPréchauffer le four à Th 5 .\n\nétape 2\nBien égoutter les fruits dans une passoire.\n\nétape 3\nbeurre tendre\nsucre\nBattre le sucre et le beurre mou, jusqu\'à obtenir un mélange bien homogène.\n\nétape 4\noeuf\nAjouter les oeufs un par un en fouettant.\n\nétape 5\nfarine\nlevure\nAjouter la farine et la levure, bien mélanger pour éviter les grumeaux.\n\nétape 6\ncitron\nfarine\nPrélever un zeste de citron, l\'ajouter aux fruits, et saupoudrer d\'un peu de farine, bien mélanger : cela évitera aux fruits de retomber dans le fond du moule pendant la cuisson.\n\nétape 7\nAjouter les fruits à la pâte.\n\nétape 8\nVerser dans un moule beurré et fariné, à cake de préférence.\n\nétape 9\nEnfourner et cuire 50 mn : c\'est cuit lorsque le gâteau est gonflé et doré, et qu\'une pointe de couteau plongée au coeur ressort sèche.\n\nétape 10\nLaisser tiédir avant de démouler.\n\nétape 11\nSé régaler !', 'capture-d-ecran-2026-09-10-141853-6aa2a06ad2123200564717.png', '2026-09-10 12:19:54', '2026-09-10 12:19:54', 6),
(13, 'Gateau à la banane', 'Préparation\nTemps total\n45 mn\nPréparation\n10 mn\nCuisson\n35 mn\n1\nPréparation des bananes écrasées\nÉcraser les bananes avec une fourchette dans une assiette et les laisser de côté.\n2\nPréparation de la pâte\nBien mélanger les œufs avec le sucre.\n3Rajouter la farine, le beurre, la levure et le sucre vanillé.\n4\nAjout des bananes\nIncorporer la purée de bananes à la préparation.\nCuisson au four\nMettre au four pendant 35 minutes sur (thermostat 3-4).', 'capture-d-ecran-2026-09-10-142122-6aa2a0c7b8cbf351137512.png', '2026-09-10 12:21:27', '2026-09-10 12:21:27', 6),
(14, 'Crêpes', 'Préparation\n1 :\nPréparation de la pâte\nDans un saladier, mélangez la farine, le sel et le sucre en poudre. Creusez ensuite un puits pour y casser les œufs. Mélangez en effectuant des cercles du centre vers l’extérieur. Versez ensuite le lait petit à petit, puis ajoutez le sucre vanillé. Laissez reposer 30 min.\n\n2 :\nCuisson des crêpes\nAvec un coton, badigeonnez d’huile le fond de votre crêpière et faites-la chauffer à feu vif. Une fois bien chaude, versez-y une louche de pâte et laissez cuire 3 min de chaque côté. Procédez ainsi jusqu’à épuisement de la pâte.\n\n3 :\nConservation des crêpes\nEmpilez les crêpes sur une assiette, en les recouvrant éventuellement d’un torchon propre pour les conserver au chaud !', 'capture-d-ecran-2026-09-10-142345-6aa2a15bb9c20399059593.png', '2026-09-10 12:23:55', '2026-09-10 12:23:55', 5),
(15, 'Coockies', 'Procédé\nPréchauffer le four à 190 degrés celsius\nDans un bol, mélanger la farine, le sel et bicarbonate\n1 c. à café de sel,1 c. à café de bicarbonate,308 g de farine de blé\nDans un autre bol, battre (idéalement au mixer) le beurre, les sucres et l’extrait de vanille jusqu’à crémeux. Battre ensuite dedans les œufs 1 par 1.\n227 g de beurre doux ramolli,150 g de sucre en poudre,150 g de sucre roux,2 Œufs,1 c. à café d\'extrait de vanille\nBattre dedans graduellement le mélange avec la farine.\nMélanger les pépites\n200 g de pépites ou morceaux de chocolat\nFormer des boules sur du papier sulfurisé\nLes mettre au frigo durant 15 à 30 min (vous pouvez aussi décider de juste conserver la pâte à cookies au frais au préalable et du coup, sautez cette étape)\nMettre à cuire 9 à 11 minutes\nQuand vous les sortez, laissez reposer 5-10 minutes', 'capture-d-ecran-2026-09-10-142439-6aa2a1b85bba6445735027.png', '2026-09-10 12:25:28', '2026-09-10 12:25:28', 5),
(16, 'Tiramisu', 'Préparation\nTemps total : 15 min\nPréparation :\n15 min\nRepos :\n-\nCuisson :\n-\nétape 1\noeuf\nSéparer les blancs des jaunes d\'oeufs.\n\nétape 2\nsucre roux\nMélanger les jaunes avec le sucre roux et le sucre vanillé.\n\nétape 3\nmascarpone\nAjouter le mascarpone au fouet.\n\nétape 4\nMonter les blancs en neige et les incorporer délicatement à la spatule au mélange précédent. Réserver.\n\nétape 5\nbiscuits à la cuillère\ncafé\nMouiller les biscuits dans le café rapidement avant d\'en tapisser le fond du plat.\n\nétape 6\nbiscuits à la cuillère\nmascarpone\nRecouvrir d\'une couche de crème au mascarpone puis répéter l\'opération en alternant couche de biscuits et couche de crème en terminant par cette dernière.\n\nétape 7\ncacao amer\nSaupoudrer de cacao.\n\nétape 8\nMettre au réfrigérateur 4 heures minimum puis déguster frais.', 'capture-d-ecran-2026-09-10-142716-6aa2a22dbc442790029920.png', '2026-09-10 12:27:25', '2026-09-10 12:27:25', 5),
(17, 'Tiramisu aux fraises', 'pour Tiramisu aux fraises\nPréparation : 30 min\nRepos : 2 h\n1. Mélanger les jaunes d’oeufs et le sucre jusqu’à ce qu’ils blanchissent.\n2. Ajouter le mascarpone à la préparation et mélanger jusqu’à ce que cela soit homogène.\n3. Battre les blancs en neige ferme et les incorporer au mélange.\n4. Mixer 100 g de fraises pour faire un coulis, ajouter le rhum et un peu d’eau si la préparation est épaisse.\n5. Faire tremper rapidement les biscuits dans le coulis de fraise, et les disposer sur le plat, verser un tiers de la crème dessus, puis des morceaux de fraises (lavées et équeutées), puis à nouveau des biscuits trempés, terminer par de la crème.\n6. Mettre au frais au moins 2 heures.', 'capture-d-ecran-2026-09-10-142858-6aa2a293562e8932092300.png', '2026-09-10 12:29:07', '2026-09-10 12:29:07', 5);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `image_name` varchar(500) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(180) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roles` json NOT NULL,
  `is_verified` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `image_name`, `created_at`, `updated_at`, `email`, `password`, `roles`, `is_verified`) VALUES
(5, 'Sophie', 'Lambert', NULL, '2026-09-10 11:51:32', '2026-09-10 11:51:52', 'sophie.lambert@test.com', '$2y$13$WIRmcxPFXjwG6hslBCO3rOyBaf.O88z1GWo9TTgMeUMz3uKUlIHN6', '[]', 1),
(6, 'Marc', 'Dubois', NULL, '2026-09-10 11:53:59', '2026-09-10 11:54:38', 'marc.dubois@test.com', '$2y$13$YwTWcOrvILSOfev4pTJLd.SyWM0adPqI86DuTYPDvTCWkZa0RSZ52', '[]', 1),
(7, 'Julie', 'Petit', NULL, '2026-09-10 11:55:53', '2026-09-10 11:56:47', 'julie.petit@test.com', '$2y$13$1KUWvL1.h55D7lgRelEFk.Svgu.m/XHfdSBtFYS5RtsIw3tqxYeuy', '[]', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `pins`
--
ALTER TABLE `pins`
  ADD CONSTRAINT `FK_3F0FE980A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
