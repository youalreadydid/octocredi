class GithubService
  attr_reader :client

  def initialize
    @client = Octokit::Client.new
  end

  def languages
    %w[ruby elixir javascript c python]
  end

  def top_repos_by_lang(lang)
    return [] unless languages.include?(lang)

    repos = @client.search_repositories(
      "language:#{lang}",
      sort: 'stars',
      order: 'desc',
      page: 0,
      per_page: 5
    )
    add_repositories(repos.items)
  rescue Octokit::TooManyRequests, Faraday::ConnectionFailed
    Repo.where('LOWER(language) LIKE LOWER(?)', lang).order(stargazers_count: :desc).limit(5)
  end

  private

  def add_repositories(github_repos)
    repo_ids = github_repos.map { |repo| Repo.from_github(repo).try(:id) }.compact
    Repo.where(id: repo_ids).order(stargazers_count: :desc)
  end
end
