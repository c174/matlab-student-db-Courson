% Search for a specific student by ID Number, e.g., Student 22
student_id = 22;
specific_student = db.findStudentByID(student_id);

% Show the student's information when and if found
if ~isempty(specific_student)
    disp(['Displaying information for Student ' num2str(student_id) ':']);
    specific_student.displayInfo();
else
    disp(['Student with ID ' num2str(student_id) ' not found.']);
end

% Specify the major you want to search for
desired_major = 'Mathematics';

% Retrieve students in the specified major
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
