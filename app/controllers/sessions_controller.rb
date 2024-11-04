# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
    @user = User.first
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path, notice: "Logado com sucesso!"
    else
      redirect_to root_path, alert: "Credenciais inválidas"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Deslogado com sucesso!"
  end
end
