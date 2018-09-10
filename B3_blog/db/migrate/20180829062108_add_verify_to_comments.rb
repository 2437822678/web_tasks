class AddVerifyToComments < ActiveRecord::Migration
  def change
    add_column :comments, :verify, :string
  end
end
