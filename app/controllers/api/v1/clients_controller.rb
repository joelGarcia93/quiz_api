class Api::V1::ClientsController < ApplicationController
  before_action :set_client, only: [:show]

  def create
    client = Client.new

    if client.save
      render json: Api::V1::ClientBlueprint.render(client), status: :created
    else
      render json: { errors: client.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: Api::V1::ClientBlueprint.render(@client, view: :detail), status: :ok
  end

  private
  def set_client
    @client = Client.find(params[:id])
  end
end