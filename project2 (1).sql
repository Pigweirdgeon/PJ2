-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 10, 2021 lúc 11:31 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `project2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `idAdmin` int(10) UNSIGNED NOT NULL,
  `firstName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middleName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`idAdmin`, `firstName`, `middleName`, `lastName`, `gender`, `email`, `phone`, `address`, `birthday`, `password`, `created_at`, `updated_at`) VALUES
(2, 'Sỹ', 'Văn', 'Trương', 0, 'admin@gmail.com', '0359241554', 'Hà Nội', '2001-10-08', 'd6a6bc0db10694a2d90e3a69648f3a03', '2021-07-01 00:51:53', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `assign`
--

CREATE TABLE `assign` (
  `idAssign` int(10) UNSIGNED NOT NULL,
  `idClass` int(10) UNSIGNED NOT NULL,
  `idFaculty` int(10) UNSIGNED NOT NULL,
  `idSubject` int(10) UNSIGNED NOT NULL,
  `idTeacher` int(10) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `assign`
--

INSERT INTO `assign` (`idAssign`, `idClass`, `idFaculty`, `idSubject`, `idTeacher`, `start_date`, `created_at`, `updated_at`, `available`) VALUES
(1, 4, 2, 1, 1, '2021-06-23', '2021-06-23 04:19:22', '2021-06-23 04:39:36', 1),
(2, 1, 1, 2, 1, '2021-06-23', '2021-06-23 04:19:41', '2021-06-23 04:19:41', 1),
(3, 1, 1, 5, 1, '2021-06-23', '2021-06-23 04:20:06', '2021-07-09 19:57:40', 1),
(6, 3, 2, 7, 1, '2021-06-23', '2021-06-23 04:34:35', '2021-06-23 04:34:35', 1),
(7, 1, 1, 3, 3, '2021-06-23', '2021-06-23 04:40:22', '2021-07-09 20:01:36', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendance`
--

CREATE TABLE `attendance` (
  `idAttendance` int(10) UNSIGNED NOT NULL,
  `dateAttendance` date NOT NULL,
  `idClass` int(10) UNSIGNED NOT NULL,
  `idSubject` int(10) UNSIGNED NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom`
--

CREATE TABLE `classroom` (
  `idClass` int(10) UNSIGNED NOT NULL,
  `nameClass` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idFaculty` int(10) UNSIGNED NOT NULL,
  `idMajor` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `classroom`
--

INSERT INTO `classroom` (`idClass`, `nameClass`, `idFaculty`, `idMajor`, `created_at`, `updated_at`, `available`) VALUES
(1, 'BKD02', 1, 3, '2021-06-23 04:05:57', '2021-06-23 04:05:57', 1),
(2, 'BKD01', 1, 3, '2021-06-23 04:06:11', '2021-07-09 20:13:01', 1),
(3, 'BKN01', 2, 2, '2021-06-23 04:06:30', '2021-06-23 04:06:30', 1),
(4, 'BKN02', 2, 2, '2021-06-23 04:06:44', '2021-06-23 04:06:44', 1),
(5, 'BKG01', 3, 1, '2021-06-23 04:07:52', '2021-06-23 04:07:52', 1),
(6, 'BKG02', 3, 1, '2021-06-23 04:08:06', '2021-06-23 04:08:06', 1),
(8, 'BKD02', 2, 4, '2021-07-05 01:54:25', '2021-07-05 01:54:25', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detailattendance`
--

CREATE TABLE `detailattendance` (
  `idStudent` int(10) UNSIGNED NOT NULL,
  `idAttendance` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `faculty`
--

CREATE TABLE `faculty` (
  `idFaculty` int(10) UNSIGNED NOT NULL,
  `nameFaculty` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `faculty`
--

INSERT INTO `faculty` (`idFaculty`, `nameFaculty`, `created_at`, `updated_at`, `available`) VALUES
(1, 'K11', '2021-06-23 04:02:50', '2021-07-09 20:35:19', 1),
(2, 'K12', '2021-06-23 04:02:57', '2021-06-23 04:02:57', 1),
(3, 'K13', '2021-06-23 04:03:02', '2021-06-23 04:03:02', 1),
(4, 'K14', '2021-06-23 04:03:09', '2021-07-01 03:28:18', 1),
(6, 'k15', '2021-07-10 01:26:16', '2021-07-10 01:26:16', 1),
(7, 'k16', '2021-07-10 01:26:16', '2021-07-10 01:26:16', 1),
(8, 'K17', '2021-07-10 01:27:15', '2021-07-10 01:27:15', 1),
(9, 'K18', '2021-07-10 01:27:15', '2021-07-10 01:27:15', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `major`
--

CREATE TABLE `major` (
  `idMajor` int(10) UNSIGNED NOT NULL,
  `nameMajor` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `major`
--

INSERT INTO `major` (`idMajor`, `nameMajor`, `created_at`, `updated_at`, `available`) VALUES
(1, 'Xử lý đồ họa', '2021-06-23 04:02:20', '2021-07-09 20:26:15', 1),
(2, 'Quản trị kinh doanh', '2021-06-23 04:02:27', '2021-06-23 04:02:27', 1),
(3, 'Lập trình viên quốc tế', '2021-06-23 04:02:36', '2021-06-23 04:02:36', 1),
(4, 'An ninh mạng', '2021-06-23 04:02:43', '2021-06-23 04:02:43', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2021_06_18_165557_admin', 1),
(3, '2021_06_18_165959_major', 1),
(4, '2021_06_18_170155_faculty', 1),
(5, '2021_06_18_170238_subject', 1),
(6, '2021_06_18_170321_classroom', 1),
(7, '2021_06_18_170404_teacher', 1),
(8, '2021_06_18_170527_student', 1),
(9, '2021_06_18_170946_attendance', 1),
(10, '2021_06_18_171041_detailAttendance', 1),
(11, '2021_06_18_171414_assign', 1),
(12, '2021_07_10_015617_add_available_to_teacher_table', 2),
(13, '2021_07_10_023044_add_available_to_assign_table', 3),
(14, '2021_07_10_024147_add_available_to_student_table', 4),
(15, '2021_07_10_024313_add_available_to_student_table', 5),
(16, '2021_07_10_025325_add_available_to_major_table', 6),
(17, '2021_07_10_030610_add_available_to_classroom_table', 7),
(18, '2021_07_10_031744_add_available_to_subject_table', 8),
(19, '2021_07_10_032910_add_available_to_faculty_table', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student`
--

CREATE TABLE `student` (
  `idStudent` int(10) UNSIGNED NOT NULL,
  `firstName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middleName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `idClass` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `student`
--

INSERT INTO `student` (`idStudent`, `firstName`, `middleName`, `lastName`, `gender`, `email`, `phone`, `address`, `birthday`, `idClass`, `created_at`, `updated_at`, `available`) VALUES
(1, 'Sỹ', 'Văn', 'Trương', 0, 'vanyyy2001@gmail.com', '0987654123', 'Hà nội', '2001-10-08', 1, '2021-06-23 04:08:36', '2021-07-01 03:11:27', 1),
(2, 'Thảo', 'Thu', 'Nguyễn', 1, 'admin@gmail.com', '0135478965', 'Hà nội', '2001-10-22', 1, '2021-06-23 04:09:09', '2021-06-23 04:09:09', 1),
(3, 'Khải', 'Trung', 'Trần', 0, 'abc@gmail.com', '0321654789', 'Hà nội', '2001-06-06', 2, '2021-06-23 04:09:48', '2021-06-23 04:09:48', 1),
(4, 'Trung', 'Đình', 'Trần', 0, 'test@gmail.com', '0321654789', 'Hà nội', '2002-07-12', 3, '2021-06-23 04:10:39', '2021-06-23 04:10:39', 1),
(5, 'Khải', 'Trung', 'Đặng', 0, 'khaihoang@gmail.com', '0321654789', 'Hà nội', '2001-02-24', 1, '2021-06-23 10:55:40', '2021-07-09 19:47:00', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subject`
--

CREATE TABLE `subject` (
  `idSubject` int(10) UNSIGNED NOT NULL,
  `nameSubject` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idMajor` int(10) UNSIGNED NOT NULL,
  `duration` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subject`
--

INSERT INTO `subject` (`idSubject`, `nameSubject`, `idMajor`, `duration`, `created_at`, `updated_at`, `available`) VALUES
(1, 'PHP 2', 3, 72, '2021-06-23 04:03:22', '2021-06-23 04:03:22', 1),
(2, 'Database1', 3, 72, '2021-06-23 04:03:33', '2021-07-09 20:22:31', 1),
(3, 'Photoshop', 1, 72, '2021-06-23 04:03:43', '2021-06-23 04:03:43', 1),
(4, 'Database 2', 3, 72, '2021-06-23 04:03:55', '2021-06-23 04:03:55', 1),
(5, 'OOP', 3, 72, '2021-06-23 04:04:08', '2021-06-23 04:04:08', 1),
(6, 'Mạng máy tính', 4, 72, '2021-06-23 04:04:20', '2021-06-23 04:04:20', 1),
(7, 'Quản trị kế hoạch tài chính', 2, 72, '2021-06-23 04:05:33', '2021-06-23 04:05:33', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teacher`
--

CREATE TABLE `teacher` (
  `idTeacher` int(10) UNSIGNED NOT NULL,
  `firstName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middleName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `teacher`
--

INSERT INTO `teacher` (`idTeacher`, `firstName`, `middleName`, `lastName`, `gender`, `email`, `phone`, `address`, `birthday`, `password`, `created_at`, `updated_at`, `available`) VALUES
(1, 'Trang', 'Huyền', 'Tưởng', 0, 'Trang@gmail.com', '0321654789', 'Hà nội', '2001-05-06', '60958fd398bfb49d6bbfb9292b09aa25', '2021-06-23 04:00:52', '2021-07-10 02:24:22', 1),
(2, 'Tùng', 'Đình', 'Phan', 1, 'test@gmail.com', '0135478965', 'Hà nội', '1996-06-06', 'c56d0e9a7ccec67b4ea131655038d604', '2021-06-23 04:01:24', '2021-07-10 02:26:41', 1),
(3, 'Cao', 'Hữu', 'Đặng', 1, 'abc@gmail.com', '0321654789', 'Hà nội', '1998-06-07', '14e1b600b1fd579f47433b88e8d85291', '2021-06-23 04:02:05', '2021-07-10 02:24:47', 1),
(5, 'Dương', 'Thùy', 'Hoàng', 0, 'Duong@gmail,com', '032145873', 'Hà nội', '1999-08-06', 'e10adc3949ba59abbe56e057f20f883e', '2021-07-10 02:11:12', '2021-07-10 02:11:12', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Chỉ mục cho bảng `assign`
--
ALTER TABLE `assign`
  ADD PRIMARY KEY (`idAssign`),
  ADD KEY `assign_idclass_foreign` (`idClass`),
  ADD KEY `assign_idfaculty_foreign` (`idFaculty`),
  ADD KEY `assign_idsubject_foreign` (`idSubject`),
  ADD KEY `assign_idteacher_foreign` (`idTeacher`);

--
-- Chỉ mục cho bảng `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`idAttendance`),
  ADD KEY `attendance_idclass_foreign` (`idClass`),
  ADD KEY `attendance_idsubject_foreign` (`idSubject`);

--
-- Chỉ mục cho bảng `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`idClass`),
  ADD KEY `classroom_idfaculty_foreign` (`idFaculty`),
  ADD KEY `classroom_idmajor_foreign` (`idMajor`);

--
-- Chỉ mục cho bảng `detailattendance`
--
ALTER TABLE `detailattendance`
  ADD KEY `detailattendance_idstudent_foreign` (`idStudent`),
  ADD KEY `detailattendance_idattendance_foreign` (`idAttendance`);

--
-- Chỉ mục cho bảng `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`idFaculty`);

--
-- Chỉ mục cho bảng `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`idMajor`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`idStudent`),
  ADD KEY `student_idclass_foreign` (`idClass`);

--
-- Chỉ mục cho bảng `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`idSubject`),
  ADD KEY `subject_idmajor_foreign` (`idMajor`);

--
-- Chỉ mục cho bảng `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`idTeacher`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `assign`
--
ALTER TABLE `assign`
  MODIFY `idAssign` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `attendance`
--
ALTER TABLE `attendance`
  MODIFY `idAttendance` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `classroom`
--
ALTER TABLE `classroom`
  MODIFY `idClass` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `faculty`
--
ALTER TABLE `faculty`
  MODIFY `idFaculty` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `major`
--
ALTER TABLE `major`
  MODIFY `idMajor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `student`
--
ALTER TABLE `student`
  MODIFY `idStudent` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `subject`
--
ALTER TABLE `subject`
  MODIFY `idSubject` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `teacher`
--
ALTER TABLE `teacher`
  MODIFY `idTeacher` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `assign`
--
ALTER TABLE `assign`
  ADD CONSTRAINT `assign_idclass_foreign` FOREIGN KEY (`idClass`) REFERENCES `classroom` (`idClass`),
  ADD CONSTRAINT `assign_idfaculty_foreign` FOREIGN KEY (`idFaculty`) REFERENCES `faculty` (`idFaculty`),
  ADD CONSTRAINT `assign_idsubject_foreign` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idSubject`),
  ADD CONSTRAINT `assign_idteacher_foreign` FOREIGN KEY (`idTeacher`) REFERENCES `teacher` (`idTeacher`);

--
-- Các ràng buộc cho bảng `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_idclass_foreign` FOREIGN KEY (`idClass`) REFERENCES `classroom` (`idClass`),
  ADD CONSTRAINT `attendance_idsubject_foreign` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idSubject`);

--
-- Các ràng buộc cho bảng `classroom`
--
ALTER TABLE `classroom`
  ADD CONSTRAINT `classroom_idfaculty_foreign` FOREIGN KEY (`idFaculty`) REFERENCES `faculty` (`idFaculty`),
  ADD CONSTRAINT `classroom_idmajor_foreign` FOREIGN KEY (`idMajor`) REFERENCES `major` (`idMajor`);

--
-- Các ràng buộc cho bảng `detailattendance`
--
ALTER TABLE `detailattendance`
  ADD CONSTRAINT `detailattendance_idattendance_foreign` FOREIGN KEY (`idAttendance`) REFERENCES `attendance` (`idAttendance`),
  ADD CONSTRAINT `detailattendance_idstudent_foreign` FOREIGN KEY (`idStudent`) REFERENCES `student` (`idStudent`);

--
-- Các ràng buộc cho bảng `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_idclass_foreign` FOREIGN KEY (`idClass`) REFERENCES `classroom` (`idClass`);

--
-- Các ràng buộc cho bảng `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_idmajor_foreign` FOREIGN KEY (`idMajor`) REFERENCES `major` (`idMajor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
