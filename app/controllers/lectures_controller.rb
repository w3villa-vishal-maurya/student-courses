class LecturesController < ApplicationController
  def new
    @lecture = Lecture.new
  end

  def index
    @lecture = Lecture.all
  end

  def create
    @lecture = Lecture.new(lecture_params)
   

    if @lecture.save
      redirect_to lecture_index_path
    else
      render :new
    end
  end

  def show
  end

  private

  def lecture_params
    params.require(:lecture).permit(:lecture_title, :lecture_description, :lecture_duration, :lecture_notes)
  end
end
