require_relative "../test_helper"

class ShowTest < FeatureTest

  def test_it_shows_all_the_detailed_info_of_a_robot
    robot_world.create({ :name => "R2D2", :city => "Denver", :state => "CO", :birthdate => "05/07/1987", :date_hired =>" 09/10/2004", :department => "sales"})
    robot1 = robot_world.all.first

    # as a user
    # When I visit the robot page
    visit "/robots/#{robot1.id}"
    # I should see the robot avatar image
    assert page.find('.container .row:nth-child(1)').has_css?('img')
    # and I should see the robot name
    assert page.find('.robot-info').has_content?("#{robot1.name}")
    # and I should see the robot city
    assert page.find('.robot-info').has_content?("#{robot1.city}")
    # and I should see the robot state
    assert page.find('.robot-info').has_content?("#{robot1.state}")
    # and I should see the robot birthdate
    assert page.find('.robot-info').has_content?("#{robot1.birthdate}")
    # and I should see the date of hire of the robot
    assert page.find('.robot-info').has_content?("#{robot1.date_hired}")
    # and I should see the robot department
    assert page.find('.robot-info').has_content?("#{robot1.department}")
  end

end
