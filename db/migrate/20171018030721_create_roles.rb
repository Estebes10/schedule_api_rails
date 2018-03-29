class CreateRoles < ActiveRecord::Migration[5.0]

  def change
    create_table :roles do |t|
      t.string  :code,        limit: 32,   null: false
      t.string  :name,        limit: 128,  null: false
      t.string  :description, limit: 512,  null: false
      t.boolean :status,                   null: false, default: true

      t.timestamps
    end

    add_index :roles, :code, unique: true
  end

end
