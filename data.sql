DROP TABLE projects;
DROP SEQUENCE project_ids;
DROP TABLE languages;
DROP SEQUENCE language_ids;
DROP TABLE project_languages
DROP TABLE links;
DROP SEQUENCE link_ids;

CREATE TABLE projects
(
  project_id INTEGER NOT NULL PRIMARY KEY DEFAULT NEXTVAL('project_ids'),
  lines INTEGER,
  name TEXT,
  version TEXT,
  cvsmodule TEXT,
  startdate DATETIME,
  enddate DATETIME,
  description TEXT
);

CREATE SEQUENCE project_ids INCREMENT 1 START 10;

CREATE TABLE languages
(
  language_id INTEGER NOT NULL PRIMARY KEY DEFAULT NEXTVAL('language_ids'),
  name TEXT
);

CREATE SEQUENCE language_ids INCREMENT 1 START 15;

CREATE TABLE project_languages
(
  project_id INTEGER NOT NULL,
  language_id INTEGER NOT NULL,
  ordinal INTEGER,
  PRIMARY KEY (project_id, language_id)
);

CREATE TABLE links
(
  download_id INTEGER NOT NULL PRIMARY KEY DEFAULT NEXTVAL('link_ids'),
  project_id INTEGER NOT NULL,
  name TEXT,
  link TEXT,
  description TEXT
);

CREATE SEQUENCE link_ids INCREMENT 1 START 20;
                                                 
ALTER TABLE project_languages ADD FOREIGN KEY (language_id) REFERENCES languages (language_id);
ALTER TABLE project_languages ADD FOREIGN KEY (project_id) REFERENCES projects (project_id);

INSERT INTO projects(project_id, lines, name, version, cvsmodule, startdate, enddate, description)
VALUES (1, 3000, 'QuickMan', NULL, 'quickman', '2001-11-28', '2001-12-03', '<p>Quickman was an assignment for a robotics class that I worked on with 2 other people. The program drives a Pioneer mobile robot from a starting point to an ending point in a room filled with obstacles, trying to avoid collisions. The obstacle shapes and positions are given as input, and then the program plans an optimal path and follows it. Quickman is written in C++ and makes extensive use of the STL.</p>

<p>Quickman uses a commercial but freely available library called <a href="http://www.ai.sri.com/~konolige/saphira/">Saphira</a> that comes with a graphical robot simuator. There are makefiles for GCC under linux and solaris and a Metrowerks Codewarrior project file for windows. It uses features of C++ not supported by MS Visual C++ 6.</p>');

INSERT INTO projects(project_id, lines, name, version, cvsmodule, startdate, enddate, description)
VALUES (2, 2000, 'Lost Cities Player', NULL, 'quickman', '2001-11-12', '2001-12-16', '<p>Written as a project for an AI class. It plays a card game called "Lost Cities" with 3 other players. I did very little testing on it, so I''m not sure how good it actually is, but I do like the design and strategies used.

The source is very well documented. It was written in Metrowerks Codewarrior for Windows. It also compiles with GCC and runs on linux and solaris (makefiles included).');

INSERT INTO projects(project_id, lines, name, version, cvsmodule, startdate, enddate, description)
VALUES (3, 20000, 'Web Based Course Evaluation System (WCES)', NULL, 'wbes', '2001-11-12', '2001-12-16', 'WCES is a project of the Columbia University School of Engineering. Its lets administrators and professors create customized online surveys about courses and to be able to see and download graphical reports showing survey results. The site originally started as a software engineering project by a group of students. I  started working on it part-time for the universtity in the Fall 2000. Many new features have been added, and at this point 80% or more of the code is my own. The 20,000 line count is a bit inflated. About a quarter of that is just plain old HTML inside the PHP scripts. About half of it is solid PHP code (class and function definitions), and the rest consists of database schemas, postgres procedural sql (plpgsql) functions, a mini web-crawler written with Delphi, a COM authentication component written in Visual C++ with ATL, and leftover testing and prototype code.');

INSERT INTO languages (language_id, name) VALUES (1,'C++');
INSERT INTO languages (language_id, name) VALUES (2,'C');
INSERT INTO languages (language_id, name) VALUES (3,'Pascal (Delphi, Turbo Pascal)');
INSERT INTO languages (language_id, name) VALUES (4,'Python');
INSERT INTO languages (language_id, name) VALUES (5,'Java');
INSERT INTO languages (language_id, name) VALUES (6,'PHP');
INSERT INTO languages (language_id, name) VALUES (7,'Javascript');
INSERT INTO languages (language_id, name) VALUES (8,'CFML (Coldfusion)');
INSERT INTO languages (language_id, name) VALUES (9,'Procedural SQL (Postgres plpgsql)');
INSERT INTO languages (language_id, name) VALUES (10,'Procedural SQL (Microsoft T-SQL)');
INSERT INTO languages (language_id, name) VALUES (11,'Apple II Assembly');
INSERT INTO languages (language_id, name) VALUES (12,'Apple II BASIC');
INSERT INTO languages (language_id, name) VALUES (13,'MEL (Maya Scripting Language)');
INSERT INTO languages (language_id, name) VALUES (14,'Microsoft QuickBASIC');
