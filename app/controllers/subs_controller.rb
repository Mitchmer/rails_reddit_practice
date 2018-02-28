class SubsController < ApplicationController
  # CRUD
  # Create => POST
  # Read => GET
  # Update => PUT
  # Delete => DELETE

  # index => @subs = Sub.all #gets all the resources
  # new   => @sub = Sub.new #gets a form for resource
  # edit  => @sub = Sub.find(params[:id]) # ^^ filled out
  # show  => @sub = Sub.find(params[:id]) #gets single resource
  # update => Sub.find(params[:id]).update #updates resource
  # create => Sub.new(...).save #adds resource
  # destroy => Sub.find(params[:id]) #deletes resource

  before_action :set_sub, only: [:show, :update, :edit, :destroy]

  def index
    @subs = Sub.all
  end

  def show
  end

  def new
    @sub = Sub.new
  end

  def edit
  end

  def create
    @sub = Sub.new(sub_params)

    if @sub.save
      redirect_to sub_path(@sub)
    else
      render :new
    end
  end

  def update
    if @sub.update(sub_params)
      redirect_to sub_path(@sub)
    else
      render :edit
    end
  end

  def destroy
    @sub.destroy
    redirect_to subs_path
  end

  private

    def sub_params
      params.require(:sub).permit(:name)
    end

    def set_sub
      @sub = Sub.find(params[:id])
    end
end
