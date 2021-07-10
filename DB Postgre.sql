CREATE TABLE "User" (
  "id" SERIAL PRIMARY KEY,
  "username" varchar,
  "password" password,
  "email" int,
  "first_name" varchar,
  "last_name" varchar
);

CREATE TABLE "Student" (
  "id" SERIAL PRIMARY KEY,
  "user" user,
  "is_active" boolean,
  "bio" text,
  "birth_date" date,
  "is_male" boolean,
  "phone" varchar,
  "image" image,
  "languages" varchar,
  "interests" varchar,
  "school" varchar,
  "graduation_year" int,
  "address" varchar,
  "city" varchar,
  "zipcode" varchar,
  "state" varchar,
  "country_code" varchar
);

CREATE TABLE "Employee" (
  "id" SERIAL PRIMARY KEY,
  "user" user,
  "is_fulltime" boolean,
  "is_active" boolean,
  "title" varchar,
  "education" varchar,
  "priority" int,
  "bio" text,
  "birth_date" date,
  "is_male" boolean,
  "phone" varchar,
  "image" image,
  "languages" varchar,
  "interests" varchar,
  "subjects" varchar,
  "school" varchar,
  "graduation_year" int,
  "address" varchar,
  "city" varchar,
  "zipcode" varchar,
  "state" varchar,
  "country_code" varchar
);

CREATE TABLE "Manager" (
  "id" SERIAL PRIMARY KEY,
  "user" user,
  "students" user,
  "employers" user
);

CREATE TABLE "Parent" (
  "user" SERIAL PRIMARY KEY,
  "child" user,
  "phone" varchar
);

CREATE TABLE "Exam" (
  "id" SERIAL PRIMARY KEY,
  "taker" user,
  "name" varchar,
  "score" float,
  "percentage" int
);

CREATE TABLE "Documents" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "description" text,
  "owner" user,
  "file" file
);

CREATE TABLE "StudentAccount" (
  "id" SERIAL PRIMARY KEY,
  "student" user,
  "deposits" deposit,
  "bills" bill
);

CREATE TABLE "StudentDeposit" (
  "id" SERIAL PRIMARY KEY,
  "units" float,
  "dollars" int,
  "dates" date,
  "description" varchar
);

CREATE TABLE "StudentLessonBill" (
  "id" SERIAL PRIMARY KEY,
  "duration" integer,
  "lesson" lesson,
  "coefficient" float
);

CREATE TABLE "Activity" (
  "id" SERIAL PRIMARY KEY,
  "employee" user,
  "type" varchar,
  "start" datetime,
  "end" datetime,
  "name" varchar,
  "description" text
);

CREATE TABLE "Lesson" (
  "id" SERIAL PRIMARY KEY,
  "student" user,
  "teacher" user,
  "name" varchar,
  "description" text,
  "subject" char,
  "classwork" submission,
  "homework" submission,
  "homework_submissions" submission,
  "start" datetime,
  "end" datetime
);

CREATE TABLE "Submission" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "description" text,
  "owner" user,
  "account_type" varchar,
  "type" varchar,
  "file" file
);

ALTER TABLE "Student" ADD FOREIGN KEY ("user") REFERENCES "User" ("id");

ALTER TABLE "Student" ADD FOREIGN KEY ("user") REFERENCES "Exam" ("taker");

ALTER TABLE "User" ADD FOREIGN KEY ("id") REFERENCES "Parent" ("user");

ALTER TABLE "Student" ADD FOREIGN KEY ("user") REFERENCES "Parent" ("child");

ALTER TABLE "User" ADD FOREIGN KEY ("id") REFERENCES "Employee" ("user");

ALTER TABLE "Documents" ADD FOREIGN KEY ("owner") REFERENCES "User" ("id");

ALTER TABLE "StudentAccount" ADD FOREIGN KEY ("deposits") REFERENCES "StudentDeposit" ("id");

ALTER TABLE "StudentAccount" ADD FOREIGN KEY ("bills") REFERENCES "StudentLessonBill" ("id");

ALTER TABLE "Student" ADD FOREIGN KEY ("user") REFERENCES "StudentAccount" ("student");

ALTER TABLE "Employee" ADD FOREIGN KEY ("id") REFERENCES "Activity" ("employee");

ALTER TABLE "Employee" ADD FOREIGN KEY ("id") REFERENCES "Submission" ("owner");

ALTER TABLE "Lesson" ADD FOREIGN KEY ("classwork") REFERENCES "Submission" ("id");

ALTER TABLE "Lesson" ADD FOREIGN KEY ("homework") REFERENCES "Submission" ("id");

ALTER TABLE "Lesson" ADD FOREIGN KEY ("homework_submissions") REFERENCES "Submission" ("id");

ALTER TABLE "User" ADD FOREIGN KEY ("id") REFERENCES "Manager" ("id");

ALTER TABLE "Manager" ADD FOREIGN KEY ("students") REFERENCES "Student" ("id");

ALTER TABLE "Manager" ADD FOREIGN KEY ("employers") REFERENCES "Employee" ("id");

ALTER TABLE "Lesson" ADD FOREIGN KEY ("id") REFERENCES "StudentLessonBill" ("lesson");
