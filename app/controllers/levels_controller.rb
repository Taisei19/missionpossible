class LevelsController < ApplicationController
  before_action :authenticate_user!

  def update
    @level = current_user.levels.find(params[:id])
    @level.increment!(:number)
    redirect_to mission_path(@level.mission)
  end

  def decrement
    @level = current_user.levels.find(params[:id])
    if @level.number > 1
      @level.decrement!(:number)
    end
    redirect_to mission_path(@level.mission)
  end
  
end
