class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.create(user_params)
    user = @user
    if @user.save
      # render :json => {:state => {:code => 0}, :data => @user }
      render json: @user
    else
      render :json => {:state => {:code => 1, :messages => @user.errors.full_messages} }
    end

  end

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

  def user_params
    params.require(:user).permit(:email, :password,:name,:last_name,:status)
  end


end