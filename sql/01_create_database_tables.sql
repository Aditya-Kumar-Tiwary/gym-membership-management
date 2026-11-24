
CREATE DATABASE IF NOT EXISTS gym_management_db;

USE gym_management_db;

-- 1. Members table
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    gender ENUM('Male', 'Female', 'Other'),
    join_date DATE NOT NULL DEFAULT (CURRENT_DATE)
) ENGINE=InnoDB;

-- 2. Plans table
CREATE TABLE plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(50) NOT NULL UNIQUE,
    duration_months INT NOT NULL CHECK (duration_months > 0),
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    description VARCHAR(200)
) ENGINE=InnoDB;

-- 3. Trainers table
CREATE TABLE trainers (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    trainer_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(15) NOT NULL UNIQUE,
    salary DECIMAL(10,2) NOT NULL CHECK (salary >= 0),
    hire_date DATE NOT NULL
) ENGINE=InnoDB;

-- 4. Memberships table
CREATE TABLE memberships (
    membership_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    plan_id INT NOT NULL,
    trainer_id INT,
    start_date DATE NOT NULL,
    end_date DATE,
    status ENUM('ACTIVE', 'EXPIRED', 'CANCELLED')
        NOT NULL DEFAULT 'ACTIVE',
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (plan_id) REFERENCES plans(plan_id),
    FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id)
) ENGINE=InnoDB;

-- 5. Payments table
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    membership_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    payment_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('CASH', 'UPI', 'CARD', 'BANK_TRANSFER')
        NOT NULL,
    payment_status ENUM('PAID', 'PENDING', 'FAILED')
        NOT NULL DEFAULT 'PENDING',
    FOREIGN KEY (membership_id) REFERENCES memberships(membership_id)
) ENGINE=InnoDB;

-- 6. Attendance table
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    check_in_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
) ENGINE=InnoDB;

-- Indexes
CREATE INDEX idx_memberships_end_date ON memberships(end_date);
CREATE INDEX idx_payments_payment_date ON payments(payment_date);
CREATE INDEX idx_attendance_check_in ON attendance(check_in_time);

-- 7. Membership log table
CREATE TABLE membership_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    membership_id INT NOT NULL,
    member_id INT NOT NULL,
    action VARCHAR(50) NOT NULL,
    log_date DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
