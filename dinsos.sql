-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 13, 2024 at 08:50 AM
-- Server version: 8.0.30
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dinsos`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int NOT NULL,
  `id_user` int NOT NULL,
  `id_kategori` int NOT NULL,
  `slug_berita` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `judul_berita` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ringkasan` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status_berita` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis_berita` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keywords` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gambar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hits` int NOT NULL,
  `tanggal_post` datetime NOT NULL,
  `tanggal_publish` datetime NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id_client` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `jenis_client` enum('Perorangan','Perusahaan','Organisasi') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pimpinan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alamat` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telepon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `isi_testimoni` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `gambar` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_client` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tempat_lahir` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tanggal_post` datetime NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

CREATE TABLE `download` (
  `id_download` int NOT NULL,
  `id_kategori_download` int NOT NULL,
  `id_user` int NOT NULL,
  `judul_download` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_download` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `gambar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hits` int NOT NULL,
  `tanggal_post` datetime NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `galeri`
--

CREATE TABLE `galeri` (
  `id_galeri` int NOT NULL,
  `id_kategori_galeri` int NOT NULL,
  `id_user` int NOT NULL,
  `judul_galeri` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_galeri` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `gambar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hits` int DEFAULT NULL,
  `status_text` enum('Ya','Tidak','','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_post` datetime DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `galeri`
--

INSERT INTO `galeri` (`id_galeri`, `id_kategori_galeri`, `id_user`, `judul_galeri`, `jenis_galeri`, `isi`, `gambar`, `website`, `hits`, `status_text`, `tanggal_post`, `tanggal`) VALUES
(21, 4, 1, 'KABUPATEN LUWU YANG MAJU, SEJAHTERA DAN MANDIRI DALAM NUANSA RELIGI', 'Homepage', '', 'BUPATI-DAN-WAKIL-BUPATI.jpg', '', NULL, 'Ya', '2023-09-22 16:45:53', '2023-09-22 01:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL,
  `id_user` int NOT NULL,
  `slug_kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `urutan` int DEFAULT NULL,
  `hits` int NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `id_user`, `slug_kategori`, `nama_kategori`, `urutan`, `hits`, `tanggal`) VALUES
(2, 1, 'berita', 'Berita', 2, 101, '2024-03-22 19:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_download`
--

CREATE TABLE `kategori_download` (
  `id_kategori_download` int NOT NULL,
  `id_user` int NOT NULL,
  `slug_kategori_download` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kategori_download` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `urutan` int DEFAULT NULL,
  `hits` int NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_galeri`
--

CREATE TABLE `kategori_galeri` (
  `id_kategori_galeri` int NOT NULL,
  `id_user` int NOT NULL,
  `slug_kategori_galeri` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kategori_galeri` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `urutan` int DEFAULT NULL,
  `hits` int NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kategori_galeri`
--

INSERT INTO `kategori_galeri` (`id_kategori_galeri`, `id_user`, `slug_kategori_galeri`, `nama_kategori_galeri`, `urutan`, `hits`, `tanggal`) VALUES
(4, 0, 'kegiatan', 'Kegiatan', 4, 0, '2021-04-20 16:38:46'),
(5, 0, 'banner-website', 'Banner Website', 4, 0, '2021-04-20 16:38:46'),
(7, 1, 'badik-luwu', 'BADIK LUWU', 1, 0, '2023-09-22 01:16:03');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_staff`
--

CREATE TABLE `kategori_staff` (
  `id_kategori_staff` int NOT NULL,
  `id_user` int NOT NULL,
  `slug_kategori_staff` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kategori_staff` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `urutan` int DEFAULT NULL,
  `hits` int NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kategori_staff`
--

INSERT INTO `kategori_staff` (`id_kategori_staff`, `id_user`, `slug_kategori_staff`, `nama_kategori_staff`, `urutan`, `hits`, `tanggal`) VALUES
(1, 0, 'pejabat-eselon-1', 'Pejabat Eselon 1', 1, 0, '2021-04-20 16:44:24'),
(2, 0, 'pejabat-struktural', 'Pejabat Struktural', 2, 0, '2021-04-20 16:44:24'),
(3, 1, 'team-inti', 'Team Inti', 2, 0, '2021-04-20 17:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi`
--

CREATE TABLE `konfigurasi` (
  `id_konfigurasi` int NOT NULL,
  `id_user` int NOT NULL,
  `namaweb` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `singkatan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tagline` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tentang` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email_cadangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `telepon` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hp` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keywords` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `metatext` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `facebook` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `instagram` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `youtube` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_facebook` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_twitter` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_instagram` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_youtube` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `google_map` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `protocol` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `smtp_host` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `smtp_port` int NOT NULL,
  `smtp_timeout` int NOT NULL,
  `smtp_user` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `smtp_pass` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `konfigurasi`
--

INSERT INTO `konfigurasi` (`id_konfigurasi`, `id_user`, `namaweb`, `singkatan`, `tagline`, `tentang`, `deskripsi`, `website`, `email`, `email_cadangan`, `alamat`, `telepon`, `hp`, `logo`, `icon`, `keywords`, `metatext`, `facebook`, `twitter`, `instagram`, `youtube`, `nama_facebook`, `nama_twitter`, `nama_instagram`, `nama_youtube`, `google_map`, `protocol`, `smtp_host`, `smtp_port`, `smtp_timeout`, `smtp_user`, `smtp_pass`, `tanggal`) VALUES
(1, 1, 'DINSOS KAB. LUWU', 'DINSOS KAB. LUWU', 'DINAS SOSIAL KABUPATEN LUWU', '<p class=\"p1\" style=\"text-align: justify;\">Dinas Sosial disingkat DINSOS adalah lembaga daerah dibidang sosial yang dipimpin oleh seorang kepala badan yang berada dibawah dan bertanggung jawab kepada Bupati Luwu melalui Sekretaris Daerah dan guna meningkatkan keserasian sosial di daerah diperlukan adanya peningkatan keselarasan antar sosial. DINSOS mempunyai tugas mengawal Visi dan Misi Bupati Luwu dalam upaya menjamin&nbsp; laju perkembangan, keseimbangan dan kesinambungan pembangunan daerah diperlukan perencanaan yang menyeluruh, terarah, terpadu, dan berkelanjutan.&nbsp; Manajemen perencanaan diperlukan untuk melakukan koordinasi sosial daerah melalui aspek penguatan kelembagaan.</p>', 'DINAS SOSIAL KABUPATEN LUWU', 'Jalan  Pahlawan', 'dinsos@luwukab.go.id', 'dinsos@luwukab.go.id', '<h5>Pemerintah Daerah Kabupaten Luwu, Dinas Sosial, Jalan Pahlawan, Belopa 91994 </h5>', '+62 813-4223-4700', '+62 813-4223-4700', 'logooo.png', 'kadis Sosial.jpg', '\r\n', '', 'https://www.facebook.com/', 'http://twitter.com/', 'https://instagram.com/', 'https://www.youtube.com', 'Dinas Sosial Kab. Luwu', 'Dinas Sosial Kab. Luwu', 'Dinas Sosial Kab. Luwu', 'Dinas Sosial Kab. Luwu', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d595.8629749453756!2d120.36563166326529!3d-3.3920611461940555!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2d96bac1cfe5ada9%3A0xad8d6e81154de5e3!2sDinas%20Sosial%20Kabupaten%20Luwu!5e0!3m2!1sen!2sid!4v1718193334744!5m2!1sen!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'smtp', 'ssl://mail.websitemu.com', 465, 7, 'contact@websitemu.com', 'muhammad', '2024-06-13 08:38:41');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id_staff` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `id_kategori_staff` int DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telepon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jabatan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keahlian` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `gambar` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_staff` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tempat_lahir` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id_staff`, `id_user`, `id_kategori_staff`, `nama`, `alamat`, `telepon`, `website`, `email`, `jabatan`, `keahlian`, `gambar`, `status_staff`, `tempat_lahir`, `tanggal_lahir`, `tanggal`) VALUES
(9, 1, 3, 'Andoyo Cakep', 'Jl Permata No 1, Halim Perdanakusuma', '0813 8841 0829', 'https://sidatablkbogorkab.com', 'lalu-kekah@bkkbn.go.id', 'Direktur', 'ada', '6.jpg', 'Publish', 'Depok', '1983-02-22', '2021-04-23 17:51:22'),
(10, 1, 3, 'Andoyo Cakep', 'Depok Town Square Lantai 2 Unit SS 5-7\r\nJl. Margonda Raya Kota Depok', '+6285715100485', 'https://javawebmedia.com', 'javawebmedia@gmail.com', 'Graphic Designer', '', '4.jpg', 'Publish', 'Depok', '1983-02-22', '2021-04-23 17:50:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `akses_level` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_rahasia` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `gambar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `tanggal_post` datetime NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama`, `email`, `username`, `password`, `akses_level`, `kode_rahasia`, `gambar`, `keterangan`, `tanggal_post`, `tanggal`) VALUES
(1, 'Pujo Nugroho', 'pujonugroho@gmail.com', 'admin', 'f865b53623b121fd34ee5426c792e5c33af8c227', 'Admin', NULL, '1718260425_d3dc676837af2420f738.jpg', '', '2019-10-12 15:50:21', '2024-06-13 06:49:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `id_user_log` int NOT NULL,
  `id_user` int NOT NULL,
  `ip_address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_updates` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user_logs`
--

INSERT INTO `user_logs` (`id_user_log`, `id_user`, `ip_address`, `username`, `url`, `tanggal_updates`) VALUES
(1, 1, '::1', 'javawebmedia', 'http://localhost/webci4/admin/dasbor', '2021-05-02 17:19:34'),
(2, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 19:08:23'),
(3, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:08:34'),
(4, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:08:41'),
(5, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:11:41'),
(6, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:14:16'),
(7, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:14:19'),
(8, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:17:14'),
(9, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:17:18'),
(10, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-18 19:17:34'),
(11, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 19:17:41'),
(12, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 19:32:02'),
(13, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 19:32:09'),
(14, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-18 19:32:11'),
(15, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-18 19:32:47'),
(16, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-18 19:33:56'),
(17, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:33:59'),
(18, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-18 19:34:02'),
(19, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 19:34:04'),
(20, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 19:34:08'),
(21, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 19:34:10'),
(22, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 19:34:14'),
(23, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-18 19:34:16'),
(24, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-18 19:34:40'),
(25, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-18 19:34:40'),
(26, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-18 19:34:43'),
(27, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 19:37:30'),
(28, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-18 19:37:35'),
(29, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 19:37:44'),
(30, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 19:37:59'),
(31, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 19:45:16'),
(32, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 19:45:16'),
(33, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 19:46:20'),
(34, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 19:47:00'),
(35, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 19:47:00'),
(36, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-18 19:47:45'),
(37, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/edit/5', '2023-06-18 19:47:52'),
(38, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/edit/5', '2023-06-18 19:48:39'),
(39, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-18 19:48:39'),
(40, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 19:50:00'),
(41, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 19:50:02'),
(42, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 19:50:05'),
(43, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 19:52:56'),
(44, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 19:52:56'),
(45, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-18 19:55:58'),
(46, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/delete/13', '2023-06-18 19:56:06'),
(47, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-18 19:56:06'),
(48, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/delete/12', '2023-06-18 19:56:09'),
(49, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-18 19:56:09'),
(50, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/delete/10', '2023-06-18 19:56:13'),
(51, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-18 19:56:13'),
(52, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/delete/9', '2023-06-18 19:56:16'),
(53, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-18 19:56:16'),
(54, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/delete/8', '2023-06-18 19:56:20'),
(55, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-18 19:56:20'),
(56, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/delete/4', '2023-06-18 19:56:23'),
(57, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-18 19:56:23'),
(58, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/delete/7', '2023-06-18 19:56:26'),
(59, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-18 19:56:26'),
(60, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 19:56:50'),
(61, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:57:08'),
(62, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/edit/23', '2023-06-18 19:57:19'),
(63, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/edit/23', '2023-06-18 19:57:47'),
(64, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/jenis_berita/Profil', '2023-06-18 19:57:47'),
(65, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/jenis_berita/Profil', '2023-06-18 19:58:15'),
(66, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/4', '2023-06-18 19:58:19'),
(67, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:58:20'),
(68, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/1', '2023-06-18 19:58:38'),
(69, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:58:38'),
(70, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/24', '2023-06-18 19:58:41'),
(71, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:58:41'),
(72, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/22', '2023-06-18 19:58:45'),
(73, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:58:45'),
(74, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/2', '2023-06-18 19:58:49'),
(75, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:58:49'),
(76, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/3', '2023-06-18 19:58:52'),
(77, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:58:53'),
(78, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/6', '2023-06-18 19:58:56'),
(79, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:58:56'),
(80, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/7', '2023-06-18 19:58:59'),
(81, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:58:59'),
(82, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/21', '2023-06-18 19:59:02'),
(83, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:59:02'),
(84, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 19:59:28'),
(85, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-18 19:59:34'),
(86, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 19:59:48'),
(87, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/icon', '2023-06-18 20:06:41'),
(88, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/icon', '2023-06-18 20:06:48'),
(89, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/icon', '2023-06-18 20:06:48'),
(90, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/icon', '2023-06-18 20:07:09'),
(91, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/icon', '2023-06-18 20:07:09'),
(92, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:11:26'),
(93, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:11:32'),
(94, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:11:32'),
(95, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:14:14'),
(96, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:14:14'),
(97, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:15:46'),
(98, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:15:46'),
(99, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:18:08'),
(100, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:18:08'),
(101, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:18:56'),
(102, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:18:56'),
(103, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:19:45'),
(104, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:19:46'),
(105, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:20:56'),
(106, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:20:57'),
(107, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:22:04'),
(108, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:22:04'),
(109, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:22:33'),
(110, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:22:33'),
(111, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 20:23:40'),
(112, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/staff', '2023-06-18 20:24:33'),
(113, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 20:24:36'),
(114, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 20:24:42'),
(115, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 20:24:45'),
(116, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user', '2023-06-18 20:24:59'),
(117, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user/delete/3', '2023-06-18 20:25:06'),
(118, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user', '2023-06-18 20:25:06'),
(119, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user/delete/2', '2023-06-18 20:25:12'),
(120, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user', '2023-06-18 20:25:12'),
(121, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user/edit/1', '2023-06-18 20:25:14'),
(122, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 20:25:22'),
(123, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-18 20:25:26'),
(124, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/download', '2023-06-18 20:25:30'),
(125, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-18 20:27:08'),
(126, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video/delete/1', '2023-06-18 20:27:13'),
(127, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-18 20:27:13'),
(128, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video/delete/2', '2023-06-18 20:27:16'),
(129, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-18 20:27:16'),
(130, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video/delete/3', '2023-06-18 20:27:19'),
(131, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-18 20:27:19'),
(132, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 20:27:48'),
(133, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 20:28:00'),
(134, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/edit/23', '2023-06-18 20:28:04'),
(135, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 20:28:08'),
(136, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 20:28:10'),
(137, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/23', '2023-06-18 20:28:13'),
(138, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 20:28:13'),
(139, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/panduan', '2023-06-18 20:31:48'),
(140, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/download/unduh/7', '2023-06-18 20:31:54'),
(141, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/download/unduh/7', '2023-06-18 20:31:55'),
(142, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 20:32:19'),
(143, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:32:25'),
(144, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:34:35'),
(145, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 20:34:38'),
(146, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/icon', '2023-06-18 20:34:42'),
(147, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 20:34:44'),
(148, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 20:34:49'),
(149, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 20:34:49'),
(150, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 20:39:56'),
(151, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-18 20:39:57'),
(152, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori', '2023-06-18 20:40:05'),
(153, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori/delete/1', '2023-06-18 20:40:10'),
(154, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori', '2023-06-18 20:40:10'),
(155, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori/delete/3', '2023-06-18 20:40:14'),
(156, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori', '2023-06-18 20:40:14'),
(157, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori/delete/4', '2023-06-18 20:40:17'),
(158, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori', '2023-06-18 20:40:17'),
(159, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori/delete/5', '2023-06-18 20:40:22'),
(160, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori', '2023-06-18 20:40:22'),
(161, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori/delete/6', '2023-06-18 20:40:26'),
(162, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori', '2023-06-18 20:40:26'),
(163, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 20:40:40'),
(164, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-18 20:40:44'),
(165, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-18 20:41:32'),
(166, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/jenis_berita/Berita', '2023-06-18 20:41:32'),
(167, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-18 20:42:00'),
(168, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-18 20:42:41'),
(169, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/jenis_berita/Berita', '2023-06-18 20:42:41'),
(170, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-18 20:43:15'),
(171, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-18 20:43:36'),
(172, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/jenis_berita/Berita', '2023-06-18 20:43:36'),
(173, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-18 20:46:03'),
(174, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-18 20:46:11'),
(175, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-18 20:46:12'),
(176, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-18 20:46:15'),
(177, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 20:47:40'),
(178, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:49:15'),
(179, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:49:41'),
(180, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:49:41'),
(181, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:50:11'),
(182, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:50:11'),
(183, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:50:37'),
(184, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:50:37'),
(185, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:50:59'),
(186, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:50:59'),
(187, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:51:41'),
(188, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:51:41'),
(189, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:51:59'),
(190, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:51:59'),
(191, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 20:58:00'),
(192, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 20:58:04'),
(193, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 20:58:12'),
(194, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 20:58:12'),
(195, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 21:01:22'),
(196, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 21:01:25'),
(197, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 21:01:28'),
(198, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 21:01:33'),
(199, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 21:01:33'),
(200, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 21:06:56'),
(201, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 21:06:56'),
(202, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 21:07:18'),
(203, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 21:10:02'),
(204, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 21:12:17'),
(205, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 22:24:03'),
(206, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 22:25:02'),
(207, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 22:28:08'),
(208, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 22:28:12'),
(209, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 22:28:18'),
(210, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-18 22:28:18'),
(211, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:29:12'),
(212, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:31:20'),
(213, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:31:21'),
(214, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:32:17'),
(215, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:32:18'),
(216, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:32:51'),
(217, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:32:51'),
(218, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:34:12'),
(219, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:34:12'),
(220, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:35:08'),
(221, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:35:08'),
(222, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:35:24'),
(223, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:35:24'),
(224, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:39:10'),
(225, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:39:10'),
(226, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:47:23'),
(227, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 22:47:23'),
(228, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 22:50:09'),
(229, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-18 22:50:13'),
(230, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-18 22:52:40'),
(231, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-18 22:54:07'),
(232, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client/delete/2', '2023-06-18 22:54:12'),
(233, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-18 22:54:12'),
(234, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client/delete/3', '2023-06-18 22:54:15'),
(235, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-18 22:54:15'),
(236, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client/delete/5', '2023-06-18 22:54:18'),
(237, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-18 22:54:18'),
(238, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user', '2023-06-18 22:55:17'),
(239, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-18 22:55:38'),
(240, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-18 22:56:19'),
(241, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-18 22:56:20'),
(242, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video/edit/4', '2023-06-18 22:57:30'),
(243, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video/edit/4', '2023-06-18 22:57:34'),
(244, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-18 22:57:34'),
(245, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-18 22:57:54'),
(246, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-18 23:00:19'),
(247, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-18 23:01:59'),
(248, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video/edit/4', '2023-06-18 23:02:01'),
(249, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video/edit/4', '2023-06-18 23:02:07'),
(250, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-18 23:02:07'),
(251, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-18 23:02:40'),
(252, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-18 23:02:40'),
(253, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-18 23:02:43'),
(254, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 23:04:30'),
(255, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-18 23:08:22'),
(256, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori_staff', '2023-06-18 23:08:25'),
(257, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/panduan', '2023-06-18 23:08:46'),
(258, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-18 23:08:55'),
(259, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 23:09:32'),
(260, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-18 23:12:23'),
(261, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/tambah', '2023-06-18 23:12:35'),
(262, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/download', '2023-06-18 23:14:18'),
(263, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user', '2023-06-18 23:27:37'),
(264, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user/edit/1', '2023-06-18 23:27:46'),
(265, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user/edit/1', '2023-06-18 23:27:52'),
(266, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user', '2023-06-18 23:27:52'),
(267, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:28:08'),
(268, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-18 23:28:11'),
(269, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-18 23:28:46'),
(270, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:28:57'),
(271, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:29:59'),
(272, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:30:44'),
(273, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:30:46'),
(274, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:30:47'),
(275, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:30:48'),
(276, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:30:48'),
(277, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:30:48'),
(278, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:31:16'),
(279, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:31:18'),
(280, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:32:19'),
(281, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:40:50'),
(282, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:40:59'),
(283, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:41:38'),
(284, 1, '::1', 'admin', 'https://localhost/blog/admin/akun', '2023-06-18 23:41:41'),
(285, 1, '::1', 'admin', 'https://localhost/blog/admin/panduan', '2023-06-18 23:41:47'),
(286, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:41:48'),
(287, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:42:00'),
(288, 1, '::1', 'admin', 'https://localhost/blog/admin/user', '2023-06-18 23:42:24'),
(289, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:50:33'),
(290, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 23:51:52'),
(291, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 23:51:57'),
(292, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-18 23:51:57'),
(293, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:52:39'),
(294, 1, '::1', 'admin', 'https://localhost/blog/admin/staff', '2023-06-18 23:53:22'),
(295, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:54:17'),
(296, 1, '::1', 'admin', 'https://localhost/blog/admin/staff', '2023-06-18 23:54:20'),
(297, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:54:22'),
(298, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:54:27'),
(299, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:54:40'),
(300, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-18 23:56:16'),
(301, 1, '::1', 'admin', 'https://localhost/blog/admin/user', '2023-06-18 23:56:19'),
(302, 1, '::1', 'admin', 'https://localhost/blog/admin/user', '2023-06-18 23:57:10'),
(303, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi/seo', '2023-06-18 23:59:35'),
(304, 1, '::1', 'admin', 'https://localhost/blog/admin/user', '2023-06-19 00:03:24'),
(305, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 19:28:01'),
(306, 1, '::1', 'admin', 'https://localhost/blog/admin/client', '2023-06-19 19:28:09'),
(307, 1, '::1', 'admin', 'https://localhost/blog/admin/client', '2023-06-19 19:29:03'),
(308, 1, '::1', 'admin', 'https://localhost/blog/admin/client', '2023-06-19 19:29:03'),
(309, 1, '::1', 'admin', 'https://localhost/blog/admin/client/delete/6', '2023-06-19 19:31:26'),
(310, 1, '::1', 'admin', 'https://localhost/blog/admin/client', '2023-06-19 19:31:26'),
(311, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-19 20:31:20'),
(312, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/tambah', '2023-06-19 20:31:22'),
(313, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/tambah', '2023-06-19 20:31:38'),
(314, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-19 20:31:38'),
(315, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/tambah', '2023-06-19 20:31:58'),
(316, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/tambah', '2023-06-19 20:32:13'),
(317, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-19 20:32:13'),
(318, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/tambah', '2023-06-19 20:32:28'),
(319, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/tambah', '2023-06-19 20:32:35'),
(320, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-19 20:32:35'),
(321, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 21:39:17'),
(322, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 21:39:25'),
(323, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 21:39:36'),
(324, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 21:39:36'),
(325, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 21:40:30'),
(326, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 21:40:30'),
(327, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 21:41:35'),
(328, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 21:41:35'),
(329, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 21:42:17'),
(330, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 21:42:17'),
(331, 1, '::1', 'admin', 'https://localhost/blog/admin/berita', '2023-06-19 21:42:38'),
(332, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/tambah', '2023-06-19 21:42:45'),
(333, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 21:42:52'),
(334, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-19 21:43:09'),
(335, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 23:02:21'),
(336, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 23:02:24'),
(337, 1, '::1', 'admin', 'https://localhost/blog/admin/user', '2023-06-19 23:07:50'),
(338, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 23:32:09'),
(339, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-20 00:10:12'),
(340, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-20 00:10:20'),
(341, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/edit/5', '2023-06-20 00:10:22'),
(342, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/edit/5', '2023-06-20 00:10:28'),
(343, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-20 00:10:28'),
(344, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/edit/5', '2023-06-20 00:10:46'),
(345, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/edit/5', '2023-06-20 00:10:56'),
(346, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/edit/5', '2023-06-20 00:11:06'),
(347, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-20 00:11:06'),
(348, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/tambah', '2023-06-20 00:12:05'),
(349, 1, '::1', 'admin', 'https://localhost/blog/admin/kategori_galeri', '2023-06-20 00:12:11'),
(350, 1, '::1', 'admin', 'https://localhost/blog/admin/kategori_galeri/delete/6', '2023-06-20 00:12:19'),
(351, 1, '::1', 'admin', 'https://localhost/blog/admin/kategori_galeri', '2023-06-20 00:12:19'),
(352, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-20 00:12:23'),
(353, 1, '::1', 'admin', 'https://localhost/blog/admin/berita', '2023-06-20 00:12:26'),
(354, 1, '::1', 'admin', 'https://localhost/blog/admin/download', '2023-06-20 00:12:42'),
(355, 1, '::1', 'admin', 'https://localhost/blog/admin/panduan', '2023-06-20 00:12:47'),
(356, 1, '::1', 'admin', 'https://localhost/blog/admin/panduan', '2023-06-20 00:12:49'),
(357, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi/seo', '2023-06-20 00:12:58'),
(358, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi/seo', '2023-06-20 00:13:06'),
(359, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi/seo', '2023-06-20 00:13:06'),
(360, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi/icon', '2023-06-20 00:13:10'),
(361, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-20 00:13:13'),
(362, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-20 00:13:15'),
(363, 1, '::1', 'admin', 'https://localhost/blog/admin/client', '2023-06-20 00:13:18'),
(364, 1, '::1', 'admin', 'https://localhost/blog/admin/video', '2023-06-20 00:13:24'),
(365, 1, '::1', 'admin', 'https://localhost/blog/admin/video', '2023-06-20 00:13:32'),
(366, 1, '::1', 'admin', 'https://localhost/blog/admin/download', '2023-06-20 00:13:42'),
(367, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-20 00:13:49'),
(368, 1, '::1', 'admin', 'https://localhost/blog/admin/berita', '2023-06-20 00:14:39'),
(369, 1, '::1', 'admin', 'https://localhost/blog/admin/berita', '2023-06-20 00:14:57'),
(370, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/tambah', '2023-06-20 00:14:58'),
(371, 1, '::1', 'admin', 'https://localhost/blog/admin/staff', '2023-06-20 00:16:35'),
(372, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/tambah', '2023-06-20 00:16:39'),
(373, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/tambah', '2023-06-20 00:19:32'),
(374, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/jenis_berita/Profil', '2023-06-20 00:19:32'),
(375, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/edit/28', '2023-06-20 00:21:06'),
(376, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/edit/28', '2023-06-20 00:21:14'),
(377, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/jenis_berita/Profil', '2023-06-20 00:21:14'),
(378, 1, '172.225.180.25', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-21 21:42:43'),
(379, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-21 22:25:46'),
(380, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-21 22:26:12'),
(381, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/28', '2023-09-21 22:26:32'),
(382, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-21 22:26:49'),
(383, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-21 22:27:09'),
(384, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-21 22:27:13'),
(385, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-21 22:27:20'),
(386, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-21 22:27:21'),
(387, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-21 22:27:40'),
(388, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-21 22:28:01'),
(389, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-21 22:28:03'),
(390, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-21 22:29:35'),
(391, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-21 22:29:45'),
(392, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-21 22:33:24'),
(393, 1, '172.225.72.34', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-21 23:13:06'),
(394, 1, '172.225.72.34', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-21 23:13:21'),
(395, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-21 23:13:27'),
(396, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-21 23:13:41'),
(397, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-21 23:13:45'),
(398, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/delete/5', '2023-09-21 23:13:49'),
(399, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-21 23:13:49'),
(400, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/delete/4', '2023-09-21 23:13:52'),
(401, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-21 23:13:53'),
(402, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-21 23:13:56'),
(403, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/user', '2023-09-21 23:13:58'),
(404, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi/logo', '2023-09-21 23:14:01'),
(405, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-21 23:14:06'),
(406, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-21 23:14:17'),
(407, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-21 23:14:17'),
(408, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-21 23:15:33'),
(409, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-21 23:15:33'),
(410, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-21 23:15:53'),
(411, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-21 23:15:53'),
(412, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-21 23:16:28'),
(413, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-21 23:16:33'),
(414, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-21 23:16:51'),
(415, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/user', '2023-09-21 23:16:53'),
(416, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi/logo', '2023-09-21 23:16:56'),
(417, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi/icon', '2023-09-21 23:16:59'),
(418, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi/icon', '2023-09-21 23:17:08'),
(419, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi/icon', '2023-09-21 23:17:11'),
(420, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-21 23:17:13'),
(421, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-21 23:17:20'),
(422, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/28', '2023-09-21 23:17:26'),
(423, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/index3.html', '2023-09-21 23:17:35'),
(424, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 00:06:50'),
(425, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 00:07:54'),
(426, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 00:09:30'),
(427, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 00:09:39'),
(428, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 00:10:16'),
(429, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 00:10:23'),
(430, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 00:14:34'),
(431, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 00:14:34'),
(432, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 00:15:03'),
(433, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 00:15:03'),
(434, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 00:15:23'),
(435, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 00:15:23'),
(436, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download/edit/6', '2023-09-22 00:15:31'),
(437, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download/edit/6', '2023-09-22 00:15:36'),
(438, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 00:15:36'),
(439, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 00:17:21'),
(440, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 00:17:27'),
(441, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/user', '2023-09-22 00:17:32'),
(442, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/user', '2023-09-22 00:17:49'),
(443, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 00:18:04'),
(444, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 00:41:39'),
(445, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 00:41:46'),
(446, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 00:41:48'),
(447, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 00:45:37'),
(448, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Layanan', '2023-09-22 00:45:37'),
(449, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/29', '2023-09-22 00:45:56'),
(450, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/29', '2023-09-22 00:46:02'),
(451, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 00:46:02'),
(452, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/29', '2023-09-22 00:46:41'),
(453, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/29', '2023-09-22 00:47:11'),
(454, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 00:47:12'),
(455, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 00:49:55'),
(456, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 00:50:11'),
(457, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 00:51:51'),
(458, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 00:51:59'),
(459, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 00:52:21'),
(460, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 00:52:33'),
(461, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 00:53:00'),
(462, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 00:53:03'),
(463, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 00:53:19'),
(464, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 00:53:22'),
(465, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 00:53:39'),
(466, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 00:53:39'),
(467, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 00:53:44'),
(468, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 00:53:45'),
(469, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 00:54:52'),
(470, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 00:58:12'),
(471, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 01:02:11'),
(472, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 01:02:11'),
(473, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/1', '2023-09-22 01:02:57'),
(474, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-22 01:03:14'),
(475, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-22 01:03:42'),
(476, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-22 01:05:32'),
(477, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-22 01:07:21'),
(478, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-22 01:07:59'),
(479, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:10:13'),
(480, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:11:24'),
(481, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:11:25'),
(482, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:11:43'),
(483, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:11:43'),
(484, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:12:31'),
(485, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 01:12:43'),
(486, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 01:13:10'),
(487, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:13:10'),
(488, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 01:13:30'),
(489, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 01:13:39'),
(490, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:13:39'),
(491, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 01:13:44'),
(492, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 01:13:50'),
(493, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:13:51'),
(494, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 01:13:56'),
(495, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 01:14:17'),
(496, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:14:18'),
(497, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_galeri', '2023-09-22 01:15:39'),
(498, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_galeri', '2023-09-22 01:16:03');
INSERT INTO `user_logs` (`id_user_log`, `id_user`, `ip_address`, `username`, `url`, `tanggal_updates`) VALUES
(499, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_galeri', '2023-09-22 01:16:03'),
(500, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 01:16:07'),
(501, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 01:16:41'),
(502, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:16:42'),
(503, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 01:16:58'),
(504, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/17', '2023-09-22 01:17:00'),
(505, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:17:00'),
(506, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 01:17:05'),
(507, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 01:17:09'),
(508, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-22 01:17:24'),
(509, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 01:17:28'),
(510, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:17:28'),
(511, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/18', '2023-09-22 01:17:37'),
(512, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-22 01:17:38'),
(513, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/18', '2023-09-22 01:17:40'),
(514, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:17:41'),
(515, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:17:50'),
(516, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/18', '2023-09-22 01:17:50'),
(517, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:17:51'),
(518, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 01:17:53'),
(519, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:18:01'),
(520, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 01:18:16'),
(521, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:18:16'),
(522, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 01:18:21'),
(523, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:18:45'),
(524, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 01:18:50'),
(525, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 01:19:51'),
(526, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:19:51'),
(527, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 01:22:17'),
(528, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 01:22:44'),
(529, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 01:22:48'),
(530, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:22:50'),
(531, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 01:23:20'),
(532, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:23:22'),
(533, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:23:22'),
(534, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:23:31'),
(535, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:23:35'),
(536, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:24:17'),
(537, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/7', '2023-09-22 01:24:23'),
(538, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/7', '2023-09-22 01:24:32'),
(539, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:24:32'),
(540, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/7', '2023-09-22 01:24:40'),
(541, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:24:46'),
(542, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 01:25:43'),
(543, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:27:03'),
(544, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:27:03'),
(545, 1, '172.225.72.21', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 01:27:06'),
(546, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 01:27:19'),
(547, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:27:22'),
(548, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 01:27:27'),
(549, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 01:27:34'),
(550, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 01:27:34'),
(551, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 01:28:11'),
(552, 1, '172.225.72.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:30:33'),
(553, 1, '172.225.72.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 01:30:41'),
(554, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:30:45'),
(555, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:31:29'),
(556, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 01:32:08'),
(557, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:32:17'),
(558, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 01:32:21'),
(559, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:32:26'),
(560, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 01:32:36'),
(561, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 01:33:00'),
(562, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:33:00'),
(563, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_galeri', '2023-09-22 01:33:20'),
(564, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 01:33:40'),
(565, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:33:41'),
(566, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 01:33:43'),
(567, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:33:43'),
(568, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 01:34:58'),
(569, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 01:37:44'),
(570, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:37:48'),
(571, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 01:37:52'),
(572, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 01:38:18'),
(573, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:38:18'),
(574, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/20', '2023-09-22 01:38:43'),
(575, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:38:43'),
(576, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 01:38:55'),
(577, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 01:39:00'),
(578, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 01:39:06'),
(579, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 01:39:31'),
(580, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:39:31'),
(581, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 01:39:42'),
(582, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 01:42:11'),
(583, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 01:43:01'),
(584, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:43:01'),
(585, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 01:43:19'),
(586, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 01:43:26'),
(587, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:43:26'),
(588, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 01:43:39'),
(589, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 01:43:41'),
(590, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 01:43:43'),
(591, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:43:43'),
(592, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:43:56'),
(593, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/5', '2023-09-22 01:44:05'),
(594, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:44:06'),
(595, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/14', '2023-09-22 01:44:11'),
(596, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:44:11'),
(597, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/15', '2023-09-22 01:44:17'),
(598, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:44:18'),
(599, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/16', '2023-09-22 01:44:23'),
(600, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:44:23'),
(601, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 01:44:36'),
(602, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 01:44:44'),
(603, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:44:45'),
(604, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 01:45:23'),
(605, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:45:26'),
(606, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:45:28'),
(607, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:45:33'),
(608, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 01:45:43'),
(609, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 01:45:53'),
(610, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 01:45:53'),
(611, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:45:53'),
(612, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 01:45:59'),
(613, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:45:59'),
(614, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 01:46:01'),
(615, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 01:46:05'),
(616, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:46:05'),
(617, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 01:46:08'),
(618, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 01:46:09'),
(619, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:46:09'),
(620, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:46:12'),
(621, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 01:46:19'),
(622, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 01:46:26'),
(623, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:46:26'),
(624, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 01:46:28'),
(625, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 01:46:35'),
(626, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:46:35'),
(627, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 01:46:49'),
(628, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 01:46:54'),
(629, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:46:54'),
(630, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:47:07'),
(631, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:47:11'),
(632, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 01:47:15'),
(633, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_galeri', '2023-09-22 01:47:19'),
(634, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:47:40'),
(635, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/19', '2023-09-22 01:47:48'),
(636, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:47:48'),
(637, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 01:48:12'),
(638, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 01:48:18'),
(639, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 01:48:18'),
(640, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 01:48:20'),
(641, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:48:24'),
(642, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:48:28'),
(643, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:48:31'),
(644, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 01:49:50'),
(645, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 01:51:04'),
(646, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 01:51:05'),
(647, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 01:51:35'),
(648, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 01:51:44'),
(649, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/user', '2023-09-22 01:52:06'),
(650, 1, '172.225.78.192', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 01:52:10'),
(651, 1, '172.225.78.192', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 01:52:27'),
(652, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 01:53:36'),
(653, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori', '2023-09-22 01:53:40'),
(654, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 01:54:15'),
(655, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 01:54:24'),
(656, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 01:55:20'),
(657, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 01:55:25'),
(658, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/30', '2023-09-22 01:55:29'),
(659, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/30', '2023-09-22 01:55:33'),
(660, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Layanan', '2023-09-22 01:55:33'),
(661, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/30', '2023-09-22 01:55:54'),
(662, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/30', '2023-09-22 01:55:59'),
(663, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 01:55:59'),
(664, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 01:57:35'),
(665, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 01:58:14'),
(666, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 01:58:17'),
(667, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 02:02:28'),
(668, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 02:02:28'),
(669, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/31', '2023-09-22 02:02:44'),
(670, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/31', '2023-09-22 02:02:52'),
(671, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 02:02:52'),
(672, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 02:05:51'),
(673, 1, '172.225.72.50', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 02:13:51'),
(674, 1, '172.225.78.208', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 02:23:53'),
(675, 1, '172.225.78.192', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 03:05:28'),
(676, 1, '140.213.180.163', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 19:50:35'),
(677, 1, '140.213.180.163', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 19:50:53'),
(678, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-25 17:53:32'),
(679, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-25 17:55:39'),
(680, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-25 17:55:52'),
(681, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 17:55:58'),
(682, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-25 17:56:05'),
(683, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 17:57:05'),
(684, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-25 18:06:26'),
(685, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download/delete/6', '2023-09-25 18:06:45'),
(686, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-25 18:06:45'),
(687, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download/delete/5', '2023-09-25 18:06:51'),
(688, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-25 18:06:51'),
(689, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download/delete/4', '2023-09-25 18:06:57'),
(690, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-25 18:06:57'),
(691, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-25 18:07:32'),
(692, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-25 18:07:33'),
(693, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:07:40'),
(694, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:09:48'),
(695, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:11:19'),
(696, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:11:36'),
(697, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-25 18:11:40'),
(698, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:12:03'),
(699, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:13:37'),
(700, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:13:43'),
(701, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:14:30'),
(702, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:14:37'),
(703, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:15:00'),
(704, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-25 18:23:04'),
(705, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:23:25'),
(706, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:24:01'),
(707, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-25 18:25:44'),
(708, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:25:51'),
(709, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:26:25'),
(710, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:27:07'),
(711, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-25 18:27:19'),
(712, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-25 18:27:36'),
(713, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:27:47'),
(714, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:29:27'),
(715, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-25 18:29:42'),
(716, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-25 18:29:48'),
(717, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-25 18:30:35'),
(718, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/1', '2023-09-25 18:30:36'),
(719, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-25 18:38:19'),
(720, 1, '146.75.160.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-25 19:37:14'),
(721, 1, '146.75.160.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-25 19:37:21'),
(722, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-25 19:37:25'),
(723, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/user', '2023-09-25 19:37:42'),
(724, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-25 19:37:46'),
(725, 1, '146.75.160.28', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-26 07:07:18'),
(726, 1, '146.75.160.28', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-26 07:07:31'),
(727, 1, '146.75.160.28', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-26 07:07:51'),
(728, 1, '172.225.180.25', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-29 01:46:22'),
(729, 1, '172.225.180.25', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-29 01:46:39'),
(730, 1, '172.225.180.25', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-29 01:47:39'),
(731, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-02 19:25:32'),
(732, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-02 19:25:38'),
(733, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/1', '2023-10-02 19:25:40'),
(734, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-02 19:25:45'),
(735, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-02 19:26:21'),
(736, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-02 19:26:21'),
(737, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/2', '2023-10-02 19:26:25'),
(738, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/2', '2023-10-02 19:26:26'),
(739, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-02 19:27:18'),
(740, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-02 19:27:25'),
(741, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-02 19:27:40'),
(742, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_galeri', '2023-10-02 19:35:21'),
(743, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-02 19:35:25'),
(744, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download/delete/2', '2023-10-02 19:35:30'),
(745, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-02 19:35:30'),
(746, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download/delete/1', '2023-10-02 19:35:36'),
(747, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-02 19:35:36'),
(748, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-02 19:35:44'),
(749, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-02 19:36:10'),
(750, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-02 19:37:57'),
(751, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-02 19:38:12'),
(752, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-02 19:38:20'),
(753, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-02 19:38:20'),
(754, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-02 20:49:52'),
(755, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-02 20:49:54'),
(756, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-02 21:27:53'),
(757, 1, '36.72.71.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-03 02:35:00'),
(758, 1, '36.72.71.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-03 02:35:16'),
(759, 1, '36.72.71.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/delete/1', '2023-10-03 02:35:48'),
(760, 1, '36.72.71.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-03 02:35:48'),
(761, 1, '36.72.71.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-03 02:35:51'),
(762, 1, '36.72.71.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-03 02:36:48'),
(763, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-04 23:03:09'),
(764, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-04 23:03:14'),
(765, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-04 23:03:23'),
(766, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-04 23:03:47'),
(767, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-04 23:03:50'),
(768, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-04 23:04:04'),
(769, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-04 23:04:04'),
(770, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-04 23:04:09'),
(771, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-10-04 23:04:10'),
(772, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-04 23:04:11'),
(773, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-04 23:04:41'),
(774, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-04 23:11:04'),
(775, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-04 23:11:08'),
(776, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-04 23:11:15'),
(777, 1, '146.75.160.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-05 05:30:17'),
(778, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-05 05:30:23'),
(779, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 05:30:25'),
(780, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 05:30:28'),
(781, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 05:30:29'),
(782, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 05:30:32'),
(783, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 05:31:13'),
(784, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/delete/2', '2023-10-05 05:31:20'),
(785, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 05:31:20'),
(786, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/delete/3', '2023-10-05 05:31:25'),
(787, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 05:31:25'),
(788, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 05:31:27'),
(789, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 05:31:33'),
(790, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 05:32:02'),
(791, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 05:32:32'),
(792, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 05:33:07'),
(793, 1, '146.75.160.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-05 05:34:09'),
(794, 1, '146.75.160.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-05 05:35:24'),
(795, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-05 23:13:27'),
(796, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 23:13:33'),
(797, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 23:13:49'),
(798, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 23:13:59'),
(799, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:14:03'),
(800, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:14:31'),
(801, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:15:10'),
(802, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:18:55'),
(803, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:19:13'),
(804, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:20:26'),
(805, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:25:45'),
(806, 1, '172.225.72.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-05 23:42:33'),
(807, 1, '172.225.72.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 23:42:40'),
(808, 1, '172.225.72.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:42:42'),
(809, 1, '172.225.72.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:44:43'),
(810, 1, '172.225.72.31', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 23:44:46'),
(811, 1, '172.225.72.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:44:47'),
(812, 1, '172.225.72.31', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:44:49'),
(813, 1, '172.225.72.31', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:46:45'),
(814, 1, '172.225.72.31', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 23:46:45'),
(815, 1, '172.225.72.23', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/4', '2023-10-05 23:47:21'),
(816, 1, '172.225.72.23', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 23:49:07'),
(817, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:57:23'),
(818, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:57:41'),
(819, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:58:19'),
(820, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:59:34'),
(821, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 23:59:38'),
(822, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 23:59:49'),
(823, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 23:59:56'),
(824, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:00:12'),
(825, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:00:12'),
(826, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:00:27'),
(827, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:00:40'),
(828, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:00:41'),
(829, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/delete/4', '2023-10-06 00:00:53'),
(830, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:00:53'),
(831, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:00:57'),
(832, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:01:10'),
(833, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:01:17'),
(834, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:01:19'),
(835, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:01:38'),
(836, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:01:43'),
(837, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:01:45'),
(838, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:02:45'),
(839, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:02:47'),
(840, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/5', '2023-10-06 00:02:56'),
(841, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/5', '2023-10-06 00:02:57'),
(842, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:03:03'),
(843, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:03:07'),
(844, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:03:07'),
(845, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:03:27'),
(846, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:04:03'),
(847, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:04:49'),
(848, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-10-06 00:04:49'),
(849, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:05:18'),
(850, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:05:20'),
(851, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:05:44'),
(852, 1, '172.225.72.37', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:05:50'),
(853, 1, '172.225.72.37', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:07:19'),
(854, 1, '172.225.72.37', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:07:20'),
(855, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:09:05'),
(856, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:09:27'),
(857, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:10:04'),
(858, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:10:26'),
(859, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:10:32'),
(860, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:10:45'),
(861, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:12:30'),
(862, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:12:46'),
(863, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:12:51'),
(864, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:12:56'),
(865, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:13:02'),
(866, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:13:29'),
(867, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:13:56'),
(868, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:13:57'),
(869, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:14:01'),
(870, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/6', '2023-10-06 00:14:01'),
(871, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/6', '2023-10-06 00:14:12'),
(872, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:14:23'),
(873, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:14:39'),
(874, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:14:50'),
(875, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-06 00:14:56'),
(876, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:14:59'),
(877, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:15:01'),
(878, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-06 00:15:38'),
(879, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:15:51'),
(880, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:15:58'),
(881, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:16:20'),
(882, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:16:25'),
(883, 1, '182.1.185.107', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:16:47'),
(884, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:18:39'),
(885, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:18:55'),
(886, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-06 00:19:39'),
(887, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-06 00:19:51'),
(888, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-06 00:19:53'),
(889, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:19:58'),
(890, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:20:29'),
(891, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:23:09'),
(892, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-06 00:24:16'),
(893, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-06 00:24:31'),
(894, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-06 00:24:31'),
(895, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:24:37'),
(896, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:25:06'),
(897, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:25:08'),
(898, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:36:47'),
(899, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:37:25'),
(900, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:37:25'),
(901, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:40:11'),
(902, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 00:40:27'),
(903, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:40:27'),
(904, 1, '172.225.72.49', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 00:59:11'),
(905, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 01:08:39'),
(906, 1, '172.225.72.14', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-06 01:25:45'),
(907, 1, '125.162.213.48', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-13 04:54:56'),
(908, 1, '125.162.213.48', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-13 04:55:36'),
(909, 1, '125.162.213.48', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-13 04:57:49'),
(910, 1, '125.162.213.48', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-13 04:57:50'),
(911, 1, '180.244.74.29', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-15 19:22:22'),
(912, 1, '180.244.74.29', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-10-15 19:22:31'),
(913, 1, '180.244.74.29', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-10-15 19:23:27'),
(914, 1, '180.244.74.29', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-10-15 19:23:27'),
(915, 1, '180.244.74.29', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/22', '2023-10-15 19:25:17'),
(916, 1, '180.244.74.29', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/22', '2023-10-15 19:25:36'),
(917, 1, '180.244.74.29', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-10-15 19:25:37'),
(918, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-15 20:21:17'),
(919, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-10-15 20:21:26'),
(920, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-15 20:21:40'),
(921, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-15 20:22:18'),
(922, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Layanan', '2023-10-15 20:22:18'),
(923, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/33', '2023-10-15 20:22:38'),
(924, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/33', '2023-10-15 20:23:26'),
(925, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Layanan', '2023-10-15 20:23:26');
INSERT INTO `user_logs` (`id_user_log`, `id_user`, `ip_address`, `username`, `url`, `tanggal_updates`) VALUES
(926, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/33', '2023-10-15 20:24:15'),
(927, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/33', '2023-10-15 20:27:16'),
(928, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Layanan', '2023-10-15 20:27:16'),
(929, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/33', '2023-10-15 20:27:29'),
(930, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/33', '2023-10-15 20:28:55'),
(931, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Layanan', '2023-10-15 20:28:55'),
(932, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-15 20:44:18'),
(933, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-18 07:09:09'),
(934, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-18 07:09:48'),
(935, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-18 07:14:20'),
(936, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 07:14:21'),
(937, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 07:15:18'),
(938, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 07:17:36'),
(939, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 07:18:03'),
(940, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 07:18:04'),
(941, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 08:38:20'),
(942, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 08:38:58'),
(943, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 08:39:22'),
(944, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 08:39:25'),
(945, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 08:39:45'),
(946, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 08:40:04'),
(947, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 08:40:04'),
(948, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 08:40:18'),
(949, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 08:41:33'),
(950, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 08:41:33'),
(951, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 08:41:57'),
(952, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 08:42:03'),
(953, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 08:42:03'),
(954, 1, '182.1.185.18', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-21 08:25:45'),
(955, 1, '182.1.185.18', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-10-21 08:26:07'),
(956, 1, '182.1.185.18', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/22', '2023-10-21 08:26:10'),
(957, 1, '182.1.185.18', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/22', '2023-10-21 08:26:53'),
(958, 1, '182.1.185.18', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-10-21 08:26:54'),
(959, 1, '114.125.203.215', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-25 18:42:45'),
(960, 1, '114.125.203.215', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-25 18:43:00'),
(961, 1, '114.125.203.215', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-25 18:48:36'),
(962, 1, '114.125.203.215', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-25 18:48:37'),
(963, 1, '180.244.35.47', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-11-05 22:03:51'),
(964, 1, '110.136.253.128', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2024-01-28 21:33:56'),
(965, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2024-03-01 08:46:24'),
(966, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2024-03-01 08:47:14'),
(967, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2024-03-01 08:52:34'),
(968, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2024-03-01 08:52:37'),
(969, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2024-03-03 04:22:51'),
(970, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:22:57'),
(971, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:24:25'),
(972, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:24:26'),
(973, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:24:26'),
(974, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:24:26'),
(975, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:24:28'),
(976, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:24:28'),
(977, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:24:29'),
(978, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:24:29'),
(979, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:24:29'),
(980, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:24:37'),
(981, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:24:37'),
(982, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-03 04:24:41'),
(983, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:24:47'),
(984, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 04:24:52'),
(985, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 04:25:11'),
(986, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 04:25:11'),
(987, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:25:23'),
(988, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-03 04:25:26'),
(989, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:25:28'),
(990, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:25:56'),
(991, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:25:57'),
(992, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:25:57'),
(993, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:25:57'),
(994, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:25:58'),
(995, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:25:58'),
(996, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:25:58'),
(997, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:25:59'),
(998, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:25:59'),
(999, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:25:59'),
(1000, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:25:59'),
(1001, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:00'),
(1002, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:00'),
(1003, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:01'),
(1004, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:02'),
(1005, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:02'),
(1006, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:02'),
(1007, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:03'),
(1008, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:03'),
(1009, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:07'),
(1010, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:07'),
(1011, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:08'),
(1012, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:08'),
(1013, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:08'),
(1014, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:09'),
(1015, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:09'),
(1016, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:16'),
(1017, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:17'),
(1018, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:17'),
(1019, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:17'),
(1020, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:18'),
(1021, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:18'),
(1022, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:18'),
(1023, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:18'),
(1024, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:19'),
(1025, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:19'),
(1026, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:19'),
(1027, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:20'),
(1028, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:20'),
(1029, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:20'),
(1030, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:20'),
(1031, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:26'),
(1032, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:27'),
(1033, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:27'),
(1034, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:27'),
(1035, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:28'),
(1036, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:28'),
(1037, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:28'),
(1038, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:29'),
(1039, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:29'),
(1040, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:30'),
(1041, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:30'),
(1042, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:30'),
(1043, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:30'),
(1044, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:31'),
(1045, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:31'),
(1046, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:53'),
(1047, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:54'),
(1048, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:54'),
(1049, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:54'),
(1050, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:54'),
(1051, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:55'),
(1052, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:55'),
(1053, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:55'),
(1054, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:55'),
(1055, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:56'),
(1056, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:56'),
(1057, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:56'),
(1058, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:26:56'),
(1059, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:27:48'),
(1060, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-03 04:27:48'),
(1061, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/6', '2024-03-03 04:28:14'),
(1062, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/6', '2024-03-03 04:28:21'),
(1063, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2024-03-03 04:29:19'),
(1064, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 04:29:25'),
(1065, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 04:29:37'),
(1066, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 04:29:38'),
(1067, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-03 04:29:47'),
(1068, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:29:49'),
(1069, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-03 04:31:45'),
(1070, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 04:31:55'),
(1071, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 04:32:12'),
(1072, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 04:32:13'),
(1073, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-03 04:32:27'),
(1074, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:32:31'),
(1075, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:33:59'),
(1076, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-03 04:34:01'),
(1077, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:36:05'),
(1078, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 04:41:50'),
(1079, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2024-03-04 23:06:13'),
(1080, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:06:21'),
(1081, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-04 23:06:47'),
(1082, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-04 23:07:02'),
(1083, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-04 23:07:06'),
(1084, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-04 23:07:10'),
(1085, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-04 23:07:14'),
(1086, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-04 23:07:14'),
(1087, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:07:26'),
(1088, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:08:09'),
(1089, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-04 23:08:09'),
(1090, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-04 23:08:23'),
(1091, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-04 23:08:39'),
(1092, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-04 23:08:39'),
(1093, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:08:45'),
(1094, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:13:28'),
(1095, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:13:59'),
(1096, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:14:05'),
(1097, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:15:00'),
(1098, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:16:47'),
(1099, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-04 23:16:47'),
(1100, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2024-03-04 23:21:28'),
(1101, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:21:31'),
(1102, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:21:55'),
(1103, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-04 23:21:55'),
(1104, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2024-03-04 23:32:05'),
(1105, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:33:22'),
(1106, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:36:22'),
(1107, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-04 23:36:22'),
(1108, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:36:32'),
(1109, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:37:17'),
(1110, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:39:55'),
(1111, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-04 23:39:55'),
(1112, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:40:01'),
(1113, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:41:13'),
(1114, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-04 23:41:13'),
(1115, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:41:19'),
(1116, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-04 23:41:40'),
(1117, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-04 23:41:41'),
(1118, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:10:31'),
(1119, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:10:39'),
(1120, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:10:50'),
(1121, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:10:53'),
(1122, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/akun', '2024-06-13 04:10:56'),
(1123, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/user', '2024-06-13 04:11:08'),
(1124, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/client', '2024-06-13 04:11:11'),
(1125, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:11:19'),
(1126, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/user', '2024-06-13 04:11:21'),
(1127, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/akun', '2024-06-13 04:11:24'),
(1128, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/panduan', '2024-06-13 04:11:38'),
(1129, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/user', '2024-06-13 04:11:43'),
(1130, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/client', '2024-06-13 04:11:45'),
(1131, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:11:49'),
(1132, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:12:02'),
(1133, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:12:28'),
(1134, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/akun', '2024-06-13 04:12:44'),
(1135, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:12:47'),
(1136, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:13:02'),
(1137, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/panduan', '2024-06-13 04:14:16'),
(1138, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/user', '2024-06-13 04:14:24'),
(1139, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/client', '2024-06-13 04:14:27'),
(1140, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/user', '2024-06-13 04:14:29'),
(1141, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/user', '2024-06-13 04:14:31'),
(1142, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:14:38'),
(1143, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi', '2024-06-13 04:14:55'),
(1144, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 04:17:43'),
(1145, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 04:18:10'),
(1146, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 04:18:11'),
(1147, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:21:43'),
(1148, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:22:02'),
(1149, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:22:05'),
(1150, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:22:26'),
(1151, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 04:22:28'),
(1152, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi', '2024-06-13 04:22:33'),
(1153, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 04:22:37'),
(1154, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 04:22:49'),
(1155, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 04:22:49'),
(1156, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 04:25:36'),
(1157, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 04:25:36'),
(1158, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 05:53:26'),
(1159, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 05:53:36'),
(1160, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 05:53:46'),
(1161, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 05:53:46'),
(1162, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 06:16:50'),
(1163, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/berita', '2024-06-13 06:17:01'),
(1164, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/berita/tambah', '2024-06-13 06:17:04'),
(1165, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 06:17:07'),
(1166, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/kategori', '2024-06-13 06:17:23'),
(1167, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/kategori/edit/2', '2024-06-13 06:17:26'),
(1168, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/kategori', '2024-06-13 06:17:28'),
(1169, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 06:17:53'),
(1170, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:17:59'),
(1171, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:18:34'),
(1172, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 06:18:38'),
(1173, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/kategori_galeri', '2024-06-13 06:18:53'),
(1174, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:21:27'),
(1175, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:23:32'),
(1176, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:23:32'),
(1177, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:24:00'),
(1178, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:24:00'),
(1179, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:24:50'),
(1180, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:24:50'),
(1181, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 06:29:03'),
(1182, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/berita', '2024-06-13 06:29:07'),
(1183, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/galeri', '2024-06-13 06:29:10'),
(1184, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/download', '2024-06-13 06:29:20'),
(1185, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/client', '2024-06-13 06:29:34'),
(1186, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/user', '2024-06-13 06:29:37'),
(1187, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:32:47'),
(1188, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/client', '2024-06-13 06:32:56'),
(1189, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 06:32:58'),
(1190, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 06:33:01'),
(1191, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 06:33:45'),
(1192, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 06:33:46'),
(1193, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/berita', '2024-06-13 06:34:02'),
(1194, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/galeri', '2024-06-13 06:34:48'),
(1195, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/galeri/tambah', '2024-06-13 06:35:46'),
(1196, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/client', '2024-06-13 06:35:50'),
(1197, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi/icon', '2024-06-13 06:35:55'),
(1198, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi/icon', '2024-06-13 06:36:01'),
(1199, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi/icon', '2024-06-13 06:36:01'),
(1200, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/user', '2024-06-13 06:37:43'),
(1201, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi/logo', '2024-06-13 06:37:49'),
(1202, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 06:37:57'),
(1203, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 06:37:59'),
(1204, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 06:38:41'),
(1205, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 06:38:41'),
(1206, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 06:38:46'),
(1207, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:42:55'),
(1208, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:43:08'),
(1209, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:43:08'),
(1210, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:44:17'),
(1211, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:44:17'),
(1212, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/user', '2024-06-13 06:47:00'),
(1213, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:47:08'),
(1214, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:47:37'),
(1215, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:47:37'),
(1216, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:48:45'),
(1217, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:48:45'),
(1218, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 06:49:03'),
(1219, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 06:49:12'),
(1220, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 06:49:12'),
(1221, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 06:49:17'),
(1222, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:50:14'),
(1223, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:50:26'),
(1224, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:50:27'),
(1225, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/download', '2024-06-13 06:53:52'),
(1226, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/download/delete/19', '2024-06-13 06:54:01'),
(1227, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/download', '2024-06-13 06:54:01'),
(1228, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/download', '2024-06-13 06:55:50'),
(1229, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 06:58:30'),
(1230, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 07:03:14'),
(1231, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 07:03:14'),
(1232, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 07:07:46'),
(1233, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 07:07:46'),
(1234, 1, '::1', 'admin', 'http://localhost/dinsos/admin/dasbor', '2024-06-13 08:19:18'),
(1235, 1, '::1', 'admin', 'http://localhost/dinsos/admin/galeri/tambah', '2024-06-13 08:19:29'),
(1236, 1, '::1', 'admin', 'http://localhost/dinsos/admin/galeri/tambah', '2024-06-13 08:19:55'),
(1237, 1, '::1', 'admin', 'http://localhost/dinsos/admin/galeri', '2024-06-13 08:19:55'),
(1238, 1, '::1', 'admin', 'http://localhost/dinsos/admin/galeri/delete/23', '2024-06-13 08:20:20'),
(1239, 1, '::1', 'admin', 'http://localhost/dinsos/admin/galeri', '2024-06-13 08:20:21'),
(1240, 1, '::1', 'admin', 'http://localhost/dinsos/admin/kategori_galeri', '2024-06-13 08:20:26'),
(1241, 1, '::1', 'admin', 'http://localhost/dinsos/admin/user', '2024-06-13 08:20:31'),
(1242, 1, '::1', 'admin', 'http://localhost/dinsos/admin/dasbor', '2024-06-13 08:36:45'),
(1243, 1, '::1', 'admin', 'http://localhost/dinsos/admin/dasbor', '2024-06-13 08:36:50'),
(1244, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-13 08:36:54'),
(1245, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-13 08:38:41'),
(1246, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-13 08:38:41');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id_video` int NOT NULL,
  `id_user` int NOT NULL,
  `judul` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `video` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_post` datetime NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id_video`, `id_user`, `judul`, `keterangan`, `video`, `tanggal_post`, `tanggal`) VALUES
(6, 0, 'KALEIDOSKOP KAB. LUWU TAHUN 2021', 'Kaleidoskop 2021 Kabupaten Luwu', 'r2NiUzuLvSo', '0000-00-00 00:00:00', '2023-09-22 01:27:34'),
(7, 0, 'PROFIL KABUPATEN LUWU || SULAWESI SELATAN || BUMI SAWERIGADING', '-', 'gOBsU1pyNBk', '0000-00-00 00:00:00', '2023-09-22 01:24:32'),
(8, 0, 'KALEIDOSKOP KAB. LUWU TAHUN 2022', '-', 'MvZw1KhdZA4', '0000-00-00 00:00:00', '2023-09-22 01:27:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`) USING BTREE;

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`) USING BTREE;

--
-- Indexes for table `download`
--
ALTER TABLE `download`
  ADD PRIMARY KEY (`id_download`) USING BTREE;

--
-- Indexes for table `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id_galeri`) USING BTREE;

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`) USING BTREE;

--
-- Indexes for table `kategori_download`
--
ALTER TABLE `kategori_download`
  ADD PRIMARY KEY (`id_kategori_download`) USING BTREE;

--
-- Indexes for table `kategori_galeri`
--
ALTER TABLE `kategori_galeri`
  ADD PRIMARY KEY (`id_kategori_galeri`) USING BTREE;

--
-- Indexes for table `kategori_staff`
--
ALTER TABLE `kategori_staff`
  ADD PRIMARY KEY (`id_kategori_staff`) USING BTREE;

--
-- Indexes for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  ADD PRIMARY KEY (`id_konfigurasi`) USING BTREE;

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id_staff`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`) USING BTREE;

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id_user_log`) USING BTREE;

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id_video`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `download`
--
ALTER TABLE `download`
  MODIFY `id_download` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id_galeri` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kategori_download`
--
ALTER TABLE `kategori_download`
  MODIFY `id_kategori_download` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `kategori_galeri`
--
ALTER TABLE `kategori_galeri`
  MODIFY `id_kategori_galeri` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kategori_staff`
--
ALTER TABLE `kategori_staff`
  MODIFY `id_kategori_staff` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  MODIFY `id_konfigurasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id_staff` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id_user_log` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1247;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id_video` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
