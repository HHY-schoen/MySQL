# ---------------- 聚合函數 aggregate function -----------------
-- 1.員工人數
SELECT COUNT(*) FROM `employee`;
-- 2.出生於1970-01-01後的女性員工
SELECT COUNT(*) FROM `employee` 
WHERE `birth` > '1970-01-01' AND `sex` = 'F';
-- 3.所有員工的平均薪水
SELECT AVG(`salary`) FROM `employee`;
-- 4.員工薪水總和
SELECT SUM(`salary`) FROM `employee`;
-- 5.最高薪水員工
SELECT MAX(`salary`) FROM `employee`;

# ---------------- 萬用字元  wildcard ( % 代表多個字元、 _ 代表一個字元) -----------------
-- 1.電話尾數是335的顧客
SELECT * FROM `client` WHERE `phone`LIKE '%335';
-- 2.姓艾的顧客
SELECT * FROM `client` WHERE `client_name` LIKE '艾%';
-- 3.生日在12月的員工
SELECT * FROM `employee` WHERE `birth` LIKE '_____12%';

# ---------------- 聯集 union -----------------
-- 1.員工名字 union 客戶名字
SELECT `name` FROM `employee` UNION SELECT `client_name` FROM `client`;  #資料的屬性、數量需相同
-- 2.員工id + 員工名字 union 客戶id + 客戶名字
SELECT `emp_id` AS `total_id`, `name` AS `total_name` FROM `employee` 
UNION 
SELECT `client_id`, `client_name` FROM `client`;
-- 3.員工薪水 union 銷售金額
SELECT `salary` AS `TOTAL_MONEY` FROM `employee` 
UNION 
SELECT `total_sale` FROM `work_with`;

# ---------------- 連接 join -----------------
INSERT INTO `branch` VALUES(4,'偷懶' , NULL);
-- 取得所有部門經理的名字
SELECT `emp_id`, `name`, `branch_name` 
FROM `employee` LEFT JOIN `branch`  #join左邊的表格回傳全部、join右邊的表格回傳符合的or NULL
ON `emp_id` = `manager_id`;

# ---------------- 子查詢 subquery -----------------
-- 1.找出研發部門經理的名字
SELECT `name` 
FROM `employee` 
WHERE `emp_id` = (
	SELECT `manager_id` 
    FROM `branch` 
    WHERE `branch_name` = '研發');
-- 2.找出對單一客戶銷售金額超過50000的員工名字
SELECT `name` 
FROM `employee` 
WHERE `emp_id` IN (  #若搜尋結果超過一筆資料用 IN
	SELECT `emp_id` FROM `work_with` WHERE `total_sale` > 50000);

