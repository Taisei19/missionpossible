class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.string :goal,     null: false
      t.string :mission1, null: false
      t.string :mission2, null: false
      t.string :mission3, null: false
      
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
