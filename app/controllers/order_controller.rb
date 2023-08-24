class OrderController < ApplicationController
before_action :mescours
before_action :myuser, only: [:okorder]
  def monpaiement
    @payment=current_user.payments.last
    @table=[]
    td=Date.today
    x=[] 
    session[:achats].each do |id, nb|
      x << Paymentcourse.create(payment_id: @payment.id, course_id: i, qty: nb)
    end
    sum = x.map(&:qty).map(&:to_i).sum
    quotient, modulus = sum.divmod(@payment.option)
    if modulus > 0
      if @payment.option == 1
        @table=[[td, quotient],[(td+30.days),modulus]]
      else
        x.each_with_index do |xx,i|
          if i == (x.length - 1)
            @table.push([td,modulus])
            Echeance.find_or_create_by(payment_id:@payment.id, date:td,sum:modulus)
          else
            @table.push([td,quotient])
            Echeance.find_or_create_by(payment_id:@payment.id, date:td,sum:quotient)
          end
          td+=30.days
        end
      end
    else
        x.each_with_index do |xx,i|
          @table.push([td,quotient])
          Echeance.find_or_create_by(payment_id:@payment.id, date:td,sum:quotient)
          td+=30.days
        end

    end
    
    @card=Card.new(payment_id:@payment.id, sum:@table.select{|date,somme|date>= Date.today}[0][1])
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
