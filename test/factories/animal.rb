FactoryGirl.define do

  factory :animal do
    name "Test Animal"
    association :zoo, factory: :zoo
    association :species, factory: :species
  end

end
