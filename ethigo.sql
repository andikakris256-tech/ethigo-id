-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Nov 2025 pada 03.15
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
-- Database: `ethigo`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun_user`
--

CREATE TABLE `akun_user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `school_origin` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `profile_photo` varchar(500) DEFAULT NULL,
  `role` enum('student','parent','teacher','admin') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL,
  `status` enum('active','banned') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `akun_user`
--

INSERT INTO `akun_user` (`id`, `name`, `username`, `email`, `password_hash`, `school_origin`, `birth_date`, `gender`, `occupation`, `phone_number`, `profile_photo`, `role`, `created_at`, `updated_at`, `last_login`, `status`) VALUES
(3, 'Andika Krisna Mahendra', 'Mheeend_', 'andikakris256@gmail.com', '$2y$10$RBtzTZSNijSeFfFRgobjVecxKeVp5mc8TANaXRRwFgd4xEER2jwZu', 'Politeknik Elektronika Negeri Surabaya', '2025-11-19', 'Laki-laki', 'Mahasiswa', '081323121011', '1763567990_Adudu.jpg', 'student', '2025-11-08 14:09:41', '2025-11-19 17:56:15', '2025-11-19 17:56:15', 'active'),
(8, 'Admin', 'admin123', 'admin@gmail.com', '$2y$10$nwT0KCpGkOUHe6ZGfjkszu327OsgbioORPilx7xhwlIeDBC1skZiy', 'PENS', '2025-11-01', NULL, 'pekerja', NULL, NULL, 'admin', '2025-11-08 14:56:41', '2025-11-19 17:22:21', '2025-11-19 17:22:21', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `donasi`
--

CREATE TABLE `donasi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `message` text DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `payment_status` enum('success','pending','failed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi`
--

CREATE TABLE `materi` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `thumbnail_url` varchar(500) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `materi`
--

INSERT INTO `materi` (`id`, `slug`, `judul`, `description`, `thumbnail_url`, `created_by`, `created_at`) VALUES
(9, 'metode-belajar-efektif', 'Metode Belajar Efektif', 'Belajar efektif bukanlah tentang seberapa lama waktu yang dihabiskan di depan buku, melainkan tentang bagaimana mengelola fokus dan menggunakan strategi yang tepat untuk memahami materi secara mendalam. Dengan menerapkan metode seperti Active Recall atau Teknik Pomodoro, otak dilatih untuk menyerap informasi secara optimal tanpa merasa cepat lelah (burnout). Kunci utamanya adalah kualitas pemahaman konsep, bukan sekadar menghafal untuk ujian semata, sehingga ilmu yang didapat menjadi lebih relevan dan tahan lama dalam ingatan.', 'upload/1763574834_Desain tanpa judul.jpg', 8, '2025-11-19 17:53:54'),
(10, 'dampak-negatif-teknologi', 'Dampak Negatif Teknologi', 'Meskipun teknologi mempercepat akses informasi, ketergantungan yang berlebihan dapat memicu penurunan rentang konsentrasi (short attention span) dan menggerus kemampuan interaksi sosial secara tatap muka. Paparan layar yang terus-menerus tidak hanya berdampak buruk pada kesehatan fisik seperti mata lelah, tetapi juga membuka celah bagi masalah kesehatan mental seperti kecemasan akibat media sosial dan risiko cyberbullying. Teknologi yang tidak dikendalikan dengan bijak justru dapat menjadi distraksi terbesar yang menghambat produktivitas dan perkembangan karakter seseorang.', 'upload/1763574858_The Importance of education.jpg', 8, '2025-11-19 17:54:18'),
(11, 'the-importance-of-education', 'The Importance of Education', 'Pendidikan adalah fondasi utama yang lebih dari sekadar sarana mendapatkan gelar akademis; ia adalah alat paling ampuh untuk mengubah pola pikir dan memutus mata rantai kemiskinan. Melalui pendidikan, seseorang dibekali kemampuan berpikir kritis (critical thinking) dan wawasan luas yang diperlukan untuk mengambil keputusan bijak serta beradaptasi dengan perubahan dunia. Pada akhirnya, pendidikan yang baik tidak hanya menciptakan individu yang cerdas secara intelektual, tetapi juga membentuk karakter manusia yang berempati dan siap berkontribusi bagi kemajuan peradaban.', 'upload/1763574899_The Importance of education (1).jpg', 8, '2025-11-19 17:54:59'),
(12, 'e-learning-education', 'E-Learning Education', 'E-Learning telah merevolusi dunia pendidikan dengan mendobrak batasan ruang dan waktu, memungkinkan siapa saja untuk mengakses materi pembelajaran berkualitas dari mana saja hanya bermodalkan koneksi internet. Metode ini menawarkan fleksibilitas tinggi yang sangat cocok bagi generasi modern yang ingin menyeimbangkan antara belajar, bekerja, dan kehidupan pribadi. Namun, keberhasilan E-Learning sangat bergantung pada kemandirian dan disiplin diri penggunanya, menjadikannya ujian nyata bagi komitmen seseorang dalam mengembangkan diri secara otodidak.', 'upload/1763574937_The Importance of education (2).jpg', 8, '2025-11-19 17:55:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perpustakaan`
--

CREATE TABLE `perpustakaan` (
  `id` int(11) NOT NULL,
  `judul` varchar(500) NOT NULL,
  `link` varchar(500) DEFAULT NULL,
  `cover_url` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `perpustakaan`
--

INSERT INTO `perpustakaan` (`id`, `judul`, `link`, `cover_url`, `created_at`) VALUES
(4, 'Peran Literasi Digital dalam Pembentukan Etika Sosial di Dunia Maya Pada SiswaSD', 'https://jipp.unram.ac.id/index.php/jipp/article/view/2962/1684', 'upload/1763574093_EthiGo..png', NULL),
(5, 'OPTIMALISASI ETIKA DIGITAL PADA ANAK USIA DINI MELALUI LITERASI DIGITAL: MENDUKUNG PEMBENTUKAN KARAKTER UNGGUL DI ERA TEKNOLOGI', 'https://jurnal.insida.ac.id/index.php/atthiflah/article/view/588/294', 'upload/1763574152_EthiGo. (1).png', NULL),
(6, 'LITERASI DIGITAL UNTUK MENINGKATKAN ETIKA BERDIGITAL BAGI SISWA SISWI SMA NEGERI 13 KOTA JAMBI', 'https://ejournal.unama.ac.id/index.php/jpmu/article/view/1526/1375', 'upload/1763574195_EthiGo. (2).png', NULL),
(7, 'Jitu Inovasi Literasi Digital (JILID) Berbasis Etika dan Moral BerbudayaterhadapKecerdasanEmosionalSpiritual(Esq)untuk Menunjang Pendidikan yang Berkualitas', 'https://ejournal.uinsaid.ac.id/literasi/article/view/9775/3204', 'upload/1763574228_EthiGo. (3).png', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `review`
--

INSERT INTO `review` (`id`, `user_id`, `rating`, `comment`, `created_at`, `status`) VALUES
(3, 3, 5, 'Tes', '2025-11-19 15:51:30', 'approved'),
(4, 3, 5, 'dsfds', '2025-11-19 16:13:31', 'approved');

-- --------------------------------------------------------

--
-- Struktur dari tabel `search_logs`
--

CREATE TABLE `search_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `query_text` text NOT NULL,
  `searched_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_materi`
--

CREATE TABLE `sub_materi` (
  `id` int(11) NOT NULL,
  `materi_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `content_url` varchar(500) DEFAULT NULL,
  `order_index` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_device`
--

CREATE TABLE `users_device` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `device_type` enum('desktop','mobile','tablet') DEFAULT NULL,
  `browser` varchar(100) DEFAULT NULL,
  `os` varchar(100) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `last_active` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun_user`
--
ALTER TABLE `akun_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `donasi`
--
ALTER TABLE `donasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `created_by` (`created_by`);

--
-- Indeks untuk tabel `perpustakaan`
--
ALTER TABLE `perpustakaan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `search_logs`
--
ALTER TABLE `search_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `sub_materi`
--
ALTER TABLE `sub_materi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materi_id` (`materi_id`);

--
-- Indeks untuk tabel `users_device`
--
ALTER TABLE `users_device`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `akun_user`
--
ALTER TABLE `akun_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `donasi`
--
ALTER TABLE `donasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `materi`
--
ALTER TABLE `materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `perpustakaan`
--
ALTER TABLE `perpustakaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `search_logs`
--
ALTER TABLE `search_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sub_materi`
--
ALTER TABLE `sub_materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users_device`
--
ALTER TABLE `users_device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `donasi`
--
ALTER TABLE `donasi`
  ADD CONSTRAINT `donasi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `akun_user` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `materi_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `akun_user` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `akun_user` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `search_logs`
--
ALTER TABLE `search_logs`
  ADD CONSTRAINT `search_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `akun_user` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sub_materi`
--
ALTER TABLE `sub_materi`
  ADD CONSTRAINT `sub_materi_ibfk_1` FOREIGN KEY (`materi_id`) REFERENCES `materi` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users_device`
--
ALTER TABLE `users_device`
  ADD CONSTRAINT `users_device_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `akun_user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
