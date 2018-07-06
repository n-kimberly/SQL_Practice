-- self project
-- take three tables, students, projects, and pairs, and convert them into one table that displays each student with their project, their buddy, their buddy's project, each of their grades, and their average grades.

-- step 0: set up tables

CREATE table students(
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT
);

INSERT INTO students(name) VALUES("bob");
INSERT INTO students(name) VALUES("greg");
INSERT INTO students(name) VALUES("sam");
INSERT INTO students(name) VALUES("mike");

CREATE table projects(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    grade INTEGER default "0"
);

INSERT INTO projects(title, grade) 
    VALUES("blue whales", 45);
INSERT INTO projects(title, grade) 
    VALUES("black whales", 90);
INSERT INTO projects(title, grade) 
    VALUES("white foxes", 20);
INSERT INTO projects(title, grade) 
    VALUES("red foxes", 99);

CREATE table pairs(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    buddy_id INTEGER
);

INSERT INTO pairs(buddy_id) VALUES (2);
INSERT INTO pairs(buddy_id) VALUES (1);
INSERT INTO pairs(buddy_id) VALUES (4);
INSERT INTO pairs(buddy_id) VALUES (3);

-- step 1: link students to projects

SELECT student.id, student.name, project.title, project.grade
    FROM students as student
    JOIN projects as project
    ON student.id = project.id;
    --as student_projects

-- step 2: link student_projects to pairs

SELECT 
    student_projects.id, 
    student_projects.name, 
    student_projects.title, 
    student_projects.grade,
    pair.buddy_id
FROM 
    (SELECT student.id, student.name, project.title, project.grade
    FROM students as student
    JOIN projects as project
    ON student.id = project.id) as student_projects
JOIN pairs as pair
ON student_projects.id = pair.id;

-- step 3: link student_project_pairs to self

SELECT 
    student_projects_pair.name as name, 
    student_projects_pair_self.name as buddy,
    student_projects_pair.title as project1,
    student_projects_pair_self.title as project2,
    student_projects_pair.grade as grade1,
    student_projects_pair_self.grade as grade2
FROM
    (SELECT 
        student_projects.id, 
        student_projects.name, 
        student_projects.title, 
        student_projects.grade,
        pair.buddy_id
    FROM 
        (SELECT student.id, student.name, project.title, project.grade
        FROM students as student
        JOIN projects as project
        ON student.id = project.id) as student_projects
    JOIN pairs as pair
    ON student_projects.id = pair.id) as student_projects_pair
JOIN 
    (SELECT 
        student_projects.id, 
        student_projects.name, 
        student_projects.title, 
        student_projects.grade,
        pair.buddy_id
    FROM 
        (SELECT student.id, student.name, project.title, project.grade
        FROM students as student
        JOIN projects as project
        ON student.id = project.id) as student_projects
    JOIN pairs as pair
    ON student_projects.id = pair.id) as student_projects_pair_self
ON student_projects_pair.id = student_projects_pair_self.buddy_id;


-- step 4: take average of grade1 and grade 2

SELECT 
    student_projects_pair.name as name, 
    student_projects_pair_self.name as buddy,
    student_projects_pair.title as project1,
    student_projects_pair.grade as grade1,
    student_projects_pair_self.title as project2,
    student_projects_pair_self.grade as grade2,
    (student_projects_pair.grade + student_projects_pair_self.grade)/2 as average_grade
FROM
    (SELECT 
        student_projects.id, 
        student_projects.name, 
        student_projects.title, 
        student_projects.grade,
        pair.buddy_id
    FROM 
        (SELECT student.id, student.name, project.title, project.grade
        FROM students as student
        JOIN projects as project
        ON student.id = project.id) as student_projects
    JOIN pairs as pair
    ON student_projects.id = pair.id) as student_projects_pair
JOIN 
    (SELECT 
        student_projects.id, 
        student_projects.name, 
        student_projects.title, 
        student_projects.grade,
        pair.buddy_id
    FROM 
        (SELECT student.id, student.name, project.title, project.grade
        FROM students as student
        JOIN projects as project
        ON student.id = project.id) as student_projects
    JOIN pairs as pair
    ON student_projects.id = pair.id) as student_projects_pair_self
ON student_projects_pair.id = student_projects_pair_self.buddy_id;
