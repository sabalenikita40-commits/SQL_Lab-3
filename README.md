Bank Database – Entity Relationship (ER) Diagram
1. Project Overview
The Bank Database ER Diagram is a database design project created using MySQL Workbench. It represents the structure of a banking system by identifying entities, their attributes, primary keys, foreign keys, and relationships between different entities.

The database is designed to manage essential banking information, including customer details, bank accounts, financial transactions, loans, and branch information.

The ER diagram provides a visual representation of how data is organized and connected within the database. It helps understand the logical structure of the banking system before implementing the database using SQL commands.

2. Project Objectives
To design a structured database for a banking system.
To identify the main entities required to manage banking operations.
To define attributes for each entity.
To establish primary keys for uniquely identifying records.
To use foreign keys to establish relationships between tables.
To represent one-to-many relationships using an ER diagram.
To reduce unnecessary data duplication through proper database design.
To understand relational database modeling using MySQL Workbench.
3. Entities and Tables
The database consists of five main entities:

Customer
Accounts
Transactions
Loan
Branches
3.1 Customer Table
The customer table stores personal information about customers who use banking services.

Attributes:

Column Name	Data Type	Description
Customer_id	INT	Unique identifier for each customer; Primary Key
First_name	VARCHAR(50)	Customer's first name
Last_name	VARCHAR(50)	Customer's last name
Email	VARCHAR(100)	Customer's email address
phone	VARCHAR(20)	Customer's contact number
DateofBirth	DATE	Customer's date of birth
Purpose: This table maintains customer information and allows customers to be associated with their bank accounts and loans.

3.2 Accounts Table
The accounts table stores details of bank accounts maintained by customers.

Attributes:

Column Name	Data Type	Description
Account_id	INT	Unique identifier for each account; Primary Key
Account_type	VARCHAR(20)	Type of account, such as Savings or Current
balance	FLOAT	Current account balance
c_id	INT	References the customer who owns the account; Foreign Key
branch_id	INT	References the branch managing the account; Foreign Key
Purpose: This table connects customers with their accounts and identifies the branch associated with each account.

3.3 Transactions Table
The transactions table records financial activities performed through bank accounts.

Attributes:

Column Name	Data Type	Description
Transaction_id	INT	Unique identifier for each transaction; Primary Key
Transaction_date	DATE	Date on which the transaction occurred
Amount	FLOAT	Amount involved in the transaction
Transaction_type	VARCHAR(20)	Type of transaction, such as Deposit or Withdrawal
account_id	INT	References the associated bank account; Foreign Key
Purpose: This table maintains transaction records and allows multiple transactions to be associated with a single account.

Note: The screenshot displays account_id twice in this table. Keep only one column if both entries represent the same foreign key.

3.4 Loan Table
The loan table stores information about loans provided to customers by the bank.

Attributes:

Column Name	Data Type	Description
Loan_id	INT	Unique identifier for each loan; Primary Key
Loan_amount	FLOAT	Total amount of the loan
Intrest_rate	FLOAT	Interest rate applicable to the loan
Start_date	DATE	Date on which the loan begins
End_date	DATE	Loan maturity or end date
customer_id	INT	References the customer associated with the loan; Foreign Key
Purpose: This table maintains loan details and establishes a relationship between customers and their loans.

Note: The column appears as Intrest_rate in the screenshot. Consider renaming it to Interest_rate to correct the spelling.

3.5 Branches Table
The branches table stores information about the bank's branches.

Attributes:

Column Name	Data Type	Description
Branch_id	INT	Unique identifier for each branch; Primary Key
Branch_name	VARCHAR(100)	Name of the bank branch
Branch_address	VARCHAR(200)	Physical address of the branch
Branch_phone	VARCHAR(15)	Contact number of the branch
Purpose: This table maintains branch information and allows multiple bank accounts to be associated with a particular branch.

4. Primary Keys
A primary key uniquely identifies each record in a table. It cannot contain duplicate values or NULL values.

The primary keys used in this database are:

customer.Customer_id
accounts.Account_id
transactions.Transaction_id
loan.Loan_id
branches.Branch_id
Each primary key helps maintain the uniqueness and integrity of the records stored in its respective table.

