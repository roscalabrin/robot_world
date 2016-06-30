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

    # def test_it_finds_all_tasks
    #   task_manager.create(title: "Rest", description: "take a nap")
    #   task_manager.create(title: "Cook", description: "food")
    #   task_manager.create(title: "Lunch", description: "eat lunch")
    #
    #   assert_equal 3, task_manager.all.count
    #   assert_instance_of Task, task_manager.all.first
    # end
    #
    # def test_it_finds_a_single_test
    #  task_manager.create(title: "Rest", description: "take a nap")
    #  task_manager.create(title: "Cook", description: "food")
    #  task_manager.create(title: "Lunch", description: "eat lunch")
    #
    #  assert_equal "Rest", task_manager.find(current_task_id).title
    #  assert_instance_of Task, task_manager.find(current_task_id)
    # end
    #
    # def test_that_it_updates_a_task
    #   task_manager.create(title: "Rest", description: "take a nap")
    #   task_manager.update(current_task_id, {title: "Rest", description: "food"})
    #
    #   task = task_manager.find(current_task_id)
    #   assert_equal "food", task.description
    # end
    #
    # def test_it_deletes_a_task
    #   task_manager.create(title: "Rest", description: "take a nap")
    #   # task_manager.create(title: "Cook", description: "food")
    #   # task_manager.create(title: "Lunch", description: "eat lunch")
    #
    #   assert_equal 1, task_manager.all.size
    #
    #   task_manager.destroy(current_task_id)
    #
    #   assert_equal 0, task_manager.all.size
    # end
    #
    #

end
