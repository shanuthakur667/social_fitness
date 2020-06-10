class GroupsController < ApplicationController

  def create
    @delivery_detail = current_user.groups.create(group_attributes)
    redirect_to dashboard_index_path
  end

  def show

  end

  private
  def group_attributes
    params.require(:group).permit(:name)
  end
end
