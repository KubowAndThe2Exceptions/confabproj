class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    if logged_in?
      @users = User.all
      # @users = User.search(params[:search])
      # @users = User.paginate(page: params[:page])
    else
      redirect_to new_session_path
    end
  end

  # GET /users/1 or /users/1.json
  def show
    if logged_in?

    else
      redirect_to new_session_path
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if logged_in?

    else
      redirect_to new_session_path
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @user.correct_userbool

    if @user.save
      flash[:notice] = "User created." 
      redirect_to root_path
    else
      flash.now[:alert] = "There was something wrong with your login details."
      render 'new'
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if logged_in?
      respond_to do |format|
        if @user.update(user_params)
          @user.correct_userbool
          format.html { redirect_to @user, notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to new_session_path
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    if logged_in?
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to new_session_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :zip, :address, :usertype)
    end
end
