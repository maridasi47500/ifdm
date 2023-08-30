class Echeance < ApplicationRecord
belongs_to :payment
has_one :card
validates_uniqueness_of :payment_id, scope: :date
def self.mesecheances
where("date >= ?",Date.today)
end
end
