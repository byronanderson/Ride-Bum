FactoryGirl.define do
  factory :event_planner do
    # ??
  end
  factory :invitation do
    sequence :invitee_name, 1000 do
      "username_#{n}"
    end
    invitee_email { "#{invitee_name}@example.com" }
    sequence :invitee_phone, 1000000000 do |n|
      n
    end
  end
end
