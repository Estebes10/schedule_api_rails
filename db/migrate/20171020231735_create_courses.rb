class CreateCourses < ActiveRecord::Migration[5.0]

  def change
    create_table :courses do |t|
      t.string  :name,        limit: 64, null: false
      t.string  :code,        limit: 16, null: false
      t.string  :description, limit: 128
      t.integer :units,                  null: false
      t.integer :class_hours,            null: false
      t.integer :lab_hours,              null: false
      t.boolean :status,                 null: false

      t.timestamps
    end

    add_index :courses, :name, unique: true
  end

end
