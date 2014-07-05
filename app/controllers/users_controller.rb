class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user].permit(:group, :name, :city, :school))
    @user.save
    redirect_to admins_path
  end

  def update
    @user = User.find(params[:id])

    if @user.update(params[:user].permit(:group, :name, :city, :school))
    @user.save
      redirect_to admins_path
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to admins_path
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
