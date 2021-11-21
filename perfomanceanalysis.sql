\c vehicle;

-- P E R F O R M A N C E   A N A L Y S I S

-- SIMPLE QUERIES
--Increase 5% tax on all challan fines above 1000
EXPLAIN ANALYZE UPDATE challan SET fine=fine*1.05
WHERE fine > 1000;

--DELETE ALL chalans below 1000
EXPLAIN ANALYZE DELETE FROM challan
WHERE fine < 1000;

--Retreive Challan number, the data, type of violation and fine whose aadhaar number is 684132457913
EXPLAIN ANALYZE SELECT ChallanNo, CDate, Type, Fine
FROM challan
WHERE aadhaarno = 684132457913;

--Retreive first name, last name, license number and type of vehicles who can drive whose first name is "Desmond"
EXPLAIN ANALYZE SELECT fname, lname, l.license_Number, type
FROM license as l, owner as o
WHERE o.licenseno=l.license_Number and o.fname='Desmond';

--Retreive all the vehicles data which has their cc more than 1300
EXPLAIN ANALYZE SELECT model_number, manufacturer, cubic_capacity
FROM vehicle_details
WHERE cubic_capacity > 1300;

-- COMPLEX QUERIES
--Retreive total sum of fine to be paid by each induvidual and their name and phone number
EXPLAIN ANALYZE SELECT rc_number, fname, lname, phone_number, sum(fine)	
FROM (SELECT * FROM challan as c NATURAL JOIN owner as o) as tfine
GROUP BY rc_number, fname, lname, phone_number;

--Retreive all the RC_numbers and owner data which dont have any fines
EXPLAIN ANALYZE SELECT o.fname, o.lname, o.licenseno
FROM owner AS o 
WHERE o.aadhaarno NOT IN (SELECT aadhaarno from challan);

--Retreive owner data whose has more than 2 challans
EXPLAIN ANALYZE SELECT rc_number, fname, lname, phone_number, COUNT(*) as number_of_challans
FROM (SELECT * FROM challan as c NATURAL JOIN owner as o) as tfine
GROUP BY rc_number, fname, lname, phone_number
HAVING COUNT(fine) > 2;

--Retreive owner data whose insurance is going to expire by next year march
EXPLAIN ANALYZE SELECT o.fname, o.lname, o.aadhaarno, v.modelno, v.rc_number, i.expiry_date
FROM vehicle as v, owner as o, insurance as i
WHERE o.aadhaarno=v.aadhaarno and v.rc_number=i.rc_number and i.expiry_date < '1-3-2022';

--Retreive all owner data who is not allowed to drive a truck
EXPLAIN ANALYZE SELECT o.fname, o.lname, l.license_number
FROM license as l, owner as o
WHERE l.license_number=o.licenseno and l.type NOT LIKE '%TRUCK%';