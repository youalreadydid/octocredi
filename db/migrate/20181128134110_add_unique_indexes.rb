class AddUniqueIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :repos, :github_id, unique: true
    add_index :users, :login, unique: true
    add_index :licenses, :key, unique: true
  end
end
