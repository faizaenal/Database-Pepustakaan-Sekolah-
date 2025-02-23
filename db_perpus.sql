-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Feb 2025 pada 04.05
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpus`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_buku` (IN `id_buku` INT)   BEGIN  
    DELETE FROM buku WHERE id_buku = id_buku;  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_peminjaman` (IN `id_peminjaman` INT)   BEGIN  
    DELETE FROM peminjaman WHERE id_peminjaman = id_peminjaman;  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_siswa` (IN `id_siswa` INT)   BEGIN  
    DELETE FROM siswa WHERE id_siswa = id_siswa;  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_buku` (IN `judul_buku` VARCHAR(50), IN `penulis` VARCHAR(50), IN `kategori` VARCHAR(50), IN `stok` INT)   BEGIN  
    INSERT INTO buku (judul_buku, penulis, kategori, stok) VALUES (judul_buku, penulis, kategori, stok);  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_peminjaman` (IN `id_siswa` INT, IN `id_buku` INT, IN `tanggal_pinjam` DATE, IN `tanggal_kembali` DATE, IN `status_peminjaman` ENUM('Dipinjam','Dikembalikan'))   BEGIN  
    INSERT INTO peminjaman (id_siswa, id_buku, tanggal_pinjam, tanggal_kembali, _status)  
    VALUES (id_siswa, id_buku, tanggal_pinjam, tanggal_kembali, status_peminjaman);  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_siswa` (IN `nama_siswa` VARCHAR(255), IN `kelas_siswa` VARCHAR(50))   BEGIN  
    INSERT INTO siswa (nama, kelas) VALUES (nama_siswa, kelas_siswa);  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `kembalikan_buku` (IN `peminjaman_id` INT)   BEGIN
    UPDATE peminjaman 
    SET status = 'Dikembalikan', tanggal_kembali = CURRENT_DATE 
    WHERE id_peminjaman = peminjaman_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `semua_buku` ()   BEGIN  
    SELECT b.id_buku, b.judul_buku, b.penulis, b.kategori, b.stok,  
           IFNULL(p.id_peminjaman, 'Belum Pernah Dipinjam') AS status_peminjaman  
    FROM buku b  
    LEFT JOIN peminjaman p ON b.id_buku = p.id_buku;  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `semua_siswa` ()   BEGIN  
    SELECT s.id_siswa, s.nama, s.kelas,  
           IFNULL(p.id_peminjaman, 'Belum Pernah Meminjam') AS status_peminjaman  
    FROM siswa s  
    LEFT JOIN peminjaman p ON s.id_siswa = p.id_siswa;  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_buku` ()   BEGIN
    SELECT * FROM buku;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_peminjaman` ()   BEGIN
    SELECT * FROM peminjaman;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_siswa` ()   BEGIN
    SELECT * FROM siswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `siswa_peminjam` ()   BEGIN
    SELECT DISTINCT s.id_siswa, s.nama, s.kelas 
    FROM siswa s
    INNER JOIN peminjaman p ON s.id_siswa = p.id_siswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_buku` (IN `id_buku` INT, IN `judul_baru` VARCHAR(50), IN `penulis_baru` VARCHAR(50), IN `kategori_baru` VARCHAR(50), IN `stok_baru` INT)   BEGIN  
    UPDATE buku  
    SET judul_buku = judul_baru, penulis = penulis_baru, kategori = kategori_baru, stok = stok_baru  
    WHERE id_buku = id_buku;  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_peminjaman` (IN `id_peminjaman` INT, IN `tanggal_kembali_baru` DATE, IN `status_baru` VARCHAR(50))   BEGIN  
    UPDATE peminjaman  
    SET tanggal_kembali = tanggal_kembali_baru, status = status_baru  
    WHERE id_peminjaman = id_peminjaman;  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_siswa` (IN `id_siswa` INT, IN `nama_baru` VARCHAR(50), IN `kelas_baru` VARCHAR(50))   BEGIN  
    UPDATE siswa  
    SET nama = nama_baru, kelas = kelas_baru  
    WHERE id_siswa = id_siswa;  
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul_buku` varchar(50) DEFAULT NULL,
  `penulis` varchar(50) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `penulis`, `kategori`, `stok`) VALUES
