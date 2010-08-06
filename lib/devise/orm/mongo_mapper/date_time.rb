class Date
  unless method_defined?(:gmtime)
    delegate :gmtime, :to => :to_time
  end

  def utc           
    Time.zone.parse("#{hour.to_i - zone.to_i}:#{min}:#{sec}")
    # self.to_datetime.new_offset(0)
  end
  
  def to_i
    to_time.utc.to_i
  end
end
