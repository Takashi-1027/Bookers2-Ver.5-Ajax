class RelationshipsController < ApplicationController

  def create
    relationships = Relationship.new(follower_user: current_user)
    relationships.followed = User.find(params[:user_id])
    relationships.save
    redirect_to request.referer
  end

  def destroy
    relationships = Relationship.find_by(followed_user: params[:user_id], follower_user: current_user)
    if relationships
      relationships.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

end
