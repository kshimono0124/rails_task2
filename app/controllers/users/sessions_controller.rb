class Users::SessionsController < Devise::RegistrationsController
  #ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    root_path
  end 
  
end