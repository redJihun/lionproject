class HomeController < ApplicationController
  def index
    #로그인 페이지, 레이아웃 적용 무시
    #render :layout => false
    if user_signed_in?
    else
      redirect_to user_session_path
    end
  end
end
