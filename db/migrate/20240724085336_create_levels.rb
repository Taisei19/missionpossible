class CreateLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :levels do |t|
      t.integer :number, null: false
      
      t.references :user,    foreign_key: true
      t.references :mission, foreign_key: true

      t.timestamps
    end
  end
end
