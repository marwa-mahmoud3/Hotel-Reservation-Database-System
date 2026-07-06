# 🏨 Hotel-Reservation-Database-System

### [ Database Project - 2021 ]

A robust SQL-based backend system designed to manage hotel operations, including customer records, room allocations, and booking transactions. This project demonstrates proficiency in **Relational Database Management Systems (RDBMS)** and advanced **SQL Server** techniques.

---

## 🏗️ Database Architecture

The system is built on a relational schema with three core entities:
* **Customer**: Stores personal information and contact details.
* **Room**: Manages room types (Single/Double) and dynamic pricing.
* **Booking**: Handles the relationship between customers and rooms, tracking check-in/out dates and durations.

---

## 🚀 Key Technical Features

* **Data Integrity**: Implemented using Primary and Foreign Key constraints to ensure consistent relationships.
* **Dynamic Pricing Logic**: Includes SQL scripts for mass price updates based on room categories (e.g., 15% increase for Double rooms).
* **Advanced Analytics**: Complex queries using `JOIN`, `GROUP BY`, and `HAVING` to filter rooms priced below average or track long-stay bookings.
* **Custom Functions**: Features a **Table-valued Function** (`RoomDetials`) that dynamically retrieves specific room information based on input parameters.

---

## 🛠️ Tech Stack
* **RDBMS**: Microsoft SQL Server
* **Language**: T-SQL (Transact-SQL)

---

## 📂 SQL Snippet: Advanced Functionality

```sql
-- Custom Function to fetch room details dynamically
CREATE FUNCTION RoomDetials(@temp int)
RETURNS @t TABLE (Room_No INT, RoomType VARCHAR(50), Price float)
AS
BEGIN
    IF(@temp = 313)
        INSERT INTO @t
        SELECT Room_No, RoomType, Price FROM Room 
        WHERE Room_No = 313
    RETURN
END
```
---

## 👤 Contact Information

**Name:** Marwa Mahmoud El-Khatib

**Email:** [marwa.m.elkhatib@outlook.com](mailto:marwa.m.elkhatib@outlook.com)

**Connect with me:**

- LinkedIn: [marwa-mahmoud-elkhatib](https://www.linkedin.com/in/marwa-mahmoud-elkhatib)
- Portfolio: [marwa-mahmoud-elkhatib.vercel.app](https://marwa-mahmoud-elkhatib.vercel.app/)

---
