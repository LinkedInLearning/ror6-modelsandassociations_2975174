class UsersController < ApplicationController

  before_action :confirm_logged_in

  def index
    @users = User.order(:last_name, :first_name)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # Instantiate a new object using form parameters
    @user = User.new(user_params)
    # Save the object
    if @user.save
      # If save succeeds, redirect to the index action
      flash[:notice] = 'User created'
      redirect_to(users_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'User updated'
      redirect_to(user_path(@user))
    else
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'User destroyed'
    redirect_to(users_path)
  end

  private

    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        {:department_ids => []}
      )
    end

end
