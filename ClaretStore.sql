SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `code` int(11) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `fathercode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('51', '手机', '0');
INSERT INTO `category` VALUES ('5101', 'Apple', '51');
INSERT INTO `category` VALUES ('510108', 'iPhone 15', '5101');
INSERT INTO `category` VALUES ('510109', 'iPhone 15 Pro', '5101');
INSERT INTO `category` VALUES ('510102', 'iPhone 15 Pro Max', '5101');
INSERT INTO `category` VALUES ('5102', 'Samsung', '51');
INSERT INTO `category` VALUES ('510201', 'Galaxy S24', '5102');
INSERT INTO `category` VALUES ('510202', 'Galaxy S23', '5102');
INSERT INTO `category` VALUES ('5103', '华为', '51');
INSERT INTO `category` VALUES ('510301', 'Huawei Mate 60 Pro', '5103');
INSERT INTO `category` VALUES ('510302', 'Huawei Pure 70', '5103');
INSERT INTO `category` VALUES ('5104', '小米', '51');
INSERT INTO `category` VALUES ('510401', 'XiaoMi 14', '5104');
INSERT INTO `category` VALUES ('5105', '魅族', '51');
INSERT INTO `category` VALUES ('510501', 'MEIZU 21 Note', '5105');
INSERT INTO `category` VALUES ('52', '平板', '0');
INSERT INTO `category` VALUES ('5201', 'Apple', '52');
INSERT INTO `category` VALUES ('520101', 'iPad Pro 2024', '5201');
INSERT INTO `category` VALUES ('520102', 'iPad Mini 7', '5201');
INSERT INTO `category` VALUES ('53', '笔记本', '0');
INSERT INTO `category` VALUES ('5301', 'MacBook', '53');
INSERT INTO `category` VALUES ('530101', 'MacBook Air 2024', '5301');
INSERT INTO `category` VALUES ('530102', 'MacBook Pro 2024', '5301');
INSERT INTO `category` VALUES ('5302', 'Surface', '53');
INSERT INTO `category` VALUES ('530201', 'Surface Pro 11', '5302');
INSERT INTO `category` VALUES ('530202', 'Surface Laptop 7', '5302');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` double DEFAULT NULL,
  `receiverinfo` varchar(255) DEFAULT NULL,
  `paystate` int(11) DEFAULT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `pnum` int(11) DEFAULT NULL,
  `c3code` int(11) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'Apple', '5099', '122', '510108', '1.jpg', 'iPhone 15', '黑色');
INSERT INTO `products` VALUES ('2', 'Apple', '7099', '23', '510109', '2.jpg', 'iPhone 15 Pro', '太空黑');
INSERT INTO `products` VALUES ('3', 'Apple', '11199', '152', '510102', '3.jpg', 'iPhone 15 Pro Max', '白色');
INSERT INTO `products` VALUES ('4', 'Samsung', '4699', '220', '510201', '4.jpg', 'Galaxy S24', '白色');
INSERT INTO `products` VALUES ('5', 'Samsung', '3549', '456', '510202', '5.jpg', 'Galaxy S23', '银色');
INSERT INTO `products` VALUES ('6', 'Apple', '6499', '266', '520101', '6.jpg', 'iPad Pro 2024', '白色');
INSERT INTO `products` VALUES ('7', 'Apple', '3599', '555', '520102', '7.jpg', 'iPad Mini 7', '白色');
INSERT INTO `products` VALUES ('8', '华为', '5449', '9999', '510301', '8.jpg', 'Huawei Mate 60 Pro', '白色');
INSERT INTO `products` VALUES ('9', '华为', '5499', '200', '510302', '9.jpg', 'Huawei Pura 70', '白色');
INSERT INTO `products` VALUES ('10', '小米', '4499', '12', '510401', '10.jpg', 'Xiaomi 14', '黑色');
INSERT INTO `products` VALUES ('11', 'MacBook', '7999', '265', '530101', '11.jpg', 'MacBook Air 2024', '银色');
INSERT INTO `products` VALUES ('12', 'MacBook', '11299', '999', '530102', '12.jpg', 'MacBook Pro 2024', '银色');
INSERT INTO `products` VALUES ('13', 'Surface', '11188', '999', '530202', '13.jpg', 'Surface Laptop 7', '银色');
INSERT INTO `products` VALUES ('14', '魅族', '2599', '999', '510501', '14.jpg', 'MEIZU 21 Note', '魅族白');
INSERT INTO `products` VALUES ('15', 'Surface', '8688', '999', '530201', '15.jpg', 'Surface Pro 11', '银色');
-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '黄林星', '123', '245922575@qq.com', 'user', '1','2024-06-15 23:20:50');
INSERT INTO `users` VALUES ('2', 'Admin', '123', '111111@qq.com', 'admin', '1','2024-06-15 16:44:18');
