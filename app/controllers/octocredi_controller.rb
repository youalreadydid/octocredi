# frozen_string_literal: true

class OctocrediController < ApplicationController
  layout 'octocredi'

  def index
    service = GithubService.new
    @props = { languages: service.languages }
  end

  def repos
    service = GithubService.new
    language = params[:language] || service.languages.first
    repos = service.top_repos_by_lang(language)

    render json: { language: language, repos: repos.as_json(include: [:owner, :license]) }
  end
end
