-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 192.168.1.22
-- Üretim Zamanı: 06 Ara 2020, 22:55:22
-- Sunucu sürümü: 10.4.13-MariaDB
-- PHP Sürümü: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `denemedb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `command`
--

CREATE TABLE `command` (
  `idCommand` int(11) NOT NULL,
  `commands` tinytext DEFAULT NULL,
  `refresh` tinytext DEFAULT NULL,
  `idUsers` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `command`
--

INSERT INTO `command` (`idCommand`, `commands`, `refresh`, `idUsers`) VALUES
(0, '1,2,4,3,turn off,01:5216:5222:52', 'NoDataUpdate', 25);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `getdata`
--

CREATE TABLE `getdata` (
  `idData` int(11) NOT NULL,
  `phData` float DEFAULT NULL,
  `ecData` float DEFAULT NULL,
  `wtempData` float DEFAULT NULL,
  `atempData` float DEFAULT NULL,
  `idUsers` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `getdata`
--

INSERT INTO `getdata` (`idData`, `phData`, `ecData`, `wtempData`, `atempData`, `idUsers`) VALUES
(1, 0, 27.65, -1023, NULL, '25');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL,
  `usernameUsers` tinytext NOT NULL,
  `emailUsers` tinytext NOT NULL,
  `pwdUsers` longtext NOT NULL,
  `macidUsers` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`idUsers`, `usernameUsers`, `emailUsers`, `pwdUsers`, `macidUsers`) VALUES
(1, 'test', 'dasdasddd@ljsbdfhsb.com', '$2y$10$1bqlwtyj3r4LRzbz/C0g/OKegWYuJ0Y3/jpI94exulY8Ym9oZn26K', 'macid');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`idCommand`);

--
-- Tablo için indeksler `getdata`
--
ALTER TABLE `getdata`
  ADD PRIMARY KEY (`idData`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUsers`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `getdata`
--
ALTER TABLE `getdata`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `idUsers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
