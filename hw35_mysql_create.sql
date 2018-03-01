CREATE TABLE `Writers` (
	`writer_id` int NOT NULL AUTO_INCREMENT,
	`First Name` char NOT NULL,
	`Last Name` char NOT NULL,
	PRIMARY KEY (`writer_id`)
);

CREATE TABLE `Works` (
	`work_id` int NOT NULL AUTO_INCREMENT,
	`Work Name` char NOT NULL,
	`writer_id` int NOT NULL,
	`subcategory_id` int NOT NULL,
	`genre_id` int NOT NULL,
	PRIMARY KEY (`work_id`)
);

CREATE TABLE `Category` (
	`category_id` int NOT NULL AUTO_INCREMENT,
	`Category Name` char NOT NULL,
	`subcategory_id` int NOT NULL,
	PRIMARY KEY (`category_id`)
);

CREATE TABLE `Genre` (
	`genre_id` int NOT NULL AUTO_INCREMENT,
	`Genre Name` char NOT NULL,
	PRIMARY KEY (`genre_id`)
);

CREATE TABLE `Employee Movements` (
	`employee_id` int NOT NULL AUTO_INCREMENT,
	`department_id` int NOT NULL,
	`position_id` int NOT NULL,
	`start_date_id` int NOT NULL,
	`end_date_id` int NOT NULL,
	`supervisor_id` int NOT NULL,
	PRIMARY KEY (`employee_id`,`department_id`,`position_id`)
);

CREATE TABLE `Department` (
	`department_id` int NOT NULL AUTO_INCREMENT,
	`Department Name` char NOT NULL,
	PRIMARY KEY (`department_id`)
);

CREATE TABLE `Position` (
	`position_id` int NOT NULL AUTO_INCREMENT,
	`Position Name` char NOT NULL,
	PRIMARY KEY (`position_id`)
);

CREATE TABLE `Wage` (
	`wage_id` int NOT NULL AUTO_INCREMENT,
	`time_id` int NOT NULL,
	`wage` int NOT NULL,
	`employee_id` int NOT NULL,
	PRIMARY KEY (`wage_id`)
);

CREATE TABLE `Students` (
	`student_id` int NOT NULL AUTO_INCREMENT,
	`First Name` char NOT NULL,
	`Last Name` char NOT NULL,
	PRIMARY KEY (`student_id`)
);

CREATE TABLE `Group` (
	`group_id` int NOT NULL AUTO_INCREMENT,
	`Group Name` char NOT NULL,
	`time_id` int NOT NULL,
	`student_id` int NOT NULL,
	PRIMARY KEY (`group_id`)
);

CREATE TABLE `Time_Student` (
	`time_id` int NOT NULL AUTO_INCREMENT,
	`datetime` DATETIME NOT NULL,
	PRIMARY KEY (`time_id`)
);

CREATE TABLE `Study Topics` (
	`study_topic_id` int NOT NULL AUTO_INCREMENT,
	`Study Topic Name` char NOT NULL,
	`lesson_id` int NOT NULL,
	PRIMARY KEY (`study_topic_id`)
);

CREATE TABLE `Lesson` (
	`lesson_id` int NOT NULL AUTO_INCREMENT,
	`Lesson Name` char NOT NULL,
	PRIMARY KEY (`lesson_id`)
);

CREATE TABLE `Study Plan` (
	`study_plan_id` int NOT NULL AUTO_INCREMENT,
	`group_id` int NOT NULL,
	`lesson_id` int NOT NULL,
	`starttime_id` int NOT NULL,
	PRIMARY KEY (`study_plan_id`)
);

CREATE TABLE `subcategory` (
	`subcategory_id` int NOT NULL AUTO_INCREMENT,
	`category_id` int NOT NULL,
	`Subcategory Name` char NOT NULL,
	PRIMARY KEY (`subcategory_id`)
);

CREATE TABLE `Time` (
	`time_id` int NOT NULL AUTO_INCREMENT,
	`datetime` DATETIME NOT NULL,
	PRIMARY KEY (`time_id`)
);

