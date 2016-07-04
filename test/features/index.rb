require_relative "../test_helper"

class IndexTest < FeatureTest

  def test_shows_the_robot_image_and_name
    # as a user
    # When I go to the '/robots' page
    visit '/robots'
  end

  def test_the_robot_name_link_takes_to_the_robot_page
    robot_world.create({ :name => "R2D2", :city => "Denver", :state => "CO", :birthdate => "05/07/1987", :date_hired =>" 09/10/2004", :department => "sales"})
    robot1 = robot_world.all[0]

    # as a user
    # When I go to the '/robots' page
    visit '/robots'
    # and I click on a robot name
    page.find('.robot-showcase-row:nth-of-type(1)').click_on robot1.name
    # I should be taken to the selected robot page
    assert_equal "/robots/#{robot1.id}", current_path
  end

  def test_there_the_edit_icon_redirects_to_the_edit_page
    robot_world.create({ :name => "R2D2", :city => "Denver", :state => "CO", :birthdate => "05/07/1987", :date_hired =>" 09/10/2004", :department => "sales"})
    robot1 = robot_world.all[0]

    # as a user
    # When I go to the '/robots' page
    visit '/robots'
    # I click on the edit icon bellow the first robot name
    # page.find('.robot-showcase-row:nth-of-type(1)').click_on robot1.name
    within('.robot-showcase-row:nth-of-type(1)') do
      assert page.has_content?('R2D2')
      page.find('.edit-delete button a').click
    end
    # and I click on the idit icon bellow the robot name
    assert_equal "/robots/#{robot1.id}/edit", current_path
  end

  def test_it_can_delete_a_robot_from_the_list
    # as a user
    # When I go to the '/robots' page
    visit '/robots'
  end

end
