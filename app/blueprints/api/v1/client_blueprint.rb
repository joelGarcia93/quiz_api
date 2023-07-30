module Api
  module V1
    class ClientBlueprint < Blueprinter::Base
      identifier :id

      view :detail do
        field :current_question do |object|
          object.answers.count
        end
      end
    end
  end
end
