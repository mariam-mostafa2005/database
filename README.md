# 🗄️ Database Project

<div align="center">

### Comprehensive Database Management & Design System

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Database](https://img.shields.io/badge/Database-PostgreSQL%20%26%20MongoDB-336791?style=flat-square&logo=postgresql)]()
[![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=flat-square)]()
[![GitHub](https://img.shields.io/badge/GitHub-mariam--mostafa2005-121011?style=flat-square&logo=github)](https://github.com/mariam-mostafa2005)

---

**A professional database management system showcasing advanced SQL/NoSQL design patterns, optimization techniques, and best practices for scalable data architecture.**

</div>

---

## 📌 Project Description

This comprehensive database project demonstrates professional-level database design, implementation, and optimization. It includes multiple database solutions using both **relational databases (PostgreSQL, MySQL)** and **NoSQL databases (MongoDB)**, showcasing real-world scenarios and enterprise-grade patterns.

### 🎯 Project Goals

- ✨ Demonstrate advanced database design principles
- 🔧 Implement production-ready database schemas
- 📊 Showcase data modeling best practices
- 🚀 Provide scalable and optimized query patterns
- 💡 Document common database use cases and solutions

---

## ✨ Features

### 🗂️ Database Design

- ✅ **Relational Database Schemas** - Normalized SQL designs with proper relationships
- ✅ **NoSQL Document Models** - Flexible MongoDB collections with validation
- ✅ **Advanced Indexing** - Performance optimization with strategic indexes
- ✅ **Query Optimization** - Complex queries with execution plans
- ✅ **Data Integrity** - Foreign keys, constraints, and triggers
- ✅ **Transactions & ACID** - Ensuring data consistency

### 🔍 Query Examples

- ✅ **CRUD Operations** - Complete create, read, update, delete examples
- ✅ **Complex Joins** - Multiple table joins and aggregations
- ✅ **Stored Procedures** - Reusable database logic
- ✅ **Transactions** - Multi-step operations with rollback capability
- ✅ **Window Functions** - Advanced analytical queries
- ✅ **Aggregations** - Group by, having, sub-queries

### 🛡️ Security & Performance

- ✅ **Prepared Statements** - SQL injection prevention
- ✅ **Connection Pooling** - Efficient database connections
- ✅ **Backup & Recovery** - Data protection strategies
- ✅ **User Permissions** - Role-based access control (RBAC)
- ✅ **Performance Monitoring** - Query analysis and optimization
- ✅ **Data Validation** - Input sanitization and constraints

### 📈 Advanced Features

- ✅ **Replication Setup** - Master-slave database replication
- ✅ **Sharding Strategy** - Horizontal scaling implementation
- ✅ **Caching Layer** - Redis integration for performance
- ✅ **Migration Scripts** - Version control for schema changes
- ✅ **Monitoring & Logging** - Database health checks

---

## 🛠️ Technologies Used

### 🗄️ Database Management Systems

<div align="center">

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=flat-square&logo=postgresql&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB-47A248?style=flat-square&logo=mongodb&logoColor=white)
![Redis](https://img.shields.io/badge/Redis-DC382D?style=flat-square&logo=redis&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-003B57?style=flat-square&logo=sqlite&logoColor=white)

</div>

### 🔧 Tools & Utilities

<div align="center">

![DBeaver](https://img.shields.io/badge/DBeaver-372923?style=flat-square&logo=dbeaver&logoColor=white)
![pgAdmin](https://img.shields.io/badge/pgAdmin-336791?style=flat-square&logo=postgresql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=flat-square&logo=git&logoColor=white)

</div>

### 💻 Backend Integration

<div align="center">

![Node.js](https://img.shields.io/badge/Node.js-339933?style=flat-square&logo=nodedotjs&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![Python](https://img.shields.io/badge/Django-092E20?style=flat-square&logo=django&logoColor=white)
![Express](https://img.shields.io/badge/Express-000000?style=flat-square&logo=express&logoColor=white)

</div>

---

## 📊 Database Schema

### 🔗 Relational Database (SQL) Architecture

```
┌─────────────────┐
│    USERS        │
├─────────────────┤
│ user_id (PK)    │
│ username        │
│ email           │
│ password_hash   │
│ created_at      │
│ updated_at      │
└────────┬────────┘
         │
         │ 1:N
         │
┌────────▼──────────┐
│    PROJECTS       │
├───────────────────┤
│ project_id (PK)   │
│ user_id (FK)      │
│ title             │
│ description       │
│ status            │
│ created_at        │
└────────┬──────────┘
         │
         │ 1:N
         │
┌────────▼──────────────┐
│      TASKS           │
├──────────────────────┤
│ task_id (PK)         │
│ project_id (FK)      │
│ title                │
│ description          │
│ priority             │
│ status               │
│ due_date             │
│ assigned_to (FK)     │
│ created_at           │
└──────────────────────┘
```

### 📋 Core Tables Definition

#### **USERS Table**
```sql
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    profile_picture_url TEXT,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_username (username)
);
```

#### **PROJECTS Table**
```sql
CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    status ENUM('active', 'completed', 'archived') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_user_id (user_id),
    INDEX idx_status (status)
);
```

#### **TASKS Table**
```sql
CREATE TABLE tasks (
    task_id SERIAL PRIMARY KEY,
    project_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    priority ENUM('low', 'medium', 'high', 'critical') DEFAULT 'medium',
    status ENUM('todo', 'in_progress', 'review', 'completed') DEFAULT 'todo',
    due_date DATE,
    assigned_to INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE,
    FOREIGN KEY (assigned_to) REFERENCES users(user_id) ON DELETE SET NULL,
    INDEX idx_project_id (project_id),
    INDEX idx_assigned_to (assigned_to),
    INDEX idx_status (status),
    INDEX idx_due_date (due_date)
);
```

#### **TASKS_HISTORY Table (Audit Trail)**
```sql
CREATE TABLE tasks_history (
    history_id SERIAL PRIMARY KEY,
    task_id INT NOT NULL,
    action VARCHAR(50) NOT NULL,
    old_value JSON,
    new_value JSON,
    changed_by INT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (task_id) REFERENCES tasks(task_id) ON DELETE CASCADE,
    FOREIGN KEY (changed_by) REFERENCES users(user_id) ON DELETE SET NULL,
    INDEX idx_task_id (task_id),
    INDEX idx_changed_at (changed_at)
);
```

### 🔄 Key Relationships

| Table | Relationship | Target Table | Type |
|-------|-------------|--------------|------|
| PROJECTS | user_id → user_id | USERS | Many-to-One |
| TASKS | project_id → project_id | PROJECTS | Many-to-One |
| TASKS | assigned_to → user_id | USERS | Many-to-One |
| TASKS_HISTORY | task_id → task_id | TASKS | Many-to-One |

### 🏗️ NoSQL (MongoDB) Document Structure

```javascript
// Users Collection
{
  _id: ObjectId,
  username: "mariam_mostafa",
  email: "mariam@example.com",
  profile: {
    firstName: "Mariam",
    lastName: "Mostafa",
    avatar: "https://...",
    bio: "Full Stack Developer"
  },
  preferences: {
    theme: "dark",
    notifications: true
  },
  createdAt: ISODate("2024-01-15"),
  updatedAt: ISODate("2024-05-15")
}

// Projects Collection
{
  _id: ObjectId,
  userId: ObjectId,
  title: "E-Commerce Platform",
  description: "Building scalable e-commerce system",
  status: "active",
  tags: ["nodejs", "react", "mongodb"],
  createdAt: ISODate("2024-01-15"),
  updatedAt: ISODate("2024-05-15")
}

// Tasks Collection
{
  _id: ObjectId,
  projectId: ObjectId,
  title: "Implement Payment Gateway",
  description: "Integrate Stripe payment system",
  priority: "high",
  status: "in_progress",
  assignedTo: ObjectId,
  dueDate: ISODate("2024-06-01"),
  subtasks: [
    { title: "API Integration", completed: true },
    { title: "Testing", completed: false }
  ],
  comments: [
    {
      userId: ObjectId,
      text: "Started working on this",
      createdAt: ISODate()
    }
  ],
  createdAt: ISODate("2024-01-15"),
  updatedAt: ISODate("2024-05-15")
}
```

---

## 🚀 How to Run

### Prerequisites

Before you begin, ensure you have the following installed:

- 🐘 **PostgreSQL** (v12 or higher) or **MySQL** (v8.0+)
- 🍃 **MongoDB** (v5.0+) - Optional for NoSQL examples
- 🐳 **Docker & Docker Compose** - For containerized setup
- 📦 **Git** - For version control
- 💻 **Any SQL Client** - DBeaver, pgAdmin, or MySQL Workbench

### 📥 Installation Steps

#### **Option 1: Using Docker (Recommended)**

```bash
# Clone the repository
git clone https://github.com/mariam-mostafa2005/database.git
cd database

# Start PostgreSQL and MongoDB with Docker
docker-compose up -d

# Verify containers are running
docker-compose ps
```

#### **Option 2: Manual Setup**

**PostgreSQL Setup:**
```bash
# Connect to PostgreSQL
psql -U postgres

# Create database
CREATE DATABASE project_management;

# Connect to the database
\c project_management

# Run the initialization script
\i sql/01_init_database.sql
\i sql/02_create_tables.sql
\i sql/03_create_indexes.sql
\i sql/04_create_triggers.sql
```

**MongoDB Setup:**
```bash
# Start MongoDB service
mongod

# Connect to MongoDB
mongosh

# Create database
use project_management_nosql

# Import collections
db.users.insertMany([...])
db.projects.insertMany([...])
db.tasks.insertMany([...])
```

### 📂 Project Structure

```
database/
├── sql/
│   ├── 01_init_database.sql          # Database initialization
│   ├── 02_create_tables.sql          # Table creation
│   ├── 03_create_indexes.sql         # Index optimization
│   ├── 04_create_triggers.sql        # Database triggers
│   ├── 05_sample_data.sql            # Sample data
│   └── 06_queries_examples.sql       # Query examples
├── mongodb/
│   ├── collections_schema.js         # MongoDB schemas
│   ├── sample_data.js                # Sample documents
│   └── queries_examples.js           # Query examples
├── nodejs/
│   ├── models/                       # Data models
│   ├── controllers/                  # Database operations
│   ├── routes/                       # API endpoints
│   └── config/                       # Database config
├── docker-compose.yml                # Docker configuration
├── .env.example                      # Environment variables
├── README.md                         # This file
└── LICENSE                           # MIT License
```

### 🔌 Database Connection

#### **PostgreSQL Connection String**
```env
DATABASE_URL=postgresql://user:password@localhost:5432/project_management
```

#### **MongoDB Connection String**
```env
MONGO_URL=mongodb://localhost:27017/project_management_nosql
```

#### **Environment Configuration**
```bash
# Copy example environment file
cp .env.example .env

# Update with your credentials
nano .env
```

---

## 📖 Usage Examples

### ✅ SQL Queries

#### **Create User**
```sql
INSERT INTO users (username, email, password_hash, first_name, last_name)
VALUES ('mariam_mostafa', 'mariam@example.com', 'hashed_password', 'Mariam', 'Mostafa');
```

#### **Get User Projects**
```sql
SELECT p.project_id, p.title, p.description, p.status, COUNT(t.task_id) as total_tasks
FROM projects p
LEFT JOIN tasks t ON p.project_id = t.project_id
WHERE p.user_id = 1
GROUP BY p.project_id, p.title
ORDER BY p.created_at DESC;
```

#### **Get High Priority Tasks**
```sql
SELECT t.task_id, t.title, t.priority, t.status, u.username
FROM tasks t
LEFT JOIN users u ON t.assigned_to = u.user_id
WHERE t.priority = 'high' AND t.status != 'completed'
ORDER BY t.due_date ASC;
```

#### **Complex Join - Task Details with Assignee**
```sql
SELECT 
    t.task_id,
    t.title,
    t.description,
    t.priority,
    t.status,
    t.due_date,
    p.title as project_name,
    u.username as assigned_to,
    creator.username as created_by
FROM tasks t
INNER JOIN projects p ON t.project_id = p.project_id
LEFT JOIN users u ON t.assigned_to = u.user_id
INNER JOIN users creator ON p.user_id = creator.user_id
WHERE t.status IN ('todo', 'in_progress')
ORDER BY t.priority DESC, t.due_date ASC;
```

### 🔄 MongoDB Queries

#### **Find User by Email**
```javascript
db.users.findOne({ email: "mariam@example.com" })
```

#### **Get All Projects for User**
```javascript
db.projects.find({ 
    userId: ObjectId("...") 
}).sort({ createdAt: -1 })
```

#### **Get Tasks by Priority**
```javascript
db.tasks.aggregate([
    { $match: { priority: "high", status: { $ne: "completed" } } },
    { $lookup: {
        from: "users",
        localField: "assignedTo",
        foreignField: "_id",
        as: "assignee"
    }},
    { $sort: { dueDate: 1 } }
])
```

---

## 🔒 Security Best Practices

- ✅ Use **prepared statements** to prevent SQL injection
- ✅ Implement **input validation** on all queries
- ✅ Use **role-based access control (RBAC)**
- ✅ Encrypt **sensitive data** at rest and in transit
- ✅ Implement **audit trails** for data changes
- ✅ Use **connection pooling** for performance
- ✅ Regular **backups** and disaster recovery plans
- ✅ Implement **database monitoring** and alerting

---

## 📊 Performance Optimization

### 🔍 Query Optimization Techniques

- ✅ **Strategic Indexing** - Index frequently queried columns
- ✅ **Query Execution Plans** - Analyze and optimize slow queries
- ✅ **Denormalization** - Trade storage for query performance when needed
- ✅ **Caching** - Use Redis for frequently accessed data
- ✅ **Partitioning** - Split large tables by date ranges
- ✅ **Connection Pooling** - Reuse database connections

### 📈 Monitoring

```sql
-- Check slow queries
SELECT query, calls, mean_time 
FROM pg_stat_statements 
ORDER BY mean_time DESC 
LIMIT 10;

-- Table size analysis
SELECT schemaname, tablename, pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) AS size
FROM pg_tables
WHERE schemaname NOT IN ('pg_catalog', 'information_schema')
ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;

-- Index effectiveness
SELECT schemaname, tablename, indexname, idx_scan, idx_tup_read, idx_tup_fetch
FROM pg_stat_user_indexes
ORDER BY idx_scan DESC;
```

---

## 🧪 Testing

### Run Tests
```bash
# Install dependencies
npm install

# Run unit tests
npm run test

# Run integration tests
npm run test:integration

# Run with coverage
npm run test:coverage
```

### Test Coverage
- ✅ Database connection tests
- ✅ CRUD operation tests
- ✅ Complex query tests
- ✅ Transaction tests
- ✅ Performance tests

---

## 📚 Documentation

### 📖 Available Documentation

- `docs/DATABASE_SCHEMA.md` - Detailed schema documentation
- `docs/QUERY_GUIDE.md` - Common query patterns
- `docs/OPTIMIZATION_TIPS.md` - Performance optimization guide
- `docs/BACKUP_RECOVERY.md` - Backup and recovery procedures
- `docs/TROUBLESHOOTING.md` - Common issues and solutions

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

---

## 📝 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 🤝 Support & Contact

Need help? Feel free to reach out:

<div align="center">

[![Email](https://img.shields.io/badge/Email-mariam.2023013450@bua.edu.eg-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:mariam.2023013450@bua.edu.eg)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-mariam--mostafa-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mariam-mostafa-bba7783b7)
[![GitHub](https://img.shields.io/badge/GitHub-mariam--mostafa2005-121011?style=for-the-badge&logo=github&logoColor=white)](https://github.com/mariam-mostafa2005)

</div>

---

## 🙏 Acknowledgments

- PostgreSQL documentation and community
- MongoDB best practices
- Database design patterns and principles
- Open source database tools and utilities

---

<div align="center">

### ⭐ If you found this helpful, please star the repository! ⭐

**Last Updated:** May 15, 2026  
**Status:** ✅ Active & Maintained  
**Version:** 1.0.0

</div>
