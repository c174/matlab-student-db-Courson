This Project is of a student database system used to track each undergraduate at an institution. This Project includes methods to ass, store, retrieve, visualize, and anaylyze data, such as an operation to search for a specific ID Number.
Student Class, ID, Name, Age, GPA, Major, 
Methods, Used constructor with error checking for input/output.
displayinfor(), Show student info
updategpa(newGPA), Update for student GPA
Student Database, properties, array of objects used for students
addStudent(student), add student to database as an object
findStudentByID(ID): Finds student based on ID number
getStudentByMajor(major): Returns array of students in terms of major
saveToFile(filename): Saves database as a mat file with error handling
loadFromFile(filename): Loads database as a mat file with error handling
plotGpaDistribution(): For histogram visual
plotAverageGpaByMajor(): Uses Bar Chart to demonstrate GPA
plotAgeDistribution(): Histogram for student ages
plotGpaVsAgeInteractive(): Interactive scatter plot
plotGpaBoxPlotByMajor(): Box plot for GPA by major
gpaSummaryStatistics(): Include summary stats, such as S.D.

Run Main.m for the full list of students in order from 1-200.
To find specific student based on ID number, just run this as a file with database components.
student_id = 22; % Example student ID
specific_student = db.findStudentByID(student_id);
if ~isempty(specific_student)
    specific_student.displayInfo();
else
    disp(['Student with ID ' num2str(student_id) ' not found.']);
end
Argument to find students with only major as info. Run as a seperate file with database intact.
db.saveToFile('student_database.mat'); Save Database
db = db.loadFromFile('student_database.mat'); Load Database
db.plotGpaDistribution();
db.plotAverageGpaByMajor();
db.plotAgeDistribution();
db.plotGpaVsAgeInteractive();
db.plotGpaBoxPlotByMajor();
Plots and Graphs

Implemented features include seperate way to find student with only ID number or only Major in additional file.
