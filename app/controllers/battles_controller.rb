class BattlesController < ApplicationController
  def create
    @battle = Battle.new(battle_params)
    authorize @battle

    if @battle.save
      respond_to do |format|
        format.html { redirect_to @battle }
        format.json { render json: @battle }
      end
    end    
  end

  def index
    @battles = current_user.all_battles
    authorize @battles
    @battle = Battle.new
    authorize @battle, :new?

    respond_to do |format|
      format.html
      format.json { render json: @battles }
    end
  end

  def show
    @battle = Battle.find(params[:id])
    authorize @battle

    @challenge = @battle.challenges.new
    @battle_member = @battle.battle_members.new
  end

  def edit
    @battle = Battle.find(params[:id])
    authorize @battle
  end

  def update
    @battle = Battle.find(params[:id])
    authorize @battle

    if @battle.update_attributes(battle_params)
      respond_to do |format|
        format.html { redirect_to @battle }
        format.json { render json: @battle }
      end
    end
  end

  def destroy
    @battle = Battle.find(params[:id])
    authorize @battle
    
    if @battle.destroy
      respond_to do |format|
        format.html { redirect_to battles_path }
        format.json { render json: { stauts: 200 }.to_json }
      end
    end
  end

  private

  def battle_params
    params.require(:battle).permit(:name, :owner_id, :mode)
  end
end
