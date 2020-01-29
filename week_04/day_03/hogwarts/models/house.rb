require_relative('../db/sql_runner')

class House
  attr_reader :id, :house_name
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @house_name = options['house_name']
    @logo_url = options['logo_url']
  end

  def save
    sql = "INSERT INTO houses
  (
    house_name,
    logo_url
  )
  VALUES
  (
    $1, $2
  )
  RETURNING *"
  values = [@house_name, @logo_url]
  house_data = SqlRunner.run(sql, values)
  @id = house_data.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

  # Add a method to House to find all houses
  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    return houses.map { |house| House.new(house) }
  end
  # Add a method to House to find a house by id
  def self.find_by_id(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values)[0]
    return House.new(house)
  end

end
