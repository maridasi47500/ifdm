class Schedule < ApplicationRecord
  def self.myschedule
   all.select("schedules.*, row_number() over(partition by schedules.id) as rownum")
  end

end
