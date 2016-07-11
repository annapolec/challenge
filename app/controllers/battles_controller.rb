class BattlesController < ApplicationController
  def create
    @battle = Battle.new(battle_params)

    if @battle.save
      respond_to do |format|
        format.html { redirect_to @battle }
        format.json { render json: @battle }
      end
    end    
  end

  def index
    @battles = Battle.all
    @battle = Battle.new

    respond_to do |format|
      format.html
      format.json { render json: @battles }
    end
  end

  def show
    @battle = Battle.find(params[:id])
    @battle_member = @battle.battle_members.new
  end

  def edit
    @battle = Battle.find(params[:id])
  end

  def update
    @battle = Battle.find(params[:id])

    if @battle.update_attributes(battle_params)
      respond_to do |format|
        format.html { redirect_to @battle }
        format.json { render json: @battle }
      end
    end
  end

  def destroy
    @battle = Battle.find(params[:id])
    
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
