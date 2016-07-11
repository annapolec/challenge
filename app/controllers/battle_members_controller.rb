class BattleMembersController < ApplicationController  
  def create
    @battle_member = BattleMember.new(battle_member_params)
    authorize @battle_member

    if @battle_member.save
      respond_to do |format|
        format.html { redirect_to @battle_member.battle }
        format.json { render json: @battle_member }
      end
    end 
  end

  def destroy
    @battle_member = BattleMember.find(params[:id])
    authorize @battle_member
    
    if @battle_member.destroy
      respond_to do |format|
        format.html
        format.json { render json: { status: 200 }.to_json }
      end
    end
  end

  private

  def battle_member_params
    params.require(:battle_member).permit(:battle_id, :member_type, :member_id)
  end
end
