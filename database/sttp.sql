-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2023 at 06:03 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sttp`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `cek_lpbg`
-- (See below for the actual view)
--
CREATE TABLE `cek_lpbg` (
`kode_proyek` varchar(100)
,`no_lpbg` varchar(100)
,`kode_material` varchar(100)
,`deskripsi` text
,`satuan` varchar(100)
,`jml_msk` decimal(32,0)
,`jml_keluar` decimal(32,0)
,`saldo` decimal(33,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cek_sttp`
-- (See below for the actual view)
--
CREATE TABLE `cek_sttp` (
`kode_material` varchar(100)
,`kode_proyek` varchar(100)
,`no_sttp` varchar(100)
,`deskripsi` text
,`jml_keluar` decimal(32,0)
,`no_lpbg` varchar(100)
,`tanggal` timestamp
,`jml_masuk` decimal(32,0)
,`saldo` decimal(33,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `cms_konten`
--

CREATE TABLE `cms_konten` (
  `id` varchar(100) NOT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `title_idn` varchar(255) DEFAULT NULL,
  `title_eng` varchar(255) DEFAULT NULL,
  `konten_idn` text DEFAULT NULL,
  `konten_eng` text DEFAULT NULL,
  `dibuat_pada` timestamp NULL DEFAULT NULL,
  `diubah_pada` timestamp NULL DEFAULT NULL,
  `dihapus_pada` timestamp NULL DEFAULT NULL,
  `dibuat_oleh` int(11) DEFAULT NULL,
  `list_produk_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cms_konten`
--

INSERT INTO `cms_konten` (`id`, `kategori_id`, `title_idn`, `title_eng`, `konten_idn`, `konten_eng`, `dibuat_pada`, `diubah_pada`, `dihapus_pada`, `dibuat_oleh`, `list_produk_id`) VALUES
('0e987705-8329-4bcc-ae6d-f5812d35f354', 2, 'Gerbong Datar (PPCW)', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Kecepatan maksimum&nbsp;&nbsp;&nbsp;	:	&nbsp;80 km / jam</p><p>Lebar sepur	                    :	&nbsp;1.067 mm</p><p>Kapasitas beban	            :	&nbsp;57.000 kg</p><p>Berat kosong maksimal	:	&nbsp;15.000 kg</p><p>Panjang kereta	            :	&nbsp;12.495 mm</p><p>Lebar kereta	                :	&nbsp;2.435 mm</p><p>Tinggi coupler	                :	&nbsp;775 (+10/-0) mm</p><p>Bogie	                            :	&nbsp;Barber Type - 3 piece</p><p>Sistem pengereman	    :	&nbsp;Air brake</p><p>Coupler Device	            :	&nbsp;Automatic Coupler, AAR 10A</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/15\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p>', NULL, '2022-04-05 07:54:02', NULL, NULL, 1, '0401'),
('0f0fa1c5-d969-4cbe-ba92-bc1b0741d3fb', 2, 'Kereta Rel Diesel Indonesia (KRDI)', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Konfigurasi                                               :&nbsp;MeC - T - T - MeC</p><p>Desain kecepatan maksimum&nbsp;&nbsp;&nbsp;               :&nbsp;120 km / jam</p><p>Kecepatan maksimum operasional          :&nbsp;100 km / jam</p><p>Lebar sepur                                              :&nbsp;1.067 mm</p><p>Berat carbody                                           :&nbsp;MeC = 41 ton</p><p>                                                                   T = 32 ton</p><p>Panjang kereta                                         :&nbsp;20.000 mm</p><p>Lebar kereta (side wall)                            :&nbsp;2.990 mm</p><p>Lebar kereta (termasuk sinyal samping)&nbsp;&nbsp;:&nbsp;3.142 mm</p><p>Tinggi kereta dari atas rel                         :&nbsp;3.830 mm</p><p>Tempat duduk                                           :&nbsp;MeC = 64 seats</p><p>                                                                    T = 72 seats</p><p>Penumpang                                              :&nbsp;MeC = 178 penumpang</p><p>                                                                   T = 178 penumpang</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/7\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p>', NULL, '2022-04-05 07:12:18', '2022-04-05 07:16:28', NULL, 1, '0301'),
('283684d4-8eb4-44d3-949a-b4db44a8e254', 2, 'ZZOW', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Kapasitas maksimum&nbsp;&nbsp;&nbsp;	:	&nbsp;38 m kubik</p><p>Kecepatan maksimum&nbsp;&nbsp;&nbsp;	:	&nbsp;80 km / jam</p><p>Lebar sepur                  	:	&nbsp;1.067 mm</p><p>Panjang kereta	            :	&nbsp;13.300 mm</p><p>Lebar kereta	                :	&nbsp;2.459 mm</p><p>Bogie	                            :	&nbsp;Super Service Ride Control</p><p>Sistem pengereman	    :	&nbsp;Air brake UIC 540</p><p>Coupler Device	            :	&nbsp;Automatic Coupler, AAR 10A</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/18\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p><p><br></p>', NULL, '2022-04-05 08:39:09', NULL, NULL, 1, '0404'),
('29d3c69f-17c1-4260-be7b-c527d0bf9469', 2, 'Light Rail Transit', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Konfigurasi	                                        :	&nbsp;Mc1 - T - Mc2</p><p>Desain kecepatan maksimum&nbsp;&nbsp;&nbsp;	        :	&nbsp;100 km / jam</p><p>Kecepatan maksimum operasional&nbsp;&nbsp;&nbsp;	:	&nbsp;&nbsp;85 km / jam</p><p>Lebar sepur                                     	:	&nbsp;1.067 mm</p><p>Beban gandar maksimal	                    :	&nbsp;12 ton</p><p>Panjang kereta	                                :	&nbsp;Mc = 18.000 mm</p><p>                                                                 T&nbsp;&nbsp;&nbsp;= 18.000 mm</p><p>Lebar kereta (side wall)	                    :	&nbsp;2.650 mm</p><p>Tinggi kereta dari atas rel	                :	&nbsp;3.850 mm</p><p>Tinggi lantai dari atas rel	                    :	&nbsp;1.000 mm</p><p>Kapasitas tempat duduk	                    :	&nbsp;Mc1&nbsp;= 40 seats</p><p>                                                                 T&nbsp;&nbsp;&nbsp;&nbsp;= 48 seats</p><p>                                                                 Mc2&nbsp;= 40 seats</p><p>Kapasitas penumpang berdiri	            :	&nbsp;Mc1&nbsp;= 81 penumpang</p><p>                                                                 T&nbsp;&nbsp;&nbsp;&nbsp;= 89 penumpang</p><p>                                                                 Mc2&nbsp;= 81 penumpang</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/70\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p>', NULL, '2022-04-05 07:47:54', NULL, NULL, 1, '0305'),
('311fae97-3fd7-48a2-806f-f8f8d01c2d00', 8, 'ANDY BUDIMAN', NULL, NULL, NULL, '2022-04-13 02:27:49', '2022-04-13 06:50:13', NULL, 1, NULL),
('31ccfcf6-48b8-4610-bbb4-4331a36dc191', 2, 'Lokomotif Diesel Hidrolik', NULL, '<p><strong>DATA TEKNIS</strong></p><p>Kecepatan maksimum&nbsp;&nbsp;: 120 km / jam</p><p>Lebar sepur: 1.067 mm</p><p>Beban gandar: 15 ton</p><p>Panjang kereta: 20.000 mm</p><p>Lebar kereta: 3.000 mm</p><p>Tinggi kereta: 3.700 mm</p><p>Berat kosong: 33 ton</p><p>Berat maksimum: 84 ton</p><p><br></p><p><strong>MESIN</strong></p><p>Traksi: 200 kN@ 18 km/h</p><p>Traksi maksimum: 270 kN (dengan asumsi µ = 0.287)</p><p>Type transmisi: Hydrodynamic input power</p><p>Jenis putaran: 45° V-6, 4-stroke Turbocharged and after cooled</p><p>Gross Horsepower: 1700 KW @ 1800 rpm</p>', NULL, '2022-03-17 06:15:58', NULL, NULL, 1, '0101'),
('3a0dc1c7-a93c-497a-acf1-86013b9f5251', 2, 'Kereta Inspeksi', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Desain kecepatan maksimum&nbsp;&nbsp;&nbsp;	        :	&nbsp;&nbsp;120 km/jam</p><p>Kecepatan maksimum operasional&nbsp;&nbsp;	:	&nbsp;&nbsp;100 km/jam</p><p>Lebar sepur	                                        :	&nbsp;&nbsp;1.067 mm</p><p>Panjang carbody kereta	                    :	&nbsp;&nbsp;20.000 mm</p><p>Lebar carbody kereta	                        :	&nbsp;&nbsp;2.990 mm</p><p>Tinggi kereta dari atas rel	                :	&nbsp;&nbsp;3.528 mm</p><p>Berat kosong maks.	                        :	&nbsp;&nbsp;46.000 kg</p><p>Propulsi	                                            :	&nbsp;&nbsp;Mesin Diesel dan Transmisi Hidromekanikal</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/11\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p><p><br></p>', NULL, '2022-04-05 09:17:42', NULL, NULL, 1, '0501'),
('3db1eba5-b83f-4e3b-82fa-9530f278d4b0', 2, 'LRT Jabodebek', NULL, '<p class=\"ql-align-center\"><img src=\"https://inkamultisolusi.co.id/api_cms/public/uploads/editor/20220405074949_qjRo2etB4CLaDxrZPkFR.jpeg\"></p><p><a href=\"inka.co.id/product/view/76\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p>', NULL, '2022-04-05 07:50:32', NULL, NULL, 1, '0305'),
('3e37861e-3fad-4fa0-a16e-74308fc27944', 2, 'Kereta Rel Diesel Elektrik (KRDE)', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Konfigurasi	                                                :	TeC 1 - M - T - TeC 2</p><p>Kecepatan maksimum operasional	            :	&nbsp;100 km/jam</p><p>Lebar sepur	                                                :	&nbsp;1.067 mm</p><p>Panjang carbody kereta	                            :	&nbsp;TeC = 20.458 mm</p><p>                                                                         M, T = 20.708&nbsp;mm</p><p>Lebar carbody kereta	                                :	&nbsp;2.990 mm</p><p>Tinggi lantai diukur dari kepala rel	</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dimensi umum&nbsp;&nbsp;	                                    :	&nbsp;&nbsp;1.100 mm</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Khusus pada area engine                   	:	&nbsp;&nbsp;1.200 mm</p><p>Tinggi atap dari kepala rel (termasuk AC)	:	&nbsp;3.820 mm</p><p>Jarak antara pusat bogie	                        :	&nbsp;14.000 mm</p><p>Jarak sumbu roda bogie	                            :	&nbsp;2.200 mm</p><p>Diameter roda baru                                  	:	&nbsp;860 mm</p><p>Diameter roda minimum	                            :	&nbsp;780 mm</p><p>Berat kosong maksimal	                            :	&nbsp;TeC&nbsp;&nbsp;= 43,5 ton</p><p>                                                                         M&nbsp;&nbsp;&nbsp;&nbsp;= 43, 5 ton</p><p>                                                                         T&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 38,5 ton</p><p>Tempat duduk	                                            :	 TeC 1&nbsp;= 46 kursi</p><p>                                                                         M&nbsp;&nbsp;&nbsp;&nbsp;= 56 kursi</p><p>                                                                        &nbsp;T&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 52 kursi</p><p>                                                                         TeC 2&nbsp;&nbsp;= 46 kursi</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/6\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p>', NULL, '2022-04-05 07:07:25', NULL, NULL, 1, '0303'),
('40688b5d-1996-491b-bd1d-11af1a62c4f8', 2, 'Kereta Ekonomi Premium', NULL, '<p class=\"ql-align-center\"><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Kecepatan maksimum&nbsp;&nbsp;&nbsp;	:	&nbsp;120 km / jam</p><p>Lebar sepur	                    :	&nbsp;1.067 mm</p><p>Beban gandar	                :	&nbsp;14 ton</p><p>Panjang kereta	            :	&nbsp;20.920 mm</p><p>Lebar kereta	                :	&nbsp;2.990 mm</p><p>Tinggi kereta	                :	&nbsp;3.610 mm</p><p>Tinggi coupler	                :	&nbsp;775 (+10/-0) mm</p><p>Bogie	                            :	&nbsp;TB-1014</p><p>Sistem pengereman	    :	&nbsp;Air brake</p><p>Coupler Device	            :	&nbsp;Automatic Coupler, AAR 10A</p><p><br></p><p class=\"ql-align-center\"><img src=\"https://inkamultisolusi.co.id/api_cms/public/uploads/editor/20220405062624_5ND0054uxayiKZywx7VK.jpg\" width=\"485\" style=\"\"></p><p class=\"ql-align-center\">Interior Kereta Ekonomi Kelas Premium</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><img src=\"https://inkamultisolusi.co.id/api_cms/public/uploads/editor/20220405062740_G73zyQe3NfDxRBNexsFm.jpg\" width=\"490\" style=\"\"></p><p class=\"ql-align-center\">Interior Kereta Ekonomi Kelas Premium</p>', NULL, '2022-04-05 06:28:08', NULL, NULL, 1, '0202'),
('4367c966-67f2-4b31-bbce-db1fe0463a3f', 2, 'KKBW', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Kapasitas maksimum&nbsp;&nbsp;&nbsp;	:	&nbsp;52.000 kg</p><p>Kecepatan maksimum&nbsp;&nbsp;&nbsp;	:	&nbsp;80 km / jam</p><p>Lebar sepur	                    :	&nbsp;1.067 mm</p><p>Panjang kereta	            :	&nbsp;14.062 mm</p><p>Lebar kereta	                :	&nbsp;3.080 mm</p><p>Tinggi kereta	                :	&nbsp;3.041 mm</p><p>Bogie	                            :	&nbsp;Barber type, 3 pieces</p><p>Sistem pengereman	    :	&nbsp;Air brake UIC 540</p><p>Coupler Device	            :	&nbsp;Automatic Coupler F, rotary and fixed, AAR 10A</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/19\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p>', NULL, '2022-04-05 08:42:06', NULL, NULL, 1, '0405'),
('49f8c03c-3419-4c09-bdc2-55e31592fba6', 2, 'Railbus', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Konfigurasi	                                    :	&nbsp;TeC - T - TC</p><p>Desain kecepatan maksimal&nbsp;&nbsp;      	:	&nbsp;120 km/jam</p><p>Kecepatan maksimal operasional&nbsp;	:	&nbsp;100 km/jam</p><p>Lebar sepur                                 	:	&nbsp;1.067 mm</p><p>Kapasitas penumpang 	                :	&nbsp;TeC = 28 seats, 28 berdiri</p><p>                                                             T = 24 seats,&nbsp;24 berdiri</p><p>                                                             TC = 28 seats, 28 berdiri</p><p>Sistem pengereman	                   :	&nbsp;Electro pneumatic</p><p>Propulsi	                                       :	&nbsp;Diesel electric</p><p>Power supply	                               :	&nbsp;660 Volt</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/27\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p>', NULL, '2022-04-05 07:38:36', NULL, NULL, 1, '0304'),
('4adbc63b-fbc6-4098-b0ce-9a0286daff4f', 2, 'Kereta Kelas Eksekutif Stainless Steel', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS	</strong></p><p>Kecepatan maksimum operasional&nbsp;&nbsp;&nbsp;	:	&nbsp;120 km / jam</p><p>Lebar sepur	                                        :	&nbsp;1.067 mm</p><p>Beban gandar maksimal	                    :	&nbsp;15 ton</p><p>Panjang kereta	                                :	&nbsp;20.920 mm</p><p>Lebar kereta (side wall)	                    :	&nbsp;2.990 mm</p><p>Tinggi kereta dari atas rel	                :	&nbsp;3.815 mm</p><p>Tinggi lantai dari atas rel                  	:	&nbsp;1.000 mm</p><p>Material carbody                             	:	&nbsp;Stainless Steel</p><p>Kapasitas penumpang per kereta	    :	&nbsp;50 penumpang</p><p><br></p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/72\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p>', NULL, '2022-04-05 06:50:28', NULL, NULL, 1, '0203'),
('4b24c7f3-0a9c-48f5-98f3-879addf4d4df', 5, 'Anak Perusahaan', NULL, '<p><span style=\"color: black;\">PT INKA Multi Solusi memiliki penyertaan saham pada PT INKA Multi Solusi Service, PT INKA Multi Solusi Trading dan PT INKA Multi Solusi Consulting dengan rincian sebagai berikut :</span></p><p><br></p><p class=\"ql-align-center\"><strong class=\"ql-size-large\" style=\"color: black;\">PT INKA Multi Solusi Service (IMS Service)</strong></p><p class=\"ql-align-center\"><img src=\"https://inkamultisolusi.co.id/api_cms/public/uploads/editor/20220511071342_LSnL6WiOy67Xd9mKGDaG.png\"></p><p><span style=\"color: black;\">PT INKA Multi Solusi Service (disingkat PT IMSS) merupakan anak perusahaan PT INKA Multi Solusi ( PT IMS) Usaha bersama antara PT INKA (Persero) dan beserta PKBI (Perkumpulan Keluarga Besar INKA Persero). Berdiri pada tanggal 02 September 2014 yang beralamatkan di jalan Salak No. 59 Madiun. PT INKA Multi Solusi Service merupakan PT INKA (Persero) Group yang bergerak dalam perawatan kereta api dan suku cadangnya dan perawatan fasilitas produksi (mesin produksi).</span></p><p><strong style=\"color: black;\">Dewan Komisaris</strong></p><blockquote><span style=\"color: black;\">Komisaris Utama</span> <span style=\"color: black;\">: Agung Sedaju</span></blockquote><blockquote><span style=\"color: black;\">Komisaris</span> <span style=\"color: black;\">: Cholik M. Zamzam</span></blockquote><blockquote><span style=\"color: black;\">Komisaris</span> <span style=\"color: black;\">: Mujib Ridha</span></blockquote><p>&nbsp;</p><p><strong style=\"color: black;\">Direksi</strong></p><blockquote><span style=\"color: black;\">Direktur Utama</span> <span style=\"color: black;\">: Junaidi</span></blockquote><blockquote><span style=\"color: black;\">Direktur Keuangan, SDM dan Manajemen Risiko</span>	<span style=\"color: black;\">: Muhammad Gufron Fadly</span></blockquote><blockquote><span style=\"color: black;\">Direktur Operasi</span> <span style=\"color: black;\">: Adib Ardhian</span></blockquote><p><br></p><p class=\"ql-align-center\"><strong class=\"ql-size-large\">PT INKA Multi Solusi Trading (IMS Trading)</strong></p><p class=\"ql-align-center\"><img src=\"https://inkamultisolusi.co.id/api_cms/public/uploads/editor/20220511072521_TNNNsmBMz8MeIWdtGStZ.png\" width=\"406\"></p><p><span style=\"color: black;\">PT INKA Multi Solusi Trading (disingkat PT IMST) merupakan anak perusahaan PT INKA Multi Solusi ( PT IMS) Usaha bersama antara PT INKA (Persero) dan beserta PKBI (Perkumpulan Keluarga Besar INKA Persero). Berdiri pada tanggal 28 Juli 2015 yang beralamatkan di jalan Ringroad Barat Madiun. PT INKA Multi Solusi Trading merupakan PT INKA (Persero) Group yang bergerak dalam bidang penjualan komponen-komponen kereta api.</span></p><p><strong style=\"color: black;\">Dewan Komisaris</strong></p><blockquote><span style=\"color: black;\">Komisaris Utama</span> <span style=\"color: black;\">: Budi Noviantoro</span></blockquote><blockquote><span style=\"color: black;\">Komisaris</span> <span style=\"color: black;\">: Puguh Dwi Tjahjono</span></blockquote><p>&nbsp;</p><p><strong style=\"color: black;\">Direksi</strong></p><blockquote><span style=\"color: black;\">Direktur Utama</span> <span style=\"color: black;\">: Wai Wahdan</span></blockquote><blockquote><span style=\"color: black;\">Direktur Keuangan, SDM dan Manajemen Risiko</span>	<span style=\"color: black;\">: Sri Siddiqijah</span></blockquote><blockquote><span style=\"color: black;\">Direktur Operasi</span> <span style=\"color: black;\">: Sanki Aris Susanto</span></blockquote><p><br></p><p class=\"ql-align-center\"><strong class=\"ql-size-large\" style=\"color: black;\">PT INKA Multi Solusi Consulting (IMS Consulting)</strong></p><p class=\"ql-align-center\"><img src=\"https://inkamultisolusi.co.id/api_cms/public/uploads/editor/20220511073222_2SzQxqjuUyfU5xboS2X2.png\" width=\"376\"></p><p><span style=\"color: black;\">PT INKA Multi Solusi Consulting (disingkat PT IMSC) merupakan anak perusahaan PT INKA Multi Solusi ( PT IMS) Usaha bersama antara PT INKA (Persero) dan beserta PKBI (Perkumpulan Keluarga Besar INKA Persero). Berdiri pada tanggal 22 Maret 2017 yang beralamatkan di jalan Salak No. 23 Madiun. PT INKA Multi Solusi Consulting merupakan PT INKA (Persero) Group yang bergerak dalam Konsultasi untuk rancang bangun, rekayasa engineering, dan management di bidang perkeretaapian dan transportasi.</span></p><p><strong style=\"color: black;\">Dewan Komisaris</strong></p><blockquote><span style=\"color: black;\">Komisaris Utama</span> <span style=\"color: black;\">: Edi Winarno</span></blockquote><blockquote><span style=\"color: black;\">Komisaris</span> <span style=\"color: black;\">: YB. Haryono</span></blockquote><p>&nbsp;</p><p><strong style=\"color: black;\">Direksi</strong></p><blockquote><span style=\"color: black;\">Direktur Utama</span> <span style=\"color: black;\">: Zenij Suprijono</span></blockquote><blockquote><span style=\"color: black;\">Direktur Operasi</span> <span style=\"color: black;\">: Chandra Agung Sasono</span></blockquote>', NULL, '2022-04-07 04:59:29', '2022-05-11 09:13:04', NULL, 1, NULL),
('5170e744-a74d-4ee9-9087-3e099e91d59d', 2, 'Well Wagon', NULL, '<p>Gerbong ini didesain untuk pengoperasian pada temperatur maksimum 45 derajat celcius dan kelembapan maksimum 95%</p><p><br></p><p><strong>DATA TEKNIS.	</strong></p><p>Kecepatan maksimum 	: 80 km / jam</p><p>Lebar sepur                     : 1.435 mm</p><p>Kapasitas Muat               : 41.000 kg</p><p>Berat Kosong                  : 19.500 kg</p><p>Panjang                           : 15.000 mm</p><p>Lebar                               : 2.100 mm</p><p>Bogie 	                            : Barber Type - 3 piece</p><p>Sistem pengereman 	    : Air brake</p><p>Coupler Device&nbsp;&nbsp;	            : Automatic Electric Coupler</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/80\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p><p><br></p>', NULL, '2022-04-05 09:14:58', NULL, NULL, 1, '0408'),
('615a2f5d-b9d7-4b4b-9d20-6a9ca9f267ac', 2, 'Kereta Ukur', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Desain kecepatan maksimum&nbsp;&nbsp;&nbsp;	    :	&nbsp;&nbsp;120 km/jam</p><p>Kecepatan maksimum&nbsp;operasional	:	&nbsp;&nbsp;100 km/jam</p><p>Lebar sepur                                  	:	&nbsp;&nbsp;1.067 mm</p><p>Panjang carbody kereta	                :	&nbsp;&nbsp;20.000 mm</p><p>Lebar carbody kereta	                    :	&nbsp;&nbsp;2.990 mm</p><p>Tinggi kereta dari atas rel	            :	&nbsp;&nbsp;3.530 mm</p><p>Berat kosong maks.	                    :	&nbsp;&nbsp;46.000 kg</p><p>Propulsi	                                        :	&nbsp;&nbsp;Mesin Diesel dan Transmisi Hidromekanik</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/12\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p>', NULL, '2022-04-05 09:23:55', NULL, NULL, 1, '0502'),
('6424b113-ac08-4d5c-95cb-1519b5e575a3', 2, 'Kereta Rel Diesel Philippine National Railways', NULL, '<p><strong class=\"ql-size-large\">SPESIFIKASI</strong></p><p>Susunan Trainset KRD Philippine National Railways</p><p>Susunan Trainset KRD Philippine National Railways Seri 1 :3-car-unit (Mec1-T1-Mec2)</p><p>Susunan Trainset KRD Philippine National Railways Seri 2 : 4-car-unit (Mec1-T1-T2-Mec2)</p><p>&nbsp;</p><p>Panjang Kereta (termasuk coupler) : 20.700 mm</p><p>Panjang Kereta : 20.000 mm</p><p><br></p><p>Lebar Kereta : 2.990 mm</p><p>Lebar Kereta (termasuk lampu signal) : 3.180 mm</p><p><br></p><p>Tinggi kereta : 3.530 mm</p><p>Tinggi kereta MeC termasuk radiator : 3.830 mm</p><p><br></p><p>Jarak antar titik tengah bogie : 14.000 mm</p><p>Lebar Roda : 2.200 mm</p><p><br></p><p>Lebar gauge : 1.067 mm</p><p>Max Kec Operasional 100 km/h</p><p><br></p><p>Berat&nbsp;&nbsp;</p><p>MeC : +/- 42 Ton</p><p>T1 : +/- 37 Ton</p><p>T2 : +/- 38 Ton</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/74\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p><p><br></p>', NULL, '2022-04-05 07:19:44', NULL, NULL, 1, '0301'),
('683e8a11-29e8-458b-ae50-0ccc8635bdd2', 8, 'HERU SULISTIYO', NULL, NULL, NULL, '2022-04-13 06:09:01', '2022-04-13 06:17:22', NULL, 1, NULL),
('751a0f69-8843-44d3-b9d5-f37ff120b7f5', 8, 'DADAN TRI YUDIANTO', NULL, NULL, NULL, '2022-04-13 03:17:01', '2022-04-13 06:51:00', NULL, 1, NULL),
('759160cc-e1eb-4bc3-911d-e2e121eebd0a', 8, 'KETUT ASTIKA', NULL, NULL, NULL, '2022-04-13 06:07:19', '2022-04-13 06:17:05', NULL, 1, NULL),
('759eaaab-1b49-401e-81a6-3adbf2b4bc3b', 8, 'TRI HARDONO', NULL, NULL, NULL, '2022-04-13 06:15:29', NULL, NULL, 1, NULL),
('7bf6080c-2989-4810-a7a5-2a8b1a6c9fd1', 8, 'BIMO WIJAYANTO', NULL, NULL, NULL, '2022-04-13 03:13:23', '2022-04-13 06:50:32', NULL, 1, NULL),
('8322fb48-3081-4db7-a880-801e8581a1be', 2, 'Pertashop', NULL, '<p class=\"ql-align-center\"><img src=\"https://inkamultisolusi.co.id/api_cms//public/uploads/editor/20220407050227_E4RTQlBEIvbPMB6wDafS.jpg\" width=\"418\" style=\"\"><img src=\"https://inkamultisolusi.co.id/api_cms//public/uploads/editor/20220407050237_ySnQmdsc9pPVvgQmvB0B.jpg\" width=\"418\" style=\"\"></p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><img src=\"https://inkamultisolusi.co.id/api_cms//public/uploads/editor/20220407050244_XJp8WRVONVjeYY5TlwZb.jpg\" width=\"834\" style=\"cursor: nesw-resize;\"></p>', NULL, '2022-04-07 05:03:55', NULL, NULL, 1, '06'),
('84537c55-01aa-4a2d-a5e2-82b1eb6e6587', 8, 'HARIS MUNANDAR', NULL, NULL, NULL, '2022-04-13 02:26:36', '2022-04-13 06:49:56', NULL, 1, NULL),
('8a3344bc-acd4-47bd-9a04-47f0147ceb5a', 2, 'Kereta Ekonomi', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Kecepatan maksimum&nbsp;&nbsp;&nbsp;	:	&nbsp;120 km / jam</p><p>Lebar sepur                 	:	&nbsp;1.067 mm</p><p>Beban gandar	                :	&nbsp;14 ton</p><p>Panjang kereta	            :	&nbsp;20.920 mm</p><p>Lebar kereta	                :	&nbsp;2.990 mm</p><p>Tinggi kereta	                :	&nbsp;3.610 mm</p><p>Tinggi coupler	                :	&nbsp;775 (+10/-0) mm</p><p>Bogie	                            :	&nbsp;TB-1014</p><p>Sistem pengereman	    :	&nbsp;Air brake</p><p>Coupler Device	            :	&nbsp;Automatic Coupler, AAR 10A</p><p><br></p><p class=\"ql-align-center\"><img src=\"https://inkamultisolusi.co.id/api_cms/public/uploads/editor/20220405061812_yKUWRmjQbLpIRZ1e338x.jpg\" width=\"358\" style=\"\"></p><p class=\"ql-align-center\">Interior Kereta Ekonomi</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><img src=\"https://inkamultisolusi.co.id/api_cms/public/uploads/editor/20220405061938_QQiquIEJ21goqwvuqOme.jpg\" width=\"365\" style=\"\"></p><p class=\"ql-align-center\">Interior Kereta Ekonomi</p>', NULL, '2022-04-05 06:20:17', NULL, NULL, 1, '0201'),
('b2afa44a-bdb6-4c95-80c8-ed059fc2fa3b', 2, 'Lokomotif Diesel Elektrik', 'Diesel Electric Locomotive', '<p><strong>DATA TEKNIS</strong></p><p>Kecepatan maksimum&nbsp;&nbsp;&nbsp;:&nbsp;120 km / jam</p><p>Lebar sepur:&nbsp;1.067 mm</p><p>Jarak antar alat perangkai&nbsp;&nbsp;&nbsp;:&nbsp;15.214 mm</p><p>Tinggi alat perangkai:&nbsp;770 mm</p><p>Jarak antar pivot:&nbsp;7.680 mm</p><p>Berat kosong maksimal:&nbsp;88 ton</p><p>Panjang kereta:&nbsp;14.134 mm</p><p>Lebar kereta:&nbsp;2.642 mm</p><p>Tinggi maksimum:&nbsp;3.636 mm</p><p>Motor traksi:&nbsp;GE FDL-8T</p><p>Sistem pengereman:<em>&nbsp;Pressured Air brake</em></p><p>Kapasitas bahan bakar:&nbsp;3.028 liter</p>', '<p><strong>SPECIFICATION</strong></p><p>Max speed:&nbsp;120 km / hour</p><p>Track gauge :&nbsp;1.067 mm</p><p>Distance among frame :&nbsp;15.214 mm</p><p>Height of frame :&nbsp;770 mm</p><p>Distance of pivot :&nbsp;7.680 mm</p><p>Nett weight :&nbsp;88 ton</p><p>Carbody lenght :&nbsp;14.134 mm</p><p>Carbody width :&nbsp;2.642 mm</p><p>Max height:&nbsp;3.636 mm</p><p>Motor traction:&nbsp;GE FDL-8T</p><p>Brake system:<em>&nbsp;Pressured Air brake</em></p><p>Fuel capacity :&nbsp;3.028 liter</p>', '2022-03-17 06:19:01', NULL, NULL, 1, '0102'),
('b772196b-abf9-447b-a4c8-bef2835dfd72', 2, 'Track Motor Car', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Kecepatan maksimum&nbsp;&nbsp;&nbsp;	:	&nbsp;50 km/jam</p><p>Lebar sepur	                    :	&nbsp;1.067 mm</p><p>Panjang carbody kereta	:	&nbsp;6.600 mm</p><p>Lebar carbody kereta	    :	&nbsp;2.800 mm</p><p>Berat kosong maks.	    :	&nbsp;22.000 kg</p><p>Propulsi	                        :	&nbsp;Mesin Diesel dan Transmisi Hidromekanikal</p><p>Sistem pengereman        :    Sistem Pneumatik</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/13\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a> </p>', NULL, '2022-04-05 09:36:46', NULL, NULL, 1, '0503'),
('b86af63e-3f38-43ec-89b8-0dd09263f7f0', 8, 'HERY PRASETYA', NULL, NULL, NULL, '2022-04-13 06:10:36', '2022-05-11 04:06:57', NULL, 1, NULL),
('bd5972c6-96ec-4ff0-ae0c-18896df7d5b8', 1, 'Penandatanganan Nota Kesepahaman PT INKA dan PT TWC Kembangkan Moda Transportasi Pariwisata Dukung KTT G20', '', '<p class=\"ql-align-justify\">Direktur Utama PT INKA (Persero) Budi Noviantoro dan Direktur Utama PT Taman Wisata Candi Borobudur, Prambanan, dan Ratu Boko atau PT TWC Edy Setijono melakukan Penandatanganan Nota Kesepahaman tentang kerja sama pengembangan moda transportasi pariwisata. Acara diselenggarakan di PT INKA (Persero) dan disaksikan oleh Wakil Menteri II Kementerian BUMN, Kartika Wirjoatmodjo, Minggu, 27 Maret 2022.</p><p class=\"ql-align-justify\">Ruang lingkup Nota Kesepahaman ini, baik PT INKA dan PT TWC bersama - sama mengembangkan dan mengimplementasikan moda transportasi pariwisata, antara lain tram mover, autonomous line tracker bus hingga kereta gantung. Pengembangan ini juga dalam rangka mendukung gelaran KTT G20 2022 di Indonesia.&nbsp;</p><p class=\"ql-align-justify\">Dalam kesempatan tersebut, Wakil Menteri II Kementerian BUMN, Kartika Wirjoatmodjo mengatakan jika kunjungannya ke PT INKA (Persero) untuk meninjau ulang dari kesiapan PT INKA dalam mensuplai bus listrik yang akan digunakan di G20 dan sebagai transportasi publik di Bandung dan Surabaya.</p><p class=\"ql-align-justify\">“Jadi saya hari ini bersama pak Dirut PT INKA, Direktur dari Damri, Direktur dari PELNI, Direktur TWC dan Walikota Madiun mengunjungi pabrik INKA di Madiun. Pertama kita me-review kesiapan suplai bus listrik untuk G20 karena memang pemerintah memberikan kontrak Untuk inka bersama untuk menghasilkan bus listrik yang diharapkan nanti untuk G20. Setelah itu akan digunakan untuk transportasi publik di Bandung dan Surabaya,” ucap Kartika.</p><p class=\"ql-align-justify\">Wakil Menteri II Kementerian BUMN, Kartika Wirjoatmodjo mengungkapkan jika KTT G20 ini merupakan momentum yang baik untuk PT INKA dapat menampilkan&nbsp;produknya di domestik hingga internasional.</p><p class=\"ql-align-justify\">“Nah ini, G20 momuntum yang baik untuk INKA men-showcase produknya sehingga diharapkan kepercayaan&nbsp;domestik dan investor-investor internasional percaya dengan kemampuan indonesia untuk manufaktur bus listrik,” ujar Kartika.</p><p class=\"ql-align-justify\">Dalam pertemuan tersebut Direktur Utama PT TWC Edy Setijono mengatakan bahwa kerjasama yang dilakukan bersama PT INKA yaitu tram mover akan dioperasikan di Taman Mini Indonesia Indah (TMII). Ia juga berharap kolaborasi ini dapat berkembang di dalam kawasan wisata maupun konektifitas antar destinasi wisata.</p><p class=\"ql-align-justify\">“Jadi untuk project pertama kami nanti akan bikin tram mover untuk di aplikasikan di TMII. Tapi kedepan kita berharap kolaborasi TWC bersama INKA ini tidak hanya di taman mini saja tapi untuk pengembangan moda - moda baik di dalam kawasan wisata maupun connectivity antar destinasi wisata. Dan nanti kedepan memang akan menggunakan&nbsp;moda - moda yang berbasis ke enegi terbarukan,” jelas Edy.</p><p class=\"ql-align-justify\">Direktur PT INKA, Budi Noviantoro turut menambahkan dalam wawancara tersebut&nbsp;jika tram mover akan menjadi ikonik di Taman Mini sebab menggunakan teknologi yang terbarukan.</p><p class=\"ql-align-justify\">“Yang penting tram mover ini kan sesuatu yang baru secara teknologi dan secara mode yang saya kira akan menarik menjadi ikonik di TMII. Jadi harapan nanti pas delegasi G20 bisa menikmati indahnya Taman Mini menggunakan tram mover, “ jelas Budi.</p><p class=\"ql-align-justify\"><strong>Pemindahan Rel Pertamina di depan PT INKA</strong></p><p class=\"ql-align-justify\">Walikota Madiun, Maidi yang juga hadir pada kesempatan tersebut saat ditanya awak media mengenai penataan ulang rel serong yang dilintasi gerbong Pertamina di depan kantor PT INKA (Persero) Madiun, Walikota Madiun Maidi menyampaikan akan mengkoordinasikan lebih lanjut untuk mengurangi bahaya kecelakaan bagi pengendara yang melintas khususnya ketika musim hujan datang.&nbsp;</p><p class=\"ql-align-justify\">“Ada beberapa hal yang memang keluhan untuk Pemkot, salah satunya rel Pertamina yang sering membawa kecelakaan, ini insya Allah akan koordinasikan kalau bisa dialihkan lewat belakang (pabrik INKA menuju Depo Pertamina). semua akses yang sifatnya tanah pemerintah daerah kita perbolehkan (untuk digunakan) semuanya. Sehingga nanti penataan untuk INKA sendiri akan semakin sempurna, dan warga sendiri juga nyaman, dan pertumbuhan ekonomi dengan INKA ini luar biasa untuk Kota Madiun, terima kasih sekali,” jelas Maidi.</p><p class=\"ql-align-justify\">Wakil Menteri II Kementerian BUMN, Kartika Wirjoatmodjo juga mendukung perihal penataan tersebut. Kartika berharap agar dalam penataanya bisa menggunakan area atau tanah yang lain</p><p class=\"ql-align-justify\">“Kita mendukung Pak, ini namanya kan bagian dari penataan kota ya, INKA ada di kota Madiun, bisa menata tempat testingnya segala macam supaya tetap friendly. Kita welcome sama dukungan dari Pak Walikota kita bisa menggunakan tanah-tanah lain yang bisa kita manfaatkan,” pungkas Kartika.</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><a href=\"https://www.inka.co.id/berita/879\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p><p><br></p>', '<p>DS</p>', '2022-03-17 05:52:02', '2022-04-07 03:25:11', NULL, 1, NULL),
('c0b68074-b4ac-4d67-baae-307eaba85ef5', 7, 'Organisasi', 'Organization', '<p><img src=\"https://inkamultisolusi.co.id/api_cms//public/uploads/editor/20220407044906_q9M4f9kYrzlCw8zYy2YP.jpg\"></p>', '<p><img src=\"http://localhost/cms_ims/api/public/uploads/editor/20220405054745_1Xxd6gTcdINe5qB2Jpzf.png\" width=\"1043\" style=\"cursor: nwse-resize;\"></p>', '2022-04-05 05:48:18', '2022-04-07 04:49:25', NULL, 1, NULL),
('c20e482d-ca3f-4172-9977-331be1308ddd', 2, 'Gerbong Pembangkit', NULL, '<p class=\"ql-align-justify\">Gerbong pembangkit ini didesain dan diproduksi untuk pengoperasian pada kondisi iklim tropis, suhu maksimum 45 derajat Celcius, kelembapan 95%, dan kecepatan maksimum 100 km /jam.</p><p class=\"ql-align-justify\"><br></p><p><strong class=\"ql-size-large\">DATA TEKNIS	</strong></p><p>Jenis Mesin&nbsp;&nbsp;	            :	&nbsp;Diesel</p><p>Kapasitas	                :	&nbsp;500 kVA</p><p>Putaran Mesin	            :	&nbsp;1500 rpm</p><p>Sistem Pendinginan	:	&nbsp;Pendinginan Air</p><p>Bahan Bakar	            :	&nbsp;Fuel B20</p><p>Starting	                    :	&nbsp;24 VDC Starter Motor</p><p>Tipe	                            :	&nbsp;4 cycle</p><p>Daya Engine	            :	&nbsp;&gt;500 kW</p><p>Continous Rate           :   70% dari daya genset selama 1 jam</p><p>Overload Permitted     :   110% dari Daya Genset selama 1 jam</p><p>Speed Regulation       :    <span style=\"color: rgb(35, 35, 35);\">+- 0.25 %</span></p><p>Air Cleaner                 :    <span style=\"color: rgb(35, 35, 35);\">Dry</span></p><p>Aspiration                   :   <span style=\"color: rgb(35, 35, 35);\">Turbocharged - Aftercooled</span></p><p>Application                 :    <span style=\"color: rgb(35, 35, 35);\">Railway / Moving Vehicle Application</span></p><p>Engine Governor       :    <span style=\"color: rgb(35, 35, 35);\">Elektronik / Elektrik</span></p><p>Tingkat Kebisingan    :   <span style=\"color: rgb(35, 35, 35);\">Maksimal 88.5 dB (A)</span></p><p><br></p>', NULL, '2022-04-05 08:57:51', NULL, NULL, 1, '0407'),
('c9f24013-4ac1-4c59-9cc8-9f4c04648647', 2, 'Kereta Kelas Eksekutif', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Kecepatan maksimum&nbsp;&nbsp;&nbsp;	:	&nbsp;120 km / jam</p><p>Lebar sepur	                    :	&nbsp;1.067 mm</p><p>Beban gandar              	:	&nbsp;14 ton</p><p>Panjang kereta	            :	&nbsp;20.920 mm</p><p>Lebar kereta	                :	&nbsp;2.990 mm</p><p>Tinggi kereta	                :	&nbsp;3.610 mm</p><p>Tinggi coupler	                :	&nbsp;775 (+10/-0) mm</p><p>Bogie	                            :	&nbsp;TB-1014</p><p>Sistem pengereman	    :	&nbsp;Air brake</p><p>Coupler Device	            :	&nbsp;Automatic Coupler, AAR 10A</p><p><br></p><p class=\"ql-align-center\"><img src=\"https://inkamultisolusi.co.id/api_cms/public/uploads/editor/20220405063216_sff05geBiafvevgRsxEu.jpg\" width=\"402\" style=\"\"></p><p class=\"ql-align-center\"><span style=\"color: rgb(64, 64, 64);\">Interior Kereta Kelas Eksekuti</span>f</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><img src=\"https://inkamultisolusi.co.id/api_cms/public/uploads/editor/20220405063335_jZjy4cpaqVwTYdzyoKM6.jpg\" width=\"413\" style=\"\"></p><p class=\"ql-align-center\"><span style=\"color: rgb(64, 64, 64);\">Interior Kereta Kelas Eksekutif Dilengkapi Fasilitas untuk Difabel</span></p><p><br></p>', NULL, '2022-04-05 06:34:04', NULL, NULL, 1, '0203'),
('cc6fde5c-a49e-4424-bf46-711637da2ab5', 2, 'Kereta Kedinasan', NULL, NULL, NULL, '2022-04-07 04:57:06', NULL, NULL, 1, '0504'),
('d9b3ad73-fe3c-467d-9659-c69158d248af', 2, 'Kereta Ekspor ke Bangladesh', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Lebar sepur	                    :	&nbsp;1.676 mm</p><p>Beban gandar	                :	&nbsp;12,8 ton</p><p>Kecepatan maksimum&nbsp;&nbsp;	:	&nbsp;120 km/jam</p><p>Berat kereta	                :	&nbsp;37 - 44 ton</p><p>Material carbody	            :	&nbsp;Stainless steel</p><p>Bogie	                            :	&nbsp;MD 53 M Lisensi Bombardier</p><p>Sistem pengereman	    :	&nbsp;Automatic air brake, Standar UIC</p><p>Coupler	                        :	&nbsp;Draw hook, Screw coupling, Side buffer</p><p>Material cat	                    :	&nbsp;Polyurethene</p><p><br></p><p><strong class=\"ql-size-large\">Interior Kereta Ekspor Bangladesh</strong></p><p class=\"ql-align-center\"><img src=\"https://inkamultisolusi.co.id/api_cms/public/uploads/editor/20220405065551_Mhxe9s6JXquPdKxc5ZR0.jpg\" width=\"417\" style=\"\">              <img src=\"https://inkamultisolusi.co.id/api_cms/public/uploads/editor/20220405065612_O5Xa3LADyM2qGt2ij1d8.jpg\" width=\"417\" style=\"\"></p><p class=\"ql-align-center\"><br></p><p><a href=\"https://www.inka.co.id/product/view/52\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p>', NULL, '2022-04-05 06:57:26', NULL, NULL, 1, '0204'),
('db66249d-9b5c-411d-b512-fc316bdc8617', 2, 'PPCW Rail', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Kecepatan maksimum&nbsp;&nbsp;&nbsp;	        :	&nbsp;80 km / jam</p><p>Lebar sepur                         	:	&nbsp;1.067 mm</p><p>Kapasitas beban maksimal&nbsp;	:	&nbsp;44.000 kg</p><p>Panjang kereta	                    :	&nbsp;14.600 mm</p><p>Lebar kereta	                        :	&nbsp;2.438 mm</p><p>Bogie	                                    :	&nbsp;Barber type, 3 pieces</p><p>Sistem pengereman	            :	&nbsp;Air brake, UIC 540</p><p>Coupler Device	                    :	&nbsp;Automatic Coupler, AAR 10A</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/17\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p><p><br></p>', NULL, '2022-04-05 08:35:57', NULL, NULL, 1, '0403'),
('e769e2ec-a754-4373-83b1-03ecae6e76fb', 3, 'Tentang IMS', 'About IMS', '<p><strong>Profil Perusahaan</strong></p><p class=\"ql-align-justify\">PT INKA Multi Solusi adalah anak perusahaan PT Industri Kereta Api (Persero) yang bergerak di bidang jasa manufaktur produk perkeretaapian dan transportasi darat. Didukung dengan sumberdaya yang memiliki kompetensi sesuai bidangnya, PT INKA Multi Solusi telah menunjukkan kontribusinya dan siap untuk bersaing di pasar industri produk perkeretaapian dan transportasi darat.</p><p class=\"ql-align-center\"><img src=\"https://inkamultisolusi.co.id/api_cms/public/uploads/editor/20220317062310_vIJnv9GHulQSwMAB9Rco.png\" width=\"921\"></p><p class=\"ql-align-center\"><em style=\"color: rgb(64, 64, 64);\">PT IMS\'s Milestone</em></p><p class=\"ql-align-center\"><img src=\"https://inkamultisolusi.co.id/api_cms/public/uploads/editor/20220317062321_AJHg64pzACpqWiPN54B1.png\" width=\"925\"></p><p class=\"ql-align-center\"><em>Corporate Culture</em></p><iframe class=\"ql-video ql-align-center\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://www.youtube.com/embed/9yVSNZ3pFLg?showinfo=0\" width=\"620\" height=\"366\" style=\"cursor: nwse-resize;\"></iframe><p class=\"ql-align-center\"><br></p>', '<p><strong><em>Company Profile</em></strong></p><p class=\"ql-align-justify\">PT INKA Multi Solusi is a subsidiary of PT Industri Kereta Api (Persero), a state own company in Indonesia, engaged in manufacturing products of railways and other transportation. Supported by human resources that have the appropriate competences and modern facilities, PT INKA Multi Solusi has demonstrated its contribution and be ready to compete in the market of industrial products of railways and other transportation.&nbsp;</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-center\"><img src=\"http://localhost/cms_ims/api/public/uploads/editor/20220317062310_vIJnv9GHulQSwMAB9Rco.png\" width=\"921\"></p><p class=\"ql-align-center\"><em style=\"color: rgb(64, 64, 64);\">PT IMS\'s Milestone</em></p><p class=\"ql-align-center\"><img src=\"http://localhost/cms_ims/api/public/uploads/editor/20220317062321_AJHg64pzACpqWiPN54B1.png\" width=\"925\"></p><p class=\"ql-align-center\"><em>Corporate Culture</em></p><iframe class=\"ql-video ql-align-center\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://www.youtube.com/embed/9yVSNZ3pFLg?showinfo=0\" height=\"366\" width=\"620\"></iframe><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><br></p>', '2022-03-17 06:28:06', '2022-03-17 06:30:31', NULL, 1, NULL),
('f48686c6-fbf1-4e92-823d-ec3ab8cb7ab7', 2, 'Gerbong Tangki Bahan Bakar', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Kapasitas maksimum&nbsp;&nbsp;&nbsp;	:	&nbsp;40.000 kg / 50.6 m kubik</p><p>Kecepatan maksimum&nbsp;&nbsp;&nbsp;	:	&nbsp;80 km / jam</p><p>Lebar sepur	                    :	&nbsp;1.067 mm</p><p>Panjang kereta	            :	&nbsp;12.800 mm</p><p>Lebar kereta	                :	&nbsp;2.420 mm</p><p>Diameter tangki	            :	&nbsp;2.400 mm</p><p>Bogie	                            :	&nbsp;Barber type</p><p>Sistem pengereman	    :	&nbsp;Air brake</p><p>Coupler Device	            :	&nbsp;Automatic Coupler</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/25\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p><p><br></p>', NULL, '2022-04-05 08:48:39', NULL, NULL, 1, '0405'),
('f5e82d05-d002-47bd-a5a7-fb04d52d66bf', 2, 'Kereta Bagasi', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS</strong></p><p>Desain kecepatan maksimum&nbsp;&nbsp;&nbsp;	        :	&nbsp;120 km / jam</p><p>Kecepatan maksimum operasional&nbsp;	:	&nbsp;100 km / jam</p><p>Lebar sepur	                                        :	&nbsp;1.067 mm</p><p>Kapasitas beban maksimal	                :	&nbsp;33.000 kg</p><p>Panjang kereta	                                :	&nbsp;20.920 mm</p><p>Lebar kereta	                                    :	&nbsp;2.990 mm</p><p>Tinggi kereta	                                    :	&nbsp;3.610 mm</p><p>Bogie	                                                :	&nbsp;TB-398, Pedestial type with bolster</p><p>Sistem pengereman	                        :	&nbsp;Air brake</p><p>Coupler Device	                                :	&nbsp;Automatic Coupler, AAR 10A</p><p>Sistem elektrikal	                                :	&nbsp;380 Volt, 3 fase, 50 Hz</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/16\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p>', NULL, '2022-04-05 07:57:53', NULL, NULL, 1, '0402'),
('f64e7c81-1498-4733-985a-b1f2ea37995d', 2, 'Kereta Rel Listrik (KRL)', NULL, '<p><strong class=\"ql-size-large\">DATA TEKNIS	</strong></p><p>Konfigurasi	:	&nbsp;Tc1-M1-M2-M2\"-M1\"-Tc2</p><p>Kecepatan maksimum&nbsp;&nbsp;&nbsp;	                        :	&nbsp;100 km / jam</p><p>Lebar sepur	                                            :	&nbsp;1.067 mm</p><p>Beban gandar	                                        :	&nbsp;14 ton</p><p>Panjang kereta	                                    :	&nbsp;Tc = 20.219 mm</p><p>                                                                     Mc = 20.000 mm</p><p>Lebar kereta (side wall)	                        :	&nbsp;2.992 mm</p><p>Lebar kereta (termasuk sinyal samping)	:	&nbsp;3.142 mm</p><p>Tinggi kereta dari atas rel	                    :	&nbsp;3.800 mm</p><p>Tinggi lantai dari atas rel	                        :	&nbsp;1.100 mm</p><p>Tinggi coupler                                        	:	&nbsp;775 (+10/-0) mm</p><p>Berat kosong maksimal	                        :	&nbsp;Tc1 &amp; Tc2 = 39 ton</p><p>                                                                     M1, M2, M2\"-M1 = 45 ton</p><p>Tempat duduk	                                         :	&nbsp;Tc1 &amp; Tc2 = 40 seats</p><p>                                                                    &nbsp;M1, M2, M2\"-M1=48 seats</p><p>                                                                     Total = 272 seats</p><p><br></p><p><a href=\"https://www.inka.co.id/product/view/67\" rel=\"noopener noreferrer\" target=\"_blank\">Sumber</a></p>', NULL, '2022-04-05 07:28:41', NULL, NULL, 1, '0302'),
('f8b32bb2-76d5-42c1-8bf1-902bd01fd33f', 4, 'Visi & Misi', 'Vision & Mission', '<p class=\"ql-align-center\"><strong class=\"ql-size-large\">VISION</strong></p><p class=\"ql-align-center\">Penyedia Jasa “Total Solution Provider” di Bidang Konstruksi dan Perdagangan</p><p><br></p><p class=\"ql-align-center\"><strong class=\"ql-size-large\">MISSION</strong></p><p class=\"ql-align-center\">Mendorong Proses yang Fleksibel dan Efisien untuk Meningkatkan Pertumbuhan Pendapatan dan Laba Perusahaan</p><p><br></p>', '<p class=\"ql-align-center\"><strong class=\"ql-size-large\">VISION</strong></p><p class=\"ql-align-center\">Service Provider of “Total Solution Provider” in The Fields of Construction and Trade.</p><p><br></p><p class=\"ql-align-center\"><strong class=\"ql-size-large\">MISSION</strong></p><p class=\"ql-align-center\">Promoting Flexible and Efficient Processes to Increase Company’s Revenue and Profit Growth.</p><p><br></p>', '2022-04-05 05:11:23', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `editor_image`
--

CREATE TABLE `editor_image` (
  `id` int(11) NOT NULL,
  `file_name_original` text DEFAULT NULL,
  `file_name_generated` text DEFAULT NULL,
  `dibuat_pada` timestamp NULL DEFAULT NULL,
  `diubah_pada` timestamp NULL DEFAULT NULL,
  `dihapus_pada` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `editor_image`
--

INSERT INTO `editor_image` (`id`, `file_name_original`, `file_name_generated`, `dibuat_pada`, `diubah_pada`, `dihapus_pada`) VALUES
(1, '2438132-removebg-preview.png', '20220317050126_u0AlzsE89GfVdW6V5vK3.png', '2022-03-17 05:01:26', NULL, '2022-03-17 05:02:01'),
(2, '19198446-removebg-preview.png', '20220317050209_2ZVgbww4PYGnY5uiWGvP.png', '2022-03-17 05:02:09', NULL, '2022-03-17 06:23:13'),
(3, 'milestone.png', '20220317062310_vIJnv9GHulQSwMAB9Rco.png', '2022-03-17 06:23:10', NULL, NULL),
(4, 'corporate culture.png', '20220317062321_AJHg64pzACpqWiPN54B1.png', '2022-03-17 06:23:21', NULL, NULL),
(5, 'sto-min.png', '20220405054745_1Xxd6gTcdINe5qB2Jpzf.png', '2022-04-05 05:47:45', NULL, NULL),
(6, 'K3 lama 2.jpg', '20220405061812_yKUWRmjQbLpIRZ1e338x.jpg', '2022-04-05 06:18:12', NULL, NULL),
(7, 'K3 lama 3.jpg', '20220405061916_KzPZMwBVH0SG84sNr0mU.jpg', '2022-04-05 06:19:16', NULL, '2022-04-05 06:19:27'),
(8, 'K3 lama 3-min.jpg', '20220405061938_QQiquIEJ21goqwvuqOme.jpg', '2022-04-05 06:19:38', NULL, NULL),
(9, 'K3 Premium-min.jpg', '20220405062624_5ND0054uxayiKZywx7VK.jpg', '2022-04-05 06:26:24', NULL, NULL),
(10, 'K3 Premium 2(1)-min.jpg', '20220405062740_G73zyQe3NfDxRBNexsFm.jpg', '2022-04-05 06:27:40', NULL, NULL),
(11, 'K1 2-min.jpg', '20220405063216_sff05geBiafvevgRsxEu.jpg', '2022-04-05 06:32:16', NULL, NULL),
(12, 'Interior K1 DIf-min-min.jpg', '20220405063335_jZjy4cpaqVwTYdzyoKM6.jpg', '2022-04-05 06:33:36', NULL, NULL),
(13, 'Bangladesh 2.jpg', '20220405065551_Mhxe9s6JXquPdKxc5ZR0.jpg', '2022-04-05 06:55:51', NULL, NULL),
(14, 'Bangladesh 3.jpg', '20220405065612_O5Xa3LADyM2qGt2ij1d8.jpg', '2022-04-05 06:56:12', NULL, NULL),
(15, 'WhatsApp Image 2020-01-13 at 13.49.18.jpeg', '20220405074949_qjRo2etB4CLaDxrZPkFR.jpeg', '2022-04-05 07:49:49', NULL, NULL),
(16, 'STO Induk dan Turunan - 2022-min.jpg', '20220407044906_q9M4f9kYrzlCw8zYy2YP.jpg', '2022-04-07 04:49:06', NULL, NULL),
(17, 'maintenance.png', '20220407045911_5XOjeRCXJsWPBnO5MKoM.png', '2022-04-07 04:59:11', NULL, NULL),
(18, '0001.jpg', '20220407050227_E4RTQlBEIvbPMB6wDafS.jpg', '2022-04-07 05:02:27', NULL, NULL),
(19, '0002.jpg', '20220407050237_ySnQmdsc9pPVvgQmvB0B.jpg', '2022-04-07 05:02:37', NULL, NULL),
(20, '0003.jpg', '20220407050244_XJp8WRVONVjeYY5TlwZb.jpg', '2022-04-07 05:02:44', NULL, NULL),
(21, 'logo_IMSS.png', '20220511071342_LSnL6WiOy67Xd9mKGDaG.png', '2022-05-11 07:13:42', NULL, NULL),
(22, 'logo_IMST.png', '20220511071653_6s7nPBCLbK5kyYhQ2ZBu.png', '2022-05-11 07:16:53', NULL, NULL),
(23, 'logo_IMST.jpg', '20220511071818_tam3yQp9C2Xe6Z0Of0tc.jpg', '2022-05-11 07:18:18', NULL, NULL),
(24, 'logo_IMST.png', '20220511072521_TNNNsmBMz8MeIWdtGStZ.png', '2022-05-11 07:25:21', NULL, NULL),
(25, 'logo_IMSC.png', '20220511073222_2SzQxqjuUyfU5xboS2X2.png', '2022-05-11 07:32:22', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `id` varchar(100) NOT NULL,
  `file_name_original` text DEFAULT NULL,
  `file_name_generated` text DEFAULT NULL,
  `cms_konten_id` varchar(100) DEFAULT NULL,
  `keterangan_idn` text DEFAULT NULL,
  `keterangan_eng` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`id`, `file_name_original`, `file_name_generated`, `cms_konten_id`, `keterangan_idn`, `keterangan_eng`) VALUES
('056f87c9-0cc1-48fa-9176-4d9cb66e97f0', '4.jpg', '20220405071944_W2WiAvsrfkpRmc2Xa7pa.jpg', '6424b113-ac08-4d5c-95cb-1519b5e575a3', 'Kereta Rel Diesel Philippine National Railways', NULL),
('06f0610e-037e-49a0-82e5-eff677f61f52', 'Dirkeu & SDM.jpg', '20220413060901_rWQhAT8dPZzCMEXGz6M6.jpg', '683e8a11-29e8-458b-ae50-0ccc8635bdd2', 'Direktur Keuangan, SDM & Manajemen Risiko', NULL),
('0782d614-24a9-495b-a395-9e42fd07dc03', 'TMC-min.jpg', '20220405093646_qaxGN0FofES1IsJvlcFz.jpg', 'b772196b-abf9-447b-a4c8-bef2835dfd72', 'Track Motor Car', NULL),
('0c3f9b06-7790-4cc1-99d7-08051087a951', 'BIM_Eksterior_compress__min-compress1.jpg', '20220405070725_j2e52YyDzrhGOc9Ybkil.jpg', '3e37861e-3fad-4fa0-a16e-74308fc27944', 'Kereta Rel Diesel Elektrik (KRDE)', NULL),
('253e7997-605b-436d-8706-2421c1f8b14a', '4099d035-fdb9-45d1-bb8e-0052b43ec93e.jpg', '20220413043410_MNUqB2c4jUMGeg729JIL.jpg', '7bf6080c-2989-4810-a7a5-2a8b1a6c9fd1', 'Komisaris', NULL),
('3a25ad51-fb23-46ac-9a4f-3ccd04e41953', 'WELL WAGON FOR LTA SINGAPORE-min.jpg', '20220405091458_uGJfBYZkvzwofsrftOhh.jpg', '5170e744-a74d-4ee9-9087-3e099e91d59d', 'Well Wagon', NULL),
('43177d0e-1813-4dfe-8c94-0ba1cd3f9319', 'DSC_5578-compress1.jpg', '20220405075402_bvwlKZr2QduRnDJZqxRH.jpg', '0e987705-8329-4bcc-ae6d-f5812d35f354', 'Gerbong Datar (PPCW)', NULL),
('4c111caf-66b8-45c2-96be-0c3a30430f45', 'KKBW_Th_2011-compress1.jpg', '20220405084206_mTs7D0jXy5uTpOChSjuJ.jpg', '4367c966-67f2-4b31-bbce-db1fe0463a3f', 'KKBW', NULL),
('5933c360-93e7-408d-a0cf-ab4c18506ebf', 'K1_SS_min-compress1.jpg', '20220405065028_qzlWkiw822rCz76j56ww.jpg', '4adbc63b-fbc6-4098-b0ce-9a0286daff4f', 'Kereta Kelas Eksekutif Stainless Steel', NULL),
('595b3d58-633f-4fc2-bdda-a3047612e786', 'kereta hidrolik.jpg', '20220317061558_Fccuk4YR6JCOfGHAMuT0.jpg', '31ccfcf6-48b8-4610-bbb4-4331a36dc191', 'Lokomotif Diesel Hidrolik', 'Lokomotif Diesel Hidrolik'),
('6c5f01c0-8ca3-483c-b2a1-8473fc676107', 'KRDI-compress1.jpg', '20220405071218_FbP4JYLgjB3IDyCcvnw4.jpg', '0f0fa1c5-d969-4cbe-ba92-bc1b0741d3fb', 'Kereta Rel Diesel Indonesia (KRDI)', NULL),
('6e760248-e35a-4078-959b-51f179c054d4', 'K3(3)-min.jpg', '20220405062807_NfgOrORdmHIluZAivEC2.jpg', '40688b5d-1996-491b-bd1d-11af1a62c4f8', 'Kereta Kelas Ekonomi Premium', NULL),
('70c6af2e-1140-4963-9b1a-dfcbf4683e1a', 'KA KEDINASAN compress.jpg', '20220407045706_bQfsSK0kzCtKtXSgKzLA.jpg', 'cc6fde5c-a49e-4424-bf46-711637da2ab5', 'Kereta Kedinasan adalah produk yang disesuaikan dengan desain mewah yang diminta oleh pelanggan. Umumnya memiliki ruang pertemuan yang mewah, ruang tidur dan ruang makan yang dilengkapi dengan fasilitas hiburan di dalamnya. Jendela dibangun dengan kaca antipeluru untuk memastikan keselamatan penumpang. Kereta Kedinasan umumnya dipesan oleh institusi pemerintah.', NULL),
('73013bef-d9c0-4ee1-a3ed-f1c8d8666854', 'WhatsApp Image 2022-03-27 at 21.07.16.jpeg', '20220407032511_ZyDjhpb7shaWXemMzUUF.jpeg', 'bd5972c6-96ec-4ff0-ae0c-18896df7d5b8', 'Direktur Utama PT TWC Edi Setijono (kiri), Wakil Menteri II Kementerian BUMN Kartika Wirjoatmodjo (tengah) dan Direktur Utama PT INKA (Persero) Budi Noviantoro', ''),
('73c87654-fdf9-4c7a-a877-498cd10f13be', 'Dirut.jpg', '20220413060743_ZpiVdtXnVp9mxA8u3PWY.jpg', '759160cc-e1eb-4bc3-911d-e2e121eebd0a', 'Direktur Utama', NULL),
('765a2c26-9121-4331-b56e-252ec22ef98d', 'DSC-3537-min.jpg', '20220405073836_DMZG2nmrxFGSb071Tnnt.jpg', '49f8c03c-3419-4c09-bdc2-55e31592fba6', 'Railbus', NULL),
('7ee62a0a-84c5-4921-b26b-ab5b3cf1f8a6', 'DSC_7331-compress1.jpg', '20220405075753_2XM6U55NlkvMYFiPP3D1.jpg', 'f5e82d05-d002-47bd-a5a7-fb04d52d66bf', 'Kereta Bagasi', NULL),
('80c9137b-fd4e-4efb-927e-1b5ba859165f', 'ZZOW 1.jpg', '20220405083909_rAjUbV17J0mxoqyeA2bi.jpg', '283684d4-8eb4-44d3-949a-b4db44a8e254', 'ZZOW', NULL),
('907da1b8-9c69-42b1-9c33-c55c93fbc84f', 'Gerbong-Tangki-KKW-Th-2009.jpg', '20220405084839_JcTzlsIMoSj3K8YPzjrv.jpg', 'f48686c6-fbf1-4e92-823d-ec3ab8cb7ab7', 'Gerbong Tangki Bahan Bakar', NULL),
('9ed7c6ab-a644-4e6e-95a2-51dcb62c9374', 'kereta_ekonomi-min.jpg', '20220405062017_v1yeQXDgwA5jlXyC14fM.jpg', '8a3344bc-acd4-47bd-9a04-47f0147ceb5a', 'Kereta Ekonomi', NULL),
('a0fcf857-d171-486c-ace0-69032b3d35d9', 'vvRailink2-min (2).jpg', '20220405072841_8v9yQVfEVb5BcaXDClqy.jpg', 'f64e7c81-1498-4733-985a-b1f2ea37995d', 'Kereta Rel Listrik (KRL)', NULL),
('aba42deb-7c6f-45a9-b11d-3546e5f768fe', 'KA inspeksi comp.jpg', '20220405091741_u3ME31DWmNiUricjDEg3.jpg', '3a0dc1c7-a93c-497a-acf1-86013b9f5251', 'Kereta Inspeksi', NULL),
('abc53fd3-f08e-4167-8947-be7da04d06d2', 'WhatsApp Image 2020-01-13 at 16.41.04.jpeg', '20220405075032_D4rW1Xh6b6fza1AsDVTH.jpeg', '3db1eba5-b83f-4e3b-82fa-9530f278d4b0', 'LRT Jabodebek', NULL),
('ac094695-44a3-4b5d-9e58-159b584c8b3b', 'img4.jpg', '20220405092355_8qIZJuLwAMQDPWlv8S4n.jpg', '615a2f5d-b9d7-4b4b-9d20-6a9ca9f267ac', 'Kereta Ukur', NULL),
('ad485b2d-7be1-49b2-8670-71c0a438dea0', 'diesel elektrik.jpg', '20220317061901_0xeKKyht5CN2RL7y4jAE.jpg', 'b2afa44a-bdb6-4c95-80c8-ed059fc2fa3b', 'Lokomotif Diesel Elektrik', 'Lokomotif Diesel Elektrik'),
('b04f033f-9399-4131-bd8d-385d49d56783', 'Dadan Tri Yudianto.jpg', '20220413031701_ZinSKeuUkjXVzTismDf6.jpg', '751a0f69-8843-44d3-b9d5-f37ff120b7f5', 'Komisaris', NULL),
('b4863db1-7773-4a9b-95be-27469e0ca924', 'Power_Car-compress1.jpg', '20220405085751_Zq8YDOfOlblLnzdkmFnf.jpg', 'c20e482d-ca3f-4172-9977-331be1308ddd', 'Gerbong Pembangkit', NULL),
('b856474b-d24e-40bb-bc79-5737ec3eb034', 'LRT-min.jpg', '20220405074754_MKK0W4MT5uCDGvGSczca.jpg', '29d3c69f-17c1-4260-be7b-c527d0bf9469', 'Light Rail Transit', NULL),
('baa8d796-bafd-4e7d-8cdc-0929ad1e0ce8', '20211111_100306.jpg', '20220407050355_9fGa5zNbmyPEIwCoMpgf.jpg', '8322fb48-3081-4db7-a880-801e8581a1be', 'Pertashop', NULL),
('c41f430f-83df-4cda-a4c2-fbfdfb9147e5', 'Bangladesh-min.jpg', '20220405065726_07yOyXElO8Yi60T7C5YV.jpg', 'd9b3ad73-fe3c-467d-9659-c69158d248af', 'Kereta Ekspor ke Bangladesh', NULL),
('d0a2e5c1-61ef-46c5-8afd-94296c9f6e2f', 'DSC_4964-compress1.jpg', '20220405083557_0DYwbc9pFcCSgrVcjUt2.jpg', 'db66249d-9b5c-411d-b512-fc316bdc8617', 'PPCW Rail', NULL),
('dce01aed-a85f-4add-9f6b-58db2c08dd07', 'K1 Edit-min.jpg', '20220405063404_E20t6BkcvzRx6ZNqIlZd.jpg', 'c9f24013-4ac1-4c59-9cc8-9f4c04648647', 'Kereta Kelas Eksekutif', NULL),
('dd97bb87-de4f-4fd5-a22e-3e1fbf12e331', 'tentangims.png', '20220317062806_CtnvbkeloNRuBWdnblMb.png', 'e769e2ec-a754-4373-83b1-03ecae6e76fb', NULL, NULL),
('e009cfd0-5d1c-494b-9224-0fd035c3e319', 'Picture1-min (1).png', '20220405051123_s4zyqvEojJ6tIof03SOd.png', 'f8b32bb2-76d5-42c1-8bf1-902bd01fd33f', NULL, NULL),
('eac428a9-a511-4e0c-8ab6-f280db7ac802', 'Haris Munandar 1.jpg', '20220413022636_mmXNseQJvLlBP4fsU62L.jpg', '84537c55-01aa-4a2d-a5e2-82b1eb6e6587', 'Komisaris Utama', NULL),
('ec22161b-02df-4d87-8238-30c26e26b963', 'HERY PRASTYA Mart 2022-1.png', '20220413061036_j9wu1knEOYvvUtFVRDmX.png', 'b86af63e-3f38-43ec-89b8-0dd09263f7f0', 'Direktur Produksi', NULL),
('f1144a26-d543-4aae-ad8a-587898d39237', 'Andy Budiman 1.jpg', '20220413022749_NJGslX69OyoXl1rdKTXH.jpg', '311fae97-3fd7-48a2-806f-f8f8d01c2d00', 'Komisaris', NULL),
('f4d67cab-9809-41f9-8d24-cee71200ce31', 'Dirtek.jpg', '20220413061529_pnwHWJXXWa8zzsYydxSD.jpg', '759eaaab-1b49-401e-81a6-3adbf2b4bc3b', 'Direktur Teknologi', NULL),
('fe9d3469-dec2-4d67-b646-9f7db5851d8a', '19198446-removebg-preview.png', '20220317054838_QB1Tx7QmRnDxKfozZ8b4.png', '860e8884-a8b2-48b7-88d9-6d39367e4e46', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `gedung`
--

CREATE TABLE `gedung` (
  `id` int(11) NOT NULL,
  `gedung` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gedung`
--

INSERT INTO `gedung` (`id`, `gedung`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Gedung P', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `image_slider`
--

CREATE TABLE `image_slider` (
  `id` varchar(255) NOT NULL,
  `file_name_generated` text NOT NULL,
  `file_name_original` text NOT NULL,
  `di_buat_pada` timestamp NULL DEFAULT NULL,
  `di_edit_pada` timestamp NULL DEFAULT NULL,
  `dihapus_pada` timestamp NULL DEFAULT NULL,
  `di_buat_oleh` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `image_slider`
--

INSERT INTO `image_slider` (`id`, `file_name_generated`, `file_name_original`, `di_buat_pada`, `di_edit_pada`, `dihapus_pada`, `di_buat_oleh`) VALUES
('an9qcZRd40R0cnQ8f38W', '20220407033311_ECxSrRupCFhaK03HzqxY.jpg', 'slider_2_optimized.jpg', '2022-04-07 03:33:11', NULL, NULL, 1),
('eTwbuL60l7O7ITU9MWyl', '20220407044659_KEDa3c0JPzxzM4u7EWpp.jpg', 'LOGO COVID (4)-min.jpg', '2022-04-07 03:31:34', '2022-04-07 04:46:59', NULL, 1),
('iKvpl6Qk8657Oh9RD5o3', '20220407031601_tOqAyIvMHXQSLM2FnUYA.jpg', 'gb-min.jpg', '2022-03-17 04:30:35', '2022-04-07 03:16:01', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(1, 'Berita'),
(2, 'Produk'),
(3, 'Tentang IMS'),
(4, 'Visi Misi'),
(5, 'Anak Perusahaan'),
(7, 'Struktur Organisasi'),
(8, 'BOC & BOD');

-- --------------------------------------------------------

--
-- Table structure for table `list_produk`
--

CREATE TABLE `list_produk` (
  `id` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `list_produk`
--

INSERT INTO `list_produk` (`id`, `nama`) VALUES
('01', 'Lokomotif'),
('0101', 'Lokomotif Diesel Hidrolik'),
('0102', 'Lokomotof Diesel Elektrik'),
('02', 'Kereta Penumpang'),
('0201', 'Kereta Ekonomi'),
('0202', 'Kereta Ekonomi Premium'),
('0203', 'Kereta Kelas Eksekutif'),
('0204', 'Kereta Ekspor'),
('03', 'Kereta Berpenggerak'),
('0301', 'Kereta Rel Diesel'),
('0302', 'Kereta Rel Listrik'),
('0303', 'Kereta Rel Diesel Elektrik'),
('0304', 'Railbus'),
('0305', 'Light Rail Transit'),
('04', 'Gerbong Barang'),
('0401', 'Gerbong Datar (PPCW)'),
('0402', 'Gerbong Bagasi'),
('0403', 'PPCW Rail'),
('0404', 'ZZOW'),
('0405', 'KKBW'),
('0407', 'Gerbong Pembangkit'),
('0408', 'Well Wagon'),
('05', 'Kereta Khusus'),
('0501', 'Kereta Inspeksi'),
('0502', 'Kereta Ukur'),
('0503', 'Track Motor Car'),
('0504', 'Kereta Kedinasan'),
('06', 'Produk Pengembangan'),
('0601', 'Pertashop');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id` int(11) NOT NULL,
  `lokasi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id`, `lokasi`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Workshop Bogie', NULL, NULL, NULL),
(2, 'Workshop piping', NULL, NULL, NULL),
(3, 'Workshop piping', NULL, NULL, '2022-05-24 21:01:21'),
(4, 'Workshop Mekanik EQ', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lpbgdtl`
--

CREATE TABLE `lpbgdtl` (
  `id` int(11) NOT NULL,
  `lpbghdr_id` int(11) DEFAULT NULL,
  `material_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lpbgdtl`
--

INSERT INTO `lpbgdtl` (`id`, `lpbghdr_id`, `material_id`, `created_at`, `updated_at`, `deleted_at`, `qty`) VALUES
(1, NULL, NULL, '2022-05-12 00:50:47', '2022-05-12 00:50:47', NULL, NULL),
(2, NULL, NULL, '2022-05-12 00:52:57', '2022-05-12 00:52:57', NULL, 10),
(3, NULL, NULL, '2022-05-12 00:53:00', '2022-05-12 00:53:00', NULL, NULL),
(4, NULL, NULL, '2022-05-12 00:53:03', '2022-05-12 00:53:03', NULL, NULL),
(5, NULL, NULL, '2022-05-12 00:53:08', '2022-05-12 00:53:08', NULL, NULL),
(6, NULL, NULL, '2022-05-12 00:53:09', '2022-05-12 00:53:09', NULL, NULL),
(7, NULL, NULL, '2022-05-12 00:53:10', '2022-05-12 00:53:10', NULL, NULL),
(8, NULL, NULL, '2022-05-12 00:53:10', '2022-05-12 00:53:10', NULL, NULL),
(9, NULL, NULL, '2022-05-12 00:53:11', '2022-05-12 00:53:11', NULL, NULL),
(10, NULL, NULL, '2022-05-12 00:53:11', '2022-05-12 00:53:11', NULL, NULL),
(11, NULL, NULL, '2022-05-12 00:53:11', '2022-05-12 00:53:11', NULL, NULL),
(12, NULL, NULL, '2022-05-12 00:53:12', '2022-05-12 00:53:12', NULL, NULL),
(13, NULL, NULL, '2022-05-12 00:53:18', '2022-05-12 00:53:18', NULL, NULL),
(14, NULL, NULL, '2022-05-12 00:53:20', '2022-05-12 00:53:20', NULL, NULL),
(15, NULL, NULL, '2022-05-12 00:53:21', '2022-05-12 00:53:21', NULL, NULL),
(16, NULL, NULL, '2022-05-12 00:53:21', '2022-05-12 00:53:21', NULL, NULL),
(17, NULL, NULL, '2022-05-12 00:54:38', '2022-05-12 00:54:38', NULL, NULL),
(18, NULL, NULL, '2022-05-12 00:54:38', '2022-05-12 00:54:38', NULL, NULL),
(19, NULL, NULL, '2022-05-12 01:26:19', '2022-05-12 01:26:19', NULL, NULL),
(20, 1, 1, '2022-05-24 21:08:49', '2022-05-24 21:08:49', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `lpbghdr`
--

CREATE TABLE `lpbghdr` (
  `id` int(11) NOT NULL,
  `no_lpbg` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_proyek` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lpbghdr`
--

INSERT INTO `lpbghdr` (`id`, `no_lpbg`, `kode_proyek`, `tanggal`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1190/IMS/LPBG/04//2022', NULL, '2022-05-11 17:00:00', '2022-05-12 00:50:24', '2022-05-12 00:50:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_proyek`
--

CREATE TABLE `master_proyek` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_proyek` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_proyek` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_proyek`
--

INSERT INTO `master_proyek` (`id`, `kode_proyek`, `nama_proyek`, `created_at`, `updated_at`) VALUES
(1, '21.00421.3', 'Flat Wagon UGL 60ft Series', NULL, '2023-07-30 19:38:52'),
(2, 'kode123', 'Proyek 1', '2023-07-30 19:39:10', '2023-07-30 19:39:10');

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `id` int(11) NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satuan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `kode_material` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`id`, `deskripsi`, `satuan`, `created_at`, `updated_at`, `deleted_at`, `kode_material`) VALUES
(1, 'ADAPTOR FEMALE BSPT 3/4\" X MALE 11/16\"', 'PCS', '2022-05-12 00:38:17', '2022-05-12 00:38:17', NULL, 'B51PGECR034J1116');

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_04_24_102628_create_posts_table', 1),
(5, '2023_07_28_034022_create_master_proyek_table', 2);

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
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proyek`
--

CREATE TABLE `proyek` (
  `id` int(11) NOT NULL,
  `kode_proyek` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_proyek` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `proyek`
--

INSERT INTO `proyek` (`id`, `kode_proyek`, `nama_proyek`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '21.00421.3', 'Flat wagon UGL 60ft Series', '2022-05-24 20:59:20', '2023-07-26 07:38:51', NULL),
(2, NULL, NULL, '2023-07-26 18:02:45', '2023-07-26 18:03:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sttpdtl`
--

CREATE TABLE `sttpdtl` (
  `id` int(11) NOT NULL,
  `sttphdr_id` int(11) DEFAULT NULL,
  `lpbgdtl_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sttphdr`
--

CREATE TABLE `sttphdr` (
  `id` int(11) NOT NULL,
  `tanggal` timestamp NULL DEFAULT NULL,
  `kode_proyek` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gedung_id` int(11) DEFAULT NULL,
  `lokasi_id` int(11) DEFAULT NULL,
  `nomor_kereta` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `no_sttp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nourut` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sttphdr`
--

INSERT INTO `sttphdr` (`id`, `tanggal`, `kode_proyek`, `gedung_id`, `lokasi_id`, `nomor_kereta`, `created_at`, `updated_at`, `deleted_at`, `no_sttp`, `nourut`, `tahun`) VALUES
(1, '2022-05-17 17:00:00', '21.00421.3', 1, 4, '1234', '2022-05-24 21:09:16', '2022-05-24 21:09:16', NULL, '000125052022', 1, 2022);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'e5ca329429fd31ad02a6e3a940de91dd7dcaf75c7eaa24dc5b1c224e4c583451');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `nip`, `deleted_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$2cDQ8eqLUlNj48eXW5GGwO8WNqUuMZlmmxccKrwlJ2MzifIDm/hEy', NULL, NULL, NULL, 'admin', NULL),
(2, 'admin1', 'admin111@gmail.com', NULL, '$2y$10$PDswo14mG//6Qsi9B.SeE.k/kY6DhXzILG9j7cJlUicGrKbG46UUe', NULL, '2023-07-11 07:59:45', '2023-07-11 07:59:45', 'admin', NULL),
(6, 'admin2', 'admin2@gmail.com', NULL, '12345', NULL, NULL, NULL, 'admin', NULL),
(13, 'admin4', 'admin4@gmail.com', NULL, '$2y$10$OBX5oadkXVaM5k3NlUNmh.xuW7Bk1Ru928EtHz9GlsYSwiikVOTui', NULL, '2023-07-30 19:16:17', '2023-07-30 19:16:17', 'admin', NULL),
(14, 'admin5', 'admin55@gmail.com', NULL, '$2y$10$T38x1oEEZbfaOvFY9iNBN.ssblPINH0WPVkmmKB5cBgW3dHuiowX2', NULL, '2023-07-30 19:17:16', '2023-07-30 19:17:48', 'admin', NULL);

-- --------------------------------------------------------

--
-- Structure for view `cek_lpbg`
--
DROP TABLE IF EXISTS `cek_lpbg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cek_lpbg`  AS SELECT `cek_lpbg`.`kode_proyek` AS `kode_proyek`, `cek_lpbg`.`no_lpbg` AS `no_lpbg`, `cek_lpbg`.`kode_material` AS `kode_material`, `cek_lpbg`.`deskripsi` AS `deskripsi`, `cek_lpbg`.`satuan` AS `satuan`, `cek_lpbg`.`jml_msk` AS `jml_msk`, `cek_lpbg`.`jml_keluar` AS `jml_keluar`, `cek_lpbg`.`jml_msk`- coalesce(`cek_lpbg`.`jml_keluar`,0) AS `saldo` FROM (select `l`.`kode_proyek` AS `kode_proyek`,`l`.`no_lpbg` AS `no_lpbg`,`m`.`kode_material` AS `kode_material`,`m`.`deskripsi` AS `deskripsi`,`m`.`satuan` AS `satuan`,sum(`ld`.`qty`) AS `jml_msk`,(select sum(`s`.`qty`) from (((`sttpdtl` `s` left join `lpbgdtl` `ld` on(`ld`.`id` = `s`.`lpbgdtl_id`)) left join `lpbghdr` `lh` on(`lh`.`id` = `ld`.`lpbghdr_id`)) left join `material` `m` on(`m`.`id` = `ld`.`material_id`)) where `lh`.`no_lpbg` = `l`.`no_lpbg` group by `lh`.`kode_proyek`,`m`.`kode_material`,`lh`.`no_lpbg`) AS `jml_keluar` from ((`lpbghdr` `l` left join `lpbgdtl` `ld` on(`ld`.`lpbghdr_id` = `l`.`id`)) left join `material` `m` on(`m`.`id` = `ld`.`material_id`)) where `l`.`deleted_at` is null group by `l`.`kode_proyek`,`m`.`kode_material`,`l`.`no_lpbg`,`m`.`kode_material`,`m`.`deskripsi`,`m`.`satuan`) AS `cek_lpbg` ;

-- --------------------------------------------------------

--
-- Structure for view `cek_sttp`
--
DROP TABLE IF EXISTS `cek_sttp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cek_sttp`  AS SELECT `cek_sttp`.`kode_material` AS `kode_material`, `cek_sttp`.`kode_proyek` AS `kode_proyek`, `cek_sttp`.`no_sttp` AS `no_sttp`, `cek_sttp`.`deskripsi` AS `deskripsi`, `cek_sttp`.`jml_keluar` AS `jml_keluar`, `cek_sttp`.`no_lpbg` AS `no_lpbg`, `cek_sttp`.`tanggal` AS `tanggal`, `cek_sttp`.`jml_masuk` AS `jml_masuk`, coalesce(`cek_sttp`.`jml_masuk`,0) - `cek_sttp`.`jml_keluar` AS `saldo` FROM (select `m`.`kode_material` AS `kode_material`,`s`.`kode_proyek` AS `kode_proyek`,`s`.`no_sttp` AS `no_sttp`,`s`.`tanggal` AS `tanggal`,`m`.`deskripsi` AS `deskripsi`,coalesce(sum(`sd`.`qty`),0) AS `jml_keluar`,`lh`.`no_lpbg` AS `no_lpbg`,(select sum(coalesce(`ld`.`qty`,0)) AS `jml_masuk` from ((`lpbghdr` `l` left join `lpbgdtl` `ld` on(`ld`.`lpbghdr_id` = `l`.`id`)) left join `material` `m` on(`m`.`id` = `ld`.`material_id`)) where `l`.`no_lpbg` = `lh`.`no_lpbg` group by `l`.`kode_proyek`,`l`.`no_lpbg`,`m`.`kode_material`) AS `jml_masuk` from ((((`sttphdr` `s` left join `sttpdtl` `sd` on(`s`.`id` = `sd`.`sttphdr_id`)) left join `lpbgdtl` `l` on(`sd`.`lpbgdtl_id` = `l`.`id`)) left join `lpbghdr` `lh` on(`lh`.`id` = `l`.`lpbghdr_id`)) left join `material` `m` on(`m`.`id` = `l`.`material_id`)) group by `s`.`no_sttp`,`s`.`kode_proyek`,`m`.`deskripsi`,`m`.`kode_material`,`lh`.`no_lpbg`,`s`.`tanggal`) AS `cek_sttp` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cms_konten`
--
ALTER TABLE `cms_konten`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `editor_image`
--
ALTER TABLE `editor_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gedung`
--
ALTER TABLE `gedung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_slider`
--
ALTER TABLE `image_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `list_produk`
--
ALTER TABLE `list_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lpbgdtl`
--
ALTER TABLE `lpbgdtl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lpbghdr`
--
ALTER TABLE `lpbghdr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_proyek`
--
ALTER TABLE `master_proyek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proyek`
--
ALTER TABLE `proyek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sttpdtl`
--
ALTER TABLE `sttpdtl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sttphdr`
--
ALTER TABLE `sttphdr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
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
-- AUTO_INCREMENT for table `editor_image`
--
ALTER TABLE `editor_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gedung`
--
ALTER TABLE `gedung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lpbgdtl`
--
ALTER TABLE `lpbgdtl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `lpbghdr`
--
ALTER TABLE `lpbghdr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `master_proyek`
--
ALTER TABLE `master_proyek`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proyek`
--
ALTER TABLE `proyek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sttpdtl`
--
ALTER TABLE `sttpdtl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sttphdr`
--
ALTER TABLE `sttphdr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