(1, 'Algoritma dan Pemograman', 'Andi Wijaya', 'Teknologi', 5),
(2, 'Dasar-dasar Database', 'Budi Santoso', 'Teknologi', 7),
(3, 'Matematika Diskrit', 'Rina Sari', 'Matematika', 4),
(4, 'Sejarah Dunia', 'John Smith', 'Sejarah', 3),
(5, 'Pemrograman Web dengan PHP', 'Eko Prasetyo', 'Teknologi', 8),
(6, 'Sistem Operasi', 'Dian Kurniawan', 'Teknologi', 6),
(7, 'Jaringan Komputer', 'Ahmad Fauzi', 'Teknologi', 5),
(8, 'Cerita Rakyat Nusantara', 'Lestari Dewi', 'Sastra', 9),
(9, 'Bahasa Inggris untuk Pemula', 'Jane Doe', 'Bahasa', 10),
(10, 'Biologi Dasar', 'Budi Rahman', 'Sains', 7),
(11, 'Kimia Organik', 'Siti Aminah', 'Sains', 5),
(12, 'Teknik Elektro', 'Ridwan Hakim', 'Teknik', 6),
(13, 'Fisika Modern', 'Albert Einstein', 'Sains', 4),
(14, 'Manajemen Waktu', 'Steven Covey', 'Pengembangan', 8),
(15, 'Strategi Belajar Efektif', 'Tony Buzan', 'Pendidikan', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_siswa`, `id_buku`, `tanggal_pinjam`, `tanggal_kembali`, `_status`) VALUES
(1, 11, 2, '2025-02-01', '2025-02-08', 'Dipinjam'),
(2, 2, 5, '2025-01-28', '2025-02-04', 'Dikembalikan'),
(3, 3, 8, '2025-02-02', '2025-02-09', 'Dipinjam'),
(4, 4, 10, '2025-01-30', '2025-02-06', 'Dikembalikan'),
(5, 5, 3, '2025-01-25', '2025-02-01', 'Dikembalikan'),
(6, 15, 7, '2025-02-01', '2025-02-08', 'Dipinjam'),
(7, 7, 1, '2025-01-29', '2025-02-05', 'Dikembalikan'),
(8, 8, 9, '2025-02-03', '2025-02-10', 'Dipinjam'),
(9, 13, 4, '2025-01-27', '2025-02-03', 'Dikembalikan'),
(10, 10, 11, '2025-02-01', '2025-02-08', 'Dipinjam');

--
-- Trigger `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `kurangi_stok` BEFORE INSERT ON `peminjaman` FOR EACH ROW BEGIN
    UPDATE buku SET stok = stok - 1 WHERE id_buku = NEW.id_buku;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tambah_stok` AFTER UPDATE ON `peminjaman` FOR EACH ROW BEGIN
    IF NEW._status = 'Dikembalikan' THEN
        UPDATE buku SET stok = stok + 1 WHERE id_buku = NEW.id_buku;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama`, `kelas`) VALUES
(1, 'Andi Saputra', 'X-RPL'),
(2, 'Budi Wijaya', 'X-TKJ'),
(3, 'Citra Lestari', 'XI-RPL'),
(4, 'Dewi Kurniawan', 'XI-TKJ'),
(5, 'Eko Prasetyo', 'XII-RPL'),
(6, 'Farhan Maulana', 'XII-TKJ'),
(7, 'Gita Permata', 'X-RPL'),
(8, 'Hadi Sucipto', 'X-TKJ'),
(9, 'Intan Permadi', 'XI-RPL'),
(10, 'Joko Santoso', 'XI-TKJ'),
(11, 'Kartika Sari', 'XII-RPL'),
(12, 'Lintang Putri', 'XII-TKJ'),
(13, 'Muhammad Rizky', 'X-RPL'),
(14, 'Novi Andriana', 'X-TKJ'),
(15, 'Olivia Hernanda', 'XI-RPL');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
