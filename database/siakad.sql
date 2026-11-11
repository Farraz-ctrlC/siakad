-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for siakad
CREATE DATABASE IF NOT EXISTS `siakad` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `siakad`;

-- Dumping structure for table siakad.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.cache: ~0 rows (approximately)

-- Dumping structure for table siakad.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.cache_locks: ~0 rows (approximately)

-- Dumping structure for table siakad.dosen
DROP TABLE IF EXISTS `dosen`;
CREATE TABLE IF NOT EXISTS `dosen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nidn` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `jabatan_fungsional` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dosen_nidn_unique` (`nidn`),
  UNIQUE KEY `dosen_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.dosen: ~10 rows (approximately)
INSERT INTO `dosen` (`id`, `nidn`, `nama`, `email`, `telepon`, `alamat`, `jabatan_fungsional`, `created_at`, `updated_at`) VALUES
	(1, '0042569690', 'Sadina Hardiansyah, S.T., M.T.', 'hastuti.drajat@example.org', '087930308099', 'Psr. B.Agam Dlm No. 954, Cilegon 77128, Sulsel', NULL, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(2, '0022709157', 'Iriana Halimah, S.Si., M.Cs.', 'dpermata@example.org', '089182804711', 'Psr. Lembong No. 909, Administrasi Jakarta Timur 86854, Bali', NULL, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(3, '0017531408', 'Tasnim Iswahyudi, S.Kom., M.Kom.', 'rahimah.makuta@example.com', '085325121469', 'Gg. Juanda No. 629, Lubuklinggau 14032, Sulteng', NULL, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(4, '0068082527', 'Wawan Mustofa, S.Kom., M.Kom.', 'usyi21@example.com', '085243148295', 'Psr. Jaksa No. 559, Lhokseumawe 33371, DIY', NULL, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(5, '0076399356', 'Novi Nurdiyanti, S.T., M.T.', 'laswi38@example.com', '085548175606', 'Gg. Banal No. 658, Lhokseumawe 11754, Sumbar', NULL, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(6, '0046754032', 'Ifa Latupono, S.Si., M.Cs.', 'iwidiastuti@example.net', '084667317978', 'Ds. Gading No. 316, Padangsidempuan 98735, Pabar', NULL, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(7, '0080310780', 'Cakrajiya Mansur, S.Kom., M.Eng.', 'latika23@example.org', '088265065478', 'Ki. Nakula No. 802, Tasikmalaya 60465, Sumsel', NULL, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(8, '0025530056', 'Restu Hardiansyah, S.Kom., M.Kom.', 'haryanti.ayu@example.org', '087344493222', 'Kpg. Batako No. 882, Padangsidempuan 89882, DIY', NULL, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(9, '0002252670', 'Ulya Widodo, S.Si., M.Cs.', 'nashiruddin.karimah@example.org', '089155498822', 'Kpg. Warga No. 578, Banjar 95669, Sumsel', NULL, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(10, '0042627328', 'Caket Suryono, S.Si., M.Cs.', 'daryani.putra@example.com', '081255858151', 'Jr. Panjaitan No. 494, Jambi 54198, NTT', NULL, '2026-10-26 14:29:18', '2026-10-26 14:29:18');

-- Dumping structure for table siakad.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table siakad.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.jobs: ~0 rows (approximately)

-- Dumping structure for table siakad.job_batches
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.job_batches: ~0 rows (approximately)

-- Dumping structure for table siakad.krs
DROP TABLE IF EXISTS `krs`;
CREATE TABLE IF NOT EXISTS `krs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mahasiswa_id` bigint unsigned NOT NULL,
  `tahun_akademik` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` enum('Ganjil','Genap') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('draft','diajukan','disetujui','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `krs_mahasiswa_id_tahun_akademik_semester_unique` (`mahasiswa_id`,`tahun_akademik`,`semester`),
  CONSTRAINT `krs_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.krs: ~10 rows (approximately)
INSERT INTO `krs` (`id`, `mahasiswa_id`, `tahun_akademik`, `semester`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, '2026/2027', 'Ganjil', 'draft', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(2, 2, '2026/2027', 'Ganjil', 'draft', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(3, 3, '2026/2027', 'Ganjil', 'draft', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(4, 4, '2026/2027', 'Ganjil', 'draft', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(5, 5, '2026/2027', 'Ganjil', 'draft', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(6, 6, '2026/2027', 'Ganjil', 'draft', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(7, 7, '2026/2027', 'Ganjil', 'draft', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(8, 8, '2026/2027', 'Ganjil', 'draft', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(9, 9, '2026/2027', 'Ganjil', 'draft', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(10, 10, '2026/2027', 'Ganjil', 'draft', '2026-10-26 14:29:18', '2026-10-26 14:29:18');

-- Dumping structure for table siakad.krs_detail
DROP TABLE IF EXISTS `krs_detail`;
CREATE TABLE IF NOT EXISTS `krs_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `krs_id` bigint unsigned NOT NULL,
  `mata_kuliah_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `krs_detail_krs_id_mata_kuliah_id_unique` (`krs_id`,`mata_kuliah_id`),
  KEY `krs_detail_mata_kuliah_id_foreign` (`mata_kuliah_id`),
  CONSTRAINT `krs_detail_krs_id_foreign` FOREIGN KEY (`krs_id`) REFERENCES `krs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `krs_detail_mata_kuliah_id_foreign` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.krs_detail: ~50 rows (approximately)
INSERT INTO `krs_detail` (`id`, `krs_id`, `mata_kuliah_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 4, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(2, 1, 1, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(3, 1, 7, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(4, 1, 3, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(5, 1, 9, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(6, 2, 2, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(7, 2, 3, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(8, 2, 1, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(9, 2, 4, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(10, 2, 5, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(11, 3, 4, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(12, 3, 10, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(13, 3, 5, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(14, 3, 1, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(15, 3, 7, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(16, 4, 5, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(17, 4, 4, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(18, 4, 2, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(19, 4, 9, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(20, 4, 6, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(21, 5, 5, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(22, 5, 4, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(23, 5, 2, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(24, 5, 3, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(25, 5, 9, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(26, 6, 3, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(27, 6, 7, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(28, 6, 9, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(29, 6, 4, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(30, 6, 5, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(31, 7, 6, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(32, 7, 4, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(33, 7, 10, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(34, 7, 8, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(35, 7, 7, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(36, 8, 9, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(37, 8, 6, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(38, 8, 8, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(39, 8, 7, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(40, 8, 4, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(41, 9, 4, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(42, 9, 7, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(43, 9, 5, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(44, 9, 10, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(45, 9, 8, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(46, 10, 1, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(47, 10, 7, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(48, 10, 8, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(49, 10, 4, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(50, 10, 6, '2026-10-26 14:29:18', '2026-10-26 14:29:18');

-- Dumping structure for table siakad.mahasiswa
DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `angkatan` smallint unsigned NOT NULL,
  `program_studi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D3 Teknik Informatika',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mahasiswa_nim_unique` (`nim`),
  UNIQUE KEY `mahasiswa_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.mahasiswa: ~50 rows (approximately)
INSERT INTO `mahasiswa` (`id`, `nim`, `nama`, `jenis_kelamin`, `email`, `angkatan`, `program_studi`, `created_at`, `updated_at`) VALUES
	(1, '2303039560', 'Nasab Haryanto', 'L', '2303039560@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(2, '2303037661', 'Puput Anggraini', 'P', '2303037661@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(3, '2503034004', 'Ellis Susanti', 'P', '2503034004@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(4, '2203034834', 'Yance Suwarno', 'P', '2203034834@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(5, '2503033518', 'Karsana Nashiruddin', 'L', '2503033518@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(6, '2203034369', 'Nadia Lailasari', 'P', '2203034369@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(7, '2303034850', 'Kemal Firmansyah', 'L', '2303034850@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(8, '2403034790', 'Cornelia Halimah', 'P', '2403034790@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(9, '2203033186', 'Ivan Prasetya', 'L', '2203033186@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(10, '2203035819', 'Raisa Wibisono', 'P', '2203035819@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(11, '2303037350', 'Yuliana Sitompul', 'P', '2303037350@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(12, '2303036653', 'Anggabaya Rajata', 'L', '2303036653@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(13, '2203039492', 'Karya Habibi', 'L', '2203039492@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(14, '2203030779', 'Iriana Hasanah', 'P', '2203030779@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(15, '2403032545', 'Zulfa Siregar', 'P', '2403032545@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(16, '2303039610', 'Lili Kusmawati', 'P', '2303039610@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(17, '2503034608', 'Putri Usada', 'P', '2503034608@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(18, '2403039923', 'Ida Sihombing', 'P', '2403039923@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(19, '2203034794', 'Karja Lailasari', 'L', '2203034794@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(20, '2203033427', 'Irfan Fujiati', 'L', '2203033427@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(21, '2503039340', 'Ella Hutasoit', 'P', '2503039340@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(22, '2303034020', 'Gasti Susanti', 'P', '2303034020@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(23, '2303033586', 'Sarah Suryatmi', 'P', '2303033586@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(24, '2303034537', 'Victoria Handayani', 'P', '2303034537@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(25, '2403039089', 'Lalita Halim', 'P', '2403039089@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(26, '2303032862', 'Garan Maryati', 'L', '2303032862@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(27, '2303034717', 'Diah Situmorang', 'P', '2303034717@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(28, '2203030057', 'Prima Wacana', 'L', '2203030057@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(29, '2503035703', 'Aslijan Pratiwi', 'L', '2503035703@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(30, '2403034390', 'Aswani Wasita', 'L', '2403034390@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(31, '2403032675', 'Eka Simbolon', 'P', '2403032675@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(32, '2503031672', 'Lembah Nashiruddin', 'L', '2503031672@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(33, '2503034781', 'Sidiq Wahyudin', 'L', '2503034781@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(34, '2203030753', 'Rafi Nugroho', 'L', '2203030753@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(35, '2203037078', 'Yuni Padmasari', 'P', '2203037078@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(36, '2303037662', 'Kenari Hartati', 'L', '2303037662@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(37, '2303037956', 'Dagel Nababan', 'L', '2303037956@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(38, '2303037337', 'Jelita Zulkarnain', 'P', '2303037337@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(39, '2403031891', 'Lalita Hartati', 'P', '2403031891@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(40, '2403031100', 'Clara Puspasari', 'P', '2403031100@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(41, '2203035391', 'Farah Samosir', 'P', '2203035391@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(42, '2503030231', 'Bagiya Zulaika', 'L', '2503030231@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(43, '2403032181', 'Nurul Siregar', 'P', '2403032181@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(44, '2303034021', 'Arsipatra Susanti', 'L', '2303034021@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(45, '2403033023', 'Danang Zulkarnain', 'L', '2403033023@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(46, '2503031038', 'Keisha Mayasari', 'P', '2503031038@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(47, '2403036359', 'Ratna Fujiati', 'P', '2403036359@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(48, '2403037110', 'Jamal Saputra', 'L', '2403037110@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(49, '2203034918', 'Yessi Maulana', 'P', '2203034918@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(50, '2203032018', 'Farah Kuswandari', 'P', '2203032018@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 14:29:18', '2026-10-26 14:29:18');

-- Dumping structure for table siakad.mata_kuliah
DROP TABLE IF EXISTS `mata_kuliah`;
CREATE TABLE IF NOT EXISTS `mata_kuliah` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_mk` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_mk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` tinyint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mata_kuliah_kode_mk_unique` (`kode_mk`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.mata_kuliah: ~10 rows (approximately)
INSERT INTO `mata_kuliah` (`id`, `kode_mk`, `nama_mk`, `sks`, `created_at`, `updated_at`) VALUES
	(1, 'TI101', 'Pengantar Teknologi Informasi', 2, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(2, 'TI102', 'Algoritma dan Pemrograman', 3, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(3, 'TI103', 'Matematika Diskrit', 3, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(4, 'TI201', 'Basis Data', 3, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(5, 'TI202', 'Desain Web', 3, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(6, 'TI203', 'Pemrograman Web', 3, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(7, 'TI204', 'Jaringan Komputer', 3, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(8, 'TI301', 'Rekayasa Perangkat Lunak', 3, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(9, 'TI302', 'Pemrograman Berorientasi Objek', 3, '2026-10-26 14:29:18', '2026-10-26 14:29:18'),
	(10, 'TI303', 'Sistem Operasi', 2, '2026-10-26 14:29:18', '2026-10-26 14:29:18');

-- Dumping structure for table siakad.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2026_10_20_110253_create_dosen_table', 1),
	(5, '2026_10_20_110258_create_mahasiswa_table', 1),
	(6, '2026_10_20_110304_create_mata_kuliah_table', 1),
	(7, '2026_10_20_112017_create_krs_table', 1),
	(8, '2026_10_20_112024_create_krs_detail_table', 1),
	(9, '2026_10_26_210717_add_jabatan_fungsional_to_dosen_table', 1),
	(10, '2026_10_29_232808_add_last_login_at_to_users_table', 2);

-- Dumping structure for table siakad.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table siakad.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.sessions: ~1 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('Wlu55cQL7MxRxRFKL9q5gGeFwtEBM27uQOqYkccm', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiYW5oaWhjRWowQk9MWllaZ1Z5Y1RObnE1dnZYbzJQeExkZVNSSm02TSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjtzOjU6InJvdXRlIjtzOjk6ImRhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6IjAzNDNjMzBkNWI4OTBmODM2MzE2YjcxNDNhYTVkOTVjZDIyMzVmMTcxNTI5YWVlYTU0NDFjOTcwYTU5ZjM5MmUiO30=', 1794313449);

-- Dumping structure for table siakad.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','dosen','mahasiswa') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mahasiswa',
  `last_login_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.users: ~3 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `last_login_at`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator SIAKAD', 'admin@siakad.test', NULL, '$2y$12$xjGEmeEzFALjj822Q27nvOqXt9XoSHaQoMVblpj9Vmg/TKxF7JMS6', 'admin', '2026-11-10 12:18:33', NULL, '2026-10-26 14:29:18', '2026-11-10 12:18:33'),
	(2, 'Dosen Uji', 'dosen@siakad.test', NULL, '$2y$12$hyB6DDe7ZKkmCJOxanvkkueTDbnlkKj/DEEWC1f7bppjUsEGWDuWC', 'dosen', '2026-11-05 09:11:02', NULL, '2026-10-26 14:29:18', '2026-11-05 09:11:02'),
	(3, 'Mahasiswa Uji', 'mahasiswa@siakad.test', NULL, '$2y$12$TjelVlF6dxVQgE1koqZ0BeFmVNur2umVBZ5han8EFoD5Zx8rGQmv6', 'mahasiswa', '2026-11-05 09:08:07', NULL, '2026-10-26 14:29:18', '2026-11-05 09:08:07');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
