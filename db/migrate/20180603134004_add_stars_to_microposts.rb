class AddStarsToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :stars, :integer 
  end
end
