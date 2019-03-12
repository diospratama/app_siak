-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2018 at 04:34 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penduduk1`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_kelahiran`
--

CREATE TABLE `data_kelahiran` (
  `no_kelahiran` int(11) NOT NULL,
  `nik` char(16) DEFAULT NULL,
  `no_kk` char(16) DEFAULT NULL,
  `tempat_lahir` varchar(20) DEFAULT NULL,
  `kota_lahir` varchar(20) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `pukul` time DEFAULT NULL,
  `jenis_kelahiran` varchar(50) DEFAULT NULL,
  `penolong_kelahiran` varchar(30) DEFAULT NULL,
  `b_bayi` float DEFAULT NULL,
  `p_bayi` float DEFAULT NULL,
  `nama_ibu` varchar(50) DEFAULT NULL,
  `nama_ayah` varchar(50) DEFAULT NULL,
  `nik_pelapor` char(16) DEFAULT NULL,
  `nama_pelapor` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_kelahiran`
--

INSERT INTO `data_kelahiran` (`no_kelahiran`, `nik`, `no_kk`, `tempat_lahir`, `kota_lahir`, `tgl_lahir`, `pukul`, `jenis_kelahiran`, `penolong_kelahiran`, `b_bayi`, `p_bayi`, `nama_ibu`, `nama_ayah`, `nik_pelapor`, `nama_pelapor`) VALUES
(1, '3312015011610002', '3312010108057085', 'Rumah sakit', 'Wonogiri', '2017-08-01', '01:16:58', 'Tunggal', 'Dokter', 3, 50, 'Mesenah', 'Ngatimin', '3312012104570001', 'Tardi'),
(2, '3312010504740005', '3312010108057086', 'Rumah bersalin', 'Wonogiri', '2017-08-02', '13:16:58', 'Tunggal', 'Dokter', 3, 40, 'Katiyem', 'Tugimin', '3312014502610001', 'karsidi'),
(3, '3312014105600004', '3312010108057087', 'Puskesmas', 'wonogiri', '2017-08-03', '08:16:58', 'Tunggal', 'Bidan', 5, 50.3, 'Ponikem', 'wage kariyo rejo', '3312014502610002', 'jatradi'),
(4, '3312016105400001', '3312010108057088', 'Rumah bersalin', 'wonogiri', '2017-08-01', '02:16:58', 'Tunggal', 'Bidan', 5, 50.2, 'Miskinah', 'Karman', '3312014502610003', 'dursidi'),
(5, '3312011210300001', '3312010108057089', 'Rumah sakit', 'Wonogiri', '2017-08-06', '21:16:58', 'Tunggal', 'Bidan', 5, 40.5, 'Jumiyem', 'Sabar', '3312010704590001', 'rusidi'),
(6, '3312012003400001', '3312010108057090', 'Rumah sakit', 'Wonogiri', '2017-08-02', '08:16:58', 'Tunggal', 'Bidan', 5, 40.2, 'Purwanti', 'Tumin Marto Suwito', '3312010704590001', 'lasmini'),
(7, '3312016409460001', '3312010108057091', 'Rumah bersalin', 'wonogiri', '2017-08-04', '04:16:58', 'Tunggal', 'Bidan', 5, 50, 'Ngatiyem', 'Sukijo', '3312014904460001', 'pardi'),
(8, '3312010609450004', '3312010108057074', 'Rumah sakit', 'wonogiri', '2017-08-11', '09:57:15', 'Tunggal', 'Dokter', 5, 50.3, 'miskiyem', 'ngatino', '3123333434445454', 'ahmad');

-- --------------------------------------------------------

--
-- Table structure for table `data_kematian`
--

CREATE TABLE `data_kematian` (
  `id_kematian` int(11) NOT NULL,
  `nik` char(16) DEFAULT NULL,
  `tgl_kematian` date DEFAULT NULL,
  `jam_kematian` time DEFAULT NULL,
  `sebab_kematian` varchar(100) NOT NULL,
  `tempat_kematian` varchar(100) DEFAULT NULL,
  `yang_menerangkan` varchar(20) DEFAULT NULL,
  `nama_ayah` varchar(50) DEFAULT NULL,
  `nama_ibu` varchar(50) DEFAULT NULL,
  `nik_pelapor` char(16) DEFAULT NULL,
  `nama_pelapor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_kematian`
--

INSERT INTO `data_kematian` (`id_kematian`, `nik`, `tgl_kematian`, `jam_kematian`, `sebab_kematian`, `tempat_kematian`, `yang_menerangkan`, `nama_ayah`, `nama_ibu`, `nik_pelapor`, `nama_pelapor`) VALUES
(1, '3312014804430002', '2017-08-11', '02:24:20', 'gagal ginjal', 'rumah sakit dokter oen', 'Dokter', 'yanto', 'yanti', '3312012107950001', 'ahmad'),
(2, '3312015305410001', '2017-08-11', '02:24:20', 'diabetes', 'rumah sakit maguan husada', 'Dokter', 'pard', 'sumini', '3312012107950001', 'ahmad');

--
-- Triggers `data_kematian`
--
DELIMITER $$
CREATE TRIGGER `penduduk` AFTER INSERT ON `data_kematian` FOR EACH ROW BEGIN
 UPDATE penduduk
 SET stts = 'meninggal'
 WHERE
 nik = new.nik;
 END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_kosong_penduduk` AFTER DELETE ON `data_kematian` FOR EACH ROW BEGIN
 UPDATE penduduk
 SET stts = 'kosong'
 WHERE
 nik = old.nik;
 END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `data_kk`
--

CREATE TABLE `data_kk` (
  `no_kk` char(16) NOT NULL,
  `nama_kepala_keluarga` varchar(50) DEFAULT NULL,
  `alamat_kk` varchar(50) DEFAULT NULL,
  `rt` char(3) DEFAULT NULL,
  `rw` char(3) DEFAULT NULL,
  `desa_kelurahan` varchar(20) DEFAULT NULL,
  `kecamatan` varchar(20) DEFAULT NULL,
  `kabupaten_kota` varchar(20) DEFAULT NULL,
  `kode_pos` char(5) DEFAULT NULL,
  `provinsi` varchar(50) DEFAULT NULL,
  `akseptor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_kk`
--

INSERT INTO `data_kk` (`no_kk`, `nama_kepala_keluarga`, `alamat_kk`, `rt`, `rw`, `desa_kelurahan`, `kecamatan`, `kabupaten_kota`, `kode_pos`, `provinsi`, `akseptor`) VALUES
('3312010108057070', 'ajat sudrajat', 'suci', '001', '001', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057071', 'boidi', 'mojo', '001', '002', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057072', 'kasino', 'mojo', '001', '002', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057073', 'wagiman', 'mojo', '001', '002', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057074', 'ngatino', 'mojo', '001', '002', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057075', 'Rohmad', 'suci', '001', '001', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057076', 'wardi parto', 'maguan', '001', '004', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057077', 'yandi', 'maguan', '001', '004', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057078', 'sarno', 'pojok', '001', '005', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057079', 'tukijo karyo rejo', 'pondok', '001', '005', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057080', 'karjan', 'bakon', '001', '006', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057081', 'sogimin', 'sinung', '001', '007', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057082', 'sapto sutrisno', 'sinung', '001', '007', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057083', 'mardi', 'sumur', '001', '008', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057084', 'boidi', 'sumur', '001', '008', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057085', 'ngatimin', 'sumur', '001', '008', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057086', 'tugimin', 'duwet', '001', '012', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057087', 'wage kariyo rejo', 'ploso', '001', '014', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057088', 'karman', 'sambirejo', '001', '016', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057089', 'sabar', 'suci', '002', '001', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057090', 'tumin marto suwito', 'suci', '002', '002', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057091', 'sukijo', 'maguan', '002', '004', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057092', 'tri warsito', 'sinung', '002', '007', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057093', 'kusno', 'sinung', '002', '007', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057094', 'suranto', 'sinung', '002', '007', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong'),
('3312010108057697', 'sutrino', 'maguan', '001', '004', 'suci', 'pracimantoro', 'wonogiri', '57664', 'jawa tengah', 'kosong');

-- --------------------------------------------------------

--
-- Table structure for table `data_pendatang`
--

CREATE TABLE `data_pendatang` (
  `no_pendatang` int(11) NOT NULL,
  `no_kk` char(16) DEFAULT NULL,
  `stt_kk_p` varchar(16) DEFAULT NULL,
  `nik_pemohon` char(16) DEFAULT NULL,
  `alamat_asal` varchar(50) DEFAULT NULL,
  `rt_asal` char(3) DEFAULT NULL,
  `rw_asal` char(3) DEFAULT NULL,
  `desa_asal` varchar(20) DEFAULT NULL,
  `kecamatan_asal` varchar(20) DEFAULT NULL,
  `kab_asal` varchar(20) DEFAULT NULL,
  `prov_asal` varchar(20) DEFAULT NULL,
  `kode_pos_asal` char(5) DEFAULT NULL,
  `tgl_datang` date DEFAULT NULL,
  `jenis_kepindahan` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_pendatang`
--

INSERT INTO `data_pendatang` (`no_pendatang`, `no_kk`, `stt_kk_p`, `nik_pemohon`, `alamat_asal`, `rt_asal`, `rw_asal`, `desa_asal`, `kecamatan_asal`, `kab_asal`, `prov_asal`, `kode_pos_asal`, `tgl_datang`, `jenis_kepindahan`) VALUES
(1, '3312010108057076', 'Membuat KK baru', '3312010111450001', 'wonokarto', '001', '003', 'sambirejo', 'pracimantoro', 'wonogiri', 'jawa tengah', '57664', '2017-07-01', '4'),
(2, '3312010108057075', 'Numpang KK', '3312010406670001', 'pelem', '002', '004', 'sambirejo', 'pracimantoro', 'wonogiri', 'jawa tengah', '57664', '2017-07-10', '4'),
(3, '3312010108057072', 'Numpang KK', '3312010309420001', 'jenangan', '001', '002', 'Jenangan', 'Jenangan', 'Ponorogo', 'Jawa Timur', '57663', '2017-08-01', '1');

-- --------------------------------------------------------

--
-- Table structure for table `data_pindah`
--

CREATE TABLE `data_pindah` (
  `no_pindah` int(11) NOT NULL,
  `no_kk` char(16) DEFAULT NULL,
  `nik_pemohon` char(16) DEFAULT NULL,
  `alasan_pindah` varchar(100) DEFAULT NULL,
  `alamat_tujuan` varchar(50) DEFAULT NULL,
  `rt_tujuan` char(3) DEFAULT NULL,
  `rw_tujuan` char(3) DEFAULT NULL,
  `desa_tujuan` varchar(50) DEFAULT NULL,
  `kecamatan_tujuan` varchar(50) DEFAULT NULL,
  `kab_tujuan` varchar(50) DEFAULT NULL,
  `prov_tujuan` varchar(50) DEFAULT NULL,
  `kode_pos_tujuan` char(5) DEFAULT NULL,
  `tgl_pindah` date DEFAULT NULL,
  `jenis_kepindahan` char(1) DEFAULT NULL,
  `stt_kk_tp` char(1) DEFAULT NULL,
  `stt_kk_p` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_pindah`
--

INSERT INTO `data_pindah` (`no_pindah`, `no_kk`, `nik_pemohon`, `alasan_pindah`, `alamat_tujuan`, `rt_tujuan`, `rw_tujuan`, `desa_tujuan`, `kecamatan_tujuan`, `kab_tujuan`, `prov_tujuan`, `kode_pos_tujuan`, `tgl_pindah`, `jenis_kepindahan`, `stt_kk_tp`, `stt_kk_p`) VALUES
(1, '3312010108057075', '3312012104670002', 'Bekerja di jawa timur', 'jenangan', '001', '002', 'jenangan', 'jenangan', 'ponorogo', 'jawa timur', '63492', '2017-08-11', '3', '1', '3'),
(2, '3312010108057078', '3312012606590002', 'bekerja dipabrik ', 'Dulomo Utara', '001', '003', 'dulomo utara', 'kota utara', 'Gorontalo', 'Gorontalo', '96123', '2017-08-02', '1', '1', '3'),
(3, '3312010108057087', '3312014105600004', 'kerja', 'toronto', '02', '02', 'pakem', 'pakem', 'pakem', 'pakem', '90000', '2017-10-01', '4', '3', '1');

--
-- Triggers `data_pindah`
--
DELIMITER $$
CREATE TRIGGER `penduduk1` AFTER INSERT ON `data_pindah` FOR EACH ROW BEGIN
 UPDATE penduduk
 SET stts = 'pindah'
 WHERE
 nik = new.nik_pemohon;
 END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_kosong_penduduk_pindah` AFTER DELETE ON `data_pindah` FOR EACH ROW BEGIN
 UPDATE penduduk
 SET stts = 'kosong'
 WHERE
 nik = old.nik_pemohon;
 END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_pendatang`
--

CREATE TABLE `detail_pendatang` (
  `no` int(11) NOT NULL,
  `no_pendatang` int(11) DEFAULT NULL,
  `nik` char(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_pindah`
--

CREATE TABLE `detail_pindah` (
  `no` int(11) NOT NULL,
  `no_pindah` int(11) DEFAULT NULL,
  `nik` char(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pindah`
--

INSERT INTO `detail_pindah` (`no`, `no_pindah`, `nik`) VALUES
(3, 1, '3312010406670001');

--
-- Triggers `detail_pindah`
--
DELIMITER $$
CREATE TRIGGER `set_kosong_detail_pindah` AFTER DELETE ON `detail_pindah` FOR EACH ROW BEGIN
 UPDATE penduduk
 SET stts = 'kosong'
 WHERE
 nik = old.nik;
 END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_pindah_detail_pindah` AFTER INSERT ON `detail_pindah` FOR EACH ROW BEGIN
 UPDATE penduduk
 SET stts = 'pindah'
 WHERE
 nik = new.nik;
 END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `penduduk`
--

CREATE TABLE `penduduk` (
  `nik` char(16) NOT NULL,
  `no_kk` char(16) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` char(1) NOT NULL,
  `tempat_lhir` varchar(20) NOT NULL,
  `tgl_lhir` date NOT NULL,
  `agama` varchar(20) NOT NULL,
  `pendidikan` varchar(35) NOT NULL,
  `pekerjaan` varchar(15) NOT NULL,
  `status_pernikahan` varchar(12) NOT NULL,
  `sdhk` varchar(15) NOT NULL,
  `anak_ke` char(2) DEFAULT NULL,
  `warga_negara` varchar(3) NOT NULL,
  `asal_wna` varchar(20) DEFAULT NULL,
  `no_paspor` char(8) DEFAULT NULL,
  `no_kitas_kitap` char(10) DEFAULT NULL,
  `ortu_ayah` varchar(50) NOT NULL,
  `ortu_ibu` varchar(50) NOT NULL,
  `cacat` char(2) NOT NULL,
  `no_telp` char(13) DEFAULT NULL,
  `stts` varchar(20) DEFAULT 'kosong'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penduduk`
--

INSERT INTO `penduduk` (`nik`, `no_kk`, `nama`, `jk`, `tempat_lhir`, `tgl_lhir`, `agama`, `pendidikan`, `pekerjaan`, `status_pernikahan`, `sdhk`, `anak_ke`, `warga_negara`, `asal_wna`, `no_paspor`, `no_kitas_kitap`, `ortu_ayah`, `ortu_ibu`, `cacat`, `no_telp`, `stts`) VALUES
('3312010108057090', '3312010108057090', 'Tumin Marto Suwito', 'L', 'Wonogiri', '1963-12-26', 'Islam', 'Tamat SD', 'Petani', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'karsidi', 'lumiyem', 'CF', '087676626536', 'kosong'),
('3312010108057091', '3312010108057091', 'Sukijo', 'L', 'Wonogiri', '1980-04-17', 'Islam', 'Tamat SLTP', 'Pengusaha', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'jiran', 'jarni', 'TC', '089627626555', 'kosong'),
('3312010108057092', '3312010108057092', 'Tri Warsito', 'L', 'Wonogiri', '1967-05-16', 'Islam', 'Tamat SLTA', 'Petani', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'yuono', 'yarni', 'TC', '082344552666', 'kosong'),
('3312010108057093', '3312010108057093', 'Kusno', 'L', 'wonogiri', '1967-11-16', 'Islam', 'Tamat SLTA', 'Pengusaha', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'hartono', 'hartini', 'TC', '082344355366', 'kosong'),
('3312010108057094', '3312010108057094', 'suranto', 'L', 'wonogiri', '1965-09-25', 'Islam', 'Tamat SLTA', 'Pengusaha', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'mikiyo', 'sukiyem', 'TC', '087777363676', 'kosong'),
('3312010109680001', '3312010108057084', 'Boidi', 'L', 'wonogiri', '1972-07-24', 'Islam', 'Tamat SLTA', 'Petani', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'lukiyo', 'lasmi', 'TC', '082098345653', 'kosong'),
('3312010109800001', '3312010108057082', 'Sapto Sutrisno', 'L', 'Wonogiri', '1976-03-26', 'Islam', 'Tamat SLTA', 'Pengusaha', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'durja', 'yumijem', 'TC', '082134567888', 'kosong'),
('3312010111450001', '3312010108057076', 'wardi parto', 'L', 'jogja', '1976-05-06', 'Islam', 'Tamat SLTP', 'Buruh', 'Belum kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'larno', 'larni', 'TC', '897895676787', 'kosong'),
('3312010305610001', '3312010108057078', 'Dini Sulistyowati', 'P', 'Wonogiri', '1995-01-13', 'Islam', 'Tamat SLTA', 'Karyawan', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'Sarno', 'Poniyah', 'TC', '0897827667366', 'kosong'),
('3312010307550004', '3312010108057071', 'Tia Indah Sari', 'P', 'Suakarta', '1994-10-21', 'Islam', 'Tamat SLTA', 'Pelajar', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'Boidi ', 'Mariyem', 'TC', '0866647665356', 'kosong'),
('3312010309420001', '3312010108057072', 'kasino', 'L', 'wonogiri', '1986-07-02', 'Islam', 'Tamat SLTP', 'Buruh', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'lasdi', 'lastri', 'TC', 'tidak punya', 'kosong'),
('3312010403420002', '3312010108057073', 'wagiman', 'L', 'wonogiri', '1988-10-07', 'Islam', 'Tamat SLTP', 'Pengusaha', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'karno', 'karti', 'TC', 'tidak punya', 'kosong'),
('3312010406670001', '3312010108057075', 'eva tri waluyo', 'P', 'klaten', '2017-07-01', 'Islam', 'Belum Tamat SD', 'Pelajar', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'rohmad', 'aminah', 'TC', 'tidak punya', 'pindah'),
('3312010407600001', '3312010108057074', 'ngatino', 'L', 'wonogiri', '1983-10-05', 'Islam', 'Tamat SLTP', 'Petani', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'rasdi', 'rasmi', 'TC', 'tidak punya', 'kosong'),
('3312010504740005', '3312010108057086', 'astri novia', 'P', 'Wonogiri', '2017-08-02', 'Islam', 'Belum Tamat SD', 'Pelajar', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'Tugimin', 'Kartiyem', 'TC', 'tidak punya', 'kosong'),
('3312010606590004', '3312010108057080', 'Milawati', 'P', 'Semarang', '2017-08-11', 'Islam', 'Tamat SLTA', 'Buruh', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'karjan', 'paijem', 'TC', '087666889990', 'kosong'),
('3312010607810002', '3312010108057079', 'heri siswanto', 'L', 'jakarta', '2000-07-15', 'Islam', 'Tamat SLTA', 'Pelajar', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'tukijo karyo rejo', 'miskiyem', 'TC', '087888378738', 'kosong'),
('3312010609450004', '3312010108057074', 'Lastri', 'P', 'Sukoharjo', '1993-04-30', 'Islam', 'Tamat SLTP', 'Pelajar', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'Ngatino', 'Surati', 'TC', '087746536653', 'kosong'),
('3312010703780001', '3312010108057071', 'boidi', 'L', 'wonogiri', '1995-07-14', 'Islam', 'Tamat SD', 'Petani', 'Belum kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'karsido', 'ginem', 'TC', 'tidak punya', 'kosong'),
('3312010704420001', '3312010108057088', 'Karman', 'L', 'Wonogiri', '1967-03-16', 'Islam', 'Tamat SLTP', 'Petani', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'tumiran', 'yusni', 'TC', '087677666255', 'kosong'),
('3312010706450003', '3312010108057086', 'Tugimin', 'L', 'Wonogiri', '1978-02-23', 'Islam', 'Tamat SLTA', 'Petani', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'rusidi', 'karti', 'TC', '087889556443', 'kosong'),
('3312010709510002', '3312010108057081', 'Sogimin', 'L', 'Wonogiri', '1988-10-12', 'Islam', 'Tamat SLTP', 'Petani', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'jumiran', 'jusmin', 'TC', '089786564876', 'kosong'),
('3312010907580002', '3312010108057082', 'Anggita Premaswari', 'P', 'Wonogiri', '1994-08-20', 'Islam', 'Tamat perguruan tinggi', 'Pegawai Negeri', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'Sapto Sutrisno', 'Katiyem', 'TC', '088778877676', 'kosong'),
('3312011101430001', '3312010108057083', 'Trikus Tiawan', 'L', 'Ngawi', '1994-11-19', 'Islam', 'Tamat SLTA', 'Buruh', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'mardi', 'satiyem', 'TC', '087665256355', 'kosong'),
('3312011102570003', '3312010108057080', 'karjan', 'L', 'boyolali', '1981-08-14', 'Katolik', 'Tamat SLTP', 'Pengusaha', 'Kawin', 'kepala keluarga', '2', 'WNI', 'kosong', 'kosong', 'kosong', 'gito', 'gatmi', 'TC', '087567452676', 'kosong'),
('3312011105320001', '3312010108057079', 'tukno karyo rejo', 'L', 'sukoharjo', '1980-07-10', 'Islam', 'Tamat SLTP', 'Buruh', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'hardi', 'harsi', 'CF', '082345678989', 'kosong'),
('3312011210300001', '3312010108057089', 'Minggar', 'P', 'Wonnogiri', '2017-08-06', 'Islam', 'Tidak Sekolah', 'Pelajar', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'sabar', 'jumiyem', 'TC', 'tidak punya', 'kosong'),
('3312011405430001', '3312010108057085', 'Ngatimin', 'L', 'Wonogiri', '1976-02-29', 'Islam', 'Tamat SD', 'Petani', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'hardi', 'harsi', 'TC', '0896789996777', 'kosong'),
('3312011408420001', '3312010108057084', 'yudi setiawan', 'L', 'Wonogiri', '1996-07-28', 'Islam', 'Tamat SLTA', 'Pengusaha', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'boidi', 'saniyem', 'TC', '0866256255252', 'kosong'),
('3312011506670003', '3312010108057089', 'Sabar', 'L', 'Wonogiri', '1963-11-14', 'Islam', 'Tamat SLTP', 'Pengusaha', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'poinimin', 'poyem', 'TC', '087666266252', 'kosong'),
('3312011507750006', '3312010108057083', 'Mardi', 'L', 'Wonogiri', '1977-11-30', 'Islam', 'Tamat SLTP', 'Petani', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'dito', 'dirta', 'TC', '085345234178', 'kosong'),
('3312011806550001', '3312010108057087', 'Wage Kariyo rejo', 'L', 'Wonogiri', '1973-03-15', 'Islam', 'Tamat SLTP', 'Petani', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'yandi ', 'tusmi', 'TC', '087567778112', 'kosong'),
('3312012003400001', '3312010108057090', 'Winda Widi', 'P', 'Wonogiri', '2017-08-02', 'Islam', 'Belum Tamat SD', 'Pelajar', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'Tumin marto Suwito', 'Purwanti', 'TC', 'tidak punya', 'kosong'),
('3312012011530001', '3312010108057077', 'Lilik Asmirah', 'L', 'Wonogiri', '1993-01-07', 'Islam', 'Tamat SLTA', 'Karyawan', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'yandi', 'niyem', 'TC', '088766736635', 'kosong'),
('3312012104670002', '3312010108057075', 'rohmad', 'L', 'klaten', '1976-05-06', 'Kristen', 'Tamat SLTA', 'Pengusaha', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'wardi', 'wasti', 'TC', 'tidak punya', 'pindah'),
('3312012204660001', '3312010108057081', 'huda muslakim', 'L', 'Pacitan', '2000-06-16', 'Islam', 'Tamat SLTA', 'Pelajar', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'sogimin', 'sinem', 'TC', '087788666226', 'kosong'),
('3312012606590002', '3312010108057078', 'sarno', 'L', 'wonogiri', '1988-05-06', 'Kristen', 'Tamat SLTA', 'Buruh', 'Belum kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'jarno', 'jarni', 'TC', '085624656565', 'pindah'),
('3312012609730001', '3312010108057070', 'ajat sudrajat', 'L', 'wonogiri', '1984-05-17', 'Islam', 'Tamat SLTP', 'Buruh', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'rasdi', 'dasmini', 'TC', '0852541232111', 'kosong'),
('3312012904860002', '3312010108057077', 'yandi', 'L', 'sukoharjo', '2017-07-09', 'Islam', 'Tidak Tamat SD', 'Petani', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'kiran', 'karti', 'TC', '876778678456', 'kosong'),
('3312014103300001', '3312010108057078', 'Poniyah', 'P', 'wonogiri', '1969-12-18', 'Islam', 'Tamat SLTP', 'Pengusaha', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'gito', 'gatmi', 'TC', '089789780678', 'kosong'),
('3312014104422000', '3312010108057087', 'Ponikem', 'P', 'Wonogiri', '1980-12-26', 'Islam', 'Tamat SLTA', 'Petani', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'jardi', 'karti', 'TC', '085625365354', 'kosong'),
('3312014105600004', '3312010108057087', 'bella selviani', 'P', 'wonogiri', '2017-08-03', 'Islam', 'Tidak Sekolah', 'Pelajar', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'Wage Kariyo Rejo', 'Ponikem', 'TC', 'tidak punya', 'pindah'),
('3312014107280018', '3312010108057077', 'Masirah', 'P', 'Wonogiri', '1970-05-08', 'Islam', 'Tamat SLTA', 'Petani', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'karyo', 'nita', 'TC', '087878676656', 'kosong'),
('3312014107450007', '3312010108057071', 'mariyem', 'P', 'surakarta', '1967-09-14', 'Islam', 'Tamat SD', 'Petani', 'Kawin', 'Isteri', '2', 'WNI', 'kosong', 'kosong', 'kosong', 'pasidi', 'kasni', 'TC', 'tidak punya', 'kosong'),
('3312014204490001', '3312010108057083', 'Satiyem', 'P', 'Wonogiri', '1983-03-31', 'Islam', 'Tamat SD', 'Petani', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'pandi', 'parsi', 'TC', '085666772111', 'kosong'),
('3312014209610001', '3312010108057094', 'Warsi', 'P', 'Wonogiri', '1968-05-15', 'Islam', 'Tamat SD', 'Petani', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'yarno', 'tarsi', 'TC', '085665531111', 'kosong'),
('3312014302400002', '3312010108057079', 'supiyem', 'P', 'wonogiri', '1981-09-17', 'Islam', 'Tamat SD', 'Petani', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'tuliyo', 'karti', 'TC', 'tidak punya', 'kosong'),
('3312014309480003', '3312010108057077', 'niyem', 'P', 'wonogiri', '1980-05-10', 'Islam', 'Tamat SLTA', 'Petani', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'dasno', 'dasni', 'TC', '087677366376', 'kosong'),
('3312014405680002', '3312010108057072', 'Tukini', 'P', 'Wonogiri', '1983-06-17', 'Islam', 'Tamat SLTA', 'Pengusaha', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'yuniko', 'yasmin', 'TC', '087665535342', 'kosong'),
('3312014509530002', '3312010108057088', 'Miskinah', 'P', 'Wonogiri', '1984-04-18', 'Islam', 'Tamat SLTP', 'Petani', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'yardi', 'tarti', 'TC', '087456226635', 'kosong'),
('3312014607320001', '3312010108057081', 'Sinem', 'P', 'Wonogiri', '1969-08-28', 'Islam', 'Tamat SLTA', 'Petani', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'tito', 'tarti', 'TC', '087666555444', 'kosong'),
('3312014704420003', '3312010108057084', 'Saniyem', 'P', 'Wonogiri', '1972-03-23', 'Islam', 'Tamat SLTA', 'Petani', 'Kawin', 'kepala keluarga', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'kartono', 'tini', 'TC', '085252442541', 'kosong'),
('3312014704640001', '3312010108057073', 'Rasdi Kurniawan', 'L', 'Wonogiri', '1992-02-21', 'Islam', 'Tamat SLTA', 'Pengusaha', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'Wagiman', 'Sartumi', 'TC', '088777363625', 'kosong'),
('3312014804430002', '3312010108057079', 'miskiyem', 'P', 'sukoharjo', '1978-01-05', 'Katolik', 'Tamat SD', 'Petani', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'yanto', 'yanti', 'TC', '087678567345', 'meninggal'),
('3312014811580002', '3312010108057086', 'Kartiyem ', 'P', 'Wonogiri', '1975-01-16', 'Islam', 'Tamat SLTP', 'Pengusaha', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'takdi', 'yunika', 'TC', '085422221112', 'kosong'),
('3312014907480001', '3312010108057076', 'Sri Tunggak Dewi', 'P', 'Boyolali', '1992-11-13', 'Islam', 'Tamat SLTA', 'Pengusaha', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'Wardi Parto', 'Surip', 'TC', '087665111222', 'kosong'),
('3312014907790002', '3312010108057090', 'Purwanti', 'P', 'Wonogiri', '1989-10-20', 'Islam', 'Tamat SLTA', 'Pengusaha', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'karno', 'kartinah', 'TC', '089776633344', 'kosong'),
('3312015004310001', '3312010108057082', 'Katiyem', 'P', 'Wonogiri', '1973-03-22', 'Islam', 'Tamat SLTP', 'Buruh', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'gito', 'rasti', 'TC', '087887736647', 'kosong'),
('3312015004740001', '3312010108057074', 'surati', 'P', 'wonogiri', '1974-11-21', 'Islam', 'Tamat SLTA', 'Buruh', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'parno', 'sarti', 'TC', '087321654443', 'kosong'),
('3312015011610002', '3312010108057085', 'anis ', 'P', 'Wonogiri', '2017-08-01', 'Islam', 'Belum Tamat SD', 'Pelajar', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'ngatimin', 'masinah', 'TC', 'tidak punya', 'kosong'),
('3312015203570004', '3312010108057089', 'Jumiyem', 'P', 'Wonogiri', '1969-11-28', 'Islam', 'Tamat SLTP', 'Pengusaha', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'bardi', 'harsi', 'TC', '086675565536', 'kosong'),
('3312015206450002', '3312010108057080', 'paijem', 'P', 'wonogiri', '1965-06-09', 'Islam', 'Tamat SLTP', 'Petani', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'kardi', 'surtini', 'TC', '087987765321', 'kosong'),
('3312015305410001', '3312010108057070', 'pariyem', 'P', 'wonogiri', '1968-05-01', 'Islam', 'Tidak Sekolah', 'Petani', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'pardi', 'sumini', 'TC', 'tidak punya', 'meninggal'),
('3312015802360001', '3312010108057091', 'Ngatiyem', 'P', 'wonogiri', '1984-07-21', 'Islam', 'Tamat SLTP', 'Buruh', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'sardi', 'garti', 'TC', '089773763244', 'kosong'),
('3312015902470002', '3312010108057085', 'Mesinah', 'P', 'Wonogiri', '1962-03-22', 'Islam', 'Tamat SLTP', 'Petani', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'damino', 'dasni', 'TC', '085665554254', 'kosong'),
('3312016000540000', '3312010108057076', 'Surip', 'P', 'wonogiri', '1962-12-20', 'Islam', 'Tamat SLTA', 'Petani', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'jito', 'jatmikem', 'TC', '087678567654', 'kosong'),
('3312016005660001', '3312010108057092', 'Sunarmi', 'P', 'Wonogiri', '1985-10-25', 'Islam', 'Tamat SLTA', 'Pengusaha', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'tarno', 'tarti', 'TC', '087564425523', 'kosong'),
('3312016105400001', '3312010108057088', 'Debby Astriani', 'P', 'Wonogiri', '2017-08-01', 'Islam', 'Tidak Sekolah', 'Pelajar', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'Karman', 'Miskinah', 'TC', 'tidak punya', 'kosong'),
('3312016405570001', '3312010108057073', 'Sartumi', 'P', 'wonogiri', '1984-01-04', 'Islam', 'Tamat SLTA', 'Buruh', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'jarno', 'miskiyem', 'TC', '087890678765', 'kosong'),
('3312016409460001', '3312010108057091', 'Intan Sari', 'P', 'Wonogiri', '2017-08-04', 'Islam', 'Belum Tamat SD', 'Pelajar', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'Sukijo', 'Ngatiyem', 'TC', 'tidak punya', 'kosong'),
('3312062909790002', '3312010108057070', 'tri setiawan', 'L', 'wonogiri', '1990-06-08', 'Islam', 'Tamat SLTA', 'Buruh', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'ajat sudrajat', 'pariyem', 'TC', '089900899222', 'kosong'),
('3331201611041000', '3312010108057093', 'Samijem', 'P', 'Wonogiri', '1984-07-19', 'Islam', 'Tamat SLTA', 'Petani', 'Kawin', 'Isteri', '0', 'WNI', 'kosong', 'kosong', 'kosong', 'randi', 'rasmi', 'TC', 'tidak punya', 'kosong'),
('3334453656891011', '3312010108057072', 'rita', 'P', 'wonogiri', '1994-07-01', 'Islam', 'Tamat SD', 'Petani', 'Belum kawin', 'Anak', '1', 'WNI', 'kosong', 'kosong', 'kosong', 'kasino', 'kasiyem', 'TC', '0898636455655', 'kosong');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(50) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `pass` varchar(16) DEFAULT NULL,
  `status` varchar(11) DEFAULT NULL,
  `nip` char(18) DEFAULT NULL,
  `history` char(6) DEFAULT 'kosong'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_user`, `nama_lengkap`, `username`, `pass`, `status`, `nip`, `history`) VALUES
(5, 'sunarni', 'sunarni', 'since007', 'Admin', '196703132007011040', 'kosong'),
(7, 'user', 'user', '12345', 'User', '000', 'kosong'),
(8, 'admin', 'admin', '12345', 'Admin', '000', 'kosong');

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

CREATE TABLE `picture` (
  `id` int(11) NOT NULL,
  `picture` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `picture`
--

INSERT INTO `picture` (`id`, `picture`) VALUES
(1, 0xffd8ffe000104a4649460001010100dc00dc0000ffe100b24578696600004d4d002a000000080007013e00050000000200000062013f000500000006000000720301000500000001000000a20303000100000001000000005110000100000001010000005111000400000001000021d55112000400000001000021d50000000000007a26000186a000008084000186a00000fa00000186a0000080e8000186a000007530000186a00000ea60000186a000003a98000186a000001770000186a0000186a00000b18fffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc000110800b3009a03012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f27f0b699e1b974ed4356f144daa8b1b6961b648b4c58fcc692512306264380a042c318c92c3a639ed20f067826eade2b8b7f0cfc519a09503c7247610b2ba9190410b8208ef5c1d9ffc93cd67fec2b61ffa2aeebedfa00f983fe104f07ffd0a9f157ff05d0fff001347fc209e0fff00a153e2affe0ba1ff00e26be9fa2803e60ff8413c1fff0042a7c55ffc1743ff00c4d1ff00082783ff00e854f8abff0082e87ff89afa7e8a00f983fe104f07ff00d0a9f157ff0005d0ff00f1347fc209e0ff00fa153e2aff00e0ba1ffe26be9fa2803e60ff008413c1ff00f42a7c55ff00c1743ffc4d1ff082783ffe854f8abff82e87ff0089afa6e79e1b5b796e2e258e182242f249230554503249278000ef5e77ff000bc7c15ff0947f627daa7dbe6f93fda3b17ec9bb1d77eecedcf1bb6edef9dbf35007947fc209e0ff00fa153e2aff00e0ba1ffe268ff8413c1fff0042a7c55ffc1743ff00c4d7d3704f0dd5bc5716f2c73412a078e48d832ba9190411c10477a92803e60ff8413c1fff0042a7c55ffc1743ff00c4d1ff00082783ff00e854f8abff0082e87ff89afa7e8a00f983fe104f07ff00d0a9f157ff0005d0ff00f1347fc209e0ff00fa153e2aff00e0ba1ffe26be9fa2803e60ff008413c1ff00f42a7c55ff00c1743ffc4d1ff082783ffe854f8abff82e87ff0089afa7e8a00f93352f0a7826e7c19e26d53421e27b7d43437b74960d5bc9401a497cb20aa0ce461b2091838f7af33afa03e207fcd62ffb82ff00ecb5f3fd0074167ff24f359ffb0ad87fe8abbafb7ebe20b3ff009279acff00d856c3ff00455dd7dbf40051451400514565ebfe23d23c2da5b6a5ad5f4769681c26f6058b31e8155412c7a9c007804f40680352b87f18fc52d0bc2579fd94167d4f5d7dab169b66859cb383b031e8b93b46065be65214835cff00f6df8e7e24cfe5f87a19fc2de19962cff6a5dc00ddcd94ff009669bb853bd70cbfdd243e7e5aec3c1df0ff00c3fe07b3f2b49b5dd70db8497b38569e40483b4b8030bc2fca001c6719c9201c5c1e02f15f8fee22bbf895771db69f0b896df43d39c2a870704c8c3390541c6198fef0e1939064bbd0fc3eff001a47876e2c2c62d32efc28d0a592a2c68e4dd172114630dc33fcbc8da5bb66abea3e37f88fa6eb93d9ea76be15d0ed5a52b6973a91b8304cbf3903cf43b036d4270fe5b1c8c2f381d25af83f5a1e1fbebcb8b9d3478c6eef5350378919302bc442c5129016411794be59e49c4b27dedc4100e5eebc0fe2ff0086cf7fa9fc3dbe8ef349776b89741bb8cc847ca062339cb9192782ac42203e61aeb3c1df14b42f16de7f65159f4cd75372cba6de21570c806f0a7a360ee18386f9589500563e83e2bf1fdef8d22d227b6f0e6a16304af16a573a6adcaa5a950a4af9ae36349975f91771e086d9cb0dcf1f7c33d17c7f6f1b5e192d750811960bd840dc01070ae0fdf40c738e0f5c1193900ed28af1ff00f848fc73f0bffe46f8ff00e121f0cc7f22eab68a3ed3167e58c48a48ce768c96cf320fde31c29f4cd03c47a478a74b5d4b45be8eeed0b94dea0a9561d432b0054f438207041e845006a5145140051451401e01f103fe6b17fdc17ff65af9febe80f881ff00358bfee0bffb2d7cff00401d059ffc93cd67fec2b61ffa2aeebedfaf882cff00e49e6b3ff615b0ff00d15775f6fd00151cf3c36b6f2dc5c4b1c304485e492460aa8a064924f0001deb9bf1ef8decfc03e1e1ab5e5acf75e64bf678628481990a332ee24fcabf21048048cf435c1c1e0cf15fc4ebf8b53f1dc92697a0c57027b4d023c6e7429c798c3054f40777cdcc8008f228036352f8a173ac6b2ba17c3dd3a3d6eec3ecb9d4650e2caccee3f7d801b81557208201e36ef3f2d49e1ef84f6e2f1b59f1b5e7fc24dadc9c86ba05a0b7041dd1a464ed65dcec4640038c2a91cf79a569563a26976fa66996d1db59dba6c8a241c28fe64939249e49249e4d5ca0028af33f1c7c6ad03c24f259d8f97ab6a905c086e2d12468c4436924f99b194904052a0e41273d08af2cff0084b7e24fc5cf10f95e1d927d32d6d7ef2d95cbc11c28ef80d349905db1d80e42b154fbd401edff00141359b8f87fa8d8e83673dcdfdf6cb4558421da9230572db8f0a549524676eecf0016186baff8defbe235968e5b4dd30268e755974e28661213208fc8927ea083f36f45c2938db20193c02fc0d9b42d2ecaef5df88569a2bc3705e2c02228a63820c723c89f3958d4e4007e5efb41a35dd3e3b5f0449e23b3d73c5dfda9696fe545e2599a7821d411dd6458f616795536b6d56da9197eadc8a00f53f86369af69da3ea565ade8bfd9318d4269ec6d92485e3860958b8894c67f858bf5038618e381dc57c41e1ed434eb19ec1ef0f99b6edd27b778da18dade5409216b889bcee991b02b003279dccadd8787fe2bf8b3c2fe7c6fe2383558e4def07f686fb98dc0dc0b6f044d1b131a854600624dcc1460900faae7821bab796dee228e6825429247228657523041078208ed5e5fadfc239b4fd67fe120f877a947e1fd5363ac96eca5ade6dcd93c1dc10004fcbb5972a980b8cd759e12f1d697e2c8a38633f65d585a437571a7c8d97892450cac1870ea4329c8e9b97705276d751401e57a07c615b6bd5d0fc7fa7c9e1ed6b7902468985acabbf6a956249033bbe6c94c213bf9c0f54acbd7fc39a478a74b6d375ab18eeed0b87d8c4a9561d0ab29054f519047048e84d797cfa1f8d3e12dbcb71e18ba8f5bf095b219e6d3afe4559edd40df2b2b80a318438c67990feed8e58807b2515cff0083bc63a5f8e343fed6d27cf5856568648e74daf1b8c1c1c120f054f04f5f5c81d05007807c40ff009ac5ff00705ffd96be7fafa03e207fcd62ff00b82ffecb5f3fd0074167ff0024f359ff00b0ad87fe8abbafb7ebe20b3ff9279acffd856c3ff455dd7dbf40187e31d017c53e0ed5745658cbdd5bb2c5e6332aaca3e68d895e701c29efd3a1e95cdfc18f127fc247f0d6c3747b26d37fe25f26170ade5aaed23939f90a64f1f36ee318af40af1fd03fe289f8fdac6867f7b6be298bfb4217fbcf1c80c8e431e005c89f8018ff00abe7ef5007b05795fc64f1ddf786ac23d374b5915e54592fee6397ca920819f6aac4ec08f364db2608dcca2376dbc6e5f54af953c5126b5e2fd675479f4a8ef6defef44ba7ddb21fed1164ac7cb36b6c644678b6166e130c4b166caee500b1f0a3c096de27d49a099b5282d12c94eb704b1222ce1e5596dd236cef08ea88e58283f21c361c63e87d5af34df04f83afaf6ded2d2dacf4fb79258eda3db046cdc9083030a598e3a725ba126b0fe13e996765f0ff004cb9b79a0bb9ae62cbdf2a8f3268d59bca590827e68d084dbb8842a54120553f8cd05ccde0a84c36525f4097b1fda2d177913865748d195244660666878539070d86db8201c86932b6a5e20d4350f12f89a4bcb1d4d1ac625d374a57fb79c13716f6cc15e76b58c2ed2ea1433316043659adda785353d5278759b1f0dcefe1eb18bcab3f0c788efa62d332a38328490ba44c0958d15c152b96f932a6b8cf0d784fc43abdbcf71a16b9e2e06d1c69d2486cede09e0f2867c805ef15d106f194185ce3232a31634dd07c6faadc3416fe20f8948ea9bc9bab136eb8c81c34978a09e7a673d7d0d006c6bcd65a37897c27a70f116a5a0269d70d2c506b104531b1dc7f751891195daddd4488c56591542a2b95eda7a6784b46f887f0d65d57c2b27fc23dabea1108ef63b09de1b679514a3432c28c5446d92471bb0e18e7243719e2ef06f89b4af0d5deabad6a7e20952d90ff00a55d5a5a3cbf3831888ccb76f2889bcc20a8cafcc4ed3cd7a5fc1ed02e3466f100ba9f4a79ada5b7d2d934b882c598220c58be01790998872c321948e980003c23fe271e1ebabdb69ac755d3bfb325679a4b28dd3fb1a69e58d5991c39322bc31045dee036fe09c6e6fa3fe13f8c6e3c6de0686fefb9bfb795ad6e9c204591d40218007bab2e7a7cdbb000c5737f1d3c396973a5e99e247b1b49df4fb8582e9ae8bac42de5f97749e5112b0490a1010e46e6e0e4d709f073c556fe17f10d9e96cff68b3d6256b07bb5b23146258dd8c5e5c83e69b779c036f45650f1f3b571401f4bd707f18b5f5f0ffc32d55b747e7df27d8615746218c990fd3a111f98413c640ebd0f795e3fafff00c56df1fb47d0c7eead7c2d17f684cff75e49098dc053c82b93070429ff0059cfdda00ef3c01a03785fc07a368f2ac8b3c16e1a747656292b92f22e57820333018cf00727ad749451401e01f103fe6b17fdc17ff65af9febdf3c722654f8c62792377dfa390510a8dbb9768c12790b804e79209c0ce0781d0074167ff0024f359ff00b0ad87fe8abbafb7ebe28d2fec7ff0ad7c49f69f3fcefed0d3fecbe5636f99b6e73bf3fc3b37f4e776ded9afb5e800af2bf8e1a6cd0e89a4f8c2d1a3377e1bbd8ee163949d8eace8304019277ac7dc71bbbe2bd52a9eada6c3ace8d7da5dc348b05edbc96f23464060aea54919046707d0d0049617d6fa9e9d6d7f6727996b7512cd0bed237230054e0f23208eb5f262d8e8a26d16f6e5b594d73ed005e59d9de813db1133c30dbdb46caf2f9a8b1ab61c80aa8abbb74898f67f813a94c3c277fe18be58e2d4340bd92de585412555999b2cd92ac77f9a3e53d147d4e07c40b0f1e689e33d6ee7c3624483c4ef6b6f6f35a2a3cad2a44c86225981886d12c86400e36a7ccbf36003bff853796375f0f34f8b4fb8b49e0b3796d0496d17941c248c15d909255dd76c841e72f9ef5d46aba6c3abe9771613b48893260491101e26eaae8483b5d580653d8807b57807823c75abc5acc9aef9da96b57f7d6f01bfd393411149730ab3219a0921dc1cc4c4ae6408187cb90400beff00a5ea969acd82ded93c8d033ba7ef227898323946055c0604329182074a00f18d7eff00c51f0bbc4bacdfc3777777a1bbc3a8989b4c4315e4921486559678e3510cbc6f18041e0b659b0dd3d97c65d3e5366979a3ddc32ea8e0e9315bdcdbced768d22c69bb120f29cb16cabe00d8c371208af4caf0cb7935cd5f5eb9bfd12d7c3f6fa86a7a64fa8c3a2c9a3c58beb07902a9bab8dd9f364df9d8ac5728376dc9a0093c65ab6bde37d626f09cbe1cd55238f4a32cb63693c2ea97eeac62fb44cb26d10aeddea18a333052548da2bd5fc29a37fc23de12d274829024969691c52f90308d2051bd8703396dc72464e7279a3c2f1e8fff0008f59de687a6c1a7d8dfc4978b0c30245f7d1482ca9c6ec601ebd3ad6c50079ffc6dff009243aeff00dbbffe8f8ebc53c23a3471fc4fd0f4a86caee3b18b58626092385eea2b9b6891a406e762abc4af9f955b25573b0332e7acf8a1f12adfc57e7785fc34f05e5adb6fb9bff394f977c906d94c713ab67680b2331f93223f918e406c7f823e0f8b5ed5ad2fafa7826b3d27fe2611430dcbef4b8924d88244fbab8fb317c0c13ba3c965f94007d17ab6a50e8da35f6a970b2341656f25c48b18058aa2962064819c0f515e6ff03f4d9a6d1356f185db462efc497b25c347113b1155dc6002320ef693b9e36f7cd1f1c3529a6d1349f07da2c62efc497b1dbac9283b1155d0e490720ef68fb1e3777c57a65858dbe99a75b5859c7e5dadac4b0c29b89da8a005193c9c003ad0058a28a2803c03e207fcd62ffb82ff00ecb5f3fd7be78e4ccc9f18ccf1c68fbf470023961b772ed39207257048c70491938c9f03a00e82cffe49e6b3ff00615b0ffd15775f6fd7c4167ff24f359ffb0ad87fe8abbafb7e800a28a2803c8f569e6f06fed03a7de99644d2fc556eb6d3f98c594dc2008815579041f246e6040f35f9eb8f44f117872cfc4b676b05d493c325a5dc77b6d3c0c03c334672ac0302a7a91860473d33835cbfc66d1ee354f875757564f3a5f6932a6a56ed0ca232a63cee6c9feea33b0c1072a31e87a4f076bebe29f07695ad2b465eeadd5a5f2d1955651f2c8a037380e1877e9d4f5a00f08f1e785b5af09f8575b5bbb992ed2eb536bbbbbafb118e3d4964440a59a163e5986667658e42a8c5b237636d6e7886f5342f11af82fc19a35f49e21ea3544d61619ee2e420b867b843913ae1b3fbdc03ba4540315ee73c10dd5bcb6f711473412a1492391432ba9182083c10476ae0f50f85d656d7961ad7862e67b1d6f4a88c7626eee24b981931810bac859963da5d46c2bb77923240a008fc47ad6b5ff08af88345f106996905dc9e1cbbb98eeac2e4cb04c51364a36b2aba10648c81f30c37dec83587adbd858fc5b8bc57acde4f6f1e9faac7a3c534a6316c914960f26381bf70964c966f94071ce01db63c50216d62f35bd635cb1835dd374f71636160f7370da54bb5985c49e5f26360cbbcbc0176ec5391f7fc61bc7ce7c51a66a96fa178727d4b49b4308bb68da286e4c40ec9847ba301822808bb41cf419d8a801edfe0df167847c15f0c7496bad63cad325bbbc8ac24951da49a35b9976b6d55ddf776e4ed001201c640af28f893f10fc63acb5eda5dbffc23f6917d9e3934659f13c82689df73900332ed3865380bb9015ce4d67f8875cff859dac5bdf4f7739bbb995a03a458e93f68b9b68635768cc4f91e6a9dec5f2c873ced21571dc7c2cf87ba0f8a34ebcd4aef5381aceefca33681a4decc90a000ed1701dbcc2c1c3328ce32a482ca70003ccedec357f885712e9de1cd32d30b7b79a9269f0b88dada390c2a46e6da850611542f3c364018afa9fc19e0bd37c17a5bdbd9a46f7772fe6de5d0856333c9cf455e11064ed41c28f7249dcb1b0b3d32ce3b3b0b482d2d63cec8608c468b9249c28e064927f1ae7fe21f89d3c25e06d4f54f3fc9ba1118acc8da58cec309856e1b07e6239f9558e0e280383f0dc6de32fda075dd79e6905a78653ec36f130556de43c67a03b93779ed9241f993b640f64ae1fe1278624f0afc3ad3ed6e60f26fae737774a77643bf40c1b1b5820452303054f5ea7b8a0028a28a00f00f881ff358bfee0bff00b2d7cff5f407c40ff9ac5ff705ff00d96be7fa00e82cff00e49e6b3ff615b0ff00d15775f6fd7c49a7c6aff0e75f669a38cc7a9d832ab06cc87cbba1b57008ce093ce0614f39c03f6dd00145707f10fc777de1bb8d3343f0ee9d1ea7e24d51ff00d1edd8e5634079770181c1e707207cac49f9483e7967e12d4b59d634f93e296a7e23d3b5a9eec8d2eeadeeadd6d15c2a6d4428184533152470bbb6704b5007bdcf043756f2dbdc451cd04a85248e450caea460820f0411dabc7fe1aebfa6f81754f1278175dd4a3b14d3af5a6d3e4d42f1407b77c1550784538daf80412656f9461a8d2bc4fabf80fe26dbf83b59f1047ade8f7efe5da4f3cc24bbb491be6449b682e4b1755cb70415652a0328ee35ff00869e0ff146a8da9eb1a2c73de3204695669222e074ddb180271c64f38007402802e7fc277e0fff00a1af43ff00c18c3ffc5557bff18783efb4eb9b3ff84cb4ab7f3e268bceb7d5214923dc08dc8dbb8619c83d8d63ff00c292f879ff0042f7fe4edc7ff1ca3fe1497c3cff00a17bff00276e3ff8e5007945b78d61f0c784b4df0f6a7258eab0b7cfb25fb2cd696823504a7936b231b8662cf8333202fb1b82198539dfc25a26ae6dd347d1afada2b7b29a178b5082674b68e7692e3ce666092dd49855f2d3236b6d52547cdec7ff000a4be1e7fd0bdff93b71ff00c728ff008525f0f3fe85effc9db8ff00e39401e616baaf86e6827d2b4a8343b9d32daedad2dae6faea3b55b8d3e67f3a58251348265f29dc324c8ae7747c0196dddbf81b53f0de83e23f165e4fe25d285adf5dc5f649af75b8e7b9951108f99bcc61e582484cfcf8cefe82b63fe1497c3cff00a17bff00276e3ff8e51ff0a4be1e7fd0bdff0093b71ffc72803a0ff84efc1fff00435e87ff0083187ff8aaf37f1f5fd9fc47f1cf857c21a3ddc1a96991ca750d51ade41243e5a9c60c91e595b689171c0cca9cf208ea3fe1497c3cff00a17bff00276e3ff8e56c7873e1df857c23a8c97fa1e97f64ba92230b3fda259328482461d88eaa3f2a00ea28af2ff89be35b8b3d734ff0569fa941a2dc6a7179b73acdd48112d60f9c1d8723f78763004918c80082db979cf16f82efb4a4b4b0d17c61e2ed5bc6b2dbe60886a3b5122dcbe748f9c18a2250000bf2c107cd83800f73a2bc32dbe2d78b7c09716da77c48d22394ce85e39ed2680dc0505b968d1b6904ed507e4e15bef106bdaec2fadf53d3adafece4f32d6ea259a17da46e4600a9c1e46411d6803c23e207fcd62ffb82ff00ecb5f3fd7be78e646953e31b3c324243e8ebb5ca92406501be524608191df046403903c0e803b8b3d1bc8d07c75e1cb849e6d4f4b961bc436837467ecf2bc129391bb6859cb741c29248c60fd67e1bd6e1f11f86b4dd660f2c25e5ba4a51241208d88f99370ea55b2a781c83c0af10f8a3a52f817e245b78ad2da49341d6d1ed755b78432870ebb664f9768cba1deb96c991598f4adbf849e207f0eeb1ff000aff0051bbfb4dacb12dee817896ad1adcc122b4a739e4641279070c245dc70a2802a2e816de20fda53c428f7ba958de595bc1796d7563322152b1428cacac8c1810ff004c020821b8df8a3d6bc7daa6a1e0ed7e6b48b4bd19e04d51101fb56a4c3e78a4ca8091452e0395525d4a95c8ce447f147ed9e11f16e81f112d3cf92d6d71a7ea90c7920dbb3120ed181d59b966c6ff002b8eb5d278aa1beb748bc6be15325fde436e8b2d94326f8b53b4dc5b68e701d43b3a3ae4f2570c1b1401e796de1dd2fe157c5056d4747b17f0aead2a7d8753bc5f35b4d9d41655de41d9f36464ff000ed6dff23d58b7f16fc42d535cf146b9e15934abad060d416c6dad6fae5592697f7718685f2b8ddf2b60b053e6fcbb98d74fe29f1668fe2ef8477775a4241a836adb34eb6b49e448dc5d4acaaa843640910b6fc7fb1b81c61ab9bd22d6d348f85777e10d6b4cf10786aeed516e67d4e0b17b84f383f9c2659a052085d899c905400bb895dc003a4b1f19fc439ece363f0e60b991731cb2c1af5b8432292af81f36dc3061b49246304e4573767e22f8b3e2bb8bad2ad2ff00c23a2ea166fba58e2b949a72012aca5034db406233955392067a8ad4f03c7e02f0b5e3dfd978eac67b17b48e2d3ed6ef510a6cd182b4df2b3f0d23aabb0d8bb48c6074a8f48ff845741b8d08bf8e346bfb3d0de54d32d2c2da27bb91a73e5a863116690e1c822345dcd866c914019eda7eafe23d6ed6c24f8b9a95cbdbea6fa75c41a6d80b278e408f23872aebc1581c2b95719ce33f3533c41a6d9f87ef2e565f15fc479ac34f9618f54d41355021b4f347cb8caee9586e88954070af9ce7e53a765a7f8734ef1bc5a8e95e15f176a1aa4b7b73a88befecff00b3c6ad3232bc2cf38886c03e6507a13c31dcc0c7a95b788b57d466bebef83fe64d3f95f6851e258d23b9f28e63f3635c24bb4f4de0f181d062802bea7e1fd77c2de288ad749f893e23b8b8bb88bad8c966353920b75037cce19c285dc30084de49daa18e7325cdff00c5cf0d5bc774753f0febb05fdc4705925fa0b39fe60c546c6f2807618ca166607803826a4f12cba96b1135ef893c03e23d2ee0c4d62b71e1ebab7bd9a78245612452affcf3e8412a70dc82a7aec1f10782676f0d6977577fd89fd8fe5df43a7eb76b25b908b13c28bba6c2965670410cdcc6719c6e0011ea5f103c79a55bacf71f0b2edd19f6016baa25c36704f2b1c6c40e3ae31d3d4567f883c71f137fe1159f50b0f0247a4a25bb5c4977757f14cd0c410b12223b4871c1c303d082a68f10af86754f89ba0f8c6dbc6de1f234f45825b46d5161253f784bac88c4920c83f76400c0105b048ae934ed6bc3565e23d6b54b0f127f6aff006a790efa7e9fbaf4c0f1a146902421982b288c1257aa8cb72a00079c78abc5d67f157c2fe1af0f69567633f8a755c198cd1002c150932957dc4c7b8c59006e6318e464ae7abd4bc210fc2bf0d5f6bfe0ed423b27b6b746bcb6d4984905f7961c0dc78759497f97632a96c2ede7232fe09e9ba5f87ffe12892e749bed2eeada5f356eb5787c9905836ef2f71380306272e400a481c9da31d4585f3fc45f10db5fd9c93ffc21ba7ed9a17dad01d42f55c15383f33431e075da0c83f8c2f001b9e1af0a43a5e8d3a6a823d4354d4d036b1733624fb548570cbc803ca009554c0017b7273c3feceb3cd37c39ba496591d21d4e5489598908be5c6d85f41b998e07724f7adcf8a1e2cbcd2f4e87c39e1e4fb4f89b59cc16d0452159218c860d364636e31c12540396e4230ae7fc477d27c2bf847a5f852c249e7f10dfc4d6b682dd59c995d81999197691832109fc5929c1c1a00e03c4fe24fb7e8ff13f51963f32df55d56cb4fb2b9b65cc32790cec0eece0feee25248cf2ebc0078d0d0bf678fedbf0f699ab7fc253e4fdbad22b9f2bfb3f76cde81b6e7cc19c6719c0ac76f0d5bf88fc5be1cf871a5aeeb7d1bcc3abdec71952d39606e983ede546c58d1994721412460d7d4f40197e23d02c7c53e1fbcd1752590da5d2057f2db6b290432b03ea1803ce471c8238af9b2fb43bcf0cde49e07f10ea53d94705d8b9f0e6bcd198e082600315de46e48df7a6f28c4472286e464d7d4f5cff008bbc1ba3f8d7476d3b5687d3cbb98d53ce87e6563b1994edced00e3a8a00e4fc1de2f9bc496f73e08f1de9f258f881ade48a58655312ea10e1919e32303380d9d87070594e32179fb3935ff81f71750de4377acf80d9f7417111569ec9dc9c29524705b83d14960c086628784d6f4a9fc19ae5b787fc68676b54cff63f89ed9a533da28d9e5951bb0638ca8cc3f7937b143c82de87e12f882da55845e1cf88b3da4f6f748d0d86b4b22dcda6a3107f2d95e45c8c8ee5b1f29f9f69e5802e78bb43b7d62f344f89fe0fb0b1d66e2cff007d35b8439bf880c02be9347838caee0401c94543c8693a278bacd74fd6bc05aec1acdfdbf990ea7a7dd4096f728d24a6490dca4921fde3347b1981562224da580dc3abd6fc09ad781754d43c59f0e9a32254dd77a03c45a29873968c020e4120aa0c11f30538210c7a3fc0fd2f55f0e3dcf8c1273e26d4257babcbbb6b8c189ddf76d500797d3afcadcb360e36e002e68f7ff186eec3588355d274db19c594f2d85ca796ec6e378291e04a571b4b282c3030a58b72184d43e2849617777e229fc3fe1bb55b2711dc2ceabe55c33e232e5c4aa46502919036cf904b0c2d3ff8671f07ff00d04b5cff00bff0ff00f1aad0d33e00f81ac3cdfb4dbdf6a5bf1b7ed77457cbc6738f28275cf7cf418c73900e43e225ff00877c4ab6f67acfc4bb1b792296ed93fb36ca4ba47b5965568a391a23b4b2f94a483fecf048dedc7d9f88fc19a46b96720d6fc47a85a5b6a11ea3744e9d6fbefaee3dd8944cd2090464b1211812373720b647d27a57837c33a23dbcba6681a6db4f6e9b229d2d97cd51b76ffacc6e248c8249c9c9cf5adca00f98341bf8b4cd274eb1f087c59fb35e34a656b4d5ed9edada1531b1db96592356059f2325589523e64527b3b8d5be2d4de25babff000aea1a3789341fb44be4a5bcd6cd1229276c4ed947deaa50f0ddc7279af58d4bc35a0eb370b71aa689a6df4ea9b164bab549582e49c02c09c649e3dcd70fa97c06f01df5bac56f6377a7b87dc65b5bb7662307e53e66f18e73d33c0e7ad0063e85a06afabf869e5b9f879e11d3f58875816b34771a3809f65c2869506e1e610cc4e43ed60a71938cd4f166a9e3dd42da4d03c5074ad02c6f62369f69b4b8323de39b98c168204dd34998cecf2f0b9dec588c8517ff00e19c7c1fff00412d73feff00c3ff00c6ab13c6ff0008ec7c0fe0e1aff8505dcbab6977b1df35cdcbf9b22c4bd95157610adb5c965e81b271c50069f85fe16de6bff63bdf17b4ff00d99069e9656962ee61b99add76ec4b911e1555597cc54059c1701ddb60cec6a1f10ffb533e17f86765f6dbe8f6db7dbe3836d869cbf30dc5b183809f2800a9e31bb1b4d383c31e2ff8997115ef8d5e4d13c3e8e1a3d06d9c86ba8c9de3cf60d9041d83900fcad858cf275358f14685e02893c21e0dd2a0b9f114bb16db4bb58ce0332f124efecaa0b166dc4609201dc0032e34d23e16a4dadeb97b26bde3fd51363450ca4cb72d230db14718fbb1068c00fb7f84803958ebce2f35ad7aef5b9e486f23d4be20eaee96d0c36b0b83a35b942cf1233e0472fcfb5b0098c24a59c3126a9fdbf518758f2749bbfedef885adf13ea36d22c8960aebcc503afcbe66ce1a4076c6a36a9182c3dbfe197c2fb3f87f6725c493fdaf57ba8952e66da3647824958b8dc14e46727e6d8a703a000b1f0cbe1ddbfc3ed0e488cdf68d4ef36bdecca4ec2573b5101fe15dcdc9193924e3803b8a28a0028a28a00cfd6743d2fc43a73d86af6105edab64ec9933b49046e53d55b04e18608cf06bc13c41e08d6be185bceb6b631f8afc1d76ed2dd595d404b5a100e6405798dfcac8f3d703ae54612be8ba2803e74f0478c6efc256066f0e5d49e20f0946f24f77a7dc844d474c8c3e199503e1930e8e59728486cf96771af6ff000bf8bb45f1869697fa3dec73028ad2c0580960273f2c8b9ca9cab7b1c641239ae0fc63f05edef2f3fb6fc1777ff08feb69b422c0e60808c15623cb1ba362a7aaf0718232c5abca2e7527b2f1434de24b39fc25e30877cf16b36f1b086e25002ee9a10ac195ca480c917cac5ce51866803eafa2bc7f44f8bd71a179165e3e480473eefb16b9a6627b4bb44cab31284fcdb97a28fe31944039f5c82786eade2b8b79639a09503c7246c195d48c8208e0823bd0049451450014514500154f55d56c744d2ee353d4ee63b6b3b74df2cae7851fcc9270001c92401c9ae2fc49f13eded751b9f0f785ac67d7bc4a998fecf6f1930db3e557333f00282fce0f0415629d6bc53c4baf2eb17f04de27bb8fc57af3b98ecb46d2e6616566244c85678c6657dee836c6c49f2f0d21e0500779ae7c53d53c5515ec5e1d960d0bc331cad6d73e24bc7dae7e5dc7c84c86321557c2a8673b94feecf2387f0b691a8f8abcbf0f781ace7d3b4492268755d7aead944d719d8d22b38ced5e142c08fc8396241623b4f0ff00c1ed7fc4d7105ffc47d424fb3db22adae936b2aaac414852a4463cb8d0aa2f11f2720e548e7daec6c2cf4cb38ecec2d20b4b58f3b2182311a2e49270a3819249fc68039ff02f8174bf01e862c2c079b71261aeeedd70f70e3b9f4519385ed9ee4927a8a28a0028a28a0028a28a0028a28a002b2f5ff0e691e29d2db4dd6ac63bbb42e1f6312a558742aca4153d46411c123a135a945007826bbf0bbc51e06b7926f065dc9ae68b23efbbd0f508926560a1589319f96424c78caaac83e50b9e48e4fc3de227d1ef18f85f58ff008463538b8bdf0eeaccc2c669501f33cb92427cb66f2917126c6058a892bea7ae5fc63f0ffc3fe38b3f2b56b5db70bb4477b00559e30093b439072bcb7ca411ce719c100187a37c59b17d526d23c5da7c9e15d511cf9515f4998a641bbe759b6aae328c32783c6d2d9c0f44af9b3c45e08f1378034b8adaf6c6d3c61e1289d9bcb681965b453b24919597e7801d8dcab32752c32d8387a7f8aaded3c3c34dd17e206aba1e9077492e9d3da196ee2708ad88268c00cad26e1cb438e490727201effe2ef891a1784f75999bedfadbe12df4ab4cbcd2c876ed53b41d99dea79e48ced0c78af24f1b78d357d484e7c57a8c9e1fd35adcf97e1ad36e435fdc318d702790211123097244807cab8f2c9f9ab0fc29a3ebbe2296e20f867613e8ba68cdbdd6b379723cf9be63228322ae63e0202908ee37960411ec7e07f83be1cf07247713c51eabab239617b7116027cc0aec8c92148da3e6e5b39e4038001e61e18f0a78bfc6b6ef69a55847e0cf095c231678633e65d210c503b33096e0159b192447807032315ecfe0cf873e1cf02a3b6916d235dca9b25bcb87df2baee2719c00a3a70a0676ae72466baca2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ae5f58f875e11d7f5c4d6b54d120b9bf5d999199c07dbf777a8215fd3e60720007818a28a00ea28a28a0028a28a0028a28a0028a28a0028a28a00ffd9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_kelahiran`
--
ALTER TABLE `data_kelahiran`
  ADD PRIMARY KEY (`no_kelahiran`),
  ADD KEY `nik` (`nik`);

--
-- Indexes for table `data_kematian`
--
ALTER TABLE `data_kematian`
  ADD PRIMARY KEY (`id_kematian`),
  ADD KEY `nik` (`nik`);

--
-- Indexes for table `data_kk`
--
ALTER TABLE `data_kk`
  ADD PRIMARY KEY (`no_kk`),
  ADD KEY `nik_kepala_keluarga` (`nama_kepala_keluarga`);

--
-- Indexes for table `data_pendatang`
--
ALTER TABLE `data_pendatang`
  ADD PRIMARY KEY (`no_pendatang`),
  ADD KEY `nik_pemohon` (`nik_pemohon`);

--
-- Indexes for table `data_pindah`
--
ALTER TABLE `data_pindah`
  ADD PRIMARY KEY (`no_pindah`),
  ADD KEY `nik_pemohon` (`nik_pemohon`);

--
-- Indexes for table `detail_pendatang`
--
ALTER TABLE `detail_pendatang`
  ADD PRIMARY KEY (`no`),
  ADD KEY `no_pindah` (`no_pendatang`);

--
-- Indexes for table `detail_pindah`
--
ALTER TABLE `detail_pindah`
  ADD PRIMARY KEY (`no`),
  ADD KEY `detail_pindah_ibfk_1` (`no_pindah`);

--
-- Indexes for table `penduduk`
--
ALTER TABLE `penduduk`
  ADD PRIMARY KEY (`nik`),
  ADD KEY `no_kk` (`no_kk`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pendatang`
--
ALTER TABLE `detail_pendatang`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detail_pindah`
--
ALTER TABLE `detail_pindah`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `picture`
--
ALTER TABLE `picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_kelahiran`
--
ALTER TABLE `data_kelahiran`
  ADD CONSTRAINT `data_kelahiran_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_kematian`
--
ALTER TABLE `data_kematian`
  ADD CONSTRAINT `data_kematian_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_pendatang`
--
ALTER TABLE `data_pendatang`
  ADD CONSTRAINT `data_pendatang_ibfk_1` FOREIGN KEY (`nik_pemohon`) REFERENCES `penduduk` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_pindah`
--
ALTER TABLE `data_pindah`
  ADD CONSTRAINT `data_pindah_ibfk_1` FOREIGN KEY (`nik_pemohon`) REFERENCES `penduduk` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_pendatang`
--
ALTER TABLE `detail_pendatang`
  ADD CONSTRAINT `detail_pendatang_ibfk_1` FOREIGN KEY (`no_pendatang`) REFERENCES `data_pendatang` (`no_pendatang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_pindah`
--
ALTER TABLE `detail_pindah`
  ADD CONSTRAINT `detail_pindah_ibfk_1` FOREIGN KEY (`no_pindah`) REFERENCES `data_pindah` (`no_pindah`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `penduduk`
--
ALTER TABLE `penduduk`
  ADD CONSTRAINT `penduduk_ibfk_1` FOREIGN KEY (`no_kk`) REFERENCES `data_kk` (`no_kk`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
