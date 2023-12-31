class StudentsController < ApplicationController
    before_action :set_student, only: [:edit,:show, :update, :destroy, :student_courses]

    helper_method :filter_course

    def landing_page
        @course = Course.all
        if params[:choose_course]
            @courses = filter_course(params[:choose_course])
        else
            @courses = filter_course("python")
        end
    end
    
    def new
        @student = Student.new
    end

    def index
        @student = Student.all
    end

    def selected
        
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            redirect_to student_index_path
        else 
            render :new
        end
    end

    def show
        # @student = Student.find(params[:id])
    end

    def edit
        # @student = Student.find(params[:id])
    end

    def update
        if @student.update(student_params)
            redirect_to student_show_path
        else
            # debugger
            # puts(@student.errors.full_messages)
            flash[:notice] = @student.errors.full_messages
            redirect_to student_edit_path
            # render plain: "student not found!"
        end
    end

    def destroy
        @student.destroy
        redirect_to student_index_path
    end

    def student_courses
        @all_courses = @student.courses
    end
    
    def student_delete_course
        @student = Student.find(params[:student_id]) 
        @course = Course.find(params[:course_id]) 
        @student.courses.delete(@course.id)

        redirect_to student_courses_path
    end

    def filter_course(req_course = "Python")
        @course = Course.all
        @newCourse = Array.new();
        @course.each do |course|
            if course.courseTitle.downcase.include? req_course.downcase
                @newCourse.push(course);
            end
        end
        
        return @newCourse;
    end

    private

    def student_params
        params.require(:student).permit(:studFName, :studMName, :studLName, :studAddressCity, :studPhone, :studGender, :yearOfEnroll, :profile_image)
    end

    def set_student
        @student = Student.find(params[:id])
    end

end