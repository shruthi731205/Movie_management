class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :Name
      t.string :Language
      t.string :Movie_Scree
      t.integer :Price
      t.string :Description

      t.timestamps
    end
  end
end
