PDF Version is also available of ReadMe.
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

% Search for student by ID Number, e.g., Student 22
student_id = 22;
specific_student = db.findStudentByID(student_id);
% Show the student's information when and if found
if ~isempty(specific_student)
   disp(['Displaying information for Student ' num2str(student_id) ':']);
   specific_student.displayInfo();
else
   disp(['Student with ID ' num2str(student_id) ' not found.']);
end

For Major run this as a separate file same way as previous.

% Specify the major you want to look for
desired_major = 'Mathematics';
% Retrieve students in major
students_in_major = db.getStudentsByMajor(desired_major);
% Check if any students were found and display their information
if ~isempty(students_in_major)
   fprintf('Students in the %s major:\n', desired_major);
   for i = 1:length(students_in_major)
       students_in_major(i).displayInfo();
   end
else
   fprintf('No students found in the %s major.\n', desired_major);
end





