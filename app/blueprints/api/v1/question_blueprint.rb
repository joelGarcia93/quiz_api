module Api
  module V1
    class QuestionBlueprint < Blueprinter::Base
      identifier :id

      fields :name, :order

      association :answers, blueprint: Api::V1::AnswerBlueprint
    end
  end
end
