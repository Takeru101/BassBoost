class CreatePickups < ActiveRecord::Migration[6.1]
  def change
    create_table :pickups do |t|
      t.string :question

      t.timestamps
    end
  end
end
