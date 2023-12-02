class AddUserIdToPicks < ActiveRecord::Migration[6.1]
  def change
    add_column :picks, :user_id, :integer
  end
end
