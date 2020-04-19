CREATE DATABASE strawman;
USE strawman;

CREATE TABLE batch (
    batch_id INT NOT NULL AUTO_INCREMENT,
    push_time DATETIME,
    shift_lead VARCHAR(100), -- Or possibly a foreign key to a users table
    commit_note VARCHAR(255),
    daily_commit BOOLEAN,
    PRIMARY KEY (batch_id)
);

CREATE TABLE data (
    state VARCHAR(50),
    data_date DATE,
    tests INT,
    positive INT,
    checker VARCHAR(100),
    double_checker VARCHAR(100),
    public_notes VARCHAR(255),
    batch_id INT,
    CONSTRAINT `fk_batch`
      FOREIGN KEY (batch_id) REFERENCES batch(batch_id)
      ON DELETE NO ACTION
);

INSERT INTO batch (push_time, shift_lead, commit_note, daily_commit) VALUES ("2020-03-20", "asilverstein", "Alex is testing", FALSE);

INSERT INTO data (state, data_date, tests, positive, checker, double_checker, public_notes, batch_id) VALUES ("PA", "2020-03-20", 130, 72, "asilverstein", "jkodysh", "nothing to see here", 1);
INSERT INTO data (state, data_date, tests, positive, checker, double_checker, public_notes, batch_id) VALUES ("NY", "2020-03-20", 168, 98, "asilverstein", "jkodysh", "still nothing to see here", 1);

INSERT INTO batch (push_time, shift_lead, commit_note, daily_commit) VALUES ("2020-03-21", "asilverstein", "Next day!", FALSE);
INSERT INTO data (state, data_date, tests, positive, checker, double_checker, public_notes, batch_id) VALUES ("PA", "2020-03-21", 140, 78, "asilverstein", "jkodysh", "nothing to see here", 2);
INSERT INTO data (state, data_date, tests, positive, checker, double_checker, public_notes, batch_id) VALUES ("NY", "2020-03-21", 212, 138, "asilverstein", "jkodysh", "still nothing to see here", 2);
