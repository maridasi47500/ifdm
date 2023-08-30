class Card < ApplicationRecord
belongs_to :payment
belongs_to :echeance, optional: true
before_save :mygmt
after_validation :addmyerror
def mypaymentcreated
j=self.gmt >= 0 ? "+" : ""
j<<self.gmt.to_s
(self.created_at+self.gmt.hours).to_datetime.change(offset: j)
end
def mygmt
self.gmt=Time.now.getlocal.strftime("%:z").to_i
end
def addmyerror
if self.payment.cards.length >= self.payment.option.to_i
self.errors.add(:myerror,"vous avez payé toute les échéances")
end
    if self.payment.echeancepassenonpayes.length > 0
self.errors.add(:myerror,"vous avez râté des échéances.contactez l'école")
 
   end
    if self.payment.echeancefuturnonpayes.length == 0
self.errors.add(:myerror,"vous avez payé toute les échéances")

    end
end
def mycardnumber
d=nb
d[0..-4]="x" * d[0..-4].length
d
end
end
