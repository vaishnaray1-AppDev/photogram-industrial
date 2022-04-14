class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :image, null: false,
      t.integer :comments_count
      t.integer :likes_count
      t.text :caption
      # t.belongs_to :owner, null: false, foreign_key: true
      t.belongs_to :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
