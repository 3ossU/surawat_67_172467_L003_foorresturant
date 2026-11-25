-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: csi402db
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(100) NOT NULL,
  `order_id` int NOT NULL,
  `payer_name` varchar(150) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL DEFAULT 'PROMPTPAY',
  `status` enum('PAID','PENDING','FAILED') NOT NULL DEFAULT 'PAID',
  `paid_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference_number` (`reference_number`),
  KEY `fk_bills_orders` (`order_id`),
  CONSTRAINT `fk_bills_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,'REF-ORD-25691112012101',1,'surawat saengcharoensuklert',474.00,'COD','PAID','2026-11-16 09:23:04','2026-11-21 13:11:12'),(2,'REF-ORD-25691112021207',2,'surawat saengcharoensuklert',689.00,'COD','PAID','2026-11-18 06:52:04','2026-11-21 13:11:12'),(3,'REF-ORD-25691118135002',3,'surawat saengcharoensuklert',160.00,'COD','PAID','2026-11-18 06:51:45','2026-11-21 13:11:12'),(4,'REF-ORD-25691122021650',6,'user user',459.00,'COD','PAID','2026-11-21 19:18:00','2026-11-21 19:18:24'),(5,'REF-ORD-25691122012948',5,'surawat saengcharoensuklert',380.00,'COD','PAID','2026-11-22 12:18:54','2026-11-22 12:29:06'),(6,'REF-ORD-25691125032823',7,'user user',637.00,'PROMPTPAY','PAID','2026-11-24 20:28:23','2026-11-25 14:17:28');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `display_order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'โปรโมชั่น',1,1,0,'2026-11-11 16:58:34','2026-11-11 16:58:34'),(2,'อาหารจานเดียว',2,1,0,'2026-11-24 20:43:06','2026-11-24 20:43:06'),(4,'ของหวาน',4,1,0,'2026-11-11 16:58:34','2026-11-11 16:58:34'),(5,'เครื่องดื่ม',5,1,0,'2026-11-11 16:58:34','2026-11-11 16:58:34'),(6,'ของทานเล่น',6,1,0,'2026-11-11 16:58:34','2026-11-11 16:58:34');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dining_tables`
--

DROP TABLE IF EXISTS `dining_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dining_tables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table_number` varchar(20) NOT NULL,
  `capacity` int NOT NULL DEFAULT '4',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_number` (`table_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dining_tables`
--

LOCK TABLES `dining_tables` WRITE;
/*!40000 ALTER TABLE `dining_tables` DISABLE KEYS */;
INSERT INTO `dining_tables` VALUES (1,'T01',2,1,'2026-11-12 17:03:16'),(2,'T02',4,1,'2026-11-12 17:03:16'),(3,'T03',4,1,'2026-11-12 17:03:16'),(4,'T04',6,1,'2026-11-12 17:03:16'),(5,'VIP-1',10,1,'2026-11-12 17:03:16');
/*!40000 ALTER TABLE `dining_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_foods_categories` (`category_id`),
  CONSTRAINT `fk_foods_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (2,1,'เซ็ตครอบครัวสเต๊กหมูคอมโบ','สเต๊กหมูพริกไทยดำ 2 ชิ้น เสิร์ฟพร้อมเฟรนช์ฟรายส์',299.00,'',0,1,'2026-11-11 17:01:32','2026-11-18 06:56:23'),(3,1,'ต้มยำกุ้งน้ำข้นหม้อไฟ','ต้มยำกุ้งแม่น้ำรสแซ่บจัดจ้าน เสิร์ฟร้อนๆ',180.00,'https://www.honestbowlfoods.com/recipes/tom-yum-kung',0,1,'2026-11-11 17:01:32','2026-11-24 20:35:37'),(4,1,'แกงส้มชะอมกุ้ง','แกงส้มรสเข้มข้นพร้อมไข่ชะอมทอดกรอบ',150.00,'',0,1,'2026-11-11 17:01:32','2026-11-24 20:33:13'),(5,2,'ข้าวผัดกะเพราเนื้อโคขุนไข่ดาว','กะเพราเนื้อแท้ หอมกลิ่นกระทะ เสิร์ฟพร้อมไข่ดาวกรอบ',95.00,'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?auto=format&fit=crop&w=640&q=80',0,1,'2026-11-11 17:01:32','2026-11-24 20:55:58'),(6,2,'ผัดไทยกุ้งสด','ผัดไทยสูตรโบราณ รสชาติกลมกล่อม',85.00,'',0,1,'2026-11-11 17:01:32','2026-11-24 21:01:56'),(7,2,'ข้าวผัดหมูจานโปรด','ข้าวผัดหอมกลิ่นกระทะ ข้าวเรียงเม็ดสวย',65.00,'',0,1,'2026-11-11 17:01:32','2026-11-24 21:01:56'),(8,4,'บิงซูสตรอว์เบอร์รี','น้ำแข็งไสสไตล์เกาหลี ราดซอสสตรอว์เบอร์รีเข้มข้น',149.00,'',0,1,'2026-11-11 17:01:32','2026-11-24 20:33:03'),(9,4,'ไอศกรีมวานิลลาท็อปปิ้งบราวนี่','ไอศกรีมโฮมเมด เสิร์ฟคู่กับบราวนี่เนื้อหนึบ',79.00,'',0,1,'2026-11-11 17:01:32','2026-11-24 20:33:00'),(10,5,'ชาไทยเย็นสูตรเข้มข้น','ชาไทยชงสด หอม มัน หวานพอดี',50.00,'https://images.unsplash.com/photo-1556679343-c7306c1976bc?auto=format&fit=crop&w=640&q=80',0,1,'2026-11-11 17:01:32','2026-11-24 20:52:32'),(11,5,'อเมริกาโน่เย็น','กาแฟคั่วกลาง สดชื่นตลอดวัน',60.00,'',0,1,'2026-11-11 17:01:32','2026-11-24 20:32:49'),(12,6,'เฟรนช์ฟรายส์ชีส','มันฝรั่งทอดกรอบนอกนุ่มใน คลุกผงชีสเน้นๆ',69.00,'',0,1,'2026-11-11 17:01:32','2026-11-24 20:32:46'),(13,6,'ปีกไก่ทอดน้ำปลา','ปีกไก่กรอบ รสชาติเค็มหวานกลมกล่อม',89.00,'',0,1,'2026-11-11 17:01:32','2026-11-24 20:32:43'),(14,2,'sephiroth',NULL,400.00,'/images/foods/food_25691118135751663.png',0,1,'2026-11-18 06:57:52','2026-11-24 21:01:56'),(15,1,'เซ็ตสุดคุ้มข้าวกะเพราหมูสับไข่ดาว + ชาไทยเย็น','ข้าวกะเพราหมูสับผัดพริกแห้งหอมกระทะ เสิร์ฟคู่ชาไทยเย็นเข้มข้น',99.00,'https://images.unsplash.com/photo-1563245372-f21724e3856d?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(16,1,'เซ็ตอิ่มคู่ผัดไทยกุ้งสด + ชามะนาว','ผัดไทยเส้นจันท์เหนียวนุ่มกุ้งสดตัวโต พร้อมชามะนาวสดชื่น',109.00,'https://images.unsplash.com/photo-1559314809-0d155014e29e?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(17,1,'เซ็ตข้าวผัดปูจานใหญ่ + ต้มยำกุ้งน้ำข้น','ข้าวผัดปูก้อนโตทานคู่ต้มยำกุ้งแม่น้ำรสจัดจ้าน',219.00,'https://images.unsplash.com/photo-1548943487-a2e4e43b4853?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(18,1,'เซ็ตไก่ทอดกรอบ + เฟรนช์ฟรายส์ชีส','ชุดของทานเล่นสุดคุ้ม ไก่ทอดกรอบนอกนุ่มในคู่เฟรนช์ฟรายส์ชีส',129.00,'https://images.unsplash.com/photo-1562967914-608f82629710?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(19,1,'เซ็ตสเต๊กหมูพริกไทยดำ + สลัดผัก','สเต๊กหมูสันนอกนุ่มชุ่มฉ่ำราดซอสพริกไทยดำ เสิร์ฟพร้อมสลัด',159.00,'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(20,1,'เซ็ตครอบครัวข้าวหน้าเป็ดย่าง + เกี๊ยวซ่า','ข้าวหน้าเป็ดย่างหนังกรอบราดน้ำซอสสูตรพิเศษ คู่เกี๊ยวซ่าทอด',149.00,'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(21,2,'ข้าวผัดกะเพราเนื้อโคขุนไข่ดาว','เนื้อโคขุนสับผัดใบกะเพราแท้หอมกลิ่นกระทะ เสิร์ฟพร้อมไข่ดาวกรอบ',95.00,'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(22,2,'ข้าวผัดกะเพราหมูกรอบไข่ดาวเยิ้ม','หมูกรอบหนังฟูผัดกะเพราพริกขี้หนูสวน รสจัดจ้านถึงเครื่อง',89.00,'https://images.unsplash.com/photo-1569562211093-4ed0d0758f12?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(23,2,'ผัดไทยกุ้งสดห่อไข่','ผัดไทยสูตรโบราณซอสมะขามกลมกล่อม ห่อไข่บางนุ่ม',85.00,'https://images.unsplash.com/photo-1559314809-0d155014e29e?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(24,2,'ข้าวผัดกุ้งแม่น้ำจานโปรด','ข้าวหอมมะลิผัดไฟแรงเรียงเม็ดสวย พร้อมกุ้งแม่น้ำเนื้อเด้ง',79.00,'https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(25,2,'ข้าวผัดปูเนื้อแน่น','ข้าวผัดหอมกลิ่นกระทะใส่เนื้อปูก้อนเน้นๆ เสิร์ฟพร้อมพริกน้ำปลา',95.00,'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(26,2,'ข้าวหมูแดงหมูกรอบราดน้ำฉ่ำ','หมูแดงย่างเตาถ่านคู่หมูกรอบ ราดน้ำซอสสูตรเด็ดของทางร้าน',75.00,'https://images.unsplash.com/photo-1585032226651-759b368d7246?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(27,2,'ข้าวมันไก่ตอนเนื้อนุ่ม','ไก่ตอนต้มสุกกำลังดีเนื้อฉ่ำ เสิร์ฟพร้อมข้าวมันหอมขิงและน้ำจิ้มเต้าเจี้ยว',65.00,'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(28,2,'ข้าวมันไก่ทอดกรอบ','ไก่ชุบแป้งทอดกรอบไม่อมน้ำมัน เสิร์ฟคู่น้ำจิ้มไก่รสเด็ด',65.00,'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(29,2,'ข้าวขาหมูพะโล้ไข่ต้ม','ขาหมูตุ๋นเครื่องเทศพะโล้จนเปื่อยนุ่มละลายในปาก พร้อมผักกาดดอง',75.00,'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(30,2,'ข้าวหน้าเป็ดย่างน้ำผึ้ง','เป็ดย่างหนังบางกรอบเนื้อนุ่ม ราดซอสน้ำผึ้งสูตรพิเศษ',85.00,'https://images.unsplash.com/photo-1518492104633-130d0cc84637?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(31,2,'ข้าวไข่ข้นกุ้งสดซอสต้มยำ','ไข่ข้นเนื้อเนียนนุ่มราดบนข้าวสวย ราดซอสต้มยำกุ้งเข้มข้น',95.00,'https://images.unsplash.com/photo-1525351484163-7529414344d8?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(32,2,'ข้าวหมูกระเทียมพริกไทยไข่ดาว','หมูสันนอกหมักซอสผัดกระเทียมเจียวหอมกรุ่น ทานคู่ไข่ดาว',69.00,'https://images.unsplash.com/photo-1563245372-f21724e3856d?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(33,2,'ข้าวผัดต้มยำทะเลรวมมิตร','ข้าวผัดรสต้มยำถึงเครื่องสมุนไพร จัดเต็มทั้งกุ้งและปลาหมึก',89.00,'https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(34,2,'ผัดซีอิ๊วเส้นใหญ่หมูหมักนุ่ม','เส้นใหญ่ผัดซีอิ๊วดำหอมกลิ่นกระทะไหม้อ่อนๆ หมูหมักนุ่มละมุน',65.00,'https://images.unsplash.com/photo-1585032226651-759b368d7246?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(35,2,'ราดหน้าเส้นใหญ่ทะเลทรงเครื่อง','น้ำราดหน้ากลมกล่อมใส่กุ้งสด ปลาหมึก และยอดคะน้ากรอบ',79.00,'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(36,2,'ก๋วยเตี๋ยวต้มยำสุโขทัย','เส้นเล็กต้มยำถั่วลิสงคั่วหอมใหม่ รสเปรี้ยวหวานเผ็ดลงตัว',65.00,'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(37,2,'ข้าวซอยไก่น่องโต','น้ำแกงข้าวซอยเข้มข้นหอมเครื่องแกงเหนือ น่องไก่ตุ๋นนุ่มเปื่อย',79.00,'https://images.unsplash.com/photo-1548943487-a2e4e43b4853?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(38,2,'สปาเก็ตตี้ขี้เมาทะเล','เส้นสปาเก็ตตี้เหนียวนุ่มผัดพริกกระเทียมใบโหระพาและซีฟู้ดสด',99.00,'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:52:32'),(39,4,'บิงซูสตรอว์เบอร์รีครีมสด','เกล็ดหิมะนมสดเนื้อละเอียด ท็อปด้วยสตรอว์เบอร์รีสดและซอสเบอร์รี',149.00,'https://images.unsplash.com/photo-1563805042-7684c019e1cb?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(40,4,'บิงซูมะม่วงอกร่องทอง','บิงซูนมสดเสิร์ฟพร้อมมะม่วงสุกหวานฉ่ำและซอสมะม่วงเข้มข้น',149.00,'https://images.unsplash.com/photo-1501443762994-82bd5dace89a?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(41,4,'ข้าวเหนียวมะม่วงกะทิสด','ข้าวเหนียวมูนนุ่มหอมใบเตย ทานคู่มะม่วงน้ำดอกไม้สุกและน้ำกะทิ',89.00,'https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(42,4,'โทสต์น้ำผึ้งไอศกรีมวานิลลา','ขนมปังอบเนยกรอบนอกนุ่มใน ราดน้ำผึ้งแท้เสิร์ฟคู่ไอศกรีมวานิลลา',119.00,'https://images.unsplash.com/photo-1484723091739-30a097e8f929?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(43,4,'บราวนี่ช็อกโกแลตฟัดจ์เสิร์ฟพร้อมไอศกรีม','บราวนี่ดาร์กช็อกโกแลตเนื้อหนึบเข้มข้น ทานคู่ไอศกรีมเย็นชื่นใจ',85.00,'https://images.unsplash.com/photo-1564355808539-22fda35bed7e?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(44,4,'แพนเค้กผลไม้รวมราดเมเปิลไซรัป','แพนเค้กเนื้อฟูนุ่ม 3 ชั้น เสิร์ฟพร้อมผลไม้สดและเมเปิลไซรัป',99.00,'https://images.unsplash.com/photo-1528207776546-365bb710ee93?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(45,4,'บัวลอยไข่หวานทรงเครื่อง','แป้งบัวลอยเหนียวนุ่มหลากสีในน้ำกะทิอบควันเทียนหอมหวาน',49.00,'https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(46,4,'ทับทิมกรอบมะพร้าวกะทิ','แห้วเคลือบแป้งสีทับทิมกรุบกรอบ ในน้ำกะทิสดหอมหวานเย็นชื่นใจ',45.00,'https://images.unsplash.com/photo-1563805042-7684c019e1cb?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(47,4,'ชีสเค้กหน้าไหม้ซอสเบอร์รี','บาสก์เบิร์นชีสเค้กเนื้อเนียนละมุน ตัดรสด้วยซอสเบอร์รีเปรี้ยวอมหวาน',95.00,'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(48,5,'ชาไทยเย็นสูตรเข้มข้น','ใบชาไทยแท้ชงสดใหม่ หอมชาเข้มข้น หวานมันกำลังดี',50.00,'https://images.unsplash.com/photo-1556679343-c7306c1976bc?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(49,5,'ชาเขียวมัทฉะลาเต้เย็น','ผงมัทฉะแท้จากญี่ปุ่นตีสด ผสมนมสดหอมมันละมุน',65.00,'https://images.unsplash.com/photo-1515823064-d6e0c04616a7?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(50,5,'อเมริกาโน่เย็นคั่วกลาง','เมล็ดกาแฟอาราบิก้าคั่วกลาง หอมกลิ่นผลไม้และถั่วคั่ว ดื่มง่ายสดชื่น',55.00,'https://images.unsplash.com/photo-1517701604599-bb29b565090c?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(51,5,'คาปูชิโน่เย็นฟองนมนุ่ม','เอสเพรสโซ่ช็อตเข้มข้นท็อปด้วยฟองนมเนียนละเอียด',65.00,'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(52,5,'โกโก้เย็นเข้มข้นปั่นวิปครีม','โกโก้แท้เกรดพรีเมียมปั่นละเอียด ท็อปด้วยวิปปิ้งครีมนุ่มฟู',69.00,'https://images.unsplash.com/photo-1572490122747-3968b75cc699?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(53,5,'ชามะนาวน้ำผึ้งป่า','ชาดำเย็นผสมน้ำมะนาวคั้นสดและน้ำผึ้งแท้ เปรี้ยวหวานชุ่มคอ',50.00,'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(54,5,'อิตาเลียนโซดาสตรอว์เบอร์รี','น้ำสตรอว์เบอร์รีเข้มข้นซ่าสดชื่นด้วยโซดาเย็นจัด',55.00,'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(55,5,'น้ำมะพร้าวน้ำหอมปั่นนมสด','น้ำมะพร้าวน้ำหอมแท้ปั่นเนียนนุ่ม หวานธรรมชาติชื่นใจ',60.00,'https://images.unsplash.com/photo-1544145945-f90425340c7e?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(56,5,'ชานมไข่มุกบราวน์ชูการ์','ชานมไต้หวันหอมละมุน เสิร์ฟพร้อมไข่มุกเคี่ยวซอสบราวน์ชูการ์หนึบหนับ',65.00,'https://images.unsplash.com/photo-1558857563-b371033873b8?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(57,6,'เฟรนช์ฟรายส์คลุกผงชีส','มันฝรั่งแท่งใหญ่ทอดกรอบนอกนุ่มใน คลุกผงชีสเข้มข้น',69.00,'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(58,6,'ปีกไก่ทอดน้ำปลากรอบ','ปีกไก่กลางหมักน้ำปลาแท้ทอดจนหนังกรอบ เสิร์ฟพร้อมน้ำจิ้มแจ่ว',89.00,'https://images.unsplash.com/photo-1527477396000-e27163b481c2?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(59,6,'นักเก็ตไก่กรอบซอสบาร์บีคิว','นักเก็ตเนื้อไก่ล้วนทอดสีเหลืองทอง เสิร์ฟคู่ซอสบาร์บีคิวและซอสมะเขือเทศ',65.00,'https://images.unsplash.com/photo-1562967914-608f82629710?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(60,6,'ปอเปี๊ยะทอดไส้วุ้นเส้นเห็ดหอม','ปอเปี๊ยะแป้งบางกรอบไส้แน่น เสิร์ฟคู่น้ำจิ้มบ๊วยเจี่ยหวานอมเปรี้ยว',65.00,'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(61,6,'เกี๊ยวซ่าหมูย่างกระทะร้อน','เกี๊ยวซ่าไส้หมูสับกะหล่ำปลี ก้นกรอบด้านบนนุ่ม ทานคู่ซอสโชยุเปรี้ยว',75.00,'https://images.unsplash.com/photo-1496116218417-1a781b1c416c?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(62,6,'ทอดมันกุ้งชิ้นโตน้ำจิ้มบ๊วย','เนื้อกุ้งสับคลุกเกล็ดขนมปังทอดกรอบฟู เนื้อเด้งเต็มคำ',95.00,'https://images.unsplash.com/photo-1562967914-608f82629710?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(63,6,'หมูสะเต๊ะพร้อมน้ำจิ้มถั่วและอาจาด','หมูสันนอกหมักเครื่องเทศย่างหอมนุ่ม เสิร์ฟคู่ขนมปังปิ้งและน้ำจิ้มรสเด็ด',89.00,'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58'),(64,6,'ชีสบอลทอดยืด','ชีสมอสซาเรลล่าปั้นก้อนชุบเกล็ดขนมปังทอดร้อนๆ ยืดสะใจ',79.00,'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?auto=format&fit=crop&w=640&q=80',1,0,'2026-11-24 20:43:06','2026-11-24 20:55:58');
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `category` varchar(100) NOT NULL,
  `quantity` decimal(10,2) NOT NULL DEFAULT '0.00',
  `unit` varchar(20) NOT NULL DEFAULT 'Kg',
  `min_stock_alert` decimal(10,2) NOT NULL DEFAULT '10.00',
  `image_url` varchar(500) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'เนื้อหมู','เนื้อสัตว์',11.10,'Kg',5.00,NULL,0,'2026-11-18 09:58:16','2026-11-25 14:18:46'),(2,'tagilla','เครื่องดื่ม',1.00,'ลิตร',1.00,'/images/stocks/stock_25691122171320260.jpg',0,'2026-11-22 10:13:20','2026-11-22 10:13:20');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labstudent`
--

DROP TABLE IF EXISTS `labstudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labstudent` (
  `StdId` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `StdPassword` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `StdName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `StdLastname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`StdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labstudent`
--

LOCK TABLES `labstudent` WRITE;
/*!40000 ALTER TABLE `labstudent` DISABLE KEYS */;
INSERT INTO `labstudent` VALUES ('123','123123','bosss','bosss'),('1232','12345123','bosss','bosss'),('123456','543456','surawat','seangcharoensuklert');
/*!40000 ALTER TABLE `labstudent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `food_id` int NOT NULL,
  `food_name` varchar(150) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_order_items_orders` (`order_id`),
  KEY `fk_order_items_foods` (`food_id`),
  CONSTRAINT `fk_order_items_foods` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`),
  CONSTRAINT `fk_order_items_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,12,'เฟรนช์ฟรายส์ชีส',69.00,3,207.00,'2026-11-11 18:21:02'),(2,1,13,'ปีกไก่ทอดน้ำปลา',89.00,3,267.00,'2026-11-11 18:21:02'),(3,2,11,'อเมริกาโน่เย็น',60.00,1,60.00,'2026-11-11 19:12:08'),(4,2,2,'เซ็ตครอบครัวสเต๊กหมูคอมโบ',299.00,1,299.00,'2026-11-11 19:12:08'),(5,2,3,'ต้มยำกุ้งน้ำข้นหม้อไฟ',180.00,1,180.00,'2026-11-11 19:12:08'),(6,2,4,'แกงส้มชะอมกุ้ง',150.00,1,150.00,'2026-11-11 19:12:08'),(7,3,11,'อเมริกาโน่เย็น',60.00,2,120.00,'2026-11-18 06:50:03'),(8,4,14,'[โปรโมชั่น] โคตรหมู',441.00,1,441.00,'2026-11-18 09:27:25'),(9,5,6,'ผัดไทยกุ้งสด',85.00,2,170.00,'2026-11-21 18:29:49'),(10,5,5,'ข้าวผัดกะเพราเนื้อโคขุนไข่ดาว',95.00,1,95.00,'2026-11-21 18:29:49'),(11,5,7,'ข้าวผัดหมูจานโปรด',65.00,1,65.00,'2026-11-21 18:29:49'),(12,5,10,'ชาไทยเย็นสูตรเข้มข้น',50.00,1,50.00,'2026-11-21 18:29:49'),(13,6,4,'แกงส้มชะอมกุ้ง',150.00,1,150.00,'2026-11-21 19:16:51'),(14,6,5,'ข้าวผัดกะเพราเนื้อโคขุนไข่ดาว',95.00,1,95.00,'2026-11-21 19:16:51'),(15,6,8,'บิงซูสตรอว์เบอร์รี',149.00,1,149.00,'2026-11-21 19:16:51'),(16,6,7,'ข้าวผัดหมูจานโปรด',65.00,1,65.00,'2026-11-21 19:16:51'),(17,7,14,'sephiroth',400.00,1,400.00,'2026-11-24 20:28:24'),(18,7,13,'ปีกไก่ทอดน้ำปลา',89.00,1,89.00,'2026-11-24 20:28:24'),(19,7,12,'เฟรนช์ฟรายส์ชีส',69.00,1,69.00,'2026-11-24 20:28:24'),(20,7,9,'ไอศกรีมวานิลลาท็อปปิ้งบราวนี่',79.00,1,79.00,'2026-11-24 20:28:24');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) NOT NULL,
  `user_id` int DEFAULT NULL,
  `order_type` enum('DELIVERY','DINE_IN') NOT NULL DEFAULT 'DELIVERY',
  `table_number` varchar(20) DEFAULT NULL,
  `delivery_address` text,
  `need_cutlery` tinyint(1) NOT NULL DEFAULT '1',
  `need_sauce` tinyint(1) NOT NULL DEFAULT '1',
  `notes` text,
  `subtotal` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(10,2) NOT NULL,
  `coupon_code` varchar(50) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL DEFAULT 'CASH_ON_DELIVERY',
  `payment_status` enum('PENDING','PAID','FAILED') NOT NULL DEFAULT 'PENDING',
  `status` enum('PENDING','PREPARING','ON_DELIVERY','COMPLETED','CANCELLED') NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number` (`order_number`),
  KEY `fk_orders_users` (`user_id`),
  CONSTRAINT `fk_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'ORD-25691112012101',1,'DELIVERY',NULL,'12351236dafsygdsafhg',1,1,'134613yerhfdshdsdf',474.00,0.00,474.00,NULL,'COD','PAID','COMPLETED','2026-11-11 18:21:02','2026-11-16 09:23:04'),(2,'ORD-25691112021207',1,'DELIVERY',NULL,'asdfgsdfg',1,1,'adsfasdf',689.00,0.00,689.00,NULL,'COD','PAID','COMPLETED','2026-11-11 19:12:08','2026-11-18 06:52:04'),(3,'ORD-25691118135002',1,'DELIVERY',NULL,'234414sr123414s',1,1,'12dsaf1231ssx',120.00,0.00,160.00,NULL,'COD','PAID','COMPLETED','2026-11-18 06:50:02','2026-11-18 06:51:45'),(4,'ORD-25691118162724',1,'DELIVERY',NULL,'sdf23tdsa',1,1,'13tesdf',441.00,0.00,441.00,NULL,'COD','PAID','COMPLETED','2026-11-18 09:27:25','2026-11-25 14:51:02'),(5,'ORD-25691122012948',1,'DELIVERY',NULL,'123/abc/ bangkok',1,1,NULL,380.00,0.00,380.00,NULL,'COD','PAID','COMPLETED','2026-11-21 18:29:49','2026-11-22 12:18:54'),(6,'ORD-25691122021650',7,'DELIVERY',NULL,'sadscxzc2441421342134',1,1,NULL,459.00,0.00,459.00,NULL,'COD','PAID','COMPLETED','2026-11-21 19:16:50','2026-11-21 19:18:00'),(7,'ORD-25691125032823',7,'DELIVERY',NULL,'แขวงสวนจิตรลดา, เขตดุสิต, กรุงเทพมหานคร, 10300, ประเทศไทย (พิกัด: 13.76406, 100.51465)',1,1,'[ระยะทาง 2 กม. | ส่งฟรี]',637.00,0.00,637.00,NULL,'PROMPTPAY','PAID','PENDING','2026-11-24 20:28:24','2026-11-24 20:28:23');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_items`
--

DROP TABLE IF EXISTS `promotion_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `promotion_id` int NOT NULL,
  `food_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_promo_items_promotions` (`promotion_id`),
  KEY `fk_promo_items_foods` (`food_id`),
  CONSTRAINT `fk_promo_items_foods` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`),
  CONSTRAINT `fk_promo_items_promotions` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_items`
--

LOCK TABLES `promotion_items` WRITE;
/*!40000 ALTER TABLE `promotion_items` DISABLE KEYS */;
INSERT INTO `promotion_items` VALUES (1,1,5,1),(2,2,14,1),(3,2,5,1),(4,2,7,1),(5,3,21,1),(6,3,37,1),(7,3,38,1);
/*!40000 ALTER TABLE `promotion_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` text,
  `image_url` varchar(500) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `original_price` decimal(10,2) NOT NULL,
  `special_price` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
INSERT INTO `promotions` VALUES (1,'ข้าวกระเพราะวัว 676767',NULL,'','2026-11-16','2026-11-23',95.00,67.00,28.00,0,1,'2026-11-16 09:32:43','2026-11-24 21:03:41'),(2,'โคตรหมู',NULL,'/images/foods/food_25691118135751663.png','2026-11-18','2026-11-18',560.00,441.00,119.00,0,1,'2026-11-18 09:26:50','2026-11-21 19:17:35'),(3,'เซ็ต FAMILY',NULL,'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?auto=format&fit=crop&w=640&q=80','2026-11-25','2026-12-20',273.00,200.00,73.00,1,0,'2026-11-24 21:04:25','2026-11-24 21:04:25');
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `food_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating` int NOT NULL DEFAULT '5',
  `comment` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_reviews_order` (`order_id`),
  KEY `fk_reviews_food` (`food_id`),
  KEY `fk_reviews_user` (`user_id`),
  CONSTRAINT `fk_reviews_food` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_reviews_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_reviews_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,13,1,5,'อร่อยมาก','2026-11-12 23:58:50'),(2,3,11,1,5,'อร่อยเหาะ','2026-11-18 14:06:34');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'CUSTOMER','ลูกค้าทั่วไป','2026-10-03 17:40:17'),(2,'ADMIN','ผู้ดูแลระบบสูงสุด','2026-10-03 17:40:17'),(3,'MANAGER','ผู้จัดการร้าน ดูแลยอดขายและโปรโมชัน','2026-10-03 17:40:17'),(4,'CHEF','พ่อครัว ดูรายการออเดอร์ในครัว','2026-10-03 17:40:17'),(5,'DELIVERY','พนักงานส่งอาหาร','2026-10-03 17:40:17'),(6,'WAITER','พนักงานบริการ','2026-11-21 16:06:16'),(7,'FINANCE','พนักงานการเงิน','2026-11-21 19:42:07');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_bookings`
--

DROP TABLE IF EXISTS `table_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `customer_name` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `total_member` int NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `status` enum('CONFIRMED','CANCELLED','COMPLETED') NOT NULL DEFAULT 'CONFIRMED',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_bookings_tables` (`table_id`),
  CONSTRAINT `fk_bookings_tables` FOREIGN KEY (`table_id`) REFERENCES `dining_tables` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_bookings`
--

LOCK TABLES `table_bookings` WRITE;
/*!40000 ALTER TABLE `table_bookings` DISABLE KEYS */;
INSERT INTO `table_bookings` VALUES (1,5,1,'surawat','0111111111',10,'2026-11-15','21:00:00','COMPLETED','2026-11-12 17:11:53','2026-11-18 11:28:38'),(2,1,1,'surawat','0111111111',2,'2026-11-30','22:00:00','COMPLETED','2026-11-18 11:20:52','2026-11-18 11:28:41'),(3,5,7,'user','0888888889',10,'2026-11-22','19:00:00','COMPLETED','2026-11-21 19:19:03','2026-11-21 19:19:25');
/*!40000 ALTER TABLE `table_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL DEFAULT '1',
  `phone_number` varchar(20) NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `gender` enum('MALE','FEMALE','OTHER') DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_number` (`phone_number`),
  KEY `fk_users_roles` (`role_id`),
  CONSTRAINT `fk_users_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'0123123123','123456','surawat','saengcharoensuklert','MALE','2005-02-15',0,1,'2026-10-17 11:12:40','2026-11-16 08:13:29'),(2,1,'0548865994','123456','time','tanyathorn','MALE','2005-03-17',1,0,'2026-10-17 12:52:17','2026-11-22 12:22:22'),(3,3,'0123987534','AQAAAAIAAYagAAAAEGNnoe2eeFBDXLkd+Nz2M5ZkVUw2vTCmYSH8JXFKon0f9JQfPJou+rzN+7g33hDBXg==','เดเด้','ดี้ด้่','MALE','1483-10-02',1,0,'2026-10-17 13:10:49','2026-11-25 14:26:39'),(5,1,'0134569867','123456','mixza','pollakrit','MALE','1483-09-30',1,0,'2026-10-17 13:27:16','2026-10-17 13:27:15'),(6,1,'0000000000','1234','bebop','pocketttt','MALE','2020-12-28',1,0,'2026-10-24 14:43:31','2026-10-24 14:43:31'),(7,1,'0999999999','AQAAAAIAAYagAAAAEGNnoe2eeFBDXLkd+Nz2M5ZkVUw2vTCmYSH8JXFKon0f9JQfPJou+rzN+7g33hDBXg==','user','user','MALE','2026-01-14',1,0,'2026-11-21 18:24:52','2026-11-21 18:24:52'),(8,2,'0888888888','AQAAAAIAAYagAAAAEF+ALaxffDGcB0h5XDvPCMzSwYIQqihJz6YH4Av9nVhIcOlg/hLueeCsRkcoKBcl3w==','admin','admin','MALE','2026-11-03',1,0,'2026-11-22 10:01:31','2026-11-22 10:06:12'),(9,7,'0777777777','AQAAAAIAAYagAAAAEEuCkXLADftYkb+Ue5aut7nB43RayUPe+EgzCzs6fz+wHcaJxmhbddFpx3D2lIOqog==','finance','finance','MALE','1483-11-03',1,0,'2026-11-22 10:07:20','2026-11-22 10:07:19'),(10,4,'0555555555','AQAAAAIAAYagAAAAEKmSsTctkOsmoAwrhJFE1oaL86Yb2Aog0pOMAWuAQrfo0MaDhtd/EdVdWndvCxJfWA==','chef','chef','MALE','1483-11-03',1,0,'2026-11-22 10:09:16','2026-11-22 10:09:15'),(11,6,'0222222222','AQAAAAIAAYagAAAAEHS7h+9YOpspp9mydGx0dktPWgrR5zt03Rl0wb4OxNpkatHLnjUsEXr3Pwublj6JrQ==','waiter','waiter','MALE','1483-11-03',1,0,'2026-11-22 10:09:58','2026-11-22 10:09:58'),(12,5,'0333333333','AQAAAAIAAYagAAAAEFMIstLOtX4kZYLkrvnQFD6kA7JhSm6tFVJPgYqlBqzNhNjrCf3pcUNMUrARF3cg8g==','DELIVERY','DELIVERY','MALE','1483-11-04',1,0,'2026-11-22 10:10:41','2026-11-22 10:10:40');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-25 22:29:40
