-- mysql change root password
    ALTER USER user IDENTIFIED BY 'auth_string';
    ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'yourpasswd';

-- show password policy
    SHOW VARIABLES LIKE 'validate_password.%';
    SET GLOBAL validate_password.length = 6;
    SET GLOBAL validate_password.number_count = 0;
    
-- link: https://stackoverflow.com/questions/43094726/your-password-does-not-satisfy-the-current-policy-requirements
-- ####################################################################################################################################################################


-- Updating JSON Array Elements | update key of 0 index of json column

UPDATE invoice_product
-- Set 'tracks' column by removing and updating JSON data
SET tracks = JSON_REMOVE(
    -- Remove 'sale_quantity' key and set 'sales_quantity' key
    JSON_SET(
        tracks, -- Original JSON data to be modified
        '$[0].sales_quantity', -- JSON path to set 'sales_quantity' key
        JSON_EXTRACT(tracks, '$[0].sale_quantity') -- Extract value from 'sale_quantity' key
    ),
    '$[0].sale_quantity' -- JSON path to remove 'sale_quantity' key
)
-- Apply the update only if the JSON array has a length greater than 0
WHERE json_length(tracks) > 0;

-- example:
--     tracks column
--         before: [{"rate": 100, "quantity": 1000, "inventory_id": 1, "sale_quantity": 1000}, {"rate": 100, "quantity": 100, "inventory_id": 3, "sale_quantity": 11}]
--         after: [{"rate": 100, "quantity": 1000, "inventory_id": 1, "sales_quantity": 1000}, {"rate": 100, "quantity": 100, "inventory_id": 3, "sale_quantity": 11}]
-- ####################################################################################################################################################################
