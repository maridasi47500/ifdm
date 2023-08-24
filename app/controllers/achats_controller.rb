class AchatsController < ApplicationController
  before_action :find_course, only:[:add, :show]
  def show
      
  end
    def add
        session[:achats]||={}
        
            session[:achats][params[:id]]=params[:quantite]
            total=session[:achats].to_a.map{|a,b|Course.find(a).price*b.to_i}.sum
            soustotal=params[:quantite].to_i * @course.price
        p session[:achats]    
        render json: {"soustotal"=>soustotal, sum: session[:achats].values.map(&:to_i).sum, total: total}, layout: false
    
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
  private
  def find_course
    @course=Course.find(params[:id])
  end
end
