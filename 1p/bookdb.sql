-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2018 at 08:45 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bookdb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `BookAddOrEdit`(
_BookID INT,
_BookName Varchar(45),
_Author varchar(45),
_Description varchar(250)
)
BEGIN
	IF _BookID = 0 then
		insert into book (BookName, AUthor, Description)
		values (_BookName, _Author, _Description);
	else
		update book
        set
			BookName = _BookName,
            Author = _Author,
            Description = _Description
		where
			BookID = _BookID;
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BookDeleteByID`(
_BookID int
)
BEGIN
	delete from book
    where BookID = _BookID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BookSearchByValue`(
_SearchValue varchar(45)
)
BEGIN
	select *
    from book
    where BookName like CONCAT('%',_SearchValue,'%') || Author like CONCAT('%',_SearchValue,'%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BookViewAll`()
BEGIN
	select *
    from book;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BookViewByID`(
_BookID int
)
BEGIN
	select *
    from book
    where BookID = _BookID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
`BookID` int(11) NOT NULL,
  `BookName` varchar(45) DEFAULT NULL,
  `Author` varchar(45) DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`BookID`, `BookName`, `Author`, `Description`) VALUES
(2, 'Book ooh', 'di', 'nice me'),
(5, 'another bood', 'me ohh', 'a good book');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
 ADD PRIMARY KEY (`BookID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