5. Foreign Keys
A foreign key is a column that references a primary key or another eligible unique key in a related table. It establishes a relationship between tables and helps maintain referential integrity.

The foreign key relationships in this design are:

Foreign Key	References
accounts.c_id	customer.Customer_id
accounts.branch_id	branches.Branch_id
transactions.account_id	accounts.Account_id
loan.customer_id	customer.Customer_id
Benefits of foreign keys:

Connect related tables.
Prevent references to nonexistent parent records.
Maintain consistency between related data.
Reduce the need to repeat complete customer or branch details in other tables.
6. Relationships Between Tables
6.1 Customer and Accounts
Relationship: One-to-Many (1:N)

One customer can own multiple bank accounts, while each account is associated with one customer in this design.

Example: A customer may have both a Savings Account and a Current Account.

The relationship is implemented through accounts.c_id, which references customer.Customer_id.

6.2 Accounts and Transactions
Relationship: One-to-Many (1:N)

One bank account can have multiple transactions, while each transaction belongs to one account.

Example: An account may have multiple deposits, withdrawals, and transfers over time.

The relationship is implemented through transactions.account_id, which references accounts.Account_id.

6.3 Branches and Accounts
Relationship: One-to-Many (1:N)

One branch can manage multiple bank accounts, while each account is associated with one branch in this design.

Example: A branch may maintain hundreds of customer accounts.

The relationship is implemented through accounts.branch_id, which references branches.Branch_id.

6.4 Customer and Loan
Relationship: One-to-Many (1:N)

One customer can have multiple loans, while each loan is associated with one customer in this design.

Example: A customer may have a home loan and a personal loan.

The relationship is implemented through loan.customer_id, which references customer.Customer_id.

7. ER Diagram Structure
The overall database structure can be summarized as follows:

Customer connects to Accounts.
Customer connects to Loan.
Accounts connects to Transactions.
Branches connects to Accounts.
These relationships form the logical structure of the banking database and show how information is connected across the five tables.

8. Tools and Technologies Used
MySQL Workbench

MySQL Workbench is a visual database design and administration tool. It was used to create the ER diagram, define table structures, specify column data types, identify primary and foreign keys, and represent relationships between entities.

Relational Database Concepts

The project uses relational database principles, including entities, attributes, primary keys, foreign keys, and one-to-many relationships.

9. Advantages of the Database Design
Structured data: Information is organized into separate tables based on its purpose.
Data consistency: Primary and foreign keys help maintain reliable relationships.
Reduced duplication: Customer, branch, and account information can be stored separately rather than repeated across every record.
Maintainability: Changes to one entity can be managed without unnecessarily duplicating information in other tables.
Scalability: Additional banking features can be introduced by extending the database design.
Clear relationships: The ER diagram makes the connections between customers, accounts, transactions, loans, and branches easier to understand.
10. Possible Improvements
The current diagram provides a basic banking database structure. It can be improved further by:

Using DECIMAL(12,2) instead of FLOAT for monetary values.
Adding suitable NOT NULL, UNIQUE, and CHECK constraints.
Ensuring that all foreign keys reference the correct parent-table primary keys.
Removing the duplicate account_id column from the Transactions table.
Adding a transaction status or reference number where required.
Defining appropriate rules for updating and deleting related records.
Considering a separate loan-payment table if repayment history needs to be recorded.
These improvements can make the database more reliable and suitable for a more complete banking application.

11. Learning Outcomes
Through this project, I learned how to:

Design an Entity-Relationship diagram using MySQL Workbench.
Identify entities and their attributes.
Assign primary keys to database tables.
Establish foreign key relationships between related tables.
Represent one-to-many relationships.
Understand the importance of referential integrity.
Organize data according to relational database principles.
Identify opportunities to improve database consistency and design.
12. Conclusion
The Bank Database ER Diagram demonstrates the fundamental concepts of relational database design through five entities: Customer, Accounts, Transactions, Loan, and Branches.

By defining primary keys, foreign keys, and relationships, the design provides a foundation for organizing customer information, managing accounts, recording financial transactions, tracking loans, and maintaining branch details.

This project strengthened my understanding of database modeling and the use of MySQL Workbench for designing relational databases.

Project Name: Bank Database ER Diagram
Domain: Banking System
Tool Used: MySQL Workbench
Project Type: Database Design
