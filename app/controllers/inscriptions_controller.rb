class InscriptionsController < ApplicationController
  def index
  end
  def form
    render layout: false
  end
  def collectifs
    render :form
  end
  def individuels
    render :form
  end
end
