USE library
GO

CREATE TABLE library_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1000, 1000),
	branch_name CHAR (50) NULL,
	street_address CHAR (150) NULL);

INSERT INTO library_branch
	(branch_name, street_address)
	VALUES
	('Sharpstown', '299 Elm Street'),
	('Central', '882 Broadway'),
	('Abbots', '1225 Grand Ave'),
	('Downtown', '457 Main Street');

CREATE TABLE publisher (
	publisher_name CHAR (200) PRIMARY KEY NOT NULL,
	street_address CHAR (200) NULL, phone CHAR (25) NULL);

INSERT INTO publisher
	(publisher_name, street_address, phone)
	VALUES
	('Henry Holt and Company, Inc.', '175 Fifth Ave, New York, NY 10010', '646-307-5095'),
	('Penguin Random House', '1745 Broadway, New York, NY 10019', '800-733-3000'),
	('Russian Messenger c/o Russian Russky Gazette', 'PO Box 111, Moscow, Russia 105062', '495-605-08-58'),
	('Simon & Schuster', '1230 Avenue of the Americas, New York, NY 10020', '212-698-7000'), 
	('William Morrow and Company c/o HarperCollins Publishers', '195 Broadway, New York, NY 10007', '212-207-7000'), 
	('Bloomsbury Publishing, Inc', '1385 Broadway, 5th Floor, New York, NY 10018', '212-419-5300'),
	('HarperCollins Publishers', '195 Broadway, New York, NY 10007', '212-207-7000'),
	('Mariner Books', '215 Park Avenue South, New York, NY 10003', '800-225-3362'),
	('Hachette Livre', '58 Rue Jean Bleuzen, 92170 Vanves, France', '33-1-43-92-30-00'),
	('Knopf Doubleday Publishers', '1745 Broadway, New York, NY 10019', '212-782-9000');

CREATE TABLE books (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (1000, 100),
	title CHAR (150) NULL,
	publisher_name CHAR (200) NOT NULL CONSTRAINT fk_publisher_name
	FOREIGN KEY REFERENCES publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE);

INSERT INTO books
	(title, publisher_name)
	VALUES
	('The Lost Tribe', 'Henry Holt and Company, Inc.'),
	('The Diamond Age', 'Penguin Random House'),
	('Dune', 'Penguin Random House'),
	('Crime and Punishment', 'Russian Messenger c/o Russian Russky Gazette'),
	('When You Are Engulfed in Flames', 'Simon & Schuster'),
	('Don Quixote', 'Penguin Random House'),				
	('Anatham', 'William Morrow and Company c/o HarperCollins Publishers'),
	('Neuromancer', 'Penguin Random House'),
	('Circe', 'Bloomsbury Publishing, Inc'),					
	('Guards! Guards!', 'HarperCollins Publishers'),
	('Valis', 'Mariner Books'),					
	('Seveneves', 'William Morrow and Company c/o HarperCollins Publishers'),
	('Jonathan Strange & Mr. Norrell', 'Bloomsbury Publishing, Inc'),	
	('War and Peace', 'Russian Messenger c/o Russian Russky Gazette'),				
	('October in the Chair', 'Simon & Schuster'),			
	('A Feast for Crows', 'Penguin Random House'),			
	('Men at Arms', 'HarperCollins Publishers'),
	('King of the Vagabonds', 'HarperCollins Publishers'),
	('Naked Lunch', 'Hachette Livre'),				
	('The Gods Themselves', 'Knopf Doubleday Publishers'),
	('It', 'Penguin Random House'),
	('The Shining', 'Knopf Doubleday Publishers');

CREATE TABLE book_authors (
	book_id INT FOREIGN KEY REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	authors_name CHAR (150) NULL);          

