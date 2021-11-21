\c vehicle;

INSERT INTO Vehicle(RC_Number, Type, AadhaarNo, EngineNo, ChassisNo, ModelNo)
VALUES
('KA05MA6651','LMV',456178941230,'E234789567','C374859796027','i10OA'),
('KA03RC5982','LMV',456178941230,'E789456123','C457812963522','HCiVW'),
('KA05EA1236','LMV',568912457913,'E764319264','C528271934671','i20OS'),
('KA04FA5588','MCWG',568912457913,'E712349264','C528123434671','RC200'),
('KA03GH1234','TRUCK',568912412456,'E123456789','C123456789123','Biggie'),
('KA03FG4586','LMV',456789457913,'E753159789','C741852963456','Duster'),
('KA51AT1212','MCWG',753159457913,'E159357426','C951753159357','Dominor400'),
('KA03RF1598','LMV',248268457913,'E486248975','C741987123654','Duster'),
('KA03YU2345','TRUCK',852147457913,'E145623698','C741984324657','MiniTR'),
('KA03MO7569','LMV',684132457913,'E684129752','C777999555111','370Z');


INSERT INTO Emergency_Contact(Fname, RC_Number, Owner_AadhaarNo, Relationship, PhoneNo)
VALUES
('Rodney', 'KA03RC5982', 467913827193, 'Father', 6528374689),
('Michele', 'KA05EA1236', 568912457913, 'Wife', 8524916768),
('Abhishek', 'KA05MA6651', 456178941230, 'Brother', 7538694215),
('Abhilash', 'KA04FA5588', 568912457913, 'Brother', 1234567890),
('HeisenBerg', 'KA03GH1234', 456178941230, 'Brother', 7538694215),
('Jesse', 'KA03FG4586', 456178941230, 'Brother', 7538694215),
('Desmond', 'KA51AT1212', 456178941230, 'Brother', 7538694215),
('Ezio', 'KA03RF1598', 456178941230, 'Brother', 7538694215),
('Carter', 'KA03YU2345', 456178941230, 'Wife', 7538694215),
('Pepper', 'KA03MO7569', 456178941230, 'Wife', 7538694215);


INSERT INTO License(Expiry_date, State, License_Number, Address, Type)
VALUES
('25-8-2025', 'KA', 'KA052005485793', 'Basavanagudi Bangalore', 'LMV MCWG'),

('15-7-2031', 'KA', 'KA052005123456', 'Ramnagar Hubli', 'TRUCK LMV'),
('7-1-2028', 'MH', 'MH052005753159', 'Dharawi Mumbai', 'LMV MCWG'),
('8-3-2039', 'TN', 'TN052005789123', 'Chikka Chennai', 'LMV MCWG'),
('3-12-2023', 'MP', 'MP052005951321', 'Mystery Bhopal', 'LMV MCWG'),
('27-10-2033', 'UP', 'UP052005742962', 'Hanumannagar Lucknow', 'TRUCK LMV'),
('13-2-2029', 'TN', 'TN052005164346', 'Berawai Hosur', 'LMV MCWG'),
('6-4-2027', 'KA', 'KA052007582839', 'Girinagar Bengaluru', 'LMV MCWOG');


INSERT INTO Owner_RC_Number(AadhaarNo, RC_Number)
VALUES
(568912457913, 'KA05EA1236'),
(568912457913, 'KA04FA5588'),
(456178941230, 'KA05MA6651'),
(456178941230, 'KA03RC5982'),
(568912412456, 'KA03GH1234'),
(456789457913, 'KA03FG4586'),
(753159457913, 'KA51AT1212'),
(248268457913, 'KA03RF1598'),
(852147457913, 'KA03YU2345'),
(684132457913, 'KA03MO7569');


