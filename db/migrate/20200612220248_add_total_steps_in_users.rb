class AddTotalStepsInUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :total_steps, :integer, default: 0
    add_column :users, :credited_value, :integer, default: 0
  end
end
