class Event < ActiveRecord::Base
  validates :name,          presence: true
  validates :destination,   presence: true
  validates :arrival_time,  presence: true

  alias_attribute :date, :arrival_time
end
