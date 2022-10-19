class MissionsController < ApplicationController
  def create 
    mission = Mission.create!(mis_params)
    render json: mission.planet, status: :created
  end 

  private 

  def mis_params 
    params.permit(:name, :scientist_id, :planet_id)
  end 
end
