DROP DATABASE test;

CREATE DATABASE test;

USE test;

DROP TABLE assignment2;

CREATE TABLE assignment2 (
  id int(11) NOT NULL PRIMARY KEY,
  trainee_name varchar(50) NOT NULL,
  email varchar(100) NOT NULL,
  skill varchar(50) NOT NULL,
  batch varchar(50) NOT NULL,
  level int(11) NOT NULL,
  status varchar(50) NOT NULL
);

INSERT INTO `assignment2` (`id`, `trainee_name`, `email`, `skill`, `batch`, `level`, `status`) VALUES
(1, 'Reddy Siva', 'kundlasiva@gmail.com', 'JAVA', 'Q1', 3, 'INTERVIEWS'),
(2, 'Mary', 'mary@gmail.com', 'C_SHARP', 'Q2', 1, 'IN_TRAINING'),
(3, 'John', 'john@gmail.com', 'AWS', 'Q2', 2, 'ASSGINMENTS'),
(4, 'James', 'james@gmail.com', 'MEAN', 'Q2', 2, 'ASSGINMENTS'),
(5, 'Adam', 'adam@gmail.com', 'MERN', 'Q2', 2, 'INTERVIEWS'),
(6, 'Alex', 'alex@gmail.com', 'PYTHON', 'Q1', 3, 'ASSGINMENTS'),
(8, 'Jitendra', 'jithu@ymail.com', 'AWS', 'Q2', 1, 'INTERVIEWS');

ALTER TABLE `assignment2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;