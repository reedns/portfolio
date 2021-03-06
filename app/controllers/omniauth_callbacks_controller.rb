class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env['omniauth.auth'])

    if user.persisted?
      flash[:notice] = 'Success! Signed in!'
      sign_in_and_redirect user
    else
      session['devise.user_attributes'] = user.user_attributes
      redirect_to new_user_registration_path
    end
  end

  alias_method :twitter, :all
end
