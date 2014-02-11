require File.expand_path('../../test_helper', __FILE__)

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  ActiveRecord::Fixtures.create_fixtures(Redmine::Plugin.find(:warehouse)
    .directory + '/test/fixtures/', [:products])

  def setup
    @product = Product.last
    @invalid_product = Product.new
    @same_name = @product.dup
  end

  def test_validation
    assert @product.valid?
    assert !@invalid_product.valid?
    assert !@same_name.save
  end
end
