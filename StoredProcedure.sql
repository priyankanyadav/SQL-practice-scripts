--trying to create stored procedure 
CREATE PROCEDURE GetAllStudents
AS
BEGIN
    SELECT * FROM Students;
END;

--for call this function
EXEC GetAllStudents;
