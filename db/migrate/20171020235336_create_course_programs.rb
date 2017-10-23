class CreateCoursePrograms < ActiveRecord::Migration[5.0]

  def change
    create_table :course_programs do |t|
      t.references :study_program, foreign_key: true
      t.references :course,        foreign_key: true

      t.timestamps
    end
  end

end
