class CreateCampus < ActiveRecord::Migration[5.0]

  def change
    create_table :campus do |t|
      t.string :name,        limit: 64, null: false
      t.string :code,        limit: 16, null: false
      t.string :description, limit: 512
      t.string :state,       limit: 64, null: false
      t.boolean :status,                null: false

      t.timestamps
    end

    add_index :campus, :name, unique: true
    add_index :campus, :code, unique: true
  end

end
