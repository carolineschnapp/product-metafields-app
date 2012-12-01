require 'test_helper'

class MetafieldTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Metafield.new.valid?
  end
end
