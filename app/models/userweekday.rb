class Userweekday < ApplicationRecord
  has_and_belongs_to_many :schedules, :join_table =>:houruserweekdays
belongs_to :user
belongs_to :weekday
end
