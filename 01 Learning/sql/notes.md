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

| Category              | Must-Know Concepts                                    | Why                 |
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


**Types of databases and their use cases**

1. **Relational Databases** (SQL): This is the "old reliable" and the most common type. Data is organized into structured tables with rows and columns, much like an Excel sheet. These tables are linked (related) to each other using unique keys
   The Vibe: Strict, organized, and consistent.
   Key Tech: MySQL, PostgreSQL, Microsoft SQL Server, Oracle.
   Use Cases:Banking Systems: Where every cent must be accounted for (high consistency).
   Inventory Management: Tracking products, suppliers, and orders that all link together.
   E-commerce: Connecting users to their specific orders and profiles

3. **NoSQL Databases (Non-Relational**): NoSQL databases were built for speed and scale. They don’t use strict tables; instead, they store data as documents, graphs, or simple pairs. They are great when your data is "messy" or changes frequently.

  The Vibe: Flexible, fast, and easy to grow.
  Key Tech: MongoDB (Document), Cassandra (Columnar), Redis (Key-Value).
  Use Cases:Social Media Feeds: Posts can have images, videos, or just text; a flexible "document" style fits best.
  Real-time Analytics: Tracking millions of clicks on a website per second.User Profiles: When different users have vastly different sets of information.

  
3. **Graph DatabasesInstead of tables**: these focus on the relationships between data points. They use "nodes" (the items) and "edges" (the connections)

The Vibe: It’s all about who knows whom.
Key Tech: Neo4j, Amazon Neptune.
Use Cases:Recommendation Engines: "People who bought this also liked..."Fraud Detection: Identifying suspicious networks of people sharing the same phone numbers or addresses.Social Networks: Mapping out friends of friends

4. **Time-Series Databases**: These are optimized for data that is measured over time. Everything is a sequence of data points.

   The Vibe: A digital stopwatch recording every second.
   Key Tech: InfluxDB, Prometheus.
   Use Cases:IoT Sensors: Tracking the temperature of a smart fridge every minute.Stock Market: Recording price fluctuations millisecond by millisecond

 6. **Specialized DatabasesVector Databases (The AI Choice)**: Used for AI and Machine Learning. They store data as "embeddings" (numbers) so computers can find similar concepts rather than exact words. (e.g., Pinecone, Milvus).Distributed Databases: Spread across many computers to ensure the system never goes down (e.g., CockroachDB)
  
