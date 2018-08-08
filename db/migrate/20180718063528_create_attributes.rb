class CreateAttributes < ActiveRecord::Migration[5.0]

  def change
    create_table :attributes do |t|
      t.string :name,      null: false,               limit: 64
      t.text :description,                            limit: 1024
      t.boolean :status,   null: false, default: true
      t.string :code,      null: false,               limit: 8

      t.timestamps
    end

    add_index :attributes, [:code, :name], unique: true
  end

end
