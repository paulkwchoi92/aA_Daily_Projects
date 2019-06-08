CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price INTEGER,
    color VARCHAR(50), 
    breed VARCHAR(50) 
);

CREATE TABLE toys (
    id SERIAL PRIMARY KEY,
    price INTEGER,
    color VARCHAR(50),
    name VARCHAR(50)
);

CREATE TABLE cattoys (
    id SERIAL PRIMARY KEY,
    cat_id INTEGER, 
    toy_id INTEGER, 
    FOREIGN KEY(cat_id) REFERENCES cats (id),
    FOREIGN KEY(toy_id) REFERENCES toys (id)
);


INSERT INTO 
  cats (name, price, color, breed)
VALUES
   ('spotty', 20, 'black_white', 'maine_coon');

INSERT INTO 
  cats (name, price, color, breed)
VALUES
   ('banana', 30, 'yellow', 'shorthair');

INSERT INTO 
  cats (name, price, color, breed)
VALUES
   ('ivy', 4, 'grey', 'persian');
   
INSERT INTO 
  cats (name, price, color, breed)
VALUES
   ('garfield', 2, 'orange_black', 'fatcat');
   
INSERT INTO 
  cats (name, price, color, breed)
VALUES
   ('sam', 45, 'black', 'shorthair');

INSERT INTO
    toys (price, color, name)
VALUES
    (3.00, 'red', 'power ranger');

INSERT INTO
    toys (price, color, name)
VALUES
    (5.00, 'green', 'tennisball');

INSERT INTO
    toys (price, color, name)
VALUES
    (99.00, 'blue', 'hot wheel');
    
INSERT INTO
    toys (price, color, name)
VALUES
    (3.67, 'white', 'toymouse');

INSERT INTO
    toys (price, color, name)
VALUES
    (4.78, 'black', 'toyjerry');


INSERT INTO
    cattoys (cat_id, toy_id)
VALUES
    ((SELECT 
      id
    FROM
      cats
    WHERE 
      name = 'spotty'),
      (SELECT
         id
       FROM
         toys
       WHERE 
      toys.name = 'power ranger')
      );

INSERT INTO
    cattoys (cat_id, toy_id)
VALUES
    ((SELECT 
      id
    FROM
      cats
    WHERE 
      name = 'banana'
      LIMIT 1),
      (SELECT
         id
       FROM
         toys
       WHERE 
      toys.name = 'tennisball'
      LIMIT 1)
      );

INSERT INTO
    cattoys (cat_id, toy_id)
VALUES
    ((SELECT 
      id
    FROM
      cats
    WHERE 
      name = 'ivy'
      LIMIT 1),
      (SELECT
         id
       FROM
         toys
       WHERE 
      toys.name = 'hot wheel'
      LIMIT 1)
      );


      INSERT INTO
    cattoys (cat_id, toy_id)
VALUES
    ((SELECT 
      id
    FROM
      cats
    WHERE 
      name = 'garfield'
      LIMIT 1),
      (SELECT
         id
       FROM
         toys
       WHERE 
      toys.name = 'toymouse'
      LIMIT 1)
      );

INSERT INTO
    cattoys (cat_id, toy_id)
VALUES
    ((SELECT 
      id
    FROM
      cats
    WHERE 
      name = 'sam'
      LIMIT 1),
      (SELECT
         id
       FROM
         toys
       WHERE 
      toys.name = 'toyjerry'
      LIMIT 1)
      );


EXPLAIN ANALYZE
INSERT INTO
    cattoys
    (cat_id, toy_id)
VALUES
    ((SELECT
        id
      FROM
        cats
      WHERE 
        name = 'sam'),
      (SELECT
         id
       FROM
         toys
       WHERE 
      toys.name = 'toyjerry')
      );


EXPLAIN ANALYZE
SELECT 
 name 
FROM toys

WHERE 
price < 10; 