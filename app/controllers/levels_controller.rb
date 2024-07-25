class LevelsController < ApplicationController
  before_action :authenticate_user!

  def update
    @level = current_user.levels.find(params[:id])
    @level.increment!(:number)
    redirect_to mission_path(@level.mission)
  end

end
