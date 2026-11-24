
USE gym_management_db;

-- ==========================================
-- VIEW 1: MEMBERSHIP SUMMARY
-- ==========================================

CREATE OR REPLACE VIEW v_membership_summary AS
SELECT
    ms.membership_id,
    m.member_id,
    CONCAT(m.first_name, ' ', m.last_name) AS member_name,
    p.plan_name,
    t.trainer_name,
    ms.start_date,
    ms.end_date,
    ms.status
FROM memberships ms
INNER JOIN members m
    ON ms.member_id = m.member_id
INNER JOIN plans p
    ON ms.plan_id = p.plan_id
LEFT JOIN trainers t
    ON ms.trainer_id = t.trainer_id;


-- ==========================================
-- VIEW 2: PLAN MEMBERSHIP REPORT
-- ==========================================

CREATE OR REPLACE VIEW v_plan_membership_report AS
SELECT
    p.plan_id,
    p.plan_name,
    COUNT(ms.membership_id) AS total_memberships
FROM plans p
LEFT JOIN memberships ms
    ON p.plan_id = ms.plan_id
GROUP BY p.plan_id, p.plan_name;


-- ==========================================
-- VIEW 3: EXPIRING MEMBERSHIPS
-- ==========================================

CREATE OR REPLACE VIEW v_expiring_memberships AS
SELECT
    m.member_id,
    CONCAT(m.first_name, ' ', m.last_name) AS member_name,
    m.phone,
    p.plan_name,
    ms.end_date
FROM memberships ms
INNER JOIN members m
    ON ms.member_id = m.member_id
INNER JOIN plans p
    ON ms.plan_id = p.plan_id
WHERE ms.status = 'ACTIVE'
AND ms.end_date BETWEEN CURRENT_DATE
                    AND DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY);


-- ==========================================
-- TEST THE VIEWS
-- ==========================================

SELECT * FROM v_membership_summary;

SELECT * FROM v_plan_membership_report;

SELECT * FROM v_expiring_memberships;
