require 'time'
# require 'yaml/store'
require 'pry'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.execute("INSERT INTO robots (name, city, state, birthdate, date_hired, department, avatar) VALUES (?, ?, ?, ?, ?, ?, ?);", robot[:name], robot[:city], robot[:state], robot[:birthdate], robot[:date_hired], robot[:department], robot[:avatar])
        # binding.pry
  end

  def populate_database
    2.times do
      params = { :name => Faker::StarWars.droid, :city  => Faker::Address.city, :state => Faker::Address.state_abbr, :birthdate => Faker::Date.backward(94).strftime, :date_hired => Faker::Date.backward(14).strftime, :department => Faker::Commerce.department, :avatar => Faker::Avatar.image }
      create(params)
      puts "Created robot #{params[:name]}"
    end

  end

  # def seeding_database
  #   100.times do
  #     params = { :name => Faker::Name.name, :city => Faker::Address.city, :state => Faker::Address.state_abbr, :birthdate => Faker::Date.backward(94), :hire => Faker::Date.backward(14), :department => Faker::Commerce.department }
  #     create(params)
  #     puts "Created robot #{params[:name]}"
  #   end
  # end


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
    current_year = Time.now
    ages = raw_robots.map do |robot|
      result = Time.new(0) + (current_year - Time.parse(robot["birthdate"]))
      result.year
    end
    ages.reduce(:+)/ages.length
  end

  def hired_by_year
    counts = Hash.new 0
    year_of_hire = raw_robots.map do |robot|
      year = robot["date_hired"].split('/')[2].to_i
      counts[year] += 1
      # counts[Time.parse(robot["date_hired"])] += 1
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
