CREATE TABLE Books (
    AccNo INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Publisher VARCHAR(255) NOT NULL
);

CREATE TABLE Library_Audit_Delete (
    AccNo INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Publisher VARCHAR(255) NOT NULL
);

CREATE TABLE Library_Audit_Update (
    AccNo INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
   	New_Title VARCHAR (255),
    Author VARCHAR(255) NOT NULL,
    Publisher VARCHAR(255) NOT NULL
);

INSERT INTO Books (AccNo, Title, Author, Publisher) VALUES (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner');
INSERT INTO Books (AccNo, Title, Author, Publisher) VALUES (2, 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.');
INSERT INTO Books (AccNo, Title, Author, Publisher) VALUES (3, '1984', 'George Orwell', 'Secker & Warburg');
INSERT INTO Books (AccNo, Title, Author, Publisher) VALUES (4, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall');
INSERT INTO Books (AccNo, Title, Author, Publisher) VALUES (5, 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company');


CREATE OR REPLACE TRIGGER Books_Delete_Audit
BEFORE DELETE ON Books
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit_Delete (AccNo, Title, Author, Publisher)
    VALUES (:OLD.AccNo, :OLD.Title, :OLD.Author, :OLD.Publisher);
END;

delete from Books where AccNo=2;

select * from Books;
select * from Library_audit_Delete;

CREATE OR REPLACE TRIGGER Books_Update_Audit
AFTER UPDATE ON Books
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit_Update (AccNo, Title, New_Title, Author, Publisher)
    VALUES (:OLD.AccNo, :OLD.Title, :NEW.Title, :OLD.Author, :OLD.Publisher);
END;
/

UPDATE Books set Title = 'OM book' where AccNo = 1;

select * from Library_Audit_Update;