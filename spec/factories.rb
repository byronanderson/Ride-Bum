FactoryGirl.define do
  factory :event do
    name "MyString"
    destination "MyString"
    arrival_time { 2.days.from_now }
  end
  factory :invitation do
    user
    event
  end
  factory :user do
    sequence :phone, 1000000000 do |n|
      n.to_s
    end
    email { "#{username}@example.com" }
    sequence :username, 1000 do
      "username_#{n}"
    end
    factory :invitee
    factory :event_planner do
      password { "abc123" }
      password_confirmation { "abc123" }
    end
  end
end
