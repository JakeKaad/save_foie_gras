class CreateTeeShirts < ActiveRecord::Migration
  def change
    create_table :tee_shirts do |t|
      t.string :description
      t.string :gender
      t.integer :price
      t.string :image_url
      t.timestamps
    end
  end
end
