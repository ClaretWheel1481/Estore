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
INSERT INTO `category` VALUES ('5103', 'Huawei', '51');
INSERT INTO `category` VALUES ('510301', 'Huawei Mate 60 Pro', '5103');
INSERT INTO `category` VALUES ('510302', 'Huawei Pure 70', '5103');
INSERT INTO `category` VALUES ('510303', 'Huawei nova 12 Ultra','5103');
INSERT INTO `category` VALUES ('510304', 'Huawei Mate X5', '5103');
INSERT INTO `category` VALUES ('5104', 'XiaoMi', '51');
INSERT INTO `category` VALUES ('510401', 'XiaoMi 14', '5104');
INSERT INTO `category` VALUES ('510402','Redmi K70E', '5104');
INSERT INTO `category` VALUES ('5105', 'MEIZU', '51');
INSERT INTO `category` VALUES ('510501', 'MEIZU 21 Note', '5105');
INSERT INTO `category` VALUES ('510502', 'MEIZU 20 INFINITY', '5105');
INSERT INTO `category` VALUES ('510503','MEIZU 21','5105');
INSERT INTO `category` VALUES ('52', '平板', '0');
INSERT INTO `category` VALUES ('5201', 'Apple', '52');
INSERT INTO `category` VALUES ('520101', 'iPad Pro 2024', '5201');
INSERT INTO `category` VALUES ('520102', 'iPad Mini 7', '5201');
INSERT INTO `category` VALUES ('53', '笔记本', '0');
INSERT INTO `category` VALUES ('5301', 'MacBook', '53');
INSERT INTO `category` VALUES ('530101', 'MacBook Air 2024', '5301');
INSERT INTO `category` VALUES ('530102', 'MacBook Pro 2024', '5301');
INSERT INTO `category` VALUES ('5302', 'Microsoft', '53');
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
  `fathercode` int(11) DEFAULT NULL,
  `c3code` int(11) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'Apple', '5099', '122', '5101','510108', '1.jpg', 'iPhone 15', '黑色');
INSERT INTO `products` VALUES ('2', 'Apple', '7099', '23', '5101','510109', '2.jpg', 'iPhone 15 Pro', '太空黑');
INSERT INTO `products` VALUES ('3', 'Apple', '11199', '152', '5101','510102', '3.jpg', 'iPhone 15 Pro Max', '白色');
INSERT INTO `products` VALUES ('4', 'Samsung', '4699', '220', '5102','510201', '4.jpg', 'Galaxy S24', '白色');
INSERT INTO `products` VALUES ('5', 'Samsung', '3549', '456', '5102','510202', '5.jpg', 'Galaxy S23', '银色');
INSERT INTO `products` VALUES ('6', 'Apple', '6499', '266', '5201','520101', '6.jpg', 'iPad Pro 2024', '白色');
INSERT INTO `products` VALUES ('7', 'Apple', '3599', '555', '5201','520102', '7.jpg', 'iPad Mini 7', '白色');
INSERT INTO `products` VALUES ('8', 'Huawei', '5449', '9999', '5103','510301', '8.jpg', 'Huawei Mate 60 Pro', '白色');
INSERT INTO `products` VALUES ('9', 'Huawei', '5499', '200', '5103','510302', '9.jpg', 'Huawei Pura 70', '白色');
INSERT INTO `products` VALUES ('10', 'XiaoMi', '4499', '12', '5104','510401', '10.jpg', 'Xiaomi 14', '黑色');
INSERT INTO `products` VALUES ('11', 'MacBook', '7999', '265', '5301','530101', '11.jpg', 'MacBook Air 2024', '银色');
INSERT INTO `products` VALUES ('12', 'MacBook', '11299', '999', '5301','530102', '12.jpg', 'MacBook Pro 2024', '银色');
INSERT INTO `products` VALUES ('13', 'Microsoft', '11188', '999', '5301','530202', '13.jpg', 'Surface Laptop 7', '银色');
INSERT INTO `products` VALUES ('14', 'MEIZU', '2599', '999', '5105','510501', '14.jpg', 'MEIZU 21 Note', '魅族白');
INSERT INTO `products` VALUES ('15', 'Microsoft', '8688', '999', '5302','530201', '15.jpg', 'Surface Pro 11', '银色');
INSERT INTO `products` VALUES ('16', 'MEIZU', '3599', '123', '5105','510502', '16.jpg', 'MEIZU 20 INFINITY', '黑色');
INSERT INTO `products` VALUES ('17', 'XiaoMi', '1799', '123', '5104','510402', '17.jpg', 'Redmi K70E', '绿色');
INSERT INTO `products` VALUES ('18', 'Huawei', '4699', '123', '5103','510303', '18.jpg', 'Huawei nova 12 Ultra', '黑色');
INSERT INTO `products` VALUES ('19', 'MEIZU', '3999', '123', '5105','510503', '19.jpg', 'MEIZU 21', '魅族白');
INSERT INTO `products` VALUES ('20', 'Huawei', '12999', '123', '5103','510304', '20.jpg', 'Huawei Mate X5', '深绿色');
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
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '黄林星', '123', '245922575@qq.com', 'user','2024-06-15 23:20:50');
INSERT INTO `users` VALUES ('2', 'Admin', '123', '111111@qq.com', 'admin','2024-06-15 16:44:18');
