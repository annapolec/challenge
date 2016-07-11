class GroupUsersController < ApplicationController
  def create
    @group_user = GroupUser.new(group_user_params)
    
    if @group_user.save
      respond_to do |format|
        format.html { redirect_to @group_user.group }
        format.json { render json: @users }
      end
    end
  end

  private

  def group_user_params
    params.require(:group_user).permit(:group_id, :user_id)
  end
end
