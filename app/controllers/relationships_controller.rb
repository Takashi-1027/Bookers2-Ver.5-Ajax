class RelationshipsController < ApplicationController

  def create
    relationships = Relationship.new(follower_user: current_user)
    relationships.followed = User.find(params[:id])
    relationships.save
    redirect_to request.referer
  end

  def destroy
    relationships = Relationship.find_by(followed_user: params[:id], follower_user: current_user)
    relationships.destroy
    redirect_to request.referer
  end

end
