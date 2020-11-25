class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.integer :rating
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
