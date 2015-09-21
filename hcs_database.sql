DROP DATABASE IF EXISTS healthcaresystem;

CREATE DATABASE healthcaresystem;

USE healthcaresystem;

CREATE TABLE IF NOT EXISTS `id_record` (
  `patient_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `history_id` int DEFAULT NULL,
  `contact_id` int DEFAULT NULL, 
  `reg_id` int DEFAULT NULL,
  `admin_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `doctor_registration` (
  
  `reg_id` VARCHAR(7) NOT NULL default '0',
  
  `first_name` VARCHAR(30) default NULL,
  
  `middle_name` VARCHAR(30) default NULL,
  
  `last_name` VARCHAR(30) default NULL,
  
  `gender` CHAR(1) default NULL,
  
  `birth_date` DATE default NULL,
  
  `phone` DECIMAL(7,0) default NULL,
  
  `email` VARCHAR(70) default NULL,
  
  `address` VARCHAR(100) default NULL,
  
  `skype_id` VARCHAR(70) default NULL,
  
  `facebook_id` VARCHAR(70) default NULL,
  
  `emergency_phone` DECIMAL(7,0) default NULL,
  
  PRIMARY KEY (`reg_id`)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `contact` (
  `contact_id` varchar(7) NOT NULL default '0',
  `address` varchar(100) default NULL,
  `email` varchar(50) default NULL,
  `phone` varchar(7) default NULL,
  `emergency_phone` varchar(7) default NULL, 
  `skype_id` varchar(50) default NULL,
  `facebook_id` varchar(50) default NULL,
  CONSTRAINT Contact_pk_contact_id PRIMARY KEY  (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `patient` (
  `patient_id` varchar(7) NOT NULL default '0',
  `password` varchar(30) default NULL,
  `first_name` varchar(20) default NULL,
  `mid_name` varchar(20) default NULL,
  `last_name` varchar(20) default NULL,
  `gender` char(1) default NULL,
  `birth_date` date default NULL,
  `date_registered` date default NULL,
  `contact_id` varchar(7) default NULL,
  CONSTRAINT Patient_pk_patient_id PRIMARY KEY  (`patient_id`),
  CONSTRAINT Patient_fk_contact_id FOREIGN KEY (`contact_id`) REFERENCES Contact (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `doctor` (
  `doctor_id` varchar(7) NOT NULL default '0',
  `password` varchar(30) default NULL,
  `first_name` varchar(20) default NULL,
  `mid_name` varchar(20) default NULL,
  `last_name` varchar(20) default NULL,
  `gender` char(1) default NULL,
  `birth_date` date default NULL,
  `date_registered` date default NULL,
  `contact_id` varchar(7) default NULL,
  CONSTRAINT Medical_doctor_pk_doctor_id PRIMARY KEY  (`doctor_id`),
  CONSTRAINT Medical_doctor_fk_contact_id FOREIGN KEY (`contact_id`) REFERENCES Contact (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `administrator` (
  `admin_id` varchar(7) NOT NULL default '0',
  `password` varchar(30) default NULL,
  `first_name` varchar(20) default NULL,
  `mid_name` varchar(20) default NULL,
  `last_name` varchar(20) default NULL,
  `gender` char(1) default NULL,
  `birth_date` date default NULL,
  `contact_id` varchar(7) default NULL,
  CONSTRAINT Administrator_pk_admin_id PRIMARY KEY  (`admin_id`),
  CONSTRAINT Administrator_admin_fk_contact_id FOREIGN KEY (`contact_id`) REFERENCES Contact (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `medical_history` (
  `history_id` varchar(20) NOT NULL default '0',
  `patient_id` varchar(7) default NULL,
  `visit_date_time` datetime default NULL,
  `medical_center` varchar(30) default NULL,  
  `treatment_desc` varchar(200) default NULL,
  `tests_conducted` varchar(200) default NULL,
  `test_results` varchar(200) default NULL,
  `medicine_list` varchar(100) default NULL,
  `comments` varchar(200) default NULL,
 `doctor_id` varchar(7) default NULL,
  CONSTRAINT Medical_history_pk_history_id PRIMARY KEY  (`history_id`),
  CONSTRAINT Medical_history_fk_patient_id FOREIGN KEY (`patient_id`) REFERENCES Patient (`patient_id`),
  CONSTRAINT Medical_history_fk_doctor_id FOREIGN KEY (`doctor_id`) REFERENCES Doctor (`doctor_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserting data for table, `Contact` --

INSERT INTO `Contact` (`contact_id`, `address` , `email`, `phone`, `emergency_phone` , `skype_id`, `facebook_id`) VALUES
('C000001', 'Lot 300, Selbourne Street, Suva', 'smith.simon@yahoo.com', '9934580', '7654842' ,'simonsmith01', 'simonsmith0354'),
('C000002', 'Lot 198, Toorak Street, Suva', 'nicole.4@yahoo.com', '9984560', '9378318' , 'nicole13', NULL),
('C000003', 'Lot 23, High Street, Nausori', 'Mary11@gmail.com', '8769045', '3545313' , 'mary34', NULL),
('C000004', 'Lot 498, Nabua Street, Suva', 'harry.j@gmail.com', '7764533','9564200' , 'harry3', NULL),
('C000005', 'Lot 34, Sila Street, Nausori', 'james.nick@yhotmail.com', '9987643', '3246822' , NULL, NULL),
('C000006', 'Lot 59, Valelevu Street, Nasinu', 'jay.sharma@hotmail.com', '9977883', NULL , NULL, NULL),
('C000007', 'Lot 23, Sardar Street, Suva', 'samantha.anne@hotmail.com', '7567643','9201107' , NULL, NULL),
('C000008', 'Lot 400,Toorak Street, Suva', 'maryl.brown@hotmail.com', '3387643', '8561134' , NULL, NULL),
('C000009', 'Lot 32, Selbourne Street, Suva', 'magret23@hotmail.com', '9387643', '3578936' , NULL, NULL),
('C000010', 'Lot 765, Selbourne Street, Suva', 'krish12@hotmail.com', '8653045', '3987612' , NULL, NULL) ,
('C000011', 'Lot 3, Vuci Street, Nausori', 'hyun67@hotmail.com', '8657950', NULL , NULL, NULL) ,
('C000012', 'Lot 45, Wainaivula Street, Nasinu', 'bert.rob67@hotmail.com', '7545902', '8854842' , NULL, NULL);

-- Inserting data for table, `Patient` --

INSERT INTO `Patient` (`patient_id`, `password`, `first_name`, `mid_name`, `last_name`, `gender`, `birth_date`, `date_registered`, `contact_id`) VALUES
('P000001', 'abcdefgh', 'Simon', 'Peter', 'Smith', 'M', '1980-08-19', '2015-09-30', 'C000001'),
('P000002', 'zyxwvu', 'James', 'Nick', 'Schyler', 'M', '1990-07-28', '2015-10-01', 'C000005'),
('P000003', '678954AZ', 'Mary', 'Jean', 'Jackson', 'F', '1998-12-31', '2015-09-30', 'C000003'),
('P000004', 'aaabbbccc12', 'Nicole', 'Jenny', 'Madison', 'F', '1993-09-17', '2015-10-02', 'C000002'),
('P000005', 'mmnnoo12abc', 'Harry', 'James', 'Potter', 'M', '1987-02-09', '2015-09-30', 'C000004');


-- Inserting data for table, `Doctor` --

INSERT INTO `Doctor` (`doctor_id`, `password`, `first_name`, `mid_name`, `last_name`, `gender`, `birth_date`,  `date_registered`, `contact_id`) VALUES
('D000001', 'aplesand', 'San', 'Jay', 'Sharma', 'M', '1986-09-30',  '2015-09-30', 'C000006'),
('D000002', 'jamgrtaw', 'Krish', 'Neel', 'Singh', 'M', '1989-06-16',  '2015-09-30', 'C000010'),
('D000003', 'helloworld', 'Samantha', 'Anne', 'Johnson', 'F', '1979-07-24',  '2015-09-30', 'C000007'),
('D000004', 'goodbyerew', 'Anna', 'Maryl', 'Brown', 'F', '1981-03-14', '2015-09-30', 'C000008'),
('D000005', 'heloo78', 'Margaret', 'Jane', 'Chand', 'F', '1983-08-29', '2015-09-30', 'C000009');


-- Inserting data for table, `Administrator` --

INSERT INTO `Administrator` (`admin_id`, `password`, `first_name`, `mid_name`, `last_name`, `gender`, `birth_date`, `contact_id`) VALUES
('A000001', 'admin1234', 'Hyun', 'Wook', 'Kim', 'M', '1985-05-05',  'C000011'),
('A000002', '1234admin', 'Robb', 'Bert', 'Makasi', 'M', '1980-11-05', 'C000012');


-- Inserting data for table, `Medical_history` --

INSERT INTO `Medical_history` (`history_id`, `patient_id`, `visit_date_time`, `medical_center`, `treatment_desc`, `tests_conducted`, `test_results`, `medicine_list` , `comments` , `doctor_id`) VALUES

('R000000001', 'P000001', '2015-09-30 09:45:00', 'Nausori Health Centre', 'Putting elbow in cast.', 'X-ray', 'Fractured elbow bone.', 'Pain-killer tablets and anti-biotics.' , 'Avoid tough physical activity and keep arm in cast until next checking.' , 'D000004'), 
('R000000002', 'P000001', '2015-10-06 12:30:00', 'Nausori Health Centre', 'Checking patients elbow.', 'Check-up.', 'Elbow is healing well.', 'Anti-biotics.', 'There are no complications. Next check-up will ensure removal of cast after one week.', 'D000004'),
('R000000003', 'P000001', '2015-10-13 02:20:00', 'Nausori Health Centre', 'Removal of cast.', 'Check-up.', 'Everything is fine.', 'None.', 'Arm has mended well. Patient may resume physical activities normally.', 'D000004'),

('R000000004', 'P000002', '2015-10-01 12:54:00', 'Nausori Health Centre', 'Checkup of pregnant woman.', 'Body checkup and scanning.', 'Everything is normal.', 'Iron Tablets.' , 'Baby is growing healthily and patients health is good. Weekly check-ups continue until doctor says otherwise.' , 'D000005'),
('R000000005', 'P000002', '2015-10-08 10:00:00', 'Nausori Health Centre', 'Checkup of pregnant woman.', 'Body check-up and scanning.', 'Everything is normal but patient is experiencing back-ache.', 'Iron Tablets and pain-killer tablets.', 'Baby is growing healthily and patients health is good. Weekly check-ups continue until doctor says otherwise. A lot of rest is recommeded to relieve back-ache.', 'D000001'),

('R000000006', 'P000003', '2015-09-30 08:10:00', 'Colonial War Memorial', 'Sugery.', 'X-ray of head.', 'Fractured skull.', 'Pain-killer tablets, anti-biotics and sleeping pills.' , 'Two weekly check-ups required for a fortnight. Patient has to have complete bed rest in hospital for a week.', 'D000003'),
('R000000007', 'P000003', '2015-10-03 10:00:00', 'Colonial War Memorial', 'Check-up and injection.', 'Temperature and blood pressure.', 'Normal.', 'Pain-killer tablets, anti-biotics and sleeping pills', 'Patient is healing fine.', 'D000003'),
('R000000008', 'P000003', '2015-10-07 10:00:00', 'Colonial War Memorial', 'Check-up and injection.', 'Temperature and blood pressure.', 'Normal.', 'Pain-killer tablets, anti-biotics and sleeping pills', 'Patient is healing fine.', 'D000003'),
('R000000009', 'P000003', '2015-10-11 08:00:00', 'Colonial War Memorial', 'Check-up and injection.', 'Temperature and blood pressure.', 'Normal.', 'Pain-killer tablets, anti-biotics and sleeping pills.', 'Patient is healing properly.', 'D000002'),
('R000000010', 'P000003', '2015-10-14 08:00:00', 'Colonial War Memorial', 'Removal of stitches.', 'Body-check-up', 'Skull has healed well and stiches are to be removed.', 'Anti-biotics and pain-killer tablets', 'Patient is discharged.', 'D000002'),

('R000000011', 'P000004', '2015-10-02 10:30:00', 'Nausori Health Centre', 'Headache treatment.', 'Check-up.', 'Headache.', 'Panadol.' , 'Take rest until head ache dimishes or finishes completely.' ,  'D000001'),
('R000000012', 'P000004', '2015-12-23 11:45:00', 'Colonial War Memorial', 'Hypertension advice and medication.', 'Body check-up and Blood pressure test.', 'Obesity and high blood pressure.', 'Enalapril and Aspirin.', 'Patient is recommended to consume plenty of fruit and vegetables and do regular exercise for a healthy weight and normal blood pressure.', 'D000003'),
('R000000013', 'P000004', '2016-01-30 03:00:00', 'Colonial War Memorial', 'Hypertension advice and medication.', 'Body check-up and Blood pressure test.', 'Slightly obese and slightly high blood pressure.', 'Enalapril and Aspirin.', 'Patients weight and blood pressure has dropped from previous visit. Recommended to continue with the exercise and following similar diet.', 'D000002'),

('R000000014', 'P000005', '2015-09-30 10:15:00', 'Colonial War Memorial', 'Torn ligament treatment by applying ice to injured area.', 'Scan.', 'Ligaments in leg are torn.', 'Pain killer tablets.' ,'Rest and avoid strenuous physical activity until leg heals properly.' , 'D000002'),
('R000000015', 'P000005', '2015-11-15 09:35:00', 'Nausori Health Centre', 'Metal rod treatment for broken bone in ankle and provision of crutches.', 'X-Ray of leg.', 'Broken ankle bone.', 'Anti-biotics, pain-killer tablets and sleeping pills.', 'Patient needs bed rest for two days at least to avoid painful swelling of the injured area. Next checking after a week.', 'D000004'),

('R000000016', 'P000003', '2015-09-30 03:12:00', 'Nausori Health Centre', 'Diabetes advice and medication.', 'Diabetes test.', 'Diabetes is high.', 'Aspirin, insulin and injections provided.', 'Patient has to avoid sugar as much as he can. Plenty of fruit and vegetables is recommended for patients diet as well as regular exercise. Next checking is after three months', 'D000005'),
('R000000017', 'P000002', '2015-11-27 11:00:00', 'Colonial War Memorial', 'Amputation of limb.', 'Diabetes test and X-Raying of leg.', 'Diabetes is high and patients leg needs to be amputated due to an injection which is spreading throughout the body.', 'Pain-killer tablets, panadol, sleeping pills, anti-biotics, vitamin tablets, aspirin and sleeping pills.', 'Patient has to stay in hospital until doctors approval for discharge is granted.', 'D000003'),

('R000000018', 'P000004', '2015-12-29 02:55:00', 'Colonial War Memorial', 'Annual check-up.', 'Blood test, blood pressure test, diabetes test and eye-test.', 'Patient is anaemic.', 'Iron tablets.', 'Recommended to eat green vegetables and liver.', 'D000002'),

('R000000019', 'P000005', '2015-11-30 04:00:00', 'Nausori Health Centre', 'Injection.', 'Temperature.', 'Patient has fever.', 'Panadol and anti-biotic.', 'Patient needs best rest for two days.', 'D000005'),
 
('R000000020', 'P000001', '2016-01-25 12:40:00', 'Colonial War Memorial', 'Annual check-up.', 'Blood test, blood pressure test, diabetes test and eye-test.', 'Patient is fine.', 'None.', 'Patient is healthy.', 'D000003'),
('R000000021', 'P000001', '2016-02-12 02:05:00', 'Nausori Health Centre', 'Injection.', 'Temperature.', 'Patient has fever.', 'Panadol and anti-biotic.', 'Patient needs best rest for two days.', 'D000001');


-- Inserting data for table `id_record` --

INSERT INTO `id_record` (`patient_id`, `doctor_id`, `history_id`, `contact_id`, `reg_id`, `admin_id`) VALUES 
('5', '5', '21', '12', '0', '2');