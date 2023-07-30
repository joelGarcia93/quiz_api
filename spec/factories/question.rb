FactoryBot.define do
  factory :question do
    trait :one do
      name { 'Which is the largest country in the world by population?' }
      order { 1 }

      answers_attributes do
        [
          FactoryBot.attributes_for(:answer, question: instance, name: 'India'),
          FactoryBot.attributes_for(:answer, question: instance, name: 'USA'),
          FactoryBot.attributes_for(:answer, question: instance, name: 'China', is_correct: true),
          FactoryBot.attributes_for(:answer, question: instance, name: 'Rusia')
        ]
      end
    end

    trait :two do
      name { 'When did the second world war end?' }
      order { 2 }

      answers_attributes do
        [
          FactoryBot.attributes_for(:answer, question: instance, name: '1945', is_correct: true),
          FactoryBot.attributes_for(:answer, question: instance, name: '1939'),
          FactoryBot.attributes_for(:answer, question: instance, name: '1944'),
          FactoryBot.attributes_for(:answer, question: instance, name: '1942')
        ]
      end
    end

    trait :three do
      name { 'Which was the first country to issue paper currency?' }
      order { 3 }

      answers_attributes do
        [
          FactoryBot.attributes_for(:answer, question: instance, name: 'USA'),
          FactoryBot.attributes_for(:answer, question: instance, name: 'France'),
          FactoryBot.attributes_for(:answer, question: instance, name: 'Italy'),
          FactoryBot.attributes_for(:answer, question: instance, name: 'China', is_correct: true)
        ]
      end
    end

    trait :four do
      name { 'Which city hosted the 1996 Summer Olympics?' }
      order { 4 }

      answers_attributes do
        [
          FactoryBot.attributes_for(:answer, question: instance, name: 'Atlanta', is_correct: true),
          FactoryBot.attributes_for(:answer, question: instance, name: 'Sydney'),
          FactoryBot.attributes_for(:answer, question: instance, name: 'Athens'),
          FactoryBot.attributes_for(:answer, question: instance, name: 'Beijing')
        ]
      end
    end

    trait :five do
      name { 'Who invented the telephone?' }
      order { 5 }

      answers_attributes do
        [
          FactoryBot.attributes_for(:answer, question: instance, name: 'Albert Einstein'),
          FactoryBot.attributes_for(:answer, question: instance, name: 'Alexander Graham Bell', is_correct: true),
          FactoryBot.attributes_for(:answer, question: instance, name: 'Isaac Newton'),
          FactoryBot.attributes_for(:answer, question: instance, name: 'Marie Curie')
        ]
      end
    end
  end
end
