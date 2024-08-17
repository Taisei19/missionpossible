class Users::RegistrationsController < Devise::RegistrationsController
  # POST /resource
  def create
    super do |resource|
      # 特定のメールアドレスでteacher役割を付与、それ以外はstudent役割
      if params[:user][:email] == ENV['TEACHER_USERNAME']
        resource.role = "teacher"
      else
        resource.role = "student"
      end
      resource.save if resource.valid?  # 役割を保存
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role])
  end
end