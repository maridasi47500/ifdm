class Echeance < ApplicationRecord
belongs_to :payment
def self.mesecheances
where("date > ? and date <= ?",Date.today,Date.today)
end
end
