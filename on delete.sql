# ---------------- 聯集 union -----------------
CREATE TABLE `branch`(
	`branch_id` INT PRIMARY KEY,
    `branch_name` VARCHAR(20) ,
    `manager_id` INT,
    FOREIGN KEY (`manager_id`) REFERENCES `employee`(`emp_id`) ON DELETE SET NULL  #對應不到資料就設成NULL (primary key不可為NULL)
    ) DEFAULT CHARSET=utf8;
    
    CREATE TABLE `work_with`(
	`emp_id` INT,
    `client_id` INT,
    `total_sale` INT,
    PRIMARY KEY(`emp_id`,`client_id`),
    FOREIGN KEY(`emp_id`) REFERENCES `employee`(`emp_id`) ON DELETE CASCADE,  #對應不到資料就刪除
    FOREIGN KEY(`client_id`) REFERENCES `client`(`client_id`) ON DELETE CASCADE
    );
    
    DELETE FROM `employee` WHERE `emp_id` = 207;
    SELECT * FROM `branch`;
    
    SELECT * FROM `work_with`;
    