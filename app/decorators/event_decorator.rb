class EventDecorator < Draper::Base
  decorates :event

  def time
    read_attribute(:arrival_time).strftime("%l:%m%P").strip
  end
  def date
    read_attribute(:arrival_time).strftime("%e %B %Y").strip
  end
  def datetime
    [time, date].join(" on ")
  end
  def arrival_time
    read_attribute(:arrival_time).strftime("%m/%e/%Y %h:%m")
  end
end
