class CreateStudyProgramCourses < ActiveRecord::Migration[5.0]

  def change
    create_table :study_program_courses do |t|
      t.integer    :semester_number,                   null: false
      t.references :study_program,   foreign_key: true
      t.references :course,          foreign_key: true

      t.timestamps
    end
  end

end
