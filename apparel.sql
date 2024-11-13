-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2023 at 11:38 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apparel`
--

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

CREATE TABLE `cabang` (
  `ID_Cabang` int(11) NOT NULL,
  `Nama_Cabang` varchar(100) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Nomor_Telepon` varchar(15) DEFAULT NULL,
  `ID_Provinsi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cabang`
--

INSERT INTO `cabang` (`ID_Cabang`, `Nama_Cabang`, `Alamat`, `Nomor_Telepon`, `ID_Provinsi`) VALUES
(1, 'Cabang Jakarta Pusat', 'Jl. Contoh 123, Jakarta Pusat', '021-1234567', 1),
(2, 'Cabang Jakarta Selatan', 'Jl. Contoh 456, Jakarta Selatan', '021-9876543', 1),
(3, 'Cabang Jakarta Barat', 'Jl. Contoh 789, Jakarta Barat', '021-5678901', 1),
(4, 'Cabang Surabaya', 'Jl. Contoh 123, Surabaya', '031-1234567', 4),
(5, 'Cabang Bandung', 'Jl. Contoh 456, Bandung', '022-9876543', 5),
(6, 'Cabang Yogyakarta', 'Jl. Contoh 789, Yogyakarta', '0274-5678901', 6),
(7, 'Cabang Semarang', 'Jl. Contoh 123, Semarang', '024-1234567', 7),
(8, 'Cabang Medan', 'Jl. Contoh 456, Medan', '061-9876543', 8);

-- --------------------------------------------------------

--
-- Table structure for table `dim_cabang`
--

