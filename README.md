#notes

#mysql change user password

-ALTER USER user IDENTIFIED BY 'auth_string';
-ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'yourpasswd';

#show password policy

-SHOW VARIABLES LIKE 'validate_password.%';
-SET GLOBAL validate_password.length = 6;
-SET GLOBAL validate_password.number_count = 0;
-https://stackoverflow.com/questions/43094726/your-password-does-not-satisfy-the-current-policy-requirements
