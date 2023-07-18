class CoursesController < ApplicationController
  def index
    t=params[:type]
    @mytitle=t
    case t
    when "individuels"
      @mytitle+=" à la carte"
      @courses=Private.group(:name)
    when "collectifs"
      @courses=Collective.group(:name)
    else
      @courses=Course.all
      render :allcourses
    end
  
  end
  def edit
    @course=Course.find(params[:id])
  end
  def update
    @course=Course.find(params[:id])
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Ok course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @mytitle="Nos cours"
    @course=Course.where("lower(name) like ?","%"+params[:name].gsub("-","%")+"%")
    if @course[0].is_a?(Private)
      @mytitle+=" individuels de"
    elsif @course[0].is_a?(Collective)
      @mytitle+=" collectifs de" 
    end
    @mytitle+=" "+@course[0].name.downcase
  rescue
    @mytitle="Nos cours"
    @course=Course.find(params[:id])
    if @course.is_a?(Private)
      @mytitle+=" individuels de"
    elsif @course.is_a?(Collective)
      @mytitle+=" collectifs de" 
    end
    @mytitle+=" "+@course.name.downcase
    @course=Course.where(id: @course.id)

  end
  def courses
  end
  def group
  end
  def individual
  end
  def course_params
    params.require(:course).permit(:name, :image, :icon, :description)
  end

end
