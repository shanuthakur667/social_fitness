class CreateWorkoutSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_sessions do |t|
      t.integer :steps_count
      t.references :user
      t.timestamps
    end
  end
end
