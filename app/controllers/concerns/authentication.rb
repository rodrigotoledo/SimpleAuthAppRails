module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :require_login
  end

  private

  def require_login
    unless session[:user_id]
      flash[:alert] = "Você precisa estar logado para acessar essa página."
      redirect_to root_path
    end
  end
end
