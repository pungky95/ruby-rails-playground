class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.belongs_to :user, null: false, foreign_key: true, type: :binary, limit: 16
      t.timestamps
    end
  end
end
