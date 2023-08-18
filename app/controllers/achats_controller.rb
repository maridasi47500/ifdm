class AchatsController < ApplicationController
  def show
      @course=CCourse.find(params[:id])
  end
  def cours
    case params[:mytype]
    when "collectifs"
      @course=Collective.all
    when "individuels"
      @course=Private.all
    #else
    #  @course=Course.all
    end

  end
end
