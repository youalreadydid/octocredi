class User < ApplicationRecord
  validates :login, presence: true, uniqueness: true

  def self.default_identifier
    :login
  end

  def self.github_attributes
    [:login, :avatar_url, :gravatar_id, :url, :html_url, :site_admin]
  end

  def self.modified_github_attributes
    # github response -> rails model
    {
      id: :github_id,
      type: :user_type
    }
  end
end
