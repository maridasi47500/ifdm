class ApplicationController < ActionController::Base
before_action :myaction
def myaction
session["achats"]||={}
end
  def after_sign_up_path_for(resource)
    "inscriptions/success?mytype=#{resource.mytype}"
  end


end
