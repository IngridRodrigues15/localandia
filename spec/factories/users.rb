FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@generic.com"
    end
    password  { "F4k3p455w0rd" }
  end
  factory :admin, class: User do
    sequence :email do |n|
      "admin#{n}@generic.com"
    end
    password  { "F4k3p455w0rd" }
  end
end
