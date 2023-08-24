class Payment < ApplicationRecord
has_many :echeances
belongs_to :user
end
