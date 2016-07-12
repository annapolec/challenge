class GroupsController < ApplicationController
  def create
    @group = Group.new(group_params)
    authorize @group
    
    if @group.save
      GroupUser.create(group_id: @group.id, user_id: current_user.id)
      respond_to do |format|
        format.html { redirect_to @group }
        format.json { render json: @group }
      end
    end
  end

  def index
    @groups = Group.paginate(page: params[:page], per_page: 10)
    authorize @groups

    @group = Group.new
    authorize @group, :new?

    respond_to do |format|
      format.html
      format.json { render json: @groups }
    end
  end

  def show
    @group = Group.find(params[:id])
    authorize @group

    @group_user = GroupUser.new
  end

  def edit
    @group = Group.find(params[:id])
    authorize @group
  end

  def update
    @group = Group.find(params[:id])
    authorize @group

    if @group.update_attributes(group_params)
      respond_to do |format|
        format.html { redirect_to @group }
        format.json { render json: @group }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    authorize @group

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

