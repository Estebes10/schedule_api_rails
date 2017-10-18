class CreateRoles < ActiveRecord::Migration[5.0]

  def change
    create_table :roles do |t|
      t.string  :code,        limit: 32, null: false
      t.string  :name,        limit: 32, null: false
      t.string  :description, limit: 64, null: false
      t.boolean :status,                 null: false

      t.timestamps
    end

    add_index :roles, :code, unique: true
  end

end
