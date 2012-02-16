class Event < ActiveRecord::Base
  validates :name,          presence: true
  validates :destination,   presence: true
  validates_presence_of :arrival_time, message: "must be a valid time"
end
