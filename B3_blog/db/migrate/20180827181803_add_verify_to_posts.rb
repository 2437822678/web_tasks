class AddVerifyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :verify, :string
  end
end
