
USE gym_management_db;

-- ==========================================
-- UPDATE OPERATIONS
-- ==========================================

-- UPDATE 1: Change payment status to PENDING
UPDATE payments
SET payment_status = 'PENDING'
WHERE payment_id = 10;

-- Verify UPDATE 1
SELECT payment_id, payment_status
FROM payments
WHERE payment_id = 10;


-- UPDATE 2: Change payment status back to PAID
UPDATE payments
SET payment_status = 'PAID'
WHERE payment_id = 10;

-- Verify UPDATE 2
SELECT payment_id, payment_status
FROM payments
WHERE payment_id = 10;


-- UPDATE 3: Update a member's phone number
-- Create a temporary member first

INSERT INTO members
(first_name, last_name, phone, email, gender, join_date)
VALUES
('Test', 'Member', '9876500199',
 'test.member@example.com', 'Male', CURRENT_DATE);

-- Store the temporary member ID
SET @temp_member_id = LAST_INSERT_ID();

-- Update the temporary member's phone number
UPDATE members
SET phone = '9876500198'
WHERE member_id = @temp_member_id;

-- Verify UPDATE 3
SELECT member_id, first_name, last_name, phone
FROM members
WHERE member_id = @temp_member_id;


-- ==========================================
-- DELETE OPERATIONS
-- ==========================================

-- DELETE 1: Insert and delete a temporary attendance record

INSERT INTO attendance (member_id, check_in_time)
VALUES (1, '2026-11-20 10:00:00');

-- Store the attendance ID
SET @temp_attendance_id = LAST_INSERT_ID();

-- Delete the temporary attendance record
DELETE FROM attendance
WHERE attendance_id = @temp_attendance_id;

-- Verify DELETE 1
SELECT *
FROM attendance
WHERE attendance_id = @temp_attendance_id;


-- DELETE 2: Delete the temporary member created above

DELETE FROM members
WHERE member_id = @temp_member_id;

-- Verify DELETE 2
SELECT *
FROM members
WHERE member_id = @temp_member_id;
