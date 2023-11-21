---------------- 創建公司資料庫表格 ----------------
show databases;
use sql_test;
show tables;

# 創建員工表
CREATE TABLE `employee`(
	`emp_id` INT PRIMARY KEY,
    `name` VARCHAR(20) ,
    `birth` DATE,
    `sex` VARCHAR(1),
    `salary` INT,
    `branch_id` INT,
    `sup_id` INT
    ) DEFAULT CHARSET=utf8;
    
#創建部門表
CREATE TABLE `branch`(
	`branch_id` INT PRIMARY KEY,
    `branch_name` VARCHAR(20) ,
    `manager_id` INT,
    FOREIGN KEY (`manager_id`) REFERENCES `employee`(`emp_id`) ON DELETE SET NULL
    ) DEFAULT CHARSET=utf8;

#員工表外鍵設定
ALTER TABLE `employee`
ADD FOREIGN KEY(`branch_id`)
REFERENCES `branch`(`branch_id`)
ON DELETE SET NULL;

ALTER TABLE `employee`
ADD FOREIGN KEY(`sup_id`) REFERENCES `employee`(`emp_id`) ON DELETE SET NULL;

#創建客戶表
CREATE TABLE `client`(
	`client_id` INT PRIMARY KEY,
    `client_name` VARCHAR(20),
    `phone` VARCHAR(20)
     ) DEFAULT CHARSET=utf8;
     
#創建work with表
CREATE TABLE `work_with`(
	`emp_id` INT,
    `client_id` INT,
    `total_sale` INT,
    PRIMARY KEY(`emp_id`,`client_id`),
    FOREIGN KEY(`emp_id`) REFERENCES `employee`(`emp_id`) ON DELETE CASCADE,
    FOREIGN KEY(`client_id`) REFERENCES `client`(`client_id`) ON DELETE CASCADE
    );

# ----------------- 插入資料 --------------------
#先插入部門資料，將manager_id設為NULL，再建立員工資料，才不會出現錯誤訊息
INSERT INTO `branch` VALUES(1,'研發',NULL);
INSERT INTO `branch` VALUES(2,'行政',NULL);
INSERT INTO `branch` VALUES(3,'資訊',NULL);

INSERT INTO `employee` VALUES(206,'小黃','1999-10-08','F',50000,1,NULL);
INSERT INTO `employee` VALUES(207,'小綠','1985-09-16','M',29000,2,206);
INSERT INTO `employee` VALUES(208,'小黑','2000-12-19','M',35000,3,206);
INSERT INTO `employee` VALUES(209,'小白','1997-01-22','F',39000,3,207); 
INSERT INTO `employee` VALUES(210,'小藍','1925-11-10','F',84000,1,207);

UPDATE `branch`
SET `manager_id` =208 WHERE `branch_id` = 3;

#插入客戶資料
INSERT INTO `client` VALUES(400, '阿狗', '254354335');
INSERT INTO `client` VALUES(401, '阿貓', '25633899');
INSERT INTO `client` VALUES(402, '旺來', '45354345');
INSERT INTO `client` VALUES(403, '露西', '54354365');
INSERT INTO `client` VALUES(404, '艾瑞克', '18783783');

#插入銷售資料
INSERT INTO `work_with` VALUES(206, 400, 70000);
INSERT INTO `work_with` VALUES(207, 401, 24000);
INSERT INTO `work_with` VALUES(208, 402, 9800);
INSERT INTO `work_with` VALUES(208, 403, 24000);
INSERT INTO `work_with` VALUES(210, 404, 87940);

# ------------------ 練習 --------------------
-- 1.取得所有員工資料
SELECT * FROM `employee`;
-- 2.取得所有客戶資料
SELECT * FROM `client`;
-- 3.按薪水低到高取員工資料
SELECT * FROM `employee` ORDER BY 'salary';
-- 4.薪水前高的3個員工
SELECT * FROM `employee` ORDER BY 'salary' DESC LIMIT 3;
-- 5.所有員工名字
SELECT DISTINCT `branch_id` FROM `employee`;

