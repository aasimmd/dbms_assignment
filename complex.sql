\c vehicle;
--Retreive total sum of fine to be paid by each induvidual and their name and phone number
SELECT rc_number, fname, lname, phone_number, sum(fine)	
FROM (SELECT * FROM challan as c NATURAL JOIN owner as o) as tfine
GROUP BY rc_number, fname, lname, phone_number;

--Retreive all the RC_numbers and owner data which dont have any fines
SELECT o.fname, o.lname, o.licenseno
FROM owner AS o 
WHERE o.aadhaarno NOT IN (SELECT aadhaarno from challan);

--Retreive owner data whose has more than 2 challans
SELECT rc_number, fname, lname, phone_number, COUNT(*) as number_of_challans
FROM (SELECT * FROM challan as c NATURAL JOIN owner as o) as tfine
GROUP BY rc_number, fname, lname, phone_number
HAVING COUNT(fine) > 2;

--Retreive owner data whose insurance is going to expire by next year march
SELECT o.fname, o.lname, o.aadhaarno, v.modelno, v.rc_number, i.expiry_date
FROM vehicle as v, owner as o, insurance as i
WHERE o.aadhaarno=v.aadhaarno and v.rc_number=i.rc_number and i.expiry_date < '1-3-2022';

--Retreive all owner data who is not allowed to drive a truck
SELECT o.fname, o.lname, l.license_number
FROM license as l, owner as o
WHERE l.license_number=o.licenseno and l.type NOT LIKE '%TRUCK%';