class CreateRepos < ActiveRecord::Migration[5.2]
  def change
    create_table :repos do |t|
      t.integer :github_id
      t.text :name
      t.text :full_name
      t.references :owner, foreign_key: { to_table: :users }
      t.text :html_url
      t.text :description
      t.boolean :fork
      t.text :url
      t.datetime :repo_created_at
      t.datetime :repo_updated_at
      t.datetime :repo_pushed_at
      t.text :homepage
      t.integer :size
      t.integer :stargazers_count
      t.integer :watchers_count
      t.integer :forks_count
      t.integer :open_issues_count
      t.text :language
      t.boolean :has_issues
      t.boolean :has_projects
      t.boolean :has_downloads
      t.boolean :has_wiki
      t.boolean :has_pages
      t.boolean :archived
      t.text :default_branch
      t.references :license, foreign_key: true

      t.timestamps
    end
  end
end
