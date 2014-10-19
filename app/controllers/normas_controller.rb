class NormasController < ApplicationController
  def index
    @user = getUserByToken(params[:email], params[:token])

    render json: @user
  end

  def show
  end

  def new
    @norma = Norma.new
  end

  def create
    @user = getUserByToken(params[:email], params[:token])
    @responce = nil

    if @user and @user.length > 0
      @norma = Norma.new(norma_params)
      if @user.normas.find_by(category: @norma['clave'])
        @responce = { 'error' => 'Duplicate' }
      else
        @user.normas << @norma
        @responce = { 'success' => 'Bien' }
      end
    elsif @user
      @user.normas << @norma
      @responce = { 'success' => 'Bien' }
    else
      @responce = { 'error' => 'User not found' }
    end

    render json: @responce
  end

  def edit
  end

  def update
  end

  def destroy
    @norma = Norma.find_by(clave: params[:clave])
    @user = getUserByToken(params[:email], params[:token])

    if @norma and @user
      @user.normas.delete(@norma)
    end

    render json: { 'success' => 'Bien' }
  end

  private
  def norma_params
    params.require( :norma ).permit( :category, :clave, :title )
  end
end
