\c vehicle;

ALTER TABLE Vehicle
ADD FOREIGN KEY (AadhaarNo) REFERENCES Owner(AadhaarNo),
ADD FOREIGN KEY (ModelNo) REFERENCES Vehicle_details(Model_Number);

ALTER TABLE Insurance
ADD FOREIGN KEY (RC_Number) REFERENCES Vehicle(RC_Number);

ALTER TABLE Challan
ADD FOREIGN KEY (RC_Number) REFERENCES Vehicle(RC_Number),
ADD FOREIGN KEY (AadhaarNo) REFERENCES Owner(AadhaarNo),
ADD FOREIGN KEY (LicenseNo) REFERENCES License(License_Number);

ALTER TABLE Owner
ADD FOREIGN KEY (LicenseNo) REFERENCES License(License_Number);

ALTER TABLE Owner_RC_Number
ADD FOREIGN KEY (AadhaarNo) REFERENCES Owner(AadhaarNo);

ALTER TABLE Emergency_Contact
ADD FOREIGN KEY (RC_Number) REFERENCES Vehicle(RC_Number);