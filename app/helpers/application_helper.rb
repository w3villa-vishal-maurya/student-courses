module ApplicationHelper
    def top_courses
        @course = Course.all
        arr = Array.new(@course.length())
        ind = 0
        @course.each do |course|
            arr[ind] = course.courseTitle
            ind += 1;
        end   

        return arr.to_set;
    end

    def filter_course(req_course = "Python")
        @course = Course.all
        @newCourse = Array.new();
        @course.each do |course|
            if course.courseTitle.downcase == req_course.downcase
                @newCourse.push(course);
            end
        end
        
        return @newCourse;
    end
end
 