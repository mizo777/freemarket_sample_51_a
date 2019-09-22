# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user
      # 登録済みならログイン
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "#{provider}") if is_navigational_format?
    else
      # 新規登録用にセッションに必要情報を格納
      if (data = request.env['omniauth.auth'])
        session['devise.omniauth_data'] = {
            email: data.info.email,
            name: data.info.name,
            uid: data.uid,
            provider: data.provider
        }
      end
      redirect_to new_user_registration_path
    end  
  end

  def failure
    redirect_to root_path
  end
end
