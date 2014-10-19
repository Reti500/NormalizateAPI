class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  skip_before_filter :require_login, only: [:index, :new, :create]
  # GET /users
  # GET /users.json
  def index
    if params[:token] and params[:email]
      @user = User.where(email: params[:email], remember_me_token: params[:token])
    else
      @user = nil
    end

    if @user and @user.length > 0
      @response = @user
    else
      @response = { 'status' => 'error', 'message' => 'User not exists' }
    end

    render json: @response
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: @user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    # respond_to do |format|
    #   if @user.save
    #     auto_login(@user, should_remember=true)

    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render json: current_user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
    if @user.save
      auto_login(@user, should_remember=true)
      render json: current_user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      # p "user"
      @user = nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
