require_relative "../test_helper"

class NewTest < FeatureTest

  def test_it_adds_a_new_robot
    # as a user
    # When I go to the '/robots/new' page
    visit '/robots/new'
    # I should see a form to add the new robot info
    assert page.has_css?('form')
    # and when I fill in the name field with R2D2
    fill_in 'Name', with: 'R2D2'
    # and I fill in the city field with Denver
    fill_in 'City', with: 'Denver'
    # and I fill in the city field with CO
    fill_in 'State', with: 'CO'
    # and I fill in the birthdate field with 03/14/1998
    fill_in 'Birthdate', with: '03/14/1998'
    # and I fill in the date hired field with 05/28/2009
    fill_in 'Date Hired', with: '05/28/2009'
    # and I fill in the department field with Sales
    fill_in 'Department', with: 'Sales'
    # and I chick the submit button
    within('.new-robot-form') do
      assert page.has_css?('form .btn')
      find('form .btn').click
    end
    # I should be taken to the robot index page
    assert_equal '/robots', current_path
    # and I should see the new robot that I added at the end of the list
    assert page.find('.robot-showcase-row:nth-last-of-type(1)').has_content?('R2D2')
  end
end
