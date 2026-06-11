USE customers;
SELECT * FROM customer_shopping_behavior LIMIT 20;

SELECT gender, SUM(`Purchase Amount (USD)`) AS revenue 
FROM customer_shopping_behavior 
GROUP BY gender;

ALTER TABLE customer_shopping_behavior 
RENAME COLUMN `ï»¿Customer ID` TO `Customer ID`;

SELECT `Customer ID`, `Purchase Amount (USD)`
FROM customer_shopping_behavior
WHERE `Discount Applied` = 'Yes'
AND `Purchase Amount (USD)` >= (
    SELECT AVG(`Purchase Amount (USD)`)
    FROM customer_shopping_behavior
);

SELECT `Item Purchased`, ROUND(AVG(`Review Rating`), 2) AS `average product rating`
FROM customer_shopping_behavior
GROUP BY `Item Purchased`
ORDER BY AVG(`Review Rating`) DESC
LIMIT 5;

SELECT `Shipping Type`, 
       AVG(`Purchase Amount (USD)`) AS `avg_purchase_amount`
FROM customer_shopping_behavior
WHERE `Shipping Type` IN ('Standard', 'Express')
GROUP BY `Shipping Type`;

SELECT `Subscription Status`,
       COUNT(`Customer ID`) AS total_customer,
       AVG(`Purchase Amount (USD)`) AS average_spend,
       SUM(`Purchase Amount (USD)`) AS total_spend
FROM customer_shopping_behavior
GROUP BY `Subscription Status`
ORDER BY total_customer, average_spend, total_spend DESC;

use customers;

SELECT `Item Purchased`,
    SUM(CASE WHEN `Discount Applied` = 'yes' THEN 1 ELSE 0 END) / COUNT(*) AS discount_rate
FROM customer_shopping_behavior
GROUP BY `Item Purchased`
ORDER BY discount_rate DESC
LIMIT 5;

-- Q7: Segment customers

SELECT customer_segment, COUNT(*) AS customer_count
FROM (
    SELECT 
        CASE
            WHEN `Previous Purchases` = 1 THEN 'New'
            WHEN `Previous Purchases` BETWEEN 2 AND 10 THEN 'Returning'
            ELSE 'Loyal'
        END AS customer_segment
    FROM customer_shopping_behavior
) AS segmented
GROUP BY customer_segment;


-- Q8: Top 3 most purchased products within each category
WITH item_counts AS (
    SELECT 
        `Category`,
        `Item Purchased`,
        COUNT(`Customer ID`) AS total_orders,
        ROW_NUMBER() OVER (PARTITION BY `Category` ORDER BY COUNT(`Customer ID`) DESC) AS item_rank
    FROM customer_shopping_behavior
    GROUP BY `Category`, `Item Purchased`
)
SELECT `Category`, `Item Purchased`, total_orders
FROM item_counts
WHERE item_rank <= 3
ORDER BY `Category`, total_orders DESC;

-- Q9: Repeat buyers likely to subscribe
SELECT 
    `Subscription Status`,
    COUNT(`Customer ID`) AS repeat_buyers
FROM customer_shopping_behavior
WHERE `Previous Purchases` > 5
GROUP BY `Subscription Status`;

-- Q10: Revenue contribution of each age group
SELECT 
    `Age`,
    SUM(`Purchase Amount (USD)`) AS total_revenue
FROM customer_shopping_behavior
GROUP BY `Age`
ORDER BY total_revenue DESC;

-- Run this first to see all column names
DESCRIBE customer_shopping_behavior;