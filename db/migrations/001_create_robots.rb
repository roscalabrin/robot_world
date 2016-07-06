require 'sqlite3'

environments = ["test", "development"]

environments.each do |env|
  database = SQLite3::Database.new("db/robot_world_#{env}.db")
  database.execute("CREATE TABLE robots (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  name VARCHAR(32),
                  city VARCHAR(32),
                  state VARCHAR(2),
                  birthdate DATE,
                  date_hired DATE,
                  department VARCHAR(32),
                  avatar VARCHAR(64)
                  );")

  puts "creating robots table for #{env}"
end
