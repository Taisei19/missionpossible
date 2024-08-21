class AddUserIdToLevels < ActiveRecord::Migration[7.0]
  def change
    # remove_reference(:levels, :user, foreign_key: true) # すでに存在している場合は削除
    # add_reference :levels, :user, null: false, foreign_key: true # これをコメントアウトまたは削除
  end
end