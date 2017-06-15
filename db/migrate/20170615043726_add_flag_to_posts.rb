class AddFlagToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :flag_at, :datetime
    add_column :users, :role, :string
  end
end
