require_relative "../test_helper"

class EditTest < FeatureTest

  def test_it_can_edit_a_robot_info
    # as a user
    # When I go to the '/robots' page
    visit '/robots'
    # I click on the edit icon bellow the first robot name
    save_and_open_page
    assert page.find('.robot-showcase-row:nth-of-type(1)').has_content?('R2D2')
    # I should see "Welcome to Robot World" as the title of the page within a div
    # assert page.find('div h1').has_content?("Welcome to Robot World")
    # and I should see an undordered list with links to other pages
    # assert page.find('body:nth-child(2)').has_css?("ul")
  end

end
