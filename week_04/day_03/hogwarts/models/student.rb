require_relative('../db/sql_runner')
require_relative('./house.rb')


class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house_id, :age

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i

  end

  def full_name
    return @first_name + " " + @last_name
  end

  def save()
    sql = "INSERT INTO students(first_name, last_name, age, house_id)
    VALUES($1,$2,$3,$4) RETURNING id"
    values = [@first_name, @last_name, @age, @house_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    return students.map { |student| Student.new(student) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)[0]
    return Student.new(student)
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def find_house
    sql = "SELECT houses.* FROM houses WHERE houses.id = $1"
    values =[@house_id]
    result = SqlRunner.run(sql,values)
    house_hash = result[0]
    house_obj = House.new(house_hash)
    return house_obj
  end

end
