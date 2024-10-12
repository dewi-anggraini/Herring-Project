FactoryBot.define do
  factory :post do
    title { "post sample" }
    body { "This is post body testing " }
    user { association :user }   
  end
end
