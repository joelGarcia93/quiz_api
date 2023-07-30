module Error
  # this module is a general error module where we can handle exception in the application
  # with this approach we avoid rescue blocks everywhere.
  # we can keep rescue logic in only one place: this module.
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from ActiveRecord::RecordNotFound do |_e|
          respond(404, 'Record Not Found.')
        end
      end
    end

    private

    def respond(status, message)
      errors = message.is_a?(Array) ? message : [message]

      render json: { errors: errors }, status: status
    end
  end
end
