class CreatePosts < ActiveRecord::Migration
  def change

    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :author
      t.datetime :published_at

      t.timestamps null: false
    end
  end
end
