-- Insert Sample Authors
INSERT INTO authors (name, email, country, birth_year) VALUES
('J.K. Rowling', 'jk.rowling@example.com', 'United Kingdom', 1965),
('George R.R. Martin', 'grrm@example.com', 'United States', 1948),
('Stephen King', 'stephen.king@example.com', 'United States', 1947),
('Agatha Christie', 'agatha@example.com', 'United Kingdom', 1890),
('Paulo Coelho', 'paulo@example.com', 'Brazil', 1947),
('Isaac Asimov', 'asimov@example.com', 'United States', 1920),
('Margaret Atwood', 'margaret@example.com', 'Canada', 1939),
('Ray Bradbury', 'ray@example.com', 'United States', 1920),
('Arthur C. Clarke', 'clarke@example.com', 'United Kingdom', 1917),
('Haruki Murakami', 'murakami@example.com', 'Japan', 1949);

-- Insert Sample Books
INSERT INTO books (title, isbn, publication_date, availability, author_id) VALUES
('Harry Potter and the Sorcerer\'s Stone', '978-0747532699', '1998-06-26', true, 1),
('Harry Potter and the Chamber of Secrets', '978-0747538494', '1998-07-02', true, 1),
('A Game of Thrones', '978-0553103540', '1996-08-06', true, 2),
('A Clash of Kings', '978-0553108033', '1998-11-16', true, 2),
('The Shining', '978-0385333312', '1977-01-28', false, 3),
('It', '978-0450040615', '1986-05-15', true, 3),
('Murder on the Orient Express', '978-0062693556', '1934-01-01', true, 4),
('Death on the Nile', '978-0062693563', '1937-11-01', true, 4),
('The Alchemist', '978-0062315007', '1988-01-01', true, 5),
('Zahir', '978-0061824487', '2005-09-27', true, 5),
('Foundation', '978-0553293357', '1951-06-01', true, 6),
('I, Robot', '978-0553382563', '1950-12-02', true, 6),
('The Handmaid\'s Tale', '978-0385490818', '1985-06-01', false, 7),
('Oryx and Crake', '978-0375407222', '2003-05-06', true, 7),
('Fahrenheit 451', '978-1451673265', '1953-10-19', true, 8),
('The Martian Chronicles', '978-0553273565', '1950-01-01', true, 8),
('2001: A Space Odyssey', '978-0451524935', '1968-04-02', true, 9),
('Rendezvous with Rama', '978-0553293357', '1973-06-01', true, 9),
('Norwegian Wood', '978-0375752667', '1987-09-04', true, 10),
('Kafka on the Shore', '978-1400079278', '2002-09-12', true, 10);
