
USE gym_management_db;

-- Insert membership plans
INSERT INTO plans
(plan_name, duration_months, price, description)
VALUES
('Monthly', 1, 1000.00, 'One month gym membership'),
('Quarterly', 3, 2700.00, 'Three months gym membership'),
('Half Yearly', 6, 5000.00, 'Six months gym membership'),
('Yearly', 12, 9000.00, 'One year gym membership'),
('Bi-Monthly', 2, 1800.00, 'Two months gym membership'),
('Nine Months', 9, 7200.00, 'Nine months gym membership'),
('Two Years', 24, 16000.00, 'Two years gym membership'),
('Student Annual', 12, 7500.00, 'Annual student membership');


-- Insert trainers
INSERT INTO trainers
(trainer_name, specialization, phone, salary, hire_date)
VALUES
('Rahul Sharma', 'Weight Training', '9876500001', 25000.00, '2024-01-15'),
('Priya Singh', 'Yoga and Flexibility', '9876500002', 22000.00, '2023-06-10'),
('Amit Verma', 'Cardio Training', '9876500003', 24000.00, '2024-03-20'),
('Sneha Gupta', 'Strength Training', '9876500004', 28000.00, '2022-11-05'),
('Arjun Mehta', 'Personal Training', '9876500005', 26000.00, '2023-02-14'),
('Neha Kapoor', 'Zumba and Fitness', '9876500006', 23000.00, '2024-04-10'),
('Vikram Patel', 'CrossFit', '9876500007', 30000.00, '2022-08-01'),
('Meera Joshi', 'Nutrition and Wellness', '9876500008', 27000.00, '2023-09-18');


-- Insert gym members
INSERT INTO members
(first_name, last_name, phone, email, gender, join_date)
VALUES
('Aditya', 'Tiwary', '9876510001', 'aditya@anueg.com', 'Male', '2026-01-10'),
('Rohan', 'Das', '9876510002', 'rohan@anueg.com', 'Male', '2026-01-15'),
('Priya', 'Sharma', '9876510003', 'priya@anueg.com', 'Female', '2026-02-01'),
('Ananya', 'Singh', '9876510004', 'ananya@anueg.com', 'Female', '2026-02-12'),
('Rahul', 'Verma', '9876510005', 'rahul@anueg.com', 'Male', '2026-03-05'),
('Sneha', 'Roy', '9876510006', 'sneha@anueg.com', 'Female', '2026-03-15'),
('Amit', 'Kumar', '9876510007', 'amit@anueg.com', 'Male', '2026-04-01'),
('Neha', 'Gupta', '9876510008', 'neha@anueg.com', 'Female', '2026-04-10'),
('Vikash', 'Mishra', '9876510009', 'vikash@anueg.com', 'Male', '2026-04-15'),
('Pooja', 'Mehta', '9876510010', 'pooja@anueg.com', 'Female', '2026-04-20'),
('Karan', 'Malhotra', '9876500099', 'karan.malhotra@anueg.com', 'Male', '2026-11-24');

-- Insert gym memberships
-- The BEFORE INSERT trigger automatically calculates end_date.

INSERT INTO memberships
(membership_id, member_id, plan_id, trainer_id, start_date, status)
VALUES
(1, 1, 4, 1, '2026-01-10', 'ACTIVE'),
(2, 2, 3, 2, '2026-02-15', 'ACTIVE'),
(3, 3, 2, 3, '2026-03-01', 'ACTIVE'),
(4, 4, 1, 4, '2026-04-12', 'EXPIRED'),
(5, 5, 4, 1, '2026-05-05', 'ACTIVE'),
(6, 6, 3, 2, '2026-06-15', 'ACTIVE'),
(7, 7, 2, 3, '2026-07-01', 'ACTIVE'),
(8, 8, 1, 4, '2026-08-10', 'ACTIVE'),
(9, 9, 4, 1, '2026-09-15', 'ACTIVE'),
(10, 10, 3, 2, '2026-10-20', 'ACTIVE'),
(11, 11, 1, 2, '2026-11-24', 'ACTIVE');

-- Insert payment records

INSERT INTO payments
(payment_id, membership_id, amount, payment_date, payment_method, payment_status)
VALUES
(1, 1, 9000.00, '2026-01-10 09:00:00', 'UPI', 'PAID'),
(2, 2, 5000.00, '2026-02-15 10:00:00', 'CASH', 'PAID'),
(3, 3, 2700.00, '2026-03-01 11:00:00', 'CARD', 'PAID'),
(4, 4, 1000.00, '2026-04-12 09:30:00', 'UPI', 'PAID'),
(5, 5, 9000.00, '2026-05-05 10:30:00', 'BANK_TRANSFER', 'PAID'),
(6, 6, 5000.00, '2026-06-15 08:45:00', 'UPI', 'PAID'),
(7, 7, 2700.00, '2026-07-01 12:00:00', 'CASH', 'PAID'),
(8, 8, 1000.00, '2026-08-10 09:15:00', 'CARD', 'PAID'),
(9, 9, 9000.00, '2026-09-15 10:15:00', 'UPI', 'PAID'),
(10, 10, 5000.00, '2026-10-20 11:30:00', 'CASH', 'PAID'),
(11, 11, 1000.00, '2026-11-24 00:24:05', 'UPI', 'PAID');

-- Insert attendance records

INSERT INTO attendance
(attendance_id, member_id, check_in_time)
VALUES
(1, 1, '2026-11-10 07:00:00'),
(2, 2, '2026-11-10 07:30:00'),
(3, 3, '2026-11-11 08:00:00'),
(4, 4, '2026-11-11 09:00:00'),
(5, 5, '2026-11-12 06:45:00'),
(6, 6, '2026-11-12 07:15:00'),
(7, 7, '2026-11-13 08:30:00'),
(8, 8, '2026-11-13 09:15:00'),
(9, 9, '2026-11-14 06:30:00'),
(10, 10, '2026-11-14 07:45:00');
