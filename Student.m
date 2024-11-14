classdef Student
    properties
        ID      % Student ID
        Name    % Student Name
        Age     % Student Age
        GPA     % Student GPA
        Major   % Student Major
    end
    
    methods
        % Constructor method with error checking designed for each input.
        function obj = Student(ID, Name, Age, GPA, Major)
            if nargin > 0
                % Prove ID
                if ~isnumeric(ID) || ID <= 0 || mod(ID, 1) ~= 0
                    error('ID must be a positive integer.');
                end
                
                % Prove Name
                if ~ischar(Name) && ~isstring(Name)
                    error('Name must be a string or character array.');
                end
                
                % Prove Age
                if ~isnumeric(Age) || Age <= 0 || mod(Age, 1) ~= 0
                    error('Age must be a positive integer.');
                end
                
                % Prove GPA
                if ~isnumeric(GPA) || GPA < 0 || GPA > 4.0
                    error('GPA must be a number between 0 and 4.0.');
                end
                
                % Prove Major
                if ~ischar(Major) && ~isstring(Major)
                    error('Major must be a string or character array.');
                end

                % Demonstrate values if all proofs have no errors.
                obj.ID = ID;
                obj.Name = Name;
                obj.Age = Age;
                obj.GPA = GPA;
                obj.Major = Major;
            end
        end
        
        % Show student info
        function displayInfo(obj)
            try
                fprintf('ID: %d\nName: %s\nAge: %d\nGPA: %.2f\nMajor: %s\n', ...
                    obj.ID, obj.Name, obj.Age, obj.GPA, obj.Major);
            catch
                error('Error displaying student information.');
            end
        end
        
        % Update GPA with Proof
        function obj = updateGPA(obj, newGPA)
            if isnumeric(newGPA) && newGPA >= 0 && newGPA <= 4.0
                obj.GPA = newGPA;
            else
                error('Invalid GPA: must be a number between 0 and 4.0.');
            end
        end
    end
end
