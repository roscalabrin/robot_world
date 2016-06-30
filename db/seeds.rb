require 'sqlite3'

database = SQLite3::Database.new("db/robot_world_development.db")

database.execute("DELETE FROM robots;")

database.execute("INSERT INTO robots
                (name, city, state, birthdate, date_hired, department, avatar)
                VALUES
                ('R2D2-b',
                'Naboo',
                'NB',
                '12/5/2001',
                '12/5/2006',
                'design',
                'https://robohash.org/r2d2-b');"
                )

puts "It worked and:"
p database.execute("SELECT * FROM robots;")
