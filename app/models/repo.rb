class Repo < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :license, optional: true

  validates :github_id, presence: true, uniqueness: true

  def self.github_attributes
    [:name, :full_name, :html_url, :description, :fork, :url, :homepage, :size, :stargazers_count, :watchers_count, :forks_count, :open_issues_count, :language, :has_issues, :has_projects, :has_downloads, :has_wiki, :has_pages, :archived, :default_branch]
  end

  def self.modified_github_attributes
    {
      id: :github_id,
      created_at: :repo_created_at,
      updated_at: :repo_updated_at,
      pushed_at: :repo_pushed_at
    }
  end

  def self.build_attributes(attributes)
    result = super

    # relationships
    result[:owner] = User.from_github(attributes[:owner])
    result[:license] = License.from_github(attributes[:license])

    result
  end
end
