-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2021 at 06:18 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `speakup`
--

-- --------------------------------------------------------

--
-- Table structure for table `appusers`
--

CREATE TABLE `appusers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Verified','Not verified') COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appusers`
--

INSERT INTO `appusers` (`id`, `username`, `name`, `email`, `phone_number`, `address`, `password`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 'rj', 'Radge Joseph San Joaquin', 'rj@gmail.com', '09234124365', 'Dinaga Canaman Camarines Sur', '$2y$10$VgbNiSuzPMGj.lGPqciFT.Zw76XQV.rf6bWAVck6IHXLklBv2G/.y', 'Not verified', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commendations`
--

CREATE TABLE `commendations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `narrative` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle` enum('jeep','tricycle','taxicle','taxi') COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','solved') COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_plate` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `body_plate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `narrative` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle` enum('jeep','tricycle','taxicle','taxi') COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','solved') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_10_03_045006_create_appusers_table', 1),
(4, '2019_10_23_094719_create_complaints_table', 1),
(5, '2019_10_23_211127_create_commendations_table', 1),
(6, '2020_08_04_141047_create_reviews_table', 1),
(7, '2020_10_19_145827_create_puvs_table', 1),
(8, '2020_10_20_151210_create_operators_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `operators`
--

CREATE TABLE `operators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `puvs`
--

CREATE TABLE `puvs` (
  `vehicle` enum('jeep','tricycle','taxicle','taxi') COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_plate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Certified','Colorum') COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `puvs`
--

INSERT INTO `puvs` (`vehicle`, `body_plate`, `status`, `operator_id`, `admin_id`, `name`, `address`, `phone_number`, `created_at`, `updated_at`) VALUES
('taxi', '1003', 'Certified', 166, 914, 'Prof. Danial Harris MD', '819 Hansen Motorway Suite 798\nDedrickfort, MA 97626', '(425) 981-9129 x437', '2020-10-20 19:45:22', '2020-10-20 19:45:22'),
('tricycle', '3634', 'Colorum', 647, 787, 'Coy Bernier', '837 Effie Key Suite 625\nLeoniefurt, VT 98391-4934', '828-572-8042', '2020-10-20 19:45:22', '2020-10-20 19:45:22'),
('tricycle', '663', 'Certified', 239, 474, 'Elta Bartoletti', '124 Conn Row\nLake Norvalburgh, HI 93508-2277', '(629) 454-3167', '2020-10-20 19:45:22', '2020-10-20 19:45:22'),
('taxi', '6180', 'Colorum', 135, 447, 'Orland Hudson', '56840 Grimes Manors Suite 439\nNorth Tyshawn, MS 66003', '+1-541-256-7464', '2020-10-20 19:45:22', '2020-10-20 19:45:22'),
('taxi', '8002', 'Colorum', 626, 325, 'Casimer Howe', '2593 Thiel Valley\nPort Lenna, IN 61145', '+1 (657) 523-1596', '2020-10-20 19:45:22', '2020-10-20 19:45:22'),
('tricycle', '938', 'Colorum', 549, 615, 'Prof. Skye Jakubowski Sr.', '651 Penelope Crossroad Suite 300\nNorth Kay, MT 76244-6118', '234-535-3639', '2020-10-20 19:45:22', '2020-10-20 19:45:22'),
('taxi', '9155', 'Colorum', 361, 614, 'Prof. Dennis Jenkins MD', '40132 Jast Groves Suite 560\nEast Rebecaburgh, ME 92648-3684', '934-512-5039 x665', '2020-10-20 19:45:22', '2020-10-20 19:45:22'),
('jeep', '2005', 'Certified', 301, 973, 'Amalia Rodriguez V', '7445 Parker Plains Apt. 379\nEast Lizeth, OK 39222-7405', '+1-650-931-1130', '2020-10-20 19:45:22', '2020-10-20 19:45:22'),
('taxicle', '5962', 'Colorum', 778, 572, 'Sonia Boehm', '34948 Schmidt Haven Apt. 747\nNew Lukasstad, VT 57795', '910-503-4540 x9750', '2020-10-20 19:45:22', '2020-10-20 19:45:22'),
('tricycle', '1650', 'Colorum', 870, 259, 'Pietro Strosin', '1942 Benton Mountains Suite 931\nNew Arleneshire, DC 74542', '(795) 680-0632 x7510', '2020-10-20 19:45:22', '2020-10-20 19:45:22'),
('taxi', '9954', 'Certified', 445, 500, 'Antonio Bechtelar', '170 Kuphal Ridge\nDestanyhaven, NE 14118-2908', '(278) 949-4656', '2020-10-20 19:45:23', '2020-10-20 19:45:23'),
('jeep', '2318', 'Certified', 311, 941, 'Jayde Legros', '157 Skyla Estate Suite 701\nWest Christophe, AK 19008-9054', '+1-772-538-9831', '2020-10-20 19:45:23', '2020-10-20 19:45:23'),
('jeep', '7564', 'Colorum', 929, 859, 'Cicero Abernathy', '177 Andrew Gateway\nHellerfurt, NH 74258-3423', '815-412-3390 x46088', '2020-10-20 19:45:23', '2020-10-20 19:45:23'),
('taxi', '3658', 'Colorum', 490, 307, 'Prof. Chester Monahan MD', '97456 Charlie Village\nNorth Guadalupeton, MT 60625', '928-469-2374 x1538', '2020-10-20 19:45:23', '2020-10-20 19:45:23'),
('taxi', '9647', 'Certified', 165, 471, 'Mrs. Bernadette Kutch', '971 Benedict Mills\nSouth Kay, WI 04395', '680-564-4112', '2020-10-20 19:45:23', '2020-10-20 19:45:23'),
('taxi', '6495', 'Certified', 612, 889, 'Nicola Bosco', '256 Rodriguez Valleys\nWisokyfort, WA 79451-4527', '+1-574-605-3444', '2020-10-20 19:45:23', '2020-10-20 19:45:23'),
('tricycle', '3248', 'Certified', 523, 854, 'Avery Purdy', '4524 Jamie Ridges\nHilpertborough, LA 86296', '568.821.2259', '2020-10-20 19:45:23', '2020-10-20 19:45:23'),
('taxi', '1501', 'Certified', 462, 524, 'Andy Bradtke II', '4649 Urban Mountain\nNew Sophie, NC 76888', '+1-904-480-1724', '2020-10-20 19:45:23', '2020-10-20 19:45:23'),
('tricycle', '6529', 'Certified', 774, 357, 'Mrs. Mafalda Kihn', '1139 Wisozk Dale Apt. 739\nNew Jordyn, AL 98211', '410-995-6097 x800', '2020-10-20 19:45:23', '2020-10-20 19:45:23'),
('taxicle', '1060', 'Colorum', 995, 49, 'Ressie Satterfield', '68407 Hermann Roads\nNorth Nathanfurt, UT 08248', '273-919-0603 x2503', '2020-10-20 19:45:23', '2020-10-20 19:45:23'),
('taxi', '8376', 'Colorum', 994, 122, 'Mr. Conor McLaughlin Sr.', '32453 Trantow Village\nEast Johnniemouth, NV 10932-4316', '(809) 316-6377 x06652', '2020-10-20 19:45:23', '2020-10-20 19:45:23'),
('tricycle', '6353', 'Certified', 953, 662, 'Virgie Lockman', '313 Funk Cliff\nOkunevachester, IA 65701', '(350) 718-0972 x3480', '2020-10-20 19:45:23', '2020-10-20 19:45:23'),
('jeep', '5696', 'Certified', 966, 93, 'Raymond Mann', '80607 Marvin Unions\nPeytontown, TN 74748-3058', '913.671.7636', '2020-10-20 19:45:23', '2020-10-20 19:45:23'),
('jeep', '9478', 'Certified', 444, 345, 'Timmothy Reichert', '9291 Josie Estates\nGeraldineberg, OH 00229-9870', '407-749-3901', '2020-10-20 19:45:23', '2020-10-20 19:45:23'),
('tricycle', '3014', 'Colorum', 848, 676, 'Una Rau', '50851 Herzog Cape\nNorth Darwintown, SC 47493', '+1-419-817-2789', '2020-10-20 19:45:23', '2020-10-20 19:45:23'),
('taxicle', '4460', 'Colorum', 651, 389, 'Chad Gutmann', '84971 Maci Roads Apt. 819\nWest Kiley, MI 16377', '1-976-698-3571', '2020-10-20 19:45:24', '2020-10-20 19:45:24'),
('taxicle', '9200', 'Certified', 746, 583, 'Miss Lavinia Pagac', '605 Giovanny Haven\nChristberg, CT 43356-6253', '+1-339-598-9824', '2020-10-20 19:45:24', '2020-10-20 19:45:24'),
('taxicle', '4693', 'Colorum', 449, 52, 'Mr. Kyler Hoppe', '971 Raynor Neck Apt. 157\nNew Irmafort, AL 55716-4288', '354.412.3009', '2020-10-20 19:45:24', '2020-10-20 19:45:24'),
('jeep', '5782', 'Colorum', 499, 305, 'Justen Heathcote', '86508 Sipes Roads\nNorth Marilyne, ND 18889', '(317) 786-0575', '2020-10-20 19:45:24', '2020-10-20 19:45:24'),
('jeep', '3454', 'Colorum', 356, 619, 'Granville Haley', '3797 Witting Plaza\nNorth Rosinafort, TN 08438-3859', '408.556.0364 x41668', '2020-10-20 19:45:24', '2020-10-20 19:45:24'),
('jeep', '7156', 'Colorum', 540, 276, 'Mrs. Jada Muller', '5784 Wisozk Fall Apt. 420\nJaskolskimouth, KS 03856-5856', '625-726-1726 x30631', '2020-10-20 19:45:24', '2020-10-20 19:45:24'),
('tricycle', '6135', 'Certified', 284, 408, 'Ms. Haylie Carter Sr.', '497 Hyatt Dam Suite 141\nNorth Nikkobury, TX 24890', '+1-246-513-9872', '2020-10-20 19:45:24', '2020-10-20 19:45:24'),
('taxicle', '3845', 'Colorum', 179, 630, 'Mr. Jacey Gusikowski', '822 Harry Skyway\nLake Americo, NM 83141', '+1-972-710-9098', '2020-10-20 19:45:24', '2020-10-20 19:45:24'),
('jeep', '8340', 'Certified', 279, 270, 'Dr. Tyler Lueilwitz', '623 Leuschke Well\nWest Thora, NH 21808-2489', '+1-698-449-6508', '2020-10-20 19:45:24', '2020-10-20 19:45:24'),
('taxicle', '3593', 'Certified', 138, 963, 'Charles Nader', '7670 Stiedemann Pine\nEmilioberg, MD 05030-3554', '+1 (792) 395-3833', '2020-10-20 19:45:24', '2020-10-20 19:45:24'),
('taxicle', '7038', 'Certified', 363, 567, 'Liana Greenfelder', '9306 Grace Village\nElinoreshire, OH 63467-1894', '(524) 424-9315 x2676', '2020-10-20 19:45:24', '2020-10-20 19:45:24'),
('taxicle', '6528', 'Certified', 552, 146, 'Santa Padberg', '945 Hegmann Mill\nSouth Joanyport, NC 58234-8663', '439-716-8351', '2020-10-20 19:45:24', '2020-10-20 19:45:24'),
('jeep', '8063', 'Certified', 505, 360, 'Amelia Mills', '546 Freda Island Apt. 190\nWest Ericstad, CO 16467', '(505) 382-5899 x91200', '2020-10-20 19:45:24', '2020-10-20 19:45:24'),
('jeep', '1033', 'Certified', 372, 990, 'Drake Schroeder I', '22493 Goodwin Meadows\nSouth Conor, AR 96453-6634', '423.476.9053', '2020-10-20 19:45:24', '2020-10-20 19:45:24'),
('jeep', '4183', 'Certified', 495, 861, 'Dr. Bernadette Spencer I', '38019 Brakus Road\nWest Murl, MS 97198', '1-541-515-2679 x36619', '2020-10-20 19:45:24', '2020-10-20 19:45:24'),
('taxi', '3763', 'Certified', 36, 649, 'Mr. Doris Ward III', '987 Bradtke Fort Suite 817\nJacobifurt, NV 34712', '382.639.8930 x61254', '2020-10-20 19:45:25', '2020-10-20 19:45:25'),
('jeep', '3688', 'Certified', 457, 781, 'Olga Abshire MD', '66929 Peter Lane Apt. 249\nNorth Izabellaland, NC 19961', '971-816-8235', '2020-10-20 19:45:25', '2020-10-20 19:45:25'),
('taxi', '4712', 'Colorum', 730, 44, 'Dorris Larkin', '2658 Coleman Creek\nSouth Dejah, AR 95208', '1-501-696-2804 x90221', '2020-10-20 19:45:25', '2020-10-20 19:45:25'),
('jeep', '1923', 'Certified', 899, 696, 'Raquel Barton', '2928 Tillman Mountain Suite 045\nLelabury, KY 25595-6820', '872-670-4634 x2697', '2020-10-20 19:45:25', '2020-10-20 19:45:25'),
('taxicle', '2876', 'Certified', 756, 597, 'Prof. Juvenal Mohr DVM', '15199 Schumm Plaza Suite 923\nBaronborough, IL 89529-8722', '+1.883.914.0380', '2020-10-20 19:45:25', '2020-10-20 19:45:25'),
('taxi', '2809', 'Colorum', 75, 844, 'Dayana Schmeler', '149 Hahn Cliffs Suite 517\nMorissettebury, OK 34207-6711', '(847) 976-2468', '2020-10-20 19:45:25', '2020-10-20 19:45:25'),
('taxi', '9783', 'Colorum', 408, 790, 'Tiana Russel', '80639 Swift Landing Suite 186\nLake Adeliachester, DE 20008', '1-227-664-0688 x61051', '2020-10-20 19:45:25', '2020-10-20 19:45:25'),
('jeep', '6652', 'Certified', 124, 639, 'Dr. Henri Blick Jr.', '57550 Miller Causeway Suite 773\nNorth Cecilia, OK 95291-6661', '792-904-1327 x33793', '2020-10-20 19:45:25', '2020-10-20 19:45:25'),
('taxicle', '9476', 'Colorum', 309, 587, 'Elyssa Douglas', '3632 Stracke Drive Suite 089\nNew Brandychester, AL 57239', '640-323-9840', '2020-10-20 19:45:25', '2020-10-20 19:45:25'),
('tricycle', '6175', 'Certified', 718, 802, 'Elian Witting', '494 Roberts Summit\nNew Magali, MD 56584-2010', '974.819.3943 x676', '2020-10-20 19:45:25', '2020-10-20 19:45:25'),
('taxi', '1304', 'Certified', 915, 85, 'Annabelle Lang', '9258 Ardith Mews\nPort Kendrachester, NH 78581-4976', '587.803.2194 x579', '2020-10-20 19:45:25', '2020-10-20 19:45:25'),
('taxicle', '5329', 'Certified', 435, 319, 'Prof. Johnpaul Corkery', '87566 Rowe Lodge\nAbeland, RI 17788', '1-205-524-3940 x402', '2020-10-20 19:45:25', '2020-10-20 19:45:25'),
('jeep', '6376', 'Colorum', 561, 107, 'Itzel Wolff', '77033 Berniece Harbors Apt. 796\nWest Malinda, NY 46413-4392', '1-623-943-6636 x693', '2020-10-20 19:45:25', '2020-10-20 19:45:25'),
('tricycle', '5330', 'Colorum', 305, 629, 'Kavon Donnelly', '7898 Lehner Lakes\nWest Damion, OR 23726-1220', '1-351-520-4441', '2020-10-20 19:45:25', '2020-10-20 19:45:25'),
('taxi', '9300', 'Colorum', 292, 399, 'Leland Erdman', '37248 Shana Common Suite 323\nHagenesville, NE 56861-1284', '+1-774-686-3407', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('taxicle', '5200', 'Colorum', 484, 572, 'Lilliana Jacobson', '11807 Lucie Stravenue Suite 532\nRennerberg, NM 60691', '+12127276822', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('tricycle', '8190', 'Certified', 330, 479, 'Johanna Boyle', '55596 Ratke Cliff\nFerrychester, OR 04875', '883-290-7842 x71217', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('tricycle', '4564', 'Colorum', 219, 828, 'Trevor Armstrong', '9213 White Place Suite 981\nLednerfort, AL 57267', '+1.580.995.8686', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('taxi', '8385', 'Certified', 21, 548, 'Prof. Katrina Donnelly', '58007 Murphy Flat\nSouth Reidmouth, DE 85155', '823-826-8007 x97871', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('taxicle', '8981', 'Certified', 128, 4, 'Lula Anderson', '93395 Ratke Square Apt. 007\nNorth Kenny, VT 78517-9096', '254-995-9910', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('tricycle', '905', 'Certified', 649, 940, 'Anais Cormier', '2856 Antonetta Flats Suite 735\nWilkinsonhaven, OK 91757-4454', '610-441-1155 x651', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('taxicle', '8017', 'Colorum', 660, 237, 'Mr. Cleve Cole I', '5728 Breana Junctions Apt. 036\nPort Jovaniville, AK 36172-3384', '438-951-0381 x598', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('tricycle', '7365', 'Colorum', 852, 619, 'Prof. Saige Roberts DDS', '25558 Russel Drive Apt. 678\nBartolettibury, MS 43858', '240-639-2101 x1060', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('jeep', '1670', 'Certified', 654, 627, 'Trace Becker', '25409 Volkman Springs Suite 584\nPort Landenport, NJ 30475', '1-880-885-1695', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('taxi', '6434', 'Colorum', 423, 56, 'Bethel Turner', '55414 Easton Garden\nHowellview, NC 14969', '1-965-647-1068 x71916', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('tricycle', '9396', 'Colorum', 390, 316, 'Jaylan Senger', '954 Garfield Passage Suite 563\nMaggiobury, AR 36021-1149', '325-486-2467', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('jeep', '323', 'Colorum', 80, 3, 'Michele Schmidt', '3387 Donnelly Radial Apt. 988\nNew Sidhaven, CO 44495', '(754) 517-0453', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('taxicle', '2779', 'Certified', 589, 21, 'Ms. Lauretta Schroeder DVM', '5101 Rozella Fords Suite 114\nSouth Tyra, KS 10693', '264-613-3651 x40341', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('taxicle', '9062', 'Certified', 696, 551, 'Jennings Witting', '50680 Wisozk Forges\nNorth Kale, MT 10589', '+1.584.927.6312', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('taxi', '8220', 'Certified', 502, 386, 'Clemmie O\'Connell', '494 Icie Hill Apt. 315\nEast Abbyfort, NE 79990', '589-813-1814 x3091', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('jeep', '9722', 'Colorum', 703, 955, 'Prof. Emmy Stracke Jr.', '918 Bobby River Apt. 329\nSouth Fatimamouth, TN 41218', '+1.928.226.0300', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('jeep', '5575', 'Certified', 735, 465, 'Barrett Shanahan', '1474 Marianne Stravenue\nNew Abagail, MI 57853', '1-323-755-5986', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('jeep', '7472', 'Colorum', 478, 717, 'Abner McKenzie', '748 Clemmie Fields Suite 003\nEberthaven, MD 36062', '832-254-5794', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('taxi', '3599', 'Certified', 852, 29, 'Mr. Noe Koch DDS', '8994 Tevin Forge\nConsidinehaven, KY 06948-3797', '(803) 392-0450 x905', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('tricycle', '6371', 'Certified', 485, 638, 'Lennie Ullrich Jr.', '8717 Karlie Courts Apt. 410\nGulgowskimouth, ND 77304', '+1-762-327-9838', '2020-10-20 19:45:26', '2020-10-20 19:45:26'),
('taxicle', '6279', 'Colorum', 188, 857, 'Amber Stiedemann Sr.', '68119 Boyle Plains\nPort Lucius, WA 38000-7773', '1-949-376-4686 x52342', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('taxicle', '8043', 'Certified', 559, 997, 'Prof. Russel Klocko', '842 Jonas Stream Apt. 959\nLake Germaine, IN 18855-8929', '+1-353-366-3652', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('taxi', '7926', 'Colorum', 57, 96, 'Samanta Kassulke', '4583 Muller Coves\nTorphyfurt, MO 28901-7300', '459-583-5912', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('taxicle', '192', 'Certified', 950, 292, 'Deven Stokes', '852 Quinten Valley Apt. 966\nLake Xander, MD 51215-9320', '671-725-5013 x575', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('tricycle', '8298', 'Colorum', 964, 356, 'Kaley Mann', '749 Akeem Via Suite 786\nNew Kaylahaven, LA 78340-3343', '(707) 834-7478 x0335', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('tricycle', '9251', 'Colorum', 600, 399, 'Jaime Johnson', '436 Brakus Islands\nLake Wernermouth, CT 76366-9833', '435-615-1998', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('taxi', '4074', 'Colorum', 178, 505, 'Dr. Travis Zemlak DDS', '25866 Phoebe Spring\nMaggioville, SC 91792', '(240) 697-9604', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('jeep', '5697', 'Colorum', 845, 388, 'Dr. Willow Smitham', '6338 Hill Lakes\nSouth Kaci, VT 45901', '808-550-0225 x227', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('jeep', '1194', 'Certified', 893, 555, 'Palma Gleichner', '88971 Abby Station\nLake Shannon, MD 09936-4390', '(221) 508-2306', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('tricycle', '6787', 'Colorum', 35, 846, 'Albin Harber', '6114 Jonathan Cliffs\nEast Melynamouth, ID 19473', '(909) 232-3722', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('taxi', '8531', 'Certified', 78, 633, 'Ethyl Weimann', '101 Stroman Motorway\nSouth Curtis, OH 13498', '429.599.6423', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('taxicle', '2208', 'Colorum', 367, 715, 'Britney Boyle', '68193 Branson Common Apt. 861\nPort Julio, OH 89668', '1-640-937-3277 x96742', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('jeep', '9999', 'Certified', 420, 838, 'Janick Zboncak', '788 Iva Junction\nNorth Manuelaport, RI 78298-1951', '(450) 345-8546', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('taxi', '2605', 'Colorum', 261, 924, 'Raymond Dare', '820 Vickie Crossroad\nGoldnerfurt, WA 90167', '+1-294-889-7143', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('taxi', '2939', 'Certified', 295, 82, 'Dannie Bartell', '311 Shirley Passage Suite 707\nJackieland, CT 77519-0065', '(804) 519-5544', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('jeep', '6879', 'Colorum', 57, 324, 'Dr. Ella Robel DVM', '744 Zulauf Road Apt. 211\nJoshuatown, MN 89721', '257-378-2182 x673', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('taxicle', '1203', 'Certified', 135, 980, 'Thad Boyer', '468 Theresia Greens\nHandside, VT 14638', '730.785.5575', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('taxi', '8151', 'Certified', 438, 355, 'Mr. Jeramie Shanahan', '2359 Wayne Fort\nSouth Martin, NH 45158', '1-253-737-7284', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('jeep', '5516', 'Certified', 594, 517, 'Orlando Senger', '61827 Hilma Extension\nKundeport, NY 22458', '227.736.6440', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('taxi', '6816', 'Colorum', 333, 174, 'Anthony Padberg', '27634 Johnston Fields Suite 932\nNew Raquel, IL 15269-4776', '(834) 808-7858', '2020-10-20 19:45:27', '2020-10-20 19:45:27'),
('taxicle', '5774', 'Colorum', 519, 792, 'Sigurd West Jr.', '246 Jaydon Isle Apt. 345\nPort Charlie, FL 30117-5172', '1-289-618-6602', '2020-10-20 19:45:28', '2020-10-20 19:45:28'),
('tricycle', '921', 'Colorum', 461, 293, 'Marty Kuhic', '72689 Granville Place\nElouisebury, SD 52696-4631', '1-554-895-6205 x70089', '2020-10-20 19:45:28', '2020-10-20 19:45:28'),
('taxi', '1616', 'Colorum', 914, 50, 'Prof. Abby Hane', '986 Boris Shoal Suite 934\nEast Magnus, NM 21099', '1-837-804-6737 x66762', '2020-10-20 19:45:28', '2020-10-20 19:45:28'),
('taxicle', '9263', 'Certified', 580, 373, 'Valentina Krajcik', '2995 Sanford Parks\nLiamberg, MN 47512-6249', '1-697-580-3989', '2020-10-20 19:45:28', '2020-10-20 19:45:28'),
('taxi', '7935', 'Certified', 336, 981, 'Noah Powlowski', '656 Antoinette Gardens\nWest Katelynnland, TX 42556-1579', '1-265-918-1889', '2020-10-20 19:45:28', '2020-10-20 19:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `narrative` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ratings` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `vehicle` enum('jeep','tricycle','taxicle','taxi') COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_plate` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `narrative`, `ratings`, `flags`, `created_at`, `updated_at`, `user_id`, `vehicle`, `body_plate`) VALUES
(1, 'yes na yes', '3', '', NULL, NULL, 1, 'jeep', 2005);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `role`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'nihil', 'Admin', 'admin@demo.com', '2020-10-20 19:45:22', '$2y$10$7fWbp0O885PaldAv22xmyOP42T8mn8plSgXb.E3TL3UO.hzX9IPx.', 'LKsdGvaNIf', '2020-10-20 19:45:22', '2020-10-20 19:45:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appusers`
--
ALTER TABLE `appusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commendations`
--
ALTER TABLE `commendations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operators`
--
ALTER TABLE `operators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appusers`
--
ALTER TABLE `appusers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `commendations`
--
ALTER TABLE `commendations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `operators`
--
ALTER TABLE `operators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
