require 'test_helper'

class RepoTest < ActiveSupport::TestCase
  setup do
    @repo_response = github_response
  end

  test 'create repo from github api response' do
    repo_count = Repo.count

    repo = Repo.from_github(@repo_response)

    assert_equal Repo, repo.class
    assert_equal User, repo.owner.class
    assert_equal License, repo.license.class
    assert_equal repo_count + 1, Repo.count
  end

  test 'don\'t create repo from github api response if github_id is missing' do
    repo_count = Repo.count
    response = @repo_response
    response[:id] = nil

    repo = Repo.from_github(response)

    assert_nil repo
    assert_equal repo_count, Repo.count
  end

  def github_response
    {
      id: 206084,
      node_id: 'MDEwOlJlcG9zaXRvcnkyMDYwODQ=',
      name: 'legacy-homebrew',
      full_name: 'Homebrew/legacy-homebrew',
      private: false,
      owner: {
        login: 'Homebrew',
        id: 1503512,
        node_id: 'MDEyOk9yZ2FuaXphdGlvbjE1MDM1MTI=',
        avatar_url: 'https://avatars2.githubusercontent.com/u/1503512?v=4',
        gravatar_id: '',
        url: 'https://api.github.com/users/Homebrew',
        html_url: 'https://github.com/Homebrew',
        followers_url: 'https://api.github.com/users/Homebrew/followers',
        following_url: 'https://api.github.com/users/Homebrew/following{/other_user}',
        gists_url: 'https://api.github.com/users/Homebrew/gists{/gist_id}',
        starred_url: 'https://api.github.com/users/Homebrew/starred{/owner}{/repo}',
        subscriptions_url: 'https://api.github.com/users/Homebrew/subscriptions',
        organizations_url: 'https://api.github.com/users/Homebrew/orgs',
        repos_url: 'https://api.github.com/users/Homebrew/repos',
        events_url: 'https://api.github.com/users/Homebrew/events{/privacy}',
        received_events_url: 'https://api.github.com/users/Homebrew/received_events',
        type: 'Organization',
        site_admin: false
      },
      html_url: 'https://github.com/Homebrew/legacy-homebrew',
      description: ':skull: The former home of Homebrew/homebrew (deprecated)',
      fork: false,
      url: 'https://api.github.com/repos/Homebrew/legacy-homebrew',
      forks_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/forks',
      keys_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/keys{/key_id}',
      collaborators_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/collaborators{/collaborator}',
      teams_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/teams',
      hooks_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/hooks',
      issue_events_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/issues/events{/number}',
      events_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/events',
      assignees_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/assignees{/user}',
      branches_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/branches{/branch}',
      tags_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/tags',
      blobs_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/git/blobs{/sha}',
      git_tags_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/git/tags{/sha}',
      git_refs_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/git/refs{/sha}',
      trees_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/git/trees{/sha}',
      statuses_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/statuses/{sha}',
      languages_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/languages',
      stargazers_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/stargazers',
      contributors_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/contributors',
      subscribers_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/subscribers',
      subscription_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/subscription',
      commits_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/commits{/sha}',
      git_commits_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/git/commits{/sha}',
      comments_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/comments{/number}',
      issue_comment_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/issues/comments{/number}',
      contents_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/contents/{+path}',
      compare_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/compare/{base}...{head}',
      merges_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/merges',
      archive_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/{archive_format}{/ref}',
      downloads_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/downloads',
      issues_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/issues{/number}',
      pulls_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/pulls{/number}',
      milestones_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/milestones{/number}',
      notifications_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/notifications{?since,all,participating}',
      labels_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/labels{/name}',
      releases_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/releases{/id}',
      deployments_url: 'https://api.github.com/repos/Homebrew/legacy-homebrew/deployments',
      created_at: DateTime.parse('2009-05-20 19:38:37 UTC'),
      updated_at: DateTime.parse('2018-11-28 20:28:04 UTC'),
      pushed_at: DateTime.parse('2018-08-26 20:05:17 UTC'),
      git_url: 'git://github.com/Homebrew/legacy-homebrew.git',
      ssh_url: 'git@github.com:Homebrew/legacy-homebrew.git',
      clone_url: 'https://github.com/Homebrew/legacy-homebrew.git',
      svn_url: 'https://github.com/Homebrew/legacy-homebrew',
      homepage: '',
      size: 1432774,
      stargazers_count: 28267,
      watchers_count: 28267,
      language: 'Ruby',
      has_issues: true,
      has_projects: false,
      has_downloads: false,
      has_wiki: false,
      has_pages: false,
      forks_count: 12785,
      mirror_url: nil,
      archived: true,
      open_issues_count: 0,
      license: {
        key: 'other',
        name: 'Other',
        spdx_id: 'NOASSERTION',
        url: nil,
        node_id: 'MDc6TGljZW5zZTA='
      },
      forks: 12785,
      open_issues: 0,
      watchers: 28267,
      default_branch: 'master',
      score: 1.0
    }
  end
end
