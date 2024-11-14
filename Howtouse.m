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
