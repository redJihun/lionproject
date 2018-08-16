class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # 회원가입시 파라미터 받을때, name, age, gender 허용
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:age,:gender])
    # 회원정보 수정시, 받을 수 있는 파라미터를 age 와 gender 에 대해서도 허용
    # 기존에 나이, 성별 입력 안한 사용자를 위해서
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:age,:gender])
  end
end
