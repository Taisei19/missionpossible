class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.string :goal
      t.string :mission1
      t.string :mission2
      t.string :mission3
      
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
