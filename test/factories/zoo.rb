FactoryGirl.define do

  factory :zoo do
    sequence(:name){|n| "Zoo Name #{n}" }
  end

end
