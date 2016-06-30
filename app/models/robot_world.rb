require 'yaml/store'
require 'time'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total']  ||= 0
      database['total']  += 1
      database['robots'] << { "id" => database['total'], "name" => robot[:name], "city" => robot[:city], "state" => robot[:state], "avatar" => robot[:avatar], "birthdate" => robot[:birthdate], "date_hired" => robot[:date_hired], "department" => robot[:department] }
    end
  end

  def raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end

  def all
    raw_robots.map { |data| Robot.new(data) }
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    database.transaction do
      target_robot = database['robots'].find { |robot| robot["id"] == id}
      target_robot["name"] = robot[:name]
      target_robot["city"] = robot[:city]
      target_robot["state"] = robot[:state]
      target_robot["avatar"] = robot[:avatar]
      target_robot["birthdate"] = robot[:birthdate]
      target_robot["date_hired"] = robot[:date_hired]
      target_robot["department"] = robot[:department]
    end
  end

  def destroy(id)
    database.transaction do
      database['robots'].delete_if { |robot| robot["id"] == id}
    end
  end

  def delete_all
      database.transaction do
        database["robots"] = []
        database["total"] = 0
      end
    end

  def average_age
    current_year = Time.new.year
    ages = raw_robots.map do |robot|
      current_year - Time.parse(robot["birthdate"]).year
    end
    ages.reduce(:+)/ages.length
  end

  def hired_by_year
    counts = Hash.new 0
    year_of_hire = raw_robots.map do |robot|
      counts[Time.parse(robot["date_hired"]).year] += 1
    end
    counts
  end

  def department_count
    counts = Hash.new 0
    year_of_hire = raw_robots.map do |robot|
      counts[robot["department"]] += 1
    end
    counts
  end

  def city_count
    counts = Hash.new 0
    year_of_hire = raw_robots.map do |robot|
      counts[robot["city"]] += 1
    end
    counts
  end

  def state_count
    counts = Hash.new 0
    year_of_hire = raw_robots.map do |robot|
      counts[robot["state"]] += 1
    end
    counts
  end

end
