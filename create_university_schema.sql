-- 1. Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100),
    Email NVARCHAR(100) UNIQUE,
    EnrollmentDate DATE
);

-- 2. Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName NVARCHAR(100),
    Credits INT CHECK (Credits BETWEEN 1 AND 6)
);
-- 3. Instructors Table
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY IDENTITY(1,1),
    InstructorName NVARCHAR(100),
    Department NVARCHAR(50)
);

-- 4. CourseAssignments (Many-to-Many: Instructors ↔ Courses)
CREATE TABLE CourseAssignments (
    InstructorID INT,
    CourseID INT,
    PRIMARY KEY (InstructorID, CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- 5. Enrollments (Many-to-Many: Students ↔ Courses)
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Grade CHAR(1) CHECK (Grade IN ('A', 'B', 'C', 'D', 'F')),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

