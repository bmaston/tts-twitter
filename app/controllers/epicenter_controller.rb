class EpicenterController < ApplicationController
  before_filter :authenticate_user!

  def feed
    @following_tweets = Tweet.where(:user_id => current_user.following)
  end

  def show_user
    @user = User.find(params[:id])
  end

  def now_following
    @user = User.find(params[:follow_id])
    current_user.following << params[:follow_id].to_i
    current_user.save
  end

  def unfollow
    @user = User.find(params[:unfollow_id])
    current_user.following.delete(params[:unfollow_id].to_i)
    current_user.save
  end
end
