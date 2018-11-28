class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.default_identifier
    :github_id
  end

  def self.from_github(attrs)
    return nil if attrs.blank?

    attributes = build_attributes(attrs)

    identifier = Hash[default_identifier, attributes[default_identifier]]
    object = find_by(identifier)

    if object.nil?
      object = create(attributes)
      return object.id.nil? ? nil : object
    end

    object.update_attributes(attributes)
    object
  end

  def self.github_attributes
    []
  end

  def self.modified_github_attributes
    []
  end

  def self.build_attributes(attributes)
    return nil if attributes.blank?

    result = github_attributes.map { |attr| [attr, attributes[attr]] }.to_h

    unless modified_github_attributes.blank?
      modified_github_attributes.each { |github, attr| result[attr] = attributes[github] }
    end

    result
  end
end
