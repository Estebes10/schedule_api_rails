class CreateSemesters < ActiveRecord::Migration[5.0]

  def change
    create_table :semesters do |t|
      t.integer    :semester_number, null: false
      t.boolean    :status,          null: false, default: true
      t.references :study_program, foreign_key: true

      t.timestamps
    end

    add_index :semesters, :semester_number, unique: true
  end

end
