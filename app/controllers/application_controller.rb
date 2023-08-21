class ApplicationController < ActionController::Base
before_action :myaction
def myaction
session["achats"]||={}
end

end
