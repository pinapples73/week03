require_relative("../db/sql_runner")

class User

  attr_reader :id
  attr_accessor :name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO users
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    user = SqlRunner.run( sql, values ).first
    @id = user['id'].to_i
  end

  def locations()
    sql = "SELECT locations.* FROM locations
            INNER JOIN visits
            ON visits.location_id = locations.id
            WHERE visits.user_id = $1"
    values = [@id]
    location_data = SqlRunner.run(sql, values)
    locations = location_data.map{|location_data| Location.new(location_data)}
    return locations
  end

  def self.all()
    sql = "SELECT * FROM users"
    users = SqlRunner.run(sql)
    result = users.map { |user| User.new( user ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM users"
    SqlRunner.run(sql)
  end

end
