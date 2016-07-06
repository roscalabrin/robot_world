require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_assign_attributes_correctly
    robot = Robot.new({ "name" => "R2D2", "city" => "Denver", "state" => "CO", "birthdate" => "05/07/1987", "date_hired" =>" 09/10/2004", "department" => "sales", "avatar" => 'test'})

    assert_equal "R2D2", robot.name
    assert_equal " 09/10/2004", robot.date_hired
  end
end
