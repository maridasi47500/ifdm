class OrderController < ApplicationController
before_action :mescours
before_action :myuser, only: [:okorder]
  def paiementsuccess
    @mycards=current_user.payments.last.cards
    @lastcard=@mycards.last
    session[:achats]={}
  end
  def monpaiement
    @payment=current_user.payments.last
    @echeance= @payment.echeancefuturnonpayes[0]
    @table=[]
    td=Date.today
    x=[] 
    session[:achats].each do |id, nb|
      x << Paymentcourse.create(payment_id: @payment.id, course_id: id, qty: nb)
    end
    sumqty = x.map(&:qty).map(&:to_i).sum
    sum = x.map{|x|x.course.price.to_f*x.qty.to_f}.sum
    mysum = (sum.to_f / (@payment.option).to_f).ceil.to_i
    quotient, modulus = sum.divmod(mysum)
    p "moudlus : #{modulus}"
    p "option paiment : #{@payment.option}"
    if modulus > 0
      if @payment.option.to_i == 1
        @table=[[td, sum]]
      else
        i=0
        @payment.option.to_i.times do
          if i == (@payment.option.to_i -  1)
            @table.push([td,modulus])
            Echeance.find_or_create_by(payment_id:@payment.id, date:td,sum:modulus)
          else
            @table.push([td,mysum])
            Echeance.find_or_create_by(payment_id:@payment.id, date:td,sum:mysum)
          end
          td+=30.days
          i+=1
        end
      end
    else
        i=0
        @payment.option.to_i.times do 
          @table.push([td,mysum])
          Echeance.find_or_create_by(payment_id:@payment.id, date:td,sum:mysum)
          td+=30.days
          i+=1
        end

    end
    @echeance= @payment.echeancefuturnonpayes[0]
    p @payment.echeancefuturnonpayes.length > 0
    p @payment.echeancefuturnonpayes
    if @payment.echeancepassenonpayes.length > 0
      redirect_to root_path, notice: "vous avez râté une échéance." 
    elsif @payment.echeances.mesecheances.length > 0 and @payment.echeancefuturnonpayes.length > 0
      @card=Card.new(payment_id:@payment.id, sum:@table.select{|date,somme|date>= Date.today}[0][1],echeance_id: @echeance.id)
    else
      redirect_to root_path, notice: "toutes mes échéances sont payées." 
    end
  end
  def deletemyaction
session[:achats].delete(params[:id])
redirect_to "/order"
  end
  def okorder
    @user.payments=[Payment.new(payonce: false, moyen: "mastercard", option: "1")]
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