INSERT INTO book_authors
	(book_id, authors_name)
	VALUES
	('1000', 'MARRIOTT, Edward'),
	('1100', 'STEPHENSON, Neal'),
	('1200', 'HERBERT, Frank'),
	('1300', 'DOSTOYEVSKY, Fyodor'),
	('1400', 'SEDARIS, David'),
	('1500', 'De CERVANTES, Miguel'),
	('1600', 'STEPHENSON, Neal'),
	('1700', 'GIBSON, William'),
	('1800', 'MILLER, Madeline'),
	('1900', 'PRATCHETT, Terry'),
	('2000', 'DICK, Phillip K.'),
	('2100', 'STEPHENSON, Neal'),
	('2200', 'Clarke, Susanna'),
	('2300', 'TOLSTOY, Leo'),
	('2400', 'GAIMAN, Neil'),
	('2500', 'MARTIN, George R.R.'),
	('2600', 'PRATCHETT, Terry'),
	('2700', 'STEPHENSON, Neal'),
	('2800', 'BURROUGHS, William S.'),
	('2900', 'ASIMOV, Isaac'),
	('3000', 'KING, Stephen'),
	('3100', 'KING, Stephen'); 

CREATE TABLE book_copies (
	book_id INT FOREIGN KEY REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE, 
	branch_id INT FOREIGN KEY REFERENCES library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	number_of_copies INT NULL);

INSERT INTO book_copies (
	book_id, branch_id, number_of_copies)
	VALUES
	('1000', '1000', '5'),	
	('1000', '2000', '5'),
	('1000', '3000', '5'),
	('1000', '4000', '5'),
	('1100', '1000', '5'),
	('1100', '2000', '5'),
	('1100', '3000', '5'),
	('1100', '4000', '5'),
	('1200', '1000', '5'),
	('1200', '2000', '5'),
	('1200', '3000', '5'),
	('1200', '4000', '5'),
	('1300', '1000', '5'),
	('1300', '2000', '5'),
	('1300', '3000', '5'),
	('1300', '4000', '5'),
	('1400', '1000', '5'),
	('1400', '2000', '5'),
	('1400', '3000', '5'),
	('1400', '4000', '5'),
	('1500', '1000', '5'),
	('1500', '2000', '5'),
	('1500', '3000', '5'),
	('1500', '4000', '5'),
	('1600', '1000', '5'),
	('1600', '2000', '5'),
	('1600', '3000', '5'),
	('1600', '4000', '5'),
	('1700', '1000', '5'),
	('1700', '2000', '5'),
	('1700', '3000', '5'),
	('1700', '4000', '5'),
	('1800', '1000', '5'),
	('1800', '2000', '5'),
	('1800', '3000', '5'),
	('1800', '4000', '5'),
	('1900', '1000', '5'),
	('1900', '2000', '5'),
	('1900', '3000', '5'),
	('1900', '4000', '5'),
	('2000', '1000', '5'),
	('2000', '2000', '5'),
	('2000', '3000', '5'),
	('2000', '4000', '5'),
	('2100', '1000', '5'),
	('2100', '2000', '5'),
	('2100', '3000', '5'),
	('2100', '4000', '5'),
	('2200', '1000', '5'),
	('2200', '2000', '5'),
	('2200', '3000', '5'),
	('2200', '4000', '5'),
	('2300', '1000', '5'),
	('2300', '2000', '5'),
	('2300', '3000', '5'),
	('2300', '4000', '5'),
	('2400', '1000', '5'),
	('2400', '2000', '5'),
	('2400', '3000', '5'),
	('2400', '4000', '5'),
	('2500', '1000', '5'),
	('2500', '2000', '5'),
	('2500', '3000', '5'),
	('2500', '4000', '5'),
	('2600', '1000', '5'),
	('2600', '2000', '5'),
	('2600', '3000', '5'),
	('2600', '4000', '5'),
	('2700', '1000', '5'),
	('2700', '2000', '5'),
	('2700', '3000', '5'),
	('2700', '4000', '5'),
	('2800', '1000', '5'),
	('2800', '2000', '5'),
	('2800', '3000', '5'),
	('2800', '4000', '5'),
	('2900', '1000', '5'),
	('2900', '2000', '5'),
	('2900', '3000', '5'),
	('2900', '4000', '5'),
	('3000', '1000', '5'),
	('3000', '2000', '5'),
	('3000', '3000', '5'),
	('3000', '4000', '5'),
	('3100', '1000', '5'), 
	('3100', '2000', '5'), 
	('3100', '3000', '5'), 
	('3100', '4000', '5');

