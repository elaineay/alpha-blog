require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do
    # test if new category path exists
    get new_category_path
    # getting new form
    assert_template 'categories/new'
    # after the creation of a template, there will be 1 more category existing
    assert_difference 'Category.count', 1 do
      # http post request, directed to categories_path (index page) 
      # and create action, "sports" should be there since it was created
      post_via_redirect categories_path, category: {name: "sports"}
    end
    # send user to categories/index after category created
    assert_template 'categories/index'
    # assertion the name of the category "sports" will display in the body
    assert_match "sports", response.body
  end
  
  test "invalid category submission results in failure" do
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: " "}
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title' #check if errors partial appears from shared
    assert_select 'div.panel-body'
  end
  
  
end