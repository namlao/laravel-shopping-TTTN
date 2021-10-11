-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 11, 2021 lúc 02:50 AM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `man_shopping`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `date_order` datetime NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'chua-giao',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `customer_id`, `date_order`, `total`, `created_at`, `updated_at`, `status`, `deleted_at`) VALUES
(1, 1, '2021-10-06 12:04:30', 31599000, '2021-10-06 05:04:30', '2021-10-06 20:19:37', 'dang-giao', NULL),
(2, 2, '2021-10-06 12:06:13', 58450000, '2021-10-06 05:06:13', '2021-10-06 20:19:26', 'da-giao', NULL),
(3, 3, '2021-10-07 02:34:03', 10490000, '2021-10-06 19:34:03', '2021-10-06 20:41:49', 'chua-giao', NULL),
(4, 6, '2021-10-07 19:01:28', 17700000, '2021-10-07 12:01:28', '2021-10-07 12:01:28', 'chua-giao', NULL),
(5, 7, '2021-10-09 02:31:14', 89820000, '2021-10-08 19:31:14', '2021-10-08 19:32:15', 'da-giao', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_details`
--

CREATE TABLE `bill_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantily` int(11) NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bill_details`
--

INSERT INTO `bill_details` (`id`, `bill_id`, `product_id`, `quantily`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 2, 8850000, '2021-10-06 05:04:30', '2021-10-06 05:04:30'),
(2, 1, 1, 1, 13899000, '2021-10-06 05:04:30', '2021-10-06 05:04:30'),
(3, 2, 5, 2, 13490000, '2021-10-06 05:06:13', '2021-10-06 05:06:13'),
(4, 2, 4, 3, 10490000, '2021-10-06 05:06:13', '2021-10-06 05:06:13'),
(5, 3, 4, 1, 10490000, '2021-10-06 19:34:03', '2021-10-06 19:34:03'),
(6, 4, 6, 2, 8850000, '2021-10-07 12:01:28', '2021-10-07 12:01:28'),
(7, 5, 6, 1, 8850000, '2021-10-08 19:31:14', '2021-10-08 19:31:14'),
(8, 5, 7, 1, 53990000, '2021-10-08 19:31:14', '2021-10-08 19:31:14'),
(9, 5, 5, 2, 13490000, '2021-10-08 19:31:14', '2021-10-08 19:31:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Laptop', 0, 'laptop', '2021-09-19 06:53:23', '2021-09-19 06:53:23', NULL),
(2, 'Máy tính bàn', 0, 'may-tinh-ban', '2021-09-19 06:53:33', '2021-09-19 06:53:33', NULL),
(3, 'Acer', 1, 'acer', '2021-09-19 06:53:41', '2021-09-19 06:53:41', NULL),
(4, 'HP', 1, 'hp', '2021-09-19 06:53:55', '2021-09-19 06:53:55', NULL),
(5, 'Dell', 1, 'dell', '2021-09-19 06:54:08', '2021-09-19 06:54:08', NULL),
(6, 'Asus', 1, 'asus', '2021-09-19 06:54:09', '2021-09-19 06:54:37', NULL),
(7, 'Apple', 1, 'apple', '2021-09-19 06:54:17', '2021-09-19 06:54:17', NULL),
(8, 'Lenovo', 1, 'lenovo', '2021-09-19 06:54:52', '2021-09-19 06:54:52', NULL),
(9, 'LG', 1, 'lg', '2021-09-19 06:55:14', '2021-09-19 06:55:14', NULL),
(10, 'MSI', 1, 'msi', '2021-09-19 06:55:25', '2021-09-19 06:55:25', NULL),
(11, 'Dell', 2, 'dell', '2021-09-19 14:23:51', '2021-09-19 14:23:51', NULL),
(12, 'LG', 1, 'lg', '2021-10-07 09:54:07', '2021-10-07 09:54:10', '2021-10-07 09:54:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `name`, `email`, `content`, `created_at`, `updated_at`, `product_id`, `deleted_at`) VALUES
(1, 'Hà Văn Đông', 'havandong@email.com', 'Laptop dùng rất tốt', NULL, NULL, 5, NULL),
(2, 'Nguyễn Văn Tuấn', 'nguyenvantuan@gmail.com', 'Laptop dùng tốt, lại chạy êm', NULL, NULL, 5, NULL),
(3, 'Nguyễn Văn Bình', 'nguyenvanbinh@gmail.com', 'Máy này dùng khá tiện cho lập trình web', NULL, NULL, 5, NULL),
(4, 'Đặng Văn Khánh', 'dangvankhanh@gmail.com', 'Máy hoạt động tốt', NULL, '2021-10-05 08:19:35', 4, NULL),
(5, 'Mai Anh Nam', 'nam@email.com', 'Lorem ipsum', NULL, '2021-10-05 08:24:00', 3, NULL),
(6, 'Nguyễn Văn A', 'loremipsum@email.com', 'bhdvjshdbcjsdbchjsdbcsd', NULL, '2021-10-06 18:53:07', 3, '2021-10-06 18:53:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Home', 'testguest@email.com', 'thai nguyen', 123456789, NULL, '2021-10-06 05:04:30', '2021-10-06 05:04:30'),
(2, 'Mai Anh Nam', 'canmotcaiten.tn95@gmail.com', 'thai nguyen', 818074891, 'sdvbhsdbvhsdbvhsd', '2021-10-06 05:06:13', '2021-10-06 05:06:13'),
(3, 'Mai Anh Nam', 'canmotcaiten.tn95@gmail.com', 'Hà nội', 818074891, 'Giao hàng trong ngày', '2021-10-06 19:34:03', '2021-10-06 19:34:03'),
(6, 'Mai Anh Nam', 'canmotcaiten.tn95@gmail.com', 'sfsdvbhsd', 818074891, 'dsvsdvsd', '2021-10-07 12:01:28', '2021-10-07 12:01:28'),
(7, 'Mai Anh Nam', 'canmotcaiten.tn95@gmail.com', 'thai nguyen', 123456789, NULL, '2021-10-08 19:31:14', '2021-10-08 19:31:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `parent_id`, `created_at`, `updated_at`, `slug`, `deleted_at`) VALUES
(1, 'Home', 0, '2021-09-15 20:36:21', '2021-09-15 20:36:21', '/', NULL),
(2, 'Cửa hàng', 0, '2021-09-15 20:54:15', '2021-09-28 07:02:15', 'shop', NULL),
(4, 'Tin tức', 0, '2021-09-15 20:46:43', '2021-09-15 20:48:43', 'tin-tuc', NULL),
(6, 'Laptop', 2, '2021-09-15 20:36:44', '2021-09-28 07:01:48', 'laptop', '2021-09-28 07:01:48'),
(7, 'Máy tính bàn', 2, '2021-09-15 20:36:36', '2021-09-28 07:01:57', 'may-tinh-ban', '2021-09-28 07:01:57'),
(8, 'Dịch vụ', 0, '2021-09-20 17:32:11', '2021-09-20 17:32:11', 'dich-vu', NULL),
(9, 'Liên hệ', 0, '2021-09-15 20:38:53', '2021-09-15 20:47:49', 'lien-he', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2021_08_31_185754_create_categories_table', 1),
(4, '2021_09_01_103558_add_column_deleted_attable_categories', 2),
(5, '2021_09_01_111805_create_menus_table', 3),
(6, '2021_09_01_135843_add_column_slug_to_menus_table', 4),
(7, '2021_09_01_143544_add_column_soft_delete_to_menus_table', 5),
(8, '2021_09_02_143706_create_products_table', 6),
(9, '2021_09_02_152223_create_product_images_table', 6),
(10, '2021_09_02_152329_create_tags_table', 6),
(11, '2021_09_02_152748_create_product_tags_table', 6),
(12, '2021_09_03_185216_add_column_feature_image_name', 7),
(13, '2021_09_03_192100_add_column_image_name_to_table_product_image', 8),
(14, '2021_09_05_205825_add_column_delete_at_to_product_table', 9),
(15, '2021_09_08_093223_create_slides_table', 10),
(16, '2021_09_09_023531_add_column_created_at_to_slides', 11),
(17, '2021_09_09_031538_create_settings_table', 12),
(18, '2021_09_09_042903_add_column_type_settings_table', 13),
(19, '2021_09_11_012103_create_roles_table', 14),
(20, '2021_09_11_012130_create_permissions_table', 14),
(21, '2021_09_11_012258_create_table_user_role', 14),
(22, '2021_09_11_012348_create_table_permission_role', 14),
(23, '2021_09_11_032903_add_column_deleted_at_table_user', 15),
(24, '2021_09_13_004617_add_column_parent_id_permission', 16),
(25, '2021_09_13_014951_add_column_key_permission_table', 17),
(26, '2021_09_13_031114_add_column_deleted_at_in_role_table', 18),
(27, '2021_09_20_023819_add_column_views_products', 19),
(28, '2021_09_20_025526_column_like_products', 20),
(29, '2021_09_20_084639_create_pages_table', 21),
(30, '2021_09_20_092003_add_column_users_to_pages_table', 22),
(31, '2021_09_26_175537_create_comments_table', 23),
(32, '2021_09_26_183423_add_column_product_id_table_comment', 24),
(33, '2021_09_26_190526_drop_column_star_table_comment', 25),
(34, '2021_09_27_010824_add_column_type_at_table_pages', 26),
(35, '2021_10_05_150823_add_deleted_at_comments_table', 27),
(37, '2021_10_06_085958_create_customers_table', 28),
(38, '2021_10_06_090053_create_bills_table', 28),
(39, '2021_10_06_090143_create_bill_details_table', 28),
(40, '2021_10_07_024222_add_column_status_bills_table', 29),
(41, '2021_10_07_033715_add_column_deleted_at_bill_table', 30);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `slug_parent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `deleted_at`, `created_at`, `updated_at`, `user_id`, `slug_parent`) VALUES
(1, 'Chính sách bán hàng', 'chinh-sach-ban-hang', '<figure class=\"article center pointer\">\r\n<p class=\"text-center\"><img class=\"img-thumbnail\" src=\"http://laptopphuthanh.vn/uploads/page/unnamed.png\" alt=\"Hỗ trợ Phần Mềm\" width=\"415\" /></p>\r\n</figure>\r\n<div class=\"clear\">&nbsp;</div>\r\n<div id=\"page-bodyhtml\" class=\"bodytext margin-bottom-lg\">\r\n<ul>\r\n<li>Hỗ trợ c&agrave;i đặt hệ điều h&agrave;nh windows 7,windows 8,windows 10,Mac,.....</li>\r\n<li>C&agrave;i đặt c&aacute;c phần mềm hỗ trợ , tr&igrave;nh duyệt, Microsoft office,giả lập game .....</li>\r\n</ul>\r\n<img src=\"http://laptopphuthanh.vn/uploads/page/windows-134848.jpg\" alt=\"windows 134848\" width=\"800\" height=\"546\" /></div>', NULL, '2021-09-20 02:24:51', '2021-09-26 18:30:54', 1, 'pages'),
(2, 'Chính sách đổi trả', 'chinh-sach-doi-tra', '<figure class=\"article center pointer\">\r\n<p class=\"text-center\"><img class=\"img-thumbnail\" src=\"http://laptopphuthanh.vn/uploads/page/thumb_chinh-sach-doi-tra_chinh-sach-doi-tra.jpg\" alt=\"Ch&iacute;nh s&aacute;ch đổi trả h&agrave;ng\" width=\"500\" /></p>\r\n</figure>\r\n<div class=\"clear\">&nbsp;</div>\r\n<div id=\"page-bodyhtml\" class=\"bodytext margin-bottom-lg\">Ch&iacute;nh s&aacute;ch đổi trả h&agrave;ng được &aacute;p dụng khi :<br />- Sản phẩm gặp lỗi phần cứng do b&ecirc;n b&aacute;n<br />- Sản phẩm kh&ocirc;ng đ&aacute;p ứng được ti&ecirc;u ch&iacute; như qu&aacute; tr&igrave;nh tư vấn<br />- Kh&aacute;ch h&agrave;ng c&oacute; nhu cầu đổi qua c&aacute;c sản phẩm kh&aacute;c<br />- Thời gian trong 3 - 7 ng&agrave;y đầu ti&ecirc;n<br />- C&aacute;c sản phẩm phải c&ograve;n nguy&ecirc;n team bảo h&agrave;nh chưa th&aacute;o lắp v&agrave; h&igrave;nh thức như khi nhận m&aacute;y<br />-- Mọi th&ocirc;ng tin cần hỗ trợ c&oacute; thể gọi trực tiếp : 078.5050.666</div>', NULL, '2021-09-20 02:25:38', '2021-09-26 18:31:04', 1, 'pages'),
(3, 'Chính sách bảo hành', 'chinh-sach-bao-hanh', '<table style=\"border-collapse: collapse; width: 100%; border-color: #000000; border-style: solid;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 66.7773%;\">Lỗi do nh&agrave; sản xuất trong thời gian bảo h&agrave;nh</td>\r\n<td style=\"width: 30.3721%;\">Lỗi do người sử dụng</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 66.7773%;\">-1 đổi 1 trong 1 th&aacute;ng đầu ( sản phẩm c&ugrave;ng mẫu &ndash; dung lượng &ndash; cấu h&igrave;nh&hellip;. )\r\n<ul>\r\n<li>Trường hợp sản phẩm đổi hết h&agrave;ng,kh&aacute;ch h&agrave;ng c&oacute; thể đổi sang sản phẩm kh&aacute;c c&ugrave;ng nh&oacute;m gi&aacute; trị tương đương hoặc gi&aacute; trị kh&ocirc;ng ch&ecirc;nh lệch qu&aacute; 40% ( C&ocirc;ng ty sẽ ho&agrave;n tiền gi&aacute; trị ch&ecirc;nh lệch cho kh&aacute;ch h&agrave;ng )</li>\r\n<li>-Trường hợp kh&aacute;ch h&agrave;ng muốn trả m&aacute;y b&ecirc;n c&ocirc;ng ty ho&agrave;n tiền bằng 80% gi&aacute; trị sản phẩm ban đầu th&aacute;ng thứ 1 &ndash; th&aacute;ng thứ 2 bằng 70%</li>\r\n</ul>\r\n<br />&nbsp;</td>\r\n<td style=\"width: 30.3721%;\">\r\n<ul>\r\n<li>Kh&ocirc;ng đủ điều kiện bảo h&agrave;nh theo quy định</li>\r\n</ul>\r\n&nbsp;\r\n<ul>\r\n<li>Kh&ocirc;ng Giữ nguy&ecirc;n 100% h&igrave;nh dạng ban đầu</li>\r\n</ul>\r\n&nbsp;\r\n<ul>\r\n<li>M&agrave;n h&igrave;nh bị trầy xước.</li>\r\n</ul>\r\n&nbsp;\r\n<ul>\r\n<li>Kh&ocirc;ng &aacute;p dụng đổi trả.C&ocirc;ng ty hỗ trợ bảo h&agrave;nh ,kh&aacute;ch h&agrave;ng chịu chi ph&iacute; sửa chữa</li>\r\n</ul>\r\n<br />&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, '2021-09-20 02:26:29', '2021-09-26 18:31:11', 1, 'pages'),
(4, 'Liên hệ', 'lien-he', '<div class=\"panel panel-default\">\r\n<div class=\"panel-heading\">\r\n<h3>chăm s&oacute;c kh&aacute;ch h&agrave;ng</h3>\r\n</div>\r\n<div class=\"panel-body\">\r\n<p>Điện thoại: 081807891</p>\r\n<p>Mai Anh Nam: chăm s&oacute;c kh&aacute;ch h&agrave;ng</p>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div class=\"panel-heading\">\r\n<h3>hỗ trợ kỹ thuật</h3>\r\n</div>\r\n<div class=\"panel-body\">\r\n<p>Điện thoại: 0818074891</p>\r\n<p>Mai Anh Nam: hỗ trợ kỹ thuật</p>\r\n</div>\r\n</div>', NULL, '2021-09-26 18:19:55', '2021-09-26 18:31:22', 1, 'lien-he'),
(5, 'Dịch vụ phần cứng', 'dich-vu-phan-cung', '<figure class=\"article center pointer\">\r\n<p class=\"text-center\"><img class=\"img-thumbnail\" src=\"http://laptopphuthanh.vn/uploads/page/chinh-sach-bao-hanh.jpg\" alt=\"Hỗ trợ - tư vẫn\" width=\"500\" /></p>\r\n</figure>\r\n<div class=\"clear\">&nbsp;</div>\r\n<div id=\"page-bodyhtml\" class=\"bodytext margin-bottom-lg\"><strong>Trưởng ph&ograve;ng kỹ thuật<br />⚙️Mr.Mai Anh Nam</strong><br />Hotline : 0818074891\r\n<ul>\r\n<li>Giải đ&aacute;p mọi thắc mắc - y&ecirc;u cầu - c&acirc;u hỏi của qu&yacute; kh&aacute;ch h&agrave;ng</li>\r\n<li>Lu&ocirc;n hỗ trợ 24/7</li>\r\n<li>Hỗ trợ t&igrave;m hiểu c&aacute;c sản phẩm cũ - mới nhất,giải đ&aacute;p c&aacute;c vấn đề trong qu&aacute; tr&igrave;nh sử dụng</li>\r\n<li>Đưa ra những phương &aacute;n tối ưu nhất v&agrave; nhanh nhất cho kh&aacute;ch h&agrave;ng</li>\r\n<li>Nhiệt t&igrave;nh gi&uacute;p đỡ - hướng dẫn chi tiết - tận t&acirc;m trong c&ocirc;ng việc</li>\r\n</ul>\r\n</div>', NULL, '2021-09-26 18:21:32', '2021-09-26 18:31:29', 1, 'dich-vu'),
(6, 'Dịch vụ phần mềm', 'dich-vu-phan-mem', '<figure class=\"article center pointer\">\r\n<p class=\"text-center\"><img class=\"img-thumbnail\" src=\"http://laptopphuthanh.vn/uploads/page/unnamed.png\" alt=\"Hỗ trợ Phần Mềm\" width=\"415\" /></p>\r\n</figure>\r\n<div class=\"clear\">&nbsp;</div>\r\n<div id=\"page-bodyhtml\" class=\"bodytext margin-bottom-lg\">\r\n<ul>\r\n<li>Hỗ trợ c&agrave;i đặt hệ điều h&agrave;nh windows 7,windows 8,windows 10,Mac,.....</li>\r\n<li>C&agrave;i đặt c&aacute;c phần mềm hỗ trợ , tr&igrave;nh duyệt, Microsoft office,giả lập game .....</li>\r\n</ul>\r\n<img src=\"http://laptopphuthanh.vn/uploads/page/windows-134848.jpg\" alt=\"windows 134848\" width=\"800\" height=\"546\" /></div>', NULL, '2021-09-26 18:22:02', '2021-09-26 18:31:37', 1, 'dich-vu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `key_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`, `parent_id`, `key_code`) VALUES
(1, 'category', 'category', '2021-09-13 05:58:31', '2021-09-13 05:58:31', 0, 'category_all'),
(2, 'list', 'list', '2021-09-13 05:58:31', '2021-09-13 05:58:31', 1, 'category_list'),
(3, 'add', 'add', '2021-09-13 05:58:31', '2021-09-13 05:58:31', 1, 'category_add'),
(4, 'edit', 'edit', '2021-09-13 05:58:31', '2021-09-13 05:58:31', 1, 'category_edit'),
(5, 'delete', 'delete', '2021-09-13 05:58:31', '2021-09-13 05:58:31', 1, 'category_delete'),
(6, 'slider', 'slider', '2021-09-13 05:58:50', '2021-09-13 05:58:50', 0, 'slider_all'),
(7, 'list', 'list', '2021-09-13 05:58:50', '2021-09-13 05:58:50', 6, 'slider_list'),
(8, 'add', 'add', '2021-09-13 05:58:50', '2021-09-13 05:58:50', 6, 'slider_add'),
(9, 'edit', 'edit', '2021-09-13 05:58:50', '2021-09-13 05:58:50', 6, 'slider_edit'),
(10, 'delete', 'delete', '2021-09-13 05:58:50', '2021-09-13 05:58:50', 6, 'slider_delete'),
(11, 'menu', 'menu', '2021-09-13 05:59:04', '2021-09-13 05:59:04', 0, 'menu_all'),
(12, 'list', 'list', '2021-09-13 05:59:04', '2021-09-13 05:59:04', 11, 'menu_list'),
(13, 'add', 'add', '2021-09-13 05:59:04', '2021-09-13 05:59:04', 11, 'menu_add'),
(14, 'edit', 'edit', '2021-09-13 05:59:04', '2021-09-13 05:59:04', 11, 'menu_edit'),
(15, 'delete', 'delete', '2021-09-13 05:59:04', '2021-09-13 05:59:04', 11, 'menu_delete'),
(16, 'product', 'product', '2021-09-13 05:59:11', '2021-09-13 05:59:11', 0, 'product_all'),
(17, 'list', 'list', '2021-09-13 05:59:11', '2021-09-13 05:59:11', 16, 'product_list'),
(18, 'add', 'add', '2021-09-13 05:59:11', '2021-09-13 05:59:11', 16, 'product_add'),
(19, 'edit', 'edit', '2021-09-13 05:59:11', '2021-09-13 05:59:11', 16, 'product_edit'),
(20, 'delete', 'delete', '2021-09-13 05:59:11', '2021-09-13 05:59:11', 16, 'product_delete'),
(21, 'setting', 'setting', '2021-09-13 05:59:15', '2021-09-13 05:59:15', 0, 'setting_all'),
(22, 'list', 'list', '2021-09-13 05:59:15', '2021-09-13 05:59:15', 21, 'setting_list'),
(23, 'add', 'add', '2021-09-13 05:59:15', '2021-09-13 05:59:15', 21, 'setting_add'),
(24, 'edit', 'edit', '2021-09-13 05:59:15', '2021-09-13 05:59:15', 21, 'setting_edit'),
(25, 'delete', 'delete', '2021-09-13 05:59:15', '2021-09-13 05:59:15', 21, 'setting_delete'),
(26, 'user', 'user', '2021-09-13 05:59:36', '2021-09-13 05:59:36', 0, 'user_all'),
(27, 'list', 'list', '2021-09-13 05:59:36', '2021-09-13 05:59:36', 26, 'user_list'),
(28, 'add', 'add', '2021-09-13 05:59:36', '2021-09-13 05:59:36', 26, 'user_add'),
(29, 'edit', 'edit', '2021-09-13 05:59:36', '2021-09-13 05:59:36', 26, 'user_edit'),
(30, 'delete', 'delete', '2021-09-13 05:59:36', '2021-09-13 05:59:36', 26, 'user_delete'),
(31, 'role', 'role', '2021-09-13 06:00:00', '2021-09-13 06:00:00', 0, 'role_all'),
(32, 'list', 'list', '2021-09-13 06:00:00', '2021-09-13 06:00:00', 31, 'role_list'),
(33, 'add', 'add', '2021-09-13 06:00:00', '2021-09-13 06:00:00', 31, 'role_add'),
(34, 'edit', 'edit', '2021-09-13 06:00:00', '2021-09-13 06:00:00', 31, 'role_edit'),
(35, 'delete', 'delete', '2021-09-13 06:00:00', '2021-09-13 06:00:00', 31, 'role_delete'),
(36, 'page', 'page', '2021-09-20 02:46:17', '2021-09-20 02:46:17', 0, 'page_all'),
(37, 'list', 'list', '2021-09-20 02:46:17', '2021-09-20 02:46:17', 36, 'page_list'),
(38, 'add', 'add', '2021-09-20 02:46:17', '2021-09-20 02:46:17', 36, 'page_add'),
(39, 'edit', 'edit', '2021-09-20 02:46:17', '2021-09-20 02:46:17', 36, 'page_edit'),
(40, 'delete', 'delete', '2021-09-20 02:46:17', '2021-09-20 02:46:17', 36, 'page_delete'),
(41, 'comment', 'comment', '2021-09-26 17:59:46', '2021-09-26 17:59:46', 0, 'comment_all'),
(42, 'list', 'list', '2021-09-26 17:59:46', '2021-09-26 17:59:46', 41, 'comment_list'),
(43, 'delete', 'delete', '2021-10-05 08:12:54', '2021-10-05 08:12:54', 41, 'comment_delete'),
(48, 'order', 'order', '2021-10-06 20:57:39', '2021-10-06 20:57:39', 0, 'order_all'),
(49, 'list', 'list', '2021-10-06 20:57:39', '2021-10-06 20:57:39', 48, 'order_list'),
(50, 'delete', 'delete', '2021-10-06 20:57:39', '2021-10-06 20:57:39', 48, 'order_delete');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission_role`
--

INSERT INTO `permission_role` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(21, 11, 2, NULL, NULL),
(22, 11, 3, NULL, NULL),
(23, 11, 4, NULL, NULL),
(24, 11, 5, NULL, NULL),
(25, 11, 2, NULL, NULL),
(26, 11, 3, NULL, NULL),
(27, 11, 4, NULL, NULL),
(28, 11, 5, NULL, NULL),
(29, 11, 2, NULL, NULL),
(30, 11, 3, NULL, NULL),
(31, 11, 4, NULL, NULL),
(32, 11, 5, NULL, NULL),
(33, 11, 7, NULL, NULL),
(34, 11, 8, NULL, NULL),
(35, 11, 9, NULL, NULL),
(36, 11, 10, NULL, NULL),
(65, 12, 2, NULL, NULL),
(66, 12, 3, NULL, NULL),
(67, 12, 4, NULL, NULL),
(68, 12, 5, NULL, NULL),
(69, 12, 7, NULL, NULL),
(70, 12, 8, NULL, NULL),
(71, 12, 9, NULL, NULL),
(72, 12, 10, NULL, NULL),
(74, 3, 2, NULL, NULL),
(75, 3, 3, NULL, NULL),
(76, 3, 4, NULL, NULL),
(77, 3, 5, NULL, NULL),
(78, 3, 7, NULL, NULL),
(79, 3, 8, NULL, NULL),
(80, 3, 9, NULL, NULL),
(81, 3, 10, NULL, NULL),
(82, 3, 12, NULL, NULL),
(83, 3, 13, NULL, NULL),
(84, 3, 14, NULL, NULL),
(85, 3, 15, NULL, NULL),
(86, 3, 17, NULL, NULL),
(87, 3, 18, NULL, NULL),
(88, 3, 19, NULL, NULL),
(89, 3, 20, NULL, NULL),
(90, 3, 22, NULL, NULL),
(91, 3, 23, NULL, NULL),
(92, 3, 24, NULL, NULL),
(93, 3, 25, NULL, NULL),
(94, 3, 27, NULL, NULL),
(95, 3, 28, NULL, NULL),
(96, 3, 29, NULL, NULL),
(97, 3, 30, NULL, NULL),
(98, 3, 32, NULL, NULL),
(99, 3, 33, NULL, NULL),
(100, 3, 34, NULL, NULL),
(101, 3, 35, NULL, NULL),
(273, 1, 17, NULL, NULL),
(274, 1, 18, NULL, NULL),
(275, 1, 19, NULL, NULL),
(277, 1, 3, NULL, NULL),
(278, 1, 4, NULL, NULL),
(279, 1, 5, NULL, NULL),
(280, 1, 12, NULL, NULL),
(281, 1, 13, NULL, NULL),
(282, 1, 14, NULL, NULL),
(283, 1, 15, NULL, NULL),
(284, 1, 20, NULL, NULL),
(285, 1, 7, NULL, NULL),
(286, 1, 8, NULL, NULL),
(287, 1, 9, NULL, NULL),
(288, 1, 10, NULL, NULL),
(289, 1, 22, NULL, NULL),
(290, 1, 24, NULL, NULL),
(291, 1, 23, NULL, NULL),
(292, 1, 25, NULL, NULL),
(294, 1, 27, NULL, NULL),
(295, 1, 29, NULL, NULL),
(296, 1, 28, NULL, NULL),
(297, 1, 30, NULL, NULL),
(298, 1, 32, NULL, NULL),
(299, 1, 33, NULL, NULL),
(300, 1, 34, NULL, NULL),
(301, 1, 35, NULL, NULL),
(302, 2, 17, NULL, NULL),
(303, 4, 17, NULL, NULL),
(304, 4, 18, NULL, NULL),
(305, 4, 19, NULL, NULL),
(306, 4, 20, NULL, NULL),
(311, 1, 37, NULL, NULL),
(312, 1, 38, NULL, NULL),
(313, 1, 39, NULL, NULL),
(314, 1, 40, NULL, NULL),
(315, 1, 42, NULL, NULL),
(316, 1, 43, NULL, NULL),
(319, 1, 49, NULL, NULL),
(320, 1, 50, NULL, NULL),
(321, 13, 49, NULL, NULL),
(322, 13, 50, NULL, NULL),
(323, 13, 2, NULL, NULL),
(324, 13, 3, NULL, NULL),
(325, 13, 4, NULL, NULL),
(326, 13, 5, NULL, NULL),
(327, 13, 17, NULL, NULL),
(328, 13, 18, NULL, NULL),
(329, 13, 19, NULL, NULL),
(330, 13, 20, NULL, NULL),
(331, 4, 37, NULL, NULL),
(332, 4, 38, NULL, NULL),
(333, 4, 39, NULL, NULL),
(334, 4, 40, NULL, NULL),
(335, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature_image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `feature_image_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `view_count` int(11) DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `feature_image_path`, `content`, `user_id`, `category_id`, `created_at`, `updated_at`, `feature_image_name`, `deleted_at`, `view_count`, `like_count`) VALUES
(1, 'Laptop Acer Spin 3 SP314-51-36JE', '13899000', '/storage/product/1/XjsetvuEaf5ZENliKvBL.webp', '<h2 class=\"icon-head head-products\">Đ&aacute;nh gi&aacute; Laptop Acer Spin 3 SP314-51-36JE</h2>\n<p dir=\"ltr\">T&iacute;nh di động l&agrave; một trong những ti&ecirc;u ch&iacute; tối quan trọng khi chọn mua một sản phẩm c&ocirc;ng nghệ để phục vụ cho nhu cầu được cập nhật th&ocirc;ng tin cũng như ho&agrave;n th&agrave;nh c&ocirc;ng việc m&agrave; kh&ocirc;ng phải build hẳn một cỗ m&aacute;y c&oacute; chip vi xử l&yacute; bất kỳ thuộc thế hệ Coffe Lake mới nhất. Ch&iacute;nh v&igrave; sự quan trọng việc c&agrave;ng mỏng-c&agrave;ng nhẹ-c&agrave;ng tốt m&agrave; những sản phẩm của Apple như iPhone, iPad, Macbook được săn đ&oacute;n nồng nhiệt trong cộng đồng hiện đại như hiện nay l&agrave; dễ hiểu.</p>\n<p>CPU: Intel Core i3-7130U ( 2.7 GHz / 3MB / 2 nh&acirc;n, 4 lu&ocirc;̀ng )<br />- M&agrave;n h&igrave;nh: 14\" IPS ( 1920 x 1080 ) , cảm ứng<br />- RAM: 1 x 4GB Onboard DDR4<br />- Đồ họa: Intel HD Graphics 620<br />- Lưu trữ: 1TB HDD 5400RPM<br />- Hệ điều h&agrave;nh: Windows 10 Home SL 64-bit<br />- Pin: 3 cell 52 Wh Pin liền , khối lượng: 1.7 kg</p>\n<p>&nbsp;</p>', 1, 3, '2021-09-19 06:58:57', '2021-09-19 06:58:57', 'unnamed (4).webp', NULL, 24, 5),
(2, 'Laptop Apple Macbook Pro 2017', '30690000', '/storage/product/1/FKmHvHxm51amUvmmYph6.webp', '<h2>Laptop Apple MacBook 13.3\" MPXR2ZP/A&nbsp;</h2>\r\n<p>Đầu năm 2017, Apple vừa ra mắt mẫu Macbook Pro 13 inch 128 GB MPXR2 với thiết kế mới, mỏng hơn, nhẹ hơn v&agrave; tất nhi&ecirc;n l&agrave; mạnh hơn. Ngo&agrave;i ra phi&ecirc;n bản 13 inch, trong lần ra mắt n&agrave;y d&ograve;ng Macbook Pro 2017 c&ograve;n k&egrave;m theo bản 15 inch tất nhi&ecirc;n l&agrave; với mức gi&aacute; cao hơn.</p>\r\n<p>Thiết kế tr&ecirc;n Apple Macbook Pro 13 inch 128GB MPXR2 ( 2017 ) ho&agrave;n hảo đến từng chi tiết&nbsp;</p>\r\n<figure class=\"image\"><img src=\"https://phongvu.vn/media/wysiwyg/63.Laptop_MacBook_MPXR2ZP.jpg\" alt=\"Laptop MacBook 13.3&quot; MPXR2ZP/A \" /></figure>\r\n<p>Quả thật những Apple Fans kh&ocirc;ng thể cưỡng lại với vẻ đẹp sang chảnh đến từng g&oacute;c cạnh trong khung nh&ocirc;m, c&ugrave;ng với gam m&agrave;u &ldquo; space gray&rdquo; l&agrave;m ph&aacute;t cuồng c&aacute;c t&iacute;n đồ Iphone, Ipad...</p>\r\n<p>Apple Macbook Pro 13 inch 128 GB MPXR2 ( 2017 ) sở hữu m&agrave;n h&igrave;nh retina</p>\r\n<p>M&agrave;n h&igrave;nh retina chất lượng c&ugrave;ng độ ph&acirc;n giải 2560x1600 kết hợp với tấm nền LED sẽ cho chất lượng hiển thị n&eacute;t đến từng chi tiết, m&agrave;u đen s&acirc;u hơn, m&agrave;u trắng s&aacute;ng hơn v&agrave; độ tương phản cũng đưa h&igrave;nh ảnh trở n&ecirc;n c&oacute; chiều s&acirc;u, thực sự sống động v&agrave; trung thực.</p>\r\n<figure class=\"image\"><img src=\"https://phongvu.vn/media/wysiwyg/64.Laptop_MacBook_MPXR2ZP.jpg\" alt=\"Laptop MacBook 13.3&quot; MPXR2ZP/A \" /></figure>\r\n<p>B&agrave;n ph&iacute;m tr&ecirc;n Apple Macbook Pro 13 inch 128GB MPXR2 ( 2017 )</p>\r\n<p>Mang t&ecirc;n gọi Bufterfly thế hệ 2 với thiết kế phẳng, đẹp gi&uacute;p k&iacute;ch thước ph&iacute;m thon gọn hơn nhiều so với thế hệ cũ.</p>\r\n<figure class=\"image\"><img src=\"https://phongvu.vn/media/wysiwyg/65.Laptop_MacBook_MPXR2ZP.jpg\" alt=\"Laptop MacBook 13.3&quot; MPXR2ZP/A \" /></figure>\r\n<p>Cấu h&igrave;nh tr&ecirc;n Apple Macbook Pro 13 inch 128 GB MPXR2 ( 2017 ) được n&acirc;ng cấp mạnh gấp 2 lần so với thế hệ trước</p>\r\n<p>Cụ thể l&agrave; chip Intel Core i5 Dual-core 2.3 GHz, turbo Boost l&ecirc;n đến 3.6 GHz, card đồ họa Intel Graphics 640, sử dụng ổ cứng SSD si&ecirc;u nhanh 128GB, RAM 8GB. V&agrave; đ&acirc;y ch&iacute;nh l&agrave; cấu h&igrave;nh m&agrave; m&agrave; bất cứ d&acirc;n thiết kế đồ họa n&agrave;o cũng mong muốn.</p>\r\n<p>Apple Macbook Pro 13 inch 128 GB MPXR2 ( 2017 ) sử dụng cổng USB Type C thay v&igrave; cổng USB</p>\r\n<figure class=\"image\"><img src=\"https://phongvu.vn/media/wysiwyg/66.Laptop_MacBook_MPXR2ZP.jpg\" alt=\"Laptop MacBook 13.3&quot; MPXR2ZP/A \" /></figure>\r\n<p>Cổng n&agrave;y gi&uacute;p chuyển dữ liệu nhanh hơn nhiều, thử nghiệm cho tốc độ tới 10Gblit/s, một tốc độ m&agrave; kh&oacute; c&oacute; chuẩn USB n&agrave;o kh&aacute;c đạt được.</p>\r\n<p>Apple Macbook Pro 13 inch 128 GB MPXR2 ( 2017 ) kh&ocirc;ng sở hữu Touchbar v&agrave; Touch ID<br />Quả thực l&agrave; một điều đ&aacute;ng tiếc tr&ecirc;n chiếc Macbook Pro 13 inch MPXR2 2017 khi m&agrave; 2 t&iacute;nh năng tiện lợi với c&ocirc;ng nghệ m&agrave;n h&igrave;nh OLED, cảm biến v&acirc;n tay... được người d&ugrave;ng kh&aacute; ưa th&iacute;ch ra mắt v&agrave;o năm 2016 lại kh&ocirc;ng được t&iacute;ch hợp.</p>\r\n<p>Nếu bạn quan t&acirc;m đến t&iacute;nh năng n&agrave;y c&oacute; thể tham khảo th&ecirc;m về mẫu Macbook Pro 13 inch Touchbar 512GB MNQF2 (2016) để c&oacute; th&ocirc;ng tin nh&eacute;.</p>\r\n<figure class=\"image\"><img src=\"https://phongvu.vn/media/wysiwyg/67.Laptop_MacBook_MPXR2ZP.jpg\" alt=\"Laptop MacBook 13.3&quot; MPXR2ZP/A \" /></figure>\r\n<p>- CPU: Core i5 ( 2.3 GHz<br />- M&agrave;n h&igrave;nh: 13.3\" ( 2560 x 1600 ) , kh&ocirc;ng cảm ứng<br />- RAM: 8GB<br />- Đồ họa: Intel Iris Plus Graphics 640<br />- Lưu trữ: 128GB SSD<br />- Hệ điều h&agrave;nh: macOS<br />- Pin: Pin liền , khối lượng: 1.3 kg</p>', 1, 7, '2021-09-19 07:07:09', '2021-09-19 07:07:09', 'unnamed.webp', NULL, 5, 10),
(3, 'Laptop ASUS ROG Zephyrus S GX531GM', '54990000', '/storage/product/1/ScccGFLXK30gJD6vdjq9.webp', '<h2>Đ&aacute;nh gi&aacute; Laptop&nbsp;Asus ROG Zephyrus S&nbsp;GX531GM-ES004T</h2>\r\n<p><img src=\"https://vetinh.phongvu.vn/wp-content/uploads/2019/01/Screenshot_95.jpg\" alt=\"Đ&aacute;nh gi&aacute; Laptop&nbsp;Asus ROG Zephyrus S&nbsp;GX531GM-ES004T 1\" width=\"1902\" height=\"651\" /></p>\r\n<p>Kh&ocirc;ng qu&aacute; khi n&oacute;i rằng Asus ROG - Republic of Gamers l&agrave; một trong những thương hiệu h&agrave;ng đầu thế giới d&agrave;nh cho game thủ, cung cấp những sản phẩm h&agrave;ng đầu để phục vụ cho những y&ecirc;u cầu ng&agrave;y c&agrave;ng gia tăng, kh&ocirc;ng chỉ về sức mạnh điện to&aacute;n m&agrave; c&ograve;n t&iacute;nh thẩm mỹ với thiết kế RGB bắt mắt v&agrave; đầy c&aacute; t&iacute;nh. Asus ROG Zephyrus S&nbsp;GX531GM-ES004T l&agrave; d&ograve;ng m&aacute;y laptop hội tụ đầy đủ những điểm mạnh nhất của thương hiệu ROG với cấu h&igrave;nh cao cấp:&nbsp;<strong>i7-8750H</strong>,&nbsp;<strong>GTX 1060 6GB</strong>,&nbsp;<strong>512 GB SSD M.2 NVMe</strong>,&nbsp;<strong>16 GB RAM</strong>. Tất cả được t&iacute;ch hợp ho&agrave;n hảo trong khung m&aacute;y thanh tho&aacute;t c&ugrave;ng ng&ocirc;n ngữ m&agrave;u sắc đậm chất Republic of Gamers.</p>\r\n<p>Laptop&nbsp;Asus ROG Zephyrus phi&ecirc;n bản gốc&nbsp; ấn tượng mạnh mẽ với những ai lần đầu ti&ecirc;n bắt gặp bởi độ mỏng đ&aacute;ng kinh ngạc m&agrave; kh&ocirc;ng hề phải cắt giảm bất cứ linh kiện hay chi tiết n&agrave;o tr&ecirc;n cỗ m&aacute;y. Đến với ROG Zephyrus S&nbsp;GX531GM-ES004T, kế thừa mọi điều tốt đẹp nhất từ sản phẩm tiền nhiệm: viền bezel mỏng, th&acirc;n m&aacute;y mảnh mai nhưng kh&ocirc;ng k&eacute;m phần chắc chắn, cấu h&igrave;nh \"khủng\" đem tới hiệu năng gaming tối ưu c&ugrave;ng rất nhiều những n&acirc;ng cấp giải quyết mọi vấn đề m&agrave; phi&ecirc;n bản gốc sở hữu. Bằng c&aacute;ch giảm thiểu k&iacute;ch cỡ của viền m&agrave;n h&igrave;nh, Zephyrus S&nbsp;GX531GM-ES004T trở th&agrave;nh một trong những laptop hiếm hoi sở hữu m&agrave;n h&igrave;nh k&iacute;ch thước 15 inch trong khung m&aacute;y chỉ 14 inch, b&ecirc;n cạnh Dell XPS 15 v&agrave; Gigabyte Aero 15 X.</p>\r\n<p><img src=\"https://vetinh.phongvu.vn/wp-content/uploads/2019/01/Screenshot_96.jpg\" alt=\"Đ&aacute;nh gi&aacute; Laptop&nbsp;Asus ROG Zephyrus S&nbsp;GX531GM-ES004T 2\" width=\"1848\" height=\"739\" /></p>\r\n<p>Với k&iacute;ch thước&nbsp;30.6 x 26.8 x 1.49-1.57cm, Laptop Asus ROG&nbsp;Zephyrus S&nbsp;GX531GM-ES004T,&nbsp; gọn g&agrave;ng hơn so với Zephyrus phi&ecirc;n bản gốc (với k&iacute;ch thước&nbsp;&nbsp;37.9 x 26.2 x 1.69-1.79cm), trong khi khối lượng cũng được gọt bỏ mặc d&ugrave; kh&ocirc;ng đ&aacute;ng kể ( 2.2 kg giảm xuống c&ograve;n 2.1 kg). Để đạt được những th&ocirc;ng số ấn tượng về thiết kế như vậy, to&agrave;n bộ viền bezel đ&atilde; được ti&ecirc;u giảm một nửa về k&iacute;ch thước, chỉ c&ograve;n c&oacute; 7.5mm so với 15.7mm trước kia. Mặc d&ugrave; Laptop Zephyrus S&nbsp;GX531GM-ES004T vẫn chỉ được trang bị m&agrave;n h&igrave;nh 15.6 inch&nbsp; c&oacute; độ ph&acirc;n giải 1080p, Asus đ&atilde; n&acirc;ng cầm sản phẩm cao cấp của m&igrave;nh với tần số qu&eacute;t 144Hz c&ugrave;ng thời gian phản hồi 3ms si&ecirc;u tốc, phục vụ đặc biệt cho gamer chuộng những tựa game tốc độ cao. Độ chuẩn m&agrave;u đạt 100% sRGB cũng chứng minh gi&aacute; trị của m&igrave;nh khi người d&ugrave;ng c&oacute; thể sử dụng Zephyrus S cho mục đ&iacute;ch s&aacute;ng tạo nội dung một c&aacute;ch hiệu quả.</p>\r\n<p><img src=\"https://vetinh.phongvu.vn/wp-content/uploads/2019/01/Screenshot_97.jpg\" alt=\"Đ&aacute;nh gi&aacute; Laptop&nbsp;Asus ROG Zephyrus S&nbsp;GX531GM-ES004T 3\" width=\"1698\" height=\"712\" /></p>\r\n<p>Asus ROG Zephyrus S vẫn được ho&agrave;n thiện một c&aacute;ch ấn tượng. To&agrave;n bộ khung m&aacute;y kết cấu từ hợp kim aluminium-magnesium đem đến cho chiếc laptop n&agrave;y ưu điểm vượt trội về khối lượng, kết cấu bền vững trước va đập v&agrave; l&agrave; một h&igrave;nh thức tản nhiệt thụ động hiệu quả - yếu tố quan trọng nhất nh&igrave; khi quyết định một chiếc laptop gaming c&oacute; thể đạt hiệu năng tối đa hay kh&ocirc;ng. Kết hợp với qu&aacute; tr&igrave;nh CNC - sử dụng m&aacute;y t&iacute;nh để tạo n&ecirc;n khung m&aacute;y chuẩn x&aacute;c tới từng milimet, gi&uacute;p cho sự c&acirc;n đối trong ngoại h&igrave;nh của Laptop Asus ROG Zephyrus S&nbsp;GX531GM-ES004T.</p>\r\n<p><img src=\"https://vetinh.phongvu.vn/wp-content/uploads/2019/01/Screenshot_98.jpg\" alt=\"Đ&aacute;nh gi&aacute; Laptop&nbsp;Asus ROG Zephyrus S&nbsp;GX531GM-ES004T 4\" width=\"1897\" height=\"552\" /></p>\r\n<p>Với bản lề gồm 2 chốt nối dạng cabin ph&ograve;ng bếp gắn với thanh kim loại chữ nhật phẳng, Zephyrus S l&agrave; h&igrave;nh b&oacute;ng kết hợp giữa Alienware 15 v&agrave; HP Spectre 13. Ngoại thất g&oacute;c cạnh v&agrave; được phủ một m&agrave;u đen tuyền kết hợp với những đường cắt &aacute;nh n&acirc;u đồng đem lại &acirc;m hưởng tương lai trong thiết kế của Asus Zephyrus S&nbsp;GX531GM-ES004T, một vẻ đẹp hiện đại v&agrave; tối giản giống như đối thủ MSI GS65 Stealth Thin trong c&ugrave;ng ph&acirc;n kh&uacute;c laptop gaming cao cấp. Tuy nhi&ecirc;n kh&aacute;c với Stealth Thin, Zephyrus S được trang bị khả năng \"cất c&aacute;nh\" ấn tượng. Mở nắp m&agrave;n h&igrave;nh của chiếc laptop ROG n&agrave;y, cơ chế cơ học được c&agrave;i đặt khiến cho phần gầm m&aacute;y n&acirc;ng l&ecirc;n 5mm, cung cấp airflow tản nhiệt tốt hơn tới 22% so với th&ocirc;ng thường.</p>\r\n<p>Như đ&atilde; nhắc đến, n&oacute;i đến Asus ROG l&agrave; n&oacute;i đến khả năng t&iacute;ch hợp hệ thống đ&egrave;n RGB tuyệt đẹp của h&atilde;ng.&nbsp;Asus Zephyrus S&nbsp;GX531GM-ES004T kh&ocirc;ng phải l&agrave; ngoại lệ khi to&agrave;n bộ b&agrave;n ph&iacute;m được trang bị hệ thống backlit RGB ấn tượng với tuổi thọ l&ecirc;n tới 20 triệu lần nhấn, c&oacute; khả năng ph&aacute;t s&aacute;ng ri&ecirc;ng biệt, c&oacute; thể được điều chỉnh th&ocirc;ng qua phần mềm ROG Amoury Crate. Kh&ocirc;ng giống như những laptop phổ th&ocirc;ng, Zephyrus S hi sinh diện t&iacute;ch k&ecirc; tay để gia tăng khả năng tản nhiệt cho linh kiện, to&agrave;n bộ c&aacute;c ph&iacute;m được dịch chuyển xuống trong khi touchpad được đặt tại vị tr&iacute; ngo&agrave;i cũng b&ecirc;n phải của khung m&aacute;y. Tuy nhi&ecirc;n thiết kế n&agrave;y mang lại cảm gi&aacute;c tương đối mới lạ v&agrave; thuận tay cho người d&ugrave;ng tay phải. Touchpad c&oacute; khả năng biến đổi th&agrave;nh cụm ph&iacute;m số Numpad th&ocirc;ng qua ph&iacute;m chức năng chuy&ecirc;n biệt - điểm tương đồng giữa d&ograve;ng m&aacute;y gaming Zephyrus S v&agrave; d&ograve;ng doanh nh&acirc;n Zenbook.</p>\r\n<p><img src=\"https://vetinh.phongvu.vn/wp-content/uploads/2019/01/laptop_asus_tuf_gaming_gx531gm_4.jpg\" alt=\"Đ&aacute;nh gi&aacute; Laptop&nbsp;Asus ROG Zephyrus S&nbsp;GX531GM-ES004T 6\" width=\"1180\" height=\"750\" /></p>\r\n<p>Hiển nhi&ecirc;n với một chiếc laptop gaming cao cấp, ch&uacute;ng ta mong chờ hiệu năng tuyệt vời của một cỗ m&aacute;y c&oacute; khả năng th&aacute;ch thức mọi tựa game đang được ưa chuộng nhất hiện nay. Trang bị b&ecirc;n trong chiếc laptop&nbsp;Asus ROG Zephyrus S&nbsp;GX531GM-ES004T&nbsp; l&agrave; bộ vi xử l&yacute; được ưa chuộng nhất tr&ecirc;n những d&ograve;ng m&aacute;y cao cấp i7-8750H. C&ugrave;ng với GTX 1060 6GB, người d&ugrave;ng c&oacute; thể tin tưởng rằng Zephyrus S c&oacute; thể thực hiện tốt gần như tất cả những tựa game đang được ưa chuộng nhất hiện nay. Trong những b&agrave;i benchmark 3D Mark Firestrike v&agrave; 3D Mark Ice Storm Unlimited, Zephyrus S thể hiện hiệu năng rất ấn tượng, khi đem so s&aacute;nh với MSI GS65 Stealth Thin v&agrave; Origin EVOS15-S c&oacute; c&ugrave;ng cấu h&igrave;nh.</p>\r\n<p><img src=\"https://vetinh.phongvu.vn/wp-content/uploads/2019/01/Screenshot_94-Copy.jpg\" alt=\"Đ&aacute;nh gi&aacute; Laptop&nbsp;Asus ROG Zephyrus S&nbsp;GX531GM-ES004T 6\" width=\"670\" height=\"319\" />&nbsp;<img src=\"https://vetinh.phongvu.vn/wp-content/uploads/2019/01/Screenshot_93-Copy.jpg\" alt=\"Đ&aacute;nh gi&aacute; Laptop&nbsp;Asus ROG Zephyrus S&nbsp;GX531GM-ES004T 7\" width=\"671\" height=\"317\" /></p>\r\n<p>Th&ecirc;m v&agrave;o đ&oacute;, với 16GB RAM v&agrave; 512GB SSD M.2 NVMe, việc mở 40 tab tr&igrave;nh duyệt Chrome trong khi chơi game Shadow of the Tomb Raider cũng như sử dụng những chương tr&igrave;nh đồ họa như Photoshop, Lightroom hay Illustrator v&agrave; khởi động c&aacute;c chương tr&igrave;nh với tốc độ cao chỉ l&agrave; chuyện nhỏ.</p>\r\n<p>Trong b&agrave;i kiểm tra thời lượng sử dụng của pin,&nbsp;Asus ROG Zephyrus S&nbsp;GX531GM-ES004T c&oacute; thể l&agrave;m việc li&ecirc;n tục 3 giờ 33 ph&uacute;t với độ s&aacute;ng m&agrave;n h&igrave;nh ở mức 150 nits v&agrave; lướt web qua Wifi. Dẫu kh&ocirc;ng được l&acirc;u bằng&nbsp;Alienware 15 (5:15), Stealth Thin (5:40) v&agrave; Razer Blade 15 (5:54) nhưng con số n&oacute;i tr&ecirc;n cũng đ&atilde; l&agrave; tương đối ấn tượng với một chiếc laptop gaming.</p>', 1, 6, '2021-09-19 07:17:09', '2021-09-19 07:17:09', 'unnamed (1).webp', NULL, 35, 23),
(4, 'Laptop Dell Inspiron 3476-8J61P1', '10490000', '/storage/product/1/BmJiVnG1YN2p3AtMFTBC.webp', '<div class=\"css-1r9sqj6\">\n<div class=\"css-wc2pnn\">M&ocirc; tả sản phẩm</div>\n</div>\n<div class=\"css-cssveg\">\n<div class=\"css-uktlk8\">\n<div class=\"css-1efhh9k\">\n<div class=\"card-body css-0\">\n<div class=\"css-111s35w\">\n<div class=\"flex-box caption\">\n<div class=\"article-wrap onDetails\">\n<h2 class=\"post-title\">Đ&aacute;nh gi&aacute; Laptop Dell Inspiron 14-3476 (i3-8130U)</h2>\n</div>\n</div>\n<div class=\"image-holder\"><img class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" src=\"https://vetinh.phongvu.vn/wp-content/uploads/2018/11/2_30_4.jpg\" alt=\"\" width=\"1180\" height=\"750\" /></div>\n<div class=\"post-detail\">\n<p><strong>Tuy l&agrave; một chiếc laptop đời cũ, kh&ocirc;ng sở hữu ngoại h&igrave;nh &ldquo;si&ecirc;u mẫu&rdquo; như những ultrabook hiện nay của h&atilde;ng nhưng&nbsp;<a href=\"http://bit.ly/2DVhBoe\" target=\"_blank\" rel=\"noopener external noreferrer\" data-wpel-link=\"external\">Dell Inspiron 14-3476</a>&nbsp;vẫn đủ để thu h&uacute;t người d&ugrave;ng với vỏ nhựa đen tuyền nhẹ lịch l&atilde;m, đi k&egrave;m đ&oacute; l&agrave; 1 cấu h&igrave;nh tốt. Mẫu laptop n&agrave;y c&oacute; thể l&agrave; một lựa chọn hấp dẫn ở ph&acirc;n kh&uacute;c tầm trung-thấp gi&aacute; rẻ (chỉ khoảng 10 triệu Đồng).</strong></p>\n<h3>Thiết kế</h3>\n<p>Dell Inspiron 3476 sở hữu những n&eacute;t thiết kế đặc trưng của Dell với vẻ ngo&agrave;i đơn giản v&agrave; cứng c&aacute;p khi m&aacute;y được chế tạo chủ yếu từ nhựa, c&aacute;c chi tiết của m&aacute;y được chế tạo tỉ mỉ, từng g&oacute;c cạnh được bo tr&ograve;n hợp l&yacute; cho ph&eacute;p người d&ugrave;ng dễ d&agrave;ng cầm nắm.&nbsp;Vỏ nhựa da sần&nbsp;gi&uacute;p m&aacute;y chống được dấu v&acirc;n tay, bụi bẩn v&agrave; tạo cảm gi&aacute;c sang trọng. M&agrave;u đen tuyền cho thấy sự mạnh mẽ, nổi bật đầy ấn tượng.</p>\n<p><img class=\"aligncenter wp-image-4833 size-full\" src=\"https://vetinh.phongvu.vn/wp-content/uploads/2018/11/7_11_4.jpg\" alt=\"thiet ke Dell Inspiron 14-3476\" width=\"1180\" height=\"750\" /></p>\n<p>Dell Inspiron 3476&nbsp;được x&acirc;y dựng bền vững với những khớp nối v&agrave; bản lề vững chắc, cho m&aacute;y độ bền v&agrave; khả năng chống va đập cao.</p>\n<p>Thực tế, chiếc laptop 14 inch của Dell tr&ocirc;ng kh&aacute; lớn khi đặt cạnh một số mẫu laptop 14 inch kh&aacute;c do khu vực b&agrave;n ph&iacute;m v&agrave; touchpad rộng r&atilde;i. Tuy vậy, m&aacute;y vẫn đủ mỏng nhẹ để c&oacute; thể dễ d&agrave;ng mang theo b&ecirc;n m&igrave;nh m&agrave; kh&ocirc;ng g&acirc;y qu&aacute; nhiều kh&oacute; khăn cho người d&ugrave;ng nhờ trọng lượng chỉ 2,02 kg v&agrave; độ mỏng 21,6 mm.</p>\n<p><img class=\"aligncenter wp-image-4835 size-full\" src=\"https://vetinh.phongvu.vn/wp-content/uploads/2018/11/laptop-dell-inspiron-14-3476-8j61p11.jpeg\" alt=\"thiet ke Dell Inspiron 14-3476 2\" width=\"500\" height=\"356\" /></p>\n<p>Về c&ocirc;ng kết nối,&nbsp;ngo&agrave;i c&aacute;c cổng th&ocirc;ng dụng nhất hiện nay tr&ecirc;n hầu hết mọi thiết bị laptop phổ th&ocirc;ng như USB 2.0, HDMI, c&aacute;p ethernet, jack audio 3.5mm,&nbsp;Dell Inspiron 14-3476&nbsp;vừa t&iacute;ch hợp th&ecirc;m c&aacute;c chuẩn kết nối mới như cổng USB 3.1 Type-C vừa giữ lại những chuẩn cũ cần thiết với nhiều người d&ugrave;ng, đ&oacute; l&agrave; ổ DVD-rom. Với khả năng đọc và ghi đĩa, n&oacute; tỏ ra khá hữu ích cho những người thường xuy&ecirc;n phải cài đặt các ph&acirc;̀n m&ecirc;̀m bản quy&ecirc;̀n, hay những cá nh&acirc;n học ngoại ngữ qua đĩa. C&aacute;c laptop hiện nay thường kh&ocirc;ng c&ograve;n t&iacute;ch hợp loại ổ đĩa n&agrave;y nữa.<br /><img class=\"aligncenter wp-image-4837 size-full\" src=\"https://vetinh.phongvu.vn/wp-content/uploads/2018/11/dell-inspiron-14-3476-c4i51121-black.jpg\" alt=\"thiet ke Dell Inspiron 14-3476 3\" width=\"600\" height=\"442\" /></p>\n<h3>B&agrave;n ph&iacute;m v&agrave; Touchpad<img class=\"aligncenter wp-image-4839 size-full\" src=\"https://vetinh.phongvu.vn/wp-content/uploads/2018/11/4_22_4.jpg\" alt=\"ban phim Dell Inspiron 14-3476\" width=\"1180\" height=\"750\" /></h3>\n<p>Trung th&agrave;nh với kiểu b&agrave;n ph&iacute;m chiclet tho&aacute;ng đ&atilde;ng v&agrave; bắt mắt phổ biến tr&ecirc;n hầu hết laptop hiện nay, b&agrave;n ph&iacute;m của Dell Inspiron 14-3476 c&oacute; dạng full size kh&aacute; giản dị với c&aacute;c ph&iacute;m bấm c&oacute; k&iacute;ch thước lớn, bề mặt nhẵn c&ugrave;ng khoảng c&aacute;ch ph&iacute;m hợp l&yacute;. Phần b&agrave;n ph&iacute;m c&ograve;n được trang bị hệ thống đ&egrave;n nền gi&uacute;p mang lại sự thuận tiện khi l&agrave;m việc trong điều kiện thiếu s&aacute;ng.</p>\n<p>Tuy nhi&ecirc;n, c&oacute; lẽ để đảm bảo độ mỏng cho phần th&acirc;n m&aacute;y, NSX đ&atilde; buộc phải hi sinh đi độ s&acirc;u của phần b&agrave;n ph&iacute;m khiến việc g&otilde; ph&iacute;m hơi cấn tay, độ nảy thấp v&agrave; rất dễ bị d&iacute;nh chữ. V&igrave; vậy, bạn sẽ phải mất kha kh&aacute; thời gian mới c&oacute; thể l&agrave;m quen với b&agrave;n ph&iacute;m tr&ecirc;n chiếc laptop n&agrave;y. Th&ecirc;m v&agrave;o đ&oacute;, c&aacute;c ph&iacute;m điều hướng l&ecirc;n, xuống, tr&aacute;i, phải c&oacute; k&iacute;ch thước kh&aacute; nhỏ, lại được đặt s&aacute;t nhau n&ecirc;n cũng g&acirc;y kh&ocirc;ng &iacute;t kh&oacute; khăn trong qu&aacute; tr&igrave;nh sử dụng.</p>\n<p><img class=\"aligncenter wp-image-4841 size-full\" src=\"https://vetinh.phongvu.vn/wp-content/uploads/2018/11/aHR0cDovL2Nkbi5sYXB0b3BtYWcuY29tL2ltYWdlcy91cGxvYWRzL3BwcmVzcy80NTM3OC9pbnNwaXJvbi0xNC0zMDAwLWtleWJvYXJkLmpwZw.jpg\" alt=\"touchpad Dell Inspiron 14-3476\" width=\"775\" height=\"500\" /></p>\n<p>Touchpad&nbsp;tr&ecirc;n&nbsp;Dell Inspiron 14 3476&nbsp;đ&atilde; được cải tiến đ&aacute;ng kể với độ rộng được cải thiện v&agrave; c&aacute;c thao t&aacute;c được hỗ trợ đầy đủ, thực hiện rất ch&iacute;nh x&aacute;c, thoải m&aacute;i hơn rất nhiều,&nbsp;bề mặt touchpad phủ lớp cao su trơn mịn gi&uacute;p chống trơn trượt, độ nhạy cao, chống b&aacute;m mồ h&ocirc;i rất tốt. Tuy nhi&ecirc;n, do click tr&aacute;i/ phải được thiết kế liền 1 khối c&ugrave;ng touchpad, tuy gi&uacute;p r&ecirc; tay thoải m&aacute;i hơn nhưng người d&ugrave;ng mới bắt đầu c&oacute; thể sẽ gặp vấn đề khi cố x&aacute;c định ch&iacute;nh x&aacute;c vị tr&iacute; của ch&uacute;ng.</p>\n<h3>M&agrave;n h&igrave;nh</h3>\n<p><img class=\"aligncenter wp-image-4843 size-full\" src=\"https://vetinh.phongvu.vn/wp-content/uploads/2018/11/13688-8j61p1.jpg\" alt=\"man hinh Dell Inspiron 14-3476\" width=\"600\" height=\"400\" /></p>\n<p>Laptop Dell Inspiron 14-3476 được trang bị m&agrave;n h&igrave;nh 14 inch độ ph&acirc;n giải HD (1366 x 768). Loại m&agrave;n h&igrave;nh của Inspiron 3476 sử dụng l&agrave; m&agrave;n h&igrave;nh gương, do vậy&nbsp;kh&ocirc;ng thể tr&aacute;nh khỏi những hiện tượng b&oacute;ng v&agrave; l&oacute;a khi ta l&agrave;m việc ngo&agrave;i trời hay dưới &aacute;nh s&aacute;ng mạnh chiếu trực tiếp v&agrave;o m&agrave;n h&igrave;nh.</p>\n<p>M&agrave;n h&igrave;nh m&aacute;y được l&agrave;m l&otilde;m hơn so với bề mặt tiếp x&uacute;c, đ&acirc;y l&agrave; điểm nhấn cho việc giảm tiếp x&uacute;c với b&agrave;n ph&iacute;m, &iacute;t g&acirc;y xước trong qu&aacute; tr&igrave;nh gấp m&aacute;y lại l&acirc;u d&agrave;i.</p>\n<p><img class=\"aligncenter wp-image-4846 size-full\" src=\"https://vetinh.phongvu.vn/wp-content/uploads/2018/11/1343589.jpg\" alt=\"man hinh Dell Inspiron 14-3476 2\" width=\"635\" height=\"393\" /></p>\n<p>Do sử dụng tấm nền c&ocirc;ng nghệ TN, việc&nbsp;<a class=\"linkify\" title=\"m&agrave;n h&igrave;nh\" href=\"https://phongvu.vn/man-hinh-may-tinh.cat\" target=\"_blank\" rel=\"author noopener external noreferrer\" data-wpel-link=\"external\">m&agrave;n h&igrave;nh</a>&nbsp;của m&aacute;y cho g&oacute;c nh&igrave;n hẹp v&agrave; m&agrave;u sắc cũng kh&aacute; nhợt nhạt, khi nh&igrave;n từ c&aacute;c ph&iacute;a th&igrave; thậm ch&iacute; c&ograve;n tệ hơn. Theo kết quả đo được, n&oacute; chỉ c&oacute; khả năng bao phủ 51% dải m&agrave;u sRGB.&nbsp;C&ugrave;ng với đ&oacute;, độ s&aacute;ng của m&agrave;n h&igrave;nh cũng tương đối thấp, c&aacute;c văn bản v&agrave; chữ viết khi hiển thị kh&ocirc;ng thật sự sắc n&eacute;t v&agrave; chi tiết v&igrave; độ ph&acirc;n giải kh&ocirc;ng cao.</p>\n<p>Tuy nhi&ecirc;n, kh&ocirc;ng phải v&igrave; những yếu điểm tr&ecirc;n m&agrave; ch&uacute;ng t&ocirc;i đ&aacute;nh gi&aacute; thấp&nbsp;<a class=\"linkify\" title=\"m&agrave;n h&igrave;nh\" href=\"https://phongvu.vn/man-hinh-may-tinh.cat\" target=\"_blank\" rel=\"author noopener external noreferrer\" data-wpel-link=\"external\">m&agrave;n h&igrave;nh</a>&nbsp;của chiếc&nbsp;<a class=\"linkify\" title=\"laptop\" href=\"https://phongvu.vn/laptop.cat\" target=\"_blank\" rel=\"author noopener external noreferrer\" data-wpel-link=\"external\">laptop</a>&nbsp;n&agrave;y. Thay v&igrave; phải đầu tư qu&aacute; nhiều cho một chiếc&nbsp;<a class=\"linkify\" title=\"m&agrave;n h&igrave;nh\" href=\"https://phongvu.vn/man-hinh-may-tinh.cat\" target=\"_blank\" rel=\"author noopener external noreferrer\" data-wpel-link=\"external\">m&agrave;n h&igrave;nh</a>&nbsp;c&oacute; khả năng t&aacute;i tạo v&agrave; thể hiện m&agrave;u sắc tốt (qu&aacute; đắt khiến m&aacute;y bị đội gi&aacute;),&nbsp;<a class=\"linkify\" title=\"Dell\" href=\"https://phongvu.vn/laptop/laptop-dell.cat\" target=\"_blank\" rel=\"author noopener external noreferrer\" data-wpel-link=\"external\">Dell</a>&nbsp;đ&atilde; đưa v&agrave;o chiếc&nbsp;<a class=\"linkify\" title=\"laptop\" href=\"https://phongvu.vn/laptop.cat\" target=\"_blank\" rel=\"author noopener external noreferrer\" data-wpel-link=\"external\">laptop</a>&nbsp;n&agrave;y những c&ocirc;ng nghệ bảo vệ mắt, th&acirc;n thiện với người d&ugrave;ng như giảm &aacute;nh s&aacute;ng xanh, kh&ocirc;ng flicker (kh&ocirc;ng sử dụng PWM g&acirc;y nh&aacute;y m&agrave;n),&hellip;</p>\n<h3>Hiệu năng</h3>\n<p>Dell Inspiron 14-3476 được trang bị bộ vi xử l&yacute; Intel Core i3-8130U (2 nh&acirc;n 4 luồng) tốc độ 2.2 GHz, cho khả năng xử l&yacute; nhanh v&agrave; tiết kiệm năng lượng hơn c&aacute;c thế hệ vi xử l&yacute; trước. Bộ nhớ RAM DDR4 dung lượng 4 GB tốc độ bus đạt 2400 MHz cũng vừa đủ để đ&aacute;p ứng c&aacute;c nhu cầu học tập, l&agrave;m việc văn ph&ograve;ng hay giải tr&iacute; th&ocirc;ng thường.</p>\n<p>Dell Inspiron 3476 kh&ocirc;ng c&oacute; card đồ hoạ rời m&agrave; chỉ d&ugrave;ng GPU t&iacute;ch hợp Intel UHD 620, c&oacute; nghĩa rằng n&oacute; chỉ c&oacute; thể chơi được 1 số game online nhẹ hiện nay th&ocirc;i chứ kh&ocirc;ng thể chiến được c&aacute;c game offline nặng. K&egrave;m theo ổ cứng&nbsp;HDD&nbsp;l&ecirc;n đến&nbsp;1TB&nbsp;gi&uacute;p lưu trữ được nhiều dữ liệu v&agrave; game hơn.<img class=\"aligncenter wp-image-2879 size-full\" src=\"https://vetinh.phongvu.vn/wp-content/uploads/2018/10/test-game-lien-minh-tren-dell-inspiron-3567.jpg\" alt=\"hieu nang Dell Inspiron 14-3476 1\" width=\"1200\" height=\"675\" /></p>\n<p>M&igrave;nh sẽ test qua tựa game online phổ biến nhất nh&igrave; hiện nay l&agrave; Li&ecirc;n Minh Huyền Thoại &ndash; m&igrave;nh sẽ bật Full Setting với đồ họa cao nhất v&agrave; đo được như sau: khung h&igrave;nh FPS lu&ocirc;n dao động khoảng 60, l&uacute;c combat đ&ocirc;ng th&igrave; hạ xuống c&ograve;n 50, kh&ocirc;ng xảy ra bất cứ hiện tượng giật, lag n&agrave;o.</p>\n<p>Với c&aacute;c ứng dụng văn ph&ograve;ng, kh&ocirc;ng qu&aacute; kh&oacute; để m&aacute;y c&oacute; thể vận h&agrave;nh một c&aacute;ch nhanh ch&oacute;ng. Trải nghiệm thực tế: M&aacute;y chưa đến&nbsp;3 gi&acirc;y&nbsp;để mở 1 file c&oacute; định dạng&nbsp;Powerpoint&nbsp;tr&igrave;nh chiếu c&oacute; dung lượng khoảng&nbsp;2 MB, cũng mất thời gian tương tự với file thống k&ecirc; c&oacute; định dạng&nbsp;Excel&nbsp;chứa rất nhiều lệnh v&agrave; h&agrave;m số t&iacute;nh to&aacute;n.</p>\n<p><img class=\"aligncenter wp-image-4848 size-full\" src=\"https://vetinh.phongvu.vn/wp-content/uploads/2018/11/dell-inspiron-3467-i3-7100u-m20nr21-do-hoa.jpg\" alt=\"hieu nang Dell Inspiron 14-3476 2\" width=\"640\" height=\"400\" /></p>\n<p>Trải nghiệm thực tế với 2 phần mềm xử l&yacute; đồ hoạ nhẹ l&agrave; Photoshop CS5 v&agrave; AutoCad 2015: Thao t&aacute;c thiết kế, xử l&yacute; qua lại giữa hai ứng dụng kh&aacute; mượt m&agrave;, kh&ocirc;ng thấy xuất hiện t&igrave;nh trạng giật hay &rdquo;lag&rdquo;.</p>\n<p>Như vậy, c&oacute; thể thấy, laptop Dell Inspiron 14-3476 đ&aacute;p ứng rất tốt c&aacute;c nhu cầu l&agrave;m việc căn bản của người d&ugrave;ng.</p>\n<h3>Thời lượng pin</h3>\n<p><img class=\"aligncenter wp-image-2880 size-full\" src=\"https://vetinh.phongvu.vn/wp-content/uploads/2018/10/dell-inspiron-f3576-70153188-tien-it-hit-hang-ngon-10.jpg\" alt=\"pin\" width=\"680\" height=\"123\" /></p>\n<p><img class=\"aligncenter wp-image-2881 size-full\" src=\"https://vetinh.phongvu.vn/wp-content/uploads/2018/10/dell-inspiron-f3576-70153188-tien-it-hit-hang-ngon-9.jpg\" alt=\"pin 2\" width=\"680\" height=\"454\" /></p>\n<p>Dung lượng pin của&nbsp;<a class=\"linkify\" title=\"Dell\" href=\"https://phongvu.vn/laptop/laptop-dell.cat\" target=\"_blank\" rel=\"author noopener external noreferrer\" data-wpel-link=\"external\">Dell</a>&nbsp;Inspiron 3476 kh&aacute; nhỏ so với mặt bằng chung&nbsp;<a class=\"linkify\" title=\"laptop\" href=\"https://phongvu.vn/laptop.cat\" target=\"_blank\" rel=\"author noopener external noreferrer\" data-wpel-link=\"external\">laptop</a>&nbsp;hiện nay. Chiếc&nbsp;<a class=\"linkify\" title=\"laptop\" href=\"https://phongvu.vn/laptop.cat\" target=\"_blank\" rel=\"author noopener external noreferrer\" data-wpel-link=\"external\">laptop</a>&nbsp;n&agrave;y chỉ được trang bị vi&ecirc;n pin dung lượng 40Wh, dạng 4 cell. Tuy vậy, x&eacute;t đến phần cứng &ldquo;ăn điện&rdquo; nhất được trang bị b&ecirc;n trong m&aacute;y, đ&oacute; l&agrave; CPU i3-8130U cũng thuộc loại rất tiết kiệm điện, m&aacute;y cũng kh&ocirc;ng trang bị card rời. Do đ&oacute; vi&ecirc;n pin của m&aacute;y ho&agrave;n to&agrave;n c&oacute; thể gi&uacute;p chiếc&nbsp;<a class=\"linkify\" title=\"laptop\" href=\"https://phongvu.vn/laptop.cat\" target=\"_blank\" rel=\"author noopener external noreferrer\" data-wpel-link=\"external\">laptop</a>&nbsp;n&agrave;y hoạt động tốt trong thời gian kh&aacute; d&agrave;i.</p>\n<p>Thực hiện thử nghiệm,&nbsp;ch&uacute;ng t&ocirc;i thiết lập cho Dell Inspiron 14-3476 sử dụng chế độ năng lượng Balanced trong Windows 7, độ s&aacute;ng m&agrave;n h&igrave;nh ở mức khoảng 70%, &acirc;m lượng 70%, tắt kết nối Wifi v&agrave; cho ph&aacute;t li&ecirc;n tục một bộ phim Full HD. Thời gian ghi nhận được từ l&uacute;c m&aacute;y đầy 100% pin đến khi m&aacute;y b&aacute;o c&ograve;n 10% pin l&agrave; 5 giờ 37 ph&uacute;t.</p>\n<p>Ngo&agrave;i ra, bộ phần mềm đi k&egrave;m Dell Power Manager Lite t&iacute;ch hợp sẵn trong Inspiron 3476 cũng mang tới nhiều t&ugrave;y chọn tinh chỉnh lại hệ thống để đạt mức pin tốt hơn nữa, cũng như bảo vệ cho pin để tr&aacute;nh t&iacute;nh trạng pin nhanh chai khi người d&ugrave;ng li&ecirc;n tục cắm sạc trong thời gian d&agrave;i.<img class=\"aligncenter wp-image-4853 size-full\" src=\"https://vetinh.phongvu.vn/wp-content/uploads/2018/11/Pin_Dell_Inspiron_14_54475.jpg\" alt=\"pin 3\" width=\"490\" height=\"282\" /></p>\n<h2>&Acirc;m thanh&nbsp;</h2>\n<p>Phần &acirc;m thanh dưới sự hỗ trợ đắc lực của c&ocirc;ng nghệ Waves MaxxAudio 4.0 tr&ecirc;n Dell Inspiron 14-3476 mang tới chất &acirc;m tương đối ấn tượng. &Acirc;m thanh trong trẻo, r&otilde; r&agrave;ng v&agrave; kh&ocirc;ng hề c&oacute; bất cứ hiện tượng r&egrave; hay m&eacute;o tiếng n&agrave;o xảy kể cả khi vặn lớn tối đa. Tiếng bass trầm ấm tuy vẫn c&ograve;n hơi thiếu độ s&acirc;u, trong khi tiếng treble vừa phải v&agrave; kh&ocirc;ng bị ch&oacute;i gắt. &Acirc;m lượng của đ&ocirc;i loa cũng đủ lớn để lấp đầy một căn ph&ograve;ng từ 30 đến 40 m&eacute;t vu&ocirc;ng.</p>\n<p><img class=\"aligncenter wp-image-4854 size-full\" src=\"https://vetinh.phongvu.vn/wp-content/uploads/2018/11/1343601.jpg\" alt=\"am thanh Dell Inspiron 14-3476\" width=\"640\" height=\"427\" /></p>\n<p>Bộ loa của Dell Inspiron 14-3476 được bố tr&iacute; ph&iacute;a mặt dưới m&aacute;y. Nhờ vậy, &acirc;m thanh lan tỏa tốt hơn khi được đặt l&ecirc;n mặt b&agrave;n v&agrave; tạo ra tiếng bass ấm hơn.</p>\n<h3>Khả năng tản nhiệt</h3>\n<p id=\"aui_3_2_0_1144\">C&aacute;c khe tản nhiệt của Dell Inspiron 3476 được bố tr&iacute; ở phần cạnh tr&aacute;i n&ecirc;n khi đặt chiếc laptop n&agrave;y l&ecirc;n b&agrave;n để sử dụng bạn sẽ cảm thấy hơi n&oacute;ng tho&aacute;t ra sau một thời gian sử dụng b&agrave;n ph&iacute;m. Tuy nhi&ecirc;n, nếu l&agrave; người hay đặt laptop l&ecirc;n đ&ugrave;i hay l&ecirc;n c&aacute;c bề mặt tản nhiệt k&eacute;m th&igrave; kiểu tản nhiệt b&ecirc;n cạnh tr&aacute;i n&agrave;y lại 1 lợi thế của chiếc laptop n&agrave;y, khi n&oacute; gi&uacute;p cho m&aacute;y kh&ocirc;ng bao giờ qu&aacute; n&oacute;ng.</p>\n<img class=\"wp-image-4855 size-full\" src=\"https://vetinh.phongvu.vn/wp-content/uploads/2018/11/aHR0cDovL2Nkbi5sYXB0b3BtYWcuY29tL2ltYWdlcy91cGxvYWRzL3BwcmVzcy80NTM3OC9pbnNwaXJvbi0xNC0zMDAwLWxlZnQtc2lkZS5qcGc.jpg\" alt=\"tan nhiet Dell Inspiron 14-3476\" width=\"775\" height=\"500\" />Khu vực khe tản nhiệt được đặt b&ecirc;n cạnh tr&aacute;i m&aacute;y\n<h3>Kết luận</h3>\n<p>Sinh ra với số phận l&agrave;m&nbsp;<a class=\"linkify\" title=\"laptop\" href=\"https://phongvu.vn/laptop.cat\" target=\"_blank\" rel=\"author noopener external noreferrer\" data-wpel-link=\"external\">laptop</a>&nbsp;tầm trung-thấp, lẽ tất nhi&ecirc;n ch&uacute;ng ta kh&ocirc;ng thể tr&ocirc;ng đợi g&igrave; nhiều hơn ở&nbsp;<a class=\"linkify\" title=\"Dell\" href=\"https://phongvu.vn/laptop/laptop-dell.cat\" target=\"_blank\" rel=\"author noopener external noreferrer\" data-wpel-link=\"external\">Dell</a>&nbsp;Inspiron 14-3476 (i3-8130U).&nbsp;Với cấu h&igrave;nh như tr&ecirc;n m&aacute;y rất ph&ugrave; hợp cho: Sinh vi&ecirc;n, gi&aacute;o vi&ecirc;n, nh&acirc;n vi&ecirc;n văn ph&ograve;ng với c&aacute;c nhu cầu giải tr&iacute;, nghe nhạc, l&agrave;m văn ph&ograve;ng, lướt web, khả năng tr&igrave;nh chiếu&hellip; Lưu &yacute; đ&acirc;y kh&ocirc;ng phải l&agrave; sản phẩm ph&ugrave; hợp cho c&aacute;c nhu cầu về đồ họa mạnh, chuy&ecirc;n game, bạn h&atilde;y c&acirc;n nhắc mục đ&iacute;ch sử dụng của m&igrave;nh trước khi chọn mua.</p>\n&nbsp;\n<table id=\"tablepress-45\" class=\"tablepress tablepress-id-45\"><caption>&nbsp;</caption>\n<thead>\n<tr class=\"row-1 odd\">\n<th class=\"column-1\">Ưu điểm</th>\n<th class=\"column-2\">Nhược điểm</th>\n</tr>\n</thead>\n<tbody class=\"row-hover\">\n<tr class=\"row-2 even\">\n<td class=\"column-1\">Thiết kế nhựa gọn nhẹ, mang lại sự lịch l&atilde;m</td>\n<td class=\"column-2\">B&agrave;n ph&iacute;m độ nảy thấp, dễ d&iacute;nh chữ, ph&iacute;m điều hướng nhỏ</td>\n</tr>\n<tr class=\"row-3 odd\">\n<td class=\"column-1\">Touchpad rộng r&atilde;i, độ nhạy cao</td>\n<td class=\"column-2\">M&agrave;n h&igrave;nh g&oacute;c nh&igrave;n hẹp, m&agrave;u sắc nhợt nhạt</td>\n</tr>\n<tr class=\"row-4 even\">\n<td class=\"column-1\">&Acirc;m thanh trong trẻo, &acirc;m lượng lớn, nhiều t&ugrave;y chỉnh n&acirc;ng cao</td>\n<td class=\"column-2\">Kh&ocirc;ng c&oacute; cảm biến v&acirc;n tay</td>\n</tr>\n<tr class=\"row-5 odd\">\n<td class=\"column-1\">Hiệu năng tốt cho c&ocirc;ng việc văn ph&ograve;ng v&agrave; giải tr&iacute;</td>\n<td class=\"column-2\">&nbsp;</td>\n</tr>\n<tr class=\"row-6 even\">\n<td class=\"column-1\">Thời lượng pin tốt</td>\n<td class=\"column-2\">&nbsp;</td>\n</tr>\n<tr class=\"row-7 odd\">\n<td class=\"column-1\">Cổng kết nối đầy đủ</td>\n</tr>\n</tbody>\n</table>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>', 1, 5, '2021-09-19 07:36:47', '2021-09-19 07:36:47', 'unnamed.webp', NULL, 23, 34),
(5, 'Laptop Lenovo Ideapad 720s-13IKB', '13490000', '/storage/product/1/kKLB1UjvBeNSCpTindpJ.webp', '<h2>Overview Lenovo Ideapad 720s-13IKB 81BV0061VN</h2>\r\n<p><img src=\"https://vetinh.phongvu.vn/wp-content/uploads/2019/03/9a49be6cb83544f55047c512954b33af_lenovo-ideapad-720s-13ikb_gold_1-e1553855245959.jpg\" alt=\"Overview Lenovo Ideapad 720s-13IKB 81BV0061VN 1\" width=\"989\" height=\"646\" /></p>\r\n<p>Lenovo Ideapad 720s-13IKB 81BV0061VN cung cấp t&iacute;nh di động mỏng nhẹ tựa l&ocirc;ng hồng với khả năng xử l&yacute; đủ để xử l&yacute; mọi việc bạn l&agrave;m. Mỏng hơn v&agrave; nhẹ hơn đ&aacute;ng kể so với 520S. Với bề mặt kim loại cao cấp hơn, khả năng kết nối mang t&iacute;nh c&aacute;ch mạng của Thunderbolt 3, lưu trữ bổ sung v&agrave; n&acirc;ng cấp s&aacute;ng tạo như đầu đọc dấu v&acirc;n tay, Ideapad 720S l&agrave; một thế lực mang đầy phong c&aacute;ch.</p>\r\n<h3>Kh&ocirc;ng thể mỏng v&agrave; nhẹ hơn</h3>\r\n<p><img src=\"https://vetinh.phongvu.vn/wp-content/uploads/2019/03/lenovo-IdeaPad-720s-13-feature-1.jpg\" alt=\"Overview Lenovo Ideapad 720s-13IKB 81BV0061VN 2\" width=\"577\" height=\"445\" /></p>\r\n<p>Lenovo Ideapad 720s-13IKB 81BV0061VN c&oacute; kiểu d&aacute;ng thanh lịch đến m&ecirc; hoặc. Đặt n&oacute; trong t&uacute;i v&agrave; l&agrave;m việc hoặc đến bất cứ nơi n&agrave;o. N&oacute; kh&ocirc;ng bao giờ l&agrave;m chậm nhịp độ l&agrave;m việc v&agrave; sinh hoạt của bạn.</p>\r\n<h3>Kiểu d&aacute;ng mới đẹp mắt với lớp ho&agrave;n thiện bằng nh&ocirc;m</h3>\r\n<p><img src=\"https://vetinh.phongvu.vn/wp-content/uploads/2019/03/lenovo-IdeaPad-720s-13-feature-2.jpg\" alt=\"Overview Lenovo Ideapad 720s-13IKB 81BV0061VN 3\" width=\"577\" height=\"445\" /></p>\r\n<p>Được xử l&yacute; với c&ugrave;ng một kỹ thuật được sử dụng để định h&igrave;nh v&agrave; đ&aacute;nh b&oacute;ng kim cương, Lenovo Ideapad 720s-13IKB 81BV0061VN đ&atilde; được thiết kế lại với c&aacute;c chi tiết cao cấp v&agrave; c&aacute;c cạnh g&oacute;c cạnh để tr&ocirc;ng thậm ch&iacute; c&ograve;n mỏng hơn so với trước đ&acirc;y. C&oacute; sẵn trong hai t&ugrave;y chọn m&agrave;u sắc tr&ecirc;n t&ocirc;ng m&agrave;u với một kết th&uacute;c mềm mại: Bạc bạch kim v&agrave; V&agrave;ng s&acirc;m panh.</p>\r\n<h3>Lu&ocirc;n di chuyển với thời lượng pin d&agrave;i đ&aacute;ng kinh ngạc</h3>\r\n<p>Với thời lượng pin l&ecirc;n tới 14 giờ *, bạn sẽ c&oacute; thể di chuyển cả ng&agrave;y với trợ thủ đắc lực Lenovo Ideapad 720s-13IKB 81BV0061VN. Ideapad 720S cũng c&oacute; t&iacute;nh năng sạc lu&ocirc;n bật, do đ&oacute;, bạn sẽ c&oacute; thể sạc c&aacute;c thiết bị kh&aacute;c qua cổng USB ngay cả khi m&aacute;y t&iacute;nh x&aacute;ch tay của bạn bị tắt nguồn. Bạn kh&ocirc;ng bao giờ cảm thấy c&ocirc;ng việc bị đ&igrave;nh trệ v&igrave; phải neo m&igrave;nh v&agrave;o một cổng sạc điện cho c&aacute;c thiết bị.</p>\r\n<h3>Hiệu suất mạnh mẽ để ho&agrave;n th&agrave;nh c&ocirc;ng việc</h3>\r\n<p><img src=\"https://vetinh.phongvu.vn/wp-content/uploads/2019/03/lenovo-IdeaPad-720s-13-feature-4.jpg\" alt=\"Overview Lenovo Ideapad 720s-13IKB 81BV0061VN 4\" width=\"577\" height=\"445\" /></p>\r\n<p>Dựa tr&ecirc;n sức mạnh của Ideapad 520S, Ideapad 720S cung cấp xử l&yacute; Intel Core i5 thế hệ thứ 7 v&agrave; lưu trữ SSD PCIe hiệu suất cao bổ sung. Tải phim, lưu trữ ảnh v&agrave; video, v.v. V&agrave; với bộ nhớ l&ecirc;n tới 16 GB, bạn sẽ c&oacute; thể thực hiện đa t&aacute;c vụ một c&aacute;ch dễ d&agrave;ng v&agrave; nhanh ch&oacute;ng.</p>\r\n<h3>&Acirc;m thanh thực sự nhập vai</h3>\r\n<p>Với loa JBL Premium Audio, Lenovo Ideapad 720s-13IKB 81BV0061VN cung cấp &acirc;m thanh Dolby cho &acirc;m thanh to, r&otilde; r&agrave;ng, thể hiện chi tiết tr&ecirc;n một loạt c&aacute;c &acirc;m thanh ở bất kỳ &acirc;m lượng n&agrave;o.</p>\r\n<h3>Nhanh ch&oacute;ng đăng nhập an to&agrave;n với đầu đọc dấu v&acirc;n tay t&ugrave;y chọn</h3>\r\n<p>Hợp l&yacute; h&oacute;a ng&agrave;y của bạn với Windows Hello, hoạt động với tr&igrave;nh đọc dấu v&acirc;n tay t&ugrave;y chọn để đảm bảo đăng nhập an to&agrave;n, an to&agrave;n trong chưa đầy hai gi&acirc;y. Điều đ&oacute; nhanh hơn ba lần so với thời gian trung b&igrave;nh để nhập mật khẩu. Bạn cũng c&oacute; thể đăng nhập v&agrave;o nhiều ứng dụng đối t&aacute;c kh&aacute;c nhau như DropBox, chỉ bằng một c&uacute; chạm ng&oacute;n tay. Th&ecirc;m một điều bớt phải lo lắng khi l&agrave;m việc.</p>\r\n<p><img src=\"https://vetinh.phongvu.vn/wp-content/uploads/2019/03/lenovo-IdeaPad-720s-13-feature-5.jpg\" alt=\"Overview Lenovo Ideapad 720s-13IKB 81BV0061VN 5\" width=\"577\" height=\"445\" /></p>\r\n<h3>Cổng nhanh nhất thế giới</h3>\r\n<p>Lenovo Ideapad 720s-13IKB 81BV0061VN đi k&egrave;m với cổng Thunderbolt &trade; 3 USB-C, c&ocirc;ng nghệ kết nối mang t&iacute;nh c&aacute;ch mạng hỗ trợ m&agrave;n h&igrave;nh độ ph&acirc;n giải cao, thiết bị dữ liệu hiệu suất cao v&agrave; sạc nhanh. Kết nối m&aacute;y t&iacute;nh x&aacute;ch tay của bạn với nhiều m&agrave;n h&igrave;nh *, sau đ&oacute; đồng bộ h&oacute;a v&agrave; sao lưu với tốc độ l&ecirc;n tới 40 Gbps, gấp t&aacute;m lần tốc độ của USB 3.0! Giờ đ&acirc;y, bạn c&oacute; thể chụp v&agrave; chỉnh sửa nhiều luồng video trong thời gian thực hoặc x&acirc;u chuỗi c&aacute;c thiết bị kh&aacute;c để đơn giản h&oacute;a quy tr&igrave;nh l&agrave;m việc của bạn.</p>', 1, 8, '2021-09-19 07:39:14', '2021-09-19 07:39:14', 'unnamed (4).webp', NULL, 34, 21),
(6, 'Máy Tính Đồng Bộ Dell Vostro 3681', '8850000', '/storage/product/1/rOAKSfZWWHUbneAT5y7l.jpg', '<h2>Đ&aacute;nh gi&aacute; PC Dell Vostro 3681 SFF (i3-10100/4GB RAM/1TB HDD/WL+BT/K+M/Win10) (STI31501W-4G-1T)</h2>\r\n<p>Với thiết kế hiện đại, PC Dell Vostro 3681 đ&atilde; được giới thiệu với mục ti&ecirc;u n&acirc;ng cao t&iacute;nh hữu dụng khi sở hữu m&aacute;y t&iacute;nh để b&agrave;n Dell. Nhỏ v&agrave; h&ugrave;ng mạnh: Thiết kế mang t&iacute;nh c&aacute;ch mạng gi&uacute;p tiết kiệm kh&ocirc;ng gian m&agrave; kh&ocirc;ng ảnh hưởng đến hiệu năng hệ thống v&agrave; c&oacute; nhiều khe cắm mở rộng để n&acirc;ng cấp trong tương lai. Thoải m&aacute;i với Ổ đĩa quang t&ugrave;y chọn, cổng USB v&agrave; đầu đọc thẻ nhớ 5 trong 1 đều được bố tr&iacute; thuận tiện ở ph&iacute;a trước để dễ d&agrave;ng truy cập dữ liệu của bạn m&agrave; kh&ocirc;ng cần phải lo lắng g&igrave;.</p>\r\n<p><img src=\"https://hanoicomputercdn.com/media/lib/55737_Dell_3681_Specs.png\" alt=\"\" width=\"928\" height=\"423\" data-was-processed=\"true\" /></p>\r\n<h3>Hiệu suất kh&ocirc;ng thể phủ nhận với tiềm năng kh&ocirc;ng giới hạn</h3>\r\n<p>Với ổ cứng dung lượng cao, bộ xử l&yacute; Intel&reg; mạnh mẽ hơn v&agrave; hệ thống l&agrave;m m&aacute;t hệ thống được cải tiến, PC Dell Vostro 3681 cung cấp hiệu suất PC m&agrave; bạn xứng đ&aacute;ng được nhận. Bộ xử l&yacute; mạnh mẽ: Intel&reg; Core &trade; thứ 10 (tối đa Core i7), bạn c&oacute; thể mong đợi một tốc độ cao, đ&aacute;ng tin cậy. Dung lượng lưu trữ vượt trội: Tận dụng tối đa 1TB dung lượng lưu trữ ổ cứng của PC hoặc tối đa 256 t&ugrave;y chọn ổ cứng thể rắn M.2 PCle (SSD) được x&acirc;y dựng để c&oacute; hiệu suất ổn định hơn, ổn định hơn. Bạn cũng c&oacute; thể chọn ổ đĩa k&eacute;p hoặc th&ecirc;m v&agrave;o ổ đĩa quang để c&oacute; th&ecirc;m kh&ocirc;ng gian để sao lưu.</p>\r\n<h3>Kết hợp thiết bị của bạn với Dell Mobile Connect</h3>\r\n<p><img src=\"https://hanoicomputercdn.com/media/lib/55737_Dell_3681_Mobile.png\" alt=\"\" data-was-processed=\"true\" /></p>\r\n<p>T&iacute;ch hợp liền mạch PC / điện thoại th&ocirc;ng minh: Truy cập nhiều thiết bị m&agrave; kh&ocirc;ng cần ph&acirc;n chia sự ch&uacute; &yacute; của bạn Dell Connect Connect gh&eacute;p nối điện thoại th&ocirc;ng minh iOS hoặc Android của bạn với m&aacute;y t&iacute;nh để b&agrave;n.</p>\r\n<p>Hạn chế sự gi&aacute;n đoạn: Với Dell Mobile Connect, bạn c&oacute; thể thực hiện cuộc gọi, gửi văn bản, nhận th&ocirc;ng b&aacute;o v&agrave; thậm ch&iacute; phản chiếu điện thoại Android của m&igrave;nh l&ecirc;n PC để tương t&aacute;c với tất cả c&aacute;c ứng dụng y&ecirc;u th&iacute;ch của bạn.</p>\r\n<p>Duy tr&igrave; quyền ri&ecirc;ng tư của bạn : Điện thoại của bạn kết nối với PC th&ocirc;ng qua kết nối an to&agrave;n, điểm nối của Dell Mobile Connect để dữ liệu của bạn kh&ocirc;ng bao giờ bị lộ th&ocirc;ng qua c&aacute;c kết nối internet kh&ocirc;ng bảo mật.</p>\r\n<p>Chuyển dễ d&agrave;ng: Nhanh ch&oacute;ng di chuyển ảnh, video, nhạc v&agrave; t&agrave;i liệu từ PC sang điện thoại Android v&agrave; ngược lại, kh&ocirc;ng c&oacute; dịch vụ lưu trữ đ&aacute;m m&acirc;y phức tạp hoặc d&acirc;y c&aacute;p cồng kềnh.</p>\r\n<h3>Cổng &amp; Slots kết nối</h3>\r\n<p><img src=\"https://hanoicomputercdn.com/media/lib/55737_Dell_3681_Ports.png\" alt=\"\" width=\"928\" height=\"437\" data-was-processed=\"true\" /></p>\r\n<p>1. Ổ đĩa DVD (Tuỳ chọn) | 2. Đầu đọc thẻ | 3. N&uacute;t nguồn | 4. Jack &acirc;m thanh | 5. (2) Cổng USB 2.0 | 6. (2) Cổng USB 3.2 Gen 1 Type-A | 7. Jack &acirc;m thanh | 8.Cổng HDMI | 9. Cổng VGA | 10. (2) Cổng USB 3.2 Gen 1 Type-A | 11. (2) Cổng USB 2.0 | 12. Cổng RJ-45 Ethernet | 13. Khe cắm mở rộng | 14. Nguồn | 15. Đ&egrave;n b&aacute;o nguồn | 16. Khe mở rộng chờ | 17. Lẫy kho&aacute;</p>\r\n<h3>K&iacute;ch cỡ &amp; c&acirc;n nặng</h3>\r\n<p><img src=\"https://hanoicomputercdn.com/media/lib/55737_Dell_3681_Sizes.png\" alt=\"\" data-was-processed=\"true\" /></p>\r\n<p>1. Cao: 290 mm (11.42\") | 2. Rộng: 92.6 mm (3.65\") | 3. S&acirc;u: 292.8 mm (11.53\") | C&acirc;n nặng tối thiểu: 3.52 kg (7.76 lb)</p>', 1, 11, '2021-09-19 14:23:28', '2021-09-19 14:32:10', '7304427c0999fac7a388.jpg', NULL, 12, 23),
(7, 'MacBook Pro 16 inch - Intel Core i9 8-Core 2.4GHz', '53990000', '/storage/product/1/2o0keGRXQcCzOPooqZyS.jpg', '<div class=\"ty-product-block ty-product-detail\">\r\n<div id=\"tabs_content\" class=\"cm-tabs-content ty-tabs__content clearfix\">\r\n<div id=\"content_description\" class=\"ty-wysiwyg-content content-description\">\r\n<div>\r\n<p>Macbook Pro 16 inch n&acirc;ng cấp cấu h&igrave;nh , m&agrave;n h&igrave;nh rộng hơn , thay đổi thiết kế b&agrave;n ph&iacute;m , thời gian sử dụng l&acirc;u hơn , tản nhiệt hiệu quả hơn thế hệ 15.6 inch trước đ&oacute;</p>\r\n<ul>\r\n<li>M&atilde; Macbook Phi&ecirc;n Bản 15 inch 512GB l&agrave; : MVVJ2 SpaceGray , MVVL2 Sliver</li>\r\n<li>M&atilde; Macbook Phi&ecirc;n Bản 15 inch 1TB l&agrave; : MVVK2 SpaceGray , MVVM2 Sliver</li>\r\n</ul>\r\n<p>Apple đ&atilde; từ bỏ b&agrave;n ph&iacute;m c&aacute;nh bướm thay v&ocirc; đ&oacute; l&agrave; Magic Keyboard với h&agrave;nh tr&igrave;nh n&uacute;t bấm d&agrave;i hơn , cho cảm gi&aacute;c bấm ph&iacute;m tốt hơn , chắc chắn hơn. Magic Keyboard được thiết kế tương tự như c&aacute;c đời 2015 trở về trước , được cải tiến ho&agrave;n thiện hơn tr&ecirc;n Macbook Pro 16 inch</p>\r\n<p>Macbook Pro 16 inch với m&agrave;n h&igrave;nh lớn hơn , viền m&agrave;n h&igrave;nh mỏng hơn với độ ph&acirc;n giải 3072x1920 cao hơn thế hệ trước .</p>\r\n<p>Loa v&agrave; Mic cũng được cải thiện đ&aacute;ng kể với hệ thống 6 loa , Loa Trầm được bổ sung c&ocirc;ng nghệ \"force-cancelling\"gi&uacute;p m&aacute;y kh&ocirc;ng bị rung khi ph&aacute;t ra &acirc;m trầm , Microphone cũng được cải tiến n&acirc;ng cấp đạt ti&ecirc;u chuẩn ph&ograve;ng thu</p>\r\n<p>Thời gian Sử Dụng MacBook Pro 16 inch được cải tiến đến mức giới hạn với vi&ecirc;n pin với dung lượng 100Wh, lớn nhất từ trước đến nay tr&ecirc;n một chiếc MacBook Pro. Đ&acirc;y l&agrave; dung lượng pin tối đa 1 chiếc laptop c&oacute; thể mang l&ecirc;n M&aacute;y Bay . Tổng Thời gian sử dụng Macbook Pro 16 inch c&oacute; thể đạt được khi sử dụng l&agrave; 11 giờ ..</p>\r\n<p>Macbook Pro 16 inch được n&acirc;ng cấp cấu h&igrave;nh với</p>\r\n<p>- Chip thế hệ thứ 9, 6 Core I7 hoặc 8 Core I9</p>\r\n<p>- Ram 16GB c&oacute; thể n&acirc;ng cấp maximum 64GB</p>\r\n<p>- Ổ cứng SSD PCIe 512GB tối đa đạt 8TB SSD</p>\r\n<p>- Card đồ hoạ rời GPU AMD Radeon Pro 5000M series cho hiệu năng cao hơn GPU Radeon Pro Vega</p>\r\n<p>- Hệ thống tản nhiệt bao gồm quạt v&agrave; đế tản nhiệt mới, gi&uacute;p tăng 28% luồng khi lưu th&ocirc;ng , gi&uacute;p tăng cường qu&aacute; tr&igrave;nh giải nhiệt gi&uacute;p m&aacute;y đạt được c&ocirc;ng suất tối đa</p>\r\n<p><img src=\"https://mac24h.vn/images/companies/1/macbook%20pro%202016/16%20INCH/MacbookPro16inch1.JPG?1630590408266\" /></p>\r\n<p><img src=\"https://mac24h.vn/images/companies/1/macbook%20pro%202016/16%20INCH/MacbookPro16inch7.JPG?1630590444720\" /></p>\r\n<p><img src=\"https://mac24h.vn/images/companies/1/macbook%20pro%202016/16%20INCH/MacbookPro16inch6.JPG?1630590439549\" /></p>\r\n<p><img src=\"https://mac24h.vn/images/companies/1/macbook%20pro%202016/16%20INCH/MacbookPro16inch4.JPG?1630590429257\" /></p>\r\n<p><img src=\"https://mac24h.vn/images/companies/1/macbook%20pro%202016/16%20INCH/MacbookPro16inch3.JPG?1630590423522\" /></p>\r\n<p><img src=\"https://mac24h.vn/images/companies/1/macbook%20pro%202016/16%20INCH/MacbookPro16inch2.JPG?1630590416658\" /></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row-fluid ip-reviews-comments\">\r\n<div class=\"span8\">&nbsp;</div>\r\n</div>', 1, 7, '2021-09-24 20:32:13', '2021-09-25 05:46:50', 'nhung-uu-va-nhuoc-diem-cua-phien-ban-macbook-pro-16-inch-2019.jpg', NULL, NULL, NULL),
(8, 'Abdhvhszdjkvbzjhvbjkvzjskdnjdf', '2000000', '/storage/product/1/LStYnh27R7vjL9J7rrwN.jpg', '<p>abcderf</p>', 1, 3, '2021-09-26 07:18:54', '2021-09-26 07:18:54', 'nhung-uu-va-nhuoc-diem-cua-phien-ban-macbook-pro-16-inch-2019.jpg', NULL, NULL, NULL),
(9, 'Laptop Acer Aspire 3 A315 23 R0ML R3', '2000000', '/storage/product/1/O2zYYcfS2uCro3ufRNbp.jpg', '<h2>Đ&aacute;nh gi&aacute; chi tiết&nbsp;Acer Aspire 3 A315 23 R0ML/R3 3250U/NX.HVUSV.004</h2>\r\n<p><strong><a href=\"https://fptshop.com.vn/may-tinh-xach-tay/acer-aspire-3-a315-23-r0ml-r3-3250u\">Acer Aspire 3 A315 23 R0ML</a>&nbsp;l&agrave; chiếc laptop c&oacute; hiệu năng rất tốt cho c&ocirc;ng việc nhờ&nbsp;<a href=\"https://fptshop.com.vn/tin-tuc/for-gamers/amd-chinh-thuc-ra-mat-ryzen-3-3300x-va-3100-cung-chipset-b550-119175\">bộ vi xử l&yacute; AMD Ryzen 3</a>&nbsp;mạnh mẽ đi c&ugrave;ng dung lượng l&ecirc;n tới 512GB ổ cứng SSD, b&ecirc;n cạnh đ&oacute; m&aacute;y c&ograve;n rất thời trang với thiết kế nhỏ gọn, m&agrave;u bạc sang trọng</strong></p>', 1, 3, '2021-10-08 19:33:56', '2021-10-08 19:33:56', '637272306130089876_acer-aspire-3-a315-silver-8.jpg', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `image_path`, `product_id`, `created_at`, `updated_at`, `image_name`) VALUES
(77, '/storage/product/1/8ii4cB2PHjD1EVXmZE9o.webp', 1, '2021-09-19 06:58:57', '2021-09-19 06:58:57', 'unnamed (4).webp'),
(78, '/storage/product/1/8m1CevPPz2wsIxegC926.webp', 1, '2021-09-19 06:58:57', '2021-09-19 06:58:57', 'unnamed (5).webp'),
(79, '/storage/product/1/ssdZ6SgLDpQiIzzbQMpi.webp', 1, '2021-09-19 06:58:57', '2021-09-19 06:58:57', 'unnamed (6).webp'),
(80, '/storage/product/1/t4RYRW5wORt4tpUN4EJm.webp', 1, '2021-09-19 06:58:57', '2021-09-19 06:58:57', 'unnamed (7).webp'),
(81, '/storage/product/1/Av5EeOzwF6tYmtrbVKwr.webp', 2, '2021-09-19 07:07:09', '2021-09-19 07:07:09', 'unnamed (1).webp'),
(82, '/storage/product/1/3bIE6D5p4l0onY6YV23g.webp', 2, '2021-09-19 07:07:09', '2021-09-19 07:07:09', 'unnamed (2).webp'),
(83, '/storage/product/1/di1cJbwKEgr4PEyUezrN.webp', 2, '2021-09-19 07:07:09', '2021-09-19 07:07:09', 'unnamed (3).webp'),
(84, '/storage/product/1/f4G4OYY5mIunL03rifFF.webp', 2, '2021-09-19 07:07:09', '2021-09-19 07:07:09', 'unnamed.webp'),
(85, '/storage/product/1/NmavgQSyXuwT9GNrQ0Jl.webp', 3, '2021-09-19 07:17:09', '2021-09-19 07:17:09', 'unnamed (1).webp'),
(86, '/storage/product/1/P5ybZm0YnjM4PnCnqeDi.webp', 3, '2021-09-19 07:17:09', '2021-09-19 07:17:09', 'unnamed (2).webp'),
(87, '/storage/product/1/QQocEEHo8NcvtnszBsmi.webp', 3, '2021-09-19 07:17:09', '2021-09-19 07:17:09', 'unnamed (3).webp'),
(88, '/storage/product/1/Zs7FSETOfgH4DQUwt1vp.webp', 3, '2021-09-19 07:17:09', '2021-09-19 07:17:09', 'unnamed.webp'),
(89, '/storage/product/1/sjNMSvaHqOUMvP91qNJ7.webp', 4, '2021-09-19 07:36:47', '2021-09-19 07:36:47', 'unnamed (1).webp'),
(90, '/storage/product/1/y3CP3hE1DOMR9MUnlrse.webp', 4, '2021-09-19 07:36:47', '2021-09-19 07:36:47', 'unnamed (2).webp'),
(91, '/storage/product/1/aLb8VFRQxLLWDiKMKePz.webp', 4, '2021-09-19 07:36:47', '2021-09-19 07:36:47', 'unnamed (3).webp'),
(92, '/storage/product/1/XR9rA1nU1i90XJ1DP2Bl.webp', 4, '2021-09-19 07:36:47', '2021-09-19 07:36:47', 'unnamed.webp'),
(93, '/storage/product/1/qGNlVHFCxmUP84PjiYky.webp', 5, '2021-09-19 07:39:14', '2021-09-19 07:39:14', 'unnamed (4).webp'),
(94, '/storage/product/1/ikGeRi1TUgkygmf6WZx7.webp', 5, '2021-09-19 07:39:14', '2021-09-19 07:39:14', 'unnamed (5).webp'),
(95, '/storage/product/1/R8amE3pq8BEvh0WsQQLS.webp', 5, '2021-09-19 07:39:14', '2021-09-19 07:39:14', 'unnamed (6).webp'),
(96, '/storage/product/1/YvZ3VdEl5mMyBoiBiYEv.webp', 5, '2021-09-19 07:39:14', '2021-09-19 07:39:14', 'unnamed (7).webp'),
(97, '/storage/product/1/lLjv1B4bjokQkZMTiEwT.webp', 5, '2021-09-19 07:39:14', '2021-09-19 07:39:14', 'unnamed (8).webp'),
(98, '/storage/product/1/HNecYvgJFi0rNhhHoLhn.jpg', 9, '2021-10-08 19:33:56', '2021-10-08 19:33:56', '637272306130209865_acer-aspire-3-a315-silver-1.jpg'),
(99, '/storage/product/1/C0cmxuipcmw5X3ukOX90.jpg', 9, '2021-10-08 19:33:56', '2021-10-08 19:33:56', '637272306130150135_acer-aspire-3-a315-silver-3.jpg'),
(100, '/storage/product/1/ULKl0K7kA2K3VokZ138u.jpg', 9, '2021-10-08 19:33:56', '2021-10-08 19:33:56', '637272306130089876_acer-aspire-3-a315-silver-8.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_tags`
--

CREATE TABLE `product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_tags`
--

INSERT INTO `product_tags` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 9, 1, '2021-09-03 12:58:20', '2021-09-03 12:58:20'),
(2, 9, 2, '2021-09-03 12:58:20', '2021-09-03 12:58:20'),
(3, 9, 3, '2021-09-03 12:58:20', '2021-09-03 12:58:20'),
(4, 11, 1, '2021-09-03 13:01:24', '2021-09-03 13:01:24'),
(5, 12, 4, NULL, NULL),
(6, 12, 5, NULL, NULL),
(7, 12, 6, NULL, NULL),
(8, 13, 4, '2021-09-03 13:14:53', '2021-09-03 13:14:53'),
(9, 13, 5, '2021-09-03 13:14:53', '2021-09-03 13:14:53'),
(10, 13, 6, '2021-09-03 13:14:53', '2021-09-03 13:14:53'),
(11, 14, 4, '2021-09-04 10:17:34', '2021-09-04 10:17:34'),
(12, 14, 7, '2021-09-04 10:17:34', '2021-09-04 10:17:34'),
(13, 15, 8, '2021-09-04 10:40:08', '2021-09-04 10:40:08'),
(14, 15, 9, '2021-09-04 10:40:08', '2021-09-04 10:40:08'),
(15, 15, 10, '2021-09-04 10:40:08', '2021-09-04 10:40:08'),
(18, 16, 12, '2021-09-05 13:20:16', '2021-09-05 13:20:16'),
(19, 16, 13, '2021-09-05 13:23:37', '2021-09-05 13:23:37'),
(20, 16, 1, '2021-09-05 13:23:37', '2021-09-05 13:23:37'),
(21, 18, 14, '2021-09-07 02:38:17', '2021-09-07 02:38:17'),
(22, 28, 15, '2021-09-07 02:56:12', '2021-09-07 02:56:12'),
(23, 28, 16, '2021-09-07 02:56:12', '2021-09-07 02:56:12'),
(24, 1, 17, '2021-09-19 06:58:57', '2021-09-19 06:58:57'),
(25, 1, 18, '2021-09-19 06:58:57', '2021-09-19 06:58:57'),
(26, 2, 17, '2021-09-19 07:07:09', '2021-09-19 07:07:09'),
(27, 2, 19, '2021-09-19 07:07:09', '2021-09-19 07:07:09'),
(28, 3, 17, '2021-09-19 07:17:09', '2021-09-19 07:17:09'),
(29, 3, 20, '2021-09-19 07:17:09', '2021-09-19 07:17:09'),
(30, 3, 21, '2021-09-19 07:17:09', '2021-09-19 07:17:09'),
(31, 4, 17, '2021-09-19 07:36:47', '2021-09-19 07:36:47'),
(32, 4, 22, '2021-09-19 07:36:47', '2021-09-19 07:36:47'),
(33, 5, 17, '2021-09-19 07:39:15', '2021-09-19 07:39:15'),
(34, 5, 23, '2021-09-19 07:39:15', '2021-09-19 07:39:15'),
(35, 6, 24, '2021-09-19 14:23:29', '2021-09-19 14:23:29'),
(36, 7, 17, '2021-09-24 20:32:13', '2021-09-24 20:32:13'),
(37, 7, 19, '2021-09-24 20:32:13', '2021-09-24 20:32:13'),
(38, 9, 17, '2021-10-08 19:33:56', '2021-10-08 19:33:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'Quản trị hệ thống', NULL, NULL, NULL),
(2, 'guest', 'Khách hàng', NULL, NULL, NULL),
(3, 'developer', 'Phát triển hệ thống', NULL, NULL, NULL),
(4, 'content', 'Chỉnh sửa nội dung', NULL, NULL, NULL),
(11, 'Editor', 'Editor', '2021-09-12 20:00:36', '2021-09-15 19:05:53', '2021-09-15 19:05:53'),
(12, 'vsdvsd', 'vsdvsdvsdvsd', '2021-09-12 20:04:56', '2021-09-12 20:14:44', '2021-09-12 20:14:44'),
(13, 'Sale', 'Người bán hàng', '2021-10-07 10:26:34', '2021-10-07 10:26:34', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 7, 3, NULL, NULL),
(2, 8, 3, NULL, NULL),
(3, 8, 4, NULL, NULL),
(4, 9, 2, NULL, NULL),
(5, 9, 3, NULL, NULL),
(6, 9, 4, NULL, NULL),
(7, 1, 1, NULL, NULL),
(9, 2, 1, NULL, NULL),
(12, 11, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `config_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `config_key`, `config_value`, `created_at`, `updated_at`, `type`) VALUES
(1, 'phone_contact', '0123456789', '2021-09-08 21:11:59', '2021-10-02 02:12:57', 'Text'),
(2, 'email', 'maianhnamdev@gmail.com', '2021-09-16 08:17:28', '2021-09-16 08:17:28', 'Text'),
(16, 'gioi-thieu', 'Chúng tôi có các loại máy tính từ máy tính bàn đến laptop', '2021-09-17 02:13:56', '2021-09-17 02:13:56', 'Textarea'),
(17, 'facekbook_link', 'https://www.facebook.com/nam.laodz/', '2021-09-17 02:15:17', '2021-09-17 02:15:17', 'Text'),
(18, 'dia-chi', 'Tổ 6 P.Túc Duyên, TP.Thái Nguyên', '2021-09-19 11:51:17', '2021-09-19 11:51:17', 'Text');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slides`
--

INSERT INTO `slides` (`id`, `name`, `description`, `image_path`, `image_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '[New 100%] Dell Inspiron 3505 AMD', 'Dell Inspiron 3505 AMD', '/storage/slider/1/wpsXAKS8UDjvfUs23nuD.jpg', '2102_1_1.jpg', '2021-09-17 03:21:34', '2021-09-17 18:58:29', NULL),
(2, 'THINKPAD P15', 'THINKPAD P15', '/storage/slider/1/Vr34NFLJWgZARpYU2BYl.jpeg', 'FYWJoqkuYl5rUdhcJGmEnSFgme6vMWPpzKMOy02E.jpeg', '2021-09-17 03:22:07', '2021-09-17 03:22:07', NULL),
(3, 'Acer Nitro 5 2019', 'Acer Nitro 5 2019', '/storage/slider/1/Dh2UxbWbNpwOAfN1R6vM.jpg', '1351_acer_nitro_5_2019_laptopaz__3_.jpg', '2021-09-17 03:23:12', '2021-09-17 18:56:23', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'iphone 4', '2021-09-03 12:58:20', '2021-09-03 12:58:20'),
(2, 'HTC', '2021-09-03 12:58:20', '2021-09-03 12:58:20'),
(3, 'Phone', '2021-09-03 12:58:20', '2021-09-03 12:58:20'),
(4, 'iphone 5', '2021-09-03 13:11:30', '2021-09-03 13:11:30'),
(5, 'iphone pro', '2021-09-03 13:11:30', '2021-09-03 13:11:30'),
(6, 'iphone hot nhat', '2021-09-03 13:11:30', '2021-09-03 13:11:30'),
(7, 'iphone mới nhất', '2021-09-04 10:17:34', '2021-09-04 10:17:34'),
(8, 'dfvbjf', '2021-09-04 10:40:08', '2021-09-04 10:40:08'),
(9, 'fjvfjvf', '2021-09-04 10:40:08', '2021-09-04 10:40:08'),
(10, 'scuduhdc', '2021-09-04 10:40:08', '2021-09-04 10:40:08'),
(11, '1', '2021-09-05 13:20:16', '2021-09-05 13:20:16'),
(12, 'tesst 1', '2021-09-05 13:20:16', '2021-09-05 13:20:16'),
(13, 'xxx', '2021-09-05 13:23:37', '2021-09-05 13:23:37'),
(14, 'cscscs', '2021-09-07 02:38:17', '2021-09-07 02:38:17'),
(15, 'advdvd', '2021-09-07 02:56:12', '2021-09-07 02:56:12'),
(16, 'gnfgngf', '2021-09-07 02:56:12', '2021-09-07 02:56:12'),
(17, 'Laptop', '2021-09-19 06:58:57', '2021-09-19 06:58:57'),
(18, 'Accer', '2021-09-19 06:58:57', '2021-09-19 06:58:57'),
(19, 'Apple', '2021-09-19 07:07:09', '2021-09-19 07:07:09'),
(20, 'asus', '2021-09-19 07:17:09', '2021-09-19 07:17:09'),
(21, 'Laptop gaming', '2021-09-19 07:17:09', '2021-09-19 07:17:09'),
(22, 'Dell', '2021-09-19 07:36:47', '2021-09-19 07:36:47'),
(23, 'Lenovo', '2021-09-19 07:39:15', '2021-09-19 07:39:15'),
(24, 'Máy tính bàn', '2021-09-19 14:23:29', '2021-09-19 14:23:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mai Anh Nam', 'maianhnamdev@gmail.com', NULL, '$2y$10$nZS0gf9bEgti0UKZBKaZfOSJyXo6RYXCcnrrt6473AmMdM8BJ7evy', 'DoifHpf8LIVpLmCJTWVGfBUFMu6MRsyZXRF9b9r6fiKs2QiBwJve7BsMHszm', NULL, '2021-09-13 18:14:22', NULL),
(2, 'Admin', 'admin@admin.com', NULL, '$2y$10$J4vEL.IXioQAND9GaokU7.wRyKbwpJrBUzVpXayabjH2KPegJoEfa', NULL, NULL, '2021-09-13 17:52:28', NULL),
(3, 'Nguyễn Nam Tuấn', 'nguyennamtuan@email.com', NULL, '$2y$10$km/B8VxByfu2v.Z0WrupJuWGT9R8XoDdbMa4rMu9mEAvWJjf94FFi', NULL, NULL, '2021-09-15 19:01:59', '2021-09-15 19:01:59'),
(7, 'Hà Văn Đông', 'donghv@email.com', NULL, '$2y$10$ND424iXwBYe8KgPQUyfCmu8sQWjufVDEBf2B40IRwuRcLJ4GX.jbm', NULL, '2021-09-10 19:40:00', '2021-09-10 19:40:00', NULL),
(8, 'Nguyễn Hà Việt', 'vietnv@email.com', NULL, '$2y$10$gq6r5XV8vLxj1S9xBPnsMe2Ac4IBdHZJSYRRYZF9TLdNkbZhtuOxq', NULL, '2021-09-10 19:40:36', '2021-09-10 19:40:36', NULL),
(9, 'Mai Anh Nam tes', 'jdhbchdsbhd@email.com', NULL, '$2y$10$2sip4pKhw/ShJ2v2chjV3OTOeL528VblBI6YXl617YB30BH9IKE02', NULL, '2021-09-10 19:44:47', '2021-09-10 20:35:58', '2021-09-10 20:35:58'),
(11, 'testguest', 'testguest@email.com', NULL, '$2y$10$WH0zL8YvLKLgbbGBXhpvAOieeCPsowbMsvzKazxGDV7Nm0AmpRI6O', NULL, '2021-09-15 06:56:42', '2021-09-16 06:29:23', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=336;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT cho bảng `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
