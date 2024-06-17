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
INSERT INTO `category` VALUES ('52', '平板', '0');
INSERT INTO `category` VALUES ('5201', 'Apple', '52');
INSERT INTO `category` VALUES ('520101', 'iPad Pro 2024', '5201');
INSERT INTO `category` VALUES ('520102', 'iPad Mini 7', '5201');
INSERT INTO `category` VALUES ('53', '笔记本', '0');
INSERT INTO `category` VALUES ('5301', 'MacBook', '53');
INSERT INTO `category` VALUES ('530101', 'MacBook Air 2024', '5301');
INSERT INTO `category` VALUES ('530102', 'MacBook Pro 2024', '5301');
INSERT INTO `category` VALUES ('5302', 'Surface', '53');
INSERT INTO `category` VALUES ('530201', 'Surface Pro 8', '5302');
INSERT INTO `category` VALUES ('530202', 'Surface Laptop 5', '5302');
INSERT INTO `category` VALUES (null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '2247', '', '0', '2024-06-15 12:15:47', null);
INSERT INTO `orders` VALUES ('2', '0', null, '0', '2024-06-12 18:50:42', null);
INSERT INTO `orders` VALUES ('3', '0', null, '0', '2024-06-15 11:01:18', null);
INSERT INTO `orders` VALUES ('4', '0', null, '0', '2024-06-15 11:07:23', null);
INSERT INTO `orders` VALUES ('5', '0', null, '0', '2024-06-15 11:08:39', null);
INSERT INTO `orders` VALUES ('6', '0', null, '0', '2024-06-15 11:09:58', null);
INSERT INTO `orders` VALUES ('7', '0', null, '0', '2024-06-15 11:19:46', null);
INSERT INTO `orders` VALUES ('8', '0', null, '0', '2024-06-15 11:44:47', null);
INSERT INTO `orders` VALUES ('9', '0', null, '0', '2024-06-15 11:56:51', null);
INSERT INTO `orders` VALUES ('10', '0', null, '0', '2024-06-15 12:05:40', null);
INSERT INTO `orders` VALUES ('11', '0', null, '0', '2024-06-15 12:06:05', null);
INSERT INTO `orders` VALUES ('12', '0', null, '0', '2024-06-11 10:51:18', null);
INSERT INTO `orders` VALUES ('13', '0', null, '0', '2024-06-11 10:51:49', null);
INSERT INTO `orders` VALUES ('14', '0', null, '0', '2024-06-08 21:45:16', null);
INSERT INTO `orders` VALUES ('15', '0', null, '0', '2024-06-08 21:47:36', null);
INSERT INTO `orders` VALUES ('16', '0', null, '0', '2024-06-08 21:48:11', null);
INSERT INTO `orders` VALUES ('17', '0', null, '0', '2024-06-02 11:04:03', null);
INSERT INTO `orders` VALUES ('18', '0', null, '0', '2024-06-01 14:46:16', null);
INSERT INTO `orders` VALUES ('19', '0', null, '0', '2024-05-18 21:13:05', null);
INSERT INTO `orders` VALUES ('20', '0', null, '0', '2024-05-01 15:12:13', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'Apple', '5099', '122', '510108', '1.png', 'iPhone 15', '黑色');
INSERT INTO `products` VALUES ('2', 'Apple', '7099', '23', '510109', '2.png', 'iPhone 15 Pro', '太空黑');
INSERT INTO `products` VALUES ('3', 'Apple', '11199', '152', '510102', '3.png', 'iPhone 15 Pro Max', '白色');
INSERT INTO `products` VALUES ('4', 'Samsung', '3699', '220', '510201', '4.png', 'Galaxy S24', '白色');
INSERT INTO `products` VALUES ('5', 'Samsung', '4749', '456', '510202', '5.jpg', 'Galaxy S23', '银色');
INSERT INTO `products` VALUES ('6', 'Apple', '6499', '266', '520101', '6.png', 'iPad Pro 2024', '白色');
INSERT INTO `products` VALUES ('7', 'Apple', '3599', '555', '520102', '7.png', 'iPad Mini 7', '白色');
INSERT INTO `products` VALUES ('8', '华为', '5449', '9999', '510301', '8.png', 'Huawei Mate 60 Pro', '白色');
INSERT INTO `products` VALUES ('9', '华为', '5499', '200', '510302', '9.png', 'Huawei Pure 70', '白色');
INSERT INTO `products` VALUES ('10', '小米', '4499', '12', '510401', '10.jpg', 'XiaoMi 14', '黑色');
INSERT INTO `products` VALUES ('11', 'MacBook', '6999', '265', '530101', '11.png', 'MacBook Air 2024', '银色');
INSERT INTO `products` VALUES ('12', 'MacBook', '7299', '999', '530102', '12.jpg', 'MacBook Pro 2024', '银色');
INSERT INTO `products` VALUES ('13', 'Surface', '8399', '999', '530201', '13.jpg', 'Surface Pro 8', '银色');

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