CREATE TABLE borrower (
	card_number INT PRIMARY KEY NOT NULL IDENTITY (101, 1),
	full_name CHAR (150) NULL,
	street_address CHAR (200) NULL,
	email CHAR (50) NULL);

INSERT INTO borrower
	(full_name, street_address, email)
	VALUES
	('Bob Brown', '418 Holly', 'bob@brown.com'),
	('Mary Mills', '842 Fir', 'mary@mills.com'),
	('Kim King', '519 Oak', 'kim@king.com'),
	('John Jones', '620 Ash', 'john@jones.com'),
	('Bob Mills', '953 Hickory', 'bob@mills.com'),
	('Mary King', '101 Larch', 'mary@king.com'),
	('Kim Jones', '731 Maple', 'kim@jones.com'),
	('John Brown', '119 Poplar', 'john@brown.com'),
	('Bob King', '221 Spring', 'bob@king.com'),
	('Mary Jones', '990 Summer', 'mary@jones.com'),
	('Kim Brown', '588 Autumn', 'kim@brown.com'),
	('John Mills', '632 Winter', 'john@mills.com'),
	('Bob Jones', '95 Eaton', 'bob@jones.com'),
	('Mary Brown', '418 Holly', 'mary@brown.com'),
	('Kim Mills', '808 Oak', 'kim@mills.com'),
	('John King', '519 Oak', 'john@king.com'),
	('Matt Delaney', '345 Windsor', 'matt@delaney.com'),
	('Delaney Timms', '747 Stratford', 'delaney@timms.com'),
	('Tim Matthews', '444 Ulster', 'tim@matthews.com');

CREATE TABLE book_loans (
	book_id INT FOREIGN KEY REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE, 
	branch_id INT FOREIGN KEY REFERENCES library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_number INT FOREIGN KEY REFERENCES borrower(card_number) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out DATE NULL, 
	date_due DATE NULL);

INSERT INTO book_loans (
	book_id, branch_id, card_number, date_out, date_due)
	VALUES
	('3000', '1000', '101', '6/1/2019', '6/15/2019'),
	('3000', '4000', '102', '6/3/2019', '6/17/2019'),
	('1900', '4000', '102', '6/3/2019', '6/17/2019'),
	('3000', '4000', '103', '5/30/2019', '6/13/2019'),
	('1400', '4000', '103', '5/30/2019', '6/13/2019'),
	('1000', '4000', '103', '5/30/2019', '6/13/2019'),
	('1300', '2000', '103', '6/5/2019', '6/19/2019'),
	('2300', '2000', '103', '6/5/2019', '6/19/2019'),
	('2500', '3000', '104', '6/1/2019', '6/15/2019'),
	('1200', '2000', '105', '6/2/2019', '6/16/2019'),
	('1900', '2000', '105', '6/2/2019', '6/16/2019'),
	('2500', '2000', '105', '6/2/2019', '6/16/2019'),
	('3100', '3000', '106', '5/27/2019', '6/10/2019'),
	('2500', '3000', '106', '5/27/2019', '6/10/2019'),
	('2200', '3000', '106', '5/27/2019', '6/10/2019'),
	('2400', '3000', '106', '5/27/2019', '6/10/2019'),
	('1800', '4000', '106', '6/15/2019', '6/29/2019'),
	('3100', '2000', '107', '6/4/2019', '6/18/2019'),
	('3100', '2000', '107', '6/4/2019', '6/18/2019'),
	('1800', '2000', '107', '6/4/2019', '6/18/2019'),
	('2100', '2000', '107', '6/4/2019', '6/18/2019'),
	('2400', '2000', '107', '6/4/2019', '6/18/2019'),
	('3000', '1000', '108', '5/31/2019', '6/14/2019'),
	('1000', '1000', '108', '5/31/2019', '6/14/2019'),
	('2100', '1000', '108', '5/31/2019', '6/14/2019'),
	('3000', '3000', '109', '6/10/2019', '6/24/2019'),
	('3100', '3000', '109', '6/10/2019', '6/24/2019'),
	('2800', '2000', '110', '6/1/2019', '6/15/2019'),
	('2100', '2000', '110', '6/1/2019', '6/15/2019'),
	('1700', '1000', '110', '5/31/2019', '6/14/2019'),
	('2500', '1000', '111', '6/4/2019', '6/18/2019'),
	('2000', '2000', '112', '5/27/2019', '6/10/2019'),
	('2900', '2000', '112', '5/27/2019', '6/10/2019'),
	('1500', '4000', '112', '6/5/2019', '6/19/2019'),
	('1100', '1000', '113', '6/3/2019', '6/22/2019'),
	('1200', '1000', '113', '6/3/2019', '6/22/2019'),
	('1900', '2000', '113', '5/30/2019', '6/13/2019'),
	('2500', '2000', '113', '5/30/2019', '6/13/2019'),
	('1400', '3000', '113', '6/6/2019', '6/20/2019'),
	('1700', '3000', '113', '6/3/2019', '6/20/2019'),
	('3000', '3000', '113', '6/3/2019', '6/20/2019'),
	('1900', '1000', '114', '6/13/2019', '6/27/2019'),
	('2000', '1000', '114', '6/13/2019', '6/27/2019'),
	('2600', '4000', '114', '6/3/2019', '6/22/2019'),
	('3000', '4000', '114', '6/3/2019', '6/22/2019'),
	('1600', '4000', '115', '6/12/2019', '6/26/2019'),
	('2700', '2000', '116', '6/1/2019', '6/15/2019'),
	('1100', '2000', '116', '6/1/2019', '6/15/2019'),
	('1600', '2000', '116', '6/1/2019', '6/15/2019'),
	('1200', '3000', '116', '6/12/2019', '6/26/2019'),
	('2600', '3000', '116', '6/12/2019', '6/26/2019');

