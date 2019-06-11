class AddDescriptionToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :description, :string
  end
end
