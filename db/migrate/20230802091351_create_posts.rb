class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts, id: false do |t|
      t.binary :id, limit: 36, primary_key: true, null: false
      t.string :title
      t.belongs_to :user, null: false, foreign_key: true, type: :binary, limit: 36
      t.text :content
      t.timestamps
    end
  end
end
