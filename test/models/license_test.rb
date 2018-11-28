require 'test_helper'

class LicenseTest < ActiveSupport::TestCase
  setup do
    @license_response = {
      key: 'other',
      name: 'Other',
      spdx_id: 'NOASSERTION',
      url: nil,
      node_id: 'MDc6TGljZW5zZTA='
    }
  end

  test 'create license from github api response' do
    license_count = License.count

    license = License.from_github(@license_response)

    assert_equal License, license.class
    assert_equal license_count + 1, License.count
  end

  test 'don\'t create license from github api response if key is missing' do
    license_count = License.count
    response = @license_response
    response[:key] = nil

    license = License.from_github(response)

    assert_nil license
    assert_equal license_count, License.count
  end
end
