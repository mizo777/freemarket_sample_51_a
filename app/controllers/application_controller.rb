class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :set_request_from
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  # どのページからリクエストが来たか保存する
  def set_request_from
    if session[:request_from]
      @request_from = session[:request_from]
    end
    # 現在のURLを保存する
    session[:request_from] = request.original_url
  end

  # 直前の画面に戻る
  def return_back
    if request.referer
      redirect_to :back and return true
    elsif @request_from
      redirect_to @request_from and return true
    end
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end