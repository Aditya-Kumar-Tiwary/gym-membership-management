
USE gym_management_db;

-- ==========================================
-- TRANSACTION 1: COMMIT WITH SAVEPOINT
-- Demonstrate successful transaction management
-- ==========================================

START TRANSACTION;

-- Temporarily update payment status
UPDATE payments
SET payment_status = 'PENDING'
WHERE payment_id = 11;

-- Create a savepoint
SAVEPOINT after_payment_update;

-- Temporarily change membership status
UPDATE memberships
SET status = 'CANCELLED'
WHERE membership_id = 11;

-- Undo the membership status change
ROLLBACK TO SAVEPOINT after_payment_update;

-- Restore the original payment status
UPDATE payments
SET payment_status = 'PAID'
WHERE payment_id = 11;

-- Permanently complete the transaction
COMMIT;

-- Verify Transaction 1
SELECT payment_id, payment_status
FROM payments
WHERE payment_id = 11;

SELECT membership_id, status
FROM memberships
WHERE membership_id = 11;


-- ==========================================
-- TRANSACTION 2: ROLLBACK
-- Demonstrate undoing database changes
-- ==========================================

START TRANSACTION;

-- Temporarily change payment status
UPDATE payments
SET payment_status = 'FAILED'
WHERE payment_id = 11;

-- Undo the transaction
ROLLBACK;

-- Verify Transaction 2
SELECT payment_id, payment_status
FROM payments
WHERE payment_id = 11;
