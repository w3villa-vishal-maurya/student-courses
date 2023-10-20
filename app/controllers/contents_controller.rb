class ContentsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @content = Content.new
  end

  def index
    @content = Content.all
  end

  def create
    # debugger
    course_id = params[:content][:course_id].to_i
    @content = Content.new(content_params)
    @content.course_id = course_id
    if @content.save
      redirect_to contents_path
    else
      render :new
    end
  end

  def show
  end

  private

  def content_params
    params.require(:content).permit(:content_title, :content_description)
  end
end
