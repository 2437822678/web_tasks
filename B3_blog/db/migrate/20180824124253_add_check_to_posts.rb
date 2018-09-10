class AddCheckToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :check, :string
  end
end
