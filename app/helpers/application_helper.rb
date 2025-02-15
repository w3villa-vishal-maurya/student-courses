module ApplicationHelper
    def top_courses
        @course = Course.all
        # arr = Array.new(@course.length())
        # @course.each do |course|
        #     arr.push(course.courseTitle)
        # end   

        arr = ["Math", "Python", "DSA", "Science", "Physics"]

        return arr.to_set;
    end

    def courses_payment(course)
        return true unless course.payments.where(student_id: current_student.id).present?
    end

end
 