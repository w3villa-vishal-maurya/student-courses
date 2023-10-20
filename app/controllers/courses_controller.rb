class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def index
    @student_id = params[:id]
    # @user = Student.find(@student_id)
    @course = Course.all
  end

  def create
    # debugger
    @course = Course.new(course_params)

    if @course.save
      redirect_to course_index_path
    else
      render :new
    end
  end

  def show
    @student_id = params[:student_id]

    if params[:student_id] == params[:id]
      @course = Course.find(params[:course_id])
    else
      @course = Course.find(params[:id])
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to course_show_path
    else
      render plain: "student not found!"
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to course_index_path
  end

  def course_buy
 

    if current_student.present?
      @student = Student.find(current_student.id)
      @course = Course.find(params[:course_id])

      # @student.teachers.create(course_id: @course.id)

      @teacher = Teacher.new(course_id: @course.id, student_id: @student.id)
      if @teacher.save
        flash[:notice] = "Course have been assigned"
        redirect_to root_path
      else
        flash[:alert] = "Error"
        redirect_to course_index_path
      end
    else
      flash[:alert] = "Login First"
      redirect_to root_path
    end

    #@student = Student.find(params[:student_id])
  end

  private

  def course_params
    params.require(:course).permit(:courseTitle, :courseDuration, :courseModule, :courseDescription, :coursePrice, :course_image, :category_id)
  end
end
