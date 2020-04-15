CREATE TABLE data(state VARCHAR(255), date DATE, tests INT, positive INT, editor VARCHAR(255), notes VARCHAR(255)) WITH SYSTEM VERSIONING;

INSERT INTO data VALUE ("PA", "2020-04-14", 102, 21, "asilverstein", "initial");
INSERT INTO data VALUE ("PA", "2020-04-15", 178, 45, "asilverstein", "initial");

UPDATE data SET tests=104, positive=23, editor="jkodysh", notes="PA missed two positive cases" WHERE state="PA" AND date="2020-04-14";

SELECT * FROM data;
SELECT * FROM data FOR SYSTEM_TIME ALL;
SELECT * FROM data FOR SYSTEM_TIME AS OF TIMESTAMP'2020-04-15 17:48:00';
SELECT * FROM data FOR SYSTEM_TIME AS OF TIMESTAMP'2020-04-15 17:50:00';
