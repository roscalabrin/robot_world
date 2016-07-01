require_relative '../test_helper'

class RobotWorldAppTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    assert_equal 0, robot_world.all.count

    robot_world.create(name: "R2D2", city: "Naboo", state: "NB", birthadate: "09/08/1999", date_hired: "05/28/2003", department: "cleaning", avatar: "https://robohash.org/r2d2")
    robot = robot_world.find(current_robot_id)

    assert_equal "R2D2", robot.name
    assert_equal "Naboo", robot.city
    assert_equal 1, robot_world.all.count
    assert_equal current_robot_id, robot.id
    assert_instance_of Robot, robot
  end

    def test_it_finds_all_robots
      robot_world.create(name: "R2D2", city: "Naboo", state: "NB", birthadate: "09/08/1999", date_hired: "05/28/2003", department: "engineering", avatar: "https://robohash.org/r2d2")
      robot_world.create(name: "C3PO", city: "Tatooine", state: "TA", birthadate: "09/08/1985", date_hired: "05/28/1992", department: "cleaning", avatar: "https://robohash.org/c3po")

      assert_equal 2, robot_world.all.size
      assert_instance_of Robot, robot_world.all.first
    end

    def test_it_finds_a_single_robot
      robot_world.create(name: "R2D2", city: "Naboo", state: "NB", birthadate: "09/08/1999", date_hired: "05/28/2003", department: "engineering", avatar: "https://robohash.org/r2d2")
      robot_world.create(name: "C3PO", city: "Tatooine", state: "TA", birthadate: "09/08/1985", date_hired: "05/28/1992", department: "cleaning", avatar: "https://robohash.org/c3po")

      assert_equal "R2D2", robot_world.find(current_robot_id).name
      assert_equal "Naboo", robot_world.find(current_robot_id).city
    end

    def test_that_it_updates_a_robot_info
      robot_world.create(name: "C3PO", city: "Tatooine", state: "TA", birthadate: "09/08/1985", date_hired: "05/28/1992", department: "cleaning", avatar: "https://robohash.org/c3po")

      robot_world.update(current_robot_id, {name: "C3POO", city: "Tatooine", state: "TT", birthadate: "09/08/985", date_hired: "05/28/1992", department: "cleaning", avatar: "https://robohash.org/c3po"})

      robot = robot_world.find(current_robot_id)

      assert_equal "C3POO", robot.name
      assert_equal "TT", robot.state
    end

    def test_it_deletes_a_robot
      robot_world.create(name: "C3PO", city: "Tatooine", state: "TA", birthadate: "09/08/1985", date_hired: "05/28/1992", department: "cleaning", avatar: "https://robohash.org/c3po")

      assert_equal 1, robot_world.all.size

      robot_world.destroy(current_robot_id)

      assert_equal 0, robot_world.all.size
    end

end
