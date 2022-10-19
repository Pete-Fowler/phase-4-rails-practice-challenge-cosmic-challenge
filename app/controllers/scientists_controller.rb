class ScientistsController < ApplicationController
  def index 
    scientists = Scientist.all
    render json: scientists
  end

  def show 
    scientist = sci_find
    render json: scientist, serializer: ScientistPlanetsSerializer
  end 

  def update 
    scientist = sci_find
    scientist.update!(scientist_params)
    render json: scientist, status: :accepted
  end

  def create
    scientist = Scientist.create!(scientist_params)
    render json: scientist, status: :created
  end

  def destroy
    scientist = sci_find
    scientist.destroy
    render json: {}, status: :accepted
  end

  private

  def sci_find
    Scientist.find(params[:id])
  end

  def scientist_params
    params.permit(:name, :field_of_study, :avatar)
  end
end
