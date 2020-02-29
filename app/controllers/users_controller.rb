# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user, only: %i[index curshow update destroy]
  before_action :set_user, only: %i[show update destroy]
  
  def index
    @user = current_user
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {message: "Usuário Criado com Sucesso"}, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: {message: "Usuário Criado com Sucesso"}
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @user
  end

  def destroy
    @user.destroy
    render json: { message: 'User successful deleted' }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :full_name, :phone)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
