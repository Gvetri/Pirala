class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def update
    super
  end

  protected

  #Allow users to update their information without the annoying insert current password
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params[:user].permit(:name, :last_name) #Allows the user to only update this params
  end

end