## Database
A database is essentially a digital filing cabinet. It is an organized collection of structured information, or data, typically stored electronically in a computer system.


### How It Works
A database is like a library:
The Data: The actual information (the books).
The Database: The shelves where everything is organized.
The DBMS (Database Management System): This is the "Librarian." E.g  MySQL. It’s the software that lets you ask for specific information, add new data, or delete old stuff.


It is comprise of entities, attributes and relationships

The Entity (The "Thing")
An entity is a person, place, object, or event that you want to store data about. In a database, an entity usually becomes a Table.

Examples: A Student, a Product, a Car, or a Sale

#PEMDAS

-- # PRAGMA_TABLE_INFO It is a command that helps find information about a table created

PRAGMA_TABLE_INFO(orders)

The Attribute (The "Detail")
An attribute is a specific piece of information that describes the entity. In a database, attributes become the Columns of your table.
Examples: If the entity is a Student, the attributes are Name, Date of Birth, and Email.

Aggregate functions include AVG, MAX, MIN, COUNT

| Category              | Must-Know Concepts                                    | Why Employers Care                 |
| --------------------- | ----------------------------------------------------- | ---------------------------------- |
| **Data Retrieval**    | SELECT, DISTINCT, WHERE, ORDER BY, LIMIT              | Foundation of all analysis         |
| **Filtering**         | AND/OR/NOT, IN, BETWEEN, LIKE, wildcards              | Precision in data extraction       |
| **Aggregation**       | COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING           | Business metric calculation        |
| **Joins**             | INNER, LEFT, RIGHT, FULL, SELF, CROSS                 | Real data is relational            |
| **Subqueries**        | Correlated, non-correlated, EXISTS                    | Complex logic decomposition        |
| **CTEs**              | Recursive and non-recursive                           | Readable, maintainable code        |
| **Window Functions**  | ROW\_NUMBER, RANK, DENSE\_RANK, LEAD, LAG, SUM() OVER | Time-series and ranking analysis   |
| **Data Modification** | INSERT, UPDATE, DELETE, MERGE                         | Data pipeline operations           |
| **Schema Design**     | Primary/foreign keys, normalization, indexing         | Database performance and integrity |
| **Advanced**          | Stored procedures, triggers, views, temp tables       | Production-ready automation        |


