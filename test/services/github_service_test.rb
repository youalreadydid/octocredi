require 'test_helper'

class GithubServiceTest < ActiveSupport::TestCase
  setup do
    @language = 'ruby'
  end

  test 'get repos from github' do
    service = GithubService.new
    language = 'c'

    # c repos don't exist, so expect to create all
    # TODO: find a way to mock github api response (Marshal dump/load was instable)
    assert_difference 'Repo.count', 5 do
      assert service.top_repos_by_lang(language)
    end
  end

  test "get local repos when github don't connect" do
    # there's 1 ruby repo (rails)
    change_top_repos_response(1) do
      raise Faraday::ConnectionFailed.new('test')
    end
  end

  test 'get local repos when github api quota exceeded' do
    # there's 1 ruby repo (rails)
    change_top_repos_response(1) do
      raise Octokit::TooManyRequests.new
    end
  end

  test 'check available languages' do
    service = GithubService.new
    languages = %w[ruby elixir javascript c python]

    assert_equal languages, service.languages
  end

  def change_top_repos_response(count, &block)
    service = GithubService.new
    exception = block

    # retrieve local repos (only rails for ruby)
    service.stub :get_lang_repositories, exception do
      repos = service.top_repos_by_lang(@language)
      assert_equal count, repos.size
    end
  end
end