INSERT INTO Owner(LicenseNo, Fname, Lname, Email, Phone_number, AadhaarNo)
VALUES
('KA052005485793', 'Tiago', 'Dombre', 'td@exa.com', 7845129658, 568912457913),
('KA052007582839', 'Arun', 'Cougar', 'ac@exa.com', 9516248375, 456178941230),
('KA052005123456', 'Jesse', 'Pinkman', 'jp@exa.com', 9845123456, 568912412456),
('MH052005753159', 'HeisenBerg', 'Meth', 'hm@exa.com', 9921123456, 456789457913),
('TN052005789123', 'Ezio', 'Auditore', 'ea@exa.com', 7898123456, 753159457913),
('MP052005951321', 'Desmond', 'Miles', 'dm@exa.com', 5212123456, 248268457913),
('UP052005742962', 'Steve', 'Rogers', 'sr@exa.com', 9988123456, 852147457913),
('TN052005164346', 'Tony', 'Stark', 'ts@exa.com', 5213456123, 684132457913);


INSERT INTO Challan(ChallanNo, CDate, Type, Proof, Fine, RC_Number, LicenseNo, AadhaarNo)
VALUES
(124578,'10-10-2021','Over Speeding', 'Photo', 1000, 'KA05EA1236', 'KA052005485793', 568912457913),
(958462,'05-10-2021', 'No Seatbelt', 'Photo', 500, 'KA05EA1236', 'KA052005485793', 568912457913),
(789456, '07-10-2021', 'Signal Skip', 'Photo', 1000, 'KA05EA1236',  'KA052005485793', 568912457913),
(122388,'05-10-2021', 'Signal Skip', 'Photo', 1000, 'KA03GH1234', 'KA052005123456', 568912412456),
(123489,'05-10-2021', 'Signal Skip', 'Photo', 5000, 'KA03GH1234', 'KA052005123456', 568912412456),
(513786,'05-10-2021', 'Over Speeding', 'Photo', 2000, 'KA03MO7569', 'TN052005164346', 684132457913),
(123123,'05-10-2021', 'Over Speeding', 'Photo', 3000, 'KA03MO7569', 'TN052005164346', 684132457913),
(753314,'05-10-2021', 'Over Speeding', 'Photo', 5000, 'KA03MO7569', 'TN052005164346', 684132457913);


INSERT INTO Insurance(RC_Number, ID, Provider, Expiry_date, Type, Name)
VALUES
('KA05MA6651', 'UI789456123159', 'United India', '6-7-2022', 'Premium', 'United RedCarpet Car Premium'),
('KA05EA1236', 'S14364753', 'Star India', '8-9-2022', 'Basic', 'Star India Car Basic'),
('KA03RC5982', 'UI345768914258', 'United India', '4-6-2022', 'Premium Advanced', 'United Red Carpet Car Advanced'),
('KA03GH1234', 'UI312123636498', 'United India', '1-2-2022', 'Premium Advanced', 'United Red Carpet Truck Advanced'),
('KA03FG4586', 'UI789512354987', 'United India', '31-7-2022', 'Premium Advanced', 'United Red Carpet Car Advanced'),
('KA51AT1212', 'UI654872138782', 'United India', '17-12-2022', 'Premium Advanced', 'United Red Carpet Bike Advanced'),
('KA03RF1598', 'UI658712817531', 'United India', '24-9-2022', 'Premium Advanced', 'United Red Carpet Car Advanced'),
('KA03YU2345', 'UI644912365985', 'United India', '14-11-2022', 'Premium Advanced', 'United Red Carpet Truck Advanced'),
('KA03MO7569', 'UI753951852744', 'United India', '21-10-2022', 'Premium Advanced', 'United Red Carpet Car Advanced'),
('KA04FA5588','S14364132','Star India', '8-9-2022','Basic','Star India Bike Basic');


INSERT INTO Vehicle_Details(Model_and_year, Manufacturer, Model_number, BS, Cubic_capacity)
VALUES
('Asta2017', 'Hyundai', 'i10OA', 4, 1100),
('Sportz2019', 'Hyundai', 'i20OS', 4, 1100),
('iVtec2012', 'Honda', 'HCiVW', 6, 1500),
('RenDuster2015', 'Honda', 'Duster', 6, 1300),
('Big2015', 'Honda', 'Biggie', 5, 3000),
('Min2017', 'Honda', 'MiniTR', 4, 2000),
('Godzilla2019', 'Nissan', '370Z', 6, 3696),
('BJDomin2017', 'Bajaj', 'Dominor400', 5, 400),
('RC200', 'KTM', 'RC200', 6, 200);