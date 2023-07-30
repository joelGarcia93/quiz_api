FactoryBot.define do
  factory :client_answer do
    client { association :client }
    answer { association :answer }
  end
end
