-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.18-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for sewa-mobil
DROP DATABASE IF EXISTS `sewa-mobil`;
CREATE DATABASE IF NOT EXISTS `sewa-mobil` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `sewa-mobil`;

-- Dumping structure for table sewa-mobil.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa-mobil.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table sewa-mobil.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa-mobil.migrations: ~6 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_12_06_091539_create_tukangsewas_table', 1),
	(6, '2023_12_21_171720_penyewa', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table sewa-mobil.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa-mobil.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table sewa-mobil.penyewa
DROP TABLE IF EXISTS `penyewa`;
CREATE TABLE IF NOT EXISTS `penyewa` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `kodemobil` int(11) NOT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `total_hari` int(11) NOT NULL,
  `sewaperhari` int(11) NOT NULL,
  `totalbayar` int(11) NOT NULL,
  `status` enum('Pengajuan','Disewakan','Tolak','Pengembalian','Selesai') COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa-mobil.penyewa: ~2 rows (approximately)
/*!40000 ALTER TABLE `penyewa` DISABLE KEYS */;
INSERT INTO `penyewa` (`id`, `user_id`, `kodemobil`, `tanggal_mulai`, `tanggal_kembali`, `total_hari`, `sewaperhari`, `totalbayar`, `status`, `note`) VALUES
	(17, 12, 10001, '2024-05-13', '2024-05-14', 2, 1000000, 2000000, 'Selesai', 'selesai'),
	(18, 12, 10002, '2024-05-24', '2024-05-25', 2, 200000, 400000, 'Pengembalian', 'sip');
/*!40000 ALTER TABLE `penyewa` ENABLE KEYS */;

-- Dumping structure for table sewa-mobil.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa-mobil.personal_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table sewa-mobil.tukangsewa
DROP TABLE IF EXISTS `tukangsewa`;
CREATE TABLE IF NOT EXISTS `tukangsewa` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kodemobil` int(11) NOT NULL,
  `merekmobil` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modelmobil` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomerplat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarif` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Tersedia','Tersewa','Perawatan') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tukangsewa_kodemobil_unique` (`kodemobil`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa-mobil.tukangsewa: ~3 rows (approximately)
/*!40000 ALTER TABLE `tukangsewa` DISABLE KEYS */;
INSERT INTO `tukangsewa` (`id`, `kodemobil`, `merekmobil`, `modelmobil`, `nomerplat`, `tarif`, `status`) VALUES
	(1, 10001, 'Pajero Sport', 'Sport', 'AA123BB', '1000000', 'Tersedia'),
	(5, 10002, 'Honda Brio', 'Honda', 'AA4789RR', '200000', 'Tersedia'),
	(6, 10003, 'Xenia', 'Honda', 'AA4788RR', '100000', 'Perawatan');
/*!40000 ALTER TABLE `tukangsewa` ENABLE KEYS */;

-- Dumping structure for table sewa-mobil.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('tukangsewa','penyewa') COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomer_tlp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomer_sim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_nomer_tlp_unique` (`nomer_tlp`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa-mobil.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `alamat`, `nomer_tlp`, `nomer_sim`, `remember_token`, `created_at`, `updated_at`) VALUES
	(11, 'mas Tukang sewa', 'Tukang-sewa1@gmail.com', NULL, '$2y$10$dStSPJ.vj.C7hSl7fYQftuSZoCATlmR1f7OJ/rDr4uXct8F6zL5lK', 'tukangsewa', 'pejagoan Kebumen', '082111222333', '87654321', NULL, '2024-05-11 04:57:17', '2024-05-11 04:57:17'),
	(12, 'mas penyewa', 'penyewa1@gmail.com', NULL, '$2y$10$RhhxnWY2ee8ulQU/QGQwzu.dr96UcUg/FarWQ91lV0j0Uz/JfApRm', 'penyewa', 'sempor Kebumen', '081333444555', '56781234', NULL, '2024-05-11 04:57:17', '2024-05-11 04:57:17');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
