class CreateCareers < ActiveRecord::Migration[5.0]

  def change
    create_table :careers do |t|
      t.belongs_to :department,                       index: true
      t.string  :name,        limit: 64,  null: false
      t.string  :code,        limit: 32,  null: false
      t.string  :description, limit: 512
      t.boolean :status,                  null: false, default: true

      t.timestamps
    end

    add_index :careers, :code, unique: true
    add_index :careers, :name, unique: true
  end

end
