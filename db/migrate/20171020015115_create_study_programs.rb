class CreateStudyPrograms < ActiveRecord::Migration[5.0]

  def change
    create_table :study_programs do |t|
      t.belongs_to :career,                               index: true
      t.string     :name,         limit: 128, null: false
      t.string     :description,  limit: 512
      t.boolean    :status,                   null: false,            default: true

      t.timestamps
    end

    add_index :study_programs, :name, unique: true
  end

end
