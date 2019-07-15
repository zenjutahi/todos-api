FactoryBot.define do
  factory :item do
    name { Faker::Food.dish }
    done { false }
    todo_id { nil }
  end
end