FactoryGirl.define do
  factory :event_planner do
    # ??
  end
  factory :event do
    sequence :name do |n|
      "test_event_#{n}"
    end
  end
end
