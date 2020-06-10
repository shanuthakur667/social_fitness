class DashboardController < ApplicationController
  before_action :get_user, only: [:send_friend_request, :accept_friend_request]

  def index
    @strangers = current_user.strangers
    @friends = current_user.friends
    @groups = current_user.groups
    @requested_friends = current_user.requested_friends
  end

  def send_friend_request
    current_user.send_friend_request(user)
    redirect_to dashboard_index_path
  end

  def accept_friend_request
    current_user.accept_friend_request(user)
    redirect_to dashboard_index_path
  end

  private

  def get_user
    user = User.find_by_id(params[:user_id])
  end
end
