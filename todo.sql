CREATE TABLE todos (
	id SERIAL PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	details VARCHAR(2000),
	priority INTEGER DEFAULT (1),
	created_at timestamp NOT NULL,
	completed_at date
);

ALTER TABLE todos ALTER COLUMN created_at TYPE timestamp without time zone[] USING created_at::date[];

ALTER TABLE todos DROP COLUMN created_at;
ALTER TABLE todos DROP COLUMN completed_at;

ALTER TABLE "public"."todos"
  ALTER COLUMN "created_at" TYPE timestamp without time zone,
  ALTER COLUMN "created_at" SET DEFAULT (null);

-- Write INSERT statements to insert five todos into this table, with one of them completed.

INSERT INTO todos (title, details, created_at, completed_at) VALUES ('Fix front right tire', 'was fixed last Thursday and the tire with the slow leak was worked on too', '2017-08-27 18:30:00', '2017-08-30 18:30:00');

INSERT INTO todos (title, details, created_at, completed_at) VALUES ('Fix rear right tire', 'was worked on last Thursday and I thought it was fixed but it went flat again', '2017-09-02 14:30:00', '2017-09-05 12:30:00');

INSERT INTO todos (title, details, created_at) VALUES ('Sign up for health insurance', 'have received multiple emails. deadline is Sept 11th', '2017-08-12 12:30:00');

INSERT INTO todos (title, details, created_at) VALUES ('buy groceries', 'will need milk again in a week or so', '2017-09-05 12:30:00');

INSERT INTO todos (title) VALUES ('pet insurance');

-- Write a SELECT statement to find all incomplete todos.
SELECT title FROM todos WHERE completed_at IS NULL;

-- Write a SELECT statement to find all todos with a priority above 1.

-- First:
UPDATE todos SET priority = 4 WHERE completed_at IS NULL;

-- Then:
SELECT title FROM todos WHERE priority > 1;

-- Write an UPDATE statement to complete one todo by its id. Your ids may differ, so you will choose the id to up.
UPDATE todos SET completed_at=now() WHERE id=2;

-- Write a DELETE statement to delete all completed todos.
DELETE FROM todos WHERE completed_at IS NOT NULL;
