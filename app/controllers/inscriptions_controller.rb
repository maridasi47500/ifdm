class InscriptionsController < ApplicationController
  before_action :azerty, only: [:collectifs, :individuels]
  def index
  end
  def form
    render layout: false
  end
  def collectifs
    @mycourse=Collective.mycourse
    render :form
  end
  def individuels
    @mycourse=Private.mycourse
    render :form
  end
  private
  def azerty
    @user=User.new
    @user.weekdays=Weekday.all
  end
end
