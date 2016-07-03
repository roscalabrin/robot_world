require_relative "../test_helper"

class HomeTest < FeatureTest

  def test_homepage_content
    skip
    # as a user
    # When I go to the '/' page
    visit  '/'
    # I should see an image as the background of the page
    # and I should see "Welcome to Robot World" as the title of the page
    # and I should see a link All Robots
    # and I should see a link Add New Robot
    # and I should see a link Dashboard
    # assert page.find('.content p:nth-child(2)').has_content?("this is another p nested within the .content div")
  end

  def test_homepage_links
    # as a user
    # When I go to the '/' page
    visit  '/'
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
    page.find('.homepage-links').click_on 'Dashboard'
    # I should be taken to the dashboard page
    assert_equal '/robots/dashboard', current_path
  end
end
