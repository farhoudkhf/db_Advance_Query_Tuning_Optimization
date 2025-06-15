-- Create a table for the olive oil product data
CREATE TABLE products (
    product_id      int primary key,
    product_name    varchar(25),
    category        varchar(50),
    size            int,
    price           decimal(5,2)
);


-- Add data to the products table
INSERT INTO products
    (product_id, product_name, category, size, price)
VALUES
    (5, 'Extra Virgin', 'Olive Oils', 8, 8.99),
    (6, 'Extra Virgin', 'Olive Oils', 16, 12.99),
    (7, 'Extra Virgin', 'Olive Oils', 32, 16.99),
    (10, 'First Cold Press', 'Olive Oils', 8, 8.99),
    (11, 'First Cold Press', 'Olive Oils', 16, 12.99),
    (12, 'First Cold Press', 'Olive Oils', 32, 16.99),
    (13, 'First Cold Press', 'Olive Oils', 64, 20.99),
    (14, 'First Cold Press', 'Olive Oils', 128, 24.99),
    (25, 'Pure', 'Olive Oils', 8, 8.99),
    (26, 'Pure', 'Olive Oils', 16, 12.99),
    (27, 'Pure', 'Olive Oils', 32, 16.99),
    (28, 'Pure', 'Olive Oils', 64, 20.99),
    (29, 'Pure', 'Olive Oils', 128, 24.99),
    (41, 'Basil-Infused EVO', 'Flavor Infused Oils', 8, 10.99),
    (42, 'Basil-Infused EVO', 'Flavor Infused Oils', 16, 14.99),
    (43, 'Basil-Infused EVO', 'Flavor Infused Oils', 32, 18.99),
    (44, 'Rosemary-Infused EVO', 'Flavor Infused Oils', 8, 10.99),
    (45, 'Rosemary-Infused EVO', 'Flavor Infused Oils', 16, 14.99),
    (46, 'Rosemary-Infused EVO', 'Flavor Infused Oils', 32, 18.99),
    (47, 'Garlic-Infused EVO', 'Flavor Infused Oils', 8, 11.99),
    (48, 'Garlic-Infused EVO', 'Flavor Infused Oils', 16, 15.99),
    (49, 'Garlic-Infused EVO', 'Flavor Infused Oils', 32, 19.99),
    (53, 'Olive Glow eye cream', 'Bath and Beauty', 4, 18.99),
    (54, 'Olive Glow face lotion', 'Bath and Beauty', 6, 14.99),
    (55, 'Olive Glow body lotion', 'Bath and Beauty', 12, 12.99),
    (56, 'Olive Glow foot treatment', 'Bath and Beauty', 6, 7.99),
    (57, 'Olive Glow night repair', 'Bath and Beauty', 4, 21.99),
    (58, 'Olive Glow bath gel', 'Bath and Beauty', 16, 9.99),
    (59, 'Olive Glow hand soap', 'Bath and Beauty', 6, 6.99)
;