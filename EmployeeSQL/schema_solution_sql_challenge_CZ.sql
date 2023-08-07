-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "employees" (
    "emp_id" INTEGER   NOT NULL,
    "emp_title" VARCHAR   NOT NULL,
    "birth_data" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL
);

CREATE TABLE "departments" (
    "dept_id" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_id"
     )
);

CREATE TABLE "dept_emp" (
    "emp_id" INTEGER   NOT NULL,
    "dept_id" VARCHAR   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_id" VARCHAR   NOT NULL,
    "emp_id" INTEGER   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_id" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "titles" (
    "emp_title" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "emp_title"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_id" FOREIGN KEY("emp_id")
REFERENCES "salaries" ("emp_id");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("emp_title");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_id" FOREIGN KEY("emp_id")
REFERENCES "salaries" ("emp_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_id" FOREIGN KEY("dept_id")
REFERENCES "departments" ("dept_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_id" FOREIGN KEY("emp_id")
REFERENCES "salaries" ("emp_id");

