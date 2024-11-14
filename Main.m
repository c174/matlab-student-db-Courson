% Main.m
% Design database and include sample students for Initialization.
db = StudentDatabase();

% Permit 20 specific majors
majors = {'Biology', 'Engineering', 'Mathematics', 'Physics', 'Chemistry', ...
          'Philosophy', 'English', 'History', 'Psychology', 'Technology', ...
          'Fine Arts', 'Computer Science', 'Business', 'Economics', 'Sociology', ...
          'Political Science', 'Environmental Science', 'Anthropology', 'Law', 'Medicine'};

% Design 200 students across these 20 majors.
students = [];
total_students = 200;
students_per_major = total_students / length(majors);

for id = 1:total_students
    major_index = mod(id-1, length(majors)) + 1; % Cycle through majors.
    major = majors{major_index};
    age = 18 + mod(id, 7); % Ages go through range of 18 to 24.
    gpa = 2.0 + (mod(id, 11) * 0.2); % GPA cycles in a range of 2.0 to 4.0.
    name = ['Student' num2str(id)];  % Unique name based on ID.
    
    % Create a student and add to the collection
    students = [students, Student(id, name, age, gpa, major)];
end

% Add all students to the database in terms of ID Number.
for i = 1:length(students)
    db = db.addStudent(students(i));
end

% Search and show all students in order by ID to ensure ordered output
disp('Displaying all students in order by ID:');
for i = 1:total_students
    student = db.findStudentByID(i);
    if ~isempty(student)
        student.displayInfo();
    end
end

% Save and load database
db.saveToFile('student_database.mat');
db = db.loadFromFile('student_database.mat');

% Visualization
figure;
db.plotGpaDistribution();

figure;
db.plotAverageGpaByMajor();

figure;
db.plotAgeDistribution();

figure;
db.plotGpaVsAgeInteractive();

figure;
db.plotGpaBoxPlotByMajor();

% Show GPA summary statistics
db.gpaSummaryStatistics();