CREATE TABLE `Employee Personal` (
	`employee_id` int NOT NULL AUTO_INCREMENT,
	`First Name` char NOT NULL,
	`Last Name` char NOT NULL,
	PRIMARY KEY (`employee_id`)
);

CREATE TABLE `Attendance` (
	`student_id` int NOT NULL AUTO_INCREMENT,
	`starttime_id` int NOT NULL AUTO_INCREMENT,
	`Attended or not` bool NOT NULL,
	PRIMARY KEY (`student_id`,`starttime_id`)
);

ALTER TABLE `Works` ADD CONSTRAINT `Works_fk0` FOREIGN KEY (`writer_id`) REFERENCES `Writers`(`writer_id`);

ALTER TABLE `Works` ADD CONSTRAINT `Works_fk1` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory`(`subcategory_id`);

ALTER TABLE `Works` ADD CONSTRAINT `Works_fk2` FOREIGN KEY (`genre_id`) REFERENCES `Genre`(`genre_id`);

ALTER TABLE `Employee Movements` ADD CONSTRAINT `Employee Movements_fk0` FOREIGN KEY (`employee_id`) REFERENCES `Employee Personal`(`employee_id`);

ALTER TABLE `Employee Movements` ADD CONSTRAINT `Employee Movements_fk1` FOREIGN KEY (`department_id`) REFERENCES `Department`(`department_id`);

ALTER TABLE `Employee Movements` ADD CONSTRAINT `Employee Movements_fk2` FOREIGN KEY (`position_id`) REFERENCES `Position`(`position_id`);

ALTER TABLE `Employee Movements` ADD CONSTRAINT `Employee Movements_fk3` FOREIGN KEY (`start_date_id`) REFERENCES `Time`(`time_id`);

ALTER TABLE `Employee Movements` ADD CONSTRAINT `Employee Movements_fk4` FOREIGN KEY (`end_date_id`) REFERENCES `Time`(`time_id`);

ALTER TABLE `Employee Movements` ADD CONSTRAINT `Employee Movements_fk5` FOREIGN KEY (`supervisor_id`) REFERENCES `Employee Movements`(`employee_id`);

ALTER TABLE `Wage` ADD CONSTRAINT `Wage_fk0` FOREIGN KEY (`time_id`) REFERENCES `Time`(`time_id`);

ALTER TABLE `Wage` ADD CONSTRAINT `Wage_fk1` FOREIGN KEY (`employee_id`) REFERENCES `Employee Movements`(`employee_id`);

ALTER TABLE `Group` ADD CONSTRAINT `Group_fk0` FOREIGN KEY (`time_id`) REFERENCES `Time_Student`(`time_id`);

ALTER TABLE `Group` ADD CONSTRAINT `Group_fk1` FOREIGN KEY (`student_id`) REFERENCES `Students`(`student_id`);

ALTER TABLE `Study Topics` ADD CONSTRAINT `Study Topics_fk0` FOREIGN KEY (`lesson_id`) REFERENCES `Lesson`(`lesson_id`);

ALTER TABLE `Study Plan` ADD CONSTRAINT `Study Plan_fk0` FOREIGN KEY (`group_id`) REFERENCES `Group`(`group_id`);

ALTER TABLE `Study Plan` ADD CONSTRAINT `Study Plan_fk1` FOREIGN KEY (`lesson_id`) REFERENCES `Lesson`(`lesson_id`);

ALTER TABLE `Study Plan` ADD CONSTRAINT `Study Plan_fk2` FOREIGN KEY (`starttime_id`) REFERENCES `Time_Student`(`time_id`);

ALTER TABLE `subcategory` ADD CONSTRAINT `subcategory_fk0` FOREIGN KEY (`category_id`) REFERENCES `Category`(`category_id`);

ALTER TABLE `Attendance` ADD CONSTRAINT `Attendance_fk0` FOREIGN KEY (`student_id`) REFERENCES `Students`(`student_id`);

ALTER TABLE `Attendance` ADD CONSTRAINT `Attendance_fk1` FOREIGN KEY (`starttime_id`) REFERENCES `Study Plan`(`starttime_id`);

