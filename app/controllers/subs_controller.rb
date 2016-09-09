class SubsController < ApplicationController

  before_action :is_mod, only: [:edit, :update]

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.mod_id = current_user.id

    if @sub.save
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_message
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show

  end

  def index
    @subs = Sub.all
    render :index
  end

  def destroy
    subs = Sub.find(params[:id])
    subs.destroy
    redirect_to subs_url
  end

  private

  def sub_params
    params.require(:sub).permit(:description, :title)
  end

  def is_mod
    unless current_user.id == Sub.find(params[:id]).mod_id
      redirect_to sub_url(params[:id])
    end
  end
end
