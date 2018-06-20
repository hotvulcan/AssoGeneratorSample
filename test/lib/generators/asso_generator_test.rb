require 'test_helper'
require 'generators/asso/asso_generator'

class AssoGeneratorTest < Rails::Generators::TestCase
  tests AssoGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
