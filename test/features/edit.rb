require_relative "../test_helper"

class EditTest < FeatureTest

  def test_it_can_edit_a_robot_info
    robot_world.create({ :name => "R2D2", :city => "Denver", :state => "CO", :birthdate => "05/07/1987", :date_hired =>" 09/10/2004", :department => "sales"})
    robot1 = robot_world.all[0]

    # as a user
    # When I go to the '/robots' page
    visit '/robots'
    # I should see the robot name R2D2
    assert page.find('.robot-showcase-row:nth-last-of-type(1)').has_content?('R2D2')
    # and if I click on the edit icon bellow the robot name
    page.find('.edit-delete button a').click
    # I should get to to the edit page
    assert_equal "/robots/#{robot1.id}/edit", current_path
    # and if I fill in the name field with C3PO
    within('.form-horizontal') do
      page.find('#name-field').set('C3PO')
    # and if I click the submit button
      page.find('.btn-submit').click
    end
    # I should see the updated name on the index page
    assert_equal "/robots", current_path
    assert page.find('.robot-showcase-row:nth-last-of-type(1)').has_content?('C3PO')
    # and I should not see the old name of the robot R2D2 on the index page
    refute page.find('.robot-showcase-row:nth-last-of-type(1)').has_content?('R2D2')
  end

end
