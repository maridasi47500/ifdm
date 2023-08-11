class AchatsController < ApplicationController
  def cours
@course=Course.all
  end
end
