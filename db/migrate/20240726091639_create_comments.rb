class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      
      t.references :user,    foreign_key: true
      t.references :mission, foreign_key: { on_delete: :cascade } 
      t.timestamps
    end
  end
end
