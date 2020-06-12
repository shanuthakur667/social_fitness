class GroupsController < ApplicationController

  def create
    @delivery_detail = current_user.groups.create(group_attributes)
    redirect_to dashboard_index_path
  end

  def show
    @group = Group.find_by_id params[:id]
    @posts = Post.includes(:user).where(group: @group)
  end

  def create_post
    @group = Group.find_by_id params[:id]
    post = current_user.posts.new(post_attributes)
    post.group = @group
    post.save
    redirect_to group_path
  end

  def add_member
    binding.pry
    user = User.find_by_id(params[:user_id])
    @group = Group.find_by_id params[:id]
    user.user_groups.create(group: @group)
    redirect_to group_path
  end

  private
  def group_attributes
    params.require(:group).permit(:name)
  end

  def post_attributes
    params.require(:post).permit(:message)
  end
end
