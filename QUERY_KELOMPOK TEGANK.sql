/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.30 : Database - kursus_online
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kursus_online` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `kursus_online`;

/*Table structure for table `kursus` */

DROP TABLE IF EXISTS `kursus`;

CREATE TABLE `kursus` (
  `id_kursus` int NOT NULL,
  `id_pengajar` int DEFAULT NULL,
  `judul` varchar(50) DEFAULT NULL,
  `deskripsi` text,
  `harga` int DEFAULT NULL,
  PRIMARY KEY (`id_kursus`),
  KEY `id_pengajar` (`id_pengajar`),
  CONSTRAINT `kursus_ibfk_1` FOREIGN KEY (`id_pengajar`) REFERENCES `pengajar` (`id_pengajar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `kursus` */

insert  into `kursus`(`id_kursus`,`id_pengajar`,`judul`,`deskripsi`,`harga`) values 
(1,101,'Dasar Pemrograman','Belajar logika dan dasar coding.',150000),
(2,102,'Basis Data','Pengenalan database dan SQL.',200000),
(3,103,'Desain Web','HTML, CSS, web layout.',180000),
(4,104,'English Basic Learning','Belajar bahasa inggris dari nol.',250000),
(5,105,'Jaringan Komputer dan Komunikasi','Osi layer dan Konfigurasi IP.',300000);

/*Table structure for table `pelajaran` */

DROP TABLE IF EXISTS `pelajaran`;

