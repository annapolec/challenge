class ChallengesController < ApplicationController
  def create
    @battle = Battle.find(params[:battle_id])
    @challenge = @battle.challenges.build(challenge_params)
    authorize @challenge

    if @challenge.save
      respond_to do |format|
        format.html { redirect_to @battle }
        format.json { render json: @challenge }
      end
    end
  end

  def show
    @battle = Battle.find(params[:battle_id])

    @challenge = Challenge.find(params[:id])
    authorize @challenge

    @challenge_member = ChallengeMember.new
    authorize @challenge_member, :new?
  end

  def index
    @battle = Battle.find(params[:battle_id])

    @challenges = @battle.challenges
    authorize @challenges

    respond_to do |format|
      format.html
      format.json { render json: @challenges }
    end
  end

  def edit
    @challenge = Challenge.find(params[:id])
    authorize @challenge
  end

  def update
    @battle = Battle.find(params[:battle_id])

    @challenge = Challenge.find(params[:id])
    authorize @challenge

    if @challenge.update_attributes(challenge_params)
      respond_to do |format|
        format.html { redirect_to [@battle, @challenge] }
        format.json { render json: @challenge }
      end
    end
  end

  def destroy
    @battle = Battle.find(params[:battle_id])
      
    @challenge = Challenge.find(params[:id])
    authorize @challenge
    
    if @challenge.destroy
      respond_to do |format|
        format.html {redirect_to @battle }
        format.json { render json: { status: 200 }.to_json }
      end
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:name, :desc, :points, :battle_id, :owner_id)
  end
end

