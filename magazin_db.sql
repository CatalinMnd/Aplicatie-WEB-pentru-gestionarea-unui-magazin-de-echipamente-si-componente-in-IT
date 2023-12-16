-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2023 at 09:10 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `magazin_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(7, 'catalin', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(13, 3, 18, 'Microsoft Modern 1080p', 290, 1, 'modern-8f99dc0680c04ab5c9d8f5cac0a29d04.jpg'),
(14, 3, 127, 'Tastatura Serioux 9500I Black', 50, 1, '9500i-black-a4ba97c0d9b5f2167d6da7f96507868a.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(100) NOT NULL,
  `category` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`) VALUES
(21, 'PC'),
(22, 'Laptop'),
(23, 'Telefon'),
(24, 'SmartWatch'),
(25, 'Placă video'),
(26, 'Procesor'),
(27, 'Placă de bază'),
(28, 'Memorie RAM'),
(29, 'SSD'),
(30, 'Hard Disk'),
(31, 'Surse'),
(32, 'Carcasă'),
(33, 'Cooler CPU'),
(34, 'Ventilator'),
(35, 'Placă de sunet'),
(36, 'Mouse'),
(37, 'Tastatură'),
(38, 'Căști'),
(39, 'Microfon'),
(40, 'Scaun Gaming'),
(41, 'Ochelari VR'),
(42, 'Console Jocuri'),
(43, 'Controller'),
(44, 'Smart TV'),
(45, 'Monitor'),
(46, 'Cameră Web'),
(47, 'Boxe'),
(48, 'Încarcator Laptop'),
(49, 'Încarcator Telefon'),
(50, 'Tabletă'),
(51, 'Imprimantă'),
(52, 'Cameră De Fotografiat'),
(53, 'Cooler Laptop');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(2, 0, 'Catalin Mandea', 'catalinmandea@gmail.com', '0756527699', 'Acesta este un test!');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `adress` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'În așteptare'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `adress`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(4, 2, 'Catalin Mandea', '0756527699', 'catalinmandea@gmail.com', 'Plată la livrare', 'Str Bobalna No. 17, Galați, Tecuci, Romania, 805300', 'martisor (2 × 10) - ', 20, '2023-05-11', 'În desfașurare'),
(5, 3, 'Catalin Mandea', '0756527699', 'catalinmandea@gmail.com', 'PayPal', 'Str Bobalna No. 17, Galați, Tecuci, Romania, 805300', 'Boxe 5.1 SteelSeries Arena 9 (2250 × 8) - ', 18000, '2023-06-18', 'Finalizată'),
(6, 3, 'Mandea Catalin', '0756527699', 'ctnumber@hotmail.com', 'Plată la livrare', 'street independentei no.2, Tecuci, Non-US or Canada, 805300', 'Casti Gaming HyperX Cloud II 7.1 Red (370 × 1) - ', 370, '2023-06-18', 'În așteptare'),
(7, 3, 'Catalin Mandea', '0756527699', 'catalinmandea@gmail.com', 'Card de credit', 'Str Bobalna No. 17, Galați, Tecuci, Romania, 805300', 'Mouse Gaming SteelSeries Rival 3 (100 × 1) - PC Gaming Corvus, AMD Ryzen 3 3200G 3.6GHz (1670 × 1) - ', 1770, '2023-06-18', 'În așteptare');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(500) NOT NULL,
  `image_02` varchar(500) NOT NULL,
  `image_03` varchar(500) NOT NULL,
  `category` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`, `category`) VALUES
(8, 'Boxe 5.1 SteelSeries Arena 9', 'Sistem de boxe pentru gaming cu sunet surround 5.1 adevarat printr-o singura conexiune USB\r\n.\r\n', 2250, 'img1.jpg', 'img2.jpg', 'img3.jpg', 'Boxe'),
(9, 'Logitech Boxa Z333 Black', 'Logitech Boxa Z333 Black 40 W 85dB', 350, 'boxa2_img1.jpg', 'boxa2_img2.jpg', 'boxa2_img3.webp', 'Boxe'),
(10, 'Genius Boxa SP-HF180 2.0 Black', 'Genius Boxa SP-HF180 2.0 Black 6W  150 - 20.000 Hz', 50, 'sp-hf180-20-black-b4f59c4cdc83d0fee4cf52a7cb4c2529.jpg', 'sp-hf180-20-black-505de43f138bb405b1627a5a16e057c7.jpg', 'sp-hf180-20-black-7e02e82a83305f5c45a984011621e823.jpg', 'Boxe'),
(13, 'GoPro HERO11', 'Camera video actiune GoPro HERO11 Black', 2400, 'hero11-black-469ac76b3c4edc22972b405f14d8489b.jpg', 'hero11-black-5258b3cbd9c98094907a63e1eb27ecad.jpg', 'hero11-black-d51cff05c25baaea97384748132b1050.jpg', 'Cameră De Fotografiat'),
(14, 'Canon EOS 4000D', 'Crearea poveştilor deosebite prin fotografii de calitate DSLR şi filme Full HD este mai uşoară decât credeţi, cu ajutorul EOS 4000D de 18 megapixeli. Partajaţi instantaneu şi fotografiaţi de la distanţă cu ajutorul smartphone-ului compatibil prin Wi-Fi* şi aplicaţia Canon Camera Connect.', 2200, 'eos-4000d-black-plus-obiectiv-ef-s-18-55-mm-f-35-56-dc-iii-afc976fc2352d0ea1082d26e48fca5a5.jpg', 'eos-4000d-black-plus-obiectiv-ef-s-18-55-mm-f-35-56-dc-iii-4988ab5d8d5a241fc055acad695e1038.jpg', 'eos-4000d-black-plus-obiectiv-ef-s-18-55-mm-f-35-56-dc-iii-459247813472096b20592792a1002564.jpg', 'Cameră De Fotografiat'),
(15, 'BenQ C1430', 'Aparat foto BenQ C1430 negru Compact SD, SDHC 	\r\n92 x 60.5 x 23.8 mm', 190, 'c1430-negru-7c1384db3bb9d0c8fcbf1c77d23b155c.jpg', 'c1430-negru-68fd1b72529d364164f70ed405b7cb32.jpg', 'c1430-negru-840d61e130c33c59d4b2b6976dbfdb59.jpg', 'Cameră De Fotografiat'),
(16, 'Serioux HD1080P', 'Camera Web Serioux HD1080P 2.0 Mpixeli USB 2.0', 80, 'hd720p-6c335370ea6fa71c3f1a40aafc9e3698.jpg', 'hd720p-4c36e6e2d43908866fd2da25b72fe9f1.jpg', 'hd720p-5489343ea463a0905fd74aeb92ca3a06.jpg', 'Cameră Web'),
(17, 'ASUS ROG Eye S', 'Cameră web ASUS ROG Eye S, înregistrare FHD, 60 fps, microfoane cu anulare a zgomotului prin AI, design compact și pliabil, ușor de transportat și care se poate atașa instantaneu la orice laptop', 460, 'rog-eye-s-36f1ac5ad68fdce3ad9afca14297ef87.jpg', 'rog-eye-s-15162666e4ad99274eda4875505fc833.jpg', 'rog-eye-s-b940d4285f2747ab9a1079aa3624478c.jpg', 'Cameră Web'),
(18, 'Microsoft Modern 1080p', 'Camera Web Microsoft Modern 1080p 2.0 Mpixeli Microfon Incorporat', 290, 'modern-8f99dc0680c04ab5c9d8f5cac0a29d04.jpg', 'modern-61d7eb61c2c0db960b5f1c83eb16908b.jpg', 'modern-64b34f7c4021f67ce255c6f6e44d8a5d.jpg', 'Cameră Web'),
(19, 'Segotep Halo 5 Black', 'Carcasa Segotep Halo 5 Black MiddleTower Fara sursa 485 x 410 x 200 mm', 165, 'halo-5-black-ba466a1679747f9aa63734bb4da33dab.jpg', 'halo-5-black-2fb71a229f7ab80b2c3a0acbf804c7e7.jpg', 'halo-5-black-1fec229a8574cfd0df8da90585f4e045.jpg', 'Carcasă'),
(20, 'Aerocool Aero One Frost Black', 'Carcasa Aerocool Aero One Frost Black MiddleTower Fara sursa 520 x 404 x 210 mm 5.83 kg Fixed RGB', 285, 'aero-one-frost-black-76fee6ad6dd1f5460ace8b52c2faeed2.jpg', 'aero-one-frost-black-bdc7dfd0e92c43258cf6cc66a8f8d5d6.jpg', 'aero-one-frost-black-d2977f7f4edd6a0cfcf329edfb2fe3c8.jpg', 'Carcasă'),
(21, 'Phanteks Eclipse P400A Digital RGB Black', 'Carcasa Phanteks Eclipse P400A Digital RGB Black MiddleTower Fara sursa 465 x 470 x 210 mm 7 kg', 640, 'eclipse-p400a-digital-rgb-black-adcea8c18a58133dc708ccdf9125a872.jpg', 'eclipse-p400a-digital-rgb-black-d4b44606501e9e81c1a32cd1b2b83605.jpg', 'eclipse-p400a-digital-rgb-black-6a9b69c3db2a8f29de99a76f825bc7d9.jpg', 'Carcasă'),
(22, 'Casti Gaming SteelSeries Arctis Nova 7 Wireless', '	\r\nCasti Gaming SteelSeries Arctis Nova 7 Wireless  Wireless 2.4 GHz, Bluetooth 7.1 Surround', 750, 'casti-steelseries-arctis-nova-7-wireless-41776a22555ddd039c9300e92f8d90fe.jpg', 'casti-steelseries-arctis-nova-7-wireless-14639f6b634ae20b6e0b0c1897723403.jpg', 'casti-steelseries-arctis-nova-7-wireless-35cf57e77e5d6d70d8e3938d7d67d6df.jpg', 'Căști'),
(23, 'Casti Gaming AQIRYS Altair', 'Casti Gaming AQIRYS Altair Wired 7.1 Surround ', 230, 'altair-fd7ff28a994ca6d3218b408e5c4010ef.jpg', 'altair-c3e6ea302b6885fa8dac7863533e1030.jpg', 'altair-38374623b97844816b9fd414cc9da0c6.jpg', 'Căști'),
(24, 'Casti Gaming HyperX Cloud II 7.1 Red', '	\r\nCasti Gaming HyperX Cloud II 7.1 Red Wired 7.1 Surround Controller audio USB cu placa de sunet DSP incorporat\r\nCapabilitati sunet surround 7.1 datorate hardware-ului dedicat\r\nCapabilitati Hi-Fi', 370, 'cloud-ii-71-red-11cddfe660ae4e4ab9262188a361f0d4.jpg', 'cloud-ii-71-red-626cb6c19fbf72fa4c70efeb47fac319.jpg', 'cloud-ii-71-red-fb4901e86b798500521aef2138c7bb85.jpg', 'Căști'),
(25, 'Casti Gaming HyperX Cloud Stinger Core 7.1 Wireless', '	\r\nCasti Gaming HyperX Cloud Stinger Core 7.1 Wireless 2.4 GHz Autonomie baterie: aproximativ 17 ore', 380, 'cloud-stinger-core-71-wireless-3c59a1635bc62c498cbe2d81a4c392d3.jpg', 'cloud-stinger-core-71-wireless-a5b16c7a9d78b9e044e95b02de1915c4.jpg', 'cloud-stinger-core-71-wireless-0f8e1c5f6af9dfb192cc1eef9a2fb054.jpg', 'Căști'),
(26, 'Casti Gaming HyperX Cloud Stinger', 'Casti Gaming HyperX Cloud Stinger Wired Stereo 1x Jack 3.5 mm 	\r\nCablu adaptor 1x TRRS la 2x TRS', 230, 'hyperx-cloud-stinger-3d77e6fb1451e3983558c6f093e0aec3.jpg', 'hyperx-cloud-stinger-030b82117caf2548967ae72dfe421861.jpg', 'hyperx-cloud-stinger-68b5b46ada9bb4938a7a105467264a61.jpg', 'Căști'),
(27, 'Casti Gaming AQIRYS Altair White', 'Casti Gaming AQIRYS Altair White Wired 7.1 Surround 	\r\nOmnidirectional', 200, 'altair-white-a588e2f5dd8dec5fafd746cd482dcc07.jpg', 'altair-white-d9d39bdb505a0e05377fe59256c9d397.jpg', 'imagepng-45e81eeedb844a34286dc145e58f9281.png', 'Căști'),
(28, 'Sony PlayStation 5 Digital Edition 825GB White', 'CPU: AMD Zen 2 8-core, variable frequency, up to 3.5 GHz 	\r\nGPU: Custom AMD Radeon RDNA 2\r\nSSD: 825 GB\r\nRAM: 16 GB GDDR6', 3080, 'playstation-5-digital-edition-825gb-white-8bcf46dfce798a0f8f0069e245b071aa.jpg', 'playstation-5-digital-edition-825gb-white-55618433add7ee4e92ec45cceb0c4ecc.jpg', 'playstation-5-digital-edition-825gb-white-b1e36d4edbae6fe0a17854d8dd7e4a79.jpg', 'Console Jocuri'),
(29, 'Nintendo Switch Neon Red si Neon Blue Joy-Con', 'Nintendo Switch Touch screen 6.2 inch 1280 x 720 32 GB rezervat pentru System\r\nSe pot achizitiona microSDHC/SDXC pana la 2TB \r\nBaterie: 	Li-Ion 4310 mAh', 1600, 'switch-neon-red-si-neon-blue-joy-con-fd723a17d77ee4c02abf565353fe4881.jpg', 'switch-neon-red-si-neon-blue-joy-con-910d59a9a0624fbf57fcf0d6cc5e28e8.jpg', 'switch-neon-red-si-neon-blue-joy-con-4dacc74d8f6719d4eaa9108b3872f2cf.jpg', 'Console Jocuri'),
(30, 'Microsoft Xbox Series X 1TB Black', 'Microsoft Xbox Series X 1TB Black CPU: AMD Zen 2 8-core, variable frequency, up to 3.8GHz, 3.66 GHz with SMT  	\r\nGPU: Custom AMD Radeon RDNA 2\r\nSSD: 1 TB\r\nRAM: 16 GB GDDR6', 3000, 'xbox-series-x-1tb-black-26a6ff14c71b78dfec666087f53cd6fa.jpg', 'xbox-series-x-1tb-black-34d7050ab2cc8316d6d1968e5ccb5d66.jpg', 'xbox-series-x-1tb-black-67683eda4a2a6d3276cc16b26d8f2d6a.png', 'Console Jocuri'),
(31, 'Controller Xbox Series X Wireless - Carbon Black', 'Controller Microsoft Xbox Series X Wireless - Carbon Black + USB-C Cable Analog/Digital \r\nConectivitate: Fara fir', 280, 'xbox-series-x-wireless-carbon-black-plus-usb-c-cable-29e2e4b00be59c33bcb5b60629cc895c.jpg', 'xbox-series-x-wireless-carbon-black-plus-usb-c-cable-076019c7ec9fd85568c78d16ef8ae1be.jpg', 'xbox-series-x-wireless-carbon-black-plus-usb-c-cable-ac306f2562837b57c43d748a2a99903b.jpg', 'Controller'),
(32, 'Controller Trust GXT 545 Yula Wireless', 'Controller Trust GXT 545 Yula Wireless pentru PC si PlayStation 3 Butoane cu sensitivitate de presiune (numai pentru PlayStation 3)\r\nPartile laterale cauciucate, pentru o prindere ferma\r\nIndicator + buton Home, valabil pentru PlayStation 3\r\nDistanta de conectare - 10 m', 110, 'gxt-545-pentru-pc-si-playstation-3-e7987fc8fbdbaa2e5294c234532ae1e1.jpg', 'gxt-545-pentru-pc-si-playstation-3-0f6dfa4dc9fd69f7983ef38009e0b50d.jpg', 'gxt-545-pentru-pc-si-playstation-3-1165c8efbee311bb04f5c96cbbc32411.jpg', 'Controller'),
(33, 'Controller Sony PlayStation 5 DualSense Original White', '	\r\nController Sony PlayStation 5 DualSense Original White  Analog/Digital USB\r\nBluetooth', 360, 'wireless-playstation-dualsense-ca092da6e53f266677c630ccaa1fa309.jpg', 'wireless-playstation-dualsense-ee664d17de74c79825c5ff4709066182.jpg', 'wireless-playstation-dualsense-545bd220fd558889a0ef1cd3364fd528.jpg', 'Controller'),
(34, 'Cooler CPU AQIRYS Aquarius 360 AiO Black', 'Compatibilitate: Intel (socket 20xx, 115x, 1200), AMD (socket AM4)\r\nTDP maxim: 300W\r\nDimensiuni pompa: 78 x 84 x 45 mm\r\nTuratie pompa: 2600 ± 10% rpm (control PWM)\r\nNivel zgomot pompa: 23 dBA\r\nMaterial baza pompa: Cupru\r\nConectori pompa: 4 pini (PWM), 3 pini ARGB\r\nMaterial radiator: Aluminiu\r\nDimensiuni radiator: 395 x 120 x 27 mm\r\nVentilator radiator: 3x 120 mm (120 x 120 x 25 mm)\r\nTuratie ventilator: 800 - 2400 ± 10% rpm (control PWM)\r\nFlux de aer: 30 - 85 CFM\r\nNivel de zgomot ventilator: 25 -', 570, 'aquarius-360-aio-black-3280faaa4a7e1742cbe0ba480e951ac3.jpg', 'aquarius-360-aio-black-c484abc851e531fd4f01f23d50e6d408.jpg', 'aquarius-360-aio-black-cd08af45f6b00d0696159160530526b0.jpg', 'Cooler CPU'),
(35, 'Cooler CPU be quiet! Dark Rock 4', '	\r\nCooler CPU be quiet! Dark Rock 4 Bearing ventilator: Fluid Dynamic Bearing Tip racire: Aer', 390, 'dark-rock-4-f3073571a5354d48204b50b961305cb4.jpg', 'dark-rock-4-330064d5a62f40197c0346357aae2463.jpg', 'dark-rock-4-c6058c8da0bd4e3de8801c8bd0f434ab.jpg', 'Cooler CPU'),
(36, 'Cooler CPU ID-Cooling SE-214-XT Rainbow', 'Cooler CPU ID-Cooling SE-214-XT Rainbow Tip racire: Aer, Bearic ventilator: Hydraulic', 105, 'cooler-procesor-id-cooling-se-214-xt-iluminare-rainbow-cc26555e5976aeabafc76b2f254c1011.jpg', 'cooler-procesor-id-cooling-se-214-xt-iluminare-rainbow-0a6e622a579ebc93fb83a0ec54b15263.jpg', 'cooler-procesor-id-cooling-se-214-xt-iluminare-rainbow-1d95f5ad26f0098ef7d88dbf31119d4e.jpg', 'Cooler CPU'),
(37, 'Cooler Laptop White Shark ICE MASTER', 'Stand/Cooler notebook White Shark ICE MASTER, max 15.6 inch, ventilatoare 1x 140 mm, 4x 60 mm, RGB LED fan, suport telefon', 159, 'ice-master-max1.jpg', 'ice-master-max2.jpg', 'ice-master-max3.jpg', 'Cooler Laptop'),
(38, 'Cooler Laptop White Shark ICE WIZARD', 'Stand/Cooler notebook White Shark ICE WIZARD, max 17.3 inch, ventilatoare 4x 140 mm, 1x 70 mm, Red LED fan', 90, 'ice-wizard-max-173-inch-1.jpg', 'ice-wizard-max-173-inch-2.jpg', 'ice-wizard-max-173-inch-3.jpg', 'Cooler Laptop'),
(39, 'Cooler Laptop Tellur Basic', 'Stand/Cooler notebook Tellur Basic, 17.3 inch, 5 ventilatoare, Black', 75, 'basic-173-inch-5-ventilatoare-black-6cc188c5f1ef3e7937e6b7208fb19783.jpg', 'basic-173-inch-5-ventilatoare-black-ab57c2074e18e5c201354a33c6efe642.jpg', 'basic-173-inch-5-ventilatoare-black-e947d557049946edb06d5b76937611fe.jpg', 'Cooler Laptop'),
(40, 'Hard disk WD Blue 1TB SATA-III 7200 RPM 64MB', 'Drive-urile WD Blue sunt proiectate si produse cu tehnologia gasita in premiatele drive-uri pentru desktop si pentru periferice mobile', 180, 'blue-1tb-sata-iii-7200-rpm-64mb-5149c8225cffe963332c7127be366c0a.jpg', 'blue-1tb-sata-iii-7200-rpm-64mb-c80ce3c15c30d4fb80c1af17bd3757e5.jpg', '20190212_132336jpg-eb6d64ed690056116dc95d0c78756d0c.jpg', 'Hard Disk'),
(41, 'Hard disk Seagate BarraCuda 2TB SATA-III 7200RPM 256MB', '	\r\nHard disk Seagate BarraCuda 2TB SATA-III 7200RPM 256MB ', 250, 'barracuda-2tb-sata-iii-7200rpm-256mb-f0e26ccfd1ea1e7806dacb552cf6a1d9.jpg', 'barracuda-2tb-sata-iii-7200rpm-256mb-1d1bf189b343ef2204f5a43c6fe9e845.jpg', 'barracuda-2tb-sata-iii-7200rpm-256mb-c0d84d054a34938104b2b03bd7d2f435.jpg', 'Hard Disk'),
(42, 'Hard disk Seagate IronWolf 4TB SATA-III 5400RPM 256MB', 'Hard disk Seagate IronWolf 4TB SATA-III 5400RPM 256MB', 480, 'ironwolf-4tb-sata-iii-5400rpm-256mb-af487c6b40e10911bbb03e8371ab1792.jpg', 'ironwolf-4tb-sata-iii-5400rpm-256mb-4d7041579affc15105556c1393db5c1e.jpg', 'ironwolf-4tb-sata-iii-5400rpm-256mb-a63510b772276da564e96688b71df9db.jpg', 'Hard Disk'),
(43, 'Imprimanta Brother HL-L2352DW Laser', 'Viteza de imprimare de pana la 30 de pagini pe minut, la mai putin de 50dB\r\nImprimare duplex automata\r\nTava mare de 250 de coli\r\nRetea wireless integrata\r\nInclude toner initial de pana la 700 pagini* (* Capacitatea aprox. in conformitate cu ISO/IEC 19752.)\r\nSimplu si usor de configurat', 600, 'hl-l2352dw-laser-format-a4-mono-duplex-wi-fi-996c30e98561158fc8b3f18369b0b32f.jpg', 'HLL2352DW_left.webp', '1740646-n5.jpg', 'Imprimantă'),
(44, 'Imprimanta Xerox Phaser 3020BI, Laser', 'Imprimanta Xerox Phaser 3020BI, Laser, Monocrom, Format A4, Wi-Fi', 440, 'phaser-3020bi-laser-monocrom-format-a4-wi-fi-a771e687dd3bd11a638aebd41605c549.jpg', 'res_d5b32b569cf77c4608e542ad26934c16.webp', 'or148937_1.jpg', 'Imprimantă'),
(45, 'Imprimanta HP LaserJet Pro M404dw, Laser,', 'Imprimanta HP LaserJet Pro M404dw, Laser, Monocrom, Format A4, Duplex, Retea, Wi-Fi', 1300, 'laserjet-pro-m404dw-monocrom-format-a4-retea-wi-fi-duplex-1714202b666f9ec4335835c0904a738a.jpg', 'laserjet-pro-m404dw-monocrom-format-a4-retea-wi-fi-duplex-e844045e3b5df34ed7d4f06a2bfb9f40.jpg', 'laserjet-pro-m404dw-monocrom-format-a4-retea-wi-fi-duplex-f64e775926b8d35fac63f3fd17df9b2b.jpg', 'Imprimantă'),
(46, 'Imprimanta Canon PIXMA G540 InkJet', 'Imprimanta Canon PIXMA G540 InkJet, Color, Format A4, Wi-Fi', 760, 'canon-g540-printer-pixma-g540-ij-col-a4-bdbb1a5225fc0f5f3d9acee1f4634e84.jpg', 'canon-g540-printer-pixma-g540-ij-col-a4-b08f0d67c71a2251bb89b68c6a1caaa1.jpg', 'pixma-g540-inkjet-color-format-a4-wi-fi-cb044082d0573d65ba6a322cde89d12d.jpg', 'Imprimantă'),
(47, 'Imprimanta Epson WorkForce WF-100W, InkJet', 'Imprimanta Epson WorkForce WF-100W, InkJet, Color, Format A4, Wi-Fi, Portabila', 1130, 'workforce-wf-100w-inkjet-color-format-a4-wi-fi-portabila-23df23d74e304a18834391da7ee67889.jpg', 'workforce-wf-100w-inkjet-color-format-a4-wi-fi-portabila-bbc5456f4f3c29456668c7fe3cb9e779.jpg', 'workforce-wf-100w-inkjet-color-format-a4-wi-fi-portabila-cbada50bc296fb1bd984bd42ba18025b.jpg', 'Imprimantă'),
(48, 'Imprimanta HP Officejet Pro 8210, InkJet', 'Imprimanta HP Officejet Pro 8210, InkJet, Color, Wireless, Format A4', 750, 'officejet-pro-8210-wireless-a4-196404da094475a48fcd463f312c3ef3.jpg', 'officejet-pro-8210-wireless-a4-18322f101d5c2034ff7fa2957ca1a368.jpg', 'officejet-pro-8210-wireless-a4-961c91b65d6c0da91649f2981777be37.jpg', 'Imprimantă'),
(49, 'Apple Incarcator MacBook Pro 16 Touch Bar, 96W', 'Apple Incarcator pentru MacBook Pro 16 Touch Bar, 96W', 420, 'incarcator-pentru-macbook-pro-16-touch-bar-96w-c68944c6f1f24b8630e8b53b772c3a43.jpg', 'incarcator-pentru-macbook-pro-16-touch-bar-96w-867a9b5815b15c4ba466aa00652f79f3.jpg', 'incarcator-pentru-macbook-pro-16-touch-bar-96w-5e3a32df149b6be358163b45a6cba8d9.jpg', 'Încarcator Laptop'),
(50, 'ASUS Incarcator Laptop Asus 19V 6.32A 120W Slim', 'Incarcatoarele comercializate sunt fabricate de cei mai renumiti producatori de echipamente IT. Produsele respecta cele mai exigente standarde de calitate internationale CE, UL si/sau ISO 9001 9002, RoHs sunt puse in vanzare numai dupa ce au trecut toate testele de calitate.', 240, 'incarcator-laptop-asus-19v-632a-120w-slim-0dba74184cbd51833d0e018e9c9e7ebe.jpg', 'incarcator-laptop-asus-19v-632a-120w-slim-27402fc60be95a1b233cbe072aa6eda5.jpg', 'incarcator-laptop-asus-19v-632a-120w-slim-d00f59eecb85f4f0c675ebcc5dce803d.jpg', 'Încarcator Laptop'),
(51, 'Lenovo Incarcator Laptop IdeaPad 110-15ISK 45W', 'Incarcatoarele comercializate sunt fabricate de cei mai renumiti producatori de echipamente IT. Produsele respecta cele mai exigente standarde de calitate internationale CE, UL si/sau ISO 9001 9002, RoHs sunt puse in vanzare numai dupa ce au trecut toate testele de calitate.', 125, 'incarcator-laptop-lenovo-ideapad-110-15isk-45w-674f2bd741983e599477af4f41ee60ba.jpg', 'incarcator-laptop-lenovo-ideapad-110-15isk-45w-322734f51e0ec52f18e4282b5dae9d5f.jpg', 'incarcator-laptop-lenovo-ideapad-110-15isk-45w-674f2bd741983e599477af4f41ee60ba.jpg', 'Încarcator Laptop'),
(52, 'Incarcator retea Apple 1x USB-C 20W', 'Adaptorul de alimentare Apple USB-C de 20 W ofera incarcare rapida si eficienta acasa, la birou sau in deplasare. Desi adaptorul de alimentare este compatibil cu orice dispozitiv USB-C, Apple recomanda folosirea acestuia cu iPad Pro si iPad Air pentru o performanta optima de incarcare. De asemenea, poate fi folosit cu iPhone 8 sau un model mai recent pentru a profita la maximum de caracteristica de incarcare rapida. Cablul de incarcare se comercializeaza separat', 130, 'mhje3zm-a-1x-usb-c-20w-9cdf1bf43d358d7b32d7f3cc46825858.jpg', 'mhje3zm-a-1x-usb-c-20w-6825c025652c39aa6c4853ae325e723a.jpg', 'mhje3zm-a-1x-usb-c-20w-a543cfb093afc0bf81d509818aeb3731.jpg', 'Încarcator Telefon'),
(53, 'Incarcator retea Samsung EP-T1510N 1x USB-C', 'Incarcator retea Samsung EP-T1510N, negru, 1x USB-C, Fast Charge 15W', 50, 'ep-t1510n-negru-1x-usb-c-fast-charge-15w-bc913af61aed4a598801f439dea89773.jpg', 'ep-t1510n-negru-1x-usb-c-fast-charge-15w-d766151657508aa2f28653347a79f9e7.jpg', 'ep-t1510n-negru-1x-usb-c-fast-charge-15w-bc913af61aed4a598801f439dea89773.jpg', 'Încarcator Telefon'),
(54, 'Incarcator retea Samsung EP-TA800X, 1x USB-C', 'Incarcator retea Samsung EP-TA800X, negru, 1x USB-C, 25W, Fast Charger, Cablu inclus', 100, 'ep-ta800x-negru-1x-usb-c-25w-fast-charger-9e4ff0e3918c3ecc1e99190e682c218f.jpg', 'ep-ta800x-negru-1x-usb-c-25w-fast-charger-dc76a8f05cb323d35b191dc3dbc5b6bd.jpg', 'ep-ta800x-negru-1x-usb-c-25w-fast-charger-73ada01631a78495fcee0825c6777455.jpg', 'Încarcator Telefon'),
(55, 'Ultrabook ASUS 13.3&#39;&#39; Zenbook S 13 Flip', 'Ultrabook ASUS 13.3&#39;&#39; Zenbook S 13 Flip OLED UP5302ZA, 2.8K Touch, Procesor Intel® Core™ i5-1240P (12M Cache, up to 4.40 GHz), 16GB DDR5, 512GB SSD, Intel Iris Xe, Win 11 Home, Ponder Blue', 6500, '133.jpg', '1331.jpg', '13311.jpg', 'Laptop'),
(56, 'Ultrabook DELL 17&#39;&#39; XPS 17 9720', 'Ultrabook DELL 17&#39;&#39; XPS 17 9720, FHD+ InfinityEdge, Procesor Intel® Core™ i7-12700H (24M Cache, up to 4.70 GHz), 64GB DDR5, 1TB SSD, GeForce RTX 3050 4GB, Win 11 Pro, Platinum Silver, 3Yr BOS', 16500, '17-xps-17.jpg', '17-xps-17-.jpg', '17-xps-17-9.jpg', 'Laptop'),
(57, 'Ultrabook Lenovo 14&#39;&#39; Yoga 9 14IRP8', 'Ultrabook Lenovo 14&#39;&#39; Yoga 9 14IRP8, 2.8K OLED 90Hz Touch, Procesor Intel® Core™ i7-1360P (18M Cache, up to 5.00 GHz), 16GB DDR5, 1TB SSD, Intel Iris Xe, Win 11 Home, Storm Grey, 3Yr Onsite Premium Care', 9500, '14-yoga-91.jpg', '14-yoga-9-14irp8-28k.jpg', '14-yoga-9-14irp8-28k-oled-90hz.jpg', 'Laptop'),
(58, 'Laptop DELL Gaming 15.6&#39;&#39; G15 5511', 'Laptop DELL Gaming 15.6&#39;&#39; G15 5511, FHD 120Hz, Procesor Intel® Core™ i5-11260H (12M Cache, up to 4.40 GHz), 8GB DDR4, 512GB SSD, GeForce RTX 3050 4GB, Linux, Dark Shadow Grey, 3Yr CIS', 3100, 'gaming-156-g15-5511.jpg', 'gaming-156-g15-5511-fhd-120hz-procesor-intel-core-i5-11400h.jpg', 'gaming-156-g15-5511-fhd-120hz-procesor-intel-core-i5-11400h-1.jpg', 'Laptop'),
(59, 'Laptop ASUS Gaming 15.6&#39;&#39; TUF F15 FX506HE', 'Laptop ASUS Gaming 15.6&#39;&#39; TUF F15 FX506HE, FHD 144Hz, Procesor Intel® Core™ i5-11400H (12M Cache, up to 4.50 GHz), 16GB DDR4, 512GB SSD, GeForce RTX 3050 Ti 4GB, No OS, Graphite Black', 3800, 'gaming-156-tuf-f15-fx506he-fhd-144hz-procesor-intel-core-i5-11400h-12m-cache-up-to-450-ghz-8gb-ddr4-512gb-ssd-geforce-rtx-3050-ti-4gb-no-os-graphite-b-226f33f9204785a0140bf0c9dc559729.jpg', 'gaming-156-tuf-f15-fx506he-fhd-144hz-procesor-intel-core-i7-11800h-24m-cache-up-to-460-ghz-16gb-ddr4-1tb-ssd-geforce-rtx-3050-ti-4gb-no-os-graphite-bl-437e2c1f8fedf736175ebbc1ecf61949.jpg', 'gaming-156-tuf-f15-fx506he-fhd-144hz-procesor-intel-core-i7-11800h-24m-cache-up-to-460-ghz-16gb-ddr4-1tb-ssd-geforce-rtx-3050-ti-4gb-no-os-graphite-bl-5ef35ab46fc4229485682a6ed05aea0f.jpg', 'Laptop'),
(60, 'Laptop Lenovo Gaming 15.6&#39;&#39; IdeaPad 3 15ACH6', 'Laptop Lenovo Gaming 15.6&#39;&#39; IdeaPad 3 15ACH6, FHD IPS, Procesor AMD Ryzen™ 5 5600H (16M Cache, up to 4.2 GHz), 8GB DDR4, 512GB SSD, GeForce GTX 1650 4GB, No OS, Shadow Black', 3000, 'gaming-156-ideapad-3-15ach6-fhd-ips-procesor-amd-ryzen-5-5600h-16m-cache-up-to-42-ghz-8gb-ddr4-512gb-ssd-geforce-gtx-1650-4gb-no-os-shadow-black-1ee0f1378bbe534974717b7a1b64f885.jpg', 'gaming-156-ideapad-3-15ach6-fhd-ips-procesor-amd-ryzen-5-5600h-16m-cache-up-to-42-ghz-8gb-ddr4-512gb-ssd-geforce-gtx-1650-4gb-no-os-shadow-black-b35adef60d88c5a308d990ba9efc7841.jpg', 'gaming-156-ideapad-3-15ach6-fhd-ips-procesor-amd-ryzen-5-5600h-16m-cache-up-to-42-ghz-8gb-ddr4-512gb-ssd-geforce-gtx-1650-4gb-no-os-shadow-black-06dd3325dacba0f9b87c1aab90d50cb7.jpg', 'Laptop'),
(61, 'Memorie ADATA XPG Spectrix D41 Tungsten 32GB DDR4', 'Memorie ADATA XPG Spectrix D41 Tungsten Grey RGB 32GB DDR4 3200MHz CL16 Dual Channel Kit', 400, 'xpg-spectrix-d41-titanium-gray-rgb-16gb-ddr4-3000mhz-cl16-dual-channel-kit-b91d7b774841596ee46df151bf66b448.jpg', 'xpg-spectrix-d41-titanium-gray-rgb-16gb-ddr4-3000mhz-cl16-dual-channel-kit-26fa87582155efab6491ec234644b6b8.jpg', 'xpg-spectrix-d41-rgb-16gb-ddr4-3200mhz-cl16-7a115b1aa6e432b6e79aef1df675f233.jpg', 'Memorie RAM'),
(62, 'Memorie Corsair Vengeance LPX 16GB DDR4', 'Memorie Corsair Vengeance LPX Black 16GB DDR4 3200MHz CL16 Dual Channel Kit', 225, 'vengeance-lpx-black-16gb-ddr4-3200mhz-cl16-dual-channel-kit-8c2a243eaf9fec5cdfd708f2a6ff224e.jpg', 'memorie-corsair-vengeance-lpx-black-16gb-ddr4-3200mhz-cl16-dual-channel-kit-cb10c4722611ee5a6aeb09e14f0cb803.jpg', 'memorie-corsair-vengeance-lpx-black-16gb-ddr4-3200mhz-cl16-dual-channel-kit-9c567668d3c674d86dc50668c4ca7b93.jpg', 'Memorie RAM'),
(63, 'Memorie Kingston FURY Beast 8GB DDR4', 'Memorie Kingston FURY Beast 8GB DDR4 3200MHz CL16', 105, 'fury-beast-8gb-ddr4-3200mhz-cl16-ac35216ace8c227fdcad64562787582e.jpg', 'fury-beast-8gb-ddr4-3200mhz-cl16-8c9e70f2c1b438a3c0c9ca5444d43820.jpg', 'fury-beast-8gb-ddr4-3200mhz-cl16-2ec7b69839c8a7539d77219c56856251.jpg', 'Memorie RAM'),
(64, 'Microfon HyperX QuadCast S Streaming RGB Black', 'Microfon HyperX QuadCast S Streaming RGB Black', 710, 'quadcast-s-0c134c2697798be6924b6f74d1fcafca.jpg', 'quadcast-s-acacbe2a00b642056dbd135a28b20683.jpg', 'quadcast-s-d92dbb67319804a14a58a563afa2821b.jpg', 'Microfon'),
(65, 'Microfon Trust GXT 252 Emita Streaming', 'Microfon Trust GXT 252 Emita Streaming', 440, 'gxt-252-emita-81f0d594d5dd76c8c59a0a097dfaad31.jpg', 'gxt-252-emita-306ae078846ef0f5dbeb74349a762047.jpg', 'gxt-252-emita-457182453a4ffb45b2aa252b54d761e6.jpg', 'Microfon'),
(66, 'Microfon Razer Seiren Mini Streaming Black', 'Microfon Razer Seiren Mini Streaming Black', 230, 'seiren-mini-black-4deef1c626397a2bae20d5379ac7d925.jpg', 'seiren-mini-black-67cde7da55e2a73faef44fd93e941489.jpg', 'seiren-mini-black-de6974b67e4a0187c0bb98ae1c9c7b8b.jpg', 'Microfon'),
(67, 'Monitor LED Alienware Gaming AW3821DW Curbat', 'Monitor LED Alienware Gaming AW3821DW Curbat 37.5 inch UWQHD+ IPS 1 ms 144 Hz HDR G-Sync Ultimate', 5750, 'gaming-aw3821dw-curbat-375-inch-1-ms-argintiu-hdr-g-sync-ultimate-144-hz-e9d261dd5e4097d83ce03919b48a4c9f.jpg', 'gaming-aw3821dw-curbat-375-inch-1-ms-argintiu-hdr-g-sync-ultimate-144-hz-efd0fbd5457f882c4bd9870015f83460.jpg', 'gaming-aw3821dw-curbat-375-inch-1-ms-argintiu-hdr-g-sync-ultimate-144-hz-48a5faeb5b839d11df4350444dd18b39.jpg', 'Monitor'),
(68, 'Monitor LED Samsung Gaming Odyssey G3', 'Monitor LED Samsung Gaming Odyssey G3 LS24AG320NUXEN 24 inch FHD VA 1 ms 165 Hz FreeSync Premium', 800, 'gaming-odyssey-g3-ls24ag320nuxen-24-inch-fhd-va-1-ms-165-hz-freesync-premium-5d26d8728f3ba9c143a784794dcc09a6.jpg', 'gaming-odyssey-g3-ls24ag320nuxen-24-inch-fhd-va-1-ms-165-hz-freesync-premium-b3fa1fa59ca8d82314c59d807afe0e1f.jpg', 'gaming-odyssey-g3-ls24ag320nuxen-24-inch-fhd-va-1-ms-165-hz-freesync-premium-01dde4ff8c14d4a86c07afb6a4e7004c.jpg', 'Monitor'),
(69, 'Monitor LED DELL Gaming S2522HG', 'Monitor LED DELL Gaming S2522HG 24.5 inch FHD IPS 1 ms 240 Hz G-Sync Compatible & FreeSync Premium', 1100, 'gaming-s2522hg-245-inch-1-ms-negru-g-sync-compatible-freesync-premium-240-hz-a9ece639222a7189e0ebe31727948ee5.jpg', 'gaming-s2522hg-245-inch-1-ms-negru-g-sync-compatible-freesync-premium-240-hz-bd4b18f36433c0bad005c8f6c2c409ee.jpg', 'gaming-s2522hg-245-inch-1-ms-negru-g-sync-compatible-freesync-premium-240-hz-77f5661d3358996c9f6bc1466ddfb10d.jpg', 'Monitor'),
(70, 'Monitor LED Lenovo ThinkVision S27e-20', 'Monitor LED Lenovo ThinkVision S27e-20 27 inch FHD IPS 4 ms 60 Hz FreeSync', 650, 'thinkvision-s27e-20-27-inch-4-ms-negru-freesync-60-hz-7e47cb5757a55f64daede3d08799d601.jpg', 'thinkvision-s27e-20-27-inch-4-ms-negru-freesync-60-hz-e4f49592685c3dac4d08c0ebf45c2aac.jpg', 'thinkvision-s27e-20-27-inch-4-ms-negru-freesync-60-hz-7fd581b8681af29373fa11bad37ce3e6.jpg', 'Monitor'),
(71, 'Monitor LED HP V24ie G5', 'Monitor LED HP V24ie G5 23.8 inch FHD IPS 5 ms 75 Hz FreeSync', 700, 'v24ie-g5-238-inch-fhd-ips-5-ms-75-hz-freesync-ae1af0d6e46353f42630848eec0757cf.jpg', 'v24ie-g5-238-inch-fhd-ips-5-ms-75-hz-freesync-b0c03f56596bc0b736b052ceca4edbe1.jpg', 'v24ie-g5-238-inch-fhd-ips-5-ms-75-hz-freesync-bca560cc6740058de724f6cf72fc2c28.jpg', 'Monitor'),
(72, 'Monitor LED ViewSonic VA2406-H', 'Monitor LED ViewSonic VA2406-H 23.8 inch FHD VA 4 ms 60 Hz', 535, 'va2406-h-238-inch-fhd-va-4-ms-60-hz-a1576fc75558f64d3695cc397da65a2e.jpg', 'va2406-h-238-inch-fhd-va-4-ms-60-hz-c5d2df1d54272125f192a078f101f474.jpg', 'va2406-h-238-inch-fhd-va-4-ms-60-hz-704bc44425939a856faa80c51ae15840.jpg', 'Monitor'),
(73, 'Mouse Logitech M220 Silent, Wireless, Black', '\r\nNu-ți mai face griji pentru zgomotul stresant al click-urilor în timp ce lucrezi. Cu Logitech M220 ai parte de până la 90% mai puțin zgomot* având același efect la click și…mai puțin stres pentru tine și cei din jur!', 100, 'm220-silent-black-262f0a9cd3d1ef333a437bdb540a8029.jpg', 'm220-silent-black-d8689e8e859b884fb5930fa650eb0eb1.jpg', 'm220-silent-black-5e1f5f3e8d4d61834304e840d11e2c0e.jpg', 'Mouse'),
(74, 'Mouse ASUS WT425 Charcoal Black', '	\r\nMouse ASUS WT425 Charcoal Black Wireless USB', 55, 'wt425-charcoal-black-b9e55696cfc66d705f2fe92de1782bb0.jpg', 'wt425-charcoal-black-f639bd0b8cfc0df4ecf9a360afa9ba2e.jpg', 'wt425-charcoal-black-5de4f1267157ca8cd387670448eba5bb.jpg', 'Mouse'),
(75, 'Mouse Xiaomi Mi Dual Mode Wireless Silent Edition Black', 'Mouse Xiaomi Mi Dual Mode Wireless Silent Edition Black Bluetooth USB', 70, 'mi-dual-mode-wireless-silent-edition-black-23a47295fad00f40db3756c8c2eb2323.jpg', 'mi-dual-mode-wireless-silent-edition-black-a544c836ce9c5615899caf89515d062f.jpg', 'mouse2jpg-a1f9954046f0fca5839e23f83af89c8a.jpg', 'Mouse'),
(76, 'Mouse Gaming Logitech G102 Lightsync RGB Black', 'Senzorul special conceput pentru gaming răspunde precis fiecărei mișcari de-ale tale. Personalizează setările pentru a ajunge la sensibilitatea pe care ți-o dorești cu software-ul Logitech G HUB!', 110, 'g102-lightsync-rgb-black-02e9420d540642c4ddc303eba419c11a.jpg', 'g102-lightsync-rgb-black-9f2d705f3ca1a9a50d359b7a66a6316f.jpg', 'g102-lightsync-rgb-black-67c15c6646ae3dad7f49fe8d7b4ce88c.jpg', 'Mouse'),
(77, 'Mouse Gaming SteelSeries Rival 3', 'Mouse Gaming SteelSeries Rival 3', 100, 'rival-3-38d83d64e28743aa2abc33ff45b0f89d.png', 'rival-3-84232b5f2476746ddf26797729b506e7.jpg', 'rival-3-264cd98d00575892ebf1c39a87d58a02.jpg', 'Mouse'),
(78, 'Mouse Gaming Razer DeathAdder Essential 2021', 'Mouse Gaming Razer DeathAdder Essential 2021 Black', 145, 'deathadder-essential-2021-black-98e9ec208e15e705fa58240fff4d9696.jpg', 'deathadder-essential-2021-black-40dc9181e6f465bcfe832f90c5d93709.jpg', 'deathadder-essential-2021-black-dc9725623f05033fc369c69da6f90af4.jpg', 'Mouse'),
(79, 'Ochelari VR Oculus Meta Quest 2 128GB', 'Oculus Quest 2 a fost conceput pentru a face lumile virtuale sa se adapteze la miscarile dvs., permitandu-va sa explorati jocuri si experiente uimitoare cu o libertate de neegalat fara un PC sau consola. Ramaneti concentrat cu un ecran uimitor care prezinta cu 50% mai multi pixeli decat Quest original. Controlerele Touch reproiectate au o ergonomie imbunatatita si controale intuitive care va transporta gesturile, miscarile si actiunile direct in VR. Puteti chiar sa va conectati setul cu casca VR', 2400, 'quest-2-64gb-698646f4d49976235efddf9d846da1da.jpg', 'quest-2-64gb-27ed03de9f64fae7706b4dc6d3914d30.jpg', 'quest-2-64gb-f9d97a4d95b3fe2ee5c1255a121bebff.jpg', 'Ochelari VR'),
(80, 'Ochelari VR HTC Vive Flow 64GB', 'Ochelari VR HTC Vive Flow 64GB\r\nConectivitate: USB-C, Wi-Fi, Bluetooth 5.0\r\nRezolutie: 3200 x 1600\r\nFOV: 100° (orizontal)\r\nDensitate pixel: 1077ppi\r\nScreen size: 2x 2.1&#34;\r\nCapacitate stocare: 64 GB\r\nGreutate: 189g', 3250, 'htc-vive-flow-3cd095ee413bf3d15d1bb03a405ec69e.jpg', 'htc-vive-flow-917351fff1a557825635ba746d610e2b.jpg', 'htc-vive-flow-d26bad92c122d72f8eaf4beefa9da4d2.jpg', 'Ochelari VR'),
(81, 'Ochelari VR Meta Quest Pro 256GB', 'Casca VR\r\nDoua controllere touch\r\nDock de încărcare\r\nAdaptor de alimentare USB-C de 45W\r\nCablu de încărcare pentru controller\r\nCablu de încărcare (pentru căști)\r\n2x stylus tips\r\n2 blocaje parțiale pentru lumina (stânga și dreapta)\r\nClip cablu\r\nHusa de protectie\r\nLaveta de curatare\r\n2 prinderi pentru încheietura mâinii', 8600, 'vr-headset-oculus-quest-pro-256gb-black-148df3c22f57c0d121aab94a4abfbc95.jpg', 'vr-headset-oculus-quest-pro-256gb-black-c738046ee38f06a9b8a0162f38c27133.jpg', 'vr-headset-oculus-quest-pro-256gb-black-6b79cbebc0480ef7d5b698e4bf9a17b5.jpg', 'Ochelari VR'),
(82, 'PC Gaming Corvus, AMD Ryzen 3 3200G 3.6GHz', 'PC Gaming Corvus, AMD Ryzen 3 3200G 3.6GHz, 16GB DDR4, 250GB SSD, AMD Radeon™ Vega 8, Iluminare RGB', 1670, 'gaming-corvus-amd-ryzen-5-3400g-37ghz-16gb-ddr4-250gb-ssd-amd-radeon-vega-11-iluminare-rgb-fd5ac8eb0c0067ad7162c8c094778cc9.jpg', 'gaming-corvus-amd-ryzen-5-3400g-37ghz-16gb-ddr4-250gb-ssd-amd-radeon-vega-11-iluminare-rgb-1f38c4cc331af0c2c00c83f85e6812d5.jpg', 'gaming-corvus-amd-ryzen-5-3400g-37ghz-16gb-ddr4-250gb-ssd-amd-radeon-vega-11-ca8b5f2cb84a6507fbb73dce8ecfcc65.jpg', 'PC'),
(83, 'PC Gaming Helix, Intel i7-12700F 2.1GHz Alder Lake', 'PC Gaming Helix, Intel i7-12700F 2.1GHz Alder Lake, 32GB DDR4, 1TB SSD, RTX 3070 8GB GDDR6, Iluminare RGB', 7300, 'gaming-helix-intel-i7-12700f-21ghz-alder-lake-32gb-ddr4-1tb-ssd-rtx-3070-8gb-gddr6-iluminare-rgb-24527d7f91db2b61614ee99b0ac9f225.jpg', 'gaming-helix-intel-i7-12700f-21ghz-alder-lake-32gb-ddr4-1tb-ssd-rtx-3070-8gb-gddr6-iluminare-rgb-fe001d6bbde20b6a6819980f1790186d.jpg', 'gaming-helix-intel-i7-12700f-21ghz-alder-lake-32gb-ddr4-1tb-ssd-rtx-3070-8gb-gddr6-iluminare-rgb-7022b8f62a63328a32ef15afcd11d861.jpg', 'PC'),
(84, 'PC Gaming Serpent, Intel i5-13400F 2.5GHz', 'PC Gaming Serpent, Intel i5-13400F 2.5GHz, 32GB DDR4, 500GB SSD, RTX 3060 12GB GDDR6, Iluminare RGB', 5400, 'gaming-serpent-intel-i5-13400f-25ghz-32gb-ddr4-500gb-ssd-rtx-3060-12gb-gddr6-iluminare-rgb-21cb35c7d87f8c88bad1b83dce66380b.jpg', 'gaming-serpent-intel-i5-13400f-25ghz-32gb-ddr4-500gb-ssd-rtx-3060-12gb-gddr6-iluminare-rgb-9eef79eb4d9d02cb6b22ecd06a256877.jpg', 'gaming-serpent-intel-i5-13400f-25ghz-32gb-ddr4-500gb-ssd-rtx-3060-12gb-gddr6-iluminare-rgb-420875fef999dca419c7b100c7e9ee9a.jpg', 'PC'),
(85, 'PC Office Expert C5HS1, Intel i5-12400 2.5GHz', 'PC Office Expert C5HS1, Intel i5-12400 2.5GHz, 16GB DDR4, 500GB SSD, Windows 11 Pro Business Ready', 3400, 'office-expert-c5hs-intel-i5-12400-25ghz-16gb-ddr4-500gb-ssd-windows-11-pro-business-ready-dbbe45d4d0c3add73e7a9f3911f0daa2.jpg', 'office-expert-c5hs-intel-i5-12400-25ghz-16gb-ddr4-500gb-ssd-windows-11-pro-business-ready-3a9adc317660992834dd18b0e13c1bdd.jpg', 'office-expert-c5hs-intel-i5-12400-25ghz-16gb-ddr4-500gb-ssd-windows-11-pro-business-ready-044acee1481904cd057a0d8f92242aa8.jpg', 'PC'),
(86, 'PC Gaming Stormtrooper Black, Intel i5-12400F 2.5GHz', 'PC Gaming Stormtrooper Black, Intel i5-12400F 2.5GHz, 16GB DDR4, 1 TB SSD, GTX 1650 4GB GDDR6, Iluminare RGB', 3550, 'gaming-stormtrooper-black-intel-i5-12400f-25ghz-16gb-ddr4-1-tb-ssd-gtx-1650-4gb-gddr6-iluminare-rgb-789b092bec6575caffea423562bfaea9.jpg', 'gaming-stormtrooper-black-intel-i5-12400f-25ghz-16gb-ddr4-1-tb-ssd-gtx-1650-4gb-gddr6-iluminare-rgb-d7e6ccd42f98e90d512da47ee0614f4b.jpg', 'gaming-stormtrooper-black-intel-i5-12400f-25ghz-16gb-ddr4-1-tb-ssd-gtx-1650-4gb-gddr6-iluminare-rgb-c5e3d50a5b5af8da911efc299571a8c6.jpg', 'PC'),
(87, 'PC Gaming Zmeu, Intel i3 12100F 3.3GHz', 'PC Gaming Zmeu, Intel i3 12100F 3.3GHz, 16GB DDR4, 500GB SSD, RTX 3050 8GB GDDR6, Iluminare RGB', 3550, 'gaming-zmeu-intel-i3-12100f-33ghz-16gb-ddr4-500gb-ssd-rtx-3050-8gb-gddr6-iluminare-rgb-fcdd5de8485cdc3d0bf328f046f20f77.jpg', 'gaming-zmeu-intel-i3-12100f-33ghz-16gb-ddr4-500gb-ssd-rtx-3050-8gb-gddr6-iluminare-rgb-b48fc18b694eb22d95fc793780a4442e.jpg', 'gaming-zmeu-intel-i3-12100f-33ghz-16gb-ddr4-500gb-ssd-rtx-3050-8gb-gddr6-iluminare-rgb-27a612d58030c095f02778bf75a77ba6.jpg', 'PC'),
(88, 'Placa de baza ASUS TUF GAMING Z690-PLUS D4', '	\r\nPlaca de baza ASUS TUF GAMING Z690-PLUS D4 ', 1060, 'tuf-gaming-z690-plus-d4-cee6ee4865f098546ef5fbe308b9b645.jpg', 'tuf-gaming-z690-plus-d4-05c9fafa18a5b70760371359ebd5a71d.jpg', 'tuf-gaming-z690-plus-d4-48e7380e05045a26cc18b1b468e50fce.jpg', 'Placă de bază'),
(89, 'Placa de baza GIGABYTE B550M DS3H', '	\r\nPlaca de baza GIGABYTE B550M DS3H', 450, 'b550m-ds3h-a7e63256b6ec1d5de5f36753dcca614c.jpg', 'b550m-ds3h-88318f3d1e7ae26f265c9e26306f7fb7.jpg', 'b550m-ds3h-fe751f866f19f4b46500d5d549ae13eb.jpg', 'Placă de bază'),
(90, 'Placa de baza MSI A520M-A PRO', 'Placa de baza MSI A520M-A PRO', 300, 'a520m-a-pro-6e4c5579e5e7543c631b486265ada561.jpg', 'a520m-a-pro-b11726d990fe5c939d57863c96bb4f07.jpg', 'a520m-a-pro-d4e6fea058205bbb5828b45be4df3fc0.jpg', 'Placă de bază'),
(91, 'Placa de sunet Creative Sound Blaster Play! 3', 'Placa de sunet Creative Sound Blaster Play! 3', 100, 'soud-blaster-play-3-d2cbdec295a7e2a99da8c50c9f97a436.jpg', 'thumb_d_gallery_base_998f5767.webp', 'thumb_d_gallery_base_dc0f650a.webp', 'Placă de sunet'),
(92, 'Placa de sunet Creative Sound BlasterX AE-5 Plus', 'Placa de sunet Creative Sound BlasterX AE-5 Plus', 800, 'sound-blasterx-ae-5-plus-8d95bfe996c61f755ac8058bef6d4501.jpg', 'sound-blasterx-ae-5-plus-02eee55bfe477487b5a5c77a60861427.jpg', 'sound-blasterx-ae-5-plus-315f33d4edcf901e15e6da933af2bbd4.jpg', 'Placă de sunet'),
(93, 'Placa de sunet Creative Sound Blaster Audigy FX 5.1', 'Placa de sunet Creative Sound Blaster Audigy FX 5.1', 225, 'sound-blaster-audigy-fx-51-60707cb9633ba4571fe6e2e7d9350c71.jpg', 'sound-blaster-audigy-fx-51-ecf87a3c7fe271290c86f94c3b7fa45f.jpg', 'sound-blaster-audigy-fx-51-c9cc4fc29586cd08ca107d0a80971576.jpg', 'Placă de sunet'),
(94, 'XFX Radeon RX 580 GTS XXX Edition 8GB GDDR5', 'Placa video XFX Radeon RX 580 GTS XXX Edition 8GB GDDR5 256-bit', 900, 'radeon-rx-580-gts-xxx-edition-8gb-ddr5-256-bit-334cddeb483c2d9799e5842948e8a602.jpg', 'radeon-rx-580-gts-xxx-edition-8gb-ddr5-256-bit-08be22df92bace1a2437b4c48eb98162.jpg', 'radeon-rx-580-gts-xxx-edition-8gb-ddr5-256-bit-da4482b382bb0a98b8070980dd2dc1e4.jpg', 'Placă video'),
(95, 'GIGABYTE GeForce RTX 3060 WINDFORCE OC 12GB GDDR6', 'Placa video GIGABYTE GeForce RTX 3060 WINDFORCE OC 12GB GDDR6 192-bit', 1950, 'rtx-3060-windforce-oc-12gb-148d206b081ac181b03a4892a2eeb8fd.jpg', 'rtx-3060-windforce-oc-12gb-87dc1a3d750f1770913eb0cc57ba4981.jpg', 'rtx-3060-windforce-oc-12gb-2d6019e1a924e764fe1cd3b0eb12860d.jpg', 'Placă video'),
(96, 'GIGABYTE GeForce RTX 4070 WINDFORCE 12GB GDDR6X', 'Placa video GIGABYTE GeForce RTX 4070 WINDFORCE OC 12GB GDDR6X 192-bit DLSS 3.0', 3450, 'geforce-rtx-4070-windforce-oc-12gb-c66e980ecf711c74eac8974e31d1e8f8.jpg', 'geforce-rtx-4070-windforce-oc-12gb-b05df0e99861f44b6502c3335ca7e494.jpg', 'geforce-rtx-4070-windforce-oc-12gb-059daaa2ddcfe5d279a313db076d8535.jpg', 'Placă video'),
(97, ' XFX Radeon RX 570 RS 8GB GDDR5', 'Placa video XFX Radeon RX 570 RS 8GB GDDR5 256-bit', 1300, 'radeon-rx-570-rs-xxx-edition-4gb-ddr5-256-bit-afc15029fe810fbd30a83f40c91ad311.jpg', 'radeon-rx-570-rs-xxx-edition-4gb-ddr5-256-bit-4e37deed5d9021bc04edf7ef6539ac7b.jpg', 'radeon-rx-570-rs-xxx-edition-4gb-ddr5-256-bit-4f2adb9074eaff1cd38f92177ad514ea.jpg', 'Placă video'),
(98, 'Palit GeForce RTX 4070 DUAL OC 12GB GDDR6X', 'Placa video Palit GeForce RTX 4070 DUAL OC 12GB GDDR6X 192-bit DLSS 3.0', 3250, 'palit-rtx4070-dual-oc-12gb-gddr6x-192bit-3xdp-hdmi-c58a64506419dd19892b585816e45b4e.jpg', 'palit-rtx4070-dual-oc-12gb-gddr6x-192bit-3xdp-hdmi-eedf3949c2cb46fa9c9d17a24f7d1ab2.jpg', 'palit-rtx4070-dual-oc-12gb-gddr6x-192bit-3xdp-hdmi-22de75d99f7d031178df844f96c7f3c2.jpg', 'Placă video'),
(99, 'ASUS Radeon RX 6650 XT DUAL O8G 8GB GDDR6', 'Placa video ASUS Radeon RX 6650 XT DUAL O8G 8GB GDDR6 128-bit', 1660, 'radeon-rx-6600-xt-dual-o8g-8gb-gddr6-128-bit-5a25c5a11022d68418b774f624d64fd3.jpg', 'radeon-rx-6600-xt-dual-o8g-8gb-gddr6-128-bit-d0bcda93d645bb1da643dfda082a73ff.jpg', 'radeon-rx-6600-xt-dual-o8g-8gb-gddr6-128-bit-67da6d726a6dddbc600fb5a5ecc6de2e.jpg', 'Placă video'),
(100, 'AMD Ryzen 9 7900X 4.7GHz', 'Procesor AMD Ryzen 9 7900X 4.7GHz box', 2350, 'ryzen-9-7900x-47ghz-box-c6592d5c866068c64628cac0fc3a972e.jpg', 'ryzen-9-7950x-34ghz-box-f098da830772c779bb47bbf5742fd707.jpg', 'ryzen-9-7900x-47ghz-box-nda-6aff04acb354038d405093ae0a82247e.jpg', 'Procesor'),
(101, 'AMD Ryzen 5 5500 3.6GHz', 'Procesor AMD Ryzen 5 5500 3.6GHz box', 490, 'ryzen-5-5600x-37ghz-box-d000a6d36af5f569813e31431d7a6f5b.jpg', 'ryzen-5-5600x-37ghz-box-26bda6b8149dc7ed1e485e0ced910275.jpg', 'ryzen-5-5600x-37ghz-box-4890eb5086f6e60eef14d3f3c7a9c83c.jpg', 'Procesor'),
(102, 'AMD Ryzen 7 5800X3D', 'Procesor AMD Ryzen 7 5800X3D 3.4GHz box', 1650, 'ryzen-7-5800x3d-34ghz-box-nda-cd7be5844cfe12687c65d73b45b56df4.jpg', 'ryzen-7-5800x3d-34ghz-box-nda-43bd48697626d727ae5f06e157e4f52c.jpg', 'ryzen-7-5800x3d-34ghz-box-nda-044cabfe0c8301e43303c8683ebf0b83.jpg', 'Procesor'),
(103, 'Intel Raptor Lake, Core i7 13700K 3.4GHz', 'Procesor Intel Raptor Lake, Core i7 13700K 3.4GHz box', 2250, 'raptor-lake-core-i7-13700k-34ghz-box-5b879597a0e04d8f0f32d1915ef94baa.jpg', 'raptor-lake-core-i7-13700k-34ghz-box-43c961d074d4ab2a2007e74dc4ece58e.jpg', 'raptor-lake-core-i7-13700k-34ghz-box-a709d245975c494230063c61fa6f5aba.jpg', 'Procesor'),
(104, 'Intel Raptor Lake, Core i5 13600KF 3.5GHz', 'Procesor Intel Raptor Lake, Core i5 13600KF 3.5GHz box', 1580, 'raptor-lake-core-i5-13600kf-35ghz-box-863e952aeadbdaf5c638427d83dd46ce.jpg', 'raptor-lake-core-i5-13600kf-35ghz-box-3c7400908b94dfea9947c578960457a5.jpg', 'raptor-lake-core-i5-13600kf-35ghz-box-f64594bb00d0c2ef66282249a39b8f38.jpg', 'Procesor'),
(105, 'Intel Raptor Lake, Core i9 13900K 3.0GHz', 'Procesor Intel Raptor Lake, Core i9 13900K 3.0GHz box', 3150, 'raptor-lake-core-i9-13900k-34ghz-box-57195949891a0e9d9a91ce7fe872f57a.jpg', 'raptor-lake-core-i9-13900k-34ghz-box-b07de29f11b8a9136205b3c581c29b68.jpg', 'raptor-lake-core-i9-13900k-34ghz-box-50937cdd4f7e9358e6ba44979c3c9e98.jpg', 'Procesor'),
(106, 'Scaun gaming Serioux Torin Blue', 'Scaun gaming X by Serioux\r\n\r\n-Torin\r\n-ajustabil\r\n-piele sintetica\r\n-piston pe gaz\r\n-manere reglabile\r\n-baza stea cu 5 picioare\r\n-perne detasabile\r\n-negru si albastru', 650, 'torin-blue-44f897486bc20c390361af737545b90c.jpg', 'torin-blue-099300d2ce5c656940768cc244f8f6c4.jpg', 'torin-blue-ad686a045e6380aef48cfd2660a1b894.jpg', 'Scaun Gaming'),
(107, 'Scaun gaming Inaza Rainbow RGB', 'Scaun gaming Inaza Rainbow RGB Iluminare RGB(necesita conectarea cablului USB la PC sau la un powerbank)\r\nPentru o functionare optima este necesara alimentarea sistemului RGB de la o sursa de 5V/2A\r\nPerna lombara fara bretele', 800, 'rainbow-rgb-26ab054342e80bcb15f4babf49a869a8.jpg', 'rainbow-rgb-69d820eca53a08f690b78f8d7afcac14.jpg', 'rainbow-rgb-4ed5ae8648d94f27ed35ab76498efef8.jpg', 'Scaun Gaming'),
(108, 'Scaun gaming Corsair TC60 Fabric White', 'Scaun gaming Corsair TC60 Fabric White', 1150, 'tc60-fabric-white-efc1733bd975f1243433b0a12c459a14.jpg', 'tc60-fabric-white-918904d4c94f716ee231c4ffe25d9732.jpg', 'tc60-fabric-white-792864423466c9a97ee766f3ef9c32d6.jpg', 'Scaun Gaming'),
(109, 'Televizor LED TCL Smart TV QLED 55C735 Seria C735', 'Televizor LED TCL Smart TV QLED 55C735 Seria C735 139cm 4K UHD HDR', 2500, 'smart-tv-qled-55c735-seria-c735-139cm-4k-uhd-hdr-818008b74518caee17dc0250ff301e94.jpg', 'smart-tv-qled-55c735-seria-c735-139cm-4k-uhd-hdr-53213c2b30b9c7c5f8b20a2f6576309f.jpg', 'smart-tv-qled-55c735-seria-c735-139cm-4k-uhd-hdr-9b10821cefa9042c4713abf96397cc78.jpg', 'Smart TV'),
(110, 'Televizor LED LG Smart TV 43UQ75003LF Seria Q7500', 'Televizor LED LG Smart TV 43UQ75003LF Seria Q7500 108cm negru 4K UHD HDR', 1450, 'smart-tv-43uq75003lf-seria-q7500-108cm-negru-4k-uhd-hdr-13ae23ff03847565afd07e87e8d52933.jpg', 'smart-tv-43uq75003lf-seria-q7500-108cm-negru-4k-uhd-hdr-c747403d203be2b6063465c5d37ca3e6.jpg', 'smart-tv-43uq75003lf-seria-q7500-108cm-negru-4k-uhd-hdr-10adb4144cc32a3064a6eee1a8639dff.jpg', 'Smart TV'),
(111, 'Televizor LED Samsung Smart TV QLED QE43Q60B', 'Televizor LED Samsung Smart TV QLED QE43Q60B Seria Q60B 108cm negru 4K UHD HDR', 1900, 'smart-tv-qled-qe43q60b-seria-q60b-108cm-negru-4k-uhd-hdr-1ae354e35c8b4fc808793fd4400774d7.jpg', 'smart-tv-qled-qe43q60b-seria-q60b-108cm-negru-4k-uhd-hdr-bbffff296b159909848725b0cbd79516.jpg', 'smart-tv-qled-qe43q60b-seria-q60b-108cm-negru-4k-uhd-hdr-109cb14aa7171382d50c88405109c87f.jpg', 'Smart TV'),
(112, 'SmartWatch Apple Watch S8', 'SmartWatch Apple Watch S8, 45mm Aluminium Starlight cu Starlight Sport Band Regular + GPS', 1850, 'apple-watch-s8-gps-45mm-starlight-aluminium-case-with-starlight-sport-band-regular-4d8cccc7d1244a46a56b4ef7bdf2b3c5.jpg', 'apple-watch-s8-gps-45mm-starlight-aluminium-case-with-starlight-sport-band-regular-23ca63b078178cfad7e5a6c6605cb4d4.jpg', 'FKHR3_AV1.jfif', 'SmartWatch'),
(113, 'SmartWatch Xiaomi Redmi Watch 3', 'SmartWatch Xiaomi Redmi Watch 3 Black', 420, 'redmi-watch-3-black-2caceb53296539444e2a7edb076610b7.jpg', 'redmi-watch-3-black-23832cd4e482b56444b733deb961ea31.jpg', 'redmi-watch-3-black-13ba17ebe6feb07b05c67acdeac9c3ce.jpg', 'SmartWatch'),
(114, 'SmartWatch Samsung Galaxy Watch 5', 'SmartWatch Samsung Galaxy Watch 5, LTE, 40 mm, Gold, Wi-Fi, Bluetooth, GPS, NFC, Rezistent la apa', 1400, 'galaxy-watch-5-lte-40-mm-gold-wi-fi-bluetooth-gps-nfc-rezistent-la-apa-bd7e7fd2247c0930d1a55060e86abd77.jpg', 'galaxy-watch-5-lte-40-mm-gold-wi-fi-bluetooth-gps-nfc-rezistent-la-apa-6a456aff7f1f6beb741e3085fd9ff851.jpg', 'galaxy-watch-5-lte-40-mm-gold-wi-fi-bluetooth-gps-nfc-rezistent-la-apa-3e688ff864d261d1651b3ffebaaa5857.jpg', 'SmartWatch'),
(115, 'SSD Silicon-Power P34A60 256GB PCI Express 3.0', 'SSD Silicon-Power P34A60 256GB PCI Express 3.0 x4 M.2 2280', 90, 'p34a60-256gb-pci-express-30-x4-m2-2280-99178fda38f1265a2b94452ee375cb12.jpg', 'ssd-silicon-power-p34a60-m-2-256-gb-pci-express-slc-nvme-1116085.jpg', '71bCR-WO5vL.jpg', 'SSD'),
(116, 'SSD Kingston A400 480GB SATA-III 2.5 inch', 'SSD Kingston A400 480GB SATA-III 2.5 inch', 130, 'a400-120gb-sata-iii-25-inch-ace5ac38fb969418fdf46f467226e385.jpg', 'a400-120gb-sata-iii-25-inch-26411c3a7cff7f7c1ec7494b91fc17e5.jpg', 'a400-120gb-sata-iii-25-inch-46e28607d780f4d6ae74dce0b67006d8.jpg', 'SSD'),
(117, 'SSD Samsung 980 1TB PCI Express 3.0 x4 M.2 2280', 'SSD Samsung 980 1TB PCI Express 3.0 x4 M.2 2280\r\n', 315, '980-1tb-pci-express-30-x4-m2-2280-8fb6e0b9f191ea9116ac880c4af981ce.jpg', '980-1tb-pci-express-30-x4-m2-2280-6abdbf1ed5ac71a67401f508e9d5e52a.jpg', '980-1tb-pci-express-30-x4-m2-2280-f58d7db6839232331dc729c218f026bf.jpg', 'SSD'),
(118, 'Sursa Seasonic Focus GX, 80+ Gold, 850W', 'Sursa Seasonic Focus GX, 80+ Gold, 850W', 800, 'focus-gx-80-plus-gold-850w-cdb526a6b31669d2a32d6c93a46441fe.jpg', 'focus-gx-80-plus-gold-850w-304139dee9f25964429663399b3ba0f8.jpg', 'focus-gx-80-plus-gold-850w-c6052b517e492aeb38980012e9463e1a.jpg', 'Surse'),
(119, 'Sursa Aerocool VX PLUS 500N, 500W', 'Sursa Aerocool VX PLUS 500N, 500W', 145, 'vx-plus-500n-500w-d37d5dd89e9da7605b1ebc6f16701421.jpg', 'sursa-aerocool-vx-plus-500-500w-21babe9af06c24938e3d84f28adc9c47.jpg', 'sursa-aerocool-vx-plus-500-500w-4e3f6466f4b9d4657a26924b8d014dd9.jpg', 'Surse'),
(120, 'Sursa Segotep SG-D600SCR', 'Sursa Segotep SG-D600SCR', 205, 'sg-d600scr-11db5bde682e8009a5a3e25fa090b0db.jpg', 'sg-d600scr-fe11eb0333dbf39e93b995e0dc8103c4.jpg', 'img_20160304_154824jpg-4d6db871cc193863c25ac612f0ee1fb9.jpg', 'Surse'),
(121, 'Tableta Apple iPad (9th Generation 2021) 64GB', 'Tableta Apple iPad (9th Generation 2021) 10.2 inch 64GB Wi-Fi Space Grey', 2000, 'ipad-9th-generation-2021-102-inch-256gb-wi-fi-plus-cellular-space-grey-d9995f71e1ed3648b43dbcce539a5498.jpg', 'ipad-9th-generation-2021-102-inch-256gb-wi-fi-plus-cellular-space-grey-8a45cb78b7d8a1c1a99a716cee85928f.jpg', 'ipad-9th-generation-2021-102-inch-256gb-wi-fi-plus-cellular-space-grey-d841696a99df6845b33b8fb6e456c27a.jpg', 'Tabletă'),
(122, 'Tableta Lenovo TAB M8 TB-8506F', 'Tableta Lenovo TAB M8 TB-8506F, 8 inch Multi-touch, Helio P22T 2.3 GHz Octa Core, 3GB RAM, 32GB flash, Wi-Fi, Bluetooth, Android 11, Iron Grey', 630, 'tab-m8-8506xs-8-inch-multi-touch-helio-p22t-23-ghz-octa-core-3gb-ram-32gb-flash-wi-fi-bluetooth-4g-android-11-iron-grey-ed633d32773d2df7a6bcff539bae6380.jpg', 'tab-m8-8506xs-8-inch-multi-touch-helio-p22t-23-ghz-octa-core-3gb-ram-32gb-flash-wi-fi-bluetooth-4g-android-11-iron-grey-1c02b75fe410a4e95386f10ec1e434f7.jpg', 'tab-m8-8506xs-8-inch-multi-touch-helio-p22t-23-ghz-octa-core-3gb-ram-32gb-flash-wi-fi-bluetooth-4g-android-11-iron-grey-9039af50acbcc8a47dcc178026796463.jpg', 'Tabletă'),
(123, 'Tableta Apple iPad Pro 6th (2022) 128GB', 'Tableta Apple iPad Pro 6th (2022) 12.9-inch 128GB Wi-Fi Silver', 6600, 'ipad-pro-6th-2022-129-inch-128gb-wi-fi-silver-7b7d937101cf92d69033e25530f18f21.jpg', 'ipad-pro-6th-2022-129-inch-128gb-wi-fi-silver-75a507078faf82d50a8481220b9a31ef.jpg', 'ipad-pro-6th-2022-129-inch-128gb-wi-fi-silver-37f02eda8b953a6393d3c59031d234fd.jpg', 'Tabletă'),
(124, 'Tastatura Gaming QwertyKey QwertyKey61', 'Tastatura Gaming QwertyKey QwertyKey61 Black RGB Mecanica ​Red Switch', 330, 'qwertykey61-hotswap-rgb-neagra-tastatura-mecanica-gaming-r-a3fbe870654e4dd912ca60f05beeeaea.jpg', 'qwertykey61-hotswap-rgb-neagra-tastatura-mecanica-gaming-r-a8710093ed94351e1823681e376b9976.jpg', 'qwertykey61-hotswap-rgb-neagra-tastatura-mecanica-gaming-r-555ab9044e8f0b106d049da62093b6db.jpg', 'Tastatură'),
(125, 'Tastatura Gaming Redragon Mitra RGB Mecanica', 'Tastatura Gaming Redragon Mitra RGB Mecanica Red Switch', 180, 'mitra-rgb-red-mecanica-abbf5ca758f8afc899cd61b17dc6e4b3.png', 'mitra-rgb-red-mecanica-af8d2d9ae47df2148133270269174bf5.jpg', 'mitra-rgb-red-mecanica-322202e589bfae49b693e083be71dd71.jpg', 'Tastatură'),
(126, 'Tastatura Gaming Logitech G213 Prodigy', 'Tastatura Gaming Logitech G213 Prodigy', 250, 'g213-prodigy-gaming-db1b99b627fb7e703743950e1d48660b.jpg', 'g213-prodigy-gaming-6b043a65b1f8367cb83a620ed49ccd1c.png', 'g213-prodigy-gaming-1c4bb347dc7e8717de6d747e5b7b8f35.jpg', 'Tastatură'),
(127, 'Tastatura Serioux 9500I Black', 'Tastatura Serioux 9500I Black', 50, '9500i-black-a4ba97c0d9b5f2167d6da7f96507868a.jpg', 'downl12312312oad.jfif', 'mqdefaul123123t.jpg', 'Tastatură'),
(128, 'Tastatura DELL KB216 Negru', 'Tastatura DELL KB216 Negru', 65, 'res_57af5541347f149f0131449afa231cf8.webp', '134159_5.jpg', '99b722090c9152fef6ae73724818afeb-atc-d-d-580-adgn.webp', 'Tastatură'),
(129, 'Tastatura Logitech MX Keys for Mac Wireless', 'Tastatura Logitech MX Keys for Mac Wireless Illuminated (US International), Space Gray', 460, 'mx-keys-for-mac-wireless-illuminated-us-space-gray-1e18f11cf4fb954231aeed0f8cc079ca.jpg', 'mx-keys-for-mac-wireless-illuminated-us-international-space-gray-25a8b92a6173c874e7d4881db6d6f4cc.jpg', 'mx-keys-for-mac-wireless-illuminated-us-space-gray-f2ed38e47424e58440d5430f7797388f.jpg', 'Tastatură'),
(130, 'ASUS ROG Phone 7 Ultimate', 'Smartphone ASUS ROG Phone 7 Ultimate, Octa Core, 512GB, 16GB RAM, Dual SIM, 5G, 4-Camere, Storm White, ASUS AeroActive Cooler 7 inclus in pachet', 7100, 'rog-phone-7-ultimate-octa-core-512gb-16gb-ram-dual-sim-5g-4-camere-storm-white-63382c4c1fe233fe9e8f964c56cec8b3.jpg', 'rog-phone-7-ultimate-octa-core-512gb-16gb-ram-dual-sim-5g-4-camere-storm-white-c67ef19de6cb53447502ea8de5a48733.jpg', 'rog-phone-7-ultimate-octa-core-512gb-16gb-ram-dual-sim-5g-4-camere-storm-white-dd9a5d6a52cbce9cceeaab7bd25bd4fb.jpg', 'Telefon'),
(131, 'Apple iPhone 14 Pro, 128GB, 5G', 'iPhone 14 Pro si Pro Max. Surprinde detalii incredibile cu noua camera principala de 48MP. Bucura-te de experienta iPhone intr-un mod cu totul nou cu Dynamic Island si Always-On display. Crash Detection, o noua functionalitate de siguranta, solicita ajutor daca tu nu poti.', 5250, 'iphone-14-pro-128gb-5g-space-black-d97aac5be3fac727c04a989f377c9bc8.jpg', 'iphone-14-pro-128gb-5g-space-black-b5188f3ad037a97f8ef07e632ffb7dc2.jpg', 'iphone-14-pro-128gb-5g-space-black-1b25af9a69dba66d41a2e17113a59bad.jpg', 'Telefon'),
(132, 'Samsung Galaxy A53, 5G', 'Smartphone Samsung Galaxy A53, 5G, 120Hz Super AMOLED, 256GB, 8GB RAM, Dual SIM, Camera OIS 64 MPX, Audio Dolby Atmos, Awesome Blue', 2100, 'galaxy-a53-octa-core-128gb-6gb-ram-dual-sim-5g-5-camere-awesome-blue-170ba3d6df755104eafea6726af7fb51.jpg', 'galaxy-a53-octa-core-128gb-6gb-ram-dual-sim-5g-5-camere-awesome-blue-b53def81938a226c14dcca4bd2433623.jpg', 'galaxy-a53-octa-core-128gb-6gb-ram-dual-sim-5g-5-camere-awesome-blue-9d324c9a33ca3c92b1c966edae96c2b5.jpg', 'Telefon'),
(133, 'OnePlus 10T, Octa Core, 256GB', 'Smartphone OnePlus 10T, Octa Core, 256GB, 16GB RAM, Dual SIM, 5G, 4-Camere, Jade Green', 2650, '10t-octa-core-128gb-8gb-ram-dual-sim-5g-4-camere-jade-green-1c9139974947ee23101e962b158088b7.jpg', '10t-octa-core-128gb-8gb-ram-dual-sim-5g-4-camere-jade-green-d3f6939bd72c690d10e02b67655f97ba.jpg', '10t-octa-core-128gb-8gb-ram-dual-sim-5g-4-camere-jade-green-d8326d9be3cafe4fa04ec3621cd4631e.jpg', 'Telefon');
INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`, `category`) VALUES
(134, 'Motorola Moto G22, Octa Core, 128GB', 'Smartphone Motorola Moto G22, NFC, Octa Core, 128GB, 4GB RAM, Dual SIM, 4G, 5-Camere, Iceberg Blue', 650, 'moto-g22-octa-core-64gb-4gb-ram-dual-sim-4g-5-camere-iceberg-blue-5b2e99d259f7a2238ec4a41f620e2187.jpg', 'moto-g22-octa-core-64gb-4gb-ram-dual-sim-4g-5-camere-iceberg-blue-5c52b46154b48d4f6244ee256b6cb1b6.jpg', 'moto-g22-octa-core-64gb-4gb-ram-dual-sim-4g-5-camere-iceberg-blue-ee864943358dbdfdca7266b9e2f23c69.jpg', 'Telefon'),
(135, 'Xiaomi Redmi Note 12 4G, 128GB', 'Smartphone Xiaomi Redmi Note 12 4G, 128GB, 4GB RAM, Dual SIM, 4-Camere, Onyx Gray', 1000, 'redmi-note-12-64gb-4gb-ram-dual-sim-5g-4-camere-matte-black-4d13639ac4f501b612f4ac051fa24def.jpg', 'redmi-note-12-64gb-4gb-ram-dual-sim-5g-4-camere-matte-black-ec6db4159b09792e4f2ecc192c250894.jpg', 'redmi-note-12-64gb-4gb-ram-dual-sim-5g-4-camere-matte-black-2e2be9a8056f01cdb76db00131953c73.jpg', 'Telefon'),
(136, 'Ventilator Noctua NF-P12 redux 1300 PWM', 'Ventilator / radiator Noctua NF-P12 redux 1300 PWM', 80, 'nf-p12-redux-1300-pwm-ac3cf01916bf6f9ca84e8b4bf7eb1d30.jpg', 'nf-p12-redux-1300-pwm-3735f7ae3a7d2e7447793e412139d057.jpg', 'nf-p12-redux-1300-pwm-a3fb52d7e9bdd2de2b023b158740e995.jpg', 'Ventilator'),
(137, 'Ventilator Floston Halo Rainbow Dual', 'Ventilator / radiator Floston Halo Rainbow Dual', 35, 'halo-rainbow-dual-rgb-2d18f1943bc84c44378d2c747ec24deb.png', 'halo-rainbow-dual-rgb-56216bcee1361c99d8af055d4aef485d.png', 'halo-rainbow-dual-rgb-eb7e800b93fd377af9fd466c99c002d1.png', 'Ventilator'),
(138, 'Ventilator ARCTIC AC P12 PWM', 'Ventilator / radiator ARCTIC AC P12 PWM', 25, 'p12-pwm-432dc915a497f554554b5a3d59a370bc.jpg', 'p12-pwm-6ab3ffda2c35d814b7204471b909c0d7.jpg', 'p12-pwm-edf9ef2a0bee7591bd6f5c974695b345.jpg', 'Ventilator');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(2, 'DenisaModrogeanu', 'am5pisici@gmail.com', 'toate5suntnegre'),
(3, 'fanaca123', 'cata.cata309@yahoo.com', 'chirita10');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
