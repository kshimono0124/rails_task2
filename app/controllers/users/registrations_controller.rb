class Users::RegistrationsController < Devise::RegistrationsController
  #アカウント登録後のリダイレクト先
  def after_sign_up_path_for(resource)
    users_profile_path
  end
  
end