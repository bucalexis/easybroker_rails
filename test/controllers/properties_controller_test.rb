require "test_helper"

class PropertiesControllerControllerTest < ActionDispatch::IntegrationTest
  test "properties are returned" do
    controller = PropertiesController.new;
    properties = controller.get_properties("https://api.stagingeb.com/v1/properties?page=1&limit=20", "l7u502p8v46ba3ppgvj5y2aad50lb9")
    assert_not_empty properties
  end

  test "properties are not returned" do
    controller = PropertiesController.new;
    properties = controller.get_properties("https://api.stagingeb.com/v1/properties?page=1&limit=20", "l7u502p8v46ba3ppgvj5y2aad50lb8")
    assert_nil properties
  end
end
