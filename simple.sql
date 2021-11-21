\c vehicle;
--Increase 5% tax on all challan fines above 1000
UPDATE challan SET fine=fine*1.05
WHERE fine > 1000;

--DELETE ALL chalans below 1000
DELETE FROM challan
WHERE fine < 1000;

--Retreive Challan number, the data, type of violation and fine whose aadhaar number is 684132457913
SELECT ChallanNo, CDate, Type, Fine
FROM challan
WHERE aadhaarno = 684132457913;

--Retreive first name, last name, license number and type of vehicles who can drive whose first name is "Desmond"
SELECT fname, lname, l.license_Number, type
FROM license as l, owner as o
WHERE o.licenseno=l.license_Number and o.fname='Desmond';

--Retreive all the vehicles data which has their cc more than 1300
SELECT model_number, manufacturer, cubic_capacity
FROM vehicle_details
WHERE cubic_capacity > 1300;