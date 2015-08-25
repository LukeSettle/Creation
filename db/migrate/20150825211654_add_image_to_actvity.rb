class AddImageToActvity < ActiveRecord::Migration
  def change
    add_column :activities, :image, :string
  end
end
