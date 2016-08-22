class SessionsController < Devise::SessionsController
  acts_as_token_authentication_handler_for User
  skip_filter :verify_signed_out_user, only: [:destroy]
  # POST /resource/sign_in
  # Resets the authentication token each time! Won't allow you to login on two devices
  # at the same time (so does logout).

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)

    current_user.update authentication_token: nil

    respond_to do |format|
      format.json {
        render :json => {
            :user => current_user,
            :status => :ok,
            :authentication_token => current_user.authentication_token
        }
      }
      format.html{
        self.resource = warden.authenticate!(auth_options)
        set_flash_message!(:notice, :signed_in)
        sign_in(resource_name, resource)
        yield resource if block_given?
        respond_with resource, location: after_sign_in_path_for(resource)
      }
    end
  end

  # DELETE /resource/sign_out
  def destroy

    respond_to do |format|
      format.json {
        if current_user
          current_user.update authentication_token: nil
          signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
          render :json => {}.to_json, :status => :ok
        else
          render :json => {}.to_json, :status => :unprocessable_entity
        end


      }
      format.html{
        super
        # signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        # set_flash_message! :notice, :signed_out if signed_out
        # yield if block_given?
      }
    end
  end
end