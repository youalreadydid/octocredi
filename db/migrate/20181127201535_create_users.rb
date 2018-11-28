class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :login
      t.integer :github_id
      t.text :avatar_url
      t.text :gravatar_id
      t.text :url
      t.text :html_url
      t.text :user_type
      t.boolean :site_admin

      t.timestamps
    end
  end
end
