class ProfilesController < ApplicationController

  def index
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :profile, :policy_id, :skill_id, :xp)
  end

end