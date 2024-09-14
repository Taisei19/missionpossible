class MissionsController < ApplicationController

  protect_from_forgery with: :null_session
  
  protect_from_forgery with: :null_session

  def generate_image
    goal = params[:goal]

    # 画像生成サービスを呼び出して、画像URLを取得
    generated_image_url = ImageGenerationService.generate_image(goal)

    if generated_image_url
      render json: { image_url: generated_image_url }
    else
      render json: { error: "画像生成に失敗しました" }, status: :unprocessable_entity
    end
  end

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
  
    # 自分自身のmissionのlevelを取得する場合
    if current_user == @mission.user
      @level = @mission.levels.find_by(user: current_user) || @mission.levels.create(user: current_user, number: 1)
    else
      # 他のユーザーのmissionを見る場合、そのmissionのuserのlevelを取得
      @level = @mission.levels.find_by(user: @mission.user)
    end
  
    @comment = Comment.new
  end

  private

  def mission_params
    params.require(:mission).permit(:goal, :mission1, :mission2, :mission3)
  end

end
