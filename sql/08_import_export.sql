
USE gym_management_db;

-- ==========================================
-- 1. IMPORT MEMBERS FROM CSV
-- ==========================================

-- CSV file must be placed in MySQL's
-- secure_file_priv upload directory.

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/members_import.csv'
INTO TABLE members
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(first_name, last_name, phone, email, gender);


-- ==========================================
-- 2. EXPORT MEMBERSHIP SUMMARY TO CSV
-- ==========================================

SELECT
    membership_id,
    member_name,
    plan_name,
    trainer_name,
    start_date,
    end_date,
    status
FROM v_membership_summary
INTO OUTFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/gym_membership_summary_export.csv'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';


-- ==========================================
-- 3. EXPORT EXPIRING MEMBERSHIPS TO CSV
-- ==========================================

SELECT
    member_id,
    member_name,
    phone,
    plan_name,
    end_date
FROM v_expiring_memberships
INTO OUTFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/expiring_memberships_export.csv'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';