--1.
SELECT books.title, library_branch.branch_name, book_copies.number_of_copies 
	FROM book_copies
	INNER JOIN books ON books.book_id = book_copies.book_id
	INNER JOIN library_branch ON library_branch.branch_id = book_copies.branch_id
	WHERE title = 'The Lost Tribe' 
	AND branch_name = 'Sharpstown';

--2.
SELECT books.title, library_branch.branch_name, book_copies.number_of_copies 
	FROM book_copies
	INNER JOIN books ON books.book_id = book_copies.book_id
	INNER JOIN library_branch ON library_branch.branch_id = book_copies.branch_id
	WHERE title = 'The Lost Tribe';

--3.
SELECT borrower.full_name
	FROM borrower
	LEFT JOIN book_loans ON book_loans.card_number = borrower.card_number
	WHERE book_loans.date_out is NULL;

--4.
SELECT books.title, borrower.full_name, borrower.street_address
	FROM book_loans
	INNER JOIN books ON books.book_id = book_loans.book_id
	INNER JOIN borrower ON borrower.card_number = book_loans.card_number
	WHERE book_loans.date_due = '6/14/2019';

--5. 
SELECT library_branch.branch_name, COUNT(book_loans.book_id) AS 'TOTAL'
	FROM book_loans
	LEFT JOIN library_branch ON library_branch.branch_id = book_loans.branch_id
	GROUP BY library_branch.branch_name;

--6. 
SELECT borrower.full_name, borrower.street_address, COUNT(book_loans.book_id) AS 'TOTAL'
	FROM book_loans
	INNER JOIN borrower ON borrower.card_number = book_loans.card_number
	GROUP BY borrower.full_name, borrower.street_address
	HAVING COUNT(book_loans.book_id)>4;

--7.
SELECT books.title, book_copies.number_of_copies AS 'TOTAL'
	FROM book_copies
	INNER JOIN books ON books.book_id = book_copies.book_id
	INNER JOIN book_authors ON book_authors.book_id = book_copies.book_id
	INNER JOIN library_branch ON library_branch.branch_id = book_copies.branch_id
	WHERE library_branch.branch_name = 'Central'
	AND book_authors.authors_name = 'KING, Stephen';