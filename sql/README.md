### How to Add tables:
1. Open SQL shell
2. Log into the default database
3. Enter: create database bookstore;
4. Re-open the SQL shell
5. Log into the bookstore database
6. Enter \i 'url-to-Project_DDL.sql' (make sure to replace the \\'s to /'s in the url)
7. Done, open pg4admin to inspect the tables further

### Side Note about User and Order tables:
I was unaware that I could not directly make tables named user and order as these are 
keywords (even though in hindsight this is obvious), so these tables are named "user" and "order" respectively
and must be written this way when performing CRUD operations (with quotes).
