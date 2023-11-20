-- Create Borrower and Fine tables
CREATE TABLE Borrower (
    Roll_no NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Date_of_Issue DATE,
    Name_of_Book VARCHAR2(100),
    Status VARCHAR2(1)
);

CREATE TABLE Fine (
    Roll_no NUMBER,
    Fine_Date DATE,
    Amount NUMBER
);

-- Insert sample data into Borrower table
INSERT INTO Borrower (Roll_no, Name, Date_of_Issue, Name_of_Book, Status)
VALUES (101, 'John Doe', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Introduction to PL/SQL', 'I');

INSERT INTO Borrower (Roll_no, Name, Date_of_Issue, Name_of_Book, Status)
VALUES (102, 'Jane Smith', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'Advanced SQL', 'I');

select * from Borrower

-- Create a stored procedure to calculate fine and update status
CREATE OR REPLACE PROCEDURE SubmitBook (
    p_Roll_no IN Borrower.Roll_no%TYPE,
    p_Name_of_Book IN Borrower.Name_of_Book%TYPE
) IS
    v_Issue_Date DATE;
    v_Days_Late NUMBER;
    v_Fine_Amount NUMBER;
BEGIN
    -- Fetch issue date and calculate days late
    SELECT Date_of_Issue INTO v_Issue_Date
    FROM Borrower
    WHERE Roll_no = p_Roll_no AND Name_of_Book = p_Name_of_Book;

    v_Days_Late := TRUNC(SYSDATE - v_Issue_Date);

    -- Update status based on days late
    IF v_Days_Late > 30 THEN
        UPDATE Borrower
        SET Status = 'R'
        WHERE Roll_no = p_Roll_no AND Name_of_Book = p_Name_of_Book;

        -- Calculate and store fine
        v_Fine_Amount := 50 * (v_Days_Late - 30);
        INSERT INTO Fine (Roll_no, Fine_Date, Amount)
        VALUES (p_Roll_no, SYSDATE, v_Fine_Amount);
        
    ELSIF v_Days_Late >= 15 THEN
        UPDATE Borrower
        SET Status = 'R'
        WHERE Roll_no = p_Roll_no AND Name_of_Book = p_Name_of_Book;

        -- Calculate and store fine
        v_Fine_Amount := 5 * v_Days_Late;
        INSERT INTO Fine (Roll_no, Fine_Date, Amount)
        VALUES (p_Roll_no, SYSDATE, v_Fine_Amount);
    ELSE
        UPDATE Borrower
        SET Status = 'R'
        WHERE Roll_no = p_Roll_no AND Name_of_Book = p_Name_of_Book;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Book not found for the given Roll_no and Name_of_Book.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END SubmitBook;
/

-- Call the SubmitBook procedure for the first borrower
BEGIN
    SubmitBook(101, 'Introduction to PL/SQL');
END;
/

-- Call the SubmitBook procedure for the second borrower
EXECUTE SubmitBook(102, 'Advanced SQL');


select * from Fine;