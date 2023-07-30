FactoryBot.define do
  factory :answer do
    name { 'Some answer' }
    question { association :question }
  end
end
