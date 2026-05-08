USE PizzaCoDB;

-- STORE
INSERT INTO STORE (Phone, City, Address)
VALUES
('714-555-1001', 'Anaheim', '123 Pizza Ave'),
('949-555-2002', 'Irvine', '456 Cheese St'),
('562-555-3003', 'Long Beach', '789 Dough Blvd');


-- CUSTOMER
INSERT INTO CUSTOMER (Name, Phone, Email)
VALUES
('John Smith', '714-111-2222', 'johnsmith@email.com'),
('Sarah Johnson', '949-333-4444', 'sarahj@email.com'),
('Michael Lee', '562-555-6666', 'mlee@email.com');


-- EMPLOYEE
INSERT INTO EMPLOYEE (SSN, Name, HireDate, Role, Wage, Phone, StoreID)
VALUES
('111-11-1111', 'Alice Brown', '2024-01-15', 'Manager', 25.00, '714-888-1111', 1),
('222-22-2222', 'David White', '2024-03-20', 'Cook', 18.50, '714-888-2222', 1),
('333-33-3333', 'Chris Green', '2024-06-10', 'Cashier', 17.00, '949-888-3333', 2),
('444-44-4444', 'Emma Black', '2024-08-01', 'Driver', 19.00, '562-888-4444', 3);


-- INVENTORY ITEMS
INSERT INTO INVENTORY_ITEM (ItemName, ItemType, Unit)
VALUES
('Pizza Dough', 'Ingredient', 'Dough Ball'),
('Mozzarella Cheese', 'Ingredient', 'Grams'),
('Pepperoni', 'Ingredient', 'Slices'),
('Tomato Sauce', 'Ingredient', 'Ounces'),
('Soda Can', 'Beverage', 'Can');


-- PRODUCTS
INSERT INTO PRODUCT (ProductName, Category, Price)
VALUES
('Pepperoni Pizza', 'Pizza', 19.99),
('Cheese Pizza', 'Pizza', 16.99),
('Soda', 'Drink', 2.99);


-- STORE INVENTORY
INSERT INTO STORE_INVENTORY (StoreID, InvItemID, QuantityOnHand, ReorderLevel)
VALUES
(1, 1, 100, 20),
(1, 2, 5000, 1000),
(1, 3, 1000, 200),
(2, 1, 80, 20),
(2, 2, 4000, 1000),
(3, 5, 300, 50);


-- RECIPE
INSERT INTO RECIPE (ProductID, InvItemID, QuantityRequired, UnitAmount)
VALUES
(1, 1, 1, 'Dough Ball'),
(1, 2, 250, 'Grams'),
(1, 3, 30, 'Slices'),
(1, 4, 8, 'Ounces'),

(2, 1, 1, 'Dough Ball'),
(2, 2, 250, 'Grams'),
(2, 4, 8, 'Ounces');


-- ORDERS
INSERT INTO ORDERS (OrderDateTime, Total, Status, CustomerID, StoreID)
VALUES
('2026-05-08 12:30:00', 22.98, 'Completed', 1, 1),
('2026-05-08 13:15:00', 16.99, 'Preparing', 2, 2),
('2026-05-08 14:00:00', 19.99, 'Out for Delivery', 3, 3);


-- DINING ORDER
INSERT INTO DINING_ORDER (OrderID, PartySize, TableNumber)
VALUES
(1, 2, 5);


-- TAKEOUT ORDER
INSERT INTO TAKEOUT_ORDER (OrderID, PickupTime)
VALUES
(2, '2026-05-08 13:45:00');


-- DELIVERY ORDER
INSERT INTO DELIVERY_ORDER (OrderID, DeliveryAddress, EstimatedArrivalTime)
VALUES
(3, '321 Delivery Ln, Long Beach', '2026-05-08 14:30:00');


-- ORDER ITEMS
INSERT INTO ORDER_ITEM (OrderID, ProductID, Quantity, ItemPrice, SpecialInstructions)
VALUES
(1, 1, 1, 19.99, 'Extra cheese'),
(1, 3, 1, 2.99, 'No ice'),
(2, 2, 1, 16.99, 'Well done'),
(3, 1, 1, 19.99, 'No olives');


-- PAYMENT METHODS
INSERT INTO PAYMENT_METHOD (PaymentType, LastFourDigits, CustomerID)
VALUES
('Visa', '1234', 1),
('MasterCard', '5678', 2),
('Cash', '0000', 3);


-- PAYMENTS
INSERT INTO PAYMENT (Amount, PaymentDateTime, OrderID, PaymentMethodID)
VALUES
(22.98, '2026-05-08 12:35:00', 1, 1),
(16.99, '2026-05-08 13:20:00', 2, 2),
(19.99, '2026-05-08 14:05:00', 3, 3);