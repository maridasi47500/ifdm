class OrderController < ApplicationController
before_action :mescours
before_action :myuser, only: [:okorder]
  def monpaiement
  end
  def deletemyaction
session[:achats].delete(params[:id])
redirect_to "/order"
  end
  def okorder
    @user.payments=[Payment.new]
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
  end
@sum=@achats.map{|g|g.quantite.to_f*g.price.to_f}.sum
@total=@achats.map{|g|g.quantite.to_f}.sum

end
def myuser
if user_signed_in?
@user=current_user
else
@user=User.new
end
end
end
