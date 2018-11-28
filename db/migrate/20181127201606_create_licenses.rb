class CreateLicenses < ActiveRecord::Migration[5.2]
  def change
    create_table :licenses do |t|
      t.text :key
      t.text :name
      t.text :spdx_id
      t.text :url

      t.timestamps
    end
  end
end
