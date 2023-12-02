class AddImageToPicks < ActiveRecord::Migration[6.1]
  def change
    add_column :picks, :image, :string
  end
end
