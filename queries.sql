USE PizzaCoDB;

-- 1. Show all orders placed by each customer
SELECT
    c.CustomerID,
    c.Name AS CustomerName,
    o.OrderID,
    o.OrderDateTime,
    o.Status,
    o.Total
FROM CUSTOMER c
JOIN ORDERS o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID, o.OrderDateTime;


-- 2. Display products included in each order
SELECT
    o.OrderID,
    p.ProductName,
    oi.Quantity,
    oi.ItemPrice,
    oi.SpecialInstructions
FROM ORDERS o
JOIN ORDER_ITEM oi ON o.OrderID = oi.OrderID
JOIN PRODUCT p ON oi.ProductID = p.ProductID
ORDER BY o.OrderID;


-- 3. Calculate total cost of each order from order items
SELECT
    o.OrderID,
    SUM(oi.Quantity * oi.ItemPrice) AS CalculatedTotal
FROM ORDERS o
JOIN ORDER_ITEM oi ON o.OrderID = oi.OrderID
GROUP BY o.OrderID;


-- 4. Calculate total revenue by each store location
SELECT
    s.StoreID,
    s.City,
    s.Address,
    SUM(p.Amount) AS TotalRevenue
FROM STORE s
JOIN ORDERS o ON s.StoreID = o.StoreID
JOIN PAYMENT p ON o.OrderID = p.OrderID
GROUP BY s.StoreID, s.City, s.Address
ORDER BY TotalRevenue DESC;


-- 5. Display number of employees at each store
SELECT
    s.StoreID,
    s.City,
    s.Address,
    COUNT(e.SSN) AS EmployeeCount
FROM STORE s
LEFT JOIN EMPLOYEE e ON s.StoreID = e.StoreID
GROUP BY s.StoreID, s.City, s.Address
ORDER BY s.StoreID;


-- 6. Track low-stock inventory items
SELECT
    s.StoreID,
    s.City,
    ii.ItemName,
    si.QuantityOnHand,
    si.ReorderLevel
FROM STORE_INVENTORY si
JOIN STORE s ON si.StoreID = s.StoreID
JOIN INVENTORY_ITEM ii ON si.InvItemID = ii.InvItemID
WHERE si.QuantityOnHand <= si.ReorderLevel
ORDER BY s.StoreID, ii.ItemName;


-- 7. Most popular products ordered
SELECT
    p.ProductID,
    p.ProductName,
    SUM(oi.Quantity) AS TotalQuantityOrdered
FROM PRODUCT p
JOIN ORDER_ITEM oi ON p.ProductID = oi.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantityOrdered DESC;


-- 8. Show recipe ingredients required for each product
SELECT
    p.ProductName,
    ii.ItemName AS IngredientName,
    r.QuantityRequired,
    r.UnitAmount
FROM RECIPE r
JOIN PRODUCT p ON r.ProductID = p.ProductID
JOIN INVENTORY_ITEM ii ON r.InvItemID = ii.InvItemID
ORDER BY p.ProductName, ii.ItemName;


-- 9. Show payment information for each order
SELECT
    o.OrderID,
    c.Name AS CustomerName,
    p.Amount,
    p.PaymentDateTime,
    pm.PaymentType,
    pm.LastFourDigits
FROM ORDERS o
JOIN CUSTOMER c ON o.CustomerID = c.CustomerID
JOIN PAYMENT p ON o.OrderID = p.OrderID
JOIN PAYMENT_METHOD pm ON p.PaymentMethodID = pm.PaymentMethodID
ORDER BY o.OrderID;


-- 10. Show each order with its order type
SELECT
    o.OrderID,
    o.OrderDateTime,
    o.Status,
    CASE
        WHEN d.OrderID IS NOT NULL THEN 'Dining'
        WHEN t.OrderID IS NOT NULL THEN 'Takeout'
        WHEN del.OrderID IS NOT NULL THEN 'Delivery'
        ELSE 'Unknown'
    END AS OrderType
FROM ORDERS o
LEFT JOIN DINING_ORDER d ON o.OrderID = d.OrderID
LEFT JOIN TAKEOUT_ORDER t ON o.OrderID = t.OrderID
LEFT JOIN DELIVERY_ORDER del ON o.OrderID = del.OrderID
ORDER BY o.OrderID;