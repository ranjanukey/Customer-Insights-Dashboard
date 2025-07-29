-- 👥 1. Gender-wise customer distribution
SELECT gender, COUNT(*) AS customer_count
FROM customers
GROUP BY gender;

-- 📊 2. Age group-wise customer distribution
SELECT 
  CASE
    WHEN age BETWEEN 21 AND 24 THEN '21-24'
    WHEN age BETWEEN 25 AND 34 THEN '25-34'
    WHEN age BETWEEN 35 AND 45 THEN '35-45'
    ELSE '45+'
  END AS age_group,
  COUNT(*) AS customer_count
FROM customers
GROUP BY age_group;

-- 🏙️ 3. City-wise customer count
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city;

-- 👔 4. Occupation-wise customer count
SELECT occupation, COUNT(*) AS customer_count
FROM customers
GROUP BY occupation;

-- 💍 5. Marital status distribution
SELECT marital_status, COUNT(*) AS customer_count
FROM customers
GROUP BY marital_status;

-- 💸 6. Total income and total spend across all customers
SELECT 
  ROUND(SUM(income), 2) AS total_income,
  ROUND(SUM(spend), 2) AS total_spend,
  ROUND((SUM(spend) / SUM(income)) * 100, 2) AS income_utilization_percentage
FROM customers;

-- 🛒 7. Total spend by spending category
SELECT category, SUM(spend_amount) AS total_spend
FROM transactions
GROUP BY category
ORDER BY total_spend DESC;

-- 💼 8. Total spend by occupation
SELECT c.occupation, SUM(t.spend_amount) AS total_spend
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.occupation
ORDER BY total_spend DESC;

-- 🌆 9. Total spend by city
SELECT c.city, SUM(t.spend_amount) AS total_spend
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.city
ORDER BY total_spend DESC;

-- 💑 10. Total spend by marital status
SELECT c.marital_status, SUM(t.spend_amount) AS total_spend
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.marital_status;

-- 💳 11. Spend by payment type (overall)
SELECT payment_type, SUM(spend_amount) AS total_spend
FROM transactions
GROUP BY payment_type;

-- 🔄 12. Spend by payment type and marital status
SELECT 
  c.marital_status,
  t.payment_type,
  SUM(t.spend_amount) AS total_spend
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.marital_status, t.payment_type
ORDER BY c.marital_status, total_spend DESC;

-- 📈 13. Spend by payment type and occupation
SELECT 
  c.occupation,
  t.payment_type,
  SUM(t.spend_amount) AS total_spend
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.occupation, t.payment_type
ORDER BY c.occupation, total_spend DESC;

-- 🧓 14. Spend by payment type and age group
SELECT 
  CASE
    WHEN age BETWEEN 21 AND 24 THEN '21-24'
    WHEN age BETWEEN 25 AND 34 THEN '25-34'
    WHEN age BETWEEN 35 AND 45 THEN '35-45'
    ELSE '45+'
  END AS age_group,
  t.payment_type,
  SUM(t.spend_amount) AS total_spend
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY age_group, t.payment_type
ORDER BY age_group, total_spend DESC;

-- 🌍 15. Spend by city and payment type
SELECT 
  c.city,
  t.payment_type,
  SUM(t.spend_amount) AS total_spend
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.city, t.payment_type
ORDER BY c.city, total_spend DESC;

-- ⚥ 16. Spend by gender and payment type
SELECT 
  c.gender,
  t.payment_type,
  SUM(t.spend_amount) AS total_spend
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.gender, t.payment_type
ORDER BY c.gender, total_spend DESC;

-- 📅 17. Monthly spend by payment type
SELECT 
  FORMAT(transaction_date, 'MMMM') AS month,
  payment_type,
  SUM(spend_amount) AS total_spend
FROM transactions
GROUP BY FORMAT(transaction_date, 'MMMM'), payment_type
ORDER BY month;