CREATE TABLE `pelajaran` (
  `id_pelajaran` int NOT NULL,
  `id_kursus` int DEFAULT NULL,
  `judul_pelajaran` varchar(50) DEFAULT NULL,
  `durasi_materi` time DEFAULT NULL,
  PRIMARY KEY (`id_pelajaran`),
  KEY `id_kursus` (`id_kursus`),
  CONSTRAINT `pelajaran_ibfk_1` FOREIGN KEY (`id_kursus`) REFERENCES `kursus` (`id_kursus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pelajaran` */

insert  into `pelajaran`(`id_pelajaran`,`id_kursus`,`judul_pelajaran`,`durasi_materi`) values 
(11,1,'Pengenalan Programming','01:00:00'),
(12,1,'Variabel dan Tipe Data','01:30:00'),
(21,2,'Pengenalan SQL','01:15:00'),
(22,2,'Relasi Tabel','01:20:00'),
(31,3,'HTML Dasar','01:10:00'),
(32,3,'CSS Layout','01:25:00'),
(41,4,'Grammar ','01:40:00'),
(42,4,'Writting and Speaking skill','01:35:00'),
(51,5,'Router dan routing','01:50:00'),
(52,5,'Mengenal konfigurasi IP Addres','01:45:00');

/*Table structure for table `pembayaran` */

DROP TABLE IF EXISTS `pembayaran`;

CREATE TABLE `pembayaran` (
  `id_pembayaran` int NOT NULL,
  `id_pendaftaran` int DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `metode_pembayaran` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`),
  KEY `id_pendaftaran` (`id_pendaftaran`),
  CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_pendaftaran`) REFERENCES `pendaftaran` (`id_pendaftaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pembayaran` */

insert  into `pembayaran`(`id_pembayaran`,`id_pendaftaran`,`jumlah`,`tanggal_bayar`,`metode_pembayaran`) values 
(2011,11,150000,'2025-01-10','Transfer'),
(2022,12,150000,'2025-01-11','Transfer'),
(2033,13,200000,'2025-01-11','QRIS'),
(2044,14,200000,'2025-01-12','E-Wallet'),
(2055,15,180000,'2025-01-13','Transfer'),
(2066,16,180000,'2025-01-13','Transfer'),
(2077,17,250000,'2025-01-14','QRIS');

/*Table structure for table `pendaftaran` */

DROP TABLE IF EXISTS `pendaftaran`;

CREATE TABLE `pendaftaran` (
  `id_pendaftaran` int NOT NULL,
  `id_pengguna` char(5) DEFAULT NULL,
  `id_kursus` int DEFAULT NULL,
  `tanggal_daftar` date DEFAULT NULL,
  PRIMARY KEY (`id_pendaftaran`),
  KEY `id_pengguna` (`id_pengguna`),
  KEY `id_kursus` (`id_kursus`),
  CONSTRAINT `pendaftaran_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`),
  CONSTRAINT `pendaftaran_ibfk_2` FOREIGN KEY (`id_kursus`) REFERENCES `kursus` (`id_kursus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pendaftaran` */

insert  into `pendaftaran`(`id_pendaftaran`,`id_pengguna`,`id_kursus`,`tanggal_daftar`) values 
(11,'P0006',1,'2025-01-10'),
(12,'P0007',1,'2025-01-11'),
(13,'P0008',2,'2025-01-11'),
(14,'P0009',2,'2025-01-12'),
(15,'P0010',3,'2025-01-13'),
(16,'P0011',3,'2025-01-13'),
(17,'P0012',4,'2025-01-14');

/*Table structure for table `pengajar` */

DROP TABLE IF EXISTS `pengajar`;

CREATE TABLE `pengajar` (
  `id_pengajar` int NOT NULL,
  `id_pengguna` char(5) DEFAULT NULL,
  `nama_pengajar` varchar(100) DEFAULT NULL,
  `no_telp` char(12) DEFAULT NULL,
  PRIMARY KEY (`id_pengajar`),
  KEY `id_pengguna` (`id_pengguna`),
  CONSTRAINT `pengajar_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pengajar` */

insert  into `pengajar`(`id_pengajar`,`id_pengguna`,`nama_pengajar`,`no_telp`) values 
(101,'P0001','Pak Dhika','081234567890'),
(102,'P0002','Pak Yoga','081234567891'),
(103,'P0003','Bu Rahman','081234567892'),
(104,'P0004','Mister Teguh','081234567893'),
(105,'P0005','Prof Agus','081234567894');

/*Table structure for table `pengguna` */

DROP TABLE IF EXISTS `pengguna`;

CREATE TABLE `pengguna` (
  `id_pengguna` char(5) NOT NULL,
  `nama_pengguna` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `kata_sandi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pengguna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pengguna` */

insert  into `pengguna`(`id_pengguna`,`nama_pengguna`,`email`,`kata_sandi`) values 
('P0001','Pak Dhika ','davidson@mail.com','dhik123'),
('P0002','Pak Yoga','yogaaa@mail.com','yogg123'),
('P0003','Bu Rahman','rahmania@mail.com','rahrah123'),
('P0004','Mister Teguh','teguh@mail.com','guhter123'),
('P0005','Prof Agus','agus@mail.com','gusjar123'),
('P0006','Riski baik','risky@mail.com','riskie123'),
('P0007','Ello ananda','lojackson@mail.com','ellow123'),
('P0008','Andre mogiana','ndree@mail.com','mogi123'),
('P0009','Ngurah nabil','aryarah@mail.com','raharya123'),
('P0010','Devara yuiyuex','devara@mail.com','devv123'),
('P0011','Depa kael','devakal@mail.com','kael123'),
('P0012','Gung wah','wahanta@mail.com','mantra123');

/*Table structure for table `sertifikat` */

DROP TABLE IF EXISTS `sertifikat`;

CREATE TABLE `sertifikat` (
  `id_sertifikat` int NOT NULL,
  `id_pendaftaran` int DEFAULT NULL,
  `tanggal_terbit` date DEFAULT NULL,
  `kode_sertifikat` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_sertifikat`),
  KEY `id_pendaftaran` (`id_pendaftaran`),
  CONSTRAINT `sertifikat_ibfk_1` FOREIGN KEY (`id_pendaftaran`) REFERENCES `pendaftaran` (`id_pendaftaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sertifikat` */

insert  into `sertifikat`(`id_sertifikat`,`id_pendaftaran`,`tanggal_terbit`,`kode_sertifikat`) values 
(301,11,'2025-02-01','CERT001'),
(302,12,'2025-02-02','CERT002'),
(303,13,'2025-02-03','CERT003'),
(304,14,'2025-02-04','CERT004'),
(305,15,'2025-02-05','CERT005'),
(306,16,'2025-02-06','CERT006'),
(307,17,'2025-02-07','CERT007');

/*Table structure for table `ulasan` */

DROP TABLE IF EXISTS `ulasan`;

CREATE TABLE `ulasan` (
  `id_ulasan` int NOT NULL,
  `id_pendaftaran` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `komentar` text,
  `tanggal_ulasan` date DEFAULT NULL,
  PRIMARY KEY (`id_ulasan`),
  KEY `id_pendaftaran` (`id_pendaftaran`),
  CONSTRAINT `ulasan_ibfk_1` FOREIGN KEY (`id_pendaftaran`) REFERENCES `pendaftaran` (`id_pendaftaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ulasan` */

insert  into `ulasan`(`id_ulasan`,`id_pendaftaran`,`rating`,`komentar`,`tanggal_ulasan`) values 
(111,15,5,'Materinya sangat membantu, Bu Rahman sangat jelas dalam memberikan materi serta Bu Rahman Cantik','2025-02-15'),
(122,17,4,'Bu Rahman baik hati dan sabar dalam mengajar saya, saya harap Bu Rahman Cantik tetap mengajari saya.','2025-02-15'),
(133,13,5,'Gara gara kursus ini, grammar saya menjadi lebih baik. namun Mister Teguh sedikit menyeramakan seperti mau.....','2025-02-16'),
(144,14,4,'Pelajaranya simpel namun mudah dimengerti, penjelasanya juga lancar. Saya harap saya akan menjadi Web Engineer yang hebat.','2025-02-16'),
(155,11,5,'Pak Agus benar benar hebat. Dia bisa menyambungkan semua kabel. Tidak salah namanya Agus Jarkom.','2025-02-17'),
(166,16,4,'Saya benar benar kewalahan belajar database. Namun Pak yoga sangat sabar mengajari saya dan dia juga sedikit hensom.','2025-02-17'),
(177,12,5,'Pak Dhika Davidson sangat lucu. Saya senang diajari olehnya. Sehat sehat pak davidson!','2025-02-18');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*DQL 
SELECT * FROM pengguna;

SELECT nama_pengguna, email FROM pengguna;

SELECT * FROM pengguna
WHERE nama_pengguna LIKE '%Pak%';

SELECT * FROM pengajar;

SELECT * FROM pengajar
WHERE nama_pengajar LIKE '%Bu%';

SELECT * FROM kursus
ORDER BY harga ASC;

SELECT * FROM pelajaran
WHERE id_kursus = 1;

SELECT id_kursus, COUNT(*) AS jumlah_pelajaran
FROM pelajaran
GROUP BY id_kursus;

SELECT SUM(harga) AS total_harga_kursus
FROM kursus;

SELECT SUM(jumlah) AS total_pemasukan
FROM pembayaran;

SELECT * FROM kursus
WHERE harga = (SELECT MAX(harga) FROM kursus);

SELECT * FROM pembayaran
WHERE jumlah > 200000;

SELECT * FROM kursus
WHERE metode_pembayaran LIKE '%Transfer%';

SELECT * FROM kursus
ORDER BY harga DESC

SELECT * FROM kursus
WHERE biaya = (SELECT MIN(biaya) FROM kursus);

SELECT * FROM kursus
WHERE metode_pembayaran LIKE '%Qris%';

SELECT pengguna.nama_pengguna, kursus.judul
FROM pendaftaran
JOIN pengguna ON pendaftaran.id_pengguna = pengguna.id_pengguna
JOIN kursus ON pendaftaran.id_kursus = kursus.id_kursus;

SELECT AVG(harga) AS rata_harga
FROM kursus;

SELECT * FROM pelajaran
WHERE durasi_materi > '01:30:00';

SELECT rating, COUNT(*) AS total_ulasan
FROM ulasan
GROUP BY rating;