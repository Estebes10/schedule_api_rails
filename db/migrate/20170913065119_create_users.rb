class CreateUsers < ActiveRecord::Migration[5.0]

  def change
    create_table :users do |t|
      t.string  :name,            limit: 64, null: false
      t.string  :last_name,       limit: 64, null: false
      t.string  :id_collegue,     limit: 16, null: false
      t.string  :password_digest, limit: 32, null: false
      t.string  :email,           limit: 64, null: false
      t.string  :phone,           limit: 32, null: false
      t.string  :gender,          limit: 16, null: false
      t.date    :birthday,                   null: false
      t.boolean :status,                     null: false

      t.timestamps
    end
  end

end
