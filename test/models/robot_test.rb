require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_assign_attributes_correctly
    robot = Robot.new({ "id" => "12", "name" => "R2D2", "city" => "Denver", "state" => "CO", "avatar" => 'test', "birthdate" => "05/07/1987", "date_hired" =>" 09/10/2004", "department" => "sales"})
# binding.pry
    assert_equal "12", robot.id
    assert_equal "R2D2", robot.name
    
  end
end
