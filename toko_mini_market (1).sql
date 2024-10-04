-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Okt 2024 pada 08.11
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_mini_market`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `audit_logs`
--

CREATE TABLE `audit_logs` (
  `audit_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `action_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_phone` varchar(15) DEFAULT NULL,
  `customer_address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_phone`, `customer_address`) VALUES
(1, 'John Doe', 'john@example.com', '081234567890', 'Jalan Merdeka 1'),
(2, 'Jane Smith', 'jane@example.com', '081234567891', 'Jalan Kemerdekaan 2'),
(3, 'Bob Johnson', 'bob@example.com', '081234567892', 'Jalan Pahlawan 3'),
(4, 'Alice Brown', 'alice@example.com', '081234567893', 'Jalan Satria 4'),
(5, 'Charlie Green', 'charlie@example.com', '081234567894', 'Jalan Patriot 5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer_loyalty`
--

CREATE TABLE `customer_loyalty` (
  `loyalty_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `delivery_orders`
--

CREATE TABLE `delivery_orders` (
  `delivery_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `delivery_address` text DEFAULT NULL,
  `delivery_status` varchar(20) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `discounts`
--

CREATE TABLE `discounts` (
  `discount_id` int(11) NOT NULL,
  `discount_description` text DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `employee_position` varchar(50) DEFAULT NULL,
  `employee_salary` decimal(10,2) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `employee_phone` varchar(15) DEFAULT NULL,
  `employee_address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `employees`
--

INSERT INTO `employees` (`employee_id`, `employee_name`, `employee_position`, `employee_salary`, `hire_date`, `employee_phone`, `employee_address`) VALUES
(1, 'Emma Wilson', 'Kasir', '3500000.00', '2024-01-01', '081234567895', 'Jalan Nusantara 10'),
(2, 'Oliver King', 'Manajer', '5000000.00', '2023-05-10', '081234567896', 'Jalan Garuda 12'),
(3, 'Sophia Lee', 'Kasir', '3500000.00', '2024-02-15', '081234567897', 'Jalan Elang 14'),
(4, 'James Brown', 'Staf Gudang', '3000000.00', '2023-03-20', '081234567898', 'Jalan Rajawali 16'),
(5, 'Isabella Clark', 'Kasir', '3500000.00', '2024-04-01', '081234567899', 'Jalan Merpati 18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee_shifts`
--

CREATE TABLE `employee_shifts` (
  `shift_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `shift_start_time` datetime DEFAULT NULL,
  `shift_end_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expenses`
--

CREATE TABLE `expenses` (
  `expense_id` int(11) NOT NULL,
  `expense_description` text DEFAULT NULL,
  `expense_amount` decimal(10,2) DEFAULT NULL,
  `expense_date` date NOT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `last_update` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `product_id`, `quantity_in_stock`, `last_update`) VALUES
(1, 1, 100, '2024-10-01'),
(2, 2, 50, '2024-10-01'),
(3, 3, 70, '2024-10-01'),
(4, 4, 90, '2024-10-01'),
(5, 5, 40, '2024-10-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory_logs`
--

CREATE TABLE `inventory_logs` (
  `log_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `change_quantity` int(11) DEFAULT NULL,
  `change_date` datetime DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory_reorders`
--

CREATE TABLE `inventory_reorders` (
  `reorder_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `reorder_quantity` int(11) DEFAULT NULL,
  `reorder_date` date DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity_ordered` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity_ordered`, `price`) VALUES
(1, 1, 1, 50, '10000.00'),
(2, 2, 2, 40, '15000.00'),
(3, 3, 3, 60, '8000.00'),
(4, 4, 4, 30, '12000.00'),
(5, 5, 5, 20, '20000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `payments`
--

INSERT INTO `payments` (`payment_id`, `sale_id`, `payment_date`, `payment_amount`, `payment_method`) VALUES
(1, 1, '2024-10-01', '50000.00', 'Tunai'),
(2, 2, '2024-10-02', '60000.00', 'Kartu Kredit'),
(3, 3, '2024-10-03', '40000.00', 'Debit'),
(4, 4, '2024-10-04', '55000.00', 'Tunai'),
(5, 5, '2024-10-05', '30000.00', 'E-Wallet');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_description` text DEFAULT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_stock` int(11) NOT NULL,
  `product_category` varchar(50) DEFAULT NULL,
  `product_supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `product_price`, `product_stock`, `product_category`, `product_supplier_id`) VALUES
(1, 'Sabun Mandi', 'Sabun mandi untuk kulit lembut', '10000.00', 100, 'Kebutuhan Rumah Tangga', 1),
(2, 'Shampo', 'Shampo untuk semua jenis rambut', '15000.00', 50, 'Kebutuhan Rumah Tangga', 2),
(3, 'Pasta Gigi', 'Pasta gigi dengan fluoride', '8000.00', 70, 'Kebutuhan Rumah Tangga', 3),
(4, 'Teh Celup', 'Teh celup aroma melati', '12000.00', 90, 'Minuman', 4),
(5, 'Gula Pasir', 'Gula pasir putih', '20000.00', 40, 'Makanan Pokok', 5),
(6, 'Minyak Goreng', 'Minyak goreng kelapa sawit', '25000.00', 60, 'Kebutuhan Rumah Tangga', 1),
(7, 'Beras', 'Beras kualitas premium', '50000.00', 100, 'Makanan Pokok', 2),
(8, 'Kopi Bubuk', 'Kopi bubuk robusta', '18000.00', 80, 'Minuman', 3),
(9, 'Susu UHT', 'Susu cair siap minum', '15000.00', 70, 'Minuman', 4),
(10, 'Mie Instan', 'Mie instan rasa ayam bawang', '3000.00', 200, 'Makanan Pokok', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_returns`
--

CREATE TABLE `product_returns` (
  `return_id` int(11) NOT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_reviews`
--

CREATE TABLE `product_reviews` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  `review_text` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `promotions`
--

CREATE TABLE `promotions` (
  `promotion_id` int(11) NOT NULL,
  `promotion_name` varchar(100) DEFAULT NULL,
  `promotion_description` text DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `order_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `purchase_orders`
--

INSERT INTO `purchase_orders` (`order_id`, `order_date`, `supplier_id`, `total_amount`, `status`) VALUES
(1, '2024-09-30', 1, '500000.00', 'Pending'),
(2, '2024-09-29', 2, '600000.00', 'Selesai'),
(3, '2024-09-28', 3, '400000.00', 'Selesai'),
(4, '2024-09-27', 4, '550000.00', 'Selesai'),
(5, '2024-09-26', 5, '300000.00', 'Pending');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `sale_date` date NOT NULL,
  `sale_total` decimal(10,2) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`sale_id`, `sale_date`, `sale_total`, `customer_id`, `employee_id`) VALUES
(1, '2024-10-01', '50000.00', 1, 1),
(2, '2024-10-02', '60000.00', 2, 2),
(3, '2024-10-03', '40000.00', 3, 3),
(4, '2024-10-04', '55000.00', 4, 4),
(5, '2024-10-05', '30000.00', 5, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sale_items`
--

CREATE TABLE `sale_items` (
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity_sold` int(11) NOT NULL,
  `product_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sale_items`
--

INSERT INTO `sale_items` (`sale_item_id`, `sale_id`, `product_id`, `quantity_sold`, `product_price`) VALUES
(1, 1, 1, 2, '10000.00'),
(2, 1, 2, 1, '15000.00'),
(3, 2, 3, 3, '8000.00'),
(4, 2, 4, 1, '12000.00'),
(5, 3, 5, 2, '20000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `store_locations`
--

CREATE TABLE `store_locations` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(100) DEFAULT NULL,
  `store_address` text DEFAULT NULL,
  `store_phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_contact` varchar(100) DEFAULT NULL,
  `supplier_phone` varchar(15) DEFAULT NULL,
  `supplier_address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `supplier_contact`, `supplier_phone`, `supplier_address`) VALUES
(1, 'PT Sumber Berkah', 'Mr. Agus', '081234567900', 'Jalan Industri 1'),
(2, 'CV Maju Jaya', 'Mr. Budi', '081234567901', 'Jalan Niaga 2'),
(3, 'Toko Sejahtera', 'Ms. Diana', '081234567902', 'Jalan Pasar 3'),
(4, 'UD Harapan', 'Mr. Eko', '081234567903', 'Jalan Pabrik 4'),
(5, 'PT Global Makmur', 'Mr. Fajar', '081234567904', 'Jalan Perusahaan 5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier_transactions`
--

CREATE TABLE `supplier_transactions` (
  `transaction_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_accounts`
--

CREATE TABLE `user_accounts` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`audit_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_email` (`customer_email`);

--
-- Indeks untuk tabel `customer_loyalty`
--
ALTER TABLE `customer_loyalty`
  ADD PRIMARY KEY (`loyalty_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indeks untuk tabel `delivery_orders`
--
ALTER TABLE `delivery_orders`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Indeks untuk tabel `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indeks untuk tabel `employee_shifts`
--
ALTER TABLE `employee_shifts`
  ADD PRIMARY KEY (`shift_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indeks untuk tabel `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indeks untuk tabel `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indeks untuk tabel `inventory_reorders`
--
ALTER TABLE `inventory_reorders`
  ADD PRIMARY KEY (`reorder_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indeks untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_supplier_id` (`product_supplier_id`);

--
-- Indeks untuk tabel `product_returns`
--
ALTER TABLE `product_returns`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `sale_item_id` (`sale_item_id`);

--
-- Indeks untuk tabel `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indeks untuk tabel `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`promotion_id`);

--
-- Indeks untuk tabel `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indeks untuk tabel `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`sale_item_id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `store_locations`
--
ALTER TABLE `store_locations`
  ADD PRIMARY KEY (`store_id`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indeks untuk tabel `supplier_transactions`
--
ALTER TABLE `supplier_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indeks untuk tabel `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `audit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `customer_loyalty`
--
ALTER TABLE `customer_loyalty`
  MODIFY `loyalty_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `delivery_orders`
--
ALTER TABLE `delivery_orders`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `discounts`
--
ALTER TABLE `discounts`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `employee_shifts`
--
ALTER TABLE `employee_shifts`
  MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `inventory_logs`
--
ALTER TABLE `inventory_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `inventory_reorders`
--
ALTER TABLE `inventory_reorders`
  MODIFY `reorder_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `product_returns`
--
ALTER TABLE `product_returns`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `promotions`
--
ALTER TABLE `promotions`
  MODIFY `promotion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `sale_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `store_locations`
--
ALTER TABLE `store_locations`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `supplier_transactions`
--
ALTER TABLE `supplier_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_accounts` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `customer_loyalty`
--
ALTER TABLE `customer_loyalty`
  ADD CONSTRAINT `customer_loyalty_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Ketidakleluasaan untuk tabel `delivery_orders`
--
ALTER TABLE `delivery_orders`
  ADD CONSTRAINT `delivery_orders_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`);

--
-- Ketidakleluasaan untuk tabel `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Ketidakleluasaan untuk tabel `employee_shifts`
--
ALTER TABLE `employee_shifts`
  ADD CONSTRAINT `employee_shifts_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Ketidakleluasaan untuk tabel `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Ketidakleluasaan untuk tabel `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Ketidakleluasaan untuk tabel `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD CONSTRAINT `inventory_logs_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `inventory_logs_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Ketidakleluasaan untuk tabel `inventory_reorders`
--
ALTER TABLE `inventory_reorders`
  ADD CONSTRAINT `inventory_reorders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `inventory_reorders_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Ketidakleluasaan untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `purchase_orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Ketidakleluasaan untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`);

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Ketidakleluasaan untuk tabel `product_returns`
--
ALTER TABLE `product_returns`
  ADD CONSTRAINT `product_returns_ibfk_1` FOREIGN KEY (`sale_item_id`) REFERENCES `sale_items` (`sale_item_id`);

--
-- Ketidakleluasaan untuk tabel `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `product_reviews_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Ketidakleluasaan untuk tabel `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_orders_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Ketidakleluasaan untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Ketidakleluasaan untuk tabel `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `sale_items_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`),
  ADD CONSTRAINT `sale_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Ketidakleluasaan untuk tabel `supplier_transactions`
--
ALTER TABLE `supplier_transactions`
  ADD CONSTRAINT `supplier_transactions_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
