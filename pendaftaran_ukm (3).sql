-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2016 at 09:57 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pendaftaran_ukm`
--

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('7d44cbf6910b0cac6f6cdd0b656a7ab1', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 1482895037, 'a:3:{s:9:"user_data";s:0:"";s:14:"admin_username";s:5:"rizki";s:14:"admin_password";s:32:"3e089c076bf1ec3a8332280ee35c28d4";}');

-- --------------------------------------------------------

--
-- Table structure for table `t_admin`
--

CREATE TABLE IF NOT EXISTS `t_admin` (
  `admin_id` int(5) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(20) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  `admin_nama` varchar(50) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `t_admin`
--

INSERT INTO `t_admin` (`admin_id`, `admin_username`, `admin_password`, `admin_nama`) VALUES
(1, 'navaganteng', '048051f0e12351a92ea258716c5ad262', 'Nava Gia Ginasta'),
(2, 'rizki', '3e089c076bf1ec3a8332280ee35c28d4', 'Rizki Fadillah'),
(3, 'agung', 'e59cd3ce33a68f536c19fedb82a7936f', 'Agung Permana');

-- --------------------------------------------------------

--
-- Table structure for table `t_kelas`
--

CREATE TABLE IF NOT EXISTS `t_kelas` (
  `kelas_id` int(11) NOT NULL AUTO_INCREMENT,
  `kelas_nama` varchar(5) NOT NULL,
  PRIMARY KEY (`kelas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `t_kelas`
--

INSERT INTO `t_kelas` (`kelas_id`, `kelas_nama`) VALUES
(1, '1A'),
(2, '2A');

-- --------------------------------------------------------

--
-- Table structure for table `t_mahasiswa`
--

CREATE TABLE IF NOT EXISTS `t_mahasiswa` (
  `mhs_npm` varchar(7) NOT NULL,
  `mhs_nama` varchar(30) NOT NULL,
  `mhs_kelas` int(11) NOT NULL,
  `mhs_prodi` int(5) NOT NULL,
  `mhs_tahun_masuk` year(4) NOT NULL,
  `mhs_foto` varchar(100) NOT NULL,
  PRIMARY KEY (`mhs_npm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_mahasiswa`
--

INSERT INTO `t_mahasiswa` (`mhs_npm`, `mhs_nama`, `mhs_kelas`, `mhs_prodi`, `mhs_tahun_masuk`, `mhs_foto`) VALUES
('11111', 'Dadung Ewok', 2, 2, 2018, '1482840357-wew.jpg'),
('1144089', 'Rizki Fadillah', 1, 1, 2014, '1482851138-rizki-fadillah.PNG'),
('1212121', 'Juki Valak', 1, 1, 2018, '1482851114-eee.PNG'),
('23232', 'er', 1, 1, 2014, '1482895264-er.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `t_pendaftaran`
--

CREATE TABLE IF NOT EXISTS `t_pendaftaran` (
  `pendaftaran_id` int(5) NOT NULL AUTO_INCREMENT,
  `mhs_npm` int(7) NOT NULL,
  `ukm_id` int(5) NOT NULL,
  `pendaftaran_deadline` date NOT NULL,
  `pengelola_id` int(5) NOT NULL,
  PRIMARY KEY (`pendaftaran_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `t_pengelola`
--

CREATE TABLE IF NOT EXISTS `t_pengelola` (
  `pengelola_id` int(5) NOT NULL AUTO_INCREMENT,
  `pengelola_username` varchar(20) NOT NULL,
  `pengelola_password` varchar(50) NOT NULL,
  `ukm_id` int(5) NOT NULL,
  PRIMARY KEY (`pengelola_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `t_prodi`
--

CREATE TABLE IF NOT EXISTS `t_prodi` (
  `prodi_id` int(5) NOT NULL AUTO_INCREMENT,
  `prodi_nama` varchar(25) NOT NULL,
  `prodi_desk` text NOT NULL,
  PRIMARY KEY (`prodi_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `t_prodi`
--

INSERT INTO `t_prodi` (`prodi_id`, `prodi_nama`, `prodi_desk`) VALUES
(1, 'D4 Teknik Informatika', 'D4 Teknik Informatika'),
(4, 'D3 Teknik Informatika', 'D3 Teknik Informatika');

-- --------------------------------------------------------

--
-- Table structure for table `t_ukm`
--

CREATE TABLE IF NOT EXISTS `t_ukm` (
  `ukm_id` int(5) NOT NULL AUTO_INCREMENT,
  `ukm_nama` varchar(30) NOT NULL,
  `ukm_desk` text NOT NULL,
  `ukm_logo` varchar(50) NOT NULL,
  PRIMARY KEY (`ukm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
