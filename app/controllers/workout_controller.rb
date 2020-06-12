class WorkoutController < ApplicationController
  def index

  end

  def create_workout_sessions
    current_user.workout_sessions.create(steps_count: params[:steps])
  end

  def workout_profile
    @user = User.find_by(id: params[:user_id])
    @workout_sessions = @user.workout_sessions.group_by {|ws| ws.created_at.to_date }
  end
end
