require 'test_helper'

class OctocrediControllerTest < ActionDispatch::IntegrationTest
  test 'index returns success' do
    get '/'
    assert_response :success
  end

  test 'repos returns available repos' do
    language = 'ruby'
    get repos_url, params: { language: language }

    assert_response :success

    response = JSON.parse(@response.body)
    assert_equal language, response['language']
    assert_equal 5, response['repos'].size
  end
end
