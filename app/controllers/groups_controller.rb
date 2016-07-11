class GroupsController < ApplicationController
  def create
    @group = Group.new(group_params)
    
    if @group.save
      respond_to do |format|
        format.html { redirect_to @group }
        format.json { render json: @group }
      end
    end
  end

  def index
    @groups = Group.all
    @group = Group.new

    respond_to do |format|
      format.html
      format.json { render json: @groups }
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update_attributes(group_params)
      respond_to do |format|
        format.html { redirect_to @group }
        format.json { render json: @group }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])

    if @group.destroy
      respond_to do |format|
        format.html { redirect_to groups_path }
        format.json { render json: { status: 200 }.to_json }
      end
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end

