module Api
  module V1
    class AnswerBlueprint < Blueprinter::Base
      identifier :id

      fields :name
    end
  end
end
