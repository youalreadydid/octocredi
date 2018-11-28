class License < ApplicationRecord
  validates :key, presence: true, uniqueness: true

  def self.default_identifier
    :key
  end

  def self.github_attributes
    [:key, :name, :spdx_id, :url]
  end
end
