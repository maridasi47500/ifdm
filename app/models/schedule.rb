class Schedule < ApplicationRecord
  def self.myschedule
   all.select("schedules.*, row_number() over(order by schedules.id) as rownum").group(:id)
  end

end
