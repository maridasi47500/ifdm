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
  end
  def courses
  end
  def group
  end
  def individual
  end
end
