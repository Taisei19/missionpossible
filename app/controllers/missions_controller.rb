class MissionsController < ApplicationController
  def index
    @missions = Mission.all
  end

  def new
    @missions = Mission.all
  end

  def create
    @missions = Mission.new  #(prototype_params)
  
    # if @prototype.save
      # redirect_to root_path
    # else
     # render :new, status: :unprocessable_entity
    #end
  end 
end