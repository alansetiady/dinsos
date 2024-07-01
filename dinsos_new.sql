/*
 Navicat Premium Data Transfer

 Source Server         : Mysql MariaDB
 Source Server Type    : MySQL
 Source Server Version : 100225
 Source Host           : localhost:3306
 Source Schema         : dinsos

 Target Server Type    : MySQL
 Target Server Version : 100225
 File Encoding         : 65001

 Date: 26/06/2024 10:40:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for berita
-- ----------------------------
DROP TABLE IF EXISTS `berita`;
CREATE TABLE `berita`  (
  `id_berita` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `slug_berita` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `judul_berita` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ringkasan` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status_berita` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis_berita` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keywords` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gambar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hits` int(11) NOT NULL,
  `tanggal_post` datetime(0) NOT NULL,
  `tanggal_publish` datetime(0) NOT NULL,
  `tanggal` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_berita`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NULL DEFAULT NULL,
  `jenis_client` enum('Perorangan','Perusahaan','Organisasi') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pimpinan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `telepon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `isi_testimoni` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `gambar` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status_client` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tempat_lahir` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `tanggal_post` datetime(0) NOT NULL,
  `tanggal` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_client`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for download
-- ----------------------------
DROP TABLE IF EXISTS `download`;
CREATE TABLE `download`  (
  `id_download` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori_download` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul_download` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis_download` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `gambar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hits` int(11) NOT NULL,
  `tanggal_post` datetime(0) NOT NULL,
  `tanggal` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_download`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for galeri
-- ----------------------------
DROP TABLE IF EXISTS `galeri`;
CREATE TABLE `galeri`  (
  `id_galeri` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori_galeri` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul_galeri` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis_galeri` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `gambar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hits` int(11) NULL DEFAULT NULL,
  `status_text` enum('Ya','Tidak','','') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_post` datetime(0) NULL DEFAULT NULL,
  `tanggal` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_galeri`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of galeri
-- ----------------------------
INSERT INTO `galeri` VALUES (21, 4, 1, 'KABUPATEN LUWU YANG MAJU, SEJAHTERA DAN MANDIRI DALAM NUANSA RELIGI', 'Homepage', '', 'BUPATI-DAN-WAKIL-BUPATI.jpg', '', NULL, 'Ya', '2023-09-22 16:45:53', '2023-09-22 09:46:54');

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori`  (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `slug_kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `urutan` int(11) NULL DEFAULT NULL,
  `hits` int(11) NOT NULL,
  `tanggal` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_kategori`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES (2, 1, 'berita', 'Berita', 2, 101, '2024-03-23 03:01:53');

-- ----------------------------
-- Table structure for kategori_download
-- ----------------------------
DROP TABLE IF EXISTS `kategori_download`;
CREATE TABLE `kategori_download`  (
  `id_kategori_download` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `slug_kategori_download` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kategori_download` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `urutan` int(11) NULL DEFAULT NULL,
  `hits` int(11) NOT NULL,
  `tanggal` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_kategori_download`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kategori_galeri
-- ----------------------------
DROP TABLE IF EXISTS `kategori_galeri`;
CREATE TABLE `kategori_galeri`  (
  `id_kategori_galeri` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `slug_kategori_galeri` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kategori_galeri` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `urutan` int(11) NULL DEFAULT NULL,
  `hits` int(11) NOT NULL,
  `tanggal` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_kategori_galeri`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kategori_galeri
-- ----------------------------
INSERT INTO `kategori_galeri` VALUES (4, 0, 'kegiatan', 'Kegiatan', 4, 0, '2021-04-21 00:38:46');
INSERT INTO `kategori_galeri` VALUES (5, 0, 'banner-website', 'Banner Website', 4, 0, '2021-04-21 00:38:46');
INSERT INTO `kategori_galeri` VALUES (7, 1, 'badik-luwu', 'BADIK LUWU', 1, 0, '2023-09-22 09:16:03');

-- ----------------------------
-- Table structure for kategori_staff
-- ----------------------------
DROP TABLE IF EXISTS `kategori_staff`;
CREATE TABLE `kategori_staff`  (
  `id_kategori_staff` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `slug_kategori_staff` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kategori_staff` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `urutan` int(11) NULL DEFAULT NULL,
  `hits` int(11) NOT NULL,
  `tanggal` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_kategori_staff`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kategori_staff
-- ----------------------------
INSERT INTO `kategori_staff` VALUES (1, 0, 'pejabat-eselon-1', 'Pejabat Eselon 1', 1, 0, '2021-04-21 00:44:24');
INSERT INTO `kategori_staff` VALUES (2, 0, 'pejabat-struktural', 'Pejabat Struktural', 2, 0, '2021-04-21 00:44:24');
INSERT INTO `kategori_staff` VALUES (3, 1, 'team-inti', 'Team Inti', 2, 0, '2021-04-21 01:54:27');

-- ----------------------------
-- Table structure for konfigurasi
-- ----------------------------
DROP TABLE IF EXISTS `konfigurasi`;
CREATE TABLE `konfigurasi`  (
  `id_konfigurasi` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `namaweb` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `singkatan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tagline` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tentang` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email_cadangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `telepon` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hp` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keywords` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `metatext` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `facebook` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `instagram` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `youtube` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_facebook` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_twitter` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_instagram` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_youtube` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `google_map` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `protocol` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `smtp_host` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_timeout` int(11) NOT NULL,
  `smtp_user` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `smtp_pass` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_konfigurasi`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of konfigurasi
-- ----------------------------
INSERT INTO `konfigurasi` VALUES (1, 1, 'Dinas Sosial Kabupaten Luwu', 'Dinsos Kab. Luwu', 'Dinas Sosial Kabupaten Luwu', '<p><strong>Tugas</strong></p>\r\n<p class=\"p1\" style=\"text-align: justify;\">Dinsos mempunyai tugas mengawal Visi dan Misi Bupati Luwu dalam upaya menjamin&nbsp; laju perkembangan, keseimbangan dan kesinambungan pembangunan daerah diperlukan perencanaan yang menyeluruh, terarah, terpadu, dan berkelanjutan.&nbsp; Manajemen perencanaan diperlukan untuk melakukan koordinasi sosial daerah melalui aspek penguatan kelembagaan.</p>\r\n<p><strong>Fungsi</strong></p>\r\n<ol>\r\n<li>Perumusan kebijakan di bidang rehabilitasi sosial dan jaminan perlindungan sosial, pemberdayaan sosial dan penanganan fakir miskin;</li>\r\n<li>Pelaksanaan kebijakan di bidang rehabilitasi social dan jaminan perlindungan social, pemberdayaan social dan penanganan fakir miskin;</li>\r\n<li>Pelaksanaan evaluasi dan pelaporan di bidang rehabilitasi social dan jaminan perlindungan social, pemberdayaan social dan penanganan fakir miskin;</li>\r\n<li>pelaksanaan administrasi di bidang rehabilitasi sosial dan jaminan perlindungan sosial, pemberdayaan sosial dan penanganan fakir miskin;</li>\r\n<li>pelaksanaan fungsi lain yang diberikan oleh Bupati terkait dengan tugas dan fungsinya.</li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<h6><strong>Kepala Dinas,</strong></h6>\r\n<p>&nbsp;</p>\r\n<h6><strong>HASLIANA NURDIN S.Pt.,MM</strong></h6>', 'DINAS SOSIAL KABUPATEN LUWU', 'Jl. Andi Djemma No. 1 Senga, Belopa', 'dinsos@luwukab.go.id', 'dinsos@luwukab.go.id', '<h5>Pemerintah Daerah Kabupaten Luwu, Dinas Sosial, Jalan Pahlawan, Belopa 91994 </h5>', '+62 813-4223-4700', '+62 813-4223-4700', 'logooo.png', 'kadis Sosial.jpg', '\r\n', '', 'https://www.facebook.com/', 'http://twitter.com/', 'https://instagram.com/', 'https://www.youtube.com', 'Dinas Sosial Kab. Luwu', 'Dinas Sosial Kab. Luwu', 'Dinas Sosial Kab. Luwu', 'Dinas Sosial Kab. Luwu', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d595.8629749453756!2d120.36563166326529!3d-3.3920611461940555!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2d96bac1cfe5ada9%3A0xad8d6e81154de5e3!2sDinas%20Sosial%20Kabupaten%20Luwu!5e0!3m2!1sen!2sid!4v1718193334744!5m2!1sen!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'smtp', 'ssl://mail.websitemu.com', 465, 7, 'contact@websitemu.com', 'muhammad', '2024-06-26 10:23:33');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `id_staff` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NULL DEFAULT NULL,
  `id_kategori_staff` int(11) NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `telepon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jabatan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keahlian` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `gambar` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status_staff` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tempat_lahir` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `tanggal` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_staff`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES (9, 1, 3, 'Andoyo Cakep', 'Jl Permata No 1, Halim Perdanakusuma', '0813 8841 0829', 'https://sidatablkbogorkab.com', 'lalu-kekah@bkkbn.go.id', 'Direktur', 'ada', '6.jpg', 'Publish', 'Depok', '1983-02-22', '2021-04-24 01:51:22');
INSERT INTO `staff` VALUES (10, 1, 3, 'Andoyo Cakep', 'Depok Town Square Lantai 2 Unit SS 5-7\r\nJl. Margonda Raya Kota Depok', '+6285715100485', 'https://javawebmedia.com', 'javawebmedia@gmail.com', 'Graphic Designer', '', '4.jpg', 'Publish', 'Depok', '1983-02-22', '2021-04-24 01:50:59');

-- ----------------------------
-- Table structure for user_logs
-- ----------------------------
DROP TABLE IF EXISTS `user_logs`;
CREATE TABLE `user_logs`  (
  `id_user_log` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `ip_address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_updates` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_user_log`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1277 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_logs
-- ----------------------------
INSERT INTO `user_logs` VALUES (1, 1, '::1', 'javawebmedia', 'http://localhost/webci4/admin/dasbor', '2021-05-03 01:19:34');
INSERT INTO `user_logs` VALUES (2, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 03:08:23');
INSERT INTO `user_logs` VALUES (3, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:08:34');
INSERT INTO `user_logs` VALUES (4, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:08:41');
INSERT INTO `user_logs` VALUES (5, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:11:41');
INSERT INTO `user_logs` VALUES (6, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:14:16');
INSERT INTO `user_logs` VALUES (7, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:14:19');
INSERT INTO `user_logs` VALUES (8, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:17:14');
INSERT INTO `user_logs` VALUES (9, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:17:18');
INSERT INTO `user_logs` VALUES (10, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-19 03:17:34');
INSERT INTO `user_logs` VALUES (11, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 03:17:41');
INSERT INTO `user_logs` VALUES (12, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 03:32:02');
INSERT INTO `user_logs` VALUES (13, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 03:32:09');
INSERT INTO `user_logs` VALUES (14, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-19 03:32:11');
INSERT INTO `user_logs` VALUES (15, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-19 03:32:47');
INSERT INTO `user_logs` VALUES (16, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-19 03:33:56');
INSERT INTO `user_logs` VALUES (17, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:33:59');
INSERT INTO `user_logs` VALUES (18, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-19 03:34:02');
INSERT INTO `user_logs` VALUES (19, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 03:34:04');
INSERT INTO `user_logs` VALUES (20, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 03:34:08');
INSERT INTO `user_logs` VALUES (21, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 03:34:10');
INSERT INTO `user_logs` VALUES (22, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 03:34:14');
INSERT INTO `user_logs` VALUES (23, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-19 03:34:16');
INSERT INTO `user_logs` VALUES (24, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-19 03:34:40');
INSERT INTO `user_logs` VALUES (25, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-19 03:34:40');
INSERT INTO `user_logs` VALUES (26, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-19 03:34:43');
INSERT INTO `user_logs` VALUES (27, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 03:37:30');
INSERT INTO `user_logs` VALUES (28, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-19 03:37:35');
INSERT INTO `user_logs` VALUES (29, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 03:37:44');
INSERT INTO `user_logs` VALUES (30, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 03:37:59');
INSERT INTO `user_logs` VALUES (31, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 03:45:16');
INSERT INTO `user_logs` VALUES (32, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 03:45:16');
INSERT INTO `user_logs` VALUES (33, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 03:46:20');
INSERT INTO `user_logs` VALUES (34, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 03:47:00');
INSERT INTO `user_logs` VALUES (35, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 03:47:00');
INSERT INTO `user_logs` VALUES (36, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-19 03:47:45');
INSERT INTO `user_logs` VALUES (37, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/edit/5', '2023-06-19 03:47:52');
INSERT INTO `user_logs` VALUES (38, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/edit/5', '2023-06-19 03:48:39');
INSERT INTO `user_logs` VALUES (39, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-19 03:48:39');
INSERT INTO `user_logs` VALUES (40, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 03:50:00');
INSERT INTO `user_logs` VALUES (41, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 03:50:02');
INSERT INTO `user_logs` VALUES (42, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 03:50:05');
INSERT INTO `user_logs` VALUES (43, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 03:52:56');
INSERT INTO `user_logs` VALUES (44, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 03:52:56');
INSERT INTO `user_logs` VALUES (45, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-19 03:55:58');
INSERT INTO `user_logs` VALUES (46, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/delete/13', '2023-06-19 03:56:06');
INSERT INTO `user_logs` VALUES (47, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-19 03:56:06');
INSERT INTO `user_logs` VALUES (48, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/delete/12', '2023-06-19 03:56:09');
INSERT INTO `user_logs` VALUES (49, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-19 03:56:09');
INSERT INTO `user_logs` VALUES (50, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/delete/10', '2023-06-19 03:56:13');
INSERT INTO `user_logs` VALUES (51, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-19 03:56:13');
INSERT INTO `user_logs` VALUES (52, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/delete/9', '2023-06-19 03:56:16');
INSERT INTO `user_logs` VALUES (53, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-19 03:56:16');
INSERT INTO `user_logs` VALUES (54, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/delete/8', '2023-06-19 03:56:20');
INSERT INTO `user_logs` VALUES (55, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-19 03:56:20');
INSERT INTO `user_logs` VALUES (56, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/delete/4', '2023-06-19 03:56:23');
INSERT INTO `user_logs` VALUES (57, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-19 03:56:23');
INSERT INTO `user_logs` VALUES (58, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/delete/7', '2023-06-19 03:56:26');
INSERT INTO `user_logs` VALUES (59, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-19 03:56:26');
INSERT INTO `user_logs` VALUES (60, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 03:56:50');
INSERT INTO `user_logs` VALUES (61, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:57:08');
INSERT INTO `user_logs` VALUES (62, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/edit/23', '2023-06-19 03:57:19');
INSERT INTO `user_logs` VALUES (63, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/edit/23', '2023-06-19 03:57:47');
INSERT INTO `user_logs` VALUES (64, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/jenis_berita/Profil', '2023-06-19 03:57:47');
INSERT INTO `user_logs` VALUES (65, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/jenis_berita/Profil', '2023-06-19 03:58:15');
INSERT INTO `user_logs` VALUES (66, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/4', '2023-06-19 03:58:19');
INSERT INTO `user_logs` VALUES (67, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:58:20');
INSERT INTO `user_logs` VALUES (68, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/1', '2023-06-19 03:58:38');
INSERT INTO `user_logs` VALUES (69, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:58:38');
INSERT INTO `user_logs` VALUES (70, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/24', '2023-06-19 03:58:41');
INSERT INTO `user_logs` VALUES (71, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:58:41');
INSERT INTO `user_logs` VALUES (72, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/22', '2023-06-19 03:58:45');
INSERT INTO `user_logs` VALUES (73, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:58:45');
INSERT INTO `user_logs` VALUES (74, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/2', '2023-06-19 03:58:49');
INSERT INTO `user_logs` VALUES (75, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:58:49');
INSERT INTO `user_logs` VALUES (76, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/3', '2023-06-19 03:58:52');
INSERT INTO `user_logs` VALUES (77, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:58:53');
INSERT INTO `user_logs` VALUES (78, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/6', '2023-06-19 03:58:56');
INSERT INTO `user_logs` VALUES (79, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:58:56');
INSERT INTO `user_logs` VALUES (80, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/7', '2023-06-19 03:58:59');
INSERT INTO `user_logs` VALUES (81, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:58:59');
INSERT INTO `user_logs` VALUES (82, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/21', '2023-06-19 03:59:02');
INSERT INTO `user_logs` VALUES (83, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:59:02');
INSERT INTO `user_logs` VALUES (84, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 03:59:28');
INSERT INTO `user_logs` VALUES (85, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-19 03:59:34');
INSERT INTO `user_logs` VALUES (86, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 03:59:48');
INSERT INTO `user_logs` VALUES (87, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/icon', '2023-06-19 04:06:41');
INSERT INTO `user_logs` VALUES (88, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/icon', '2023-06-19 04:06:48');
INSERT INTO `user_logs` VALUES (89, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/icon', '2023-06-19 04:06:48');
INSERT INTO `user_logs` VALUES (90, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/icon', '2023-06-19 04:07:09');
INSERT INTO `user_logs` VALUES (91, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/icon', '2023-06-19 04:07:09');
INSERT INTO `user_logs` VALUES (92, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:11:26');
INSERT INTO `user_logs` VALUES (93, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:11:32');
INSERT INTO `user_logs` VALUES (94, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:11:32');
INSERT INTO `user_logs` VALUES (95, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:14:14');
INSERT INTO `user_logs` VALUES (96, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:14:14');
INSERT INTO `user_logs` VALUES (97, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:15:46');
INSERT INTO `user_logs` VALUES (98, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:15:46');
INSERT INTO `user_logs` VALUES (99, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:18:08');
INSERT INTO `user_logs` VALUES (100, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:18:08');
INSERT INTO `user_logs` VALUES (101, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:18:56');
INSERT INTO `user_logs` VALUES (102, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:18:56');
INSERT INTO `user_logs` VALUES (103, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:19:45');
INSERT INTO `user_logs` VALUES (104, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:19:46');
INSERT INTO `user_logs` VALUES (105, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:20:56');
INSERT INTO `user_logs` VALUES (106, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:20:57');
INSERT INTO `user_logs` VALUES (107, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:22:04');
INSERT INTO `user_logs` VALUES (108, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:22:04');
INSERT INTO `user_logs` VALUES (109, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:22:33');
INSERT INTO `user_logs` VALUES (110, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:22:33');
INSERT INTO `user_logs` VALUES (111, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 04:23:40');
INSERT INTO `user_logs` VALUES (112, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/staff', '2023-06-19 04:24:33');
INSERT INTO `user_logs` VALUES (113, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 04:24:36');
INSERT INTO `user_logs` VALUES (114, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 04:24:42');
INSERT INTO `user_logs` VALUES (115, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 04:24:45');
INSERT INTO `user_logs` VALUES (116, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user', '2023-06-19 04:24:59');
INSERT INTO `user_logs` VALUES (117, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user/delete/3', '2023-06-19 04:25:06');
INSERT INTO `user_logs` VALUES (118, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user', '2023-06-19 04:25:06');
INSERT INTO `user_logs` VALUES (119, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user/delete/2', '2023-06-19 04:25:12');
INSERT INTO `user_logs` VALUES (120, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user', '2023-06-19 04:25:12');
INSERT INTO `user_logs` VALUES (121, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user/edit/1', '2023-06-19 04:25:14');
INSERT INTO `user_logs` VALUES (122, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 04:25:22');
INSERT INTO `user_logs` VALUES (123, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-19 04:25:26');
INSERT INTO `user_logs` VALUES (124, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/download', '2023-06-19 04:25:30');
INSERT INTO `user_logs` VALUES (125, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-19 04:27:08');
INSERT INTO `user_logs` VALUES (126, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video/delete/1', '2023-06-19 04:27:13');
INSERT INTO `user_logs` VALUES (127, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-19 04:27:13');
INSERT INTO `user_logs` VALUES (128, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video/delete/2', '2023-06-19 04:27:16');
INSERT INTO `user_logs` VALUES (129, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-19 04:27:16');
INSERT INTO `user_logs` VALUES (130, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video/delete/3', '2023-06-19 04:27:19');
INSERT INTO `user_logs` VALUES (131, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-19 04:27:19');
INSERT INTO `user_logs` VALUES (132, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 04:27:48');
INSERT INTO `user_logs` VALUES (133, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 04:28:00');
INSERT INTO `user_logs` VALUES (134, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/edit/23', '2023-06-19 04:28:04');
INSERT INTO `user_logs` VALUES (135, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 04:28:08');
INSERT INTO `user_logs` VALUES (136, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 04:28:10');
INSERT INTO `user_logs` VALUES (137, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/delete/23', '2023-06-19 04:28:13');
INSERT INTO `user_logs` VALUES (138, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 04:28:13');
INSERT INTO `user_logs` VALUES (139, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/panduan', '2023-06-19 04:31:48');
INSERT INTO `user_logs` VALUES (140, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/download/unduh/7', '2023-06-19 04:31:54');
INSERT INTO `user_logs` VALUES (141, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/download/unduh/7', '2023-06-19 04:31:55');
INSERT INTO `user_logs` VALUES (142, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 04:32:19');
INSERT INTO `user_logs` VALUES (143, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:32:25');
INSERT INTO `user_logs` VALUES (144, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:34:35');
INSERT INTO `user_logs` VALUES (145, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 04:34:38');
INSERT INTO `user_logs` VALUES (146, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/icon', '2023-06-19 04:34:42');
INSERT INTO `user_logs` VALUES (147, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 04:34:44');
INSERT INTO `user_logs` VALUES (148, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 04:34:49');
INSERT INTO `user_logs` VALUES (149, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 04:34:49');
INSERT INTO `user_logs` VALUES (150, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 04:39:56');
INSERT INTO `user_logs` VALUES (151, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-19 04:39:57');
INSERT INTO `user_logs` VALUES (152, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori', '2023-06-19 04:40:05');
INSERT INTO `user_logs` VALUES (153, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori/delete/1', '2023-06-19 04:40:10');
INSERT INTO `user_logs` VALUES (154, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori', '2023-06-19 04:40:10');
INSERT INTO `user_logs` VALUES (155, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori/delete/3', '2023-06-19 04:40:14');
INSERT INTO `user_logs` VALUES (156, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori', '2023-06-19 04:40:14');
INSERT INTO `user_logs` VALUES (157, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori/delete/4', '2023-06-19 04:40:17');
INSERT INTO `user_logs` VALUES (158, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori', '2023-06-19 04:40:17');
INSERT INTO `user_logs` VALUES (159, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori/delete/5', '2023-06-19 04:40:22');
INSERT INTO `user_logs` VALUES (160, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori', '2023-06-19 04:40:22');
INSERT INTO `user_logs` VALUES (161, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori/delete/6', '2023-06-19 04:40:26');
INSERT INTO `user_logs` VALUES (162, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori', '2023-06-19 04:40:26');
INSERT INTO `user_logs` VALUES (163, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 04:40:40');
INSERT INTO `user_logs` VALUES (164, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-19 04:40:44');
INSERT INTO `user_logs` VALUES (165, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-19 04:41:32');
INSERT INTO `user_logs` VALUES (166, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/jenis_berita/Berita', '2023-06-19 04:41:32');
INSERT INTO `user_logs` VALUES (167, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-19 04:42:00');
INSERT INTO `user_logs` VALUES (168, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-19 04:42:41');
INSERT INTO `user_logs` VALUES (169, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/jenis_berita/Berita', '2023-06-19 04:42:41');
INSERT INTO `user_logs` VALUES (170, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-19 04:43:15');
INSERT INTO `user_logs` VALUES (171, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-19 04:43:36');
INSERT INTO `user_logs` VALUES (172, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/jenis_berita/Berita', '2023-06-19 04:43:36');
INSERT INTO `user_logs` VALUES (173, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-19 04:46:03');
INSERT INTO `user_logs` VALUES (174, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-19 04:46:11');
INSERT INTO `user_logs` VALUES (175, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-19 04:46:12');
INSERT INTO `user_logs` VALUES (176, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-19 04:46:15');
INSERT INTO `user_logs` VALUES (177, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 04:47:40');
INSERT INTO `user_logs` VALUES (178, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:49:15');
INSERT INTO `user_logs` VALUES (179, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:49:41');
INSERT INTO `user_logs` VALUES (180, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:49:41');
INSERT INTO `user_logs` VALUES (181, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:50:11');
INSERT INTO `user_logs` VALUES (182, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:50:11');
INSERT INTO `user_logs` VALUES (183, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:50:37');
INSERT INTO `user_logs` VALUES (184, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:50:37');
INSERT INTO `user_logs` VALUES (185, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:50:59');
INSERT INTO `user_logs` VALUES (186, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:50:59');
INSERT INTO `user_logs` VALUES (187, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:51:41');
INSERT INTO `user_logs` VALUES (188, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:51:41');
INSERT INTO `user_logs` VALUES (189, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:51:59');
INSERT INTO `user_logs` VALUES (190, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:51:59');
INSERT INTO `user_logs` VALUES (191, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 04:58:00');
INSERT INTO `user_logs` VALUES (192, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 04:58:04');
INSERT INTO `user_logs` VALUES (193, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 04:58:12');
INSERT INTO `user_logs` VALUES (194, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 04:58:12');
INSERT INTO `user_logs` VALUES (195, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 05:01:22');
INSERT INTO `user_logs` VALUES (196, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 05:01:25');
INSERT INTO `user_logs` VALUES (197, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 05:01:28');
INSERT INTO `user_logs` VALUES (198, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 05:01:33');
INSERT INTO `user_logs` VALUES (199, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 05:01:33');
INSERT INTO `user_logs` VALUES (200, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 05:06:56');
INSERT INTO `user_logs` VALUES (201, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 05:06:56');
INSERT INTO `user_logs` VALUES (202, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 05:07:18');
INSERT INTO `user_logs` VALUES (203, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 05:10:02');
INSERT INTO `user_logs` VALUES (204, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 05:12:17');
INSERT INTO `user_logs` VALUES (205, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 06:24:03');
INSERT INTO `user_logs` VALUES (206, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 06:25:02');
INSERT INTO `user_logs` VALUES (207, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 06:28:08');
INSERT INTO `user_logs` VALUES (208, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 06:28:12');
INSERT INTO `user_logs` VALUES (209, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 06:28:18');
INSERT INTO `user_logs` VALUES (210, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-19 06:28:18');
INSERT INTO `user_logs` VALUES (211, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:29:12');
INSERT INTO `user_logs` VALUES (212, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:31:20');
INSERT INTO `user_logs` VALUES (213, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:31:21');
INSERT INTO `user_logs` VALUES (214, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:32:17');
INSERT INTO `user_logs` VALUES (215, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:32:18');
INSERT INTO `user_logs` VALUES (216, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:32:51');
INSERT INTO `user_logs` VALUES (217, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:32:51');
INSERT INTO `user_logs` VALUES (218, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:34:12');
INSERT INTO `user_logs` VALUES (219, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:34:12');
INSERT INTO `user_logs` VALUES (220, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:35:08');
INSERT INTO `user_logs` VALUES (221, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:35:08');
INSERT INTO `user_logs` VALUES (222, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:35:24');
INSERT INTO `user_logs` VALUES (223, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:35:24');
INSERT INTO `user_logs` VALUES (224, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:39:10');
INSERT INTO `user_logs` VALUES (225, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:39:10');
INSERT INTO `user_logs` VALUES (226, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:47:23');
INSERT INTO `user_logs` VALUES (227, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 06:47:23');
INSERT INTO `user_logs` VALUES (228, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 06:50:09');
INSERT INTO `user_logs` VALUES (229, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-19 06:50:13');
INSERT INTO `user_logs` VALUES (230, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita/tambah', '2023-06-19 06:52:40');
INSERT INTO `user_logs` VALUES (231, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-19 06:54:07');
INSERT INTO `user_logs` VALUES (232, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client/delete/2', '2023-06-19 06:54:12');
INSERT INTO `user_logs` VALUES (233, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-19 06:54:12');
INSERT INTO `user_logs` VALUES (234, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client/delete/3', '2023-06-19 06:54:15');
INSERT INTO `user_logs` VALUES (235, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-19 06:54:15');
INSERT INTO `user_logs` VALUES (236, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client/delete/5', '2023-06-19 06:54:18');
INSERT INTO `user_logs` VALUES (237, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-19 06:54:18');
INSERT INTO `user_logs` VALUES (238, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user', '2023-06-19 06:55:17');
INSERT INTO `user_logs` VALUES (239, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-19 06:55:38');
INSERT INTO `user_logs` VALUES (240, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-19 06:56:19');
INSERT INTO `user_logs` VALUES (241, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-19 06:56:20');
INSERT INTO `user_logs` VALUES (242, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video/edit/4', '2023-06-19 06:57:30');
INSERT INTO `user_logs` VALUES (243, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video/edit/4', '2023-06-19 06:57:34');
INSERT INTO `user_logs` VALUES (244, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-19 06:57:34');
INSERT INTO `user_logs` VALUES (245, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-19 06:57:54');
INSERT INTO `user_logs` VALUES (246, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-19 07:00:19');
INSERT INTO `user_logs` VALUES (247, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-19 07:01:59');
INSERT INTO `user_logs` VALUES (248, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video/edit/4', '2023-06-19 07:02:01');
INSERT INTO `user_logs` VALUES (249, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video/edit/4', '2023-06-19 07:02:07');
INSERT INTO `user_logs` VALUES (250, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-19 07:02:07');
INSERT INTO `user_logs` VALUES (251, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-19 07:02:40');
INSERT INTO `user_logs` VALUES (252, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-19 07:02:40');
INSERT INTO `user_logs` VALUES (253, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/video', '2023-06-19 07:02:43');
INSERT INTO `user_logs` VALUES (254, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 07:04:30');
INSERT INTO `user_logs` VALUES (255, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/berita', '2023-06-19 07:08:22');
INSERT INTO `user_logs` VALUES (256, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/kategori_staff', '2023-06-19 07:08:25');
INSERT INTO `user_logs` VALUES (257, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/panduan', '2023-06-19 07:08:46');
INSERT INTO `user_logs` VALUES (258, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/client', '2023-06-19 07:08:55');
INSERT INTO `user_logs` VALUES (259, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 07:09:32');
INSERT INTO `user_logs` VALUES (260, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri', '2023-06-19 07:12:23');
INSERT INTO `user_logs` VALUES (261, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/galeri/tambah', '2023-06-19 07:12:35');
INSERT INTO `user_logs` VALUES (262, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/download', '2023-06-19 07:14:18');
INSERT INTO `user_logs` VALUES (263, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user', '2023-06-19 07:27:37');
INSERT INTO `user_logs` VALUES (264, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user/edit/1', '2023-06-19 07:27:46');
INSERT INTO `user_logs` VALUES (265, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user/edit/1', '2023-06-19 07:27:52');
INSERT INTO `user_logs` VALUES (266, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/user', '2023-06-19 07:27:52');
INSERT INTO `user_logs` VALUES (267, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:28:08');
INSERT INTO `user_logs` VALUES (268, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-19 07:28:11');
INSERT INTO `user_logs` VALUES (269, 1, '::1', 'javawebmedia', 'https://localhost/blog/admin/akun', '2023-06-19 07:28:46');
INSERT INTO `user_logs` VALUES (270, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:28:57');
INSERT INTO `user_logs` VALUES (271, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:29:59');
INSERT INTO `user_logs` VALUES (272, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:30:44');
INSERT INTO `user_logs` VALUES (273, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:30:46');
INSERT INTO `user_logs` VALUES (274, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:30:47');
INSERT INTO `user_logs` VALUES (275, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:30:48');
INSERT INTO `user_logs` VALUES (276, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:30:48');
INSERT INTO `user_logs` VALUES (277, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:30:48');
INSERT INTO `user_logs` VALUES (278, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:31:16');
INSERT INTO `user_logs` VALUES (279, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:31:18');
INSERT INTO `user_logs` VALUES (280, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:32:19');
INSERT INTO `user_logs` VALUES (281, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:40:50');
INSERT INTO `user_logs` VALUES (282, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:40:59');
INSERT INTO `user_logs` VALUES (283, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:41:38');
INSERT INTO `user_logs` VALUES (284, 1, '::1', 'admin', 'https://localhost/blog/admin/akun', '2023-06-19 07:41:41');
INSERT INTO `user_logs` VALUES (285, 1, '::1', 'admin', 'https://localhost/blog/admin/panduan', '2023-06-19 07:41:47');
INSERT INTO `user_logs` VALUES (286, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:41:48');
INSERT INTO `user_logs` VALUES (287, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:42:00');
INSERT INTO `user_logs` VALUES (288, 1, '::1', 'admin', 'https://localhost/blog/admin/user', '2023-06-19 07:42:24');
INSERT INTO `user_logs` VALUES (289, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:50:33');
INSERT INTO `user_logs` VALUES (290, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 07:51:52');
INSERT INTO `user_logs` VALUES (291, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 07:51:57');
INSERT INTO `user_logs` VALUES (292, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-19 07:51:57');
INSERT INTO `user_logs` VALUES (293, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:52:39');
INSERT INTO `user_logs` VALUES (294, 1, '::1', 'admin', 'https://localhost/blog/admin/staff', '2023-06-19 07:53:22');
INSERT INTO `user_logs` VALUES (295, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:54:17');
INSERT INTO `user_logs` VALUES (296, 1, '::1', 'admin', 'https://localhost/blog/admin/staff', '2023-06-19 07:54:20');
INSERT INTO `user_logs` VALUES (297, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:54:22');
INSERT INTO `user_logs` VALUES (298, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:54:27');
INSERT INTO `user_logs` VALUES (299, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:54:40');
INSERT INTO `user_logs` VALUES (300, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-19 07:56:16');
INSERT INTO `user_logs` VALUES (301, 1, '::1', 'admin', 'https://localhost/blog/admin/user', '2023-06-19 07:56:19');
INSERT INTO `user_logs` VALUES (302, 1, '::1', 'admin', 'https://localhost/blog/admin/user', '2023-06-19 07:57:10');
INSERT INTO `user_logs` VALUES (303, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi/seo', '2023-06-19 07:59:35');
INSERT INTO `user_logs` VALUES (304, 1, '::1', 'admin', 'https://localhost/blog/admin/user', '2023-06-19 08:03:24');
INSERT INTO `user_logs` VALUES (305, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-20 03:28:01');
INSERT INTO `user_logs` VALUES (306, 1, '::1', 'admin', 'https://localhost/blog/admin/client', '2023-06-20 03:28:09');
INSERT INTO `user_logs` VALUES (307, 1, '::1', 'admin', 'https://localhost/blog/admin/client', '2023-06-20 03:29:03');
INSERT INTO `user_logs` VALUES (308, 1, '::1', 'admin', 'https://localhost/blog/admin/client', '2023-06-20 03:29:03');
INSERT INTO `user_logs` VALUES (309, 1, '::1', 'admin', 'https://localhost/blog/admin/client/delete/6', '2023-06-20 03:31:26');
INSERT INTO `user_logs` VALUES (310, 1, '::1', 'admin', 'https://localhost/blog/admin/client', '2023-06-20 03:31:26');
INSERT INTO `user_logs` VALUES (311, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-20 04:31:20');
INSERT INTO `user_logs` VALUES (312, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/tambah', '2023-06-20 04:31:22');
INSERT INTO `user_logs` VALUES (313, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/tambah', '2023-06-20 04:31:38');
INSERT INTO `user_logs` VALUES (314, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-20 04:31:38');
INSERT INTO `user_logs` VALUES (315, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/tambah', '2023-06-20 04:31:58');
INSERT INTO `user_logs` VALUES (316, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/tambah', '2023-06-20 04:32:13');
INSERT INTO `user_logs` VALUES (317, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-20 04:32:13');
INSERT INTO `user_logs` VALUES (318, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/tambah', '2023-06-20 04:32:28');
INSERT INTO `user_logs` VALUES (319, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/tambah', '2023-06-20 04:32:35');
INSERT INTO `user_logs` VALUES (320, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-20 04:32:35');
INSERT INTO `user_logs` VALUES (321, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-20 05:39:17');
INSERT INTO `user_logs` VALUES (322, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-20 05:39:25');
INSERT INTO `user_logs` VALUES (323, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-20 05:39:36');
INSERT INTO `user_logs` VALUES (324, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-20 05:39:36');
INSERT INTO `user_logs` VALUES (325, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-20 05:40:30');
INSERT INTO `user_logs` VALUES (326, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-20 05:40:30');
INSERT INTO `user_logs` VALUES (327, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-20 05:41:35');
INSERT INTO `user_logs` VALUES (328, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-20 05:41:35');
INSERT INTO `user_logs` VALUES (329, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-20 05:42:17');
INSERT INTO `user_logs` VALUES (330, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-20 05:42:17');
INSERT INTO `user_logs` VALUES (331, 1, '::1', 'admin', 'https://localhost/blog/admin/berita', '2023-06-20 05:42:38');
INSERT INTO `user_logs` VALUES (332, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/tambah', '2023-06-20 05:42:45');
INSERT INTO `user_logs` VALUES (333, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-20 05:42:52');
INSERT INTO `user_logs` VALUES (334, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-20 05:43:09');
INSERT INTO `user_logs` VALUES (335, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-20 07:02:21');
INSERT INTO `user_logs` VALUES (336, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-20 07:02:24');
INSERT INTO `user_logs` VALUES (337, 1, '::1', 'admin', 'https://localhost/blog/admin/user', '2023-06-20 07:07:50');
INSERT INTO `user_logs` VALUES (338, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-20 07:32:09');
INSERT INTO `user_logs` VALUES (339, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-20 08:10:12');
INSERT INTO `user_logs` VALUES (340, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-20 08:10:20');
INSERT INTO `user_logs` VALUES (341, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/edit/5', '2023-06-20 08:10:22');
INSERT INTO `user_logs` VALUES (342, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/edit/5', '2023-06-20 08:10:28');
INSERT INTO `user_logs` VALUES (343, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-20 08:10:28');
INSERT INTO `user_logs` VALUES (344, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/edit/5', '2023-06-20 08:10:46');
INSERT INTO `user_logs` VALUES (345, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/edit/5', '2023-06-20 08:10:56');
INSERT INTO `user_logs` VALUES (346, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/edit/5', '2023-06-20 08:11:06');
INSERT INTO `user_logs` VALUES (347, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-20 08:11:06');
INSERT INTO `user_logs` VALUES (348, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri/tambah', '2023-06-20 08:12:05');
INSERT INTO `user_logs` VALUES (349, 1, '::1', 'admin', 'https://localhost/blog/admin/kategori_galeri', '2023-06-20 08:12:11');
INSERT INTO `user_logs` VALUES (350, 1, '::1', 'admin', 'https://localhost/blog/admin/kategori_galeri/delete/6', '2023-06-20 08:12:19');
INSERT INTO `user_logs` VALUES (351, 1, '::1', 'admin', 'https://localhost/blog/admin/kategori_galeri', '2023-06-20 08:12:19');
INSERT INTO `user_logs` VALUES (352, 1, '::1', 'admin', 'https://localhost/blog/admin/galeri', '2023-06-20 08:12:23');
INSERT INTO `user_logs` VALUES (353, 1, '::1', 'admin', 'https://localhost/blog/admin/berita', '2023-06-20 08:12:26');
INSERT INTO `user_logs` VALUES (354, 1, '::1', 'admin', 'https://localhost/blog/admin/download', '2023-06-20 08:12:42');
INSERT INTO `user_logs` VALUES (355, 1, '::1', 'admin', 'https://localhost/blog/admin/panduan', '2023-06-20 08:12:47');
INSERT INTO `user_logs` VALUES (356, 1, '::1', 'admin', 'https://localhost/blog/admin/panduan', '2023-06-20 08:12:49');
INSERT INTO `user_logs` VALUES (357, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi/seo', '2023-06-20 08:12:58');
INSERT INTO `user_logs` VALUES (358, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi/seo', '2023-06-20 08:13:06');
INSERT INTO `user_logs` VALUES (359, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi/seo', '2023-06-20 08:13:06');
INSERT INTO `user_logs` VALUES (360, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi/icon', '2023-06-20 08:13:10');
INSERT INTO `user_logs` VALUES (361, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi/logo', '2023-06-20 08:13:13');
INSERT INTO `user_logs` VALUES (362, 1, '::1', 'admin', 'https://localhost/blog/admin/konfigurasi', '2023-06-20 08:13:15');
INSERT INTO `user_logs` VALUES (363, 1, '::1', 'admin', 'https://localhost/blog/admin/client', '2023-06-20 08:13:18');
INSERT INTO `user_logs` VALUES (364, 1, '::1', 'admin', 'https://localhost/blog/admin/video', '2023-06-20 08:13:24');
INSERT INTO `user_logs` VALUES (365, 1, '::1', 'admin', 'https://localhost/blog/admin/video', '2023-06-20 08:13:32');
INSERT INTO `user_logs` VALUES (366, 1, '::1', 'admin', 'https://localhost/blog/admin/download', '2023-06-20 08:13:42');
INSERT INTO `user_logs` VALUES (367, 1, '::1', 'admin', 'https://localhost/blog/admin/dasbor', '2023-06-20 08:13:49');
INSERT INTO `user_logs` VALUES (368, 1, '::1', 'admin', 'https://localhost/blog/admin/berita', '2023-06-20 08:14:39');
INSERT INTO `user_logs` VALUES (369, 1, '::1', 'admin', 'https://localhost/blog/admin/berita', '2023-06-20 08:14:57');
INSERT INTO `user_logs` VALUES (370, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/tambah', '2023-06-20 08:14:58');
INSERT INTO `user_logs` VALUES (371, 1, '::1', 'admin', 'https://localhost/blog/admin/staff', '2023-06-20 08:16:35');
INSERT INTO `user_logs` VALUES (372, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/tambah', '2023-06-20 08:16:39');
INSERT INTO `user_logs` VALUES (373, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/tambah', '2023-06-20 08:19:32');
INSERT INTO `user_logs` VALUES (374, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/jenis_berita/Profil', '2023-06-20 08:19:32');
INSERT INTO `user_logs` VALUES (375, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/edit/28', '2023-06-20 08:21:06');
INSERT INTO `user_logs` VALUES (376, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/edit/28', '2023-06-20 08:21:14');
INSERT INTO `user_logs` VALUES (377, 1, '::1', 'admin', 'https://localhost/blog/admin/berita/jenis_berita/Profil', '2023-06-20 08:21:14');
INSERT INTO `user_logs` VALUES (378, 1, '172.225.180.25', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 05:42:43');
INSERT INTO `user_logs` VALUES (379, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 06:25:46');
INSERT INTO `user_logs` VALUES (380, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 06:26:12');
INSERT INTO `user_logs` VALUES (381, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/28', '2023-09-22 06:26:32');
INSERT INTO `user_logs` VALUES (382, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 06:26:49');
INSERT INTO `user_logs` VALUES (383, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 06:27:09');
INSERT INTO `user_logs` VALUES (384, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 06:27:13');
INSERT INTO `user_logs` VALUES (385, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 06:27:20');
INSERT INTO `user_logs` VALUES (386, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 06:27:21');
INSERT INTO `user_logs` VALUES (387, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 06:27:40');
INSERT INTO `user_logs` VALUES (388, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 06:28:01');
INSERT INTO `user_logs` VALUES (389, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 06:28:03');
INSERT INTO `user_logs` VALUES (390, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 06:29:35');
INSERT INTO `user_logs` VALUES (391, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 06:29:45');
INSERT INTO `user_logs` VALUES (392, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 06:33:24');
INSERT INTO `user_logs` VALUES (393, 1, '172.225.72.34', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 07:13:06');
INSERT INTO `user_logs` VALUES (394, 1, '172.225.72.34', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 07:13:21');
INSERT INTO `user_logs` VALUES (395, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 07:13:27');
INSERT INTO `user_logs` VALUES (396, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 07:13:41');
INSERT INTO `user_logs` VALUES (397, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 07:13:45');
INSERT INTO `user_logs` VALUES (398, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/delete/5', '2023-09-22 07:13:49');
INSERT INTO `user_logs` VALUES (399, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 07:13:49');
INSERT INTO `user_logs` VALUES (400, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/delete/4', '2023-09-22 07:13:52');
INSERT INTO `user_logs` VALUES (401, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 07:13:53');
INSERT INTO `user_logs` VALUES (402, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 07:13:56');
INSERT INTO `user_logs` VALUES (403, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/user', '2023-09-22 07:13:58');
INSERT INTO `user_logs` VALUES (404, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi/logo', '2023-09-22 07:14:01');
INSERT INTO `user_logs` VALUES (405, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-22 07:14:06');
INSERT INTO `user_logs` VALUES (406, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-22 07:14:17');
INSERT INTO `user_logs` VALUES (407, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-22 07:14:17');
INSERT INTO `user_logs` VALUES (408, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-22 07:15:33');
INSERT INTO `user_logs` VALUES (409, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-22 07:15:33');
INSERT INTO `user_logs` VALUES (410, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-22 07:15:53');
INSERT INTO `user_logs` VALUES (411, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-22 07:15:53');
INSERT INTO `user_logs` VALUES (412, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 07:16:28');
INSERT INTO `user_logs` VALUES (413, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 07:16:33');
INSERT INTO `user_logs` VALUES (414, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 07:16:51');
INSERT INTO `user_logs` VALUES (415, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/user', '2023-09-22 07:16:53');
INSERT INTO `user_logs` VALUES (416, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi/logo', '2023-09-22 07:16:56');
INSERT INTO `user_logs` VALUES (417, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi/icon', '2023-09-22 07:16:59');
INSERT INTO `user_logs` VALUES (418, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi/icon', '2023-09-22 07:17:08');
INSERT INTO `user_logs` VALUES (419, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi/icon', '2023-09-22 07:17:11');
INSERT INTO `user_logs` VALUES (420, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 07:17:13');
INSERT INTO `user_logs` VALUES (421, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 07:17:20');
INSERT INTO `user_logs` VALUES (422, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/28', '2023-09-22 07:17:26');
INSERT INTO `user_logs` VALUES (423, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/index3.html', '2023-09-22 07:17:35');
INSERT INTO `user_logs` VALUES (424, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 08:06:50');
INSERT INTO `user_logs` VALUES (425, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 08:07:54');
INSERT INTO `user_logs` VALUES (426, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 08:09:30');
INSERT INTO `user_logs` VALUES (427, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 08:09:39');
INSERT INTO `user_logs` VALUES (428, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 08:10:16');
INSERT INTO `user_logs` VALUES (429, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 08:10:23');
INSERT INTO `user_logs` VALUES (430, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 08:14:34');
INSERT INTO `user_logs` VALUES (431, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 08:14:34');
INSERT INTO `user_logs` VALUES (432, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 08:15:03');
INSERT INTO `user_logs` VALUES (433, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 08:15:03');
INSERT INTO `user_logs` VALUES (434, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 08:15:23');
INSERT INTO `user_logs` VALUES (435, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 08:15:23');
INSERT INTO `user_logs` VALUES (436, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download/edit/6', '2023-09-22 08:15:31');
INSERT INTO `user_logs` VALUES (437, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download/edit/6', '2023-09-22 08:15:36');
INSERT INTO `user_logs` VALUES (438, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 08:15:36');
INSERT INTO `user_logs` VALUES (439, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 08:17:21');
INSERT INTO `user_logs` VALUES (440, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 08:17:27');
INSERT INTO `user_logs` VALUES (441, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/user', '2023-09-22 08:17:32');
INSERT INTO `user_logs` VALUES (442, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/user', '2023-09-22 08:17:49');
INSERT INTO `user_logs` VALUES (443, 1, '180.252.197.92', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 08:18:04');
INSERT INTO `user_logs` VALUES (444, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 08:41:39');
INSERT INTO `user_logs` VALUES (445, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 08:41:46');
INSERT INTO `user_logs` VALUES (446, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 08:41:48');
INSERT INTO `user_logs` VALUES (447, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 08:45:37');
INSERT INTO `user_logs` VALUES (448, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Layanan', '2023-09-22 08:45:37');
INSERT INTO `user_logs` VALUES (449, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/29', '2023-09-22 08:45:56');
INSERT INTO `user_logs` VALUES (450, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/29', '2023-09-22 08:46:02');
INSERT INTO `user_logs` VALUES (451, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 08:46:02');
INSERT INTO `user_logs` VALUES (452, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/29', '2023-09-22 08:46:41');
INSERT INTO `user_logs` VALUES (453, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/29', '2023-09-22 08:47:11');
INSERT INTO `user_logs` VALUES (454, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 08:47:12');
INSERT INTO `user_logs` VALUES (455, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 08:49:55');
INSERT INTO `user_logs` VALUES (456, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 08:50:11');
INSERT INTO `user_logs` VALUES (457, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 08:51:51');
INSERT INTO `user_logs` VALUES (458, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 08:51:59');
INSERT INTO `user_logs` VALUES (459, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 08:52:21');
INSERT INTO `user_logs` VALUES (460, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 08:52:33');
INSERT INTO `user_logs` VALUES (461, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 08:53:00');
INSERT INTO `user_logs` VALUES (462, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 08:53:03');
INSERT INTO `user_logs` VALUES (463, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 08:53:19');
INSERT INTO `user_logs` VALUES (464, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 08:53:22');
INSERT INTO `user_logs` VALUES (465, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 08:53:39');
INSERT INTO `user_logs` VALUES (466, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-22 08:53:39');
INSERT INTO `user_logs` VALUES (467, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 08:53:44');
INSERT INTO `user_logs` VALUES (468, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 08:53:45');
INSERT INTO `user_logs` VALUES (469, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 08:54:52');
INSERT INTO `user_logs` VALUES (470, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 08:58:12');
INSERT INTO `user_logs` VALUES (471, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 09:02:11');
INSERT INTO `user_logs` VALUES (472, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 09:02:11');
INSERT INTO `user_logs` VALUES (473, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/1', '2023-09-22 09:02:57');
INSERT INTO `user_logs` VALUES (474, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-22 09:03:14');
INSERT INTO `user_logs` VALUES (475, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-22 09:03:42');
INSERT INTO `user_logs` VALUES (476, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-22 09:05:32');
INSERT INTO `user_logs` VALUES (477, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-22 09:07:21');
INSERT INTO `user_logs` VALUES (478, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-22 09:07:59');
INSERT INTO `user_logs` VALUES (479, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:10:13');
INSERT INTO `user_logs` VALUES (480, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:11:24');
INSERT INTO `user_logs` VALUES (481, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:11:25');
INSERT INTO `user_logs` VALUES (482, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:11:43');
INSERT INTO `user_logs` VALUES (483, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:11:43');
INSERT INTO `user_logs` VALUES (484, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:12:31');
INSERT INTO `user_logs` VALUES (485, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 09:12:43');
INSERT INTO `user_logs` VALUES (486, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 09:13:10');
INSERT INTO `user_logs` VALUES (487, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:13:10');
INSERT INTO `user_logs` VALUES (488, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 09:13:30');
INSERT INTO `user_logs` VALUES (489, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 09:13:39');
INSERT INTO `user_logs` VALUES (490, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:13:39');
INSERT INTO `user_logs` VALUES (491, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 09:13:44');
INSERT INTO `user_logs` VALUES (492, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 09:13:50');
INSERT INTO `user_logs` VALUES (493, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:13:51');
INSERT INTO `user_logs` VALUES (494, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 09:13:56');
INSERT INTO `user_logs` VALUES (495, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 09:14:17');
INSERT INTO `user_logs` VALUES (496, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:14:18');
INSERT INTO `user_logs` VALUES (497, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_galeri', '2023-09-22 09:15:39');
INSERT INTO `user_logs` VALUES (498, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_galeri', '2023-09-22 09:16:03');
INSERT INTO `user_logs` VALUES (499, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_galeri', '2023-09-22 09:16:03');
INSERT INTO `user_logs` VALUES (500, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 09:16:07');
INSERT INTO `user_logs` VALUES (501, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 09:16:41');
INSERT INTO `user_logs` VALUES (502, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:16:42');
INSERT INTO `user_logs` VALUES (503, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 09:16:58');
INSERT INTO `user_logs` VALUES (504, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/17', '2023-09-22 09:17:00');
INSERT INTO `user_logs` VALUES (505, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:17:00');
INSERT INTO `user_logs` VALUES (506, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 09:17:05');
INSERT INTO `user_logs` VALUES (507, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 09:17:09');
INSERT INTO `user_logs` VALUES (508, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-22 09:17:24');
INSERT INTO `user_logs` VALUES (509, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 09:17:28');
INSERT INTO `user_logs` VALUES (510, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:17:28');
INSERT INTO `user_logs` VALUES (511, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/18', '2023-09-22 09:17:37');
INSERT INTO `user_logs` VALUES (512, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-22 09:17:38');
INSERT INTO `user_logs` VALUES (513, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/18', '2023-09-22 09:17:40');
INSERT INTO `user_logs` VALUES (514, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:17:41');
INSERT INTO `user_logs` VALUES (515, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:17:50');
INSERT INTO `user_logs` VALUES (516, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/18', '2023-09-22 09:17:50');
INSERT INTO `user_logs` VALUES (517, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:17:51');
INSERT INTO `user_logs` VALUES (518, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 09:17:53');
INSERT INTO `user_logs` VALUES (519, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:18:01');
INSERT INTO `user_logs` VALUES (520, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 09:18:16');
INSERT INTO `user_logs` VALUES (521, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:18:16');
INSERT INTO `user_logs` VALUES (522, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 09:18:21');
INSERT INTO `user_logs` VALUES (523, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:18:45');
INSERT INTO `user_logs` VALUES (524, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 09:18:50');
INSERT INTO `user_logs` VALUES (525, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 09:19:51');
INSERT INTO `user_logs` VALUES (526, 1, '172.225.72.59', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:19:51');
INSERT INTO `user_logs` VALUES (527, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 09:22:17');
INSERT INTO `user_logs` VALUES (528, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 09:22:44');
INSERT INTO `user_logs` VALUES (529, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 09:22:48');
INSERT INTO `user_logs` VALUES (530, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:22:50');
INSERT INTO `user_logs` VALUES (531, 1, '172.225.78.200', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 09:23:20');
INSERT INTO `user_logs` VALUES (532, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:23:22');
INSERT INTO `user_logs` VALUES (533, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:23:22');
INSERT INTO `user_logs` VALUES (534, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:23:31');
INSERT INTO `user_logs` VALUES (535, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:23:35');
INSERT INTO `user_logs` VALUES (536, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:24:17');
INSERT INTO `user_logs` VALUES (537, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/7', '2023-09-22 09:24:23');
INSERT INTO `user_logs` VALUES (538, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/7', '2023-09-22 09:24:32');
INSERT INTO `user_logs` VALUES (539, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:24:32');
INSERT INTO `user_logs` VALUES (540, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/7', '2023-09-22 09:24:40');
INSERT INTO `user_logs` VALUES (541, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:24:46');
INSERT INTO `user_logs` VALUES (542, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 09:25:43');
INSERT INTO `user_logs` VALUES (543, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:27:03');
INSERT INTO `user_logs` VALUES (544, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:27:03');
INSERT INTO `user_logs` VALUES (545, 1, '172.225.72.21', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-22 09:27:06');
INSERT INTO `user_logs` VALUES (546, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 09:27:19');
INSERT INTO `user_logs` VALUES (547, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:27:22');
INSERT INTO `user_logs` VALUES (548, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 09:27:27');
INSERT INTO `user_logs` VALUES (549, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video/edit/6', '2023-09-22 09:27:34');
INSERT INTO `user_logs` VALUES (550, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/video', '2023-09-22 09:27:34');
INSERT INTO `user_logs` VALUES (551, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 09:28:11');
INSERT INTO `user_logs` VALUES (552, 1, '172.225.72.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:30:33');
INSERT INTO `user_logs` VALUES (553, 1, '172.225.72.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 09:30:41');
INSERT INTO `user_logs` VALUES (554, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:30:45');
INSERT INTO `user_logs` VALUES (555, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:31:29');
INSERT INTO `user_logs` VALUES (556, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 09:32:08');
INSERT INTO `user_logs` VALUES (557, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:32:17');
INSERT INTO `user_logs` VALUES (558, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 09:32:21');
INSERT INTO `user_logs` VALUES (559, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:32:26');
INSERT INTO `user_logs` VALUES (560, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 09:32:36');
INSERT INTO `user_logs` VALUES (561, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 09:33:00');
INSERT INTO `user_logs` VALUES (562, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:33:00');
INSERT INTO `user_logs` VALUES (563, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_galeri', '2023-09-22 09:33:20');
INSERT INTO `user_logs` VALUES (564, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 09:33:40');
INSERT INTO `user_logs` VALUES (565, 1, '172.225.72.0', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:33:41');
INSERT INTO `user_logs` VALUES (566, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 09:33:43');
INSERT INTO `user_logs` VALUES (567, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:33:43');
INSERT INTO `user_logs` VALUES (568, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 09:34:58');
INSERT INTO `user_logs` VALUES (569, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 09:37:44');
INSERT INTO `user_logs` VALUES (570, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:37:48');
INSERT INTO `user_logs` VALUES (571, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 09:37:52');
INSERT INTO `user_logs` VALUES (572, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 09:38:18');
INSERT INTO `user_logs` VALUES (573, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:38:18');
INSERT INTO `user_logs` VALUES (574, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/20', '2023-09-22 09:38:43');
INSERT INTO `user_logs` VALUES (575, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:38:43');
INSERT INTO `user_logs` VALUES (576, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 09:38:55');
INSERT INTO `user_logs` VALUES (577, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 09:39:00');
INSERT INTO `user_logs` VALUES (578, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 09:39:06');
INSERT INTO `user_logs` VALUES (579, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 09:39:31');
INSERT INTO `user_logs` VALUES (580, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:39:31');
INSERT INTO `user_logs` VALUES (581, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 09:39:42');
INSERT INTO `user_logs` VALUES (582, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-22 09:42:11');
INSERT INTO `user_logs` VALUES (583, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 09:43:01');
INSERT INTO `user_logs` VALUES (584, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:43:01');
INSERT INTO `user_logs` VALUES (585, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 09:43:19');
INSERT INTO `user_logs` VALUES (586, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 09:43:26');
INSERT INTO `user_logs` VALUES (587, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:43:26');
INSERT INTO `user_logs` VALUES (588, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 09:43:39');
INSERT INTO `user_logs` VALUES (589, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 09:43:41');
INSERT INTO `user_logs` VALUES (590, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 09:43:43');
INSERT INTO `user_logs` VALUES (591, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:43:43');
INSERT INTO `user_logs` VALUES (592, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:43:56');
INSERT INTO `user_logs` VALUES (593, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/5', '2023-09-22 09:44:05');
INSERT INTO `user_logs` VALUES (594, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:44:06');
INSERT INTO `user_logs` VALUES (595, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/14', '2023-09-22 09:44:11');
INSERT INTO `user_logs` VALUES (596, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:44:11');
INSERT INTO `user_logs` VALUES (597, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/15', '2023-09-22 09:44:17');
INSERT INTO `user_logs` VALUES (598, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:44:18');
INSERT INTO `user_logs` VALUES (599, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/16', '2023-09-22 09:44:23');
INSERT INTO `user_logs` VALUES (600, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:44:23');
INSERT INTO `user_logs` VALUES (601, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 09:44:36');
INSERT INTO `user_logs` VALUES (602, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 09:44:44');
INSERT INTO `user_logs` VALUES (603, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:44:45');
INSERT INTO `user_logs` VALUES (604, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/5', '2023-09-22 09:45:23');
INSERT INTO `user_logs` VALUES (605, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:45:26');
INSERT INTO `user_logs` VALUES (606, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:45:28');
INSERT INTO `user_logs` VALUES (607, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:45:33');
INSERT INTO `user_logs` VALUES (608, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 09:45:43');
INSERT INTO `user_logs` VALUES (609, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 09:45:53');
INSERT INTO `user_logs` VALUES (610, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 09:45:53');
INSERT INTO `user_logs` VALUES (611, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:45:53');
INSERT INTO `user_logs` VALUES (612, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 09:45:59');
INSERT INTO `user_logs` VALUES (613, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:45:59');
INSERT INTO `user_logs` VALUES (614, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 09:46:01');
INSERT INTO `user_logs` VALUES (615, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/19', '2023-09-22 09:46:05');
INSERT INTO `user_logs` VALUES (616, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:46:05');
INSERT INTO `user_logs` VALUES (617, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 09:46:08');
INSERT INTO `user_logs` VALUES (618, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 09:46:09');
INSERT INTO `user_logs` VALUES (619, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:46:09');
INSERT INTO `user_logs` VALUES (620, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:46:12');
INSERT INTO `user_logs` VALUES (621, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 09:46:19');
INSERT INTO `user_logs` VALUES (622, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 09:46:26');
INSERT INTO `user_logs` VALUES (623, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:46:26');
INSERT INTO `user_logs` VALUES (624, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 09:46:28');
INSERT INTO `user_logs` VALUES (625, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 09:46:35');
INSERT INTO `user_logs` VALUES (626, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:46:35');
INSERT INTO `user_logs` VALUES (627, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 09:46:49');
INSERT INTO `user_logs` VALUES (628, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/21', '2023-09-22 09:46:54');
INSERT INTO `user_logs` VALUES (629, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:46:54');
INSERT INTO `user_logs` VALUES (630, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:47:07');
INSERT INTO `user_logs` VALUES (631, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:47:11');
INSERT INTO `user_logs` VALUES (632, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 09:47:15');
INSERT INTO `user_logs` VALUES (633, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_galeri', '2023-09-22 09:47:19');
INSERT INTO `user_logs` VALUES (634, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:47:40');
INSERT INTO `user_logs` VALUES (635, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/delete/19', '2023-09-22 09:47:48');
INSERT INTO `user_logs` VALUES (636, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:47:48');
INSERT INTO `user_logs` VALUES (637, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-09-22 09:48:12');
INSERT INTO `user_logs` VALUES (638, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 09:48:18');
INSERT INTO `user_logs` VALUES (639, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 09:48:18');
INSERT INTO `user_logs` VALUES (640, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 09:48:20');
INSERT INTO `user_logs` VALUES (641, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:48:24');
INSERT INTO `user_logs` VALUES (642, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:48:28');
INSERT INTO `user_logs` VALUES (643, 1, '172.225.72.63', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:48:31');
INSERT INTO `user_logs` VALUES (644, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 09:49:50');
INSERT INTO `user_logs` VALUES (645, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 09:51:04');
INSERT INTO `user_logs` VALUES (646, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 09:51:05');
INSERT INTO `user_logs` VALUES (647, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-22 09:51:35');
INSERT INTO `user_logs` VALUES (648, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 09:51:44');
INSERT INTO `user_logs` VALUES (649, 1, '172.225.180.16', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/user', '2023-09-22 09:52:06');
INSERT INTO `user_logs` VALUES (650, 1, '172.225.78.192', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 09:52:10');
INSERT INTO `user_logs` VALUES (651, 1, '172.225.78.192', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 09:52:27');
INSERT INTO `user_logs` VALUES (652, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 09:53:36');
INSERT INTO `user_logs` VALUES (653, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori', '2023-09-22 09:53:40');
INSERT INTO `user_logs` VALUES (654, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-09-22 09:54:15');
INSERT INTO `user_logs` VALUES (655, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 09:54:24');
INSERT INTO `user_logs` VALUES (656, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 09:55:20');
INSERT INTO `user_logs` VALUES (657, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-22 09:55:25');
INSERT INTO `user_logs` VALUES (658, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/30', '2023-09-22 09:55:29');
INSERT INTO `user_logs` VALUES (659, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/30', '2023-09-22 09:55:33');
INSERT INTO `user_logs` VALUES (660, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Layanan', '2023-09-22 09:55:33');
INSERT INTO `user_logs` VALUES (661, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/30', '2023-09-22 09:55:54');
INSERT INTO `user_logs` VALUES (662, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/30', '2023-09-22 09:55:59');
INSERT INTO `user_logs` VALUES (663, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 09:55:59');
INSERT INTO `user_logs` VALUES (664, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 09:57:35');
INSERT INTO `user_logs` VALUES (665, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 09:58:14');
INSERT INTO `user_logs` VALUES (666, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 09:58:17');
INSERT INTO `user_logs` VALUES (667, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-09-22 10:02:28');
INSERT INTO `user_logs` VALUES (668, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 10:02:28');
INSERT INTO `user_logs` VALUES (669, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/31', '2023-09-22 10:02:44');
INSERT INTO `user_logs` VALUES (670, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/31', '2023-09-22 10:02:52');
INSERT INTO `user_logs` VALUES (671, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 10:02:52');
INSERT INTO `user_logs` VALUES (672, 1, '180.252.201.230', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-09-22 10:05:51');
INSERT INTO `user_logs` VALUES (673, 1, '172.225.72.50', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 10:13:51');
INSERT INTO `user_logs` VALUES (674, 1, '172.225.78.208', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 10:23:53');
INSERT INTO `user_logs` VALUES (675, 1, '172.225.78.192', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-22 11:05:28');
INSERT INTO `user_logs` VALUES (676, 1, '140.213.180.163', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-23 03:50:35');
INSERT INTO `user_logs` VALUES (677, 1, '140.213.180.163', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-23 03:50:53');
INSERT INTO `user_logs` VALUES (678, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-26 01:53:32');
INSERT INTO `user_logs` VALUES (679, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-26 01:55:39');
INSERT INTO `user_logs` VALUES (680, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-26 01:55:52');
INSERT INTO `user_logs` VALUES (681, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 01:55:58');
INSERT INTO `user_logs` VALUES (682, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-26 01:56:05');
INSERT INTO `user_logs` VALUES (683, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 01:57:05');
INSERT INTO `user_logs` VALUES (684, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-26 02:06:26');
INSERT INTO `user_logs` VALUES (685, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download/delete/6', '2023-09-26 02:06:45');
INSERT INTO `user_logs` VALUES (686, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-26 02:06:45');
INSERT INTO `user_logs` VALUES (687, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download/delete/5', '2023-09-26 02:06:51');
INSERT INTO `user_logs` VALUES (688, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-26 02:06:51');
INSERT INTO `user_logs` VALUES (689, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download/delete/4', '2023-09-26 02:06:57');
INSERT INTO `user_logs` VALUES (690, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-26 02:06:57');
INSERT INTO `user_logs` VALUES (691, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-26 02:07:32');
INSERT INTO `user_logs` VALUES (692, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-09-26 02:07:33');
INSERT INTO `user_logs` VALUES (693, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:07:40');
INSERT INTO `user_logs` VALUES (694, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:09:48');
INSERT INTO `user_logs` VALUES (695, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:11:19');
INSERT INTO `user_logs` VALUES (696, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:11:36');
INSERT INTO `user_logs` VALUES (697, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-26 02:11:40');
INSERT INTO `user_logs` VALUES (698, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:12:03');
INSERT INTO `user_logs` VALUES (699, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:13:37');
INSERT INTO `user_logs` VALUES (700, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:13:43');
INSERT INTO `user_logs` VALUES (701, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:14:30');
INSERT INTO `user_logs` VALUES (702, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:14:37');
INSERT INTO `user_logs` VALUES (703, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:15:00');
INSERT INTO `user_logs` VALUES (704, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-26 02:23:04');
INSERT INTO `user_logs` VALUES (705, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:23:25');
INSERT INTO `user_logs` VALUES (706, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:24:01');
INSERT INTO `user_logs` VALUES (707, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-26 02:25:44');
INSERT INTO `user_logs` VALUES (708, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:25:51');
INSERT INTO `user_logs` VALUES (709, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:26:25');
INSERT INTO `user_logs` VALUES (710, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:27:07');
INSERT INTO `user_logs` VALUES (711, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-26 02:27:19');
INSERT INTO `user_logs` VALUES (712, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-26 02:27:36');
INSERT INTO `user_logs` VALUES (713, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:27:47');
INSERT INTO `user_logs` VALUES (714, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:29:27');
INSERT INTO `user_logs` VALUES (715, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-26 02:29:42');
INSERT INTO `user_logs` VALUES (716, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/1', '2023-09-26 02:29:48');
INSERT INTO `user_logs` VALUES (717, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-09-26 02:30:35');
INSERT INTO `user_logs` VALUES (718, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/1', '2023-09-26 02:30:36');
INSERT INTO `user_logs` VALUES (719, 1, '180.252.206.205', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-09-26 02:38:19');
INSERT INTO `user_logs` VALUES (720, 1, '146.75.160.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-26 03:37:14');
INSERT INTO `user_logs` VALUES (721, 1, '146.75.160.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-26 03:37:21');
INSERT INTO `user_logs` VALUES (722, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-09-26 03:37:25');
INSERT INTO `user_logs` VALUES (723, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/user', '2023-09-26 03:37:42');
INSERT INTO `user_logs` VALUES (724, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-26 03:37:46');
INSERT INTO `user_logs` VALUES (725, 1, '146.75.160.28', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-26 15:07:18');
INSERT INTO `user_logs` VALUES (726, 1, '146.75.160.28', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-26 15:07:31');
INSERT INTO `user_logs` VALUES (727, 1, '146.75.160.28', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-09-26 15:07:51');
INSERT INTO `user_logs` VALUES (728, 1, '172.225.180.25', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-29 09:46:22');
INSERT INTO `user_logs` VALUES (729, 1, '172.225.180.25', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/konfigurasi', '2023-09-29 09:46:39');
INSERT INTO `user_logs` VALUES (730, 1, '172.225.180.25', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-09-29 09:47:39');
INSERT INTO `user_logs` VALUES (731, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-03 03:25:32');
INSERT INTO `user_logs` VALUES (732, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-03 03:25:38');
INSERT INTO `user_logs` VALUES (733, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/1', '2023-10-03 03:25:40');
INSERT INTO `user_logs` VALUES (734, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-03 03:25:45');
INSERT INTO `user_logs` VALUES (735, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-03 03:26:21');
INSERT INTO `user_logs` VALUES (736, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-03 03:26:21');
INSERT INTO `user_logs` VALUES (737, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/2', '2023-10-03 03:26:25');
INSERT INTO `user_logs` VALUES (738, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/2', '2023-10-03 03:26:26');
INSERT INTO `user_logs` VALUES (739, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-03 03:27:18');
INSERT INTO `user_logs` VALUES (740, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-03 03:27:25');
INSERT INTO `user_logs` VALUES (741, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-03 03:27:40');
INSERT INTO `user_logs` VALUES (742, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_galeri', '2023-10-03 03:35:21');
INSERT INTO `user_logs` VALUES (743, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-03 03:35:25');
INSERT INTO `user_logs` VALUES (744, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download/delete/2', '2023-10-03 03:35:30');
INSERT INTO `user_logs` VALUES (745, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-03 03:35:30');
INSERT INTO `user_logs` VALUES (746, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download/delete/1', '2023-10-03 03:35:36');
INSERT INTO `user_logs` VALUES (747, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-03 03:35:36');
INSERT INTO `user_logs` VALUES (748, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-03 03:35:44');
INSERT INTO `user_logs` VALUES (749, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-03 03:36:10');
INSERT INTO `user_logs` VALUES (750, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-03 03:37:57');
INSERT INTO `user_logs` VALUES (751, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-03 03:38:12');
INSERT INTO `user_logs` VALUES (752, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-03 03:38:20');
INSERT INTO `user_logs` VALUES (753, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-03 03:38:20');
INSERT INTO `user_logs` VALUES (754, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-03 04:49:52');
INSERT INTO `user_logs` VALUES (755, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-03 04:49:54');
INSERT INTO `user_logs` VALUES (756, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-03 05:27:53');
INSERT INTO `user_logs` VALUES (757, 1, '36.72.71.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-03 10:35:00');
INSERT INTO `user_logs` VALUES (758, 1, '36.72.71.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-03 10:35:16');
INSERT INTO `user_logs` VALUES (759, 1, '36.72.71.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/delete/1', '2023-10-03 10:35:48');
INSERT INTO `user_logs` VALUES (760, 1, '36.72.71.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-03 10:35:48');
INSERT INTO `user_logs` VALUES (761, 1, '36.72.71.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-03 10:35:51');
INSERT INTO `user_logs` VALUES (762, 1, '36.72.71.12', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-03 10:36:48');
INSERT INTO `user_logs` VALUES (763, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-05 07:03:09');
INSERT INTO `user_logs` VALUES (764, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 07:03:14');
INSERT INTO `user_logs` VALUES (765, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 07:03:23');
INSERT INTO `user_logs` VALUES (766, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 07:03:47');
INSERT INTO `user_logs` VALUES (767, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-05 07:03:50');
INSERT INTO `user_logs` VALUES (768, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-05 07:04:04');
INSERT INTO `user_logs` VALUES (769, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-05 07:04:04');
INSERT INTO `user_logs` VALUES (770, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 07:04:09');
INSERT INTO `user_logs` VALUES (771, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/client', '2023-10-05 07:04:10');
INSERT INTO `user_logs` VALUES (772, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 07:04:11');
INSERT INTO `user_logs` VALUES (773, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 07:04:41');
INSERT INTO `user_logs` VALUES (774, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 07:11:04');
INSERT INTO `user_logs` VALUES (775, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 07:11:08');
INSERT INTO `user_logs` VALUES (776, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-05 07:11:15');
INSERT INTO `user_logs` VALUES (777, 1, '146.75.160.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-05 13:30:17');
INSERT INTO `user_logs` VALUES (778, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-05 13:30:23');
INSERT INTO `user_logs` VALUES (779, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 13:30:25');
INSERT INTO `user_logs` VALUES (780, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 13:30:28');
INSERT INTO `user_logs` VALUES (781, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 13:30:29');
INSERT INTO `user_logs` VALUES (782, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 13:30:32');
INSERT INTO `user_logs` VALUES (783, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 13:31:13');
INSERT INTO `user_logs` VALUES (784, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/delete/2', '2023-10-05 13:31:20');
INSERT INTO `user_logs` VALUES (785, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 13:31:20');
INSERT INTO `user_logs` VALUES (786, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/delete/3', '2023-10-05 13:31:25');
INSERT INTO `user_logs` VALUES (787, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 13:31:25');
INSERT INTO `user_logs` VALUES (788, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 13:31:27');
INSERT INTO `user_logs` VALUES (789, 1, '146.75.160.27', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-05 13:31:33');
INSERT INTO `user_logs` VALUES (790, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 13:32:02');
INSERT INTO `user_logs` VALUES (791, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 13:32:32');
INSERT INTO `user_logs` VALUES (792, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-05 13:33:07');
INSERT INTO `user_logs` VALUES (793, 1, '146.75.160.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-05 13:34:09');
INSERT INTO `user_logs` VALUES (794, 1, '146.75.160.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-05 13:35:24');
INSERT INTO `user_logs` VALUES (795, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-06 07:13:27');
INSERT INTO `user_logs` VALUES (796, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 07:13:33');
INSERT INTO `user_logs` VALUES (797, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 07:13:49');
INSERT INTO `user_logs` VALUES (798, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 07:13:59');
INSERT INTO `user_logs` VALUES (799, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:14:03');
INSERT INTO `user_logs` VALUES (800, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:14:31');
INSERT INTO `user_logs` VALUES (801, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:15:10');
INSERT INTO `user_logs` VALUES (802, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:18:55');
INSERT INTO `user_logs` VALUES (803, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:19:13');
INSERT INTO `user_logs` VALUES (804, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:20:26');
INSERT INTO `user_logs` VALUES (805, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:25:45');
INSERT INTO `user_logs` VALUES (806, 1, '172.225.72.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-06 07:42:33');
INSERT INTO `user_logs` VALUES (807, 1, '172.225.72.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 07:42:40');
INSERT INTO `user_logs` VALUES (808, 1, '172.225.72.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:42:42');
INSERT INTO `user_logs` VALUES (809, 1, '172.225.72.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:44:43');
INSERT INTO `user_logs` VALUES (810, 1, '172.225.72.31', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 07:44:46');
INSERT INTO `user_logs` VALUES (811, 1, '172.225.72.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:44:47');
INSERT INTO `user_logs` VALUES (812, 1, '172.225.72.31', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:44:49');
INSERT INTO `user_logs` VALUES (813, 1, '172.225.72.31', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:46:45');
INSERT INTO `user_logs` VALUES (814, 1, '172.225.72.31', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 07:46:45');
INSERT INTO `user_logs` VALUES (815, 1, '172.225.72.23', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/4', '2023-10-06 07:47:21');
INSERT INTO `user_logs` VALUES (816, 1, '172.225.72.23', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 07:49:07');
INSERT INTO `user_logs` VALUES (817, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:57:23');
INSERT INTO `user_logs` VALUES (818, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:57:41');
INSERT INTO `user_logs` VALUES (819, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:58:19');
INSERT INTO `user_logs` VALUES (820, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:59:34');
INSERT INTO `user_logs` VALUES (821, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 07:59:38');
INSERT INTO `user_logs` VALUES (822, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 07:59:49');
INSERT INTO `user_logs` VALUES (823, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 07:59:56');
INSERT INTO `user_logs` VALUES (824, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:00:12');
INSERT INTO `user_logs` VALUES (825, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:00:12');
INSERT INTO `user_logs` VALUES (826, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:00:27');
INSERT INTO `user_logs` VALUES (827, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:00:40');
INSERT INTO `user_logs` VALUES (828, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:00:41');
INSERT INTO `user_logs` VALUES (829, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/delete/4', '2023-10-06 08:00:53');
INSERT INTO `user_logs` VALUES (830, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:00:53');
INSERT INTO `user_logs` VALUES (831, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:00:57');
INSERT INTO `user_logs` VALUES (832, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:01:10');
INSERT INTO `user_logs` VALUES (833, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:01:17');
INSERT INTO `user_logs` VALUES (834, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:01:19');
INSERT INTO `user_logs` VALUES (835, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:01:38');
INSERT INTO `user_logs` VALUES (836, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:01:43');
INSERT INTO `user_logs` VALUES (837, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:01:45');
INSERT INTO `user_logs` VALUES (838, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:02:45');
INSERT INTO `user_logs` VALUES (839, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:02:47');
INSERT INTO `user_logs` VALUES (840, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/5', '2023-10-06 08:02:56');
INSERT INTO `user_logs` VALUES (841, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/5', '2023-10-06 08:02:57');
INSERT INTO `user_logs` VALUES (842, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:03:03');
INSERT INTO `user_logs` VALUES (843, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:03:07');
INSERT INTO `user_logs` VALUES (844, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:03:07');
INSERT INTO `user_logs` VALUES (845, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:03:27');
INSERT INTO `user_logs` VALUES (846, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:04:03');
INSERT INTO `user_logs` VALUES (847, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:04:49');
INSERT INTO `user_logs` VALUES (848, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-10-06 08:04:49');
INSERT INTO `user_logs` VALUES (849, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:05:18');
INSERT INTO `user_logs` VALUES (850, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:05:20');
INSERT INTO `user_logs` VALUES (851, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:05:44');
INSERT INTO `user_logs` VALUES (852, 1, '172.225.72.37', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:05:50');
INSERT INTO `user_logs` VALUES (853, 1, '172.225.72.37', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:07:19');
INSERT INTO `user_logs` VALUES (854, 1, '172.225.72.37', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:07:20');
INSERT INTO `user_logs` VALUES (855, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:09:05');
INSERT INTO `user_logs` VALUES (856, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:09:27');
INSERT INTO `user_logs` VALUES (857, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:10:04');
INSERT INTO `user_logs` VALUES (858, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:10:26');
INSERT INTO `user_logs` VALUES (859, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:10:32');
INSERT INTO `user_logs` VALUES (860, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:10:45');
INSERT INTO `user_logs` VALUES (861, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:12:30');
INSERT INTO `user_logs` VALUES (862, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:12:46');
INSERT INTO `user_logs` VALUES (863, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:12:51');
INSERT INTO `user_logs` VALUES (864, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:12:56');
INSERT INTO `user_logs` VALUES (865, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:13:02');
INSERT INTO `user_logs` VALUES (866, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:13:29');
INSERT INTO `user_logs` VALUES (867, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:13:56');
INSERT INTO `user_logs` VALUES (868, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:13:57');
INSERT INTO `user_logs` VALUES (869, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:14:01');
INSERT INTO `user_logs` VALUES (870, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/6', '2023-10-06 08:14:01');
INSERT INTO `user_logs` VALUES (871, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/unduh/6', '2023-10-06 08:14:12');
INSERT INTO `user_logs` VALUES (872, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:14:23');
INSERT INTO `user_logs` VALUES (873, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:14:39');
INSERT INTO `user_logs` VALUES (874, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:14:50');
INSERT INTO `user_logs` VALUES (875, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-06 08:14:56');
INSERT INTO `user_logs` VALUES (876, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:14:59');
INSERT INTO `user_logs` VALUES (877, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:15:01');
INSERT INTO `user_logs` VALUES (878, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-06 08:15:38');
INSERT INTO `user_logs` VALUES (879, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:15:51');
INSERT INTO `user_logs` VALUES (880, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:15:58');
INSERT INTO `user_logs` VALUES (881, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:16:20');
INSERT INTO `user_logs` VALUES (882, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:16:25');
INSERT INTO `user_logs` VALUES (883, 1, '182.1.185.107', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:16:47');
INSERT INTO `user_logs` VALUES (884, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:18:39');
INSERT INTO `user_logs` VALUES (885, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:18:55');
INSERT INTO `user_logs` VALUES (886, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-06 08:19:39');
INSERT INTO `user_logs` VALUES (887, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-06 08:19:51');
INSERT INTO `user_logs` VALUES (888, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-06 08:19:53');
INSERT INTO `user_logs` VALUES (889, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:19:58');
INSERT INTO `user_logs` VALUES (890, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:20:29');
INSERT INTO `user_logs` VALUES (891, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:23:09');
INSERT INTO `user_logs` VALUES (892, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-06 08:24:16');
INSERT INTO `user_logs` VALUES (893, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-06 08:24:31');
INSERT INTO `user_logs` VALUES (894, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2023-10-06 08:24:31');
INSERT INTO `user_logs` VALUES (895, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:24:37');
INSERT INTO `user_logs` VALUES (896, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:25:06');
INSERT INTO `user_logs` VALUES (897, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:25:08');
INSERT INTO `user_logs` VALUES (898, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:36:47');
INSERT INTO `user_logs` VALUES (899, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:37:25');
INSERT INTO `user_logs` VALUES (900, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:37:25');
INSERT INTO `user_logs` VALUES (901, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:40:11');
INSERT INTO `user_logs` VALUES (902, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2023-10-06 08:40:27');
INSERT INTO `user_logs` VALUES (903, 1, '125.167.124.39', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:40:27');
INSERT INTO `user_logs` VALUES (904, 1, '172.225.72.49', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 08:59:11');
INSERT INTO `user_logs` VALUES (905, 1, '172.225.72.26', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2023-10-06 09:08:39');
INSERT INTO `user_logs` VALUES (906, 1, '172.225.72.14', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-06 09:25:45');
INSERT INTO `user_logs` VALUES (907, 1, '125.162.213.48', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-13 12:54:56');
INSERT INTO `user_logs` VALUES (908, 1, '125.162.213.48', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-13 12:55:36');
INSERT INTO `user_logs` VALUES (909, 1, '125.162.213.48', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-13 12:57:49');
INSERT INTO `user_logs` VALUES (910, 1, '125.162.213.48', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-13 12:57:50');
INSERT INTO `user_logs` VALUES (911, 1, '180.244.74.29', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-16 03:22:22');
INSERT INTO `user_logs` VALUES (912, 1, '180.244.74.29', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-10-16 03:22:31');
INSERT INTO `user_logs` VALUES (913, 1, '180.244.74.29', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/tambah', '2023-10-16 03:23:27');
INSERT INTO `user_logs` VALUES (914, 1, '180.244.74.29', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-10-16 03:23:27');
INSERT INTO `user_logs` VALUES (915, 1, '180.244.74.29', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/22', '2023-10-16 03:25:17');
INSERT INTO `user_logs` VALUES (916, 1, '180.244.74.29', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/22', '2023-10-16 03:25:36');
INSERT INTO `user_logs` VALUES (917, 1, '180.244.74.29', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-10-16 03:25:37');
INSERT INTO `user_logs` VALUES (918, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-16 04:21:17');
INSERT INTO `user_logs` VALUES (919, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita', '2023-10-16 04:21:26');
INSERT INTO `user_logs` VALUES (920, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-16 04:21:40');
INSERT INTO `user_logs` VALUES (921, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-16 04:22:18');
INSERT INTO `user_logs` VALUES (922, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Layanan', '2023-10-16 04:22:18');
INSERT INTO `user_logs` VALUES (923, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/33', '2023-10-16 04:22:38');
INSERT INTO `user_logs` VALUES (924, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/33', '2023-10-16 04:23:26');
INSERT INTO `user_logs` VALUES (925, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Layanan', '2023-10-16 04:23:26');
INSERT INTO `user_logs` VALUES (926, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/33', '2023-10-16 04:24:15');
INSERT INTO `user_logs` VALUES (927, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/33', '2023-10-16 04:27:16');
INSERT INTO `user_logs` VALUES (928, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Layanan', '2023-10-16 04:27:16');
INSERT INTO `user_logs` VALUES (929, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/33', '2023-10-16 04:27:29');
INSERT INTO `user_logs` VALUES (930, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/33', '2023-10-16 04:28:55');
INSERT INTO `user_logs` VALUES (931, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Layanan', '2023-10-16 04:28:55');
INSERT INTO `user_logs` VALUES (932, 1, '103.9.227.3', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-16 04:44:18');
INSERT INTO `user_logs` VALUES (933, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-18 15:09:09');
INSERT INTO `user_logs` VALUES (934, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-18 15:09:48');
INSERT INTO `user_logs` VALUES (935, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-18 15:14:20');
INSERT INTO `user_logs` VALUES (936, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 15:14:21');
INSERT INTO `user_logs` VALUES (937, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 15:15:18');
INSERT INTO `user_logs` VALUES (938, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 15:17:36');
INSERT INTO `user_logs` VALUES (939, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 15:18:03');
INSERT INTO `user_logs` VALUES (940, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 15:18:04');
INSERT INTO `user_logs` VALUES (941, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 16:38:20');
INSERT INTO `user_logs` VALUES (942, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 16:38:58');
INSERT INTO `user_logs` VALUES (943, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 16:39:22');
INSERT INTO `user_logs` VALUES (944, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 16:39:25');
INSERT INTO `user_logs` VALUES (945, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 16:39:45');
INSERT INTO `user_logs` VALUES (946, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 16:40:04');
INSERT INTO `user_logs` VALUES (947, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 16:40:04');
INSERT INTO `user_logs` VALUES (948, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 16:40:18');
INSERT INTO `user_logs` VALUES (949, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 16:41:33');
INSERT INTO `user_logs` VALUES (950, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 16:41:33');
INSERT INTO `user_logs` VALUES (951, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 16:41:57');
INSERT INTO `user_logs` VALUES (952, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/edit/34', '2023-10-18 16:42:03');
INSERT INTO `user_logs` VALUES (953, 1, '180.249.175.160', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-18 16:42:03');
INSERT INTO `user_logs` VALUES (954, 1, '182.1.185.18', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-21 16:25:45');
INSERT INTO `user_logs` VALUES (955, 1, '182.1.185.18', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-10-21 16:26:07');
INSERT INTO `user_logs` VALUES (956, 1, '182.1.185.18', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/22', '2023-10-21 16:26:10');
INSERT INTO `user_logs` VALUES (957, 1, '182.1.185.18', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri/edit/22', '2023-10-21 16:26:53');
INSERT INTO `user_logs` VALUES (958, 1, '182.1.185.18', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/galeri', '2023-10-21 16:26:54');
INSERT INTO `user_logs` VALUES (959, 1, '114.125.203.215', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-10-26 02:42:45');
INSERT INTO `user_logs` VALUES (960, 1, '114.125.203.215', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-26 02:43:00');
INSERT INTO `user_logs` VALUES (961, 1, '114.125.203.215', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2023-10-26 02:48:36');
INSERT INTO `user_logs` VALUES (962, 1, '114.125.203.215', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2023-10-26 02:48:37');
INSERT INTO `user_logs` VALUES (963, 1, '180.244.35.47', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2023-11-06 06:03:51');
INSERT INTO `user_logs` VALUES (964, 1, '110.136.253.128', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2024-01-29 05:33:56');
INSERT INTO `user_logs` VALUES (965, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2024-03-01 16:46:24');
INSERT INTO `user_logs` VALUES (966, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2024-03-01 16:47:14');
INSERT INTO `user_logs` VALUES (967, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/tambah', '2024-03-01 16:52:34');
INSERT INTO `user_logs` VALUES (968, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/berita/jenis_berita/Berita', '2024-03-01 16:52:37');
INSERT INTO `user_logs` VALUES (969, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2024-03-03 12:22:51');
INSERT INTO `user_logs` VALUES (970, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:22:57');
INSERT INTO `user_logs` VALUES (971, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:24:25');
INSERT INTO `user_logs` VALUES (972, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:24:26');
INSERT INTO `user_logs` VALUES (973, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:24:26');
INSERT INTO `user_logs` VALUES (974, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:24:26');
INSERT INTO `user_logs` VALUES (975, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:24:28');
INSERT INTO `user_logs` VALUES (976, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:24:28');
INSERT INTO `user_logs` VALUES (977, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:24:29');
INSERT INTO `user_logs` VALUES (978, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:24:29');
INSERT INTO `user_logs` VALUES (979, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:24:29');
INSERT INTO `user_logs` VALUES (980, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:24:37');
INSERT INTO `user_logs` VALUES (981, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:24:37');
INSERT INTO `user_logs` VALUES (982, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-03 12:24:41');
INSERT INTO `user_logs` VALUES (983, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:24:47');
INSERT INTO `user_logs` VALUES (984, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 12:24:52');
INSERT INTO `user_logs` VALUES (985, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 12:25:11');
INSERT INTO `user_logs` VALUES (986, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 12:25:11');
INSERT INTO `user_logs` VALUES (987, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:25:23');
INSERT INTO `user_logs` VALUES (988, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-03 12:25:26');
INSERT INTO `user_logs` VALUES (989, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:25:28');
INSERT INTO `user_logs` VALUES (990, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:25:56');
INSERT INTO `user_logs` VALUES (991, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:25:57');
INSERT INTO `user_logs` VALUES (992, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:25:57');
INSERT INTO `user_logs` VALUES (993, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:25:57');
INSERT INTO `user_logs` VALUES (994, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:25:58');
INSERT INTO `user_logs` VALUES (995, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:25:58');
INSERT INTO `user_logs` VALUES (996, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:25:58');
INSERT INTO `user_logs` VALUES (997, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:25:59');
INSERT INTO `user_logs` VALUES (998, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:25:59');
INSERT INTO `user_logs` VALUES (999, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:25:59');
INSERT INTO `user_logs` VALUES (1000, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:25:59');
INSERT INTO `user_logs` VALUES (1001, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:00');
INSERT INTO `user_logs` VALUES (1002, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:00');
INSERT INTO `user_logs` VALUES (1003, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:01');
INSERT INTO `user_logs` VALUES (1004, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:02');
INSERT INTO `user_logs` VALUES (1005, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:02');
INSERT INTO `user_logs` VALUES (1006, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:02');
INSERT INTO `user_logs` VALUES (1007, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:03');
INSERT INTO `user_logs` VALUES (1008, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:03');
INSERT INTO `user_logs` VALUES (1009, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:07');
INSERT INTO `user_logs` VALUES (1010, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:07');
INSERT INTO `user_logs` VALUES (1011, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:08');
INSERT INTO `user_logs` VALUES (1012, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:08');
INSERT INTO `user_logs` VALUES (1013, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:08');
INSERT INTO `user_logs` VALUES (1014, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:09');
INSERT INTO `user_logs` VALUES (1015, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:09');
INSERT INTO `user_logs` VALUES (1016, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:16');
INSERT INTO `user_logs` VALUES (1017, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:17');
INSERT INTO `user_logs` VALUES (1018, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:17');
INSERT INTO `user_logs` VALUES (1019, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:17');
INSERT INTO `user_logs` VALUES (1020, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:18');
INSERT INTO `user_logs` VALUES (1021, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:18');
INSERT INTO `user_logs` VALUES (1022, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:18');
INSERT INTO `user_logs` VALUES (1023, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:18');
INSERT INTO `user_logs` VALUES (1024, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:19');
INSERT INTO `user_logs` VALUES (1025, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:19');
INSERT INTO `user_logs` VALUES (1026, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:19');
INSERT INTO `user_logs` VALUES (1027, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:20');
INSERT INTO `user_logs` VALUES (1028, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:20');
INSERT INTO `user_logs` VALUES (1029, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:20');
INSERT INTO `user_logs` VALUES (1030, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:20');
INSERT INTO `user_logs` VALUES (1031, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:26');
INSERT INTO `user_logs` VALUES (1032, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:27');
INSERT INTO `user_logs` VALUES (1033, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:27');
INSERT INTO `user_logs` VALUES (1034, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:27');
INSERT INTO `user_logs` VALUES (1035, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:28');
INSERT INTO `user_logs` VALUES (1036, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:28');
INSERT INTO `user_logs` VALUES (1037, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:28');
INSERT INTO `user_logs` VALUES (1038, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:29');
INSERT INTO `user_logs` VALUES (1039, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:29');
INSERT INTO `user_logs` VALUES (1040, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:30');
INSERT INTO `user_logs` VALUES (1041, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:30');
INSERT INTO `user_logs` VALUES (1042, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:30');
INSERT INTO `user_logs` VALUES (1043, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:30');
INSERT INTO `user_logs` VALUES (1044, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:31');
INSERT INTO `user_logs` VALUES (1045, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:31');
INSERT INTO `user_logs` VALUES (1046, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:53');
INSERT INTO `user_logs` VALUES (1047, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:54');
INSERT INTO `user_logs` VALUES (1048, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:54');
INSERT INTO `user_logs` VALUES (1049, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:54');
INSERT INTO `user_logs` VALUES (1050, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:54');
INSERT INTO `user_logs` VALUES (1051, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:55');
INSERT INTO `user_logs` VALUES (1052, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:55');
INSERT INTO `user_logs` VALUES (1053, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:55');
INSERT INTO `user_logs` VALUES (1054, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:55');
INSERT INTO `user_logs` VALUES (1055, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:56');
INSERT INTO `user_logs` VALUES (1056, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:56');
INSERT INTO `user_logs` VALUES (1057, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:56');
INSERT INTO `user_logs` VALUES (1058, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:26:56');
INSERT INTO `user_logs` VALUES (1059, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:27:48');
INSERT INTO `user_logs` VALUES (1060, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-03 12:27:48');
INSERT INTO `user_logs` VALUES (1061, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/6', '2024-03-03 12:28:14');
INSERT INTO `user_logs` VALUES (1062, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/edit/6', '2024-03-03 12:28:21');
INSERT INTO `user_logs` VALUES (1063, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2024-03-03 12:29:19');
INSERT INTO `user_logs` VALUES (1064, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 12:29:25');
INSERT INTO `user_logs` VALUES (1065, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 12:29:37');
INSERT INTO `user_logs` VALUES (1066, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 12:29:38');
INSERT INTO `user_logs` VALUES (1067, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-03 12:29:47');
INSERT INTO `user_logs` VALUES (1068, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:29:49');
INSERT INTO `user_logs` VALUES (1069, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-03 12:31:45');
INSERT INTO `user_logs` VALUES (1070, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 12:31:55');
INSERT INTO `user_logs` VALUES (1071, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 12:32:12');
INSERT INTO `user_logs` VALUES (1072, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-03 12:32:13');
INSERT INTO `user_logs` VALUES (1073, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-03 12:32:27');
INSERT INTO `user_logs` VALUES (1074, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:32:31');
INSERT INTO `user_logs` VALUES (1075, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:33:59');
INSERT INTO `user_logs` VALUES (1076, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-03 12:34:01');
INSERT INTO `user_logs` VALUES (1077, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:36:05');
INSERT INTO `user_logs` VALUES (1078, 1, '180.252.203.183', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-03 12:41:50');
INSERT INTO `user_logs` VALUES (1079, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2024-03-05 07:06:13');
INSERT INTO `user_logs` VALUES (1080, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:06:21');
INSERT INTO `user_logs` VALUES (1081, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-05 07:06:47');
INSERT INTO `user_logs` VALUES (1082, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-05 07:07:02');
INSERT INTO `user_logs` VALUES (1083, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-05 07:07:06');
INSERT INTO `user_logs` VALUES (1084, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-05 07:07:10');
INSERT INTO `user_logs` VALUES (1085, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-05 07:07:14');
INSERT INTO `user_logs` VALUES (1086, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-05 07:07:14');
INSERT INTO `user_logs` VALUES (1087, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:07:26');
INSERT INTO `user_logs` VALUES (1088, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:08:09');
INSERT INTO `user_logs` VALUES (1089, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-05 07:08:09');
INSERT INTO `user_logs` VALUES (1090, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-05 07:08:23');
INSERT INTO `user_logs` VALUES (1091, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-05 07:08:39');
INSERT INTO `user_logs` VALUES (1092, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/kategori_download', '2024-03-05 07:08:39');
INSERT INTO `user_logs` VALUES (1093, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:08:45');
INSERT INTO `user_logs` VALUES (1094, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:13:28');
INSERT INTO `user_logs` VALUES (1095, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:13:59');
INSERT INTO `user_logs` VALUES (1096, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:14:05');
INSERT INTO `user_logs` VALUES (1097, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:15:00');
INSERT INTO `user_logs` VALUES (1098, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:16:47');
INSERT INTO `user_logs` VALUES (1099, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-05 07:16:47');
INSERT INTO `user_logs` VALUES (1100, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2024-03-05 07:21:28');
INSERT INTO `user_logs` VALUES (1101, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:21:31');
INSERT INTO `user_logs` VALUES (1102, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:21:55');
INSERT INTO `user_logs` VALUES (1103, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-05 07:21:55');
INSERT INTO `user_logs` VALUES (1104, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/dasbor', '2024-03-05 07:32:05');
INSERT INTO `user_logs` VALUES (1105, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:33:22');
INSERT INTO `user_logs` VALUES (1106, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:36:22');
INSERT INTO `user_logs` VALUES (1107, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-05 07:36:22');
INSERT INTO `user_logs` VALUES (1108, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:36:32');
INSERT INTO `user_logs` VALUES (1109, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:37:17');
INSERT INTO `user_logs` VALUES (1110, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:39:55');
INSERT INTO `user_logs` VALUES (1111, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-05 07:39:55');
INSERT INTO `user_logs` VALUES (1112, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:40:01');
INSERT INTO `user_logs` VALUES (1113, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:41:13');
INSERT INTO `user_logs` VALUES (1114, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-05 07:41:13');
INSERT INTO `user_logs` VALUES (1115, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:41:19');
INSERT INTO `user_logs` VALUES (1116, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download/tambah', '2024-03-05 07:41:40');
INSERT INTO `user_logs` VALUES (1117, 1, '110.136.254.197', 'admin', 'http://bapperlitbangda.luwukab.go.id/admin/download', '2024-03-05 07:41:41');
INSERT INTO `user_logs` VALUES (1118, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:10:31');
INSERT INTO `user_logs` VALUES (1119, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:10:39');
INSERT INTO `user_logs` VALUES (1120, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:10:50');
INSERT INTO `user_logs` VALUES (1121, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:10:53');
INSERT INTO `user_logs` VALUES (1122, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/akun', '2024-06-13 12:10:56');
INSERT INTO `user_logs` VALUES (1123, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/user', '2024-06-13 12:11:08');
INSERT INTO `user_logs` VALUES (1124, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/client', '2024-06-13 12:11:11');
INSERT INTO `user_logs` VALUES (1125, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:11:19');
INSERT INTO `user_logs` VALUES (1126, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/user', '2024-06-13 12:11:21');
INSERT INTO `user_logs` VALUES (1127, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/akun', '2024-06-13 12:11:24');
INSERT INTO `user_logs` VALUES (1128, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/panduan', '2024-06-13 12:11:38');
INSERT INTO `user_logs` VALUES (1129, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/user', '2024-06-13 12:11:43');
INSERT INTO `user_logs` VALUES (1130, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/client', '2024-06-13 12:11:45');
INSERT INTO `user_logs` VALUES (1131, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:11:49');
INSERT INTO `user_logs` VALUES (1132, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:12:02');
INSERT INTO `user_logs` VALUES (1133, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:12:28');
INSERT INTO `user_logs` VALUES (1134, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/akun', '2024-06-13 12:12:44');
INSERT INTO `user_logs` VALUES (1135, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:12:47');
INSERT INTO `user_logs` VALUES (1136, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:13:02');
INSERT INTO `user_logs` VALUES (1137, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/panduan', '2024-06-13 12:14:16');
INSERT INTO `user_logs` VALUES (1138, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/user', '2024-06-13 12:14:24');
INSERT INTO `user_logs` VALUES (1139, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/client', '2024-06-13 12:14:27');
INSERT INTO `user_logs` VALUES (1140, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/user', '2024-06-13 12:14:29');
INSERT INTO `user_logs` VALUES (1141, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/user', '2024-06-13 12:14:31');
INSERT INTO `user_logs` VALUES (1142, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:14:38');
INSERT INTO `user_logs` VALUES (1143, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi', '2024-06-13 12:14:55');
INSERT INTO `user_logs` VALUES (1144, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 12:17:43');
INSERT INTO `user_logs` VALUES (1145, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 12:18:10');
INSERT INTO `user_logs` VALUES (1146, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 12:18:11');
INSERT INTO `user_logs` VALUES (1147, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:21:43');
INSERT INTO `user_logs` VALUES (1148, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:22:02');
INSERT INTO `user_logs` VALUES (1149, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:22:05');
INSERT INTO `user_logs` VALUES (1150, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:22:26');
INSERT INTO `user_logs` VALUES (1151, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 12:22:28');
INSERT INTO `user_logs` VALUES (1152, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi', '2024-06-13 12:22:33');
INSERT INTO `user_logs` VALUES (1153, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 12:22:37');
INSERT INTO `user_logs` VALUES (1154, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 12:22:49');
INSERT INTO `user_logs` VALUES (1155, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 12:22:49');
INSERT INTO `user_logs` VALUES (1156, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 12:25:36');
INSERT INTO `user_logs` VALUES (1157, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 12:25:36');
INSERT INTO `user_logs` VALUES (1158, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/dasbor', '2024-06-13 13:53:26');
INSERT INTO `user_logs` VALUES (1159, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 13:53:36');
INSERT INTO `user_logs` VALUES (1160, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 13:53:46');
INSERT INTO `user_logs` VALUES (1161, 1, '127.0.0.1', 'admin', 'http://bapperlitbangda.test/admin/konfigurasi/logo', '2024-06-13 13:53:46');
INSERT INTO `user_logs` VALUES (1162, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 14:16:50');
INSERT INTO `user_logs` VALUES (1163, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/berita', '2024-06-13 14:17:01');
INSERT INTO `user_logs` VALUES (1164, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/berita/tambah', '2024-06-13 14:17:04');
INSERT INTO `user_logs` VALUES (1165, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 14:17:07');
INSERT INTO `user_logs` VALUES (1166, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/kategori', '2024-06-13 14:17:23');
INSERT INTO `user_logs` VALUES (1167, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/kategori/edit/2', '2024-06-13 14:17:26');
INSERT INTO `user_logs` VALUES (1168, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/kategori', '2024-06-13 14:17:28');
INSERT INTO `user_logs` VALUES (1169, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 14:17:53');
INSERT INTO `user_logs` VALUES (1170, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:17:59');
INSERT INTO `user_logs` VALUES (1171, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:18:34');
INSERT INTO `user_logs` VALUES (1172, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 14:18:38');
INSERT INTO `user_logs` VALUES (1173, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/kategori_galeri', '2024-06-13 14:18:53');
INSERT INTO `user_logs` VALUES (1174, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:21:27');
INSERT INTO `user_logs` VALUES (1175, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:23:32');
INSERT INTO `user_logs` VALUES (1176, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:23:32');
INSERT INTO `user_logs` VALUES (1177, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:24:00');
INSERT INTO `user_logs` VALUES (1178, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:24:00');
INSERT INTO `user_logs` VALUES (1179, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:24:50');
INSERT INTO `user_logs` VALUES (1180, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:24:50');
INSERT INTO `user_logs` VALUES (1181, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 14:29:03');
INSERT INTO `user_logs` VALUES (1182, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/berita', '2024-06-13 14:29:07');
INSERT INTO `user_logs` VALUES (1183, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/galeri', '2024-06-13 14:29:10');
INSERT INTO `user_logs` VALUES (1184, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/download', '2024-06-13 14:29:20');
INSERT INTO `user_logs` VALUES (1185, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/client', '2024-06-13 14:29:34');
INSERT INTO `user_logs` VALUES (1186, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/user', '2024-06-13 14:29:37');
INSERT INTO `user_logs` VALUES (1187, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:32:47');
INSERT INTO `user_logs` VALUES (1188, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/client', '2024-06-13 14:32:56');
INSERT INTO `user_logs` VALUES (1189, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 14:32:58');
INSERT INTO `user_logs` VALUES (1190, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 14:33:01');
INSERT INTO `user_logs` VALUES (1191, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 14:33:45');
INSERT INTO `user_logs` VALUES (1192, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 14:33:46');
INSERT INTO `user_logs` VALUES (1193, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/berita', '2024-06-13 14:34:02');
INSERT INTO `user_logs` VALUES (1194, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/galeri', '2024-06-13 14:34:48');
INSERT INTO `user_logs` VALUES (1195, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/galeri/tambah', '2024-06-13 14:35:46');
INSERT INTO `user_logs` VALUES (1196, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/client', '2024-06-13 14:35:50');
INSERT INTO `user_logs` VALUES (1197, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi/icon', '2024-06-13 14:35:55');
INSERT INTO `user_logs` VALUES (1198, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi/icon', '2024-06-13 14:36:01');
INSERT INTO `user_logs` VALUES (1199, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi/icon', '2024-06-13 14:36:01');
INSERT INTO `user_logs` VALUES (1200, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/user', '2024-06-13 14:37:43');
INSERT INTO `user_logs` VALUES (1201, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi/logo', '2024-06-13 14:37:49');
INSERT INTO `user_logs` VALUES (1202, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 14:37:57');
INSERT INTO `user_logs` VALUES (1203, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 14:37:59');
INSERT INTO `user_logs` VALUES (1204, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 14:38:41');
INSERT INTO `user_logs` VALUES (1205, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 14:38:41');
INSERT INTO `user_logs` VALUES (1206, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 14:38:46');
INSERT INTO `user_logs` VALUES (1207, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:42:55');
INSERT INTO `user_logs` VALUES (1208, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:43:08');
INSERT INTO `user_logs` VALUES (1209, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:43:08');
INSERT INTO `user_logs` VALUES (1210, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:44:17');
INSERT INTO `user_logs` VALUES (1211, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:44:17');
INSERT INTO `user_logs` VALUES (1212, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/user', '2024-06-13 14:47:00');
INSERT INTO `user_logs` VALUES (1213, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:47:08');
INSERT INTO `user_logs` VALUES (1214, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:47:37');
INSERT INTO `user_logs` VALUES (1215, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:47:37');
INSERT INTO `user_logs` VALUES (1216, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:48:45');
INSERT INTO `user_logs` VALUES (1217, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:48:45');
INSERT INTO `user_logs` VALUES (1218, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 14:49:03');
INSERT INTO `user_logs` VALUES (1219, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 14:49:12');
INSERT INTO `user_logs` VALUES (1220, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/akun', '2024-06-13 14:49:12');
INSERT INTO `user_logs` VALUES (1221, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/dasbor', '2024-06-13 14:49:17');
INSERT INTO `user_logs` VALUES (1222, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:50:14');
INSERT INTO `user_logs` VALUES (1223, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:50:26');
INSERT INTO `user_logs` VALUES (1224, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:50:27');
INSERT INTO `user_logs` VALUES (1225, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/download', '2024-06-13 14:53:52');
INSERT INTO `user_logs` VALUES (1226, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/download/delete/19', '2024-06-13 14:54:01');
INSERT INTO `user_logs` VALUES (1227, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/download', '2024-06-13 14:54:01');
INSERT INTO `user_logs` VALUES (1228, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/download', '2024-06-13 14:55:50');
INSERT INTO `user_logs` VALUES (1229, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 14:58:30');
INSERT INTO `user_logs` VALUES (1230, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 15:03:14');
INSERT INTO `user_logs` VALUES (1231, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 15:03:14');
INSERT INTO `user_logs` VALUES (1232, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 15:07:46');
INSERT INTO `user_logs` VALUES (1233, 1, '::1', 'admin', 'http://localhost/bapperlitbangda/admin/konfigurasi', '2024-06-13 15:07:46');
INSERT INTO `user_logs` VALUES (1234, 1, '::1', 'admin', 'http://localhost/dinsos/admin/dasbor', '2024-06-13 16:19:18');
INSERT INTO `user_logs` VALUES (1235, 1, '::1', 'admin', 'http://localhost/dinsos/admin/galeri/tambah', '2024-06-13 16:19:29');
INSERT INTO `user_logs` VALUES (1236, 1, '::1', 'admin', 'http://localhost/dinsos/admin/galeri/tambah', '2024-06-13 16:19:55');
INSERT INTO `user_logs` VALUES (1237, 1, '::1', 'admin', 'http://localhost/dinsos/admin/galeri', '2024-06-13 16:19:55');
INSERT INTO `user_logs` VALUES (1238, 1, '::1', 'admin', 'http://localhost/dinsos/admin/galeri/delete/23', '2024-06-13 16:20:20');
INSERT INTO `user_logs` VALUES (1239, 1, '::1', 'admin', 'http://localhost/dinsos/admin/galeri', '2024-06-13 16:20:21');
INSERT INTO `user_logs` VALUES (1240, 1, '::1', 'admin', 'http://localhost/dinsos/admin/kategori_galeri', '2024-06-13 16:20:26');
INSERT INTO `user_logs` VALUES (1241, 1, '::1', 'admin', 'http://localhost/dinsos/admin/user', '2024-06-13 16:20:31');
INSERT INTO `user_logs` VALUES (1242, 1, '::1', 'admin', 'http://localhost/dinsos/admin/dasbor', '2024-06-13 16:36:45');
INSERT INTO `user_logs` VALUES (1243, 1, '::1', 'admin', 'http://localhost/dinsos/admin/dasbor', '2024-06-13 16:36:50');
INSERT INTO `user_logs` VALUES (1244, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-13 16:36:54');
INSERT INTO `user_logs` VALUES (1245, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-13 16:38:41');
INSERT INTO `user_logs` VALUES (1246, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-13 16:38:41');
INSERT INTO `user_logs` VALUES (1247, 1, '::1', 'admin', 'http://localhost/dinsos/admin/dasbor', '2024-06-26 09:15:16');
INSERT INTO `user_logs` VALUES (1248, 1, '::1', 'admin', 'http://localhost/dinsos/admin/akun', '2024-06-26 09:15:38');
INSERT INTO `user_logs` VALUES (1249, 1, '::1', 'admin', 'http://localhost/dinsos/admin/akun', '2024-06-26 09:16:14');
INSERT INTO `user_logs` VALUES (1250, 1, '::1', 'admin', 'http://localhost/dinsos/admin/akun', '2024-06-26 09:16:14');
INSERT INTO `user_logs` VALUES (1251, 1, '::1', 'admin', 'http://localhost/dinsos/admin/dasbor', '2024-06-26 09:16:19');
INSERT INTO `user_logs` VALUES (1252, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 09:16:29');
INSERT INTO `user_logs` VALUES (1253, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 09:17:25');
INSERT INTO `user_logs` VALUES (1254, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 09:17:25');
INSERT INTO `user_logs` VALUES (1255, 1, '::1', 'admin', 'http://localhost/dinsos/admin/dasbor', '2024-06-26 09:27:58');
INSERT INTO `user_logs` VALUES (1256, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 09:28:01');
INSERT INTO `user_logs` VALUES (1257, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 09:30:27');
INSERT INTO `user_logs` VALUES (1258, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 09:30:27');
INSERT INTO `user_logs` VALUES (1259, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 09:34:33');
INSERT INTO `user_logs` VALUES (1260, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 09:34:33');
INSERT INTO `user_logs` VALUES (1261, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 09:36:15');
INSERT INTO `user_logs` VALUES (1262, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 09:36:15');
INSERT INTO `user_logs` VALUES (1263, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 10:13:14');
INSERT INTO `user_logs` VALUES (1264, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 10:13:14');
INSERT INTO `user_logs` VALUES (1265, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 10:13:48');
INSERT INTO `user_logs` VALUES (1266, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 10:13:48');
INSERT INTO `user_logs` VALUES (1267, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 10:14:20');
INSERT INTO `user_logs` VALUES (1268, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 10:14:20');
INSERT INTO `user_logs` VALUES (1269, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 10:14:46');
INSERT INTO `user_logs` VALUES (1270, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 10:14:46');
INSERT INTO `user_logs` VALUES (1271, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 10:15:31');
INSERT INTO `user_logs` VALUES (1272, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 10:15:31');
INSERT INTO `user_logs` VALUES (1273, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 10:16:00');
INSERT INTO `user_logs` VALUES (1274, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 10:16:00');
INSERT INTO `user_logs` VALUES (1275, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 10:23:33');
INSERT INTO `user_logs` VALUES (1276, 1, '::1', 'admin', 'http://localhost/dinsos/admin/konfigurasi', '2024-06-26 10:23:33');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `akses_level` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_rahasia` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `gambar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_post` datetime(0) NOT NULL,
  `tanggal` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Alan Setiady', 'setiady.alan@luwukab.go.id', 'admin', '7eaa4f5f21b3f32a4f983103504ee75896548482', 'Admin', NULL, '1718260425_d3dc676837af2420f738.jpg', '', '2019-10-12 15:50:21', '2024-06-26 09:16:14');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id_video` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `judul` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `video` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_post` datetime(0) NOT NULL,
  `tanggal` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_video`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (6, 0, 'KALEIDOSKOP KAB. LUWU TAHUN 2021', 'Kaleidoskop 2021 Kabupaten Luwu', 'r2NiUzuLvSo', '0000-00-00 00:00:00', '2023-09-22 09:27:34');
INSERT INTO `video` VALUES (7, 0, 'PROFIL KABUPATEN LUWU || SULAWESI SELATAN || BUMI SAWERIGADING', '-', 'gOBsU1pyNBk', '0000-00-00 00:00:00', '2023-09-22 09:24:32');
INSERT INTO `video` VALUES (8, 0, 'KALEIDOSKOP KAB. LUWU TAHUN 2022', '-', 'MvZw1KhdZA4', '0000-00-00 00:00:00', '2023-09-22 09:27:03');

SET FOREIGN_KEY_CHECKS = 1;
