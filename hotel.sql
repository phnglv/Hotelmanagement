-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th5 26, 2023 lúc 02:11 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hotel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `currency` varchar(5) DEFAULT 'INR',
  `method` varchar(10) DEFAULT 'card',
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payment`
--

INSERT INTO `payment` (`payment_id`, `user_id`, `reservation_id`, `currency`, `method`, `amount`) VALUES
(4, 3, 4, 'INR', 'card', 788);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `booking_date` text DEFAULT NULL,
  `no_adults` int(11) DEFAULT NULL,
  `no_children` int(11) DEFAULT NULL,
  `reservation_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `user_id`, `room_id`, `booking_date`, `no_adults`, `no_children`, `reservation_created`) VALUES
(4, 3, 3, NULL, 1, 0, '2023-05-26 04:28:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `room_name` varchar(30) NOT NULL,
  `room_type` varchar(30) NOT NULL,
  `room_featured` int(1) NOT NULL,
  `room_price` double(10,3) NOT NULL,
  `room_booked` int(1) DEFAULT 0,
  `check_in_date` text DEFAULT NULL,
  `check_out_date` text DEFAULT NULL,
  `room_image` varchar(50) NOT NULL,
  `room_floor` int(11) NOT NULL,
  `room_view` varchar(20) NOT NULL,
  `room_beds` int(11) NOT NULL,
  `bed_type` varchar(30) NOT NULL,
  `room_capacity` int(11) NOT NULL,
  `room_amenities` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_number`, `room_name`, `room_type`, `room_featured`, `room_price`, `room_booked`, `check_in_date`, `check_out_date`, `room_image`, `room_floor`, `room_view`, `room_beds`, `bed_type`, `room_capacity`, `room_amenities`) VALUES
(1, 101, 'Daimond Suite', 'Daimond', 1, 538.220, 1, '2023-05-26', '2023-06-08', '4.jpg', 2, 'Beach', 2, 'Double deluxe', 4, 'breakfast, lunch, dinner, wifi'),
(2, 101, 'Daimond Suite', 'Silver', 1, 538.220, 1, '2023-05-25', '2023-06-05', '4.jpg', 5, 'Beach', 2, 'Double deluxe', 5, 'breakfast, lunch, dinner, wifi'),
(3, 202, 'Ocean View Suite', 'gold', 0, 788.000, 1, '05/31/2023', '06/26/2023', '4.jpg', 2, 'Ocean', 3, 'Queen Bed', 2, 'Ocean View, Wifi, Double bathroom'),
(5, 202, 'Ocean View Suite', 'gold', 0, 788.000, 1, '2023-05-27', '2023-05-27', '5.jpg', 2, 'Ocean', 3, 'Queen Bed', 7, 'Ocean View, Wifi, Double bathroom'),
(6, 202, 'Ocean View Suite', 'Silver', 1, 788.000, 0, NULL, NULL, '1.jpg', 2, 'Ocean', 3, 'Queen Bed', 7, 'Ocean View, Wifi, Double bathroom'),
(7, 202, 'Ocean View Suite', 'Gold', 1, 788.000, 0, NULL, NULL, '8.jpg', 2, 'Ocean', 3, 'Queen Bed', 7, 'Ocean View, Wifi, Double bathroom'),
(8, 202, 'Ocean View Suite', 'Premium', 1, 788.000, 0, NULL, NULL, '1.jpg', 2, 'Ocean', 3, 'Queen Bed', 7, 'Ocean View, Wifi, Double bathroom'),
(9, 303, 'Ocean View Suite', 'gold', 1, 800.000, 0, NULL, NULL, '5.jpg', 2, 'Ocean', 3, 'Queen Bed', 7, 'Ocean View, Wifi, Double bathroom');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_fname` varchar(20) NOT NULL,
  `user_lname` varchar(20) NOT NULL,
  `user_verified` int(1) NOT NULL DEFAULT 0,
  `verification_hash` varchar(500) NOT NULL,
  `user_dob` date NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  `user_admin` int(1) NOT NULL DEFAULT 0,
  `user_password` varchar(500) NOT NULL,
  `user_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_image` varchar(20) NOT NULL DEFAULT 'default_user.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_fname`, `user_lname`, `user_verified`, `verification_hash`, `user_dob`, `user_phone`, `user_admin`, `user_password`, `user_created`, `user_image`) VALUES
(3, 'admin@gmail.com', 'Admin ', 'Account', 1, '5a4b25aaed25c2ee1b74de72dc03c14e', '2000-07-19', '0213123118024', 1, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2020-11-22 17:52:46', 'default_user.jpg'),
(6, 'alandsilva@gmail.com', 'Alan', 'Dsilva', 1, 'c3e878e27f52e2a57ace4d9a76fd9acf', '2020-11-23', '0213123118024', 1, 'db42328112177c2d6f2f6ca7f33c8e81084b8ff3e14202254137e22673bce2c8', '2020-11-25 04:03:00', 'default_user.jpg'),
(7, 'abc@gmail.com', 'Katie', 'Nguyen', 0, '1385974ed5904a438616ff7bdb3f7439', '1999-05-13', '0986621883', 0, 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2023-05-26 08:53:39', 'default_user.jpg');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payment_idfk_1` (`reservation_id`),
  ADD KEY `payment_idfk_2` (`user_id`);

--
-- Chỉ mục cho bảng `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Chỉ mục cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_idfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_idfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
