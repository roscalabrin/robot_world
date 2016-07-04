require_relative "../test_helper"

class HomeTest < FeatureTest

  def test_homepage_content
    # as a user
    # When I go to the '/' page
    visit '/'
    # I should see "Welcome to Robot World" as the title of the page within a div
    assert page.find('div h1').has_content?("Welcome to Robot World")
    # and I should see an undordered list with links to other pages
    assert page.find('body:nth-child(2)').has_css?("ul")
  end

  def test_homepage_links
    # as a user
    # When I go to the '/' page
    visit '/'
    # And I click the link to see 'All Robots' in the unordered list
    page.find('.homepage-links').click_on 'All Robots'
    # I should be taken to the robots index page
    assert_equal '/robots', current_path
    # And if I click on the 'Home' in the breadcrumbs to go back to the homepage
    page.find('.breadcrumb').click_on 'Home'
    # And I click the link to see 'Add New Robot' in the unordered list
    page.find('.homepage-links').click_on 'Add New Robot'
    # I should be taken to the new robot page
    assert_equal '/robots/new', current_path
    # And if I click on the 'Home' in the breadcrumbs to go back to the homepage
    page.find('.breadcrumb').click_on 'Home'
    # And I click the link to see 'Dashboard' in the unordered list

    assert page.find('.homepage-links').has_content?('Dashboard')
    # page.find('.homepage-links').click_on 'Dashboard'
    # I should be taken to the dashboard page
    # assert_equal '/robots/dashboard', current_path
  end
end
