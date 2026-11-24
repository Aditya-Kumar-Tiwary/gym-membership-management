
USE gym_management_db;

-- ==========================================
-- TRIGGER 1: BEFORE INSERT
-- Automatically calculates membership end date
-- ==========================================

DELIMITER $$

CREATE TRIGGER trg_membership_before_insert
BEFORE INSERT ON memberships
FOR EACH ROW
BEGIN
    DECLARE v_duration INT;

    SELECT duration_months
    INTO v_duration
    FROM plans
    WHERE plan_id = NEW.plan_id;

    SET NEW.end_date =
        DATE_ADD(NEW.start_date, INTERVAL v_duration MONTH);
END$$

DELIMITER ;


-- ==========================================
-- TRIGGER 2: AFTER INSERT
-- Automatically logs new memberships
-- ==========================================

DELIMITER $$

CREATE TRIGGER trg_membership_after_insert
AFTER INSERT ON memberships
FOR EACH ROW
BEGIN
    INSERT INTO membership_log
    (membership_id, member_id, action)
    VALUES
    (NEW.membership_id, NEW.member_id,
     'NEW MEMBERSHIP CREATED');
END$$

DELIMITER ;


-- ==========================================
-- VERIFY TRIGGERS
-- ==========================================

SHOW TRIGGERS;
