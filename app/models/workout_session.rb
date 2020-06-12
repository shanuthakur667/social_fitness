class WorkoutSession < ApplicationRecord
  belongs_to :user

  after_create :update_user_steps_count

  private
  def update_user_steps_count
    user.total_steps += steps_count
    user.save
  end
end
