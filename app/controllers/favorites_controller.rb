class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:tweet_id])
    current_user.tweet(micropost)
    flash[:succes] = 'お気に入りに追加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:tweet_id])
    current_user.untweet(micropost)
    flash[:succes] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