CREATE TABLE `dim_cabang` (
  `ID_Cabang` int(11) NOT NULL,
  `Nama_Cabang` varchar(100) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Nomor_Telepon` varchar(15) DEFAULT NULL,
  `ID_Provinsi` int(11) DEFAULT NULL,
  `Nama_Provinsi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dim_cabang`
--

INSERT INTO `dim_cabang` (`ID_Cabang`, `Nama_Cabang`, `Alamat`, `Nomor_Telepon`, `ID_Provinsi`, `Nama_Provinsi`) VALUES
(1, 'Cabang Jakarta Pusat', 'Jl. Contoh 123, Jakarta Pusat', '021-1234567', 1, 'DKI Jakarta'),
(2, 'Cabang Jakarta Selatan', 'Jl. Contoh 456, Jakarta Selatan', '021-9876543', 1, 'DKI Jakarta'),
(3, 'Cabang Jakarta Barat', 'Jl. Contoh 789, Jakarta Barat', '021-5678901', 1, 'DKI Jakarta'),
(4, 'Cabang Surabaya', 'Jl. Contoh 123, Surabaya', '031-1234567', 4, 'DI Yogyakarta'),
(5, 'Cabang Bandung', 'Jl. Contoh 456, Bandung', '022-9876543', 5, 'Jawa Tengah'),
(6, 'Cabang Yogyakarta', 'Jl. Contoh 789, Yogyakarta', '0274-5678901', 6, 'Sumatera Utara'),
(7, 'Cabang Semarang', 'Jl. Contoh 123, Semarang', '024-1234567', 7, 'Lampung'),
(8, 'Cabang Medan', 'Jl. Contoh 456, Medan', '061-9876543', 8, 'Bali');

-- --------------------------------------------------------

--
-- Table structure for table `dim_produk`
--

CREATE TABLE `dim_produk` (
  `ID_Produk` int(11) NOT NULL,
  `ID_Kategori` int(11) DEFAULT NULL,
  `Nama_Produk` varchar(100) DEFAULT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Harga` double DEFAULT NULL,
  `Nama_Kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dim_produk`
--

INSERT INTO `dim_produk` (`ID_Produk`, `ID_Kategori`, `Nama_Produk`, `Deskripsi`, `Harga`, `Nama_Kategori`) VALUES
(1, 1, 'Blus Wanita', 'Blus wanita dengan motif bunga', 120000, 'Garmen Wanita'),
(2, 2, 'Kemeja Pria', 'Kemeja pria dengan berbagai desain', 110000, 'Garmen Pria'),
(3, 2, 'Kemeja Non-Iron', 'Kemeja pria non-iron', 125000, 'Garmen Pria'),
(4, 2, 'Kemeja kasual', 'Kemeja pria kasual', 100000, 'Garmen Pria'),
(5, 1, 'Rok', 'Rok wanita berbagai model', 90000, 'Garmen Wanita'),
(6, 3, 'Gaun', 'Gaun wanita elegan', 150000, 'Gaun Wanita'),
(7, 4, 'Pakaian Tidur', 'Pakaian tidur wanita', 75000, 'Pakaian Tidur'),
(8, 2, 'Kemeja', 'Kemeja pria berbagai gaya', 110000, 'Garmen Pria');

-- --------------------------------------------------------

--
-- Table structure for table `fact_pesanan`
--

CREATE TABLE `fact_pesanan` (
  `ID_Pesanan` int(11) DEFAULT NULL,
  `ID_Produk` int(11) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `Nama_Produk` varchar(100) DEFAULT NULL,
  `Harga` double DEFAULT NULL,
  `ID_Cabang` int(11) DEFAULT NULL,
  `Nama_Cabang` varchar(100) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Nomor_Telepon` varchar(15) DEFAULT NULL,
  `total_transaksi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fact_pesanan`
--

INSERT INTO `fact_pesanan` (`ID_Pesanan`, `ID_Produk`, `Jumlah`, `Nama_Produk`, `Harga`, `ID_Cabang`, `Nama_Cabang`, `Alamat`, `Nomor_Telepon`, `total_transaksi`) VALUES
(4, 4, 5, 'Kemeja kasual', 100000, 4, 'Cabang Surabaya', 'Jl. Contoh 123, Surabaya', '031-1234567', 500000),
(17, 1, 5, 'Blus Wanita', 120000, 1, 'Cabang Jakarta Pusat', 'Jl. Contoh 123, Jakarta Pusat', '021-1234567', 600000),
(12, 4, 6, 'Kemeja kasual', 100000, 4, 'Cabang Surabaya', 'Jl. Contoh 123, Surabaya', '031-1234567', 600000),
(20, 4, 6, 'Kemeja kasual', 100000, 4, 'Cabang Surabaya', 'Jl. Contoh 123, Surabaya', '031-1234567', 600000),
(9, 1, 7, 'Blus Wanita', 120000, 1, 'Cabang Jakarta Pusat', 'Jl. Contoh 123, Jakarta Pusat', '021-1234567', 840000),
(24, 8, 7, 'Kemeja', 110000, 8, 'Cabang Medan', 'Jl. Contoh 456, Medan', '061-9876543', 770000),
(6, 6, 8, 'Gaun', 150000, 6, 'Cabang Yogyakarta', 'Jl. Contoh 789, Yogyakarta', '0274-5678901', 1200000),
(14, 6, 8, 'Gaun', 150000, 6, 'Cabang Yogyakarta', 'Jl. Contoh 789, Yogyakarta', '0274-5678901', 1200000),
(22, 6, 8, 'Gaun', 150000, 6, 'Cabang Yogyakarta', 'Jl. Contoh 789, Yogyakarta', '0274-5678901', 1200000),
(10, 2, 9, 'Kemeja Pria', 110000, 2, 'Cabang Jakarta Selatan', 'Jl. Contoh 456, Jakarta Selatan', '021-9876543', 990000),
(2, 2, 10, 'Kemeja Pria', 110000, 2, 'Cabang Jakarta Selatan', 'Jl. Contoh 456, Jakarta Selatan', '021-9876543', 1100000),
(8, 8, 10, 'Kemeja', 110000, 8, 'Cabang Medan', 'Jl. Contoh 456, Medan', '061-9876543', 1100000),
(18, 2, 10, 'Kemeja Pria', 110000, 2, 'Cabang Jakarta Selatan', 'Jl. Contoh 456, Jakarta Selatan', '021-9876543', 1100000),
(16, 8, 11, 'Kemeja', 110000, 8, 'Cabang Medan', 'Jl. Contoh 456, Medan', '061-9876543', 1210000),
(5, 5, 12, 'Rok', 90000, 5, 'Cabang Bandung', 'Jl. Contoh 456, Bandung', '022-9876543', 1080000),
(21, 5, 13, 'Rok', 90000, 5, 'Cabang Bandung', 'Jl. Contoh 456, Bandung', '022-9876543', 1170000),
(13, 5, 14, 'Rok', 90000, 5, 'Cabang Bandung', 'Jl. Contoh 456, Bandung', '022-9876543', 1260000),
(23, 7, 14, 'Pakaian Tidur', 75000, 7, 'Cabang Semarang', 'Jl. Contoh 123, Semarang', '024-1234567', 1050000),
(1, 1, 15, 'Blus Wanita', 120000, 1, 'Cabang Jakarta Pusat', 'Jl. Contoh 123, Jakarta Pusat', '021-1234567', 1800000),
(19, 3, 15, 'Kemeja Non-Iron', 125000, 3, 'Cabang Jakarta Barat', 'Jl. Contoh 789, Jakarta Barat', '021-5678901', 1875000),
(11, 3, 16, 'Kemeja Non-Iron', 125000, 3, 'Cabang Jakarta Barat', 'Jl. Contoh 789, Jakarta Barat', '021-5678901', 2000000),
(15, 7, 17, 'Pakaian Tidur', 75000, 7, 'Cabang Semarang', 'Jl. Contoh 123, Semarang', '024-1234567', 1275000),
(7, 7, 18, 'Pakaian Tidur', 75000, 7, 'Cabang Semarang', 'Jl. Contoh 123, Semarang', '024-1234567', 1350000),
(3, 3, 20, 'Kemeja Non-Iron', 125000, 3, 'Cabang Jakarta Barat', 'Jl. Contoh 789, Jakarta Barat', '021-5678901', 2500000);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_produk`
--

CREATE TABLE `kategori_produk` (
  `ID_Kategori` int(11) NOT NULL,
  `Nama_Kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_produk`
--

INSERT INTO `kategori_produk` (`ID_Kategori`, `Nama_Kategori`) VALUES
(1, 'Garmen Wanita'),
(2, 'Garmen Pria'),
(3, 'Gaun Wanita'),
(4, 'Pakaian Tidur');

-- --------------------------------------------------------

--
-- Table structure for table `ms_cabang`
--

CREATE TABLE `ms_cabang` (
  `ID_Cabang` int(11) DEFAULT NULL,
  `Nama_Cabang` varchar(100) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Nomor_Telepon` varchar(15) DEFAULT NULL,
  `ID_Provinsi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ms_cabang`
--

INSERT INTO `ms_cabang` (`ID_Cabang`, `Nama_Cabang`, `Alamat`, `Nomor_Telepon`, `ID_Provinsi`) VALUES
(1, 'Cabang Jakarta Pusat', 'Jl. Contoh 123, Jakarta Pusat', '021-1234567', 1),
(2, 'Cabang Jakarta Selatan', 'Jl. Contoh 456, Jakarta Selatan', '021-9876543', 1),
(3, 'Cabang Jakarta Barat', 'Jl. Contoh 789, Jakarta Barat', '021-5678901', 1),
(4, 'Cabang Surabaya', 'Jl. Contoh 123, Surabaya', '031-1234567', 4),
(5, 'Cabang Bandung', 'Jl. Contoh 456, Bandung', '022-9876543', 5),
(6, 'Cabang Yogyakarta', 'Jl. Contoh 789, Yogyakarta', '0274-5678901', 6),
(7, 'Cabang Semarang', 'Jl. Contoh 123, Semarang', '024-1234567', 7),
(8, 'Cabang Medan', 'Jl. Contoh 456, Medan', '061-9876543', 8);

-- --------------------------------------------------------

--
-- Table structure for table `ms_kategori_produk`
--

CREATE TABLE `ms_kategori_produk` (
  `ID_Kategori` int(11) DEFAULT NULL,
  `Nama_Kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ms_kategori_produk`
--

INSERT INTO `ms_kategori_produk` (`ID_Kategori`, `Nama_Kategori`) VALUES
(1, 'Garmen Wanita'),
(2, 'Garmen Pria'),
(3, 'Gaun Wanita'),
(4, 'Pakaian Tidur');

-- --------------------------------------------------------

--
-- Table structure for table `ms_pesanan`
--

CREATE TABLE `ms_pesanan` (
  `ID_Pesanan` int(11) DEFAULT NULL,
  `ID_Produk` int(11) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `Tanggal_Pesanan` datetime DEFAULT NULL,
  `ID_Cabang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ms_pesanan`
--

INSERT INTO `ms_pesanan` (`ID_Pesanan`, `ID_Produk`, `Jumlah`, `Tanggal_Pesanan`, `ID_Cabang`) VALUES
(4, 4, 5, '2023-02-05 00:00:00', 4),
(17, 1, 5, '2023-06-15 00:00:00', 1),
(12, 4, 6, '2023-05-01 00:00:00', 4),
(20, 4, 6, '2023-08-01 00:00:00', 4),
(9, 1, 7, '2023-03-05 00:00:00', 1),
(24, 8, 7, '2023-09-15 00:00:00', 8),
(6, 6, 8, '2023-02-15 00:00:00', 6),
(14, 6, 8, '2023-05-15 00:00:00', 6),
(22, 6, 8, '2023-08-05 00:00:00', 6),
(10, 2, 9, '2023-04-10 00:00:00', 2),
(2, 2, 10, '2023-01-12 00:00:00', 2),
(8, 8, 10, '2023-03-03 00:00:00', 8),
(18, 2, 10, '2023-07-05 00:00:00', 2),
(16, 8, 11, '2023-06-12 00:00:00', 8),
(5, 5, 12, '2023-02-10 00:00:00', 5),
(21, 5, 13, '2023-08-03 00:00:00', 5),
(13, 5, 14, '2023-05-10 00:00:00', 5),
(23, 7, 14, '2023-09-10 00:00:00', 7),
(1, 1, 15, '2023-01-10 00:00:00', 1),
(19, 3, 15, '2023-07-10 00:00:00', 3),
(11, 3, 16, '2023-04-15 00:00:00', 3),
(15, 7, 17, '2023-06-10 00:00:00', 7),
(7, 7, 18, '2023-03-01 00:00:00', 7),
(3, 3, 20, '2023-01-15 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ms_produk`
--

CREATE TABLE `ms_produk` (
  `ID_Produk` int(11) DEFAULT NULL,
  `ID_Kategori` int(11) DEFAULT NULL,
  `Nama_Produk` varchar(100) DEFAULT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Harga` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ms_produk`
--

INSERT INTO `ms_produk` (`ID_Produk`, `ID_Kategori`, `Nama_Produk`, `Deskripsi`, `Harga`) VALUES
(1, 1, 'Blus Wanita', 'Blus wanita dengan motif bunga', 120000),
(2, 2, 'Kemeja Pria', 'Kemeja pria dengan berbagai desain', 110000),
(3, 2, 'Kemeja Non-Iron', 'Kemeja pria non-iron', 125000),
(4, 2, 'Kemeja kasual', 'Kemeja pria kasual', 100000),
(5, 1, 'Rok', 'Rok wanita berbagai model', 90000),
(6, 3, 'Gaun', 'Gaun wanita elegan', 150000),
(7, 4, 'Pakaian Tidur', 'Pakaian tidur wanita', 75000),
(8, 2, 'Kemeja', 'Kemeja pria berbagai gaya', 110000);

-- --------------------------------------------------------

--
-- Table structure for table `ms_provinsi`
--

CREATE TABLE `ms_provinsi` (
  `ID_Provinsi` int(11) DEFAULT NULL,
  `Nama_Provinsi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ms_provinsi`
--

INSERT INTO `ms_provinsi` (`ID_Provinsi`, `Nama_Provinsi`) VALUES
(1, 'DKI Jakarta'),
(2, 'Jawa Timur'),
(3, 'Jawa Barat'),
(4, 'DI Yogyakarta'),
(5, 'Jawa Tengah'),
(6, 'Sumatera Utara'),
(7, 'Lampung'),
(8, 'Bali');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `ID_Pesanan` int(11) NOT NULL,
  `ID_Produk` int(11) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `Tanggal_Pesanan` date DEFAULT NULL,
  `ID_Cabang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`ID_Pesanan`, `ID_Produk`, `Jumlah`, `Tanggal_Pesanan`, `ID_Cabang`) VALUES
(1, 1, 15, '2023-01-10', 1),
(2, 2, 10, '2023-01-12', 2),
(3, 3, 20, '2023-01-15', 3),
(4, 4, 5, '2023-02-05', 4),
(5, 5, 12, '2023-02-10', 5),
(6, 6, 8, '2023-02-15', 6),
(7, 7, 18, '2023-03-01', 7),
(8, 8, 10, '2023-03-03', 8),
(9, 1, 7, '2023-03-05', 1),
(10, 2, 9, '2023-04-10', 2),
(11, 3, 16, '2023-04-15', 3),
(12, 4, 6, '2023-05-01', 4),
(13, 5, 14, '2023-05-10', 5),
(14, 6, 8, '2023-05-15', 6),
(15, 7, 17, '2023-06-10', 7),
(16, 8, 11, '2023-06-12', 8),
(17, 1, 5, '2023-06-15', 1),
(18, 2, 10, '2023-07-05', 2),
(19, 3, 15, '2023-07-10', 3),
(20, 4, 6, '2023-08-01', 4),
(21, 5, 13, '2023-08-03', 5),
(22, 6, 8, '2023-08-05', 6),
(23, 7, 14, '2023-09-10', 7),
(24, 8, 7, '2023-09-15', 8);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `ID_Produk` int(11) NOT NULL,
  `ID_Kategori` int(11) DEFAULT NULL,
  `Nama_Produk` varchar(100) DEFAULT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Harga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`ID_Produk`, `ID_Kategori`, `Nama_Produk`, `Deskripsi`, `Harga`) VALUES
(1, 1, 'Blus Wanita', 'Blus wanita dengan motif bunga', '120000.00'),
(2, 2, 'Kemeja Pria', 'Kemeja pria dengan berbagai desain', '110000.00'),
(3, 2, 'Kemeja Non-Iron', 'Kemeja pria non-iron', '125000.00'),
(4, 2, 'Kemeja kasual', 'Kemeja pria kasual', '100000.00'),
(5, 1, 'Rok', 'Rok wanita berbagai model', '90000.00'),
(6, 3, 'Gaun', 'Gaun wanita elegan', '150000.00'),
(7, 4, 'Pakaian Tidur', 'Pakaian tidur wanita', '75000.00'),
(8, 2, 'Kemeja', 'Kemeja pria berbagai gaya', '110000.00');

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `ID_Provinsi` int(11) NOT NULL,
  `Nama_Provinsi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`ID_Provinsi`, `Nama_Provinsi`) VALUES
(1, 'DKI Jakarta'),
(2, 'Jawa Timur'),
(3, 'Jawa Barat'),
(4, 'DI Yogyakarta'),
(5, 'Jawa Tengah'),
(6, 'Sumatera Utara'),
(7, 'Lampung'),
(8, 'Bali');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`ID_Cabang`);

--
-- Indexes for table `dim_cabang`
--
ALTER TABLE `dim_cabang`
  ADD PRIMARY KEY (`ID_Cabang`);

--
-- Indexes for table `dim_produk`
--
ALTER TABLE `dim_produk`
  ADD PRIMARY KEY (`ID_Produk`);

--
-- Indexes for table `fact_pesanan`
--
ALTER TABLE `fact_pesanan`
  ADD KEY `Product_id` (`ID_Produk`),
  ADD KEY `Cabang_id` (`ID_Cabang`);

--
-- Indexes for table `kategori_produk`
--
ALTER TABLE `kategori_produk`
  ADD PRIMARY KEY (`ID_Kategori`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`ID_Pesanan`),
  ADD KEY `ID_Produk` (`ID_Produk`),
  ADD KEY `ID_Cabang` (`ID_Cabang`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`ID_Produk`),
  ADD KEY `ID_Kategori` (`ID_Kategori`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`ID_Provinsi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori_produk`
--
ALTER TABLE `kategori_produk`
  MODIFY `ID_Kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `ID_Produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `ID_Provinsi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fact_pesanan`
--
ALTER TABLE `fact_pesanan`
  ADD CONSTRAINT `fact_pesanan_ibfk_1` FOREIGN KEY (`ID_Cabang`) REFERENCES `dim_cabang` (`ID_Cabang`),
  ADD CONSTRAINT `fact_pesanan_ibfk_2` FOREIGN KEY (`ID_Produk`) REFERENCES `dim_produk` (`ID_Produk`);

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`ID_Produk`) REFERENCES `produk` (`ID_Produk`),
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`ID_Cabang`) REFERENCES `cabang` (`ID_Cabang`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`ID_Kategori`) REFERENCES `kategori_produk` (`ID_Kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
