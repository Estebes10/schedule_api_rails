class CreateStudyPrograms < ActiveRecord::Migration[5.0]

  def change
    create_table :study_programs do |t|
      t.string  :name,         limit: 32, null: false
      t.string  :description,  limit: 64
      t.integer :total_courses,           null: false
      t.boolean :status,                  null: false

      t.timestamps
    end

    add_index :study_programs, :name, unique: true
  end

end
