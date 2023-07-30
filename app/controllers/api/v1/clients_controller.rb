class Api::V1::ClientsController < ApplicationController
  def create
    client = Client.new

    if client.save
      render json: Api::V1::ClientBlueprint.render(client), status: :created
    else
      render json: { errors: client.errors.full_messages }, status: :unprocessable_entity
    end
  end
end