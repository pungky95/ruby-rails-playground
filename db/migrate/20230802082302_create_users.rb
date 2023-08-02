class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.binary :id, limit: 16, primary_key: true, null: false
      t.string :first_name, limit: 100
      t.string :last_name, limit: 100
      t.string :email, limit: 250
      t.text :password
      t.timestamps
    end
  end
end
