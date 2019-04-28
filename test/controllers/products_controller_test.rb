require 'test_helper'
require 'faker'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @update = {
      title: Faker::Commerce.unique.product_name,
      description: Faker::Lorem.unique.paragraph(3, true, 6),
      image_url: 'lorem.jpeg',
      price: Faker::Commerce.unique.price
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
    assert_select "tr", class: { in: ["list_line_odd", "list_line_even"] } do
      assert_select "td" do
        assert_select "img", class: "list_image"
      end
      assert_select "td", class: "list_description" do
        assert_select "dl" do
          assert_select "dt"
          assert_select "dd"
        end
      end
      assert_select "td", class: ".list_actions" do
        assert_select "a", href: /products\/[0-9]+/, text: "Show"
        assert_select "a", href: /products\/[0-9]+\/edit/, text: "Edit"
        assert_select "a", href: /products\/[0-9]+/, text: "Destroy", method: "delete", confirm: "Are you sure?"
      end
    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @update
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
