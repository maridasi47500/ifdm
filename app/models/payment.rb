class Payment < ApplicationRecord
has_many :echeances
has_many :cards
belongs_to :user
def monpaiementecheance
self.echeances.where("date <= ?",Date.today).where.not(id: self.echeances.joins(:card).select("echeances.id"))
end
def echeancefuturnonpayes
self.echeances.where("date >= ?",Date.today).where.not(id: self.echeances.joins(:card).select("echeances.id"))
end
def echeancepassenonpayes
self.echeances.where("date < ?",Date.today).where.not(id: self.echeances.joins(:card).select("echeances.id"))
end

end
