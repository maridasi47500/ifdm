class OrderController < ApplicationController
before_action :mescours
  def myorder
delete session[:achats][params[:id]]
redirect_to "order"
  end
  def myorder
@user=User.new
if user_signed_in?
@user=current_user
end

end

private
def mescours
@achats=session["achats"].map do |a,h|
x=Course.find a
x.quantite=h
x
@sum=@achats.map{|g|g.quantite*g.price}.sum
@total=@achats.map{|g|g.quantite}.sum
  end
end
end
