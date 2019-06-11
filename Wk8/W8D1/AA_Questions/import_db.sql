DROP TABLE users;
DROP TABLE questions;
DROP TABLE questions_follows;
DROP TABLE replies;
DROP TABLE question_likes;

PRAGMA foreign_keys = ON;

CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL
);

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    body VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE questions_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    reply_id INTEGER,
    user_id INTEGER NOT NULL,
    body VARCHAR(255) NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)

);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Zac', 'Wilde'),
    ('Andrew', 'James'),
    ('Paul', 'Choi'),
    ('Saul', 'Hudson'),
    ('Savannah', 'Musladin');

INSERT INTO
    questions(title, body, user_id)
VALUES
    ('HELP', 'How do code?',(SELECT id FROM users WHERE fname = 'Savannah' AND lname = 'Musladin')),
    ('HOMEWORK', 'Do I have to do it?',(SELECT id FROM users WHERE fname = 'Paul' AND lname = 'Choi')),
    ('SQL', 'This is hard?',(SELECT id FROM users WHERE fname = 'Saul' AND lname = 'Hudson')),
    ('Ruby', 'Can we go back to ruby?',(SELECT id FROM users WHERE fname = 'Zac' AND lname = 'Wilde')),
    ('Assessment3', 'Can I get the solutions please?',(SELECT id FROM users WHERE fname = 'Andrew' AND lname = 'James'));

INSERT INTO
    questions_follows (question_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'HELP'),
    (SELECT user_id FROM questions WHERE title = 'HELP')),
    ((SELECT id FROM questions WHERE title = 'HOMEWORK'),
    (SELECT user_id FROM questions WHERE title = 'HOMEWORK')),
    ((SELECT id FROM questions WHERE title = 'SQL'),
    (SELECT user_id FROM questions WHERE title = 'SQL')),
    ((SELECT id FROM questions WHERE title = 'Ruby'),
    (SELECT user_id FROM questions WHERE title = 'Ruby')),
    ((SELECT id FROM questions WHERE title = 'Assessment3'),
    (SELECT user_id FROM questions WHERE title = 'Assessment3'));

INSERT INTO 
    replies (question_id, reply_id, user_id, body)
VALUES
   ((SELECT id FROM questions WHERE title = 'HELP'),
    NULL,
    (SELECT id FROM users WHERE fname = 'Andrew' AND lname = 'James'),
    'Idk'),
   ((SELECT id FROM questions WHERE title = 'HOMEWORK'), 
    NULL,
    (SELECT id FROM users WHERE fname = 'Zac' AND lname = 'Wilde'),
    'Yes'), 
   ((SELECT id FROM questions WHERE title = 'SQL'), 
    NULL,
    (SELECT id FROM users WHERE fname = 'Paul' AND lname = 'Choi'),
    'Figure it out'),
   ((SELECT id FROM questions WHERE title = 'Ruby'), 
    NULL,
    (SELECT id FROM users WHERE fname = 'Saul' AND lname = 'Hudson'),
    'Same'),
   ((SELECT id FROM questions WHERE title = 'Assessment3'), 
    NULL,
    (SELECT id FROM users WHERE fname = 'Savannah' AND lname = 'Musladin'),
    'Here''s the zip file');

INSERT INTO
    question_likes (question_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'HELP'),
     (SELECT user_id FROM questions WHERE title = 'HELP')),
    ((SELECT id FROM questions WHERE title = 'HOMEWORK'),
     (SELECT user_id FROM questions WHERE title = 'HELP')),
    ((SELECT id FROM questions WHERE title = 'SQL'),
     (SELECT user_id FROM questions WHERE title = 'HELP')),
    ((SELECT id FROM questions WHERE title = 'Ruby'),
     (SELECT user_id FROM questions WHERE title = 'HELP')),
    ((SELECT id FROM questions WHERE title = 'Assessment3'),
     (SELECT user_id FROM questions WHERE title = 'HELP'));