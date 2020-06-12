class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :message
      t.references :user
      t.references :group
      t.timestamps
    end
  end
end
