# Data Dictionary
## Gym Membership Management System

The database `gym_management_db` contains seven tables used to manage gym members, membership plans, trainers, subscriptions, payments, attendance, and membership activity logs.

---

## 1. Members

**Purpose:** Stores personal and contact details of gym members.

| Column | Data Type | Key / Constraint | Description |
|---|---|---|---|
| member_id | INT | Primary Key, AUTO_INCREMENT | Unique member identification |
| first_name | VARCHAR(50) | NOT NULL | Member's first name |
| last_name | VARCHAR(50) | NOT NULL | Member's last name |
| phone | VARCHAR(15) | NOT NULL, UNIQUE | Member's phone number |
| email | VARCHAR(100) | UNIQUE | Member's email address |
| gender | ENUM | Male, Female, Other | Member's gender |
| join_date | DATE | NOT NULL, DEFAULT CURRENT_DATE | Date the member joined |

## 2. Plans

**Purpose:** Stores the different membership plans offered by the gym.

| Column | Data Type | Key / Constraint | Description |
|---|---|---|---|
| plan_id | INT | Primary Key, AUTO_INCREMENT | Unique plan identification |
| plan_name | VARCHAR(50) | NOT NULL, UNIQUE | Name of the membership plan |
| duration_months | INT | NOT NULL, CHECK > 0 | Duration of the plan in months |
| price | DECIMAL(10,2) | NOT NULL, CHECK > 0 | Price of the plan |
| description | VARCHAR(200) | — | Description of the plan |

## 3. Trainers

**Purpose:** Stores gym trainer details and specializations.

| Column | Data Type | Key / Constraint | Description |
|---|---|---|---|
| trainer_id | INT | Primary Key, AUTO_INCREMENT | Unique trainer identification |
| trainer_name | VARCHAR(100) | NOT NULL | Trainer's full name |
| specialization | VARCHAR(100) | — | Trainer's area of specialization |
| phone | VARCHAR(15) | NOT NULL, UNIQUE | Trainer's phone number |
| salary | DECIMAL(10,2) | NOT NULL, CHECK >= 0 | Trainer's salary |
| hire_date | DATE | NOT NULL | Trainer's joining date |

## 4. Memberships

**Purpose:** Connects members with their selected plans and assigned trainers. Tracks membership duration and status.

| Column | Data Type | Key / Constraint | Description |
|---|---|---|---|
| membership_id | INT | Primary Key, AUTO_INCREMENT | Unique membership identification |
| member_id | INT | Foreign Key, NOT NULL | References members(member_id) |
| plan_id | INT | Foreign Key, NOT NULL | References plans(plan_id) |
| trainer_id | INT | Foreign Key | References trainers(trainer_id) |
| start_date | DATE | NOT NULL | Membership start date |
| end_date | DATE | — | Membership expiry date |
| status | ENUM | NOT NULL, DEFAULT 'ACTIVE' | ACTIVE, EXPIRED, or CANCELLED |

## 5. Payments

**Purpose:** Records payments made for gym memberships.

| Column | Data Type | Key / Constraint | Description |
|---|---|---|---|
| payment_id | INT | Primary Key, AUTO_INCREMENT | Unique payment identification |
| membership_id | INT | Foreign Key, NOT NULL | References memberships(membership_id) |
| amount | DECIMAL(10,2) | NOT NULL, CHECK > 0 | Payment amount |
| payment_date | DATETIME | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Date and time of payment |
| payment_method | ENUM | NOT NULL | CASH, UPI, CARD, or BANK_TRANSFER |
| payment_status | ENUM | NOT NULL, DEFAULT 'PENDING' | PAID, PENDING, or FAILED |

## 6. Attendance

**Purpose:** Records gym check-in information for members.

| Column | Data Type | Key / Constraint | Description |
|---|---|---|---|
| attendance_id | INT | Primary Key, AUTO_INCREMENT | Unique attendance identification |
| member_id | INT | Foreign Key, NOT NULL | References members(member_id) |
| check_in_time | DATETIME | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Member's check-in date and time |

## 7. Membership Log

**Purpose:** Maintains an automatic record whenever a new membership is created.

| Column | Data Type | Key / Constraint | Description |
|---|---|---|---|
| log_id | INT | Primary Key, AUTO_INCREMENT | Unique log identification |
| membership_id | INT | NOT NULL | ID of the newly created membership |
| member_id | INT | NOT NULL | ID of the associated member |
| action | VARCHAR(50) | NOT NULL | Description of the recorded action |
| log_date | DATETIME | DEFAULT CURRENT_TIMESTAMP | Date and time of the log entry |

---

## Database Relationships

1. **Members → Memberships:** One member can have multiple memberships.
2. **Plans → Memberships:** One plan can be selected for multiple memberships.
3. **Trainers → Memberships:** One trainer can be assigned to multiple memberships.
4. **Memberships → Payments:** One membership can have multiple payment records.
5. **Members → Attendance:** One member can have multiple attendance records.

## Database Design Notes

- Primary keys uniquely identify records in each table.
- Foreign keys establish relationships between related tables.
- UNIQUE constraints prevent duplicate phone numbers, emails, and plan names where applicable.
- CHECK constraints validate plan duration, plan price, trainer salary, and payment amount.
- ENUM columns restrict values to predefined options.
- The `membership_log` table is populated automatically through an AFTER INSERT trigger.

**Database Name:** `gym_management_db`  
**Database Technology:** MySQL 8.0