create database cabriolet;
show databases;

use cabriolet;

show tables;

CREATE TABLE `admin` (
  `ADMIN_ID` varchar(255) NOT NULL,
  `ADMIN_PASSWORD` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `admin` (`ADMIN_ID`, `ADMIN_PASSWORD`) VALUES
('2210530', 'Qwerty@123');

select*from admin;

CREATE TABLE `booking` (
  `BOOK_ID` int(11) NOT NULL,
  `CAR_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `BOOK_PLACE` varchar(255) NOT NULL,
  `BOOK_DATE` date NOT NULL,
  `DURATION` int(11) NOT NULL,
  `PHONE_NUMBER` bigint(20) NOT NULL,
  `DESTINATION` varchar(255) NOT NULL,
  `RETURN_DATE` date NOT NULL,
  `PRICE` int(11) NOT NULL,
  `BOOK_STATUS` varchar(255) NOT NULL DEFAULT 'UNDER PROCESSING'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cars` (
  `CAR_ID` int(11) NOT NULL,
  `CAR_NAME` varchar(255) NOT NULL,
  `FUEL_TYPE` varchar(255) NOT NULL,
  `CAPACITY` int(11) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `CAR_IMG` varchar(255) NOT NULL,
  `AVAILABLE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- INSERT INTO `booking` (`BOOK_ID`, `CAR_ID`, `EMAIL`, `BOOK_PLACE`, `BOOK_DATE`, `DURATION`, `PHONE_NUMBER`, `DESTINATION`, `RETURN_DATE`, `PRICE`, `BOOK_STATUS`) VALUES
--  (66, 2, 'rahul@gmail.com', 'bangalore', '2024-03-17', 5, 6363549133, 'moodabidri', '2022-04-09', 35000, 'UNDER PROCESSING'),
-- (68, 1, 'harshgupta@gmail.com', 'mysore', '2024-02-20', 8, 6363549133, 'moodabidri', '2022-04-02', 50000, 'RETURNED'),
-- (69, 3, 'faisal@gmail.com', 'bangalore', '2024-03-24', 10, 6363549133, 'moodabidri', '2022-03-31', 50000, 'RETURNED');

-- INSERT INTO `cars` (`CAR_ID`, `CAR_NAME`, `FUEL_TYPE`, `CAPACITY`, `PRICE`, `CAR_IMG`, `AVAILABLE`) VALUES
-- (1, 'FERRAI', 'PETROL', 5, 5000, 'ferrari.jpg', 'Y'),
-- (2, 'LAMBORGINI', 'DEISEL', 6, 7000, 'lamborghini.webp', 'Y'),
-- (3, 'PORSCHE', 'GAS', 4, 3000, 'porsche.jpg', 'Y'),
-- (20, 'SWIFT', 'DEISEL', 22, 1000, 'swift.jpg', 'Y');

CREATE TABLE `feedback` (
  `FED_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `COMMENT` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- INSERT INTO `feedback` (`FED_ID`, `EMAIL`, `COMMENT`) VALUES
-- (10, 'varshithvh@gmail.com', 'hai I am satisfied with your service .But need to know whether is there any other options\r\n');

CREATE TABLE `payment` (
  `PAY_ID` int(11) NOT NULL,
  `BOOK_ID` int(11) NOT NULL,
  `CARD_NO` varchar(255) NOT NULL,
  `EXP_DATE` varchar(255) NOT NULL,
  `CVV` int(11) NOT NULL,
  `PRICE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- INSERT INTO `payment` (`PAY_ID`, `BOOK_ID`, `CARD_NO`, `EXP_DATE`, `CVV`, `PRICE`) VALUES
-- (24, 68, '4444444444444444', '11/22', 333, 50000);

CREATE TABLE `users` (
  `FNAME` varchar(255) NOT NULL,
  `LNAME` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `LIC_NUM` varchar(255) NOT NULL,
  `PHONE_NUMBER` bigint(11) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `GENDER` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- INSERT INTO `users` (`FNAME`, `LNAME`, `EMAIL`, `LIC_NUM`, `PHONE_NUMBER`, `PASSWORD`, `GENDER`) VALUES
-- ('Swasthik', 'Jain', 'swasthik@gmail.com', 'B23432', 9845687555, 'c788b480e4a3c807a14b6f3f4b1a1ae6', 'male'),
-- ('Varshith', 'Hegde', 'varshithvh@gmail.com', 'B3udh4', 6363549133, 'e6235c884414e320c8781c22b0c38c9b', 'male'),
-- ('Varshith', 'hegde', 'varshithvhegde@gmail.com', 'ghhdhd', 6363549133, 'e6235c884414e320c8781c22b0c38c9b', 'male');

ALTER TABLE `admin`
ADD PRIMARY KEY (`ADMIN_ID`);
  
ALTER TABLE `booking`
ADD PRIMARY KEY (`BOOK_ID`),
ADD KEY `CAR_ID` (`CAR_ID`),
ADD KEY `EMAIL` (`EMAIL`);

ALTER TABLE `cars`
ADD PRIMARY KEY (`CAR_ID`);
  
ALTER TABLE `feedback`
ADD PRIMARY KEY (`FED_ID`),
ADD KEY `TEST` (`EMAIL`);

ALTER TABLE `payment`
ADD PRIMARY KEY (`PAY_ID`),
ADD UNIQUE KEY `BOOK_ID` (`BOOK_ID`);
  
ALTER TABLE `users`
ADD PRIMARY KEY (`EMAIL`);
  
ALTER TABLE `booking`
MODIFY `BOOK_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
  
ALTER TABLE `cars`
MODIFY `CAR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
  
ALTER TABLE `feedback`
MODIFY `FED_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `payment`
MODIFY `PAY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

ALTER TABLE `booking`
ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`CAR_ID`) REFERENCES `cars` (`CAR_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`EMAIL`) REFERENCES `users` (`EMAIL`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `feedback`
ADD CONSTRAINT `TEST` FOREIGN KEY (`EMAIL`) REFERENCES `users` (`EMAIL`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `payment`
ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BOOK_ID`) REFERENCES `booking` (`BOOK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
-- COMMIT;

use cabriolet;
show tables ;
select*from admin;
select*from users;


