require 'yaml/store'
require 'time'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.execute("INSERT INTO robots (name, city, state, birthdate, date_hired, department, avatar) VALUES (?, ?, ?, ?, ?, ?, ?);", robot[:name], robot[:city], robot[:state], robot[:birthadate], robot[:date_hired], robot[:department], robot[:avatar])
  end

  def populate_database
    5.times do
      robot_world.create(name: Faker::StarWars.droid, city: Faker::Address.city, state: Faker::Address.state_abbr, birthadate: Faker::Date, date_hired: Faker::Date, department: Faker::Commerce.department, avatar: Faker::Avatar.image)
    end

  end

  def raw_robots
    database.execute ("SELECT * FROM robots;")
  end

  def all # change to use SQL
    raw_robots.map { |data| Robot.new(data) }
  end

  def raw_robot(id) #change to use SQL
    raw_robots.find { |robot| robot["id"] == id }
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    database.execute("UPDATE robots SET name= ?, city= ?, state= ?, birthdate= ?, date_hired= ?, department= ?, avatar=? WHERE id = ?;",
    robot[:name], robot[:city], robot[:state], robot[:birthdate], robot[:date_hired], robot[:department], robot[:avatar], id)
  end

  def destroy(id)
    database.execute("DELETE FROM robots WHERE id = ?;", id)
  end

  def delete_all
    database.execute("DELETE FROM robots")
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
