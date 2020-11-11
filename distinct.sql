-- 1. From the `track` table find a unique list of all `composer`s.

SELECT DISTINCT composer
FROM track;

-- 2. From the `invoice` table find a unique list of all `billing_postal_code`s.

SELECT DISTINCT billing_postal_code
FROM invoice;

-- 3. From the `customer` table find a unique list of all `company`s.

SELECT DISTINCT company
FROM customer;

