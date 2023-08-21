class OrderController < ApplicationController
  def myorder
@achats=session["achats"].map do |a,h|
x=Course.find a
x.quantite=h
x
end
  end
end
