class GreetingsController < ApplicationController
  before_action :set_greeting, only: %i[show update destroy]

  # GET /greetings
  def index
    @greetings = Greeting.all

    render json: @greetings
  end

  # GET /greetings/1
  def show
    render json: @greeting
  end

  # POST /greetings
  def create
    @greeting = Greeting.new(greeting_params)

    if @greeting.save
      render json: @greeting, status: :created, location: @greeting
    else
      render json: @greeting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /greetings/1
  def update
    if @greeting.update(greeting_params)
      render json: @greeting
    else
      render json: @greeting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /greetings/1
  def destroy
    @greeting.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_greeting
    @greeting = Greeting.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def greeting_params
    params.require(:greeting).permit(:message)
  end
end
