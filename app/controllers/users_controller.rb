class UsersController < ApplicationController
  before_action :load_object, only: [:show]

  def index
    @users = User.where("link1 is NOT NULL and link1 != ''").page(params[:page]).per(7)


  end

  def new
  end

  def show

  end

  private

  def load_object
    @user = User.find params[:id]
  end
end
