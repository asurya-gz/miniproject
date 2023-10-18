-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Okt 2023 pada 15.25
-- Versi server: 8.0.34
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opr`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `noktp` varchar(16) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kota` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `file_ktp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`noktp`, `nama`, `password`, `alamat`, `kota`, `email`, `no_telp`, `file_ktp`) VALUES
('1234567890123456', 'Anggota Default', 'password123', 'Alamat Default', 'Kota Default', 'anggota@example.com', '123-456-7890', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `idbuku` int NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `idkategori` int DEFAULT NULL,
  `pengarang` varchar(100) DEFAULT NULL,
  `penerbit` varchar(100) DEFAULT NULL,
  `kota_terbit` varchar(100) DEFAULT NULL,
  `editor` varchar(100) DEFAULT NULL,
  `file_gambar` varchar(255) DEFAULT NULL,
  `tgl_insert` date DEFAULT NULL,
  `tgl_update` date DEFAULT NULL,
  `stok` int DEFAULT NULL,
  `stok_tersedia` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `iddetail` int NOT NULL,
  `idtransaksi` int DEFAULT NULL,
  `idbuku` int DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` int DEFAULT NULL,
  `idpetugas` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar_buku`
--

CREATE TABLE `komentar_buku` (
  `idkomentar` int NOT NULL,
  `idbuku` int DEFAULT NULL,
  `noktp` varchar(16) DEFAULT NULL,
  `komentar` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `idtransaksi` int NOT NULL,
  `noktp` varchar(16) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `idpetugas` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `idpetugas` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`idpetugas`, `nama`, `email`, `password`) VALUES
(1, 'Petugas Default', 'petugas@example.com', 'password123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rating_buku`
--

CREATE TABLE `rating_buku` (
  `idrating` int NOT NULL,
  `idbuku` int DEFAULT NULL,
  `noktp` varchar(16) DEFAULT NULL,
  `skor_rating` int DEFAULT NULL,
  `tgl_rating` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`noktp`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`idbuku`);

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`iddetail`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indeks untuk tabel `komentar_buku`
--
ALTER TABLE `komentar_buku`
  ADD PRIMARY KEY (`idkomentar`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`idtransaksi`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`idpetugas`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `rating_buku`
--
ALTER TABLE `rating_buku`
  ADD PRIMARY KEY (`idrating`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `idbuku` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `iddetail` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `komentar_buku`
--
ALTER TABLE `komentar_buku`
  MODIFY `idkomentar` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `idtransaksi` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `idpetugas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `rating_buku`
--
ALTER TABLE `rating_buku`
  MODIFY `idrating` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
