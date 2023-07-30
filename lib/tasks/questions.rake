namespace :questions do
  task create: :environment do
    # TODO: we can handle this using for example active admin gem and insert the questions and corresponding answers 
    # from ui provided by the gem, or we can even create our own end points in this API project and consume them from
    # a client project like a react JS app.
    data = [
      { order: 1, name: 'Which is the largest country in the world by population?', 
        answers: [
          { name: 'India' }, 
          { name: 'USA' }, 
          { name: 'China', is_correct: true }, 
          { name: 'Russia' }
        ]
      },
      { order: 2, name: 'When did the second world war end?', 
        answers: [
          { name: '1945', is_correct: true }, 
          { name: '1939' }, 
          { name: '1944' }, 
          { name: '1942' }
        ]
      },
      { order: 3, name: 'Which was the first country to issue paper currency?', 
        answers: [
          { name: 'USA' }, 
          { name: 'France' }, 
          { name: 'Italy' }, 
          { name: 'China', is_correct: true }
        ] 
      },
      { order: 4, name: 'Which city hosted the 1996 Summer Olympics?', 
        answers: [
          { name: 'Atlanta', is_correct: true }, 
          { name: 'Sydney' }, 
          { name: 'Athens' }, 
          { name: 'Beijing' }
        ] 
      },
      { order: 5, name: 'Who invented the telephone?', 
        answers: [
          { name: 'Albert Einstein' }, 
          { name: 'Alexander Graham Bell', is_correct: true }, 
          { name: 'Isaac Newton' }, 
          { name: 'Marie Curie' }
        ]
      }
    ]

    data.each do |question|
      params = { name: question[:name], order: question[:order], answers_attributes: question[:answers]  }
      
      Question.create!(params)
    end
  end
end
