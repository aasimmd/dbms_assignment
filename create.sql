DROP DATABASE vehicle;

CREATE DATABASE VEHICLE;
\c vehicle;

CREATE TABLE License
(
  Expiry_date DATE NOT NULL,
  State VARCHAR(25) NOT NULL,
  License_Number VARCHAR(25) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  Type VARCHAR(25) NOT NULL,
  PRIMARY KEY (License_Number)
);

CREATE TABLE Owner
(
  LicenseNo VARCHAR(25) NOT NULL,
  Fname VARCHAR(25) NOT NULL,
  Lname VARCHAR(25) NOT NULL,
  Email VARCHAR(25) NOT NULL,
  Phone_number BIGINT NOT NULL,
  AadhaarNo BIGINT NOT NULL,
  PRIMARY KEY (AadhaarNo)
);

CREATE TABLE Vehicle_details
(
  Model_and_Year VARCHAR(25) NOT NULL,
  Manufacturer VARCHAR(25) NOT NULL,
  Model_Number VARCHAR(25) NOT NULL,
  BS BIGINT NOT NULL,
  Cubic_Capacity BIGINT NOT NULL,
  PRIMARY KEY (Model_Number)
);

CREATE TABLE Emergency_Contact
(
  Fname VARCHAR(25) NOT NULL,
  RC_Number VARCHAR(25) NOT NULL,
  Owner_AadhaarNo BIGINT NOT NULL,
  Relationship VARCHAR(25) NOT NULL,
  PhoneNo BIGINT NOT NULL,
  PRIMARY KEY (Fname, RC_Number)
);


CREATE TABLE Vehicle
(
  RC_Number VARCHAR(25) NOT NULL,
  Type VARCHAR(25) NOT NULL,
  EngineNo VARCHAR(25) NOT NULL,
  ChassisNo VARCHAR(25) NOT NULL,
  ModelNo VARCHAR(25) NOT NULL,
  AadhaarNo BIGINT NOT NULL,
  PRIMARY KEY (RC_Number)
);

CREATE TABLE Challan
(
  ChallanNo BIGINT NOT NULL,
  CDate DATE NOT NULL,
  Type VARCHAR(25) NOT NULL,
  Proof VARCHAR(25) NOT NULL,
  Fine BIGINT NOT NULL,
  RC_Number VARCHAR(25) NOT NULL,
  LicenseNo VARCHAR(25) NOT NULL,
  AadhaarNo BIGINT NOT NULL,
  PRIMARY KEY (ChallanNo)
);

CREATE TABLE Insurance
(
  RC_Number VARCHAR(25) NOT NULL,
  ID VARCHAR(25) NOT NULL,
  Provider VARCHAR(25) NOT NULL,
  Expiry_date DATE NOT NULL,
  Type VARCHAR(25) NOT NULL,
  Name VARCHAR(75) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Owner_RC_Number
(
  RC_Number VARCHAR(25) NOT NULL,
  AadhaarNo BIGINT NOT NULL,
  PRIMARY KEY (RC_Number, AadhaarNo)
);
