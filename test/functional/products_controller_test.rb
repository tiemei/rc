require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index of one product" do
    get :index, id: products(:one).id   
    assert_response :success
    product = assigns(:product)
    assert_not_nil product
    assert_equal product.comments.size, product.comment_count
  end

  test 'should add love' do
    id_one = products(:one).id
    assert_difference('Product.find(id_one).love', +1) do
      get :love, id: id_one
    end
    assert_not_nil @response.body

  end
end
