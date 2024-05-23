FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    age { rand(18..20) }
    address { "Indore" }
    phone_number { +917649040881 } #verify twillo number
  end
end
