class CreateDepartments < ActiveRecord::Migration[5.0]

  def change
    create_table :departments do |t|
      t.string     :name,        limit: 128, null: false
      t.string     :code,        limit: 32,  null: false
      t.string     :description, limit: 512
      t.boolean    :status,                  null: false
      t.references :campu,                               foreign_key: true

      t.timestamps
    end

    add_index :departments, :code, unique: true
    add_index :departments, :name, unique: true
  end

end
