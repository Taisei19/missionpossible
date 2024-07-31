class MissionsController < ApplicationController
  def index
    @missions = Mission.all
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = current_user.missions.new(mission_params)
    if @mission.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy
    redirect_to root_path
  end

  def show
    @mission = Mission.find(params[:id]) 
    @level = @mission.levels.find_by(user: current_user) || @mission.levels.create(user: current_user, number: 1)
    @comment = Comment.new
  end
  
  private

  def mission_params
    params.require(:mission).permit(:goal, :mission1, :mission2, :mission3)
  end

end
