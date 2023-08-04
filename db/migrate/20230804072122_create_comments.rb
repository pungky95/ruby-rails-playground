class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :binary, limit: 36
      t.belongs_to :post, null: false, foreign_key: true, type: :binary, limit: 36
      t.string :comment
      t.timestamps
    end
  end
end