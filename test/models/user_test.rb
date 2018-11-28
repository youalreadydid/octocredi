require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @owner_response = {
      login: 'fastlane',
      id: 11098337,
      node_id: 'MDEyOk9yZ2FuaXphdGlvbjExMDk4MzM3',
      avatar_url: 'https://avatars2.githubusercontent.com/u/11098337?v=4',
      gravatar_id: '',
      url: 'https://api.github.com/users/fastlane',
      html_url: 'https://github.com/fastlane',
      followers_url: 'https://api.github.com/users/fastlane/followers',
      following_url: 'https://api.github.com/users/fastlane/following{/other_user}',
      gists_url: 'https://api.github.com/users/fastlane/gists{/gist_id}',
      starred_url: 'https://api.github.com/users/fastlane/starred{/owner}{/repo}',
      subscriptions_url: 'https://api.github.com/users/fastlane/subscriptions',
      organizations_url: 'https://api.github.com/users/fastlane/orgs',
      repos_url: 'https://api.github.com/users/fastlane/repos',
      events_url: 'https://api.github.com/users/fastlane/events{/privacy}',
      received_events_url: 'https://api.github.com/users/fastlane/received_events',
      type: 'Organization',
      site_admin: false
    }
  end

  test 'create user from github api response' do
    user_count = User.count

    user = User.from_github(@owner_response)

    assert_equal User, user.class
    assert_equal user_count + 1, User.count
  end

  test 'don\'t create user from github api response if login is missing' do
    user_count = User.count
    response = @owner_response
    response[:login] = nil

    user = User.from_github(@owner_response)

    assert_nil user
    assert_equal user_count, User.count
  end
end
