classdef StudentDatabase
    properties
        Students = []; % Array of Student components.
    end
    
    methods
        % Add a new student with input proof.
        function obj = addStudent(obj, student)
            if ~isa(student, 'Student')
                error('Input must be a Student object.');
            end
            obj.Students = [obj.Students, student];
        end
        
        % How to find a student by ID with error handling
        function student = findStudentByID(obj, ID)
            if ~isnumeric(ID) || ID <= 0 || mod(ID, 1) ~= 0
                error('ID must be a positive integer.');
            end
            student = [];
            for i = 1:length(obj.Students)
                if obj.Students(i).ID == ID
                    student = obj.Students(i);
                    return;
                end
            end
            if isempty(student)
                warning('Student with ID %d not found.', ID);
            end
        end
        
        % Design list of students by major with error handling
        function studentsByMajor = getStudentsByMajor(obj, major)
            if ~ischar(major) && ~isstring(major)
                error('Major must be a string or character array.');
            end
            studentsByMajor = obj.Students(strcmp({obj.Students.Major}, major));
            if isempty(studentsByMajor)
                warning('No students found for major %s.', major);
            end
        end
        
        % Save database to a .mat file with file operation error
        % handling, VERY IMPERATIVE.
        function saveToFile(obj, filename)
            if ~ischar(filename) && ~isstring(filename)
                error('Filename must be a string or character array.');
            end
            try
                save(filename, 'obj');
            catch
                error('Error saving database to file. Check file permissions or path.');
            end
        end
        
        % Load database from a .mat file with file operation error
        % handling, VERY IMPERATIVE.
        function obj = loadFromFile(obj, filename)
            if ~ischar(filename) && ~isstring(filename)
                error('Filename must be a string or character array.');
            end
            try
                loadedData = load(filename);
                if isfield(loadedData, 'obj') && isa(loadedData.obj, 'StudentDatabase')
                    obj = loadedData.obj;
                else
                    error('File does not contain a valid StudentDatabase object.');
                end
            catch
                error('Error loading database from file. Ensure the file exists and is a valid .mat file.');
            end
        end

        % Design Visualization Methods with Error Handling.

        % Plot GPA distribution histogram and include custom colors.
        function plotGpaDistribution(obj)
            if isempty(obj.Students)
                error('No students in database to visualize.');
            end
            gpas = [obj.Students.GPA];
            histogram(gpas, 'FaceColor', [0.2, 0.6, 0.8]); % Custom color
            title('GPA Distribution');
            xlabel('GPA');
            ylabel('Number of Students');
        end

        % Plot average GPA by major and include custom colors
        function plotAverageGpaByMajor(obj)
            if isempty(obj.Students)
                error('No students in database to visualize.');
            end
            majors = unique({obj.Students.Major});
            avgGpa = arrayfun(@(m) mean([obj.getStudentsByMajor(m{:}).GPA]), majors);
            bar(categorical(majors), avgGpa, 'FaceColor', [0.8, 0.4, 0.1]); % Custom color
            title('Average GPA by Major');
            xlabel('Major');
            ylabel('Average GPA');
        end

        % Plot age distribution histogram and include custom colors
        function plotAgeDistribution(obj)
            if isempty(obj.Students)
                error('No students in database to visualize.');
            end
            ages = [obj.Students.Age];
            histogram(ages, 'FaceColor', [0.5, 0.8, 0.3]); % Custom color
            title('Age Distribution');
            xlabel('Age');
            ylabel('Number of Students');
        end

        % Interactive scatter plot for GPA vs Age with data cursor included
        % as additional component.
        function plotGpaVsAgeInteractive(obj)
            if isempty(obj.Students)
                error('No students in database to visualize.');
            end
            gpas = [obj.Students.GPA];
            ages = [obj.Students.Age];
            scatter(ages, gpas, 'MarkerFaceColor', [0.4, 0.7, 0.2]); % Custom color
            title('GPA vs Age');
            xlabel('Age');
            ylabel('GPA');
            datacursormode on; % Permits interactive data cursor mode.
        end

        % Box plot of GPAs by major for a statistical distribution.
        function plotGpaBoxPlotByMajor(obj)
            if isempty(obj.Students)
                error('No students in database to visualize.');
            end
            majors = {obj.Students.Major};
            gpas = [obj.Students.GPA];
            boxplot(gpas, majors);
            title('GPA Distribution by Major');
            xlabel('Major');
            ylabel('GPA');
        end

        % Stat summary of GPA.
        function gpaSummaryStatistics(obj)
            if isempty(obj.Students)
                error('No students in database for analysis.');
            end
            gpas = [obj.Students.GPA];
            meanGpa = mean(gpas);
            medianGpa = median(gpas);
            stdGpa = std(gpas);
            minGpa = min(gpas);
            maxGpa = max(gpas);
            
            fprintf('GPA Summary Statistics:\n');
            fprintf('Mean GPA: %.2f\n', meanGpa);
            fprintf('Median GPA: %.2f\n', medianGpa);
            fprintf('Standard Deviation: %.2f\n', stdGpa);
            fprintf('Minimum GPA: %.2f\n', minGpa);
            fprintf('Maximum GPA: %.2f\n', maxGpa);
        end
    end
end
