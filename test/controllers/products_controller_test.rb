require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end
  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "lake", price:20 }
      assert_response 200
    end
  end
  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "image_url", "description", "created_at", "updated_at","is_discounted?", "tax", "total"], data.keys
  end
  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Updated name", price:20 }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

end
